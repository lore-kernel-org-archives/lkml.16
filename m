Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF92566D1;
	Mon, 10 Feb 2025 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211956; cv=fail; b=QNODj+Ywt3yXmnw7yeFpO1I+Sprd7LCSoz0ZBV3OBpYWpqcP+8SF4plboSjeO+pOQ6gL8UDg6/DImAKoD30lWxuyG29eM8ikxuq3F9d/zbR5yvhwToEBC3GO+FSweGL1Oea92jaGpcAU65T23pfCG/e2gJxcwgJu1TmYWBmoq6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211956; c=relaxed/simple;
	bh=zxtcwITcgBZWbF/Xf492YwiMq/cO4pXrSoUQKDmwsQw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SOUyTzzDgnS25spZDrNm0ff2c6HdB1F/ILwha0lmJ0yzjyePK5zePeItlDgJ6noKtTPp2CkwXHEGtpzor+24cyvay7Kf6ZJcD8xw5+EsjZGz6BIiM7MqTtSjiKhEfMWerug9IneOcwaqWYJXA9c9NjWmWhD9DNuoB3zKBmzcdIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXATAj0R; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXATAj0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739211954; x=1770747954;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zxtcwITcgBZWbF/Xf492YwiMq/cO4pXrSoUQKDmwsQw=;
  b=UXATAj0R8s+/coWgAlAN7TvzAQrWmZFP7PfThxY4D+sspD1/p2KVaXQT
   R0oDa+x08+66P19wbIOzr83B9eyZ17BQrXDAGGLRDbxJCdSGVt3ClKtHy
   MLU3NL37PNsExGMo5SegbpQuZ04nXIZjeh9bafx3em9ELUWIbeCutfuZq
   Y7CLrUws5zNjHsUFCvPnhfiEo+E44bmay8xy+wWzeMEzNpeNhfLHG7c5T
   q48ZFKSZWgE7ZH/bquOzzSo9fq1E1Q3It2XSy0QCWFwlM/h7K6cjPY3iB
   SMoAs3B+HUIi9iecOPF+xm878AH2zaHKGhpiBo2V8JRams78ZsaHB1W39
   w==;
X-CSE-ConnectionGUID: tUoyGMGYTLqrZAN3a7EVHA==
X-CSE-MsgGUID: iKXCPZOHRhCMZONAq0c8Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39955355"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39955355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:25:52 -0800
X-CSE-ConnectionGUID: 0DE22eBPS6y96RPLdeKdxA==
X-CSE-MsgGUID: c74EIrS7SSyZmUGpHhrt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112014035"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 10:25:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:25:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:25:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:25:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5mEB1LyI5I0Oz0rYW3yj2oxfDO3caCzw4pp/JWzGZAW6g//GWteQDxLuD/pty8tZTYTrxzSymGocuZNqCQ2r8l15AmIqFCoVQ+5fQZIUCxTGgiO45ufH0qQV5ICUhurcatjf0T4EJW4duJMhjOK56NWJ15uKMQtBYSnZYJVsBWneRtgf3dGR3yHtoz7UjcBXPXUr8aKh60P5a7ZWSav7aoKieQyP9E+RTcNsO6cKd9Ga+VctDwNa9S/reBxHjYOwxcor7XqZMTYluiilXnozNiA17A6WSTk8NSy1YfUCRW0Wo/mw0KQLZmMdzBiLENPr68iRVIZaOt7oxQ7Sss7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxTXUt+prIZi/VVEuheflmsjXx/f3QyYj7EKFTGo8P8=;
 b=lnFFd30bTZsp8dni7OMXeeTfCM94GstDhiH+7iTv9SqzR1gL92qPdMAAGDActfePy6OLX/e7jJlEnZEQWLS1an+e4Tz6Lzh7gEUKO9lSU/JReA6hxqIuBn1hd2GEaIVN8WPiDQ+dly2TiW6ZRw7M9e7k9G/OjozGdKDoWG3Dtxm+bg7lmE5lFHYEUNLWHSMaquYl1C6Mw0Mw8O1BdJAdvkoarX3SaHmWi3qsYWGflPleLhcR1A3TYNUhiNHK/l2DidDqR3QWc/yuf/Q9T3EtOoy9QZ/LvPi7N/EPRfPgMJhOpKmMDWR0bhySfMZUyRn6mHgNHQRzZ4+VSLwtey6jAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 18:25:38 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:25:38 +0000
