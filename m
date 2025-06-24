Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F34124C669;
	Tue, 24 Jun 2025 21:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800531; cv=fail; b=jkh2ng6wCyVvF8GvFGtfQRRT/iSTMgL1COq/gLQhEoOP968GSnF4Mgj8Zx7Jypv2muwIBZJLBe08DZFrkZCHilqTqWLiiFLAmYCYepSl5t+jbk1GupgEQ08koLyaNI5++b7gLrHX/CAauAOIp81AmkDj0eH64LJ7fvBJKeHCd/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800531; c=relaxed/simple;
	bh=hDb0QEe24MW6BP+7zJjQTuPZtM8Iy/ExkFJK13v5noo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W16/EnAH4oVouY7q9SMO36wqq5dVx3Vxi9KacaYKhkkwdsV9mphnruMmhv+sfaacRSTP8j5f/bEJNpkXu20AiL2+WUc36vZhkdmfNPkP3Fr8xRsOF5/WrOwxkBJMO3yPC0eZ9KIY7morDVneUlMX+EVPr45gm8Stc3LzWpeUGkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BniojVAn; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BniojVAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800530; x=1782336530;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hDb0QEe24MW6BP+7zJjQTuPZtM8Iy/ExkFJK13v5noo=;
  b=BniojVAnEM3i9oRk41g9AKtKfoG19VyT/vOM22JKPhqVDWF4FhGi8oRa
   QISmYbV0Gm68EteeJYaIWMfIc1OeS0OZVAITNDetLUywRn0P58IwEvl2Q
   glsU5Fo3TJeLA4p+5zvBJUYU5QCZCZ0XOW/RcCb+SYGQVlQCrlk4bE67Y
   hwdGSDdC27D6Tv+59LD82K4vW5u9QcKKOapB9JGu+FBdjoXpyuqT+eYZm
   ViPfqXPuj2yzlIq9dAxqFgxpEptnbAAhcaGyXdRTsmf4znNsRx8arGFKC
   VKqmgGtbTiLP3i/lapVZZF9jSpQDGfX3s7XGNgOZy3iX4eqkjceuBVVUi
   g==;
X-CSE-ConnectionGUID: hXhXsGkrQxCNybQLX9o4eQ==
X-CSE-MsgGUID: d/7YxLMRSVauE8yJ0SrSdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53025348"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53025348"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:28:49 -0700
X-CSE-ConnectionGUID: WHFItdGGRF2TfqRXAQqAYw==
X-CSE-MsgGUID: dUYWBxaUS2uGeatENWtNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151529835"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:28:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:28:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:28:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItkUS23WT+jFut6WckcQDpPevr108937Q2d+5+WCyAU0oHnmf+nAyHkgqOCQIPsJoeM+bPGegiNh+ZBeO58IwB8F8abpVyQoNKHL2GmdCfy3q9dEklpisNPaWTn3jrPXaBZIFrDEZ2Rly/6BWUicE6u7v0Z1VZtqgP3B4rBV9Yp795xk/nYo6zhli1t2JtijkQ01dFdqYvRUuYZQypQfQs7Xayp8yVIzWix6QDTpLxoKaqSXnp8jtcyTSyopZNDySX6GaRm5z6n6y/y7cWzpFTz/O2hS45k05UqMq54iRwZl5JVcevtzXnCc2+5egGMNQAiRcdlTw/seenx0JxRkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hKZgToKrRM7O1I2FYF8Y9PWjdUQEg4Hoqw/1O4FE5Q=;
 b=d8O9S1f7ZhAusdsUE6zeKLXb5hEAaQPvT/4Rmup3lwYXZnWchhYFXVvGOeXlUg8HlEx6IhvQDQDsxX8Sy+30BwCOptlV+W7G8X3E4F0TzC0TtJjtvBX3BpGV5GVNKyc3vOcK8ySgL8ZCLiiJ+2oWf1lnerMs5HJ6LifQ/fU7lt+n5T5682jcU6W5fqFeXAWcLdOq6OGQCxUFZGM+c8vP2dJs4F2CDiT7P0S5Q5Gw8Keo9jrQbruEVLNkOtpk/IcnH36liV6Xrbbe5uDnSMxgnZScJSHCR0aQC+8Hkcdf/eA+jJ+DfFwS6xJ6awbnGRbFhl9fBdyNacaCQ211HdCwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 21:28:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:28:45 +0000
