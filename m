Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B8A25D219;
	Tue, 20 May 2025 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784678; cv=fail; b=SYgVPZm5UVPQYlsxbfik2kJ2doSBv4PWoqMud+bsDHPo8S+t76nbQ1zM3W1MbI0Llf72x8rudcQ5SzN8w4yg7rOPQQixhdNK7L2TiBxFaofLHnd5YXcCLzK0a4j9iBhReDQ8jwzRnUhE7DRk9ANMzHY+u46Kics7vAGTEa9av0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784678; c=relaxed/simple;
	bh=o6uWa7WRXIiGcgwMvFdO3rOhVOI/sf4XyD+f4odI7sw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TtxH/WhhGuSEhCRflaUJbFBQiBDL+mdc52QKajN5vn2PJhgKVxviojrpVzz1dNosrq+IedINP6O1A4Cwvy1IirXo6H654V5lL4wPdefZtIq46KwnpbJ3IHL3yFg5IixEz+TCGmWtVgNp126kymUwepkmjj3ki23MzbRQDeraeSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzNebU4b; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzNebU4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747784677; x=1779320677;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o6uWa7WRXIiGcgwMvFdO3rOhVOI/sf4XyD+f4odI7sw=;
  b=QzNebU4bekKNomjW1vQlzwpwTkd6oqaUVDJezHbtDsP5Qa83MdkpJPqv
   QmdT7+CTOb32H3VOsiMMR4kau041zqrtztFjl2U5ltrPnSNWykjgG67+v
   ZBreEe7PujuzMKK89KpLVeat0lPKvnpmhmggThCyHNIBxXjwwFHOj0WBM
   CYNzmwaB4U+LYHHCnVWKR98ONtdzBhNfYuo9zEsgNUr0S+wgBT7us9IDS
   yyBIbcLr4ddXOuEJct2Mj2NqQ05Fyzi7/v0lFnxuiBDRNW66rGIDiJFUs
   Zn8pekrBLPoUjcF0/pbu6OlXZ4nQf1qQhaqBGevvFG3d4CwEbXSeTQO6N
   w==;
X-CSE-ConnectionGUID: bFqx8sZsQFCIbPba3QYH/w==
X-CSE-MsgGUID: hi9nQt3BQ5SnhsGHB8NR+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49727626"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49727626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 16:44:35 -0700
X-CSE-ConnectionGUID: x2Vj8jY0Q8WJtahOauASFg==
X-CSE-MsgGUID: f9hZmC61RSCZvjX4FSuYMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144808254"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 16:44:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 16:44:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 16:44:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 16:44:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjtBpgGVkwvcB5vJ5xo+/PaRnfORdI2Y/gn39TbFTtmOoGL8rqjP5nNpLgZxlfEVKvCViNra/I0YRtqQJL/u4/kj3S+jT2ci7ApWDDh3qsWpAa+4yzkzmC+oGJYPh4ydaGjC/c/9GCna1LYxGrz/d8SmoTsoytQwElOy5FSpjbPW5CLX/cwzG2zrZq29Z4hYr7A3KvYgc9OO4FlyU/QGFTpMyge32sMuvlIwTHWYim5UuFzUSj5Ogx6DXj7Iss4DEUQpq7hTcEuQ+rkMmyvEEvGcSU+KZXUES+iQE5E/yfXinbxFAWf05vsvrNqYr/Mm7gH7pc7B9G1whXUHmGweAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEQBZ/iMfDc1nnX/eLBsDY4NLhVSmMdCiCzHm/fsG1Q=;
 b=R8mvceQJnZtbnYCCIyCL31rVvUy11QyCJ2BvrnWDJ/l1P0UYoutUgf/FPNo4Q71DsJLBzywPqZ3TzjmzDWZxPlolCNnfCUHAUl5iNPqE9h48usHuxeT8NdkWz7ZGTfhtykz5QBR+PfHEyxLmAd8dAOipsFwuN1+QP2gLP3OPg4EDPhZTmFoQx1oG5QtX2F3Vyv+wTd8FqJWXNN+C9fMY1NgJxBU3j4JIxXuXehUdmSN1iCfgzZVxFADrJB+lH2M9d5TNGUVZLmOf9kPuJXnsKB//APvRxfDk6h3Z3Ze8Ke9epaEuVkddfVlbR385ssa53PO4V7Py0/83z/Ixw7mtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 23:44:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 23:44:10 +0000
