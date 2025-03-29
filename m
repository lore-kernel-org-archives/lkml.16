Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA7B676
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260789; cv=fail; b=Tc9wNtm0/CjY5g6gJtYLKggkoJd2CjXherBPPLPJG5yw+zHnfhNoGyT5QRRa6CIngX+1e85vw+3lgZD4k7EEY0Ludz+WezIKqF0+ZT21sIVQRC0r1hQqtxBBCzW2Lv7oWzq6WwCOvX1OOKfPDYf34KwZn+wj/UFeG0UM6Hetwqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260789; c=relaxed/simple;
	bh=FVK3tWXirT34EiVaDSqqQSHVQew42Ti7g+/MTMog68g=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M2U7zmSfL5dpg/XICT5pIeOVxYYlxWKwFj/d9iK6qRZTNwSSFbAvSjWvVsnq6mQOFrNsrFA+21VIQgtkBGVtmvm8c2AH3CM4IH124Av1cc4n7Sd8kiyPm7l3o8WuLbuqd5u8zwHbjmQO7gvf+ZbToyzJGYOGwxERkqf9DUds3qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCemg0v3; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCemg0v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743260787; x=1774796787;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FVK3tWXirT34EiVaDSqqQSHVQew42Ti7g+/MTMog68g=;
  b=TCemg0v3oQQGNmkUiARnW7JlRsiZ7dLYo5Trajnx82JhQe/vSlCYZiLw
   UW1NbFYb5wR7AiSBGItZa6OXgWIQRAxmSv7nTuhRm8NrLiDIyR1a8Hxbz
   L0gUrcRXiAlcVoy0iSSu1zf1cKljZxP/7byXM0yeMgZKUQC71vJ5vCIy1
   RwzxnQdeYu9FGBdJbA8VtSulKnAvtflzbu242SrlFh0fByoywXiLnbcIF
   I1ONsVMvrHFdYTVNUeLVYkwcMuddew8GmSjCwnjKnRDXNPjclDfCsffYV
   m1sKFlz39CHIjvPqApQ//DDLWWMcj9IwHx7pQ2XiTePVMP/gitiC2dlq9
   w==;
X-CSE-ConnectionGUID: Y8UlqGGySiyTs5f737c6IQ==
X-CSE-MsgGUID: 8XRf9952QAOWWx4fmjjJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="55977621"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="55977621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 08:06:26 -0700
X-CSE-ConnectionGUID: vl8IMPjAT6isgiefCwfzQQ==
X-CSE-MsgGUID: WtIElPCFRQOfaqrOHUpJEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="162949473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 08:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 29 Mar 2025 08:06:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 29 Mar 2025 08:06:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 29 Mar 2025 08:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw7L6tiZlKJHDXQByCocvv6rt6s4irKhG+04pdCdvdJhwEU0bJEKtS069Cb1z0wOYY51Z1kVT4v/Vo6WdRlnwtoT39CdFv7KDQ/ykcKM3cfEmfxTohKvwX2aAdUFzpYB4JJy43kPf653K20eMcra8GylWirJBiOV0C6Oh5ngKauOwbXRoQVNI/d/0DulSufdXS9OJUgguNpuEP+e/RgW7s7KsHX5Bb41x3V7t2/5Cms6yAsyQZdnCDxjE79C26l8FqgxFjvlMs55iMl+45I2AFmg1s7i+oG+EiPmURkTsBgLDj+T5OD0iMa8oY9Zzj+/OTyt7mqvcHKpXLLK9YDm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQznSXMR9KkWLJGUiHXo2xPyVKQ1/HN5BMo8sN+SHEA=;
 b=XSyeB5ZoDm//NrkBNp/s6gTM1Ed1nB8yFfagxyMVc5D5ijMq2CbmObnpJhK1ksHurNVXkp0TnTR+9yaVc0SiNP0pMIqtepv5QtD+bVZNxCTNbzPVPZlOWRpOwHObg4resZJkIaussY5gj9AePikS4lcUiZg4mgZqT8QOwx9nlsXpbzXRpU0EbyTVIlykbbQOqC+Kgg8ykBHrZIegAA/eaJXyu8sRsy5JSvqw6+l+vM5a6dol2nwMo8EYKnScHNk1IwvcPfEgdTvyxoJ07ndvLsf3vzXnTB+jr65dgY2tk+1d+E4OgegcWaQbJV2C8+7H27IYoymDW5ma/qYdNQIgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB6566.namprd11.prod.outlook.com (2603:10b6:806:251::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sat, 29 Mar 2025 15:06:16 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.043; Sat, 29 Mar 2025
 15:06:16 +0000
