Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205C21C9E1
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119012; cv=fail; b=lv18CVGnzd9krc0d6DTHDv69CTISlqpl22vmUKMgZjsXkpSkKAr6yQapMG2G+I82RGRcC9thhWOQqbaSBsDAv9aSm+mXa1iBx00iAt76lp5ntbzAL8cJkSY+9jRCc8eDaDoGV7unMKbDdJLCnJa0xsAr/2WF4G71GitWCkDpgTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119012; c=relaxed/simple;
	bh=8kGCv+LaFaVUHxs6s1h4KQdNHHOruCkmVu/N7xdWFg4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NveDxdPuDvei5YJ6PGYqc+pPruZ91K8tHDKQXRUqQXrPropT+fdWFj5D2av0/3Lw+z2bcM4WrQAx8ErOljQ57OEzDuOnwclTrLWvfQZExGZR/IzsqvuH7yYk7XQkuvB1nbUgUiLLKsKkMcMi2w5GDwrjJZBqX5Svqv+Y2SIlZ90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nag1dddS; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nag1dddS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119011; x=1777655011;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8kGCv+LaFaVUHxs6s1h4KQdNHHOruCkmVu/N7xdWFg4=;
  b=Nag1dddS7hXoGGJfpNZY2iDzEeeFM3r7mtb4Jyh6vt9d50b2N40hkUB+
   iqCRIHkjKH1nKQCOAGE1pwvmh3bBE/PFrMdprp0jbO7FxbvVBobrYo2cG
   pR/eoycwRcKljk78g0wbHfsxGoSjbacFeKtOLmcwrKkhGe2Zp72BIpACn
   3/Csl1sfjntcChNDfQyvKVsPED5AvAxcWKn4PLTZhnn2Sfr2SFqfTHDFN
   5VOjZ8IkTHSHIuSRUIyjzmYrYmuBPvt5BHdEtNUujTgteNU5rGygTsK3r
   phB3qZudYgUd3Xw4KRFLCYLpewq/Hemkvov8C/HVmVlBkqBphR9QSCh8b
   Q==;
X-CSE-ConnectionGUID: isuwNl6/RZiNhTeKihdH7Q==
X-CSE-MsgGUID: MiWQB41CStmVjNJ08V1jtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58460418"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58460418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:30 -0700
X-CSE-ConnectionGUID: hl+Hso7aQYyNasdDPk0o7A==
X-CSE-MsgGUID: zORiWT+ISlm+RW0tzlegsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134936371"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:03:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:03:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:03:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAx8tN8Y1PQUVvtZh93p60LFUfSgPtMe7KfbtXDma5UUB/fCN9j/fiS/pS+p4kW5zdurR8BHU5/UHxAJpo1Luayutt6OBbar822i1JwjUohN8YdIp4KnZ/5ZavHRldoJ5hHWHncaRYDn2azqnolJhhJtdhQPRMUtkQCj3MibzC3YVd1vwdm2ANYYOREUJeSzPYFwZCnIh9yUaRt+koZ/rajmVOVev7hyOxT6nJOFs45e8SV3+iquA6P1K+sTDxjs7utYGYEgO/JcI77K0C+wWGhcZ51wCkCzRl860aABGLWSznIidT4zl64J+CekLDkD3zqnTcDOD5i+yUPN8Uo9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zl4wYvbF/uj0dXIteM3m4fmcUoiG7sSSbXTT+WKcDB0=;
 b=bC7j6/8mfgFHP5PoYzxq56YY3zlmyo/8IQTRjQHDOUpYPzlkGsIckJQJeJg1twrK3k2jBu2YvEwVkITMBrg9OQosHO8ZgJC92zAX6/CtIXMEDzLt63sxP8CsaRMMuuaZzRxU7O7yDQfbwjMTTAStYVl2Q7D3t0OFmHdV2bbrDl/bbCo9KRytX4gN42TGFA3X42iI6RReM8p8auxyjdBP0XazYlU2G7MNTO5/tsKAl7Moz5CUtIiXFG4mOVj8CWVV1AvLCqS3QQtmWx4ieslUnSnimAUCjkG+fJKZQcrqq7Ey8exISueaffkO3NaZ2UqlxNxxm2Vah2DoZctXFTXw+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 17:03:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:03:23 +0000
