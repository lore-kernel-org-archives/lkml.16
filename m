Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D41DFE22;
	Thu, 29 May 2025 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748552325; cv=fail; b=X/tvjEFNHDNH56KSJAeguSvAY0gW0w1QxJ3aUXHtOUpsbNqzTDXfztacMc+cUyY58S+f9ntAP6ZjvuVWgmMtTkaTxVY8EBPlv/KkZV790AiwlI+tuBUKA9e6+FiOg9vEJ9YTY0ei8Ig/77D1RuyDY/9dnSk/YVavuge5dA9QUlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748552325; c=relaxed/simple;
	bh=qUAE1NT8xrrwqpfCeNN8RegG3K7P2l1nu75RUXWlq8I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U6Wc/eOaxVyPJ8rwrUl7PlUNSq8b0Ihb9n04chz3tvzPQ+O6N2PwzYSW9stCgWHWQ9e0PWG51ZvK6J7stMadhkHA5uHgkHA2OS0JIQOHkBaGNEvCN6fzPnMj5dzV8VN9ksStflIg5HT3PQyo1fMGIKV/WEie2QrXIAVrHcZOqlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFb417DL; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFb417DL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748552324; x=1780088324;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qUAE1NT8xrrwqpfCeNN8RegG3K7P2l1nu75RUXWlq8I=;
  b=ZFb417DL0mxnGAFl/tcNmcIPSuU6ULlOGJS6S+4KSo8M6YMYHpBT6E8A
   wyzs1J4Qzax3o+33p/jF4K0ZyyundLzOmyqXk0qErjhVaoXsEqSHMAfjz
   DGD+AkQ2bFgERN7WzKK2ImiZAOS8v85jn73mleDe6f27lFm71IYw/cnzK
   mpx+oinpT0LozJAoJlDbCwGDlhoWcI8NsTR+Tqdc6xeE/DmSs8XTiuAfg
   Yt5sOjaEpwCP2dfdphIjeXL1O0I3RZubssReNH5/xtauSSC35WUrOWKqP
   NUSCWmu6+v6V8kTlXv0XkZyDMvaRkAcWhRl8+7ldxgUAMIS9wWz6V75Km
   A==;
X-CSE-ConnectionGUID: KNyfBOnOSFSYc+Hg7ZZ/KA==
X-CSE-MsgGUID: dsvHDbJ1S/OiNtz4pTyKrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54434859"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="54434859"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 13:58:42 -0700
X-CSE-ConnectionGUID: gM8mS9M4RT+TU2wTWS/EbQ==
X-CSE-MsgGUID: p8gWniKNRxilkmg/tymLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148464866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 13:58:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 13:58:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 13:58:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.83)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 13:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNoblcv+g9ACMncZHp8j8iFRGQCCDboX2XZ0pinwUICdSwnX8Gj+ZatVTVa33XwtwtUr1hytDDQ9vnz0SmM4jI9EtFRpCFdqlUQmwz5iDslDMOVmstJfj+BT5ynJ0cap0tfb0lYxj7XLlNRVdY0g9Zpu5U4RDYLae06CZ/xUa67FUNScyillfXEAcNO+end2kR8eBtFpWrBWgqAqIiUYs/8SnnFJ5VZQ4JneefmU5IZW4LfP/hEYndO9ytOXbTIKEzYqm6EzRa5HRI2szMQyDKHUzFIodW17r7g40+Aov3s/coqrvrSfzIAy4Ncj5y/4f5dXHZ8l7OtwjZ85GmJQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vfuji868367ZiIajR0H87rGBm1XTrqqP9F1+tcfljHg=;
 b=dSgw94kQfBi5AJMEpW91sjmNshSH7SrUMnMWvZAmylRpzRgdaiIIb2+Q0mwwCUQieD4p8FsILMUko/c3FYgM5ypIycHEwxr3GOaNhNe1oazmpD5UBegTAsjIGmuuB3WU17t+CitrpRaNH0vGbjCSjBmZxE2CAI90gb/GlQYli8frh0G0XJtb6H1KA+/L20VN9YX7fHRjq0hPIY1GltE540+4+lxrDJgaSe6CUl6lC7YjPEOi9IZag5it7m8aQbSe8UuSt7IDNsjSQpV45SDU6Fs8VIPdQDmgBaplE6uPAOCt0GYqRuXy4MEBVJ+I9rIFsDcRwVpCFmHuiI3aS9BPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 20:58:36 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Thu, 29 May 2025
 20:58:36 +0000
