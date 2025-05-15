Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FC1F6679
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747347185; cv=fail; b=j4SNtStmZ21J6yzJxq8VbveO0I/+3dLcLzQj6Q0Ett+aaWUzp/YuN2ZhhkjEeTo9Z32EoHAJXYY8BdHryK82BIfCDKVIAGj7F+kbId93572ik92jPQJEskj2LWUR/YWKdmgV7ZbbbxsdQKfMZJk3ve9seS1wtopHS1KxPD/5KJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747347185; c=relaxed/simple;
	bh=ugDZNsd6jY5glTShz0G8vOkOJyUGpgLjI9fkZKHcbU4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vAXcScSX46V4iSiX0FXrkNqaGXhWHVut8f7I/mcu/D4AD6/+UKdaFZtyq3fIXQcSNmBbrzTGj8wF8qP+CedCU2vFvaOP1kk7Oy9eX0StivTKbpESY1mMLWuSc8GBewNutacHU5AiZWmxz3Ns8a4IPn6k+vAi4CpllT3tzx+HIAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CccIJxPS; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CccIJxPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747347184; x=1778883184;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ugDZNsd6jY5glTShz0G8vOkOJyUGpgLjI9fkZKHcbU4=;
  b=CccIJxPSFxtEMFaYyO6pVMy4OCRxWBGFhdbSws2LQM6U1P8B7izdtwVw
   NU++kITs8F5pVu3RPiGj4nUlhS1/BVIgTIi54BaVMNQADDAN3wddSkCdH
   ZmuZxNC2n2u7VwoROOhgwOJJ5VSDVmwAHyDkR5wbY2gf4axaFe98R+GJf
   ufyVHDxw4BZNqTI60rZK5XzhhvWygpsyRRp4FuHAwSDk1rliFWNcooTLY
   q/gZkttL9sARLvc0DH/0p27ygBE8eUk51619asSnaJQqfxQRcNkpWZ44v
   AQ1OTLVPDeAHFurXsT1+jQggdNQeQvlnaXOi9w/45J6PGZOpmxoXhZhLO
   w==;
X-CSE-ConnectionGUID: dNjfMAHbQbqccW9tPfYJ4A==
X-CSE-MsgGUID: MDaeFy9ZRQuf/J4jZHmBJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66856536"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="66856536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:13:02 -0700
X-CSE-ConnectionGUID: JWD1m1vZSZWO0YyJqENoww==
X-CSE-MsgGUID: UpN0pmCTT0eEZKKrqoZObA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="143619357"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:13:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 15:13:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 15:13:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 15:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hojMI2dLlZOOGZBDg83F7qs3Own8rp1iV9QC3tmwjLHIlj35RmDJs5ZB8lxTFlm0odZQtSQztN8Y91ASa7pMg0nxTrsUKAkbT3EvKWSMrxDpNfdv5cWDSj4eMkqeHJ4GhrzMtJYJy7P6dh1XbvckWjpfI7/czRv8KsDU7Hsmq/9ubsgf8b04JibdSVRF312fS7w5NPO7e/+SN8XgCDhEPQVWGWNXQn42ytGPnz7SaGp+Vu6pZsVdn8IC1IQ4Ns8DeGRQtoN+IKESMYD4ojtR9LmAZipdsAZkChX/IlCr2nQFaanVmZF6V+5brK86wtTN38gsv6UoBZvtiOscI18JtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBeW51/HXifZMKSnVw/xghBARAP8eqOhHDScIRkJDX0=;
 b=O4B/ofvFAOe0dkZu4bVlNtq3SzIab5lav6+SP5spQQrEJTgH7ecFC3zOFlCq5KnJhU3JmcGNk9TY/OIkS3nwEyZJ93Eaw/aYMMPDPr9vVLzyFgSrIHNHTP9zmrzvSjW107uLttRQrf/QxFvMOb/wncydpi9hntFiDaixwmFWkSXZq6wY+GRa8OXEuMJorNNbnJSBdASFT6UPoJbISmzAUoh5ndsB8b8JgFcPwtC5/njPafoy516ZyDsxoo5fl12TRjbjB0dEq53Tj0IOQ1ZKy7hfcpaBgKqK3euncSqAuHJLyXkFsEYOz/xTWZzSSYsJxkedzOMBWLmWY8J9rj0G7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 22:12:57 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 22:12:57 +0000
