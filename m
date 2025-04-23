Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC768171A1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443757; cv=fail; b=LVHXEndpTiNCgfSUbVV6hRIsD44hF30ASi04j56PajHJZIk5Vezu9TlvSZfM7TpwzJGww+xbpjxcfwAzDDFiBqynjPV3s/PxbroYkd9GxbQ4zjNCivaR25XIXcKV5JCIRRu6e5mVd8kfiNnA44Xroxj7Pfhd24IPz04VRUzGFBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443757; c=relaxed/simple;
	bh=Xid2/w1+J2NRYhtgYymwXCfkdyjUTYPisguBzIyKif4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=De5fx59VMFJ8RW/IKovweXUC3fj9WD/RLHa0i2yCbS9a+nmaj1C/1r125L9tc3nPUdvqXVugGrNBIbKtiiRF78LPLRtAt62s4e2dwfKjRIx1Oq7ILEgVtuTGoT8W1ocfiVg2nJ6DRQCGlYzV0xGvamu7oi7liUuIlMmQXWDoD7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXn8MSS4; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXn8MSS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745443755; x=1776979755;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Xid2/w1+J2NRYhtgYymwXCfkdyjUTYPisguBzIyKif4=;
  b=dXn8MSS4HjmkOgnf8fpp6PT2xJCimoKM98Scl5o2HAXhR84KrK/NVYOI
   IJih5mxFT3S0eEtWr2UeiYG5yKDo1/utpU1Pow7LnwkR3ELahrkBd5WaN
   dOq7oG0xMk+PzeWJMrJRwp81F+jLVTubAJ27k8KIyUDfObuWaHuLis7aZ
   yxZ0OfYfL8TdrdwX+YdaRazV25t/6JJTzepwwm2hioczYUST0x/Otpp/x
   gUtsyKpUFJdTt9SUqyT6ZYV1Z+TKXM5ADFgmviQoMajpUgyMH5C5sNq+J
   tHVpK2Dzpp/5ygr1wI0xkuMiEjhQTwCHfPSUH5dfk1vKaNd0mdfez8h4w
   A==;
X-CSE-ConnectionGUID: IXk+Yn86SzWvs450AUEASw==
X-CSE-MsgGUID: nMATJSG+QWS5+hCH779KRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46175148"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46175148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:12 -0700
X-CSE-ConnectionGUID: 8nZ9hh/zTDyYAIM6dmCqzA==
X-CSE-MsgGUID: V0OghpUTSvu8ApaXyx1NwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137603250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:29:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:29:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:29:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjkP+cpmqqIuDX5dM5lMhXEZ0Dp+0aFX+cqKz7Uzj8Cn1YqLJTrVnGq9DJgb7E7ViTEr+A08mzN6DSzcqJ6UEI5R4I47z4ixWNjTi//ObXCS/RYBkSUdcNxbEVv2KPJ2TvfK9mXO4K5ZKkKdJCy8VP9WLeJGBdhGm+s4ZxWEjArthhZN4vOZ42+7NshywIXtNEaZd7j+tEeKZQUsNFF6PgbtbGbBQ+0Tx5NtO5pyIznETPpBzrmHbQ8b8d+jFgWJOJCri9/0MW9omo5XtpdZobvjZVCUmoboVZx94zXj/tHCbZPVXZeqkchiFp8pmrgaXaEYfiJ3uSYZz5WUOlJBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/h0mIIhlqN83GY7pkRfQFurzY95BpMQ8w+jEI79h/s=;
 b=lNPiBmqumqZNVLTYYXW+TbGpA6Z60+vSRDo7K5yOwLRWcNI3ICtZiA2dDbWrZunndM0d0bbQ9ZRuYHfB/8+vdVyx2KvWb3DRY/0mzNMefytM1R6hE/s0sM+KWTCHibibKXkdxrtucIL+2JykbExNafJ6DMz/vQ/x0eWwQQpkv7W+L084Bjx8pRp6HBlbmgjB4vVGbG/OiCrbCpoEuOutwXNkEsXc+hx47ProcMGcAnjOgas0UKBgt6n4AtcGtH6aCIkzBvUkYEypMJIoZ5/8I8NHCWc+6wGTW/rpBoFwxNOQk7Bc5OabeS0/+TcATjab2NZQCkBbOi9cj7AvW5mZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:28:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Wed, 23 Apr 2025
 21:28:27 +0000
