Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B65284664
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744651731; cv=fail; b=GlpL1dd7PQjebN6YlC4DHK1zKzuQwTR3nq0vp3HKk7cdoFwHaO+A/1ZTAsOdGwWj5or0kRKoDMg6IoO22uHvBi7nshNnslYOjmdkPGf9azfZ7O7tvaTJ4B8kqze78n0sLssz8F6oGFeyHl4JhNQnhOkC79dtN1j22/wesP52pIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744651731; c=relaxed/simple;
	bh=LFpD9rc8luVR3B9lTFr3PsUQhviPRbbe8mjyMdMLLfk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FkJ8Z19ggsVHqR7jalMKp6wl7rqMmBAEyeXdbbObvhJXlaOAK3XkToUZQh+rbAWdPzmxWTYZ78OMMiMCyLSR05EVfCnp9RyfSn+gYWTQeSHcGGMS2tQQfhXtr4YlxvhJYlt/eP4yNQFw6s5BxeVC/UsjwkD1pH+WZLBPHf2dBTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVTrt0wd; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVTrt0wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744651729; x=1776187729;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LFpD9rc8luVR3B9lTFr3PsUQhviPRbbe8mjyMdMLLfk=;
  b=hVTrt0wdniSsjDmwnY/zUKQfUAjPU3HIUdSfWl32sqxHSDPsz2+CWbKT
   BNSNVKDL+nIiX7HHe3YANmx/46iIrdI7DXkhxTUD4j/kCsa568qaRHD/q
   tKcxNd9NbVDZ5GfvjGGOabbtjoOMso890S+zGt/zTETQrKnoui13F7+gX
   KgkmYiIC19SKh8rEA4of9ga81PEOpKovLB8yvYcu8Fxnk+mk+NogbXdwl
   oPOXXndExrwSN1aysmFGyU/UIK4XAjUYG9ETWQPNC8uSm9D1d0ObCmkqM
   ki2kByW37D8UzK9ryOpfYZJ12QlD6C6LIi7fBg1OdbEZmUyoQoX8+FFrq
   w==;
X-CSE-ConnectionGUID: vRsdc0GlT1KZThEpTRP8xw==
X-CSE-MsgGUID: RbXbqkQUTwmpABayAgMYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45367497"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45367497"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:28:48 -0700
X-CSE-ConnectionGUID: OoWnO9LsQDm2mdJbbqzCdA==
X-CSE-MsgGUID: aS5/sA6FRImVog5Nm2+s+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="130760556"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:28:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 10:28:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 10:28:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 10:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xonNZikK1vU1VBtNZg0UleZc6irCgb8ma5gkPsC3cQLRQ6+f76LV2PrzmekPKg3cLlAZ6DFVZ/YUNU1nT1Nm3h2+Q27VUWJVG00ljD0GRvZnaj58ysDnfBPuiVXacDhwqbLzaMaxhPkXmlJpL+hVpohSMkAmlPlMe8nGl3zn2//JJKBhuxNn2Y0cfIzqeCjq4WUTla/bFeQ/ERMuAaEBxiqmpwUi7U0/em0CZXUAqCt3bEVuPEx2DqznbosGBAvLQWbkKOEUBQ8QOTgQvvvx2ZyqjcNxEBxcUEGF1MJpECInbsZrcYD/GtXdUHNM8/YEZ8V41hU0t+J3ktUq1opNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7RiRt4fFi9ff4Uo7UNEHwVHRVrGI+4kW0yEoI8Z2NU=;
 b=ZAcMGUjJRge6cU0b0g1rK8s7FNR8sBvBnJ3n9sAWPru0XLlnBT4tkdiWEcRFVhuuCNtYf9PieOdTVBElEDWbAA197GLbF0GOvPPHEwXXsPj0wmj3VroaxVpTzvYslqpgi5JenQiAxobWOjfwLRrkWzQGXMK3d71qutmFgO7sdsydTwJrDr4Ep2aug4SokL8ArhpTI0P/X5V3IkTjpfkl1+Fy5Na7ivSvaYzD55FPqBxcnG8QQkz6rG4jzuPxd2029svN2dLKojaxyn0VwdztxKPQjgbLsJD3h5tMp12zmgfcEA1PyX+Vixm+EmkqC+H7SZDtTvMooTwqmAAG7GXHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 17:28:18 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:28:18 +0000
