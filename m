Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771E19E97C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748572189; cv=fail; b=nFLepoBaY5kC/xjoPqFBIB3SQxgVqpVposPv63BD9XvNVsnPKjNIjrdtFQrvWUewy4AtHsIsk+qcKI4oh1p48jWF2L5X9hC2gm9sTfPjU7gyZEYQSU7p/E17KN7UMH9qBGSXnvzeoHOzfDfN8DzdwjZHx9QwvgtOWOvq2k2ilMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748572189; c=relaxed/simple;
	bh=EfqmA5fIF2Pg+vpA70muIT27gt6IrgUy+td5MLIvZgs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BxI6bY0u2QnYJqIp13jVVyOoI5ue6qZVk4q01fl2exxepnYwg+SStGURv9TBDGUjAUUPnh9fJe9HrJ3ifZLZoSg1KupXvHeu8Dm3oB2gzPE0EAymHqOoOtG/bFT12TsDEMEIk6Oa5zrjuCsuGnTcv2HWVHBjvl/C2opQbyGnK40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRCxn08k; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRCxn08k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748572188; x=1780108188;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EfqmA5fIF2Pg+vpA70muIT27gt6IrgUy+td5MLIvZgs=;
  b=hRCxn08k7Y4EH2G9Poztc+Cqwjbwq+2tUJhydUgXpcxJB3N9aRAOMrJA
   EYN6acU4vW8cHlU3mg/cajWDLzveR4bPLaBhwYXDMEaU789kZA42j4cKU
   tEQKsupgJFziEQiZrkT57W/Q61WW4LU08HpL6GN2kO16wrS5YMpwuDkeF
   dWlISb9zU8apkPibEsuf98DwKADeD8e7axo2ie6a4iWnwEdRkzshwNuJS
   kY8ZVSzhjBuhaBPWZv7SzrvAJ6tmQFe35Z4ozKtr/qbl5L8Pcv3teohHi
   kxV3dM+7ulb/L4wum365MW/PWM6HgR3J74ulAsDlbgvUJ6GqlhVUOkWGp
   w==;
X-CSE-ConnectionGUID: MBAZoDvITE2cvN4Smck1dw==
X-CSE-MsgGUID: GIRQZZDBRMmoZ3VU0TaYDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73188933"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="73188933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 19:29:47 -0700
X-CSE-ConnectionGUID: mB/Bm7oNQImgTzbcwR8/Cg==
X-CSE-MsgGUID: CKjDYjN/TQ+moLlexmNGfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="174631371"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 19:29:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 19:29:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 19:29:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.42)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 19:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2psxdRdWTMJ/kfMnEZtD1kV8YSgEPS4SOsT1+Qbb2lsMqzI5k3XmMJVkWF3vwcPQE8zY06XKgG65OQYToi2S5rK0eBFIuzSuIy9F9qihhqB/lZqCNfNhBNnrSkukG8cnUeDmzP0N3z06Ce3ExzZjiYKmGNyyY3g3Nuq/jcOisUEMSHNEkuwDQoQnPhsOjY+AuIFL93SB2QiUJxtzPTAjiyDtBBm+FsNWicxDJAYW2vj1KYF5WCE3fNPa34DCocBMl4yOu3C1qhtcK4Xlx5GTvWAwPKe4TvlyuWFvzSRVHwgTDHt+CJvmB1OLXqvFLHA2z/wgsRf1vYDYkwmd1ehyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTaYhazwL5PpK9XhTY/TF61lxIP8jhN5Fe4Q7MTKsuc=;
 b=uWgZc8v5DpkiamAVdbPGrJyAj+Q3nXD8jEarHCcammTnElAPgvjVIzDJEYgLmJOpNIQ74Vh2lZ1Bu6t+VN+O6p7HZs2tAsVxhK+hEl6NiLpf9ytho9xyMhHaIUC47VH4zi3r7v5ySLc2mNIY4i4nOmUItwsnuBc08m1flGzCU9qrPKvJf1t3mRNekBfS3Tk5lrcECQsGjnJKiEt1Uw8XGnA29oWYlus+IMxt/0vl74HZYVCDr+iGzpM56CqxwX0FNaI2V9S+XR6eUdtzULwmh6dqZpo1Bb8AGkNLqXmNBvNjMJx+6B04W1gbue/9+1d1oLOawyljQFn2upJbkI69DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 30 May
 2025 02:29:44 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 02:29:44 +0000
Message-ID: <2e62c38c-cd2e-4aa6-af43-2b8e77c09b78@intel.com>
Date: Thu, 29 May 2025 19:29:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/43] sched: Clean up and standardize #if/#else/#endif
 markers in sched/autogroup.[ch]
