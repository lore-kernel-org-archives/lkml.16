Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB45930748F;
	Tue, 24 Jun 2025 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809104; cv=fail; b=EhnkLYp3ES+BDfpAgk6cwHGGseRi1kJ5m3vsvsJQP2iJFraSktdbODFPJ8ZInP2EkZ+DcCvoC77oa7aNnaH1F2+ZqQkbwjQKnJ70A5Rb7KFcUc83pYsF7SjAEeBrxKzeIi4nwzFgi5pPOhVTQsjK1hV0cvyDVoUapViVuEw3w0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809104; c=relaxed/simple;
	bh=3whh12YmiyO+q/ga2LUNudEISo5TpUWBY8YaKSQByqc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=prANf+Ld6hfZ2uLBWmYvjA33y5szNW38XxLp6WfE81D8cgu35aqTlOJ0+8WMJhK9+Z73ZxNMQ7CCHFrNyvFB7yRptCcyVPaqd4RIWoEPNNxCyXv/cfftqejasfDizPd9KAglCGSVGfTrxfb37waJgN5Z8qU5B7JXbEpEzF3LbH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TM9yfuvA; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TM9yfuvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750809102; x=1782345102;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3whh12YmiyO+q/ga2LUNudEISo5TpUWBY8YaKSQByqc=;
  b=TM9yfuvAGFsUz5z88jw18Ts741yUYSfLciKEXy4NGSWgtRJDgsEpf4Ay
   91XMpDSg620AEoyVztam3lrhIcEKkS3xItUi4Xn1Ti8fZ6TesTRkyrjS1
   dE5LFwh8IuMuXsfrLimB5zPorU8qjshcMIOZRhGoRec17Eb+2eXUaRQtM
   3Dj0RyyfVDexYSe6kXHGA16K1xvrj1gNdZ8o/049db+u1oBtkGx7PBfMP
   HjUWBuHveWK0TUtcR4c3Xp5U9NGzlGQyj1NhpNEfmuO8jeEu0B1LNLKCu
   /MKp6Nyft31aohS2GH7umbICUxLBaoN7xtzYqsJCKt8KeTcj35XmHOe7L
   A==;
X-CSE-ConnectionGUID: /4o6YIeYQ0q8Nk0g5N4eXw==
X-CSE-MsgGUID: bLtVP0MjQZuaMIWOsqW5Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70635313"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="70635313"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:51:40 -0700
X-CSE-ConnectionGUID: lTXN7qEAQBGDT576wHzAvw==
X-CSE-MsgGUID: TrHIailDSsyavXjmMHKeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152346663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:51:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:51:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 16:51:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHv7pQ5MHUI9mT/2JRO9HWORTd370yMuols8fKaZM3ZzgwH99T1A7AWrk8e6C/5LHr8C1mr8By83Xt0CcoQ8qzfOfry+OuV8rlYs8WS0+M/0pRXCrZ2dbv03FKRR+YArN2pNW4dbUAxO+gMbxstTFbgCgkIu/XqI/0dKTYSvSXmCmbOuzuAWQ3PsYWsgs68Dss3dn4JFKFr+aYFEHIwBQLwkxZakXSI/FU3pX6Pqw4YhW5nzcK8FaHC3I8rUf08H6f6mJWZDz0jLOskTzXuZqEoUYmHR/RXAU9PkRGtZXFapGwoKWE+UuMnSyXj3IAAzpCpUpj7L5Fr2jrQxfKaC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1pMENEmGFgDQf1Bi8UddMkkN0mw5MJmZvK/RTHSWnE=;
 b=KrYD2nUZZy55+A99Oky4FX/+x4ntlQancmWm5RqrVIUJYU8RdYnpVg5NXTfgBMoJlCV+fSVOqiIwuuDYyDoGhCSTm3Sx2WvKxv6dcf83gA3JRat2TaF4eAJiWML3PXyqKtnecCSHhSD955YV8auI/KQNXARgzPq2HYLO0Jk7P3Z36eQYiDspPJJH2Z4R0cBw+Wfg2drYQGrUJ3ubS3ymUeOXt0Bo0gGWD2LDy+5joFU6oxRYp7w+XwyBh1Y7FkqpdgLMchxtPlYDZF5wl1EIGzadOEJRAZHOG7VERKe5AZSj+pZ791WlcsDOk5v0Ezf+JWvnS/UlRKnDaLIZIk/+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 23:51:30 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 23:51:30 +0000