Message-ID: <062e5e61-e2c3-418e-987b-33fd9009d03f@intel.com>
Date: Wed, 23 Apr 2025 14:28:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] find: add find_first_andnot_bit()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-3-yury.norov@gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250407153856.133093-3-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bda02b8-dbbe-4e2d-77bb-08dd82adc94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akhUc20vcWZIbXZJTjlyOXptVmcyWmw2OXZSSGNpdjBRWm5wY2prUTkrWEtM?=
 =?utf-8?B?enFkZzByaUU4VGplaGpaMU9lRTZjemcvM3dsdTF6WVpLODQzMnpqY0pLVzlJ?=
 =?utf-8?B?TUhxdDMybVpJV1FoK2ZDS3BPZGRER1Voa0x1MWNGMjNJSDNtaWFUU2NSaUZi?=
 =?utf-8?B?RGVsNEV0MjVSV3RlS1o4cWhiK1cxWnNTa2UwRjdLc3l2clhYNldwVTFsMVB4?=
 =?utf-8?B?K0JjQ2E1VzN0ZVcwZ2ZJOEd5MzFKZEFScEtnUDNWMG9mRjJOTGtuNUVqMnBm?=
 =?utf-8?B?aXI1WGN6ejZLNk9JT1RpYzlKOFZzcFNleGhDU0p4R1hsU0hrVXd6L2tzeDQ3?=
 =?utf-8?B?R3c3cmFzNVhJK05EQ2NZWHFabzFsdmJiT2VrbElaOHRYUWFIbGxYQlVDRTF0?=
 =?utf-8?B?eityTXkxYVVMdmI0L0k2a3pPdnFvNjhzSnMrMUd4VVFKRDhDV1JOcUtQc213?=
 =?utf-8?B?MFM3MnlmbHZEZE4wQkZseXgwVk41N0hwYzk2NEdtUUw3V2FGV2NjU3IvUkdY?=
 =?utf-8?B?Q0FRRVVGMDUvYjU0eUl3MUFjS0pMeThtakk2L2hPclRsRlFPeFE4SHVVdmFO?=
 =?utf-8?B?Y3FTeElCdFFxQ2lNUFJBdElBdlBjSnlvSm9GVWJtdXJ1UzdRWEEvYlU4cmF3?=
 =?utf-8?B?bm8xbWpsUFZoUzlQRVVvMUdKQ1BhdG1oUmdhQkxqSHpNeDVvVCtwZVAxdVFw?=
 =?utf-8?B?MFJSclE5WDBtbC9jUVRUZk9OQS9NY0NQVGJ5aFJKaHRHZ0RBc3JFNFo2bmR6?=
 =?utf-8?B?NlJ5c0UzSFlBMVhZdmpkLzY4WGszQ2RhcHB2K1V5NlNSSjJoSzFJaG1WMng5?=
 =?utf-8?B?eU85U3lLQ3kzckxnWS8xLzVNZHNQWjBLa2ZlSW04VWNLd1YrSTVJNDcxdFg3?=
 =?utf-8?B?TEZSY0lHcEgrUmV5a21Hd1VrMDZpaGF0MVIrY1VCd2dtSkpZcjNjcDQ4TVF1?=
 =?utf-8?B?SGpLZnpLbXNzaXY0NmdINm1VNm0wTHNwZUNRNWNENmJoeTBQUkl2RVF1NnUz?=
 =?utf-8?B?NDZaSVp2ZjZQNlV3YXF1YU9wTDBFYkplb2pEay9tNmR4MG4vTStRVXpWbGRm?=
 =?utf-8?B?d2pEQnhWb3NCR09HWDUvQkUrWmY1ZVpVZGJTY2ZHaFVoLzhmMHdCZnVKWHNK?=
 =?utf-8?B?ZFpHS1N3Y3RiMWY3ZXY1aHZHV0lZTk9rOEVlcGNxUmQvN0VJMXA0b1hsY3Bu?=
 =?utf-8?B?cmlRZmw5NG5yak8veWxQUi8rNVhOVTlmSFZqZU9yUWMzYUJNWWRmcG5taGo2?=
 =?utf-8?B?Y1U0bDdPNmVRV3B3V09VVHVUYUN2N2dqazNJT0tBWEdRSFpON0NCdDRTN3pV?=
 =?utf-8?B?Q1R6Y2VoZmpOMTMyRGFDenBBc2YycE9wbmJCellPckNPc2dOYlFHUmtnSkZ3?=
 =?utf-8?B?STkrVS8vNEZRRklTNXJWN2M5OVdmcHpZMFBKUlovQng5eXNacUYrdDFySE1r?=
 =?utf-8?B?REJXV0pQN1Uwa3prdmJMQkd4cndjbUNZQnpHZERJU2w2YUxBalphZGphTnBM?=
 =?utf-8?B?YUxyT2NuS2d2TEdSM0pQWXlCWWhlWkk2bXJrU2pwRDlUbDMxK1BDaDliT2lR?=
 =?utf-8?B?UkV4NDNpK0l0L0NycUwzQVFDRzZlSW5pNmFTdmVHbEtmc0NBZEhQMVlJUW84?=
 =?utf-8?B?WTAwZDJMaGVBRDVNTm5vYWNaRDR5enlselMwbmVtanVRRTJrbTF4TWtoTDZ5?=
 =?utf-8?B?cmdBV29Ta3Q5N1lnSUFCVlkzdCszdTBDYW5jdlMwanEwejR1WjhGb20waUkv?=
 =?utf-8?B?MXZyNmMwZkZnM09XVVFZVnRWbHlmYWkvMWhpNkZaTnFNb3hRSTBHZitaS2My?=
 =?utf-8?B?cldRZG1zd3FkL3ZpamtyMGxPc05NL0FDcm12NmlDd2lsVkNVVWtwejdYc0Zh?=
 =?utf-8?B?TjVwVEgwYjk4cTRxWHFjUEtyZ3pld0V5bFlFTHdmSTRINmcySGZPeTJVYXZ6?=
 =?utf-8?B?bDZLdG5MRzZLK3dnRXpFVTBlNUJBVjBxN2V0SmNoaTFveC9QT3k4Q3krVXB2?=
 =?utf-8?B?M1Z6NDU1cTVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFA0ZG9PSG5Ld1FueDFHaTZYVVY5bEI5TWh3MlhTdVVoenpUMlB4ZDVjUWhW?=
 =?utf-8?B?NEJIU1VqM2h0M0E3ZWhNaElFWWRqQjRxb3MvNTY5ZFNveFd5cXVlYWdQYkNx?=
 =?utf-8?B?NDNkc2tLZHRMT09CODR2TE1KbThxOWIyaHNwancwUEV2bkJvUzQxakplME42?=
 =?utf-8?B?ZDFvVDI4aHFHUnVKUGdrajVocFY5Uzd1TjJVTi9oR0xXY0tKVHBiMnI1YWVP?=
 =?utf-8?B?Mk40NldtWCs4Qk92UVdXSTljNDRpN25zbEJ6S3dFQUVvS0dXZlo1Z1AwbHcy?=
 =?utf-8?B?R3JiWkVJZmFpWGJHTXp5NDZSTSs1N25wbW1Idi9ONWV1eVF2OEhNNVd5UmZs?=
 =?utf-8?B?dlJsWGQxVmkrSnc2TlBRc0NBcjVkd3NFZENoMjEyb0ZxaFZGODdjRHpUT2s5?=
 =?utf-8?B?WE5TTVNtWXNmRWJiRXJzMDl6WGpkdWlRazUrand1YVl6L2lSZHVMcDE5dUN3?=
 =?utf-8?B?OWhEd0RwK1ZMWUxnVWFINzFuY0dldEVpTlVLUGhKQW9YTGY5VUpNdUxVTTM0?=
 =?utf-8?B?UHZTS29BcURmS042MmVEYS9QUnhaU3NHbVZ4amhjNDgxb0NSakpObFVHd3Zk?=
 =?utf-8?B?eFdXc3VqdWhjaVVqbGdtM1krWm5SZEdYZ2hXWElVTFlFa1ljalRVRjJ1Z0ts?=
 =?utf-8?B?S05hOHFkWGgvaEkyeHNKVysyM1JlOUhoOGE4RG8wRFVzY3VxRklHUHNBWTBz?=
 =?utf-8?B?bVI5MG1UY1V0RVFTZk5zLzkzdjJBcVg4d3ZCOVNyVjVGU2U2Q2tSWDBraVJ0?=
 =?utf-8?B?UWR6WGdwaVBTOXZucHhTZjQvUm0rZGhvUU5QeWxJY3NpalhPTmt1TDcwa1kw?=
 =?utf-8?B?U0NDN1FjdGxveFNCVnpma1VnMDJOTHozdFNuVHFKWjVLWkJZNUR1bE9EbGpq?=
 =?utf-8?B?M3hReGZpSzdISUZIMnk0ZXAxQ3d2RnZqYW8vajBTVVJVVyswOFRGREVGNVli?=
 =?utf-8?B?VDFFTE1LT0FxbXhPNUw5YUNxVWl4Vis0ZEpTQTl5dnRIcldLT0JqSDVldDhr?=
 =?utf-8?B?RXFZMWdwUDNGVzJROEFUSC81dVVSMGtsNmxGWFBnUzcyQTRERVRtWlN0ODdY?=
 =?utf-8?B?aXVyaUFLMnFmV2w3SnJRdDNGUk9CQXRxVTJOZlliTjVVbGkvUVN4UkNGOHRK?=
 =?utf-8?B?T2JQYm5MbEVNUmpDYlFsb1NhVUdjVG94VytEdFRZNFIwb3NUZlVkem9jbUxl?=
 =?utf-8?B?SnFDQ0ZCVVBnaGQzd0FWVXFkdGlEK0hPajNwTklVOFpZSDZUTnIrQmVtdWlH?=
 =?utf-8?B?SVdCUzJyWWdBdHBSQkwwNjJ6VE1KSzQ4MGRNWEh2Q1pTU3ZHb2w2bCs3ZGV6?=
 =?utf-8?B?eFRobjlIQUsydHVmckNhRjJldmV1MEg0M05WRmg0NHZIVFY1eFpKL3lpRVpH?=
 =?utf-8?B?WUZGbUVTcXRTT0NKWDJZVW1palpiaGlzOTRHd2NBWDB4Mlh6VGR1VVcvbGcr?=
 =?utf-8?B?WnowWG1rT1dxVU5HdVQ4T3p3QzRkbU1PQlRFWUo2d0FrZEk0c2pidGROMTVJ?=
 =?utf-8?B?dTFUQTUyTDU2RzR3b1I3OWpsQlRUMG9OKzE5Y3ZHTkgrT2Y2MGM2NUhyWTBv?=
 =?utf-8?B?c0tBTUovblM3MzAzWHZaUkV3K2ttY25wem9iVU5nU1ZOMXl2ZHFDdkgvbDVI?=
 =?utf-8?B?UGZPdzRHR0dmQWFVbmhVbVFFOTJuVEp3NmZmaHVaU3hwbnMwL2FaaWozc2Nk?=
 =?utf-8?B?U0lQUmg5SHphVmd4QkZHZTFZS2dHMEVpeTlXRjc4LzJtM0hDWUdoaUREZlc5?=
 =?utf-8?B?U1IvQkhZRkdCZllaQmVCdzNaMkN3SkRuc05ZeGtqdFlqaWc4NDB2VWNCWlZu?=
 =?utf-8?B?ekFvQjNsQlR1aGJLZzZPMUkyMzVhdnB5Sk85ZEM3RTduUkxjS3YxNmc2NkNG?=
 =?utf-8?B?MG9NVkFBaHJ2UURqZm5yOWdHRk5nT29UdVZNWFhmTmhJaGYxWEpTTlAydEdU?=
 =?utf-8?B?bWJ2MDlHTlVGM1dDK2Z5YndzU2x0dEdlTjZjMi9UK2YwekxUbVJmUWIzM2hr?=
 =?utf-8?B?K2Fla1l6eC9hakRYQ281SUI1Q3ZtNXFvUldocUNFeitkT21ZVmptRHlOaGpP?=
 =?utf-8?B?NzJYb001M2xFT1l5clRDaGhNV1hrOFUySmZ4aDdFQ1h6dms3VFVPVXFTZ3Rp?=
 =?utf-8?B?eEhsc2RtMUFidEQ2L3V5L2Ywa1gyZFpLZEVwbUwyWXRIbTFtRFJzUSs5dGpk?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bda02b8-dbbe-4e2d-77bb-08dd82adc94d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:27.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34mmsAxOQrQn41lBvLy1Qdrmxkv2zhJGgHNY7h5EGoU3F6eFKE8TrMoueLC5ZPipUR6mh/48AIW0+Q1Go/gbSV2zl21DkOjoHeQptNGTi6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