Message-ID: <d8216838-aa71-490f-809b-127bad909f1e@intel.com>
Date: Thu, 29 May 2025 13:58:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 18/27] x86/resctrl: Add definitions for MBM event
 configuration
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
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
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
 <ee5b9df7-d087-455b-a782-027d117b2178@intel.com>
 <da57734e-75c6-4fa5-9cc1-89376184d9c3@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <da57734e-75c6-4fa5-9cc1-89376184d9c3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0dc144-8e6e-4757-18f9-08dd9ef39467
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkxMdGNPWm1BbTRYc1NMZ3FFY1p5NXhveUZSV1RxL1BDOUgyTVAxZzBaMjVW?=
 =?utf-8?B?SXE4MG4yeGoxRTJ2UHFpWmluSmJDY2NhSWFmSk4zN3NTLzB6dXZqbytFQUV4?=
 =?utf-8?B?QjlWSC9VRVY5T0Z0bHloaUltVHJ3Z01PZGRmZGcxZjJGYTFLaVJBdEluNDdt?=
 =?utf-8?B?UWpJUHNTRFZzcnI4b2RCcTUyV2gwWkJ1YXRESVQvZURxNGpvRjFNajBvVU1M?=
 =?utf-8?B?bHg2Sk43MlZWL3l1MERzM1FKVUdmM05acnNHb2N4dmVDQmx1OWcwTWJPVUYy?=
 =?utf-8?B?WlJBKy9HK1Z0Ymp2Ulk0RTFFeHk3SEtTM1BCNXVNUXhTVitqTEMxYTFMaHNu?=
 =?utf-8?B?bGxKYVZtVW1idHVYSUg2bDkzRFZEajl2RFVmVFVEUlVkUEs3NzhqRVh6N3dS?=
 =?utf-8?B?RGVtZ1RwTE9zSFNzRUJNMmxCei9lMlQwamt2SHF0a1ZOajR4Q0NhNnhvcVJ2?=
 =?utf-8?B?UVVDeFJEYnhNajlBbCtWUGRpNi9KSjhHM0JSRnB2bStOY01XemxZdXZzczJv?=
 =?utf-8?B?VUpJWnFXVHZ4WVlUcUVHVlhHZFhKcnBxNGsvYkt0WElUdDVLTjlpb25xckxt?=
 =?utf-8?B?NWFTcE9DNnFHQmN4UTErb2dOWEZ6MncyYTE3THpDMGxnampEM3A5Q1NrNlVX?=
 =?utf-8?B?dzVEMXhZRmVsYVkwejZna1FHNC9tdjV0ZEI5ejNNMGFrbzEvYjd5Sm84UnI1?=
 =?utf-8?B?dWJZb25MSFpsMmhiUEZ1anNRUmwzS0FJajVqOHpXRGUvWVJ5dDlCOGtKajFa?=
 =?utf-8?B?K0tTaXRHcVFsakFJL2NWVVNWVnBNKzJ1blpod0hUSTdrd0VDdmRnSjdnTVJa?=
 =?utf-8?B?TGFiOUFZSFFHOUw4RXdiYThuVldpbWVBZjcvcnlKdCtWRDNITkVNdUwrS3px?=
 =?utf-8?B?Q0RNU3J4SDdvNXFackw1bGNMUEV0a3AzNkdPd2MrNTVwQjNKZ1RXNERnd1J3?=
 =?utf-8?B?L0tpc1ZuZVBTeTZ4aWpFQ1ozeDcwUCt6NU91V0NmNFRETUNQUkdoMjlISXdO?=
 =?utf-8?B?eW45dlVhV3d3YVgvOUtVWHoxMVdselJidW9iSStvdGs0MUVCM2E4SkEySUF5?=
 =?utf-8?B?Vmt4V0lYcDZuMlpUQThydFpLditvUlNOYjBuKzhnTHcxVFBpRG00SEUvVVp4?=
 =?utf-8?B?bVRpRFBVcGRaTWNQQnZ4SGUwUHNLeXExcENzeUNsV0dZK3RmdkllS3NOeVAw?=
 =?utf-8?B?VnhWVkMrUU9iYkJ1bklpQnB4YVJQMnpReDUvbXN1WmVUckxwQkk2SzdIeVRW?=
 =?utf-8?B?L2VQbFVoR3JoV2hhc3BiVjRZYm1aMmpHOWo5KzR4akxaUTUxTEtMZ3FBUlhB?=
 =?utf-8?B?ZTBUdVc5dmI1THN6S2syeVRZVFgreVduNWV4M1k5VVFiY25qVVpvakdjRmNL?=
 =?utf-8?B?N0pjZVhWK2lOMGtTOWhRTStUYnFqK3VCS2NDam9rYzVmNjdaaFY4MDd5Znl2?=
 =?utf-8?B?c3lYU2l4QXIvNjhmaW9tVHluQUdKci8zMFBaWW96bVkrS3FrWkhOQXBUYW5r?=
 =?utf-8?B?aU9yOXZYQ2xmaHUyVm1QbEFhamVqMjFqTTArUzF2RDZyRTN3QjZvbGF0a3hE?=
 =?utf-8?B?Q3RUSG1JS0xsT3NVOEQrMVM5S08xVXNvSE02TEMxVzNwYVRqbWJpK1BNaGVH?=
 =?utf-8?B?OE1RWW9ObEZuK0pPWnE5VmJtaHhWbkthSlhyOUZrTzJyMFlydnpMM3J5T09p?=
 =?utf-8?B?aXhOYVpWQTkyV0hZTzJzSVR1b0Eyc2QwdElMR2QzOVhERWlJOWZPT2psQXdU?=
 =?utf-8?B?aS9IR1pUYm1RNyttS1BVT1FqNFYyVjBkdnRVWmFlT0RtT3pRUjBUcktkdFNJ?=
 =?utf-8?B?ZlJLOXp0MDFhVjNPMG1ITUZjQzhQRTVWd05wZGFINmxzZEQyQmkzRFh5V2d4?=
 =?utf-8?B?eUtPN1NvYWlvQWxaQ2RYeW5GT25FeUZ3NDhyYTR5UXNYS2VzblpTa1dmZkFh?=
 =?utf-8?Q?n3L1VOZt9PI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QitGUldpYXBtWTVGQ3pTQVR0TjlrdXpndjM4eE0yU3JvM1dzZHVmc2d3cUJT?=
 =?utf-8?B?bFpVbGlmZlRYQkRHSnFuZVloczJSL3pKWEJCRW9mbVR6cnB4dkQwQ3QrYjJW?=
 =?utf-8?B?akc1V0xIOUtVdkhZUTY0RGZvZzVTUWFhUVNuTUgvV2tncnloWWVVZitTd0RZ?=
 =?utf-8?B?dTkreUhaQ3hIdVlReXk1dmF2a3VVSDQrVUI4ZW5xZW0zWkwvZmJ5OFJtclpy?=
 =?utf-8?B?dWdsWHZqVTJmZXhldTdhZ0x6ZUY4Z3hjdFd6K3hxTGJiYjVJTWQyNnJhNytp?=
 =?utf-8?B?aW44bThvbkFxODVFYkwraU5LZ0lUbVNCYjRjYXVucE9JYUdrd0ZPVHhSYmk5?=
 =?utf-8?B?VW9uZDcrZWowQjlJYTh5a0JNQkZ2aFhBTTVqS1o0KzFiT2ZIUDJGbmF3bkVt?=
 =?utf-8?B?SHFvSktrZ1FNek1KR2c2YzRqTGNHYUV5Uk1hTlpXbVVpbG1meWRUYnhiMXdL?=
 =?utf-8?B?cVVXQjIvdkFFMnRmMDdUZEtqTWp3SmdZeGY1bjJ5QkY5Wk1jMTJkNURNTDVy?=
 =?utf-8?B?THZGWHBLK1gwME5SWkpETU1JdDRsdHFJbm80RitYbjB3WURCSVB3NmpnM0Jy?=
 =?utf-8?B?aTZhcFFmcU9MSXhlcUFSWU9yNFk1aVBwRE15cXlDSVFqOENINlVFbDh5c0NK?=
 =?utf-8?B?dUVPSng5VUFRZHRqQndYcmwwK0VyNEd3Y2RHTG1ySTgycldNZ1VOeVh4RXNU?=
 =?utf-8?B?WjAvNkUzK2ZIT0dVQ1BkbmxmK0dGYVIzdzVoeHRNYkF6MXUralBKQ0ZtTjMz?=
 =?utf-8?B?bGp4VUdFYjZoTkhJOVM5V203RzJkcmRGTHV4V05uOFR3azhoZEFWSzRML1Zk?=
 =?utf-8?B?c2l0dnVQMWhwcTJLZHlLUWVHOWJQRkVhUlRlaXI5MXB5VkhyMXg5clBpcnZo?=
 =?utf-8?B?Q2dhTHQxaHVNQ3VZcHhoNVI1QjJ2cjE1V2xudUVlQ05tc0RwZDJPMWdKREJJ?=
 =?utf-8?B?Wm1CekMrY3I1WDhXVm5aWEE3cFBwbTVqRUxEaXl0VGtLMEhBeGx2cUZjdTRR?=
 =?utf-8?B?SEI1SVVpNVg4Q0RCTUcvbm1ENjJ0VFV2Qk14R1FnNmlFaCswdk5hdGxuTld4?=
 =?utf-8?B?WVg0UUVXRTErbVp0RDQxKzZsZnR3TE1XUXVxbjFncWVlUklNMmtPVFNab1dh?=
 =?utf-8?B?VmNndEhqemd0S2QzVFhnK3JsQ2FDemZiUUFTVGtJeVY3UElVYitlWDNQSDcw?=
 =?utf-8?B?bllTSmtBZ05KeUlJZ25tUlhPYXduSmlQbGZBSStQeTlJY3pqYkZ3bU83TGF6?=
 =?utf-8?B?aVJJZVFBWTRWeWNRVnBKZklZRUpyUHZjODBIcjBHU290RnVJWjZmcmJxR0dX?=
 =?utf-8?B?WjQ1TjZmcWdpTnBmTVRHZ1hYKzFnNUJ1OUdFaWdKNFRXcVRrNXQrZ2JIOWpw?=
 =?utf-8?B?S2tGMlQrRlM1c3FyYVNmUGwyM0dSRWRqSnJNZVFhZkVHamIvdlE3aGhtTHNw?=
 =?utf-8?B?OWpRNnlXZGRPQlkyTk9BSUdYY0QzMTBxc05DZy9zRFhkS01FejdNRWwyYzFm?=
 =?utf-8?B?MDhiVG9YQ09TZk9oUzB1ZGhqMTZib3kxRUg2UEZpa1d6eGhnWHdRMU0rVkFp?=
 =?utf-8?B?dWQ4NHV6eTBzSjYrZEtyU2xMWjNzdkl1S1NLQmsxeHBVMTRwckxkT3hzZHAx?=
 =?utf-8?B?QmZURGhGMVltdzVDMlgyZUxDYnFmL240TmtpUFl6V01FSHhnTzJjQjNEcXp5?=
 =?utf-8?B?WVRaK2d4UEdhSnU1SURPeFppZ09nVzVoMlZScHRacVB4aCtSV1ZsZVkwK3Nn?=
 =?utf-8?B?LzV3dU5qSU1wYzU3UndpZURpMFFpTFpQZ0FBaFZreUMxQm9EVHlWd3NJT1hM?=
 =?utf-8?B?NGM4a3d0dHoyNHBFY0RzcU1MeWREbmhVWFkvM2FIT0FvS1R4aDhtby9DbEUr?=
 =?utf-8?B?ZjRDMVhpOFBIbVBuMGx5cWJ2TjVRTnVPVnJpbUtBK0RNSVlMcU1aMHBOVUl5?=
 =?utf-8?B?YmhCMVpDTks2U0ltNmo0Z0VIV0xCUFpTcXdWTkNla2RxcDdnQmV1a2wxcGdX?=
 =?utf-8?B?dnplT0R4dkFESTN2YkJxK0VNNEZlNDlQZjFDUmxyU2ZPSDRiTlAxSXdaMk1H?=
 =?utf-8?B?MDZUd2dFalRtYmd3dEN2K3YyWE9nRUZCWjBWT3B0eDduaXA2eVZ5MUxhME03?=
 =?utf-8?B?ZFE5TjNqbFMrMEhhamxZQmFSV1RVMVFoeUxvaTFobWcxQ3NXM1VaTkJ6RDZ5?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0dc144-8e6e-4757-18f9-08dd9ef39467
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:58:36.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FH6rulu2+HoANGml+lLd4N2Ls4UPNjRVPFCUcnYpKoDqoMVoLBMr8p5ifhbmhI5KQjNYCnTWhse/yb8VOASMzk0tQyFqKJJgGK9yz24yj70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
X-OriginatorOrg: intel.com