Message-ID: <14b723c8-5d8e-45d4-9c25-ea1d8c6e69a4@intel.com>
Date: Tue, 24 Jun 2025 16:51:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 16/32] x86,fs/resctrl: Introduce event configuration
 field in struct mon_evt
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <1b9d6c39f654c2a4fe500d7e9be4a13221ac4910.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <1b9d6c39f654c2a4fe500d7e9be4a13221ac4910.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0367.namprd04.prod.outlook.com
 (2603:10b6:303:81::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: f6fe734d-5a7c-4ec4-cba3-08ddb37a0abd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1dRbWFMTmE1RWEzWHk5QXFxZGhWSHBTcmwva0VTT204K0ZFdzNYNUlvK3B5?=
 =?utf-8?B?VXBVVkh2YnBiSGpXLytyT1FMYjk2SXVIbk0zOUFieDVzWEFaaUtkN0lDdmZF?=
 =?utf-8?B?aGpoZWQ0NmpXNVgzaE02R1E4VlE2bGJNSVpJMk9jVTZBa2dEb2lrYVJlVExD?=
 =?utf-8?B?dHdOeGsxeFFKTGxxR0xKY0NHQ2doZTJUWGVSUlFISUVCNFVldnBSNmg1aWts?=
 =?utf-8?B?d1BIZmNFL1dZQUtXcTNMR1M5TUFXVTRPeFlHYUIwRUFsV1IvVDF4TnRra1lH?=
 =?utf-8?B?UWJEZGk4SE9lVENkdEVVK2hJMTZldUVqUWxWOVNpeTFyalcyQkxEREVHa2Za?=
 =?utf-8?B?d1V6WHpBZHFPOVB4TTVhRkJhTTdFRGNiWGhKdmtnaUtYZ0tha0VTaVdTakFL?=
 =?utf-8?B?Tk5wZlVxOFR6Z0hVcVhZRnF3MDdrSFhtUk03Y09wcDN2Z1l1RzNPYjQ5WVYw?=
 =?utf-8?B?S01OVy8vOTE0aSttRzlNWGpqdExVV1plVnlHdUhYc0huS3B4SnJDRmt0WVd6?=
 =?utf-8?B?a3BrKy9MaVhFN3cwdHlsTXNxdEJoVG9oazlwQUJLUlFWaW9kNW9XcVpNaU1y?=
 =?utf-8?B?TEJEK29TRlVIR2JobkhuaFl4VE12UG5ueVhFc2M0MTgrb2YxNHpVR1BpWGwr?=
 =?utf-8?B?dHZGbXd1Tm5oQS8rT2FJQVlUb2QwSUJJNGJOZEJYQnlhRGdkV1NuTDJtbERP?=
 =?utf-8?B?NEM2dm9jMmVwb3puZlRCc0tiNnltYmIxc3p2TWFERXdhcjl5TjE5WXFHV1ZG?=
 =?utf-8?B?cGJLT2dSbEdkS1ZJTS8zZjlDd21vVFdLdjlUZFRrZ1UraGpyR0xwM0RyV3NV?=
 =?utf-8?B?VThUcjlCcGg5cGVvdGU1L2dTc1MxTXkvN2I0TnNHaHJvOHlRd0NQNGllQkcy?=
 =?utf-8?B?Z1hXOXcrZG5jSjlnejhtWmh2K3ZNTHk4TXpjSjg0dHF4Tlk5NUlIL1d1Y3Jq?=
 =?utf-8?B?d2hOc1hkQXlFcnFFaGtSeU9yeTVDYU8rRVFQcmtVcjBoTzdmRXp5NWZOdGNa?=
 =?utf-8?B?ZHFYcHZkYUVCRmprQkNsVWg3OG9JN1lKWlIyZDFtNGFWamNRZ04yUTlZV3Zu?=
 =?utf-8?B?b3Z5UUlQb29yNEpHYTAxT3htd09lRHhRNk56elFMRGN1dlpYMFRJamVwamxS?=
 =?utf-8?B?c01JaWF1cGZYQXlqUlZDblZjK2xkUUd5bWcxVFhnczhQSnNiQjVxTzdsOTJr?=
 =?utf-8?B?S2hZeDVuejFRa05pLzFtQ2NEYzQ0VTBtc24wQmdNOUZUZjZndGMzYXNiN05n?=
 =?utf-8?B?bUtIVlJEcWJwclZEWkx2YVIyZU9rTUdLZlNtdWYybnlOdFRFclZMQUZpMXQz?=
 =?utf-8?B?UUV1anZ3STgrdlFhZVlodjNsdytSVnhPMVR4bGhJNmdpWjJJT252eU1rSWxx?=
 =?utf-8?B?eE1JOVYyTk1VMEczZ1UyTDRGT1FQWmhZeGhHYWgvcWJIeFpMUFFoZTF2M0F5?=
 =?utf-8?B?WFVtUUZrNDhGR2tRbjdnQ0FVYzQ0VDNxOGZEUGFwNlZRZDgzZU45QmJOVGE5?=
 =?utf-8?B?dkxBMHNZaS96RVoyUFNIM01RcGpPOG5sOVJuL1c2MVVNTEVNUkd0bWFGRFdm?=
 =?utf-8?B?WEJ6ektoZTd4UFhRUVdVaHVxK05NSkpNMzN3Z0wvaURzSWZZMXFLR2ZnSjRm?=
 =?utf-8?B?Y2FwekMwdnc3M2hpTTdRK0J3cXBQNklMeVFuSnhiR3F1V1plYkpORGxTM1F3?=
 =?utf-8?B?SVA2T2g3ZEkyOEVGNll4aWowdkVRZXdyVVFWZXE4cC9BUW5SQ1hZLy9lQ1hH?=
 =?utf-8?B?eTllMUdqanJRUGNqM1B0VE83QkFNTXY3Ym12Q0d3OGdaYUhJY29SckRvcWlY?=
 =?utf-8?B?QTBtcDhBVnNKSUl1V2NBa0U1RnNIeEVwaGpUeUVjS0tuR2RKdzR5NnJKY1R4?=
 =?utf-8?B?UXFwTnRVTUFMeTY0N2UyQ2JhdEdkVmRsTlF0aCtmODh3QVFEdlZzL0VJVkJF?=
 =?utf-8?Q?YZblSSinFrg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFtcUI3MU5ta24vWXBaZTlXcXpOUmxkc3RORXN0QjNWV1B0UW1leEVYOWVz?=
 =?utf-8?B?YTBza1prY3pHQTZQa05OSlNZL0h3NiszZFkwTzlVL3FSRmhmWElHbVg1TFRP?=
 =?utf-8?B?d2I2SEVudlRnL0lnR1NIbnM2N3Nha01oa1g2MGJEQm5wb3lKVEFmODAzWUtD?=
 =?utf-8?B?U2VZRUpEbjdCWVRyVzBQWWxralRUUTN6TWZjUk1ta0Q2dGN1cVhEWXVqT2hG?=
 =?utf-8?B?UjRPd0psdm5UOW9taEtEekErR1BOdWpqNGVrbFVkWmtZUTVQS1p4SnpZZVZF?=
 =?utf-8?B?SWhReUtnSFg2ZnhqY2VNZmZSdHhacEh6M1R2UitHdW1KdEs1dnVvRlZoOEJC?=
 =?utf-8?B?Qjh3WHlFclNINHUyY1lTeVVKcGdFTGtTOXpiVmdKcnR4OC9KYlVyM3VkSm5q?=
 =?utf-8?B?Tkx2QldsbjZPR2w4NG1FWDRuZjU1aUJsQ1l1VnkvY3JoMHl3M2RacmNKNXpm?=
 =?utf-8?B?NVJON0pwc2dFeHFNYnN3L3lnQVR1dHdkSXJkV25YVE9NQXJFUzI3clJVMFBY?=
 =?utf-8?B?eXBONWZVQk9Gd0V0ZkRSN3VHemF5WlpMTHk5cHJjZlRiR1hEcjhVVjJEa1ZE?=
 =?utf-8?B?SWptS1RYUjJMOHRxVVZvTjg4Z0xqN05pbmF3aHVZeEVtQjhqbmx3TUxNVFVr?=
 =?utf-8?B?cDVGTGNIUGY1TjBvOE5IL09HSExvN2l0NmpubDE1TVNWemZPc1BLN1hONTIz?=
 =?utf-8?B?RHR4KzMrU3VUd2xMVVBUUjBiWkhRajljb29TK28xTFRYTVh3QzRwZnR2VkFv?=
 =?utf-8?B?L04vcm9HZVFJYW5BelFzVGE0bCtjY1BwcHVhQVZjOEtQUmMyNzU5SDF3Z3pt?=
 =?utf-8?B?UkRkakozYjNhY09MV0ltQnl5MHZ4OXNkUnhSeVJ2dHFjY2grK09XVTFoZGxa?=
 =?utf-8?B?eVJBN1BobzRLTUw3Y1FuRzd5VWpMNFVOakJ6YUViNG45V2NOZnlMa2lMbU9r?=
 =?utf-8?B?NTVPdXFmS1NSY0FpOTNmalJKZGc5MG1MbWgzU2tDUDdEcVE4a1JBMlJMQmwx?=
 =?utf-8?B?NUJLdklrSENsVURsdlRKZ2dlUDRLUHdDUldweXdnWXUyekJHTzRreGFaN2xQ?=
 =?utf-8?B?Um13YUNrZHFPcm5iSkZVRTBqOHcyYXJJTnRhODI2Uy9ZdFBxQi9DcVM1OVNJ?=
 =?utf-8?B?Tm1vTjZhd25qVmptODRCRXJtV05ibElQS21wOUZFRWpaVzlEbUJMRUtYLzdl?=
 =?utf-8?B?Q3M0VHhyd1k1V2hJazNLTkhLczBONWZHTEJoRU9nV1NlWGlXZ3hLVjJlYUoy?=
 =?utf-8?B?cDJPd29LSEYrN01yd0pxQTBFTHBjSkVESkNMRDJtM3Z1dlFwSmFWOFplc2p2?=
 =?utf-8?B?M0FxSVFocm9IMWZNY3RsdU1JQmxWUmRrYlpHekN1Y3RKWGtBTkxtMDg0a3hJ?=
 =?utf-8?B?K28vZW5RSVNOUGhzbGhyTEhmTmYvWFpMOXFZOTkxdHFlSDBvVlhqK2p1ZXNx?=
 =?utf-8?B?WXZ3bERYWklWQllGeEhaQ1VLY2tiUm9YdUpoRS9UMVlZMS96WXBpcHg4SFhy?=
 =?utf-8?B?M0R6VFV6YmJrbHFVa2wxdDNLem9DMXQvRkFmWTA1L3JoQTRDYWRsQVhTaFpN?=
 =?utf-8?B?RElwNlgxU1pRMHJXMm1XdzFndTJQU3EzUHdCODZ5WS8xa3hJZFJrZ3BKL1Qr?=
 =?utf-8?B?bkgzRWZaMnRaWTFERUwrN1EzUVFVbW1lTXFBcU0vdTRHM25Zem1FcldMSU02?=
 =?utf-8?B?a09lOFQrVi9tTjFzVUNWS2pvamowbG9YdTVKM3NEaUVlK2RYSmV3UXRvT1NX?=
 =?utf-8?B?R0g0SkJHOVU4d1daWHRhZkMxek9Ma01RWWlDWUphNDluYU9JRko2c1BNekZX?=
 =?utf-8?B?Nk9WN3lLdkJ1ajZ6WGxwa1EyOWRCZHBmOHlubm8yNDluVEJ2NDVtblZUZFdF?=
 =?utf-8?B?ZHk2VCtkRG43SW9USWcrdlYyTHF1M254cVMzRHZWdVpJN2F4SGRpK2tTZG4v?=
 =?utf-8?B?bDA3MVhScUZBT1l5dnBvRG9ZSFE3V1dzR0Era3VPOEdtR3U5VSt3MHJ0Tjl5?=
 =?utf-8?B?RzM1Y0ZjQ1BXdklRUW9ZSUI1M2Y3Q1R5LzRFMVRGYkpsaXYvVDVYOFVMZFQ3?=
 =?utf-8?B?UlBmZXhrTFMzMFZiRzdwdUlPdmhSSVFKZnh4ZkhxLytUdjRnOTVib0Q1YlRs?=
 =?utf-8?B?Y3ovSFh0amM0RWl4MUR0ZEZFbC9sejJLQzFBOTd2UFRwVU1ob3BrZFVBNUFN?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fe734d-5a7c-4ec4-cba3-08ddb37a0abd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 23:51:30.5484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2qvb9vzAPN6amM1OwH/L4iXgfZ7eQeLh0qPhO8H5yCXZbZHqfMM5zeHQVUJgAMeniogl0yIQGKHGAxBOP+rd2YPYkWNbTkrOSNEhOjiLFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> When supported, mbm_assign_mode allows the user to configure events to
> track specific types of memory transactions.

Since there is also a "default" mbm_assign_mode this should be made specific
to mbm_event.

> 
> Introduce the evt_cfg field in struct mon_evt to define the type of memory
> transactions tracked by a monitoring event. Also add helper functions to
> get and set the evt_cfg value.

hmmm ... this does not sound right (more below)

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v14: This is updated patch from previous patch.
>      https://lore.kernel.org/lkml/95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com/
>      Removed mbm_mode as it is not required anymore.
>      Added resctrl_get_mon_evt_cfg() and resctrl_set_mon_evt_cfg().
> 
> v13: New patch to handle different event configuration types with
>      mbm_cntr_assign mode.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c |  4 ++++
>  fs/resctrl/internal.h              |  4 ++++
>  fs/resctrl/monitor.c               | 10 ++++++++++
>  include/linux/resctrl.h            |  3 +++
>  4 files changed, 21 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 01b210febc7d..1df171d04bea 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -875,10 +875,14 @@ static __init bool get_rdt_mon_resources(void)
>  	}
>  	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>  		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
> +		resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID, MAX_EVT_CONFIG_BITS);
>  		ret = true;
>  	}
>  	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>  		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
> +		resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
> +					READS_TO_LOCAL_MEM | READS_TO_LOCAL_S_MEM |
> +					NON_TEMP_WRITE_TO_LOCAL_MEM);
>  		ret = true;
>  	}

