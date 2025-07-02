Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CCA32C85;
	Wed,  2 Jul 2025 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751425013; cv=fail; b=rO/EQF2lsf7Yhkcbg/HDVDjzUbxn7vrtOPyxnxedd98JwbAr1tcoAswASY4LNInj2fqL6OshWhGCUS95YqGm8FYKlEiHfr6auKGZTyaeTMguA0jRQxTgz1WFHYAQUfXlURurQxVhOMzthxqeop3Z3l0sRR8RJcFBT6RCTyIsFUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751425013; c=relaxed/simple;
	bh=Lx4WmWgPJRzydRWIWTtQXDp9ME8DLmWNiV4bWlpFJQI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NdMVXpsx6JUXUu6265A3JUmacqzPkngHurNXXnFAB0Bj+mRmA3fII0qN/NO4E5W2MiKi+tHJF/EZOIe9sQovqJ0tft2JYHq6lG0kvtGVRVY2lqyBc+8uiO6Ihnt5Z1V1LHQ4EJRs1QoJXeU6hG3zo39VCJj5d0R3jLG6NC7ym5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIw2iYJe; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIw2iYJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751425012; x=1782961012;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Lx4WmWgPJRzydRWIWTtQXDp9ME8DLmWNiV4bWlpFJQI=;
  b=YIw2iYJeUAIENJJKR/FAB2u9PbuhK5r4pkUbJg1p6Q3Sc9zQ2XVhGrwt
   mnAl9RBkPg8jc/qodBgO6qtlBVJ6QvTnvKZg31dDkRH1ovjcT8rU1J7tG
   mznWFIuAchDqEn07/99YSyB0nmZayW38fWRyvu24LVan/SKj3lraLUk5t
   g324mlMjWRIb4doHfe8oeFjwQFgy5fEEuJi70QdXqkP8F0+lk2MvtA3hi
   rYKhG7n9YPGaf89evrZwmTWYGfcrHyWwTJ2X35w3KoHVU5L69YP9jwfws
   P1hgFBXlQaDIC6xwH+5mgV46zoYwyLFJuTHk9jjf4TepbsHfQSzefNdr/
   g==;
X-CSE-ConnectionGUID: Bc5dk3o9RaGMF16yzphUIA==
X-CSE-MsgGUID: G13JXMkxR1GpHKJJJOSRLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65163093"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="65163093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:56:51 -0700
X-CSE-ConnectionGUID: IqowxoYxSM+6h22iFR+KXw==
X-CSE-MsgGUID: KGBJ1+d4TT+78ZuOiSzjwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153348153"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:56:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 19:56:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 19:56:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.77) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 19:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIvYKeDRJ37aU64l1MLZNrYg9Ljk9V+QzBnJkZcR9OzwYtc/c6N8OVvcAGDqL8s7f8NqXU9J8XeM4AvmhwZWq8IxHRaAaHZ8KAFIIkT8OUtC83ffRHOx0XTuIfrmV4BcK6027MjW0iq3Ioh1CB6QzUG3NSk/j/zaZXSc01hV2CchJiGnhFxsKJbWqP4k/HIVx2KAthVa+EMYD0PYtqEwRVc4PpEkqN5NSOEXRmaoJ7Nl9ePMgmmNk/mkIlNEV4GUQgr9JfbYPb9wLfZNfCja9Umv0cZwWzNQRpHYEE5DHyvwustwKzVDl/aFb3iDzHITkj94kXyI3JoQwuacQpg6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmQkDYh11GAsJbi5x5bqvrdz3dnep/k2o1/CwdANmRU=;
 b=pmrAy2owXX7WpBW5r+6xraoP90DZpJyeq2vcpsLi2piYTl6LsHj/tu3+XAELRlhJYIDpwiiPsNkGaP/5t/NJm8kT82SFBEvSj/WEhrkiczJ+23L+i0jKXq0wAQZ/rXKUieN0+AguZ7niBimubkgiwa9NRTImtg+FCFZxikJgG14PL13HwsWRD5OyKFxyg18Pom6inVGQbzLUS/gacGJuh7WrmwMHMqZ4FQvNw145vUITrSfDYQ/FJLgjpIlcjVHCRXTNygwIgI3qesTqFKAPqnYfxnD7mAsWDHiQ9Mn1+F1q2G9rGgDcyjN9JaygHglKItjmOMOmfyvf3M6Ep1ODAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 02:56:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 02:56:43 +0000