Message-ID: <143a63f6-3e1b-42fd-a4c8-8d2f6b7d3583@intel.com>
Date: Sat, 29 Mar 2025 23:06:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Abel Wu <wuyun.abel@bytedance.com>, Peter Zijlstra <peterz@infradead.org>
CC: <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tim.c.chen@linux.intel.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
	<gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <93907416-dab4-4a3a-82b6-e37e4ee334db@bytedance.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b214d7-5fc2-4ac0-bd39-08dd6ed34097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U09Gei9hcExCeDA0aktjVDNTbXl2MlhFUHhtTWRuSU9MMHR2VEpOQXQrVzc3?=
 =?utf-8?B?Mmc5eGF3dXQweEErdDJpd2hNU0toblBVTTFoZitrV3F3T1daRVZXWlRzVnFv?=
 =?utf-8?B?bllIREhrQTFpUnk4bjJuODNIUzJGelcyRDZEZFB6YjZSYi9rR3cyNkpOMGhP?=
 =?utf-8?B?MUZnWEVxTmlHcnY0NDVQQ2w5ellhVXg2R1o4Ni9DM29kWHA2bXRyNFRFaUpE?=
 =?utf-8?B?TzM0RTJIYllCa3h2SlZsTjUzQlpnb1ZSSnplNFFTVTdHaEJRK1hFUFVJQ0lh?=
 =?utf-8?B?dGt2MmJvRm9uWG1FTkNRTDcxYThoRTdTYVFHVDhRcHFhZ2drRDhDRUNEbWsv?=
 =?utf-8?B?dFhRc1hINmZPSEtnTDdJenhJOWkxRVpvbEZQdTh1RlVkY1orajg5aUg3a2gz?=
 =?utf-8?B?SE5JbEpFaDN2ek9XOWZycFlYWVdMZkt1MVpYdU90clMybW81MVAyMkdiVDE4?=
 =?utf-8?B?eGNhYXg0TVlQWDFhZHZGdE9QKzNKTVlJTEgzenp3WVoxVVFCSXZaSlZnczQ5?=
 =?utf-8?B?ejZCN2RreTlUY1Q1NjByTDZLTHVEd2xBZW1ST2JjRFdNTWRJb3AzS05xR2ZL?=
 =?utf-8?B?Q3FZSHBuM1FSRTJvSlowblQyU3h4dXhFUHJsdjB0c09EeHplRlY2ZmlIcmhU?=
 =?utf-8?B?djV6WDBVZEkvdVprcFA5RTB4MTRnT2RoQ09McFJPeUJlRUtSNHdMQVR6MVE4?=
 =?utf-8?B?b1ZwVG5rdGFpelplTGw5MDZDcHBQV1dadTN3NVMranRLdTF5aExoWWZSOC9W?=
 =?utf-8?B?bE5qcFZSOFN5d2hzamVYT3JRaUExTjNoUjJjT0hEWkllc0IvT1IvcTZLUjdS?=
 =?utf-8?B?WVY3a0hXcUVDejRnOGw4elY4Y0srZklwdTUzQU5ESFljenFvaytKRzZ2MDlr?=
 =?utf-8?B?d0I4em45cnFsWUx6SmpGeTVKa3ZMcjlNcmVBTStPbzFyTXY1QWIwS0cwaWI4?=
 =?utf-8?B?bXhTSGVqa1RKcnVmU3V2YnZoRU0wWjlHMllTTXV6NVRvb2lwYnhHQnVCY2hx?=
 =?utf-8?B?VFU3aktsekx4ZS9NdWp1dEdHMTgvRy9mWnBmOU84WTRnMzd3UG1selIrcGN4?=
 =?utf-8?B?dHdiNzBPR1RsNDlNWmVxdnhhRUtZOWJwRCtnT3MzS0pSNGNBWkRBQlZ0RnJ6?=
 =?utf-8?B?OWo5ZlV2b1RQSVpxMHVMZENJTWtWRVBpM3NQbEp1ZDRvMXpIZXJDRkRGcDVl?=
 =?utf-8?B?c1dHNkJSNUFPM1FsOTBHUDJ6Tnc4MzRGRTgxUWZISzQzQXZMbUNSUHBCMU1F?=
 =?utf-8?B?UDd2TnhkUFQrazl0eEl0WTRJWkkvalJHNEt2M0xubm16TUFpdE8rN1dyMkc3?=
 =?utf-8?B?eklqaUJXV3RVZWxaWUFzeXpRcGFWNE0vcldyWnRjbklOVU1CcFRJanhteFJO?=
 =?utf-8?B?SktETmQ4WVFuMlBoa2ZHdUxGOWszL3JsS3RwckJCMjJXSXhsaW5PYlJqendm?=
 =?utf-8?B?emo0djcwd09sYXJZNkE2Wlo5Y1c4VEJ5WVZsNHRJNDRoZDFGcW9uTElGZjBS?=
 =?utf-8?B?Yy81bFlBUDdFdTVBL0hlOFBVOHRDZHFyZlJOdjFMZjNCcDR1Q2VZT1RNQ0JK?=
 =?utf-8?B?THV4WmlsaEpPOVlGNFliWWNIVW9GQzE5a0FySHh3ME45UkplZ3l5MnloS0hn?=
 =?utf-8?B?TkNhTjI5cHV0MUpWc3JNZXJTU3VMd3BHeGw0OFRXTXhoU0pIN25yZnN5Ylox?=
 =?utf-8?B?MVBGMWkyOC93V2JqQVZaQVcrSWFUNEZEM1pROThyczZNTkxiMmwwTEQvQkxy?=
 =?utf-8?B?T2tsTXI0Vm5oOTBDVi9SbWJoNzI3UzZiQjdLNjJMckN2Mk83R1c5UHJac0hL?=
 =?utf-8?B?MmdNNWlRdkdLUXlRbGFQTWZvWEd0M0g2dXlVbVdvaHM0cUIycU93MDduK3Vq?=
 =?utf-8?B?bG03TWZ5RHBMV3MvVEFzWlk2Um04SnlSWkxRZ25PaVZPVTY1US9yQ29WSzFO?=
 =?utf-8?Q?OwxwhUh2RDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUc1RVRiVUpTaHdHVDlKRHhnSmpsL2IwM0loa05lL2M5Nit3akRYTmh4djdZ?=
 =?utf-8?B?Ty9IR3FZZmRIZkRyWCtpdDRZMWFnMGp0WVh0NzhpY0dhTHcxTnFXUWxsNTA2?=
 =?utf-8?B?blM5eGFSWE9RbmZXK1A5UGJGbURRT1Y5TmlQNmJ4d3ZMQzdRdWJjU0tYSnhE?=
 =?utf-8?B?OE1Nd3picHhJckFMZ2pLQUJmdGg0clNLTmc0Znd3UHJCLzlBWDh5SzFXTC9X?=
 =?utf-8?B?TnBVaXRxN3A0TkVoaWYwTHI2elVmRkZXejNySmVXSnhXYkZQZ1RMWmR5dFVI?=
 =?utf-8?B?cDVqd09KbkJyME82UWg2TlF2SGNkYThRSmtYVWh5NHBSdWpmYVYzeUhZYjV5?=
 =?utf-8?B?SncvQ1NyYlpUdmhocTVxYUxwM25KWHBpRjJCaDdubytXN3R1dlBQclhVSmoy?=
 =?utf-8?B?c1VhaE5nNk9OODAxS3BGZzlsM0tRNmFkMUxFdEZRSDY3cDUvZWVGelBFMDdt?=
 =?utf-8?B?QkpHWC9xV28wNlU0N05TY1JHS3dlR3pwVU5PKzF0ZGZ1djdudWhCSnVsUVl2?=
 =?utf-8?B?MnNnZEJxZnM5b1hDZFg4NElMaWI4ZWRyMW1DVURTbFdKMTkzWHZ1YXhPUW5y?=
 =?utf-8?B?NXVmRXFxdkFNSmhqdkRpVjlZR0wzN3I5TUxadmI1VjJ0OERQbnozZWNqZXhS?=
 =?utf-8?B?U0V3di9CZFdrbmg0dWRXWThXTVRxS1hVUWpmZ29ZOTU4aXIxZFViYk1ZYWp1?=
 =?utf-8?B?NUwwVXgzaTBKTmc1M0NXQ0d6K2V3Slpld1ArN0d5bHZ6dVFYVVNoUUhWTUo0?=
 =?utf-8?B?aEt6ZlBWVmp6WGx6SUErdWhFYXR1anJ3UEhrZVBEMmEvWUxOSkN2dTJzVFJ6?=
 =?utf-8?B?TlBQWGNPbHJNY0lZdVI4QnpiVENkcTMyK3hwUU5WdERHaGhWODh1ZU5yUEhm?=
 =?utf-8?B?REltOGZGSVNWcU1kSnlOY3FTZEJzMmp5NHVqY3FrTEVXSXZvcjhqMVBmR0s3?=
 =?utf-8?B?dnhtN3BYbm4zN3prb005T3dwaTg4dnFUVTROYk1COHdicnVDS0hqMTRXSlR3?=
 =?utf-8?B?aUhGZ1UxSGswR3EwWTVFQUMvNjJMUlpxbXNQbWp2NUM5bXU1d3Y0U3doRDkv?=
 =?utf-8?B?QWhSeEVLT0ZGTnYvbjRwYUg0eG9rVjFJUjY0K3Z1Z1YvRXQxbTdRWXRST0Zw?=
 =?utf-8?B?Z1FGckJHeENReFBhcVdqakx6blhSUVo3cEw5eFlWNGdPcUFXVUsrTWZwZG5m?=
 =?utf-8?B?QzVUdjJ1ejVWQ3ZHSGRueDdEMUdERDhWRmpYdmpnRGlyUjRGSmhNVTlGUUNB?=
 =?utf-8?B?Wkp1UGMxQXYwSmhiTzg5QWhVK1VsTlQ4N0FCV0E5SEdRR1JiOWhXZHdxTk1M?=
 =?utf-8?B?Zzg0QklVNDI5OUw3WGpEMTNuZHo1NW81RW5TV08vRE5KYUtvMTEvZGlpK2xG?=
 =?utf-8?B?MGMxMW5hUTB4ZzkvVDlpLy9OQ3l4OVpHWUk0Nm1DMG1FY1ZOSEFTMWwzQ3ZW?=
 =?utf-8?B?M05wTDkrUmZGc3JZZDQ0SVhaOGdrdGQyMjJ3Mk1sMThQbEh2RFZZUFRHcUE1?=
 =?utf-8?B?SjJrWDZJc25HVGswVEZLSjd0TzdKRjFJMFRlMkNvS1dEWkljNmtQYXdCcTR4?=
 =?utf-8?B?aDVpNTlIcFVKTWhFYmMyVUhUNm9EZlRsb2Z4QUNxcG5CU2o0Z2VucjQ2S2RK?=
 =?utf-8?B?ZlpCS1lzcVF0RHRrNnE0N05uUTl6d2pVWXRUdnd5eTFBUmJtN3BZUVNaQzBT?=
 =?utf-8?B?a3FVRnY1YTc0Wms4ekI1c3MyenJvSVlEZ0tYRElWVUI4MXowRnFEdUNxZzV2?=
 =?utf-8?B?RU9aekNuL2VLYVNUVXFKUzNnS3dBMjFKdzdpNXdITDY3Mlo4dUMzTjQ3N1BE?=
 =?utf-8?B?eFRyYnpZQ2l2OXByTG9MU3JNSnhYY2MrdGhjVXBkY0k5WnNHN0hndyt3SFVR?=
 =?utf-8?B?WGdici81QWpSU0lhdURNNVpCSEFUYkVFN28yK1RSYW9sZkoybnBoRjgwcmFF?=
 =?utf-8?B?QUxTNzg2Y3V5cDYrang4Q1NrM0pYbWtINzdyc05qVXl1KzZvMmRKOTUwbEly?=
 =?utf-8?B?R280RFZ4UnZ2c1Z4VE83WTZHNVVVWVJSdmpzNXBtM01EdUt1VGRqYTkzci8r?=
 =?utf-8?B?QVgyd1pRQmJEeU4xSElYMUxZTS9FQXJmNjZuRTZGSFlCMFRJdHg2cEpXUmJi?=
 =?utf-8?Q?6ZjGu/e+seDR0cigZIIA4OGO5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b214d7-5fc2-4ac0-bd39-08dd6ed34097
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 15:06:16.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLVtWGulSQA1lNw5Xu02StPkIzKqRPizv3JfhJ8MiylTa/N0JbyskpRKWIDUVsBfNm4DQaU02OIj2RB6n747dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6566
X-OriginatorOrg: intel.com

