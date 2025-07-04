Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9199D2874E5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618459; cv=fail; b=WWhrom1DLSsVo030BMWjqulMXTI/BCdFQOmJf/aDkbxnRDbVDY55tiIFn0rvB+4BatAhyCeVSoCA7D7Hmd4/nggMoCgXG2B+M8sYgFsoy1LVw5MHkjZ7a5cNlNSYAeacTTvb0pgABOjpPVKgifHYyrdEfowMSJvCOkglC8IqWhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618459; c=relaxed/simple;
	bh=35zqjFzGByqlReRR6gbzAhTO91UxL/op6RLql/8bg8A=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rmhtml/DG9Dc1JMpEfcb4eGEF2CUPQC1gcNP0tIPLvV+2lTvKfootdCr9tXBiYWEbg7AfxhuLEof6xOw4iiLsEMz0D5fIIicFyTIqaje5R+E5eSNYzT86tAMOTIOdbO+U8ukSRZFY1QyeBp+Fc7GNHqLmHAaqfTTtTDN+1xJYG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1chNEsC; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1chNEsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751618457; x=1783154457;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=35zqjFzGByqlReRR6gbzAhTO91UxL/op6RLql/8bg8A=;
  b=O1chNEsCFiKijQC96+7KgFtApdwbd4DQ2dQE4kUH8i6FDVKmh0gCJ8om
   TzGcqhcvLkrVqm1chJ1MB9U4NUEnnpqbjs6uroy0dsPzmM9VWqSN+1h+j
   hPNZVsjxlXe7kIjK3i7etfxwSWebQ/JkBE5XJ2EFEcyMQ8yTKdGlsH3Kk
   C9Md/gtbbQwDvIg9GFTnKWZCq90OU3cGH2Py+ES8kI+g2XCec93RH1K6K
   OA+Qa12S3AGOKqypbq4ciVLqCnj2FzgBdngFS9CuCfXhu8vR3z0eyMhd7
   x1moRfvgz90yPoPbjqAtDVyK90523vPuspTnUaE3gdUk3yLfaMuZPxL0w
   g==;
