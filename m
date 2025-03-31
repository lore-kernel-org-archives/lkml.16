Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69651C5F14
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406627; cv=fail; b=JAnLvDQimkcmLgo1E33CCPFJo7GEhs2iQN+UsXJ0ImbuKDYifY6OQvjUTmOq+q8YrzMtCF3UwvqdNujjIixlinRSXQZy4XgfAihYHedQZi63WL8vnTGcea44pIr4vHwRdgVCM8cCeE2y6EYMXZaxdvErmKFdhesxAcpiC7S3Q7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406627; c=relaxed/simple;
	bh=yj5OpSbaikmX+DfTswDSpydZDIZVeY8tSqccACWruuo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NYNod/IZ9k0BRGdso4BMlB1XY4FqD9yCvaD1lfd2X/EXsWFUSNYCg4ITLvPmQYwFuADja47XdePIb+lFbzFTZ1y+JizMUvLRokRW4NgtOXKp08wEC77tTg2kOewJ8u8tK1s5NM67geqAILqKFXIWo/hWDStiFo/sdf99tz7ujiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFDDdlw0; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFDDdlw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743406622; x=1774942622;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=yj5OpSbaikmX+DfTswDSpydZDIZVeY8tSqccACWruuo=;
  b=PFDDdlw0bzex9IiC/rTq9prJdvn/Hp/P6wdny0q2yqiFAFGSrDghcc25
   fGtUWXrtdMaQ3njtTI47uXvXiVoipf8MfsXg5AfOvGG16Kfh/oSO8LBN5
   wndAqrlE2oL4fdPstoIdMUqI1nv7J5N3AmL2V2rA7HlTK6AOiXir1fIZ1
   H7CFrFEgIztdq7ibGIeFjz598ey3y8HhRj7EDjbjEtcpY11+syWu4GAo5
   uXIpp2C4JxkANye3OoDU7v6/ag1rBP+Q4g0UnOdmmM/bGv4ewRFFWlEDF
   w8Wk5mp2hm8umPQf4rnMxY00/fNBRm9FMYPjTOxTq0KxRsOC/pBQIEwP9
   Q==;
X-CSE-ConnectionGUID: 6JSQsD82SreUf8ae+v5K7A==
X-CSE-MsgGUID: Y+gfR/xXQ7aHuvC82lpd6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44688326"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44688326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:36:54 -0700
X-CSE-ConnectionGUID: EDz5DDjBSzuBzUyTSJeFgQ==
X-CSE-MsgGUID: FD6vwD5qQLiAsugBuNSzNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131111264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 00:36:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 00:36:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 00:36:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 00:36:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QO72oRzhZ/rfsu4IRcWM/66DgWXb+itxSiDqcQSShXIM6vXZAfyY/vqw5QLZCCfCSEBDhyiPxn/9fLiV/FUWx2Wo74lh43emkzZa1lA7RV4C+lRcSgpTvCzs57TRpCMdwpDnwsGeQ4EBeu9KRBE2fg09dtYmtz585B2DaYuoPWIej7dUAZPKjo/S2PgitLKMFWa9Bdnx2TFVlGr90JTJmiv4PmjHFKMOQrEevQbkIwYN2iZCFDwgZe2KDppb+pkw1RdnhpRSLIDb7qX9a61xehwMUmzS9c9AYhivVw2I6kzzvWuNA9lWe6B/JtRawzltP7TV8JVp7Vliy9G74PtT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrZKKfWVJ5bQaPqva6fpPJT5mqjRTAh+tVKtur39BW8=;
 b=auncshcXS/9WsZ45OSAwvYoKgQ02hQQLtdPAW1RR6pcsbhtVGsM88PWPcVfzpR6cyjyzbwGMwuK6A0RQP1o/MWfXX1fso9jH/4/vUnUh7wC6nWYlG389sFn/iRJFPfFlfiWanOG3WeVeWjnEZg3AkbEbAoBjLJaooIvqJPwZUVXrOvPoUdVEo3ipzgbFKJHN1WRuBRGN2aFZLRGUB3q3SXxFEdIDHWg7lkIEHMB33d3asZArn2uGehLYXVkNN46CK4Z+AeJUvpEOOBU6qRIJ18sebQS9hWzKN+pA4S9uV0//rON0ZNEuE3TaIhapaZxAkptnUlbZfBe4ytE8shWCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 07:36:20 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 07:36:20 +0000
Date: Mon, 31 Mar 2025 15:36:01 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Shivank Garg
	<shivankg@amd.com>, Christian Brauner <brauner@kernel.org>, David Hildenbrand
	<david@redhat.com>, David Howells <dhowells@redhat.com>, Davidlohr Bueso
	<dave@stgolabs.net>, Hugh Dickins <hughd@google.com>, Jann Horn
	<jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet
	<corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Lokesh Gidra <lokeshgidra@google.com>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
	Matthew Wilcox <willy@infradead.org>, Mel Gorman
	<mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>, Minchan Kim
	<minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Peter
 Xu" <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Shakeel Butt
	<shakeel.butt@linux.dev>, Sourav Panda <souravpanda@google.com>, Wei Yang
	<richard.weiyang@gmail.com>, Will Deacon <will@kernel.org>, Heiko Carstens
	<hca@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  3104138517:  will-it-scale.per_process_ops
 5.6% improvement
Message-ID: <202503311431.6db98cb-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:820:1::24) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: cf911a7b-e17b-45c7-a491-08dd7026ba84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?du2h1359WeN7DDqlSyuFpRoHZhzlp4tso/Pvzq/PStSQoFiBuZo+kzhRDE?=
 =?iso-8859-1?Q?a7Btsrg9Vt6t0k9NndRDoZR8cBHXzRRKhQ0pWwXMRdTWg32jJZAo/0NsPp?=
 =?iso-8859-1?Q?AtKIKfuQ6EEzebcyKR7sUAytv4+U1dcZRe694lO+QSN3if9LtRmM0/0czy?=
 =?iso-8859-1?Q?Gm09W9j4eLGoLXPlD5ODAhgguheiNec/pgflv2IrlCGcn28JLeV5ttMfMe?=
 =?iso-8859-1?Q?pWG/UK7ox1/ds4Hb/Dy9ziH50MZf8PZqJTK8qIftP9mv4e0t7KcPtL88AC?=
 =?iso-8859-1?Q?yxrL7Ict5l+KQGbCf35ZiwrIk874KAer6iClfnS1mbZMnXQPJ4GvJCqtQK?=
 =?iso-8859-1?Q?q2r/D+Hx4pDkzvoBzPMrIeY9FT+j0jtEg47kq4iq0dPjYI8Pv92e4tpZ97?=
 =?iso-8859-1?Q?oyaXzF2PDqHsgehtEhUOqsK8gFhyRoAvJISnQePzZdwv/42nkIVkbIwf5p?=
 =?iso-8859-1?Q?i2f+oSin8Lw9p3igZEhaueBNswhl9oyE7Rrb7Keq4KL6ta5VCf4xyDj4wg?=
 =?iso-8859-1?Q?ZXcQkUvWjwbDMk/ZwrCxb8xVODxgAkJMep114Ctt6hYxk2MroRvhLoHIlA?=
 =?iso-8859-1?Q?icIy4E5tGaM6g/48yjxDYxp1+J6s5CVQVP9KrEgU4IPM/SAgh480VDpAzv?=
 =?iso-8859-1?Q?xtuWq74nvpFDtufrX4k4FRGEJl9iLsEH6dPLOIXif9xuI6vE0gKVGqbQQf?=
 =?iso-8859-1?Q?pdcblD1kMe6xYM0nIj0GifJqdQ+JYE6CHWNXzqqppHyldAvvCLkWCfB4AE?=
 =?iso-8859-1?Q?6FsuBNH1AcunVmSc37Z9mvySi0xhkltANgP2bGbUl6N+UElp/Il6+fmZ9j?=
 =?iso-8859-1?Q?CYd/ElJd3GdzvsiNYjrYVZWArlnPOBxLSrqyzORPWLFDuQOUrPiuYBViWf?=
 =?iso-8859-1?Q?pr5gW91dM3bm39FxHo6Iz84dmfq91zOFcSVz3lhRLJbqTLwrLv6gg5J/Jb?=
 =?iso-8859-1?Q?m/MAwnFf/3JmQvRJt0/X/TuoIfz5YC85DszSVa7vZB3TD+XpPM+zq778ym?=
 =?iso-8859-1?Q?aNXhtFFiNRIxsixmiVMXURixdQtykivl5Hc5Y+qdstiVO3hez9ka16wYtu?=
 =?iso-8859-1?Q?cOZ25d80jM7fm1ZvuU0yMMddP2ubRarBhxdiTIKJLew5Qnwkv2oQCG1SAX?=
 =?iso-8859-1?Q?o2TEm62FKNN05RDx5vnX3xKU4327qS8qopvnYH0QdnPqH2Nr7JB9Vy4GGn?=
 =?iso-8859-1?Q?RXu1TUPmfEOcFurdbXEWG9QYPCX4gL52GnSj/DISZeUU4ay07Q6THd8MjX?=
 =?iso-8859-1?Q?D8z5TXhVJuTJ82TSl/XRJ19xmtQKwT4AFkKjEsljWwJ3b5AdkbvwSz3kv1?=
 =?iso-8859-1?Q?2de5dJ0iRkzWuTO0Nwyg829rT7EokeR0ibAuJb4dPvQ7aTosWPLaisq842?=
 =?iso-8859-1?Q?2+UWJx8ziQzCcAySxbc4zZN5TMW2G2UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2bG1E4bupBfRLd291ykTZcSxbqVT0ww5ib9A2Vi2W80BKfpOg+JrrUR4ig?=
 =?iso-8859-1?Q?diWJLm0wGveur4IyhHlmuAOEM7cpFQkx1WsKz4tturHXAjagDwewbwqJ/W?=
 =?iso-8859-1?Q?Y/uxUZFwXvI2AGA09DDcOdfkKff+veDVNhGvqj7uSA6MnOb31YK/J/O2ob?=
 =?iso-8859-1?Q?HyqaaOwh6z0SsrekCJRkP9I88PGpG7AP+wNFSxELEFJm3BHSRNZgzWlwU5?=
 =?iso-8859-1?Q?Hy2OBfQ+cjvSMxq7KIrRVH9BdsyFPcdaEmLgSi0ogTjXkPHiOiZh9I/w2p?=
 =?iso-8859-1?Q?D9zUPAdpd++saoECXRgxt2f5sGyEf/fFSUswsDUnNWBn7GSwHcOnJ0dv9M?=
 =?iso-8859-1?Q?QLzYIwzTYHyOlZU+a5xEz/IkPkdgG6m1bkhUERDyq4DhAmeK75b7ww8vux?=
 =?iso-8859-1?Q?O2eWTh4DaGWTniuZTbusTVAI77PC0Oq1RrB1T6MLTv08gPbLVhrVrhgFbm?=
 =?iso-8859-1?Q?hsC6PHArZm1Zy92HbNdZh7WGhUcVqiYWZcLrSmJRAOSSed6RI3CL3jtZJT?=
 =?iso-8859-1?Q?q6fxnkf/lO8VFlPBj6uyMEfO4uGQzK7GRZW2koksAsLmPS/1PcTTbqL/m5?=
 =?iso-8859-1?Q?0W69qDb92hsB44ZNp5EgkdOJD4XYj6PH3343ABnskvg3xyrZUoK10e3Rch?=
 =?iso-8859-1?Q?+zE6L9m+jZS4973+KBAysA1D07gD8FQhroKTgyrUJglOTCEOIz3dqSpisq?=
 =?iso-8859-1?Q?8MUix/uZIwBQMJdfzFviAY0U0OS76Jjg+bFxHFxoymdKI51RpIlnbh7cMS?=
 =?iso-8859-1?Q?p4yDg5cOQ+kwFjojjpySsHa2oy33H991641Oo/TBqnOYcbcpiXMsgw8c/8?=
 =?iso-8859-1?Q?g+oNZk3ngJVkp5Jee5Yrz3Nk1ciNfe7WlWRwC0J5UwR35Pjyu8KqS375nB?=
 =?iso-8859-1?Q?s+IK+ty6ayo7VplXUkSitFu5ll0jBluuamsIVesBC3oxjKJzBYu4Bh7XuJ?=
 =?iso-8859-1?Q?YnHwgy/jhXjdrxmM1SnMNCwYjmYFwFWlq9p+iWHJ0vfStDzfe2x1KnESBj?=
 =?iso-8859-1?Q?wN1vXHJlbOatR6VQP7SNS1BWMnQ1p3obBN5ET5Wsjs5RhIQGOTMGJYNflF?=
 =?iso-8859-1?Q?4bSRIYrwnf4GTDaF1nrONf6ZqlBa0mGsI863pNOYw1+PBeNzlLBjmpl+K8?=
 =?iso-8859-1?Q?VwY08xXY0uBZSZJ4I7oafT9CI/TP/8pzMDePUespc/ESCfdCaCAyBZGdf5?=
 =?iso-8859-1?Q?mpgAyuUkdUKZninkIF9u1FYY/xE601G9WTpG6IJ/uz5BsJthxSdI7YEQ5K?=
 =?iso-8859-1?Q?v4Pjm0W/Ryqq5nZWNbXrMEUQXMy+ElgFsBMZAV8yJAr4XHFCA41VLdKVTP?=
 =?iso-8859-1?Q?h58VeOW4fNkrqr4neZsGULQhH+/mxOGcVGlbx+FLsjAn+iRa1JDhUCOx2y?=
 =?iso-8859-1?Q?JYLmXE0AF0cljQZ0Wg8KCtSpFUBhUFB429yBo9ARoU6C8YvUgsJ8uNH2iq?=
 =?iso-8859-1?Q?6IJoiPcBOP82WHyX9X2uxAnSEQpprZHIs658Kuzo1tjf45lLVJPZVtCRFO?=
 =?iso-8859-1?Q?VgyqwIIrdCwKiMhD/u5cqgWLtCL7qQO6cPenO6m2FhUCQTln6FgIDwGqA1?=
 =?iso-8859-1?Q?YCecIT6MAjslLY3EdyuCR9f8nK4QU2Ej0ldtqLUOBO3NklNGnU+ecqcTVZ?=
 =?iso-8859-1?Q?okXTr1h3QmjS6nt9T9oovCJ8E6PGCGkOP+7LxmMpNKo7Zx23ugLOOgiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf911a7b-e17b-45c7-a491-08dd7026ba84
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:36:20.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7+jKQmztMRxg6jWKGz0rCi9RTP7UiSfMAe/UAt2PTiYUhrdP0kT+Ot/zljfxhoSWYqwMUhPsmlcnwJfgVC6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.6% improvement of will-it-scale.per_process_ops on:


commit: 3104138517fc66aad21f4a2487bb572e9fc2e3ec ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master


testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 104 threads 2 sockets (Skylake) with 192G memory
parameters:

	nr_task: 100%
	mode: process
	test: brk1
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 9.5% improvement                                      |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory          |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=process                                                                                       |
|                  | nr_task=100%                                                                                       |
|                  | test=brk2                                                                                          |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 10.7% improvement                                     |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=process                                                                                       |
|                  | nr_task=100%                                                                                       |
|                  | test=brk1                                                                                          |
+------------------+----------------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503311431.6db98cb-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-skl-fpga01/brk1/will-it-scale

commit: 
  e49510bf00 ("mm: prepare lock_vma_under_rcu() for vma reuse possibility")
  3104138517 ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

