Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E941F55EF;
	Tue, 15 Apr 2025 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734171; cv=fail; b=fPaYmsQLR8kvz8sMQfg8OeGXi/yRd/qIyiecuPbif1v7efHorJ39qTYc6kDfs/P7gtN7kDlie4BGLO6+OHP3n4mXwurIqTD8r8v9CqECN+hjR0mHgQbsy0yDL2MpdqZTdmF0bGUDRzovhatNOaQ3Dyp38vYR3rIjv9bQZiCdNbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734171; c=relaxed/simple;
	bh=vIdWD3E6ZN8uW+jalwbNy+MwVbbs8w9RzpgGHyPHBR0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s9z4RwCixdF3R3tiLGyNyY4K9ubfZudfZLY11sPOq4KK09UON3N929mkaxV6fu8VEmbDce/MjM4Rdre+tIO28IqkpdkAKQRLNnOY5w4jGsS/o72vwhT1ujdV28fG/NRqJY9t7R0q2HbJ0Likyd6NKkkaw5OvvyHxhkEgxhn0wTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J73B8Lai; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J73B8Lai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744734169; x=1776270169;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vIdWD3E6ZN8uW+jalwbNy+MwVbbs8w9RzpgGHyPHBR0=;
  b=J73B8LaiQ+jWttMAI0mcOkTg2OLKkWFHlPc17Z/nukA/qhOSIIssKmPq
   +GEvkKhZMFNV5e/bcM3vqFvfKSCqL8Df3ynRLDQdgZpcpDV+xPlbp+Vcb
   FPLRgRfwrLxRFbo4zpLcR68un59g1tZk1+tmG/sLhd6rzGGVvnmyNbg8C
   QxgoTKzcEZNq8Xa4IvGTvtKP+cNa6xgQl8yDZIAmluxyrhEP9FKYuRFAh
   2G8iV3r10KyOqUx6bcFYTvG1Hde1pWRRZs4IuaNWRRyPd0Ba6PNDBFj4R
   711kMHk90Z1ZcMXAfRWBwI/v9we7TXyp25ly2PoCddUYvR9e6eXN50Lk4
   w==;
X-CSE-ConnectionGUID: O4Mol+jAQdGrI7pOGJ1i7w==
X-CSE-MsgGUID: h/SMsCS5SBiNtvOP8tR4lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46174633"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46174633"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:22:48 -0700
X-CSE-ConnectionGUID: YAkoX++ZTTuz8C4BOHA5Qw==
X-CSE-MsgGUID: VwZt9cTTQfefQ1GQMPHmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130706686"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:22:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 09:22:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 09:22:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 09:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0knTuf68dggYeBlCLvBMxh+mfBDkqrgZlCEkC1xRvZpghs59MTx82fOlwNl2VohT//d+ZWnhgpb51/2bjN4/YsRQ0XS1sJ5396NexdBAXXmn+x/JfqpBYa3ZgQ8wnSXXNjYaiRW4EYWjl57Tue1z7mj6/Z6bkNskXBn4kP3Y44mkliStZufRt91z1T5rq3wt/73dhcEEnzkJFPcFSDTBIbFaOFEwMQAmcplbJfrOxtEjHQtzV98J6RlgHPal9gQ3TqRsUvHI5FQi99bPlMOtc8SdqhpJhDGI7W9fw5X18TUktBcs97rQrbEkg0lz8yuaoTgYdRJEwrxNeHah6qQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enqj0QU+BDnR8CltJ9ad2bctWaEwTiqBWDelLIMebwc=;
 b=jz7hvltpy7uAQ6rssLujxrX3CaS7cXnfPoNlnjEnS+DfpJ87wCRRpLchO4NzV8eKzfdRV6LNZH/7rcFuzlHX4v39FQdu9+yy6siiSeT1GbqZ7ltT3UcfGHxV3ayfmCALMvxvcmGBiNH/WyrVFfGYRfOcdWfzzfGHD0JLXSGUJ2r/dwbjY7gLAct4oSrB5ZSvopOt7Vl002CVUR3K7FY6pbrl3L2vBWgXIDknmsfe+iIDIHF36JvhXAFb4LAt/HmqMUozv6zeZ5mustLqFoxY3mArwrq2UV7Qi9bQl1IQ5r1qAe31Z/+of0dZD4WXzAjf4wn3QEFQ6lQH3zx8LquVag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 16:22:43 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:22:43 +0000