X-CSE-ConnectionGUID: pBggAOCYQFGARVxuIFrvcQ==
X-CSE-MsgGUID: CbQ9+wfGS3eiMe69UNbyOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71524808"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="71524808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:40:56 -0700
X-CSE-ConnectionGUID: VOMAD2/5T+itaJ3YWpX8cg==
X-CSE-MsgGUID: dusIz1H/Tq+XUPl09Yc3SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158863428"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 01:40:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:40:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 01:40:54 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.88) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 01:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohOnvf3aRneiN5xP/ZOPa+p3dyssaEfeAceFyoQYATnlmHplPiOVIRh4+Fq1j9X2qiv6+36M+MuboJEZ1cU3LjQyQ/bH5j66Uu6/rfF67YpV01mD6aR5811gacWUgp+XA640D2Vuszko115A+0yuL3ZJ7KCKRRHi9/oDlEXpF6NlOd8Lu1tWfRfym9l2RdGAcEwqN9Q+FcEDbxoPvyzSsEUM6OnDzWRCqifZ2BBs10YouK+8rcBsf9cybPs4p+rmW64bb3c6t3ZInWoPtV5hPf19muALjpMCmVqjftfSdN/TYDaY5tgqbUmUf91J+y2rrPltUBt5UIXxavMTmv1vkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlxaI18vDUt3YmjT9KVvia4F5SWk7WYzAN/ZDZY0Dkg=;
 b=QvcmjSmm1tuffPdegpFIhjXia9kjsPLIZeRS350YFBRV3NsAxSL9gvQm9nlSBYPyAD1k0hlSDG/3Nm85B66bITmTrVG+SrcrmwFVMZy5oaokmxMu6C7MCo/Hj0icDMJ8yjlCrieNFKyaDDwSb6D+FdkvdVcG6JY/mZ20gEBHpuwmpmPr856tvm5F8g7CDaU+HUQHPYX05hTQa/3aIJPOuVGvbMJT94ngAHpi99jEjivW4B6hNWvhtJJ6613eqM0cuqlbKKpxZvz0C7+WMv5L5loWUpSZXFBe0y+JlyFVRBNHrdM/Y65uPrmnNplOd5hPhXqlza0sU7sAI9izPghPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS4PPF2F49754B6.namprd11.prod.outlook.com (2603:10b6:f:fc02::1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 4 Jul
 2025 08:40:52 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 08:40:52 +0000
Message-ID: <ba7f6c16-919a-4261-8677-056072572fc9@intel.com>
Date: Fri, 4 Jul 2025 16:40:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
 <b4cce11c-5ed6-4366-92c6-9a6b34998295@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <b4cce11c-5ed6-4366-92c6-9a6b34998295@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS4PPF2F49754B6:EE_
X-MS-Office365-Filtering-Correlation-Id: 74afd098-5b9b-436c-46c8-08ddbad67bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGVTV2M3aUlIOEVRcDZtSDBRMEVoVDlvWEFJNFdTMmxRTUFiWGg0MmFjekY5?=
 =?utf-8?B?VHJWaytTaGtMaWJXWGJ4K2FXWUxoWnRESVJRcW9UTlhSYnBBVTRuNU9PQUg0?=
 =?utf-8?B?aExxWGtuWnRHZGRVeENSZEd1aUI1SVF5ZnE3aXNuYjRTZVVIb1pLNVVUSkxE?=
 =?utf-8?B?dGdQaFV4a3NEOUovNG9UdTQ0NnZJU0V1SUs0VGJGYW1OeVNxb3lUOUxRYWE1?=
 =?utf-8?B?Y2JTUmxMQ1hzL2R2RXpoNzI1MmlYVVJ1bmRqaGE2RjdpQmhBemxqa2t1L1Nu?=
 =?utf-8?B?QjQ3aXJTakYvTFg3Z3oyYlEveXJadnFTOVpLU0h0Y3JTNThPa01aczY2WWRE?=
 =?utf-8?B?bms3QkVscEgybmxjVUpjRlMyaUlEYkNleGRYTUJrdHYyR1YzZ2hxa2RJRjZS?=
 =?utf-8?B?L0J1cS94WTFMSnRqN3hzWnhVWGNzNkJEOFZzSCthWnZlU2ZrNXJaaDRxZDh3?=
 =?utf-8?B?dkpSZ2VpR3BrekpxQVNHWFRsYkdlaEV1ZzVkZTFJamNKb2xjL2VQZjlHbHVk?=
 =?utf-8?B?RzRvbmhZUTF6ODZYRUVrNmd4UUxabUsxaGVWU3ZpSldnU0NMR2hGVDVGdmVs?=
 =?utf-8?B?YnNCVnljVVFIUDU5Qzl2dUFLeXd2QUdBNkljbzdYdERxUzR4ZTlkN3d0NS9i?=
 =?utf-8?B?NnRkWlBSdklnc05tTmZDSHNQK2I0YWhGQ2tLZ2p0WDBqNzJvWjhOUlU1UTJE?=
 =?utf-8?B?cXV2VWxtVHU2a20rbVJBSzd1TTR2TEVOdElEYnZtODZ4SFhEdk0zeUhBaFcz?=
 =?utf-8?B?ODhpQzJ3WUduWncram9qMEc3WnoybEMyU3NPNjQzYlBoazA2dENCM1JZNTZ1?=
 =?utf-8?B?MkpwQktGandKS3FYMmtKK2MvZ0JwZ2lpakdwN1dVbzYxckgxc1VUTzdXMXgz?=
 =?utf-8?B?QjVuRUxjWU50eExHd0N6MjYzbVhWTXE5aXprcFdSbUswbmlPUHhYVVJCQ3pj?=
 =?utf-8?B?bDZCeEhpZDJpN0duQkh4dkl6Wm1JWVJxSkdHM0hXQkZkV29aK3JXUW9nYi9G?=
 =?utf-8?B?VWVqNWtwUzRua2RpcERDSnRoWjhPbUFyMkhBbXdrZFBseWI3dHpBT3BMRDRm?=
 =?utf-8?B?L1V0UFJyOXkzZzllMkJ0TU94L0NGT25MQ1VyTXhVbUhhNFVpVHpkenBIeWUy?=
 =?utf-8?B?dm5TUE40TUcva0tBUHNrdW9RNlNuaFdDamlHdlVFdkdMbHFwWkZmM3grZ1Mx?=
 =?utf-8?B?VzNwMU5xanl0akxYSFIrenVtL29lTzdQWm9xT1VDUCtwZ2FoQmh1NlBmRWJn?=
 =?utf-8?B?Y01KRFdJRGJFeE41UTQ2RWVDWGR0S0NaUUpKVlRzaWFkRlJXSXJFc25mN3pW?=
 =?utf-8?B?OGhNVjQvS1lld2Ivbk45RmFSRTUxaEMvb1hBZ1poTTlGZUdHcWdGZEN0WHoz?=
 =?utf-8?B?Nkp3TElwdEFIcWgxNFBySFVOeEx0Z3IxTllWUXpOOGtwUlFZOHhZQllZenF6?=
 =?utf-8?B?N25uUWhhUFZSUlo5MXNYdkFkTkU0Z1Z4U1ppazhaczBQcmhkd3crZ3hlRHBU?=
 =?utf-8?B?UXRDTjdFbWlWemdPYVFnZmVQbkw3K0M1Nkk2Y0d5K2VDVVpRVVN3d2ZRaGJI?=
 =?utf-8?B?b1c5aWl1MDMxVTUwalFxU2Vzdmt0NEs1aExXR0tWTW5MeFhmSWhNa25aSTFO?=
 =?utf-8?B?MzRMdUwySWVEZW1QTHNiakxpQUloM1lVR1lVM0o3eEFGTXlqdXNhc1hkR1RK?=
 =?utf-8?B?M1NKb2tHNmJxbktWeTdPcDRJUi9BUzErRnpyWEpsM3l1MGIySU1hcUlyeWd1?=
 =?utf-8?B?Z3g0WWx2dVJJaHlSRTBjNWN6UmZnMzhLY1lkRjI3dzJkdjREa1ppRzJTTmJ3?=
 =?utf-8?B?elFlbTRtdGNvSFpxYjJQL3I3SDdrUnVEYkhuVnhoUTZPZjdaM3FjRVJVV2Nu?=
 =?utf-8?B?TVdpeDJwaXlCNDFVYndTRXJFbkRBVUhQaFpUTUh4K3E3NkN6RUpPR1lCazVO?=
 =?utf-8?Q?AgsVfbRDb8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNLQ3VmOWpLeTkzMFdPVTR2WnlXR1oyNW91WnNjaEZvVmNCVHl5bWVJL2V6?=
 =?utf-8?B?T3drdXNueE5odTFvbWxOYmE2NTBuc0UvWldoRXVOdmhtazNYendZcklnY1Mx?=
 =?utf-8?B?TFNqZE5RU3ZTc2FyNmdDQ08zWXJuWVJLSDhIeEp5a3J3UFFBcGNSOVc0Ykto?=
 =?utf-8?B?Sno2Q2toZkFEaFlXVGJiaVlPL09waGZ4cHM3VFRaRU1OSUVkakJQZGV3N3hw?=
 =?utf-8?B?bnV6WWU3MDF5TGVpY2ppdFFhL3ZzbkxoWWFXQTQ2TnhBZ2JyU05kLzNwd0RB?=
 =?utf-8?B?ZjFDTWZUdlpQWFlLdm12T3lWZ05EYjl5QzRjZE1BTjFHYlI0ZWhPYUdSd2NY?=
 =?utf-8?B?NVIzeExGTGpaRVFFaUk0REtMRmhaRWJ3cTgwbUhnMXF5cUI4TGNZK1dzTFQ1?=
 =?utf-8?B?by9SdllVQzVOS2EzaFoyNVBBeDRraS9yQjQ1bmNYYXlMa1lJNVFaMllBSlBi?=
 =?utf-8?B?dlR5Mk1xRFFNalhOWkZxeWNiT3lpT2N3SHU3VXVGdTA2YmhsSDZ0M0xlZUVC?=
 =?utf-8?B?UzI1T2kwTnBuYWtYV1U5VTFJWExldzV2VWpaZDlobUJiMkh0SXJsV2VDb0lT?=
 =?utf-8?B?WjFNZnhuS3RUa0tvdUxPVWlKU3hCYVlGYVppS1pzMDhRTVM1ak1tYU9NWkkv?=
 =?utf-8?B?aW5TR2NLSWJCeXlxRzNoTURaTDdJVXJrR3N1MDJzQlJWRTZNYjJqNUVNNXk4?=
 =?utf-8?B?U2kyMmw4L2dIN0NJQmlkNXhFdzhOM2tsTGlPK3NWemJ3b2dGT3dqQ3JnbmZV?=
 =?utf-8?B?R1ROV1NWOG9kazRub2E5S1lDWnFEd0RLM0N2eFQrU1A2TkdqWGhHN3BPeW5q?=
 =?utf-8?B?UHV3UGc5UG1jek4yc0VpR0NTeXUxSmxON1h6Y05NY3lLNFc5TmtMWGcvR2hF?=
 =?utf-8?B?d2NyWTNwRFlkMTBKTzh3bFNYUnhOcWZPTDRNUCt6YlphTVFJYkdYWEJLQjZB?=
 =?utf-8?B?ai9SaXhNWE9NV0Vxc2tuYkxEM0RKN0NiRnVXVStxZjZwdjZRTWFFTHgrV0xL?=
 =?utf-8?B?UHp4OUY2cFQ1aC8vVmtscTlQT3JPSEJDeDFweS9KUjdlcUJRMmhIRFU2UWd2?=
 =?utf-8?B?Q3FTdGRKL1ZvYytqUld4dXBNMHdDTmVheWFRaitnVW1qbi9IN1dma0c4ak4x?=
 =?utf-8?B?TXBiUjQvWk5HaENxbFZIWjJETHlJWE01L1hQVmdIdmdueXZXcTE5YjhvdkhC?=
 =?utf-8?B?dTZuc2RXR25iaSs2SS9wTjFhWHU1eHdzT0VzMjlUeWVkRHVLT2s5bmZ2Q1Bv?=
 =?utf-8?B?WExtRUUvSS9rZURuUTFreGRRNjVGN1orcDE1WU96RDhvTWhad1cxTWczUGU1?=
 =?utf-8?B?Nm9CQUNKdmpjd2x2N1A2UDkzZzA1NEdRNDJOYkYxU3pnNzdnMHFubGhDaVkx?=
 =?utf-8?B?SU1Mc3lOZndmMlE4c2lkeVZBdVRiQ1BCd1R0L09WVUxqU055SUxJMFc3eGZO?=
 =?utf-8?B?OStwZ3Y5SXhLMWNhN0R6VUNvZUxwOFkyYXFhYTJqZzBlSE05ZVljM0Z0Yldv?=
 =?utf-8?B?ZS9Ddk9jQnhVY1JhdWUzSHdPR040OGM4OVI1N1pEeE5aYW5rS05WelVreWNB?=
 =?utf-8?B?NGc1TThTVmtYUS9aTjNYQnFvY1gwYlZSRE5WZFZhNjFxT1VSWXMyK3VSdnJm?=
 =?utf-8?B?dDhKWmxRUlJqOHVQS3RrZ2p6R1piTVIrY1FGdEZ2WVlZVWVBZm9YbmJtdHhs?=
 =?utf-8?B?RUU1SWFOWmJBaW14dmJmMEh2MU45TDB6YW9jSXdaZzFXN2JpN1RvWDBGTGwv?=
 =?utf-8?B?ZmVpK0dWUTc4cFVJZTFoRXdMTUIvbjlpSFM4REJVSW1WOXU5dlZoaThScFZa?=
 =?utf-8?B?VlgzMUdBK09RVUFLM1Q2N3IxZlIzQ2xrTnhTdGxEdDcrTmhWUFFVaEU4L1JC?=
 =?utf-8?B?Vk1VNWtuR3RXRzVWbUc1N2FZQzhwMUFCeWQ4eElKZTloQWNLNGNSeVNrU0xq?=
 =?utf-8?B?bGdRZDd5Y0tyaW1OSXdZSVJMcEJNdVlEWjcvUzd1YlNpTE5YZlBrSjRLNzVT?=
 =?utf-8?B?Ly96cktpVXpISmVnUVVocEErMmVaUGw0OWt1WVM2TnBaenJ5a0V5N2FoaElB?=
 =?utf-8?B?clc2SEU4TXBlaVA0UElyODNGZ0tFUFlWWWkyMDNDNWtrUW9wZm1keTdwaGJt?=
 =?utf-8?Q?YPc6d/88LifiKmU8HL+e6pUvO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74afd098-5b9b-436c-46c8-08ddbad67bf4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:40:52.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGfZm8uvTnPWQVNjad2TKLROQ8PCPmC6yKKKHwMx0Jmaoz4DVF/wkB+2pULzZ9OJZhie0g3Z6tGX+m4gHQ6UyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2F49754B6
X-OriginatorOrg: intel.com

Hi Shrikanth,

On 7/4/2025 3:29 AM, Shrikanth Hegde wrote:
> 
> 
> Hi Tim, Chen,
> skimming through the series and will try to go through in coming days.
> 

Thanks for your interest in this change.

>>
>> One of the many things on the eternal todo list has been finishing the
>> below hackery.
>>
>> It is an attempt at modelling cache affinity -- and while the patch
>> really only targets LLC, it could very well be extended to also apply to
>> clusters (L2). Specifically any case of multiple cache domains inside a
>> node.
>>
>> Anyway, I wrote this about a year ago, and I mentioned this at the
>> recent OSPM conf where Gautham and Prateek expressed interest in playing
>> with this code.
>>
>> So here goes, very rough and largely unproven code ahead :-)
>>
>> It applies to current tip/master, but I know it will fail the __percpu
>> validation that sits in -next, although that shouldn't be terribly hard
>> to fix up.
>>
>> As is, it only computes a CPU inside the LLC that has the highest recent
>> runtime, this CPU is then used in the wake-up path to steer towards this
>> LLC and in task_hot() to limit migrations away from it.
>>
>> More elaborate things could be done, notably there is an XXX in there
>> somewhere about finding the best LLC inside a NODE (interaction with
>> NUMA_BALANCING).
>>
>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> ---