On 3/28/2025 9:57 PM, Abel Wu wrote:
> Hi Peter,
> 
> On 3/25/25 8:09 PM, Peter Zijlstra wrote:
>>   struct mmu_gather;
>>   extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct 
>> *mm);
>>   extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct 
>> mm_struct *mm);
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 6e5c38718ff5..f8eafe440369 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -1379,6 +1379,10 @@ struct task_struct {
>>       unsigned long            numa_pages_migrated;
>>   #endif /* CONFIG_NUMA_BALANCING */
>> +#ifdef CONFIG_SCHED_CACHE
>> +    struct callback_head        cache_work;
>> +#endif
> 
> IIUC this work updates stats for the whole mm and seems not
> necessary for each task of the process to repeat same thing.
> Hence would be better move this work to mm_struct.
> 

It seems that the per task cache_work is used to avoid
duplicated task_cache_work() in task->task_works queue, see
task_tick_cache()'s check
  if (work->next == work)
	task_work_add()

To do exclusive task_cache_work() and only allow 1 task
in the process to do the calculation, maybe introducing similar 
mechanism like task_numa_work(), something like this:

if (!try_cmpxchg(&mm->cache_next_scan, &calc, next_scan))
	return;

>> +
>> +static inline
>> +void account_mm_sched(struct rq *rq, struct task_struct *p, s64 
>> delta_exec)
>> +{
>> +    struct mm_struct *mm = p->mm;
>> +    struct mm_sched *pcpu_sched;
>> +    unsigned long epoch;
>> +
>> +    /*
>> +     * init_task and kthreads don't be having no mm
>> +     */
>> +    if (!mm || !mm->pcpu_sched)
>> +        return;
>> +
>> +    pcpu_sched = this_cpu_ptr(p->mm->pcpu_sched);
>> +
>> +    scoped_guard (raw_spinlock, &rq->cpu_epoch_lock) {
>> +        __update_mm_sched(rq, pcpu_sched);
>> +        pcpu_sched->runtime += delta_exec;
>> +        rq->cpu_runtime += delta_exec;
>> +        epoch = rq->cpu_epoch;
>> +    }
>> +
>> +    /*
>> +     * If this task hasn't hit task_cache_work() for a while, invalidate
>> +     * it's preferred state.
>> +     */
>> +    if (epoch - READ_ONCE(mm->mm_sched_epoch) > EPOCH_OLD) {
>> +        mm->mm_sched_cpu = -1;
>> +        pcpu_sched->occ = -1;
>> +    }
> 
> This seems too late. account_mm_sched() is called when p is runnable,
> so if the whole process sleeps for a while before woken up, ttwu will
> take the out-dated value.
> 

Yup, there seems to be a problem. It would be better if we could reset 
the mm_sched_cpu to -1 after the last thread of the process falls 
asleep. But considering that all threads are sleeping, even if the ttwu 
tries to enqueue the first newly-woken thread to an out-dated idle 
mm_sched_cpu, does it matter? I guess it would not be a serious problem, 
because all the cache of the process might have been evicted due to long 
sleep.

>> +
>> +static void task_cache_work(struct callback_head *work)
>> +{
>> +    struct task_struct *p = current;
>> +    struct mm_struct *mm = p->mm;
>> +    unsigned long m_a_occ = 0;
>> +    int cpu, m_a_cpu = -1;
>> +    cpumask_var_t cpus;
>> +
>> +    WARN_ON_ONCE(work != &p->cache_work);
>> +
>> +    work->next = work;
>> +
>> +    if (p->flags & PF_EXITING)
>> +        return;
>> +
>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>> +        return;
>> +
>> +    scoped_guard (cpus_read_lock) {
>> +        cpumask_copy(cpus, cpu_online_mask);
>> +
>> +        for_each_cpu(cpu, cpus) {
>> +            /* XXX sched_cluster_active */
>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>> +            int m_cpu = -1, nr = 0, i;
>> +
>> +            for_each_cpu(i, sched_domain_span(sd)) {
>> +                occ = fraction_mm_sched(cpu_rq(i),
>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>> +                a_occ += occ;
>> +                if (occ > m_occ) {
>> +                    m_occ = occ;
>> +                    m_cpu = i;
>> +                }
> 
> It would be possible to cause task stacking on this hint cpu
> due to its less frequently updated compared to wakeup.
> 

The SIS would overwrite the prev CPU with this hint(cached) CPU, and use 
that cached CPU as a hint to search for an idle CPU, so ideally it 
should not cause task stacking. But there is a race condition that 
multiple wakeup path might find the same cached "idle" CPU and queue 
wakees on it, this usually happens when there is frequent context 
switch(wakeup)+short duration tasks.


> And although the occupancy heuristic looks reasonable, IMHO it
> doesn't make much sense to compare between cpus as they share
> the LLC, and a non-hint cpu with warmer L1/L2$ in same LLC with
> the hint cpu seems more preferred.
> 
> Do you think it's appropriate or not to only hint on the hottest
> LLC? So the tasks can hopefully wokenup on 'right' LLC on the
> premise that wouldn't cause much imbalance between LLCs.
> 
 > I will do some tests and return with more feedback.
 >

Find an idle CPU in the wakee's hostest LLC seems to be plausible.
The benchmark data might indicate a proper way.

thanks,
Chenyu