Message-ID: <29acd88c-144e-493e-8721-07828a480d76@intel.com>
Date: Tue, 1 Jul 2025 19:56:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/32] fs/resctrl: Introduce the interface to modify
 assignments in a group
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
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
 <1fa5ee1e36bb599ae33d772e7a3c40fd3a4abe82.1749848715.git.babu.moger@amd.com>
 <7d149e94-ab9d-4db7-abb6-83aaec1e6735@intel.com>
 <3a3f7af5-6b21-46f5-88e4-d534c9cacb10@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3a3f7af5-6b21-46f5-88e4-d534c9cacb10@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: b3aa655a-8901-41f1-61cd-08ddb914138c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3pUVkZVOTNEYVVPTjV2UnhVQUxXMklYSkRUN2Y1bWFuSjRCRXRpSmNENTJ6?=
 =?utf-8?B?c0JkejZxM1hEVFZPQ2JGRitwSlk2MGEyZlhRMzhxTlpJenNTMmw5SUx0Nlli?=
 =?utf-8?B?cGpkd0ZQaEpNNUdBVHVPamU3VWVZODZ6NjZTb21VWjBjYlAwT1BXRURHM2Ji?=
 =?utf-8?B?dnhLODNqVzNVZ1ZRMUpzY2ZKK25uQjgwRHB3anoxYzdmS05wREVCL2JTL2N3?=
 =?utf-8?B?c3F0a00wQWErUG1ha3NjZlg5dm5TaG5rY2dxOHZOLzRSK0NEQUNqSUN3VVhZ?=
 =?utf-8?B?U1lIRlJCUEt1RkNFN3VGNlVxeHhlTFNGNC9wZHFQM3hHOGV1bkowbk1qcit2?=
 =?utf-8?B?NS9ObWtOb1Q1eHFXYjRJQzFSMHo1czZ5N3lGeWQrNTdMMFU0c0pQay9HSTdV?=
 =?utf-8?B?d2pLRHUrN3pYcVNySE16VHdPTjVVZGZ5YzlRSUphdnNQUXVILzRkUmw3S2N0?=
 =?utf-8?B?MFp4QTVMb2RHcllsK2doRDVrTVk4OVlqRXBWclR5UXJURmVmanROVlhuUEtu?=
 =?utf-8?B?QzNOMUxQUDhyMXZldDhoUG5SUWtEZVBnVnNXbytZYVdUbWRhdSszSkRvVGRu?=
 =?utf-8?B?QXNKQ0N0cWtSdzVWTHhmRmQySzJjeHA2T2hiVEYvQVZVOXl2Smt5bFJGbmNr?=
 =?utf-8?B?TUZhY1pYZzFTOFgzU0hUd2kybmZIZ2VKb3U5cFNyY3VnajVPc1pnVDhxcFBT?=
 =?utf-8?B?NTJRRTI2QVhTUFNLT2V4Yit6RkhNMENra1FvSTY4SndISDZzcWNIU2dxSEZB?=
 =?utf-8?B?UUxvVXRCMlEzL0hlRVdDYW9pWG11ZTFoajVEcTdaQ2NxcVVXQjBBODl4bllx?=
 =?utf-8?B?SVQwOUtzZUN4N01XR3Bna0RJZHhxTS9sQ0hwZzI4WVpGL1VtRkpRb2pTVVVi?=
 =?utf-8?B?MlhaaFZzcGF4N3UvQklkcEJlcnd0cDYxeWpSb0Rkalc3SE9Wc0IrVWxUNzg0?=
 =?utf-8?B?SDRpcHFDYkZXZTFPcU00ZjJQVGJ6ZXdSSnBIRlZyNlBQU1NZRUhWaFZNSWQ1?=
 =?utf-8?B?eWkwUG8vbjU3dEpqLzRxQlIxYStvTmlUc1F1VDlQYnJBU3dHaFNlSFgxVnFY?=
 =?utf-8?B?cHVNK2x0VGJOTFJLQU96YU8wdDNCRnNmeTRxZGpyaUpUbGZDRmZYek42bUNx?=
 =?utf-8?B?QVduZWxrcGE5MUc3MUs3QlQzYjFnUEJzMC9mcUYrVk9kMHk3OXhVNmdpcERv?=
 =?utf-8?B?WHBGRHRMdEQxN3p2Q2UyQWdYMFRCNEFqWkJkRHVFUXIxODRpR0xDZ3BGQkZI?=
 =?utf-8?B?OFFrQWpQNm0xVlBDSysyOXdrVkhYdExYZE1XL0xTdjNtM1FPZUcvdWVMdGx2?=
 =?utf-8?B?RHd6YXY3R2VEYUk4dlkrbDVlaFBWRU1nUkRtSUU3Z2J5Qnc2ZS93bEhlQXlm?=
 =?utf-8?B?bytmZHlkdTBackNkM2ZXa3hGKzdPek02SmE4endXSU1SclYwdnVNNzhnQVd3?=
 =?utf-8?B?VjFmaVNDRStZbExuL0dpei9mcEV5VVdsRTloaWNQU05tNlFJVXB4S2JxOFNu?=
 =?utf-8?B?UXQwNkpxeTZRZFdOVG1GejRnYzNscWxRMERkWDRBS3ZUQVErUFUwOTJuWStD?=
 =?utf-8?B?OGtaQzZZanJPZkJXcy84MGJQWWkwUFJUTnYyL0VaeUt2Qmx0SGJDNVJNWlVv?=
 =?utf-8?B?MlNzaUdxdTlkY3VRVG9UaHpyTER5QlR6eUFyd0l5blpkV2NzOVFsQmxUZytT?=
 =?utf-8?B?MmtjMWxoN3R1cEp4R3ZEYjdwWVNuVFc5MnJVaEJ5WkNVN1h0czA1VlhJTnRQ?=
 =?utf-8?B?UEU1WlU3QThBeVdmT3VacDcwZDJRZHZpZXZWV0M5UTJDUDVnZXc1L055dndH?=
 =?utf-8?B?WnpSNjRXNG9MTFdQUGlpZ1ZuRjE4WjFaZ3dDL3lNOC9SdnpUR1p4VEJjQXJJ?=
 =?utf-8?B?NlJEWnFFeE5Pem5xaUwySmdNSnU4R3hrUmRQYXZzUThaWFUyTVNZdklTK0JU?=
 =?utf-8?B?NS8xamdDVVhLLzNyU045OEJtQzJuOFVYY2VITng5WFZLaW5vekIzdDFZanIr?=
 =?utf-8?B?cnRjdHlVS3JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnd0aURiaTB5UVVLQlFGZ3dGelUzVCtwNThzV1cvZ2ZOb0ExM2dDMEE2WWsv?=
 =?utf-8?B?WGpMK2VVQjVnbjU5bE05QzVkempsazRmSlJTNHMzeWZ3QXFacm5kdUxlTUlT?=
 =?utf-8?B?UmhQaEF5NmlWYUpuTUpRUnNBNkFVaFdhaGFDbUZMdU16M0pHRFM5RXJuR0Za?=
 =?utf-8?B?bWxBdzBOOXlRSW9wdUUwa2VGSDk4VUZjcEdTaTk4MlNNbWE2U2p6RjJjNG9h?=
 =?utf-8?B?clRtWUk2K2tqNi9UbG1rSk5lNlRqaS9TMlJwMmFja3NPM0RZd2x1QjJNUVBj?=
 =?utf-8?B?ME9ubGM3Ni9rZU1hRXZ3aURSYmM0OFdHTGQ0d3o3M2cybXZJSEEzLzVaR2FU?=
 =?utf-8?B?bUw4bEN5U0hSNFlDb1ZDRXFNVm0rdkFCZHJSSE1LZEo0VjhVRE1obUlFQlBX?=
 =?utf-8?B?ZEFvbUpwOFZEdDhHZjdsSDhGRnRDRnVwQVBxQ0ZzdEVEOHFxdnc1TlFJNzY0?=
 =?utf-8?B?T2RSeVR3MnRKbEVCaWhkUHhuSXBtNWxtTGc4a1pYYU5ZbXNNZ2Q2Nk1DNFhE?=
 =?utf-8?B?ZFdmdTY2Sm11bHJjc0xlOW5Bb0ZBVnZWWERPMWdwaFo0NFh6V2FnOE1JZTRR?=
 =?utf-8?B?MGphdzhCNFRBakIxUXZ3Ti9xOEVKMWc0R3pBdmlveHFDcnJ5VkxMRFBlZUN3?=
 =?utf-8?B?QzcwQUxhajVUQmVkd3RFQ3VjYTVRcEZVd2F2Z1V1L0ZQa2swT1BLNjgrMXRL?=
 =?utf-8?B?a01NTlZJUVBOa2plSlF5T0VaSXJMa2NONFd2OVFrOU9ObmJueG83dlVuVnpZ?=
 =?utf-8?B?aVFEb216NHpqK0hOdGFRZDJaZUg3SnZUYXF1ZVZ2aExyWDlkWjNkbmQ1aG92?=
 =?utf-8?B?VkN6U1Z5SmhMbXNuL2t3VldEblhvMWNhVFEyQlJJZDVGSlJvRG1sZzhzRTFk?=
 =?utf-8?B?QjM4WDJsRkR3OEllOTZwdmdIcUhzckwyVXFEYkp5OFVjV3dFNzMyd0d2N3dB?=
 =?utf-8?B?aVVLTXhNVVhQdE9UaEt6QWtjQlVFckdOYzE0bXBPbml6S2d4cHhDdUpOcmla?=
 =?utf-8?B?ZlVHM3RHZ0trQVQ1L0ZOK1ZTeFhBV2lrOHRIUVZPdHNrblROTXZoZGdpRXdi?=
 =?utf-8?B?d3Y0bXRCQzYxQ3lhL1k3UFE0ZjlwREc5YWJESXFESm8zRldTMHRpRHc0N2lj?=
 =?utf-8?B?SUNGTk45d0FrdmxJVVArbFB0YnFreXNndFVrYjViZ2N3aC9xc042RlRVbVls?=
 =?utf-8?B?aXh6RzBwN1BTMVRReVE3MmJZUnQrTEQ4dUxlZ2VhbUJkNUFjRXgxelhOVGdu?=
 =?utf-8?B?WG5HcHhzWFNyYmE3aVpYU3BEM21nZjdtODA2ZWU0UFNMbWJ4YWlMVEdZRGJE?=
 =?utf-8?B?TnBrNy9idlk2TjRsdEZicWU5VVNmaTdpdTZUaFZ4dUdIQ09JQk9rU1d0TVBi?=
 =?utf-8?B?UkZrS0c0WlBrdEx1S2VLbFVzMU5kaEZvZGlJSWxscVBIZFVTM1gvTk12ZzV2?=
 =?utf-8?B?TkovZTh6QVhOWVdCd1VVSEttZWE0MlNHZlRVQjZhazR0YlA5UWROYkZiQTN5?=
 =?utf-8?B?QWl2Q2pJN3dnRlJ6SUJiaWt2dlZHUnBaTno5eGZPcC9HM1g3cEEwL1Zhelcw?=
 =?utf-8?B?Wk90SUpyeU45RGVkTWh1Vm1Gbm11UXBFcGdBSVd5Yjc3MzdOMzhYNUVoalpW?=
 =?utf-8?B?c3hlc0xsUnFzdnFJR3FzNE1DbW1oUktkcHpnOVk2UnVPSks4eEtzL2lSYnZL?=
 =?utf-8?B?bnB0eTdTZ1V1SEVsNVlPRmhGcStXMUFyMEJ6Y0gxcHpqNlYvYW11QjRMV0I3?=
 =?utf-8?B?d3ZIT1E2dDBLNFNaaGIyZlVNdlFTbk5jNjZ4Y1NTRXo0UzlsZ0xrWklJd1Rk?=
 =?utf-8?B?SjFKUFJEQk5oeDk0Zy84RFh2V3ZaVDhXMnd6TktMblpNOW9vOFl5YWU0aDNl?=
 =?utf-8?B?emV4aHhvMkl1WnZsa1VnYU5IY0I2RFF1QTE0cTBaQjFxL0MwTmsyQ2Njdjhj?=
 =?utf-8?B?dzNaZHdpU3JOV01uS1lwNC80NHJaL3pRSXI4RkVjdHNYOW14TFdLWG5zekV4?=
 =?utf-8?B?LzY0YW8yOFdPdFZMMURzZUY4T1MwRjA2N1FlajBLWEF2RUZWZ0lIa1owcFdY?=
 =?utf-8?B?SjRFOW56dDhLZ0tTdUN6dkt5U1pIRlp1emJ3ZTJqYXlITmlrOXpnRm14eEZu?=
 =?utf-8?B?OWNGcWNFeDhESUd4VUZhRnJBKzloMEVuU3lTc3ZKcnQ3WlhEWHdob1k4ak93?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3aa655a-8901-41f1-61cd-08ddb914138c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 02:56:43.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWgmLHP5wkhWsmWn5ycfxSDv/0zqzMcqmGDlkO1baDIPsEYJkaL8u7f9ZeClTaJ4yjYbjCQaOrdRdBnzOJdnJo59nu3IX/JPemO6ksP39C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