To: Ingo Molnar <mingo@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>, Vincent Guittot
	<vincent.guittot@linaro.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, "LKML Mailing
 List" <linux-kernel@vger.kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
 <20250528080924.2273858-2-mingo@kernel.org>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250528080924.2273858-2-mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|PH3PPF957B3B2A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb76d12-487f-4f6c-c5e8-08dd9f21d66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REQxYzRpU1ZUSlIzQ1pYMVNJRFBnZ2JuTnhGdGEyU3dLREUyTHRQeUhlbW56?=
 =?utf-8?B?V2dNQTdlM2ZieDNlaVFZODh2ZTd5WDB2Y1p5ZlF2TEE1TnQ4ZTFGL3dsOVdP?=
 =?utf-8?B?RGtyVzBENkFXUXdSc0NwT2NueVZtUHJLRENta2JmcmE1YWIxN28xN256QW40?=
 =?utf-8?B?cTl1b0RUSU1FR3RaNWpPcXZDVWgxUTBETWxBZG5qTlBBazhvSlRHV00wOXRk?=
 =?utf-8?B?dkV4a0dvYytXRFNuNVFnN1VzZ2JyalNzVUlPSm9sSGRoeFFoM0tFbWc5YzhL?=
 =?utf-8?B?ZDVCNDlrYXpOY04rRXkvcmlsNDFaOE1VcjRoWnhyRzI3SEJkemJIZVRnbEd3?=
 =?utf-8?B?VkcyT1loM0VEMjZUeXNFaVB3dXNadTBYc2J2T1NndVI4UEpBZk9rNzY4bzVi?=
 =?utf-8?B?dTBES1RtOUQ2ZnNPMWFBZ0hiR3NVVGpZYzlJTjFZOXE4RXBBb0MwZ0tFZnJW?=
 =?utf-8?B?T2tKTjcrN0I5bjFwcnFwdjlVRGVESllPL0VYd0F0Qy9LK2xmdE5mbjVlenQy?=
 =?utf-8?B?SDduRjZrSDVnRk9UQU5EVkRsQUV2YWd4RnY4QlRxRWpDblY5SmM3ZkhZUS92?=
 =?utf-8?B?Vk5ybC9RZGNjNG8vYWpBbXdKb3hEZFY0L3RIRjc5NE1oWmNhMmNlczRCb0dn?=
 =?utf-8?B?ZXlob0ZFN25mdHlUU2RLZW5IcThGenVxNldxL1JGazA3WG9OMWtweVlXenEy?=
 =?utf-8?B?L2pFYVN0alhtdWwyYXB2bzVFRmxyNDlpUmsvdEFrbWZEWDFaQU85MnBJOSsz?=
 =?utf-8?B?S3pETXFqT3F6bGR4SDFEQ2pIeHlMWVNucFVJK2pYQUg5RUtpYVpwQ0hhVStk?=
 =?utf-8?B?WEczTnpJa3VNeU5kZ0o0V1VqODFOY3Njcy90MHgrTHZHNERqUjVrQWJHZEoz?=
 =?utf-8?B?Nm9WR05NSlhkQ2d0dnNPdjVqa0dRUnBpOHV5N2FiT29ZS0U0WUkySTV2M1hP?=
 =?utf-8?B?UERoUTMrYmZNdGMvQ2JxSzgyenh5UU5aWG1xd3BrdHViODRsNWlvd0o0Y0xI?=
 =?utf-8?B?QTUvNlFla2lNSmhYUldTTDJMcVlFcWVzNTY1UWlQZ0hCUzRMeHQvVUlHSFN6?=
 =?utf-8?B?eldoYS9xZzRvamh6Tk43bndIaW1maisraGtTWkI4YnVwVzRRSlR4Wk5SSDhR?=
 =?utf-8?B?TlJkMTNWSnZNQ1IwQUhvZGJFWDNlM0NoN3JtdUpidTVmWUZxSlF1UFUwR2Ft?=
 =?utf-8?B?OUdKVkM5NTVQSmR2VVdYUi9TSEJwb2JmK0NaZUlPQW9za2QyVGgxNGlHNmZm?=
 =?utf-8?B?Y0JWUUZBZTFZdlFKdHhyc0RtbUczUmVJdTlMTlhBKzVLQ2FZZmRZN1pJMkM5?=
 =?utf-8?B?T2ZJMlIwRXdSc1d0R3pHVUhpT1JaNWJ3dlR0VWxmcGZ1WFQ1ai9PbTBHdjc2?=
 =?utf-8?B?cldoM1dyY1BKbWtsVnlSdy9ZSVo0Nlc5ZWRDNzR3a1B1Z2JHdGl2dHF4aDE5?=
 =?utf-8?B?bmFLLzAxK2pjdDdDL2x6cUd1RXNIcW1aR1lPeDlVZmxIUlpMeGd5UUhPc2FW?=
 =?utf-8?B?Y3RIVFNZV3oyWExwUDFVaVNEOEZPVXZzV2FMeVd4U2kxMlNlenZmdG1nak5C?=
 =?utf-8?B?R2NBeXk0U1lGYzFIR3Awd1BFZ1k4cGt3UmVvdG5XdUtRaU90MmRYZmtFcjBU?=
 =?utf-8?B?R1BNR3dMMUlhK0FzTFE4RktEeHRZS3VnTGhxTEthMS9VU3ZFLzV6K0JVTWFW?=
 =?utf-8?B?am9IL0ZWQVRNSlB1LzFJNTRGaFR3eTZndkJpT0E4ZmR5VFBUU3VVRnRQY1dh?=
 =?utf-8?B?eXpHSG9kNUI5OVQrSCtsZFEzRmdHNk5JeGhpWG4vdm5Hd3k3MlVKbEdETWlS?=
 =?utf-8?B?eXFJZ2trV0lLQ3FVNUhiQ3A3cEd6enlvZzNwK2twNlVOUWp0SnNxelpoRVMv?=
 =?utf-8?B?cVRvdDYyQndPSERZYXJsbVNHamVMS1lSVWpEL21uOE5rYnFpM21rM0lCMGRT?=
 =?utf-8?Q?4vxMOCwlg2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1JVQUxxdHU4M3hZdGdUdnNoWTV6T1hYR2J6QkE3cmEwRmNXUnFQVm9aMkJF?=
 =?utf-8?B?OGI0Q1FPUjFpRWduMkk1UnI1N2FRK1A4dXQvZGZHNnFIYkFvVFVVTDFDQnl2?=
 =?utf-8?B?WFJVTlJ0YWt5TE1ic0JtS09SUVd1VUR3Tm12VmlURURIMXZudlFJZG1pNmNT?=
 =?utf-8?B?OVQxUUVsbWZYd2lER1BkVGlHSTNsMUl4Ri9aWlV0bFlDZUYvRXp6SjhLNndO?=
 =?utf-8?B?a1paK2FXQ1FHUmtPOHVWNFdxTTg0S2N1VXlQZGhnSGowNEZrR0Rld0lxS0VP?=
 =?utf-8?B?VkYybU9ZcG1WRTk1SmYzZkovdUY5MXJLeGVkZ3BhV0tuRndySXRSWExITDRE?=
 =?utf-8?B?SHRIWnAydUx0NkM3bGtFa1FjcURlSzdtVmRTVUQwL3BIQkRzSXBlMUx4T3BF?=
 =?utf-8?B?TDdxVlROUUU3UG1Td0phR2FKSmsxWWIxVnZKTDRxU3pXbzJUZkJDaUpPZFRH?=
 =?utf-8?B?UG5XM095WjdrN1Zsc0RsNUFHS2FnbjFOdGxYdE1RMlZZUlNNbmV6K3grNGJE?=
 =?utf-8?B?RThQRFduTUFsQXhUM2E2SEFkT0p5Zlk4SlFad3NMVjVCbXhYNEQ1enVZalJV?=
 =?utf-8?B?MmlVU2p2cUJDdXFSME42UnQxQmlwQmRsVFpYc21YalJZUHVoZkk5SnZ0ZUFJ?=
 =?utf-8?B?dW9xU2IzTzlsWHJ4S2s3Z0ZXWWdPdXJQWG1Id25mSUJWTTd4ajJudnI5bkhr?=
 =?utf-8?B?Qk8vdERSL0w5Mm92Q1FjbENRRmM4Y0JhR2tiZGJEZXF2TkY3L1o2T2tpeFlp?=
 =?utf-8?B?UlcyRmUvS0l3MGt4akZEeXVzaGM3TTVyUFhiYzJuVnVlVlI5RlQvWWsxckI2?=
 =?utf-8?B?Y3M5YXhHei94bkVzRG9uUDNyUEgwVDIwbUwxazEyM1pGZERRSmIvajZtK0RC?=
 =?utf-8?B?YkVOVEl2TnRmazhOUVhsZDNueTdyZUJYeUVreC80NjhDZWpocjYrL0NaZXlp?=
 =?utf-8?B?MlJNWndmdHdwM3BwMmdsUWtxcHhlN3FzZGcrZUZnSTlLb2pFdmltbVVKMWY3?=
 =?utf-8?B?bjRsejY4c3N0K3BVSDE0VTRDR3hYanpJT2tIRTNwOVFYTHRqVkR5VE43RXRF?=
 =?utf-8?B?QUxRK2RTazVCcE9Bd2RhU2c2UzJwYUxvekFPbEI5UlUzc1NXTXJSYWc0NE81?=
 =?utf-8?B?MHh2RXNTdlZSWnZQSVV0Vi9DVWlhdEJjKzUvWHl3eW1tQkNkQmRQQktVYVFJ?=
 =?utf-8?B?ampFeUs0Mml5cit4M0JBRlUzTVlUcmxvUjNjNjZMS28xUWNvYkFPVnRxcjd5?=
 =?utf-8?B?eVJXbmI0WmgrUldyWThRK3pacjEyOExkbGdub0RCNUxtWm9XeWlvMk5JemJl?=
 =?utf-8?B?T1BlRUM4SnR3VVd0VE9MVTE1VFp4NC9mL0lZZHM4VjRDSTc1UlAxSEo3QU53?=
 =?utf-8?B?K0FZT2Q3WXZCeURwVG9lTUFYNWFaT0RtMGc0bStLcWswbS9aZFZFanpCVUU4?=
 =?utf-8?B?ZkNEazJqK2hGeGhWRkdTUVBweitqNWh2YXE5bHZieEdTU1MyVGhxY0NUcE96?=
 =?utf-8?B?NGlJd1lRblBNYWVTYldHcHJoY0dQRTZ5K3BBYTAveVE1bk9zNnRzMUUyc1Qr?=
 =?utf-8?B?dm5tZmVEL1dIeXJrSFlLS21vVER1YmszWTZJamgzUXJlYVA5SnBVSmhza3Zv?=
 =?utf-8?B?N3hNOGx0YnBWUlFKV25WZDFOemV4azF4Wndxc1FySVhTN2ZkYmtzQ2wrSUgw?=
 =?utf-8?B?M2RiVHlrM1pWaVNFeGVvb2xOWmJicDVQODJFaWlmOU9nMDVvUVZkeHVBeTZQ?=
 =?utf-8?B?QmsxR0MwaExGNmhqTmxieVJTV1N2anJhYVhKUDJxY1dWRU04SDFNeUx6bkVX?=
 =?utf-8?B?RGZWcUE5cFlJb21LdndOOWt2eHY3alQyNTg4NkxkMGNHb2tHOWtWTUpmUVVV?=
 =?utf-8?B?bFhpd0NWb3BqKy9WbUh4Wkk5U2VsL3NpVEFoYXVHaTJPRXFEemFFOTd4d2cy?=
 =?utf-8?B?ZDZINUZlMCtSeGlhR1VKek9XZzhYb2d5Y1BTaFAxbmIzeHJPWGlpQ3FtMWFJ?=
 =?utf-8?B?WlNtNW9vQmFhYngzVHZLSWYxUWs1YXAvSk85bS9hT3lSWDVaYmdpamhVUDhn?=
 =?utf-8?B?RU9mTG03TDFHZXgzZHVMTUQxOHFaWFZBaC9MUi80RURDN0l4RUVYei85dFhW?=
 =?utf-8?Q?LXAscfGbfNrO5W7am2Ctunqyc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb76d12-487f-4f6c-c5e8-08dd9f21d66b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 02:29:44.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VSvqRyt9lsqtVfhXrPTEWvXDhegsQLpdOzQeKFvqz3TLs1rhqaKAgRt+/WccJsRWTlVqYnW0Kq0rKlHatTsUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
