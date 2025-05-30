Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C52185A6;
	Fri, 30 May 2025 20:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638505; cv=fail; b=GR5Nxnv6RT6Auq8NlCjk+xdcTN+UaF3UrytoosLFs9pqWu8e7048fRMzfbSl5pMGDIOJqJl3cde2bQnb4ZICJDq/rA6muC1p6W8ATrLQTdSiPDJF+F2WL3Suov5sMbH1/YfGZ9gSF6raHVXECLhGgqei2Hc5uoswhUoJfNM1DpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638505; c=relaxed/simple;
	bh=7zqF8LpMOtf6Byab5Lee6cLS1cQ3itpeXaOXfy1iCOI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BnmC+pkvvjDtFXCh50FrodM/02Orpq0B7Ck4cfwCFyGhqViDKGmY0Oi9oQ+GrkCyg0kkIrKrpSUH60HtouxLtqYup0OOg61shS6r09jjmMgHExgICKbZ/EISoqsEhVvRRDU2QHF785RZwOQOg/4NPHZSOW+Vl7lhhqCPlnhJCpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wd3EzJoR; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wd3EzJoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748638503; x=1780174503;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7zqF8LpMOtf6Byab5Lee6cLS1cQ3itpeXaOXfy1iCOI=;
  b=Wd3EzJoRF4SURy8pybmeJwtIzUSUEOMRolcmcXMmyXEcyMOsDRhKpiPY
   GO1knAnYzX0duJQ9TVoAodjduSytUsIge0eETaiVltbEyzY/wBGznhqX3
   NAF5by3rUtvuuDp9b+aD3t237RL3AIRoB8sAAyQHD+rBJvHglGVpW1Qtj
   POkYB5jrmM52oBPCG4uUnkD4MvEYXa2d+GF+xwYPv+ODVGI9jg6cvkpu3
   QMuL22c3RaBrQsxqETZb0/AODW3/mmdw6RfM6n2at97MSMA7rKpytXKa6
   2xZ2b01YIoCFxgLj3KURm+k0eLtSC4QQHra63A2552xBKtkvh6wue/AyC
   w==;
