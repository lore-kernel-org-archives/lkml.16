Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655821F4E4F;
	Wed, 28 May 2025 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453673; cv=fail; b=Az3HtE7K0nxetlrzBjTO8sVf8ezwZugNzU/Se3BGaMD85cs0bxGFm9+PyEI2DXpsjobdmahNe3dsKP/ZNnHZudHd/JVs5Lj8FsaM4mRlTt56S5M/OGlKFUmUtk8fjp/yxgU7L1i01lTc0r2kpwVhJ3eUZZafhAsEUuCHzm8VY10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453673; c=relaxed/simple;
	bh=fJHD4TW/RDyiLSQdoopzseeTE/vCzMAOgjskPpGpdHA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uNmSuArzbpGVKzzb7SQti4m6bLSSCRmid/Et1zBfl60rY3+fE6v1qQHzhCNw+jdrSJTKZK27LfvXJ3LREZlOeosinCb4sBmrB0+r5MS4fhtLVjKOzsflti/05riWrZ45+16jCIfanPyHwWtli3LT8JTkCPhY37MaZ8jryRIwpVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcL+uQRR; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcL+uQRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748453672; x=1779989672;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fJHD4TW/RDyiLSQdoopzseeTE/vCzMAOgjskPpGpdHA=;
  b=fcL+uQRRfk/+L0RriefLG0puafHl4CCz/RCG9+yVDCSkuJyL+aF9Oz2i
   IMiJLBfqxPM2AjTIfJc3Nauamx0SArqQ9MW3wGIcCj9KKZSZUXNz3+6Rq
   s1CeYSsvTK9n6+W+MS4varj3R5KHOsL+jXXMfHJLUXK7Z9ceatPx60IMY
   7nWFe5FNpILs73zF8b/m+iPVXeVmO0XGvJE0n8OwHkmZZvn1VsoDEybd1
   ZX95M3+SciZzENTE47xdE1fFUs3r8giZ2R0Zg4qp2TmyyXHiPuAsXcP0O
   GrvqMc2u8alys3IAnfePrv0737rir3Ek0vRViyRjpjxQ8Rec8+wqYwUjw
   w==;
X-CSE-ConnectionGUID: V8FD0ESJTGan7Dl4EBWfqA==
X-CSE-MsgGUID: IZK8X4ZeQS2K6qU4MgFUFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50378864"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50378864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:34:30 -0700
X-CSE-ConnectionGUID: lIhWSFs4Qi6lQ+2zTYO14Q==
X-CSE-MsgGUID: oJjuSotASKqOl/gn/+oOjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="147185128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:34:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 10:34:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 10:34:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 10:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcsSNFF5QrVB5NrUyADTEY9UWyn1AjOxppGm8MRbdJY9tBbEIJe4NNKACRf63TUREh5DOB0iT9ncWd/vssU1S+JJXAdxquG3zUA5deuOr9Ez8Xvmax0/8Kn/1+doZO8NCb/dPtYMQFsKrmpGeZvQ0LbrHmo0zQuS7IujR7DBEsEXCby9Ns4cLZEoYsfv+RxQVDKooxbtwDY7oz+QrHAbEVrCZt2ubZ4UTce/DJqIiVVqK7+q3MXp6wu38bvNR1bopvyz3EPYTECUjLt5xeKOJ4WiRiKqNbvDTaOsaX8vFKDSU08kI4tBhMvZFQwifvNxPAnHReWU/zZ6xF0n8lGegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvo7uwH1OlvakEF25QUgRSA8uiRm7aYuUjyYhwibSjQ=;
 b=fYJsbgoj+y8h1je5hJBphGT89LqKSqKp7v2VBoncHG6RcYCBze34+a58nPJd6/0ogHkMm5QQBUzpZif2DNBxanmvciGh1NTNJdUu7oWy3Ht9Y78E0cC2m4SqgGPFFaC1WbP53K/h5yKyhtOxBZy36AlwJab6Tia52YZd+TR7VldSCmiDWQSI8v0YG6vLUPOnFxOoJT5xAQXtnosZW64hUE4JW08Q9gRVJFXWMJc+yjNTQbdLgoAfaiRLFIC/1tPnNFP6KlS4lAoZWvKAdbULvrcWKyg2B5k6ZbFKCT5yUZluHr3X+/+g8dHd7FE67tnKKDsU0jOHvThv/GpH7mCatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 17:34:07 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 17:34:07 +0000
