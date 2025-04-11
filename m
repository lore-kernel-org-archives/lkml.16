Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE21C5489
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384945; cv=fail; b=WtOSimRJE1cgkGvIMjpOBIsspBGoXrA+9F5QFgK4L7vjMz89oOEsg3GB2tJG69azbfOeIoVWpNVdTtIDSZn5a3aph20lzyANULWdO53DZmHOl6X22ikwwEMVsHsIbuW7tn/vtANyAC0Ov6U4rsB6qXT6bPhAFbCuxkUk60mZgUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384945; c=relaxed/simple;
	bh=fPj+VgWo3d7INXQcEpW5U85401DW4GO0tUcii7bPQ0Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tY3P6VEcVU54sn3yGhB+84mmaaL2nNFUHRCO+ZYsyKCRQgMmNsjR0+84gccJsx17aM1B3x97uorpqeAMYqfnrNyTNF474X1/6/0hdP8PB+v7DMF6TyXnP5WXFj0oe7gwaAGJ3w/J3PJsRbOx1kOkigiHP0kzF2a0nSCrHIWJ7GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fd1q/GON; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fd1q/GON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744384943; x=1775920943;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fPj+VgWo3d7INXQcEpW5U85401DW4GO0tUcii7bPQ0Y=;
  b=Fd1q/GONriCWKWY5fQbYUDwrHaR5kqys5cUgykP+bR4O7NNj2918+Kpx
   p2nSIhSK3arXSRrKXEha6cKg9moe0+feX6163REB7Y49vK5M5ep54WQF4
   HY1aKnBtlwBXhEw9SOkguqRddr4RCW1pU8qLIMbvmCTljfA9oK4jmA+PI
   L2WFtJx8t5taq/oOZyGN2JxMwoZyPOJo9GUlLNurAJpNHY9Tf4Dk58aQn
   esuwxsJO4V7UkHZ9853S7hXfiI965aWf20TbPpvs5MEv82myoen2+jp5F
   8uXToVdWwfVVDDO53YC5OKyqY7A8lazd3S+f8y5VD6FBnZLfsrrd+DLny
   w==;
X-CSE-ConnectionGUID: HSE0cpLQQaWN3po6a2GZMw==
X-CSE-MsgGUID: TLMML9dfS8yi4iqP+PrPwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49593037"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="49593037"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 08:22:22 -0700
X-CSE-ConnectionGUID: bv0D+bXmR8ORk8gTpa2tqw==
X-CSE-MsgGUID: BCqSv1ziQTieRCfWO9FQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133328450"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 08:22:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 08:22:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 08:22:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 08:22:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGYyiaW9bCDo5IlONBFMi+E0HwM0E6Q3ZlTjIXLAAhqeKlVhb7WlyHQygSRIYDn66oQq/PLphWinWz0AfVy1Tlmc9z/RTkh5s4fLKT8jA1O1gbcEoI82KFfFis+PP7DS036idmLlJhCctbnAhsGOT+yEoF7k4vVfTXFXgqVSASGARrsMCmgS0bgoaeFlo9f73y3RZU3MJudRW/4RH5ubNWtpOPKhWLhqCk0OgW5ahfPvo/ST1b8/GS1SSwG2W+T+v1H4dj7zcqiC/hy9CFdudXRrzEem2u93gLUCHj3sdthtgt9v/CNXKtHz+HDzy+rmhplzvruw7vnpVHl23xUy+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97fQiomMbH8eAJ6WIYPN5ueKPQKzkKMTQ1juTaENhrQ=;
 b=EXae/SbN+2ODlonaEXPqUW3F+lRXeYJTDBFoHCosPUtoferMlUR3r2ht96VNPF19hey3UzvBnbxnXDDXZ2aA8HCKbDo6Nc99EeQll4qiL/eUkRsQdbWKoo3pwyQH3oLTZZsvHGcvOUquSFiWRNWkRpU3F2Ecw+i/1PKwz1jEBvc/Sm9sMFYJ8rtqwUG/YFNgHvXUkWQdUUtsfSrPNphRLMfNLyjQJL/iwNoNNW5V17x9hviIxJ95HQXDLwl0ruPe1lhkOS1LAqEPddIGOsQBdHoJQX9w7dqrTJxrzkd8QFp56UYXe2Hri2pG0Ui5n3hzgYI0j1J5k998ctSvn7FXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Fri, 11 Apr 2025 15:22:20 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 15:22:19 +0000
Message-ID: <bc06b0e7-8325-4044-93cd-a365ea745c0a@intel.com>
Date: Fri, 11 Apr 2025 08:22:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/fpu: Make sure x86_task_fpu() doesn't get called
 for PF_KTHREAD|PF_USER_WORKER tasks during exit