X-CSE-ConnectionGUID: CVgN7+FeRpiWj6LMLX7c/g==
X-CSE-MsgGUID: 1iek4fXzT2ao2Kbb9I8xEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49861245"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49861245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:55:01 -0700
X-CSE-ConnectionGUID: 9g3Jf2GRSi+ovUg+5pABUg==
X-CSE-MsgGUID: 8RV4H521SDyL8jQUIXKphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144616181"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:55:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 13:55:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 13:55:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.56)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 13:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhveBU0BBAA9zccuvINNoI6mnGo96UPBLbPPuT+LtHRgipS/JEs6eGPjSvY23yNpzBfycrRgKnExngPHlvRzj0Zul99ujT6m3qxFrdU9jT3qkk0QwtK6sjdydurapU5T+rmNBbKLhMXZPaNtdSqbi+j2NWwJ5AH/F+Cm957r3nHvJcwaMCAM2TAjgj4maNUfsGzpyLgqro8UfsQ8qaHd3SFo9GXFnvplA5AFQjWLLYHtQxRNFNvPelua42g26ToDrOD+Xu3K+N3cHGTEPUOnYKaE+mTO/h1fYrvM4Vmr0dopselDBCJbZvKYEk2e/N//9r55j7z91F9dBiTdiQM2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M+Spod8OL7G4timuhlyq51I7h4uq00Hf15HBooWCtQ=;
 b=jVVYW3OyVWKOHdkj1C1pEz/SEhw/2uFIaQzILgX4piTE7rd8IcOiy/Mz3Q6eQZk4O5dk0Y5SB7NUyf1si88f8/wt/AiNOyGurxRPk5PUjOaQTDDCw8rWVIXb2jqG2XuPkOX5wcoW77C/3FQgDt2dPDyPguppFBHBPgsO34XdXg0l5JlOu+DCW8bUSb8fB9CNDR/BI1u0QvInxJyk0FbZywyTxbbRdBU29ZNHbXLlOWz7fL6MLlX0gesZsZq7Jj5gvrfzPe/Y/LySei/an49p/TIxGc2pi2TJ1I/UpsT9aHfcJaJgowvhrYfnj0L7ZIc5xR3JhtEfEVJYhW5FMEbPSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB6601.namprd11.prod.outlook.com (2603:10b6:806:273::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 20:54:30 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Fri, 30 May 2025
 20:54:30 +0000
Message-ID: <48b40ebe-a1d5-4160-8902-729cf4ac85c5@intel.com>
Date: Fri, 30 May 2025 13:54:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 21/27] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
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
 <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
 <1395b692-cc65-4d84-a68e-f9b20c37f74a@intel.com>
 <54f7b1df-7635-4c3a-8395-172806fde99f@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <54f7b1df-7635-4c3a-8395-172806fde99f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: b0db3afc-74a7-4bac-8407-08dd9fbc2c03
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0dhU0tVNEgvekFFaUFkRTFjMlNhdEFSTE5jL3c0dlJRZ3BVSy9wNHB2L0VI?=
 =?utf-8?B?VWF0UWYwMDdlWkJLQU1WaDc0ZTcrWk90WENaaXh5OGxxOVVhOHc1Q1l3WGlB?=
 =?utf-8?B?bVVjSmhWZEVxQjM2YUZ4Q0FRRThRSWNZZW5xVjV3SnF2a2hZQVMxODFIMmUx?=
 =?utf-8?B?RElOcTJ2TTlwVWFLeCt4Qi9YVk9xQS8wNXhmQlErd1JKOThLc0ZtMldMVENO?=
 =?utf-8?B?MTU0ZE01dlhwUFZzOGs0SUY0SUY1aU0rRSsyOVR4emo1UE5keXNucnRVblFt?=
 =?utf-8?B?S1Mrdk9kbXU2cDE4Qms5Uk52T0d1TjZGRm1KYnpzdWdZTlg0Q1I2WFYwaEEz?=
 =?utf-8?B?SnlLTWdZSGUxZVMxSHRrMGVGWFpPTEpyZFdFMzBXNjR3RHFUYzIrZFVleDJz?=
 =?utf-8?B?STZCR25DNDVGYzdNZWNSVTUyakoxaW1LajE1VHpORG5Ka3FPK0U3aDdWTlJk?=
 =?utf-8?B?UDkzcWFTc3BNeEdiMFRiNnAvN0oyRDFEaVgxZUI2TXlMMUNVYzhnU1BRaWxF?=
 =?utf-8?B?RWMvcWFGU0xJZjFJZjVzcWxwRUVkRGZGNEd4MFdxelFnZ2xqRFlrY0wvOFp6?=
 =?utf-8?B?ZFFHT2txN2xrWldPM1ZWdlhNL0w0SEZObG8rbWY2VHdCVUE1b3JUZUtMUVFB?=
 =?utf-8?B?NDNEd085UjVxVjYrRmZuSUVlTi94TFVYOEVJTzNYQXJRakRjQUVTY3BKMTQy?=
 =?utf-8?B?VnB4bWtybktiRWl6clB3Z1NzNndudjhpZ2JHczF2NWljUEoyb0liNGZWdXUz?=
 =?utf-8?B?ZUoxOElEaHRyeW11MG95NDBXaEFOcnptVWc2UGRyaVdqZk12SVFlaThROEt0?=
 =?utf-8?B?VnRTcDdkTk5CdEdiZTM5dUhjU2ZMVzZtcVppdHRzdDZDaXB1OFhWV0dqRnp1?=
 =?utf-8?B?Zzlha0tRVHNKeUR1bmYwemNNNzYxNlRkNGk0MXRWNmcrZTh5cjhQdkJNaW9Y?=
 =?utf-8?B?VGJnVnl1Rkp4WmZ1NWd5MjNzTEhuL1loYnZ0N0hoaHNnZ0R0SjdqbEJ5dTJu?=
 =?utf-8?B?R05tMHcyZDExYjNDblpPalQ0VUdSNmlkMFY2eTBVM2ozSklUV0RxQjdab0Ix?=
 =?utf-8?B?MGNqMFhjY1VWUkpaYmswQ0xqQWZyZUE5MTZTUFNlRGVldWZOdEVHRWc0QlM2?=
 =?utf-8?B?VjBRR3Bjckw4U0MzQnJiYUEzZlg2VURKUEZ2UGwwdk01cUJZRFZ6c1htakxn?=
 =?utf-8?B?eUNibFdNa3ZFUWlkcWFFSmg3N2ZyMHRyaHJGTndqVmFPdEdaT1JGQWlOdzE1?=
 =?utf-8?B?dExWUE5QaFVTeVdaVnJNZXJTUXlsTzF0WC83RlpwNDdMQ05yN3Q0em05Vmlp?=
 =?utf-8?B?ejdPdk1Gd3IyRFZwYVFlaUk1V2t6c2VMb09MWXo1RzVCWlNaNUFaZWZEK2t6?=
 =?utf-8?B?S2E4TGl0NG1McTdJUG90Vm1yeWtwM3ZHSlhqaEhONDR5MUVWeFJ5Ry82WnVF?=
 =?utf-8?B?SGxsTlIvOFp0RVZFWlhMYjloUGpHNlNONE1tdjIvZTBkOHhMOGVIQTNxYVNG?=
 =?utf-8?B?Q0swdGZ4YXM0REhDMDI4eUo5MXhXektLbjJQUXpYRVVpaVQxcmRkT1V6KzN3?=
 =?utf-8?B?dVk5aWV1dkMyRVMrbXBaQVVScmU3R2JhZUFSZVlOUXFaU01DVVNGall5OHVq?=
 =?utf-8?B?OTlTZ1BIREdESjltcXBMcCtkVnJNblZYR09pV3ZHaHFENGpMQWtjR3JjMWlK?=
 =?utf-8?B?VVlsODFaMkZaanBnOVAzZU1KVDhOVldIaVBlekh6ZVBhSFRFeGhuRlNKcWs1?=
 =?utf-8?B?WGRLZ0MxNEUxUUJQMVJYRGJqNEpQQlVkbzk3OUE4QW82TXlac3J2c2xhWVRT?=
 =?utf-8?B?di9DYUdGamdnN2lORWE1Z0w5VWJybWJaWGttbmxTbFN0aVZmdGticWNBUHhx?=
 =?utf-8?B?aWR0V0JmVVZEMlcrdUdZbnNHeFlCTjdBd2pMYXRWeDVJeTVaQXpiUlhGMTRu?=
 =?utf-8?Q?4TFNE532tFA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBrOXhPTzNlNnlKNEVCa2pVaFRlUi9GZEEzYXRkNHI0dnQvRld1RjdZajZl?=
 =?utf-8?B?ZlhIZVhYV1RGVFhFclRtWVh5QmdnemJ4ekJUT2pyQzJtUDB6VXNWU0F6MS9i?=
 =?utf-8?B?MEZ1RklxREErMVpnZkZFaGtYRTNxU1p2SnhOMGNjbG12NWtrQ0FjOGhraVlU?=
 =?utf-8?B?UDRFK01BaU8waU5BMi96bHBPanBONUMyZkk2MGRTU2Y1ZzRFRmZUbjl2ZVNJ?=
 =?utf-8?B?cDZla2ZZREIvVjBod0tFVXgwVnZFcDdyK0x1WUZ4RmtrL0ZrODVOVzNUR3p5?=
 =?utf-8?B?Zi8zTzREdjByT21zT3RNcCtyS0J6Vys0b1J3UjNlM3BqYkZsUzhYQy9HWjJG?=
 =?utf-8?B?OFZMSmY2QVUxZEtOWWRFWXVkdUc2alR3cXAwR0hCOWl0U3drdFB1aW5rSlF5?=
 =?utf-8?B?Ym1SY240Tjd2WWZDb1FjNkxFcFNkZTB2NGNNaHozMzFSNWUwU1g4UzVUN1dZ?=
 =?utf-8?B?SGZCWHV2Sk9Wb3JaUmtlU0VXc2IzWCtkaWw5Z1QvcjRvSGNBQml3ZHJHV2Jy?=
 =?utf-8?B?TnR2clhXb09Xc09LN0dRWWJTS3RGeEtWUk51ZWx0QW0rWnl1M085eUhGbXhE?=
 =?utf-8?B?cGZ6QWJ3YzE1bnZYU2NzVzRTV3lzV2tIbUVqWXh4RE5DSWNJWmxLYVYzS2cw?=
 =?utf-8?B?NXRyUXRJSlNzWkE5QWZOVW9QMWQrS0RBSWF0eDRYeVA0cUZ0RUs4YnFLOWRM?=
 =?utf-8?B?NDFqaytxQ05YYmt4Z2xzZTlnUjVXcy9WNzRDWEZPYko4ZXFkY0t6YjdVT2xP?=
 =?utf-8?B?MGhCRjlBSjlIMmF6dEJyYnhldWV0a3dXSjVidFBKcm15UE5uREdxWDliRFZR?=
 =?utf-8?B?ejBtNU9Ca1NiNUNBTDRtOWtha1VJVlVTV3YxdTZmV3hISHJHZklaSXlobmly?=
 =?utf-8?B?WGNMdHFiaFB5VFliWi8rb2drVjUzRFRnTUNJcHZWS0hvSG4xN2ptb2ZqaU5T?=
 =?utf-8?B?NGtRUE4vSVBoVkpKYnVHdFZ3bzd5NFBCbXh6aXNkUElxeUxwNU8yejJZMkZ0?=
 =?utf-8?B?OENicy9zUGp4WFVQbHloYWdhdTEwazk5YS9nbnUxT2E4L0JXYTN0aENta2R3?=
 =?utf-8?B?TFh3TWtwWVk0Tm5mY3IyMGI1bWI3UlZ4ZmplUDd4L2lJT1poTG1DblFGc1g2?=
 =?utf-8?B?dFVEUXUvYVlERnMvdE1LLys5MCtHNmJKQTdpc3pXSUJZOUtvMlE0cXl2VUI0?=
 =?utf-8?B?S1o3NS83aWdkaVVEaXZzcldCdTJYcDE1ZGI1ekNUN1hSYTcxSFdER1ZiRmpp?=
 =?utf-8?B?NDVVWDE0b0JhSDJYaVYvUUhsNyt0TWhjTzRuQmIvS0FFTGQ0cC8wOFAxR3Z4?=
 =?utf-8?B?RmdqVmJVYmVzNTNGM0VaYlhyWkNvMnQ2c3QvalpUS25mckZWeHpHNzR2a1NK?=
 =?utf-8?B?bEhseW1DcW1TTXdwcWsxanQrSGRnYW9FeEhFSkorZGIxb29vdFhwSnU3RDNP?=
 =?utf-8?B?RTcvbnJZc1BGN0x3U0doaktKK3lhUGhUdGR3YXljc1FpZDcvSHdOanNJeWx6?=
 =?utf-8?B?czh2Qy9JN3lvVUZobC94aGRWOWlDeVJ4STlnVUplb1FXcGhneE9HNGJ1NlRy?=
 =?utf-8?B?SmpnMjY3bVlodFBqNThiNFc1UGpIdHRhRWhvdGdlWEQvZHdLMk93bEdSTkdv?=
 =?utf-8?B?WExYMnZ4YjVDRXdna3NrN3MrdUJPQ3hXZFM1Q1BxUGllbnVxYXpDRXFlTUln?=
 =?utf-8?B?RTI2NWdyUExwMG1kV0k4cDdKL3hTbUlmM0tUc0hIZWtBTW0vbkh6L2dmUlBT?=
 =?utf-8?B?ck1aMUR2a215MklOUkt1cGdmTnJvRXEvcFZIRWFjR2NCenNCUk9xT0hJTmZB?=
 =?utf-8?B?QmJlRnBPN1l3cUZXZjlUNFArS0VVTXl1ZGhvM0xxMjhwNzdBVU5KN1ZKS2pP?=
 =?utf-8?B?dStTczBUU3JaVTQzZGxWSWtHSWFzeDhOSnhnS1VNWlZyUXV0aUNVUEtoUldN?=
 =?utf-8?B?MFhjeTNFQXRDaVhPMGgxNkR0WFhrbnhsWEpYamtuL1dzTjcrQXhIVkVRbWVY?=
 =?utf-8?B?dkxsNW92VTlNdUtsZGNSQzJEMGgxdzZPb2U4am0zbW4vQWZQS2JGRDVXbzJY?=
 =?utf-8?B?ZkVSN2M4NUdMZ2lTZXVNQm55bFljZ2tESU9scXoxbkZnVXNrTGdnakJ2SW1P?=
 =?utf-8?B?aHF1elE5MTlHSUtzck02dDZ4eHIvamd0SHE1OE90ZGRpdlNVVGFjSEgyczly?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0db3afc-74a7-4bac-8407-08dd9fbc2c03
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 20:54:29.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eryb+wkv3CD8A+xBETvEXPglBxFriia8vJiSCPwTvN7YhIwvKe9xdGCZRFGSMvpvLhPECLPlgRLE0Zrr+VmdJWkXLPk0nPkXCNUkzEJ8nG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6601
X-OriginatorOrg: intel.com