Hi Yury,

On 4/7/25 8:38 AM, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> The function helps to implement cpumask_andnot() APIs.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  include/linux/find.h | 25 +++++++++++++++++++++++++
>  lib/find_bit.c       | 11 +++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/linux/find.h b/include/linux/find.h
> index 68685714bc18..d1578cfb667c 100644
> --- a/include/linux/find.h
> +++ b/include/linux/find.h
> @@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
>  					unsigned long n);
>  extern unsigned long _find_first_and_bit(const unsigned long *addr1,
>  					 const unsigned long *addr2, unsigned long size);
> +unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
> +				 unsigned long size);
>  unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
>  				      const unsigned long *addr3, unsigned long size);
>  extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
> @@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
>  }
>  #endif
>  
> +/**
> + * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
> + * @addr1: The first address to base the search on
> + * @addr2: The second address to base the search on
> + * @size: The bitmap size in bits
> + *
> + * Returns the bit number for the matched bit
> + * If no bits are set, returns >= @size.

Should this be "If no bits are set, returns @size." to match similar document
snippets as well as what the code does?

I am not familiar with the customs of this area but I did notice that
this patch triggers some checkpatch.pl warnings about alignment not
matching open parenthesis ... but looking at the existing content of this
file this custom does not seem to apply here.

Reinette
