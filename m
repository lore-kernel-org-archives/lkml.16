Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4E1FF1A6
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171181; cv=fail; b=lzfyZgCOwWeYAGiZ9Rl3E6AqJ0xCnqvBs1aiKqWyKFiFO9T9tC279JES2MAlCaCOs4HBXLR12zTafx03Hr6bgRUjuuFgNoDQMX2OKVYG23N+A0DTbdAG2A9AxOyybvWaUs5SoMSaviG7wNHSZMs9HRfdBZDExaKbYaZcpQ0v0pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171181; c=relaxed/simple;
	bh=OSE87Jfn5ydp+bJeL63wOQbO1EFiWbcvVT8tUkVpAJM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tm85luok+GS4MpvMwu2HqHQ2MwsYlTY+cNtBuENnX0e03SSGoQSRiqChIpIWHCi8n4rgNKhWrTxfNZCBViyIjrwueYPzwB4WbCMPytuFZKK4xWlto8W7p2DpRRseih54q/aSmtR+UaFEjW7Vqfh+AHxiTyL8fJrZdye4Hy/eR14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mql4iz6d; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mql4iz6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747171179; x=1778707179;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OSE87Jfn5ydp+bJeL63wOQbO1EFiWbcvVT8tUkVpAJM=;
  b=Mql4iz6dwT0Twt50Gr7Ysc3MXkIjRKsYufr3qeron2fOK1RC59+WqbXf
   JNWaIdSEn5IBoZ+2vXgyxq74McBqSsqNs/e/3uA7bpoxjtiGX1CRpHsst
   ilbBIbODFwZUkU/n3xL+IBY+UqSX/39kqrKlXzTL3A5xcpEhuHvQ9OChI
   XhgmLsvFV+UK1lmk4yYI7pCbqH9iuJ0kOaZgsUpPl3mtXb8BvSKpZ34Kc
   PxWyxO6OJu3D7g1rsOujmfRKZEB3g/+tTtCGzO9eNFOXCojNnhta/X8tK
   jFAIlG1Za+IJZ5EE8P3EkWPuoHHIRFMiD/mXgRp9N6kYyjXfYkKHqOLuC
   w==;
X-CSE-ConnectionGUID: j6aAHkbsQ3qEmvayx/3ysQ==
X-CSE-MsgGUID: XmVcixkUQ4WzvSEaO7e7kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49029796"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="49029796"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:19:38 -0700
X-CSE-ConnectionGUID: fYEbm3FhTLyMwdJR0R1CYQ==
X-CSE-MsgGUID: GbqnloVWSPiE3YoIJ7Ownw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137709124"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:19:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 14:19:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 14:19:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 14:19:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOXsL3HmACt6Y4hUMW9qsB1geKfx/h+XLYia64wCFQ3RlavsgVUfboRg/3Kd2EiwpKkwMyjiZaZrJMrZ/cd60aqRssXh9o5Ta8zlerlP7CZql0Wt2d4L8AF6k6hZWK19AtVXqhyyOmRzJPUcJU7hFpcVCd6yGM9nyb+AQPb9TdZk+ua2Bhzc7f8t+fLZUHbELxJ7HazuVP4LKV58NZkjtpwWYhy0Wc3yDSMT9tYnVPUG5y9Fvgrvj7qSA8TOc8jb61HfPTwNfuLudNtmGR9YHSZ9ybIE+/8Yf9WDA3GF/bcebUqqvNmwxuEetmTkLAda0CHxamiRn6UKhZsl3urJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swEy5kFGQrPQOtwayA0fsy63mDmnWfinG+u0pu3IUtE=;
 b=xOpG6P5Uo/N0idruHaRA2LNoWqs5T1RQ4IKpf+9PCIUNmCtmwSunKDDXSXylAeSkRMI7/Zino9Helnxv8Zdrh7NTFosgUe3dq07cZif7NVxRbVK4F8aMirVHb5Oww+lYHKQZ9XkLXt+XjP5I5ouyg5f/Afgc2vlsJLa34ax30KDbV+oU5eLA54bwdLbBgzOYL7qkQSm8PigA3k4G3Qlh1njQvoB39W5B+iGXfPB/7kFqcGz6I6fSaM2MroPq3tXvEPdRnhIyLElVIKB4uFqwvcyGhi8JMiZ52nc79ldvdSwKRrB9akKEUSFStQX8vfT6IoKs/fh+3cI2BPBbactk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 21:19:23 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 21:19:23 +0000
