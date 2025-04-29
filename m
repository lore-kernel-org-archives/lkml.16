Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916082147E4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931493; cv=fail; b=Mb9Guq86atIGX2nVTzGOYYHiFIqiJWgG/pKF5dRgCel1HzsC0LdLBD6bF6J8muktELmC2Sn8D644m87IRi51lC2rm0F5r2Lpmr2+k3X+nGbmkQZ4baaUN+/AqNYOJDHVnHRRua/EnDTrhl1TqXn2c8n8hGViMff7s4K08Zk0bcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931493; c=relaxed/simple;
	bh=BAmjkNwnC/nYAkfv8BIAk9c9kgynMoTX7uYNq7Ap+ME=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FB5M8wgKjQCe9AtqiiFr936E2G7GhbzUaszkpHuF23fOjLrjjiv16LNrEwjZtG/P6Y/wmBuVBYuQM0uT5IdPCj/S8q9dJuObddXbbfMn7PP2dhm501w3w3hdRU1/WnR6cWfd9oIZKe+iMBx0Tkz6sSKbWc7I/XJqbr34jr49MM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C//bRfTh; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C//bRfTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745931491; x=1777467491;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BAmjkNwnC/nYAkfv8BIAk9c9kgynMoTX7uYNq7Ap+ME=;
  b=C//bRfTh4qnThe/P4DZzER6N37cm1VyMZrtdqocuqPYi3sRmAwhq7D8A
   H57muyKg01chq3Pn5V2uR28+r5qAp2BYrg2hLwseiRc6/hP0hE8QzOKMt
   ZnzHzarnc/CIvLkjoAFaHqe8Ne6p6EUhvNTbWuAuAPqo2lLmrS1mlNTeV
   wui577ekOb4d5I79H7U4K6rKZiFe0e+nyIt9U5GRF8kN2rv5xIiVlR+Lj
   fi6mLEO1RjWyO+WMuB0CV4N9i0vicdT1oy7s/vtJ2Wbe4PXGYQEm4UriN
   FyMnSK7PsDLfULX2Q9lLDyTbLWDYK7SasKDr2kwAspTqTvya4Q1f/2JLJ
   w==;
X-CSE-ConnectionGUID: ziQLx2ipSQKlz8S2om3UMw==
X-CSE-MsgGUID: Wz6CDS9sTbSGJULtS+YDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58208140"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58208140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:58:09 -0700
X-CSE-ConnectionGUID: Bh/S9umOQO6/SyKviyr7Fw==
X-CSE-MsgGUID: tBHlVzJMS4uUosjuQUNmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138626614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 05:58:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 05:58:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 05:58:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 05:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2CTw48xF/nVowF2YYxvEPm58mQJKp/vN9HnrGd37F71VMOrBllhnKcReg67ELvFsFwWqKdvjkAQCWG+qtPvtSULhJ+Sza5lCpwKehin35YxgtBZTI6ezlk/Y7b9NDpAeylg/t6dPgiyqf+cPMQCm6vwf3dTMltld3ui+nZprNFHyBJgWetPiU705BmDuMXr2lRyocDcP1CjpkizR+kVmdYHtsX/KJ3m7feAMIGZ0fnydjchQc7dvpb/hj2CabMvE1NN+TThQjm92Jpdo4jgQFG2lQN5TnSI8/SMdnxMFQ55AIE1z3MRgy72urDvBrA6oldZgKfWdvhOQgVIMGgI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmNyPG4gs0eoGiIjTMQfpBmrgskq9LnHK2yP2GLUois=;
 b=QWW+6K8+my/74KuZ5+KcCuQAPpcVZup+MazEkPtREA+otQLRZFHaun+/yrizcxo2ht5vTiwWFwPQQTKl2MiM7xxD//SPV6707YqKeqnusnZQksfcFGzonPp8m+HfPyPCvewlw77YUi9BEPc7qI2OQulocPNnxdv32r7sx/SJzHDZbeuYCL02CILlwNl/y3rw+kuTgShCyxe5L92Sp68h0G7n4DRDtuZN5XcFtZzhESdvVEdRP+lPjAeCgIOwPcUUCb3D7OBvawdws1P4zKKbUBPmKuADCj2fHvEdlUIcc52Wl/hMm3Uc1Xgkbo9/lx5pAw3CcZm5UqE+6wN2IakFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 12:57:25 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 12:57:25 +0000
