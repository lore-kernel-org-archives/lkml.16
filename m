Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D218BBBB;
	Wed,  9 Apr 2025 01:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162939; cv=fail; b=rHqNJaZdfTplZh/u4tYBLaSzfOsTkb8fKoR/ok5mT+SJV/novbVx9w3OPg1Gc/Gx+xogEztAW+KwW22k65vUFk/cnOanGPw1tf14Lkz1B+q3VVN8037FDJrVRc/7NCrxMBWzeeogEcVBdq6kUKueSDxr4mkq+J/bPfCdYiQoKVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162939; c=relaxed/simple;
	bh=ZMnZ2WnzsTSNU4MyKZ4GSB68YUwciCu0Y1NkhVzfHko=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M8uWlaF3haK78X5tvic7HIEz5UEfs3TMRN7kwyyUBiiraxEIi1jHriU3xVCRJNmYvtT1orz8godU+aXciWNtxNszCdWQUXWNu1t7h7WqxeBvWFqphGLMuD+40EAxSdrPnKSoyofIsuIGmOP5RsxFyk0irApcn9driekZwIBRWAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDD+O6gb; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDD+O6gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744162937; x=1775698937;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZMnZ2WnzsTSNU4MyKZ4GSB68YUwciCu0Y1NkhVzfHko=;
  b=mDD+O6gb9U/9gT/6alhIEJkZcqDmehZnTXVmkT78h8sD4otmGhBAJgYr
   keLS1zAUvnCtZ2PaqWVmrTj7w42iaYqdHykRzUpdiILJIYcmNUy6/GQKY
   KOBfxdxglu6C+Vtp0FvnU0T7cjnr4iLlm/835E2C5ivpaHbNMO22lc8QS
   AhZR9CksKjq2q/xjtdUtXI3ucI3GoTj+re+F3O0SQqhSC7OKtgEXTXSBM
   lIdIW3+iev6pmaGpOdnn/MKOJ/Sv9QQDENX0Te54q50IUu3QDflOWv/bt
   eGD7i1wSlI+gqcKmx2I1k4YeC5M4fm76cKn3aqNnUoEiv0kXiSTInR7BT
   Q==;