Message-ID: <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
Date: Tue, 20 May 2025 16:44:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>, Peter Newman
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
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
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 918bd565-5bef-4022-9cc9-08dd97f837e5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkR0TzluQ2kxZmZ0ZGp5UFd1NFJORjk1TWZPZFlDemwwa1RjZ0psZnNManYy?=
 =?utf-8?B?WEhpaWhpbXZRT2h0YlFIQWlxekk5MFlpTkRTRU9rNWlSSVQ3cVpwYmgxQ2dy?=
 =?utf-8?B?ZkVuM2paQi9aZ1g5c1NMQWRUcUR3VndPWTNWU0J2dTJpRk9FQmw5R28vUEh2?=
 =?utf-8?B?TEk2RE9ubXNXcWxPSWowVXAwSm5BQ3gxQmR5ZHBsMjV1Vm11RzRkanpzKzlV?=
 =?utf-8?B?alJsbGZrbVQ2cFNXZGtDNGxQWllFYldFdzJVZDFvS2tzNUNCTXBzTmhNbm16?=
 =?utf-8?B?bVdkQy9ONk5iYW1qWnBzQkMvYWNpTFNoczJYVjhhVzJPbjRiMDRvWHRVS0kz?=
 =?utf-8?B?Zk5BR1VBc25SRmpKVk82VzgyTjJKSy9ESTY4TTd1NnF3SXhnYzNDSTRUMTlu?=
 =?utf-8?B?aFRIK1hCRXY1TnlPNThhSUJ1QVVWSEZhMStzeGZiMFR4d1NocWhQaGNGeTAr?=
 =?utf-8?B?OVh1Uko0NytVVCtLaUlWOE5zcUk4SzdoVi9qc1R0Q0NVU05GQU02RGtnTUgz?=
 =?utf-8?B?ZVZ6R3FGcWppSFY2dlhXcUQ5TWNpYkp6eWh1QVkzaEtoYXNXenU2NmdsYXJN?=
 =?utf-8?B?dVo1Sm5WZ1Q5QUpJU0FNRG1aQ0ttaG9EMVU2cnM4bXVIZTNicDRGMjZKWjZQ?=
 =?utf-8?B?MDRMd3JIY1pWMlgyMHBQUSthRDgvVDN4U3RCTmZSQWFMMUMxclF4NjFqU3pR?=
 =?utf-8?B?d3Zid256dTBFUTh1STZoRGlLQUdtaTQxTnd3VklZQ1F3UFNUN2E2UG84d05Y?=
 =?utf-8?B?eDY4bXB0RXhhSDlnclhTdktUU3JrdVlTd1psUG9XdzI4Szh2NWltR3hId2Ju?=
 =?utf-8?B?ckFkRVlTTEdXWGFnOE9JaDNncFBtQy8rWW1IdWMrd29RT0FPd2NaakhQZ3NV?=
 =?utf-8?B?a0FuWGliYmVJa3NXYTMwVjVSdndvVlRsVDFCdENoVG1zRmFtOENXbGZnOEQy?=
 =?utf-8?B?TEh6TEhUc0JYYjlINGJsRUdwU2JCS2J6dlFZMHh0bnozQTgrWFJRbG0yMnRm?=
 =?utf-8?B?K1R6NVRaSTdjbjFqZlNLby9LWWdTM2YvY0Z6Y3haRkRaaTgyWnR4d3BVNjA1?=
 =?utf-8?B?YUpyOUlXc3Z6V2lXSGluaURoRGtEVTJQMTUrVk1SdW9uTHlJYzdxOFBtRXRh?=
 =?utf-8?B?b1JQNjJJczJwRnZpcitzNFA2WGZEa0tkNXdxQ3dKWlJ0WitibHQ4SjdhT3lj?=
 =?utf-8?B?TGpiSXlaV3JtdnhQQ1lldFhEUmwwRkpNRGd0UGxNWnRjTWJiai9sbitSdzNC?=
 =?utf-8?B?cXVSK1ZwWjhiUTRMZVlHRmdXbmtmOHgwQWdoOFgxT1RVdERFVlFJK1BrS2U1?=
 =?utf-8?B?R0E4TnNQbGwvZGdpMUVxL2FFZjBLbjJERzNDRTB2bWFab2tiRXhocG1tQXU5?=
 =?utf-8?B?eVF0aUM0dHVRck9WNk5oNzBjMHRGci9jd2RuV0ZGQms3UHJUQlRrKzhaYnYv?=
 =?utf-8?B?VndnNEpSbkRYU2pQZ3FraGlyRG90YUYxN2J4bTlWeTNMMWtmOWR0SGpPY0Nv?=
 =?utf-8?B?QVNhZUtjMXM5VWNnYzR3dkppZ0VmNWtJeUJRcWE4OGVDdXJhV0krZzFFSW5n?=
 =?utf-8?B?U2ZKYWpiUm9Tc20wQkh6ZFREbXpzUTFwTUY2WFgwUnFMMGkvWi9CZVFJMjh3?=
 =?utf-8?B?NWZGZFhySTVwZGJ3enJxTnA5TEtqbEtpbXNzTDVRMjlJQVBNd01YVVRqREl2?=
 =?utf-8?B?RlR4M1RZU1g5Q2h5bHFsbm9pNEJGWHVweSs4V01nSE92UHBLd292VHQ5bnYy?=
 =?utf-8?B?OTUxcE0reTMwRk1iTitzdDlnVENVT1JVYmZkaUxGUytIa0pOc2ZidUVkMGls?=
 =?utf-8?B?YTdrNGI1a0VoZTRkancwdE1FbXl0Rkk4ZGdnRVVHWVpkMEtSZUVwWCtWUWJx?=
 =?utf-8?Q?C7zBO2NF66oOu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHkxVjFpRlFZci9WY2dCTHVMeGF4d0dwRFRjQncwQjJQUmY5Z2gyeFAwVWsw?=
 =?utf-8?B?VnZwZjZzSHFzMVNZeDNTN3h5MVR2Q2drdm9vTFpzSWdtdncwNUt6bllRSXhY?=
 =?utf-8?B?KzJxUng0Y2lPeWdTdlFDaHhQTzRXaWRsVWFuTThRZ0M5NTJiU0N1bmo5bi9F?=
 =?utf-8?B?UUhUczh2andJVm5JQ2drZGdXdE1PWGUzdmViOXJpalpVemxFSVFObkxmeHBw?=
 =?utf-8?B?OG82UUgwdmgrNU1ZM3ZwUW1OaThvRnZKTk40bHA3bUtJditpeE9qZVozSFpp?=
 =?utf-8?B?cVljeXY0UHJrM09uUjhVdWV1SzV5RlhaeGlhb0dyZTRzaVdGV2h2ejkzZWlV?=
 =?utf-8?B?K2RXT0FlLzJZRHAzUUVoODVjVVlYcXhNMG1uWmFhaFRGUnN5clJiQTM0cEo2?=
 =?utf-8?B?OFovTkt1WERoQ1pLVndPcGhMVGl6QjYxcEJVQ2s3ekEraHR5V1NoSHBFeDUr?=
 =?utf-8?B?SFcwSnFseThSQVFtKzk0Y2pTQ1JqNTF3ZnRiNnRUZ1pxSG5VVXp2YmpoRGdJ?=
 =?utf-8?B?Q01qUjkrTHdsQ1JoakFNb1ZLZGVCY2xKb3VyUEhERzNCdUxCK2VyMFhMbFVW?=
 =?utf-8?B?UnJTY053K0xUUVVLbXB3WlErbFFpWnhGQ2JiL0xydzRibTFSSE16NWR4SmpC?=
 =?utf-8?B?alBIV2dqdHYvWUpxa01SdjVrck9FRkViT1dDeU8wSzVBRVJSQzFOajU4dy8r?=
 =?utf-8?B?QlJlTEFlTkF4aVl1VzdhaFJTcmVzTVhMNytVZW9UamlvVnBRT3JtUkM5UkNY?=
 =?utf-8?B?QTVwZUdrenV0ZytDNHpGVmdjcEtvZEhyMlZwT290bVgwM0JzU2VCVHVUeHd1?=
 =?utf-8?B?QS9BTFRSUkt2c2ZCNDNOT0hLYVV6RDJRT2JUZG4zNmRiUElOdWcvQWM2blJF?=
 =?utf-8?B?QXZkeDdtRjJIdDYxaUoxTmJpT01RVkNMNmZncUx6Qit3TlhRRnN6YXpMYkxr?=
 =?utf-8?B?RzdkeG0yOStrYWpYZ2lKSzJFUVVreE53V3RkVHhvamo4MUNDZFREZ3I3Y1FD?=
 =?utf-8?B?RTkzK2FwbnhlcDloUlNSdE93VFo0TDRFYzFvTVNCMnFHUGxRWDIrSVluTFJj?=
 =?utf-8?B?N203WGZaa2ZsRU9aUUY1cmdhN0JScFd2d1dqNmtpL0k1WEdkWmpiMGFSNHJ6?=
 =?utf-8?B?aVlzRmxmRW9jNXY0UW5WU2wvYzNENjBFaGtDV3ZmbGJWVldzSllBNVR6ZmVr?=
 =?utf-8?B?MDZVU1crVTF1L1VSS05OZWUxRk1GUm9VS0JmbFpVQXV0ZGZ2dloramUrcUpD?=
 =?utf-8?B?OXF6Tnl6S0thT3Y1NWdpRGEwU1NQUm1FUzRhYkJoNmxSTTJEWldpTitISVF2?=
 =?utf-8?B?aVRxRUZ1MnNEZUhmY2hhTDdCelo3cXNIOXpOa0sva0hUMWsxSWMyS3RsR25t?=
 =?utf-8?B?ZjVLTng4VVdodkh0anRKcWRvRnoyWC9nS1pWUXdhVkhTZXJrcDBNRjRyWjl2?=
 =?utf-8?B?RWNMYXo3TzJvT0ZGZ0lXWUpIandXVEI1TDdOeEZQc2xxWGVDeVBRZTlZNThp?=
 =?utf-8?B?N1JZWjRJR24wNTBGaTFmRVZWT0VkUmRZRW9qOXpGaFZld25HL2NWaVRaZkJx?=
 =?utf-8?B?R2lrUHJmOFhMdVRXc3hqVVh5dE1xT2tIWHdPNWpCekI2Vm5wakYxQlgydzJx?=
 =?utf-8?B?ZHd6SzdDaDVoQm1hVWJVZHUxaWJRR1lBQitNMVhDdjhnSUZCUms3b2FBYzdK?=
 =?utf-8?B?RytrdTR4bXNFRkdzRUxVc1NkVTJmdG1kOVRFUWJFVkJHVmxLanZqL1k3aG41?=
 =?utf-8?B?dlZUQjB5OFdyakJycnhCeGtQOEtMSmNabXFBdzFQUVNDYzNlcU9DV1YzSmh4?=
 =?utf-8?B?MXZiYWtDOEpCeUdTaXh1MFVySFIzUmhCUFp0cm1nSFcrVk9Gc3N0K01OOUxQ?=
 =?utf-8?B?STBnKzlOMXd5bEN2NWl0TXZ3V3lxdVJQTStGNlFqeWt4T1lJc0pEbzlCMXFv?=
 =?utf-8?B?UnR6ZnowQU1PSFVpMkpQd2h3RSsrUHUwWHdzcHVUaG5NVVdIaUw4TDRxUEFO?=
 =?utf-8?B?MHRlMEk0VCtrY21KbWRyeVBicmw1UXRYU3p1U3JQRzNDcUdSUmhTV1VEWFlU?=
 =?utf-8?B?eTdybmVxWHROT21kWGRKcWpZR01rZjRRNHNNbE16aXZJKzRUZjdxUU5QRm9Z?=
 =?utf-8?B?emFCMXVDNkp3TXZnRnVIaDg4WWxMaDBpZzlvU1hJbUVjWFhjRmo5bHZRdHdI?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 918bd565-5bef-4022-9cc9-08dd97f837e5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 23:44:10.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXfruag5g/2pgPPynxbA8ukXTyEKC/e7fNZ1IChStHTFURxI7Lb3TlYL+NEkzQWptSX2OQJmDXHV4hLWLaqrjvuG8gllFgsmc+1UOZDlUPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-OriginatorOrg: intel.com