Message-ID: <669c32d0-384a-4224-87db-f8af551fd6d3@intel.com>
Date: Thu, 1 May 2025 10:03:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/27] x86/resctrl: resctrl_exit() teardown resctrl but
 leave the mount point
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-5-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-5-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca2e0b9-062d-4851-9dbe-08dd88d2150f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3pGajNreXhNTS92ZmlxakZuNzF5VkQ0ZGhqN3hIdGVzVkRpMlRaOURlTEdm?=
 =?utf-8?B?NFRsTithcU8rTmpoSXg5QkVtN3g5bDU3ak9zTjZNd1E3RytzOXVWQ2RWUVBV?=
 =?utf-8?B?TExFNDBZUVpxODZUczYwT3JZbXhpcDQxVlZHYjhTeWVLTGpiTnJnTVhnOWdq?=
 =?utf-8?B?S0hNNXA5S3M1bDM0TDZSUmlPdTJXbi9aK2hMYmVsRGVBLzdWZ0xrWGlSRG5k?=
 =?utf-8?B?am1nN0NiNkROeGJna0M5aVdpOWV4ck5rYmxBZEwwZ3dwbzQ1UzEranJCYUVO?=
 =?utf-8?B?Ym9GbWRQWDhzc2NwZVROWU5CTTRnVi9qVTZhVE9mdDhlTmFxd2xGYVJ3Tk9Y?=
 =?utf-8?B?ZURWdm04OTFFVFJFZCsyVkY0bkxSNkQyMVdvMFhlRU5maWRuVjN0SG9WYkx0?=
 =?utf-8?B?a082U3JrVUZrOHQzYTVzRFc3VnV3TWhjdlRLLytNU1lhZUZkbXdndTFCL1Uz?=
 =?utf-8?B?SUJKdjJtVk1paHFVVHNUVGNmMGZjcjFVSzIySHJ6Y1J0UHFkTlZrQWsvVzcz?=
 =?utf-8?B?UGFsa1N3WGkvTzZLN241aytkdmptZEh0SmtkdC90T1VpSXpsOXNIalArMjg2?=
 =?utf-8?B?bFBMeWhHU3dLOHNuRlZiREQ2cS9WcXJEWEdCWElWVWV6azFscHU4SmM1TmMx?=
 =?utf-8?B?aVNoUFo0K0VWd2J1Rk9iQXNsbzE5YmptNDFOb2wrMW1qWnhLWk4ra2hNaHRj?=
 =?utf-8?B?RWJab0hoRWNlQS9sUUdSWmU5VFQ4V2l2THNrNGNqSUdod1BMTnNMbHlWK0h3?=
 =?utf-8?B?RlZweFV1M2ZOaTFMNk5HYU9ld0lndXRpamFqRFdCdlpzZ1h4M2Q0OEI3blFF?=
 =?utf-8?B?cTNKMVcyQUlSSnpVVys3UlhUbDEvL0hVOFpOZjR1cTJWNy84cU03K3BTTDZH?=
 =?utf-8?B?TytweDByYlVlQXZmNGdXUEZJQVp0aDEwQi80VTVOS0s4ODN3ZXZka2tYTW1R?=
 =?utf-8?B?RzVDTmRtcjM0V0RXQzU3TmZtSm5wS0plZVQrZmwyemMxMTk3WGFYUzk2RlR5?=
 =?utf-8?B?dmwyUHBZUEdDaGVKVkNjaCt1S3Z4dHY4R3RBemd3K3EzVUd4ZUFEZlI2dGVv?=
 =?utf-8?B?UUg5ZUtiK3JXWjZTSWsvbVlkOTRzZXRyMXczeHI3NnB6b2E4Tlg5YVM4bEFv?=
 =?utf-8?B?cE1SYVN1ME1ISENhSmFJQlk4bWQzYVBjU0xnUGk0UEJwVzRIckdYYVI1eEpz?=
 =?utf-8?B?UVEvazB6WndvOFlZcFh6bGN6OE9QS1YzTXp6YUdRbE1EOWErUTNnRFdUUUlk?=
 =?utf-8?B?SWRORGw4eXdycFNHL1Jnc3RWc3ZNU3pDakJGTEdvRTBkR093T2dGdG5XdmZL?=
 =?utf-8?B?OXRZZDltRFBPS2tON0pmVVV2bEgvcHRuVkoyTC90UTZqTjVFQ2lhckxzQ3Uy?=
 =?utf-8?B?UjlnU1dqRjNRcGo1SkNNckV3YTlMK0JCcmdLWksxb3ZxV0pOUG1ORXJ2QTlu?=
 =?utf-8?B?aStOOWQzMlJVTVZ2eC9nbngrZS92RGdQeDl6YmZRUXUzKy96UlJVcDltVTZO?=
 =?utf-8?B?dnlhSDFIVVY5WHdVTWJCaDZzMklZbSt5bXRUMStleCtCbDNGUDFJZ2FsYVRP?=
 =?utf-8?B?L3Z2c3dDemNidWF2MzFkSDAvN3FFaWQyd3kvNDVOZk9YYnUySEU3NVRoTEJq?=
 =?utf-8?B?SFpuYy9HeDJNRG9IbXdQMGM3cGlGQ21xaXl2Nkg2U0g2ck9CZWluVVovejdL?=
 =?utf-8?B?TWZsTVhjSS9QTU5RK3dNOVZ0MStkVlRBbVBOdHFNaG9lSDlkYXZvSUhwRytZ?=
 =?utf-8?B?TEdwQ2QyTC8weG5VVnRUUmp0SnNZZ3JBdUViZ0llMkdIVmt0K1ZlN25rRG0y?=
 =?utf-8?B?VEdrOElZL1hvR3BHaEhFckxBZklwbkY3M3FzNG56SVF3V1hWdmRQUDM0cHcr?=
 =?utf-8?B?bHdINnBncHhBL0Rhc1BweWltUTQyZXNESlB6a1JzL1V5VlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTcySFF6Wk5kM045cVZCQ20vUzZpRURxUXRIYnhsa0tQQ2hUeFFyanUyeEky?=
 =?utf-8?B?TVNyQkY5VmlLczRsWjNpZGJwa0hKQTRFVkQ5SDU5Nk1hZ3FHNC9FSnZsUTFF?=
 =?utf-8?B?ZXgvRStrdzM4S0RTNFowOTNFWFl3azVPb2VyanZES1Y3RTFJNVgrYkt3RkVJ?=
 =?utf-8?B?SWR0ZDBuTGtqZ3BUMlcxN2gvaTBWZGtIa1B2OEM4YlQ1amhtVEYrZ1NILy9r?=
 =?utf-8?B?Wm1tYUhLMFAzYlRGSG9JZnI0ZzBBSUkzSXZ1M3dZcFE4RmFRNUVDbVRrcXhF?=
 =?utf-8?B?SW5nV21kTUQwV1pJV3ZQdEF3U2dDQ1l0a1MyakZqcGR2eEZVc1E4QnNQekdR?=
 =?utf-8?B?Zjc4Sm9XTlJCcmRZNEFpbnVSVDJYOUw0SmVucWxlbERWelozbTJ6czRRcStO?=
 =?utf-8?B?MTc3dnRPMzVXS2hYa1k0dmlOVUpyK1dubWtKVk9HbXJiYU5TYWs1QlpOd0tu?=
 =?utf-8?B?dUh4anZLdmw4OENaWEF4b3NpdlpIU1Y5ZzlTMXJJNU14WFl3N0dET3l3dWxl?=
 =?utf-8?B?VEZIZllFMVVYWWdVMHRUVUJMNDlaRk1sYjdGWkVMajZ5UzlrZjFJRlJLM1N1?=
 =?utf-8?B?VU96WGM5b3A2OUdyd01MMXhRd0V6OTdkUE5ITnpxdnBHWVM4R3V0MDBoNElD?=
 =?utf-8?B?US9Mcjk2RlRvTE5YRUx2REQ1RW9rcTBzcXRwL3pmVXB6bi9rQTlkM0ZYZ1R4?=
 =?utf-8?B?UndtMGV4eE5wK2h1YTA1Q3N1OTFHbVR4VGtMYnhNRWFXdzFVTUg5YXhCWmpx?=
 =?utf-8?B?Z2VMclo4eHNVWUVXVEVXcU0xcGlhUHRkVk1OZlBmY2dUdWJxUUtSZmU3SXIw?=
 =?utf-8?B?NnhJazdCbXFhcDFkTGZYSnNzaGlhcExzdlVLWE9oaHRqSndJblIwMlZLcWo2?=
 =?utf-8?B?TVFzVzFUVGkvM1dSd0hjcURCQnpac2tCVW5IaDhWMWFDc29DZUdTdTdKWk81?=
 =?utf-8?B?RkdrWHY0NGFaVzBFanRJWFErM2lqNDA0TVRpTEh2TTgyU3dpTm9qUmZIUXlW?=
 =?utf-8?B?YmhweldhWktVTGlDcVRyTjNQTDczVDVHbXI4TGgrWjQxZkplMXRmOU5RaFdx?=
 =?utf-8?B?TVpmWUZpb1RwNWVJUXlPdTVPWVNiek41YkF3a3BUalpuOVFFdTJxOFkySGJk?=
 =?utf-8?B?QXVoWEVqYnh3VUduQUFqTVdBaU8rOVh6a2JrTHlWL05vZ1AwVFYrRUk3bmkr?=
 =?utf-8?B?TE1pZ0FMZmhnZXZ4SmNSMnhFNTRHSVcrSm9OTXJvRlZ5WGhEc21WUTdCQ3pK?=
 =?utf-8?B?SE1FZndwZzJEbXFEM1BlVXBENi9rT2lVYUtUeTZsNVhMcmJEM2VZdFdXbDVG?=
 =?utf-8?B?WHBQQm5kVUVudWlnZDhSb2ZETTF3TDVSb2xLT1hYbUpPbmtXSlVyU2VLU1BV?=
 =?utf-8?B?SUo3bFZlK3BsQzgrWmtuUDczTGJGMnVlVm5hWEZNUjI1bFZ5azdKdUE2eXVZ?=
 =?utf-8?B?ai9ROFVjbm13Zm9HWlVLWFdOTkFFdGdBSHYzTDNVL2VLUXdxcXJPRUhXVUpp?=
 =?utf-8?B?T3dRNnZib0RKNDhCRTJnZjhUN0JEZzVMYmxtNFhncmdPSk1GTGNONVhPSmxV?=
 =?utf-8?B?dWRocVI3RlptL0RLbjdJUHdVa3BJbzZFZ25PTGJoUUI5emZjKzlWOUlCRGcw?=
 =?utf-8?B?MVJZMmRwaVEyNFgxUjB1U055R04rQnZuMndGTmRpUzFmWk43alI4WHk5RzBI?=
 =?utf-8?B?RWUyak9ObVdZdWdSaU9vMkcvcVdPR2hkdEQ3U3lSRUt4cEMwZnVZMnh1V3hl?=
 =?utf-8?B?V3BqS2xyVjRQRjBoUTh1V3ZjZ015QUhNNWVTK2x1QmNvNHM4RE9KVVFBN1pt?=
 =?utf-8?B?RlJjZ0pyekxDc0Zqa2U2aFBoRXVSSnp0MklUakY5RCs4N0svRkYycTk1Qkp2?=
 =?utf-8?B?MHR0RmJBMTNyb2srY0VjbkFvNjN6U0lzYmhyY0FHU3dXT3N1K0hSUVgxV3BE?=
 =?utf-8?B?dnN0UHpqTC9BNXF1eklJRUUydGYwV2M4RHZLWXh0NFp5bnEzc3RHb2pLdTZQ?=
 =?utf-8?B?bWRsSE1LRndBWnlGL0QxemNMUTUyR0ozQnlQL1Ztb2JwZzl6Ty9zRlhXdHpF?=
 =?utf-8?B?RDg0bUpEdW51cmJJSTV2c1pzaGRoaHYveXpyelVtQS9BWDkrMWdab0FGZ1J3?=
 =?utf-8?B?eWZmN0RJa3VwOFJaQTZsMXA5UmdISm5SYVJpaC9XQXNUd2F5a0EyZTduQnpD?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca2e0b9-062d-4851-9dbe-08dd88d2150f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:03:23.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jm6agRkE+sR1tZp3vYvJaIcDj2uFe9OOWijMoVTjXEXxvufnUsoi/QzKNPDxOBlyt3jLjK9feLILt18trNG2Yb3k2jzmhcnyxGlbPsPodE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> @@ -4432,23 +4445,42 @@ static bool __exit resctrl_online_domains_exist(void)
