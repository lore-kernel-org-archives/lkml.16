Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA22F4A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744598534; cv=fail; b=FkZ4204lFuxvD84EZn7FAqxjc2iPLypNTlv9qliDnNJKCjeiesLTas7ctfllnfvvKXl1GJvEIuLSb9cZp76qgCSCwlzD6U8mD7ymWVsa5rBw2MZnm6TmTccc5ns70I4jEOoVIR/36n+IPY62ElWQSehu2A60/T/clQb6MdC5kEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744598534; c=relaxed/simple;
	bh=2s+j3br9xpkPeyRl1IFcATsfMvXo58f9KoexBhj3zCU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fzcejhZEIG8qminttdxFE+R8q17e6A38boc6hIeKT71LsSXnw74Bs2fL86XffklrmP4/LywUxokguiwqF21uKbiKK0I3LmGsNnaeMALthYZv0pWcSeoAI21xbF80UD0U1OBGzpaa0yYRV6nhAwzuboJt/JOM4zbwgb7hC+1Rcf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPl2/zDj; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPl2/zDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744598528; x=1776134528;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2s+j3br9xpkPeyRl1IFcATsfMvXo58f9KoexBhj3zCU=;
  b=nPl2/zDjAOizfBnoCS3bf/Hqwpb4npcPLJGF6uRBC4svY2B9JsfDtd/s
   su+C3mTkqncUKd0XJTtNMol+FVFCNqt7b28sIs7jgxnN7kjH1sYLjbdw4
   0dfUM5cVWGP/enznw1d8b3Bkj6W1+pR2Y7RReIg7m1+U2VZriext1nstn
   NXHAHTuEvDPUyjWdXJ7bscY1C9KEcuXxpn53H/WiWY+Ix/YbMk1Yihw+e
   vFjC9kGnDdPheOd5YJRjHQq4ic1xkgZc0wTOGF/YLZnUgrAz1yg0EWtkw
   omOx+GKTsRLr94XsUmfjWsb+KF+GlYljLGTQfirkXl2zKV6hLCbNPrQT0
   w==;
X-CSE-ConnectionGUID: 3je0tbOeSPe2EuJKxTLFYw==
X-CSE-MsgGUID: CTU1dS2dTTiquu7uT3wO6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="48756092"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="48756092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 19:42:04 -0700
X-CSE-ConnectionGUID: aNH7yGOCTzqCZ29A9rn1MQ==
X-CSE-MsgGUID: LFVgkiUkRwKpIZIdlQrZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130667902"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 19:42:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 13 Apr 2025 19:42:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 13 Apr 2025 19:42:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 13 Apr 2025 19:42:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgYAvQIz8DrVTsmZ/25SEqMKv+0Et8coXA1W342LOAfyqdqIm2X8jo/aJ6v3p9ETaoD7m0frDJn1lRPUqoQn62KpWgvpFx6eB7WpSggV+17p3PDIw9vdeEdCKa1YYbGDLDwlLbrC7jjEbI6tm3+O3GGak8hxs8MfPvo6my8wOPrSUDTGK8DuOjI1js/SKFHbi4/kYU1agmmASNHTds49n5+r9nUxxmgUDzjgYEEBfOY5w1JSydHJ1daku9iWpi0pNBf9i1Cx1nfykzTPZSmXn0yTwADRKzvZBpITFXDTm9XMU65KlSWR2ERFef7BVwWHhqOARhCoY9LDPT3Iz9HYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqBRuxMbgCnReEu7NUCr/PduqV5kBNO44XG4zAC+Wuw=;
 b=cPuNlIj+cOM1HaPWnSyJ5vQsRAn9BbxV2/F2vh3TEYL/aES56Mc+RYcVx/iGKL50H0t8lTho63uqibObXK4mtrKSf9+15i5wEIZqsPijU+vBPTbwKXjIr8AXSBo5UF57GWeishS6h2K0VctQtg6W9zrEOB3i2OdnAAqaWz5SSCIeBzcsGxgeeCz8tWAEnHSHGZ2vpUuyB1nwK+QwjVp1emUAXeRQ3bmE/sTAJgRw9mr7Fa5wvzXCHGPR+dZ9GpfcB0E5Wi3priUBBPq2t5yD2wSq/GXf4emf3xraIuf2/Sod/k35hxbW1V6KeiTT8wb+mzJZ7Sw8tkZrTDkRAfKphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 02:42:00 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 02:42:00 +0000