Message-ID: <ab9dd51d-eb22-4295-a11d-2dc559fb72a6@intel.com>
Date: Tue, 15 Apr 2025 09:22:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/26] x86/resctrl: Introduce the interface to display
 monitor mode
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
 <59829882-20e4-4b94-ba46-8fa622841857@intel.com>
 <4fc02936-237d-4060-86af-79efc28a72e5@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <4fc02936-237d-4060-86af-79efc28a72e5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB4841:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc68098-0e6d-4d18-3152-08dd7c39bfc0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDVZVEN3ZlVsd1JmaGRoRnZwZWhHL2wyeTlucE5JY2M4VWlydkxmMzRUTlBo?=
 =?utf-8?B?cGttbWRGU2RXcnA3ZjB5cXZnQklNb2tCb1gwMHNWL1l0SWJPSFNSSjZyR1lq?=
 =?utf-8?B?VHl4YnM3WS8xNG9xRFErSTRFR2dlb0pIZG1uY3YyWnFIdnJaa1d6MTZ4ZlVx?=
 =?utf-8?B?bzdic2lTMHlWY3NvNEJaLys5TkN5U0phZEJTK041a2NvdG44OVdUbzY2UnRo?=
 =?utf-8?B?RDBBU2lTZkZaYnVqL3hXV2U0cXA5ZmxEMllhZmZSWnhmbXRkWnRoUjh3WTdJ?=
 =?utf-8?B?WXYrOU5kT2ROYUY3Ykp2VDZYallIZmVaVnI0c1pNZWJpU3RIMlFxNThiZHM3?=
 =?utf-8?B?VmYxOTZHeXJzeHVXRWhnK3RkYk1DOHVKV0NUVzZEZURQTjNTSnd3dlB5bmtP?=
 =?utf-8?B?MlE0MXRxc3pxc1pRTVpFVHFHQ0tBVXRIZUVpSGtRWHZqTC9VVjFBc3M2engw?=
 =?utf-8?B?OVo2WTJMbEs2cklFaTQ2TXd1bVk2UVdES1Uxbi8wWVRPLzVWTXo5SFRaMkM4?=
 =?utf-8?B?OERBSWtDTU5RV0ZTWDNGdDFzQ1k4TEEzeTlzd2ZBVlVITU41OENhb001emtI?=
 =?utf-8?B?ZW9FWUNMbE1PdWlzcGtNOTZLRWFLSVZ3Mkp4RlFYdTVyTTQ3ZWN1MGN3c1Z6?=
 =?utf-8?B?d1BEcE8zZXMyMWxSc1F3aWhJSzdzcW0yUE1iaEo0YWg5eWtJYlFQRWEzcVhN?=
 =?utf-8?B?MER0Z2R3bVZ1SHJOZDNCZjRrZDJuV2hTYWduUGdpQ0NFVngzZCt0ZGgvMUtG?=
 =?utf-8?B?VitmSVBPcXViWkloT3ZDc050bjVsQU1MbElSQXJ1YVYxYjNoWllMQVM2UFRI?=
 =?utf-8?B?cGZWYXAxNEhiMDgrczk1QTZtNG5raUY3QzBTS29DOSt1MUswdjBOQlh4VFBj?=
 =?utf-8?B?eWpqK2pkdDNaQ0pVNndvejFvUVV4RS9UcXJRQW5hRTVwR29kTTNCRm5aVEFW?=
 =?utf-8?B?dEJGVUJTalhlS2hpaGN5WkN3bUIrU0RDb1hoc3ZOVUJvVVFxTHY0bDJWQUJz?=
 =?utf-8?B?cEhINTVxS25aMjEyc2VCK3lRUXRkb210dUpvSUFrbVZWWXRFQ1BlazMyL1lW?=
 =?utf-8?B?NjJ4aXdQRHRlL0Q2MkF2TitkRnJTYitEaGtXZS85T1hFcklDSUdRRFJkUk9M?=
 =?utf-8?B?ZkprY3ZDVDJ3VWtPQy9uaDlmb285cDNhZEoyNWgySjdzVXRkQ3RRM003NzB3?=
 =?utf-8?B?bk5Ndi9nRUFKczFpTGJqVzFHakxRQysvNXh3UUVBZTVwa0l6OXZPMnJNTllz?=
 =?utf-8?B?Rmp4V1dZQ25KU28rR1VFYXdIQWFWd2ZZOC9xZldaVnZTY0huWmQ0WmVyR1ZY?=
 =?utf-8?B?SnZWSEQ5NDZhQzJHSllzand4NlpvRFdQYURhaDBLUzk5WUtnYUI2OXBPK05C?=
 =?utf-8?B?Y0dqbUpXYTdUcU5YNi9ld0d4d0R6RjcyVDZNcWpOZ2hjRllRMjdMcVF0dG50?=
 =?utf-8?B?b3lwa3ppdHFwK25jbEdGSVdPWmE5a0Uvc1J0c3k4ZWtWOGtodS8xQlZkMER2?=
 =?utf-8?B?azNOd2xHR2Rvd1kzdlpPVVdlTjZUR2wrL2FWVjV3RHNSaENFQmliYzVHaUJG?=
 =?utf-8?B?T2tpRENvdFFKWTZzRFZrYnZzMVcrNFNpOUkyQWV6VGhFM0h2clowY2YvN282?=
 =?utf-8?B?UlVqMGJhSVlPYXRxcUlFSzlhZnlPQVpnMTBKbDltczNUMFpudC9QT29hTUUw?=
 =?utf-8?B?SGJqYkNtWVFDS2E2dXd5UVZBUXNhZGE2RXlJVDhLY2RQalpvdkc5czR1WEtW?=
 =?utf-8?B?NTdoMHVwN3JSUGZJYVNBOUFTZGJiMHdKSi85Y0I4Zjc1YjAwM2pVeXZmbmMv?=
 =?utf-8?B?MXMrVVNtTmZGQWIrMU9pZmJaTi9vM3AxN2treEJuTlFqTkthdk52dnpQMHRs?=
 =?utf-8?B?QmxITTluUlN5MnpOdmlRU3pHK2dFcng3TmQxRFFVN1BmWjhRdG96Nzhvd3hE?=
 =?utf-8?Q?FPiY9zn1XLQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExWbm9PWmlNM2pPMENUcTI0NEQzMDdKVmExNmtvQzJickZKc1BydzVCcUxD?=
 =?utf-8?B?dWhyUDJZQkNhY25CdXU5SGExaUZiNk1EZXdiUVVVLzFZbG02Y0krWW9ka1ZR?=
 =?utf-8?B?cGttK0U5MFRkcGE1ajExQStGN0dadzBza1ZYOWtqK0xQQUhLMmVSRWVMN2Zp?=
 =?utf-8?B?bUQ5c2hTY3c2V0F5ck82RktNTXNoZG91Z3l4OEFkQVplTXpHb1U5c2NaTGE5?=
 =?utf-8?B?cGxLQnY3R0t6WldpQi85MVNxazF6TU9ubE90OUt6UldpQ3BRbTJxQll6U2VJ?=
 =?utf-8?B?bldQWmJid2ErMlp2VHNha2V1SHpHNXQ0Q1lpUHhIR285b2hXRlR3dmFhUDBi?=
 =?utf-8?B?NXIzU0Y3UVlVMHFmSjkxeXMwWkFwcVcvaXFDa1FFY2k0N3NwcXVKbkN2UUkr?=
 =?utf-8?B?NUloRngrWlhLVysyZzdTTjk2U3Q4TW5vamF4VzgvRE5GM0F2Z2ZOLzVQZUx1?=
 =?utf-8?B?N21wUmhSL0pJeXVMZDlUWHFPYWtSalczalhRSVE0L1pJYlVFUUF4dGZvVFBh?=
 =?utf-8?B?a3ZnVkRjQzVTcW13RUpHVzluTXpteStLeFBQNUsycEF5Rld2YmV2eHFoS2Fk?=
 =?utf-8?B?bHJhN0p1NjB0TUtjL210SzVkUW85T3h0Z0o2Um1xNkdSSUdxbVJMeGJnNVFp?=
 =?utf-8?B?c2RyNlBTMWlIQ0hOK3ZVcTFCV1FmMnI3S2QycmhNc3hRYWpOdlRGR0c4cXlF?=
 =?utf-8?B?dk82YlN4YjhjVnhTdnpJVzFaR0oxWGJYeGhBeHFoekZ5Z1ZIL2pBaVhxQmpU?=
 =?utf-8?B?dG53dzFqL2ZIamF1TmtxNkxZNktyVUVFZE1qMnpuYS9lNGFkTnRENmVRbElt?=
 =?utf-8?B?RFpwTXJBeDc5VW5lclBDcUcybWg4d0Yvd004RU11R1p1blVEVVIvbVhPdkFh?=
 =?utf-8?B?REcyaW1NaVdjeXdmQVk0NUdWdWdydzlFUStZZExPS3BwK05hcnM0VVkvbXEr?=
 =?utf-8?B?UjFFOHlBalpBVDNJc3o5NXorY2huYWR3K2N6WU50NVVjMzVyeGhvN2k1Z0F5?=
 =?utf-8?B?T2pRS0VVQ3EvNURyV1pHUHVXMlNyQ0R6d29NVmE1NnV6QzVCNjBHNXBUTmN3?=
 =?utf-8?B?VEVWWlhRYXVMdE92ejlzY0xtQW1NekgramIveU9taUZaVGtyVGZONWVRdDQr?=
 =?utf-8?B?b2E3a2xpUmxDSVNZLzhFa1hXV2lrYnBvQ0NhRHZiY3Y4dS8zcmtZWS9Ra2E1?=
 =?utf-8?B?ZWhkSDBTQmJLSmRMTXBwclNDd3A5YS9INUhhL000OGRWMjFSSWVuODFOWk1v?=
 =?utf-8?B?OWtCTTR3amxKNkRVYUdhRXllVFhJRHMrQ1cwQVlSLzEwQWhrTWZCeGdKZ3kx?=
 =?utf-8?B?bS9OUm5UZmkyUkM3NklGcnRLY1FGaG5DbWs5ZzhZMTdJWUtSK0RhRndxc2R5?=
 =?utf-8?B?QU83eU1RZCs4K0c4cCsxaC9Mb2RReU1PRDl2bFNIVkpLK2YyNlNKcEo3WGdm?=
 =?utf-8?B?R09QQ0FrdzI3ejVoam1vSjBQY0d3ZWd3YyttdUQwa1N0OXA5ZkFlbjhyVi8x?=
 =?utf-8?B?MndVQWsxU2VhZWRCSmU1MEZnK2p4R0NjT3I4bkovOVVITXJveVN3SWk0dDU1?=
 =?utf-8?B?VjhTSThCZUFkTmc4cGVtdXl0MGhkUi8reVZ0YjNibWk2VVRYRmYrN1A3c2cw?=
 =?utf-8?B?bm5wU2FtNSt2c1I2UjdrOUF0VVN5OGg1OTQ3d2NzU0VQT1FKcWNNVmw2RW9T?=
 =?utf-8?B?dUtOSmpqT3RPS3lUUm1qN1ZJWE1IcW5VVUVGbmlOVVd3OU40UDdMRUU1R2p5?=
 =?utf-8?B?cG1UVUZCU2lsYmdyOHFWcHhQbUlxQkQwWloyQkFWZDFQZ1NnM0szSVczZk5Z?=
 =?utf-8?B?N2hNVjNWWkRRWHFSWXAreHN4Ky8zc1lSQTBWUTM3NE1OODlPa3hDYVZ2UUlF?=
 =?utf-8?B?MDRXblRQODNUd0trZGpQMjV6ZnpyR2NnWGg1N3VEOFM4RTR5eGNiaXN0MDZ5?=
 =?utf-8?B?eFpmVFdiUEpwcU5sS1JNMmwxTEYwSlg2N3liTldLYzdSVmFpL0puVEY1Z0Uw?=
 =?utf-8?B?U1hOcGEvK3F1eFVwaE0zcUdUc3Z6KzVDb3pVN3NjMVJ2Zjd3d1VqZ0VOS1hV?=
 =?utf-8?B?QzR2TzlLZWwyZjlZTWFWY2lsc3dXTjI5Umg3M2pGV1ArQ1BOT1RMZEpyRnlR?=
 =?utf-8?B?Ymp6VG5mY0htTFdhTVIvV0VOczBSb1JJc1Y4OHJmRFhXTFpScXNqTkRTQjd4?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc68098-0e6d-4d18-3152-08dd7c39bfc0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:22:43.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNnGA1j/Fny91HG0WmUfgQxG+QFP1Zxc914kN5mrBu0VScwUI2VBExZVjskN/1RjqZnT47Zy0f4XDc8FhMacRjoebVr5ruPi65TkZFS+izI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-OriginatorOrg: intel.com

