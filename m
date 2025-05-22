Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09F02C0321;
	Thu, 22 May 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955184; cv=fail; b=DKShl1xuD1u/xKtgVv5KQ8rg7fRYKoHWjZD8M7lic/EdIlvT1x2BCUdHeIJ26A6VtPfpHPVd3ti7cWy/qUw5mVf1aeC1SCSu0hf4nlKQUj4ROErsajZ+zJTDAskKt4e2HwLziIElLZJvkvtHBbY8RHFpRPbR6YAEPsrVppJfmeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955184; c=relaxed/simple;
	bh=suDbqmSvzGx0s6pq19eLeKrEghmWAmxLexT7jRT8JV4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=osFwaEsfT3b64P4cD0PkY1DoJHnIuWiX0kyur3Q2pzSJE5wsdyqsT9JnQmVkv4MZ4eTvzoM/nadQek9GuGImyGus7bVdprjdlflnRhd8S3wchqIqbX2HSK4p17mt5dPPeMjnp+AU4QfMKl5yEOqp2/7/zCC5wz2Niq0PhzJV8v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQBfk3at; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQBfk3at"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747955182; x=1779491182;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=suDbqmSvzGx0s6pq19eLeKrEghmWAmxLexT7jRT8JV4=;
  b=iQBfk3atQlr45rs/bnehYJRHYM1/sRSJNancI+sAMWycS4Ey1mbZkJ/O
   7jgn1yGsflqGcqhj4Dl6MbhXYyTCbBmHw4h3IQ0p3PEMc92t9BLMPpr1i
   JaNfinLK8DuNlwX15Rcxzl4nr4nNGPlhqSCAwbslCSSiF2gWBAyuoriBY
   Hwkj4Y5rTh37czDuvKA0nTRICNegYwK4qO/owMog7115IKZ/ydOFEkagi
   P25CddWzcOmk3oWA7t7HJZof0JhQqdhuDQM3RE53oTt3JA0QddTnOqJMe
   OxhqHwanWyW0A1AredTX5jTJZG+Je2ltUPGY6A5xMt7XAL4x/8elqwPUF
   g==;
X-CSE-ConnectionGUID: Ez11EXvNRpyQeeNaEzZwqA==
X-CSE-MsgGUID: QYdR4mvgQJSWZOCrUCzbXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50057573"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="50057573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:06:21 -0700
X-CSE-ConnectionGUID: 1STKuyTrQ62oSV0l7kpRsA==
X-CSE-MsgGUID: fOI9HMkAQk6mTCVMKluhlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="177951943"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:06:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 16:06:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 16:06:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 16:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PK360BiXA4YsJNjpp8thhzaUu1oxPC2NZ3SUz6msHDIOjaqa7vGThRF22qsrsTk1uUBAAvQLdKaUDKrqlt8UWY4L7QxvHa3SilVytMYh962bCRfhLjm6ZJtE+pvdRrO4n7eru7ybtGjpKVb/9EtKKq4GA96Uvaj+c8gvKoXj9CNjL4beqTfS9ImViuMxqLoNPGmncQuKlAkHl+toHQsn74Ku98IX/xXFVzW5W+MXukeJ82xQdj2WoZS8q5iuitDiVgEYJYtTozzLbjAnVvIt+slTRhMQLmVR6lFuazhbRxJwcPJUFnp5vorbL8qy7IWak7uxeyCu31PUxY7YU83L4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gh1IBaEQmNI6SxDnvsKslcqU6AStT1MCrzxiO6S9Yw=;
 b=SRM0H9ZipR5WXO7N7/maSM2O8UUh+GEt/qSvtvw8YgNrYL+4L2uibFmgLKDZwLAwJLZlODOHSFc4tY04cSxfe3gRndnRJujxRm9TO5CYocuNYqceNZfGkfzuvoJ0dIFAKd3feyowcsT7LqbFdSy7sOw1L3mCij77Xc0FKB5O383U821HCsUs1V8X1PVDCTHHmURAc+ZJPY+o6VWMnnwk4G3PNAF59Z5XLvXYaaRSdUp3B9XvKHnUFYvej9FQelow0V3gUPYtSwVBpI+9joj3lZVWQpNXjZWsrOmBDldxLLt/90G7YLM/t3RVRYbTE8727eeKf8IP9UWEYLFL4sGmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 23:06:02 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 23:06:02 +0000
