Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE625B668;
	Mon, 10 Feb 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212264; cv=fail; b=iSxEJG2UXy0Y4hrGx34Zvp1bejnDa4BA4XJqL7R5ERw/kOuRtX/njiCj6Jf4XCCi+7eX+UHO+NMF3Kzi6DXM5DkpzssNVtO6ab2VQuJtKaMQFbHwEDo9UsQX0C5l8MEKkeIpm8xuMyXTRLEvOZpa4raVOKVGk0w1i/bXp8u39Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212264; c=relaxed/simple;
	bh=2i4Fb4grDSmFRNEIe0CGjjYDlF+v6BeLOARS7JlIw+k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qtXt8OxfTU7pENqJCCT4LCfCJOrnuUP9lzqWKpJmc2ZsojsU6eKFls32TAf9nfZ2jLakHUNFqKgqnArFgdTuMlK8DzWUhB9iX1ABY+VFmH26MQ81vmPOEscjiRHgUMPVeLQiWtv+kZWEqcUMBBT2ubPk6bIGvZsoKKNOeJseQGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbc38apS; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbc38apS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739212262; x=1770748262;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2i4Fb4grDSmFRNEIe0CGjjYDlF+v6BeLOARS7JlIw+k=;
  b=nbc38apS1BEQIPdeFP/+lrZ7R6D3pxNJL9o1iNaMuKd2pCFixVQMY99u
   XJ+bFwg6DbRFzJgvlj6Zgx9hZdvHQXRD9WOiHAKlbyt6KXimsg3x6quR/
   YDk4FE1NWG2DYC7VSnCFghovGt7WmqK3JHoGOR4Xc311Szqfny8J4vq45
   yQexBmiWpG8gkmrnQ6cgKpNXG663BUt0LLbBPU4J5hppSjSA8YNF2ewHN
   jAo2id0WsmgqYc6AuQdtumuBmmlgtK0C00gSzHsRANFkCwAxqNGDCHM3N
   1P1gRRrlFPH59XqCx+s4A1l4T448US7mryR5SJrNz3rmoTKKfUgj1Ulq0
   A==;
X-CSE-ConnectionGUID: vgWBdYm3QUyOJZxdyNzIlw==
X-CSE-MsgGUID: aJa/58niSzGq/lWnwmVKYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39495923"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39495923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:31:00 -0800
X-CSE-ConnectionGUID: Dz1FnYvWSHSu5FYcndfybA==
X-CSE-MsgGUID: nmDGfsTiR7eMmgzBTL+g+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112227187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 10:30:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:30:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:30:58 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rImINsuU8D3bR/7PTVY4rnGyshtAinMLOr66fxfSQ9ct8LiBNLvpvB+nPYKYLBEfw4cooSlSTNgawp6EaNUekwM6IPc5PBPBr+sviQWEwSTqXpkc0L7gahr9cxanRcVdmB7AWk7Q+oE52FpnUt8IkJy7IbNvGw84rLi7WP+o5Kwl3k+wpcqrxbyxokA7OBpFSXg+JWXIVEe1brCFeuEGK+KYKBHjtMoyRo1LOOMSuUEgPlLDw/zScP3yxotBA1S11BdjSr5E6wFZLP5yFskp9OZ7lTecDOjudOs9QMGtYOJkMTe1tJXkEU/oLEHTFv988wdurRdYNBTcC2ryY03seA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLZyaoNYyd5Z878r3Ad0OMX7+TD+gHumUf8ONg5Xakw=;
 b=f2cMmHEJLaEfK77+co13TP+6jBegL6hKIR/ohuASpe9GJV65EeLAfIzHCcHSrtvP/JjQtUcCq3Uzj/o8KFgxvBfCtwRCJ5wEKd2nLGpsN7xhplpNMuXsr59r+RwtHzRXljbvzZymDWS4HeXWu5VFDF5eiqUgrAdju/xkKpijO6w5lE9+OvGZdUtczw0R4FEOFbS1SyQ7+pDLw17PR71O5P2CiAHp4xkzlem09Lk6NT4GG1OfvV0RrLtVB2L83/Seq3zCpQJigwHd93nX3gR9Mv8hSh92KgaJUDKhd5b04RRmgNjw+kDQ21sGv77vLfYFZVzQx+UR9isHH0ABPv9JtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 18:30:49 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:30:48 +0000
