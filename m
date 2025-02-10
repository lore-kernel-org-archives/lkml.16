Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6E6252908;
	Mon, 10 Feb 2025 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212804; cv=fail; b=rFvSDUWlNc3FpnuCQfDZRfxoCr9jo/2Aqth66mwB4fhhMpMehY5sT8nQ7RQuwv64Nlj/uUnKBhH5KVUaQTPPQkxhp5oYi6MssbQ1YsPXCABsr9zcOWcmQ3sDTOLpe3jyWK9jr9RV+PRoMC6Ot2eghMcofLQMOw6s0NKvplugdFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212804; c=relaxed/simple;
	bh=elcvkX92ZegHiamb5f9w2LAL3L7ISY7oDWI9AzyxtxI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X350pQknYYl6TSe+f81sFFcnNwNjDYmgR0QIVQui4E29lq7p9CQrUJX3CtICiOQhGNJPh46OoIy87fqZQXfPZM2C+Fy7+dGCqJvAsR8M7aAdCw2YlJrv+v0oht7S7bgQAjCo6yesg4kcKCRk4r9OQD/6kor/5sG8YpPAI9/K1wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXe/aEKg; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXe/aEKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739212804; x=1770748804;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=elcvkX92ZegHiamb5f9w2LAL3L7ISY7oDWI9AzyxtxI=;
  b=QXe/aEKgrZ+fzMlf2Ngrf8xXHVs9MlIA4XKTg+tceevHuACk+sZWL0xB
   K3Dq3UKnz9Bu+e9doOQZzxaU9Uke0pp45V8SuMy/dgIabvtRd4p4up6Gr
   O0vb2KEV6JmGrOn1U45RjMY8aGu65L87t5qhI3pM8H4yZwMG2HLbo7T8u
   lnHYfGc9px33oH5iMeGPhN+d/jGfulNuINGUPzVaz1i2qwIIYlGUUML/v
   ZzB4DtOcGem1jeSw5zloJSsLdRuJ5K+UfIjPWqICaVIx5a56klwXTp2Z2
   EuWUitYUU/Z5k/L2vJDC6zcmb7W41B97z9En1xDj811013hfCHzrPig4g
   A==;
X-CSE-ConnectionGUID: aRX1+O7/QIOmFj/T5jcdCA==
X-CSE-MsgGUID: LMebAyMYQ2KzWUzySElq+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43467572"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="43467572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:03 -0800
X-CSE-ConnectionGUID: Qou8cvcrSAWuqN3CEUSHew==
X-CSE-MsgGUID: Nqa0kXxLRYWaQBzoNv6sFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112900961"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 10:34:58 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:34:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:34:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:34:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1L1vDyC8SEGrAqZ5vrGVZl8syqQV/GWNOKMBor2+Ahk/G31UeLCfROzwpd4ugrT7UbpC3YaT3oqK5WAajvO18kerOlSHN073lENpM1ojFbg43j0EL8qm4rPYcR7vCLVo8Dq3WmT4U7kRzkaIZ8lSs0IgMKUTmqXsJ8v3LZ6u1cDQuPzvW3/eYH38CKMHxUwvTSbCFXTCR3ujCL9eQxHidxwO7bNPLYAligPi34skHzWyi3lIyaEioYuWlLBvT8Y8dwTgGxFj3iyjEBrkSRpbuIL9c6fYUujEQCqOVwv7+od0YGIVkZZfTzx6lc+MjOJfzg+mxCH+JNd9iRVIdhmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/l/MTGhqzM5AUXIdN2GcnSsS3IMJ3fCkEbh+hrTd6p8=;
 b=YfnGKHQVDI9TXsqtiatB6Txx1MMUh1CVk+XWs0Hq7yAQWqazNWw0TfnLM2yPPBNskOIH0a6fDh22EyFOISoc1LQWBfM32gB7eMiZOi4GS+SuWFsHLaVvePy/Tejq+NjTGsVB+y04qIE0mck+mj6YS5W8M8jOAQih4ejOPMlUb/4VIQ47TTFtBd3WDK7W1iz69kg+LUFChcReRyYDHH5Tei3OXrNyEzrQ0zsYOZzTy+BlcFQ3OrRGLJVK8pshZnSjSV9LBast9DFG59Vu3Mpu4g6kycm5Fhgmy/xfa9kEOlJ8dvx67lM+qtj9RQ99gWVA0GEjsBQiT0Hdq8jBkvpzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 18:34:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:34:35 +0000
