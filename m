Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6754289379
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653784; cv=fail; b=FeoBhdFSiXhcSMGf29PAM//dcJK6Sd11QJMFYIsq7CkgWIglA0m9vhZI7sKc/1JiCaZev1uEN9aPYMUPV3qbY5TJIengKic4rttDWKRlNAH/zH7bASsPisWWnAt43ul0XP50y3MZgOMznESuUQLMPOXo6aTmHEONma3MYzNVMK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653784; c=relaxed/simple;
	bh=oL+hcv1zLUl/xwroaTnhVREszn2iFHptBYdFb6b4zaI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LkOsXsSZ0UJFmUXmoXTsZo/O2jxo7CO1dZ1A7wiSo5/O2iWgAhSg3KCd3/S6w0NpNdawFkqabbfssUQPjLL36g+fc2zL2DBQ0WRIXFx1hzkbhyrJefS1Yb+XB/5uIhWeI7FGYJY8hoD19nwLS+lptv2p207tYfJ2kuoVKTwaXvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeVBAa68; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeVBAa68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744653783; x=1776189783;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oL+hcv1zLUl/xwroaTnhVREszn2iFHptBYdFb6b4zaI=;
  b=PeVBAa68K0sxvrdzDbWOL062LxKZSybtwSJDNejYFBauhJZSKAqSbJe8
   iDQOI4WT30rFjYTDhtB85yPVOSTH0olssjUDeJY3ensXnKsDteN5Vixv/
   uhYSrpy62Bg3bJma9d+dpuf24BLwhfc5fU5siZmr3RZ41cKDfjnn2ezWF
   cjipsxWl0uIprp/6NDJt2dQ7MFC3+nhIDZkIzBO4m51B6TCGc8ojgJQ1z
   Kr5PcFCT3T0a/uDlQP37rtqMsTCBJ/2SEst/nWTD/28uoy+o072ov/rjG
   80d3tO/puP7jMpzpZOk9AjCQ/TS/jbyJC8bfnp2bXF0gkmAleCgo+Z91P
   A==;
X-CSE-ConnectionGUID: 8NDDCKfRRPab24bAb6Jf4Q==
X-CSE-MsgGUID: MLslwfZ3TlOG4UeD/aMj4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71526745"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="71526745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:03:01 -0700
X-CSE-ConnectionGUID: Pc08nbQZSGKfBPSun+zv+g==
X-CSE-MsgGUID: cB43v3h2TOWa6Bn5duK00g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="133991399"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 11:02:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 11:02:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 11:02:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 11:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+1AByBUVkh4R9oubhOvPp+IAoWBRlRDYNsEII7PCsjpZrBD2fzzNnk6MGbOZU82b4ub/Bs+sgRa8WTwhyntpu319ZNQW3SVSGYy1DxqMHgppVgXKHMPJiMsQBUMrzxGcGGv1WnvilGFNb70iwA71Ib4zYyPdM7cX3Y3onpnNYSZqZDxWB14xUCs8OQlDjmgM6W4e2i9aAHgT0VEUYgA+cnLEGFlBffWWS5zE7W1W1zM9pV+cOvZUvLzo1gMH/mSoPQTLSO3zClUhqAPBFXrhszEib9TlWU8cH6ghSW0T482zdEa3YeeMlDiuHQckBrSEuI+ja/UbJvFWthpTjpCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCptnEK6S+L4OXlBFYu2uSYM+zCGEdjNXE0NHH504kE=;
 b=wc9Ro4X2zkHRPYhWeT4YJiTZZ/Huq0M6OwddCOEJylWhcM7vMipO36BjRanGvwC/xs+qUbrzwV+6zNEBFFNeb9poUy2w9sRubrO3Occvqg+A9fItdEPIinZsSeUDBbyfBlIuvkYJChRamkvheoH/pPWqbdeIOb1h8u5VyN8pmyBCItBxrd/3X+FocDttGGyV+YD59ngsMabkch3Kf4CfXTA+cRcL2hX8YTphq4PTWj48JBdLVVjno7sVE9Kxxe2yNIfp5vKZIgeayPTdlcrm3HULF4NMIlhvONGn8v0cBraGT9QKaUYqVAwKIL7YogS0SpqI925cwkt5fIm2Zx43Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Mon, 14 Apr 2025 18:02:53 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:02:53 +0000
