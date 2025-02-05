Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60FF215798;
	Wed,  5 Feb 2025 22:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794175; cv=fail; b=OEJ35WDV9BUniR81xruqxAZuD//NNVpB4fxFpDlKmk5PEqwaEBUBTVS867CbhfeOXetQmcZ4doVlu+uCXamZ5QItMPcZnIty2MNsLZpv9KiGvWSyhIdusYGlns1Kh6tdU+mhG/6hat+VrpHl8Xu7BF4P6UxlQ17sCdPeVzw48g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794175; c=relaxed/simple;
	bh=xGbyG6GmhoTpiYpO/zm1j4s2ggOOgET57A/tKMxU6Wc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qeskQMtX8REqSyydyPtHCzKfXoSCiHnTmfebInzANpeyPlHpFw7fxUY7swH+qZ3SxJg0toymBxZLwHAqhklQ/7eSmfcH1VF0eBRkm6Kqv0p/5A15LaDw2bG78vxPs88zhBD4PNHDlfbsxgYv+Zj2YXKOg//m8PTVk7fiJzC9u4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWXrxgHz; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWXrxgHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738794173; x=1770330173;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xGbyG6GmhoTpiYpO/zm1j4s2ggOOgET57A/tKMxU6Wc=;
  b=YWXrxgHz9GNh4CX1Fg8iUQrt3m46eYdTjzqu3jIb1Y6YH2AWaNPvhtrP
   1P8N/1tJdyzzPqLQ6MKex92BeiOmRooIwfGVkduwnd5JwuO+jZVZhDw6L
   lmhxcKZ5BDr/YioPkPD8Ixpk4uQ3xKaYCMsW157gg1lQmkzwU3eoCl7BX
   KYaG7Ehze0eacO7pkFh6FGAnl9O3mbkI1vg9SBd0AlJCe9uwfi300+mLc
   I2VlDkO2AQUcwu/16y4KniVjhwjDLhJl87NLoLGLJn8ECy8MObekX57B4
   /m/MEiZ0OWX6tfeaxTRiMAlfcrb1b6Q3LANw6TyUlMvSCecvvdMLwJx8L
   A==;
X-CSE-ConnectionGUID: X5GXHDTyQyOXZlmw83hDbQ==
X-CSE-MsgGUID: RQ3V9odRSKezN316YDIbZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39407456"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39407456"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 14:22:52 -0800
X-CSE-ConnectionGUID: i1eZVyczT9CrDLityrESlA==
X-CSE-MsgGUID: u++7jZ/kQpyZRejbgx/BvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110925895"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 14:22:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 14:22:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 14:22:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 14:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezvXP8mlB+BSLNrwtcrJjDrRQ8JHyzGPKT3azrMdIvNYyHYyQnBHWW2ujPEY0hncqd8UXtiHeNUDDBnxjtU/lsCXhEincUdoXtbhTui+F5MJ96iYkpAY9IkqMiE8EfDmSIRT1pJCBT8KWHKQ2XBd65rFiRn2I6OKzZ/sngtJQgGieoCbZKOS+ZEEpnE8V/1KxJdF0aIa1xCOXasbzh5qgtjCl0MLNqFRJqC3ze+ZE/e7LHLoMHaynFeZjopj/QRpd6r+C2iONbZZyTaeqBV8yy82sgutZq3u1FBMsH7ZEBNn3IVVTe4Gr1wHvDmY72BQyPUQReOvu6AHF9nxSzcyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9Q6iMSfnvjh/Q/sC2fBMP5e79J6hKz5CVQfn3AvfLU=;
 b=qVpapDqaHrRu14NvGEX86m9rnZeymmO25fCcoKBSAsnrkrZHil2g7J8dVMB/UrmHYxaXsfwhG+NbpxKPaVGlpaKwVbBCUEOdT5mrranS8KDGukAi/gjYA/HHMmcNsUGW3Aw/tf51cR9ZQv6FUjIfmPqB9rwMMyA9mfeObWc9/C/o8cWhcuXdsl8uSaBQMMAVFLHX4TwkWlwY2qLpDyo7JbM8RBxBxA/ZrWNGXFV63+ujv1ASNXGdS2yjGlRiXGUtwP5avF8GpQ6WtfCyky+03uUr97iy6wsWWLP8O5sfJ+cM+OfdyV+R9cm+UJ4d+GHrKBFKcUAyc6TwkqbK7m6Pww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 22:22:12 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 22:22:10 +0000