Message-ID: <3f294997-7f29-4c15-8c4d-12b016b768cb@intel.com>
Date: Mon, 10 Feb 2025 10:34:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
 <8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com>
 <283b3726-1ecb-4331-9b81-36016ee02767@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <283b3726-1ecb-4331-9b81-36016ee02767@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:303:87::20) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6b7f15-03c0-4950-2693-08dd4a019193
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGc5VFhXWkQ0ZGtDTjhWM2JtOEhORldVSm4wUTRFMHhFczZVMFd4TzJOK1ls?=
 =?utf-8?B?azg0dWljRUpHb0tPOG42bGdaOHRrSWVhNUtkMUYrNy9pbjBxZEVZTEV3WVRl?=
 =?utf-8?B?VzhRNkZGUS9iV2VnZXNRRzhSY0ZCNWwvRkZsQThvM3FnMldsZ3FMQzF5Z0RD?=
 =?utf-8?B?MVdadURmVXlFQnI4MlgwNEt5TVpLcEZFekUrTFd5ZXJ6NDVWRWtjQXdYS2pB?=
 =?utf-8?B?ajRqR2xZUVlSSlZxQjhsQ1dMTThaVWNKUE9IYXlibW9Id25kM1hqNXI3ald3?=
 =?utf-8?B?TEswWEptWkNGcTI3WGF2UXBwdFBQdjZzZ1VxTGFuazJRVUx5MlhzeWNGR2J1?=
 =?utf-8?B?TVIyNVgxb1IyZ0ZySWUwZDhMUG85eXFWUnVKSFY5YVFBOHp1K2VHeGpSd3NH?=
 =?utf-8?B?czc4czFRQnpZVlU4TkQvbkllbkZ0K0crcmtESDRQNS9jR0tvRlh4c0RGWG9C?=
 =?utf-8?B?cVg1clE0VE54aUd0d2tMQ1RvbmYrTjNpejYzWGRUOEV0VGRTNE1vdDhyUm14?=
 =?utf-8?B?WUJGWlp4QU9qOHBiT2FPOE54Y2lpblRDTE0vaW5paU5JUVVrRDF0bm9RS1dP?=
 =?utf-8?B?aXJLczhoRnYwU00xS3ZmQSs1UVd3MU1UeUNkTnMyYkZOWGdWLzMyTjZnbE1Z?=
 =?utf-8?B?UjdvQk1paVBFb1hwT1VQV0cyUWJJUUJ3THpGeVhtTFJZcWdWUXMwbGVZbDJx?=
 =?utf-8?B?RGl4ek11ZVAzVnBsNEVPM3M2S0JaZDNZaHpHSUVqRkkvSytIRUVhbEprVkhR?=
 =?utf-8?B?eVlrOGtKWndHSWhucHNKTGdGcXlMWlVlb2RmcEJMOVFtbVI3ZFF6eU94TTVa?=
 =?utf-8?B?VFI5cUpPN3U5VXh4MUg0MW0rLzl4ZjFFeDZVUERja3FFSk0vT2pzT2MvZ3B0?=
 =?utf-8?B?S3pONGFNWHZkb0RFUjRRUVlZdGs0ZDEvZ0wxZnNHV2N1ZzVaNlFET3NvVVpN?=
 =?utf-8?B?TTAvU2R5OE9JcTJjSzR6TW9aWXhDckoxUkJmYVpYazFPQmlFcEVFYUJnUXhN?=
 =?utf-8?B?Znh3bWhtbXp0Q3dHeGpGbTJ0UGo4M1B5RGdVakJHYm1Xb213SFBkaUdRT3Qv?=
 =?utf-8?B?SWNGdk4wdVpUdU1Xc3hHOFp3UEdLNENvbXRIVEhCeGdXSkdhRFc3R2taNk5q?=
 =?utf-8?B?NnpsUlhQRzRWQnd0RGc1Ym1KZ0d1VHdSTHEwdHBrSTJuaTlwSWE0cHo1VEd3?=
 =?utf-8?B?cWd6VkJDOU04VzhGZVhNMGY3eWFFcVoxZDFNRXczeXBkd00yaUxiVDlzNnUz?=
 =?utf-8?B?Sm52bElHTGlLQ25KRmdGTW1kYld3SHltUTZiZVpGd05vQ29jNkV1SmU0QytO?=
 =?utf-8?B?My8yR2RQdk5SODA3Rmc5S01UWlR6dmRsemgvd2kzOHFBMENUU0ZCTXUxZFNZ?=
 =?utf-8?B?ODE4aEhmN3VaYnJydmp0Slhwdll3ZXFBQXhTa0VXZUxjM0Jkdy9qMXdPNXlX?=
 =?utf-8?B?OElNYWRYSVVXRkIzN1hzelNucU14ZEpQaElzRjl4OXpwYVg2MFo0YnUxSlBI?=
 =?utf-8?B?U280SHM1Y2hidDRxbVdDaWRFU0NSdXRyNEJZa0RrYWpWdkg4bVRDWkcybmQ4?=
 =?utf-8?B?cFNqRkFzcTlGYWlSQmE4cngyR1kzeW9BdFQzdFk2MjNBZnVBWXZRY25Bd1cv?=
 =?utf-8?B?cnNzM0tZTDRKcFZZRWVwWjZyN2g5QUFXL013TmVOM3hiMjFRMVRlQ1lldHpm?=
 =?utf-8?B?OWlzR2lLTzNLNlNxV0lRd1N5RXU0NTVBRWd1UXNJdk5weXZHZTVlSzdCR1hk?=
 =?utf-8?B?L0dOQ2Zxd2R1a2FmR0xCbXQ4djdBWWNCaUtESzdkSEwzd1NrVU9XTkxKM0Fp?=
 =?utf-8?B?TmhOaU4wQ3UzSXNseHpsUFVUK1hZUUNaSkhETG5UZ3EzN3JJYXByQ09ZeUpF?=
 =?utf-8?Q?FVkPhKoAYvKpF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUR2MDdFL0FPdGRBeHR1Tnh0emFpVU1sY1hlbEhyUVgzblVyV0YwdG9YMEc0?=
 =?utf-8?B?cDk3VjhTd1k1SE9FY1Q0RU1nRmUxK25oTS9CTk9LanpvTEEyQkdlS0JTay9N?=
 =?utf-8?B?R3QraGlUNk1HUjYrYTdTRGxxTzlIdk52VnZFZ25vZExCVEtqZldBNDhHeXNH?=
 =?utf-8?B?dXhwL3QvUCt6b3hrQ1VMVUo0VlZMUkp1b1pxNVlBK1pwT3hSNkM4THdsdTdx?=
 =?utf-8?B?bENDaE50Z3FzdHluTFJEdHowVnQ4REhueFhyRHpJbFZCdmZYMkcwblg1VWx0?=
 =?utf-8?B?bkJ0eCtlenVLSXFrbDl5L3FHSUN4OTVSUlBwSzNXR01hTFYrLzJCUTdQTkVR?=
 =?utf-8?B?SzBlQlJkV1VkRW5kMDNCV1Fzdy9vWWZXc0Z3WmM2V0RaV3U5WFFURU0xZHJk?=
 =?utf-8?B?QmFDQjV0RDFFU0Jwcm0rVTNvTTN3SWpUd3NTbDh5UU9MUEtibE04RmtBemha?=
 =?utf-8?B?OEduVTZGZ3JRRFNGUFROTStyWU1GTXFNdm5zSktCeHl5bTg1N05lVWhCRTc3?=
 =?utf-8?B?ZnpYV0FMajhwQWVJZitQUmFKZm4vRm0xbWVUNWVKamg4VlJsZHU3QmpkY1JQ?=
 =?utf-8?B?bWtWR0N1TGo3OStZRDhUS3lpRUs4OFRTRnNUL1p1TVRzanFZVmJzN3V3R2JL?=
 =?utf-8?B?NG9Zdld6dGVibW9VbTRya3pmMTYyTUJSKzdZb0hKb1A5ZWRzV2xidDJuTlN1?=
 =?utf-8?B?VjVqZHhGcTVOV0x1N0t6K1YxMElYM1d5Q2c4dVVHeFJRR2o4WkMwOUFUamQy?=
 =?utf-8?B?T1JKS0NrM0UyZG1xbUJqRmowZU9Gdm4xZ25lcGs4ZDhLQmx3Z3BNek9UYXMy?=
 =?utf-8?B?Zm9xdW0yNGlqdXhBQ3VPTlZ1YzNvSzEzV00xZHFWdkprNnBIdkM5OVNoclFR?=
 =?utf-8?B?dVBOa2ttOWtnYjBZaXB2dUszMXd3RUx4aDRka2hwK3lWVWNUdHNIVFVtY2hP?=
 =?utf-8?B?L1dwZnE3LzMyNlZuV0k0c01USUp2QVpFVXZ0UDlWWG9ETldLTmZ3VVhQRDNN?=
 =?utf-8?B?RlliYndwcE9BTUNtb1pPLzl1S09ZTnl2NHc3NktRWE9ybmF5UmJLbmZvTDdU?=
 =?utf-8?B?Z1ZjbzNsSndEbDJERWRsNDFVd1VSdDFTMVJzeUZ3OFB1ZEIwSUE5ZjlxSUsv?=
 =?utf-8?B?T0FuOEw5OWhZTEhQdXlkSnhpQ09DS0EyY1JwVXh6SCswVlc3eklUTkNUSkFL?=
 =?utf-8?B?MEZTUDRqZUZVOW12Y3VqOHNrbm9XVFl5TlhCV25BZit5c2t1L1lXK1ZudFRU?=
 =?utf-8?B?MjFsazBuYVFXOEh3blVmekpyQWdkWjF0S0FNbU1RSVFldnlQZ25QeWkvRHVs?=
 =?utf-8?B?RHQzbFIyUUZIMktYY3pYYkhHSGdWYVp3aDNHazA2OWtjRllWaEdyL1ErOUs0?=
 =?utf-8?B?ekRKWlZXdTF0QkRqQWowQ0MyZG1jNWUxTTV1OUFPRFFVVHRGMUp4M21NdGRK?=
 =?utf-8?B?aDgvTGJVa3k1V2lxY2MzT1RRb2p2a21xQ0U0dWVHRVE2cEYrVVBoeWp3REpG?=
 =?utf-8?B?UUNIWE1GTjdDcTlwTzdXTldpY3EzdUVFYlA5RDNlTVZ1NXh5bFNsUVhpUzNm?=
 =?utf-8?B?NGVQMm1mN1dmUHpMV0QyeDJIVEJlZWxrS2ZYK0twUXFuWHQwem5oN1dobjc1?=
 =?utf-8?B?bXpnYzcxMlRxd3VpQUpkc093cEZPSzVlZjRxZDBpTG5Ud3VMWFZ6bnVnN2ov?=
 =?utf-8?B?UlI5b0czcXFCUHlqNlpYRTFhYmxBM3pDMHloUUtEVTR1c0pWTHdDUm1WZjIx?=
 =?utf-8?B?OXRacFpza2ltbGd6ZDhISkY3eTlSTHJOeVZESVVhMk1zYUV5aHJjSFNVYldj?=
 =?utf-8?B?b0NCM2tKODNieUNjQjJ5M2l5NldCNDlCb3podEZhTnB5TzJKNW5CSzR0WVN2?=
 =?utf-8?B?cWlaNGVZUU9pTTNkaTlJUUdGRlp6UlhzWnhCMThrNVBlNENxUTBrcFJpeUZM?=
 =?utf-8?B?UGpsR0tNQktVZXp0TVFOUUZNbGZ6VGVHZnltZFdTd21sUG5UN2RyajR5SU1t?=
 =?utf-8?B?bURRL05PY1FVNXhnL3JKaCtMRXpVZXR6amxNWlN3aklKei9pSjd5cnRWQmd3?=
 =?utf-8?B?VWQ0RHo3VTVnUm9jZjg2ajA5YmtKbUJUbFArSHZ2dC9VT0tSbU1sdVdiUjhi?=
 =?utf-8?B?aThac3oxVUhBYytvTjhNYmRnbkQ0NlpIMC83RkFNQ01XQjExQUY2S3VQdFVj?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6b7f15-03c0-4950-2693-08dd4a019193
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:34:35.5951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0U+lJ7/CwWOLNXApsemCTeafrTMpNaX1LcFq78OwjlXpa2+qZKx47o5XsJw00h3UynOABjNLzfpfOtLWW+mUsGYea+CikybQnvcZNNw4WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
X-OriginatorOrg: intel.com