Message-ID: <1faef062-ed33-46da-9378-7a224dbee811@intel.com>
Date: Mon, 10 Feb 2025 10:30:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 16/23] x86/resctrl: Add the functionality to unassigm
 MBM events
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <36262057667c27acad777836cc1497b19cb7c06d.1737577229.git.babu.moger@amd.com>
 <9746fc25-1657-498a-a290-45baaa8d8c19@intel.com>
 <1ad70161-2046-4c7f-92c7-809b01c8c957@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <1ad70161-2046-4c7f-92c7-809b01c8c957@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:303:6b::32) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a272064-7597-40f7-1858-08dd4a010a71
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?citNWmRubC9FaWU0MlJiZ0lGT1dmTy9NcVJMNmg3U2VBdDM0cVR3OVBLYSsw?=
 =?utf-8?B?V2RtQklVL0QwYkpBWWtZTUVZVWpkUzhmMHg4ZmkrUW13a3A2QzRydVdyN0JC?=
 =?utf-8?B?aHpqUjZCdUxNWWkvN0tJUXRRQm55MHIzWkxJdTd2M2VKWUpXYkNrQ1p0QzhX?=
 =?utf-8?B?RFlLTUw2T2QzdlBzQWR1U01nL1lCYXd3aXdLSko1aFc1YmJ3Z1BXUkxzVjJh?=
 =?utf-8?B?UFVmUXArQWxhNjUzYUNzRW9xbXpWNTg3NUI2aFpQNkJHaEtwQzVVV0dLYW5k?=
 =?utf-8?B?YVFKTUt4Vml2TFk0Tk5wMEgvMy80ZW0xL0V5OGhTdG5nRGptVWxsQmV4VmQy?=
 =?utf-8?B?SmdFWGZQR2J2YVpEL0lQN2ZIUEZRTkFWYm9kOHFnNlYycFJ5VzQyNlJkWE8z?=
 =?utf-8?B?Qkt3SmdFTFZsbG42R290YWZlT0szWkkxRVZQejRTK1JtSHI5WjhKQVVBL1lu?=
 =?utf-8?B?QkdqL2dXb09HYXRmTHFLbmFyQ2E1TUE4bVhGSXU1R0QzeTJvWkE2aXhpZ2hJ?=
 =?utf-8?B?NnNydVRiaGNDUHpxd1NTbUhZOHFmYTVVK0UwVCtDUzMyMGZPM0k3NFVQT2t6?=
 =?utf-8?B?a2VmMGpjL3c0ZUhiTmtNc3dHSmxHQ041ODlSWHpBSE4wNmM4Z2x4RFo1Tzhn?=
 =?utf-8?B?OHBqeitLOGlBUmNqNW5TUGxKRmVKODE0dTlpQmpaZG1YSDQrRE4wUHh0ZTg4?=
 =?utf-8?B?bm9tWUpMYVJ5VEZKanJtRTNxdjFQTittdGFnNERmMUNFL3VtcWJCOTlXU00r?=
 =?utf-8?B?cUtiSUlPK2FWcXkrRWJybGlDQmVIa29wazVBNjhuZmV0NENyVzFnQjk4Z2s4?=
 =?utf-8?B?UWRjM1cwZlV2Zm9BNTM4UkRIbkU5UEdpQmxxaGNUb0pRODN5dG52ayt2RHNw?=
 =?utf-8?B?TUtxekVXU3krR0I5emE1V05RMnRwai94bStxVk00bUhYNXJsbWFxQjRWUEVv?=
 =?utf-8?B?MkFEcURyRGNJUk5vQVdVYzJIM1dpYnJFZFBLWjRQMVc2M3hQZ3NiRmJyZnE0?=
 =?utf-8?B?U3JaYVBsUDY5akk5UkhKa3liUU9CZHFxK2tPY21OWXNGSVkrUUdCUjI4K3dC?=
 =?utf-8?B?dHR3RU1KS3RTSXdyUEpxcnRrNWNTS3M1bHZZNy9yRWpzcUNOeFVTVjU0N1JT?=
 =?utf-8?B?SFJHbGFWZUFiaS81RTJvUXk5YmRXaVhpbUFPU3V5TFVWSmZTZ1RZZSsrNlU0?=
 =?utf-8?B?MkFYdC80ZGxPY0JBOXdoS0pJbk1OTXRuVGp4ZXN2a2JjalhaSzNZK1dzcUtZ?=
 =?utf-8?B?Mm9TVnBYMzlGcHYzZ2lGMjRBLzVwUVliT1BTcFJNRHhDL3pCayttUFVYeU9z?=
 =?utf-8?B?VmlIb0tFbzZDdjA0Q1BGMEZUTGVZaHlZYUpZL0kybFRadXY3M0FRN0FmU21R?=
 =?utf-8?B?dVB3ODlEd1B4TC9SUm1BSkhNZzdEWDU0eXN4RGVNYm50VjZ5RTJmZzVEV3Ft?=
 =?utf-8?B?eEpmUFVzWkNiUW8xb0FmK2w3UlVsY1haZGFSMHFTTVpnTmZoLzRDSnNoYnpX?=
 =?utf-8?B?aGQ2OWxKK1BVeSt1MGNLM2RhVTVZaW4vKzByV0t4ZjdaT1p6RG9VdW1tVFBU?=
 =?utf-8?B?R2ZJN1cxWFI5SCs5anlMU25rVGRIdzAxemUvamNEeVVhZURlblBhMUNXcDRY?=
 =?utf-8?B?SSt5MnRSWmJEZ3NReVBlUG1FSE5jRUpoRWIzVVpBRnFvWGhlVzQxeGhwMVJE?=
 =?utf-8?B?VkQ3WDBtbkI3UFhtc3RONGxhNW5lNnZWcWlkdXMyUUlJYTJMd1hXTjNaS2JK?=
 =?utf-8?B?bXJ1WUREZHBUVkFWdjQxY294UTBqYjRWNTdHWGUxQ254T1Fya3JSSTRYNEF4?=
 =?utf-8?B?N092VXFHaXhnQkQ2WWJrMW5oVXNSc2hSdlFvb0Q3amtEeVJTdHhTOVdWNGdl?=
 =?utf-8?Q?I/saHvRzcuzjK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnBHRUZ3OG1LMkFKN2RjODNSNEY5VGk0cE1ZWHNYQmRsZXlkeUEzK3J4RzVv?=
 =?utf-8?B?Z0t0dGRzVURaQzNiOW5id2NkYTV5T1A0T2hDSllmTE45L01peGhjdEduQ2Ex?=
 =?utf-8?B?eXVZUHBpSnd1VGUvaUt6RmF3YjhZMmFJRmg5S1VWZjNGKytSRExCdFRXTzRI?=
 =?utf-8?B?WnBaMDY2UUhYeVp2WmNYRGNwM3J6cldRTjFRQThUQWhVT002ekdKRmorWEZC?=
 =?utf-8?B?ZWxRZjlLL3liRHVGb1g3Nkg2UTdndVdYQ0hiN3RCTVAyK2wyaVI1YmljbmhR?=
 =?utf-8?B?UXBlMmkxcUlQQk4yblBaOG9saFA3WGtucG5NZlFrY0E1RXpaQWFDVFdLMEVr?=
 =?utf-8?B?VWhDblRVR2FFaWRDMmE5TXJHWHp0MWJ6Qkh5dTBKVUlKemgvQkhJQ1lmNlRu?=
 =?utf-8?B?TVV1SkM4YWZhTTFyQnN6WVlEd2xPT1pJVVIvWVdpVFIyYzVsRlV0ZWk5MzhP?=
 =?utf-8?B?UmFWUXZleUJZa3NNNkVoU3ZOQzNzdGZ2T09NNE9NU0l2ODhSZlJpOFFMaDEy?=
 =?utf-8?B?eXpSakM5eUpzNzRnRVgvc0V2OFZUQ0p6c0ltL1orZE1xSG8ySXV0bGVqVEJK?=
 =?utf-8?B?M2RxTDQzU3JEcTAxQzNkUzdONHFiWTJBY1pwdmFJYWRTbEQ5UkVTYlhiVDJu?=
 =?utf-8?B?bENiMHo4NG1wL1ZObk13UmdVbGJuY2g2Wld0aFQvTkxuMnNLRWZ4K1EwcmpI?=
 =?utf-8?B?UEpseTFRbGJtMnN2NHA4dGx4TENhY0hrTUZJeWlQRUo5MWpJOUI5clpyU3dl?=
 =?utf-8?B?K014dVZzVDBVMzgrOEx2UGZNZStONER1RFZlRnlTQjNPc2lHUzhlRHFPeE9i?=
 =?utf-8?B?clFVbGprT2o5dW50OGgzbDVMUjE3NnViRm1KdHNQTUkxUHpyZ0k3WTVVSE1u?=
 =?utf-8?B?Q0Z5OUVtZUdITUJWSVl6YXRTdDY2QkFiK0t5b0dRMG5pRUxDU3JEeExzellz?=
 =?utf-8?B?NlBmSmFySEFqMlYrUEdmQXdudnVnQ3hIMG9MVFJyNzZEd1kyZGVxUGVHVGwx?=
 =?utf-8?B?SWNiRFJremNMVTF2RisxWFlnRXhzTFl4dXNxUFc5Uk1ucExWUWVhdDVJamFl?=
 =?utf-8?B?UlkvT1g2bHJVMFVIWlpqSjVkOFo1a1Rtekpvczh3dG93N0FSbnlyM1psd1da?=
 =?utf-8?B?SUF6eTdxbzdZTHZhUnN5Ymk0U0x6dklXeENRUW52ekRzemdTamg1aTJGbHow?=
 =?utf-8?B?MHlMUCtzdUJscUpHNkIvUnV4ZXRZaTVPQVN5eUNBVmswTHA2KzFKMEptLzRq?=
 =?utf-8?B?ZENuWmJiZDdOTXpTN01MT0cyRW1hQ3NkM00vdElqaGtKVWpKSDExRDFuN0ln?=
 =?utf-8?B?TnhUOEVDd2tMR1o2NXpDaWpOcmpWd0NLcEJhd3R5ODdIRmNGVU03dnZFdDNn?=
 =?utf-8?B?ZkZlVzdIL0tWMzVPQm9mQTUrdnZzc21qRW12NW80RUgxeG53M0p4RG52Y0JZ?=
 =?utf-8?B?Y1dUNTBoM1YrQkJrZUNsakFLYU5LV3FVMUNkS2piMGVRZmQzWUE4ZFNQYzNB?=
 =?utf-8?B?N0VQNUtYdy9QcTZnTUdxeXV6Q2xva3Vmb0F2QWMyWG4ycGFxZUkrY2FmREVt?=
 =?utf-8?B?d3l1dmtXbG11bGhqaXdPMFFzZ1hqeFV0L010SENtNnBwN1FERitmQW9HQ1VD?=
 =?utf-8?B?UnJtZ3FxRXpUWXVnMzhQWnJuOUZ0ajQwTXV3a2IxZ0dRL2hvNkJYd3RsNkNR?=
 =?utf-8?B?dFVQM2QvaUx3MGtzcWxsYXFPU1pjR3crWW91VVB4dXlhWlg5ZVEzWG1ocytK?=
 =?utf-8?B?Z015Zzl4aSsvUXpBVHdVWGc2OTNURGU1Tk03ZXJsU2tqNXNnb0h6OTVPOTdx?=
 =?utf-8?B?R0VpbDNqemQrQW8yclZrMXR3cG5TZFI5dFVUbklrd0xob1d2SHRYZzI0NkJq?=
 =?utf-8?B?Tkl3MmlZTjRxZVlhbFREeWdyUnE5Z0Z2RkhYaEUwRHRPZHhobnhDMjdFWUFm?=
 =?utf-8?B?VUppYWVxSzZpcGlhZFY4N0NEczFsYU9NV1FoME10UG9XQ0d5bmVnNGdJalg5?=
 =?utf-8?B?eDV1NDc1TTVWaTZDWGpOR3BNR3VoY0UxcjBjU2JpaG9nQVBvSHY4YlR0TE5u?=
 =?utf-8?B?bFFvOVVQc2FCYXRvQVh4TXZyWko3VGtMRG5VV2dqTFhmTmFCUkFsUy9HNWlC?=
 =?utf-8?B?OXZxOTRUM1ZBMXV0dFhjMUpLM3hBYWJYYjZlTFZwVFdzdElPbTdUemFLUDk4?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a272064-7597-40f7-1858-08dd4a010a71
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:30:48.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DjHOnhEwtwq770rgctx2mIaz+S/xClPRHSr7FAdbhwtZv9iRTvVcZeKQWXEGAOzbJinWY5isMrWiCHK+aEX5Fq7ss3EiYfVSr7mEQCO1NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-OriginatorOrg: intel.com

