Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777E2F42
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454893; cv=fail; b=twCbAgBBvc8Pj/d2NZ5nWljGtDPE524pTH46Is4LTpgI50LzVknlmASZ/RQu/mSylypGTB5NfUjamWlW80mmsDp1sCsamsNiKvTg7ip3Ohee7ssl4ox1KFh9fr2xSr8FdlpJN6H+XxgPB08AxpYaBmHlv+09kjYR9F7Yk17pR7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454893; c=relaxed/simple;
	bh=cl3RBb0gp/p6K5uOOd6xWab66WC9iN2rf0waSl2CiGA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dqFHvPKptqyhZs1W2WzV83t7CNt5rQ0Dvtta5dwpPqbppgtKfFtPSHVTy7WsyYoZtxLtelJAPinc8GQqwI7pymv+lsdOtovvEoNjvM/1tYac2k0p5viWgoAy18Qyiya4QcNKY8BHAzLUAQX3o2FY/zm92gtXkWpR6nGBsNCfI/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSKD5Mmk; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSKD5Mmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751454891; x=1782990891;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cl3RBb0gp/p6K5uOOd6xWab66WC9iN2rf0waSl2CiGA=;
  b=BSKD5MmkRld9VztFxOdDyOsHCgAfx2j/dUQ6YM2Irnd2Lb9C7f8rrQOf
   TC6NxlWFZoN+Jjp8gPxJ4efXakOoLuU7YwWWqoCBtSAr733DaclMIWRVd
   GXmqaoljhpmGXwIJZMQucdY+r86MrhdEcLfjoadOhDKIORnjxnuP1K2QI
   9WYBcOIVq0wowt4v6/LDVXVSHt25JJLpsOVlUCQjBTrZpfSpfy5TG8OPa
   EzEiEEiC57eT3f0etb2DTkWm9BqL0CHh0+B404U8zljjuABAEiiXZewiT
   5XYhmtuIZSch1mnzeO/hQoBpOYJNO8iq0F2FezMRaobrrp1PP9zByhq5G
   Q==;
X-CSE-ConnectionGUID: WZXanRQaQdS9Tq/m2Zwzwg==
X-CSE-MsgGUID: 501/DIQxR7OFuSsrCGzJwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65092452"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="65092452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:14:50 -0700
X-CSE-ConnectionGUID: R948wDcxThORnPJpY/eNjg==
X-CSE-MsgGUID: Sq8V/BIES3yMEhbuge7iAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158306494"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:14:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:14:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 04:14:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OimZIS8Tr8P9k5zMAVTLHmsP4P9j8PpweMZIIn1PcFOUN5CIPJOYSauLIjUaFSh2JouIHdYEejEqu5M6yoHI13+kol92yelUFnonRkWgJm5BehVXdt2AxZip/ltK7gtY+6ioLfXv9tcvmINTLk683+uKHk1/Dtkt0YuKfqIWz1iVUKln5m03X5v1eSa470d3esx1xam++7FL6iR/UYCkfDauzKVORjzAr/GJH/3SzGpH02OFF87HfWm8CZxS2doE1jphLPTDUnJH9CBeTyweNTUNvDwwI2y3iAiV7dt28qgGebS0FtxH9YbpB4i7egDNXdri0TO7z89hwKnadkxmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9qIJJ+uyglrg7/+PNqo2aAT4+U7+PjiIM/yTlYJAts=;
 b=ZjuMkthnSf0z+GgQ9y8/TFbSQyNZSROSdpYQhgmK/cvvzKpctEltHgXZiJWqe0QzafC8pcGtQXWl9aN6b8RQ1tUmyleUjPJW7YzPd3PlJEPyGQnIDKbwUoV04VzUsNAB08zpcXgJSwI3xMun2oBAhe9c9E7mmlr5ANOuXXimmiWgLm1zLwOtE8E+eV5j3PqYT418xiLwqkuHDVgvIuSkDNaAS4Bu1pM6AsxyJ6AESUxuCsM3OgBt5l6wA4a6F5SZpGoLzUjpx2mJeNDlvAOhB3FxQrvqVFRUpivFMGyyFWvgjvzm6YDylCQ1ZVsXC9BYF90sfho1H5tgKfsf7eoL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Wed, 2 Jul
 2025 11:14:29 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 11:14:29 +0000