Message-ID: <a218888a-fe10-48c4-a61d-6f1a93da5a06@intel.com>
Date: Mon, 14 Apr 2025 11:02:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
To: Sohil Mehta <sohil.mehta@intel.com>, Dave Hansen <dave.hansen@intel.com>,
	Ingo Molnar <mingo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com> <Z_onl1QbH9L1-8dq@gmail.com>
 <Z_zGCCNE_Qt3IlMZ@gmail.com> <eb33f181-a89f-47a9-ad98-f5a079920950@intel.com>
 <d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com>
 <10032664-c16e-4599-ae10-3d2b1aef0265@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <10032664-c16e-4599-ae10-3d2b1aef0265@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DM6PR11MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: b81f453c-46f5-415d-0db2-08dd7b7e93d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFdzUnJrdkhCQXlvU0M4UlVWVWlBWTAvcHQ1K1pER1dFQ1ZSenJ5TTFIci9O?=
 =?utf-8?B?UkdOMmZlMUsxOXRRVEVERzVSeEN6UWdRNHZZdmVsQ1VOV2xtbU05RC94aGly?=
 =?utf-8?B?ajFNVEtqbVFaV1JwdGptR3ZpWENWTlJweExwS3lydEFreTU1NFJnZVhheGtF?=
 =?utf-8?B?UFVjRmk0RkJISDFBRVNqK1l6a3gvOXN1NlUrb3lvYTVZWUE2U3dDdGdGSDhO?=
 =?utf-8?B?RlEybXRSQndDejJiTk5tR3VtWTdCZ2FkOEYzM3RPdDNlU1gybHMwU0RTM1Y3?=
 =?utf-8?B?cC9xc1NXK2hTOEJQOTRKRU44VWNUc1F1QUk2QXFDeVcybkRsdnJiUUgwUzl1?=
 =?utf-8?B?MkdNLytEUmJ1S2NPaE9xV29KRG9nangvWWtvT2g1QWNxUElzL2xwajRBUlhW?=
 =?utf-8?B?RHpWSTU1eU1UbkU4cEFLVEJ0MEZBeGExRlFzcVBRdlZuNzNwSzhoQ0xiMzBF?=
 =?utf-8?B?VENDZ1luY25FbUs3bktJVTcwL0tJcytyYmNLTzIyTUk4U1hGeXFqS3JyQjNJ?=
 =?utf-8?B?cTlDSlROOTNOQkVCT1hNRHVLN2pVL2trdDIyUDlyU3hvaFVpU1V2dG9iYTUx?=
 =?utf-8?B?ditLbG9KR0FNOW1CeTBTRjBmVW9vcVdsMHMxdWIvZnNCYlVYMDBWVXhVQWRR?=
 =?utf-8?B?T2RjQ2crQUZJcGRnYytkWnpiTHd6elc2cGNwbjFiUEViZ0VGeERhajZrYXZM?=
 =?utf-8?B?Y1ZxYlJqNVZPUzN1NjNoWURUWUdhMjFuRFRsbWpJN2pab0FqdldYcmNFS1A1?=
 =?utf-8?B?Mmw4MXlXZGlDZWhBZW9KVnpLMVRQeDczM3ZodExrNmpITitNaGUvdkMrSGZz?=
 =?utf-8?B?cHZMVlpBM2ljQWsxZmVqY1d6YWF6SWN2aEM5WjNoZ2NsektoSS9JbmJLUU1U?=
 =?utf-8?B?U3M2T3FpNzRxdjl6Rkx4OENDV3pBamhMV3ZFblhKMmd1WTE1bk9WUlFiWm1O?=
 =?utf-8?B?bWRmTUdPc28yNVlTNDdDRUFYd1hzR0lMNUhETjVtWDZjY1BQZTZkSDdlQi9v?=
 =?utf-8?B?Rnl5alNMU3NNQlQ0SjJYYVBYYUtQRjNwU1FoRHNTN0pzMFB2clJhWHdld2NK?=
 =?utf-8?B?RWtnK3Fxd2hrTVNhL3E5cDd5N25OaWN1dWhPSk5UMmh0bHlrSnlEVnFRbEk1?=
 =?utf-8?B?bFhKbFo2cm12Vm8xd3FqT21RRW5BNHR4NDNvSFJKVUUwL1ErWGttZFdGWTZo?=
 =?utf-8?B?Q09yNU5RUzJMaEltRjdxRVVDQ2xEUW91cWtwcWUwYksydVUyaU1pYzlrbGhz?=
 =?utf-8?B?MXV4TUdsTFE2RGs2Q1A3bDVqbElYZ0xVOVh2RklXT2s2OVVNSDQ3OG1rMEJM?=
 =?utf-8?B?cVdSRzI5bndPZno2MGdoT0pHREpZcmFQeEpTZCt4UGh6bUQrMVBiL1Y0U0lG?=
 =?utf-8?B?TDF2WDhVT3Z4c1BTY2xSNlBKRW44VzRtZ2RXSjdoaDU4S2lya0Z3bitGWWVq?=
 =?utf-8?B?aTFNZmJhZDhrZmlyempIQWxSeUpTa3FzM2s3cUp4YThlRVdnUG10RjA3YUw5?=
 =?utf-8?B?WlpaVDNLZ0FobjRZaG9qSFZxd282QkJFaE5qUXpyUmdVb24wUWswM3pvOGwy?=
 =?utf-8?B?Y2pXNFZkVVlCRE45RXM4c0hRaWVWNVhuWHZtczdEQzgzV2tURkh5UlB3Tmsw?=
 =?utf-8?B?K3MvNDY1dCtmdGIwWGlaY3JpVVJSUURhVHJOZlB6dEdDZWltVTJWRHIrcEpI?=
 =?utf-8?B?a1BUbnF1T21VenBCQUpDNDNIUzBTVWRkaHFoZnJUY1B3alRvZWpiOEpFUzR1?=
 =?utf-8?B?KzBKUWlxeDV3Y2FPZUw2dWZEeHpTYklNNFp0eUptWTZRZVdUaHpjZWJOdkFX?=
 =?utf-8?B?SzAvWU0vMkNCOW1JRTVIclo3NC94NDJrZjhhR205UFlMbFIvME5YWWJMSWhK?=
 =?utf-8?B?OHFNd3Z0UzVWVnJpWVhRRy9RNTZyTFpqVmFleUlVNG42eTFZcmZteFJ0cjJu?=
 =?utf-8?Q?5fFr7fGTEbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhIWkc5cU9nZnVVclhoaFQ1eWJWM3BBNHJzZXFoQjVnejBNQjY0SU0rSkUy?=
 =?utf-8?B?WFAyem5QdFU2aGh1MnVMT1RIQ1MzQTIwSHAycXJpZmkyQTNzVkFiclNBeUE5?=
 =?utf-8?B?OVRnM3NYZ1h2TVBqSDVvOVBsbXJSSWNhVnQrSk1kUnFNK1dMNkFQTHk3Q1ds?=
 =?utf-8?B?SldsSnhpdnlmdmVCQ21ZYThBWGFZcklzL2VsN2lMQk51UnE4Nlg4ZFJjUlBS?=
 =?utf-8?B?RzV1NjFhaTFaNGovKzRReE9raDFKRFZjTjhPNk1pNm44NnhHVTBDWC9YMTN4?=
 =?utf-8?B?TlBwdTdBTUFFd0pkdW1kSzdwaVpFVDExNDlYRk1xM2lna0RqeU5POXVXUDE0?=
 =?utf-8?B?UVIyUStlK0ZlekVxZG1ZcmpFYUpQOFRBM3R4cE5nMDBSeXZpWis1bWFud2o4?=
 =?utf-8?B?YmhUVVNFc2hjdU9TRThRZ1V0cEYrc3lUemcxeEdUcVpHR3JlUlFSSkYyRC9P?=
 =?utf-8?B?aFowMzYwV3ltN1VscVlZOGZ2ampiMDVwdDNHREZaN1NwT3hpK2ZjaVVmZnU3?=
 =?utf-8?B?ZUE3UjNEVlAwSHdqbFNzR3puNTVDNUcrYUhJMDM1TnEvaE8yaUZkT2NUN1lo?=
 =?utf-8?B?d3dqZ0RDbUJuc1N1OXBMZmhDYnNYNnRZd1grdHBsQ0l0TjBhdUhZek9Sa05S?=
 =?utf-8?B?RDRuTHl6ODVHbS9MRlJ6ejR4UHQraVYzSWlsUnFZTkYwRk5xNjZyUmFWUWVx?=
 =?utf-8?B?THhYUCtNWFArU2JaRmUzK1ZRNlUzUlpnU3JBYjZOMUR1dVpNZFNnOVFaTlp2?=
 =?utf-8?B?bXNORTZhS2RyUXkyUnhSU0kvWWd1d2dCbTVWOU0zdHpJOXdMS2NyWWl5Y3VQ?=
 =?utf-8?B?b3lGdkNwMjcwZFhiSGZDbm1VRWYyNDJEV3ZEeGxMYjB5SDJ5WFpPc0QvNEF4?=
 =?utf-8?B?RVE5NnZvRVphcnN6ZTZKQXVxTXNyMUJXMFdOQVpqWWJNQ0ZRaEdtRHlpdnVP?=
 =?utf-8?B?Y2dyc2FNdmJWRmpqcHh0UytiMUpBSWhFQ2JLMEJod29UalBjNDFSbk5NQ2M0?=
 =?utf-8?B?SjdZQWhpWlZVeXlIN1NpSjFaR2JwUkthTkYyQlhzSFJRS0VFYWdmRWJvdnd2?=
 =?utf-8?B?SFExTC9qVUU2bHlXeVB2TFRZbXBQUFlQNUNQc3NXKzVMZHhhUjB0MWlwcEJF?=
 =?utf-8?B?cmdSS0xIQlo2WGg4MlMwNFlVUlU2SGd3eWF3MjJvN0s0QndDeEYxTE9KcHNj?=
 =?utf-8?B?eU5Db05zRXV3bnE1WkVXTzhpQ3YxMlNjTXBUOGxvZGladXhsNytkK0tvQlo0?=
 =?utf-8?B?T05qNTZ2N3BNZmdtUUttaGFLdUdrWnJHVjVnd0M2ckZKcnFVYS9NTldManRh?=
 =?utf-8?B?cHJlSFNTRDR5QWlnL1Jmc05mckFoeWhUbG1WVnYycXdaaHJjSFpMUDA3a3RQ?=
 =?utf-8?B?UWJyUVplY2UrV1FLNkhhK3l6YWFBdzBhdnpzbmM0cHNwdUlNYkppV1FYTVNq?=
 =?utf-8?B?a1UwbWVCM1pSa1RNeU9UaEQ2SUY0UXV6dnFtYVBpN3R0WGVHWGhxdXNmRHpG?=
 =?utf-8?B?c0lhc0dndHdxdG1WVXE0d2ZVcGI2eWJQNU1CN3JpS3ZieEptU1lzOStHa3Vh?=
 =?utf-8?B?TWNWV2prbERmODg1RmZJSndWcjZuQjZhcXJaQ3E1dVIrL2JmbDRaZnlFODgz?=
 =?utf-8?B?RWlHYmE3TU5DMFJQdk5MVXY2SzZCTi9lbDE1ZG5yV0NJSGNEQ0NZZzIzaHRL?=
 =?utf-8?B?M25GYXJoN1I0eU96K0Q5azZib1FaZFdMWCtqMldHZDZDVjVzckZnSUhCNUJP?=
 =?utf-8?B?WG5McXZRbUNXdGdkWHRIMkVzY2VzY01wSlFsVkU4QjNHWmo2VUlRV1lRdjhH?=
 =?utf-8?B?ekl0YlRXc1V2NFBmdkJaNWFUVmYrbzBRcWN3V1U0SWRIR0prTmZXK01kL05Y?=
 =?utf-8?B?ZUlZOHA3dzZmTUVRc3dVa0ZNTVNxMEl5T2IvNEx3MG5OTXBXbHZXN3BJeXZF?=
 =?utf-8?B?a0JOV2R4N29Na1BndGN3eEpBaVJBMTA3NXV4WUJ3MVdPc2hUaDhQZTR5VFhx?=
 =?utf-8?B?bkZRSkNqYkxzamJRZmd2K3orclZNdUt3WFZpSDlJQklZR1pVUXMybElmTEd2?=
 =?utf-8?B?MUpETjMvZWl3K3RpbjFuNTlPeXhlZnh6eVFPSFBVNU5uNmZ1eXRBdzR0R2pY?=
 =?utf-8?B?WUJDRStabFQrQ0taV0xXcGdXb2puYWowVlR2bGJTMnpLY2ZkVVRUZlgyTzBV?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81f453c-46f5-415d-0db2-08dd7b7e93d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:02:53.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6wWT2TyN0Jw1EU5R1u6TL0lP8MNhws7PXWOr6Fzyfz4cnyqrhUlthi/1lNBXs189Ivdi/CT7qwu/naQaTT4BrLO9GFLtQ2brJEfTM7ceVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
X-OriginatorOrg: intel.com

On 4/14/2025 10:45 AM, Sohil Mehta wrote:
> 
> That way my initial inclination as well. My suggestion was mainly to
> keep it consistent. But looking more closely, there is mismatch already.
> So either of the options work for me.
> 
> "x86/fpu: FP/SSE not present amongst the CPU's xstate features: 0x%llx."
> 
> "x86/fpu: init_fpstate buffer too small (%zu < %d), disabling XSAVE"
> 
> "x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init,
> disabling XSAVE"


And you also left this comment in patch 7:

 > It might be useful to add a "disabling XSAVE" print at the end of this
 > statement, like the other error messages in the same function.

So it sounds like you were suggesting something along the lines of:
   "x86/fpu: Both APX/MPX present in the CPU's xstate features: 0x%llx,
    disabling XSAVE"

If so, I see that as an improvement to the error message rather than a 
functional change. But I agree it reads better and more in line with the 
other cases.

Thanks,
Chang
