Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F25215F42;
	Wed,  5 Feb 2025 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738795759; cv=fail; b=tHGOMpbpc2Eme1adP3xu92DUUvkldht+oMVQWOhFdbSzL3fFApFW1b5QDDwHZ+7Z0otttUokEWE8/sqTZ5JHB4ESxe9x8IMEtUV+N1m6e+A3/T0uJcJSsKJXd78gOar5TsI1rdfgklSJavRHdsmeQpfxjoKlbwtkHkyIuJKeByk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738795759; c=relaxed/simple;
	bh=yyTyROIIvKDW2J5C3WZbc0MvPLsTe2Ad62XNhNT5MAg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gQdj6fju28pSvnZyEbQH4vZuKe9gnMVPmURdTG8VW+qINPVp3eVX9M3BvQjzUp7E1F54GlhpVLE+0Ohz/iqG28GqZ/TgqmDAT/nS5rfdwW1L2Ts/UbQc1OnluHAgZ/tS0tGnZX3tDBYZhrb6tv4q7wCzlxZ00+G0BfrqVL1KNR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OE+CuyyG; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OE+CuyyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738795757; x=1770331757;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yyTyROIIvKDW2J5C3WZbc0MvPLsTe2Ad62XNhNT5MAg=;
  b=OE+CuyyGUUPUKsnPbCWPc26hZ4uwhpQpemhE/gp7tiBz9Uqblp8DcicG
   m2Qbx35V8u4Y6xJjgN1k3zgUX/IEhpIOGQcSqZKOx2L1eAQTEezLvrNNw
   MqDavz9oYd1jSFRoyJJsENnMGZ7rYRhQ0i/ICQksENoXJY/PpNfE5EvBM
   SHIBwx1ncrQrrqiHGjyXeFGAWDokXve/EekOIvLXSGnHDwjKQqKC6pBYO
   SSMwaxK5BlAf1cLQzIJMAmCJlHKcHI82Y03XyLd7w0FtUgA7Lakta2vZR
   RUpEJyafLxUhk3DzsClOVFLX2l/PGsgwC4T5opUGtFgyZSTtLCBRPk831
   g==;
X-CSE-ConnectionGUID: 3QcAbmJvQbOpCSJcw6HIfg==
X-CSE-MsgGUID: 4s6x1VWFTx2myFqpi7dEjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50805233"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50805233"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 14:49:14 -0800
X-CSE-ConnectionGUID: ZQjivstKS2GgOZG6kc37Pw==
X-CSE-MsgGUID: M0DMjHxwTnOtJ1n+ojntuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110933761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 14:49:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 14:49:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 14:49:12 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 14:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVX8oDDQng9ipsoizTzVxnbFA2Xx0/E1FgOabZlllLSO92YozFakvTxlPYhx19bi1Od686F02elWfdpGT4e14u0V07OWKmxLShwr+uV9wgfK6AoALBDLdx3ellK4gCP2r4krZOJ4JocNg4bYLSwIJ9aCfDu+3BhprVZamtz96HI2g2SyxmVtLavB+NCcpHgHsUxb1hecTSF0krIOIy8Rm3hjfF91iAREEyzqZYmQ1QcS2kQ60e4byZOJ2r8NizVtcz3DcTQw7Sl7jlFkW4THosLZIhAmJehV3jpr3qUoaucBO0jYfoRNlcvNBein6oEv0Enmlw2BhE1FvVNGlLFEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8V1DK4G82550SL/LI7rTArEFFNZ3nbs1Fhzom5C8elM=;
 b=TjNh1Ykm/ur3EIqR8m8506AV+h6s6CGZI8jpZHh6te0z+/ZAdLg95iA8O4MGWvSZitrz8uQQ9TLqi2+ykCjNvzg5JddeczuyEfAQLzLeZEDCK47x3aEJj15nK46nIIXQYmExff+6WgSREyINzshLLFKZFRtIQxiEribBuVWgJr3L1XqFNs6TSsLLRqqT45t/BQ3BI7s9TIIW1KK15A1rvXVie2jOLhm40ej6G3J4/2+pZMxGHCd+v3Czn7Sp8wtsx+1mGJhwIABbYKhlikMx/AC/4O9deqXzEVQYIe/WdwFyOTfud61hxVwnnzFgqOLYjo1L/0/UK8ZHlGFLK0XOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 22:49:08 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 22:49:08 +0000
