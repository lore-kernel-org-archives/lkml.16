Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9915D20102D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566350; cv=fail; b=KWwD5gvjcvXqfV/ue206nBhBWYsf78AUGyJDLq20ET+EQ3+T2PbFmnn91nHW90QRyABbBVDaqCoJybmwn3e94xQVfftRpJsq1C/qSSYeoeH2t4PKFX/KWP5aVPyhvApEywlF40yCVzr757JqwHVpTNv31zA+BNlwJf3X9szGvoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566350; c=relaxed/simple;
	bh=5OqfRgnn0SYx+aqywX4YKRHmwujpllN8okeUQfJWXCc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Oajh+ok3Tk3C6qDVvJR94TRWrtX6VpVlJvD5picaQwx1WcWbwMPPZJsS017wL5H8KWrHnHo9hwOOHmCe7N0xkD0EDabxl56xC5iSBU/ktnxdq/49MDRCeNyi1B4P+OoVldMOG6wL4PUwsbCqbkNaHUO72k2esD6I19diHuxTIbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e54iMsOz; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e54iMsOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749566349; x=1781102349;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=5OqfRgnn0SYx+aqywX4YKRHmwujpllN8okeUQfJWXCc=;
  b=e54iMsOzhS2q8dFXN3keQJFdunHcSehPtkiFfQMLtdv7wSz56WaBKOqZ
   bSEy6bif5UKFElUFG7+pMHyElpwvfeKsxHnL3JCMrQqQT1RYxJGAFfUOb
   SceqnV/N41OUZOLZht+yos7HoFNwg9z2WfLsEOOKNJgQoJPZFX91GNeBK
   CKlsezt1jQRzznK0Dku5rBKzic67mI8DDOuNO17d8OpVLMdDi7ZQuBM/M
   8RC7OeXU3wTXJSXSHrAmZONFPuxlgHIeyGUxbR2gbmD26jZG+11kcvtoZ
   3lCeRqhC27rdEgszEynodaEWqJbpz9t9u9qHQ9tUfSdjPCpWmX8U158i2
   g==;
X-CSE-ConnectionGUID: VCjZ2lGnT3mBysOt0mTaAA==
X-CSE-MsgGUID: t2Ux88B2RWq7fEgHuN2pqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="74217101"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="74217101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 07:39:08 -0700
X-CSE-ConnectionGUID: lU/sgBW0QwW1I93Izst5ow==
X-CSE-MsgGUID: 58Wi4pT8RzupELNu+iB/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147818678"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 07:39:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:39:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 07:39:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 07:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP3bsKBdWcemSS/mhNZNe/SarWqhRdOWu4FnTiNrkJGI8i5OIlpL2ij0oV085E4HmOutuWen8qdHOcRVNQx2kjBdZ5ooZ1y68chAhwWJDBs7lmd/dQsPiUclkByagbQuXP+G3ZUoP8S6NtSV063fJjHYvFiYd72lIms30grNFN+RdqCuQ9GBJO4mZ9lnkAksu5k1gWTYLfygWny1kl+5RzSslOdChS2IMl/KaaLBQhzHSoxCQCum9a8elgcyVjGAYRqIESuKKI9cPzr6Diw5OMc/I9wTX/7UYf1dFT+cZxdzB+Mko4l4d/bAqj1fxv5Iu4IU20Kz6ORn1usD6Tqvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ywrZLc7wTKhpaE93O06nBn9bR0bSLJbu1XP0iNk4Fc=;
 b=Tc1D17UdEZF9hDuLVE1AGL1sST6k5v8jO2oGUmi9eZHgYZS7ec7bjHFz7RTJV1utVOUifN+FQLAVzE8OAvyJ5jR4972FUkLo7ijauh7WnmkVyTwx+BNZ0IFpxMtSUIOf8vy6ocHsjb0oF8ScG83fRTLRDTzBg0OSAuSt61Oh7OohTNtomdQYgwjMUe1gMD1kDSItsCnyquwiluIHtamIVrmLHCASjScnDlg4eCL4os56E9mfX4A/18BEFg8YM90QH7vjh5K6ig52AUcn/1eCTcysQVbeNSw1J+sGjJOV1WIjYCVu6siHA3rwXTV3lGMurKC0s4IYZXx8VgoDI6Qk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 14:39:03 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 14:39:03 +0000
