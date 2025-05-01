Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD961B5EB5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120946; cv=fail; b=fVobfO5OvrP42zo3N7SfjYU1NbMU/kDeHZM0DRaPwwskR2neaHkhclJLgwnNJXIp3yheiuaaybJwg1IhDqRqh0M2tFsCS9x2YKsOjR+yH9dn97GzEHk+XKRlAR01jga7onHeaoBwsAPfULplcuQGsPTPBadlhebg7s1to0jHVe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120946; c=relaxed/simple;
	bh=66gfl08f1E5kSDzs4O5qmrfidxD/t+xVzYF0lxgb9LA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BnZyWMq8YmcKwnztPXJjONmu6eg2IYY9ETh7K64vM++HF3h2SmCYSkhLLewM1qrVQ2u5xf9YaFknbHWiCS/57EUtfIs4VchBhF/ekT/lOcFHq7J5Zh/lu5Q37BcggxM0Hh0+/g8OEbzNMJVP0TZ1HikK8uMXYMIbTcEjkCkvIu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jghmjlj5; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jghmjlj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120944; x=1777656944;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=66gfl08f1E5kSDzs4O5qmrfidxD/t+xVzYF0lxgb9LA=;
  b=jghmjlj5NzMenmYp8AW2uwxRROQwmWVk47XmHso4g93rbkp7y4UZv3hI
   27ZTkpOB7PPoLfRVk6VLRVNxdBpZUlnVxtyhNMdrDUxsXZpDRCk/3D7A/
   /PmE8JqFIoBdGc5GM5WrKun//EIFixL1+N7u8/w5fVMkyayTKmnG8oAwO
   MQRL0Znp9amHFQ2PaP+KUmQvU7EJFOQReAkB0E18YfQa6LEnr/QDOWeZK
   0bwej6m9k+cUbEXjEcvoPqJwvZXRNUQ9AY8h+S7R5eHC5Xjk+kIR+lnLq
   2gCXUbd/vrulPPWzXzxrlc0pT5bmwFfEHyxLYit+cYm5hr8gjT3Cto+sL
   Q==;
X-CSE-ConnectionGUID: uVn9jNOqS5izaCjfOTteZQ==
X-CSE-MsgGUID: +VcgXtv6SBq0HmHPLe+uzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47710694"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47710694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:35:44 -0700
X-CSE-ConnectionGUID: LGlPxSwDR6eQUs8swF3hvA==
X-CSE-MsgGUID: Fg62Ss4RTsqE10z5wHgkbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171678533"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:35:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:35:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:35:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC0FwGgUEm7bk01exfMU1dt3ynq51kU3UErC8tM/GWRhrBK6ZLGwM8V964P7oW+OmFqknyyaCiqB/YlHunWcWIG+I3U/O0FEk3kKWhZTrwcLP/NiVD3QoRGvOTswylEkT4zf2BOryxOOHcwpHT5iG9cDFGjSQie6pO7Llc2jQImvo636e5FhE8UuBQpZdBkc050fDaAI+Jgue2bBSjhBe2whJ8ody5owbTeABZBl2maJAeYLKvVnqGMRlyTK9hncJianAvAA4m5GoXaGnGRbHmzK05MkCKEbIAzIwqSE3pm4babGxQJ5w0aUyuzzu+99/hrBXs4IyOAu/RFm/40Zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWl70BZIVQmBq1x6+AcfJKhwjNa9Qk/zmzSBwFE270E=;
 b=OKib7zVEHPfAqmFFbqgySUEdTI4TGAfsAgz8hY/wdX5V5VMVq50hKiaAdtNulkGVL52+oDQdBSDxSW+7m1tQ44PzN0U3YmrS1TfWX1FXZvWZtgfWeN6FTZAn1EByZ9H9Hf/eTq8/hqHMqJBT1TJ+stL0ybDLg3FeNSC1KTqLl/Di/AnX2BdFFm1ggfLeUKdD8Cn3OGlXMwJfelVLQwIVwREQWsJXWJ2hRgOvvM+ODxpKtHhao3CmotyW7vcF/zwxND8jXywU2Ig80xVS66JtszOEjZJvmD95conpau69vPKyCGdwVOCni2ssFapynCO+qyfVPFSZSeetb3Ser9Dqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 17:35:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:35:35 +0000