The architecture should have no business setting the event configuration. This should
all be managed via resctrl fs, no? I think the resctrl_set_mon_evt_cfg() helper should
be dropped. The above initialization can be done as part of mon_event_all[] initialization
within resctrl.

>  
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 20e2c45cea64..71059c2cda16 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -56,6 +56,9 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>   * @evtid:		event id
>   * @rid:		index of the resource for this event
>   * @name:		name of the event
> + * @@evt_cfg:		Event configuration value that represents the

Extra @ in "@@evt_cfg"

> + *			memory transactions (e.g., READS_TO_LOCAL_MEM,
> + *			READS_TO_REMOTE_MEM) being tracked by @evtid.

Can append "Only valid if @evtid is an MBM event."

>   * @configurable:	true if the event is configurable
>   * @enabled:		true if the event is enabled
>   */
> @@ -63,6 +66,7 @@ struct mon_evt {
>  	enum resctrl_event_id	evtid;
>  	enum resctrl_res_level	rid;
>  	char			*name;
> +	u32			evt_cfg;
>  	bool			configurable;
>  	bool			enabled;
>  };
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 2893da994f3c..3e1a8239b0d3 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -884,6 +884,16 @@ bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
>  	       mon_event_all[eventid].enabled;
>  }
>  
> +u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id evtid)
> +{
> +	return mon_event_all[evtid].evt_cfg;
> +}
> +
> +void resctrl_set_mon_evt_cfg(enum resctrl_event_id evtid, u32 evt_cfg)
> +{
> +	mon_event_all[evtid].evt_cfg = evt_cfg;
> +}
> +
>  /**
>   * resctrl_mon_resource_init() - Initialise global monitoring structures.
>   *
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 468a4ebabc64..a58dd40b7246 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -413,6 +413,9 @@ static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
>  		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
>  }
>  
> +u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
> +void resctrl_set_mon_evt_cfg(enum resctrl_event_id eventid, u32 evt_cfg);

I think resctrl_set_mon_evt_cfg() should be dropped. Any changes to mon_evt:evt_cfg
should be via resctrl, either via initialization (all archs should use same default)
or when user writes to the event configuration's file.

> +
>  #define for_each_mbm_event_id(eventid)				\
>  	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
>  	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)

sidenote: This change looks to be a good foundation to bring back the BMEC optimization
you worked on earlier where it is no longer needed to read event configuration from
hardware.

Reinette