Hi Babu,

On 5/29/25 4:03 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 5/22/2025 11:48 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 5/15/25 3:52 PM, Babu Moger wrote:
>>> The mbm_cntr_assign mode provides an option to the user to assign a
>>> counter to an RMID, event pair and monitor the bandwidth as long as
>>> the counter is assigned.
>>>
>>> Introduce a configuration option to automatically assign counter IDs
>>
>> "assign counter IDs" -> "assign counter IDs to <what?>"
> 
> "Introduce a configuration option to automatically assign counter IDs to to an RMID, event pair when a resctrl group is created, provided the counter IDs are available."

Stating that "counter IDs" (plural) are assigned to "an RMID, event pair" (singular)
can be confusing.

How about something like (please feel free to improve):
"Introduce a user-configurable option that determines if a counter will automatically
be assigned to an RMID, event pair when its associated monitor group is created via mkdir."


> 
>>
>>> when a resctrl group is created, provided the counters are available.
>>> By default, this option is enabled at boot.
>>>
>>> Suggested-by: Peter Newman <peternewman@google.com>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>> v13: Added Suggested-by tag.
>>>       Resolved conflicts caused by the recent FS/ARCH code restructure.
>>>       The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
>>>
>>> v12: New patch. Added after the discussion on the list.
>>>       https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
>>> ---
>>>   Documentation/filesystems/resctrl.rst | 10 ++++++
>>>   fs/resctrl/monitor.c                  |  2 ++
>>>   fs/resctrl/rdtgroup.c                 | 44 +++++++++++++++++++++++++--
>>>   include/linux/resctrl.h               |  2 ++
>>>   4 files changed, 56 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index 9923276826db..356f1f918a86 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
>>> @@ -348,6 +348,16 @@ with the following files:
>>>         # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>          local_reads, local_non_temporal_writes
>>>   +"mbm_assign_on_mkdir":
>>> +    Automatically assign the monitoring counters on resctrl group creation
>>
>> assign the monitoring counters to what?
> 
> "Automatically assign counter IDs to an RMID, event pair on resctrl group creation if the counter IDs are available. It is enabled by default on boot and users can disable by writing to the interface."

