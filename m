Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4320FAB2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074063; cv=fail; b=AaGPOIuYcnWnG7PpS0Fh0TaAebGfAJ5rkGb8YlQsxZbkgaOAvqFMw/KlrIjyMiB0eYEpZejlhyr24hkOSdUepze3KlmfgZUwNjjVKwrwz8xeV3X6MbnEl166CFQcX4wLmyPMEYUKqPLNE6yBMSR1zGLgZBBGBmC28OBZTW14VmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074063; c=relaxed/simple;
	bh=ihwWxpEHfsOhAffQOFbc6ZzWjvv5vDlKzPjXdtD3j20=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BjBTa8vAiduLCsfgYaChXcEMsnE7e71tyg8/cPXMuRGWe5axhIpA9M2prLoBNLMDXVf1xY8XH5b3sKC9C4r+iTg+ab0jI867GCvUdPYy5B95ImxoqHv3MglPdIimM1x2NJtA+y8AQUJP+QZU/ygLmzV2DOYkHr8deaLrXV3j8Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b34X/4td; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b34X/4td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743074061; x=1774610061;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ihwWxpEHfsOhAffQOFbc6ZzWjvv5vDlKzPjXdtD3j20=;
  b=b34X/4tdtGxrrR8Jm/DXZmdDl/mVmclid0BSYyXSanlS8Cb1TH50+I6d
   7ROPhK5S1B4CR56cwbOU70mZzHQ2MT9di62XnnZrgNsWIsEsAxDS6N8ur
   HCm/HT4tCXcDC5ipWqYPajo2/2ZO911VV6T3A7mI0sleJr/POmBKCoSOi
   beZWmob6MxMwNqsQjC2mfIMGVKmAieW4Kxo8G4VOWcSaN5bNOQot4n4BX
   tAhlj+i1kbJAXNWZli5nZ1D+ua55ycP22YsVGGyXIjYXDNWgcSK4NMGjm
   iOiMTSpVztwWKjvEE1CxtQ8pAP7COU9qN08gzNGI893kKOyzcGBIRJMI2
   A==;
X-CSE-ConnectionGUID: PCkxsr77Roi7G5B+VGC9pg==
X-CSE-MsgGUID: mWoJI4w1RCaczXFncomi7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69761855"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="69761855"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 04:14:21 -0700
X-CSE-ConnectionGUID: IWqq3V91TdaDVoj7Vt0PSw==
X-CSE-MsgGUID: 6Yd9jYONTxyOwEd+JwJe+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="162343352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2025 04:14:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 04:14:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Mar 2025 04:14:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 04:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGYRwUsNPUCN7UlNXdn+SAoubfxwSAnevmwTFSzZyVfJYmkloXMrMnNDcDWiE/PQKitcCjLR7W4u5vid5NOn9u+0dVJVhOp2mQSuJZ4bbHkhXhcciCTOBZBW6Vhxzick7XDsFRezhrYITirloMThyo+o0FKewcvS4KEPv6N4SdH5J4jytiLBnqUiBigmJaocUPrcu5vwJAoQl6TCrsX+vOdKoy+auVMw/H5AndnbdNWbiCv1kOGFpI4GfhpXjWjZSwClnmMucqATuXjSRy5I+UD7Dy6Tl4v7os3FhRlT94px/mPDT62BuAiL8//+JkAs6pEWxiLxSeyLT2cKguukWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLA4xCj6urcf3obhhfd+1U28FAxISX4J8oKC/emYgkM=;
 b=PUbcajJjqp61m/RHwxnQgRguWBHoXkjfY7CqCxAPbDxafmeQ+ulwc49iNXVxBSSDGcPU5RfvCLyedfK3u1hFXYschrDznPoqTDBgQq40GlXXJ1NYJk98AJ+ZyuwTnk0Klfo1X7FOTEJwWeOc4XTaRRaDV/yTZQRfJ/YhuZqJg9O6tvkxb1SezRO3fMtEfpldsF100eE2VpvnBE7EJKBvmzdREKiSzB6JFXNnm8awuboHBdL1udlFS38plm2931zJbN2B7RwMfPPAv6l2NfXyqFYCSdZQblcSNvqTxwMXTWrlHny5AbTmmhak/hcloVg58HqaVdvMJIdf08ZQ51jsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 11:14:17 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 11:14:17 +0000