X-CSE-ConnectionGUID: ZC49tJN4SMGbW0vP8BsCLQ==
X-CSE-MsgGUID: zNR31KFtSpWLG/Z3UIIskQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56990165"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56990165"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 18:42:16 -0700
X-CSE-ConnectionGUID: pg7kHa1DTZmWdreyTIKN/Q==
X-CSE-MsgGUID: vhwf+Z/YTY6cMc8lzmrnSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128418839"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Apr 2025 18:42:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 18:42:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 18:42:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 18:42:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T86DeMfwjLmMEfgT+Rm1Dfd5eXgyOlSWoQY3Z1tg9AZrMyAf5gB2r+HH3FP0Y06ciq9J/faZDkL625hhFYFiarPPz1TLjIlIQmD5jWDry6QzVrz0ZWCAHgac7EfOz1DhJxKTn4GV7PunAWZ9rAySqLXk4e/7FYhlDubxn1nk+F1IjY6QTqIQEZ34cfLuSSynI6c1+newFjjLX5USisti1PADgMuUA22Ad0b8dGAfEMJjuYb+CwTNqRvplUjaThcKTtjy7rmjc7nOpDqap2UzWsBEHo0NAoWVAN03lp0K/yQfQDv70/4pcgBPQH1z1CcUEqin9bFQe7MGXUVbu/lZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZTou6+RZwTkOZDZyKS8P8iPLooebPa5uFhDUBueDBo=;
 b=e1gidHQkWr1h6G6ag0WSFr2kaP1hh0XQKvpMZTPuDyPgWnpPumwuGsZzCZe+QMgLrn+riNqyKrBnO0UxrZ6vsoL7Buqk32sflhxjlzNqAASxMze3DBuBlanNZGvkou9OHHzQNRTsEBBHKZP5YQlwYsq2/cjdy+z0Wt7S2cM5SuJ7O4DXFRag7BsEL4r6hU9I8Rx7BMKhpnP7gOpm7DLUQ5vBQktL2FIoenkyx9JTh6wxJW5Gc7nVDn5F0+7PrSqLP0RLmREh9p5dP8gGSvZMUP5U6WhiwGzHV9kkIZbd6j7rVz9g+baQmMAim4+8WCeLe6TYxwLzpjFTax6FU27xyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CYXPR11MB8664.namprd11.prod.outlook.com (2603:10b6:930:e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 01:41:43 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 01:41:43 +0000
Message-ID: <5ece1b6b-a225-4fab-be74-b48037986686@intel.com>
Date: Tue, 8 Apr 2025 18:41:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<jpoimboe@kernel.org>, <daniel.sneddon@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <tan.shaopeng@fujitsu.com>,
	<james.morse@arm.com>, <tony.luck@intel.com>, <peternewman@google.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <corbet@lwn.net>
References: <cover.1738272037.git.babu.moger@amd.com>
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
 <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
 <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CYXPR11MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4607d849-300d-4949-7ef7-08dd7707ae45
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzRJVVp0dEtNTnZNMENsYlpwTFhOWDl1WVlMM1Z4Kzh4Z25ocE0rV3JCZWpN?=
 =?utf-8?B?NzA1TUR6aXE0c3dDNTRZVm5ZMHN5YmZSTEh3MmZmUWx2SW1FVGpVZ1Y2ZnhF?=
 =?utf-8?B?TVJGNlpJaVNuVk9xcnQrY3NHVS9GamNNaitIaXg0dmE1NFlhWmM5RTFlL25u?=
 =?utf-8?B?VVJQM2JoN0djMFlCc2tHa1lDb1BxWkRLUXBRRmk2ME5YUkE5b1hoNjJZdjUy?=
 =?utf-8?B?VjhSRU4xeEp1NHBFcVJHWU1KL2pKeStmNXV3aWdJM3Y3ZmdnMlFWcGRhSHIv?=
 =?utf-8?B?SGdUMnpyZjVyWm81QlRvdzFOckdETWZ6TmZBL1gwRmlGZ1lBc0NwQjRmb0FO?=
 =?utf-8?B?eWV0YWtqbmpiTUpYT0ZGRy9tcURRakR6cllBMjEvamZjMFd5K00rL1h0eGtF?=
 =?utf-8?B?d0RkYkFXSFlLVWxGWW5UQVg3NEJLaFRjYUtWdFVtTnVSWEs0eEYxR0QxY1J6?=
 =?utf-8?B?Sm1kL2o0bGgvdFV0VEhrZGF4aE1kMXgyU2swN0JYWndCdGppZlpTWjBNcFBt?=
 =?utf-8?B?eFVsaGt4MW1Zcis1Nm5LVFdnN0hwaDg2dHFoZFc1a0R5RDZmcDBvSGJPZmd2?=
 =?utf-8?B?NW5xbWI4dWRiNjJjdnRWQmtScURWUGJINDQ5eFhsdE9ZOGo1YyswdW5xSno0?=
 =?utf-8?B?MXpENVMwMmg2eG5tdGdzYmNEcXlSa0ZWRVRKUHpVTDhhcEl3VnhZRlJ3QVgy?=
 =?utf-8?B?QWJDVk1CM2hwVVFneUNPTjA2R2ZhNkJ5clpwUjdCWkVRRkJ4eXgvL3FsNWZS?=
 =?utf-8?B?NFhEWGlKeVZ4bWF2WGR5OWkyZU1Xd3Y4My8rbjBiVkI2ZStBQWdQaVp4RE9N?=
 =?utf-8?B?bjlkYmp1TEVQQXlTaHRyNmZYcDdGZ3gzRUxmeGZpakFYdGx0alZaSHJxUHVt?=
 =?utf-8?B?ZzVaSkYwZWp3eU85RW00WDNmTS92a1hEZjdDZXhoMWtiWWJGODhzQkQzOTVy?=
 =?utf-8?B?emo3RWN2bStKaUovUWhEQStEejdzOTg4THFMYVI0S0srZ2x4RGp2REN4Q0t6?=
 =?utf-8?B?SUFOdHo0elJIRVRSWitEcXZRb3BIcERDdXprMkUyMUtNSDh2OHRzNjFPa0pm?=
 =?utf-8?B?MmhJSkJJc1ZxcldwdHFCaTRQR2MwT1dib0lDLzQ5KzlSdlVmSU92eXZzUDlC?=
 =?utf-8?B?ZXNWakNhQWtlUU5mMUhlOGtEZkt4OS8vdDRHcUhvV1BtZVo3QzNKaFZ6WUxx?=
 =?utf-8?B?Zjh6SE1laTE2V0J6aTQ1M0FNQ0huUFdwSU03Mk55VnF5T0FNdE9TWDVNeU5n?=
 =?utf-8?B?OG02KzVJa1BZZzlLMndFQlpnMmJjZlpnN3RYbmFwRTVDTTZQVGRUWEREQ2Rk?=
 =?utf-8?B?NHozaVBjcGppQ0ROeTBZYVJkbmgvcS9GL0x6dzBSNXEzaC9VejhoWjg4OGRq?=
 =?utf-8?B?aUdEWTNLYkJ4WFU1czM2eGN0dEcwazVSc2NPU1R1NGk2TVNDZVFuSzA0Sisw?=
 =?utf-8?B?ZHQyWXA3WHp0U0pyWHZMMVZIcHh1TmNNY2k4T1J0aWVnNWdDZm1td3dzcG5B?=
 =?utf-8?B?ZjY3K2ZtQXloRmtuRXNaWjl0aTFEd0t3YUFoU3huaHdlQUFOVnFmdllNL25E?=
 =?utf-8?B?RERMVGdYUklyYzhKcVpWcWFTTVNVQmF5cjFIK2F6eVp4Q3JzaW1OdzhZbFk0?=
 =?utf-8?B?QmlJT3g5WWhmOUo1L0QrcEZYd2Z4N2VQdFo1dVlYbmpBRm9JNzVxVkU5cnQ2?=
 =?utf-8?B?YjY4Tjd3dTgvVjd4NkxsU0laQk8zNXVEQmZvV0tVNUMxMmdUVEd3RnVIQkpV?=
 =?utf-8?B?eERSZGIxb2V5UXR6YTVFVDJjNW9CZW40ODlTMjNtUzdlcGtQQmowa0xsVThp?=
 =?utf-8?B?T2xxL2Y2NXZVc1BZWFF6bGt4Z240cHgzbXpINWF1Nmwxb1FTMFQ4VlVvZ0xL?=
 =?utf-8?Q?/yW43+F+SToTR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2lScnhuMFYrZk1LdjZOWC92d3EvVVJmaTVnSVp1akZiL3VNUFQ4SUZDU0Zl?=
 =?utf-8?B?cjFzb0MvamJmb1duTThYZWlVcStONlgyRnFYNXNoM1l5RkdkaFZ6YkNFYUVy?=
 =?utf-8?B?TzQxdnN1QVB6RkQyQldlYStRRC9yUU9qUnUra3Q2VlJDb0pmUUEvUy8vN2h2?=
 =?utf-8?B?NFBERlBqVDNyTjhMZ3VVaTZ2Qmt2L1FGYmIwNjZad3A0ZzBDRmRDYWdVYndh?=
 =?utf-8?B?Rm05ajJpdFY4Tm5uMTdwejlqNWJTQlZRbjRvMGROeXlKeTg5Yzd4RkEzaEVW?=
 =?utf-8?B?dEFoNjNWenJNTGd6dFRGQm1tTVYxSzZpdUVMWWhERkN2cGo0MS8yQy9iblo4?=
 =?utf-8?B?a25VUDJpMWJQdmkzcy9YK2dFVXhzNTFFRnFDUk1UWFpHRUhqOE85SWVQQU5j?=
 =?utf-8?B?M0U2RDZsVzRxTzlxWFFldmk5N0hrWjJCSzRqZGlVN1kyZXFxUVFaUXpIeHBV?=
 =?utf-8?B?cUpsb2xiTjhoRWI2dGptRTQ2YVhnMDZ5ZTl0aVYwV08vdU1vM1JRWkVzR1Ri?=
 =?utf-8?B?WkVrTUE4Z01lN3M3NTEzVkpkY1h0OCtXMDJDMnA4SFVSTFVQcnBjbk43enZS?=
 =?utf-8?B?L3dlajdobjJCZmpUS21MT3ZRaEVYMTZNOGpoTjJ0R0ZzZWEvNzQwS2EzbU1k?=
 =?utf-8?B?b0dnZkpVdG9VdlQzUG5hVHpYQ0hlVi8yeEhkbzd6bUVwY3pGNE1uZUU2Vlp0?=
 =?utf-8?B?S3hPR01DVlNaN0dtWXhWd1JGZU5QanVqL3A0NGI5dkw4VVNtR21qVTFsRUxi?=
 =?utf-8?B?VzhUVVNzSmhORnlpSCtxSTJNUnFPQTRZZTlMcG85bU1NcU9RRU9wcDFHYUE4?=
 =?utf-8?B?K3pmMFNVYzV3WVowNnRncmF0VVN2aXdBM01kQ2V1VWM1UnlMc2FOYTN1WFBr?=
 =?utf-8?B?amNSTzdVSThEaGZ4VCtTczBjV2dtR1ROb3pRRUZhcy94RGNwNjdnMjhGWU5G?=
 =?utf-8?B?Q2dmYmJNSlAxWndDNTFzVXpBRm4zZ21YcDR4YmhvT2hXOVFRQ3k1bTJwOWRV?=
 =?utf-8?B?Y2diRWYxVlVzVFJ3WVB2MG9pRHI1aDNBU3RSWnNPaFdhdWZRVHdGSEE4YUI3?=
 =?utf-8?B?UVBUSWVud1VrandhdkUrL21hc1prZUdGNUFYNmJQRCszenl4Y1FucEtxRjR3?=
 =?utf-8?B?Rnd5SHc3bUlWRzZQc1ZnbjEvK3hYMGE1ZFBrdXhpMWgvczJtbnU1L1ZVeWRy?=
 =?utf-8?B?SHJkWFZjOVUzcU5mSXFLRVpPdkxERWZQR2l3aEhYdEpoMnRDZEFYV0JUb2ps?=
 =?utf-8?B?a2pCQTljMUN2cmRZbUtRTHRiS1RKeHgzYnJIb3Y3alJSTGw1bWhtWXpvRDRx?=
 =?utf-8?B?ZXlOV1VvUmVsam5qNUVUN0ZuYzZoaTcxNVZaVnNxSzFyLzBZRys2Ujk3UW1n?=
 =?utf-8?B?bVZqN1p4ejVSeVVJZGJOMFA5U3JSakJDZGZBdWp2VXF5VWhReGhmTDNsWWZU?=
 =?utf-8?B?d0NYa252VDhvdzBBT3FZTDZYUjVSSGlDaG1WTUZTWEhuemJFQmZaT09xZC9i?=
 =?utf-8?B?WFE5YjJNQmJhWEE4OWVsbDJKcFpYMUI0Q1ZSdzJiZ1hOLzh1KzQ5Q0EvS01S?=
 =?utf-8?B?anpGdHRBZEFkVDJkWXcyZjNvRGR4UkV5TjlJYXJHSnk3SmlFNnVObFVJQklv?=
 =?utf-8?B?d0VxWTJzY2tuaC80SlorZm1KM0YwRlorem16R3M3RStjTm9NUjZPbDVwRlV3?=
 =?utf-8?B?TUprZWljcHhMaWFIcEVBc2ZEc1NmWXJYMmpXNC8ya0pjOVRVeDAvTURFckhj?=
 =?utf-8?B?V2E2MHhySzlmck1lSW9VcndDSm92V2RWRlNsOTcxZTJqRDRvRTRYT1pab2hy?=
 =?utf-8?B?NklxTFU0WkN4MzlZUzVnREh1TFE2dEtDOWxibmw3MWEvRWdnYkhLaXRvMFg2?=
 =?utf-8?B?YU1GTVVHejdQbjh5L0wxUEt4Z3JBdzJ6M2w3UmlwT3FhMUQ2eXRESUFWSWFE?=
 =?utf-8?B?ajJIVjdhTVJmc0dIWEZKZUowOEUzTFlKRTVUQkZMTkg1WTVuQU94OFAydkQv?=
 =?utf-8?B?SFB3MmtLSndvVytiUG1qb1YwRGRkMkdUQXZjUlJCSFFCbjFGWGNRNmR3SGZE?=
 =?utf-8?B?UVJ5UTJoaVZOR1hiS2pjNmI1VGEzMGY5TXRjMUVvM09jZit5M3lPMlNuc3ZR?=
 =?utf-8?B?WDNrY0ovUm02K3dVQXlwdVJqY3BYWVBrTzhKSStSZFVSb0RiNEdXbE16blBh?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4607d849-300d-4949-7ef7-08dd7707ae45
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 01:41:43.0506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RDf77THlyr6nWKUnu5UpyDq2s3PKffQFtZurEi/EJtDueSFCeGb9CKOoDqXqrqfuknDK1zuvzpb8R1SBYnr+Tti1pG8ASkqkqYleM77vwu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8664
X-OriginatorOrg: intel.com

Hi Babu,

On 4/8/25 5:41 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/8/2025 4:44 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/7/25 1:12 PM, Moger, Babu wrote:
>>> On 3/21/25 17:50, Reinette Chatre wrote:
>>>> On 1/30/25 1:20 PM, Babu Moger wrote:
>>
>>
>>>>>
>>>>
>>>> AMD also supports what is exposed to user space as "shareable_bits". According
>>>> to APM:
>>>>     Depending on the implementation, some portions of the L3 Cache may be
>>>>     shared by other system functions or used for some other purpose not
>>>>     under the control of the PQOS feature set. The L3 Cache Allocation
>>>>     Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>>>>     bitmask that represents portions of the L3 that may be shared by those
>>>>     functions.
>>>
>>> Here is the complete text.
>>>
>>> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
>>> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
>>> the cache which may be shared with other system entities or used for some
>>> other purpose not under the control of the QOS feature set. When software
>>> sets a bit in one of the L3_MASK_n registers at the same bit positions a
>>> bit in the L3ShareAllocMask, processors executing with the corresponding
>>> COS will competitively share that portion of the cache with the other
>>> function. If this mask is all 0’s, then there is no other entity in the
>>> system competing with the processors for use of the L3 cache.
>>>
>>> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
>>>
>>>> Could you please include what (if any) the relationship is between the CBM
>>>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of
>>>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
>>>
>>> No. There is no relationship in here.
>>>
>>>>
>>>> On the resctrl interface side the documentation currently states:
>>>>
>>>>     "shareable_bits":
>>>>         Bitmask of shareable resource with other executing
>>>>         entities (e.g. I/O). User can use this when
>>>>         setting up exclusive cache partitions. Note that
>>>>         some platforms support devices that have their
>>>>         own settings for cache use which can over-ride
>>>>         these bits.
>>>>
>>>> Even though this was originally used to expose the content of
>>>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>>>> seem to also apply to the "io_alloc" CBM also.
>>>
>>> It says "shared by other system functions or used for some other purpose
>>> not under the control of the PQOS feature set".
>>
>> This is a quote from the AMD spec, not the resctrl user interface documentation.
>>
>> Please consider this from resctrl user interface perspective.
>>
>>>
>>> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".
>>
>> When I read the resctrl user interface documentation for "shareable_bits" it
>> sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
>> shareable resource with other executing entities (e.g. I/O)" ... is this
>> not exactly io_alloc?
> 
> I agree the text is pretty generic. Actually, the whole bit mask (0xfffF) is shareable with io_alloc.

I think the value of "shareable_bits" presented to user space could be the
actual io_alloc_cbm value. Thus, not the "possible IO bitmask" but the actual
value. This seems to be the best match of what "shareable_bits" represents, which
is the region currently used by IO devices. This partners well with the "bit_usage"
output, for example, "X" can be used to show which portions of cache are currently
used by both software (via schemata of resource groups) and hardware (via io_alloc_cbm).

> 
> The 'shareable_bits' is coming from CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] which is always 0 on AMD systems.
> It will be bit odd to manipulate these value. Not sure if we have to do it.

It is not clear to me what you mean with "manipulate". "shareable_bits" does currently
come from the existing register but AMD now provides more interfaces with which this data
can be obtained and it seems appropriate to use it.

Reinette
