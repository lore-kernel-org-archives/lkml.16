Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01449461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527674; cv=fail; b=Xi36+p9heF9fcUs8vxqaOEzbe+4l64WCwP6UVPJzZe3yFemog5lB8sRA3RERK92XUBw2K0Bic4JHwF6JdLCBRQbaL7rap1hrmON1o+kBZ/44vitv3WMf0qTvFzudNiHuQdOQBCrk1isUuSzV1yYJJLEJ9powabXBBDyw0PkC+HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527674; c=relaxed/simple;
	bh=ItMhxjjmg6nDRZT6za3y5rOuj1lrw5Im2NHFch0dYCE=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D79p3EYQ59RYD/GojYapvKAXfKpZK1suLtq+r+3X2DTI77vnAJs5NEerVNhRY64y0tBMRfPQpsGDAIJy5Xl0vXPeMDPLMlnMskw6Xzqg/oFmErl3+9/ZwSJrdwU0YzZumHTYjjOhWqKoEjnd7RSyZBKWPGJis/+wQ7Hg/vit/Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsHojSwa; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsHojSwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743527672; x=1775063672;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ItMhxjjmg6nDRZT6za3y5rOuj1lrw5Im2NHFch0dYCE=;
  b=SsHojSwaz7x0bpLez84khP8H/ZPepBShQr01ttN2xB8qysxKQYQ5d8DH
   Avjv4zMyyyo5JgMbXtSY2aTP03Cxv+Y/yOuNVYaNwZyYSlVEc7FC2NVXr
   OX4KfMTqA4YY67sr6AGgyDQjlDZXDEFMzfP7xayDsQqJzAP5pl6jnpM8l
   ttOHeMhiZaSpSeb98X2VhmpSeRFhMj2i1S2ZaAsYGBcsFB3htV0RVDdZD
   jzdw0d5PfmmNmwHT4OTjIAqPlVreaUAmGvU/9qfym+8bEjHy0jbmTvZMB
   UNcHDfdHSbtgomUYvdVJx5OWJGwDgq2PXtzJMbvo7CQXk+o5NGWLf/ZDE
   g==;
X-CSE-ConnectionGUID: gXltAFbiQCmfW2zfmi8lUw==
X-CSE-MsgGUID: xFYOfKmWQKerUhXKtEhwpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48655593"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48655593"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 10:14:32 -0700
X-CSE-ConnectionGUID: Rn+/W27sTgiBTa3ZEomsQg==
X-CSE-MsgGUID: Q38vw9oFRBeKMPowWaWfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126431679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 10:14:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 10:14:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 10:14:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 10:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQiZTiAK9bTEGhXXr1LbJb7FXzUA0uCoCvbQDVJxjmy8CyWXBM42rAN8fR3ItpJ09J7WjhX2liN/4yKJEeC7BwiCf7X4EWSZwIqIbVKNmuh3QlqqrOkHJJfnUboneKq6FYZSK2qrghdP37OLsEPyqis9OH7nUxBOTxr0tQihFZxxYve1866vhsd+xEO8doHM394p46Ke3brqUD0Ik6Y4mibmacEHOw/Vv2aCQvV5Ulms1dzKTqqAdV//W0mjXZ1PM2/uxmgu3kD6IpZZT4igJQeEsOdtDZO/BwSX1KIi6bsI1kLMSM0qHhyc9arlUcuzczEYXRzN/5EphtLM2wMitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELIPy1xgFKAj7Sfq+SxUWSXiUFlRxpi2iayET1/39ss=;
 b=WTb1qJAWmCEdVbucQV4tHeWCytH/Me6r/nZL0pF7rlRwDnSm2OqkVIRn2PLbc4O5pq2d8D7mji+fFLRvytlv0UUpQbG8mYGcduM9tTaM/RpP5Ypfswzesj8cxORkLI+bhB5vEOTsHoSIr+AJkhRPVYywLTRjjgn4AGfRb3ScP/ADCbxFdjyiuQGLbA5Qa7kEjFf6mm1kMlcAKIkYv7RYuwzBhH1dx1iDRH42YoiIkW4PskEE7YI6WtlXz+AqEWy543QW3A+iFhc9IHjNGY1hhSPEKKFspt4XpUt3yA1ehqD97afnVYSggJC7Zc2GN+66IRkxYAFLDIjNn4jZX4GXSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Tue, 1 Apr 2025 17:14:00 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%6]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 17:14:00 +0000