Message-ID: <b1d95024-55e2-4afc-93fe-1b119fc93a79@intel.com>
Date: Mon, 10 Feb 2025 10:25:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/23] x86/resctrl: Add the functionality to assigm
 MBM events
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <c6f275566395ffb528f1bd254335c13274567c7f.1737577229.git.babu.moger@amd.com>
 <b49fbe20-ec79-41e6-ba58-3e5c8fab3a46@intel.com>
 <802aac6d-b261-45b3-9a36-3532a1d8f519@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <802aac6d-b261-45b3-9a36-3532a1d8f519@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ad7f1f-0ce4-4d6a-c407-08dd4a00518e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R29hQ3l1aDhlWXl1R1ZtSWtJMWI3bUQ2QU4xQkRrdVF6VDZyM3FqeDdlS0Zt?=
 =?utf-8?B?VHo1dTR6bGpwU3ZsZHFvU2R0K2dHRFpuVEYxdlRKZG5TRzR2N3kyNlBaQjRy?=
 =?utf-8?B?YlpobHlaSy96RVN3WktSUE5vbEJ1bXRwZzFJWnZHamdtbW1oTTlIbm1jOE96?=
 =?utf-8?B?NDZXazhFbmI0Ui9haGkvYlkxblcybzhlclowbUdsSnVuM0NScjFmYmtBMW1w?=
 =?utf-8?B?L0x5THNxdGp4ZzJveS9VQkI5SmlnSDRwaVdGR3ZKV01icjNYdlpEWTBDOTRr?=
 =?utf-8?B?cm9VbmdqL2RNdUpzRGZNWVNFN3NlRVFYalp3TFI1cHFnbjVuamxyaXREYzkr?=
 =?utf-8?B?Y3ZFL0p3WjhZanNiUDFkYnRWd01TRTdhemJyUlRkUWVRMnF4T2gyZFhXM0sv?=
 =?utf-8?B?V3ZiZnJWdnFwb3FjYnlaSEt1NldENnUvLzR5b1F2UkV2dnNyTFp3cVB4dkdv?=
 =?utf-8?B?aGJVaHJNa3cyb3k2bldFQXBIc3dtMmlTQ3RVTUx2Z24xckhEL0gyUUMyZEx1?=
 =?utf-8?B?UXRJUDJVcTJQNUdDbmNzUjBmc0JUVFAwdmRwaC9Rd2g1bGwzTm5RbG1scG5O?=
 =?utf-8?B?V2V1T0ZoVjEwcmE4anVEZkcwdjVKU2h4K0IrRWQraE9uSHdwRWNoeFk0bVR4?=
 =?utf-8?B?ZFlZdndGRmxZTkcxcXJ4RGdCVWE1T25HbWVReGhhcWVBN3Y0NlovL2JPRWt6?=
 =?utf-8?B?ZU5TbzlrcDB2MVExdURhVzFlenZOVU9KS1VXY0VJclBDaUZEZURGYktuZW4w?=
 =?utf-8?B?MEltN29WclBCQlBlOGoxSUlVR2xtRmRjMkpOVTdPd1JmWVZlSnFucGd4Y0FD?=
 =?utf-8?B?OXZTcTVRWkFuNFVpZlIySjdjV2Q0bXhISWloUEtuOWJobVAxQnpYZ0l2YjB5?=
 =?utf-8?B?MVExTGV0UGtZb25sU280SmNwMkhmTkMrK0hSWTlQMHNyVTA5WTZsd0l4YXFY?=
 =?utf-8?B?cDJiTHJFZ0VaU2ZYVWRIN05xbStCOXh1YkJ0T1g2QUp0d0EzV0tpaHpmVEVk?=
 =?utf-8?B?QWVldWphY20yMmhXUEcvOHpNdTFibTJzbWJPM1dsZUsvcURXWmhLRUZVeFl0?=
 =?utf-8?B?aVJ6TUU1N3hRUmw1a0Y4TG1HYmlOTGRTVjdKQURnVC9zUUc2QzBnbGZwczJQ?=
 =?utf-8?B?Y3F2V1VTQmdLYnBOb0NHaGZrbU1raWoyZzRTTHRHMmlmNEdmQTk0K0ErZnZj?=
 =?utf-8?B?QlB5ZEhiM2ZmaEl5cU0yVTg0cEF2Z3ZuRC83b29zbUx1VU8rT21BS0hReENK?=
 =?utf-8?B?MHVjWHI5MW1Uc0lXSXdvZkF6dVppVVNrQ3hKdnlBVkNKZmV6VTA1SDZBQUsw?=
 =?utf-8?B?azBiMlNwQTJhSjJyOEhCeXh4eXZaQkN1OFpQalljMTlnY2wvV0NnRzcybUJu?=
 =?utf-8?B?ZThLUmNXd3FRZVBjUTBCSW94RUQ4aE1OYWUzOGVkb0FULzMvcEEvQ241M3Ns?=
 =?utf-8?B?RVFnVmRlR0VYS05zQXhUTWlPck9DSGJLRkdFdnBLNldBNkJpVUM2SGwrNHpx?=
 =?utf-8?B?Zzc5YjlkNkJJUnF4YWRjY1lndHpMUGk2RUdXWUp3YXhvbUhxSUxnY296N3M3?=
 =?utf-8?B?WTFFV0p2WHFPaWpZdGJTUU5LZndndEtqelNKM1RDNmlBNWZSVTEyUFcySXpm?=
 =?utf-8?B?WVBsTlZNQjVtTC8vQTZuOFJ3c3VCZy9zQlAzQkYxanZ0V0pWbDdOWEdhWEx6?=
 =?utf-8?B?dlhIOHNJK0FseW43S3RtQ05jbmtVTW5Zd1F1aTR5NVN0THJkS1RtT1dvZlpV?=
 =?utf-8?B?OHJvcFZCMytKZUJSMGFwOVRRR3B5RHVlTUJ5cWR5NjhSbkU5L25rbDFNamMv?=
 =?utf-8?B?MCtTREpjQXlqeGVBWDk5MGt5RU01Lyt6emtPSTVjY1ZCMHZaUHliK2h5R1pT?=
 =?utf-8?B?S0cydkxDbS94ZDI1NEFTdXVuM0RMRDFoYmlvTU8rUmhiNkUzTTBZajNWM3VY?=
 =?utf-8?Q?tSzCgixvDzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJjN1BPS0U2RG16RW9yODUyazhNU21aV3BLL091UDVQUU82OC8rMXE2UWd1?=
 =?utf-8?B?OSsvRzNENjVKQ0tDK3d6b3RGaXZtdTBKRUdRNTJMOXlkMUZxaUlsbXNTMDFi?=
 =?utf-8?B?M01jbGZLQ0JTZzhubk1uL3VZQkxLVmtTK3RQQ29LbytoNlZNeWpiM05FbzV0?=
 =?utf-8?B?dFQwVFpTRW5KRUc5RDVXa3lHRUZPWE9aREo4eWdhbU1VbkE3eEpPd3VyS1Q4?=
 =?utf-8?B?VkxqUUwzZlRnclBKdGREZzlPMTQ3MkpOMTRZSjRxZDZhcWM1bEJNbmhPczB0?=
 =?utf-8?B?Q0NrTGZGZy8wY1JMYzcrUzQ0YXBEWUF4YTdHU1RPVHhZelBIdTN3R1Rpd1pJ?=
 =?utf-8?B?WlFTa21xWlpZL1o5TzBUMFA3YjI3eFhEZmJZMEw2S2tqTDVMYW1TWHIwQWQ3?=
 =?utf-8?B?S0YvZXJmMzZtaHpjL1VEbm91QTRVZ29kL0swZG9VbzVYMDh2enlMQmRJakx1?=
 =?utf-8?B?TjJyaUFsTzE2TnVLSlFtb3dFTU51MnUxK0ZsVjQxNjNKL1BIVUFPRi9maDlQ?=
 =?utf-8?B?VXJmWnVHVXlKcDdvWTVvenplUXpQcjExcHlwWTNyMHlaakdoNmtHcU91SEdv?=
 =?utf-8?B?alRQcWNtRmpYNUdQVWlqbVE0bEcxTmJyalZpUlpUUnplbW5pZ0tHNlFsVExk?=
 =?utf-8?B?aTRqbW40M3Q3UVVXaFQ1SDl0K05xVnVhV2NIWDZBVTRzTDVtVDZHajhEdmpv?=
 =?utf-8?B?UXExZ2oxUzN5eDFOSE5pZlRYM2pEYU5MWDZqSmFEZlBBeFlVaFh2UTI1MUZE?=
 =?utf-8?B?ZW02WGFWUTlrUWV5QjE0WDZMclZHWXRwNW1TSko0K0xQalJHQXNYcnZEa1I5?=
 =?utf-8?B?MWNicVR3VkNxVlV3U05RaUJvdytaeWFJY3R0VVZJNGVOcERRZVlPNmtGbXk1?=
 =?utf-8?B?V1dMeDJSZDFoSWhpeUlubkduQmlQcW5SS05YeVdzSUhnSXVGajNFT0dPQmpO?=
 =?utf-8?B?YTdFb0RtOUwyR0pIaGhZd3g1K25uWk9SWTlwZHZZTnpmNEV0SEVldjR5UnJz?=
 =?utf-8?B?NGFaclFEK3BNY1Nld1VYQ2dqNTJJb3dLVVo4cEFZT1VKUE9uNjExVHZIOWVp?=
 =?utf-8?B?S0hTQ1lrd3ZnUGd4bjlaaTRaaDBlQnZBSVZyUE1PeEkwcWIwd3NoUjVIVzNY?=
 =?utf-8?B?N29jQUtBT3cyRkNPb1l4ODl6TWNBdTA1M3d4SmxsS0FnQlVTWlVHbTRicFRH?=
 =?utf-8?B?V2hWQzdCM1V6a0xPMUN3VEdhQnVvbmJidi95ZmxCU05hUUEveGJBQTVVS1p0?=
 =?utf-8?B?cElLQU13VWNZcm1CM09HbVU0RlV4S0RpeWErZ21DOGZkWjc2cGZLVmF2TDZS?=
 =?utf-8?B?TTlOdGw4RmV5Nnh0bG1oaFBTNklMN2o3S3ExNjNjeDkxSm1rN3k2Z2R1ZXRW?=
 =?utf-8?B?ZlVTaFpRMFFXUEZBM1l4Vnhxd01IYkV1QWZKMjhtZERvTUJpcldoaUJ0MHZR?=
 =?utf-8?B?YW5pTzlxaGNpVFc2WWtKeWpDYWcwZU9qZVQvVndacEFaSlRvczRtZ0FZT0pF?=
 =?utf-8?B?eTQ1bStCNG5paVhxRlZ0T2ppbW1nUzA1SnVNVjBsVXVySytlaUNka1FaajNj?=
 =?utf-8?B?ZTA1MTlSY251TFBnTkxJeWlHM0NMTFlTaVRXcnRrbUpNNkJYcUZKcERsQ1dx?=
 =?utf-8?B?TFFLU2Jkblc0dHVSTmZYeDBWUDdYdnkxb3dWdzNJNzZwdHBmZmNoTS82Zmln?=
 =?utf-8?B?K3ExUERZY0dzUDBFNEFmaXF0ZTBlejdEZ292dnVjZE1qQTlPbDE0OWtWRHlm?=
 =?utf-8?B?TWdjUmcrVDdzSTlkeURPVVJ0YlhxdU8rUVpVUTlpMWhRUDk5a0M2KzY5aERj?=
 =?utf-8?B?L1VPTHdjK3oxQkJXTWZNc2JVb1ArTHRQTGxiZ1c2YWxId3BRd1ZCTU13eHJz?=
 =?utf-8?B?QkJBTEJLNWNDN2lvcTRNVStuOW5qaHlSVzNOUFpyMEJYbERtUGhBMVFuQllU?=
 =?utf-8?B?TzIvZmNySGVic1FOVXRaTTlkU3Nxdm1KUVBPcEpHWE1QWmNzOXlsTFRUNDBV?=
 =?utf-8?B?T05JYWpnTU94cUk4a3hwNlRaenNLZTBmVTkwcWU3S0M2am9EcVl6cTBPK3I0?=
 =?utf-8?B?cGE2Yk4rUEJpaW5RL1pVOVRvV1JHcUVFb25mV3dDdlViZy9YVllIV1RydHQy?=
 =?utf-8?B?dTZhOGpjRzlVaEc2VVpZbTF3QXRwejV0QmNNc1psK2dVMi8xbk02VGY0Q2Fn?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ad7f1f-0ce4-4d6a-c407-08dd4a00518e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:25:38.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZOut6sfiHnEocxecuTTP8eiQ6TfMzZABvLz8fa08yCPZ03G/Cinm6DdKyrehkvnXjMsCNU3DTSyhxdIiZKx/9b38yaYzhfLb+kDeZbfGkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
