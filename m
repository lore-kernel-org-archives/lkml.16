Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE5722156D;
	Fri, 23 May 2025 04:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747975343; cv=fail; b=FY6zYjmchlnbBLfSRW+fj+wVjb2e1Vk9gyXx1HNmvHHP4aVlBv8tGSyc/0B6wOAUSW6bhTXOssz6dQWoOpgHt0yuqZLh8xVKuzP0FK3enbdc40VIljdesvswyGyhq+bZE6ZBEoQzx6TqRI+XqxvEn6zoKdBv6TH+tp0T9BnM5vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747975343; c=relaxed/simple;
	bh=LnZdPfeCfwJ5x2tLehS7QUQdXueEwxApTBdMpIxGwu4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UB8iXEbSw7Qdy+tM1uuaAp2Gg54oejOITrzLrwKfZvz3AYzN2mS7AXgnER17//oG7H03ptgB+FS6djrQLka5j110Bnw33OLsXedAFuHoo7BYAgLWc+Y6b1yBlXdVpzLQG6L0ue5rfTMo5okzITj1BENx5fJvey+Ms4Kkapb7IZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9rTyu89; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9rTyu89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747975342; x=1779511342;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LnZdPfeCfwJ5x2tLehS7QUQdXueEwxApTBdMpIxGwu4=;
  b=G9rTyu89lghbjSaUnHh0kKzvUZMVM5kMTVcP44+v/m2wsROhoWuXrhUb
   K9RwtlHQaj7+1o61h1nbnTAUnOemXdD89QWEqvzuLwD/u2N1c8h+DNWiy
   j3OVAHVNNXFDJbWHJt7fyZ/ca5XaW3cMkFBQ+yStQCH9ejCZl3Juwih9w
   OmKqBq6/fdULbwY3r0DE7Wlg1dqtrNdX6BbBgiEHosun+k8JmX43nLeca
   LWxvI8BsDj0ws4JxdlJv3mn8aSvX1M2Ud8o8o3g9EcbJDMM9x71Y47Twc
   T0dB54MELq3olknOhykFdAf+BwQuqj98UMpMowFf5/0FDrbcYoNgSx+W7
   g==;
X-CSE-ConnectionGUID: lC2THypMS8K88D9tP+uvbQ==
X-CSE-MsgGUID: YigtP2EmThqvyZ7qDNm55A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61376913"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="61376913"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:42:21 -0700
X-CSE-ConnectionGUID: zY8c9lLxT6Oa7DigPWkeLQ==
X-CSE-MsgGUID: eGflRg5HRuyP2HSX2K1tbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145784437"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:42:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 21:42:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 21:42:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.45)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 21:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RMvvcC3PWoDFyhcJ9GS+Aq8LDXsDckeVumT8IDCN5oHDzk1LysZHhOjSWis3zkGQFTl6cgdlI/fW9KdIZwYMK6avihnL/jDVhi6Gm8W0vlwA0gZw7dYXFRiUnCRHd9Sadb/BfPyQry3ti6xn21A5zxP+6lMNogMRjk3x22ljxKG/3bV58tulHlWwhq2AMhIvPm4UalWppOzm7BMFdPFVBTXK70IJVbFGvfr9enbksdaVOe9PrUBQhFfllA3N4FFY3U0UBKvDJlwuHRayWYUDk9R7CwerQmNB5d/8KCGFP8oprPhNrt6bWW2Gz7G3WQP1QNXomFkWOBYUHgpMJ1BEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SggPNtHBqZLwnKOaDbxPlVVT+kb0kZ1KC+AXnIOybQA=;
 b=i4I+ziyXMppOQRIDtN7X6PeZqhSZKnVjPcKSpyFl5pMkkggaIdXoE3NKEJFg5uZDTUscjz4sayxdWcVhJa+pcvC+83rimQnllUq0HgSYdkolt6eWJtUw8HnQTZFdwGHsqeJVRb4IbNr3TmlReeKVSZAH2lEfO8fmNRvYvBjwdGAOSBrtcRELTaUshrcddtzbVm/pCacvGsrHZTiQU+T604pPiwORZXLsWn2lyPHsFihOrn47bktzec2ki864Bt3TdUJV0nWiyW38558zd9K75y3qsTzhcGmqsbiLfER9HJWYAAROHLXDwIHKMm48OCn/OJ2S7FiVXbLQtxQKwPpYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 04:41:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:41:39 +0000