Date: Tue, 10 Jun 2025 22:38:45 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Shivank Garg <shivankg@amd.com>, "Vlastimil
 Babka" <vbabka@suse.cz>, Christian Brauner <brauner@kernel.org>, "David
 Hildenbrand" <david@redhat.com>, David Howells <dhowells@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Hugh Dickins <hughd@google.com>, "Jann
 Horn" <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, "Jonathan
 Corbet" <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Lokesh Gidra <lokeshgidra@google.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Mel
 Gorman" <mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>,
	"Minchan Kim" <minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, "Peter Xu" <peterx@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>, Sourav Panda
	<souravpanda@google.com>, Wei Yang <richard.weiyang@gmail.com>, Will Deacon
	<will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  6bef4c2f97:  stress-ng.mlockmany.ops_per_sec
 5.2% improvement
Message-ID: <202506102254.13cda0af-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 17643e4f-595c-4cfb-c81b-08dda82c8b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?z29xIsNRC4jGPJ48SXIXpeyPzSSDsU16k8opcGT27/gFEsWBawcRI7jT21?=
 =?iso-8859-1?Q?HJ1J6o1I63mlWDIzbUudFes4/F2SK5mistCCts7uzEUoZrGiQrV5ghrs7z?=
 =?iso-8859-1?Q?5AMXO8cKi8A2sA5nVcGpuF6aUAxYinJZe6iRqFmhLxBxN6yH6veucKS9jS?=
 =?iso-8859-1?Q?iEAUbUFQMhqAM+S2ujmuy89qhrBe6UUKm4mUfsL5/wTTJX02OB4PPaS+t4?=
 =?iso-8859-1?Q?HncbaDHHQO0M54ZPcH8xbd1oeCAAIfjOk91lWxvbr5n8mXFg/sxvvixkDZ?=
 =?iso-8859-1?Q?ljzd5149y9feDRVvkFEwJhrkO09UJHZpEDl5oYTz47wmYWm0lRJaaYy/45?=
 =?iso-8859-1?Q?s4xPV+G3Sv53ig+8oveZehlMbzayHoo/Ltmuv6D0vEBQOsrBo9HLHqSAGE?=
 =?iso-8859-1?Q?xZw9TdKzfqUOwlpDS3xdvAH9pWEUOq35mqVUS9opqBwOeLQAuPsvDn8scr?=
 =?iso-8859-1?Q?vkC/l1/WIT7DmtftlqqPFSKaXZAxbHGRL/8Cn7lL52SysgYel7y2AtYdTW?=
 =?iso-8859-1?Q?i9TJjtR1DdCYzB7CglIeNlqX9u+2dYDMa7UBouCcFtT8Dw0rzrqEGkCuT4?=
 =?iso-8859-1?Q?3fiLiwwh8pClYWIqbCYeiMWOJ7yMDIifnrSsyDgkRV7AFSs12aZbmviogi?=
 =?iso-8859-1?Q?3ejLd4CPWfzWtSFYdTUKomOGZgC1a5vw0R9vI42MhcqjQTvwKLbEuzix//?=
 =?iso-8859-1?Q?b1oxvSWelhAv4or04/o1AH0QTvx+HY4o6rbYLd3IY9tz0FkfiOstPc3ygl?=
 =?iso-8859-1?Q?o0KOkpG0HV3Esm3hbkYbzMEDE24T5kMteQy+0baeO6Aj/a4Lea+LtCONE9?=
 =?iso-8859-1?Q?V06y78ZVijyQAm/lzmAzZ+nxWepzWa9YmaVWjF0gFj0lK+5O2viCsfXtIr?=
 =?iso-8859-1?Q?qV9dPEoEORAYwl9Sta8kbxbHfZiwzG/ypq1SKBFUZuIvNuCwqSBDyp2WUZ?=
 =?iso-8859-1?Q?P/+I39ZiXwp8Ro2tNjdmGjb89pLyIg/wGK6MzTT2CcRwqMsCS9KW/+hAQG?=
 =?iso-8859-1?Q?UfF2y78o0FdKSjjo69DRiKSYPO3ay6fRYIpHfFWpKIB8HETxqCWDOHmW7Z?=
 =?iso-8859-1?Q?xXQxnroBwwGy1diEKk453S2gIqdFRgh4Fojw0tAeZA+nRIwHqY5kaixpcq?=
 =?iso-8859-1?Q?pap4Se1UnWjBUum1smY0vTCq9dF3UY0kRoSE8GEdxBq3pYWNQ/rAeVt6+g?=
 =?iso-8859-1?Q?UVmNAP4YFL8crKJ3cuwTSvb1rD27spp38sJgT38YhzPh9U7OEvL7A103M6?=
 =?iso-8859-1?Q?Zn/PBpHeBKcGqPlqEDICT4mKx2wxM/qzx/LhAn3X48bbCSHUw/GBydLa7n?=
 =?iso-8859-1?Q?DxU0ZsYbDUpIc2+1NgjtzjxuPW5cNZ4yq7Zi8TWd1N9m18Dd1m9X6hBybm?=
 =?iso-8859-1?Q?NTb2MLRo8djXnV15xnrVHF31hs4rB7CW1/fNuqRklgTNg66qzPrCBMnZMs?=
 =?iso-8859-1?Q?zXsn1Ulzk0AGxGga?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oESCqfyvFDnj892wLigvtaBoAYZYyhb8/fViYqfCaiP+kH7FW06ArGCHui?=
 =?iso-8859-1?Q?3PtKdioCBZ4FbSSINY99viNCSyDAIn7F/XX6/EE5uiXKsGojSppaNs1RdX?=
 =?iso-8859-1?Q?YcT1A5PCtN+4kDHOOh5XulrrcBwnBDjzPmhfUQNS3KF8CiDIyAVAQ4bylq?=
 =?iso-8859-1?Q?zSrWSitNZ7ISrDEf56Gn8njAJiHIHW/3njrzxaV5gDK5y0OUaG7zClpIZi?=
 =?iso-8859-1?Q?S99kYPROgTZ5RS09sbjGWkaaYsEZvTHO0Ge/ohCLtxXTGclqLyTv1RHUOl?=
 =?iso-8859-1?Q?lyVj5njx6bK5q1ZPVcCo5QnyK+BH9U3aNS5k2hPNqiCPlazP/rwU61o9C9?=
 =?iso-8859-1?Q?8hkeToo+ZYUecqFvZwTHy8s6FFJVwm6q4ObEr0y3H7nS0QpVHXlrPlmzaZ?=
 =?iso-8859-1?Q?iTaV9wGPsc+qwGd2yscJrA5gbT7A7jGXAm2Xxq2j46K3lk443H9tos+jL9?=
 =?iso-8859-1?Q?YKIdUFuCbj3Dy+k1XQ5bE7qh7QQK1WkOk4Ay1/Pa3HSuMPnHaFPLJ2JUiy?=
 =?iso-8859-1?Q?gYoM+qAhSvaBM0DfpkSGa755gO0CXK2XblikG9N5VTmpDuKujgrx13l80X?=
 =?iso-8859-1?Q?2Z+enw39W1HxJBWTGeSLwqKxINIbxh/sGzbmJ+MD3Wba1M/5bh2Rpwp2gV?=
 =?iso-8859-1?Q?ETMlth0s3T7m3rwZ8USZTbdEPN9RkbI9diRa0NFgY8yOJVPz+8PPIophne?=
 =?iso-8859-1?Q?KPIRioSsNE8foBFFYGiOjs2llQ019FSCHrwbQIJ/mt+iDk6MoR0hnWmU5+?=
 =?iso-8859-1?Q?WPYZjAY4bd8nspYcz1gg2QqzmW8m3z/oxhPNOjN/JYRSZMyec9klkce71J?=
 =?iso-8859-1?Q?ttorJ9LzIunUZ8RcxR0P/Ds/ta3DqGjDG8qr8Y2siHsGD7185ppw4oUae9?=
 =?iso-8859-1?Q?UxrU7fzjFTjCrKcH6VUXqgVvVsbIhBGRSZSIjSCfl8XyFLQDkD0SAV+blc?=
 =?iso-8859-1?Q?uGBDbk/BgmaBF1zcP/5Oq1z4Bs0O4KD9Elja38qLkJjgvqHtgqZkV/UtAc?=
 =?iso-8859-1?Q?W3+Hx9qvh+5VJkcoCORBf478WrYXf18u5r3D1C4mkgD1/MMuqduIumsUY7?=
 =?iso-8859-1?Q?QMvY5AZ+IqDmh9C4WTcg5R+0RiawSr/Yke3cA+YtIp9xY1Ky9MCMFi4MC9?=
 =?iso-8859-1?Q?hjqSc8UZ0KnX5Xb4jkwSv5UXEiktjfb4UR5IubYbHla8hMQpAbvIwZR8zL?=
 =?iso-8859-1?Q?r7RjYUsf2cXbAShLXO/owORA5txbMb0efaUi3EuZi38sOF09DIQjxj766A?=
 =?iso-8859-1?Q?JK17D5RBrM6nP1PsEjvShB/wn8s8XG3+iBZLKSZ3FUMG9N/94laREYul1/?=
 =?iso-8859-1?Q?T0mYAG3TkkY4gQYWQFcwIUl4DEmZq04uPF/RWpsdCUHO7/Y995EgiolSYp?=
 =?iso-8859-1?Q?rBNaPMFFcmLejQYAFLrurRtmeor7Us9PvxFWFbxOOO28WFztjjW/znfotI?=
 =?iso-8859-1?Q?AihoRYwxuAbWooJcHGPp4v9cPVKMsvnDRnPTmyIYqXEZTpD0kLX57/kM/b?=
 =?iso-8859-1?Q?vwKFYeXe8TC+Chy4GKA/+a9rzY+5SD4QccYm/d9mLuXT5S+Y1DSdLAj4fv?=
 =?iso-8859-1?Q?tXevLZmdkG499j0ckJNZUK8kkTCRzYG6dtq0XB5hwQupMJRAwQfKXNSlfH?=
 =?iso-8859-1?Q?iWZBXSfL7AAl1l/RJ3r+BP1/LlcaRBZicWsaPLG68EoD26xFb9KFGGEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17643e4f-595c-4cfb-c81b-08dda82c8b84
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:39:03.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICIAgb6oSSec660n4c7WHtKU3sAr2Pw18SkZgEB5I0TZ4DcHfkEM0b76VDgiqcuFSWCxeEpc+IeIU07821TaLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.2% improvement of stress-ng.mlockmany.ops_per_sec on:


commit: 6bef4c2f97221f3b595d08c8656eb5845ef80fe9 ("mm: move lesser used vma_area_struct members into the last cacheline")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mlockmany
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250610/202506102254.13cda0af-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/mlockmany/stress-ng/60s

commit: 
  f35ab95ca0 ("mm: replace vm_lock and detached flag with a reference count")
  6bef4c2f97 ("mm: move lesser used vma_area_struct members into the last cacheline")

f35ab95ca0af7a27 6bef4c2f97221f3b595d08c8656 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.66 ±  5%      -0.1        0.57 ±  9%  mpstat.cpu.all.soft%
     27183            +1.9%      27708        vmstat.system.cs
    264643            +5.2%     278326        stress-ng.mlockmany.ops
      4406            +5.2%       4634        stress-ng.mlockmany.ops_per_sec
    314509            +4.9%     329874        stress-ng.time.voluntary_context_switches
    343582            -3.7%     330742 ±  2%  proc-vmstat.nr_active_anon
    454064            -2.7%     441886        proc-vmstat.nr_anon_pages
     54743            -3.5%      52828        proc-vmstat.nr_slab_unreclaimable
    343583            -3.7%     330741 ±  2%  proc-vmstat.nr_zone_active_anon
      1.99 ±  8%     -14.0%       1.72 ± 12%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      1.98 ±  8%     -13.9%       1.71 ± 12%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      0.00 ± 18%     -24.8%       0.00 ± 20%  sched_debug.cpu.next_balance.stddev
      1.99 ±  8%     -13.8%       1.72 ± 12%  sched_debug.cpu.nr_running.stddev
      0.25            +0.0        0.25        perf-stat.i.branch-miss-rate%
  21663531            +1.7%   22033919        perf-stat.i.branch-misses
     27855            +1.8%      28352        perf-stat.i.context-switches
      0.25            +0.0        0.25        perf-stat.overall.branch-miss-rate%
  21319615            +1.7%   21691011        perf-stat.ps.branch-misses
     27388            +1.7%      27866        perf-stat.ps.context-switches
     19.64 ±  7%     -18.7%      15.97 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
     11.34 ±  8%     -13.5%       9.80 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     17.11 ±  4%      -8.2%      15.70 ±  5%  perf-sched.sch_delay.avg.ms.__cond_resched.mlock_pte_range.walk_pmd_range.isra.0
     10.51 ± 10%     +35.6%      14.26 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     52.76 ± 22%     -31.2%      36.28 ± 18%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     50.19 ±  7%     -26.9%      36.68 ± 45%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
     23.36 ±  9%     -14.2%      20.03 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     51.05 ± 10%     -34.3%      33.53 ± 45%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
    245.67 ±  6%     -47.6%     128.83 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
    286.83 ±  7%     -21.0%     226.67 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    120.67 ±  9%     +32.6%     160.00 ±  8%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
    225.41 ± 31%     -33.7%     149.44 ±  7%  perf-sched.wait_and_delay.max.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     77.77 ± 73%     +79.0%     139.22 ± 15%  perf-sched.wait_and_delay.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     12.02 ± 11%     -14.9%      10.23 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     31.78 ± 18%     -31.9%      21.63 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.prepare_creds.copy_creds.copy_process
     16.57 ±  5%      -9.3%      15.03 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.mlock_pte_range.walk_pmd_range.isra.0
     25.21 ±  7%     +12.4%      28.34 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
     24.68 ± 29%     +39.0%      34.31 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
    207.48 ± 35%     -32.5%     140.02 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     70.62 ± 41%     +75.6%     124.03 ± 15%  perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