Message-ID: <8a6fe2e3-8853-4371-b73e-6ff689ccb695@intel.com>
Date: Wed, 5 Feb 2025 14:49:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 06/23] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
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
 <920cafec1920358ad0c8af2e78a8f8bbd8c0b77d.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <920cafec1920358ad0c8af2e78a8f8bbd8c0b77d.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0241.namprd04.prod.outlook.com
 (2603:10b6:303:88::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 34492aca-92fa-4c8f-3adc-08dd46374d11
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVVBYUlCUC9oRlArQndNeWFRbW9GTEx1c20vTzhBbGUxeVVyQUl6TDZLYVlQ?=
 =?utf-8?B?Q3VaYjhJZzRqYUFTajdDNmlLeExweUlaQ1VNdWJYYyt3eTVpa3lPNndndG56?=
 =?utf-8?B?Tnp0V1RrRjB3SFIzYzBRM3FIM1VUN2JjZm1YUnVGWDkyUlZER2dHRUIvWlkr?=
 =?utf-8?B?eWxQUFJ4bHIraE1adWRYV2E5TXRGUExaNVdLOThWblJTbWtLaU9kR2ZWU0Fa?=
 =?utf-8?B?TnJGQk9wUkkxV0cySUhxejZsMGpJM25LbWNyLzdQaXNuVEdwVjdYckx1bldD?=
 =?utf-8?B?cmVITkhtcGhJOVJQanRNVXRDR2x6a0dNNHhvRjBHTmR4ejBUNGlIQ3hVb2FI?=
 =?utf-8?B?STN2NTNGMGswd3kxUDdNOVlmOUVVZ1hHWGV5SHBOTlFyQXVYZW5iQUU4RE9V?=
 =?utf-8?B?bDgvWVE5NG9oQVk2ZHhPYWJvcmllenNPY0R3eitzT1JYUDNOQytvSUh2UThI?=
 =?utf-8?B?ZjJnMGJTUzJLcWFUdVFRLzZFWmVqcHpmQXI2dGdhNk81MFE0M2pITENudHhq?=
 =?utf-8?B?bzM2U3RLa2h5cDEraGtoZzlPbnNGRzlhMnhUY2RFR291WnJCZkhYODk1cklq?=
 =?utf-8?B?NkJVcXg1S3R6aEJXNEQvay9naEJySDMwN0NOYk9scmFvRksrY29QNzhHK1FD?=
 =?utf-8?B?UGV4ZE9yVTBOdExGaEFYc1NXK3dVYUJ4R1hDNER3UzlXQzVCU1MweG5hbnJk?=
 =?utf-8?B?cmswZ2cybSszdHZCQUplbkYwNW1xTEFGOU1tMW9iZjE2ck4vTlRydnBhNmRK?=
 =?utf-8?B?YmU0WWFwK3NWdnJyVGRxYTd2T05tM2o5c1B4S1NjNm9QNDBkZmVkVHVNYW5F?=
 =?utf-8?B?UUM2MmFrQ0JvV3FOT29EZkh3RFBqREpweWV6dm5TZlN2ZnZGU3d0NUdQaGNW?=
 =?utf-8?B?aWFzZlN4VDNSSFBJWVdEejBOdkxQaDZNUmhoSUFwL3hpSElZcnM1WjBaR3gy?=
 =?utf-8?B?M0Z6bCtJdjNmQWhYeDdHeHUvR09mQk1RVWFmOVlqamlJdStQL3JMTWsrTkh1?=
 =?utf-8?B?dEZPZCtqaFpSTk5SclAzS3M4TkZlVXdLQlR1R29peE9FRUhEeTM4cFZTR200?=
 =?utf-8?B?WnVxcjNiZ200NTkwdFJudEpQamJjK3U4Mkx0SExTQnhUZklRanVkOGRlNkpR?=
 =?utf-8?B?Skk1L29ZL3ZCRVZtR2I0RUZpbSs0eGFnWCtDcTM1RXlBelVoNTRUVGNNNFpo?=
 =?utf-8?B?K21XbHZuV0ZBQ3RYaFJXK1FDNUl5dUdVZDg1Mk96YzJuMEUraXQ5Q2lidW5T?=
 =?utf-8?B?cFZucFVPRUs2NnZVUUJWT200YkJkVUczV09Oc0RKMXE0N3I1ckc4TmtTMzZ5?=
 =?utf-8?B?WlRCU3VLajRWeTZLUlBLeGtKTHp4SFoydERTOHRoRXZXNUZUVjB2TEIxUFZq?=
 =?utf-8?B?aHFVSnN0aDNPMGpROTcwNmFvOUdzYTZHa2c4ZG5GOFlrOWI5aHpJMHFjNGs3?=
 =?utf-8?B?L0lTSlFqaENUVjVTUHVMR05VYWFNNU12a3crTGNhZnZyZm9POE9zL0R3NUdj?=
 =?utf-8?B?VGk3UlZybnNHOVA0OUxFTHVEK2ErSkhhQVlBZ2RCNzQwYUlLRkhwd2tieUpZ?=
 =?utf-8?B?aHQyTFh2MExpUzZEUzFzY1RMK0N1RTY4Si9TUG1mRGVnSzhLNmdMWkR6QWN4?=
 =?utf-8?B?ZDNtZE1wMnRwa2phbEZaeUk4V3loT3hDeEI0eUdvbUdndGJmUGxzVlhCUUtj?=
 =?utf-8?B?bHpINlNaaE5JalJIOHNOWVNpRXJRQ1dUTXhib2V4aC9hUnZpRVBaQVQrWWhT?=
 =?utf-8?B?bmNySGUweHRKc0ljd0YrVUVQTnI0WTdTaTdXckp6K3BGOFpoSzR5aTRtbzlT?=
 =?utf-8?B?Mmp0ZDZMbTd5SXZGRUt6UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWgwSU9ka2RZc1BVRGcxbnZkeWZCRFlFN3ZuaFByZkt0alh2VXQ3aExWeC9V?=
 =?utf-8?B?Q05pQzRUVUtVVTZRM0F1NHVFTmd2ZWVjK0VtUi9EbnBGaW03emlVMU9zdHBF?=
 =?utf-8?B?VEI3NEc4aHR0cEE5Z3BETzNhSmZaajZSWGJ0aDcwVzhKa2gxQ3k3NWJRUXd2?=
 =?utf-8?B?aEkwZmtMSm1uMXN6UXlKTENqaUw3aWJqbGZJL0NlQTI5ZitCUUkvQnpnbjdt?=
 =?utf-8?B?K2ZhRG5DM25xVjhuL0lhdHBBVUtwb0xVS0RuN1N3T3JSZW9JR2o4UERoaWdF?=
 =?utf-8?B?dDRtL3NxTUVpVkVYNDJ1YnphT1c4SXFvcDhyNDJGOEZkOEVycnhyZFJSbkFM?=
 =?utf-8?B?bWY3enJUNStBSFlDcEMvczhDMDIwdVhzeDFFWDZkbG9CenArREc4dzZzcmpV?=
 =?utf-8?B?VzdQWlJuclhuTzJwNzNzcDgwK0F3MURNL05tS1A4OGFGMk10dXVWeDhOb3Uz?=
 =?utf-8?B?OURVMkJVZVRkRkFBVlNJSUtMNlE5aENaem1kL1ZOcGc0cTRhY2F1bVpGcDdT?=
 =?utf-8?B?MWhlZGlUTFJqTGxOQkpMaDhtZGZ4b01xSmJXZ3hUenYvVGNaRFdERHJ1NXRz?=
 =?utf-8?B?V0kyditQOVpYcXg2ZmowS015ZmFDcGRlcWJMUHJIV0MrTzlNUC9WZGZ6aUhG?=
 =?utf-8?B?Skw3UTYrL091QUJTWm1MTnA1ZnBXY3lOYURmcmx6QjltRHNnNVZIVGQwQ1N0?=
 =?utf-8?B?Mm1ZTUpHNGRpSzIwRHNqdlFrdUNkTzgzK0g0TERXVTFzZ0kwMUJjbjV0ZDdv?=
 =?utf-8?B?WGh2c1prL05seFZjcm1MdW9iQkZVbnJZK3FuaGZiTFY2dXlLcnZqeWNYck90?=
 =?utf-8?B?N0VwdFFDYnRwOHZobTd5U0o5VHpSd1ZWM0xHNDJuVGxLS0FQWTVBZ3phREpZ?=
 =?utf-8?B?WjhqNFFFdlZoT09aZVB2a1Q1WHFKU0FBVkRYUjJ0QWNZUG5JbW0zUlA3blF3?=
 =?utf-8?B?eUtVUStsNStRaGtIQk5QY1pSdk1lN0lwRUZIcUN6R2xrY1ByT0ZoSE5HMGhn?=
 =?utf-8?B?MG8reFRISi9yWTJwZzNQTGFHVWdYTDE2cUp3ZXhXME15TGFTWjBTKzZFVTJj?=
 =?utf-8?B?QmhBa3VRSnJHQkRDN1hoNmt6MWQxTXByUmUwSXFtV2pFbUNUV3JqZ3ZEUDRt?=
 =?utf-8?B?Z2Z5L1V1Mkxvby9nRWVUeUlIU1hjNEJIZHpZOHhDMU8yVStQYXQ5RHIwdjJP?=
 =?utf-8?B?TFQwcEhmaDN1cWNUd2loMGdlWGw1QnNxT0ZQYWJiZVMxT09NZTNrKzBWRVJS?=
 =?utf-8?B?ZjBhMWtBcEpnVnFTcHNvQXgwTFZKeUxtc1huQkpyZlNIUHdyVHBTWnJCQ2pL?=
 =?utf-8?B?UEpWTDZJT0N0eGFmRWdtRUxaUlFlVzA4QVJMdW5SNGZGeXkyYmN4SENod0J1?=
 =?utf-8?B?c1drRnFjY2g1MExWaEY2ZEFYNERvaHdXRk42MnFmNjExcE8xcG1YRkxBRE5k?=
 =?utf-8?B?RkZ5cU04bFZUSjYxUFFlNk9uUnRLV1pTSmZDb1Ezdk9BYnlza2xxMVhmWEly?=
 =?utf-8?B?aWJpQVIxekhqTFowLzF3RzJJaXlTRnJ2Rm1LWnNrUHRkUHZGZ0tSQTFyeEt2?=
 =?utf-8?B?WXZXcVJxZWRKUVRRN2Jhb3c3ZS8wUkpCR1hBdmFOMk1IZVV4TmtGdStwNk44?=
 =?utf-8?B?emF6akJvTnJTS0hONU5jYzFzRmdTYWVJNWVFdUU4ZHhvdnJLVWJaVVF4ZHV3?=
 =?utf-8?B?V3pIU0lKdlg1akFBQXcxblhmK0pFcmFZU1A1azJCdFhYYUlkZFlSTERBMDhN?=
 =?utf-8?B?SXVaVG1aVWMxN3dPUUtpSFlMRm5jUW9VM1BTeTFJNHprVlZpQTl3R3kvWWY3?=
 =?utf-8?B?cUhENEwwSytFQU93YzdDcUYrdmtuaHdYKzh0Y0t0RDdpQk9rZ3FsVlVxMk9Z?=
 =?utf-8?B?blBZSklYQzlpc0FmOFc5VmNlM0pzdmU3dnZWaWF5OGJhQ0EwZ1hjdjB6WTVI?=
 =?utf-8?B?NXlOL2psdTYwb2pudTJDN012UllSTEk1ZkZTekV2S0pYYVRQRDZhVm0wd0Nv?=
 =?utf-8?B?K004UGlRNUNVcXJSVlNYbk8xTjY0RGN4aVoxc0tVUHpNOHdCaC9pUkY2S3h2?=
 =?utf-8?B?ckdMMERZOTFDeW4wbHNYUjdGVkN0WnZWNVl3RkxsOG9XTlgvMUQrZVdUZjB3?=
 =?utf-8?B?OFQ4S0QwWklJNWxjMkZiZWhnWVVQd1psYU5EdURpWnZieEdoeG5abmFCY081?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34492aca-92fa-4c8f-3adc-08dd46374d11
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 22:49:08.7815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6IMAgxb3kDRUmZtMBr31Bk5/1YYXVxg3rL/4As/jg7msYazOye+lCpEqlrQyWNG9NbwpxKGtffvkrVRllMc2PZGcM1aTVueTVBV+qIQLUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> Add the functionality to enable/disable AMD ABMC feature.
> 
> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
> to be updated on all the logical processors in the QOS Domain.
> 
> Hardware counters will reset when ABMC state is changed.

I find that the state management in this series is organized better
and easier to understand. I do think that it can be simplified more
and a hint to this is that it is mentioned here but not done in the
code introduced here but instead required from the caller. It seems
simpler to me that the architectural state can just be reset at the
same time as enable/disable of ABMC? 

> 
> The ABMC feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index c3d7d4c3009a..a7526306f5e4 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1261,3 +1261,39 @@ void __init intel_rdt_mbm_apply_quirk(void)
>  	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
>  	mbm_cf = mbm_cf_table[cf_index].cf;
>  }
> +
> +static void resctrl_abmc_set_one_amd(void *arg)
> +{
> +	bool *enable = arg;
> +
> +	if (*enable)
> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +	else
> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +}
> +
> +/*
> + * Update L3_QOS_EXT_CFG MSR on all the CPUs associated with the monitor
> + * domain.

All monitor domains are impacted and above does not clearly state "why".
How about
 * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
 * associated with all monitor domains.


> + */
> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_mon_domain *d;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list)
> +		on_each_cpu_mask(&d->hdr.cpu_mask,
> +				 resctrl_abmc_set_one_amd, &enable, 1);
> +}
> +
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +
> +	if (r->mon.mbm_cntr_assignable &&
> +	    hw_res->mbm_cntr_assign_enabled != enable) {
> +		_resctrl_abmc_enable(r, enable);
> +		hw_res->mbm_cntr_assign_enabled = enable;

Added benefit of resetting architectural state within this if statement
(perhaps simpler to be done within _resctrl_abmc_enable()) is that it will
not be done unnecessarily if ABMC is already in requested state.

> +	}
> +
> +	return 0;
> +}

Reinette