Message-ID: <eb33f181-a89f-47a9-ad98-f5a079920950@intel.com>
Date: Mon, 14 Apr 2025 10:28:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>, "Chang S. Bae" <chang.seok.bae@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com> <Z_onl1QbH9L1-8dq@gmail.com>
 <Z_zGCCNE_Qt3IlMZ@gmail.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <Z_zGCCNE_Qt3IlMZ@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: d420b85f-3567-47df-f21b-08dd7b79bec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWxwUFpIS2M2cVNGb09KVW1iOFJqdkNNU3hhbGJ0VVMxMWFMSUNySHd1eFpQ?=
 =?utf-8?B?Y0lvbndEK3I0TW1DaEwrWlZrSFRjTVRpYUdVbHQ1eEg4RFlJUGI2UGppTThM?=
 =?utf-8?B?R2RWUVVvMmhtckY0S09RY3RWREozaTk2ZE9haUEzTGk2a0NkaDNSRWZlK1dN?=
 =?utf-8?B?WStVN2RISFgyQ2xCN1l5L1MvM0JnbWtKMmlnOWwva2Z3RG53TDQvSzg5ZXRN?=
 =?utf-8?B?UWNEWlBSeU5GRHUvY2ZtckVOaUpmanZmWGJGNzZGeGNMUWwwaEFFMnp2NmFW?=
 =?utf-8?B?bnpLRE45SmR0ekFhVk9ocXc4WGpOcks4NDR1ODZoMldmZlJzbXFmUmdsZHRI?=
 =?utf-8?B?TExRVW1PaURUaGtkQTlaSjNRWElSUng5VHE4OG4zTUlaVEZFaDJ6UE9YQlAy?=
 =?utf-8?B?YTJUeDREM0F5elY3Wi9DTHI3eUIzV3lXNkExYVIyemRxMjM4R1QyTUVnblVC?=
 =?utf-8?B?SEFEZi9CTUZsTjkxdjdHdVE4bUdxam9pR1dVRlNmejJCM0tDSU5ldCtjUk5v?=
 =?utf-8?B?c1hKU3FVNjAzcllMdFFTZnNtb0JOek5wTGk0SlBwVHNSZkxuWWtHMVZwTkNH?=
 =?utf-8?B?QW1YQTN0eG42RnF5cksyeVMraUpFbTJTS3NEdnJielRwb0xmSGpOU2V1Y3kr?=
 =?utf-8?B?RDJ6eFEyU1ZqMGxuc2dVSHN0eFBEOEVaM3JoQkRWQ0Q2TWxIcHRXbm5JaVdG?=
 =?utf-8?B?alViOGhMaTFzVHBPZmwvZ0tldW9KVTg3NVp1cG5JMExjbzJFazVleDVxQzJs?=
 =?utf-8?B?VjBvQ0Q0UjhhSGxtOHhqeHhoUVJpeDkrYkdVV0hmSEZoYTRWN2w1bWkxd3B3?=
 =?utf-8?B?Y0FNZHlYMDQ0dUVJTW1hRUNkaUVRVnQwTHdhemtCbWUxUmI2VlZRaXk0QUls?=
 =?utf-8?B?TTRGZlErVW51WHc3SitFV3dzdmxGWXRwUkxBV3JpdVZxa2NyZkJhcVFlL2ZU?=
 =?utf-8?B?V3JsQkNXZmlVbklNWTE3VjBNQVkvNjJJTkt6QnRLMUdBVGE0aTQ3NlRzLzZy?=
 =?utf-8?B?VEo0Q3dsbzI0ZU5wSWFnS2xPOExVN01OMkdXcUk4TjhvYnUyU201anRJaGNn?=
 =?utf-8?B?VU9CcDV3YXNEc3pIOHBVY3d4alZDWkxLQjROclgxL0Vqc1dGN1hRMUNGNU00?=
 =?utf-8?B?QjFZYVUwZmZvWjFqS2xjcURKTDFnSGR6bXpSYzU2TzM3d3Y3blp1bnZCUldu?=
 =?utf-8?B?SmVYaWYweml0c05oR1J1STB3aXNuSDlZL1M1MFhhNENhc0xWYU9wdDhsdTA3?=
 =?utf-8?B?OG1OQldlUlYvcytQUTdFeXR6QmIyVVZiek5SenZNUjNFNUppaHprVVgvQTl2?=
 =?utf-8?B?WnM2ZUg1REpYZ1N5aU5qc3hnT2VWUERiQVlDQk1OajNUUk51QWdSTUswUVdX?=
 =?utf-8?B?c3dtdEdUd2Q2bm8yd1FrOWcrVW5yM05mTkdpVTNrZ2xnZnFKTEFUaUJKS2xi?=
 =?utf-8?B?ZEVJWng4N2gvbDFVVmw4OVNyUlhyUndxeWxxQ2krZWVkWGdwa0NTZlBKcC9R?=
 =?utf-8?B?bmEvU1NISXRrOUI0ekNmNERzUy9xWVRTcUZxNFFGeFVIdkh4MDhUMmgrdnkw?=
 =?utf-8?B?cHNIUEcvS1VISzk3NWVnUStPZ0twMzRodHZFQm5HbGxqK1luRGVFWkNZTEZv?=
 =?utf-8?B?dGpJZWpvSENRc1ZOdEhjSHJUWGQ0UTkwZXZENTVDQUFrcUNONTZKUTVtcXY0?=
 =?utf-8?B?K2cvQ1Npbit2anUxS09RbE54dzFoS1ZDQ1J4b0w5b2pSajQrYW5RNVJJVHUw?=
 =?utf-8?B?SlpYQkhoam1pQ042WklMVGFUUWVpUDBlcmRQRXJaVE1tbFdrZ3M1YTRFV205?=
 =?utf-8?B?V2RkMkNHaUJuSEl2Z1BwbXZnQUpGRjNLZ1hCaG5KTFpHMnZUL2p1b3c5UkRx?=
 =?utf-8?B?Kzgva2w2NDFkdFp4K0UrN05pcmdLZmRWM0dqQ3lKRTNTR1hZTnNIUWsrMXRJ?=
 =?utf-8?Q?9rxpdZhcInY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2JORGVrR0VPYk9tWk40eDcrU2NkQTFBemVHc2pKeGdNSitteERtaW05Wk1V?=
 =?utf-8?B?dnAzV1RIRENjZ01mQndYZVpTRlNYOGV0OG44bU5NSktWM0dBWFI2Vk5mcFBZ?=
 =?utf-8?B?b2plY211NjBCaWw4ckY5bFY0TlNYSlMwSHJDT0JMK2hrSEpOanNpMS9OZ2VR?=
 =?utf-8?B?MS9KeEF6VXF2MzVFVk5qUTA5eTN2bmUrTFBYVmd1MHdsZmd5bTdJcmpEU3BR?=
 =?utf-8?B?OXhacmJMbkR1QWFneWFJTnBnc0JvN21nVWxSRWNYaTJCVk9uOEFKYTlvcDBG?=
 =?utf-8?B?ZGMwRVFMTUNEeTIxUmFZblVGSmpPNEVnTGl0ZzVPRHBxSDh1MGNwOVJ3d2x0?=
 =?utf-8?B?d3lrR1cyZUM1ZzJrdUNCZ1M3WnNuNnBrNDNLQUFrZmpRamQvSzJlQm9OaHZO?=
 =?utf-8?B?V0hyUUlNQTBLUTJiSUdVQXBFeHJ4MTBxWEd6SWxxajNnWmRwOXhhbTQ5Sk4v?=
 =?utf-8?B?cU5RWEhrWkVuVVgwbkd0VzNpSHVMN2xuaFZOUmJlejRGOGh6ZzRVSFhPZlhO?=
 =?utf-8?B?WDY3ZnhNSVVRNFlHSWFQU1dDNGx0RU91M2tQWW9jVlpEaWVWdm5CZTh1clBP?=
 =?utf-8?B?OUZKVitycC9tZnF1eVcwM0ZweDRuQ1dXc0hscUh0RU42YWtoNjVCdjR5TDdD?=
 =?utf-8?B?eUp2RkY1RWljWk40SXVFQjhxbFVDY1lmK0t3TFQ0bHlUNGRBK1psV0FEa1Fn?=
 =?utf-8?B?UW02dExDMXBiRWJSV0IrNm8rQlczaDBXaGVrcHNkOUdncnN3aXVmNnBHUEIz?=
 =?utf-8?B?Wk9CU2JuOEpVZjdTcG1IamJZODFoNTVqZFZHNTRmeFgvQjhvT2x3Mkd6SUI3?=
 =?utf-8?B?ek91ZEJPN3BsY3hNOXFtcXp2RHJ5RHRUbXVXb2RjOEtxTnR3WVRHRys3RFlV?=
 =?utf-8?B?Zit6L3p4TmREK3J3Z0pMSkFKRFZJdTNNd3ZlOFdVM1hnSUFBMDFjU1RVd2lR?=
 =?utf-8?B?VFhXVFoxaDd1YUgwUGVwbzQ4QmV0bEMxdS85eS92NTBuVVAwTWV4cDRjN3Jq?=
 =?utf-8?B?M3ozUEUzWXFEQ2NoeXV2eVAwQWgwVEIvdkcwUHpiTE0veGtJZXJUSUVJSlBo?=
 =?utf-8?B?NFdSMVYxVnl1blN2RDdGZHhDSFA4MVY1N0trY1UreFFuSDU4QzRrU1hVQy80?=
 =?utf-8?B?K1hQcjEyZ3o1d2xHeWFEeE1NdjZZVXlPSTdXL1c4Zm5SeU9QRHZ4THhNZlVV?=
 =?utf-8?B?R3ZsT0pGeVRpcFAvV0JOaCswVnVyVFpIb3FDS2d2bnpwMFFYWWkyem9vaE5k?=
 =?utf-8?B?RGJoK3lCZG53eWIrak1UMGVFYXNTNjF4N3lYSDJpNmRjeWhVWWZxSXJzMm1Y?=
 =?utf-8?B?aXhrRGNOekdYcUhCUU5DMHNKVGhnYzNSMldmMUQxSU9ZaXYrZzhzc05QR0tH?=
 =?utf-8?B?UXFiZTZDZThaMGk2VDQvWWhrWWJaVlo5VGVLM0UyM3RoSGVoTVVWSUhlL2t6?=
 =?utf-8?B?alQyVnVZYW5zS1pmTzkxcUV5ZlZBQi9uRE1mV0RtUU5uUjRkMnNycHcwKzZM?=
 =?utf-8?B?eGpwZmhnZmlKeDlIZXAzMTg3em5acE94dXR3WEVPRzRNcmQxT1ovK1R1aDFG?=
 =?utf-8?B?SkZVZURTRHcvZ0djTitqY25jU1lydjdVTUg2eVZFTGIyZEM3RVBGUjJyMHBU?=
 =?utf-8?B?UkFxaCtsZlp0QUxVV2hGVEttaURjYnRwUFlBODd0NXBpWWVMK2FLMGhyWDc5?=
 =?utf-8?B?dk5DTFJMZ0hFc2Npc09JZW44ck5kc3BGeXNJNTd3dmNwUFgzMnlBc1FTWWhz?=
 =?utf-8?B?RDk0UEZsRnFzVFBtell5ZkFsUUNZWDQwT3FCZDg4WFZxb1ZtL1hRNzlmNnlV?=
 =?utf-8?B?NzdZWGtoV2xMSjlPRHBRdDFRVEVLcGN1OEI5a3JNRVFRc0x3TnhQRmgzM2Vq?=
 =?utf-8?B?bE9OVHpLVzZtL0s0bkxPenl4ZVhiZXFqV1NiS0VrcUxtWkpEWVZxeGk2Nisz?=
 =?utf-8?B?dUt2MVo0eE9FTy91ZFoxR1U0aHlWbkZDMDkzV1JpRTY1SWNCY3hkRVc0bUsw?=
 =?utf-8?B?elNqeUxQc2hTNHBkNEoybW1LUDZndFFxVlFPKzFmUS91NTF2OXJGTm1WRUZ6?=
 =?utf-8?B?eTBoOVpIYjRLanV5cThYMEpkYU81ZUFvSUQ0NTMrYlBZQVZsTy9tMWRCKy9W?=
 =?utf-8?Q?awuHODYaYYfw1a6VPtBhsJZWt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d420b85f-3567-47df-f21b-08dd7b79bec7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:28:18.5715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYdWiwvjzkuiN0Ib4f7FCznjKDtnbAFuvbKyACa5BTnM4YunX+TDoiqBAzTqgIlN8sTEtLFrxSS9g4bpl+VvHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
X-OriginatorOrg: intel.com

On 4/14/2025 1:23 AM, Ingo Molnar wrote:

> I think we could now start merging the rest of the APX patches, for 
> v6.16 upstreaming.
> 

Chang, Ingo,

The series looks good to me.

Functionally, the only change I have requested is in patch 7/9 to add a
"disabling XSAVE" message to the error print.

The rest of the comments are mainly about clarifications in the commit
logs. Feel free to ignore them if they seem redundant.