X-OriginatorOrg: intel.com

On 5/28/2025 1:08 AM, Ingo Molnar wrote:
>  - Use the standard #ifdef marker format for larger blocks,
>    where appropriate:
> 
>         #if CONFIG_FOO
>         ...
>         #else /* !CONFIG_FOO: */

I am trying to understand if this #else comment style is a standard in
the kernel? Any documentation link?

The comment next to the #else could relate to ending of the previous
section or related to beginning of the next section. I see 3 formats
commonly used:

1) #else /* CONFIG_FOO */

  $ grep -Pr '^(?=.*#else)(?=.*\/\*)(?=.*CONFIG_)(?!.*!)(?!.*:).*$' .

  Count: 1122

2) #else /* !CONFIG_FOO */

  $ grep -Pr '^(?=.*#else)(?=.*\/\*)(?=.*CONFIG_)(?=.*!)(?!.*:).*$' .

  Count: 642

3) #else /* !CONFIG_FOO: */

  $ grep -Pr '^(?=.*#else)(?=.*\/\*)(?=.*CONFIG_)(?=.*!)(?=.*:).*$'

  Count: 43

Even though the counts do not account for the #ifndef cases, they
provide a rough approximation of the kernel usage. #1 and #2 already
conflict with each other. I feel adding more to the 3rd type would
probably make it more confusing for readers and developers.

I am assuming that the ':' at the end is to signify that the comment
pertains to the beginning of the following section. If we want to
standardize #3 wouldn't it be better to first converge between #1 and #2?


>         ...
>         #endif /* !CONFIG_FOO */
> 