e49510bf00de4f83 3104138517fc66aad21f4a2487b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     16.08            -3.7       12.41        mpstat.cpu.all.soft%
      6525           -15.1%       5540        vmstat.system.cs
  31331038            +5.6%   33091862        will-it-scale.104.processes
    301259            +5.6%     318190        will-it-scale.per_process_ops
  31331038            +5.6%   33091862        will-it-scale.workload
 1.428e+08           -20.1%  1.141e+08        numa-numastat.node0.local_node
 1.429e+08           -20.1%  1.142e+08        numa-numastat.node0.numa_hit
 1.502e+08           -20.2%  1.199e+08        numa-numastat.node1.local_node
 1.502e+08           -20.2%    1.2e+08        numa-numastat.node1.numa_hit
 1.429e+08           -20.1%  1.142e+08        numa-vmstat.node0.numa_hit
 1.428e+08           -20.1%  1.141e+08        numa-vmstat.node0.numa_local
 1.502e+08           -20.2%    1.2e+08        numa-vmstat.node1.numa_hit
 1.502e+08           -20.2%  1.199e+08        numa-vmstat.node1.numa_local
      8022 ±  4%     -31.4%       5503 ±  9%  perf-c2c.DRAM.local
    472.67 ±  7%     -19.1%     382.17 ± 11%  perf-c2c.DRAM.remote
      3954 ±  5%     +22.4%       4841 ± 10%  perf-c2c.HITM.local
    229.33 ±  9%     -22.7%     177.17 ± 15%  perf-c2c.HITM.remote
 2.931e+08           -20.1%  2.341e+08        proc-vmstat.numa_hit
  2.93e+08           -20.1%   2.34e+08        proc-vmstat.numa_local
  5.85e+08           -20.2%  4.668e+08        proc-vmstat.pgalloc_normal
 5.844e+08           -20.2%  4.662e+08        proc-vmstat.pgfree
     84.32 ± 16%     -28.8%      60.07 ±  9%  sched_debug.cfs_rq:/.load_avg.avg
     18.69 ±  7%     -33.6%      12.42 ± 13%  sched_debug.cfs_rq:/.load_avg.min
    358.94 ± 62%    +176.7%     993.36 ± 48%  sched_debug.cpu.curr->pid.min
     10470           -13.3%       9073        sched_debug.cpu.nr_switches.avg
      7430 ±  2%     -17.7%       6115        sched_debug.cpu.nr_switches.min
      2728 ±  2%     -16.8%       2270 ±  4%  sched_debug.cpu.nr_switches.stddev
      2.42           -28.2%       1.74        perf-stat.i.MPKI
 2.686e+10            +1.9%  2.738e+10        perf-stat.i.branch-instructions
      0.72            -0.1        0.59        perf-stat.i.branch-miss-rate%
 1.911e+08           -16.8%  1.589e+08        perf-stat.i.branch-misses
     57.55            -1.4       56.19        perf-stat.i.cache-miss-rate%
 3.285e+08           -27.0%  2.399e+08        perf-stat.i.cache-misses
 5.701e+08           -25.3%  4.259e+08        perf-stat.i.cache-references
      6509           -15.2%       5518        perf-stat.i.context-switches
      2.07            -1.8%       2.04        perf-stat.i.cpi
    212.42           -13.7%     183.23        perf-stat.i.cpu-migrations
    858.27           +36.8%       1174        perf-stat.i.cycles-between-cache-misses
 1.358e+11            +1.8%  1.382e+11        perf-stat.i.instructions
      0.48            +1.8%       0.49        perf-stat.i.ipc
      2.42           -28.2%       1.74        perf-stat.overall.MPKI
      0.71            -0.1        0.58        perf-stat.overall.branch-miss-rate%
     57.62            -1.3       56.33        perf-stat.overall.cache-miss-rate%
      2.08            -1.7%       2.04        perf-stat.overall.cpi
    858.02           +36.9%       1174        perf-stat.overall.cycles-between-cache-misses
      0.48            +1.8%       0.49        perf-stat.overall.ipc
   1310205            -3.5%    1264903        perf-stat.overall.path-length
 2.677e+10            +1.9%  2.729e+10        perf-stat.ps.branch-instructions
 1.904e+08           -16.8%  1.584e+08        perf-stat.ps.branch-misses
 3.274e+08           -27.0%  2.392e+08        perf-stat.ps.cache-misses
 5.683e+08           -25.3%  4.245e+08        perf-stat.ps.cache-references
      6487           -15.2%       5499        perf-stat.ps.context-switches
    211.64           -13.7%     182.55        perf-stat.ps.cpu-migrations
 1.353e+11            +1.8%  1.377e+11        perf-stat.ps.instructions
 4.105e+13            +2.0%  4.186e+13        perf-stat.total.instructions
      2.90 ±  6%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      3.26 ±  6%     -48.1%       1.69 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.26 ±  5%     -48.6%       1.67 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      3.29 ±  8%     -46.2%       1.77 ± 11%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.02 ± 30%     -38.8%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.06 ± 12%     -37.3%       1.91 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      3.19 ±  7%     -49.2%       1.62 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      3.36 ±  6%     -45.3%       1.84 ± 19%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.07 ±  6%     -48.8%       1.57 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      3.36 ±  4%     -36.9%       2.12 ±  7%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.05 ± 49%     -63.3%       0.38 ± 78%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      1.97 ± 31%     -41.9%       1.15 ± 33%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.07 ±  6%     -42.5%       0.04 ± 11%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.50 ±  8%     -46.5%       1.34 ±  9%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      9.62 ± 24%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
    177.98 ±210%     -96.8%       5.63 ± 28%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
     16.03 ± 37%     -31.2%      11.03 ±  6%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      1.97 ± 72%     -94.1%       0.12 ± 86%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.56 ±  4%     -43.5%       0.88 ±  9%  perf-sched.total_sch_delay.average.ms
     47.29 ±  3%     +21.7%      57.55 ±  2%  perf-sched.total_wait_and_delay.average.ms
     33399 ±  2%     -18.4%      27264        perf-sched.total_wait_and_delay.count.ms
     45.74 ±  3%     +23.9%      56.67 ±  2%  perf-sched.total_wait_time.average.ms
      6.52 ±  6%     -48.1%       3.39 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.51 ±  5%     -48.6%       3.35 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      6.58 ±  8%     -46.2%       3.54 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
     44.65 ±  4%     +42.0%      63.41 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.38 ±  7%     -49.2%       3.24 ± 13%  perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      6.15 ±  6%     -48.8%       3.14 ± 10%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      6.71 ±  4%     -36.9%       4.24 ±  7%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.54           +11.8%       3.96 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     78.66 ±  3%     +36.3%     107.23 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.39 ±  9%     -30.7%       4.43 ±  9%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2183 ±  2%     -16.0%       1835 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1259           -17.9%       1033 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
    525.83 ±  5%     -21.8%     411.17 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
    418.33 ±  9%     -51.4%     203.50 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2809 ±  3%     -13.2%       2438 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    414.83 ±  7%     -18.0%     340.33 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4023 ±  2%     -17.2%       3333 ±  2%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1420           -10.6%       1270 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     11415           -22.3%       8867 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5074 ±  7%     -21.2%       3999 ±  3%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     32.07 ± 37%     -31.2%      22.06 ±  6%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      2.90 ±  6%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      3.26 ±  6%     -48.1%       1.69 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.26 ±  5%     -48.6%       1.67 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      3.29 ±  8%     -46.2%       1.77 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
     44.63 ±  4%     +42.1%      63.40 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.06 ± 12%     -37.3%       1.91 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
      3.19 ±  7%     -49.2%       1.62 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      3.36 ±  6%     -45.3%       1.84 ± 19%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.07 ±  6%     -48.9%       1.57 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.77 ±114%    +410.0%      24.33 ± 31%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      3.35 ±  4%     -36.9%       2.12 ±  7%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.05 ± 49%     -63.3%       0.38 ± 78%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      1.97 ± 31%     -41.8%       1.15 ± 33%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      3.49           +12.2%       3.91 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     78.59 ±  3%     +36.4%     107.19 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.89 ±  9%     -20.5%       3.09 ± 10%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      9.62 ± 24%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
     16.03 ± 37%     -31.2%      11.03 ±  6%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
    559.22 ±118%    +275.2%       2098 ± 46%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     11.01 ±  2%      -6.2        4.83 ±  6%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     11.00 ±  2%      -6.2        4.82 ±  6%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
     11.00 ±  2%      -6.2        4.82 ±  6%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     11.00 ±  2%      -6.2        4.82 ±  6%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
     10.98 ±  2%      -6.2        4.81 ±  6%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      7.92 ±  2%      -6.1        1.78 ±  8%  perf-profile.calltrace.cycles-pp.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      7.88 ±  2%      -6.1        1.77 ±  8%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch
      7.83 ±  2%      -6.1        1.76 ±  8%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free
      7.52 ±  3%      -5.8        1.70 ±  9%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials
      7.46 ±  3%      -5.8        1.69 ±  9%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages
      8.60 ±  2%      -5.7        2.92 ±  5%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      9.63 ±  3%      -5.2        4.43 ±  6%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      3.65            -1.0        2.65        perf-profile.calltrace.cycles-pp.vm_area_alloc.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.04            -1.0        2.05        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk.do_syscall_64
     20.12            -0.4       19.76        perf-profile.calltrace.cycles-pp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.48            -0.3        1.21        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      1.64            -0.0        1.59        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.75            -0.0        0.73        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_brk_flags
      0.97            +0.0        1.00        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.98            +0.0        1.03        perf-profile.calltrace.cycles-pp.__call_rcu_common.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.51            +0.0        0.55        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap
      0.72            +0.0        0.76        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      1.32            +0.1        1.37        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes
      0.56 ±  2%      +0.1        0.61 ±  2%  perf-profile.calltrace.cycles-pp.memcpy_orig.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.58 ±  2%      +0.1        0.63        perf-profile.calltrace.cycles-pp.memcpy_orig.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.54            +0.1        0.59        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      4.09            +0.1        4.16        perf-profile.calltrace.cycles-pp.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.22            +0.1        3.28        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.88            +0.1        0.95        perf-profile.calltrace.cycles-pp.mas_prev_slot.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.80            +0.1        0.86        perf-profile.calltrace.cycles-pp.mas_next_slot.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.63 ±  2%      +0.1        0.70 ±  2%  perf-profile.calltrace.cycles-pp.perf_event_mmap_output.perf_iterate_sb.perf_event_mmap_event.perf_event_mmap.do_brk_flags
      0.76            +0.1        0.83        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.99            +0.1        1.06        perf-profile.calltrace.cycles-pp.__call_rcu_common.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.87            +0.1        0.94        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.92            +0.1        0.99        perf-profile.calltrace.cycles-pp.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.64            +0.1        0.72        perf-profile.calltrace.cycles-pp.__vma_start_write.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.96            +0.1        1.06        perf-profile.calltrace.cycles-pp.mas_store_gfp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.03            +0.1        1.12        perf-profile.calltrace.cycles-pp.__get_unmapped_area.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.20            +0.1        1.29        perf-profile.calltrace.cycles-pp.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      3.40            +0.1        3.50        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64
      4.17            +0.1        4.29        perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      6.85            +0.1        6.97        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.29            +0.1        1.42        perf-profile.calltrace.cycles-pp.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      2.04            +0.1        2.17        perf-profile.calltrace.cycles-pp.mas_walk.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.68            +0.1        1.82        perf-profile.calltrace.cycles-pp.perf_iterate_sb.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk
      1.31            +0.1        1.46        perf-profile.calltrace.cycles-pp.security_vm_enough_memory_mm.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.63            +0.2        2.79        perf-profile.calltrace.cycles-pp.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.29 ±  3%      +0.2        1.46        perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.29 ±  3%      +0.2        1.46        perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      1.34 ±  2%      +0.2        1.52        perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.34 ±  3%      +0.2        1.51        perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      4.18            +0.2        4.39        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      4.46            +0.2        4.68        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      3.81            +0.2        4.04        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.brk
      0.88            +0.2        1.12        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap
      8.19            +0.2        8.44        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.90            +0.2        1.15        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_brk_flags
      1.39            +0.3        1.67        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      2.19 ±  2%      +0.3        2.48 ±  2%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.brk
      2.19 ±  2%      +0.3        2.48 ±  2%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.brk
      2.26 ±  2%      +0.3        2.56 ±  2%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.brk
      2.28 ±  2%      +0.3        2.58 ±  2%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.brk
      1.66            +0.3        1.98        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.40            +0.3        1.73        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_brk_flags.__do_sys_brk
      1.66            +0.4        2.02        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      0.42 ± 44%      +0.4        0.79 ± 31%  perf-profile.calltrace.cycles-pp.allocate_slab.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp
      5.76            +0.4        6.20        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.46 ±  2%      +0.5        3.93 ±  2%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      3.45 ±  2%      +0.5        3.92 ±  2%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      7.51            +0.6        8.09        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.brk
      0.00            +0.6        0.60        perf-profile.calltrace.cycles-pp.mas_find.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      7.72            +0.6        8.36        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.81 ±  2%      +0.7        3.51 ±  2%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu
      9.82            +0.8       10.66        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.brk
      0.00            +1.2        1.19        perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      9.99            +1.6       11.57        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.7        1.70        perf-profile.calltrace.cycles-pp.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      2.18            +2.0        4.13 ±  2%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      0.00            +2.7        2.67        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch
      0.00            +2.7        2.75        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core
     24.85            +2.8       27.65        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     53.14            +2.9       56.08        perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     56.71            +3.2       59.96        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     62.16            +3.8       65.96        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
     88.15            +6.4       94.54        perf-profile.calltrace.cycles-pp.brk
     10.44            -6.9        3.50 ±  4%  perf-profile.children.cycles-pp.free_frozen_pages
     10.38            -6.9        3.45 ±  4%  perf-profile.children.cycles-pp.free_frozen_page_commit
     10.30            -6.9        3.41 ±  4%  perf-profile.children.cycles-pp.free_pcppages_bulk
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.children.cycles-pp.ret_from_fork
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.children.cycles-pp.ret_from_fork_asm
     11.03 ±  2%      -6.2        4.84 ±  6%  perf-profile.children.cycles-pp.kthread
     11.01 ±  2%      -6.2        4.83 ±  6%  perf-profile.children.cycles-pp.smpboot_thread_fn
     11.00 ±  2%      -6.2        4.82 ±  6%  perf-profile.children.cycles-pp.run_ksoftirqd
     11.01            -5.9        5.15 ±  2%  perf-profile.children.cycles-pp.__put_partials
     20.32            -5.0       15.28        perf-profile.children.cycles-pp.handle_softirqs
     20.30            -5.0       15.26        perf-profile.children.cycles-pp.rcu_core
     20.28            -5.0       15.25        perf-profile.children.cycles-pp.rcu_do_batch
     17.18            -1.7       15.47        perf-profile.children.cycles-pp.kmem_cache_free
     11.95            -1.7       10.24        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     11.66            -1.7        9.99        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      3.65            -1.0        2.65        perf-profile.children.cycles-pp.vm_area_alloc
      2.99            -0.9        2.10        perf-profile.children.cycles-pp.__call_rcu_common
      1.94 ±  2%      -0.8        1.12 ±  5%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
     20.45            -0.6       19.90        perf-profile.children.cycles-pp.do_brk_flags
      1.52            -0.5        1.04        perf-profile.children.cycles-pp.allocate_slab
      5.89            -0.4        5.50        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      1.02            -0.3        0.72        perf-profile.children.cycles-pp.shuffle_freelist
      1.50            -0.3        1.23        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      2.53            -0.3        2.27        perf-profile.children.cycles-pp.___slab_alloc
      0.52            -0.2        0.36        perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.44            -0.1        0.31 ±  2%  perf-profile.children.cycles-pp.setup_object
      0.36            -0.1        0.27        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.34            -0.1        0.26        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.31            -0.1        0.23 ±  2%  perf-profile.children.cycles-pp.get_page_from_freelist
      0.22 ±  3%      -0.1        0.14        perf-profile.children.cycles-pp.strlen
      0.16 ±  3%      -0.1        0.08 ±  6%  perf-profile.children.cycles-pp.unlink_file_vma_batch_add
      0.21            -0.1        0.14 ±  2%  perf-profile.children.cycles-pp.vm_get_page_prot
      0.16 ±  2%      -0.1        0.09 ±  4%  perf-profile.children.cycles-pp.unlink_file_vma_batch_final
      0.12            -0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__mt_destroy
      0.20 ±  2%      -0.1        0.14        perf-profile.children.cycles-pp.__free_one_page
      0.08            -0.0        0.03 ± 70%  perf-profile.children.cycles-pp.ksm_add_vma
      0.35 ± 10%      -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.ordered_events__queue
      0.34 ± 10%      -0.0        0.30 ±  3%  perf-profile.children.cycles-pp.queue_event
      0.28 ±  2%      -0.0        0.24 ±  2%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.26 ±  2%      -0.0        0.22 ±  3%  perf-profile.children.cycles-pp.unlink_anon_vmas
      0.18            -0.0        0.14 ±  2%  perf-profile.children.cycles-pp.rmqueue
      0.26            -0.0        0.22        perf-profile.children.cycles-pp.strnlen
      0.27            -0.0        0.23 ±  4%  perf-profile.children.cycles-pp.mt_free_rcu
      0.20 ±  2%      -0.0        0.16 ±  2%  perf-profile.children.cycles-pp.___pte_offset_map
      0.14 ±  2%      -0.0        0.11        perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.28            -0.0        0.26        perf-profile.children.cycles-pp.downgrade_write
      0.11            -0.0        0.09        perf-profile.children.cycles-pp.rmqueue_bulk
      0.27            -0.0        0.25        perf-profile.children.cycles-pp.mas_next_range
      0.16 ±  2%      -0.0        0.15 ±  2%  perf-profile.children.cycles-pp.get_any_partial
      0.17            +0.0        0.18        perf-profile.children.cycles-pp.can_vma_merge_after
      0.17            +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.mas_node_count_gfp
      0.12 ±  3%      +0.0        0.13 ±  2%  perf-profile.children.cycles-pp.__memcpy
      0.06 ±  6%      +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.flush_tlb_batched_pending
      0.15 ±  4%      +0.0        0.17        perf-profile.children.cycles-pp.mas_nomem
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.unmap_single_vma
      0.18 ±  2%      +0.0        0.20 ±  4%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.45            +0.0        0.48        perf-profile.children.cycles-pp.static_key_count
      0.30            +0.0        0.33        perf-profile.children.cycles-pp.__vm_enough_memory
      0.36            +0.0        0.39        perf-profile.children.cycles-pp.vma_merge_new_range
      0.15 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.cap_mmap_addr
      0.44            +0.0        0.47        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.43 ±  2%      +0.0        0.46        perf-profile.children.cycles-pp.mas_prev_range
      0.34 ±  2%      +0.0        0.38        perf-profile.children.cycles-pp.tlb_finish_mmu
      0.10 ±  3%      +0.0        0.14 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.38            +0.0        0.42        perf-profile.children.cycles-pp.mas_destroy
      1.09            +0.0        1.14        perf-profile.children.cycles-pp.__cond_resched
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.testcase
      0.26            +0.1        0.32        perf-profile.children.cycles-pp.security_mmap_addr
      0.22            +0.1        0.28        perf-profile.children.cycles-pp.up_read
      1.35            +0.1        1.41        perf-profile.children.cycles-pp.zap_pte_range
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.brk@plt
      3.28            +0.1        3.34        perf-profile.children.cycles-pp.unmap_page_range
      4.11            +0.1        4.18        perf-profile.children.cycles-pp.perf_event_mmap
      0.23 ±  2%      +0.1        0.30 ±  3%  perf-profile.children.cycles-pp.cap_vm_enough_memory
      0.65 ±  2%      +0.1        0.72        perf-profile.children.cycles-pp.perf_event_mmap_output
      0.94            +0.1        1.02        perf-profile.children.cycles-pp.down_write_killable
      1.21            +0.1        1.29        perf-profile.children.cycles-pp.mas_prev_slot
      0.89            +0.1        0.97        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.19            +0.1        0.28        perf-profile.children.cycles-pp.free_pgd_range
      0.74            +0.1        0.83        perf-profile.children.cycles-pp.__vma_start_write
      1.79            +0.1        1.88        perf-profile.children.cycles-pp.mas_update_gap
      1.34            +0.1        1.43        perf-profile.children.cycles-pp.mas_next_slot
      1.07            +0.1        1.18        perf-profile.children.cycles-pp.__get_unmapped_area
      1.19 ±  2%      +0.1        1.30        perf-profile.children.cycles-pp.memcpy_orig
      0.39            +0.1        0.50        perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.40 ±  2%      +0.1        0.51        perf-profile.children.cycles-pp.remove_vma
      6.90            +0.1        7.01        perf-profile.children.cycles-pp.vms_clear_ptes
      0.28            +0.1        0.39        perf-profile.children.cycles-pp.userfaultfd_unmap_complete
      3.51            +0.1        3.63        perf-profile.children.cycles-pp.perf_event_mmap_event
      4.20            +0.1        4.32        perf-profile.children.cycles-pp.unmap_vmas
      1.35            +0.1        1.47        perf-profile.children.cycles-pp.mas_wr_store_type
      1.30            +0.1        1.42        perf-profile.children.cycles-pp.check_brk_limits
      1.70            +0.1        1.84        perf-profile.children.cycles-pp.perf_iterate_sb
      1.42            +0.2        1.57        perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.26 ±  5%      +0.2        0.42        perf-profile.children.cycles-pp.kfree
      2.48            +0.2        2.65        perf-profile.children.cycles-pp.mas_walk
      4.74            +0.2        4.93        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.06            +0.3        0.32        perf-profile.children.cycles-pp.vm_area_free
      0.31 ±  3%      +0.4        0.67 ±  3%  perf-profile.children.cycles-pp.get_partial_node
      0.78            +0.4        1.19        perf-profile.children.cycles-pp.__memcg_slab_free_hook
      8.78            +0.4        9.22        perf-profile.children.cycles-pp.mas_wr_node_store
      5.88            +0.5        6.33        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      5.01            +0.5        5.54        perf-profile.children.cycles-pp.mas_find
      8.01            +0.6        8.62        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.35            +0.7        4.03        perf-profile.children.cycles-pp.mas_alloc_nodes
      9.90            +0.8       10.74        perf-profile.children.cycles-pp.syscall_return_via_sysret
     17.21            +1.0       18.22        perf-profile.children.cycles-pp.mas_store_gfp
      9.33 ±  2%      +1.1       10.46 ±  2%  perf-profile.children.cycles-pp.__irq_exit_rcu
      9.71 ±  2%      +1.1       10.85 ±  2%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      9.75 ±  2%      +1.1       10.89 ±  2%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     10.08            +1.6       11.73        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     24.89            +2.8       27.69        perf-profile.children.cycles-pp.do_vmi_align_munmap
     53.24            +2.9       56.19        perf-profile.children.cycles-pp.__do_sys_brk
     56.82            +3.2       60.06        perf-profile.children.cycles-pp.do_syscall_64
      4.11 ±  2%      +3.6        7.70        perf-profile.children.cycles-pp.__slab_free
     62.33            +3.8       66.13        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     88.34            +6.2       94.55        perf-profile.children.cycles-pp.brk
     11.66            -1.7        9.99        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      1.92 ±  2%      -0.8        1.10 ±  6%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      1.87            -0.6        1.32        perf-profile.self.cycles-pp.__call_rcu_common
      2.77            -0.3        2.51        perf-profile.self.cycles-pp.__slab_free
      0.68            -0.2        0.47        perf-profile.self.cycles-pp.shuffle_freelist
      1.44            -0.2        1.25        perf-profile.self.cycles-pp.do_brk_flags
      0.51            -0.2        0.35        perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.52            -0.1        0.41        perf-profile.self.cycles-pp.___slab_alloc
      0.80            -0.1        0.72        perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.19 ±  2%      -0.1        0.12        perf-profile.self.cycles-pp.strlen
      0.24 ±  3%      -0.1        0.17 ±  3%  perf-profile.self.cycles-pp.setup_object
      0.18 ±  2%      -0.1        0.12        perf-profile.self.cycles-pp.vm_get_page_prot
      2.33            -0.1        2.27        perf-profile.self.cycles-pp.mas_store_gfp
      0.18 ±  2%      -0.1        0.13 ±  2%  perf-profile.self.cycles-pp.rcu_do_batch
      0.11            -0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__mt_destroy
      0.51            -0.0        0.46        perf-profile.self.cycles-pp.perf_event_mmap
      0.16 ±  3%      -0.0        0.12 ±  3%  perf-profile.self.cycles-pp.__free_one_page
      0.19 ±  2%      -0.0        0.15 ±  3%  perf-profile.self.cycles-pp.unlink_anon_vmas
      0.29            -0.0        0.26        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.21 ±  2%      -0.0        0.17        perf-profile.self.cycles-pp.strnlen
      0.17            -0.0        0.14 ±  3%  perf-profile.self.cycles-pp.___pte_offset_map
      0.26 ±  2%      -0.0        0.23 ±  2%  perf-profile.self.cycles-pp.mt_free_rcu
      0.44            -0.0        0.42        perf-profile.self.cycles-pp.zap_pmd_range
      0.28 ±  2%      -0.0        0.26        perf-profile.self.cycles-pp.vms_clear_ptes
      0.24            -0.0        0.22        perf-profile.self.cycles-pp.downgrade_write
      0.12            -0.0        0.10        perf-profile.self.cycles-pp.get_any_partial
      0.17 ±  2%      -0.0        0.15        perf-profile.self.cycles-pp.mas_next_range
      0.08            -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.19            -0.0        0.18        perf-profile.self.cycles-pp.obj_cgroup_charge
      0.08            -0.0        0.07        perf-profile.self.cycles-pp.get_partial_node
      0.10            +0.0        0.11        perf-profile.self.cycles-pp.security_mmap_addr
      0.30            +0.0        0.31        perf-profile.self.cycles-pp.__get_unmapped_area
      0.14 ±  2%      +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.unmap_single_vma
      0.30            +0.0        0.32 ±  2%  perf-profile.self.cycles-pp.static_key_count
      0.18 ±  2%      +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.vma_merge_new_range
      0.58            +0.0        0.60        perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.44 ±  2%      +0.0        0.46        perf-profile.self.cycles-pp.unmap_vmas
      0.10            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.refill_obj_stock
      0.20            +0.0        0.22 ±  2%  perf-profile.self.cycles-pp.check_brk_limits
      0.24 ±  3%      +0.0        0.26        perf-profile.self.cycles-pp.mas_destroy
      0.27 ±  2%      +0.0        0.30        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.28            +0.0        0.31        perf-profile.self.cycles-pp.mas_prev_range
      0.39            +0.0        0.41        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.11            +0.0        0.14 ±  2%  perf-profile.self.cycles-pp.cap_mmap_addr
      0.67            +0.0        0.70        perf-profile.self.cycles-pp.__cond_resched
      0.27 ±  3%      +0.0        0.31        perf-profile.self.cycles-pp.tlb_finish_mmu
      0.92            +0.0        0.96        perf-profile.self.cycles-pp.do_syscall_64
      0.19            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.up_read
      0.54            +0.0        0.58        perf-profile.self.cycles-pp.zap_pte_range
      0.76            +0.0        0.80        perf-profile.self.cycles-pp.perf_event_mmap_event
      0.16 ±  3%      +0.0        0.21        perf-profile.self.cycles-pp.remove_vma
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.brk@plt
      0.60            +0.1        0.66        perf-profile.self.cycles-pp.security_vm_enough_memory_mm
      0.96            +0.1        1.02        perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.56            +0.1        0.62        perf-profile.self.cycles-pp.perf_event_mmap_output
      0.68            +0.1        0.74        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.20 ±  2%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.cap_vm_enough_memory
      0.64            +0.1        0.70        perf-profile.self.cycles-pp.down_write_killable
      0.93 ±  2%      +0.1        0.99        perf-profile.self.cycles-pp.perf_iterate_sb
      0.48            +0.1        0.55        perf-profile.self.cycles-pp.mas_alloc_nodes
      1.08            +0.1        1.15        perf-profile.self.cycles-pp.mas_prev_slot
      0.63            +0.1        0.70        perf-profile.self.cycles-pp.__vma_start_write
      1.15            +0.1        1.22        perf-profile.self.cycles-pp.mas_next_slot
      0.16 ±  3%      +0.1        0.23        perf-profile.self.cycles-pp.free_pgd_range
      0.56            +0.1        0.64        perf-profile.self.cycles-pp.mas_update_gap
      1.65 ±  2%      +0.1        1.73        perf-profile.self.cycles-pp.mas_wr_node_store
      1.04 ±  2%      +0.1        1.13        perf-profile.self.cycles-pp.memcpy_orig
      1.55            +0.1        1.65        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      0.22 ±  2%      +0.1        0.32        perf-profile.self.cycles-pp.userfaultfd_unmap_complete
      0.90            +0.1        1.00        perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.33            +0.1        0.43        perf-profile.self.cycles-pp.percpu_counter_add_batch
      1.18            +0.1        1.28        perf-profile.self.cycles-pp.mas_wr_store_type
      0.21 ±  5%      +0.1        0.32        perf-profile.self.cycles-pp.kfree
      2.11            +0.1        2.24        perf-profile.self.cycles-pp.mas_walk
      0.00            +0.1        0.13        perf-profile.self.cycles-pp.vm_area_free
      1.82            +0.1        1.96        perf-profile.self.cycles-pp.__do_sys_brk
      4.22            +0.2        4.39        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.41 ±  2%      +0.2        0.60        perf-profile.self.cycles-pp.__memcg_slab_free_hook
      1.42            +0.2        1.65        perf-profile.self.cycles-pp.mas_find
      1.22            +0.3        1.48        perf-profile.self.cycles-pp.kmem_cache_free
      1.43            +0.4        1.87        perf-profile.self.cycles-pp.brk
      5.60            +0.6        6.17        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      7.94            +0.6        8.54        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      9.88            +0.8       10.72        perf-profile.self.cycles-pp.syscall_return_via_sysret


