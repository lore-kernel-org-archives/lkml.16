Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25B188A3B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171170; cv=fail; b=GuPsxNCXAwWrqbwnBRWbWZ4jrw91mQi3Jo3fWoxVx4bRxGjqC7eVOtHGQH3IvrjAshWN3cqPWLsvMtIRz6iOkOFieAd6ZEJoU9zf6u+8szHVmQ4J5XPvF6427K1qRl5ea6qXwaTKFkNnSY5BZMJAMSuOsJMy9YFJ0Ap28VHXw1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171170; c=relaxed/simple;
	bh=dq0hEZq9TETZz6mwMXklCJ/cJJ89N3ph0pYXzaiLjI8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hnz3YW0+B0W2SmZwy0VXsC9ZzXkRQp+gOjF4bKvH3Uo3wRqMmYbuFFjKCVV+a/fiw+aRvkTDTOKBAz+YFOuKFEBKxAL1LjbBxjdmzPyVZYwiKbiIdrGaMo6vtCSvgRXtbELpWtuD5/49Svs3QKj/AYPhGxY57jiuVZXq45d94dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARiiDgpM; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARiiDgpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743171168; x=1774707168;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dq0hEZq9TETZz6mwMXklCJ/cJJ89N3ph0pYXzaiLjI8=;
  b=ARiiDgpMgVQcZip5ftHPSn4s6LQC+tjG4+GjjocHO5n9zBb33+stH8LF
   EtiXWI5MQ0zNuvsEMJbcsUJgHw1DHGOY9gCrcQv1Trk1Sgs8gb1poD7mm
   CAHstDMgE1EwQhrawX2HPIrLoL2JozXh9LQHvxzd9QLJgwUbbzM29IkyF
   W1pnsw2aqLytA6YtBTHwqhKiMgPFnNMzWD4QRQjJaH6Tp43rN57Oo3m0X
   azWeU+5JvoX+71xD2SQJUVJUMnb6f2jISNz9RwWfNEOhhrzCgT99qFUKf
   Qc6c1jq2lyr58GDcO943RZa6GuD2NoX+3ICmQEuCTXAsGsn7+dfDhwcbm
   w==;
X-CSE-ConnectionGUID: vleCyENJQIaPm/AmfDBExQ==
X-CSE-MsgGUID: kO3/EhLKS4yjWIX2CFcjkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="67004847"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="67004847"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:12:47 -0700
X-CSE-ConnectionGUID: WaFwjjsUSW6H7s7Ybbso2w==
X-CSE-MsgGUID: 0A5ntWZLRjaDEjBZ6OaR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="156388292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2025 07:12:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 07:12:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 07:12:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 07:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqHmW+vD4jWyZJe580bRrFR8dE71E5I5JV0kvdp2gkp48xGGfZRWHxKa08Rozfd5kReI/LAyv4rqjJ9AdmeOMe1053USccW+8Zs5lNz/KLoc1dOkjzXon9iYfNVvhRdZtAalsyZ4/lx/wChwukXqpIZKlmUdd596O5Goatw6GCq4xMPCZzZod0MoyMmXyerN1d9zQzUR4GFhHoPhYZLQP8J2unfJ6TJGF6vwoRubfmCyEi212HMZeYbqJDfSV0t4JR4twFI3h959FMhK/RIQIOYlR4fApIp0IM0YrnfI5lXoGRGQcf1zPNPZr22LEUupAPEq3rGqF4RfPyVKGugU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cDokCWtPl9x2K04LcLfej1yQ/6rJQYvGDRUr7APPv0=;
 b=sj/bgCgdLDedvbzMQk+1KmamWCt+5Xi2jUCRcCwNeJijr7fO8y/cNskGDu3KqiAd91FCvxBooWa1m9hNGR9jtooJQKEE9/JqIaaoyDIpLDFK1uaX9eSGPfj1oMxc9ZdmU4R0uZG7dpCl8d2G1MUM1chjAuRTAqhsowDo6Tj8Nce0iL4YPuM0jvY+s0lHPp1KdxPJU7l9P7R0qfl9Xpyc7YdPbP/je6dfi4kN97gyONGqYOyTvEuT/8dazyq2A1hOor9xjnTmlDY5lVeC3SA87JPSKe5PLEsfVA/Ze+jFpPlVKh/R43Nuz3vlo8m9kLmJgsL1wFXyiGWU5oTtaSeJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 14:12:39 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:12:39 +0000
Message-ID: <9a7f9aa0-ff88-44d0-a3de-4f38835a5cd2@intel.com>
Date: Fri, 28 Mar 2025 07:12:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2a 3/6] x86/microcode/intel: Establish staging control
 logic