>  	return false;
>  }
>  
> -/*
> +/**

Why make the switch to kernel-doc now? The benefit is not clear considering
resctrl_init() is not using kernel-doc.

>   * resctrl_exit() - Remove the resctrl filesystem and free resources.
>   *
> + * Called by the architecture code in response to a fatal error.
> + * Removes resctrl files and structures from kernfs to prevent further
> + * configuration.
> + *
>   * When called by the architecture code, all CPUs and resctrl domains must be
>   * offline. This ensures the limbo and overflow handlers are not scheduled to
>   * run, meaning the data structures they access can be freed by
>   * resctrl_mon_resource_exit().
> + *
> + * After this function has returned, the architecture code should return an

nit: "After this function has returned," -> "After resctrl_exit() returns, "

"should return an" -> "should return an error"?

> + * from all resctrl_arch_ functions that can do this.
> + * resctrl_arch_get_resource() must continue to return struct rdt_resources
> + * with the correct rid field to ensure the filesystem can be unmounted.

Is this to get through set_mba_sc() and the for_each_alloc_capable_rdt_resource(r)
loop in rdt_kill_sb() or is there something more subtle?

>   */
>  void __exit resctrl_exit(void)
>  {
>  	cpus_read_lock();
>  	WARN_ON_ONCE(resctrl_online_domains_exist());
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	resctrl_fs_teardown();
> +	mutex_unlock(&rdtgroup_mutex);
> +
>  	cpus_read_unlock();
>  
>  	debugfs_remove_recursive(debugfs_resctrl);
> +	debugfs_resctrl = NULL;
>  	unregister_filesystem(&rdt_fs_type);
> -	sysfs_remove_mount_point(fs_kobj, "resctrl");
> +
> +	/*
> +	 * Do not remove the sysfs mount point added by resctrl_init() so that
> +	 * it can be used to umount resctrl.
> +	 */
>  
>  	resctrl_mon_resource_exit();
>  }

Looks good to me.

Thank you.

Reinette
