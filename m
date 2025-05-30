Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F3CD299
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628022; cv=fail; b=VbfqX4CcxQhBRlsYDF2NtAlo7NMpJlRdEJqkZGzgHevU5gmfLJCFTtzoRdtc3p7WOIemvM54AVcddsJfoJUqhhVPj0W/PJEtZiL6L8PPghzni4yfA8WhclqlL70aUCs7MwVARloQx9pivfK/jfssHray9zHnYg3rLaVIoAN2KzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628022; c=relaxed/simple;
	bh=qDdafwODHaTiGo83U69kTbQhnCXtb2AhwpZT9esDXkQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aeWQm+OQKGOsfU/e7nl5TyV1cCEzTYUFY0nOy6mNb5aNp4mUCwmd+5Q6c3hvpa11vTOoWB2/S1FJngtI5nwDEakHUNChhKXdNvym4otGOvt1AGS2cWORZ+sPac7qkTTq5pbKgjcoVUH2wdCm8G+HFgAwhw620iCxn5gwL0m8Rhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjH6Kevt; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjH6Kevt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748628021; x=1780164021;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qDdafwODHaTiGo83U69kTbQhnCXtb2AhwpZT9esDXkQ=;
  b=fjH6KevtyoBogk4X2vlCzASAlnb5F2bsJmRSM5ZFjvG0dsCr+f/sRVqZ
   o+kpJ/M9taOno5lgeBdrGVLcMrHER0tegpvdsEdeZrYnt46FvLZ6h90O1
   k5ABMDSgTT9jLyztmtr3xkbW2mnlBkotiKsCSFK+YAvgbgt80FT/J1EZU
   rBjan7PdRu6MUyzsmPR5n+TOeqKRhZtmVDLdkAAjzdMgoBY1cn282S1K8
   ps3NR3qMLYa2Mgb+2DC2jiQBGFqjmliQO2e/tpLcyJgC9pX3NT8N4ylX0
   IVsyV2JmqjDXY/tSG71lEN8FojbS1rTGxX+i8c7gB6Hzx1u9OlxONDz/7
   Q==;
X-CSE-ConnectionGUID: UNU4hu8lRBuLjTNx4eZ6SA==
X-CSE-MsgGUID: bLrAX8gEToqz7hNzpPuxvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49967761"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49967761"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP; 30 May 2025 10:58:38 -0700
X-CSE-ConnectionGUID: VAZw2DR6RlKS7D29SSiDnw==
X-CSE-MsgGUID: mnDa9y8GQ0aCCc/ZeJ9LpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144579455"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:58:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 10:58:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 10:58:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.55)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 10:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGiIyycBA69GKE53SQZh8zkylrme5T5IrKFOw72IukziKbcXfx4YNCIoJfPaR/Hvxo56Jp2uURkku4EiHf24OijXqPT++c0Z0yWFdY3W4EJrpijsRlDVwL5ckfMAkZX+JW5HJn5FeEFtlCu2fzaoW7Afa8E/xD9UkJSpIiNbFXVkOilZRmEmEmnB5u5R97l31bm3D9CRb4Js8KJBqvoCjNeDJrNW4ydOV30zqMuingHSgSWRzX3mBpPKD74kdZYipsCcsdxc7f8PfqUymd/3tiGUZUKuTrNVDCBhZ1W+vSfxW+nz5Vi8G89rOH46aUvZqFpMll7AxrT1CxGEuhS/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOGheO8DH82fmm2n+aYiLiEG5QddOx07vKLBT2SGr04=;
 b=EqRTOZukSx26Audily2uKEjiVj4R5g878ntnLvV8eNFTjT5ZTNDWFtIMWaa+Dn32r+UdCeHDPtXBQDSbc6l8RvLujPfof5iS9WJLMe4j0rO71UQWCWSeDhq9inoKXtOqMA+Zf+hbRCjAF8r6fUqsUM3HM307yvBxJFKpK4p7wiY25ZYIAvRvuGqbScnfZcDGe6N3pAyrr4DFXOxxG0ETuPjsR3P76eX7hNWIKWQRDJ49sQGVn7ExHgnNluDuJreXZ4ngP4qHofbse2z5utufS9rJ2ep9DoTQK3PfdYhL8Gu/l2VQVxMRs7BL/EGhzltkYAIawijpMK1O0uQZeEnkow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 17:58:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Fri, 30 May 2025
 17:58:19 +0000