Hi Babu,

On 2/10/25 8:23 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 2/5/25 21:54, Reinette Chatre wrote:
>> Hi Babu,
>>
>> subject: unassigm -> unassign
> 
> Sure.
> 
>>
>> On 1/22/25 12:20 PM, Babu Moger wrote:
>>> The mbm_cntr_assign mode provides a limited number of hardware counters
>>
>> (now back to "limited number of hardware counters")
> 
> How about?
> 
> The mbm_cntr_assign mode provides "num_mbm_cntrs" number of hardware counters

ok.

> 
>>
>>> that can be assigned to an RMID, event pair to monitor bandwidth while
>>> assigned. If all counters are in use, the kernel will show an error
>>> message: "Out of MBM assignable counters" when a new assignment is
>>> requested. To make space for a new assignment, users must unassign an
>>
>> To me "kernel will show an error" implies the kernel ring buffer. Please make
>> the message accurate and mention that it will be in 
>> last_cmd_status while also considering to use -ENOSPC to help user space.
> 
> If all the counters are in use, the kernel will log the error message
> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
> last_cmd_status when a new assignment is requested. To make space for a
> new assignment, users must unassign an already assigned counter and retry
> the assignment again.
> 

This is better, but can user space receive -ENOSPC to avoid needing to check
and parse last_cmd_status on every error?

Reinette