Message-ID: <95b74312-fb50-43aa-9ad2-7dcac698ae25@intel.com>
Date: Thu, 1 May 2025 10:35:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 25/27] fs/resctrl: Change internal.h's header guard
 macros
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-26-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250425173809.5529-26-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: dab7417a-6e9e-42d2-46e6-08dd88d69470
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1dKT3EzT3dqUzdvejhJeE93bThVSnVQV2RGeEx6Wmlobi9jeThOT0dnRnVv?=
 =?utf-8?B?N1FJREpOVE82TldpeS82VUlHZFBnSC9jc1o2MUx5NUlvMmFmY2VOVnVWYkFw?=
 =?utf-8?B?dDl2SklLTEVVcGJaMEM3eWhJUE1QZGtJcFVuQ2N5dm1lZW0zZ3BheksxbGRY?=
 =?utf-8?B?SW9yZUJQdHVWUjlXQXRQMUFSTUFFTnc3eDFGc3pTSG1oNlc5Y1k3eHd4TThz?=
 =?utf-8?B?cTVzNXFUNmp5SWlwMWpqbVNZYjJ4elNiYTlCSkpJNTJUYjRuMlZMcmQ5cjFi?=
 =?utf-8?B?SXlDWWxmUXFKZU1oNnJvbnp5ZXRUUEpDbEM1SjV4enBUTmhBQkxaTjQ2b2hn?=
 =?utf-8?B?WjI1dDQyOXhiUklYN3doZE5GVXMyU0ZaR2w3ZndWemdrZTZwRkhZNjBFLzNs?=
 =?utf-8?B?akpDT0xzWXFrZW5yYkxMNmU4VmNsMk5xY1VqdmVreU9aTDk1NVo4UkR6aW0r?=
 =?utf-8?B?d3RGVEh4dEx4c09mbXQ0MVN3Z24xUjJ6QjlES040bXg5UWlobEltNGhTbmpJ?=
 =?utf-8?B?bDZsb0FIS1FNRVgwWTBscExIWlZjdCtOYy9mdkpjWkM0THNQaG5MYjlPU2kz?=
 =?utf-8?B?N1VrbFV3N2luV0VJL09RV3NRZitqV2V0SmowR3lvRnM3Q0MycC9BV3ZIZlpl?=
 =?utf-8?B?cTVBNmszUXNUcVBGQldKRHdhSStsUy8vVUR5a0VYS0E3ZnZhN3lxVU9qMzB4?=
 =?utf-8?B?Q3RvT1ZUMmpOTk9yR3U5THlpWFJFaGwyenFSWmFxdjNGdzRqRjhwS21BMUw2?=
 =?utf-8?B?UGFtblVlRStuejBNSTVNVC9yMVNMMW9lcDRDK3JKMktyZVdpM2UvdFB0WnBV?=
 =?utf-8?B?d1AxZFdMNm9JdXppYW84YVpTbzRzYXlZcjF4aGJuR0VqQ3ZYam0wNWpTTFdX?=
 =?utf-8?B?M2t1T0JFbnpMOVBVbnE4Z2UvaFM3RUpHdDVXa2NLbkZyTkhkZWVlcC9xQVNt?=
 =?utf-8?B?cUNmU01hRW44a0JpT3JXN2V0UEIwQmZLZGtacFJMc2liOGpoaDVKQlNlS1k0?=
 =?utf-8?B?OXRROHRhY1g3ZzAvQk05QlRIcVYzNjAvdHdoZy9aenFld25FOENSVjEyRFZy?=
 =?utf-8?B?ZW0wYU02N1dTaTNNYTIveldxSnFyelhBL25ZYnRXcjFLUFVub0w1NDMrRDlP?=
 =?utf-8?B?U2VVKzNhQjR1WkRVU3ZkYXB6ZGlIR0xwcURoSUZ2Ny9IVVY2VEJPb3AvL0xp?=
 =?utf-8?B?OGp0SUhSU2c3ekhvZFNvNStZSzVlS0pjNHNiRlhGdmtmRklSODRJeHJhQXNz?=
 =?utf-8?B?TFJiOEV4M3R6NmtmNVpuczNuay8ra0ZKR1RTMXpSbTFLVnRCTVJDV0VsYVht?=
 =?utf-8?B?cnllUTBRWXRxd0tmZHJQaEZobWNJNUlHUTZzRFlqSDRXMkNBZHdxc01kUUYr?=
 =?utf-8?B?bmZkZ3FSQnkzbmdBVnBKVktVUFNXTjZ0aDNHM2NHSGFoTDRTL2NYRzQ4ZFh1?=
 =?utf-8?B?TUMrbVBwQnZvTzdZaG5PK1pnQVdvT0lGaUZGcDNSaWRKbWFTT0w5WHRwdmc2?=
 =?utf-8?B?NXR5UEpiNmt2b2FxSDc4NGRRVG1RQlRBNVBzMllYckF1bG94SlFoaDRGNS9x?=
 =?utf-8?B?RE9wL29WeHM3RmFySmJRYjgrS1N6bm1UZ01NRWpwWHRPUWRvNXlVeGhsLzV4?=
 =?utf-8?B?aVRjd0d1N1ZzYzJ6bFZBRml1K1N4VVdrazhQMXR1MXJVcGQ4dG9zNnRMb2pG?=
 =?utf-8?B?ZC8rWUg0eGhncEo2dWxOVzY3aXFQMmY3QWI0WTROMnVzek12YnlMc1dic05V?=
 =?utf-8?B?M2JndjNLOWMxQmd0QzFtc3lhRHlzVDdqLzJoVldFeE81MEJWM0ErcDlRc2hG?=
 =?utf-8?B?ODFEM1hGMlF5L0xmYVVrS1JDV05zK3RJK2NoZWpDeER0d0ZaMCtxS245akJF?=
 =?utf-8?B?clRNM25QQU5GSjlrdmNoL29jb2VtQjJNbDRHYlFacm1tTUhQSzRkQnZ0SG0z?=
 =?utf-8?Q?jf32N11fcCw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTQ1TUFJbkJ2ZGs1dit5UEdrKzFiejRhdllPQm9ObWNDWk45ZnNzMC9oYTBz?=
 =?utf-8?B?RDNGZHlwaHJnY2xHR1MvZTluSVl5VDhkOWZPQjFRYVgzSC9yZitoMkNjN1BI?=
 =?utf-8?B?NHUvcEpFWlJyYUtLaHgrM3NUUk5jOTNySHRKdms0KzJ5cjlua3FqMTBRMWlO?=
 =?utf-8?B?dVZ0Q202eWtGRW9vcnU5UE5GTlJOK0E0VHBiQ1BaOVhjNHh3NWJlTXMyMk9Q?=
 =?utf-8?B?cjd4aU1jK2gzWFZMZ0lmTkV4SnJOSG5qY0xKeEt6NUNyMXFpQjNKbnA2eUhq?=
 =?utf-8?B?b3ZjQkE2STJJS1FhdUdadnFNSGUrb05FNzc3NVRUQm9RZlcxRWMrQ1YwMitr?=
 =?utf-8?B?ZFhxZ1d1U3NWdlZ2Q3JSNHJMVGRUNEZtaVY4cTFVNVhsRzdtM3FOVEl3azRi?=
 =?utf-8?B?aUczU213V1A0S1Zkb0dNbzUrdjlRbjBwd0p6SVF4MGNmcHpTNVBqUGtCWG1E?=
 =?utf-8?B?eTZSM3pyMHB0WC9iOG0wUjVhRUQ5K3dqMHhJajQ2NkJudURXZGFHY1RxZGI1?=
 =?utf-8?B?Tm1Jc04wU0k2a0hCaHNndnF4TDFxSm5hM1RuRk9qWmxhVnNRclhJUDh2dzda?=
 =?utf-8?B?QkJ5by9kVTFhRTZMUGxZYlZCWEVYVGgxNGlBa3JQcG4yNDhnRHBaNStWenRx?=
 =?utf-8?B?YWpxL21yenVhODE0Y3Z1c25SdmVNanN4MnhZRkVrZlVacUU4L0pCaHRLaGlu?=
 =?utf-8?B?cTV1SW16RzlPbzFRYTdzdWVvK3kxQjlwY3BjZXp6U0lqOXdGei9oeWZVUjNm?=
 =?utf-8?B?R1RiT2tTMFBabVFTai9IYTJkZkJUQmpMeXlMdSsrRTJTV1ZYbnh5Z3M3ay9C?=
 =?utf-8?B?NVFlL1lXZ3Q3cndzUFBnTGdNRk9zSUFiSVpHSjdiaUNPT0xScVpJVlM0ZzEz?=
 =?utf-8?B?ZXBaZEtYNkJ0QllNcWZDVWoxQ0NuZDFSNTh6VDZYNFllaGM1ZE5EeHh2dmNH?=
 =?utf-8?B?VmJnK3hrTGJEUnhhRHlIN0hQUHVTKzhOSnRIS2VER3lHUjQrRmlHOTNhSGpo?=
 =?utf-8?B?VGlUY2JJTE5mZndFeG9EamNpV2czaGNFTVkrSXhqNDE2aDFUZFgzSzc2UHZC?=
 =?utf-8?B?OXhSWGx1OVZibUoyL2dvZ2wyT3JtSzFXS1Bnd2tTQjBiQVNrQU1PSkNkaWhv?=
 =?utf-8?B?QnpjVEpwOEdUQ1ZzSFdVeU1laTAzL1E2TXZhVGxWVzVPcDVmSkpxMTJyNHpx?=
 =?utf-8?B?aTBPcEF6YXNFMFQ2SnYwdDV4RGUrVlZ1SXQ1RWhyRHZKL2pkblVIbFFjM3lG?=
 =?utf-8?B?WjlvVjdRQnZZd3huTms0Yi9EUFRZOHZoQlFQb1JYNzhUK0xURnNFOERBTmZY?=
 =?utf-8?B?YTF2ZHIzUkdHbHlxWkVodzk0OVYwTXBjelVaNHY4ZndLeDhCb1RMY0kzRmJO?=
 =?utf-8?B?eFpNSWg5NW5uTGJROXQ3TEVPcWFFd3hEY3FndFh6MTkyanBSVTI1WkVlaXVP?=
 =?utf-8?B?Um1TSkFrcGJmTThXSWl2Mm1hWEFmTnIxdzRFd2M2Z1NtcnZCY0NsYjJDeEg5?=
 =?utf-8?B?NTVraUd1eGpEWE9CbzliVE9ZTGdIeVlWU2RlNnR4YTVKVzJ4Z2RzNGIxREE0?=
 =?utf-8?B?OGdzbllxWjlSWFZwT3hNUkNrM2p3Ti8wUXAxQlJPU3NSdlZJQWJiMmgvN2p1?=
 =?utf-8?B?T244dHowOEhyTWVCakNPWVhiR1BSa1RTZk5oR0M0bkd5Z3Bwd3BxRzRRQzM2?=
 =?utf-8?B?QlhYNzhvNCtCRHNXVElMK0hjRW5tenJFOW5FY2hyb1N4Wlg5UnB4WklRMU9J?=
 =?utf-8?B?eER6U1N2cW5UWHpFdWYyVzdYdVNoaGFBUTZYb0hLT1ZMd1ozbVVQR1dVQ1Vx?=
 =?utf-8?B?V0ZUcTJicTFvYU14MEZPUFJWV0tFR0syU3FCMEtOL2F0OGxYdGRGa1Y3YUZG?=
 =?utf-8?B?TFA3U0JwNStteCtFdHhpZWtnK1VNcEZHdEtQbmtmeTQ5WUVmTDJld0hqTU5y?=
 =?utf-8?B?dFAxYWNkNWZqajNsTXc3R284T2MvYzZzSGEvajRDV1pFRlJZTmVCYW1veDRy?=
 =?utf-8?B?b2NuWTZyb0EyK3lOK3ROLzh0Y2lYMXRSOTdTaGhVY3d1amdveWVCR3ZEL2pD?=
 =?utf-8?B?ajlZNEhtZlJjbWcrbUNLb2JadGxLV1ZuU1hTSFVKYi9pNzBjSklZcjdsVzZU?=
 =?utf-8?B?Uk5uZitXYlBvbCsvUW1CNVB3YUhmaDR4VWUyY2thZkdSeE52TWd1OHppRlJQ?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dab7417a-6e9e-42d2-46e6-08dd88d69470
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:35:35.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOKoQijh8H8VoHQ7RvtfrQSvnYefb5zNKkHUdZi3HJVijqYGnZQ8WeWDswZrt4W8SUkaFX7YLAZVAlXpft9QhOZS+ZfQcHYALhhGe/TbU34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:38 AM, James Morse wrote:
> The code in internal.h was moved by a script. The script didn't know to
> change the header guard macros. Do that.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