***************************************************************************************************
lkp-icl-2sp7: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/brk2/will-it-scale

commit: 
  e49510bf00 ("mm: prepare lock_vma_under_rcu() for vma reuse possibility")
  3104138517 ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

e49510bf00de4f83 3104138517fc66aad21f4a2487b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    486951 ±  2%     -23.1%     374571 ±  2%  meminfo.SUnreclaim
    583011           -19.2%     470904        meminfo.Slab
     22.88 ±  2%      -2.5       20.41        mpstat.cpu.all.soft%
      3.43 ±  4%      +0.5        3.93        mpstat.cpu.all.usr%
    502326 ± 15%     +22.9%     617475 ±  4%  sched_debug.cpu.avg_idle.min
      9991 ±  2%     -11.7%       8818 ±  2%  sched_debug.cpu.nr_switches.min
  31867451            +9.5%   34905406        will-it-scale.64.processes
    497928            +9.5%     545396        will-it-scale.per_process_ops
  31867451            +9.5%   34905406        will-it-scale.workload
 1.333e+08           -20.4%  1.061e+08        numa-numastat.node0.local_node
 1.333e+08           -20.4%  1.061e+08        numa-numastat.node0.numa_hit
 1.336e+08           -19.6%  1.074e+08        numa-numastat.node1.local_node
 1.336e+08           -19.6%  1.074e+08        numa-numastat.node1.numa_hit
     19980 ±  2%     -39.7%      12043 ±  9%  perf-c2c.DRAM.local
      1512 ± 40%     -45.2%     828.33 ±  6%  perf-c2c.DRAM.remote
      2746 ±  4%     +24.9%       3430 ±  5%  perf-c2c.HITM.local
    388.83 ±  7%     -24.0%     295.33 ±  9%  perf-c2c.HITM.remote
      7075 ±  7%     +16.5%       8243 ±  3%  numa-meminfo.node0.KernelStack
    233952 ±  4%     -16.7%     194819 ±  2%  numa-meminfo.node0.SUnreclaim
      7842 ±  7%     -14.3%       6722 ±  4%  numa-meminfo.node1.KernelStack
    235994 ±  6%     -21.1%     186132 ±  3%  numa-meminfo.node1.SUnreclaim
    294154 ± 13%     -23.9%     223981 ± 14%  numa-meminfo.node1.Slab
    121770 ±  5%     -22.2%      94775        proc-vmstat.nr_slab_unreclaimable
  2.67e+08           -20.0%  2.136e+08        proc-vmstat.numa_hit
 2.669e+08           -20.0%  2.135e+08        proc-vmstat.numa_local
 5.335e+08           -20.2%  4.258e+08        proc-vmstat.pgalloc_normal
  5.33e+08           -20.2%  4.252e+08        proc-vmstat.pgfree
      7075 ±  7%     +16.5%       8243 ±  3%  numa-vmstat.node0.nr_kernel_stack
     60114           -17.0%      49906 ±  3%  numa-vmstat.node0.nr_slab_unreclaimable
 1.333e+08           -20.4%  1.061e+08        numa-vmstat.node0.numa_hit
 1.333e+08           -20.4%  1.061e+08        numa-vmstat.node0.numa_local
      7842 ±  7%     -14.3%       6721 ±  4%  numa-vmstat.node1.nr_kernel_stack
     61026 ±  4%     -20.7%      48391 ±  2%  numa-vmstat.node1.nr_slab_unreclaimable
 1.336e+08           -19.6%  1.074e+08        numa-vmstat.node1.numa_hit
 1.336e+08           -19.6%  1.074e+08        numa-vmstat.node1.numa_local
      2.94 ± 33%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      2.24 ± 93%    +140.0%       5.37 ± 38%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
     16.39 ± 72%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      2.32 ± 35%     +89.3%       4.38 ± 45%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      9.02 ± 73%     -60.0%       3.61 ± 27%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     41.22 ±  7%     -25.5%      30.71 ±  9%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      4190 ±  6%     +13.3%       4747 ±  4%  perf-sched.total_wait_and_delay.max.ms
      4190 ±  6%     +13.3%       4746 ±  4%  perf-sched.total_wait_time.max.ms
      1316 ±  4%     -63.4%     481.50 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
    569.17 ±  5%     -13.5%     492.17 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     82.44 ±  7%     -25.5%      61.43 ±  9%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      2.94 ± 33%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
    220.36 ± 52%     -73.1%      59.23 ±137%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      6.54 ± 67%     -38.5%       4.02 ± 11%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     16.39 ± 72%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      9.02 ± 73%     -60.0%       3.61 ± 27%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     41.22 ±  7%     -25.5%      30.71 ±  9%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      1.58           -34.0%       1.04        perf-stat.i.MPKI
 3.169e+10 ±  3%      +9.0%  3.454e+10        perf-stat.i.branch-instructions
      0.23 ± 36%      -0.1        0.13 ±  5%  perf-stat.i.branch-miss-rate%
  58229225 ±  3%     -24.7%   43825381        perf-stat.i.branch-misses
 2.375e+08 ±  3%     -28.2%  1.705e+08        perf-stat.i.cache-misses
 3.192e+08 ±  3%     -25.1%  2.391e+08        perf-stat.i.cache-references
      1.29            -7.2%       1.20        perf-stat.i.cpi
    827.32 ±  2%     +39.4%       1153        perf-stat.i.cycles-between-cache-misses
  1.51e+11 ±  3%      +8.9%  1.644e+11        perf-stat.i.instructions
      0.78            +7.6%       0.84        perf-stat.i.ipc
      1.57           -34.1%       1.04        perf-stat.overall.MPKI
      0.18            -0.1        0.13        perf-stat.overall.branch-miss-rate%
     74.41            -3.1       71.31        perf-stat.overall.cache-miss-rate%
      1.29            -6.9%       1.20        perf-stat.overall.cpi
    816.92           +41.3%       1153        perf-stat.overall.cycles-between-cache-misses
      0.78            +7.4%       0.84        perf-stat.overall.ipc
   1455868            -1.9%    1427722        perf-stat.overall.path-length
  3.16e+10 ±  3%      +9.0%  3.443e+10        perf-stat.ps.branch-instructions
  58053622 ±  3%     -24.8%   43679567        perf-stat.ps.branch-misses
 2.368e+08 ±  3%     -28.2%  1.699e+08        perf-stat.ps.cache-misses
 3.182e+08 ±  3%     -25.1%  2.383e+08        perf-stat.ps.cache-references
 1.505e+11 ±  3%      +8.9%  1.638e+11        perf-stat.ps.instructions
 4.639e+13            +7.4%  4.984e+13        perf-stat.total.instructions
     28.20            -5.4       22.83        perf-profile.calltrace.cycles-pp.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
     33.60            -4.9       28.75        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.88            -4.2        0.72        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      8.54            -3.5        5.08        perf-profile.calltrace.cycles-pp.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      5.68            -2.9        2.79        perf-profile.calltrace.cycles-pp.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      2.22 ±  3%      -1.4        0.76 ±  2%  perf-profile.calltrace.cycles-pp.rcu_cblist_dequeue.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      3.89            -1.4        2.46        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
     56.90            -1.3       55.55        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     12.52 ±  3%      -1.1       11.42 ±  4%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     12.49 ±  3%      -1.1       11.40 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
     12.49 ±  3%      -1.1       11.40 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
     12.49 ±  3%      -1.1       11.40 ±  4%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     12.44 ±  3%      -1.1       11.36 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      1.34 ±  4%      -0.8        0.59 ±  5%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      1.35 ±  3%      -0.8        0.59 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.72 ±  5%      -0.1        0.61 ±  4%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.72 ±  5%      -0.1        0.61 ±  4%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.70 ±  5%      -0.1        0.59 ±  4%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.70 ±  5%      -0.1        0.59 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      1.65            -0.1        1.54        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_dup.__split_vma.vms_gather_munmap_vmas
      0.74            +0.0        0.78        perf-profile.calltrace.cycles-pp.allocate_slab.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate
      0.60            +0.0        0.64        perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.check_brk_limits.__do_sys_brk.do_syscall_64
      0.66            +0.1        0.71        perf-profile.calltrace.cycles-pp.__pte_offset_map_lock.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.90            +0.1        0.95        perf-profile.calltrace.cycles-pp.__vma_start_write.vma_expand.vma_merge_new_range.do_brk_flags.__do_sys_brk
      0.60            +0.1        0.66        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.80            +0.1        0.86        perf-profile.calltrace.cycles-pp.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.74            +0.1        0.80        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_preallocate.commit_merge.vma_expand.vma_merge_new_range
      0.92            +0.1        0.98        perf-profile.calltrace.cycles-pp.security_vm_enough_memory_mm.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.86            +0.1        0.92        perf-profile.calltrace.cycles-pp.mas_pop_node.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.56            +0.1        0.62        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_store_prealloc.commit_merge.vma_expand
      0.86            +0.1        0.92        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_store_prealloc.commit_merge.vma_expand.vma_merge_new_range
      0.83            +0.1        0.90        perf-profile.calltrace.cycles-pp.mas_pop_node.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma
      1.06 ±  2%      +0.1        1.13        perf-profile.calltrace.cycles-pp.__call_rcu_common.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma
      1.08            +0.1        1.16        perf-profile.calltrace.cycles-pp.__get_unmapped_area.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.64            +0.1        0.72        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma
      0.90            +0.1        0.99        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.80            +0.1        0.88        perf-profile.calltrace.cycles-pp.mas_next_slot.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      1.28            +0.1        1.37        perf-profile.calltrace.cycles-pp.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.27            +0.1        1.36        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      1.14            +0.1        1.25        perf-profile.calltrace.cycles-pp.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.34            +0.1        1.45        perf-profile.calltrace.cycles-pp.mas_preallocate.commit_merge.vma_expand.vma_merge_new_range.do_brk_flags
      1.03            +0.1        1.14        perf-profile.calltrace.cycles-pp.mas_prev_slot.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.22            +0.1        1.33        perf-profile.calltrace.cycles-pp.mas_store_gfp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.26            +0.1        1.40        perf-profile.calltrace.cycles-pp.perf_iterate_sb.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk
      1.32            +0.1        1.45        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes
      0.96            +0.1        1.10        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      2.06            +0.2        2.23        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.brk
      1.89            +0.2        2.06        perf-profile.calltrace.cycles-pp.mas_walk.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.89            +0.2        2.07        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      2.32            +0.2        2.50        perf-profile.calltrace.cycles-pp.mas_store_prealloc.commit_merge.vma_expand.vma_merge_new_range.do_brk_flags
      7.16            +0.2        7.37        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      2.47            +0.2        2.70        perf-profile.calltrace.cycles-pp.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      2.52            +0.2        2.75        perf-profile.calltrace.cycles-pp.clear_bhb_loop.brk
      2.90            +0.3        3.16        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64
      2.88            +0.3        3.16        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      7.91            +0.3        8.20        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas
      3.57            +0.3        3.91        perf-profile.calltrace.cycles-pp.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.68            +0.3        4.03        perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      5.11            +0.4        5.50        perf-profile.calltrace.cycles-pp.commit_merge.vma_expand.vma_merge_new_range.do_brk_flags.__do_sys_brk
      8.98            +0.4        9.40        perf-profile.calltrace.cycles-pp.mas_store_prealloc.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      1.12 ±  3%      +0.4        1.56 ±  4%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      9.26            +0.4        9.71        perf-profile.calltrace.cycles-pp.vma_complete.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      6.29            +0.5        6.76        perf-profile.calltrace.cycles-pp.vma_expand.vma_merge_new_range.do_brk_flags.__do_sys_brk.do_syscall_64
      1.86            +0.5        2.36        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma
      1.87            +0.5        2.36        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.init_multi_vma_prep.commit_merge.vma_expand.vma_merge_new_range.do_brk_flags
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_wr_node_store.mas_store_prealloc.vma_complete
      0.67 ±  3%      +0.5        1.20 ±  5%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      7.11            +0.5        7.65        perf-profile.calltrace.cycles-pp.vma_merge_new_range.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.61 ±  2%      +0.5        1.15 ±  5%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch
      6.09            +0.6        6.64        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      2.57            +0.6        3.13        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      2.82            +0.6        3.40        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      2.57            +0.7        3.26        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas
      2.81            +0.7        3.55        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_preallocate.__split_vma.vms_gather_munmap_vmas.do_vmi_align_munmap
      0.00            +0.8        0.78 ±  5%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate
      0.00            +0.8        0.79 ±  3%  perf-profile.calltrace.cycles-pp.get_partial_node.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp
     13.07            +1.1       14.17        perf-profile.calltrace.cycles-pp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     86.10            +1.1       87.24        perf-profile.calltrace.cycles-pp.brk
     13.18            +1.1       14.31        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.2        1.21 ±  2%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      7.39 ±  3%      +1.2        8.60 ±  5%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
      2.66 ±  2%      +1.9        4.55 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core
      0.00            +1.9        1.92        perf-profile.calltrace.cycles-pp.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      2.36 ±  2%      +1.9        4.30 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch
      8.91            +2.2       11.16        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     28.37            -5.3       23.03        perf-profile.children.cycles-pp.__split_vma
     33.78            -4.8       28.96        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
      6.62            -4.0        2.61        perf-profile.children.cycles-pp.mas_wr_store_type
      9.98            -3.3        6.64        perf-profile.children.cycles-pp.mas_preallocate
      4.56            -2.9        1.68 ±  2%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
      5.71            -2.9        2.85        perf-profile.children.cycles-pp.vm_area_dup
     24.38            -2.8       21.62        perf-profile.children.cycles-pp.handle_softirqs
     24.37            -2.8       21.60        perf-profile.children.cycles-pp.rcu_core
     24.34            -2.8       21.58        perf-profile.children.cycles-pp.rcu_do_batch
     12.27 ±  3%      -1.7       10.58 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
     12.30 ±  3%      -1.7       10.61 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     11.89 ±  3%      -1.7       10.22 ±  3%  perf-profile.children.cycles-pp.__irq_exit_rcu
     56.96            -1.3       55.62        perf-profile.children.cycles-pp.do_vmi_align_munmap
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.children.cycles-pp.kthread
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
     12.63 ±  3%      -1.2       11.48 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
     12.52 ±  3%      -1.1       11.42 ±  4%  perf-profile.children.cycles-pp.smpboot_thread_fn
     12.49 ±  3%      -1.1       11.40 ±  4%  perf-profile.children.cycles-pp.run_ksoftirqd
      4.55 ±  3%      -0.8        3.72 ±  4%  perf-profile.children.cycles-pp.__call_rcu_common
      2.28            -0.7        1.56        perf-profile.children.cycles-pp.allocate_slab
      1.48            -0.4        1.07        perf-profile.children.cycles-pp.shuffle_freelist
      5.07            -0.3        4.72        perf-profile.children.cycles-pp.___slab_alloc
      1.49            -0.2        1.25 ±  2%  perf-profile.children.cycles-pp.__memcg_slab_free_hook
      0.70            -0.2        0.50        perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      0.62            -0.2        0.44        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.64            -0.2        0.46        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.60            -0.2        0.42        perf-profile.children.cycles-pp.get_page_from_freelist
      0.89            -0.1        0.76        perf-profile.children.cycles-pp.mod_objcg_state
      0.50            -0.1        0.40        perf-profile.children.cycles-pp.setup_object
      0.38            -0.1        0.28 ±  2%  perf-profile.children.cycles-pp.free_frozen_pages
      1.69            -0.1        1.59        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.31            -0.1        0.22 ±  2%  perf-profile.children.cycles-pp.rmqueue
      0.27            -0.1        0.19        perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.32            -0.1        0.23 ±  2%  perf-profile.children.cycles-pp.free_frozen_page_commit
      0.28            -0.1        0.20 ±  2%  perf-profile.children.cycles-pp.free_pcppages_bulk
      0.24            -0.1        0.17 ±  2%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.17 ±  4%      -0.1        0.11 ±  5%  perf-profile.children.cycles-pp.prep_compound_page
      0.20 ±  2%      -0.0        0.15 ±  3%  perf-profile.children.cycles-pp.__free_one_page
      0.08 ±  4%      -0.0        0.06 ±  8%  perf-profile.children.cycles-pp.__get_random_u32_below
      0.08 ±  6%      -0.0        0.05        perf-profile.children.cycles-pp.get_random_u32
      0.10            +0.0        0.11        perf-profile.children.cycles-pp.mas_nomem
      0.08            +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.__mt_destroy
      0.08 ±  4%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.cap_vm_enough_memory
      0.10 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.brk@plt
      0.11            +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.userfaultfd_unmap_prep
      0.18 ±  2%      +0.0        0.20        perf-profile.children.cycles-pp.strnlen
      0.27            +0.0        0.29        perf-profile.children.cycles-pp._raw_spin_lock
      0.14 ±  3%      +0.0        0.15 ±  3%  perf-profile.children.cycles-pp.may_expand_vm
      0.23 ±  2%      +0.0        0.25        perf-profile.children.cycles-pp.can_vma_merge_after
      0.15            +0.0        0.17 ±  3%  perf-profile.children.cycles-pp.mas_node_count_gfp
      0.17            +0.0        0.19        perf-profile.children.cycles-pp.unmap_single_vma
      0.40            +0.0        0.42 ±  2%  perf-profile.children.cycles-pp.downgrade_write
      0.20 ±  3%      +0.0        0.22 ±  2%  perf-profile.children.cycles-pp.___pte_offset_map
      0.36            +0.0        0.38        perf-profile.children.cycles-pp.khugepaged_enter_vma
      0.23 ±  3%      +0.0        0.25        perf-profile.children.cycles-pp.free_pgd_range
      0.15 ±  3%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.anon_vma_clone
      0.33            +0.0        0.36        perf-profile.children.cycles-pp.mas_prev_setup
      0.23            +0.0        0.26 ±  2%  perf-profile.children.cycles-pp.refill_obj_stock
      0.25            +0.0        0.28 ±  2%  perf-profile.children.cycles-pp.userfaultfd_unmap_complete
      0.30            +0.0        0.33 ±  2%  perf-profile.children.cycles-pp.mas_wr_slot_store
      0.18 ±  2%      +0.0        0.22 ±  2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.45            +0.0        0.49 ±  2%  perf-profile.children.cycles-pp.static_key_count
      0.34            +0.0        0.38        perf-profile.children.cycles-pp.__vm_enough_memory
      0.45            +0.0        0.49        perf-profile.children.cycles-pp.sized_strscpy
      0.37            +0.0        0.40        perf-profile.children.cycles-pp.tlb_gather_mmu
      0.48            +0.0        0.52 ±  2%  perf-profile.children.cycles-pp.mas_prev
      0.40            +0.0        0.44        perf-profile.children.cycles-pp.mas_destroy
      0.43            +0.0        0.47        perf-profile.children.cycles-pp.mas_prev_range
      0.62            +0.0        0.66        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.42            +0.0        0.47        perf-profile.children.cycles-pp.tlb_finish_mmu
      0.48 ±  3%      +0.0        0.52 ±  5%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.50            +0.1        0.55        perf-profile.children.cycles-pp.rcu_all_qs
      0.15 ±  2%      +0.1        0.20 ±  2%  perf-profile.children.cycles-pp.testcase
      0.41 ±  2%      +0.1        0.46 ±  4%  perf-profile.children.cycles-pp.get_any_partial
      0.67            +0.1        0.73        perf-profile.children.cycles-pp.mas_wr_store_entry
      0.70            +0.1        0.76        perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.85            +0.1        0.92        perf-profile.children.cycles-pp.down_write_killable
      1.24            +0.1        1.31        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.34            +0.1        0.42 ±  2%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      1.13            +0.1        1.21        perf-profile.children.cycles-pp.__get_unmapped_area
      1.05            +0.1        1.14        perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      0.90            +0.1        0.98        perf-profile.children.cycles-pp.init_multi_vma_prep
      1.20            +0.1        1.29        perf-profile.children.cycles-pp.__cond_resched
      0.31 ±  3%      +0.1        0.41 ±  2%  perf-profile.children.cycles-pp.kfree
      1.32            +0.1        1.42        perf-profile.children.cycles-pp.check_brk_limits
      1.40            +0.1        1.51        perf-profile.children.cycles-pp.free_pgtables
      0.86            +0.1        0.98        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.37 ±  2%      +0.1        0.49        perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.73            +0.1        1.86        perf-profile.children.cycles-pp.mas_pop_node
      1.32            +0.1        1.45        perf-profile.children.cycles-pp.perf_iterate_sb
      1.38            +0.1        1.52        perf-profile.children.cycles-pp.zap_pte_range
      1.36            +0.1        1.50        perf-profile.children.cycles-pp.mas_next_slot
      1.02            +0.1        1.17        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.44            +0.2        1.60        perf-profile.children.cycles-pp.mas_prev_slot
      1.49            +0.2        1.66        perf-profile.children.cycles-pp.mas_leaf_max_gap
      1.94            +0.2        2.13        perf-profile.children.cycles-pp.zap_pmd_range
      2.17            +0.2        2.38        perf-profile.children.cycles-pp.mas_update_gap
      2.38            +0.2        2.60        perf-profile.children.cycles-pp.mas_walk
      0.00            +0.2        0.23 ±  3%  perf-profile.children.cycles-pp.vm_area_init_from
      2.54            +0.2        2.78        perf-profile.children.cycles-pp.clear_bhb_loop
      0.00            +0.3        0.28 ±  2%  perf-profile.children.cycles-pp.vm_area_free
      2.93            +0.3        3.21        perf-profile.children.cycles-pp.unmap_page_range
      3.02            +0.3        3.30        perf-profile.children.cycles-pp.perf_event_mmap_event
      3.60            +0.3        3.94        perf-profile.children.cycles-pp.perf_event_mmap
      3.74            +0.4        4.10        perf-profile.children.cycles-pp.unmap_vmas
      3.99 ±  2%      +0.4        4.37 ±  3%  perf-profile.children.cycles-pp.__vma_start_write
      5.23            +0.4        5.64        perf-profile.children.cycles-pp.commit_merge
      9.46            +0.5        9.94        perf-profile.children.cycles-pp.vma_complete
      6.33            +0.5        6.81        perf-profile.children.cycles-pp.vma_expand
      5.20            +0.5        5.70        perf-profile.children.cycles-pp.mas_find
      7.16            +0.5        7.71        perf-profile.children.cycles-pp.vma_merge_new_range
      6.16            +0.6        6.73        perf-profile.children.cycles-pp.vms_clear_ptes
     11.40            +0.6       12.02        perf-profile.children.cycles-pp.mas_store_prealloc
      1.20 ±  2%      +0.6        1.84 ±  4%  perf-profile.children.cycles-pp.get_partial_node
     16.47            +0.7       17.16        perf-profile.children.cycles-pp.mas_wr_node_store
      1.88            +0.9        2.75        perf-profile.children.cycles-pp.__put_partials
     13.15            +1.1       14.25        perf-profile.children.cycles-pp.do_brk_flags
     86.19            +1.1       87.32        perf-profile.children.cycles-pp.brk
     14.58            +1.3       15.86        perf-profile.children.cycles-pp.mas_store_gfp
      5.68            +1.3        7.02        perf-profile.children.cycles-pp.mas_alloc_nodes
     14.24            +2.0       16.19        perf-profile.children.cycles-pp.__slab_free
      9.02            +2.3       11.28        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
     18.67            +3.0       21.64        perf-profile.children.cycles-pp.kmem_cache_free
      5.83            +4.6       10.45        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      5.05            +4.7        9.74        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      5.63            -3.4        2.21        perf-profile.self.cycles-pp.mas_wr_store_type
      4.52            -2.9        1.65 ±  2%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      1.53            -1.4        0.12        perf-profile.self.cycles-pp.vm_area_dup
     10.08            -1.3        8.81        perf-profile.self.cycles-pp.__slab_free
      3.10 ±  4%      -0.4        2.68 ±  5%  perf-profile.self.cycles-pp.__call_rcu_common
      1.18            -0.3        0.87        perf-profile.self.cycles-pp.shuffle_freelist
      0.72            -0.3        0.46 ±  3%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      1.20            -0.2        1.01        perf-profile.self.cycles-pp.___slab_alloc
      0.64            -0.2        0.46        perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.72            -0.1        0.64        perf-profile.self.cycles-pp.mod_objcg_state
      0.27            -0.1        0.20 ±  2%  perf-profile.self.cycles-pp.rcu_do_batch
      0.78            -0.1        0.71        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.16 ±  3%      -0.1        0.10 ±  3%  perf-profile.self.cycles-pp.prep_compound_page
      0.18 ±  3%      -0.0        0.13 ±  2%  perf-profile.self.cycles-pp.rmqueue_bulk
      0.19            -0.0        0.15 ±  2%  perf-profile.self.cycles-pp.__free_one_page
      0.32 ±  2%      -0.0        0.28 ±  3%  perf-profile.self.cycles-pp.get_partial_node
      0.11            -0.0        0.08        perf-profile.self.cycles-pp.setup_object
      0.41            -0.0        0.39        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.07 ±  5%      -0.0        0.05        perf-profile.self.cycles-pp.get_page_from_freelist
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.__mt_destroy
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.mas_nomem
      0.06            +0.0        0.07        perf-profile.self.cycles-pp.mm_get_unmapped_area_vmflags
      0.17            +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.vma_expand
      0.12            +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.__vm_enough_memory
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.__thp_vma_allowable_orders
      0.11            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.vma_prepare
      0.22            +0.0        0.24        perf-profile.self.cycles-pp.up_read
      0.10 ±  4%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.may_expand_vm
      0.07            +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.userfaultfd_unmap_prep
      0.17 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.khugepaged_enter_vma
      0.16 ±  3%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.strlen
      0.22 ±  2%      +0.0        0.24 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.14            +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.unmap_single_vma
      0.08            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.mas_node_count_gfp
      0.19            +0.0        0.21        perf-profile.self.cycles-pp.unlink_anon_vmas
      0.14 ±  3%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.strnlen
      0.24 ±  3%      +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.discard_slab
      0.26            +0.0        0.29        perf-profile.self.cycles-pp.vma_mark_detached
      0.15 ±  2%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.___pte_offset_map
      0.18 ±  2%      +0.0        0.20 ±  2%  perf-profile.self.cycles-pp.can_vma_merge_after
      0.17 ±  2%      +0.0        0.19 ±  2%  perf-profile.self.cycles-pp.check_brk_limits
      0.30            +0.0        0.32 ±  2%  perf-profile.self.cycles-pp.static_key_count
      0.23 ±  2%      +0.0        0.25        perf-profile.self.cycles-pp.mas_prev_setup
      0.12            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.anon_vma_clone
      0.18 ±  2%      +0.0        0.21        perf-profile.self.cycles-pp.userfaultfd_unmap_complete
      0.24            +0.0        0.26 ±  2%  perf-profile.self.cycles-pp.vma_merge_new_range
      0.21 ±  2%      +0.0        0.24        perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.36            +0.0        0.38        perf-profile.self.cycles-pp.free_pgtables
      0.24            +0.0        0.27        perf-profile.self.cycles-pp.mas_prev_range
      0.13 ±  2%      +0.0        0.16        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.22 ±  3%      +0.0        0.25 ±  3%  perf-profile.self.cycles-pp.up_write
      0.32 ±  2%      +0.0        0.35        perf-profile.self.cycles-pp.downgrade_write
      0.23 ±  2%      +0.0        0.26        perf-profile.self.cycles-pp.__get_unmapped_area
      0.18 ±  3%      +0.0        0.21        perf-profile.self.cycles-pp.free_pgd_range
      0.26            +0.0        0.29 ±  2%  perf-profile.self.cycles-pp.mas_prev
      0.28            +0.0        0.31        perf-profile.self.cycles-pp.mas_destroy
      0.25 ±  2%      +0.0        0.29        perf-profile.self.cycles-pp.vms_clear_ptes
      0.24            +0.0        0.28 ±  2%  perf-profile.self.cycles-pp.mas_wr_slot_store
      0.30            +0.0        0.34        perf-profile.self.cycles-pp.tlb_gather_mmu
      0.35            +0.0        0.39        perf-profile.self.cycles-pp.rcu_all_qs
      0.37            +0.0        0.41        perf-profile.self.cycles-pp.sized_strscpy
      0.35 ±  2%      +0.0        0.39        perf-profile.self.cycles-pp.unmap_vmas
      0.36            +0.0        0.40        perf-profile.self.cycles-pp.zap_pmd_range
      0.36            +0.0        0.41        perf-profile.self.cycles-pp.vma_complete
      0.38 ±  4%      +0.0        0.42 ±  5%  perf-profile.self.cycles-pp.perf_event_mmap_output
      0.34            +0.0        0.39        perf-profile.self.cycles-pp.tlb_finish_mmu
      0.58            +0.0        0.63        perf-profile.self.cycles-pp.mas_update_gap
      0.40            +0.0        0.44 ±  2%  perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.52            +0.1        0.57        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.47            +0.1        0.52        perf-profile.self.cycles-pp.down_write_killable
      0.33            +0.1        0.38        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.11 ±  3%      +0.1        0.16 ±  2%  perf-profile.self.cycles-pp.testcase
      1.26            +0.1        1.32        perf-profile.self.cycles-pp.mas_preallocate
      0.58            +0.1        0.64        perf-profile.self.cycles-pp.__cond_resched
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.vm_area_free
      0.52            +0.1        0.58        perf-profile.self.cycles-pp.mas_wr_store_entry
      0.42            +0.1        0.48        perf-profile.self.cycles-pp.security_vm_enough_memory_mm
      0.48            +0.1        0.55        perf-profile.self.cycles-pp.do_syscall_64
      0.50            +0.1        0.57        perf-profile.self.cycles-pp.perf_event_mmap
      0.49            +0.1        0.56        perf-profile.self.cycles-pp.commit_merge
      0.26            +0.1        0.33        perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.65            +0.1        0.73        perf-profile.self.cycles-pp.perf_event_mmap_event
      0.50            +0.1        0.58        perf-profile.self.cycles-pp.zap_pte_range
      0.72            +0.1        0.80        perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.74            +0.1        0.83        perf-profile.self.cycles-pp.unmap_page_range
      0.24            +0.1        0.32        perf-profile.self.cycles-pp.kfree
      0.43 ±  2%      +0.1        0.52        perf-profile.self.cycles-pp.mas_alloc_nodes
      0.52 ±  2%      +0.1        0.61        perf-profile.self.cycles-pp.__split_vma
      0.37 ±  2%      +0.1        0.46        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.76            +0.1        0.86        perf-profile.self.cycles-pp.init_multi_vma_prep
      0.74 ±  2%      +0.1        0.84 ±  2%  perf-profile.self.cycles-pp.perf_iterate_sb
      0.80            +0.1        0.90        perf-profile.self.cycles-pp.do_brk_flags
      0.79            +0.1        0.89        perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.81            +0.1        0.92        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.83            +0.1        0.95        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.10            +0.1        1.25        perf-profile.self.cycles-pp.mas_next_slot
      1.11            +0.2        1.26        perf-profile.self.cycles-pp.brk
      1.26            +0.2        1.42        perf-profile.self.cycles-pp.mas_find
      1.21            +0.2        1.36        perf-profile.self.cycles-pp.mas_prev_slot
      1.46            +0.2        1.62        perf-profile.self.cycles-pp.mas_pop_node
      1.26            +0.2        1.43        perf-profile.self.cycles-pp.mas_leaf_max_gap
      1.55            +0.2        1.73        perf-profile.self.cycles-pp.mas_store_prealloc
      0.00            +0.2        0.19 ±  3%  perf-profile.self.cycles-pp.vm_area_init_from
      1.54            +0.2        1.73        perf-profile.self.cycles-pp.__do_sys_brk
      1.49            +0.2        1.68        perf-profile.self.cycles-pp.mas_store_gfp
      2.52            +0.2        2.75        perf-profile.self.cycles-pp.clear_bhb_loop
      1.99            +0.2        2.23        perf-profile.self.cycles-pp.mas_walk
      1.80            +0.2        2.05        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      3.29 ±  2%      +0.4        3.73 ±  4%  perf-profile.self.cycles-pp.__vma_start_write
      1.02            +0.5        1.52        perf-profile.self.cycles-pp.kmem_cache_free
      5.05            +4.7        9.73        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath



