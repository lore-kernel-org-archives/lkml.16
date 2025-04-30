Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27028DB3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977419; cv=fail; b=DsYtesY5ntK/USnKy+U+aJQrbgDPiXkgX4KHu6DtWm6Ds7PPzSCT1FtmKltwNMwa/YSo/eGHdkeLWx7c1T5MzgG0e6If5vOj1Zv3lFf4FJ8QkleNflsUS+1EUczRzY45+ZhcYT45Pa/V90hyrAX0vXZ/Fpo73GMKrfa402yAh50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977419; c=relaxed/simple;
	bh=QBKl5kf0AgqFqDseIGdmheytErEdc0M5Fk4by80TGD4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HyFc4X6ydHlwuJa2tV9SEJRcI1Mc6keSfj55EUH3W/xH3NjrFnCR8geyB9s7cHg2XMyKYsdc8nYBgfkEnhMcHw4hVWbKsva8VYbFQfWV7sGvU/pj2pzh9VFqnShAK6DVZLDLI3MQJKuFWuzeO1H4jzxKiWL977FrSUJ7ZrHp8FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VasraSZP; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VasraSZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745977415; x=1777513415;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QBKl5kf0AgqFqDseIGdmheytErEdc0M5Fk4by80TGD4=;
  b=VasraSZPL9cyl936E1P+9aSIQxcoCZaAWAXDshbwQ3ZSOKbWYUatYvTZ
   YSH+dSLnSO+KnxtlHZLTFTREit1ZIQBCsYl1PD/wlo2L8z0q/e0vun1Re
   TXqu8wpycjdceAbeGSzPVAF11WLlLOeULqbPQPKyHJBuSWfl7kttfJrsf
   /tWUTHMCZGueA+Zc0voGjmsyT9G7StIHR2q1o+2KvIVyc6Z8InmedpYAC
   73Ly/BxTtaKMDKx823huRrbMQtR15uZv9woqDEtcEzYzjVyflZuyeSHGf
   21OVK3L4IgBW9Lo0bsipa2QuKMlW8q3Ug34v3s4qFSjdIE+Aabg9v50Tw
   g==;
X-CSE-ConnectionGUID: RXv0bZ1XRCG7yKw1Pxtq0A==
X-CSE-MsgGUID: jIz5nGXQTxCj5ufZAya/VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47502475"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="47502475"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:43:31 -0700
X-CSE-ConnectionGUID: +dSBpoyXQHm2PlpNt34/Tg==
X-CSE-MsgGUID: 5S9evQfHSyCpyc4nXONyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134929323"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 18:39:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 18:39:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 18:39:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 18:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A76NAV0izhbLTljeTZmIIZCVgkSKiVM0/mpgLqJDtbZgfynogUrcxxR0walR5BmTp7OnRneco/ibJXBhAESt07R5pAvxftv5IbK5xkAGtRMT9hTPo6TcwreMczAgUxg8O6TNWZwmFOItIpkQnbt1Xml4Z9me4ZkTL+Brzxd1Daj/m3vOBFDe/DwcvUAPOum2/91lp0PFewLl/XGcZF6usjW6eWiZQYFQekXk+tZogAKsBRWdb9dQVIB14GXdbaHAfmNbcGxJrQcGBEA7K5ApWtrtM+GcQuBbK6Hn4dZyFx3u2g7YKVdJx8IT8Le2wCA49AlHiLg1WO1MzSnUrCAc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nVuB1foeaEZGSvlWUx9iJY3P6bOBWiArDZmZPOJUro=;
 b=e/D1Cl2TScwEJ6OFuh2UIUeKUtzg1mRNhYl+ZgmuLg+5LP7Gx8azMA2YHuFpvOUSW27ps2wZ+OvCeAn32tkuUHJAv6KgKoVsAIRMbtKh4lQqSiv9Uat0HBxLavsOMSI639AfewPl/W/jQLDnxf5MOPWHmLqCHnsW7JWh91dE0RPaIvGcKA9DhzLmM2fEPEpGhq42GhQ4s1SSfJyUMhCptL1RVLcYCggj5ygec0UFYKvQLxHbXvGEy5jrtFRXwIMJmMdkCrF2yA/cYWwMy3yogoB5b16125Eyw8UZdx6ZqRXhHaScvFncfCczeMryWAiF2JWNbCNSQTbDdfY2eyZBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8488.namprd11.prod.outlook.com (2603:10b6:408:1e7::18)
 by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::839) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:39:41 +0000
