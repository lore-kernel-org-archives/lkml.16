Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EDA2036F3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119032; cv=fail; b=Moiy0rWpfuQq0+NBa9RP7qPiORhRtAE6WPJ2obFxQSjl0MchqYSSOFIQahaNnS7rUTyLqORal42ocCuIeL52MQ/I2+gAAhM+w2haCK7jCJkB5QimfGa4vBOZLH0NYBTk9MEj/d9OiiqsUvZF+jUgAYjvVOjbqDKoFRrTEWNWQR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119032; c=relaxed/simple;
	bh=z1uEP4uo6peZ4Y9Eef17CsJzmyn8SLqDGLAnpDxuekk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kThWPj7niSGzA5Au9cG8TRGag7zYY0rIALe4Siuph6GBgNzR7wH3rck/w791rVfp85Gq83wT48t2+2mRQfb04koYKblyi/4IjCfGxXJ7aVHP9SU2ZqFflrcwu/CyXHLUHRSq8u7OhGAvfPQt155+odwoBXDif28AU5M3+xrwJ0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B30m0zgf; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B30m0zgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119031; x=1777655031;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z1uEP4uo6peZ4Y9Eef17CsJzmyn8SLqDGLAnpDxuekk=;
  b=B30m0zgfjxxVvDqQkh2QvB5GdECw/QbQDQi4U/F/MH8MGKddn4Tm7PNR
   a81wGiS+ZwSkIb8EbpYyP0fpaoVBcW93iB3qeqV8FtSRen3vNpi344aNc
   Y1qZHNKTfsKvCED0VDYCaTyPUIptCchsv1uCFI0xRgTUexSJgPgkQgyyk
   Xd6GFbdtu98prf4JbQJsvV/TTBwJ6Rem/UxhNc9DwWqUcyCTvD9p0lCEC
   xCoxaeVWTIZX1s1eTBdSPYmm/U0WcrO2gOJjQsrUGJXMdMRWalo41JKFQ
   Rnmuenqtt+QNSu0ekdsvv9Y/1lJPtAyRHeN7m8IbouLUPb+ZIflsHRNCB
   A==;
X-CSE-ConnectionGUID: 6K+BwbyURhWnkWMgQmm6Hg==
X-CSE-MsgGUID: OfM61ZhmT2GdrpsqkXiQNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47706758"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47706758"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:41 -0700
X-CSE-ConnectionGUID: MRCegN/USlSJcUm1dw2Mfw==
X-CSE-MsgGUID: mKmnom7JRsukvTbEoX4YfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171671840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:03:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:03:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ba9cdSc3V6yiqpySVuMqXlwZxaDCO+UOpD5+xZWTO4TyMoEyMfLKu3g0lRmsT/A5+Q7ipP6QeziDm0Enc+DF8B1VTzb6oBmAg3i4CN0HCXZTl8VmQ1LUopC2qoAXHX4Ot6BgAzZ8tsww39H0+wBTqlc0yykGQ9HxgGgHtIk+Mv2MzD6RF4vg01wde9Jp/LV2VVpfJlYiUETi0oPffIQaKlfQ4+Kzx5B1fRY38O7bSG/eDqsmUoEhrrMICkOOmsKSRF8QCriIGNTwBz7Elpk/YJTbU2D5FIAY/mUl9fWBEv/Uh0LPaeexJ8IKP6YPyRLXK0f/qpF8yu/8gxbHX/6oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQI7R3bF5aKfr4bqD1O7mzz8BIhOpsoEuuN/eyKJklU=;
 b=dUI1yESr26+axqQMbel98aWwkbJiiVos+Sny24iY/IF0eo7l72exFOzL10s24N5fpnvGYOboleKW87xUaRrWKmn/NQJuzMTx4GIT5BoGd0ST9OnmUwHcg0dj10VY6ImfAx/RqJSeBYc9AIJbe1rPfpD144z84Oxd13cdQpKyqnYuq45gOJSwqSAwN5VC+eqEEj6hJafTTB12V8MUj++IOfsGsglCFcKwQHjvzGOWadpKugW0i2z5MlFSNZiH03XECADYcGaWfx/C6JgcgPnLyTctdYKRffEj1PoduBKZyBN1yAm8xl0D7STr6nuIG8ozai6+9BwrWF5TS3GTk2n2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 17:03:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:03:37 +0000