[snip...]

>> +
>>   #ifdef CONFIG_RSEQ
>>       struct rseq __user *rseq;
>>       u32 rseq_len;
>> diff --git a/init/Kconfig b/init/Kconfig
>> index bf3a920064be..e2509127b6f9 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -953,6 +953,10 @@ config NUMA_BALANCING
>>         This system will be inactive on UMA systems.
>> +config SCHED_CACHE
>> +    bool "Cache aware scheduler"
>> +    default y
>> +
> 
> Should it depend on EXPERT?
> IMO this could add quite a bit of overhead and maybe n by default?
> 

I would leave this to Peter and Tim to decide.

>>   config NUMA_BALANCING_DEFAULT_ENABLED
>>       bool "Automatically enable NUMA aware memory/task placement"
>>       default y
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 168681fc4b25..da1387823b9e 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c

[snip]

>> +#ifdef CONFIG_SCHED_CACHE
>> +
>> +/*
>> + * XXX numbers come from a place the sun don't shine -- probably 
>> wants to be SD
>> + * tunable or so.
>> + */
>> +#define EPOCH_PERIOD    (HZ/100)    /* 10 ms */
>> +#define EPOCH_OLD    5        /* 50 ms */
> 
> Have these been converted into tunables? I didn't spot that in the series.
> 