Same here, please take care with the plural/singular usage.

> 
>>> +    if the counters are available. It is enabled by default on boot and users
>>> +    can disable by writing to the interface.
>>> +    ::
>>> +
>>> +      # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>>> +      # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
>>> +      0
>>
>> Please be explicit in docs what possible values are and what they mean.
> 
> Sure. I can print "enabled" or "disabled".

I am not requesting a change in user interface self but instead clear documentation about
what the input/output values mean. Even if the interface changes to "enabled"/"disabled"
I assume the interface will still accept boolean values? Compare to the "sparse_masks"
documentation on how the possible values are explicitly documented.

...

>>> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>>> +                         char *buf, size_t nbytes, loff_t off)
>>> +{
>>> +    struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>>> +    bool value;
>>> +    int ret;
>>> +
>>> +    ret = kstrtobool(buf, &value);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    cpus_read_lock();
>>
>> not traversing the domain list so hotplug lock not needed.
> 
> ok. Sure.
> 
>>
>>> +    mutex_lock(&rdtgroup_mutex);
>>
>> rdtgroup_mutex seems only needed because the message buffer is cleared below, and this is why it
>> is not required in the show()?
> 
> Hmm. I didnt think about that. Do you think it is required?

It is certainly required to be able to call rdt_last_cmd_clear() and since it then
covers mbm_assign_on_mkdir I would prefer symmetry in consistently acquiring
rdtgroup_mutex on both read and write while resctrl is mounted. Note that
there is also other read usage on resctrl mount that is done with
mutex held. Having the mutex acquired consistently will help to keep things
simple.

...

>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>> index cd24d1577e0a..d6435abdde7b 100644
>>> --- a/include/linux/resctrl.h
>>> +++ b/include/linux/resctrl.h
>>> @@ -278,6 +278,7 @@ enum resctrl_schema_fmt {
>>>    *            monitoring events can be configured.
>>>    * @num_mbm_cntrs:    Number of assignable monitoring counters
>>>    * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
>>> + * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?
>>
>> How is "monitor assignment" different from "counter assignment"?
> 
> I should be:
> 
> "Auto enable counter ID assignment on mkdir"

hmmm ... I do not think this is about "Auto enable".
How about something like "Automatic counter assignment during monitor group create via mkdir?"
or "True if counters should automatically be assigned to MBM events of monitor groups
created via mkdir."

Reinette