Message-ID: <4c827399-955c-4c7e-9a52-d38bc6a55aee@intel.com>
Date: Wed, 2 Jul 2025 19:14:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: Jirka Hladky <jhladky@redhat.com>
CC: Libo Chen <libo.chen@oracle.com>, Abhigyan ghosh
	<zscript.team.zs@gmail.com>, <linux-kernel@vger.kernel.org>, Chen Yu
	<yu.chen.surf@foxmail.com>, Philip Auld <pauld@redhat.com>,
	"jstancek@redhat.com" <jstancek@redhat.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <b66b4e76-f07d-4067-8c99-55600bbd2556@oracle.com>
 <fe225d57-f1a7-4b54-aa09-6efbc11c9a0c@intel.com>
 <CAE4VaGBoRNSGcfK-_Mnd+fgs11MzkLPdQV9xKs_iwCgaqxE7NQ@mail.gmail.com>
 <CAE4VaGAzuexw79W+ZpAPf7dDKVtUZs_eNYX5e_ZWVirSt2tONQ@mail.gmail.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <CAE4VaGAzuexw79W+ZpAPf7dDKVtUZs_eNYX5e_ZWVirSt2tONQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c2372e-8732-4cfd-ad4d-08ddb9599c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2hsV2xhQ0JsczZ5emR5SWZ6T2JYTWREVXFZOFRKZSttSlRGL1MvTVVINzZO?=
 =?utf-8?B?QmNXa2FxdkhxNVg0L05ZeUh1bGFmT1N5WkFSVkhmQTk5eUFOYUFZbHM4c1lj?=
 =?utf-8?B?UVprTzZrNXJuNzVOdko3QW9ZSmFjODlpZk41cWVFWnVjNm9Vck5RZUNiR2JI?=
 =?utf-8?B?NS9GM1ppYVdNd3oyaTFHcmFtYzIzY2pHT0pySWVEMlc1bmtOWnFrWDhhTmpK?=
 =?utf-8?B?MTNnbCtraXJRNHNSWldBZXFBendRNk1JRWVTMnI2RkdEcnJBMDJ0QmhCSjM0?=
 =?utf-8?B?YWR5VjVVaXJIKzhjWWVNbmxiUGk0UnVxamVHWjIxRGZxUkdRUFBvY3Y2YU9o?=
 =?utf-8?B?VFhyYzYvaVJwaWZDM3VKbWlmTzE0dHFycTBxUnkxUzFVTnZRTmhSWmptVnJL?=
 =?utf-8?B?V2VLMTZGNTBtRCt3TGFRS01uMENKNjFrSS8rWGlRYjFUenE2ZVY4S2RhSkhn?=
 =?utf-8?B?ZVBxbzlETzdaTlNraXZZUkI5dERWU05mUkVkVDhTOUo5bmNOTUprNHRQMUJS?=
 =?utf-8?B?NHpKMnBuMVFGZ3crWG92dDg1QVNFeG5tdHV6RTZFdWdsRXY0eEZQa0pRVWdB?=
 =?utf-8?B?UG9yZEZ6RlJWS3dLZWluRGRrdXF0MGhQamIyQm9YOFRCTkNHNStqZjhua0dK?=
 =?utf-8?B?Q3FtZnF1aUR1NDBOM2p6eTJVMXlrcGQ0NUF0azg0MXRPazBaSmZucFhjdk9P?=
 =?utf-8?B?NmdzTkdnbjNUenFrRm1ZbGZ6S3J1MHEyRHhpUmlKYkJsTkx3TWZ1alRnb1lT?=
 =?utf-8?B?S3o1ZjV4eGFoN00rdjY1RXFpYmVLcVFVcVJmRitucEg4ZHZXMmxndXRTUXR1?=
 =?utf-8?B?VmI1NFJqbGZ5ZFBaRWIrZ1k5SktHeHlCN2dleGdkS2NMM1ViaDN3QzhCTS9t?=
 =?utf-8?B?ekM1SWFMdE5MNmJyNWZPYzNsamZVNHlwY1lzUDZOcU5Iam12QlFqZk5iL25u?=
 =?utf-8?B?UlVTVDh4UlpwcjR6aDN1UjFMbGdORVBIVWJ0cldidk5pdTNTbWpWRUdYZ1pj?=
 =?utf-8?B?TTFWVjFpbE95SUlhS216ZGxJK2NCQUxlQnpPdUtYSm9FMVNMV2h2ekNnenUz?=
 =?utf-8?B?OGRTN0lMYVM1YWRoMG1lVmxERU5VOXFyd2JMK1BpZDlNajg0TVo1cHNxTnI0?=
 =?utf-8?B?UGdGRDRQZ25CRWx5RCs3MnBndjB3SzN5c3R4Wk9XVmdKRFBQcHFLblo1VFgw?=
 =?utf-8?B?RWljMG9wMnlOTjd5ajRPd2IzMHJHMHhHT2NHeVdxQ0lTMDNRUWZUZ2t1Y3Fo?=
 =?utf-8?B?L1d2anJ3ZXN5Qm4rdWhkY1piRmFoWXJHS0R6MmcyenM0TmlKY1lsOTZxNFFy?=
 =?utf-8?B?TXNJeVBwSi9jZjlaVHZEQUZ1Umx2NVVYNjFXNmRyUHRLMkxtREFuZ2NJdExD?=
 =?utf-8?B?WDNZd2dEMHZldklUWTBmUkRMbENsVUxWcEJ5ZS9Fejdxb1A2QjR5bGE4YVVt?=
 =?utf-8?B?TmJReWdzM1BqdTVTUFBESU95YWFqQ0FWQ1NteS9iWVFLMnN1Z0EzZWkvVkJX?=
 =?utf-8?B?RGpaZm9CdHJRSUtJb2hnMG5jWXZOblFYWHhoTG1GaXQzak41dkI0OVA0K01r?=
 =?utf-8?B?YSttNzlZM1J2Qi84aTBLMy9zOGVPcnA4cFhjdFFRYVc0YjFPR3lPVVN1MG1G?=
 =?utf-8?B?d1BxNG50YTV0eURCOEJPY2FIbkJlckFCdktKRGZ1NyszTmlmbXZ3KzJrUCtE?=
 =?utf-8?B?VWhOQmFyclNhb1pqMnpGNGtpZUJVSE1oRnNSRUZTcjYvT04xYjAyMFVoNkFp?=
 =?utf-8?B?NGpvMURLcjNZVTFneGNsTmM4WFU4SmpEWWNyMVV0MEF1dVhybDAycThTVGlC?=
 =?utf-8?Q?asYuEL3rrCZvMDNcEUUiK4sowWkQ7Np+24Oac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhsVUE4SUZtNVZCQjFTbzJyMFpFcXA5ODlBakZjRmJlQnVNZ2x4TENOekZM?=
 =?utf-8?B?WTVONURaNVI0NzVMRmcyYUdCLzZNTDNwbjQ2Sjc2NW9HOHVEdTRvQVJValdq?=
 =?utf-8?B?RkRjMlNkeStEK2M0b21ESVF0NkZ0RlpGSkxSV05UN1dhMGVqUElKTDgxRHI3?=
 =?utf-8?B?cElrQWNTNEJldG1Ya3d4anFKUU5reGVoTDJNQi9XVWFhdkYxNzVxYVZnbUZX?=
 =?utf-8?B?a1RlRk92R3JFTWRXMjhsaDVZWC9XVTZKNVhXQ3VKZUsyWHIvSXBncllNZyt1?=
 =?utf-8?B?M2dRNUtIZUp4ZHZLcGE4bGVURkFnVFhpMTQwS2Ntb1djejQvVkZoajl3c0No?=
 =?utf-8?B?ZkRyNWxHNTVGNUNWMks3UGg1emlyblF6M3l5R2FubmtHbmNPUUluZy83dGJ1?=
 =?utf-8?B?VGhPTmZmaVgyV1k2LzEvZ0NQL056Y1VOZHZHM0hYQTJmN0lZTXRvRk9QRkpi?=
 =?utf-8?B?eUhrSnB2Uy96MWZzb2pGK1h5Q1VYcE9aaGVERC93Y0RMTkVEOXdnNUxqa0Ix?=
 =?utf-8?B?YStpeXRtSytxWHZEakR1Z2U1MWZ1SURHdkE2YXFEVGhxQjA4bjJsMmhiTjQx?=
 =?utf-8?B?VzVtNGRLYkRDSW1mekdFYlRob1MvQmJsdnhzTmVyS04rTlk0RjdlYnRWa000?=
 =?utf-8?B?QTR2TmZ6WG9YWHJ1MGdZKzIvczFueXRjb0pkNW1JSFdtVG5DczlsdWlsNlRW?=
 =?utf-8?B?cU5jcEhwUVlDLy9KVHh1WjVPcExmS1hObE1pVnIrTkdqZ3JPT0o2ZUZtbDBn?=
 =?utf-8?B?V3hrRVVYYm9wMEV3OW9BNnBHVlpyWHRXcDZQdCt1a24vN1k4ZW9KZXVoSy90?=
 =?utf-8?B?VjkzUkg4cThaM0FqUTN1azJjUTBMVEs2VTdBQXM0eXFSZmRkbjNtMXJacnNQ?=
 =?utf-8?B?ZGV0ajUvT2Rwb1pobStiL0pDRCtjUFo0VU11SXRnZm9acHZqQ0xUWVFDeVJT?=
 =?utf-8?B?MG90ME9taHdLaEk2aE9CTlJyazZCTncwUzVWRHRjMUxnNU5BWUxrbzdVb2dr?=
 =?utf-8?B?VS9lSUVUK0hwNzZKWXVpLzNyczlzUGQ4czFXTlNzY29VbXFRN21xMDMwaVg3?=
 =?utf-8?B?OUNLWWtDY2VZZHRsNkxYc0hWb3hqNkF5SVZIKzFqZkRFWXhLRmI2VXEwaW1D?=
 =?utf-8?B?SGZhS3lLSENvL2FtZEtkd1JlUDRUbmdRTUs3R2ZSRVRkeElQOHc0aDZWMHdN?=
 =?utf-8?B?a3prR1YvK1ZCVHIwdGI0QnFDUjdUNFNQdUpjS0JrUmV4K0NXTi9Oa2MrQWxH?=
 =?utf-8?B?ZlJQODk2NzJtUTY0YW1EajBQM2xUVkUyN0owODBCMWNYMi84d2U0UlhKaFFB?=
 =?utf-8?B?UWM1YkVFNXdoemYxekVDa0ZHUTljWXp5TlNRbUI3KzBOSFhTYVAycUUwdk82?=
 =?utf-8?B?L3FDTVRIWjJGYkZjem9jZE51TnJaVzNpM2ZHNVd0UzBpRllGMFBVMUprNFo2?=
 =?utf-8?B?RllRbnd6dUNVa01pL1JQaFVXbWFucFNQRll6ZGViM1I4TEFpVXp4MFhoOEVh?=
 =?utf-8?B?YUNmTjJpZ2s0U0ZLbFYzRVNGSWxDT3dBSGhYRnNHSnlWMkJFeGF5VTdNL04v?=
 =?utf-8?B?SUl5WDJiUFpKN2c4RTRjenVaRWV4ajRVdnU4ejllVlh6ZXRvcE51WG9GUmpI?=
 =?utf-8?B?NjVKVFk4R1orSkplanFSTHBnSGlMalN0TE5SZ1BKNStnb2YwakRUODRnUzIy?=
 =?utf-8?B?R1kwK0t2YU1NdGJJaWh4ajNadnlYTVpiVEJab3k0aUZ4UlA1RUQ3MkRWOWlh?=
 =?utf-8?B?ci9zUUdmQkJWbjdicjVZNUNvTDdYWWhDejEvSTJHYzZlZ0Jjd2xaN1JzM05z?=
 =?utf-8?B?RDlUZkt2Q2VFNTNJMTRMQ1FaS2s1MUVaMmJiT3NmWStrTElWaklNeWVhUlpp?=
 =?utf-8?B?ZjFpd0hsTlhHVWsyaU8yTzh2Y1hjUHRMNFQ1Ujg0c1haY00rSmxHQ2N1emY1?=
 =?utf-8?B?NUt0TUR6QnlHeExwQUVWcFA3MG83ZCtQVEtPZFRlSU9XcGtyYmw5MHpndU5X?=
 =?utf-8?B?aFR2emRBRURmRzFTa0g5aXhrNitKdlVKdnlQbkRJYXNRYnU3anJtQkVNaERv?=
 =?utf-8?B?YnV0NXVqRnlCcTVCcG9EeVdHbWozZjJJclFKemRrRHFkSkczYzBkMVdtZzFy?=
 =?utf-8?Q?MpPAyIZYj0jVBGAeGbplzPjjL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c2372e-8732-4cfd-ad4d-08ddb9599c90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:14:28.9986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8wsTgTxn8sOKWIr+KquK4YXbXmOluY+aUQehretBRHB5REUkANyKysjJfzKZCa00Ws9yn2j4UYVWXbUEQfLNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-OriginatorOrg: intel.com

