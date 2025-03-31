Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC7211299
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427505; cv=fail; b=kVtaUeYrGwC8l6X42mOotqhPLS8A8L45dgE/gKK1XigYs3usJuMd8Iy/JycwE3hhTwMHZhyxk7xxLBx1lQdDDosCajwV1VdXFTMy83J2ptK13h+gtFkRG6j0wLa6ExgXopyMlDs1snHWipAv7rdUbgNmL7i2T4KgmU0Nu1uRRLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427505; c=relaxed/simple;
	bh=B5ItHvm71otNf3P/WmQR4K3jzDcHuAfOCSNWBnssyBc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=noPoKuQAO61zIX5ymyDTS4OKEePgtrRsxt0/g0krn2DmTj52n+IKrH1NFYWsTsEpv1sveQzdy9u7ACq5j2aYQxBoZRzvIio3kOyFiWtu5rcnOuv+0SvJitc9tFj6nG7tc6ZxD0Px2yTISRbeWup9NyKS+x46lbEvyOgP3/9Ru6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBfE2EIt; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBfE2EIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743427504; x=1774963504;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=B5ItHvm71otNf3P/WmQR4K3jzDcHuAfOCSNWBnssyBc=;
  b=QBfE2EItkJLDSWAKHqIe1jgTHU1/VeuTxZKG3jBpu/JdJtHNsmAafg9Q
   fVRPVSa13JjTNi13J7UHw0B+FL37NCeB0M/EdRFvBQpSBcXsvjA2lxV22
   xEPm4W1i4ZzSCbmioQMmiLeYP5BfM6lUM499GTeaiRrNtwOmIs2Ug7mZ3
   NF+BuIPWBwcxIZty56+HMeEX0ww74jO5/iKWvTwBHrMV8D2oB4zCBYuxR
   cety7aGfgz+UJLLHcQjjaI6fU6664B8Elkc/s2mzYN1US0+Advp/EizfK
   0KmtP9laDbjTn9WXHWfmx5WQvvsjUVyAckZ8fY7PLaLFcBX01oEkhQS/Q
   Q==;
X-CSE-ConnectionGUID: GCmUAdkkSmeOrg53k/NhZQ==
X-CSE-MsgGUID: 9f/jI0xcQ8OEnrG71NdjFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44845069"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44845069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 06:25:03 -0700
X-CSE-ConnectionGUID: qIqnxzcfSf+BFlilqFllcA==
X-CSE-MsgGUID: BwgnchnjTxmwHLd10kuQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125994320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 06:25:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 06:25:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 06:25:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 06:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9g0T7GUknAn0SsHI/Dcqh+BUXMD9wrax4/uZkTfsr/BAp8y9Y2lifZZmmDnNsimsS5NHg22JN+jco00mfYYo+UNGbWq4d9fNvEX4d4/SxGJEYPRgb3Qxjh4ZrfT+e4KqJNEzv6kgRfTaz5gHrLnVHGEficixfH4939fRlMYFGmzNQWWWHJdB8XOmQRBsykwBEUN39CvbH5bHIopzrfEfD+KjJI9gRgPSfCIzNafXAIaMqsy8IFYXpVU7a1I9U7VVp4IXh6O6ubw5IaXNru5pRbQJpTKU8BLvnUcycRF7OQ+wLoWwNKPoXQrMBj+/UNLezOLS66/JfG6YyImrwFo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH91vEoEtpz3O+9XwpP51f1Ycmuu91cB2cSP9rcVZpE=;
 b=nWTXdQp2RfFKVwrLrVGqhb/oENTrq32mZHRNKmTW8qKYlFOXRqxnXZpYfd4mn/4FF5+QZ2HDfo2f5aWj1EXaR91gP91WTI0NISht9dvnsfRVPSj3uka1L3byPKcZWI78FDvAr4kY18JJTjU5migegJYPY9/dT+gwyNqy8mQFKqcB4ePDGjoIRJd+1YwWD4tCcILLSXwzDgWtfuozttuppo9pIqUvDR5jcLd0Z3J67MNCsdd88C48eUhTwNsptAqXXAgerxw+UTCiIekenjS8WQ2+WhCCM3pibRwoIhaCSYehtA15rzjv85ud59+thVLl5LzdKIZeAvnIJ+qAEpTr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Mon, 31 Mar
 2025 13:24:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 13:24:40 +0000
Date: Mon, 31 Mar 2025 21:24:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Andrew Morton
	<akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Shivank Garg <shivankg@amd.com>,
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@redhat.com>,
	David Howells <dhowells@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, "Johannes
 Weiner" <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, Klara Modin
	<klarasmodin@gmail.com>, Lokesh Gidra <lokeshgidra@google.com>, Mateusz Guzik
	<mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
	<mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>, Minchan Kim
	<minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Peter
 Xu" <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sourav Panda
	<souravpanda@google.com>, Wei Yang <richard.weiyang@gmail.com>, Will Deacon
	<will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [mm]  7b6218ae12:
 stress-ng.forkheavy.ops_per_sec 5.0% improvement