Message-ID: <0a7f9c75-2535-4fc0-bec2-ad4ae6b52a7d@intel.com>
Date: Wed, 5 Feb 2025 14:22:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/23] x86/resctrl: Add __init attribute to functions
 called from resctrl_late_init()
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <e946a96a5d161f7b32e84c23c1a0024a31db2898.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e946a96a5d161f7b32e84c23c1a0024a31db2898.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 225e4f6c-4643-4e02-1f43-08dd46338878
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Lys5RkJvenpFd2RhODNTdUhhYy96d0xMdzhwZXdVMWl1SzBJRUQrWEZzQjE5?=
 =?utf-8?B?S2ZIT082bTl5a2Z6SXd4ZW9QbzROaTFNZGFzTCttM1lzTGlRb1BvcTlvbjVo?=
 =?utf-8?B?dGtmUXc2VlFkcEhIMWNZbFJncU5OckZXRlp1UCtFUzQ0cWliU09JVjViYkhC?=
 =?utf-8?B?V0wvbjNQS0E5VEZobTQ4QlJJRE9ac2R5ZjJDQkl5TjdGTnNaalZVbzM0L1ZY?=
 =?utf-8?B?NG10MFBXOEt1S2FGRmxhWWk5RG1waThkc0dEUlJJT1htZ1ZNUUF4aDRiN0Vi?=
 =?utf-8?B?cmFBQ0tSaDFwejFySFBVOWdmUzdDVjlIbVE0dXFDbmJWZVhNWmhLeGttWDlk?=
 =?utf-8?B?QzVab1psbUh0WEN4RHhsN0diaVBGMlFTT0tLZkE0MWlIRkppaEtwUU1tT0Ni?=
 =?utf-8?B?djNuN2NRcUtZN0dyK1JjenRxSHRIbUI5dEkyRXhJVVF1ZnBkdWtZeUxqU04y?=
 =?utf-8?B?TkowSU9ZT1hwTTd1M280cVdsYVB0Skwvc0h5NUd4NjNxOEptNXozc21qSStK?=
 =?utf-8?B?OVlNclZKTlZmNEt3MjVneXhBR3Q2Wkt5L2JpRE1ramZORVorSHU2dThVWmEz?=
 =?utf-8?B?WkNSV0ZSZlhNbjljRHk5WWdKOXowSnV0MWZNQ24rUmJqWXhsaXFudGgvNTJ6?=
 =?utf-8?B?L0ZkRk14ODhFbnlyOEt6T2xEeitPb2lBdnVIS09Ld0JCS1M2WUU4SzFpeHFo?=
 =?utf-8?B?MWhad0Q0TlVNTGR4Q0xUV3F4TTRRYWx3MWF4VTZIa2JEbGVUeHh3bHJVVlkw?=
 =?utf-8?B?UXo5d0pia1JsZEg3OExOUGxEZG0ya29MUVUybEpzSWV3elFYekZBODA5aXNR?=
 =?utf-8?B?YlhCMzRxQk5UM3Y4Vkl4OGYxb3BROGV6NmFxQjY3cEltbXdjZ1lyQnZPa3Za?=
 =?utf-8?B?UXExV1ZrTFhCa2pGL3hwT0Z2bWZnOTl3ek5nUklGSlU4QitSaTBnK1N5cExT?=
 =?utf-8?B?OVUyZ1ZJdlJNbVg0TEtteklZN2oyY0NxUkUyQVZvaGk1K0oxbXFZYUkxR2s4?=
 =?utf-8?B?ZWxReVRIWUo5TFNvZkFXN0lRWUc1U3A1MytnZUdORmpZcGwzQ1NYc1AyQXho?=
 =?utf-8?B?K2Z2VFZ6VTB1dk1Xd014alRDMlp2TGc5QjBmVnQwYWVQNFBta2o5R0dzMzE5?=
 =?utf-8?B?TXU2OFdUT3NBTllRdHhzdGM0VmxKVS9TOE5kUkRVUGM3SFowTE9iT2plbG1u?=
 =?utf-8?B?VlhKUjJtbEJtNGVYNS8zbGd2WFpYVmorb3hieEhCc2grL0tha3NqdjVlYjJz?=
 =?utf-8?B?bk5xUGpYMHRtSXFrUDVlRExQbGJaL2hKMjhDUFU2VUZHeVNwQW5nVXV0ZURj?=
 =?utf-8?B?OFdkUW1qbVdQaktuSVl0V3p6V1dZOHVpWVZWQWV2TG00c280aUdmempSZkF6?=
 =?utf-8?B?anF5NkZZbWpkMkovNWFVUmVjS0tDcXI4S0hsdDRCU2U1SUVDY2NRdzNOaEM2?=
 =?utf-8?B?a0VDbFlnSjA4aE95TXR1dlphQndzbXFCREcwNUQ0ck1pVTE3dTkxMFZWM3Y2?=
 =?utf-8?B?b25uVmVSdEZ4akIrRFZOTmoxUURFbHh5aHlvbHloWEtZc3FaMkZhVnFRUkc0?=
 =?utf-8?B?Zk8wc3EwN0J5emRRMUY4SlR0VlZoRVVRQXU3czZ6cHB2T0RlNU96cDBlQXhU?=
 =?utf-8?B?ckQ1NXBtVXQwWG1PNTdnRnZyMnhNWUR1bkJNelZ2alZGRHBCNlArK0FyamNk?=
 =?utf-8?B?UzAxckhxcHBDVkl1Mmxwa2NCekZKd3Fyb3RuQ1dVM0R1ZStBN1RSSFJGbmpY?=
 =?utf-8?B?aDJ3S3ljMHVGS3VsWTU0V2g2U3ExSmV5TFg3c1dDYTgxUEpSbFN2WEd0SVdZ?=
 =?utf-8?B?N3Y3QWVVMGV2L01DQ1hUWHJ4dFNrcER3UEk2VmdMc1pBdGNVUGpYc24zZkdE?=
 =?utf-8?Q?sXTFxLoPXe0HJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2JEcGplbTNVSmVsK1JwdzJxZUc4NEZPN3NzTDV4Qkw4Vkh1WVlsVWpSTm1z?=
 =?utf-8?B?Uzd2OVZQTEVicUQ2eEoxNDl6bEYxTEEwNUJqN2FpV3VxM0ZWNG5TcTJvcFpJ?=
 =?utf-8?B?aUEyRVIrUTRKMEtYYk9qclJkRjF6TkdrcGdDRTFqbW4rZnhMNFBMaDVvNFJT?=
 =?utf-8?B?U2NjWjRLZjUyMjZBNUlxZCs4U1FwMDJiSDJFcEZtYmFoSDVwbFNLRTluclNl?=
 =?utf-8?B?NnBKNVYrZS9yci9Sb1dlRHhiMmMrSDVkMFhYVFFDanZHajFQSVpCWHFQbEt1?=
 =?utf-8?B?dk9xaE5RcW5xY1ErdVhhckQ5T3VuSlNpMXl4Kyt6QWpsOXFkWkZkREtIQ0d0?=
 =?utf-8?B?aWNYVytndVVmbGtQMDBDQnJyblBVQVF3eVdtR0hLNWtqR0szdVpBMDc3aktF?=
 =?utf-8?B?RVcrZUZvSDJIekpJL09INnducWRkVXFqOXNOL2haNEdUV29QYUxJNWkvaXhE?=
 =?utf-8?B?Z0Q5WVJFRVlWLzlZdGZGelMvczVUV1E2cVhXbk5sRk5sQXhFS2tpNUkyS2FW?=
 =?utf-8?B?TGVJZXdNNXd1WE9OOG10dEsycExkenpldVQ3QXNwWDlVWGFKSnRVSjYrN2Jx?=
 =?utf-8?B?QWt6cDVmZ3VkK1RsdnhWem9KclE5Ym1UbW5tRG14OVFLUDlQRlpxdlVLaW43?=
 =?utf-8?B?U2ZWVmRNOHN3K3V0aCszOTlGc2pxeS80TExTREtZR1hXRGMvR0FrSnhVY2dI?=
 =?utf-8?B?UTBMdWFQcXVjVjZwQkQ5ekxqT0hYK01POWk0bjVlMm9JNmlxV0FKN3FiWGFq?=
 =?utf-8?B?NmdHQjhkUlBVSlhpazdKMENqRDdwWUw0dmZSSHl0NWhSeTVreFdZa2VKTCtX?=
 =?utf-8?B?c0VDOUcxU1lwRGd0RUFTYjVVMFU5K20rVjdoeUMxU3Q3ckZYSklsamV2aXlP?=
 =?utf-8?B?WHp1MzlBSWM1dEI3WUt2WXlqVVhJRGVNeWtvalhOVFZCZ1dnS2djaU9SaDg0?=
 =?utf-8?B?UCswYklqWHd5UWFEOFJ5UzNmR3NWTXZrVUhXSUorVXJjOWlQd21hWHYzQnBL?=
 =?utf-8?B?NTQzY0xZOUFtOU9MWDJoK2VtYmlEdWhTaXl0QW9vMWNTOHJoREVBM1daYmcx?=
 =?utf-8?B?a3dWa29LY2xzMEpoUm8zbmpDSFlVRUFteXpGd3pGa0FNVCtVWUVJN1hqcGN3?=
 =?utf-8?B?K0tWVlFvc0xYMmRyNXg5ZzZRMzF6WUUvUmF1S1Bwb3hFM3REbHNzK3NRZ2FZ?=
 =?utf-8?B?bnljMWhMemNCTFdiM1pBWFlGR3l6U01DNitlUjNUemZsaFFiVWRnU1llaFBq?=
 =?utf-8?B?WThhWEdMS1luZjBXbmxPY1NLS0lmUmtKbVJTZDNpK0o5RTFtcTE4WVZoUFFU?=
 =?utf-8?B?Mno3dU83bjZHWFAxTmVBdFFwV1JjVnVTOSsyRXNLQ2dHeWpYOU5pOXJWTkk1?=
 =?utf-8?B?ZE5BOTU5Y1NtZVhHbldVTStGNk53bmhld21qSjdVaXZnNjkvZ3p2Vlh2Rmd6?=
 =?utf-8?B?OFZoMndFdkhDSXI3dnk0S1UxU1hRNUxpWHN2ak8xc1d5MVJkbjFLUFpMUEVG?=
 =?utf-8?B?bE1aeG5sTE5RcDdjTVBCREVJbmxHZUcxbk51a29hZEdSYmN3bzYxTzBpM1dN?=
 =?utf-8?B?TzBEYXROak8rOG81QzlYREp5Q2ZEdFJEQ1RoQkRSc1lIZTU4QUEyWktaUW1a?=
 =?utf-8?B?S0dIOWZmVVRKTXdnaFNXcUFNek9DMyt3YnNGM1hBMmdVY3ZhVWpwOUNvcVBh?=
 =?utf-8?B?MUxsc21GbWcrSkFuZEtVS3I3bWhZT3I5R1lTMjlDNEJETlprVDBmN290MkNE?=
 =?utf-8?B?MmNUeVYveWlGdmdCNklmQmZOaEhjc1dlMnhWUk5IS1BvQkNnczFIaHdXVzRu?=
 =?utf-8?B?OWY5THMyM3dyQm1MRzF1VExmVVZUaHVvRm9Nekl2M0NlcGVkajg1R1crakVo?=
 =?utf-8?B?dmZucVZPcHBsSFJkbWxCTUNxUUY2RmNwcVhHczNIcHVEL2ErQ3NXQUhnZ1V3?=
 =?utf-8?B?NXg0MEp1QUxZNDJJRmZRMGZhRjZVZVl4N1ZqTllzYWJXWVE2dERYVnBKbEZr?=
 =?utf-8?B?ZC9JSWNhUFF4cnRrZEVoSmg3TC9PczVpZGJYNGxOL3hMS1R2Z2JPODh5dGVy?=
 =?utf-8?B?ZFZlUDBZNWlRRHlJWUdidnA0ZUZhWVE5bjlITXh1QWxmVlVwOHliUDNabjg3?=
 =?utf-8?B?RUhIUW5hMERzV3hlQ0tzeDNCZjRGbkl2WFE0YmV5d1puUUdVZVZqTEZNRW9i?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e4f6c-4643-4e02-1f43-08dd46338878
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 22:22:10.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qb6JLq8ViExAYR33wWVsOL/XxWhCRjfsXelwdM5Q8oRDrR69Hh4Pzor1mRMEld3xxzPTMGXnI47In5q+6/ndkMrrrd2RccgjdwZRY+7Hhm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> resctrl_late_init() has the __init attribute, but some of the functions
> called from it do not have the __init attribute.
> 
> Add the __init attribute to all the functions in the call sequences to
> maintain consistency throughout.
> 
> Fixes: 6a445edce657 ("x86/intel_rdt/cqm: Add RDT monitoring initialization")
> Fixes: def10853930a ("x86/intel_rdt: Add two new resources for L2 Code and Data Prioritization (CDP)")
> Fixes: bd334c86b5d7 ("x86/resctrl: Add __init attribute to rdt_get_mon_l3_config()")
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

