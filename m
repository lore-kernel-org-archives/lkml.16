Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC68C1586CF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738358938; cv=fail; b=pxfRjxXCrkHEWyT1WDHIzQJkZ9JmzY0LOSRMHgdvETXLIGNq/SeWR/VnZNWw+KFTL+w9tEkMvLfP50kSF/pAogkWuaufIG8gqJXvQdS2Y16bjT0nw9BWD9a8cnHP/05ZZCF5+CFkA+B3UrQwY8G4RdjgXfsBHqI+7zjWW0nB5mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738358938; c=relaxed/simple;
	bh=Zspfims4mzZZGTt6mTv0bPr18EQp/5r0uM4yjdhbvas=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sIa5opMqvZqv9fNLZHDVJSk+U+E92JGK3txzPx8gY5+8WpEFyslAghTIh0PaXFe4FOetRCERTQgZnXJs342U19y1IpgWK8UUOp8GI9fmdaDWEsgytbiztC0s+zzy2XKxffAnOT+aXr4gh2dWH3MdTNFMIHFBpC5Hf3MxAJpFEwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pyp15zOR; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pyp15zOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738358937; x=1769894937;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Zspfims4mzZZGTt6mTv0bPr18EQp/5r0uM4yjdhbvas=;
  b=Pyp15zORaFW5PG+bxIXmeJDIaM6pj3RVOqD9DgZgglhRCi8TuoOp7Y1Y
   8p/f7iM+WcHZKyX9ATTFjXcWL1bFiJG0jdr9m1wVJDxLogiw3EJN2zFAO
   UcKRnzxv5xEgINTJ61CSMrgQafXOgUrZ10zkZw/on/ghKeLerP6mRQm4M
   anXd3ZSxGJx9LCPqbJGw7QR55gGUq/XKUcDxRgp8Ik3j6XujC6so8pqYA
   R9zOZJqk2f1sbbNaLypGw08wkSIgJ6ii2Dtm8GrHGoRGwPCV5iK7Zly5O
   oJ/McWxYnF/12kzDJVmfSp8S/8mnTNOPgqFfGt23yC/Ffmq0KDVz++ayL
   g==;
X-CSE-ConnectionGUID: ajuwiOK3SCiefl0/MLY+Ng==
X-CSE-MsgGUID: dh8ryTx9T8ad8r1fUH4T6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56365014"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="56365014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 13:28:56 -0800
X-CSE-ConnectionGUID: P39l23PKRyeE/c0ogE+nAg==
X-CSE-MsgGUID: ZNPQKYVFQ+2SBX7w9P7qDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109563055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2025 13:28:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 13:28:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 13:28:54 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 13:28:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFVSsqMQ0GyqXtZcmiExh749yt6RIVXomXoJ76Bb3lBnLEpEB4pwFcJgvDrudbS4d2zVXkk02XpdYJ5LK1EMnUjZ2fpaa+7P46GdJObxIx3BdWeyGxYJkfzrXAbxD2JITaC/tPt32KbaOxQQuW7k7OVMvnkiL8rpVAnR+3wFSOKb3otVytBAgluAH2GXm8UDIlJkDn5t79wX/7AfqTe8DifvyKJGSB9G9Wbt9Q4CcCHyZJRjI4YMWrFVj4U/caQthj6uJr5F1fwUjQkp9QqI8JtvuGHTdGiwGbQTZ8ZlEJs8KChhXRy314kZK2QrGg9kiFv61mozj48PruR8nr3A4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3AYhILfPTLj9WBz0DjHAHrsRer9+FFklzwtQJO1IKA=;
 b=N0jeuBWoCCm2ALGdUJpHQfnhciR3p3oWULDpC5R/VGDX7RQiG/R7GVqPxwVgLqIn5+vEsOOrmTOpAFaHmO0N167MY7xDBIGSBF7FWBdycqSl49Nz6saMNAyVxnV6lTPVL7/RzbUY5y0XQZ5iGGCnC2KqJBCNotgmh8r54g1HMU4cZi1og4/b9UhTn5KqlwfPJ96+fiWiy3uRHiD9CFSCIo1uo8t2SD5UKpmb8lgsO/1iIJZm4BL68XQg38wxVLpmzOXbm8+vo4cMAdWZ4aQTJuo4ktvMHGfU50EFd2zFQjnECBeKTDQyZv5lH8q8Ih1MkEVW0gciRlyiAqIPYUf/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 21:28:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:28:52 +0000