Message-ID: <2225c999-8d06-40a9-9d55-76d2cfabacb8@intel.com>
Date: Tue, 29 Apr 2025 20:57:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] sched: Introduce Cache aware scheduling
To: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>, Ingo Molnar <mingo@redhat.com>, Len Brown
	<len.brown@intel.com>
References: <cover.1745199017.git.yu.c.chen@intel.com>
 <7c5fcd32-1f0f-4148-ab0e-0a25ea11c10f@amd.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <7c5fcd32-1f0f-4148-ab0e-0a25ea11c10f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0089.apcprd02.prod.outlook.com
 (2603:1096:4:90::29) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH3PPFD9C09B4A7:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2c8649-3832-4b22-2688-08dd871d63b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFhBZHhIOTFiTC9xdFVvbXFYREtydUM2clJKUG93em4renRnd1ArVVUwMmFm?=
 =?utf-8?B?TzY2NkMzR2hoSytZMjNhZURHR20rMlY0dWRzUW96WHFyaE9oSTZHVmxIOHpp?=
 =?utf-8?B?MktVSTZwbURTb3JCejhpQzAxZkhjbHdnd0lYZUFqSWFrazNrV2pURFZSNEdi?=
 =?utf-8?B?MTkwS0dhUzRsRHc3WEdXZ1lNWjRMRnhqZ0NUd3RJdXNFd2d4U1R5SkNka1Q5?=
 =?utf-8?B?MGh2anY0cU1tU1pJcmoyZlJTOC9TNWtUbDNRc3NLMGFTS3lid29TQ3c4Y01y?=
 =?utf-8?B?R0J4ejNHdzZuWjVOOXF3R293YVhBdVhGUGZpN2Q5ZGhVZkJxL21xRXFuV3R2?=
 =?utf-8?B?aC9PS3hQblBHTml5K250NlNzVWxpazZaM1p4SEhyTlpIYlFDUEtsSFlNb2Zi?=
 =?utf-8?B?L3k3Qko1MFhKd25id2tLWkJ4QWQxQlJuNisvQVhNT3d0ODM1ckJFM2NnQWtT?=
 =?utf-8?B?NjJuVFZxUFlDYjJVeWxob1VyZ0ZOOWZhcUVQTktqZk5MVWdvVzBWNGttdnls?=
 =?utf-8?B?Ky9lenJCOFZyK005cTFjaVUwRXZzUE5qQjI5ZUFPM3RIZHNSYlpHU1NiRzZk?=
 =?utf-8?B?SGc3Y3llaTI4RTlhZ0ZPWHg4dWZLVjlveEpJOTJZWFRKaVVmdURxY1QrWlFQ?=
 =?utf-8?B?R1Q3QnBqRWZQN1lUczgwOThka2NicWpRakVFSFhyYldjUERlSXcrMHJFcDE4?=
 =?utf-8?B?dzU1UWUxR0lHbmxXZ2VRdmFma1gycXhiUUdiejJhWndVY01MYlVVZGZTT08z?=
 =?utf-8?B?S2Focy9CUWNBYm9hdWJHeFdhYkpHQ3N4QkFYMll2SXZkSldRM0p2NzIrdUZn?=
 =?utf-8?B?VXl4Z2pqbmd6WTRtYU10aXdaaFhpdEZQb3dlUGdFNk44dDMrdUN4ekpnYm1B?=
 =?utf-8?B?WWQyZ1hYa1c0NlZ1QU8yTDhiOVhFOHVpditOMlg0T09YQlRIbDNvL1Y5ZFpy?=
 =?utf-8?B?d3ZrRkVwa3d3d25vQUxOLzBvenVhVlppTUg1Ymhnem00RXh1TmxxM2s2OHVG?=
 =?utf-8?B?WXZrcmpUa3krajR4QXVETWVOMEFkbE52WVBETjQ2ZlNraEg0Z09oZXpmcVc5?=
 =?utf-8?B?ZUFBZ1R2emhQdzVlRk5lQmF3eTU5c2ZZSVdmVHVPanpvSVpoSTYyV3dMZXhy?=
 =?utf-8?B?bDlxUWkwU3czMmsyT1FoTmNVU3Qyd05DNGRjUHZwRGtEWmlsY3NmMkxHZlZC?=
 =?utf-8?B?c2FSN0xwRFQ0ZDhRd3htbEQwY2xsZkJRWXMzUVFXVHVLbG9nVWVQd09TS3k4?=
 =?utf-8?B?K2cxWFY1R3JyM3kyMmZQQmMzbURYZTZWcGhnVTRCZTNSS1FmWi82bndzQW9K?=
 =?utf-8?B?eFBsUFNtbm52N2xhazN6bU5rcUxId24zenFyVm5uV0RXRi85am9lNmszczlT?=
 =?utf-8?B?YUlpMTVoSDkvOWdPZVNpaDNHelhoYkIveWh6bzZqUkc3a01ZbHVKUGgrLzBJ?=
 =?utf-8?B?SU1sVVhxaEhSSnFmT0lscDUvSGdvZmNvMDI1Z3pUa2R0aVF2T1hwdzh0YklD?=
 =?utf-8?B?Q0MzMkNXaVMyS1lneHlST3kxWTV6akNQOXBQVmtrdGJjd2lCWmlJMFdsTmZo?=
 =?utf-8?B?Qmd3ejBpQVdrekJEajg4MENsZFJNV3JFRmR6NUpmMSsvczArUU5QaTlKdVli?=
 =?utf-8?B?dTNHVzA3QU9SVFUzT09lL1ZMRnlRVUJMSFkwZDJjbkljL1dPYXp1SmhYSWoy?=
 =?utf-8?B?dFJQWEdvYXF5Y0U3dGc5eWs3eE9sbEwyN1VtZVpSZUhIRnh6eE9SSFNiT2pm?=
 =?utf-8?B?U2duNEdRQm84Ti8ySGp0ZjVzdHREalJEc0U4aVVTUnhsLzA5UzczWlVLTVZz?=
 =?utf-8?B?N3pIaUJzSWV0b2FHWDYxdU1aYVdzbHhZZ2RWWUJRais0QVVsU1VaRk5ob2RF?=
 =?utf-8?B?anZUeEhIQWYxZXd6MEJiSUVBalQ3ZFVTWjR2S29yM1BSc29mQmVVUzZocVZi?=
 =?utf-8?Q?X3dOmbvADGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck5HL3hnemtzMyttS3lMdklkUTJnMnFsdC9pMnNuay9vbFhDZFpXam5MRldl?=
 =?utf-8?B?V1FnUGdDSG9xTDhqa1l0bEhOalpmVUpmN0FPZEFLakg4bGh2VVVreVlsS3U5?=
 =?utf-8?B?alJuZTN2b2gyU1NZTDQ2dUZWby9rUWxUWkFXcTJzSnJWVXQvSksyTVJuQlMw?=
 =?utf-8?B?ZlRoV01TdnNDNEFKSmJ3a3kxVUoxbElyUGU4TlBubGcwR250c1RKNmIydGIx?=
 =?utf-8?B?QVZkUzdWcUVsNnlES0p1dG1ZTlM1SVhmZkk1M0RtNmJEUU1xYW03bFYwZSto?=
 =?utf-8?B?MTJQRWtaRDFyYjJPSXJlSDJTQ2s3NTc1VW5rQ2RkQ0w0UXAvT2FCcDNqNFB4?=
 =?utf-8?B?ZkF3THJ4Y2tUM2RzWnc5ZjF4M2prbFZyQmtCdXAvUDdIYWQ2YkNjWEx1YWZ6?=
 =?utf-8?B?T2RNOUNKQnREY2RmNkVHVldwUnozYVRYakRteVhBOCtjcHhpT0NGcWhPaUIx?=
 =?utf-8?B?TjRSQTNnS2l5N0g5SnBOTTBsSmxuMU9IRE5kc1BZUFpzVVlKV3ZzYVBxNXpS?=
 =?utf-8?B?KzdnSEdCSW5qZTBEZUNUdXRwUkdTZ2pIdUkvK0xHN3prd1A3OUJOUDZCcUJm?=
 =?utf-8?B?WHRQSEJEajZVOHRFVUNiaVZJT0xNMTN1cnA1R3hrdXVycEwrRVB2Uzl1Z0xs?=
 =?utf-8?B?Zk45OG1PWTNXMS80bHhyeE0rcGN1SzBvSVNoLzNwVHh1akV3bFRCRThPVXlB?=
 =?utf-8?B?T0Y5MmN4TnlqM3UxaHBGUDB5b1p5b0JNVUw3TStUVVBDbkh4eEdWVE8zQ08x?=
 =?utf-8?B?TzJ4ZkYvTHNQR0VSSzZoaGdXV1hrMGNYZWhwYWx2S0dLMW92b2VhazFUblZ6?=
 =?utf-8?B?ZXdGUy9ub3N4QTV2V2dodUZLUkdRKzZkRFlSQi9XVkloT2ZXbnVnQnhITFh3?=
 =?utf-8?B?S0ltaTIxMDJFSkVpbmRrbmRvOFZzUDFEZmhpYUZxNVJuQ0Q5a09CVitJQldx?=
 =?utf-8?B?TG5hdjMzYlphR2tScTBaRVVManFnNW82QmdieWdETllRSThJcDBPaTE2Q1hu?=
 =?utf-8?B?S3FnYjlTSmhFQ2k0K2tVbksxNjhjNjExak5jWjRXdnduMytadW5xb0pEbE9j?=
 =?utf-8?B?dHM0S0lreWQ2d05aNHI2ZHNucU9TTC9aU3dFYzdzamp6ck9scVRvdWZHK05L?=
 =?utf-8?B?M0YvOUpZZjBwVnZ5Yy9VUU1PaG5BN1BWdUtBLy9ocE9SZjZGaGJQQmJTdDBQ?=
 =?utf-8?B?WmdvakZRNnRiU0UxbHorOG52Q2FJZTlSWlA0ek5TeEUveU80OXlJK0kyNCsr?=
 =?utf-8?B?RUhibFNOMndpMVhUdm8vQWhJeWloM0VlM2hmMngxVGpyR2E4SC8xNFcwdnVU?=
 =?utf-8?B?WTl6aTBGNTNVNzF2MEdlRlk0TFdQT2RXNnlRK0k1KzdtQnM2dVFhMU83TmFC?=
 =?utf-8?B?NlR4NERRK09RT293d0IyMWJhb0txSTYvTnQrL3hlczJadHJ5YVNtbGo0UTRv?=
 =?utf-8?B?bitIUThnVjBCa0dsZnRiN0JsNGk1T3kwRHlUU2NEblZXY3Z1Rk1QZWtlZlBP?=
 =?utf-8?B?SVVGZWFFRzdlNXd2L3J6QVFDdUJ5Qll5UTBxT1YyNk1yVElRNmhlOHJha2R3?=
 =?utf-8?B?YnJNTnBqcEF3Q0Q4R3lXL0RmZ0lDRVoxeE85ZWJLSXAyMkhYQkNHdGZmTDJo?=
 =?utf-8?B?d3BwY29ZSDN3LzhrNStFQmZwNmRNRmVuTVlsYytDSEVhYWgrenBlckNSRjk2?=
 =?utf-8?B?c0NvRW91b0k1NFJwRTlTTVFKcW9LNzQyNzByRDlWNVRYcGhVYnlwS045Ly8x?=
 =?utf-8?B?QXRRa1ZNMlkxdFJZYlZOSUZhdEplcEJ3YWx0Q3pJOGhVZklJSGVNY0VFRS8x?=
 =?utf-8?B?T0VIRDYyNWZUTXNrVnZNM0d4aXRQaVRYdjFrV2JISzdvRkdTdEl1R2FKS1Ja?=
 =?utf-8?B?enFOZmNCc2NweFZGWld6SGRHOGozTFkzQ2hnZklYRm55LzBadHpBTlcyM1F2?=
 =?utf-8?B?eU4rRmxDYmRjdWRYeDR2d0N0c0VNcElSc3ZYcEZkb1Z6ZmhqQmNvOTNObUsw?=
 =?utf-8?B?Rjc5NEV4cEtnaVZXcWNUNFE4cUxvSzZPMUt4djVqeGg1ZE9hSHNzRnF4NFQw?=
 =?utf-8?B?Y01HVG9Ca2hqRmVyMGxGV1g0cDZoMkplS05GTVd0OEF6WCtIb056aGdSOUJw?=
 =?utf-8?Q?PMvykwUPeiLaDvHnw2nN7zpPj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2c8649-3832-4b22-2688-08dd871d63b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:57:25.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwmzFawMfPP3E6igCjDRulw6lpA/F4c1MdK0U/5kbM4DHYQSuYL2gkmHM+PQyKExwqwOtt+YLzfhnChtivJEyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