Hi Babu,

On 5/29/25 12:00 PM, Moger, Babu wrote:
> On 5/22/25 23:41, Reinette Chatre wrote:
>> On 5/15/25 3:52 PM, Babu Moger wrote:


>>> +/**
>>> + * struct mbm_evt_value - Specific type of memory events.
>>
>> I am trying to decipher the terminology. If these are events, then it becomes confusing
>> since it becomes "these events are used to configure events". You mention "memory
>> transaction" below, this sounds more accurate to me. Above could thus be:
>>
>> struct mbm_evt_value - Memory transaction an MBM event can be configured with.
> 
> Sure.
> 
>>
>> The name of the struct could also do with a rename to avoid the "event" term that
>> conflicts with the actual MBM events. Maybe "mbm_cfg_value" ... I do not think this
>> is a good name so please consider what would work better.
> 
> I can change it to "mbm_config_value".

Looks good, thank you.

...

>>> +#define NUM_MBM_EVT_VALUES             7
>>> +
>>> +/* Decoded values for each type of memory events */
>>
>> Please be consistent with terminology. In the above lines it switches
>> between "memory transaction types" and "memory events".
> 
> "Decoded values for each type of memory transaction types"

I do not think "type" is needed twice. Could also be:
"Decoded values of each memory transaction type."

> 
>>
>>> +struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
>>> +	{"local_reads", READS_TO_LOCAL_MEM},
>>> +	{"remote_reads", READS_TO_REMOTE_MEM},
>>> +	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
>>> +	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
>>> +	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
>>> +	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
>>> +	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
>>> +};


Reinette