Date: Mon, 14 Apr 2025 10:41:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
	Shivank Garg <shivankg@amd.com>, Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@redhat.com>, David Howells <dhowells@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Hugh Dickins <hughd@google.com>, "Jann
 Horn" <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, "Jonathan
 Corbet" <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Lokesh Gidra <lokeshgidra@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mateusz Guzik
	<mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
	<mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>, Minchan Kim
	<minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Peter
 Xu" <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Shakeel Butt
	<shakeel.butt@linux.dev>, Sourav Panda <souravpanda@google.com>, Wei Yang
	<richard.weiyang@gmail.com>, Will Deacon <will@kernel.org>, Heiko Carstens
	<hca@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  3104138517:  stress-ng.mlockmany.ops_per_sec
 11.0% regression
Message-ID: <202504141016.fda72ac0-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fc867f-5e0c-461f-1654-08dd7afdedbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oMJTB9xPLVkNcNSLmZ9ilrwcfVJfYLxah1Uf1jocKUC1HMywsEiIwNHn9c?=
 =?iso-8859-1?Q?MztthqkwwaQQnsEMUDI4JOYhac0agCPr6/nRfRQzSbreP8XWWKW8mHmZ68?=
 =?iso-8859-1?Q?hJrI+pw1OE7upMo5MFxFczZmKdMw6jjpRuo2cj0DwmAK/1F/jPmghrjBFB?=
 =?iso-8859-1?Q?ehlRZwTlwJJ6418xaYPM+dfQGaPwvNip8yYG2Na4BojEWhJYLuf5iqsS4C?=
 =?iso-8859-1?Q?I/4BKuM/jO3d22JwOxw2kW/fzCuaOAnd5LcTr86qjYnFcSQKVdmEkq4e1q?=
 =?iso-8859-1?Q?xV0E7b+S5H1TSj8g3R72dwNMiK7ihf46TWji5jaLCONMoEyzrIGaimyuh+?=
 =?iso-8859-1?Q?06Xjc+k9jrri7gLBHIL1DdoFxAebZdd6K22XOzogxgSsEDCRyw8j+pGC7t?=
 =?iso-8859-1?Q?Ilo4lXzQPEJDLaUOFb5ILQCT6bN2WWfCmx/Nh+ehwJbsHr1Zbl2Z9smIli?=
 =?iso-8859-1?Q?cMAYb5mz3hrdbnIjP/x6P7DK2YVjLFnWOSrtw+xJhpTv2jMUognReuVquM?=
 =?iso-8859-1?Q?wBFIH+b7EyNDOlM2bKKWEhCW11MzZ+2Vem9rF14FtKuxf4x+o/cqA87YJ/?=
 =?iso-8859-1?Q?emxPwQy/XzCIIEeVY9BBTFKtNA5bukPmdBGIci6S9eqqynf8bEqkLbc/Uj?=
 =?iso-8859-1?Q?Yi3ZwSLEVacADix5mq5baEHGBRb3bZ5BDFcfMRjE/p6yLWLPx3x8pMf3/Q?=
 =?iso-8859-1?Q?9LtMaYE3vOiaNg/3ZpKAZWfxbGaGOGz3F77YwE/9EkU4rP9F4CP9rRecJK?=
 =?iso-8859-1?Q?26JiRBte+KqNImTaCxY4UdwQ5MdcOo3nEclHP1VtkErkIBjwUuarGBykZL?=
 =?iso-8859-1?Q?Fm+WL64NHijzoG75KHaIf1ONwoN9AoXHaKBC6CZYiyUblLA8IhmMm+dkWu?=
 =?iso-8859-1?Q?MH9hb1x60uXsuifBfO/TqXzgfiZpTfea2tFfsCiZcrjh0Mk7MusXDLZlCx?=
 =?iso-8859-1?Q?rpqDBIs84gd4pqQ9IXJ0Grvf+6jDeLm1IN0BLZkM1RqMaVXJ7fcZj7nJun?=
 =?iso-8859-1?Q?prATaXeS9CUgtlEXJ+HZbg6a3XPUHcHnwU6VsVcUhv6iwBWT95Ifh3m3Nl?=
 =?iso-8859-1?Q?QM3qywayF+pOjVqISOzHsdrXDmzCF0hIeORiU2b0du4RVB06a7tXwvpfqp?=
 =?iso-8859-1?Q?hFC1yVzqwv/UTAFFFzvh2NT9FS100F3wjnwnAmmrCRwKzS8UMJEmLw2+Pi?=
 =?iso-8859-1?Q?UHYHO2/qoBifzQS9NeQGJHDUY2jGtp1CtSYa6ssmpNod+mml2pgZLooGH7?=
 =?iso-8859-1?Q?JoEJADwEmXy197cRSSSMevhRxd5PBNsat62g/No102zy638O8gYgL1Dkf5?=
 =?iso-8859-1?Q?G0VfLIFzBfYtYk0vpsDt9dwDczrtGQ1QBiPZsTsUo6KUnFWLmXlb5cGDBy?=
 =?iso-8859-1?Q?eOmf9/9rxAG9hcuGSRZH9Xw3pp60NF8r0DDabQCapRXqrN+pXcFgKhc8QV?=
 =?iso-8859-1?Q?Fk3R9RQ/Pj2qrTFm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XGPNqJaxzeaQt6OZULL4t5wz2wATEnEdRsRtSVXyZIrOTYavjVP2TCHZKH?=
 =?iso-8859-1?Q?O409z+1WMNETGLLORmyJDqb1oD04G5VqYyEkfZyQn5ZPjNuNOHgTeN9gRW?=
 =?iso-8859-1?Q?CYWwgftlgCYxC/TvjOp+naNXA4F/21s2Exc1BfQ48XcyCtygZjVKJ83YF8?=
 =?iso-8859-1?Q?bynJ4cwYboUI7ThbInf3+Pk0bgZhmJjIF15aNvPuJOehrionnMJQ4WSbMz?=
 =?iso-8859-1?Q?HVQVwQgFfTipsOeRqWtLG33OLjdDxtQNJg7ZpEYr1g5QTOr0QMsMJDBITn?=
 =?iso-8859-1?Q?1HQ3jYVE+fdTMKczHgUTaHD+vyVDtkWwj5c7WPDfFmsveRmwkiygrQJKUu?=
 =?iso-8859-1?Q?l6Q7dmAJg+mcsirI1CH0D8KTC8X6UCa82dYovSoBxKde7Vu3RUox3dwQ4L?=
 =?iso-8859-1?Q?fV1LJrhej0WDFLbLFujeBqx/eW/zBT/lhvOhkAiQrUrX5Eetwjn2yX7KOZ?=
 =?iso-8859-1?Q?pdU/XnNsU4T+UiLf1+qX0MihwpaXVStc8Pg4/ENR760ES8tFFkpGqYZ1zs?=
 =?iso-8859-1?Q?DpYUFMS4eHE+VO79+eVKcht7dX+s++2LyYSzapFvx78Qley9xLs97lb7Vj?=
 =?iso-8859-1?Q?Wmo3bR4I5NnnMRdBWc3zcFGyEGn/g3X2f2aIMk6ifXDUIKlob3wJKXMm4m?=
 =?iso-8859-1?Q?tkjbVEYn6Fzl1x4RGPEJYue9ONb2dMm6O0SLT0vQJBlru1V7rlu9OAaWBg?=
 =?iso-8859-1?Q?F9TKr7A5euyCqVOZELTXkWO8GQMczI9Pt9Bf4BX2RAsOpJ/Xy+/ErdDtKl?=
 =?iso-8859-1?Q?2AxKgo5B1CJ5PW4j5TvOtkCo89zT/K41vp7z5L6goeWTTOfX+1OglXbqZB?=
 =?iso-8859-1?Q?MS8hRI7enPSKil86lioC7zhyqePALg9lCGE9WGd+K99RJWKw5mlOqwlxYi?=
 =?iso-8859-1?Q?Zj0yA0W9Urn4oA1Ik4KKBcnrpUtjp6YuCGd2ryk0Rghoe44OyYK7naofL3?=
 =?iso-8859-1?Q?wdpkbRg9wTph4XWni5PMM0weg2J8Zvv6BtfyPZSshbcwl8rzqcmN0YVLca?=
 =?iso-8859-1?Q?HQrPXmcTdfwOprEKuzr/Z/BXYDf48fbQuNFvtj60nbSz7MM3ICvrFYlm0z?=
 =?iso-8859-1?Q?WUeOftKVhxA25dWY/DFwHwL0u0u2jO+DaMJnFYoi9gzvXDZV3odkIewb6H?=
 =?iso-8859-1?Q?L1fAdbXpxia2MJtrtxESDOtFNX0UJ06vwiFGqRYV+psKmDVjbTKBt5yw5z?=
 =?iso-8859-1?Q?dXuFSss1PzooZcwuJkcRIPzW5PwZ4a0/+FXoJhtsa+5ZCretQ36gKkdfef?=
 =?iso-8859-1?Q?9jAGGZ4eAvDOqWh5fm6NYa4KfGQEY3/4sof7PRwJyxKnA96kE4Phg8GDTD?=
 =?iso-8859-1?Q?mpApfEueNWU8hbMwCYMevskdBBmAmGVP10M+en08Cn7DeGElNmVmXFzD1x?=
 =?iso-8859-1?Q?hE+p1rcxt9vNNABqL9lYAdCqGbtVDATP1NHf4WGPzUNO2sAhHxfyI62nxH?=
 =?iso-8859-1?Q?QTYEdbp1e8zKKFBWiyv6HWy2NJt6ivUOJL0bep4EWmY/lsYAtkJ3cIHow6?=
 =?iso-8859-1?Q?p9DrZNKLg3nJHQL93VjYPZj8Hr5gWFROaEk+iA8nSBGfIFul06B0KdoN6Y?=
 =?iso-8859-1?Q?hPR4+EfhgVkzhlMFHIIXatQG05pGpYXMl+D+nDYRFgm1pJVK7mKn1C86qn?=
 =?iso-8859-1?Q?yCzAhrwUZSaNaW5CLXOFipsJfOhD6LX4cOUPP+49k3+0eWKeD8zZa7ZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fc867f-5e0c-461f-1654-08dd7afdedbb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 02:41:59.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1erK/7ljF1cQlo3YbepP6BbrNR+CZHFbzWWFWmDI7b1zc3WNXWRpgI6/ATnlo5LaENuRIDPQ4xIXEo12s+E45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com