X-OriginatorOrg: intel.com

Hi Prateek,

On 4/29/2025 11:47 AM, K Prateek Nayak wrote:
> Hello Chenyu,
> 
> On 4/21/2025 8:53 AM, Chen Yu wrote:
>> This is a respin of the cache-aware scheduling proposed by Peter[1].
>> In this patch set, some known issues in [1] were addressed, and the 
>> performance
>> regression was investigated and mitigated.
>>
>> Cache-aware scheduling aims to aggregate tasks with potential shared 
>> resources
>> into the same cache domain. This approach enhances cache locality, 
>> thereby optimizing
>> system performance by reducing cache misses and improving data access 
>> efficiency.
>>
>> In the current implementation, threads within the same process are 
>> considered as
>> entities that potentially share resources. Cache-aware scheduling 
>> monitors the CPU
>> occupancy of each cache domain for every process. Based on this 
>> monitoring, it endeavors
>> to migrate threads within a given process to its cache-hot domains, 
>> with the goal of
>> maximizing cache locality.
>>
>> Patch 1 constitutes the fundamental cache-aware scheduling. It is the 
>> same patch as [1].
>> Patch 2 comprises a series of fixes for Patch 1, including compiling 
>> warnings and functional
>> fixes.
>> Patch 3 fixes performance degradation that arise from excessive task 
>> migrations within the
>> preferred LLC domain.
>> Patch 4 further alleviates performance regressions when the preferred 
>> LLC becomes saturated.
>> Patch 5 introduces ftrace events, which is used to track task 
>> migrations triggered by wakeup
>> and load balancer. This addition facilitate performance regression 
>> analysis.
>>
>> The patch set is applied on top of v6.14 sched/core,
>> commit 4ba7518327c6 ("sched/debug: Print the local group's 
>> asym_prefer_cpu")
>>
> 
> Thank you for working on this! I have been a bit preoccupied but I
> promise to look into the regressions I've reported below sometime
> this week and report back soon on what seems to make them unhappy.
> 

Thanks for your time on this testings.

> tl;dr
> 
> o Most regressions aren't as severe as v1 thanks to all the work
>    from you and Abel.
> 
> o I too see schbench regress in fully loaded cases but the old
>    schbench tail latencies improve when #threads < #CPUs in LLC
> 
> o There is a consistent regression in tbench - what I presume is
>    happening there is all threads of "tbench_srv" share an mm and
>    and all the tbench clients share an mm but for best performance,
>    the wakeups between client and server must be local (same core /
>    same LLC) but either the cost of additional search build up or
>    the clients get co-located as one set of entities and the
>    servers get colocated as another set of entities leading to
>    mostly remote wakeups.

This is a good point. If A and B are both multi-threaded processes,
and A interacts with B frequently, we should not only consider
aggregating the threads within A and B, but also placing A and
B together. I'm not sure if WF_SYNC is carried along and takes
effect during the tbench socket wakeup process. I'll also try
tbench/netperf testings.

> 
>    Not too sure if netperf has similar architecture as tbench but
>    that too sees a regression.
> 
> o Longer running benchmarks see a regression. Still not sure if
>    this is because of additional search or something else.
> 
> I'll leave the full results below:
> 
> o Machine details
> 
> - 3rd Generation EPYC System
> - 2 sockets each with 64C/128T
> - NPS1 (Each socket is a NUMA node)

> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
> 
> o Benchmark results
> 
>    ==================================================================
>    Test          : hackbench
>    Units         : Normalized time in seconds
>    Interpretation: Lower is better
>    Statistic     : AMean
>    ==================================================================
>    Case:           tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>     1-groups     1.00 [ -0.00]( 9.02)     1.03 [ -3.38](11.44)
>     2-groups     1.00 [ -0.00]( 6.86)     0.98 [  2.20]( 6.61)
>     4-groups     1.00 [ -0.00]( 2.73)     1.00 [  0.42]( 4.00)
>     8-groups     1.00 [ -0.00]( 1.21)     1.04 [ -4.00]( 5.59)
>    16-groups     1.00 [ -0.00]( 0.97)     1.01 [ -0.52]( 2.12)
> 
> 
>    ==================================================================
>    Test          : tbench
>    Units         : Normalized throughput
>    Interpretation: Higher is better
>    Statistic     : AMean
>    ==================================================================
>    Clients:    tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>        1     1.00 [  0.00]( 0.67)     0.96 [ -3.95]( 0.55)
>        2     1.00 [  0.00]( 0.85)     0.98 [ -1.69]( 0.65)
>        4     1.00 [  0.00]( 0.52)     0.96 [ -3.68]( 0.09)
>        8     1.00 [  0.00]( 0.92)     0.96 [ -4.06]( 0.43)
>       16     1.00 [  0.00]( 1.01)     0.95 [ -5.19]( 1.65)
>       32     1.00 [  0.00]( 1.35)     0.95 [ -4.79]( 0.29)
>       64     1.00 [  0.00]( 1.22)     0.94 [ -6.49]( 1.46)
>      128     1.00 [  0.00]( 2.39)     0.92 [ -7.61]( 1.41)
>      256     1.00 [  0.00]( 1.83)     0.92 [ -8.24]( 0.35)
>      512     1.00 [  0.00]( 0.17)     0.93 [ -7.08]( 0.22)
>     1024     1.00 [  0.00]( 0.31)     0.91 [ -8.57]( 0.29)
> 
> 
>    ==================================================================
>    Test          : stream-10
>    Units         : Normalized Bandwidth, MB/s
>    Interpretation: Higher is better
>    Statistic     : HMean
>    ==================================================================
>    Test:       tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>     Copy     1.00 [  0.00]( 8.24)     1.03 [  2.66]( 6.15)
>    Scale     1.00 [  0.00]( 5.62)     0.99 [ -1.43]( 6.32)
>      Add     1.00 [  0.00]( 6.18)     0.97 [ -3.12]( 5.70)
>    Triad     1.00 [  0.00]( 5.29)     1.01 [  1.31]( 3.82)
> 
> 
>    ==================================================================
>    Test          : stream-100
>    Units         : Normalized Bandwidth, MB/s
>    Interpretation: Higher is better
>    Statistic     : HMean
>    ==================================================================
>    Test:       tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>     Copy     1.00 [  0.00]( 2.92)     0.99 [ -1.47]( 5.02)
>    Scale     1.00 [  0.00]( 4.80)     0.98 [ -2.08]( 5.53)
>      Add     1.00 [  0.00]( 4.35)     0.98 [ -1.85]( 4.26)
>    Triad     1.00 [  0.00]( 2.30)     0.99 [ -0.84]( 1.83)
> 
> 
>    ==================================================================
>    Test          : netperf
>    Units         : Normalized Througput
>    Interpretation: Higher is better
>    Statistic     : AMean
>    ==================================================================
>    Clients:         tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>     1-clients     1.00 [  0.00]( 0.17)     0.97 [ -2.55]( 0.50)
>     2-clients     1.00 [  0.00]( 0.77)     0.97 [ -2.52]( 0.20)
>     4-clients     1.00 [  0.00]( 0.93)     0.97 [ -3.30]( 0.54)
>     8-clients     1.00 [  0.00]( 0.87)     0.96 [ -3.98]( 1.19)
>    16-clients     1.00 [  0.00]( 1.15)     0.96 [ -4.16]( 1.06)
>    32-clients     1.00 [  0.00]( 1.00)     0.95 [ -5.47]( 0.96)
>    64-clients     1.00 [  0.00]( 1.37)     0.94 [ -5.75]( 1.64)
>    128-clients    1.00 [  0.00]( 0.99)     0.92 [ -8.50]( 1.49)
>    256-clients    1.00 [  0.00]( 3.23)     0.90 [-10.22]( 2.86)
>    512-clients    1.00 [  0.00](58.43)     0.90 [-10.28](47.59)
> 
> 
>    ==================================================================
>    Test          : schbench
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>      1     1.00 [ -0.00]( 5.59)     0.55 [ 45.00](11.17)
>      2     1.00 [ -0.00](14.29)     0.52 [ 47.62]( 7.53)
>      4     1.00 [ -0.00]( 1.24)     0.57 [ 42.55]( 5.73)
>      8     1.00 [ -0.00](11.16)     1.06 [ -6.12]( 2.92)
>     16     1.00 [ -0.00]( 6.81)     1.12 [-12.28](11.09)
>     32     1.00 [ -0.00]( 6.99)     1.05 [ -5.26](12.48)
>     64     1.00 [ -0.00]( 6.00)     0.96 [  4.21](18.31)
>    128     1.00 [ -0.00]( 3.26)     1.63 [-62.84](36.71)
>    256     1.00 [ -0.00](19.29)     0.97 [  3.25]( 4.94)
>    512     1.00 [ -0.00]( 1.48)     1.05 [ -4.71]( 5.11)
> 
> 
>    ==================================================================
>    Test          : new-schbench-requests-per-second
>    Units         : Normalized Requests per second
>    Interpretation: Higher is better
>    Statistic     : Median
>    ==================================================================
>    #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>      1     1.00 [  0.00]( 0.00)     0.95 [ -4.99]( 0.48)
>      2     1.00 [  0.00]( 0.26)     0.96 [ -3.82]( 0.55)
>      4     1.00 [  0.00]( 0.15)     0.95 [ -4.96]( 0.27)
>      8     1.00 [  0.00]( 0.15)     0.99 [ -0.58]( 0.00)
>     16     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.15)
>     32     1.00 [  0.00]( 4.88)     1.04 [  4.27]( 2.42)
>     64     1.00 [  0.00]( 5.57)     0.87 [-13.10](11.51)
>    128     1.00 [  0.00]( 0.34)     0.97 [ -3.13]( 0.58)
>    256     1.00 [  0.00]( 1.95)     1.02 [  1.83]( 0.15)
>    512     1.00 [  0.00]( 0.44)     1.00 [  0.48]( 0.12)
> 
> 
>    ==================================================================
>    Test          : new-schbench-wakeup-latency
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>      1     1.00 [ -0.00]( 4.19)     1.00 [ -0.00](14.91)
>      2     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 0.00)
>      4     1.00 [ -0.00]( 8.91)     0.80 [ 20.00]( 4.43)
>      8     1.00 [ -0.00]( 7.45)     1.00 [ -0.00]( 7.45)
>     16     1.00 [ -0.00]( 4.08)     1.00 [ -0.00](10.79)
>     32     1.00 [ -0.00](16.90)     0.93 [  6.67](10.00)
>     64     1.00 [ -0.00]( 9.11)     1.12 [-12.50]( 0.00)
>    128     1.00 [ -0.00]( 7.05)     2.43 [-142.86](24.47)