X-OriginatorOrg: intel.com

Hi Babu,

On 2/7/25 1:10 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 2/5/2025 7:05 PM, Reinette Chatre wrote:
>> On 1/22/25 12:20 PM, Babu Moger wrote:
>>> The mbm_cntr_assign mode offers several counters that can be assigned
>>
>> This "several counters" contradicts the "very small number of assignable
>> counters" used in earlier patch to justify how counters are managed.
> 
> How about?
> 
> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that can be assigned to an RMID, event pair and monitor the bandwidth as long as it is assigned.

Sure. The word "several" can just be dropped from original also. The concern is not
the language but instead that the description moves from "several" in one patch
and then "limited" in the next patch.


...

>>> +        }
>>> +
>>> +        ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>>> +                      cntr_id, true);
>>> +        if (ret) {
>>> +            rdt_last_cmd_printf("Assignment failed on domain %d\n", d->hdr.id);
>>
>> I assume this targets the scenario when user space requests "all" domains to be changed
>> and the error message in resctrl_process_flags() will then print "*" instead of the
>> actual domain ID. If this is the goal to give more detail to error then the event
>> can be displayed also?
> 
> Sure. Will change it to.
> 
> rdt_last_cmd_printf("Assignment of event %d failed on domain %d\n", d->hdr.id, evtid);

ok, printing the event ID should be OK since the ID will be part of resctrl fs and
not architecture specific. Please just swap last two parameters.

Reinette