Message-ID: <d5aa62d8-1f15-459c-bbd1-4b6e5775e639@intel.com>
Date: Thu, 15 May 2025 15:12:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/26] x86/cpuid: Introduce centralized CPUID data
Content-Language: en-US
To: "Ahmed S. Darwish" <darwi@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, <x86@kernel.org>,
	<x86-cpuid@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-5-darwi@linutronix.de>
 <c86a3750-7b5c-4ba9-b1fd-1d8dc41c7d72@intel.com> <aCZbNjoOa5hHQAew@lx-t490>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <aCZbNjoOa5hHQAew@lx-t490>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e41ebd-f204-4a28-ed8b-08dd93fda5ae
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MERoVjQ5ZmN5cHgwbVFLU0llWTlPRWpYNG9oaWcwa2JScnlGN2ZPSnViMi9r?=
 =?utf-8?B?bWRIaTdnZEJQemNGN1hiMTVzaHliLzlneVpiNnV2eVdnYUZtZEwyYWJSWm16?=
 =?utf-8?B?NkU3c2RTSFUrbm02Rk9UazRydklIaUVYbzg0ZVFyOEVxU3dIR29ZamwvTHNv?=
 =?utf-8?B?VkprdytMZmd5Y3RKektCU0hMNzVCTHdKSTZ5RjZLalRvNEdySGlJZG5laHBy?=
 =?utf-8?B?WjhOaGRBWDRQSTJYUDVQd2ZZN2VTUk84ek1qUHdlY3paeU1LdEV5SXdrakN0?=
 =?utf-8?B?cnZYZUMwT3BqL2ZBazZ1ak5Lcno3a2Q5Zk5vaUtBNXNHNXl3RVZ6eWFmY3A1?=
 =?utf-8?B?WjFtM2Z1eWdJaFBnRVBVa3BNN1lTOCs1YnlSYzlDTkMvdzFxSk1iUmFVWDJt?=
 =?utf-8?B?MHRaRzhqYmsxUEhyeDhOR3JrRVkxNC85aE8xL3NNUzd1QmZEMktZQlRxZDFV?=
 =?utf-8?B?LytZeU9TdkdNTFJzby9WRVJwNUd1NEN3TWo5a0JHWENxaithcnUzaU1ZR3ZV?=
 =?utf-8?B?b2hBMm93bk5MYkQxSkZVenY0Rm1oam1jZEFHZ1ptQ0JKalF6a3BNL1NtZVJw?=
 =?utf-8?B?RFN5Njh1L3VmT2I0eXlqRHhvbThIb1hTRG50STVONTlnaW1RVFFVcHpQZ2Mw?=
 =?utf-8?B?RDVRcjd4VU9lV3lwMWVZQVJCdTR2VUtsVDdrVGlQbldqMGIyZWUwYlBKQms1?=
 =?utf-8?B?VTMxVVExRExPSnJLYkxuYlhNNVpuSTRiQkc5L2FlU1JJMVRSWnFUWk5mc1Js?=
 =?utf-8?B?RDNjd3A3V2VSN0lyQXJGMDBIbkltT0dLam5zSE1lVWlrd1o1R3BkaEhXc3Ir?=
 =?utf-8?B?RnIvVDZNUXd2a0Z6VVhvOXlYd1N1TmVTRlpSUjVzanBqejhQZFBvalQrWkRy?=
 =?utf-8?B?U2JrNVRXUHRMWCtaVUQ0SUFsRjg4QlJ6QldJaUptQk1jRUw0VWE1b3NtcmdM?=
 =?utf-8?B?aEJ1aDRuQk1IR3p4WGs0eURjNEpmRzEvUndqM0ZVaElWcThNOHlDbXM1UHVM?=
 =?utf-8?B?MVZsQUhtVFExTDVTenFYLzd3QnpuY3A5UTREZXpvT0w2cmNqNncxSVRKTlhx?=
 =?utf-8?B?em9MSW13eklLQ3NLWFNyU29TNmlsdVF2V0MrdlB4akI3Q0tyajZ2RGN3VUNG?=
 =?utf-8?B?emVocG9zL1NLajZ2a3hmbzY2VWFFcHVtZXRCOFI3M2N3L0lMWGkvUG0wUCtT?=
 =?utf-8?B?aEd4WkRlN0ZDTVBQMytZWFlMMk1Yc2xYampYdkt5TnlZY1A2WlcwUytmQUFD?=
 =?utf-8?B?Sk9sVlFjRkFxSTZTUEVzZWhacUx2RVFSWmd6MzZha1hZK2xJWG1FVUZ4Ny8r?=
 =?utf-8?B?QmZGMk1TYmdWNFVPWlZiMmp5eXROMWFLYUV6cmc5SjQ0RjNiWEV3U01zdERh?=
 =?utf-8?B?MXhiNlI4azlWdXU1OThQdEJtWFh1QXI4NUZQQjdBLzllcEZncjRpYXdZLzBM?=
 =?utf-8?B?VlN6OGZQQnJUajM2cjZyOHJKOHdMQlhTQXF6aDNKSFRyM3pxWDFRcjJPSmZO?=
 =?utf-8?B?d0FkSGNJUE5RS2pheFdZT1RjcHM5MWhOY0VqTkdBZEZVT0lKR3ZVbmlmdVVS?=
 =?utf-8?B?TThxa09QVFQrNVh6YlB4clgvWGg1Z2EwVVVCc3QxMEhYdm1WNHVSRGRJemE2?=
 =?utf-8?B?dG9yY2RtWWJaNXc0NmFPUmIxWEVmem81WlJnVi9abU9qMDhZd0l1NTNiYWRT?=
 =?utf-8?B?cEplbk5rTy9wd0JwN0JXQ3Ywc2QvWFoxV1F6bysrRmcrWUs1bHFkS1ZySkF5?=
 =?utf-8?B?ZGtjSGN4aTd1NTU0UnRoQ3gwN2pyT292bFZjOWl4UkhpU3RwaExsRmNMOGIy?=
 =?utf-8?B?N3dOL2Y2SkoyMkQwdnpTbUJabm9DK2hWU0s3UjljM3VnQmtMNFlmdHlkVC90?=
 =?utf-8?B?K2dLVWhKSlA0UGVSTStMY0NTRWlmL0s2UXhVeEllUVlmMFVWRmNDY0hZNFhN?=
 =?utf-8?Q?NcEXcliI5XA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RndxL01Pc0xGYjVDTG5wYlpuNUNJRDdnNjlwLzAzY2dvazlvamNEdSttT0Fk?=
 =?utf-8?B?eUlhSmFEQTZTY1AvVXJsSjFRaFNWckczWkxwN1p1NjRwK2c4a0l1K01Fdzlt?=
 =?utf-8?B?VFgxR3JUUEwxT3h3MUlZQXJORmF3T013SkF1V3ZldnZLeXJWSm5HZ2MrM2lS?=
 =?utf-8?B?MWRaSFR2anFEcitBRk1FNUEyVlFGLy9FVGFpZDF4djlHNnp6dkN5eTE1T3VO?=
 =?utf-8?B?WXEwdUl5MlBMQndoU0NjY0hJUFlFTlRQYWVUZjY4YkdsTmVMQkd2cEdJdVMr?=
 =?utf-8?B?VjFuM25haUlEN2MyOG8rMG1FcEM5MzNQbWJrNk15a25NL0kvRVFITFNSUTAz?=
 =?utf-8?B?Zjk4RlNQVnQ1K0dHRTBKZ2luays1TlFubzdyaWhNNm1GR0s2aGxWZm8yeE5Z?=
 =?utf-8?B?L3RkR1JwOXM3dUp1NmhVME9CS3pKTkdpTDV6Q0huamtxQ1ZabDlXTExWdFRy?=
 =?utf-8?B?TzZ6YnpCclhvVTRaV3h1aTExQ0p6MUhtVHhFWENsT01hVHFQa0QzL3FBYjdj?=
 =?utf-8?B?L2x2UXJTY0o2N3NsUk03YUUrQnZnMkw2WDBlNERJN1c0QW10eW94SENVcXpu?=
 =?utf-8?B?Yjl0L1R4bjRZLzA0NzFFMDdXeWtzYktLUDFDeDBPZUFHN2dTSUR3Wm1IaVhH?=
 =?utf-8?B?M3lOZUhSRnJpd3lEQWVqK1MzNHBrOW1WM1VORVAySCtQRGxwelFHSDZHTGhO?=
 =?utf-8?B?c2RPMDhoRDQwM0FWMVVqNk8vWlh6Y1RDdmVwK084VVpja3hrMXRHU3k3WEI1?=
 =?utf-8?B?L1E1Q3hGajAzVEh2UWdIaTZGN2x2S2kwdkJMdzh2TTBFRjBBNkdJVEp6N2VV?=
 =?utf-8?B?RVR0UDUvVHJpRGNLaFBTbW04ZnRieGtQU3FIMzh1dkJSckZCaExDN3F0aTR2?=
 =?utf-8?B?TEc3b3BrRTF6T2MyUlp2amY1OXZMNDZYUFJ3dE9uazVIaTVaYXcwWnUxZWJV?=
 =?utf-8?B?VzIxV0VNSTNSMVlJSFdhZ3Q2K0FRNStSczdpbXU5QUljbURobUczZ0xJTGNY?=
 =?utf-8?B?R0IzQVpSRGUrZ3FsTGprVUpyaTB4VUtGVmc5S1NSd1lLZUExdGozekVOWXR1?=
 =?utf-8?B?bFlZL3hTbnVhNnRJdWNrV2Zwbmp0RTVrNTIwNUJJa1lqazYzWWRTMUYxd2c5?=
 =?utf-8?B?S0hRbEFFM0J4RTYrOXh4YWhCZVV5c1cveERkM3hOY3pwTWxVQ0tOMTJuS1Q5?=
 =?utf-8?B?WFhqcktVM3pFNUpoSzZDY2N4ZXcwNFZ5dm1PeE5SMHI3T2VvaVQ4S1hObWho?=
 =?utf-8?B?andwTEtsQUlNaDZwb1ZocW5MZkVHa0hvTzVEL3BEczVia1ZRLzhZZ1Y0MWI3?=
 =?utf-8?B?NGhVMnh5ck1mWVZDNXZKbnlvb05ORDJWZGtjTzZ4cEtMSXN4T2t2SGcwT1h2?=
 =?utf-8?B?YTBCSi9yLzI5OHNpWHVsTnJ3TlBzcXlBSklOU0FsYmJXdk1ValFkUGhNb2Rx?=
 =?utf-8?B?d0VVZjFIZ1IzeUE2Zngzb0FBendpTVhheDhGbHluS01ES2JqKzlmUTQ1U1Yy?=
 =?utf-8?B?SjhRcnQ4c0c4Ui9YNTdjWnc5bWU3eml0OTJqcVBlTWNLWTlDR0ZMaS9XS2Yx?=
 =?utf-8?B?eUJidlRPK2lNNWlwVEIzN1MxUktSNUlHYkVLZUdsdWFVNXorbmJZK2VoemVp?=
 =?utf-8?B?NHlrU3hRdkFPZUhTcE1mNEkyODVER01KWTNVVFUrZVJISkk2cWRZNFZyZlZk?=
 =?utf-8?B?S1lFeUVpRFF3dUhRUEJvYVFUMkZkQVlmZVpraUlQK3A3U2pTWktTR2QzLzJ1?=
 =?utf-8?B?MEowS0pVNTQ1VjZqeGp4M0ZBbzhtaEZqWW1FdSs4SUN1ODVUbHBSY21JZjFM?=
 =?utf-8?B?Z2dodDU5U3VrVzk5alVDa3lJM3UwSW5wWU1NR1lUNGUwWjZLbk9Qc2lhYXNN?=
 =?utf-8?B?S3EvUWkwakpRbFdZOE9qdjIvUVg3NzdTZFpFM2NONlVaS0pVTXhiVW1xT0Jk?=
 =?utf-8?B?U3ZsditKNGFjTnRYRFlNMkJIZHJtNzMxOXVmd1BYOWxha3NaUFFrcm4rbnha?=
 =?utf-8?B?RDFxeWxOaitWeXhhVEdWTVhFSjdCa2kzNUgxeEhYTThHekNGYmRSYndDQnN3?=
 =?utf-8?B?WEhvUWVyQ1FsQzZ6eE0zcUs4WW8yWFRBSjFhKzRKT25ZaDJIWElRKzI3RVZ3?=
 =?utf-8?Q?SNmS1VwD63qZ2I1MaA9uLGt9w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e41ebd-f204-4a28-ed8b-08dd93fda5ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:12:57.4617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyAKmfUcMCGTDEnX0SyB46+yxvcBKYJXXaCYPER8zd+HhA783Nwfow+2KXhJzIHDviu4UYlxonY2o75ESSVwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