OK, this was what I saw too. I'm looking into this.

>    256     1.00 [ -0.00]( 4.32)     1.02 [ -2.34]( 1.20)
>    512     1.00 [ -0.00]( 0.35)     1.01 [ -0.77]( 0.40)
> 
> 
>    ==================================================================
>    Test          : new-schbench-request-latency
>    Units         : Normalized 99th percentile latency in us
>    Interpretation: Lower is better
>    Statistic     : Median
>    ==================================================================
>    #workers: tip[pct imp](CV)    cache_aware_lb[pct imp](CV)
>      1     1.00 [ -0.00]( 0.78)     1.16 [-15.70]( 2.14)
>      2     1.00 [ -0.00]( 0.81)     1.13 [-13.11]( 0.62)
>      4     1.00 [ -0.00]( 0.24)     1.26 [-26.11](16.43)
>      8     1.00 [ -0.00]( 1.30)     1.03 [ -3.46]( 0.81)
>     16     1.00 [ -0.00]( 1.11)     1.02 [ -2.12]( 1.85)
>     32     1.00 [ -0.00]( 5.94)     0.96 [  4.05]( 4.48)
>     64     1.00 [ -0.00]( 6.27)     1.06 [ -6.01]( 6.67)
>    128     1.00 [ -0.00]( 0.21)     1.12 [-12.31]( 2.61)
>    256     1.00 [ -0.00](13.73)     1.06 [ -6.30]( 3.37)
>    512     1.00 [ -0.00]( 0.95)     1.05 [ -4.85]( 0.61)
> 
> 
>    ==================================================================
>    Test          : Various longer running benchmarks
>    Units         : %diff in throughput reported
>    Interpretation: Higher is better
>    Statistic     : Median
>    ==================================================================
>    Benchmarks:                 %diff
>    ycsb-cassandra              -1.21%
>    ycsb-mongodb                -0.69%
> 
>    deathstarbench-1x           -7.40%
>    deathstarbench-2x           -3.80%
>    deathstarbench-3x           -3.99%
>    deathstarbench-6x           -3.02%
> 
>    hammerdb+mysql 16VU         -2.59%
>    hammerdb+mysql 64VU         -1.05%
> 