Message-ID: <ae018428-7a5c-49ec-bbc0-c93f1f8b965d@intel.com>
Date: Fri, 30 May 2025 10:58:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250530175027.30140-1-qinyuntan@linux.alibaba.com>
 <20250530175027.30140-2-qinyuntan@linux.alibaba.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250530175027.30140-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a4a13f-da88-420f-4e3e-08dd9fa38fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzljTy90c0JnRTNQSU04Sm15cGVkSEY4b043MUFrT0JtMEdQcGM1d3k4UVcr?=
 =?utf-8?B?SFN2MURBRnlDRnNPU3NrU0VVZDNBeUF2NElGSWhJWkJOOXk2akhld2M5bmcz?=
 =?utf-8?B?NUFLSVVrb09vRm5UdFl6dEx5YWo5NkJDVEg5MzJkU0Q4eEpUOVEwVmtBUVlV?=
 =?utf-8?B?SWpINEk1ZFJOSzNkR0RLWDFSenBhU21DQkdCUzJKK0pPRE9xZFVsUEJSMk1O?=
 =?utf-8?B?bUR1bHFGK0pIenlXaEF4ZENQWmgzYTU1dmlCV3FTb0ZJdUplSHhNZTcycEEw?=
 =?utf-8?B?MTRISnFKMzE0SUdaenhjRy9EZWdqSXp4Z1I5MmQySmdCcG5RYWNZSjVrSzlI?=
 =?utf-8?B?TDM1QTN0eHhBU1draXpuVDNtN21Uc3ovM2pHQ3lLUHRxZ3VzR21BaXdkdlhP?=
 =?utf-8?B?a3JzWWI1dEcvalZZUkVPSDhzeDgrOEpYeGpQTEhoeXg1OWRZY0lOdWdzcmxY?=
 =?utf-8?B?NS9nL1RtaFFZb2xyVFlqZDUrVmFOS3ZRRmVhU2txSjdaMjBST0xwUEg5SWxq?=
 =?utf-8?B?bTlDUTZCNiswYVo4cFJBai9QaWF4Zlo3NXJRY3NLeVVaMEdCdlJUa21Cc1d3?=
 =?utf-8?B?blFQYW9mQW9JMCt0TTFMTTlKamo0VnQyd1p3dVc5Z1MvamRBandNTGNXVi9S?=
 =?utf-8?B?MGZTNXZ2cXN4T0llMFVpbGY4eHVzOVcwOTk4dGQ0cGtqekxmc1N0OTdUUlpB?=
 =?utf-8?B?RS9BMUM5YnBjOUM2eVFoRkpkRlkvQ3o1bVFiRU1RNWtNMHJDY2hId0FQRWs3?=
 =?utf-8?B?ZnhmSE13bUliem52Zk9nUXhwa3FXZW9RUDBwejNhOUR0ZzBMQ0RFQ1N0THor?=
 =?utf-8?B?YWZGSDRxZ09IQUxKU3FoU2ZDeE9GQnRWeVdFRnBVa2dKbTFHSXR0aGxyYkhk?=
 =?utf-8?B?VTFycXNIek9RTWNlUlZXWHhqV0g1dkY4OFNiNkZEQW9rSnU3MTBsR3dkL3pD?=
 =?utf-8?B?SDNMVmN4Vk83bTNVNUVHZVFSTWwrbHJ3Tkpwclh3Z1NBNk1LZUZ5OFJXcmRE?=
 =?utf-8?B?eHZYQmsxdmUvNGMrRGZZU21qTmJMblJMNkxNLzMyYVJHQ01NMzFDR01ramRC?=
 =?utf-8?B?USszOTlqbWZXVy9jYm5EbWNXNmFKV1h0YkFMRW9qbi9jOE5ESzRKYkdmOFlt?=
 =?utf-8?B?K2UyQ0lrQXAvSGtEZUkzVjRPV1Zqc2RKYjA1cnJNVVUrNnM3VFU4OEdaZ3dM?=
 =?utf-8?B?dG9zNHQ4MlRndjI5SHZvb0JtaUNQSHRWYm9GTENLYnFRTWFEWmxVM2RDcGlj?=
 =?utf-8?B?K2J6YXNleldUNnpJSkEvampveUkzUnFKQlpsekpGYllCaFlXMWlMMzF0WFZI?=
 =?utf-8?B?bHJ0ZkNIS0lkWmxXcm51SGlUazFFdkE1aHRWeS80VENXY2FlZVFIS2VxbDhX?=
 =?utf-8?B?L3RKWTVOTU1BZ2QvRkpxamJ5cUQzMGpBV05BeWpBL09pd2JPV0pRNG5mWWJM?=
 =?utf-8?B?WVJYQ1hzQlI4TFdjNHBOL0ZMVWMzTTRmd0N2RCtJTFMrR0Q5NjBSTk15Skx2?=
 =?utf-8?B?cHZDOHFMNlV2OUkyTUwzc3RtT3Mycmc2NHpEMDdIUVJYMERKL0tTVkx1Wm4r?=
 =?utf-8?B?eTdPYXB3eVU2NTk4ZWFmRmF0QTkwWDVKMW4vSlR6VlBTZDE3R1VFb3laVUk1?=
 =?utf-8?B?amlmQ2J4a05MQWpGVW5jUjJ0eUN4bXVGTTZUazN3SUpaczlrTUZNc3N2bFd5?=
 =?utf-8?B?SHpNZDZRUjJmMVVlaXB5c0RDNCtMTThNd0VNYk5abXJqTWhHUWlEY0ZzU3lV?=
 =?utf-8?B?WkJyYlZlMmpQbXBJaWhZYWNpbzV6c0Z3aXNvMDJNdk5nN0wzOVhEV3dwNHhK?=
 =?utf-8?B?aWJta0F4RGtlVlZQV0JnaHRkV1dzYWxZRVNncEloSGRUc0ZweGlLSDRiVWxz?=
 =?utf-8?B?Zy9XWjF3NzJEcWM4cTR2ZndJd0xQVG03aWwvOGFjSElmNEhFTmFFUWxPN3lO?=
 =?utf-8?Q?ujPOhof8Rk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFp4bFRGczJqNm1kOTR3WTkxUVplOW5GS1EwSU92emhnQVFyeEJOclg1VDN5?=
 =?utf-8?B?c2lLUFplSi9nVmNka1pPQytXQkRGdlhFaUtUaG42QVB3U0p5V1hqRTJvZlA3?=
 =?utf-8?B?MWY5VndYb0pSdnF2d2VzdkhQTWtZVkRtK3o4TlF5dHJCTXJVeDlrWEF2d1VF?=
 =?utf-8?B?c1RzcmV4aFJXZlp6S0x6Nk1YTjFqeTVOL1hLM0h3KzJBQU15VWZPa1duNUJG?=
 =?utf-8?B?TzJyeU9TaW1oRi82VEZmYjljTlp0aGowbDNieWpRMHdDbEx6cDNuN2xWZUsw?=
 =?utf-8?B?c295QUtLdlgvMlFLY1lUdjNPckkwNzNjZ1BHK2pTbGVDY2k2d3FPQ0dXWENX?=
 =?utf-8?B?VHFRWjRkbVBBYzdqNVJhdkRqUnR0T2luZE9GbVdqME56eDI0dldOS1pBUWlG?=
 =?utf-8?B?SmR0cER6a3dUWHMvOHZWa3FTbWhFc3oyN0NqVkNmWXAvZ3dYVlpKaGppWEJw?=
 =?utf-8?B?TS9GVVlBdkZMSTE1dk5WSmVLVE9wMXVjYTRDeHg4ejB6Mk1XZDFCWjE2Q25V?=
 =?utf-8?B?TysyVC8xZm5TMXJIQmZiaHBOVGNVSEtJQzBuOUtRb2hpWXhaK3lOQnlzVTFV?=
 =?utf-8?B?Yk5mOVJFdW9zTVZEL1hOQkloYWlvc2tuMUxjS3RDUEp5eUNFUXR4TnMwclJN?=
 =?utf-8?B?Q2ZVTzZVbTJiS1pHdUFPKzg1UldNaTR5aGR2bWxGdklKOU9tbjBzekFtZnVG?=
 =?utf-8?B?aXdyZlJZVnpuZGxhZFZFd3VyeWdoa1pYM056azRBRC9NZ3U0bnNZWE51UzdS?=
 =?utf-8?B?QnpQUkh5eWpCcE84VDhUcENQVTdVdDRvVm9heXRSSVFTLzVDcEZvVDNZOVRX?=
 =?utf-8?B?YyszaWVRd05DTENZdlY2cytGK1REQ0o4ZkNFOGNmOXpIRWlxQ0hyL0hCUFB5?=
 =?utf-8?B?SmdVNENTRS8vUU81QTNOS3J4YThqZUxFdnlwSWpzYkFWYnVXSy9WT0h3MzdB?=
 =?utf-8?B?S25BbWJnTWJTdlVGWkJFMDEwMXhBdHNPcjZpZEZLcVU5WGRoTnhOb09kKzNF?=
 =?utf-8?B?eFNITlBsV1M4QUhNQlR2R3dhem1BZXROZGdoamI4ZUtPQ1pMVnoyQWcrcUdx?=
 =?utf-8?B?WHVTczV1eXBGVWVSdDh4Q1VSSFBRSHhjVitsWWVkLzQ3dDBsOE81d0g2V2dj?=
 =?utf-8?B?aFltemZsUE4vRlk0OTIwNDNPYTdvNHZBZnpPZk1vNFo3VngxNW5DUkFFdnV5?=
 =?utf-8?B?VUQ4eE5xZituZzVBRXhhZjNqWWg0WVhCdWIvRzE2WkU1S0JUaFNiWmJRSUxD?=
 =?utf-8?B?MmUySVVNWVZVMnY0cHlzWFFPcEU1Q0tSTWc4aUloU1VOSkVmS29QeEFSS3E3?=
 =?utf-8?B?K0ROT2pycGpoTDZSMU0wTTdrK2g2NkNIVjFzM2xUdHZ2eEJkUnhJeGQzTkRE?=
 =?utf-8?B?ZEdsaGlSdk5yMFpydkdoZzhSdy90NFlFMW1hN0FYY0txL2FqN2Jnb0dKbjdX?=
 =?utf-8?B?QWd5YmFSNDNIVkNZdzdwWEQ2aS84V2NvUzhzU2ZwN1hudkVFNnBwRTg4ZU84?=
 =?utf-8?B?REI4dG82Wnh5OUNFN1k3ODFNSktKaEcwcDZ0ZFBuREMxL2dNaXdNSGhpRVNV?=
 =?utf-8?B?NEFzVkg3dXVoT0U2RDRZVDdBTWx6SktTcjdTSlJYc2Z4T3pCMEhLNWc3NUR0?=
 =?utf-8?B?ZmdaOFIzYStoc0ZUUFZCK0FMd3l0dXBObnlXVUtkbjZhbW5VRGpadEluSnIw?=
 =?utf-8?B?UzRpOHgxN1VobDk4Z1BsbTMxL1FaQVgzWVREOUZ4TVIvYTR2ZmtuelNQZE9y?=
 =?utf-8?B?QUhKNFVncDNTdGR6V2hrQXBPenQwcWZBRHhybXVDR0VGSjEwUnRFcllweE1j?=
 =?utf-8?B?ZHVGZnZsdzRoRzVDWENncFVOR1Q4WGNOb1lnbEJab09LYmhpdnFVTTVBbUI0?=
 =?utf-8?B?am9xUHN1ZkVrTXF0T2RiWTlUaHdOYXl5RFptSUN6eXNYSXZvUyswMTlPb1ha?=
 =?utf-8?B?cVozVzhaS2lOeEx4WTZ1VnkyelNDSUVFRk1QZUVnaU92NDQ0c1V1ZjBxRzlH?=
 =?utf-8?B?c1FBM3hzZ1hGdnFJRnRjZVBZK1hvNHNzdWR1ZDRrZnhaQXVRem02VlJjV1ZF?=
 =?utf-8?B?d0U5V1oyeHFxL29lcko1ejhPb2xTMlIzcUczTFRoYnBFb2ZaOVEwajN6ekpF?=
 =?utf-8?B?cWEwdnRCRVpkaEtZOWUwU2NLa3ZCSVZCTGcxcW5KNHdYNkxPOVNVTEkyZExi?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a4a13f-da88-420f-4e3e-08dd9fa38fb1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:58:19.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPvhBAWIwjpPaEE5Z8KjaqSDrrfOC14Sf6Gj14gnpFGRT0zXd0ij0Ntuisv+OcRoqneMEYRpFIwA9gH4JVZwTAW1115zEJmKX+fv/ckU6X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