To: Ingo Molnar <mingo@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Andy Lutomirski <luto@amacapital.net>, Dave Hansen <dave@sr71.net>, "Brian
 Gerst" <brgerst@gmail.com>, Peter Zijlstra <peterz@infradead.org>, "Borislav
 Petkov" <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Oleg Nesterov <oleg@redhat.com>, "Thomas
 Gleixner" <tglx@linutronix.de>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-7-mingo@kernel.org>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20250409211127.3544993-7-mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bda3cc4-c8d6-46f5-7ef7-08dd790ca64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmZYOWk0RFhVL0E2VjYwZlVsUHM2VlhBNmZJUE11REN0ZDJUUUgvR3ZFWDZi?=
 =?utf-8?B?dUhkc01rNUJraDIyazQ2RHVLU1ZTTGNibUQzam8yY0cycnRIcWc3UkczRVhG?=
 =?utf-8?B?ekRNUWcvUS96WUlDZ2FVVkNnZUI0Ui9RSEQ0azVKQmRQa2xqdVhpZDR3akVl?=
 =?utf-8?B?RGdrMDV1Z2JzT1FOWG52VkZrKzVQVDc1S0tRWDIvSE5wTGRYM0J4bGgzMmhH?=
 =?utf-8?B?a3Fkd3phejNlNWFlK3RqU3VXcTRFQlFMaEIyNW40M0kzRDJaZjA1OXBPUmxy?=
 =?utf-8?B?VHl3emdBTjFnQ011QkxDeEQrTlRGL281VWdublk5bDNaYk9Icmxqd3ljZnBS?=
 =?utf-8?B?WkhNaENQMVZwTW44NjN4b2NaRnphTkRPSUlCUnIvTCs5TDltSGRZbkoxOGNh?=
 =?utf-8?B?QlduaDdaQ2FOZE9MYTFMaDNvU3YwVnJpL0M2MWIzN2dXMmZ0MTNjUElzQjIx?=
 =?utf-8?B?WTM3Tzh4RUV0RWtoTlhFL1JGYjdIOTVmc0hlNHRsQkdEZ1g0Z2MzdURWbHRI?=
 =?utf-8?B?eEtOU2xQdUVBem5rU0JMNkR3b1cwMWhHcGVCUlo1Kzl5Y0ZrKzJBTHdkbG9V?=
 =?utf-8?B?TVNaK2hFaVlqNGwzbWZtVTdtdGdlT3l2VzR4Z0ozOFpxZTFJTVllUkRQbWRR?=
 =?utf-8?B?V0tTUmpTcUUzd0drc24vcS80cFAxZ2daSlpxWk9yM0FwQzdtNUlGQUpaT3pS?=
 =?utf-8?B?QzBlRHBZaU9NRURHYzByVTh1YVIyWEFob2VDSFRLZzlZd3BSNWVBbnBiNTIv?=
 =?utf-8?B?MzdpSlBNT3l3eDAzVjN3MGtsZFRBTE5aQnpiZnZNeVNIWnhMNjNaVi96K3g4?=
 =?utf-8?B?YzBoaVhjWUdWOGlOVmo0WFdVSkdIU1pUcXF5bU5yUk9panRDdU5rRzM2eG05?=
 =?utf-8?B?bzhTZC9WNWtjeUNjUHg4a1VjaVNaQytjMXVHS1RZak53eExXSUlrRHR5T1JX?=
 =?utf-8?B?d29Dd2U4RnZoRmpWUWJmOWlLb0V3b3lCRWFxMlBHUC95TlFOL0JIckkydTNW?=
 =?utf-8?B?K3ZuMVJLaWltR3hOUnNQT0R6dENCeGFmMlVudVB6ckFpc0JlNDlRZ2NvbzJh?=
 =?utf-8?B?TTZwYVNGUVNaZFlmWXFMdmtxamRrWXpsaFBZd212alJLYjJpcU15QjVVV3kx?=
 =?utf-8?B?MVVmME0xZ005ZXdrbk5vYzRnZ3VOa3UzUWdqODRuc3VjRG1HVHVudkxFZzQz?=
 =?utf-8?B?MEt0MXdvYTFrczZxUlN6SlZxVlU2Um5ZTXR5a01UZzlNazFPajRLQVNPTkY0?=
 =?utf-8?B?d2hidzFGc3UxMVhSVGJKSnh1MXlXc01vYktRRmxaMEtWM2w4TVNYSnYyWkVC?=
 =?utf-8?B?Vm8xVVVMS0xHeDViVXVaV0ZkOVJGSmhmdkhuZkxsQmVrdEN4TkttWVU0VDhD?=
 =?utf-8?B?NktwODliQ3cvWU5TcU9COW5zZjBMdW4vVGVpMUR0aFNWdmJNS091TGk1eUxw?=
 =?utf-8?B?UG14N3AvK2VtMkFDRFNPMmlhRnB3VXNIcUtBTnY5RmRHaXlSVU9mRTRJdEx4?=
 =?utf-8?B?TW8wRkJtWUh6dUVNZ3JvVGsyNkhmR3Z3QW9WbXVmVUlpQWsvMzRUdVorN1lt?=
 =?utf-8?B?NU5DLzJlc3ZHSlc0c1VTQ3hZQWJXb3NYWEFOUkNFS2hVcWtzMW9peEhqNUVi?=
 =?utf-8?B?WTd3b1hYaDROcWtCV1ptYkR2ajVJZUJRZGNnM3BYUVJaZTV5TVFuWWZkTDAx?=
 =?utf-8?B?SmlGMkQyWmgzNVhyNmRrTmdlTnN3bkx1NXlqREFXUnpNRGRuUExaWEdldFJ2?=
 =?utf-8?B?c2kxejU2SFpKRStVaFZTb3Brd2c4RDdDMFVwYVNvMTZ4UW5yS2RpNTUxZEVj?=
 =?utf-8?B?UDVhWnFlY0hrTElRblk5NFJSZ1VlY2JkUkxES3czeFFZR3JlWXNFQ3ZvZmg1?=
 =?utf-8?B?Z215WlVUNVhOOFJxc0h1aW4yVmV2YWUyZjFqOGdqdEZranhIaDluUkZUeFJK?=
 =?utf-8?Q?kuLX/4nzU3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkNqQThuZENXOHFSMkMwNVlGWVl2ZUltY3dXQnZIYW9JUHlJcDEzZDRMWUZ3?=
 =?utf-8?B?K3Vvdm9IeDQ0OEg2bEZZTUYwM0I1bUU2UkIwcVhQcWJNUG9zNEs3TmNTSGJF?=
 =?utf-8?B?TlU4K01xSkY5dHVpUzZ0Y3BYVXVaRyttU3A4NjFGRnYzZXF6QnJaRU55VEt6?=
 =?utf-8?B?dmFSZ0M3a2gwSXY2a1ZkYjhiZHY4MTg4d0FtTTIybDR2UDhsVkwvRFNPRFVZ?=
 =?utf-8?B?YXhsUzgzdk5xY05RT0JVbWVaTVhwRlV3MjVFNGRiSDUxL1NFT1pOQkpjNkxz?=
 =?utf-8?B?NkhYM0V6NkxmcWxSdUhhSFNiK1Z3VWJhOVVPTU1RRFI1aE9WSks2ZXRLTEti?=
 =?utf-8?B?K3lFQkpYQlpkNXRXUVlIanovSnRSY3E4RkxNMlNWYU9zVk1vd0tMWllERVhR?=
 =?utf-8?B?NTBHQnlYNlVnaUtsRDZ4NVB6UENYUG9UUGdPaWQxRHNWa2VWanVkTUF6cnMr?=
 =?utf-8?B?SS8vZmNYS3cvTmxsSnQyM1RLT1VyV1hEWFh3MHBzRUpja0NCSk10bzNScFFC?=
 =?utf-8?B?VCtsb3FtUmtmWjZubFAyQms5Q3R6V3BLakJ0Q3hjS3dFc240MlI4YnRFRFkv?=
 =?utf-8?B?NFUycDUvMUdiakthVERBOEtNY0NiOVY1QnNTeDlhK0Q1bGdNVWhKU2ZiQlpQ?=
 =?utf-8?B?cXc2Tko5WjVQRE1jeWJXeHVIL2F1ditiMWRpWUsxdTh2NkZHM3Y5dExuWmdB?=
 =?utf-8?B?NTFKT2xGTHpUTGo2bkN6UytzejZmeUNFWmx2K3BkOXNETFp4Y24vdEdKRGpo?=
 =?utf-8?B?WEZtVHIwYzA4bHRydm5QRmFFWEFVajV5czNHc1pLQVdBdDBXR0VsSldjSDFs?=
 =?utf-8?B?dWtROE1hMFFVMEh0cFljNGlJSTNSSmV2UE16cnVRbCtQN0JDd1VpZTQ4K2xB?=
 =?utf-8?B?bHk2Ui9sNG1aSFQ0MTRxb2s1ZnVOODdwQTUzYTd0Z1hkWjYyVzFDYXBncW5K?=
 =?utf-8?B?aDl4Wmk2bVFrRisvM0dWQUl1dUFxbFJGaFFhRGNsME1zblZWS0Z6bUJGNXZo?=
 =?utf-8?B?dmQycmZUclFXNmV3bVluVzVHU1dWWnBObG1UZDBjR2NBajlTSCs1Um9jU29U?=
 =?utf-8?B?YnpBSTBEUlpFNTl6YmxJeEE0SC9wTzlkSTJOdWNudUZPMFpQVVlscldKWEpX?=
 =?utf-8?B?dHUwSEtpSG00SS9acUxTYVBUNEtTOUJRUEtwUmo2V3RRR3RTN1U1Y3g2SDVr?=
 =?utf-8?B?TFNhOGdGenhQQVd6dFR3UkxQZWVxSGdSYXNCYTVKT05hVmp6dE9TZlRFVEhy?=
 =?utf-8?B?SElnM3F1TWc1SUpFaHpRTVJUb20xOFB6bVBydG9WTlBad2xndUowT2J2ekM3?=
 =?utf-8?B?ampkaE1mL0VPV0pEWXNZZWtyUktnSjM5QVJoRHpqUFd0RVE5SzZTdVBWdUkw?=
 =?utf-8?B?eSsyWXF3T2haamQwVWJIMVZKY1hSQlhycWMvQ3Bvb1diSEdtSEtLL1dkWW1B?=
 =?utf-8?B?UFJxTGQrSC9rSXRNd2hEbFliQVp0UGRMb056RFVhWTNEV1RMK1ZNN0FXY3Zo?=
 =?utf-8?B?Si92SE40OXRpbk5uSDRqbjh1VWFBc2FrVXRiamdrd2R4d1hjN2RXNDdUczNO?=
 =?utf-8?B?NzRwUXplS0NsUVBHVGZzREJqQWV5TG8xK2xGVDEvYS9GcUlDanFyaVowaHNv?=
 =?utf-8?B?elZKTjlOeVk1WFpOVmtuMWdrQ0U3UVNKS2NCcDZsZWhndjNTa0JvMHpRR00z?=
 =?utf-8?B?ckkyaXVLc3VRWXo2NXo4YTliaEQ1elFTZnBGWVBJWkoySWdiWFQwMVNYSm9j?=
 =?utf-8?B?SGRuWDVoT1M2V29jN0ltWkxWY2I2cmRMU1ZaTXRQNkRobUxYQ2wvRC81bnp6?=
 =?utf-8?B?M01GU3VxZEY3MUNuM1BmMEZFSWkweVBJN1NNR2xmTERHUzlXQ2M1QWpVdDFI?=
 =?utf-8?B?REhBMllkVG5zZ2JxU3dQN2NsNWUyN1JrRU05RjhWUTdtOE93UWY5MFFrV1Zu?=
 =?utf-8?B?WVR6RkRqbUlWbC95ZXl0aVFrYnEyeWJiQ0FNaFRlNFF2bGxaY2JrY3FCenZ4?=
 =?utf-8?B?bHFzSlE4WGV5S1RVTVg0V1Y0MDdSaWxwZWpmQmN6SWZsYzYzN2xVTDFCSFBS?=
 =?utf-8?B?dFcrRjJKVTlzZmhsSmxiRzJtZFVUK1A2UXJ0bDBETmlybU96ZWZTUXZDOEtY?=
 =?utf-8?B?YWwrN1R0ZjBmeXFTamJvZWh0aUtBU3FuN0g4RDlGL3hMVUpTRXlUekM0K2dh?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bda3cc4-c8d6-46f5-7ef7-08dd790ca64b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:22:19.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zocFS4EpcVCjHETBu1FINXOJu57/8nYOWSYJBGK6IYTRFmCde5txob3CxRVsLwly2Im1/ROh787xWZKrYxcudA6DEmYezKkpJZPeqwOin0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-OriginatorOrg: intel.com

On 4/9/2025 2:11 PM, Ingo Molnar wrote:
>   
>   void arch_release_task_struct(struct task_struct *tsk)
>   {
> -	if (fpu_state_size_dynamic())
> +	if (fpu_state_size_dynamic() && !(current->flags & (PF_KTHREAD | PF_USER_WORKER)))
>   		fpstate_free(x86_task_fpu(tsk));
>   }

Looks like the AMX system couldn't boot properly, and I found that 
referencing tsk->flags here resolves the issue.

Thanks,
Chang