Hi Babu,

On 5/20/25 4:25 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 5/20/2025 1:23 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 5/20/25 10:51 AM, Moger, Babu wrote:
>>> Hi Reinette,
>>>
>>> On 5/20/25 11:06, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
>>>>> On 5/19/25 10:59, Peter Newman wrote:
>>>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>>>
>>>> ...
>>>>
>>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>>>>> counters available for assignment.
>>>>>>
>>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>>>>> represent in a "soft-ABMC" implementation where assignment is
>>>>>> implemented by assigning an RMID, which would result in all events
>>>>>> being assigned at once.
>>>>>>
>>>>>> My main concern is how many "counters" you can assign by assigning
>>>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>>>>> can be assigned separately from counters which can be assigned.
>>>>>
>>>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>>>>> number of counters available per domain, which is 32.
>>>>>
>>>>> At the moment, we can assign 2 counters to each group, meaning each RMID
>>>>> can be associated with 2 hardware counters. In theory, it's possible to
>>>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>>>>> with up to 32 counters. However, we currently lack the interface to
>>>>> support that level of assignment.
>>>>>
>>>>> For now, the plan is to support basic assignment and expand functionality
>>>>> later once we have the necessary data structure and requirements.
>>>>
>>>> Looks like some requirements did not make it into this implementation.
>>>> Do you recall the discussion that resulted in you writing [2]? Looks like
>>>> there is a question to Peter in there on how to determine how many "counters"
>>>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
>>>> information would be available in a future AMD publication.
>>>
>>> We already have a method to determine the number of counters in soft-ABMC
>>> mode, which Peter has addressed [4].
>>>
>>> [4]
>>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
>>>
>>> This appears to be more of a workaround, and I doubt it will be included
>>> in any official AMD documentation. Additionally, the long-term direction
>>> is moving towards ABMC.
>>>
>>> I don’t believe this workaround needs to be part of the current series. It
>>> can be added later when soft-ABMC is implemented.
>>
>> Agreed. What about the plans described in [2]? (Thanks to Peter for
>> catching this!).
>>
>> It is important to keep track of requirements while working on a feature to
>> ensure that the implementation supports the planned use cases. Re-reading that
>> thread it is not clear to me how soft-ABMC's per-group assignment would look.
>> Could you please share how you see it progress from this implementation?
>> This includes the single event vs. multiple event assignment. I would like to
>> highlight that this is not a request for this to be supported in this implementation
>> but there needs to be a plan for how this can be supported on top of interfaces
>> established by this work.
>>
> 
> Here’s my current understanding of soft-ABMC. Peter may have a more in-depth perspective on this.
> 
> Soft-ABMC:
> a. num_mbm_cntrs: This is a software-defined limit based on the number of active RMIDs that can be supported. The value can be obtained using the code referenced in [4].
> 
> b. Assignments: No hardware configuration is required. We simply need to ensure that no more than num_mbm_cntrs RMIDs are active at any given time.
> 
> c. Configuration: Controlled via /info/L3_MON/mbm_total_bytes_config and mbm_local_bytes_config.
> 
> d. Events: Only two events can be assigned(local and total).
> 
> ABMC:
> a. num_mbm_cntrs: This is defined by the hardware.
> b. Assignments: Requires special MSR writes to assign counters.
> c. Configuration: Comes from /info/L3_MON/counter_configs/.
> d. Events: More than two events can be assigned to a group (currently up to 2).
> 
> Commonalities:
> a. Assignments can be either exclusive or shared in both these modes.
> 
> Given these, I believe we can easily accommodate soft-ABMC in this interface.

This is not so obvious to me. It looks to me as though the user is forced to interpret
the content of resctrl files differently based on soft-ABMC vs ABMC making the interface 
inconsistent and user thus needing to know details of implementations. This is what the previous
discussion I linked to aimed to address. It sounds to me as though you believe that this is no longer
an issue. Could you please show examples of what a user can expect from the interfaces and how a user
will interact with the interfaces on both a non-ABMC and ABMC system? 

Thank you

Reinette

> 
>>>>
>>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998efd@amd.com/
>>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKVkmb+7isotKNgdY9A@mail.gmail.com/
>>>
>>
>>
> 