Message-ID: <6f793113-5789-4fee-acca-14d144844fc6@intel.com>
Date: Thu, 1 May 2025 10:03:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/27] x86/resctrl: Add end-marker to the
 resctrl_event_id enum
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-8-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-8-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d57db1a-5029-4b5b-db28-08dd88d21d26
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmIvQWZ2SEsxY3FuMWl2NnNHQjRNM2FUR3l4QlEybTlmeDlYektqYlpzOWR3?=
 =?utf-8?B?WGlEd3FYdEUrZStCY0wvdjNvc2QveFhBZHFmK29SeTNyZlB5aWpSQk5oQklY?=
 =?utf-8?B?UmZXMktZVXhoVm1zTjZVZG5hRDhnOGwxRkVSWGhReC9JV2Y5YlFDZ016YnJG?=
 =?utf-8?B?aWxYNzUyWGVscElKcVVMNWp3ZVA2RGhXMFB0cXFsZ2VMQ3BsZmlSTDZyaHZm?=
 =?utf-8?B?dFlFektESnJXZTZIQStKOTdHS3ZMcTl1RkJ3ZHZEL2VIOFR6YUhxV3FVMTVZ?=
 =?utf-8?B?N1BRSkJEeWx6cUVSWmZXYWx1UUFxQ0s5bldqYzM3YjZpWDJ6ZUxHaDJWLzFM?=
 =?utf-8?B?NWR4SjZkLzJQNm44Y0h4Ujc0WjBTRWtHeEpJYlJXaGUyZU5Mem8xYmNrK0JP?=
 =?utf-8?B?MVF4UXIzUVkrWkZ2VmR4Sm9sRGgyV0tIVlRVUlFtcjRiUnpBZUthRlNHOGUr?=
 =?utf-8?B?TzAzQmxyeVc0QUJXblFadkd5dlJ2NUdHcUJPMTlpSWVtVlNyd1BXNmI5Ynls?=
 =?utf-8?B?aEFsd1FsTjJrYXAzRG5LWDlnZFk0TGJ3KytUN2k3VnJ1ckpxWjZVaVY2NTV2?=
 =?utf-8?B?TUdOUG8yYUZnTjl6RUNXbFlBOVFES3pzZW9GQldSUVlESkk5K0pCbUNZUUc4?=
 =?utf-8?B?QStEWkxrRjdsVHpDRisyRTNsaC8zdHR0WlVudUhHRVNONTE2SysvN0ZpeE51?=
 =?utf-8?B?b2xrY1QzUjA5emxmbVJCbEw4RDZSc2xQRVdNQTNKQ1JOd2s5dFF5aWZqK1F4?=
 =?utf-8?B?b1NYOFJNUU5qaUNCN0VtNFkydkROZ3k5ZFo4R0dnWElnNEV6SnpEUUl4UzJU?=
 =?utf-8?B?ODhyc0xpZU5LWU00Nmh5Vm5INEw4N1RoQ09jUHA5ZEU2aW9MUDA0MlVNSlBx?=
 =?utf-8?B?Y2xHV3pMeHRBUEVUNnRZYk52SE41OVUzeHpZTEszVkg0WWpoTjE5aWJsYis5?=
 =?utf-8?B?NUN1b1VlVTUzVmlxOCswdG1PYTlWTmZHOGtKYjhhNnhLRzh1azJwNG9Cdlg5?=
 =?utf-8?B?dG5vdG11a1hUeGdxbUNVc05QR2xvYzNndjcvMW5Lc0R6b044N1dueEhsQ2E1?=
 =?utf-8?B?cHh4YlBVdFVpaXZlQkdocFcvR1lVd1RwdHlwWUVpYnFudHQzZEYvVjkrdlQ3?=
 =?utf-8?B?dVZXRktvQjdBQVBmanQzY09ocTc5Ry9WUFBNQXdtQXNURkpxOHIrV3FrbElu?=
 =?utf-8?B?Ny9DekgrUkF3eUE2bmc5clBXN1J2ZHN6NTNuek9XN3ZZR3lNWG9ESmlCT0pz?=
 =?utf-8?B?RDl1dldlbE03Mlp1OVNiRFJBUzFzYktIWmhXaFVhNjZTaU1WdnNEbFljcnc3?=
 =?utf-8?B?MXlxUTkvQkZDczlhMFZoMTBCVVNwRkxyTXI0SFdmNFloZjd6QTh6anIyUHdG?=
 =?utf-8?B?WXN4NWs1OWpPcFhHR1Bla2MrZzJDY2l4dXpqWEFBS1VsMDVMdElyVlZTeG0z?=
 =?utf-8?B?OVk0cmc1QmtkR0pEemZ2WnZzQm9JK0xNeU45aUR2bFFBYTh6c2V1NlZKZ203?=
 =?utf-8?B?RStFWG9yb1hubWZiVEk5SG1vSS9UMnl2bXJnMHRhcnpsK253N200d0JRWkl1?=
 =?utf-8?B?M0FReFE3WjNzbXM5aFlDR21wMWpZS3RRczRRV2NZYWR2dmxDQll1V0lsWVNk?=
 =?utf-8?B?czhKcmJEZmY2L1l4T25kOS9Ec0RYc0MxYVFsTG82bFJEcW56ZjMvTE52TnZB?=
 =?utf-8?B?dExnWmV5WThyb0tCYkt3VlR2SklHaFpCcVNEYjJZRzhqTEFEOEg1ZkZSc1Ar?=
 =?utf-8?B?Y29QVmZFamRzVDZTWGpVZEJxNWRmc0V6b1M5cE9ZS3MzeFR4VGFNNVQxVlVw?=
 =?utf-8?B?dlliTWE1N3Zaa1dWNTB4TTFKQXFmc1RhYk9EeUNla2VPV1JKN2J6bm11U29z?=
 =?utf-8?B?MjRIRUFVZU5kUzRiQ3pQVnpVRVc1cUZIbW1FeHJOU2FpWjhkRDdQTDd2Z2RI?=
 =?utf-8?Q?VXUkKuFM/O4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVVYaWc0ZmFQR3NXb1BzUFVpNGlWUFRsVHVSS3h3R0xEK3JaS0VXTTBmVVVP?=
 =?utf-8?B?alk1VUkvY0V5YkpMT2hqQkM4N00xM2l1V1RTUjU1YzMvOFlCM0RHQWpjaWIy?=
 =?utf-8?B?bVBtd1QvY25sZk9kWFB4cllyVmQwMGQ5ZjZMYlcvZHFYRGJuUVVpSXFYbWdL?=
 =?utf-8?B?bHBkZnFhcjRBeURrOENHRFVVcTU4dGQvZFVYNkNWLzVkNDVUeXVmN2ZTNlhD?=
 =?utf-8?B?c0FqNUgvdldpRWM5cDd0ZmdYTEVCOWo2UEgrakI1NW9XN1dWbGtKc2g2eFJt?=
 =?utf-8?B?WDNmNm55azZvem0xdUVNdm1NWCt6R2N5QmMxU0JJRUJKVi9MMldXQXRTNmJ2?=
 =?utf-8?B?VnRLRE9BellsVjcyMitSM0JyTVZQMFFvVy9OSlRxYktQeDVjOVFIck1tQTU5?=
 =?utf-8?B?a2w2bTRYZ1pFeGdNNm9STENWeHRINWE1bE8zVlJJOUdmNEVhYisxandpeFB5?=
 =?utf-8?B?ektmVkZCOThadXNOM05IdkZGKzR2R0l2YSs4YjJVYTFRL2RyajdublMxd25L?=
 =?utf-8?B?TGQyOWIyNTNEVUZ5MEZIOS9HQ1ZiN3FWenFhZDVCL1NkVFpodUVYYjljdnM3?=
 =?utf-8?B?NW96dVZvWTd5ME91MzlZeHpXNHhuQjNaZ2hMb3ZyWHV4VUUxY1JMVitFU1pH?=
 =?utf-8?B?T2tBckdxTGZsc1VqZittNUY3SGdwYXRpbGZSbGxMc2RWSU5NTGthblJrbmdE?=
 =?utf-8?B?WG1qM0NOQ1hyeWM5emV1SlJSbFNteEdaSUU1THNtdGRHeWJXbGFQV2ZGQmM2?=
 =?utf-8?B?bStpMnBKSW9iZzE1emRqUmlZUnlTeVRNVHdUMnJEWTI0UHVZNTFKMFNRR1Ry?=
 =?utf-8?B?U2liZVJnMjJ3dnAwTkxvSlhwcWJQV1Z6RExib2VTd2craGxoeVF5QTB1Wjgy?=
 =?utf-8?B?ZFM4R2pjWG9BbTFkNXI0RUZUZFR2d0NEaFlMY0ljOGVaWUpManBuK1dpTm8x?=
 =?utf-8?B?MjF1cVhESlJjYkdLMlVnbFZKa0UwYWloN21jOW9EMFVSNXdMZ3l3TWs3SlR6?=
 =?utf-8?B?V3RQTzNPelpVRit1RFo1MWZrdm8waENjbnM5Zm9RT0JyUy9uSjdlemJkeTB3?=
 =?utf-8?B?YzdmTjJla1FibzByb3E3Z05tSXNpVmxiZHFOMWJZRVZXRk4zbnpKRHhkM3gv?=
 =?utf-8?B?TGVmSHFuNG4xZTFFTElSYktXMVBxSnBQMzkwUTgxdlVBcGVMQ1ZtanRBUXUr?=
 =?utf-8?B?VXhaRUZCc0Q4VkVRWnozQ2dzUjJmVHpXK2wvVGp3aWpreUEwTG5UcWMxTXdJ?=
 =?utf-8?B?ckdiQi9WMEkrTll5T0cvN3BObVJIT3YxL09MZEc5UnZzS01aTDZOejBSS3ZJ?=
 =?utf-8?B?Wi9pUlNlOEVpdjFoMGxVMU5ZLzVrWEVHZnMwdW40d2JaTjRQVlFROFdsWm1X?=
 =?utf-8?B?VWVNZGdmZllPTEZFT2hyVkQ0SnE3S3ZqRHlFeEhraCt5Nk1jZ1dkMnZQaXFp?=
 =?utf-8?B?RHVvdGkzUFUrUXZVSjd0VnRBZ0xsZlg3Qk9HekRSNmFERG54MGQ5TFlOemln?=
 =?utf-8?B?NG8xWGJLOEtadkhsUzRtRjQ2NEpmSis5ekREbWtUL2ZSTlVMUGc1aXZHMkt4?=
 =?utf-8?B?clNpTlV1eEpvYWJKWGgya3pQd3ZENFFJTWtTVTRsTG9Ud05tYmV1emcxMm1u?=
 =?utf-8?B?M2Q1aHh0S2NhQ2dtYzBmTEQyVWdhUFpYQUp2WE45K010ODhqMXNXRGVFT2ZR?=
 =?utf-8?B?UU8xUGxTay9hd1FBY0l0WXgvK2UrNkhQc1plYnVlSkNHMUcwT21jUnN6QWcw?=
 =?utf-8?B?Y3ZndG90OFlIdFBJSnJENFZndmZaZjRZZmR4T2x5eFhSeVM3NjR4S0NjVTdJ?=
 =?utf-8?B?ZEdab2NCa1ZQcFA2UnJldFFDR0RLamhPMVdrMm1uY0txandVYkZyampiS2J0?=
 =?utf-8?B?bFFLZ3VQZ2pkalUwWTBvVDNGeE9DNmVRVmkyczVjOU8zVEhEZUtGZi9kY3ov?=
 =?utf-8?B?SlNudzVodlBIS3puOXl4Qndpc1pxN2d2UWdRK1lxSlQ1elpydEc5VDU3NVRW?=
 =?utf-8?B?VERkUUl6TnlyeHhjZm8yM1BFMEt5aUFhTVZTQ211QU50eXdLMnZnZUxLOE4x?=
 =?utf-8?B?eTg4ZHE1UUh3QmZQUW1IQUwyQXZBdzd6Z3ppSjNnTU9iQTZPakJRaHMwNnFO?=
 =?utf-8?B?NytMVUdNYy9BSHVmU3UwaTcrbGozYmRUbHp3UzNOc2ZyMkswL3FTWnY3UzZ5?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d57db1a-5029-4b5b-db28-08dd88d21d26
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:03:37.2774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtlS4b5cKidous8/KpJYyrXqYrgcNW7IUw7WB78z972WS5T9F9ikrn1oS2cl4Sz7i8FHq2ZLVIk0h1hKviijaQeT93YB3dZ74GL2I9mxT9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> The resctrl_event_id enum gives names to the counter event numbers on x86.
> These are used directly by resctrl.
> 
> To allow the MPAM driver to keep an array of these the size of the enum
> needs to be known.
> 
> Add a 'num_events' enum entry which can be used to size an array.
> This is added to the enum to reduce conflicts with another series,
> which in turn requires get_arch_mbm_state() to have a default case.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