OK, they could be added into debugfs.


>> +
>> +static inline void __update_mm_sched(struct rq *rq, struct mm_sched 
>> *pcpu_sched)
>> +{
>> +    lockdep_assert_held(&rq->cpu_epoch_lock);
>> +
>> +    unsigned long n, now = jiffies;
>> +    long delta = now - rq->cpu_epoch_next;
>> +
>> +    if (delta > 0) {
>> +        n = (delta + EPOCH_PERIOD - 1) / EPOCH_PERIOD;
>> +        rq->cpu_epoch += n;
>> +        rq->cpu_epoch_next += n * EPOCH_PERIOD;
>> +        __shr_u64(&rq->cpu_runtime, n);
> 
> Another doubt i had, does this occupancy works when there is CPU 
> bandwidth controller running?
> A 50% occupancy may have different meaning when CPU bandwidth is set to 
> 50%?
> 

Even if cgroup throttle is enabled, the 50% might still indicate that
the occupancy on that CPU is real, and probably less "cache-hot".

>> +    }
>> +
>> +    n = rq->cpu_epoch - pcpu_sched->epoch;
>> +    if (n) {
>> +        pcpu_sched->epoch += n;
>> +        __shr_u64(&pcpu_sched->runtime, n);
>> +    }
>> +}
>> +
>> +static unsigned long fraction_mm_sched(struct rq *rq, struct mm_sched 
>> *pcpu_sched)
>> +{
>> +    guard(raw_spinlock_irqsave)(&rq->cpu_epoch_lock);
>> +
>> +    __update_mm_sched(rq, pcpu_sched);
>> +
>> +    /*
>> +     * Runtime is a geometric series (r=0.5) and as such will sum to 
>> twice
>> +     * the accumulation period, this means the multiplcation here should
>> +     * not overflow.
>> +     */
>> +    return div64_u64(NICE_0_LOAD * pcpu_sched->runtime, rq- 
>> >cpu_runtime + 1);
>> +}
>> +
>> +static inline
>> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 
>> delta_exec)
>> +{
>> +    struct mm_struct *mm = p->mm;
>> +    struct mm_sched *pcpu_sched;
>> +    unsigned long epoch;
>> +
>> +    /*
>> +     * init_task and kthreads don't be having no mm
>> +     */
>> +    if (!mm || !mm->pcpu_sched)
>> +        return;
>> +
>> +    pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
>> +
>> +    scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>> +        __update_mm_sched(rq, pcpu_sched);
>> +        pcpu_sched->runtime += delta_exec;
>> +        rq->cpu_runtime += delta_exec;
>> +        epoch = rq->cpu_epoch;
>> +    }
>> +
>> +    /*
>> +     * If this task hasn't hit task_cache_work() for a while, invalidate
>> +     * it's preferred state.
>> +     */
>> +    if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
>> +        mm->mm_sched_cpu = -1;
>> +        pcpu_sched->occ = -1;
>> +    }
>> +}
>> +
>> +static void task_tick_cache(struct rq *rq, struct task_struct *p)
>> +{
>> +    struct callback_head *work = &p->cache_work;
>> +    struct mm_struct *mm = p->mm;
>> +
>> +    if (!mm || !mm->pcpu_sched)
>> +        return;
>> +
>> +    if (mm->mm_sched_epoch == rq->cpu_epoch)
>> +        return;
>> +
>> +    guard(raw_spinlock)(&mm->mm_sched_lock);
>> +
>> +    if (mm->mm_sched_epoch == rq->cpu_epoch)
>> +        return;
>> +
>> +    if (work->next == work) {
>> +        task_work_add(p, work, TWA_RESUME);
>> +        WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
>> +    }
>> +}
>> +
>> +static void task_cache_work(struct callback_head *work)
>> +{
>> +    struct task_struct *p = current;
>> +    struct mm_struct *mm = p->mm;
>> +    unsigned long m_a_occ = 0;
>> +    int cpu, m_a_cpu = -1;
>> +    cpumask_var_t cpus;
>> +
>> +    WARN_ON_ONCE(work != &p->cache_work);
>> +
>> +    work->next = work;
>> +
>> +    if (p->flags & PF_EXITING)
>> +        return;
>> +
>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>> +        return;
>> +
>> +    scoped_guard (cpus_read_lock) {
>> +        cpumask_copy(cpus, cpu_online_mask);
>> +
> 
> As pointed out already, this is going to be costly in multi NUMA 
> systems. Any cross NUMA access of
> CPUs data is going to add overhead to system bus bandwidth and this 
> happening at tick could be costly.
> 

Yes, we are trying to reduce the overhead of CPU scan, although this
scan happens not at every tick.

> Also, taking cpu_read_lock does preempt_disable, this could add to large 
> preemptoff?

cpus_read_lock() just disables the preemption for a short time I
suppose? If it can not get the lock, it enable the preemption and goes
to sleep.

> We need to measure the time it takes on large system. Will try and get 
> back with that number

OK, looking forward to it.


>> +        for_each_cpu(cpu, cpus) {
>> +            /* XXX sched_cluster_active */
>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>> +            int m_cpu = -1, nr = 0, i;
>> +
>> +            for_each_cpu(i, sched_domain_span(sd)) {
>> +                occ = fraction_mm_sched(cpu_rq(i),
>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>> +                a_occ += occ;
>> +                if (occ > m_occ) {
>> +                    m_occ = occ;
>> +                    m_cpu = i;
>> +                }
>> +                nr++;
>> +                trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: 
>> %d\n",
>> +                         per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
>> +            }
>> +
>> +            a_occ /= nr;
>> +            if (a_occ > m_a_occ) {
>> +                m_a_occ = a_occ;
>> +                m_a_cpu = m_cpu;
>> +            }
>> +
>> +            trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
>> +                     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
>> +
>> +            for_each_cpu(i, sched_domain_span(sd)) {
>> +                /* XXX threshold ? */
>> +                per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
>> +            }
>> +
>> +            cpumask_andnot(cpus, cpus, sched_domain_span(sd));
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If the max average cache occupancy is 'small' we don't care.
>> +     */
>> +    if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
>> +        m_a_cpu = -1;
>> +
>> +    mm->mm_sched_cpu = m_a_cpu;
>> +
>> +    free_cpumask_var(cpus);
>> +}
>> +
>> +void init_sched_mm(struct task_struct *p)
>> +{
>> +    struct callback_head *work = &p->cache_work;
>> +    init_task_work(work, task_cache_work);
>> +    work->next = work;
>> +}
>> +
>> +#else
>> +
>> +static inline void account_mm_sched(struct rq *rq, struct task_struct 
>> *p,
>> +                    s64 delta_exec) { }
>> +
>> +
>> +void init_sched_mm(struct task_struct *p) { }
>> +
>> +static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
>> +
>> +#endif
>> +
>> +static inline
>> +void update_curr_task(struct rq *rq, struct task_struct *p, s64 
>> delta_exec)
>>   {
>>       trace_sched_stat_runtime(p, delta_exec);
>>       account_group_exec_runtime(p, delta_exec);
>> +    account_mm_sched(rq, p, delta_exec);
>>       cgroup_account_cputime(p, delta_exec);
>>   }
> 
> AFAIU, this works and cares only about SCHED_NORMAL.
> update_curr_task called by common for RT/DL too. Maybe avoid for those?
> 

OK, will fix it.

>> @@ -1215,7 +1434,7 @@ s64 update_curr_common(struct rq *rq)
>>       delta_exec = update_curr_se(rq, &donor->se);
>>       if (likely(delta_exec > 0))
>> -        update_curr_task(donor, delta_exec);
>> +        update_curr_task(rq, donor, delta_exec);
>>       return delta_exec;
>>   }

[snip...]

>>       check_update_overutilized_status(task_rq(curr));
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 47972f34ea70..d16ccd66ca07 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -1171,6 +1171,12 @@ struct rq {
>>       u64            clock_pelt_idle_copy;
>>       u64            clock_idle_copy;
>>   #endif
>> +#ifdef CONFIG_SCHED_CACHE
>> +    raw_spinlock_t        cpu_epoch_lock;
>> +    u64            cpu_runtime;
>> +    unsigned long        cpu_epoch;
>> +    unsigned long        cpu_epoch_next;
>> +#endif
> 
> Maybe these can go to their own cacheline?
> 

Sure. Do you mean there is risk to cause false
sharing, that theres *_epoch could race with
either atomic_t nr_iowait or u64 clock_idle_copy?

thanks,
Chenyu