Hi Babu,

On 2/10/25 9:27 AM, Moger, Babu wrote:
> On 2/6/25 12:03, Reinette Chatre wrote:
>> On 1/22/25 12:20 PM, Babu Moger wrote:

>>
>>> +	 * of hardware counter is not considered as an overflow in the
>>> +	 * next update.
>>> +	 */
>>> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>>> +		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>>> +			memset(dom->cntr_cfg, 0,
>>> +			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
>>> +			if (is_mbm_total_enabled())
>>> +				memset(dom->mbm_total, 0,
>>> +				       sizeof(struct mbm_state) * idx_limit);
>>> +			if (is_mbm_local_enabled())
>>> +				memset(dom->mbm_local, 0,
>>> +				       sizeof(struct mbm_state) * idx_limit);
>>> +			resctrl_arch_reset_rmid_all(r, dom);
>>> +		}
>>> +	}
>>> +}
>>
>> I looked back at the previous versions to better understand how this function
>> came about and I do not think it actually solves the problem it aims to solve.
>>
>> rdtgroup_unassign_cntrs() can fail and when it does the counter is not free'd. That
>> leaves a monitoring domain's array with an entry that points to a resource group
>> that no longer exists (unless it is the default resource group) since
>> rdtgroup_unassign_cntrs() does not check the return and proceeds to remove the
>> resource group. mbm_cntr_reset() is called on umount of resctrl but
>> rdtgroup_unassign_cntrs() is called on every  group remove and those scenarios
>> are not handled.
>>
>> To address this I believe that I need to go back on a previous request to have
>> resctrl_arch_config_cntr() return an error code. AMD does not need this and
>> it is difficult to predict what will work for MPAM. I originally wanted to be
>> flexible here but this appears to be impractical. With a new requirement that 
>> resctrl_arch_config_cntr() always succeeds the counter will in turn always
>> be free'd and not leave dangling pointers. I believe doing so eliminates
>> the need for mbm_cntr_reset() as used in this patch. My apologies for the
>> misdirection. We can re-evaluate these flows if MPAM needs anything different.
> 
> So, new requirement is to free the counter even if the
> resctrl_arch_config_cntr() call fails. That way after calling

No. Quoting above: "new requirement that resctrl_arch_config_cntr() always succeeds".
As I see it this will eliminate a lot of error checking on the calling path,
not ignore errors.

Reinette