On 7/2/2025 5:05 AM, Jirka Hladky wrote:
> Hi Chenyu,
> 
> I have the first
> 
> if (unlikely(!p->mm)) {
> trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm, p->flags);
> 
> log from dual socket AMD Milanx 7573X server:
> 
> [74615.841401] # entries-in-buffer/entries-written: 1/1   #P:128
> [74615.841401] #
> [74615.841401] #                                _-----=> irqs-off/BH-disabled
> [74615.841401] #                               / _----=> need-resched
> [74615.841401] #                              | / _---=> hardirq/softirq
> [74615.841401] #                              || / _--=> preempt-depth
> [74615.841401] #                              ||| / _-=> migrate-disable
> [74615.841401] #                              |||| /     delay
> [74615.841401] #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> [74615.841401] #              | |         |   |||||     |         |
> [74615.841401]      migration/6-54      [006] d..5. 58590.368364:
> __migrate_swap_task: !! (2939199 stress-ng-sem) flags=40004c
> 
> debug code caught a task with p->mm == NULL during __migrate_swap_task().
> 
> Trace shows:
>    * It was a stress-ng-sem process (PID 2939199),
>    * That process was in the process of exiting (PF_EXITING | PF_EXITPIDONE),

Thanks Jirka. So this race condition is related to task exit.