Message-ID: <14ca1527-ee25-448d-949b-ed8df546c916@intel.com>
Date: Wed, 28 May 2025 10:34:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/27] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <79efa13654a6f1a308622bd13e0d2bc21ffb4367.1747349530.git.babu.moger@amd.com>
 <5636898e-78dc-4eb1-b226-ced62372e09a@intel.com>
 <40ff2cd0-c8b9-460b-b98a-087cb251324e@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <40ff2cd0-c8b9-460b-b98a-087cb251324e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 17edfb79-bd3b-4f87-4c6a-08dd9e0dd90d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RrQ1EvMXVBaWxvTldTN3QrYUNsWDZiSWxoVVdlTEpuWnBiS0xRMDBQTlNL?=
 =?utf-8?B?ZlExbDZqd0VQWU5RQVN5QWhyV0RXS2NJNC9nb0hUQUd4blJMSFVCM2pHR3Nu?=
 =?utf-8?B?MVhpdXBzTDYyM0ZQazVMcWd4M2RmajZBVHpMV0lJSmZCOEZwMDkwUzJZbmNS?=
 =?utf-8?B?LzBnSVVjMnlQa3hFZmV5VUlHb2w4L2hQbnNOWkI1NHpGRzJnRHdTRFpyck5q?=
 =?utf-8?B?M1k2UHY4TDJQQkVEVFVYeVBnN09EUmtnRm1nSkdlT1BZVEI1N0hFTzh2T3Iv?=
 =?utf-8?B?N1YvRW9uUThRL3VIS1F6S2NzZ1d1aWd5bzIyR29SNUlEV09meHVRSlVDUkRs?=
 =?utf-8?B?ZS96WVRYV2svMlRXeWRoZnBMOXRnVTRGb3BsS1ROTXhQbDVOOWU5MWtyQ1VM?=
 =?utf-8?B?VjRld0ZvZ3UvcHBneXJQTGxzSmM5UnR0bVZaNjhqS1pGc043WmVsYXhDQUg0?=
 =?utf-8?B?NUJtMng4eUUvSXFrblNoc0FlUCtsZHIxZ1gxRFl2S3daV1JzV2R6dElJV2Mz?=
 =?utf-8?B?dVZvRENUeEUzaUdqRk1PT05jTnBtNlBSUFhiSHdxQ2F6bmNHM3NaemkwMEV0?=
 =?utf-8?B?dXRQMWpQd1pBT0lmbnpFUVpqRGd5dHNXQXk5c0FVbmQrdjRYdjRKK1RYUTAx?=
 =?utf-8?B?MkFaZzRLR0VweVR1cGxnMzkzOFRETDEveHJSaEJaWjYxTytvRHlmQ2Zva1lD?=
 =?utf-8?B?YUhOck83SmdabmlTeERMcHp0TjBjbU1xZmVwR3dHYTVLdmxMVDZvbG5QRjF6?=
 =?utf-8?B?bW83eUhpYTc2UXVwVnMrSlpJaFl3UzB5OU9lSmVoT1JZSjNabzQwc3VEZ0xn?=
 =?utf-8?B?ekJOQm5mVDNPWTN3dk5xNHJYdVBvSndPeVR3ZjdnUi9BZFlYT2REcXdxeS9z?=
 =?utf-8?B?UEs4M1JRNmlNcGdEY1NsUEZGUEpjcy9CYUc4M1ByOUxmU21xaTBHMW05eSsr?=
 =?utf-8?B?bTFCblZBVURqNkJSMzJmL3B3aExOVUw0WHRsajlTeW9OL1h1SzA3MGhrSEFG?=
 =?utf-8?B?RVF3K0pkSE9wcE1SaDIyc050SDU2V3FGRVFNaE1QUkVNN2hSZ0NqY0V2TGFh?=
 =?utf-8?B?Wk5mQ01OR29semhwRlV0OXRJYngxUWk0ZG1tSGxvcnA5SU05WEJzQ0paaHdZ?=
 =?utf-8?B?L1F1cUEwNFdHWGxuSGN1M0pOM1I3WHJRRzk4VnVyS09CUDZMVlRLQWE5UTlp?=
 =?utf-8?B?YkRkQkZNTFNUUjh2SVE2OFdteFFacnp5eFdrZnRNS1JxYk5FQXFsNVg3emFQ?=
 =?utf-8?B?WER1VjBmVzE0SC9TRWRndGtMcEpBVmM0cFZlVmUzQTNMWk5JangwUjhiOEl6?=
 =?utf-8?B?OVczek9KTWw5bWZWZ1pIaHlHbzhmNG1HZUdhQVVUYUZwMVQyRmxDVkpQOE5n?=
 =?utf-8?B?bjRWWjI5TGhKcC9CN3Rka1RITHNFTC9XT0R5eEtvWUhPSFBMSUdYalMreXlh?=
 =?utf-8?B?L3B3MTVhSEYvQ2hDK2hBbzNYR0ZrQmc4a3JkajRmNlhZeXBETDhiTjVsb2xD?=
 =?utf-8?B?RWk1NzA2eTRoS2xDall2SGFpRDA1T0NjNnptbzUxaXhkSytpd09leGZIMW1H?=
 =?utf-8?B?SWNBS3ZLd01BTHg5VmpTLzN6L2M4alc4Y3k2dngrY3dNYkJXSnJsOGMyVzc0?=
 =?utf-8?B?N3BxVlNvZFV2bEVFMXV6U010d0cyN25aeUdobmU2ajJsd0xqa2xwSHhHZEdH?=
 =?utf-8?B?MlhPSTN5b3JXS2RhRUh6dkEyYVFiNGdYbmtEUVIxUzBUV3hZbm9PRW5GK3lD?=
 =?utf-8?B?YUp0NmNFdmpHamFPMEtUdUxySHFmd0dZWXhwRnlZQUlDdkswN3ZuZVpKT0Zo?=
 =?utf-8?B?ZnJGZDdZYUU4M0xOT1F3VEdTVVRhUkk0NlVtaEZWUjBNZnpzTFdJNzA1TGhx?=
 =?utf-8?B?S2k3dlJBcWpTZnFRRW9WS1c1dytZR0loR3ZHZUVidklPM1QydlZtcVRuTnNq?=
 =?utf-8?Q?mx4iw+oKpO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1FnNExmYVFoWUxWVElPVzc2dUJpYVk2L2ZuRVpabUtBVTJHZHVKbml5by9r?=
 =?utf-8?B?UzhBMmRkSGlIZzZKUFovRjZJVlFObzVjUTdlLzY5NTU4NVkvSS9TaHkxN2hI?=
 =?utf-8?B?UTErc0dEd1cydG5vWnJxUW5KSmRLcHZWYnY5U1lYellXbGxXVE9zT0xjdFlB?=
 =?utf-8?B?b0pubXlYVldpQjJtcUI0eGFHRmdSL0p5dFhWQlZnN1dDYUFXNVFjdDg5TE5R?=
 =?utf-8?B?NkpFaVY2N1R2cG51QjBPdG02OEJPUUdSTXlEcmlzWFRPWXZxVjRYb3RSbmlv?=
 =?utf-8?B?bE41dkhnZ2dCMHJWL3JOdHpCN2toMStEY1VkUE9FQ2srbUtQT1FYUGFDQkU4?=
 =?utf-8?B?b0NsbU5seW1EYVI0d3JFOXpHRzJzU3FUaFRmZjlQTjNxc1NsNW9wbGNnM3Zr?=
 =?utf-8?B?eWF5RkplaHZqUGp6UFlPUFlYZlJ3WXFXb2lvdk5iSVB3elYwTU9IM3lZUGlB?=
 =?utf-8?B?Yml6MjIrakpFUldVSGk0dXIzekY0NUZDdVVDeXBwZzd0VEtlYXdjZjJjQ05S?=
 =?utf-8?B?b3o1Y0xJN0h5dnRXbktqaUwyTlhMRkZpUjh6QTkzL25VK0ZLNXhWd1B1V3RI?=
 =?utf-8?B?RGQ2cWM4STBZWkVVZXpVZm9rbjZYS2k5RXFqaTlReTROd0pwRWpTVzg5dG5T?=
 =?utf-8?B?OTh1WnRVVi9UUmFYVmIxVjdEeUltMFAxRWlSeVZ3K2xLLzYwYjRyUXU4QXh3?=
 =?utf-8?B?NFF0VnpsWndIaTVLVjArOVBXMHJvT0ErcXFURzVEQU5jSE4wQ2c4MWwrdWpz?=
 =?utf-8?B?ZTlXZ1VFS2k2Y2QrSUF1Y1JkcTZCeW5wVllxKzUyR2NuVjgzbk5HclRxWWRo?=
 =?utf-8?B?VG0vR01nTVpUaVJXWEltMTlqRmlxc2x6ZGs2TjBUYlFybG9vK0ZscW5BVGxP?=
 =?utf-8?B?SUtJQWw5a0JMU2djdzlDVzlSWGNiNFJ0VFg0Q2phbDN1VlptSzV4TDgzalhy?=
 =?utf-8?B?VXI5Ty80Tk5WWm93dEtqME8zVzZNdG4xWkR4UTQzUytUWExxemRaR0VzZGpj?=
 =?utf-8?B?N2NucFZIZzhibnRpNXJVejgwWW1OeHNzWjZ4ZnlwNXMvUHZNQW91ckw3Qkto?=
 =?utf-8?B?M0JxWUVwSlEwdkY4MXNQSkxxMG9GSkNmT2s4aGRoejFwZlRKcUJrR1Q1V0Ji?=
 =?utf-8?B?UlEvSU9XM3Z5bHU5SzYxckxlZm5uVjZJMjlGUmJzU25INlpyL2thQWlndUFm?=
 =?utf-8?B?ZXB2S24zQzFERjNSTk9UcGFuYWNoZXNxRnlLZVIySm5BS1FZOFZWamtyVDNR?=
 =?utf-8?B?N3J1SnVhSG9iN2JaTTNIdnE4M3Qxck5hMHpXUFhaN1djeEtnQnRhMDJjMkRZ?=
 =?utf-8?B?M3EvV3l1NnV2RXNqS1daa0xEWkl0bmErSzBOYlc1U3c1Q1MrMVlYQ1lzZC9L?=
 =?utf-8?B?dWFETVVJSDNTL01ma1I3Ty9iMzl3QmJ2Vm9PTTIxMlVVM3UrR2dOU1A3Q1JF?=
 =?utf-8?B?T2lqWWl5OTljcVNmWmJ2b2YrMjRQVkw2UFpqbHJaeEU5bG9KRUdMM1piZHd3?=
 =?utf-8?B?dlV3VE9ua3k5MzI2OVpDMnN6ZjVkRVpMMm9RSlljZjdWT3pqaENZOVZBcjUv?=
 =?utf-8?B?eG4yOUo0NkpkMHBMeGpFVTdyK1pIb0tza09wRURvaEhvbTMyN2h4S1hZTzMr?=
 =?utf-8?B?Vi94WU53aEdFc2crQjV2TjJMaWZXcWN1RzF3RFNXTGtzcWFWdER5SlFYWHg4?=
 =?utf-8?B?Uyt2c3k3WERiS3dZZStWOWx2cmdDNkFkNFcwZTJCZTBGMWVkMWltQm1ML1FQ?=
 =?utf-8?B?b1hvRVFnZlFVaWJIT0dJM1dQRUYxVjFVVlhlZWJDSG5KckxSMU1CNUdDeDYy?=
 =?utf-8?B?UjRML1RGUVVSNXlqaXNCSkIvOUZJN1BWdmlhQzRIRDl2ZWVuVTduSzl3UGlx?=
 =?utf-8?B?RTFzbHJld0loVTNFeWlHWm16OHR5ZXRsUmdJWVlQd2hLL2EyV0Fjc0gySTJC?=
 =?utf-8?B?aE91dlRwb1p0ekpRUmNvS3d0TDFnSmF4VXVWbUFhK3prSEN2VjlOZG1FYzFJ?=
 =?utf-8?B?R2JCNm1MY1ZQTjB1dW1qemZkS0tiQzlTYnZ4akRZczZhNFovZ29PTnBlNVZa?=
 =?utf-8?B?blRLYnRNSVAreXpEV1c4S3Fia0FHUTNYL3hXVFRyaFhCZTBQZHlKMTdoSnQ2?=
 =?utf-8?B?R1ZzVTdVNTZ5RWpURmIvcWJvbnlxM3djK1ZVZGJzN1lTdlA2dUxiZ2NadmlM?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17edfb79-bd3b-4f87-4c6a-08dd9e0dd90d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:34:07.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb1JjafVN6Ssxbt5jGk7yHX8Z1XLpZL2VuCHCFjaF42spTO0bwQ4k8X63kalYQPtwxb9wA3kkHG7gCngtSsZ0soeIZR4Hzx70NcGldQRcSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