Message-ID: <2ac2d1e7-d04b-443a-8fff-7aa3f436dcce@intel.com>
Date: Tue, 1 Apr 2025 10:13:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 06/11] x86/fpu/mpx: Remove MPX xstate component
 support
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: Ingo Molnar <mingo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250227184502.10288-7-chang.seok.bae@intel.com>
 <Z8C5B9PJUqkEDGH9@gmail.com> <1d269a00-39a1-4c64-ac00-d90abe420f0c@intel.com>
 <9985fe50-3ea5-411c-846a-dba3fe1fa451@intel.com>
Content-Language: en-US
In-Reply-To: <9985fe50-3ea5-411c-846a-dba3fe1fa451@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 08914069-08d1-49dc-203e-08dd7140982f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3FLb2FGWFo1TlpQdlVQWXU5bGNHWk9ab1B2NjZTNTdydHlMNUZtUEZldC9W?=
 =?utf-8?B?N2QrL3VtRGZCeVI5SXZ6V1NoSW4vUTFkS1JSVzVURzNsKzBFTXZyRWtrSERz?=
 =?utf-8?B?RWxzcjlCWmJHSzdVaEk0MEdrQVpvZDI4OWxzL1hxbzBHSU1ZWDdDWXQzc29x?=
 =?utf-8?B?ODcvWDlwT211YnJwc2Y0TVFYMGNIa0FPSHZYM1dhNUpYbkxZVVRGQ0RDeHdr?=
 =?utf-8?B?czFLK29FanpyVHZXMWxWQ2srUWdTanF3ajNBY2FGWTdJdFlHamxXVmp6OEZ5?=
 =?utf-8?B?UHlkMzRHeEdnMUUzbjFjcXMzbkZJMmM5UGViN3o1SWJWL3lGQ1Q1M2hwcUs4?=
 =?utf-8?B?eUtZbzNsV3BKUldlcnNMTGNKZGU3SlV6Mm5RZk9TSnF4WGV0WnFzT2VGRWdW?=
 =?utf-8?B?NDRadkc2SEk3WllYU0h6SHZ4YXE3SjZtWnVWNjhsdkVxemtZZ2drZCtKa3R0?=
 =?utf-8?B?Q1lLRDdGdHhpcmY5N1cxT3F2Y2dNL2V2Qml3anMwYThZdkFwTks2bEIzQU8r?=
 =?utf-8?B?dkEzbC9IWDV6ZzlKTlBwWGpkUUNmVWtDbllRbGs3UEVpa0pYcXI4V1c4M25v?=
 =?utf-8?B?TDl5Z2MzOFV2THM0ZkhtN0pmOW9JSStsbUIrOG5jU1M4Wm82KzFCUFRJOWVS?=
 =?utf-8?B?QkROV3hvM1ZCWmdJLzJnTm4rOXVDZEZCZkladjJ1QVp4aFNTZGFFU3BSRjdH?=
 =?utf-8?B?Uk9rcWdtaHF2T1NXOUNoNFNsZXhWckxIWXdlam1LUnZxcnptdUhhU3IzUGRk?=
 =?utf-8?B?cERZM1piajRTdUdYaHZHck4zcTF1blpqbmtSUUxoa0dseHZvY01qUk5iRTZ4?=
 =?utf-8?B?VmpkSDEyNUJiTHdGTDZxZEtCbGVoYXlLendsWmZ5S0xiTmtleWVqbThQcU9p?=
 =?utf-8?B?ZlB5S21sV0dZOGdOc0xBYTVOMWZCWlJhcEx6QkNvRU8rOGdETUVuaHZxSDB4?=
 =?utf-8?B?NmJEUEF5aTVock1iUnpUOHo0azU5L2dXSmozRnNKWHcyMGh3UGtJeFFXK0ZO?=
 =?utf-8?B?d2dyRUFmNGFaR3pFekJsQUJxNnpqaDQ3N3ltUURTOGZnK0VPRVZIbEpDT2hS?=
 =?utf-8?B?dnpkTE1mMVZuK2w3bnV3SlJlM0hrb1Q1M0lEOUpHWUcyUVJzYi9zLzlKWU5O?=
 =?utf-8?B?UVluYytSdmZJZEZnbHhIMzYxRlY3a0hPRmV4NjFMeXBhV0NVbVhyMWsxMTJD?=
 =?utf-8?B?TGRTS0xYeHBUNEJJaEFuUzRDMEtoa0ZXWXE5L1hkSGpDQUNOaHQ2SU9zNGVC?=
 =?utf-8?B?MndwUnVJejd3REprcGtMU0x5MEoxbXIxRXBDd25DRXNmdCtvNXdxNk1BUGU5?=
 =?utf-8?B?bXNQYzBzcFEyZjBpUHpRNE43QzlUTWxMYnc5REtPZ0FpQklsRGhyYXNIeGhF?=
 =?utf-8?B?WkNWU0kyWXI5VkhDNGI3aDYwazRmdnJydXBaUG95c1RuZ2p0SU1Kck9NdHM1?=
 =?utf-8?B?QkhNVTBYVW1BNlhyUUcrQ25RaVN2cnorbnAvZE9kZ1RvdU01WkEwdmovSmww?=
 =?utf-8?B?Ly9xTm4yQm0rVTBUYmEzRmlzaXNIMG5sVG5hbkNTZGJrT0U1d0tTTHoxODZz?=
 =?utf-8?B?ZFVzTUpJb3dJSy80ekVPdEtGbTRHc2VXb3J5N3JZTVhzcU9iQ3FjTGNOMHFU?=
 =?utf-8?B?QzVLbnFjbExoTTZlaUFkc0F2c0w4ZlF5U0xyMEZKTSt0RkNWVkhjQi9UVGhI?=
 =?utf-8?B?Yk80a1J3eTRQNUZuZ0pEK1E2WTkreTJXQjQ2YUd6VDQyVUNrUWF1WVBqSXk4?=
 =?utf-8?B?cTBLMUU2RG95VjZnOUpFOEVyeVlSNkVLemhsRzJLeDFPZ01PWDcyU2xLT3ZG?=
 =?utf-8?B?QzVsdHFLazdGbmo2MEhkOEQ5Y25mTVZpdHYxZkFobGxUSWZrKzF6eUhQbVBY?=
 =?utf-8?Q?RZk9U8WuSuGke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjB3SnpRb1FHYUVHNittdkZadU5Xc0pYM05pSXZRcHZXOEp1ckhQTnhJbXEv?=
 =?utf-8?B?RFlwd0dLK2NveDdxTTdLUmdXYzJlelVFQStsM0JIeDVnMnFaTklDd1FzNjRs?=
 =?utf-8?B?bytIV09xNU1HaW1iRnJlUllvWmQxNnRuVGFpN29Zczc0NEVSMmdzVytPczln?=
 =?utf-8?B?RUs4Y1BrL1g1a0ZEZTROd21lUkpSNUdCWjYwaEtjdGVkSnFTY3YrMnJ0K2F4?=
 =?utf-8?B?MGlIeFlrOUFwbFhyOEcvZTZkaVFONS9YSTVPQUMwWUpUVXdUR3NoR2djK2xL?=
 =?utf-8?B?cXVITWpDZHZjT2dNUkYraWU3NCtaK0RHd3ZwSHRlamFLN2l5UjFyZkYwWmlL?=
 =?utf-8?B?Z1FmYm15MUZXMnA5L1VsMGNKMnBTTkpnUmRMTGFkYzY3cDM5U1E2YVpPWFVn?=
 =?utf-8?B?ZFB2eHFTN0NaeVcyTldLR3REa1R5clpFQUhjdCtpbmZMQmVOTll6R08yaE1Q?=
 =?utf-8?B?U2kvV2ZsVGM1d2xGZVhvVUJjUFp4ZTZtdkd3NUlScnRvVTNJMXhqSnV5NDYr?=
 =?utf-8?B?TldoWFhCcmNMRFZqQ2NFSURDMjlUSFo5YmYvWXdkQ1ZVcTN0bEVMY1p4UkZ2?=
 =?utf-8?B?R3ZXUmhTLzV2MnNnbnRaZ21sYUZZbUV1Tmt3MTlRTVlIRnBFSTNBWWtqUVRs?=
 =?utf-8?B?QmFVSFZ3bXhXK2liTXF4V09QdS9aWitSMm9OeWFOY0I0aWsyWWJIdmc3Vncr?=
 =?utf-8?B?Q2p4TEpwcUFEQjRzY3Q1Y2NGenR5QkwzSGJtTHhTM2Z0ZkJWcERlMVBBU2cr?=
 =?utf-8?B?VW9qNSt2cEVxdHFPWGdmWEg2RCt0b0RYLzdTT1lvR3ZhWWZTU29XRDd2VDdH?=
 =?utf-8?B?K2I3MTdFb0Q4eG9IYWdLWmRTS1RSVTg3b1ZCZG1xdU1Oc3dqL1FXQmlKYUlO?=
 =?utf-8?B?VllSVjdiYk5RTXlrNUJiT0d1SWlnUENkbzRLZzIrVEYreFZYckptOHgwQTVB?=
 =?utf-8?B?bUNDVTRLQ01lcnArQXZVa25mbU42RlY0TzZ0L3Axb1NWbGtNMjlFZlZlT1Nw?=
 =?utf-8?B?SHF1QWU1eHV0MFZBTDlmNmJtSlVYT1dhZG1MZFZIZHdEdDdsMURkS3MzcS9O?=
 =?utf-8?B?aEY1UG43UTJTSlhvbDZDNDZ3MnhVcW1NZ2s4bjV4S2hGUU1HY1hUUEN5c3JQ?=
 =?utf-8?B?NEZoOWtwa2N5TTlGMU1UU0dJZ1l1TzAzRllWS3NhcWNTUS9xTnJ4SXlJRnFF?=
 =?utf-8?B?VFZNS21XSTdJVUZqNkFLcXRiK1UvMlRWQ0pUOGVCcEk5cXk1ZjJUWDc3NGRn?=
 =?utf-8?B?ekRoYTdiYWNVQkVWckttQmVqMGlPY3NKSVhtLzBpQ2ZzMGJ0UmZyT3BwZkw1?=
 =?utf-8?B?aVFtWHVnWTlyRjZ5QmVkSVhRZHB3T3NJMHgvdjVmM0ZNOGNFdkVoQ1VKWldy?=
 =?utf-8?B?RVlnOStvTUo0QWhsdnJkdmRXZ0YxbzhsNmE0Ny9SNjM4T2loWUpFTHFrWHRx?=
 =?utf-8?B?ZXdmQjB5RmdpNjVWV3RYQnRpckZRUjg0czAzT2Z1TGRjRGZUWWFMWCtnbjNL?=
 =?utf-8?B?WGk0NTEzQzY4U21NdCtJbVU5Q2Q5VVJKblRDaEJrVlNqNndLR0w4ckVaZ1F5?=
 =?utf-8?B?YXdmTnowVGtlRDUzQjZlZlE1blZ0WE9xOEY0L3FKK0FqMlowSjQzVGtlOUVw?=
 =?utf-8?B?SVcrc3UrTDIxNUZMR05qUWVISVoyZ3lRMnVQN0pWbnJMd3Bkb3F4N2JtY2pa?=
 =?utf-8?B?SmxXRzVvRUdZMEdVTFBuVXBaSCt1OXAvV0NFUnJYV0htYTFJU0JFb1BZQWdt?=
 =?utf-8?B?Sndrdmh5OVE3VlNDSG1IU29uK050N2VsRGJIeU43R0p5Nkh5RkNhRFJac0Fn?=
 =?utf-8?B?L2wwdTRLTnN2aGtObzFSaXlLYnUyaVBLblU4emhXQU51ZDl6Y2NsSUlmYXk0?=
 =?utf-8?B?Y2FIOEZjSmwyMHBHRHptcVJXVlVrVER6Z01Yd3MveFAyWVAyME85RVdKaTY0?=
 =?utf-8?B?OHdQbDJhdDF2U2tvZlhWOE0yUnRVaGdxckw3M2I0QUNrRXNkMmI4Z3VuRWc0?=
 =?utf-8?B?VHNhMlFuYndkNmI2ZFJKcVptcnljSnNDQ1dabE10VGczNHg4RlZYeDVueTVO?=
 =?utf-8?B?M0VQeVlFdHhNdGo1dGhmcTBMbUljckJJUnQyaFEvZHJTcGJuNUVzR1VYa3pJ?=
 =?utf-8?B?cVRCVk4vajkzT1Y3ek5MN2RGV2tBUEdsVzVNZklsSFR4NndYTGp3d3pmUy81?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08914069-08d1-49dc-203e-08dd7140982f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 17:14:00.3716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrjl4ldaDe+IS5TYH5IJnJsVccmhTzPKcvRGrmJTGBx2vIkbwFINq9Up4JlVfnC5pnWk/OqPs5hLUugiKCowLpkkJyhe6LJkLaAruFjcaCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
X-OriginatorOrg: intel.com

On 3/20/2025 4:47 PM, Chang S. Bae wrote:
> 
> In the meantime, kernel memory usage could be improved by treating MPX 
> as VCPU-only, aligning with the ongoing supervisor CET state handling 
> work [3].

Sorry, I made a naive assumption when mentioning this earlier.

Since MPX is a user feature, excluding it from the host fpstate while 
exposing it to the guest would also require enforcement in userspace. 
The only viable option seems to be switching XCR0. However, this would 
introduce significant kernel code complexity (as you’re aware) with a 
marginal benefit — saving just per-task 128 bytes on legacy systems. 
Unlike guest-exclusive supervisor states, this trade-off appears to be 
too costly.

Thanks,
Chang