Hi Babu,

On 4/14/25 12:52 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 15:56, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:

>>> platforms. On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined, whereas on
>>> Arm64, it is. As a result, for MPAM, the file would be either:
>>
>> CONFIG_RESCTRL_ASSIGN_FIXED does not yet exist anywhere so this motivation needs
>> to provide stronger support for why it is used before it exists. There is a precedent
>> here with RESCTRL_RMID_DEPENDS_ON_CLOSID already used while it does not yet
>> appear in a Kconfig file. I would propose that this is motivated by noting
>> how it is already understood how Arm supports assignable counters this was recommended
>> by James to prepare for that work. Since this is user interface this
>> work is done early to ensure user interface is compatible with that upcoming
>> support. Also set folks at ease that IS_ENABLED() works as expected with a
>> non-existing config.
> 
> How about this?
> 
> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.
> 
> On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
> defined when the "mbm_cntr_assign" mode is supported.
> 
> Add an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the
> user interface remains compatible with upcoming Arm64 support.
> IS_ENABLED() safely evaluates to 0 when the configuration is not defined.
> 
> As a result, for MPAM, the file would be either:
> [default]
> or
> [mbm_cntr_assign]
> 

Sounds good to me.

> 
>>
>>
>>> [default]
>>> or
>>> [mbm_cntr_assign]
>>>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>> v12: Minor text update in change log and user documentation.
>>>      Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
>>>      This will be defined only in arm and not in x86.
>>>
>>> v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
>>>      Removed few texts in resctrl.rst about AMD specific information.
>>>      Updated few texts.
>>>
>>> v10: Added few more text to user documentation clarify on the default mode.
>>>
>>> v9: Updated user documentation based on comments.
>>>
>>> v8: Commit message update.
>>>
>>> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>>>     Thanks to James and Reinette.
>>>     Rename mbm_mode to mbm_assign_mode.
>>>     Introduced mutex lock in rdtgroup_mbm_mode_show().
>>>
>>> v6: Added documentation for mbm_cntr_assign and legacy mode.
>>>     Moved mbm_mode fflags initialization to static initialization.
>>>
>>> v5: Changed interface name to mbm_mode.
>>>     It will be always available even if ABMC feature is not supported.
>>>     Added description in resctrl.rst about ABMC mode.
>>>     Fixed display abmc and legacy consistantly.
>>>
>>> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
>>>
>>> v3: New patch to display ABMC capability.
>>>
>>> ???END
>>> ---
>>>  Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++++++
>>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
>>>  2 files changed, 64 insertions(+)
>>>
>>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>>> index fb90f08e564e..bb96b44019fe 100644
>>> --- a/Documentation/arch/x86/resctrl.rst
>>> +++ b/Documentation/arch/x86/resctrl.rst
>>> @@ -257,6 +257,33 @@ with the following files:
>>>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>>  	    0=0x30;1=0x30;3=0x15;4=0x15
>>>  
>>> +"mbm_assign_mode":
>>> +	Reports the list of monitoring modes supported. The enclosed brackets
>>> +	indicate which mode is enabled.
>>> +	::
>>> +
>>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>> +	  [mbm_cntr_assign]
>>> +	  default
>>> +
>>> +	"mbm_cntr_assign":
>>> +
>>> +	In mbm_cntr_assign mode, a monitoring event can only accumulate data
>>> +	while it is backed by a hardware counter. The user-space is able to
>>> +	specify which of the events in CTRL_MON or MON groups should have a
>>> +	counter assigned using the "mbm_assign_control" file. The number of
>>
>> "mbm_assign_control" no longer exist.
> 
> The user-space is able to specify which of the events in CTRL_MON or MON
> groups should have a counter assigned using the "mbm_L3_assignments"
> interface file in each resctrl group.