hi, Suren Baghdasaryan,

when this commit is still in linux-next/master, we reported
"[linux-next:master] [mm]  3104138517:  will-it-scale.per_process_ops 5.6% improvement"
as well as another two improvements in
https://lore.kernel.org/all/202503311431.6db98cb-lkp@intel.com/
(which are still listed in below details)

now on a different platform, we observed a regression in stress-ng test.

below full report FYI.


Hello,

kernel test robot noticed a 11.0% regression of stress-ng.mlockmany.ops_per_sec on:


commit: 3104138517fc66aad21f4a2487bb572e9fc2e3ec ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mlockmany
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 10.7% improvement                                     |
| test machine     | 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=process                                                                                       |
|                  | nr_task=100%                                                                                       |
|                  | test=brk1                                                                                          |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 9.5% improvement                                      |
| test machine     | 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory          |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=process                                                                                       |
|                  | nr_task=100%                                                                                       |
|                  | test=brk2                                                                                          |
+------------------+----------------------------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops 5.6% improvement                                      |
| test machine     | 104 threads 2 sockets (Skylake) with 192G memory                                                   |
| test parameters  | cpufreq_governor=performance                                                                       |
|                  | mode=process                                                                                       |
|                  | nr_task=100%                                                                                       |
|                  | test=brk1                                                                                          |
+------------------+----------------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504141016.fda72ac0-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250414/202504141016.fda72ac0-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/igk-spr-2sp2/mlockmany/stress-ng/60s