Message-ID: <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
Date: Tue, 24 Jun 2025 14:28:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event
 descriptions
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
 <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba74789-3742-4e4a-e684-08ddb3661972
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHR1RHIyMHp4cDE5YXVQbURJcDdjZTBSYXgrR2QxRWtqYXJBSVZCZEZuNzNU?=
 =?utf-8?B?VWtYWU1oeU1nZ1lHQVVzSllLSmNZUi8rT3c3VkxpT1VpTDc1Z3N0MTIydmRv?=
 =?utf-8?B?N1NILzNPdzI0aElmRk5WS0hlaFpkUmN2bG5NL1B4SmNzUEF4NjE3MGFGK3di?=
 =?utf-8?B?SXN0ZFZqbFBvalJkMncyVSthR01DajBLUm4vOHVVNkQ1WDJRTVFyNkdtZ1FK?=
 =?utf-8?B?TWRVeVZzbWMwOHBxOXpHTVpJbnBPSEJxdTNjZ1ZCQXk0aDA5VzlZSy9QUnlD?=
 =?utf-8?B?NnFrMWZxbW51bTRKbVUxeFBIa0FaaEUvLzJ3YzNlbEhvcFgxU3AwcWIrcTZU?=
 =?utf-8?B?emZtZjdPOFM5UGt4MXBFOGl6OHd6VHFWZFkrL2JTMTBFTGlrMmZXVVJVR1g4?=
 =?utf-8?B?VTZMSHQveXJ4T3VES3ZWZ0dwaElLYjJ1NDdlQzVCK3N4dGZaQkhneXRGNHY5?=
 =?utf-8?B?dXFnOE1DbFI2WTF4TTdTbUY1NkE2QWxIak50M1R5Y0F5cEhYRllWaEEydGx0?=
 =?utf-8?B?VlBLTldGQ2pRZ1hDMlJicUt5TzBDeTNNZTVVeGR6b0pGT3BTTUZNejExS29i?=
 =?utf-8?B?c2tQQzNNZXVRREVBVDV5SE8xcWhXeER1N2x1MTlrUjlIVEdvbXdKMHI1b3U5?=
 =?utf-8?B?STBXdDZJcVlVajdiVTBjdHNFamNhRFZOZWlna0lKLzY1VGRBUHRZY3FYN0gv?=
 =?utf-8?B?MWpVZ3dJMld2THFTZVlHSlduM2ZYa2l4NFkyUnZSZWw4cUNqU0RHUG5ZTWYz?=
 =?utf-8?B?TlJudFFaYk11S3Bjam9mZm42WndXbENsM0o5UTU3WmRnTUJQdW9ML1FIZHFR?=
 =?utf-8?B?cjdCbVB5UUxFRDlGMEZVWi9xNm9IaE41eUZ1ZTN3VllRTTVPcm0wNFVEelZS?=
 =?utf-8?B?aEthbTFGb2lHTk9CekhXSE5pS2hmS0hGVGptZ1YzYWdSTnErdUpIc21DdFd1?=
 =?utf-8?B?dGNxd0hoZHd4ZHdvbFJhWEgzNndWK1RSanRDZDd0blQrdGU1andtMXluMThw?=
 =?utf-8?B?U0x4bEp0S1AwUHpRSEs4Mm1KMGlnR2RSZDQvcG5sRzZHR2lOU1FjUHFabzN4?=
 =?utf-8?B?RC80cTVQOVMrNGk5VE91SUNLdzNneXl4b1NENTVzazVhVkFPVDBWU3E0Ry9s?=
 =?utf-8?B?ZFFpeHhscFVMVFIxdWptdHJVd21OMlJreGkrdFFTUWRhVjNZUW1KR093RHVH?=
 =?utf-8?B?UjRCNVQvaTMvbUpkQ3cyQTczUkFaSEdURjhKZmdPNTA4aGQ3TFp2Y3BrL0pl?=
 =?utf-8?B?RGlrbnhJdDNieXpKTndERW84Z0dRY3hjQzRoSmlraDZySHVlMG90YzNUVW81?=
 =?utf-8?B?TmdXanlqSk5lbXNDVC92NUREbjJiR1R4cWN5ZHNmTVpnYWpQOEIrY3BKSFFI?=
 =?utf-8?B?MmpvY2xURDZzVlZHVHBYdU5OWFp1YnFMNVUwemUwMlFTOUlrQlNyVVBLSjBr?=
 =?utf-8?B?VjNKS3NlUEgxWVBieXltbUQxTWg1eS9XVG9JR0pwcE5QTDhheExxV1AvL00y?=
 =?utf-8?B?eU8rSFd6a2hXS2VPamNYVS92ZldyenJBME1XbG1Xc0l6TXR1dWNjRldORHRm?=
 =?utf-8?B?Qk5XdVkwVC92eVBDR21QUjdWVWNIU3lIU1lDTTNlbTlPUGQxakF3VUk0TC9J?=
 =?utf-8?B?M0hDZTRQMEJob1REY0lwa3E1NGRRbC93TU9aYXhzM1dtOEQyK0dLcU0xUnJs?=
 =?utf-8?B?aERsUnJrbXVFdG0rTDBkelZ3a1NmcGxtMmZGYUQ3Z0dFdjRJZUQ2V0g3eEhu?=
 =?utf-8?B?bG1xZk4wTDVkSk1NQjBxVVp6MWdseDdkck1XeUVML0lqTkhDNzBiM0dLUGV3?=
 =?utf-8?B?WVpCQ1FMN2dvaUtsSGpKT3hoSnNuSFlJMVV2cTkyOExaVG5SVlh5SjBiMi9Z?=
 =?utf-8?B?cEJEN0ZJclNlTEtRQVhBb1JCd29ES08yZ1Z3UFMreUFFdWZXdGtSS2lvakVN?=
 =?utf-8?Q?cUy4WlEP3Kk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDRSTldrL1hkLzBrVlorMjl3UjJmSlRUZ2NjcGxuZy9XUkIvRjZsN3hROEtv?=
 =?utf-8?B?T21MT3I5VmpHZy9uOTJ3NlFaeEVMYUlLVkZYbGdwbnpzYTVLaDNpcnkrNnMw?=
 =?utf-8?B?d2cxeEo4aVg2SXNYSkovTlkvVG9tV20wQkNOekJrQzhLSDJYS2xEdHJaTEVk?=
 =?utf-8?B?T205MlpneUh4VWhOakRiak1GY2dub1NxcExPclAvUzAvd3dsYktCWk1TRlFk?=
 =?utf-8?B?Yi85Nmc4c084MmRzSTZhenBaeThZNkRqRjJnOVdQancxd1Jwdit1dlJheHJo?=
 =?utf-8?B?SCtKaDlQTmpIS0E0VzZBdUZFeDYyTEVxQktzM1B4eWNVOEdlNTlIK2FUdnZj?=
 =?utf-8?B?WmEzMURmVUR5S0dvelFQNlJscDk5QjV3OHdhSzROUzY0U016Z2NJclVKT3J6?=
 =?utf-8?B?MndlMlJOcTUvUmJycjZXakRLRjZRMzBjY3JMSjZ0UXBGZmlQR0hBeENTWEFu?=
 =?utf-8?B?TnpKa0JaVVdIYXl0R3FHOGhTTTBPcFlMTzc3RWpOOFV1dnpjd0QwWEVrKzFN?=
 =?utf-8?B?SDNNYXJBSC9QVHFlZ0RoVXB1cFZLZGJtZ3k4dnVWZTdwdDN3WXJsQ0VRNEV1?=
 =?utf-8?B?bU5xQStXUmdIcyt6S2JJTW45cFdXa3o4Rmt1N3FjVXpBeGF0WERxbWljeUFt?=
 =?utf-8?B?K3k1L3pDalBQU2paMjgxckd3UGdSc1Nadkx1c05LQ05iK0RXK25uZjUzZU9r?=
 =?utf-8?B?UlJXRm51V0dJcS9qVkg0TDAzTUFUVy8zMTV5ZW50M1kwMm0vZ053QUFvVUMr?=
 =?utf-8?B?YTJROEwraVg3UUxzb1ZlSThkaTBZelJxeDZIK3dnQ25RcUVwSUtSZnd6dDFU?=
 =?utf-8?B?TUVsNWU0UFdoRFBFMS8wTmF3ZjBscmxwaDVmNmdOcVh4K1lDYWVsY1hKQXJQ?=
 =?utf-8?B?dXdRd1ZKWk1PcTBLUWJPam1xZEZCeGxHdVpBTXNkTExJQlNqU2h2SlRBQlVq?=
 =?utf-8?B?dTgySklnNGJyTHdERFViWFZWaGFvRXdwVnhjcWxKMWZhb0h2Z1kwQXhvem1u?=
 =?utf-8?B?TVlPRE0vdEFLOW5BLy9aZEZiell0dE5wanpSQXc5c0VlbmFhOWJ5c1ZKUndH?=
 =?utf-8?B?ZHh4QWRHdWE2MjNtZTVBelBNTENPRVhnZjVXSWZaZllVUUkxQTZ6dUkva3I3?=
 =?utf-8?B?emF2ZEEyWjdtOEJMN080eFdZUllIN2VZR2hnR2YzS3d3cGRleTFKSlRPa0Ix?=
 =?utf-8?B?Zkh5ZkNJVk9icXExeVNOWStQeU8vdThmOW5vdzZVTk5zOXpkV09aV1lqRkFj?=
 =?utf-8?B?b3Y1dEROaEJ6cjJOeUdVVHU1dTBEYm9qekNNVVVSNXdjVGRVbjZXcnNVUlNn?=
 =?utf-8?B?R1k0T2lyQmFjbmU2QW52ZHRyVTFLQkNVK0NVbWc1N1ZTc1dlaWxJOTBVaFIw?=
 =?utf-8?B?c3V2L0lieU04QnF1bnBxTEtJK1NGMGUwTUhSbFBZVUl6UlFyL1RGWG85SkQ2?=
 =?utf-8?B?OGtPdTdmK3lIUUNiL2ZCMzF0R3BmZFVpc0tQZlE1R3E0cWZsb3JZZ0NwNWdO?=
 =?utf-8?B?R2hxcklXZU9Fa3BtajBKeXN5Mm9aNEU2Z1dWRlhwWlJKOXNPeXowV3lUdUdh?=
 =?utf-8?B?NGcrelFRYlJqNkZiQllETHZ6V2h1czFVejRMWUJUTTl5K2s3UkZRVGViaDBy?=
 =?utf-8?B?UXN2UVA4TkFKRFVxajFUdkVmM3lQNFRrMFJhNEtoNkhNZWFTejJqT0RsWTZJ?=
 =?utf-8?B?MjR4bEhUYTh1MVZKVjBOWjNRTE4rNGlwbndCb2ROSERyaENITkUvMWpXU29Q?=
 =?utf-8?B?clpTdGxhOWZ5N2l0d1lxZS82WFBFTlJOSERyeXJXWEhZakhZOUduSUgvYmNa?=
 =?utf-8?B?WTMwVEtVYnF6NWhZd2l5dnpIeHVEVDdxUDVEWEg1KytGbzhnUzBNR3l4R2Ji?=
 =?utf-8?B?M1RlQnZrMlBScGpqTThTRGlybW8yVUdrSzlnZXVLYUJwY3liT1ppY2lyZkcx?=
 =?utf-8?B?TWJRMERhdU0vUHFoSXRJK212RGxtQnBSeUtrTVVkc1Bya1dLVDd4Q0M0cm9z?=
 =?utf-8?B?WTZuZGJQVno3Vmd4cVgyVVg3Tks4SnNVWjN1c2ZKeFpLSTBDQVcxbS9WUHRH?=
 =?utf-8?B?b29TM1dVbWRnWFR0K3UxdExHY1JuQ3ZpbDdYMzFIZGtYeWR3OG81U1NVR0tG?=
 =?utf-8?B?bmVBUDNOZ09OU0xhb0xyN0h0cnhZczNrTWFuNmFtN3lsZ3dyU25ERE1ZVUVw?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba74789-3742-4e4a-e684-08ddb3661972
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:28:45.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SocgF1EkAS1RQ+zt6mX4gHMNAXvjBkJCDUx3Lh+vW5fWt28bjP0V/fyHSu2XwJND/dbqTDFBK4NF3W+VU68UZ6TLSxcEuI4qTUW6nyJxs9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
X-OriginatorOrg: intel.com