Received: from LV8PR11MB8488.namprd11.prod.outlook.com
 ([fe80::554d:de93:ab26:ae1f]) by LV8PR11MB8488.namprd11.prod.outlook.com
 ([fe80::554d:de93:ab26:ae1f%7]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 01:39:41 +0000
Message-ID: <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
Date: Wed, 30 Apr 2025 10:15:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
To: Dave Hansen <dave.hansen@intel.com>, Jun Miao <jun.miao@intel.com>,
	<kirill.shutemov@linux.intel.com>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, "Du, Fan" <fan.du@intel.com>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
From: Zhiquan Li <zhiquan1.li@intel.com>
Content-Language: en-US
In-Reply-To: <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:3:17::33) To CH3PR11MB8465.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8488:EE_|SJ5PPF7DCFBC32A:EE_
X-MS-Office365-Filtering-Correlation-Id: d180d691-e5f4-4af3-00f7-08dd8787dffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjZ3WDZZVlkrZE16d0tUMUlpMW9LOENGVHQ3NkhCN1ZPSitXdkhiYTM2WVFj?=
 =?utf-8?B?K2MwQW4xWHQ4MVg1WkNTeEF1V1FtYU0wR2JuQVRtRkdhMHFldDZFeHl1d2Zp?=
 =?utf-8?B?empWU1kxblIwak9VMVpob3JnWm1TU1EwU1RsczZWdEw4bUZydDVDR0cvQ2Nx?=
 =?utf-8?B?N3RSdEtORDhBNUlRVGtaOFEyNlgvemtmY1dwNDJHc2dSdGp1RG1CNTEwYXJQ?=
 =?utf-8?B?clZPM0x5TzV3Z2JPd29uT2pWRVlKMnRHMlRPZVNVUkhlZGwyNFVvQjRvRElk?=
 =?utf-8?B?cjhEdWNsL0lhQ3lxUHFKYmNYZWJaRDd4R01TL0VBTVFOUllDOXA3RG05aTVD?=
 =?utf-8?B?WTE0TFFRZ1hqZHBvS1VlS1dSdjFOMklBRzIwTGhPYUJFOWFwK0NOQUxKVTEz?=
 =?utf-8?B?UmxvbXhTWUJrZjFvbmlCM3ZCcTIrSElrRTE0RGg5K05SVnZxcWxJOXB2ZEky?=
 =?utf-8?B?aVNFNG1FZU8wazRUbmtPMG5xR2lEcG5LSlBsUDZlbTJLS0FxbzA0VjZDV01W?=
 =?utf-8?B?UDJzZjY1c3NKT2YwM3FzU1lSdUg3ZXdzTWkwNC9ha2ZsL3l0V1FmN0VVbEZF?=
 =?utf-8?B?QlkrMXIvaERvRFhzL2NWSkJUVUVublRsQ2hPYkJrbkZoSzVBTEZaRHo2Sjc0?=
 =?utf-8?B?SDRGdGRxdUdmOGRCRk41Z3hhZ3ozK0xGRkNTWXM5TDN2SXRnZ3crbmdXNURu?=
 =?utf-8?B?TlkvZVRGVVpGMFdTYVA1ZTVXbE9XMzFpMzEwL0ZQNmd4aU12ajlaZ21yK3Fx?=
 =?utf-8?B?SFYzVytkU3NwRHV6NUJBY1hBUitDMUg1ZXhHNG9DY09zVmV4RWkwaUNJME1I?=
 =?utf-8?B?UmJ5M1BENzYvZlFIYTZJZzg0TXY2YlZtNlVSUmVLdkRITlFpT1Bkc1kvZTNz?=
 =?utf-8?B?M2M5K1Z4ZHZrZlYzcHEraUxYMzc1NlpaY3RiWDhIeTdUcmlnd2t4SXVzMFI4?=
 =?utf-8?B?MHNoRzRuNUl2V21wcEUrZ1dqeWNxcEloRzhyeHlzWmZ2V1lHYkNhS0hXQTY2?=
 =?utf-8?B?cm0zNDJ0b2hjRzF1T0RIYTRlc1NGenQrR3E3VUtNQzhVVFp4enJTckRRTG04?=
 =?utf-8?B?ZGNQWWRKMTFVMmNKTzVHM1NCUWFxUDV3bmFVeWc4a3NCTnFyTnNGYk8rYlUz?=
 =?utf-8?B?VUtnMTJwRVNvN0V4ZnpGcXV2ekJ6M2ZQODd3bzVSSmozSGpJWkVpNm5yd01M?=
 =?utf-8?B?SVNES2l2c0hzdm9qOG1lUE5mYllzVi8wVWJFa3NOZ0k2eE00RmEwaHNiSVZU?=
 =?utf-8?B?SUtpT1g3YzN1NW1OSTNyakUwelFXYzB3ZWdlOFFQYXY4cFcvVzQ4TzZNOWRl?=
 =?utf-8?B?eXZlUExlVUUwMHppMHd0cUN2ZFppdlJJcExLVkx4emFCaC8rellCY3h0cEhm?=
 =?utf-8?B?UWF1TTNWamFUQ0Q2WlV0bkNNcTNGNktyTnBuV0MwS3hTOW0wL2ZrSjZudHRN?=
 =?utf-8?B?SUpSQW9Ic3kzYmYvM1RHVDYrR0R4NmtJbitybEpGUkpQWG5wRXBhRW1nVXV5?=
 =?utf-8?B?ci9yNHdNS2kxSVFsNTRCeGpra1p3NVlKOVZ2YmdlRXJjT3hlQnJUR0NjaExW?=
 =?utf-8?B?OXRxd0hhY2pNUzZTTk5NK2ZmRmlBc2xYaGJrVk0yOStyMk9zMlA1RXNNWW5I?=
 =?utf-8?B?REI4SjZUQ3laY3kxekF2OVNoMFkrNExxcEhRbE5xWUsxVW1LQzdqOWc3NnJZ?=
 =?utf-8?B?eEtyWlYrREJBVFpWckMxWGVDRjF4SXhWcWc3L0ZGZ3F4WW9RQkVGUWpnd3lY?=
 =?utf-8?B?UDg5RWd6eEdZSitKTHBHWGlRZzZJL2RxZ0U2TnZTZ1ZhNk1xWC91ck15LzBN?=
 =?utf-8?B?bTd4d1FZMGFrN2xQa1BzNmR4UTBicGp6ZzJRTXNUZ3Z5N1AwV2NXZm9MMEs4?=
 =?utf-8?B?Y3NvT28vcmwxQVlKM1dPOFZiTHRqNW9rb0QxbXlIcVhYM1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8488.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0g3ZFExWHUraVNIMHRWOCtSUm10dGlOL25EanE0bnloQ29rRVE5WGtoNGx5?=
 =?utf-8?B?aXU0NTBMYnBoT29rV21kSE1GTFovbFdzQ2Q1NWZjcmZEL0MwL1VMejExOUow?=
 =?utf-8?B?ei8wV0I3MC9HeTJBNjVTRjkzLzUxZWQveHM2Ly9udUdsTk01UWNBVUZDMVRo?=
 =?utf-8?B?UTJ2WU94dEZ3ckx6bkUxaCtLSUQ5N1dtck4rSzdTaUhDai8yNUZXWU9VUFJ2?=
 =?utf-8?B?ZlRQL29OcjRBNlY3cmttYnFhZW5LclVlUVcxNU8wSHhKS2s0cG5ucys4YmZG?=
 =?utf-8?B?TnJiYWhZSDJ4WHlZWmFOOEM2VzMydDdYRXhiSXloZitPbE5XdHk0eWVmaFcx?=
 =?utf-8?B?eVBvSWx2TU14NTRXU1AzaUpZOTdDYTNFaWlQSVdSZURuZE1xejNYSGVhNUVU?=
 =?utf-8?B?QVpGNThqRUh6cXcrQ2h5MUovQUlhdVJjVUpIRFBZWTVyTERud3k5R1c4YUdK?=
 =?utf-8?B?aTlNSzA3blA0RlpZb3FXTEpPakZnOUZjYWZ3YmNqaEM4alFVZXNxZ3pxNnFy?=
 =?utf-8?B?bk1aSC9TeGxGWnBWMkhyQlNXNVB2SzBXK1JvK3BkT25kaFFZN2dyVGlrVVBW?=
 =?utf-8?B?M2NMSkh0WXhEckZSY0E0dDU1QVpreW9pN1J0U2JDU2VmaE11dXJXRmV4OExv?=
 =?utf-8?B?WkxuWUM4c1dYdzNHa3BoTXpEVDh3VzhvQU14L3hMOTN6WjlwVVpWTzRROFFw?=
 =?utf-8?B?a1lSVWE0RFRlcTBlRk5ZanMxZDZ0di9nZVRCVWNPcVNJWEgrdy8ySzhVWjZ6?=
 =?utf-8?B?Skp2M0d6eDZqTGVnT3Nha1IrWEVyUE1vM04zMEtReTFNV3JmSkV4ZCsyNExB?=
 =?utf-8?B?ZEdRclQ0UGtDalJLclYzZC95QnNmSW5xeVZSQnNYQTJVa0JDR2pyaUNEOWlv?=
 =?utf-8?B?bmM0Tk1uS3RkMWpWOHFYL0h6OXJ0NlRFTUpNQi9NRjdIY3lPTDNxWmh5MCtm?=
 =?utf-8?B?WmJpMmM0K1JyVGhpVCt3MlBVMDQvRkNWRmRrQXc0djJJZUNndWtGYzlMeGNl?=
 =?utf-8?B?UzM2RVJXdzVpdFZidFZnS2R3azB5Y2RubHppazhvZXUrQkFUejV0VmdpYjgv?=
 =?utf-8?B?RzEzK0lVZnR5eTRZUWlTb2lHMFBFWjdDRUM2bnFITFltVVY5NmJ4aDNCRXNE?=
 =?utf-8?B?T21nUWxJUjdvZFBqQmxrVEFMSVNxamVEVXQwckNiQkx5cjdGakxpbjFyc01v?=
 =?utf-8?B?cDdoRUFhNXo3UjJyYWJ6cWJHYy9xUTJkV016eld0cGJmUDF1Y2l4TTRBWnVW?=
 =?utf-8?B?WlY2d09YbFpKY0IrU2xVbXZyY0pBU3NSYTlWMFlubXlXa28xNmgraVdoMmtr?=
 =?utf-8?B?dko4Z1U3UmxPMEpPT0VUa3BkR1V4bGEzeDdsR1JtRkN6MGFVK2NqUHc1OVI0?=
 =?utf-8?B?OWJmU2hkV3FveVZUcUt5d2hscFo3eHg4MUdvNm81eFExdGx3Q2c0Q29kc3hh?=
 =?utf-8?B?ZHp6dEhNUDIyOXdCNTRlb2V3eE0zNzRGdkwvb1oxa1N3ZzRQRm5QdWdZcCtN?=
 =?utf-8?B?T1lxOVF6Y0pHNjlmYlNjQ0cxT0hrc2g2ZmRxVVpLNjlTc2V4SEhvZFppaFhQ?=
 =?utf-8?B?cEtrS0RZS0tQRWFObWlVR0hRc3BwQ3UwZEtnaiszOEsxa09BUHNYZGYzMlJZ?=
 =?utf-8?B?aGc2aDhRRkg5eXhtR010MmF6NWN6SzVBME1SdmRMakR2b3J4QjNxQ3M4WCtZ?=
 =?utf-8?B?ZFZaVk1aR2t2UGtzYWliUmhxS0JrVGFXR1I3MGtHejVIc2NWN3IvQWUwL1M2?=
 =?utf-8?B?ZXRjRmZrS3VmTUdyUU5ETkxlRi9JU1l1aFM1eXNVL0RheXB4bjFJWmo5N1JR?=
 =?utf-8?B?UFRUTjJoYktNbEdWb1BZZzdsV1dxVENyQm1GaFJvNzM2WUl1TG94KzJtYmYy?=
 =?utf-8?B?NmppSDhhdVkreUkzV1hvYWlPalljV3A3c2ZXdjk4ZUZ1ZnpCcWhvcTBERS9W?=
 =?utf-8?B?OGM1ZHhkUm1TbFVCZUlWUFVlUXEyalRiblhVUitiK2FZZUV6SDdiL0Ntc1Zi?=
 =?utf-8?B?UDlHbTJHNEtVcjJEZTlaakV0UUdOS1hHNFJONFJ1S01PWlVsdjVMajEzYklG?=
 =?utf-8?B?WVF3TkJHSkdLekF5SWRjQnUwWTZDWWhMcVF0T0R1MmdJalZtaWpFVEZzdlJ1?=
 =?utf-8?Q?BaI2GVH8Zd/B5Y7F044ZMd6UW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d180d691-e5f4-4af3-00f7-08dd8787dffe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:41.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TKUPQguv+knT65bzvVshImLD/Eu+5VFnUGIv0U1fmMaCLmeI6hFYThVYRvaA34k6sTHv53tFXrwCTHNFjyy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7DCFBC32A
X-OriginatorOrg: intel.com


On 2025/4/29 22:50, Dave Hansen wrote:
> On 4/29/25 07:31, Jun Miao wrote:
>> REDUCE_VE can only be enabled if x2APIC_ID has been properly configured
>> with unique values for each VCPU.  Check if VMM has provided an activated
>> topology configuration first as it is the prerequisite of REDUCE_VE and
>> ENUM_TOPOLOGY, so move it to reduce_unnecessary_ve().  The function
>> enable_cpu_topology_enumeration() was very little and can be
>> integrated into reduce_unnecessary_ve().
> 
> Isn't this just working around VMM bugs? Shouldn't we just panic as
> quickly as possible so the VMM config gets fixed rather than adding kludges?


Now failed to virtualize these two cases will cause TD VM regression vs
legacy VM.  Do you mean the panic will just for the #VE caused by CPUID
leaf 0x2? Or both (+ VMM not configure topology) will panic?

Currently the most customer's complaints come from the CPUID leaf 0x2
not virtualization, and most of access come from user space.  Is it
appropriate for such behavior directly cause a guest kernel panic?

Thanks,
Zhiquan