Message-ID: <79ddbc73-06cd-4ebc-90d6-363c2f1ccb4a@intel.com>
Date: Tue, 13 May 2025 14:19:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250513171547.15194-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db7c0f4-2279-4125-333b-08dd9263d54e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZxa1psckpaaFZxMSt5QXV4RjJoTXJyM0hJbFFETDNEUmlMZWtVK25JQ20y?=
 =?utf-8?B?WXBMZmIxQ1Q3aGE0ajZrcXRqeUZuVDdoY1k0YUgrOUdyY3ZicUFIb0I5MGg4?=
 =?utf-8?B?R3JOSDhiV1paNGlBUVZaTHNrRTRqNnhNMlJZTmdMRzlSMGhZYktKUE0wOGJC?=
 =?utf-8?B?aWxBeVoxUUtFR00yc3BCK0lqbE5CUS9qSE02alBTMTdoekhKRWM0WjMxc091?=
 =?utf-8?B?bFUrRTNIWWJ0QmhLWWtnQzQrQW8rcFNKaUxSN3hJQzNVK1NJMWl5b3BkdlM0?=
 =?utf-8?B?K2FHQVRXZ3lCZ1M2MVF2ZnBaNW9uSUVQMy9aNFhNRU1mUFNWRDRjSmdSTzJX?=
 =?utf-8?B?UjBHb3ovTlNjSXB1ayszRHFXdTNuV0lROWpUVEZ1Y3phc3lSY3VVZDRuTlh3?=
 =?utf-8?B?cFhLUzBNV2NyOW5wcitTL0pMVWFFY01SVWt0Q1ZtNXo0YzkvNG1GTTVhYnJq?=
 =?utf-8?B?NHNFVE8wcHVuT2VBS1BJUW43VDQwM1U5SGYvUkZqUE5HMGVtV01GWDUwY0h6?=
 =?utf-8?B?bHFmL3h1RjgwcHpDV3E0ZmtpZndLQTBZWEdQaWYzbVFLZ1pLZ3d0cXJrN2lT?=
 =?utf-8?B?ZVdCMTFac1NqRXgyaUdKR0FMU3V0djRyc3dRQ1VYLzFLNnIvM3hIYk1oNnpF?=
 =?utf-8?B?WHoyRDFERzE1Q2twcVp2TjUvY2RSejd6azU4N2swU2FGVHdYMDRFeGVheXVr?=
 =?utf-8?B?SDE2UG9RSzZEYmRXays4VVRIV0ozSUVBWkMwUVczR2xSOUtBNk8yWWZhUHdW?=
 =?utf-8?B?azU3NmhCbHJGc3V0QXhocHh5UEJYL1VsT0NUeTd3ZWJRelc4LzN3Yk55S1ZF?=
 =?utf-8?B?UFNvSWhVd2NLZkF6Nk14bk9GZElGcXEyZDdDN24yS0NnSHZVVkF1K3M3SFg4?=
 =?utf-8?B?VFdkTHVtVlVDc2pQb0pycFZMalZIRW5ETTgzOW96ZmxIcmU5eFNuSWhxRDRy?=
 =?utf-8?B?L0N3V2Y4ckhJRE1xV3Z3dDRycklrTzV5NWRkRUxTTjlkQmFSaTNNekhhTUkv?=
 =?utf-8?B?bnZCOVJsanN4S00zU0xsNG5NSm53WW1pZ0RKTjJ4bE5XZlBIWnVVbGFkWURi?=
 =?utf-8?B?U1dKQmdhTHJqVFFWSGFwZ1hCNUlxbCs1RUxKL0NUODZybEhsU0FVMWVVMG4y?=
 =?utf-8?B?YkFZSjlTL2JkMXdlVytwbmxMZGpRQlpEMytYdmFHVVpkWUI1ZEZFWGF0UHVN?=
 =?utf-8?B?eWhDb0pGYnlQbTQzWTRQNUxCdWY4ZXBaK0pJZ2JLZ1g4NmRLVzRra3FlMm9T?=
 =?utf-8?B?UHBVbjA4U1pkRHFobUJrWTliYnJEakIyeDNwVktoS1BOTWg1c24zaTBsWGcr?=
 =?utf-8?B?bTBpY0ttRXRnQzJGMVArUCsrbEFPaGdMTktKQUdIV2dpd0s2MloxbjgzSWRs?=
 =?utf-8?B?U2ZCRUpPd1B3ZlRCaGJ1NHNsNXZGUVRvdmNMMTFUOEE3YUk0N29oaG56WDls?=
 =?utf-8?B?ck8rcVZXSzJpZVpOYjVNUDc5dmlLRncrRnk0NTdhSVdNd1IxbHQ1aGVNVFVj?=
 =?utf-8?B?WElGbllSamRNTk14a2hzaDltNVFzQS92eEplNzhkaWdTQjBNdC9sQ1BGdmJz?=
 =?utf-8?B?di80elN4QThsN2J1TmpTdDF0MEpSc2tZeDI4YVdJL0VURktsejVkYThNTEZZ?=
 =?utf-8?B?bVo1ckV2SVhhL1NRYU5JNzBFVDRWUFdOMDFmNExFZUQ4endobCsrckRwLzBP?=
 =?utf-8?B?WkxIUlZlZ3pxa1VMWWJ0a1liK1JEQndMdlAzNXhkT0UxOC9HRmUxQmlmdC9R?=
 =?utf-8?B?YzdIU0pqWVN2anVLRWtCVnZWaHFPaDhUdTVJYitmTHo4UDVJUGdYMlhlcFdh?=
 =?utf-8?B?YmhPbHVVbTBlbmtLRWlsRUhjejRGYllEcGpBK3lXR0hLYmhYdTRGT21HZVJK?=
 =?utf-8?B?Ty9tQmdPSDltTVlwM2s4RWNXUHh1aFFiUlVlUmQ4dmFGMkczTVYvTFJPeFZa?=
 =?utf-8?Q?35sf87WkuuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1lYREIxVmI4SlM3RGNxS0taUFlCZGtEcDV4MVhqTEVhTU1XT0VlVjl6UVRZ?=
 =?utf-8?B?ditvNDZGdlpHT2NJQ3pSdElCdlRGMzhpOC9iN01BRyt4VE5oNEVtS1hsNEtu?=
 =?utf-8?B?WjBFdm9nd2hobGRJaGxsTmc0bWFBZGRWRWptZ2VMSmVSWWttaVJwbit2ejVm?=
 =?utf-8?B?MmYva01rU2hDSXF2ZWpZWis3ZFR4UHVQaUl5UUh1R1dJMitTcWpSZkRNQVFv?=
 =?utf-8?B?QTVFbitwc3ptckF3NW5oc0xDOEp6eHQybEZSbi9OaXpxYndZa1hkMDhJKzM2?=
 =?utf-8?B?OTBMU1I2Yks0UG9Sd2xHN24ybWlBT05MZGVyNURMU09OblhkTkJHSjNORGZt?=
 =?utf-8?B?aUxaY1hkVnhJL2RZQ05neWE5M3RPOWxVNno1V2NaSVJjK2taM3J5OTdVVGds?=
 =?utf-8?B?dnh0MUxERXdNSlRWNFUwYitSZFpKdndDL0VWM1A0ejg4T3FHQWpJVkpvS2Vq?=
 =?utf-8?B?ODdvWUxVNmRDWmlOOEcxaEVnNnZ6YTZaRDNZRG9tMWlhWVJkYkJsaWFSN1hq?=
 =?utf-8?B?OXJxMHRoTlNEMWxGckZhZG1TSVcreTVGM1RNbVFtV044RWJBWTAxalhSOWtD?=
 =?utf-8?B?YWg3bS91WUVVd0w3ZUdncHQ3Qy90NkVHUWFvcTRTNlNaS0YrMHJYWTJvL004?=
 =?utf-8?B?MlZBeVVrQm5wWFBMblJHdWRIaytKNHdwbFhpMXJLZ1RuZzVoK21qRytqTUVo?=
 =?utf-8?B?blZLMEVuU08xejhDYkdYaVQ4SjI2bk1LQlJhOUR2NktRTWhEbytYZUJTekxB?=
 =?utf-8?B?SzgycFlZWWxrM3hsMDZScVhQNEROYS91OUFlejNiMGJnaE9HM2pjUzhPQyt2?=
 =?utf-8?B?SzU4a2I4ek5SVkRrNGtBK24ySFFqV3ZsTDZRUk5MdjBmc2NNaXZRcU5SVksy?=
 =?utf-8?B?eUREaElkVktqTFdvanIxS0dITm92dGV4ZGpvWERiaFFobEFDSkloNDI5Rnc3?=
 =?utf-8?B?Q09GdjlYZG8yb3IyaTR4ZmdldExhRkswTlEvdWZBaG81MDE0V3JUQXFHMFVY?=
 =?utf-8?B?Nlo1bFQrWEdvV2pLcG5JeWw3ZDFSeWxZc09OVk1vQjFXRWFBNmgweFc3UHZQ?=
 =?utf-8?B?T0d6bVZROTNxN0swVE4wNDhlWDErMi9VTkw1Q0p0cEwxK2hzbFFneVpNWGdr?=
 =?utf-8?B?UjRlYVdnbXlEa2dLamdkcXk3Z1Z5WE9JSllkQUJ4Yk1DbE5JSE54TGVNOFZt?=
 =?utf-8?B?cmM4b2V2UWtTZTIvYVYxdUJXWWVNWmdhM0V0VjhuS1FuL0w5bjREWkdxZ1Vw?=
 =?utf-8?B?b0tWSllaWUZ2TDA0anZBMGExVUh1TzlmN2ZLMmFUWVpkTXNNMU52elpGcjdS?=
 =?utf-8?B?blBEOXN5bi9XWjFyOVlNK3hwQlNrWDRYMDAzdHlJb0toNTkzYzRxUzhaOHo5?=
 =?utf-8?B?K3hhWVNLTktJMVlCRWEzUGhwRmJyYmVmVnRON1ZINkpwaVpDK3J5clN0YW5L?=
 =?utf-8?B?VHJtbFdwbkUxWVZBRXpXMVpKOFNVY21FbjRyR1B6Z2VQMFNEeEpyUVFkd1Ez?=
 =?utf-8?B?YUdIRmlFSDZNNDNlakwrNklVSDZtUGNzbkNFdTVoRWlxMFl4VTU1dTQ0WXNW?=
 =?utf-8?B?WnhiYjAwYjlGcmpUQ2doYlFGdGV1ZTZUZWtHNmxzMGJ3Y3NFb20xbVgxRUJK?=
 =?utf-8?B?c0hmMzM4cmNDa25ESnNmelAwUlAxOTdWZkFycjhjZmhWTWtJaHlXYTFRd1RW?=
 =?utf-8?B?cjdvT1ZjZzhma0lyUHZXQmJXcXhwMnB3SjFKblVHVVRnOXNwVk04aWpqVzJ0?=
 =?utf-8?B?WU9UQS9PampFZXJDbEdEbk1XS09wY2plQTdDSDB2c29yWmNRSmxUV3drZXZy?=
 =?utf-8?B?YXlUclJsMk1FSis0S1pJMTJObkM2eUtZVHdiTWJ0S21FWVcycTcwcC9DOFBC?=
 =?utf-8?B?THd3dXQ4U3NGejdUQjlxWDVwMzgvUzRYZFZhTExhQ3hnM3QrZmJta2hWT0kx?=
 =?utf-8?B?bkxzZ0kxc2kxbXh6dEMwZ0kybWlwYzVMaDczdnFoSk5UbExQM0ZsbE9JSUwz?=
 =?utf-8?B?UnJlYjkybUpJMXRMRU9GT3l1bGdyelQ5ODNkQlRob0YwVjEwSDdLL1VCUGFM?=
 =?utf-8?B?NTl6TlFEdVdodXg2WHNjMWN0UnVqVG9xWnU3RmlpK2puSVo4S05yMnBuVGQ5?=
 =?utf-8?B?NlJXK2c4VFlZRGVaZUVRZGJ5bjBnd0NiZXRwUE9qU2RwOG9nZzNSQXFaZ0pB?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db7c0f4-2279-4125-333b-08dd9263d54e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 21:19:23.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajpbt8gjSkNexAteo8JaB797tuFZbSSctaP3IB9EX2TY84B+cJhWDrbZacTEjHFqSVGQGbLL2yyH58Ekl21PwcnLrmj6mtpPp/gUdljGihw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
X-OriginatorOrg: intel.com

Hi James,

On 5/13/25 10:15 AM, James Morse wrote:
> Changes since v10:
>  * Changes the online domains check in patch 7 to walk control and monitor domains
>    separately.
> 
> ---
> 
> Patches 24-29 should be squashed together when merged, taking the commit message
> of patch 25. It probably makes sense to drop the tags at that point as patch 25 is
> generated by a script, and impossible to review. They are posted like this to allow
> folk to re-generate patch 25, then review the differences on top. Not squashing them
> together would expose a ftrace build warning during bisect. (but who does that!)
> 
> The result  should look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11_final

This branch does not exist.

Reinette