Message-ID: <d4bf97a2-15ae-4093-bdf9-63c78d07eb4a@intel.com>
Date: Thu, 22 May 2025 16:05:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 16/27] x86/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <619c9cbb6b1525a2d4a46a042384e6771800d61c.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <619c9cbb6b1525a2d4a46a042384e6771800d61c.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e73e264-d9ca-43f1-c82b-08dd998538ff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZhMFM2Q1ZmRWxIQXRaZ08wOEdKSkJkSXVoZmtGcmhnOFFTOHZuOHZiZ1p4?=
 =?utf-8?B?Zll2Vko2NmoyOEE1U2tZUG5aY01YN2I5YXp0dzB4UDVPODJCM0pTUmRlV0w4?=
 =?utf-8?B?VEhOcHg2cEJ2dkU1QmwwOEw4MG8wOW1RSTA3UVo1NVdhN3VDV2x5RHhkYVBz?=
 =?utf-8?B?MEFjK0NiOEZWM2hKMlp1TkVnUEEwYzJSZW9IbEo4cnNNSzM0Y3QwNGJzd1k3?=
 =?utf-8?B?WjJnRkJVWWNTSEh6dGRpc1hJMExMV2JVcGpsSE15SDVqcXo1WkJaT2FVOGRM?=
 =?utf-8?B?ZkVNTXVmd2tSR0RrU1RjWkcxdWgzOFZIcFR0YlFVdTNmSU1HcXFPS0hxaVln?=
 =?utf-8?B?eHlCbHZTRTVpM3RoTXBQMGt6N3NaUVdHNXVkVEExVlY5K3l6WHNkZHVONzhF?=
 =?utf-8?B?Yjk1ZlhEcWFNRlJkVUpKU0ZNT1RXTHZuRlNBUEx3bGhvTFprcFUvVzFFN3hw?=
 =?utf-8?B?WkM4dEtsbi9jalQyS3kzZG1rcW5jM3p3UFRYcGg4ejBiRElHcFZ2Yk9ESndU?=
 =?utf-8?B?aURSWFQ2ZkIvalNQd0pxakdHNmhIT0o3SFFnNWphcGxRM1lscjZDK2FrM1Qw?=
 =?utf-8?B?R1lBSGVZdWpodFVFa3BVZllrbkZabFo4N1FYRHVjS1JqNEF0NlpUZ1RVeXRz?=
 =?utf-8?B?QmRZOW80bGdicGVEbU14RzlOdWQ5VHBFWStkTUxsWFVvYlFiV2tDdFRJcERx?=
 =?utf-8?B?M2ZUMWJHZXo5N1ZBMVRSc1lnKzlDMnd1aDBFRzBnKzdBa2thdjY0TkZkNGFm?=
 =?utf-8?B?Skk2d1ZqQ0gwQkYydFRtcGl4UTE3VDNaeE9PTFIvaVQxSzQrVGZlSTBXNXk3?=
 =?utf-8?B?azd5ZlBSTkhNVHhraDJ0MWdCYTRZb0xsYzFUNFdVUElUZFViR3JPaTdHRTNt?=
 =?utf-8?B?Sm4vd3poR0NDVVhDUVR0MjdpTFBWbENDaFIvbHl0YlZGOUhNRWYyaENJQVZR?=
 =?utf-8?B?NGMxZkczT0ZmeHNXMFlFQUNYdUZzNWVRdHFDRjQ3Z2J5SjQwbmZkVVpEQWJq?=
 =?utf-8?B?M2xQeHlvUEtQbGtKR3RxR282RXVyOWlSbHZ5cWlNSlJYVUZZaytpbGFhbWh2?=
 =?utf-8?B?UnZHT0R1SmdQczN3Nnd0YWRDOEp2bThqME1MYTh5NTA1aWlJM3ZXbSt5VnZr?=
 =?utf-8?B?ZzBxQnE0THhaR0dDcWsrZ0RETnRodzkxR0NRMTl1enNUVE1DdFBvcERnVHpW?=
 =?utf-8?B?NjVja3k4QzR1N3VBaXd3b0JpZXZJWU5OUENUL1lpWGM5Z1gvQnlFeGVBU0RC?=
 =?utf-8?B?MWZPdUFucmZzUHNPQUhDL3hCa3JpR2gwRmw3QWNjZnlzSUk0c1ZZdmxZbEpF?=
 =?utf-8?B?RmM5Z0E1TWFHNFJTMjFOdWM1YVY0UGxxTFc2YXNpWStnQ2RINXBlUFVtSk51?=
 =?utf-8?B?bDNPWHhzQzFNbVZaY1h4M1BjODlvd3krdm8xNnZuWjIzMHFJTDZoTWw4UUo4?=
 =?utf-8?B?VDlZWW50bXppTzJBSyswejgwVXlXN2wrYmxRTEhXNFdmTldkclRmeUlVeUtk?=
 =?utf-8?B?SXV4M3hlWFU0TXdRTkJsS3RFUUsvWktTa0xsMERicDIzNEtZTmI5VkZrVTJk?=
 =?utf-8?B?SUhLQXNyRksxTW9aWVJSZ3lSeitnRy9BRHd3dEFxMGQvNEZlRGlsRE8vNDZR?=
 =?utf-8?B?SUpmQW1oNkVDL0NJYTZiUlpkeGxidnZXb0ZPZENCb0E4ODBHa3BNaUliaUx2?=
 =?utf-8?B?T2ZqWGZoN1VwYWYzZHJMa2lFT2t2eUNQbXpxbHEzTWdiK0VvdFN2M0FlSkM3?=
 =?utf-8?B?S2NWeFBiZlYyMEJtZXJrc1RGdnYrdE5IcEJZdlZLNWVjWi95bWU2dW9xL1Yv?=
 =?utf-8?B?UmhEQnBXVjNFMFFSWXhUYk9RL2k5Mk9ZV2h5NWxaaFNnVHY2KzlJQUlYd0JX?=
 =?utf-8?B?M213aXlQUTVhSGFrOFdkRXI5OE9Ca0x0K0YyQ2NKOHNweEs3aEZCRTdRYm5j?=
 =?utf-8?Q?nm+pPtmYUJU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlh6dXUySVZWblFvWHM1ZFhWZmg1QlAvSEhCUEthUjNPV2treXFPaHBtWnRi?=
 =?utf-8?B?TEFXemF3eWZUSk4rOWdmQmRENmYyR3pBaklTcGVVUFBMQ2hYeExsT3BYYWwr?=
 =?utf-8?B?SjFQYTAxU0pnZ1B1OHBpY2pmTmNpMUoxYk1BSGhQMmhoTjlvbTdmMFdSYStR?=
 =?utf-8?B?U0tDVS9hcE9MaWE4bC9GdEtSams2WElMcEtvdVJkdEpPSy9sUWJVdnZRREFw?=
 =?utf-8?B?eDIwSktWUmhUbmRtL0tWN00rU0x0SDNySUZpeWlWbHZPMU56SHFiMmtNNGto?=
 =?utf-8?B?ZXpTSWwwT0UwN2tTc0g3RkEzdlY0WDFvZTljbjQxM0JFTjJIMEZuNUxnYzBT?=
 =?utf-8?B?V0QrYUtrdktjZWhRTkM0cHgvYWlHZ3lWMitBVWZNNkZWdU1wUEkwUkwyWDVw?=
 =?utf-8?B?amVSbW44NzlUdXZTTzBhUnhJTGhVTUNOS2tkblB4QTVGa25lMEdNT0lQUWQ3?=
 =?utf-8?B?U0NyY2xnSWFrYkdaZ2FjVmwzcVFEVDB3SWFnOHFmY2Yva0cwQ1FSclAvOWx0?=
 =?utf-8?B?SXBvSVJGYk9HT3NQMXFONzJ4M2I1b0dLTkNudFRkUTZCN2d1eU93ZzU1cmVB?=
 =?utf-8?B?a0lXV3N5QWNRV1ZmSEwxbk9ySG1RNHk1SlNTaHgrSUNBd0pIMGFwcmlJK0pU?=
 =?utf-8?B?REJuN2R1V01uckZ5S2Vxc0JKSStCaGtRcGg1NkowUFZub01ub1JLa1VJd2xa?=
 =?utf-8?B?TlNqbmtEaXYzdmIwdm80MmMydnFsb3Fjb0pFeFhMNHN3VWxxOXhLd3JUclQ3?=
 =?utf-8?B?eDZkUE1Ja1BLU2RQeENCQlBvY0dHV3BjNHBjV3dNYThjTjVvWVZWenE4R2ht?=
 =?utf-8?B?VGQ2WGZVcWRiTVVKVDdQcHRaTUNpdlBmWHhGZ0JpbVFKM25hY1hBbGplY1pW?=
 =?utf-8?B?TXJkOUl1TDNyZGlCMmRFanZaQUtaOFhPTllFWnhFb2JKUkdLdVVYR2tYQ2Ry?=
 =?utf-8?B?MGpPWXNhcndPMUdKbFBvSHpjalZrbFdMWkJVY0ExQzRJUm5rOEd4ZWtBcGkz?=
 =?utf-8?B?YjBSdXkvckVsL1lyU2tncDRPL3VEL29kSGJGc0VCajZJSXNNUzRlUnhjRHZy?=
 =?utf-8?B?dG8rakVuYlJocldhUXRWT0NRYUI5UVB2dmY3R284UGUwL2Nnb0dXUGJGYVNp?=
 =?utf-8?B?ZFFhNjNDSWNqemNFQ3hMQjlKMXorTEJTMnpoT2d1SHZHK2lPT3RWY3YvUXlJ?=
 =?utf-8?B?azR0dFVUbFQrdWdaZ0xtZUxqSHQvNHJseTY4Z29scS9ncUV0TExaUXh6WlJT?=
 =?utf-8?B?bnlEUW16R2ZrcUd0TEdkcTc2OXVkczdSUUR3b3YvM2ZJcWk1b0tER0E0TkFN?=
 =?utf-8?B?aE9xY1E3aVorcGxvdkRzRzdPQnZOUnF6UWhtd1RwSStkVW9pTmdXVVdqaGpu?=
 =?utf-8?B?NVNBRDU4TmdReDBzT2tLaVN1VGpjNVJ2R1ZGeDFOVXpzeVZKb1RvaFdPQk8y?=
 =?utf-8?B?aTdpMVhVSE5VZ1JYcTY3YnI1ZFdJREQ1QzNQMGVxL2dBWWdKZTU0UUpPNmEx?=
 =?utf-8?B?NEFRcE9vS2lkak12eVZMMmN1VDlMZit6SVhYTUhpUCtZcGUyTCtZQTRYcXFu?=
 =?utf-8?B?Y3RKU2JwVG9HQnc4bDR2NGs0SHJsZjFTMVZXY0V1SWNLTm11andDRktRaTdz?=
 =?utf-8?B?SnRFQ3JOeDJ0S1U5M095akwwUnpjWjZ0V0h2UDJPUGNJKzE0bDJtck1TSS9i?=
 =?utf-8?B?SUIzeUpNK3NFQU1Dd0N4enBlOFRtMlZtbjNyODQ0N1BETnpZSFE1NGZPa21J?=
 =?utf-8?B?VmVmdUxzbWZmNjkyVC9xaFY3ZE9PK1J5djA2OHZjNWFKUmFCQlV4YnF1S3hq?=
 =?utf-8?B?MHk0dDY0eUhSK3UwYVp4ZTFXV0IxVEJkWHJIamNLd3FsRGN5K3ZIVy9QQlNN?=
 =?utf-8?B?eDVnQ1EzSGc2amd0ZVY5aXVXTUpZYXc0MjRXUDdPK1V3NFNYUkZmS0xOZDRu?=
 =?utf-8?B?VFFQb0ExZlg1aGx6TkR1Ny9jQWhtT0UvVHY5RHJKWVViYjF2akRHQi9oelBs?=
 =?utf-8?B?Y1loRDFYOENnR3JUbUhydmxqeFhSMERvb2FIZmxMME5tSW1JcG1EVHJZL3Bu?=
 =?utf-8?B?elIvcFRQVjlIZytQbTlOTEJpYUw1MzBIcEZuR0Z4Zll2VHVMWkhUVU4yZlFL?=
 =?utf-8?B?bGRueW1jUEJJT0NLMVFzSkxETnpSY1J6dkhVcEUyelJnRFh0cTFrcTcrODha?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e73e264-d9ca-43f1-c82b-08dd998538ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 23:06:02.4461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBp5WfCCOSE6XPX1G/pV5iDhMqJpcwewFwQkYksmgDrCoS4Sx6ySkVUsAp/6VqW6OXiPjcyEsWAWVZA2px5xoWotn6ABXfzvu9MdJC0k6Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> The mbm_cntr_assign mode requires a cntr_id to read event data. The

cntr_id -> "counter ID"

> cntr_id is retrieved via mbm_cntr_get, which takes a struct rdtgroup as

cntr_id -> "counter ID"

mbm_cntr_get -> mbm_cntr_get()

> a parameter.
> 
> Passing the full rdtgroup also provides access to closid and rmid, both of

closid -> CLOSID
rmid -> RMID

> which are necessary to read monitoring events.
> 
> Refactor the code to pass the entire struct rdtgroup instead of individual

"the entire" -> "a pointer to"

> members in preparation for this requirement.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
Patch looks good.

Reinette