Hi Babu/Tony,

On 6/13/25 2:04 PM, Babu Moger wrote:
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 0a1eedba2b03..20e2c45cea64 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -52,19 +52,26 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>  }
>  
>  /**
> - * struct mon_evt - Entry in the event list of a resource
> + * struct mon_evt - Description of a monitor event

nit: I still think "Properties" is more appropriate.

>   * @evtid:		event id
> + * @rid:		index of the resource for this event
>   * @name:		name of the event
>   * @configurable:	true if the event is configurable
> - * @list:		entry in &rdt_resource->evt_list
> + * @enabled:		true if the event is enabled
>   */
>  struct mon_evt {
>  	enum resctrl_event_id	evtid;
> +	enum resctrl_res_level	rid;
>  	char			*name;
>  	bool			configurable;
> -	struct list_head	list;
> +	bool			enabled;
>  };
>  
> +extern struct mon_evt mon_event_all[QOS_NUM_EVENTS];
> +
> +#define for_each_mon_event(mevt) for (mevt = &mon_event_all[QOS_FIRST_EVENT];	\
> +				      mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++)
> +

From what I can tell this series does not build on some core changes
made by this patch:
- note that resource ID is added to struct mon_evt and the events
  are *removed* from the evt_list associated with the resource. I'll try to point
  out where I see it but this series still behaves as though it is traversing
  evt_list associated with the resource. Take for example
  patch #24 "fs/resctrl: Add event configuration directory under info/L3_MON/":
  resctrl_mkdir_counter_configs() traverses mon_event_all[] that, after this
  patch, contains all events for *all* resources, yet resctrl_mkdir_counter_configs(),
  even though it has a struct rdt_resource as parameter, assumes that all events are
  associated its resource but there is no checking to enforce this. 
- note the new for_each_mon_event() above. This should be used throughout
  instead of open-coding the loop because the array starts at index 0 but
  the first valid entry is at index 1. The above macro makes this easier to
  get right.

Reinette