Message-ID: <ee5b9df7-d087-455b-a782-027d117b2178@intel.com>
Date: Thu, 22 May 2025 21:41:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 18/27] x86/resctrl: Add definitions for MBM event
 configuration
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a4f36d-5f79-4b40-1fd1-08dd99b41ba2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUpodGxLMFJtcEFmaGtmZGNLYUlsLytWNkFaR3pIc2hWeW1wK3lPL1B4MVpT?=
 =?utf-8?B?WStxODVTZmVGYkI0SmlmYnNLYjcrMHFoQmg3TU1yNGVMUXpCMTE5aFhlQzh6?=
 =?utf-8?B?MU5tbExpTlkyR2dUT3JNOEZNTGQrdjhCb0cvckNERkVhWDhkQktkZTNSMUNv?=
 =?utf-8?B?WXBEOEpRZTlzeHg5eldJNmxaeTFVVE0vT1lYYWVxcTVmdnQ0Z1ZCb3hCeU95?=
 =?utf-8?B?bWludmNOSUloa2xyWENkNklvencvS0o3U2V3MXI1MnVoWE1xaE5qVWhCZ1RO?=
 =?utf-8?B?ckVDMjFxc2FiSm1RZWV6RUV5OXgzaGJ3WnRPaTNrVE8xVktldjcxb1FDV2VX?=
 =?utf-8?B?alVNS2Q3SUZsbUpXOFJPbFh6L2RoNmRkREorbk40SzNPTXB4YWJpME9VVUlI?=
 =?utf-8?B?Si9WcUtrc0NPNE1GT0lRc3BpRUlYUFJCYnNHaFhWOURRTlZjejZJS2Q4MG54?=
 =?utf-8?B?RDU1V0hWblYzejJNbkFIMk5vNkJQK2FNM3Y0Ri94WEtSckRqeTZuVXVodDBH?=
 =?utf-8?B?YktUNXl2aFYvdWEzYnlVOS9jQ21sNjMwVWVlTWNQdElYZnc0Mk5kdmdHU1Qr?=
 =?utf-8?B?cUQvenRUUlhzVEtxdHNvTDhPSUJXYml4emFNYkxDSjVpWHhpM0puNmpoN0ZX?=
 =?utf-8?B?Ky90SmFVby8waHo5RUNrak9KRjNsWVN5R0VQRW16UU5CcDVxbjZPSVI0S1o2?=
 =?utf-8?B?UWkvbXBpSzdXKzN0WERlNHdvbk95UURTSUVXNUhkRStoUkZXOVF0c2UvT3pM?=
 =?utf-8?B?SEpVVDE0Q0VhVDhvbHV6T3RBWnVIZHdBUEpZdHNxK0Rsb0NVaXJCekxFYmUz?=
 =?utf-8?B?dG5ualNKWjVBK2dmSExnRnFScWkvd1Z5NVBXTzFScFRsdkNOVCtnRGx0Rjkz?=
 =?utf-8?B?K3BPbzN5NDlDU3NRcW5lZ2NiQmFWRlJjejN3ejQ4Ny9iYlhZTTJqMC9ZVzlZ?=
 =?utf-8?B?eDdJZ1Nsbm1xSlhMSlVVU2V4RTRLajdreFVtdmhaYjZnTTFPSjBiZDlSU0xS?=
 =?utf-8?B?cERMZktkck9NaXI1bGV1T242aVpoSUY3NU5aUkNwSVB5MEJ5TVg3ekdqdFg5?=
 =?utf-8?B?SjJrdTdUckdDci9jVWhNRDYrQVVrTVlHSGY2bkdTL1M2dng1MHY2WDVQRnBh?=
 =?utf-8?B?NlplaWo3QURnUEV0R21oZHRnS01Dd2dNODZIMzdEZENFdUZyTHV4cys0SGM5?=
 =?utf-8?B?ZEJlOGN0OHRJcFhGMXhTSTNqTTBqUFpSQ3Zld0l6UFNwenZBcVpmMDdGL2Vm?=
 =?utf-8?B?VnVnU2VNNG91L29BenUvaXJ1QVBhMExJUGNGWjQ4VTJJK250MHZZQUVRM3d2?=
 =?utf-8?B?ZS82VENyeHRpR3hnTHdBbk8xU1p5b25KTVVtSTdkN1ViVlBFc3l1ODFVeFo0?=
 =?utf-8?B?VGpzY2UxTVIvQTVCeXFRempMN25obWU5NUh6MU1LZXJEK2k0TGY2djY2VjRN?=
 =?utf-8?B?Mzh4SlV1L3VuMGc2M1NuemxYYVpuZ09aWUNvaWhTZmMxckNuTlpvOXAzenhL?=
 =?utf-8?B?THlRZVFycmc3M3NVTzFHT2NxZ1lZOERCYzhac1VxZ0tqSWNiQ0t5azNjVnpp?=
 =?utf-8?B?SXlOdkNMemNIS2c2TG5vQVZFR00veU5kcHRhUHo5UGlnRFBZL2c5azA0a1V3?=
 =?utf-8?B?bFB1MnFqY1VCVllrQ0YxT1cwbnBhY3VRNXFMbmMvd2w4NjdIL3dKRVFTQXND?=
 =?utf-8?B?MmVsUU1yVEI2R29qcVMxdE5PcWFPci92UXFmQ2w4NFFLZU13L21rc2VrVDBR?=
 =?utf-8?B?U045bk8wOEY2MDV4QUVWYmZaYnJiQ0ZiRjNlcHBoZW01TzljaWV5RURSV2FG?=
 =?utf-8?B?RzFtNG8zZldWb2JDL01VVEYvUU9RVFQ4RnZhYkl5VnhXMXlhSXJVM0QzWW1P?=
 =?utf-8?B?MDF6alJkUUpTWTFoK0tFSGNrR3dERzZFNW1ObFp5ZmtsemVPeTAxdWd3ZjJU?=
 =?utf-8?Q?BIn5TdRSYhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRyYjJSUFlPUVY4bGxEN3pHeUNKdnoyUE1IOThSblYrc3hxTmpHaHhyUTVk?=
 =?utf-8?B?cS9kYjNSSlJOVXlYd1ZqaXZvcHpWNlVnZkZITSswMng1dDNZUnhlS2w1L0R4?=
 =?utf-8?B?bXFYUlkxbE1GZktCZmJJakY1dzJsaDQ0eXZuM0RneGVhUDNPY1ZCdjlwaVhK?=
 =?utf-8?B?bWVQRzNBNTJINytleWN5cmt2WWRPSXh6UWhuQS9Mdzg2NmhneVNRRkJURk1y?=
 =?utf-8?B?VW1rNG8yNUc4S1AyRWc5UHhhSEdHRVIxMTVjUlRWR2lVaEExdUp1MzJpUjBQ?=
 =?utf-8?B?OE1LRkFlUDZjaWIvNEN4WmpCc1VMTDJ0c0FmSUxJR1NyM1lNVVhNbFg4SFdM?=
 =?utf-8?B?OVY2SnZvR3U0QlBXemRna0RqREM2aTlXWGJzNnZjdHhvU3RtczdFWVcvQkRU?=
 =?utf-8?B?VUQ5ZjAvRlRZM3hncmt0Y3Njc1k2a1hjZkdObDZjZUZBdlJmRWMrNW15cGJi?=
 =?utf-8?B?YWVvaGR0ZnBMZzd1Y2V3VDdGeWhDZEVTVS94ckNnNWpkLzNBNHpBUFR4N3U2?=
 =?utf-8?B?OEJ0TWY3RUlwS0FYVGg2TzlRSU1NYjB4cEZJTTZuSDdUalR5Szk3UFZyTHd1?=
 =?utf-8?B?blVkTCs0UC8yOXMrcWYwRkxYTk14RW9zZklBOWRYN2V4dm1VdzlLNjRPeHRh?=
 =?utf-8?B?SUNzZVVmRkxsMUJ4UW1VWXJzYUJWNVZtbDR4RS85cTdDYlA3bWZqOFI1Q0xp?=
 =?utf-8?B?WHlGNUJ2SlpiRHRzWTBUajVjQk1BUEJmV3pQYlBKRno0V0Ria2pSRnR2eW03?=
 =?utf-8?B?Y2xoN2QrUXdKYWZEUHhsTm9wejNyeEFlMzlqcXQyOEp3ejV5SCs5WUNQK3pm?=
 =?utf-8?B?OTJDTVpPVk9WekptVVgrU3V5U3RmK2U2SXh2cTkwamhkc2pzN2R1by9VMjRl?=
 =?utf-8?B?Z1hjb2Rjam9aZFB1NzNQUEE3dkpFVTJCU2NsU0pNTjRCRVVraEx2MGpRaUtm?=
 =?utf-8?B?djFZQmxHNjArc3l4RkJZd3JaRkt3RGR1dDYwVGd1VUNya3lXRkoxT3cyQ3lX?=
 =?utf-8?B?T3ViajhOazhhVys5UENQUlljS2NHVmpCQmVDN1IvWVR4M0xLckoydTI3eXhj?=
 =?utf-8?B?T1ZreXJKbUk4eFdZSURpTFNuTW13NDAxZEdQUTRtWk1TbXhVUFcvaWpod1J4?=
 =?utf-8?B?MkZvZ3dqZzJjNVBPT1BXbkh5MUVsdENnZGRUSlpoWFVEalk1ZSt1ZitsUG5P?=
 =?utf-8?B?bFBYcHpLK085WVZjMjUycmxMV3hhTHpjNGM3ajRkNDErRUVMbzBpOWtoYStx?=
 =?utf-8?B?TFhFNzhCN0NvOXBZbVRwVGRYbjcrRDlwTHpOVjVKZHZjNVhLaHgvVmwrYnFV?=
 =?utf-8?B?ZlNNRTlPMGhaNzQyU0prR2VxY0hSKzVoK3Y4MGEzR3d0NFR1dWg0akVCSFlI?=
 =?utf-8?B?N0FGTmFjejdNeDFaZ1RPNVJDb253SDB2cVhsUlR4Y3VwdXpNYSs2NklTSFpF?=
 =?utf-8?B?TjNvN3U2UHpZVXc2Z1A2TVhOMWk3ZTJkOEN1eEZ4eTN0SjNUZTN2RUVHNUh5?=
 =?utf-8?B?azVHVnpXYU43MkRKUVByeTdtT0pXMlpCYzdxOTB0bjU3b0lqZGVYRFNDSnJX?=
 =?utf-8?B?WXlKUFJsNFM1UHlJTVFsZW5xTjh0Si8vK3NyR09oNitveHR1bW0xWSszOTBw?=
 =?utf-8?B?VENNSFZiUkRzZTYvazA5VTdVajBVazlTKzF3bGZtL2RlYVl3OCtTVjFzTWJQ?=
 =?utf-8?B?WExHN0ptYXVBWVBnamg0QUtQTjF4TXVkejZNSURaVnFrNXNDZGJGSzNQTEo0?=
 =?utf-8?B?SzR4eGhCVHBuR1FJUDhRenhKc2FlNW5CdTVnK0ZrOVFFSTJqbGI5a3hIMDdQ?=
 =?utf-8?B?bVAyNGF0KzM0VzBCUGt0aW5nS011OG83UGZxTUN1R20waWczTTN2WHJFcXRS?=
 =?utf-8?B?YnhuZmgrelljT1huYjF3cnRnZ1dobmZZcExyUVRJUEkzWGlIUWxxOVF6TEZy?=
 =?utf-8?B?WjVxYzdqbEVmbjZsNWJINnRsRzJ5ZS9wT1pmeDJOdm9VWW91bEZUZXlnczVQ?=
 =?utf-8?B?Zk1UNjFUSzRxR3d3cmw2WWhjWENBSzl5NjAwd2FTNGNiQVJ5ZWk4Ui9MRk9S?=
 =?utf-8?B?SnpEVGVJMStwdFUvbHYwTnZ2cUFGSzRZNk04S1dER2pGbE1FV3JGMGJxVEpK?=
 =?utf-8?B?Rk40ZVF5bTFtQU1EZFhSczh4RURrZG5YcU4wSVNKNkJTczVGWndtbUkwVlNX?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a4f36d-5f79-4b40-1fd1-08dd99b41ba2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:41:39.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBUJGwho5sOzpFguQy4VZPGaSvKo6TkilCq7lSBLzPndhczpkwgcEReo2M2628j/1Be6JiERu2gjemS/EBU+/8yOKxg/lPsgot4DsvmuDaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> The "mbm_cntr_assign" mode allows users to manually assign a hardware