X-OriginatorOrg: intel.com

Hi Babu,

On 5/28/25 9:56 AM, Moger, Babu wrote:
> On 5/22/2025 4:02 PM, Reinette Chatre wrote:
>> On 5/15/25 3:51 PM, Babu Moger wrote:

>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>> index bdb264875ef6..d77981d1fcb9 100644
>>> --- a/include/linux/resctrl.h
>>> +++ b/include/linux/resctrl.h
>>> @@ -156,6 +156,20 @@ struct rdt_ctrl_domain {
>>>       u32                *mbps_val;
>>>   };
>>>   +/**
>>> + * struct mbm_cntr_cfg - Assignable counter configuration
>>> + * @evtid:        MBM event to which the counter is assigned. Only valid
>>> + *            if @rdtgroup is not NULL.
>>> + * @evt_cfg:        Event configuration value.
>>
>> @evt_cfg is not introduced in changelog nor defined here. Please add a snippet here
>> on what @evt_cfg's values represent. This is important since this is exposed
>> as resctrl fs API to architectures so all architectures need to use same values when
>> interacting with resctrl.
> 
> Sure.
> 
> @evt_cfg: A value that represents memory transactions (e.g., reads, writes, etc.).

This still does not explain how an @evt_cfg value should be interpreted. For example, it
could be something like below (please feel free to improve).

@evt_cfg: Event configuration created using the READS_TO_LOCAL_MEM, READS_TO_REMOTE_MEM, etc. bits
	  that represent the memory transactions being counted.

Reinette
