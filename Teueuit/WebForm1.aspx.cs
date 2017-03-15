using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LinqToTwitter;


namespace Teueuit
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private SingleUserAuthorizer authorizer = new SingleUserAuthorizer
        {
            CredentialStore = new SingleUserInMemoryCredentialStore
            {
                ConsumerKey =
              "hxYX9Ik0Uo7hTmPfuuZjpl9qN",
                ConsumerSecret =
             "wxKzSyi7uh5ZRcB6hmSShHDTeFEFDLmUKnIodSkI2LTtPF2zJw",
                AccessToken =
             "228635299-PMj3zLd7kbZ1LYToNFvtCF0IPe76xzafn8Sjyfe8",
                AccessTokenSecret =
             "c2H39Isn3iOWCJPWaswLlinfmurVBhys3snewVZ3mhnoG"
            }
        };

        private bool[] tweetUnknown;
        private int idxTweetUnknown = 0;
        private int sizeTweetSearch = 0;
        public List<Laporan> lstKebersihan;
        public List<Laporan> lstPendidikan;
        public List<Laporan> lstPerhubungan;
        public List<Laporan> lstPertamanan;
        public List<Laporan> lstSosial;
        public List<Laporan> lstUnknown;
        enum Dinas { dinKeb, dinPen, dinHub, dinPer, dinSos, unknown };

        private List<Status> SearchTwitter(string txtKeyWord)
        {
            var twitterContext = new TwitterContext(authorizer);

            var srch = Enumerable.SingleOrDefault((from search in twitterContext.Search
                                                   where search.Type == SearchType.Search &&
                                                 search.Query == txtKeyWord &&
                                                 search.Count == 100
                                                   select search));
            if (srch != null && srch.Statuses.Count > 0)
            {
                return srch.Statuses.ToList();
            }

            return new List<Status>();
        }

        public void SearchingPatterns(string user, string twit, string[] patterns, int dinas, string algo)
        {
            int iKMP = 0, iBMM = 0;
            bool found = false;
            // Mencari setiap pattern pada array of pattern pada text
            for (int i = 0; i < patterns.Length; i++)
            {
                // Jika panjang string pattern = 0, string tidak diproses

                if (patterns[i].Length > 0 && !found)
                {
                    string patternsWithNoSpace = patterns[i].Trim();
                    if (algo == "KMP")
                    {
                        // Mencari pattern pada text dengan algoritma 
                        iKMP = KMPMatch(twit.ToUpper(), patternsWithNoSpace.ToUpper());
                    }
                    else
                    {
                        // Mencari pattern pada text dengan algoritma KMP
                        iBMM = BMMatch(twit.ToUpper(), patternsWithNoSpace.ToUpper());
                    }

                    if (iKMP > 0 || iBMM > 0)
                    {
                        switch (dinas)
                        {
                            case (int)Dinas.dinKeb:
                                {
                                    lstKebersihan.Add(new Laporan(user, twit));
                                    break;
                                }
                            case (int)Dinas.dinPen:
                                {
                                    lstPendidikan.Add(new Laporan(user, twit));
                                    break;
                                }
                            case (int)Dinas.dinHub:
                                {
                                    lstPerhubungan.Add(new Laporan(user, twit));
                                    break;
                                }
                            case (int)Dinas.dinPer:
                                {
                                    lstPertamanan.Add(new Laporan(user, twit));
                                    break;
                                }
                            case (int)Dinas.dinSos:
                                {
                                    lstSosial.Add(new Laporan(user, twit));
                                    break;
                                }
                            default: break;
                        }

                        tweetUnknown[idxTweetUnknown] = false;
                        found = true;
                    }
                }

            }
            idxTweetUnknown++;
            if (idxTweetUnknown >= sizeTweetSearch)
            {
                idxTweetUnknown = 0;
            }

        }

        // Fungsi untuk menemukan pattern pada text dengan algoritma KMP
        // Masukan berupa text dan pattern yang ingin dicari pada text
        // Kembalian :
        //    Jika pattern ada pada text : berupa posisi dimulainya pattern pada text
        //    Jika pattern tidak ada pada text : -1  
        public static int KMPMatch(string text, string pattern)
        {
            int n = text.Length;
            int m = pattern.Length;

            int[] fail = ComputeFail(pattern);

            int i = 0;
            int j = 0;

            while (i < n)
            {
                if (pattern[j] == (byte)text[i])
                {
                    if (j == m - 1)
                    {
                        return i - m + 1; //match
                    }
                    i++;
                    j++;
                }
                else if (j > 0)
                {
                    j = fail[j - 1];
                }
                else
                {
                    i++;
                }
            }

            return -1;
        }

        public static int[] ComputeFail(string pattern)
        {
            int[] fail = new int[pattern.Length];
            fail[0] = 0;

            int m = pattern.Length;
            int j = 0;
            int i = 1;

            while (i < m)
            {
                if (pattern[j] == pattern[i])
                {
                    fail[i] = j + 1;
                    i++;
                    j++;
                }
                else if (j > 0)
                {
                    j = fail[j - 1];
                }
                else
                {
                    fail[i] = 0;
                    i++;
                }

            }
            return fail;
        }



        // Fungsi untuk menemukan pattern pada text dengan algoritma Boyer-Moore
        // Masukan berupa text dan pattern yang ingin dicari pada text
        // Kembalian :
        //    Jika pattern ada pada text : berupa posisi dimulainya pattern pada text
        //    Jika pattern tidak ada pada text : -1
        public static int BMMatch(string text, string pattern)
        {
            int[] last = BuildLast(pattern);
            int n = text.Length;
            int m = pattern.Length;
            int i = m - 1;


            if (i > n - 1)
            {
                return -1;
            }

            int j = m - 1;
            do
            {
                if (pattern[j] == text[i])
                {
                    if (j == 0)
                    {
                        return i;  //match!
                    }
                    else
                    {
                        i--;
                        j--;
                    }
                }
                else
                {
                    int lo = last[(byte)text[i]];
                    i = i + m - Math.Min(j, 1 + lo);
                    j = m - 1;
                }
            } while (i <= n - 1);

            return -1; //not match!
        }


        public static int[] BuildLast(string pattern)
        {
            int[] last = new int[256]; //ASCII char set

            for (int i = 0; i < pattern.Length; i++)
            {
                last[pattern[i]] = i;
            }
            return last;
        }
      
        public void showUnknown(List<Status> twit, bool[] unknown)
        {
            bool status;
            int size = unknown.Length;
            for(int i = 0; i < size; i++)
            {
                status = unknown[i];
                if (status)
                {
                    lstUnknown.Add(new Laporan(twit[i].User.ScreenNameResponse, twit[i].Text));
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtKeyWord.Attributes.Add("placeholder", "Keyword");
            txtKebersihan.Attributes.Add("placeholder", "Dinas Kebersihan");
            txtPendidikan.Attributes.Add("placeholder", "Dinas Pendidikan");
            txtPerhubungan.Attributes.Add("placeholder", "Dinas Perhubungan");
            txtPertamanan.Attributes.Add("placeholder", "Dinas Pertamanan");
            txtSosial.Attributes.Add("placeholder", "Dinas Sosial");
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var results = SearchTwitter(txtKeyWord.Text);
            sizeTweetSearch = results.Count;

            tweetUnknown = new bool[results.Count];
            tweetUnknown= Array.ConvertAll(tweetUnknown, status => true);

            lstKebersihan = new List<Laporan>();
            lstPendidikan = new List<Laporan>();
            lstPerhubungan = new List<Laporan>();
            lstPertamanan = new List<Laporan>();
            lstSosial = new List<Laporan>();
            lstUnknown = new List<Laporan>();
            
            string[] keyKebersihan = txtKebersihan.Text.Split(';');
            string[] keyPendidikan = txtPendidikan.Text.Split(';');
            string[] keyPerhubungan = txtPerhubungan.Text.Split(';');
            string[] keyPertamanan = txtPertamanan.Text.Split(';');
            string[] keySosial = txtSosial.Text.Split(';');

            string algo = ddlAlgoritma.SelectedItem.Value;
            //looping
            results.ForEach(tweet => SearchingPatterns(tweet.User.ScreenNameResponse, tweet.Text, keyKebersihan, (int)Dinas.dinKeb, algo));
            results.ForEach(tweet => SearchingPatterns(tweet.User.ScreenNameResponse, tweet.Text, keyPendidikan, (int)Dinas.dinPen, algo));
            results.ForEach(tweet => SearchingPatterns(tweet.User.ScreenNameResponse, tweet.Text, keyPerhubungan, (int)Dinas.dinHub, algo));
            results.ForEach(tweet => SearchingPatterns(tweet.User.ScreenNameResponse, tweet.Text, keyPertamanan, (int)Dinas.dinPer, algo));
            results.ForEach(tweet => SearchingPatterns(tweet.User.ScreenNameResponse, tweet.Text, keySosial, (int)Dinas.dinSos, algo));
            showUnknown(results, tweetUnknown);
            //lstKebersihan.Add(new Laporan("Apap", "BB"));
            //endloop

            rptKebersihan.DataSource = lstKebersihan;
            rptPendidikan.DataSource = lstPendidikan;
            rptPerhubungan.DataSource = lstPerhubungan;
            rptPertamanan.DataSource = lstPertamanan;
            rptSosial.DataSource = lstSosial;
            rptUnknown.DataSource = lstUnknown;

            rptUnknown.DataBind();
            rptKebersihan.DataBind();
            rptPendidikan.DataBind();
            rptPerhubungan.DataBind();
            rptPertamanan.DataBind();
            rptSosial.DataBind();

        }

        public class Laporan
        {
            public string Username
            {
                get;
                private set;
            }

            public string Isi
            {
                get;
                private set;
            }

            public Laporan(string username, string isi)
            {
                Username = username;
                Isi = isi;
            }
        }
    }
}