Message-ID: <202503311656.e3596aaf-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4a9bc3-d5d9-47f1-3433-08dd7057647a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5r2LjNTyMJyBIEcKQ/r2o5k6jdL8h6iv+kenovpGWSKa4zC7zPClBt0Pq1?=
 =?iso-8859-1?Q?PBxMQkVanTRHqlKKuURxclJyLO1Jmob9p4vNpp6tg48CAxrC+fZBSanuKd?=
 =?iso-8859-1?Q?2TGiyc3Z66mpTouDQiLqVm+SR6GmfQndiqPmwB6RuzNgbOMXZJkF5G0AKY?=
 =?iso-8859-1?Q?eBylp5+pH1OwwH+8gVhAaO5dhWcMdaSyGlWLTZZwUkMor/t/RjtjwNKBad?=
 =?iso-8859-1?Q?kwQRTQdcEEj8+et1+e5wFIS/1MkOvr/DVmguz8mPIcToLuNxA8fEiVW93l?=
 =?iso-8859-1?Q?uy/g8IpKBYNbKpqyf0axoz9WC6kLCuh+PmzeXygmd4QFzxAW2xHOdtgFax?=
 =?iso-8859-1?Q?7wHll9laeZyfeyeSG7uDiwjIjG3tyQX90VyjEPpMpuf4MmSRoo2cOxD0r5?=
 =?iso-8859-1?Q?pB3uJD3XHEHsrjGxwtqRP/9NNRshMGvYSa6E5DmVGL6mZMwlOk5oMHVmsj?=
 =?iso-8859-1?Q?UCon0IG98rmOnPOE3PVZTAMnHlU/7E1wyDkRIrZTY1zqvXvBD4+s8rbTn4?=
 =?iso-8859-1?Q?92NCTw1D42JlmI7Ig6qg4MJSZcf+Opf+kDKVQXqbVJ+0dDI9vKrVe/PCbI?=
 =?iso-8859-1?Q?RHVCUHYfM0/+gEU+zTKlqYKhj3NjfU+0aaHfb0V095lRUMvEpUV9DuvKL9?=
 =?iso-8859-1?Q?nzXWq3VUV2cGUhHdN6AFWzIbFttgXACXVExmLZTbT5W/kzBT4dtJaQ/2Li?=
 =?iso-8859-1?Q?9SFW1nMUhVyYKaurSPYeqj1+2Zzh0fsJY5cCAaqFhsS8icQXtSiTaQfRjq?=
 =?iso-8859-1?Q?a6afbFq1sEeBGYy5NTdpLnuoxObG60EDVrBRt70fPmFcehf7hiFiAn+G9J?=
 =?iso-8859-1?Q?/y6C7pigK3CO/I2khoISgf4HaW8fjqXYv8PqoPwXmFqApVnsiloUZrxw4o?=
 =?iso-8859-1?Q?YK6i0KGwpjRM0HTRhmHIZguv3Gv3EJgOVJl63EX4GcobvWpQ9VIBdiEt9D?=
 =?iso-8859-1?Q?uVyeVh1o+58+DMvFzFM+PPMlPIXG6dk4LdDejNLE0BSkPhUexbX7Eg4ii0?=
 =?iso-8859-1?Q?GKUO2peTkv+mtcoPqKromVMix6PjWEkEvbw7hFlKutA4U5VXOnX7nKqiat?=
 =?iso-8859-1?Q?fywnlUOFHL6ir8A0RfZwzKUZ5Dh1bATB4idlhSyLHScdCsAGQIbt4BPQsL?=
 =?iso-8859-1?Q?f3Jt13+7I2xhJpEBs/ai48ZDZ83uE4G+8Q9UxvQI3A+5+j8+dTMdGcre3m?=
 =?iso-8859-1?Q?a7HQiRxB1e6gL/tq72jhuoLAnONoM0MYpGLeVC9R3V6VeDaVf6IjmQxjDM?=
 =?iso-8859-1?Q?Gw2mCPu05y9B3mLDLx9FHuT79TBuQs1wnXXu56m1Cry34mX5diE4dZ4Bty?=
 =?iso-8859-1?Q?kxi/9D8yDZyz3OrdRGagWlQzQVRhltUNoofoOgBTJPvKW7K4cZB/ez1QhM?=
 =?iso-8859-1?Q?Bxok4qswnInz38JEXi811I6qbgkDnww9il7muPk+siFchFM0083cOI0DR4?=
 =?iso-8859-1?Q?XckTqUPW+8b37AB/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BpwboCuvlXk6qV6tlraY2534ET4EXfd+53Of2jNhCWjdISfMstcu+R8jva?=
 =?iso-8859-1?Q?nn5LzSZQlBL3T6kgcj5mXDd/ldDO2QIGcSC6ETV00yNHbA7rh9XZz0Tcal?=
 =?iso-8859-1?Q?+wzSVqdo50+V3A1WFCweaC88malOUkOB4MIQj/MxOGqJySmzYxbGfeEmXH?=
 =?iso-8859-1?Q?rQqVEPeGqNVe84icnAcs1ylvXi1o13tl7j30EYWKu9xQcGCXrCtfqaLQWR?=
 =?iso-8859-1?Q?JeKBzXn74v6NtiPdvDlAFJukBdp0mNL9H607qf1fqY5jYq8cVCYiE4kFl7?=
 =?iso-8859-1?Q?f2cP2QJUdeI8LW8Jzz8Er4UM8VmqsSQ/4n/601TacLXrYGU9HUWjlkG0ie?=
 =?iso-8859-1?Q?54EsQXZz9HqyjWFZ1tJEgRamc5B2/1787QCyGRHv/lFjOay/Ul63cJ3ViS?=
 =?iso-8859-1?Q?pruOP2VeQx3FiBc3jVeZu+C5uA3uxxsks3aGvjTGOiZVaKjuwImOlQytps?=
 =?iso-8859-1?Q?S+WPWv+V5AN88FFFlcLx62L5NTiPJN9J7kOR1488Jhz43j8Cj0Z6PEU++6?=
 =?iso-8859-1?Q?fA/TuRzW6G6B68m4vTWUFByb+P7VwWn6wQ+RRRTXyEv602ZqaCXOvRa+mA?=
 =?iso-8859-1?Q?4ac9yKYNuKNk5lYBqXSvyDxFPip6f+CjHvXzXUY31uYBpDnNOhOSQ61f8G?=
 =?iso-8859-1?Q?IqBZ+FsM09S5prY87+NBlEmaLa3s9kqqECGbxtFPoUNh5PLfPfc79zbuEA?=
 =?iso-8859-1?Q?kYACqLiC7IUUvGNyEP6Ay27V6dOHCZ+TUHCvno/Nlc0QpaT50VBuq5n/3D?=
 =?iso-8859-1?Q?vgFjKIrmK2vJ5I1NwkgFiY6zWs7RujtD4IDNjtNvMnGDjMflB+G4zp9Y9o?=
 =?iso-8859-1?Q?3u6+IPS5aI2U87iS6Pg80j/YdmLjYUl3xb58KbAAIhK6vpxM7I65Gc1Ivf?=
 =?iso-8859-1?Q?gGWiLETUhYoEDq6GVPAIUGmOcseJYREYAgIPKHjQ6XaRjG3OHmija4o3ux?=
 =?iso-8859-1?Q?td6OPKxj0ceAXXRxbQImik72cJzUQxC16Wv2UMBeUrvblKi4Kp4LPTcMvZ?=
 =?iso-8859-1?Q?43Uu6s4hoiIaLeoHxK+tUaPToaqlCvZlt0a7C3CnHH6RY3LaRm76B35o7o?=
 =?iso-8859-1?Q?EUHNMGf5zlnVhN9xtQZ35qO6vopYctKX/tkZzfG2EMLnlj8ovt1FZQ75CD?=
 =?iso-8859-1?Q?B1Ek+yvDObxn7GCBwYySnSBd31bmRI7C46tS+VbD4rskvw8m+17EmXXur4?=
 =?iso-8859-1?Q?BF6TA6BNl/NlMOLQv7vZapgOjyVessrxxU8e5PvzbcevABmQIRRHy0txzM?=
 =?iso-8859-1?Q?taqEBv1H6GMOU1XGTuHEtegpsC/IpIzBcUtK3o0i6KOErhXjdaC0sdL/nk?=
 =?iso-8859-1?Q?bmtM3THpbFukYcHmLg48y5OsSuohUXRDokzgevJVOdsnYxpBRA1mElHCea?=
 =?iso-8859-1?Q?cLu/C/JPVYVkJj7u5yUyaBmYMy/IULehQrhbcors+LQNP5evmQAAhZsOwT?=
 =?iso-8859-1?Q?PunM/xAHVhEgK/Rj+vkRoJH7c4XJLxRPB2QCekBV8WlYFzgy8Fdnm4Gcj9?=
 =?iso-8859-1?Q?5DXY/5wkXyGuQjF+IKBOU5dqu2PudV/iH8vBWMidKmIHtzwN/BzpXYmoZu?=
 =?iso-8859-1?Q?ki5tkA8Q/CwJNuNfziFAAvdFgBYbl9IlQRWdkh/ulfze/xfmvGa//X/Rzp?=
 =?iso-8859-1?Q?CyLYdi2D2bSDNMugyKVENPmPAQ2Nii85JJRHDJQJ9Nx6ERWoTGquHrew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4a9bc3-d5d9-47f1-3433-08dd7057647a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 13:24:40.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIGK48p3MVevMwa8GN/yRIB/5VmeaVhWaGcMBYxMD2DajUvsxufAH6hCHoMGi/nyzCEfuQGp6q9aOUg4UO7Z6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 5.0% improvement of stress-ng.forkheavy.ops_per_sec on:


commit: 7b6218ae1253491d56f21f4b1f3609f3dd873600 ("mm: move per-vma lock into vm_area_struct")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: forkheavy
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250331/202503311656.e3596aaf-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/igk-spr-2sp1/forkheavy/stress-ng/60s

commit: 
  b2ae5fccb8 ("mm: introduce vma_start_read_locked{_nested} helpers")
  7b6218ae12 ("mm: move per-vma lock into vm_area_struct")

b2ae5fccb8c0ec21 7b6218ae1253491d56f21f4b1f3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    382800 ±  4%     +10.2%     421797 ±  5%  numa-meminfo.node1.AnonHugePages
     32850            +5.0%      34492        stress-ng.forkheavy.ops
    493.66            +5.0%     518.50        stress-ng.forkheavy.ops_per_sec
     40.74 ± 30%     +68.2%      68.53 ± 23%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
     73.19 ± 42%     +52.2%     111.39 ± 16%  sched_debug.cfs_rq:/.util_est.avg
    222.12 ± 29%     +34.4%     298.62 ± 10%  sched_debug.cfs_rq:/.util_est.stddev
      4555 ± 10%     -45.3%       2491 ± 27%  perf-c2c.DRAM.local
     11750 ±  4%     -22.7%       9082 ± 22%  perf-c2c.HITM.local
      2592 ±  6%     -45.4%       1414 ± 23%  perf-c2c.HITM.remote
     14342 ±  4%     -26.8%      10497 ± 22%  perf-c2c.HITM.total
  41336771            -4.4%   39526485        proc-vmstat.numa_hit
  41134683            -4.4%   39326465        proc-vmstat.numa_local
  71479761            +1.8%   72742225        proc-vmstat.pgalloc_normal
   3480841            +2.4%    3564757        proc-vmstat.pgfault
  71044889            +1.7%   72274310        proc-vmstat.pgfree
      1.47 ± 86%     -73.5%       0.39 ±138%  perf-sched.sch_delay.avg.ms.__cond_resched.do_ftruncate.do_sys_ftruncate.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.33 ±108%    +205.7%       1.00 ± 83%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.do_mq_open.__x64_sys_mq_open.do_syscall_64
      0.77 ± 25%     +43.6%       1.10 ± 21%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.vfs_tmpfile.path_openat.do_filp_open
      0.16 ± 17%     +44.7%       0.23 ± 26%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.58 ± 85%     -85.8%       0.08 ±130%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      3.92 ± 72%     -80.6%       0.76 ±198%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      6.96 ± 55%    +113.7%      14.88 ± 28%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     62.68 ± 72%    +129.9%     144.11 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    334.97 ± 57%     -66.4%     112.42 ± 70%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     82.80 ± 23%     +73.9%     143.96 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.15 ± 43%     -72.2%       0.60 ± 94%  perf-sched.wait_time.avg.ms.__cond_resched.unmap_vmas.unmap_region.__mmap_new_vma.__mmap_region
     68.44 ±135%    +288.8%     266.12 ±121%  perf-sched.wait_time.max.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.drm_atomic_helper_commit_planes
     15.31            +8.9%      16.67 ±  2%  perf-stat.i.MPKI
 1.684e+10            -3.9%  1.618e+10        perf-stat.i.branch-instructions
  75533943            -4.7%   72015903        perf-stat.i.branch-misses
      6.71            +5.6%       7.09        perf-stat.i.cpi
  8.19e+10            -5.7%  7.726e+10        perf-stat.i.instructions
      0.16            -4.9%       0.15        perf-stat.i.ipc
     16.72            +7.0%      17.90        perf-stat.overall.MPKI
      6.53            +6.2%       6.94        perf-stat.overall.cpi
      0.15            -5.9%       0.14        perf-stat.overall.ipc
  1.66e+10            -4.2%   1.59e+10        perf-stat.ps.branch-instructions
  73765712            -5.4%   69811938        perf-stat.ps.branch-misses
 8.092e+10            -5.9%  7.612e+10        perf-stat.ps.instructions
  5.53e+12            -5.5%  5.227e+12        perf-stat.total.instructions




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