> counter to a specific RMID and event pair. The events available for
> assignment are configurable.
> 
> By default, each resctrl group supports two MBM events: mbm_total_bytes
> and mbm_local_bytes. Each event corresponds to an MBM configuration that
> specifies the bandwidth sources tracked by the event.

hmmm ... earlier I thought "bandwidth source" means RMID but here it
seems to mean the memory transactions? The various terms are confusing.

> 
> Add definitions of supported bandwidth sources.

changelog uses "bandwidth sources" while the comments of patch
uses "memory transactions" ... please be consistent with terms.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Updated the changelog.
>      Removed the definitions from resctrl_types.h and moved to internal.h.
>      Removed mbm_assign_config definition. Configurations will be part of
>      mon_evt list.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c file has now been split between the FS and ARCH directories.
> 
> v12: New patch to support event configurations via new counter_configs
>      method.
> ---
>  fs/resctrl/internal.h | 10 ++++++++++
>  fs/resctrl/rdtgroup.c | 14 ++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 0dfd2efe68fc..019d00bf5adf 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -203,6 +203,16 @@ struct rdtgroup {
>  	struct pseudo_lock_region	*plr;
>  };
>  
> +/**
> + * struct mbm_evt_value - Specific type of memory events.

I am trying to decipher the terminology. If these are events, then it becomes confusing
since it becomes "these events are used to configure events". You mention "memory
transaction" below, this sounds more accurate to me. Above could thus be:

struct mbm_evt_value - Memory transaction an MBM event can be configured with.

The name of the struct could also do with a rename to avoid the "event" term that
conflicts with the actual MBM events. Maybe "mbm_cfg_value" ... I do not think this
is a good name so please consider what would work better.

> + * @evt_name:		Name of memory transaction type (read, write etc).

Unclear what "type" means ... maybe just "Name of memory transaction (read, write ...)"?

The "evt_" prefix looks unnecessary.

> + * @evt_val:		Value representing the memory transaction.

This could just be "val" and the description could be specific:

"The bit used to represent the memory transaction within an event's configuration."
Please feel free to improve.

> + */
> +struct mbm_evt_value {
> +	char    evt_name[32];
> +	u32     evt_val;

Please space member names with TABs.

> +};
> +
>  /* rdtgroup.flags */
>  #define	RDT_DELETED		1
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 72317a5adee2..b109e91096b0 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
>  
>  struct dentry *debugfs_resctrl;
>  
> +/* Number of memory transaction types that can be monitored */

"Number of memory transactions that an MBM event can be configured with."?

> +#define NUM_MBM_EVT_VALUES             7
> +
> +/* Decoded values for each type of memory events */

Please be consistent with terminology. In the above lines it switches
between "memory transaction types" and "memory events".

> +struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
> +	{"local_reads", READS_TO_LOCAL_MEM},
> +	{"remote_reads", READS_TO_REMOTE_MEM},
> +	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
> +	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
> +	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
> +	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
> +	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
> +};
> +
>  /*
>   * Memory bandwidth monitoring event to use for the default CTRL_MON group
>   * and each new CTRL_MON group created by the user.  Only relevant when

Reinette