>    * And was a workqueue worker (PF_WQ_WORKER),
>    * It explains why p->mm had already been freed
> 
> I'm curious as to why the command is stress-ng-sem, and the flag
> indicates it is a workqueue worker.

The flag 0x40004c is
PF_EXITING PF_POSTCOREDUMP PF_FORKNOEXEC PF_RANDOMIZE
according to latest
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/sched.h?h=v6.16-rc4

thanks,
Chenyu>
> More jobs are still running. I will keep an eye on them and report the
> other cases as they finish.
> 
> Jirka
> 
> On Tue, Jul 1, 2025 at 5:10 PM Jirka Hladky <jhladky@redhat.com> wrote:
>>
>> Hi Chenyu and Libo,
>>
>> I agree, let's wait for the results. Hopefully, we can fix the root
>> cause based on the debug messages.
>>
>> There was a problem with the infrastructure over the weekend, so I had
>> to restart the jobs yesterday. I should have results tomorrow.
>>
>> Stay tuned.
>> Jirka
>>
>>
>> On Tue, Jul 1, 2025 at 4:59 PM Chen, Yu C <yu.c.chen@intel.com> wrote:
>>>
>>> Hi Libo,
>>>
>>> On 7/1/2025 3:32 PM, Libo Chen wrote:
>>>> Hi Chenyu,
>>>>
>>>> On 6/27/25 00:33, Chen, Yu C wrote:
>>>>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>>>>>> Hi Jirka,
>>>>>>
>>>>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>>>>>> Hi Chen and all,
>>>>>>>
>>>>>>> we have now verified that the following commit causes a kernel panic
>>>>>>> discussed in this thread:
>>>>>>>
>>>>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>>>>>
>>>>>>> Reverting this commit fixes the issue.
>>>>>>>
>>>>>>> I'm happy to help debug this further or test a proposed fix.
>>>>>>>
>>>>>>
>>>>>> Thanks very much for your report, it seems that there is a
>>>>>> race condition that when the swap task candidate was chosen,
>>>>>> but its mm_struct get released due to task exit, then later
>>>>>> when doing the task swaping, the p->mm is NULL which caused
>>>>>> the problem:
>>>>>>
>>>>>> CPU0                                   CPU1
>>>>>> :
>>>>>> ...
>>>>>> task_numa_migrate
>>>>>>      task_numa_find_cpu
>>>>>>       task_numa_compare
>>>>>>         # a normal task p is chosen
>>>>>>         env->best_task = p
>>>>>>
>>>>>>                                           # p exit:
>>>>>>                                           exit_signals(p);
>>>>>>                                              p->flags |= PF_EXITING
>>>>>>                                           exit_mm
>>>>>>                                              p->mm = NULL;
>>>>>>
>>>>>>       migrate_swap_stop
>>>>>>         __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>>>>>          count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>>>>>
>>>>>> Could you please help check if the following debug patch works,
>>>>>
>>>>> Attached the patch:
>>>>>
>>>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>>>> index 8988d38d46a3..82fc966b390c 100644
>>>>> --- a/kernel/sched/core.c
>>>>> +++ b/kernel/sched/core.c
>>>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct task_struct *p, int cpu)
>>>>>    {
>>>>>        __schedstat_inc(p->stats.numa_task_swapped);
>>>>>        count_vm_numa_event(NUMA_TASK_SWAP);
>>>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>>>> +    if (unlikely(!p->mm)) {
>>>>
>>>> I am starting to wonder if we should keep this check and add a big fat warning
>>>> like  "there is a bug here, please report it!" rather than brick the kernel.
>>>> A kernel panic, for sure, helps catch bugs like this more than a line of dmesg,
>>>> so it's a tradeoff I guess. What do you think?
>>>>
>>>
>>> I agree with you that adding something like WARN_ON_ONCE()
>>> could help, and it seems that the kernel panic is not expected
>>> in this scenario because this feature is a statistic calculation
>>> rather than the critical logic. Maybe waiting for Jirka's feedback
>>> to decide the next step.
>>>
>>> thanks,
>>> Chenyu
>>>
>>>
>>>
>>>>
>>>> Thanks,
>>>> Libo
>>>>
>>>>> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
>>>>> +                p->flags);
>>>>> +    } else {
>>>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>>>> +    }
>>>>>
>>>>>        if (task_on_rq_queued(p)) {
>>>>>            struct rq *src_rq, *dst_rq;
>>>>
>>>
>>
>>
>> --
>> -Jirka
> 
> 
> 