***************************************************************************************************
lkp-cpl-4sp2: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-cpl-4sp2/brk1/will-it-scale

commit: 
  e49510bf00 ("mm: prepare lock_vma_under_rcu() for vma reuse possibility")
  3104138517 ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

e49510bf00de4f83 3104138517fc66aad21f4a2487b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     14230            -9.1%      12933        vmstat.system.cs
   1748404 ±  3%     -16.0%    1469034 ±  3%  meminfo.SUnreclaim
   1904122 ±  2%     -14.6%    1625259 ±  2%  meminfo.Slab
  15571725 ±  5%     -16.3%   13035443 ±  2%  meminfo.max_used_kB
      8106 ± 14%     -42.1%       4696 ± 11%  perf-c2c.DRAM.local
    669.17 ±  7%     -44.5%     371.50 ±  6%  perf-c2c.DRAM.remote
    161.67 ±  7%     -31.2%     111.17 ±  9%  perf-c2c.HITM.remote
 1.351e+08           +10.7%  1.496e+08        will-it-scale.224.processes
    603347           +10.7%     667876        will-it-scale.per_process_ops
 1.351e+08           +10.7%  1.496e+08        will-it-scale.workload
      0.89            -0.1        0.78        mpstat.cpu.all.irq%
     27.13            -7.3       19.78        mpstat.cpu.all.soft%
     67.95            +6.9       74.84        mpstat.cpu.all.sys%
      3.38            +0.5        3.86        mpstat.cpu.all.usr%
    442905 ±  3%     -17.3%     366151        proc-vmstat.nr_slab_unreclaimable
  6.88e+08           -27.8%  4.971e+08        proc-vmstat.numa_hit
 6.877e+08           -27.8%  4.967e+08        proc-vmstat.numa_local
  2.14e+09            -7.4%  1.982e+09        proc-vmstat.pgalloc_normal
 2.139e+09            -7.4%  1.981e+09        proc-vmstat.pgfree
    447592 ±  2%     -13.9%     385568 ±  3%  numa-meminfo.node0.SUnreclaim
    434838 ±  2%     -15.5%     367233 ±  3%  numa-meminfo.node1.SUnreclaim
    435338           -15.7%     367006 ±  4%  numa-meminfo.node2.SUnreclaim
    454090 ±  2%     -13.8%     391362 ±  2%  numa-meminfo.node2.Slab
    440453           -17.1%     365287 ±  3%  numa-meminfo.node3.SUnreclaim
    477087 ±  2%     -17.5%     393689 ±  4%  numa-meminfo.node3.Slab
 1.738e+08           -27.7%  1.257e+08        numa-numastat.node0.local_node
 1.739e+08           -27.6%  1.258e+08        numa-numastat.node0.numa_hit
 1.728e+08           -27.8%  1.248e+08        numa-numastat.node1.local_node
 1.729e+08           -27.8%  1.249e+08        numa-numastat.node1.numa_hit
 1.722e+08           -28.2%  1.236e+08        numa-numastat.node2.local_node
 1.723e+08           -28.2%  1.237e+08        numa-numastat.node2.numa_hit
 1.689e+08           -27.4%  1.226e+08        numa-numastat.node3.local_node
  1.69e+08           -27.4%  1.227e+08        numa-numastat.node3.numa_hit
    115755 ±  2%     -15.2%      98158 ±  2%  numa-vmstat.node0.nr_slab_unreclaimable
 1.739e+08           -27.6%  1.258e+08        numa-vmstat.node0.numa_hit
 1.738e+08           -27.7%  1.257e+08        numa-vmstat.node0.numa_local
    111905 ±  3%     -14.1%      96154        numa-vmstat.node1.nr_slab_unreclaimable
 1.729e+08           -27.8%  1.249e+08        numa-vmstat.node1.numa_hit
 1.728e+08           -27.8%  1.248e+08        numa-vmstat.node1.numa_local
    111318 ±  3%     -14.5%      95132 ±  2%  numa-vmstat.node2.nr_slab_unreclaimable
 1.723e+08           -28.2%  1.237e+08        numa-vmstat.node2.numa_hit
 1.722e+08           -28.2%  1.236e+08        numa-vmstat.node2.numa_local
    112426 ±  2%     -18.1%      92103 ±  3%  numa-vmstat.node3.nr_slab_unreclaimable
  1.69e+08           -27.4%  1.227e+08        numa-vmstat.node3.numa_hit
 1.689e+08           -27.4%  1.226e+08        numa-vmstat.node3.numa_local
  27089937           +10.4%   29918880        sched_debug.cfs_rq:/.avg_vruntime.avg
  27433520           +10.1%   30206883        sched_debug.cfs_rq:/.avg_vruntime.max
  17935802 ±  3%     +17.2%   21028475 ±  2%  sched_debug.cfs_rq:/.avg_vruntime.min
      0.30 ±  6%     -11.4%       0.27 ±  4%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.30 ±  6%     -11.7%       0.27 ±  4%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
  27368638            +8.9%   29808643 ±  2%  sched_debug.cfs_rq:/.left_deadline.max
  27368250            +8.9%   29808343 ±  2%  sched_debug.cfs_rq:/.left_vruntime.max
     83384 ± 17%     -32.1%      56608 ± 15%  sched_debug.cfs_rq:/.load.avg
    239787 ± 10%     -17.0%     199024 ±  7%  sched_debug.cfs_rq:/.load.stddev
    176.89 ± 13%     -29.9%     124.00 ± 10%  sched_debug.cfs_rq:/.load_avg.avg
    572.86 ± 21%     -29.8%     402.00 ±  6%  sched_debug.cfs_rq:/.load_avg.max
     31.89 ± 21%     -47.6%      16.69 ± 21%  sched_debug.cfs_rq:/.load_avg.min
     97.22 ± 13%     -30.3%      67.79 ± 16%  sched_debug.cfs_rq:/.load_avg.stddev
  27089964           +10.4%   29918903        sched_debug.cfs_rq:/.min_vruntime.avg
  27433530           +10.1%   30206893        sched_debug.cfs_rq:/.min_vruntime.max
  17935828 ±  3%     +17.2%   21028481 ±  2%  sched_debug.cfs_rq:/.min_vruntime.min
      0.26 ±  7%     -13.7%       0.23 ±  6%  sched_debug.cfs_rq:/.nr_queued.stddev
  27368250            +8.9%   29808343 ±  2%  sched_debug.cfs_rq:/.right_vruntime.max
    172.75 ±  5%     -16.3%     144.66 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
     89.22 ±  6%     -15.4%      75.51 ±  8%  sched_debug.cfs_rq:/.util_avg.stddev
    180.75 ±  8%     -15.7%     152.32 ±  4%  sched_debug.cfs_rq:/.util_est.stddev
    991.25 ±  3%     -10.2%     889.65        sched_debug.cpu.clock_task.stddev
      0.30 ±  6%     -12.1%       0.26 ±  5%  sched_debug.cpu.nr_running.stddev
      2.30           -27.2%       1.67        perf-stat.i.MPKI
  1.24e+11            +7.2%  1.329e+11        perf-stat.i.branch-instructions
      0.30 ±  2%      -0.1        0.19 ±  2%  perf-stat.i.branch-miss-rate%
 3.616e+08 ±  2%     -35.6%  2.328e+08        perf-stat.i.branch-misses
     67.77            +1.0       68.77        perf-stat.i.cache-miss-rate%
 1.349e+09           -22.3%  1.048e+09        perf-stat.i.cache-misses
 1.988e+09           -23.5%  1.521e+09        perf-stat.i.cache-references
     14186            -9.1%      12898        perf-stat.i.context-switches
      1.28            -7.3%       1.18        perf-stat.i.cpi
    530.19            -3.1%     513.68        perf-stat.i.cpu-migrations
    557.15           +27.4%     709.73        perf-stat.i.cycles-between-cache-misses
 5.871e+11            +6.9%  6.276e+11        perf-stat.i.instructions
      0.78            +7.9%       0.84        perf-stat.i.ipc
      2.30           -27.3%       1.67        perf-stat.overall.MPKI
      0.29 ±  2%      -0.1        0.18        perf-stat.overall.branch-miss-rate%
     67.86            +1.1       68.91        perf-stat.overall.cache-miss-rate%
      1.28            -7.4%       1.19        perf-stat.overall.cpi
    556.50           +27.5%     709.51        perf-stat.overall.cycles-between-cache-misses
      0.78            +7.9%       0.84        perf-stat.overall.ipc
   1314103            -3.4%    1269390        perf-stat.overall.path-length
 1.235e+11            +7.3%  1.325e+11        perf-stat.ps.branch-instructions
 3.601e+08 ±  2%     -35.6%   2.32e+08        perf-stat.ps.branch-misses
 1.345e+09           -22.3%  1.045e+09        perf-stat.ps.cache-misses
 1.981e+09           -23.5%  1.516e+09        perf-stat.ps.cache-references
     14128            -9.0%      12850        perf-stat.ps.context-switches
    527.88            -3.1%     511.76        perf-stat.ps.cpu-migrations
 5.849e+11            +6.9%  6.254e+11        perf-stat.ps.instructions
 1.776e+14            +6.9%  1.899e+14        perf-stat.total.instructions
      6.60 ± 20%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      6.09 ± 12%     -28.0%       4.38 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.29 ±  9%     -30.8%       4.35 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      6.35 ± 13%     -34.0%       4.19 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      6.29 ± 11%     -29.7%       4.42 ±  7%  perf-sched.sch_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      6.43 ± 18%     -32.8%       4.32 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      6.44 ± 15%     -31.2%       4.43 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.59 ± 10%     -25.9%       3.40 ±  6%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      2.57 ± 21%     -35.7%       1.65 ± 21%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.09 ± 13%     -28.8%       0.06 ± 16%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.62 ± 13%     -31.1%       3.87 ±  8%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     50.78 ± 45%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
     60.77 ± 29%     -41.2%      35.76 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     61.91 ± 27%     -42.7%      35.46 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
     59.90 ± 28%     -41.3%      35.14 ±  8%  perf-sched.sch_delay.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
     31.20 ± 29%     -65.4%      10.80 ±105%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.59 ± 39%     -35.5%      32.64 ±  7%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
     62.08 ± 28%     -40.1%      37.17 ±  2%  perf-sched.sch_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
     49.03 ± 15%     -34.5%      32.10 ±  4%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     59.37 ± 30%     -39.8%      35.76 ±  5%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     59.78 ± 26%     -44.8%      32.99 ±  7%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     15.42 ±104%     -64.9%       5.42 ± 24%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     28.16 ± 27%     -34.9%      18.34 ± 18%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
     62.69 ± 26%     -37.2%      39.38 ±  6%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.94 ± 11%     -30.0%       2.06 ±  7%  perf-sched.total_sch_delay.average.ms
     63.61 ± 26%     -37.8%      39.56 ±  5%  perf-sched.total_sch_delay.max.ms
      3230 ± 14%     +23.0%       3975 ±  8%  perf-sched.total_wait_and_delay.max.ms
      3230 ± 14%     +23.0%       3975 ±  8%  perf-sched.total_wait_time.max.ms
     12.18 ± 12%     -28.0%       8.76 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     12.57 ±  9%     -30.8%       8.70 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
     12.70 ± 13%     -34.0%       8.39 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
     12.58 ± 11%     -29.7%       8.84 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
     12.87 ± 15%     -31.2%       8.86 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      9.26 ± 10%     -26.6%       6.80 ±  6%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     66.32 ±  4%     +17.0%      77.57        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     11.84 ± 13%     -28.6%       8.46 ±  7%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2792 ±  5%     -10.6%       2497 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3771 ±  5%      -7.7%       3482 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      1507 ±  7%     -13.7%       1300 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
    894.67 ±  8%     -32.2%     606.50 ± 19%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     28175 ±  6%     -10.2%      25297 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    121.53 ± 29%     -41.2%      71.52 ±  8%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
    123.83 ± 27%     -42.7%      70.91 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
    119.80 ± 28%     -41.3%      70.27 ±  8%  perf-sched.wait_and_delay.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
    124.15 ± 28%     -40.1%      74.35 ±  2%  perf-sched.wait_and_delay.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
    118.75 ± 30%     -39.8%      71.53 ±  5%  perf-sched.wait_and_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    269.36 ±124%     -75.5%      65.99 ±  7%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      6.60 ± 20%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      6.09 ± 12%     -28.0%       4.38 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      6.29 ±  9%     -30.8%       4.35 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      6.35 ± 13%     -34.0%       4.19 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      6.29 ± 11%     -29.7%       4.42 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
      6.43 ± 18%     -32.8%       4.32 ± 10%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      6.44 ± 15%     -31.1%       4.43 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.67 ± 11%     -27.2%       3.40 ±  6%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      2.57 ± 21%     -35.7%       1.65 ± 21%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     66.23 ±  4%     +17.0%      77.50        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.23 ± 12%     -26.3%       4.59 ±  7%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     50.78 ± 45%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
     60.77 ± 29%     -41.2%      35.76 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     61.91 ± 27%     -42.7%      35.46 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
     59.90 ± 28%     -41.3%      35.14 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.remove_vma.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
    181.47 ±186%     -94.0%      10.80 ±105%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     50.59 ± 39%     -35.5%      32.64 ±  7%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.vms_clear_ptes.part
     62.08 ± 28%     -40.1%      37.17 ±  2%  perf-sched.wait_time.max.ms.__cond_resched.unmap_vmas.vms_clear_ptes.part.0
     49.03 ± 15%     -34.5%      32.10 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     59.37 ± 30%     -39.8%      35.76 ±  5%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    218.02 ±162%     -84.9%      32.99 ±  7%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     15.42 ±104%     -64.9%       5.42 ± 24%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      9.41 ±  3%      -7.9        1.52 ±  6%  perf-profile.calltrace.cycles-pp.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      9.36 ±  3%      -7.9        1.48 ±  6%  perf-profile.calltrace.cycles-pp.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free.rcu_do_batch
      9.29 ±  3%      -7.8        1.46 ±  6%  perf-profile.calltrace.cycles-pp.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials.kmem_cache_free
      9.09 ±  4%      -7.8        1.33 ±  6%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages.__put_partials
      9.00 ±  4%      -7.7        1.28 ±  6%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.free_pcppages_bulk.free_frozen_page_commit.free_frozen_pages
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork.ret_from_fork_asm
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork.ret_from_fork_asm
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.calltrace.cycles-pp.ret_from_fork_asm
     21.45 ±  2%      -7.5       13.96 ±  4%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.43 ±  2%      -7.5       13.94 ±  4%  perf-profile.calltrace.cycles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
     21.43 ±  2%      -7.5       13.94 ±  4%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.42 ±  2%      -7.5       13.93 ±  4%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread
     21.40 ±  2%      -7.5       13.91 ±  4%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd.smpboot_thread_fn
      9.70 ±  3%      -7.1        2.60 ±  4%  perf-profile.calltrace.cycles-pp.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
     15.78 ±  3%      -5.0       10.78 ±  5%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
      4.97            -1.9        3.06        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk.do_syscall_64
      5.65            -1.8        3.81        perf-profile.calltrace.cycles-pp.vm_area_alloc.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.26 ±  2%      -1.2        3.03 ±  3%  perf-profile.calltrace.cycles-pp.rcu_cblist_dequeue.rcu_do_batch.rcu_core.handle_softirqs.run_ksoftirqd
     12.67            -0.8       11.83        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.75            -0.4       26.34        perf-profile.calltrace.cycles-pp.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.67            -0.3        0.37 ± 70%  perf-profile.calltrace.cycles-pp.perf_event_mmap_output.perf_iterate_sb.perf_event_mmap_event.perf_event_mmap.do_brk_flags
      2.02            -0.2        1.82        perf-profile.calltrace.cycles-pp.__memcg_slab_post_alloc_hook.kmem_cache_alloc_noprof.vm_area_alloc.do_brk_flags.__do_sys_brk
      0.99 ±  3%      -0.2        0.82 ±  5%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.99 ±  3%      -0.2        0.82 ±  5%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.93 ±  3%      -0.2        0.78 ±  5%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt
      0.94 ±  3%      -0.2        0.78 ±  5%  perf-profile.calltrace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.94 ±  3%      -0.2        0.78 ±  5%  perf-profile.calltrace.cycles-pp.rcu_core.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.94 ±  3%      -0.2        0.78 ±  5%  perf-profile.calltrace.cycles-pp.handle_softirqs.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.do_syscall_64
      1.64            -0.0        1.60        perf-profile.calltrace.cycles-pp.allocate_slab.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp
      0.52 ±  2%      +0.0        0.55 ±  2%  perf-profile.calltrace.cycles-pp.static_key_count.security_vm_enough_memory_mm.do_brk_flags.__do_sys_brk.do_syscall_64
      1.08 ±  2%      +0.1        1.14        perf-profile.calltrace.cycles-pp.memcpy_orig.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.52            +0.1        0.58        perf-profile.calltrace.cycles-pp.sized_strscpy.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk
      0.71            +0.1        0.78        perf-profile.calltrace.cycles-pp.arch_get_unmapped_area_topdown.__get_unmapped_area.check_brk_limits.__do_sys_brk.do_syscall_64
      0.85            +0.1        0.94        perf-profile.calltrace.cycles-pp.__pte_offset_map_lock.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas
      0.56 ±  2%      +0.1        0.64        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap
      1.04 ±  2%      +0.1        1.12 ±  2%  perf-profile.calltrace.cycles-pp.memcpy_orig.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.63 ±  3%      +0.1        0.72        perf-profile.calltrace.cycles-pp.mas_leaf_max_gap.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_brk_flags
      1.40 ±  3%      +0.1        1.49        perf-profile.calltrace.cycles-pp.mas_pop_node.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      1.36 ±  3%      +0.1        1.46        perf-profile.calltrace.cycles-pp.mas_pop_node.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.92            +0.1        1.02        perf-profile.calltrace.cycles-pp.down_write_killable.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.92 ±  2%      +0.1        1.02        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      0.82            +0.1        0.93        perf-profile.calltrace.cycles-pp.mas_update_gap.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      0.85            +0.1        0.97        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      1.80            +0.1        1.94        perf-profile.calltrace.cycles-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes
      0.90            +0.1        1.05        perf-profile.calltrace.cycles-pp.__call_rcu_common.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      1.12            +0.2        1.29        perf-profile.calltrace.cycles-pp.mas_next_slot.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      1.07            +0.2        1.24        perf-profile.calltrace.cycles-pp.__vma_start_write.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.59            +0.2        1.77        perf-profile.calltrace.cycles-pp.mas_find.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.36            +0.2        1.54        perf-profile.calltrace.cycles-pp.mas_prev_slot.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.33            +0.2        1.52        perf-profile.calltrace.cycles-pp.__get_unmapped_area.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.90            +0.2        1.09        perf-profile.calltrace.cycles-pp.__call_rcu_common.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk
      1.06            +0.2        1.26        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      1.57            +0.2        1.77        perf-profile.calltrace.cycles-pp.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      1.14            +0.2        1.34        perf-profile.calltrace.cycles-pp.mas_wr_store_type.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.26            +0.2        1.47        perf-profile.calltrace.cycles-pp.mas_store_gfp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      1.60            +0.2        1.83        perf-profile.calltrace.cycles-pp.check_brk_limits.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      3.76            +0.2        3.99        perf-profile.calltrace.cycles-pp.perf_event_mmap_event.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64
      2.52            +0.2        2.76        perf-profile.calltrace.cycles-pp.zap_pmd_range.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas
      4.57            +0.3        4.85        perf-profile.calltrace.cycles-pp.perf_event_mmap.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.47            +0.3        1.76        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap
      1.46            +0.3        1.76        perf-profile.calltrace.cycles-pp.___slab_alloc.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_brk_flags
      1.27            +0.4        1.63        perf-profile.calltrace.cycles-pp.security_vm_enough_memory_mm.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.53            +0.4        2.92        perf-profile.calltrace.cycles-pp.mas_walk.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.36            +0.4        2.77        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.brk
      2.22            +0.4        2.64        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk
      2.79            +0.4        3.21        perf-profile.calltrace.cycles-pp.clear_bhb_loop.brk
      3.86            +0.4        4.28        perf-profile.calltrace.cycles-pp.unmap_page_range.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      2.25            +0.4        2.68        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_store_gfp.do_brk_flags.__do_sys_brk
      2.59            +0.5        3.06        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      3.20            +0.5        3.68        perf-profile.calltrace.cycles-pp.mas_find.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      5.76            +0.5        6.25        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_brk_flags.__do_sys_brk.do_syscall_64
      2.57            +0.5        3.06        perf-profile.calltrace.cycles-pp.mas_alloc_nodes.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      4.85            +0.5        5.38        perf-profile.calltrace.cycles-pp.unmap_vmas.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.vma_merge_new_range.do_brk_flags.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.mas_prev_slot.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
      0.00            +0.5        0.53        perf-profile.calltrace.cycles-pp.tlb_gather_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.00            +0.5        0.54        perf-profile.calltrace.cycles-pp.mas_find.free_pgtables.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap
      0.00            +0.5        0.55        perf-profile.calltrace.cycles-pp.mas_prev_range.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.00            +0.5        0.55 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.brk
      5.63            +0.6        6.19        perf-profile.calltrace.cycles-pp.mas_wr_node_store.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.00            +0.6        0.56        perf-profile.calltrace.cycles-pp.tlb_finish_mmu.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.00            +0.6        0.65        perf-profile.calltrace.cycles-pp.mas_find.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.00            +0.9        0.87 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch
      7.81            +0.9        8.72        perf-profile.calltrace.cycles-pp.vms_clear_ptes.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      0.00            +0.9        0.92 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__put_partials.kmem_cache_free.rcu_do_batch.rcu_core
      7.51            +1.0        8.52        perf-profile.calltrace.cycles-pp.vms_gather_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     10.72            +1.4       12.15        perf-profile.calltrace.cycles-pp.mas_store_gfp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.5        1.52 ±  3%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk
      0.00            +1.6        1.64 ±  3%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch
      0.00            +1.8        1.78 ±  3%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core
      0.00            +2.4        2.41        perf-profile.calltrace.cycles-pp.kmem_cache_free.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64
      4.45 ±  3%      +3.1        7.55 ±  6%  perf-profile.calltrace.cycles-pp.__slab_free.kmem_cache_free.rcu_do_batch.rcu_core.handle_softirqs
     11.12            +3.2       14.37        perf-profile.calltrace.cycles-pp.vms_complete_munmap_vmas.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe
     30.72            +5.9       36.63        perf-profile.calltrace.cycles-pp.do_vmi_align_munmap.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     67.54            +6.3       73.80        perf-profile.calltrace.cycles-pp.__do_sys_brk.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     70.87            +6.4       77.32        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.brk
     71.29            +6.5       77.80        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.brk
     78.06            +7.4       85.50        perf-profile.calltrace.cycles-pp.brk
     11.74 ±  3%      -9.7        2.03 ±  3%  perf-profile.children.cycles-pp.free_frozen_pages
     11.65 ±  3%      -9.7        1.97 ±  4%  perf-profile.children.cycles-pp.free_frozen_page_commit
     11.54 ±  3%      -9.6        1.93 ±  4%  perf-profile.children.cycles-pp.free_pcppages_bulk
     32.78            -9.3       23.51        perf-profile.children.cycles-pp.rcu_do_batch
     32.83            -9.3       23.56        perf-profile.children.cycles-pp.handle_softirqs
     32.80            -9.3       23.54        perf-profile.children.cycles-pp.rcu_core
     12.37 ±  2%      -8.0        4.40        perf-profile.children.cycles-pp.__put_partials
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.children.cycles-pp.kthread
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.children.cycles-pp.ret_from_fork
     21.47 ±  2%      -7.5       13.97 ±  4%  perf-profile.children.cycles-pp.ret_from_fork_asm
     21.45 ±  2%      -7.5       13.96 ±  4%  perf-profile.children.cycles-pp.smpboot_thread_fn
     21.43 ±  2%      -7.5       13.94 ±  4%  perf-profile.children.cycles-pp.run_ksoftirqd
     12.96 ±  2%      -4.9        8.02        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
     12.49 ±  2%      -4.9        7.56        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     23.30            -2.4       20.91        perf-profile.children.cycles-pp.kmem_cache_free
      7.13 ±  2%      -2.3        4.83 ±  2%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
     12.29 ±  3%      -1.9       10.37 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     12.26 ±  3%      -1.9       10.34 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      5.67            -1.8        3.84        perf-profile.children.cycles-pp.vm_area_alloc
     11.40 ±  3%      -1.8        9.63 ±  5%  perf-profile.children.cycles-pp.__irq_exit_rcu
      4.80            -1.3        3.52        perf-profile.children.cycles-pp.___slab_alloc
      9.52            -1.0        8.48        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      2.64            -1.0        1.60        perf-profile.children.cycles-pp.allocate_slab
     27.54            -1.0       26.50        perf-profile.children.cycles-pp.do_brk_flags
      2.04            -0.7        1.34        perf-profile.children.cycles-pp.shuffle_freelist
      2.78            -0.6        2.15        perf-profile.children.cycles-pp.__call_rcu_common
      0.95            -0.3        0.62        perf-profile.children.cycles-pp.setup_object
      0.80            -0.2        0.60        perf-profile.children.cycles-pp.rcu_segcblist_enqueue
      2.04            -0.2        1.85        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.42            -0.2        0.23        perf-profile.children.cycles-pp.alloc_pages_mpol
      0.41            -0.2        0.22        perf-profile.children.cycles-pp.__alloc_frozen_pages_noprof
      0.68 ±  2%      -0.2        0.50 ±  2%  perf-profile.children.cycles-pp.get_any_partial
      0.38            -0.2        0.20        perf-profile.children.cycles-pp.get_page_from_freelist
      0.91            -0.1        0.76        perf-profile.children.cycles-pp.hrtimer_interrupt
      0.91            -0.1        0.77        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.70            -0.1        0.57 ±  5%  perf-profile.children.cycles-pp.perf_event_mmap_output
      0.83            -0.1        0.70        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.68 ±  2%      -0.1        0.55        perf-profile.children.cycles-pp.tick_nohz_handler
      0.25            -0.1        0.12 ±  4%  perf-profile.children.cycles-pp.rmqueue
      0.22 ±  2%      -0.1        0.10 ±  4%  perf-profile.children.cycles-pp.__rmqueue_pcplist
      0.28            -0.1        0.17 ±  2%  perf-profile.children.cycles-pp.__free_one_page
      0.62 ±  2%      -0.1        0.51        perf-profile.children.cycles-pp.update_process_times
      0.78            -0.1        0.69        perf-profile.children.cycles-pp.mod_objcg_state
      0.35 ±  2%      -0.1        0.28        perf-profile.children.cycles-pp.sched_tick
      0.16            -0.1        0.09 ±  5%  perf-profile.children.cycles-pp.rmqueue_bulk
      0.47 ±  2%      -0.1        0.40 ±  7%  perf-profile.children.cycles-pp.obj_cgroup_charge
      0.24 ±  3%      -0.1        0.18 ±  2%  perf-profile.children.cycles-pp.task_tick_fair
      0.11 ±  3%      -0.0        0.07        perf-profile.children.cycles-pp.update_load_avg
      0.10 ±  4%      -0.0        0.06        perf-profile.children.cycles-pp.__get_random_u32_below
      0.09            -0.0        0.06        perf-profile.children.cycles-pp.get_random_u32
      0.08 ±  5%      -0.0        0.06        perf-profile.children.cycles-pp.update_curr
      0.09 ±  5%      -0.0        0.06 ±  7%  perf-profile.children.cycles-pp.perf_rotate_context
      0.08            -0.0        0.07        perf-profile.children.cycles-pp.call_rcu
      0.11            +0.0        0.12        perf-profile.children.cycles-pp.mm_get_unmapped_area_vmflags
      0.11 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.mas_next_setup
      0.13 ±  2%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.userfaultfd_unmap_prep
      0.23            +0.0        0.25        perf-profile.children.cycles-pp.___pte_offset_map
      0.31            +0.0        0.33        perf-profile.children.cycles-pp.up_read
      0.13 ±  4%      +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.may_expand_vm
      0.17 ±  2%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.strlen
      0.16 ±  2%      +0.0        0.18 ±  3%  perf-profile.children.cycles-pp.discard_slab
      0.25            +0.0        0.27        perf-profile.children.cycles-pp.unmap_single_vma
      0.13 ±  2%      +0.0        0.16 ±  3%  perf-profile.children.cycles-pp.__x64_sys_brk
      0.18            +0.0        0.21 ±  2%  perf-profile.children.cycles-pp.__memcpy
      0.17 ±  4%      +0.0        0.20 ±  2%  perf-profile.children.cycles-pp.cap_capable
      0.19            +0.0        0.22 ±  4%  perf-profile.children.cycles-pp.refill_obj_stock
      0.17 ±  2%      +0.0        0.20        perf-profile.children.cycles-pp.mas_nomem
      0.37            +0.0        0.40        perf-profile.children.cycles-pp._raw_spin_lock
      0.17            +0.0        0.20        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.26            +0.0        0.29        perf-profile.children.cycles-pp.can_vma_merge_after
      0.30            +0.0        0.34        perf-profile.children.cycles-pp.mas_prev_setup
      0.42            +0.0        0.45        perf-profile.children.cycles-pp.downgrade_write
      0.57            +0.0        0.60        perf-profile.children.cycles-pp.static_key_count
      0.33            +0.0        0.36        perf-profile.children.cycles-pp.mas_next_range
      0.30 ±  2%      +0.0        0.34        perf-profile.children.cycles-pp.strnlen
      0.40            +0.0        0.44 ±  3%  perf-profile.children.cycles-pp.__vm_enough_memory
      0.23 ±  3%      +0.0        0.27        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      0.42 ±  2%      +0.0        0.46        perf-profile.children.cycles-pp.rcu_all_qs
      0.40            +0.0        0.44        perf-profile.children.cycles-pp.vma_mark_detached
      0.12            +0.0        0.17 ±  4%  perf-profile.children.cycles-pp.testcase
      0.08 ±  8%      +0.0        0.13        perf-profile.children.cycles-pp.brk@plt
      0.49            +0.0        0.54        perf-profile.children.cycles-pp.x64_sys_call
      0.31 ±  2%      +0.0        0.36        perf-profile.children.cycles-pp.up_write
      0.36            +0.0        0.41        perf-profile.children.cycles-pp.mas_destroy
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.finish_rcuwait
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.task_work_run
      0.23            +0.1        0.28        perf-profile.children.cycles-pp.mas_node_count_gfp
      0.47            +0.1        0.53        perf-profile.children.cycles-pp.tlb_gather_mmu
      0.57 ±  2%      +0.1        0.63        perf-profile.children.cycles-pp.mas_put_in_tree
      0.52            +0.1        0.58        perf-profile.children.cycles-pp.mas_prev
      0.53            +0.1        0.59        perf-profile.children.cycles-pp.sized_strscpy
      0.43            +0.1        0.50 ±  3%  perf-profile.children.cycles-pp.percpu_counter_add_batch
      0.50            +0.1        0.56        perf-profile.children.cycles-pp.mas_prev_range
      0.49            +0.1        0.56        perf-profile.children.cycles-pp.vma_merge_new_range
      0.49            +0.1        0.56        perf-profile.children.cycles-pp.tlb_finish_mmu
      0.72            +0.1        0.79        perf-profile.children.cycles-pp.arch_get_unmapped_area_topdown
      0.87            +0.1        0.96        perf-profile.children.cycles-pp.__pte_offset_map_lock
      0.09 ±  4%      +0.1        0.18 ±  2%  perf-profile.children.cycles-pp.cap_mmap_addr
      0.69            +0.1        0.79        perf-profile.children.cycles-pp.mas_wr_store_entry
      0.32 ±  2%      +0.1        0.43        perf-profile.children.cycles-pp.userfaultfd_unmap_complete
      0.21            +0.1        0.32        perf-profile.children.cycles-pp.security_mmap_addr
      0.96            +0.1        1.07        perf-profile.children.cycles-pp.down_write_killable
      0.28            +0.1        0.40        perf-profile.children.cycles-pp.free_pgd_range
      0.47 ±  2%      +0.1        0.59 ±  2%  perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.91            +0.1        1.04        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.85            +0.1        1.98        perf-profile.children.cycles-pp.zap_pte_range
      1.20 ±  2%      +0.2        1.36        perf-profile.children.cycles-pp.mas_leaf_max_gap
      2.21 ±  2%      +0.2        2.38        perf-profile.children.cycles-pp.memcpy_orig
      1.21            +0.2        1.38        perf-profile.children.cycles-pp.__cond_resched
      2.76 ±  3%      +0.2        2.95        perf-profile.children.cycles-pp.mas_pop_node
      1.20            +0.2        1.39        perf-profile.children.cycles-pp.__vma_start_write
      0.30 ±  3%      +0.2        0.50        perf-profile.children.cycles-pp.kfree
      1.09            +0.2        1.29        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      1.38            +0.2        1.59        perf-profile.children.cycles-pp.__get_unmapped_area
      1.79 ±  2%      +0.2        2.00        perf-profile.children.cycles-pp.mas_update_gap
      1.62            +0.2        1.84        perf-profile.children.cycles-pp.check_brk_limits
      1.73            +0.2        1.96        perf-profile.children.cycles-pp.free_pgtables
      2.59            +0.2        2.84        perf-profile.children.cycles-pp.zap_pmd_range
      0.20 ± 10%      +0.3        0.46        perf-profile.children.cycles-pp.cap_vm_enough_memory
      3.90            +0.3        4.17        perf-profile.children.cycles-pp.perf_event_mmap_event
      1.88            +0.3        2.15        perf-profile.children.cycles-pp.mas_prev_slot
      1.52            +0.3        1.79        perf-profile.children.cycles-pp.entry_SYSCALL_64
      4.60            +0.3        4.88        perf-profile.children.cycles-pp.perf_event_mmap
      1.88            +0.3        2.16        perf-profile.children.cycles-pp.mas_next_slot
      0.71 ±  6%      +0.3        1.00 ±  4%  perf-profile.children.cycles-pp.get_partial_node
      2.07            +0.3        2.40        perf-profile.children.cycles-pp.mas_wr_store_type
      0.00            +0.4        0.36        perf-profile.children.cycles-pp.vm_area_free
      1.38            +0.4        1.77        perf-profile.children.cycles-pp.security_vm_enough_memory_mm
      2.81            +0.4        3.23        perf-profile.children.cycles-pp.clear_bhb_loop
      3.90            +0.4        4.34        perf-profile.children.cycles-pp.unmap_page_range
      3.14            +0.5        3.62        perf-profile.children.cycles-pp.mas_walk
      4.88            +0.5        5.42        perf-profile.children.cycles-pp.unmap_vmas
      7.85            +0.9        8.77        perf-profile.children.cycles-pp.vms_clear_ptes
      5.20            +1.0        6.16        perf-profile.children.cycles-pp.mas_alloc_nodes
      6.22            +1.0        7.19        perf-profile.children.cycles-pp.mas_find
      7.64            +1.0        8.68        perf-profile.children.cycles-pp.vms_gather_munmap_vmas
     11.57            +1.1       12.65        perf-profile.children.cycles-pp.mas_wr_node_store
     24.28            +1.5       25.81        perf-profile.children.cycles-pp.mas_store_gfp
     11.20            +3.3       14.46        perf-profile.children.cycles-pp.vms_complete_munmap_vmas
      7.99 ±  2%      +4.9       12.94        perf-profile.children.cycles-pp.__slab_free
     30.77            +5.9       36.69        perf-profile.children.cycles-pp.do_vmi_align_munmap
     67.67            +6.3       73.95        perf-profile.children.cycles-pp.__do_sys_brk
     70.97            +6.5       77.42        perf-profile.children.cycles-pp.do_syscall_64
     71.41            +6.5       77.94        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     78.12            +7.5       85.57        perf-profile.children.cycles-pp.brk
     12.49 ±  2%      -4.9        7.56        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      7.05            -2.3        4.76 ±  2%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
      2.14            -0.5        1.61        perf-profile.self.cycles-pp.do_brk_flags
      1.61            -0.5        1.09        perf-profile.self.cycles-pp.shuffle_freelist
      0.86            -0.3        0.55        perf-profile.self.cycles-pp.___slab_alloc
      1.51            -0.2        1.27        perf-profile.self.cycles-pp.__call_rcu_common
      0.79            -0.2        0.59        perf-profile.self.cycles-pp.rcu_segcblist_enqueue
      0.42            -0.1        0.28        perf-profile.self.cycles-pp.get_any_partial
      0.90            -0.1        0.77 ±  4%  perf-profile.self.cycles-pp.__memcg_slab_free_hook
      0.56            -0.1        0.46 ±  5%  perf-profile.self.cycles-pp.perf_event_mmap_output
      0.24            -0.1        0.16 ±  3%  perf-profile.self.cycles-pp.__free_one_page
      2.93            -0.1        2.85        perf-profile.self.cycles-pp.mas_store_gfp
      0.24            -0.1        0.17 ±  2%  perf-profile.self.cycles-pp.rcu_do_batch
      0.11 ±  4%      -0.0        0.06        perf-profile.self.cycles-pp.rmqueue_bulk
      0.14 ±  4%      -0.0        0.10 ±  5%  perf-profile.self.cycles-pp.get_partial_node
      0.15 ±  3%      -0.0        0.12 ±  4%  perf-profile.self.cycles-pp.setup_object
      0.12            -0.0        0.11        perf-profile.self.cycles-pp.remove_vma
      0.08            +0.0        0.09        perf-profile.self.cycles-pp.__memcpy
      0.10            +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.userfaultfd_unmap_prep
      0.06            +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.flush_tlb_batched_pending
      0.08 ±  5%      +0.0        0.10        perf-profile.self.cycles-pp.mas_next_setup
      0.08            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.__x64_sys_brk
      0.11 ±  3%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.security_mmap_addr
      0.10            +0.0        0.12        perf-profile.self.cycles-pp.mas_nomem
      0.12 ±  7%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.vm_get_page_prot
      0.16 ±  2%      +0.0        0.18 ±  2%  perf-profile.self.cycles-pp.discard_slab
      0.11 ±  3%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.may_expand_vm
      0.16            +0.0        0.19 ±  5%  perf-profile.self.cycles-pp.__vm_enough_memory
      0.14 ±  2%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.strlen
      0.21            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.unmap_single_vma
      0.24            +0.0        0.27        perf-profile.self.cycles-pp.up_read
      0.17            +0.0        0.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.17 ±  2%      +0.0        0.20        perf-profile.self.cycles-pp.mas_next_range
      0.19            +0.0        0.22        perf-profile.self.cycles-pp.___pte_offset_map
      0.14 ±  4%      +0.0        0.17 ±  2%  perf-profile.self.cycles-pp.cap_capable
      0.20            +0.0        0.23        perf-profile.self.cycles-pp.check_brk_limits
      0.34 ±  3%      +0.0        0.38        perf-profile.self.cycles-pp.__get_unmapped_area
      0.20            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.can_vma_merge_after
      0.27 ±  3%      +0.0        0.31        perf-profile.self.cycles-pp.rcu_all_qs
      0.59 ±  3%      +0.0        0.62        perf-profile.self.cycles-pp.perf_event_mmap
      0.38 ±  2%      +0.0        0.41 ±  2%  perf-profile.self.cycles-pp.static_key_count
      0.23            +0.0        0.26        perf-profile.self.cycles-pp.strnlen
      0.05 ± 13%      +0.0        0.09        perf-profile.self.cycles-pp.brk@plt
      0.23            +0.0        0.27        perf-profile.self.cycles-pp.mas_prev_setup
      0.30            +0.0        0.33 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.08            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.testcase
      0.13            +0.0        0.17        perf-profile.self.cycles-pp.mas_node_count_gfp
      0.21            +0.0        0.25        perf-profile.self.cycles-pp.vma_merge_new_range
      0.34            +0.0        0.38        perf-profile.self.cycles-pp.downgrade_write
      0.27            +0.0        0.31        perf-profile.self.cycles-pp.vms_clear_ptes
      0.25            +0.0        0.29        perf-profile.self.cycles-pp.__pte_offset_map_lock
      0.17 ±  2%      +0.0        0.22        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.26            +0.0        0.31        perf-profile.self.cycles-pp.up_write
      0.30            +0.1        0.35        perf-profile.self.cycles-pp.mas_prev
      0.30            +0.1        0.35        perf-profile.self.cycles-pp.vma_mark_detached
      0.27            +0.1        0.32        perf-profile.self.cycles-pp.mas_destroy
      0.53 ±  2%      +0.1        0.58        perf-profile.self.cycles-pp.mas_update_gap
      0.37            +0.1        0.43        perf-profile.self.cycles-pp.unmap_vmas
      0.40            +0.1        0.46        perf-profile.self.cycles-pp.x64_sys_call
      0.28            +0.1        0.35        perf-profile.self.cycles-pp.mas_prev_range
      0.46            +0.1        0.52        perf-profile.self.cycles-pp.free_pgtables
      0.39            +0.1        0.45        perf-profile.self.cycles-pp.tlb_gather_mmu
      0.39            +0.1        0.46        perf-profile.self.cycles-pp.tlb_finish_mmu
      0.34            +0.1        0.41 ±  3%  perf-profile.self.cycles-pp.percpu_counter_add_batch
      0.40            +0.1        0.47        perf-profile.self.cycles-pp.sized_strscpy
      0.46            +0.1        0.53        perf-profile.self.cycles-pp.mas_put_in_tree
      0.73            +0.1        0.81        perf-profile.self.cycles-pp.zap_pte_range
      0.00            +0.1        0.08        perf-profile.self.cycles-pp.vm_area_free
      0.44            +0.1        0.52        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.58            +0.1        0.66        perf-profile.self.cycles-pp.do_syscall_64
      0.52            +0.1        0.61        perf-profile.self.cycles-pp.down_write_killable
      0.55            +0.1        0.64        perf-profile.self.cycles-pp.vm_area_alloc
      0.60            +0.1        0.69        perf-profile.self.cycles-pp.arch_get_unmapped_area_topdown
      0.47            +0.1        0.56        perf-profile.self.cycles-pp.security_vm_enough_memory_mm
      0.52            +0.1        0.61        perf-profile.self.cycles-pp.mas_wr_store_entry
      0.49            +0.1        0.59        perf-profile.self.cycles-pp.vms_complete_munmap_vmas
      0.48            +0.1        0.58        perf-profile.self.cycles-pp.zap_pmd_range
      0.46 ±  2%      +0.1        0.57        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.22            +0.1        0.33        perf-profile.self.cycles-pp.free_pgd_range
      0.24            +0.1        0.35        perf-profile.self.cycles-pp.userfaultfd_unmap_complete
      0.84            +0.1        0.96        perf-profile.self.cycles-pp.vms_gather_munmap_vmas
      0.00            +0.1        0.12        perf-profile.self.cycles-pp.cap_mmap_addr
      0.88            +0.1        1.00        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.60 ±  3%      +0.1        0.73        perf-profile.self.cycles-pp.mas_alloc_nodes
      0.66            +0.1        0.80        perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.80            +0.1        0.94        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.66            +0.2        0.80        perf-profile.self.cycles-pp.__cond_resched
      0.81            +0.2        0.96        perf-profile.self.cycles-pp.perf_event_mmap_event
      0.97            +0.2        1.12 ±  2%  perf-profile.self.cycles-pp.perf_iterate_sb
      1.26            +0.2        1.43        perf-profile.self.cycles-pp.brk
      0.96            +0.2        1.14        perf-profile.self.cycles-pp.__vma_start_write
      2.06 ±  2%      +0.2        2.23 ±  2%  perf-profile.self.cycles-pp.mas_wr_node_store
      0.22 ±  3%      +0.2        0.40        perf-profile.self.cycles-pp.kfree
      0.98 ±  2%      +0.2        1.18        perf-profile.self.cycles-pp.mas_leaf_max_gap
      0.90            +0.2        1.10        perf-profile.self.cycles-pp.do_vmi_align_munmap
      0.96            +0.2        1.17        perf-profile.self.cycles-pp.unmap_page_range
      1.84 ±  2%      +0.2        2.07        perf-profile.self.cycles-pp.memcpy_orig
      0.17 ± 10%      +0.2        0.40 ±  2%  perf-profile.self.cycles-pp.cap_vm_enough_memory
      2.26 ±  3%      +0.3        2.52        perf-profile.self.cycles-pp.mas_pop_node
      1.52            +0.3        1.83        perf-profile.self.cycles-pp.mas_next_slot
      1.60            +0.3        1.90        perf-profile.self.cycles-pp.mas_prev_slot
      1.87            +0.3        2.21        perf-profile.self.cycles-pp.__do_sys_brk
      1.52            +0.4        1.87        perf-profile.self.cycles-pp.mas_find
      1.72            +0.4        2.07        perf-profile.self.cycles-pp.mas_wr_store_type
      2.14            +0.4        2.54        perf-profile.self.cycles-pp.kmem_cache_alloc_noprof
      2.79            +0.4        3.21        perf-profile.self.cycles-pp.clear_bhb_loop
      2.52            +0.5        3.02        perf-profile.self.cycles-pp.mas_walk
      1.29 ±  2%      +0.8        2.08        perf-profile.self.cycles-pp.kmem_cache_free
      7.06 ±  2%      +2.2        9.28 ±  3%  perf-profile.self.cycles-pp.__slab_free





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