X-OriginatorOrg: intel.com

Hi Qinyun Tan,

On 5/30/25 10:50 AM, Qinyun Tan wrote:
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure representing a NUMA node relies on the cacheinfo interface
> (rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
> for monitoring. The L3 cache information of a SNC NUMA node determines
> which domains are summed for the "top level" L3-scoped events.
> 
> rdt_mon_domain::ci is initialized using the first online CPU of a NUMA
> node. When this CPU goes offline, its shared_cpu_map is cleared to contain
> only the offline CPU itself. Subsequently, attempting to read counters
> via smp_call_on_cpu(offline_cpu) fails (and error ignored), returning
> zero values for "top-level events" without any error indication. Replace

nit: the solution description starts with the word "Replace" above. It
should be in a new paragraph to separate the solution description from the
problem description.

> the cacheinfo references in struct rdt_mon_domain and struct rmid_read
> with the cacheinfo ID (a unique identifier for the L3 cache).
> 
> rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> domain. When reading "top-level events", select a CPU from
> rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
> valid CPUs for reading RMID counter via the MSR interface.
> 
> Considering all CPUs associated with the L3 cache improves the chances
> of picking a housekeeping CPU on which the counter reading work can be
> queued, avoiding an unnecessary IPI.
> 
> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> Tested-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
Reinette