X-OriginatorOrg: intel.com

On 5/15/2025 2:23 PM, Ahmed S. Darwish wrote:
> On Tue, 13 May 2025, Sohil Mehta wrote:
>>
>> I am finding the structure names a bit confusing. Can we make it
>> slightly more descriptive since they are directly used in common code?
>>
>> How about struct leaf_0xN_sl_M or struct leaf_0xN_subl_M?
>>
>> The actual struct names would be:
>> leaf_0x1_sl_0 or leaf_0x1_subl_0
>> leaf_0x4_sl_0 or leaf_0x4_subl_0
>>
> 
> The problem is that at the call sites, even with abbreviated variable
> names, the lines are already wide.  Adding "sl_" makes things worse.
> 
> For example, at patch 23/26 ("x86/cacheinfo: Use scanned
> CPUID(0x80000005) and CPUID(0x80000006)"), we have:
> 
> 	const struct leaf_0x80000005_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
> 	const struct leaf_0x80000006_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);
> 
> Making that even wider with an "sl_":
> 
> 	const struct leaf_0x80000005_sl_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
> 	const struct leaf_0x80000006_sl_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);
> 
> or "subl_":
> 
> 	const struct leaf_0x80000005_subl_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
> 	const struct leaf_0x80000006_subl_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);
> 
> makes everything overly verbose, without IMHO much benefit.
> 

It does make it more verbose but things can get harder to read once the
subleaf numbers start going higher. Example (actual cpuid values):

leaf_0x4_3
leaf_0x10_1
leaf_0xd_11
leaf_0x1d_1

I don't have a better alternative, so I'll leave it up to you.

> I'll sleep over this a bit before sending v2.
> 

Another thing to ponder over would be the combination of hexadecimal and
decimal in the 0xN_M naming scheme. The "cpuid" tool uses hex for
printing the subleaf, but the Intel spec describes CPUID using decimals.

Leaving it as decimal is probably fine.

Sohil