For long-duration task, the penalty of remote cache access is severe. 
This might indicate a similar issue as tbench/netperf as you mentioned,
different processes are aggregated to different LLCs, but these 
processes interact with each other and WF_SYNC did not take effect.

> 
> Also, could you fold the below diff into your Patch2:
> 

Sure, let me apply it and do the test.

thanks,
Chenyu

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index eb5a2572b4f8..6c51dd2b7b32 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7694,8 +7694,6 @@ static int select_idle_cpu(struct task_struct *p, 
> struct sched_domain *sd, bool
>       int i, cpu, idle_cpu = -1, nr = INT_MAX;
>       struct sched_domain_shared *sd_share;
> 
> -    cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> -
>       if (sched_feat(SIS_UTIL)) {
>           sd_share = rcu_dereference(per_cpu(sd_llc_shared, target));
>           if (sd_share) {
> @@ -7707,6 +7705,8 @@ static int select_idle_cpu(struct task_struct *p, 
> struct sched_domain *sd, bool
>           }
>       }
> 
> +    cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
> +
>       if (static_branch_unlikely(&sched_cluster_active)) {
>           struct sched_group *sg = sd->groups;
> 
> ---
> 
> If the SIS_UTIL cut off hits, that result of the cpumask_and() is of no
> use. To save some additional cycles, especially in cases where we target
> the LLC frequently and the search bails out because the LLC is busy,
> this overhead can be easily avoided. Since select_idle_cpu() can now be
> called twice per wakeup, this overhead can be visible in benchmarks like
> hackbench.
> 