I think it can be assumed the reader represents the user space. If doing so
this can be simplified like:

	Use "mbm_L3_assignments" found in each CTRL_MON and MON group to
	specify which of the events should have a counter assigned.

> 
>>
>>> +	counters available is described in the "num_mbm_cntrs" file. Changing
>>> +	the mode may cause all counters on the resource to reset.
>>> +
>>> +	"default":
>>> +
>>> +	In default mode, resctrl assumes there is a hardware counter for each
>>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>>> +	recommended to use the mbm_cntr_assign mode, if supported, to prevent
>>> +	the hardware from resetting counters between reads. This can result in
>>
>> "from resetting counters" -> "from re-allocating counters"?
> 
> How about?
> 
> "from resetting MBM events between reads"

With more detail, how about:

 ", to prevent reset of MBM events between reads resulting from hardware re-allocating counters"?

>>>  /*
>>> @@ -1908,6 +1938,13 @@ static struct rftype res_common_files[] = {
>>>  		.seq_show	= mbm_local_bytes_config_show,
>>>  		.write		= mbm_local_bytes_config_write,
>>>  	},
>>> +	{
>>> +		.name		= "mbm_assign_mode",
>>> +		.mode		= 0444,
>>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>>> +		.seq_show	= resctrl_mbm_assign_mode_show,
>>> +		.fflags		= RFTYPE_MON_INFO,
>>
>> Needs a RFTYPE_RES_CACHE?
> 
> I am not very sure about this.  This flag is added to the files in info/L3.
> 
> "mbm_assign_mode" goes in info/L3_MON/
> 
> The files in L3_MON does not have these flags set (for example
> mon_features, num_rmids).
> 

My assumption is that mon_features and num_rmids are generic monitoring
files that should be supported by all resources that support monitoring. When
resctrl starts to handle resource specific information then it should be
clear what type or resource it applies to. I understand that this may not
seem obvious since resctrl only supports monitoring on L3 resource.

Another view, consider existing code in resctrl_mon_resource_init() where
the MBM configuration files are made specific to RFTYPE_RES_CACHE. I see
mbm_assign_mode to be very similar to these.

Reinette