Message-ID: <a6286d1a-33c1-4d36-a93d-94afbaf9cbfe@intel.com>
Date: Fri, 31 Jan 2025 13:28:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Change maintainer for RDT
To: Fenghua Yu <fenghua.yu@intel.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H Peter Anvin" <hpa@zytor.com>, x86 <x86@kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
References: <20250131190731.3981085-1-fenghua.yu@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250131190731.3981085-1-fenghua.yu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0346.namprd04.prod.outlook.com
 (2603:10b6:303:8a::21) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9d07a5-8bd7-4dae-8c16-08dd423e424f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mm1tSkJ0SitRWUNWdVhSWFpJak5EejdJUXkxYUYrZDhjNkZzSHp0NDRvNlkr?=
 =?utf-8?B?a0F1WTA1V3B0c20xZENBVHBBdE5xVUhEb1dBdytrRmU3eXVCdWNSQldobVJY?=
 =?utf-8?B?RzIzckxnWHpCUytCUUwwWS9ZVnorMmcreDYvc29FSVluK3k2ZEtqTWtKSzZV?=
 =?utf-8?B?eHhoelFMaTdEQ0hoUytCc2x5dGlMNG9wVTljRDhEM2NhQVRBcHZGeEMyNmtH?=
 =?utf-8?B?Rzd4UG83L2xZTlFxK3IyZi9FTHhwTHJNWXMyMGsxMnNuVHNnRldkTlRIb2NB?=
 =?utf-8?B?UUVpWi9WQkxqNnFpVTZkZ1gyenFXOXZ3dy9oWlVreEk3SVR4emYrYmtNcnJp?=
 =?utf-8?B?R3V0ZjJ3WnlSR3V0S1RJZVdCM0hvQWIzblBQb1VtdWtpYnhiTlhrV3RHbUZa?=
 =?utf-8?B?S2lNN3VWMTJFRTJRT3IxYWV4NFBXK1J0UDRwNHY2djRrZFVHTVFoL3RNK3Bw?=
 =?utf-8?B?dkFLNXBCTDRTUEowTzFWZGJ5YUM3QWZzUnRGSjI1ZEZnOTNJUWRrVzAxYzJF?=
 =?utf-8?B?TzVUTk1TUUpNQ1FJcmVJZ1ZjeDlXblJTU1kxYVl0bHJaOGVIUlI3Z0lFWW9X?=
 =?utf-8?B?R0dzNU5xZlM5RXJOMEdEaUNKWjhTZUJZZTlXQWd4V0Qvd3FpVmNWN1dJeUxm?=
 =?utf-8?B?bmZTL096aTU4QVFpQ1lwcWZad2d0WTZxUThqSzRWRE5FRXFrL294VFFCS2hn?=
 =?utf-8?B?S1FZL0hQNWt6YVNvN1lYcTNtdTV3M0E3U1BGR2xlbUlwYUVsdk5vclRaUUJL?=
 =?utf-8?B?QzJIZzlNcXNHL0VCTzBlbXZEZU91Vzc3ZVBhekdzRnowUGYwb0JrMlorK3l0?=
 =?utf-8?B?Zlk3YnRRVi8yZnJSaGRhdCs2SDJqUXZOcVJUa0VLVXA4L2QrZ3Yrenk0cmNl?=
 =?utf-8?B?c3NNQjRWWnVmVXdFTndUcEFnNU4yYmVyLzZrQ0hwbWZBRTdud2x0ZVZzNFFD?=
 =?utf-8?B?aWU5M1JQU21pcHlSTytlS0p0TjhEMFVoZ0Y2d2thSWRNMVgrdU5tMFZFdVBC?=
 =?utf-8?B?ZXMzT1ZBN083d3ltWmxlaHdCOHZ1VlZUaGNsVFN2VE9VRjl6SVZUbDErTHNP?=
 =?utf-8?B?Mm00MlgwVkQwaE92VnBRWWhUNmJCQnpKU0VJVnRnOUUzaVdhb1FHc0dyNHc4?=
 =?utf-8?B?Ym1icUloU0ZXdVNCL3ZQVHBlQW1oS2NTVFZ6QW1Vb2dhRzFCUzZvZ3FEMVVW?=
 =?utf-8?B?NVYxckhxR3BSVGIzQ3FMY2lmejJNeUc1OG9rcVdMcVkrWVdzdWUzUmpjaXpq?=
 =?utf-8?B?RTJxczExbUdoTjBJb3JzSnBTTDRmbHllT3U0OVRzQmI0Q25VcmkvWk94YzNt?=
 =?utf-8?B?VWhQMDBza016OVA2aEpQTFlPMEc2QXByWWFNRHIvT29sK2ZTS3YvMXFWdVYw?=
 =?utf-8?B?MXRXL2QvWElSYUtZMnZIU3NJd25KMEljREpWajYvM2h2YjJnTkw1SUxMZTFH?=
 =?utf-8?B?QlJ1QXVvaytuT2cveGR5RXlNa0VlRk51NUhZWTZxTXV1Tlc2Y2RRRkx6N2sv?=
 =?utf-8?B?dFRXaDFHK3RLOWRpTi9FNUsxUGV6VFkxL0VpY0dwZkdQbVJWeTF4VkZ3b0Zw?=
 =?utf-8?B?L3FPVGdkYUVSLzVHbitlWktDRzgwWEt4SzJCWGRWWGNkcU1LYlg0RTlhNE55?=
 =?utf-8?B?bFpZMmNiUm5MeE5Tdjg0OE9wakNTc0FLSGFtNG9DRXFvUFJaV3RYaHBRQnlT?=
 =?utf-8?B?NkZaVjRxK3Zwcldkc2puZjFmZTZEUkVKaDZRZGQvc2JMb2ZsR3FaRjRteXJS?=
 =?utf-8?B?ZVNPMlY2SjV3MmY1bjRaaG5lYUF3cEM4ck5TUmxaWmczcUduakhBVkhDOEdn?=
 =?utf-8?B?SUdLNnBkaTE3SURsb21XNmZKY0syN1YrZEc5YmNycDZyYTNVMHVUYkZndEQv?=
 =?utf-8?Q?h1JPSEzYhZu3a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cThySGZjR3dMK2V3TnhzTlFwN24xcWtKOE9ZWTVMaHZDb2Q1dXNWbGpMS29o?=
 =?utf-8?B?b0ZFaFNoRDZpRWZxYm9EcTZDeTM0QkRPL01HY0pXaU9leGhEUnl6NUdMQXJN?=
 =?utf-8?B?aitZdkpOc1NPNTFnQ0h4WEduQVhZdjlMTzNNWnFTYW1yMldMRzgvbEpaYnJP?=
 =?utf-8?B?cXBOaUlwU3BqM3puTnIwRmJmT0djRGkxRXk5ZUxnaVArZlR1K1puUkxYQXVF?=
 =?utf-8?B?dkJCTDFiVXZrTkJZaFlrRU96OHZ3WExrN0R3NVZncFN1RGU5NkFhZ2xYaHEz?=
 =?utf-8?B?VnZnajZHaHJzbUFOWU9DMEhjN2NVUm9heE5OUno4aU9KL3ViVXBRUFljWXU2?=
 =?utf-8?B?ZG1rSzdwSkEvc0xVekEraGUxa3MwL0VKUiswaVBXQXpRWXJ0UFJpWnlvajdi?=
 =?utf-8?B?Wms2UFE4bGNSWjBudFpEb0lYY2YwNXQrVEgvZXIzb1IwcXF1R1JVazZIZEZY?=
 =?utf-8?B?c3AybVFFN29RZmZ1b294R29Wa3JQRkVwcHR2Yk80QnlJUU5rbVBxNHFkeHQz?=
 =?utf-8?B?ZzVjUDhnVVlnUTQ5NmF6OUxHL0hwRzYrM25kTkFpWFpNRXF4c0N2WmtpSDln?=
 =?utf-8?B?Q2Q3STV6dm9SSEJRQ0syY2ZlbmUvTmc3NVBUN0w5M2MyeTNvNDgvdUx2N2hB?=
 =?utf-8?B?b1lRWjdXNk40MzdGY0RiSDhsUEg1NW5LRHNTZEVMQitTSWRPYStkQUNYZlhN?=
 =?utf-8?B?OTJXTUNFbERHS3pQK25maDFPRFU4VkU5a1RZdjI3YjM1eGRFaXVQcHFPQmNT?=
 =?utf-8?B?d0ZxQWpTQUxZMVVxTEgvdVBMQ0xUYWZaLzA2RC9lQ2NqbFpwZkFuc2RaUlVz?=
 =?utf-8?B?eTVQOE1JUWV6VFFlVGhseE5aVkk0M2kwbFR6bXRkU0ltN0d4ZUlWTnpDcy9W?=
 =?utf-8?B?OGZpMEx0WW9WL3oxTTErRWFmclR2ZzRsRDMzVHNQNVY4MC82b0hnVFZ3QlhS?=
 =?utf-8?B?REtnQTMycXRJdU5iTXVncytrT0lNYnJxOStWK2ZvTVpHUzBpaC9zSmt1SHI0?=
 =?utf-8?B?TCt0WDhGSkwwcFdRVFowVGs1MnlVbHZvdUxPcDFiZi9Vb3R4a1F4Z2ZtRVlV?=
 =?utf-8?B?NVczUG5RQWlhS2tST3U2eVUxTk1BeTN1M2J0bzErZWYzSlZLc0pyYTd4ZVl5?=
 =?utf-8?B?S05ETm9JZGg3cDBHK3RxdDBWdkhhN2RiSlhPSHlMOFJ2aTRsZzFQQi9TNGY5?=
 =?utf-8?B?YTBmcFd6SDl4aWhCUGpiYlh6WFBrWTFLdVBBb2loSnVlQXNFYWVPNUF1MTlt?=
 =?utf-8?B?T0xhdUpROG0yUFNkVCt1TitSM0hCa0NZeWhFR2gwcytZSEk4dXNNVzdtb1B0?=
 =?utf-8?B?cm5Ga3ZKNUU1cjdqL3V4SUtTTFJPRUVIMjBUSU9ZRmw1cVdubVdMZTQrR2Vx?=
 =?utf-8?B?MXVVRnkwOUkzMkN0alhXN0J1TmhXZUNNd1JIOGxvbGlKOGtHakd4bjFFZ2JI?=
 =?utf-8?B?bWE4dGJTZG04dVFYZm14TkF4YWhHQTJubFZaSDJCMFd5Y3FkSDJWUG9odE50?=
 =?utf-8?B?U3k3V1RTdDhpWjF4Yk5jMWFkUFp1V2lpMFlmMUk2bUtSRUhueGRvZDVGNFJr?=
 =?utf-8?B?UmVxVkpkaXhXV3JjdjRZVHNRdExCNDZrV2RhWmIxUzB6R2wreEI0bnBCRDlX?=
 =?utf-8?B?YTZQK2x6Qm1DNDlsaXA4YUEyZUkyRXc5bE80VEpIeGJpa3VISm5GampWQjhB?=
 =?utf-8?B?ZnlkU2FRLzlSRVhmU0dQS3NCQlh1eGtZMnZIdjR1M2pTRXVFNG9DTmdFb0lE?=
 =?utf-8?B?QlJkakc4UGRTOVFYUU1aZk5yUUxPQlpVT0podUlKamFLTUNkVGl2WEhTUEc2?=
 =?utf-8?B?WFpYczZyL3RGV1NOMURFM2pUVG1pWjdrMDhYdmY2M1JIZzNGTTN3cUpuNmtZ?=
 =?utf-8?B?KzNWOXMvSmlYeE9WY1NZTWd2czlOc01TOXZuWFh6aHY5RXhLU2l2Y2NXK1pI?=
 =?utf-8?B?ZGRFUjNPZTEyaDNIM25NcHFlQ2lHR2xlZ3lBVzRMYXBJcWR1ZnRzcEJFc0k1?=
 =?utf-8?B?V0FaUUlIMzdjWnptdlcyZXhBN0gwR2pVTk01b1ljRTZUbzhFN2NSbkVaSmhN?=
 =?utf-8?B?a3dNaTdkeW5HVThWY21VdS9Yb1lLaDdHZzFIZDAyR1N3TXIxN28wTDJrM3Rp?=
 =?utf-8?B?Nk4zb0dWNmxZd0N0OUtMOG5aTW44M0dFeWVBZ1FZVW1SMDNhZXIxKzRONHBs?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9d07a5-8bd7-4dae-8c16-08dd423e424f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:28:52.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAsuz4yEZeHF+5uhKMfIIdhvUMdWgukf6pF2BvCppiTXE+5Suqu1t6NLHbPdN6nLCtaAXBBNhZHiuCgNlAA1MH/156fltJxgCldgzyoxuXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-OriginatorOrg: intel.com



On 1/31/25 11:07 AM, Fenghua Yu wrote:
> Due to job transition, I am stepping down as RDT maintainer.
> Add Tony as a co-maintainer.
> 
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08ce00b6c1f3..427779715756 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19822,7 +19822,7 @@ F:	net/rds/
>  F:	tools/testing/selftests/net/rds/
>  
>  RDT - RESOURCE ALLOCATION
> -M:	Fenghua Yu <fenghua.yu@intel.com>
> +M:	Tony Luck <tony.luck@intel.com>
>  M:	Reinette Chatre <reinette.chatre@intel.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