Message-ID: <457a6070-b34e-4467-8251-f69c4015fccb@intel.com>
Date: Thu, 27 Mar 2025 19:14:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: <vineethr@linux.ibm.com>
CC: <mingo@kernel.org>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tim.c.chen@linux.intel.com>, <tglx@linutronix.de>, Madadi Vineeth Reddy
	<vineethr@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <8f5f01cc-c88d-40e6-bc64-74d0e2093bf3@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <8f5f01cc-c88d-40e6-bc64-74d0e2093bf3@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU1PR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:802:19::15) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa603a9-8296-46f5-8f31-08dd6d208377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1pvTVBSYjB3c3NrU3VvM2pjTDNmek8vblU4NDZXSTNOdnkvSlgxTlcwcno1?=
 =?utf-8?B?MG9GM2tUTm1LcFYrczRTaXkvRFBrZ1VCUU5WdDZ1c3NFazRKU29VL0lWc2NR?=
 =?utf-8?B?ZysvTVllVlZlQmFrQXhEV09xWGVpNll3eTEwVEV5c2x5YnVuWk0rY05pbFRH?=
 =?utf-8?B?cXhxbWh0alltRVk3RDI0N2RjM3lFRlZQN0FBQStHalRreDgveXc2VEsraTc3?=
 =?utf-8?B?b21MaVJva0RmamtvTXRYYmdlU0dRWnE5YmQ3R3Zqb3cyaS9ibnloei9EV0Zo?=
 =?utf-8?B?ZW9LK3pVR213V29uVWc0a0NYVDNERnllSk1COVB0MGZ5NkVQTUlQbTJRTkRv?=
 =?utf-8?B?NDJ5VjZNUFRQbmZhUFhNYUFPRnBVejdzRkJCelh5L1Z5SVgrOVBaWlM0ZCs0?=
 =?utf-8?B?bzlUSUdxdFdLOHpZbk5kU1dINWNTMFhqMDdQbmhGY0JIandmTzFXTDh0Z2Q0?=
 =?utf-8?B?Z0E2Q1lTbE9iWXlnVVR2b2xYR2g5V1dtaGZmbFpXdVczTmZIaW9OSWJoODFo?=
 =?utf-8?B?VGZCQlN0Q2dvbGkzdkRPTEJZRVZNbzlTYTNWNGhSdVdtREJKc3FjN3NoMk1W?=
 =?utf-8?B?UklxdGZQaE0xYTJlQU9CU3FGeGl3RTdxRzkxRXlMY0dWQmxtait1Ymh5KzZE?=
 =?utf-8?B?VTVYQ0ZJVURocUtpUDdEVk1zNUk5MEwxZXAyR1Q0RmFlU3JxK1pqUC82Nlg1?=
 =?utf-8?B?SW9EbzlDYzRSSzNmQXVicFo0TVlISFRkZTBkZVlOaG5wcytjYjZHdzJGQ2FU?=
 =?utf-8?B?YlNRY2xqZHY4T2hkdEl2VE9SeXVpWko5THJDT2dmRWtuNWRGRGdQRXB5eGEr?=
 =?utf-8?B?aUlqMWZIYWkvTVZFejlHd0RnZ2VxSTZOY1k3UzdVZ2pWYTJzT1BsNm5PZnh1?=
 =?utf-8?B?MGZqWTNDSFM4eGlrL3pNRy8xa1hhVnJyblVqRGRIQnBDL09lRWI3S1gwRjIx?=
 =?utf-8?B?NmJKb09PK1JGbWl0Y0pYWDBkd2g2SjlzU2NTZXNIUWsyUnByL2ZmdWdqRzBx?=
 =?utf-8?B?SHpFM3E5cjJHMzZHWExVaW1tc0VwcWNTOVFTZ0NsSHpHbVE3UmNWZHFDamRY?=
 =?utf-8?B?Yzc1eGU0czdIT2dhRExOVVU0dnpiS0dldEJsbk41V3BMVW9jemVuSEF5aWQ5?=
 =?utf-8?B?d2R1RGRjTEVLcXZreis1eWo5OXR1SDdqcG5PVDYxTk9JRWV5eE9wckhyemFN?=
 =?utf-8?B?cSt4STVWSDErUnhnV2hTOXY2OEVDYUNHUEdaNmNhd1EzeHVQSGhERHVUTENG?=
 =?utf-8?B?MmZMbGt3eUNJRW5kMjBFRUxqSzB2V2FVMlpiSjM5Y2RTUUpuaGltckNzN25B?=
 =?utf-8?B?ZGIwVHlSbklKWjlzaTZSOWVlTVprLzRhaDRjVWg1Q3JiY1ZEUmFhK0tTaEdQ?=
 =?utf-8?B?K0g4dkQrMzcxZURMc2xzcEovRHEvWFlUZ1dFZnJOSTl6WFdwRDRPMmJyRE1u?=
 =?utf-8?B?bC8xYTkyNW9rdHgvSE5KR2t6MHZDU2J5eWk0R2dUYUVYSGxGQU1wWHNxOElF?=
 =?utf-8?B?YlJQdFgzb0tYaGpKMVljc05OdXluTEJwMFhBTkhza0lJWmJPdjVpcEM0VTJk?=
 =?utf-8?B?Y2hMZm1hTjd4R2Zwem5PN2p2RG9razRBdElpRmZYbzRHUm5PK2ViV2puaTB6?=
 =?utf-8?B?TkhCNUFRcUpHcFA3eG9TcDNKWEtlTjJrYXlyUnBKYzAwc1BHOVhKa1V6Y3d5?=
 =?utf-8?B?TkxNSWZ6NTFPUzhqWGlJN2lLUTFuUE5zMnZhaVZWUGI3dllNdHFDYW1jWFlB?=
 =?utf-8?B?VjVtQ2Ftcm4vWFVsZ1ZidlZVcWZydWNmZ0tzTys3RDB4bmtzQU5HVi9aVlVr?=
 =?utf-8?B?YiszSmpjeDlmNUdnQU8wZTNjaS9yTk11QlFDbDNlVWRXVHd5UDlGRnJaWXdW?=
 =?utf-8?Q?rS4m5x20EHemE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpnVVF0YXE1bzg1SWpYSXU5bHIrU1FxUXo4cHV2WjIxdlJUOUw5TGlFM0tn?=
 =?utf-8?B?U3N5WXB5OWQ5VEVOMmxvSnd2alh2VExBeDAzd0VjSFlia21sd00vSnNNYjRq?=
 =?utf-8?B?NFRybVdwL2JCd2IzUWZxWDdSYUptMUVrVzkrSUlGSXN2b3d6aVRxbWZSb3h2?=
 =?utf-8?B?N1ZwOGVvalFtNEpKVHUwMkdEamhTWDc5OU9pOGd2YTdtUjFKbjdYVWxHcW43?=
 =?utf-8?B?Y0VnWmdiZ2prNEZRVURPV0hTb2V5aDZVVng1NnFoK3pGZGlnMEYzM2tUT1hk?=
 =?utf-8?B?bmFqa2JaUEx2TlNjcEtzRTVZSmZDUmdlTTJwNWF2RStaUEJoaVdMcGdQOGZs?=
 =?utf-8?B?ekRmWHRCOHpjanJEY1M0VDByU1I5eVR0aFF4QTVpVnAwRncyb1ZjVS9aeWNw?=
 =?utf-8?B?MjhjQU1SWGpxSXU2MVdpV29sdHB1K0h3T2tadWIyNlE1OE1Od04wOTJZckVQ?=
 =?utf-8?B?UUNWN3hlQkJwYVJTUXg4S1JXbC9ocHlWQXZKalhPZlQvaTAyYk1QMm9iWmV2?=
 =?utf-8?B?TTIxTmJjbXAxbnVHREtrTWZqVkczb3JTVWVma1RRRUM3dUVreGIwSVhwclR4?=
 =?utf-8?B?N1BQZHNOdTBRRkFzK1E0ZEQ5Nms0QnpyM3E2dDIzM0tWeEQrajJHNU5YakxL?=
 =?utf-8?B?bllDd3VZQ1JYNUp1ZXZzVUM1bkM2bUlhWlE5TE05Ym5jekNuMS93OEFpdElX?=
 =?utf-8?B?dmg3d0NtY095WWtTRk5MZmt2VW4wTHk1aEErYVNva2RENUxwUjZINm5TOUxu?=
 =?utf-8?B?eXNiWG0wdVpZbDlQSXJBcnJ6K1dtcnVhOVo1K2ZSUXhPOHVxTkVqcHBmdVgr?=
 =?utf-8?B?MWNIdnNvelJNd0RVeGlDaExxQWN1UzdSZUhvbGJPV21mZGxLU3BMZDB2VUtU?=
 =?utf-8?B?aGFRV3JrYXhXRGkwc2pENXdwOTRUUmR5d2Q3eUlNZEs0YWg1S1k2czVMRTdx?=
 =?utf-8?B?MCs0VVl5TytLVVVkSStET3lyTE9QamlSa0t6dVFwR3dUTzdrS2pZQU45OEpr?=
 =?utf-8?B?clh3M1FXNTdvdVNMdHVHL3VqYytiajNqaW1RZEV0VnJmY3Y1ZDJobCtkNkpQ?=
 =?utf-8?B?M3hYR2QzNUNmYWlJRFNhNmVwbllTWER5TmJUbjFvcVFYVGEyZjRPd204cmVL?=
 =?utf-8?B?WGRsNTBQZmJseS9xYmhjQlI0QjNVSWppenJYZVdHQ0kwcUhReUF4MTBxN2VC?=
 =?utf-8?B?NUN3VVhWazMwcHNhRHU1Ui9lSjJmbEtnaGZybHVwalBaNm55dmEybTZ5K3Q5?=
 =?utf-8?B?bFA3eEQvTFBTUkM4cjJ6M285ZXpWYjl4TW03M205MmJ6Y2pzckhubGRuS0lr?=
 =?utf-8?B?WWhRVFRCMUdTUkJ4QmpUZ3JEVGZkL1BvYmNMSG9WU1c4anVtVCtoVzdZNU5C?=
 =?utf-8?B?ZG5uYnh6V3BkdEZDaEdnd1BESEx6QUl0YjI1dkZRZFhiaUFqQ2pxVkwwMjMz?=
 =?utf-8?B?VjNCelJLNUd3UmY1S0VSYTBweWJJRHU0d205UUtINmV2VGJpdllZbnI3Zytj?=
 =?utf-8?B?NGZGMTFpaVU2WDRNSEZNRkNYNnJSMGxqeS83R2x3Q2h0cEpqUW5CdEliZWEy?=
 =?utf-8?B?dzR2dm9UK284NXh6S3lwYjAzakhySklYTWM1U1ZMRzNUMWw3ZGRSL2tSWHRG?=
 =?utf-8?B?dXBVYWNjRHA2Z3Nhb0R1MlMyTmRLbG9LVGtnbGxWZGNYdEpvNjlNTTVRaGxi?=
 =?utf-8?B?NDVCaTZMK210YzJLZlJyVTdjejNsWS8xcDhxVzQxSHJhcU52WVlwaVFwYTZB?=
 =?utf-8?B?aTBSWDNMbjJLQ2ZmRW9mN01XQWtubTUyaU01OUVzM0tTdWloMlJINW5hRi9B?=
 =?utf-8?B?RXhDZzZsSjBxYVN1U2syNlBuUTNubUpqNWlqVlp3TlpUcEpCVmphb1RLc2hS?=
 =?utf-8?B?R3lwNktFdktCNCs5OCtDTHdkVnF5WWVqWUVLODhwemI5d3NYbzEzZGQ3UlFl?=
 =?utf-8?B?R0pSRXVRRWI5RFhVdkQwNjRHTUUzY2hER1ZnVUloekRzM0NTL3QxaDlrZVo2?=
 =?utf-8?B?VmU0RjRVRk50YzBxaFErbmRXSyt5dDI3ci9udXlaN2hTbjlBK3hYQWllWkNr?=
 =?utf-8?B?eEFqWHJ2QzRsRVBWS1ZtYXJCMDI3NUphbzhhWWFhSlJZTEhsalF1ZG5Udm1y?=
 =?utf-8?Q?pEtkQwOg33uiPHv4KXDa0e28u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa603a9-8296-46f5-8f31-08dd6d208377
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 11:14:17.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m2hqf5b4+dkccDZBQTsTA2XpjSh5qQWUys1xgPCDuO1w4BjCWmBV7VBFr5j9QakDKD9iIhdKWnAJuXsikTz/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
X-OriginatorOrg: intel.com

Hi Madadi,

On 3/27/2025 10:43 AM, Madadi Vineeth Reddy wrote:
> Hi Peter,
> 
> On 25/03/25 17:39, Peter Zijlstra wrote:
>> Hi all,
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
> 
> Tested the patch on a 12-core, 96-thread Power10 system using a real-life
> workload, DayTrader.

Do all the Cores share the same LLC within 1 node? If this is the case,
the regression might be due to over-migration/task stacking within 1 
LLC/node. This patch should be modified that cache aware load 
balancing/wakeup will not be triggered if there is only 1 LLC within the 
node IMO.

thanks,
Chenyu

> 
> Here is a summary of the runs:
> 
> Users | Instances | Throughput vs Base | Avg Resp. Time vs Base
> --------------------------------------------------------------
> 30    | 1        | -25.3%              | +50%
> 60    | 1        | -25.1%              | +50%
> 30    | 3        | -22.8%              | +33%
> 
> As of now, the patch negatively impacts performance both in terms of
> throughput and latency.
> 
> I will conduct more extensive testing with both microbenchmarks and
> real-life workloads.
> 
> Thanks,
> Madadi Vineeth Reddy
> 