To: Chao Gao <chao.gao@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
References: <20250320234104.8288-4-chang.seok.bae@intel.com>
 <20250321211853.13909-1-chang.seok.bae@intel.com>
 <Z+OuPbNGC6mOCHZ1@intel.com> <97d77c5f-eb99-4c82-9b58-9783060c2810@intel.com>
 <Z+StZt9u+p0GjZHR@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z+StZt9u+p0GjZHR@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b318b1d-ef00-482a-1f84-08dd6e0298a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1U0Q0NHUWp5NEh5MUdWVTQ3Y3BqR3hyU1hBZDk0UmVlSVExSG4vOExWZWR6?=
 =?utf-8?B?N3FWWFQyVlFBRU5KYlowL2hXcVUwb290Vm05UHBNMHBoeGIrY3RkanhJQ3FU?=
 =?utf-8?B?SXQ4OFdhSk5WeDJpeHVCa0kweW5NYjRNMmcvczg3dnRyTVI1dWtWWVg5V3Mz?=
 =?utf-8?B?SFJnckJINTl6ZVRFTi9FK08zR1NGYWxqcERPT05CNGRxUTF6ei82djJtOURU?=
 =?utf-8?B?azhRRTdiN1FWTm9wSzRaZVZLMTFXM3Q0NmgvVHVsZGI1endubTBIMkhGUksy?=
 =?utf-8?B?amx1c0RNZDNCeGtGMDQvcnI1WXJIbmVzWXBVQXBNOEVqcHRoMHZ5eWg5NUxM?=
 =?utf-8?B?eWJmY1ROaFYvV3d5S0lSMUtyWVdOaFVKQlpoZGs5QkFaM1hyL3FWeEZaTVll?=
 =?utf-8?B?bWw1dUtjaDNiQ3ExWW43T2M4cTE3akpzYkxBSTd0ZGNScHd0WFVOZFNKZGxp?=
 =?utf-8?B?SkIvYi9CY2lxNksvRmlzOVNNZnF6aTRFUGd3ZkVvMjdTVGE4dE96V25lU1VC?=
 =?utf-8?B?SnQzYzBuU1FTaDY5a2pSUDVaL1pjQW1DNXRxc1VSNnJKZmFpbTMvWFI5L2xR?=
 =?utf-8?B?cVVEZGJqVXBLVEg5eTlmaHBDVFdFeW05N2szaG11TTVoNWkyU1FVcCtidDRJ?=
 =?utf-8?B?eTZ3QVEzc2VTUXBUSUMwMWhWbTNrQjNJakpLU1BYNzF1L2ZEbjNoOHI0MWp0?=
 =?utf-8?B?aHNRV1ZMUk9QRGhtSzBiR2c5SnI1Tmt5eS85WlM1Um82bjgzN01ub0FJcDFk?=
 =?utf-8?B?TUtxR0VVRkRBUVpBRzRQYzNodWF1OC80ZEdZcDlxNThqd01IZllFSmVkV3c2?=
 =?utf-8?B?bUFzU0JtUU1VSHE3SktiRG5Ga2VUTXVHOTQ2YkhsVFRjcmNvaC82Syt4cDIv?=
 =?utf-8?B?cDRraWFuUmxwKzdYdmhUbDFUWklJSWpCTEFjOVZWNDFOKzkwZit3ZHRUNTdL?=
 =?utf-8?B?d1dFZWszSWZmY2J5RmpBbmtreis4NVNWOCtqRzA5MEhpc3F4L3RQWmpxOWFq?=
 =?utf-8?B?d01CS3RWMHdyZEFHZW5GbmJSUUI5Yy9LRjRkdUF1ZXczKy9pbTV4NjgraHFC?=
 =?utf-8?B?dWY0aWpEV0ZlNi9ZajIrVk80MWFkMmFSWFBOekdYQnN6ZktQWlU1bGVCSUUr?=
 =?utf-8?B?UW5DZ1ZXY2l4dEdqUWMvZGxaejM2OGlIRXJCZndxNE5ucXYrWFpGSGVvbkZ4?=
 =?utf-8?B?aEVsczJXY2tpaGJ3OGJETDI3RXFwWVZLRFJ1NThzSDNMMnhhT1pTRDM5MlBJ?=
 =?utf-8?B?OGpCSkM2eTBwZzJpVjhrM3F1MzRsbEZnREVWV1RxZWJza1BWTjR1aytZZjk1?=
 =?utf-8?B?ZWhRVGpDdDJTWXByekhYdzFrbTVxbjRaeE1JT3hlVGd3ckhFakQvRXlJTmFM?=
 =?utf-8?B?SmNKVm4xbWN6N09odDNhNlNlSnFEQnQ1OFpwTmxhSExpYld0bHZxZVhveUNX?=
 =?utf-8?B?S1lBc0cxSlQwclpxbUNQQmxCK2FSM291aG1jaHRSWVpPdnNyTUNqZlZFaUVM?=
 =?utf-8?B?bnEvSWhaSWtJQ3lNSWZvL1V1TXNOZGd6ZzBCU3FROTNldlR1RTl1cHF1dzVh?=
 =?utf-8?B?RWNXWTRoMWhObnpyUG01cCsyWGY4Vy9lRGJ3QWYrZThSSHVraEJqZTdnb2c5?=
 =?utf-8?B?WGwwcXdzbWV3a3ZuamF3dzJ5Qno4aEk4MC9Gc0FOL2ZGVnFGc0dDY1JVbmpm?=
 =?utf-8?B?bmVkdUJXYjhKRHNwY2pZcDVUeDRsSTlRN1FVOUpkMndtRlN2eUVZUzNuSDZ5?=
 =?utf-8?B?dnc1L2ZJeHVPTjVEUnVmaGZxK1lWT1hvZzdoQlUvVEREM0l1ZEVpTzgrYnlY?=
 =?utf-8?B?bm5QL3VEQ0RZcWtzS1JxQmUxdUtaYm9yU2RGVDNPdDNyalljc1IrRWo4YXBZ?=
 =?utf-8?Q?sYqJqSZbGudfF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JvalU2aWVIMGhBNUJrQnh0SWJkM3dzbWp3dy9OUTJhRkk3LzRCaTJrdFQy?=
 =?utf-8?B?Ynh0a1JsWXZZUVdqYlMwOVdLQU45V2FQUDl2YVd5QkJObzZ3aC9xL1pibVZM?=
 =?utf-8?B?YTM4VzRFSXQ5Z0t4UnFSTXZrQkh0YlRYQyt6NENvdnpWRzh2aU5hSWtTTjVv?=
 =?utf-8?B?WXdJd2w5RGJtUERZTUw3ZTJ3a0VSM1RLYko1OEdVKytkeXNCR2hSWFVYeXds?=
 =?utf-8?B?cFpUSTZNTWo5OUZhMGExMGEwSFJiQXZReEtTdXJ3dFhMbU5qS09IVFoyaU5a?=
 =?utf-8?B?TW9tMENGUWx4emhVQXppYTlWTFRvRkV3aDcxajBBb0tSODZ4SVJKL2pzSW1N?=
 =?utf-8?B?NXZ5bWozeUFJMmNKeXd5QnZxYW1aRmk2enl6cVRjTWZ2SWJ0WG4xRlRacG1Y?=
 =?utf-8?B?RzNyQ2M1VVJBL25odlpGK1M4NHRoUkdPQnUzT3pPcjd6cDhmMkgzN0F0TWVN?=
 =?utf-8?B?Sk1pR1BqbXFmT0R4N0dHS2tUOG1raDQrSmVidEZ0VStKSFRNQTNWTUJzTUM1?=
 =?utf-8?B?d1pqQVhXaCtmb095NnJEQWpiWCt4QmVXYWZDUGlSY3RWRnRLOTVMbkRyQ2d4?=
 =?utf-8?B?dTQvUDlmNWlnNGFqKy9kYTJLYkUyVEIrWkdtQm54WDlWc09zYzczZ044YzJ1?=
 =?utf-8?B?MXluQVVqbGZQd2NaV0dLbWN6QmVQRUord2dNcWpEMzdFVzNwZUIzTi82dGU0?=
 =?utf-8?B?VGlCbDUzV2V2STFaOFFQN0orK3lDYVEzY0VQci9qanVhS1Q3enBrZGwzVjU2?=
 =?utf-8?B?ZDV4bUdsVGFwMUwrejl1OTB0eWNiN0FCSTNpaTQvZEliRjF6bUowQmY1U2lU?=
 =?utf-8?B?dDk5RE5QemRwSXhHODBTOE5acEdkZy9UQktNSWdMNEx1enFnakFnSk13VmpY?=
 =?utf-8?B?MVJCaXhsanp4aTR5U2Q2b0R6Q2J6S3ZqOE50eWRIczgyaVdsK21BOU9BRXFu?=
 =?utf-8?B?YzlkSkErd1h6QVZXeXpmMzZUdWtZY3UzVW1hV3Rkeml1cDBQNTB5U1pDaFYz?=
 =?utf-8?B?NjIzbTFteTU4eXl6OVhDckIrb1BvcGxRditEZFZwZ2J1Z3pBWU10YnV1U3hH?=
 =?utf-8?B?aEdJTy9oOGpIUEZ0Ly9XRWlWUnloUHZZMXBUUklMQzZIU2FBY0VQTjEyMnJC?=
 =?utf-8?B?eXlxNmlqOGh4S3prbXQ2YkNJTUtCYWZoVkcrY0t4UmlXTTkzMDRrMEd6cm1y?=
 =?utf-8?B?em9meEZGYUFDeU4wekpMSERZUlA3bXJGRGJoY2lDOWhvTm5SaTRLdlYyR3gz?=
 =?utf-8?B?MG9pcVV4Q3ZyVlFwQ1p1MFArSURGam5COGUwanNOdCtFUTVzMWZaUmhUOUFQ?=
 =?utf-8?B?YktreDJyVXpDRURPT1VQOWNVRytWM1hrelRTWkI2bXBKdXo0QnRvbSs1d3VR?=
 =?utf-8?B?RXVnN2NrZnhBeXZBS2RJTWh6OXROajJDQjZOd3NCUTJtWGo2cWcvamZpTXZI?=
 =?utf-8?B?RmtTTXJEbmtUekNST3R5ci9MREl4RkZhOWdWZytic3V6R0d4R1hrdlFPZ3FF?=
 =?utf-8?B?bXB5emc0Ui9Od1BXS2VkaXdoZ3V2WDB4UkszT2xwRlRwWW1ra2kzQ1laNXNh?=
 =?utf-8?B?Y3lXMXMxOGZlUVNscXZpTk4xQWRnZFpSakR6UzR6SmlpNE1CS1RHY1NGYUtQ?=
 =?utf-8?B?cHZZdkdGeHQvSkgwQmJicHhpZzNqUWYySXFtdlpaMlJQQXFYMzMwVVRBbUJ3?=
 =?utf-8?B?N0NjNTFlRzVqSEhpNDYwaHFVN3NSc3dGVjdjOUZQUUlRZUNGN1BsTUU3M2py?=
 =?utf-8?B?MTJDVU1sNE1VYnhIMVNoL1JvU3FBc045bXBWeTZ3ZThKUHN3Y3cvK0crdGhu?=
 =?utf-8?B?UG85dXVrM0F1MnMzZVNlUXkxRjRwMXJ4TjlaRXk5S3RKQWI5U3RWdlRBSlg1?=
 =?utf-8?B?c1VWRVlxajU1TE5ROFFnWFNKNGRwL0piYVZZQjZaMnhVZFBBbWpHOU43NzNT?=
 =?utf-8?B?N1FSZm9nSjN4MmhycjdQSDVGRWhsZ3g4VlcxSUNuVXJPRVlZWjFuT1BPU21I?=
 =?utf-8?B?cG10Y2xYczJZWU5QbytZL28wRFNYUlRmaTJ1M2VVeVZsV0lKMys5RC9sSkZL?=
 =?utf-8?B?ckJJUGpmVWRhZ1NmeEgxQXpIako1N3lSMmJUcjFBNHJnMDd3NExrTVkzS0E4?=
 =?utf-8?B?ejE0K3c5bkhIVDhQdHZCTHM2VHZWQUgraW1HNmJwRFNhUE9MN016VU5ZaGVO?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b318b1d-ef00-482a-1f84-08dd6e0298a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:12:38.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDLXmft6JOOqEP+XnFXF1aAkCTMOKorZEqr61LJ0hpHtQ6/HDV5I9fpk5TPWH0qiVIANx74TQFinWO9hB2XdOOBidsuwQ2UCGztTf4wgG1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
X-OriginatorOrg: intel.com

On 3/26/2025 6:44 PM, Chao Gao wrote:
> 
> The check I suggested can also achieve the goal and is simpler, right?
Okay, I’d (finally) define this mask compilable for CONFIG_SMP=n, in 
topology.h:

     #define cpu_primary_thread_mask cpu_none_mask

Then,

     for_each_cpu(cpu, cpu_primary_thread_mask) {
         if (topology_logical_package_id(cpu) == pkg_id)
             continue;
         ...
     }

This still looks simpler. Plus, while timing isn’t a major concern on 
this staging path, cpumask_first() on every CPU appears costly. On my 
measurements, this takes about a third of the time compared to yours.

Thanks,
Chang