commit: 
  e49510bf00 ("mm: prepare lock_vma_under_rcu() for vma reuse possibility")
  3104138517 ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")

e49510bf00de4f83 3104138517fc66aad21f4a2487b 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.36 ±  2%      -0.0        0.33        mpstat.cpu.all.irq%
      0.37 ±  6%      +1.9        2.25 ±  5%  mpstat.cpu.all.soft%
    124294 ±  4%     +22.0%     151695 ±  4%  numa-meminfo.node0.Mlocked
    126365 ±  5%     +17.5%     148504 ±  5%  numa-meminfo.node1.Mlocked
     31755 ±  4%     +21.1%      38456 ±  3%  numa-vmstat.node0.nr_mlock
     32792 ±  4%     +15.8%      37990 ±  4%  numa-vmstat.node1.nr_mlock
   1041613           +10.5%    1151161        meminfo.AnonPages
    249799 ±  3%     +21.3%     302912 ±  2%  meminfo.Mlocked
    219096 ±  4%     +19.1%     260868 ±  4%  meminfo.PageTables
    539.58           -10.3%     484.24        vmstat.procs.r
    111498           -11.3%      98934        vmstat.system.cs
    442120            -1.8%     434311        vmstat.system.in
     30033 ± 26%     +98.9%      59746 ± 26%  sched_debug.cpu.avg_idle.min
    766348 ±  3%     -11.8%     675869 ±  6%  sched_debug.cpu.curr->pid.avg
    916942           -10.9%     816994        sched_debug.cpu.curr->pid.max
     19325           -10.4%      17317        sched_debug.cpu.nr_switches.avg
    -68.07           +72.5%    -117.40        sched_debug.cpu.nr_uninterruptible.min
   1855638           -11.0%    1651552        stress-ng.mlockmany.ops
     30922           -11.0%      27519        stress-ng.mlockmany.ops_per_sec
   3234156           -11.7%    2854796        stress-ng.time.involuntary_context_switches
 4.511e+08            -7.5%  4.172e+08        stress-ng.time.minor_page_faults
     18744            -3.2%      18139        stress-ng.time.percent_of_cpu_this_job_got
     11232            -3.3%      10864        stress-ng.time.system_time
   2671556           -10.5%    2391287        stress-ng.time.voluntary_context_switches
    262593            +9.5%     287662        proc-vmstat.nr_anon_pages
     94549            +4.8%      99098        proc-vmstat.nr_mapped
     63954 ±  3%     +18.6%      75848 ±  2%  proc-vmstat.nr_mlock
     55131 ±  4%     +15.5%      63664 ±  5%  proc-vmstat.nr_page_table_pages
    149728            +3.5%     154957        proc-vmstat.nr_slab_unreclaimable
    946324            +1.3%     958175        proc-vmstat.nr_unevictable
    946323            +1.3%     958175        proc-vmstat.nr_zone_unevictable
 4.171e+08            -7.6%  3.853e+08        proc-vmstat.numa_hit
 4.168e+08            -7.6%   3.85e+08        proc-vmstat.numa_local
 4.218e+08            -7.5%  3.901e+08        proc-vmstat.pgalloc_normal
 4.517e+08            -7.5%  4.178e+08        proc-vmstat.pgfault
 4.209e+08            -7.5%  3.893e+08        proc-vmstat.pgfree
      5.89            -4.9%       5.60        perf-stat.i.MPKI
 2.534e+10            -3.1%  2.456e+10        perf-stat.i.branch-instructions
     49.35            +0.6       49.98        perf-stat.i.cache-miss-rate%
 7.423e+08            -8.4%  6.798e+08        perf-stat.i.cache-misses
 1.502e+09            -9.6%  1.358e+09        perf-stat.i.cache-references
    116640           -11.4%     103321        perf-stat.i.context-switches
      4.36            +3.6%       4.52        perf-stat.i.cpi
     11611            +3.9%      12060        perf-stat.i.cpu-migrations
    741.12            +8.9%     807.22        perf-stat.i.cycles-between-cache-misses
 1.255e+11            -3.6%  1.209e+11        perf-stat.i.instructions
      0.23            -3.4%       0.22        perf-stat.i.ipc
     20.06 ±  2%      -9.2%      18.22 ±  3%  perf-stat.i.metric.K/sec
   1933314 ±  2%      -9.3%    1753784 ±  3%  perf-stat.i.minor-faults
   1933543 ±  2%      -9.3%    1753954 ±  3%  perf-stat.i.page-faults
      5.93            -5.0%       5.63        perf-stat.overall.MPKI
     49.44            +0.6       50.06        perf-stat.overall.cache-miss-rate%
      4.39            +3.6%       4.55        perf-stat.overall.cpi
    740.66            +9.0%     807.51        perf-stat.overall.cycles-between-cache-misses
      0.23            -3.5%       0.22        perf-stat.overall.ipc
 2.471e+10            -3.0%  2.397e+10        perf-stat.ps.branch-instructions
 7.249e+08            -8.3%  6.648e+08        perf-stat.ps.cache-misses
 1.466e+09            -9.4%  1.328e+09        perf-stat.ps.cache-references
    113888           -11.3%     101041        perf-stat.ps.context-switches
     11316            +4.0%      11773        perf-stat.ps.cpu-migrations
 1.223e+11            -3.5%   1.18e+11        perf-stat.ps.instructions
   1886915 ±  2%      -9.1%    1714730 ±  3%  perf-stat.ps.minor-faults
   1887137 ±  2%      -9.1%    1714897 ±  3%  perf-stat.ps.page-faults
      2.32           +12.9%       2.62        perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
      1.53 ±  7%     +34.6%       2.06 ±  5%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
      2.73 ±  3%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      2.89 ± 17%     +45.7%       4.22 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      4.79 ±  2%     -10.9%       4.27 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      2.26 ±  4%     +13.7%       2.57 ±  4%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      0.16 ±  6%    +294.4%       0.64 ±  9%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     50.31 ± 31%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      3.91 ± 30%    +105.1%       8.03 ± 25%  perf-sched.sch_delay.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
     10.44 ± 32%    +120.4%      23.02 ± 33%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    583782 ±  2%      -9.9%     525834 ±  3%  perf-sched.total_wait_and_delay.count.ms
      7.45 ±  2%     +10.0%       8.20 ±  2%  perf-sched.total_wait_time.average.ms
     10.65 ± 27%     +29.5%      13.79 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     10.48           +23.8%      12.96 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      3.31 ±  2%     +19.1%       3.94 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     10.31            -9.4%       9.33 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
     10.02 ±  3%     -11.7%       8.85 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
     13.21 ±  6%     +30.9%      17.29 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
     13.63 ±  4%     +15.7%      15.77 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     13.54 ±  2%     +16.8%      15.81 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.79 ±172%    +491.2%       4.68 ± 11%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     13.67 ±  4%     +16.3%      15.89 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     13.60 ±  3%     +17.3%      15.96 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     13.65 ±  2%     +15.9%      15.82 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
     13.69 ±  2%     +16.9%      16.01 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     13.61 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
     18.68 ±  3%      +9.1%      20.37 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      9.34 ±  2%     -11.7%       8.24 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     11.63           +20.2%      13.98 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
     11.71 ±  2%     +17.2%      13.72 ±  4%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
     12.70 ±  7%     +18.6%      15.06 ±  9%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.dup_mmap
     44.83 ±  5%     +20.9%      54.18 ±  5%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     21.33 ±  6%     +18.3%      25.23 ±  4%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     20538 ±  6%     -14.7%      17516 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
    103.60 ± 21%     +54.0%     159.53 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      5134 ±  3%     -20.9%       4062 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
     18824 ±  5%     -19.9%      15083 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
     34151 ±  3%     -13.7%      29483 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
    922.53 ±  6%     -20.4%     734.07 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
    942.73 ±169%    +472.6%       5398 ± 19%  perf-sched.wait_and_delay.count.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
      1243 ±  4%     -16.3%       1040 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    721.67 ±  5%     -21.4%     567.20 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      4599 ±  4%     -20.4%       3662 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.down_write.dup_mmap.dup_mm.constprop
     80.07 ± 11%     -32.9%      53.73 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_bulk_noprof.mas_dup_alloc.isra.0
     98.27 ±  8%     +28.8%     126.60 ±  8%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      8971 ±  3%     -16.6%       7481 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
      2011 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
    586.53 ±  7%     -28.0%     422.33 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
    148.07 ± 14%     +36.5%     202.13 ±  9%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      2176 ± 16%    +222.7%       7022 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    461.67 ±  9%     -27.5%     334.73 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     31345 ±  4%     -15.6%      26464 ±  6%  perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    155137 ±  2%     -10.0%     139685 ±  3%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     52597 ±  2%      -8.2%      48258 ±  3%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3541 ±  4%     -20.5%       2816 ±  6%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
     39300 ±  6%     -22.0%      30664 ±  6%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    114.82 ± 44%    +165.5%     304.83 ± 42%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     44.85 ± 11%    +172.4%     122.20 ± 75%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_bulk_noprof.mas_dup_alloc.isra.0
    156.78 ± 63%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      8.96 ±  9%     +26.1%      11.29 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      7.83 ±  2%     +32.0%      10.34 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      0.99 ±  5%     +33.7%       1.33 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
      5.09            -9.7%       4.59 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      4.84 ±  3%     -13.6%       4.18 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
     10.79 ±  6%     +34.4%      14.50 ± 14%  perf-sched.wait_time.avg.ms.__cond_resched.__vmalloc_area_node.__vmalloc_node_range_noprof.alloc_thread_stack_node.dup_task_struct
     10.86 ±  5%     +20.0%      13.03 ±  5%  perf-sched.wait_time.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     10.91 ±  2%     +20.6%      13.15 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.59 ± 92%    +345.7%       2.62 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     11.00 ±  4%     +20.4%      13.25 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     10.94 ±  3%     +21.9%      13.33 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     11.00 ±  2%     +19.7%      13.16 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
     10.99 ±  2%     +21.5%      13.35 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     10.88 ±  4%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
     18.62 ±  3%      +9.1%      20.32 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.25 ± 11%     -43.0%       2.43 ± 13%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      4.54 ±  2%     -12.6%       3.97 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      7.68           +10.9%       8.51 ±  3%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      9.37           +21.8%      11.41 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      9.40 ±  3%     +20.8%      11.36 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
     44.70 ±  5%     +20.9%      54.05 ±  5%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.55 ±  2%     +14.8%       1.78 ±  2%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     96.37 ± 58%    +214.2%     302.83 ± 43%  perf-sched.wait_time.max.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     39.02 ± 14%    +210.6%     121.21 ± 75%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_bulk_noprof.mas_dup_alloc.isra.0
    147.30 ± 71%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
     23.69 ± 13%    +476.8%     136.66 ± 79%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
     23.97 ± 10%    +437.1%     128.77 ± 36%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas


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
lkp-skl-fpga01: 104 threads 2 sockets (Skylake) with 192G memory
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





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