X-OriginatorOrg: intel.com

Hi Babu,

On 7/1/25 7:18 PM, Moger, Babu wrote:
> On 6/25/2025 6:38 PM, Reinette Chatre wrote:
>> On 6/13/25 2:05 PM, Babu Moger wrote:

>>
>> Apart from simplifying the code an additional benefit is to avoid
>> (ab)use case where user/bot may write:
>>     # echo "mbm_total_bytes:*=_;*=e;*=_" > /sys/fs/resctrl/mbm_L3_assignments
>>
> 
> Why should we restrict this?

I see it as unnecessary churn that can easily be avoided.

> 
>>> +    } else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
>>> +        rdt_last_cmd_puts("Missing domain id\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* Verify if the dom_id is valid */
>>> +    found = false;
>>> +    list_for_each_entry(d, &r->mon_domains, hdr.list) {
>>> +        if (d->hdr.id == dom_id) {
>>
>> Similarly, resctrl_get_assign_state() (new name TBD) can be
>> called directly and "found" can be dropped.
> 
> I think we still need to know if the domain id matched or not.

Of course, and when the domain ID matches, just call 
resctrl_get_assign_state()/rdtgroup_modify_assign_state()

> 
> I think it is better to call resctrl_get_assign_state()(now rdtgroup_modify_assign_state()) at once place. Code is easy to follow.

This is not clear to me. Will surely take a look at how this turned out.

> 
> I have taken care of most of the stuff. You can review again in next version.

ok, thank you.

Reinette

