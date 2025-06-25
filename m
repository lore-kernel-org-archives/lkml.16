Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535F287266;
	Wed, 25 Jun 2025 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894840; cv=fail; b=Xe5yharHnB/gKUudhr8I1S2v8xRSwVvaJ/AUFqeVUFdE4CH+P8KA5pzJSV9PddmA6JKXuKXTy1tt6BCVnniyUkAm9VsYckYUOwqmr+qbYliFqOsFA/Vm4pCID2++3Yrc7hKd2Y3INTcVi55P9L+ZO1oNGJ/Pe9X7c1eZV4FkNrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894840; c=relaxed/simple;
	bh=93bR2xFbtu46QBH0obE97PhEcBk4rzjy1YfMdgmLLpM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jukNdGkUUsJANnZBB3191lRoQ1JRBa0HooVrsRk7qoWJThvhu0lH116LMknfXnSfKEA9lMwS5GzNBaY2bqHDMlfUUxi9dvrrJXIXncqHX9PDKOKt4RRyMqSBxnNr1yF2hPyDj0FVI8pGvkEiU1Ae/LmYdBAXf34cWllQLwVrqhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9WYYBXf; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9WYYBXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750894839; x=1782430839;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=93bR2xFbtu46QBH0obE97PhEcBk4rzjy1YfMdgmLLpM=;
  b=B9WYYBXfQL8pvU0jjH0baLxISZbzLtiPAn+rWFESB3MZsqviLPV/adg7
   YEUK6Re/pfqHCCT9vzUJjcc6EHCT8bmBZWkpZCnGGpw4tFnMqOUcU/IqG
   ///C8UYO+2SgYR3QLCAb5d3axQpKCY6NCJNdP6hzQsMXppJBG7srzlK+p
   8hu6cPVfKLsdHdLAy1YERCrd2DSY56qA+JrCJ1pEFdn7gifktQfkl06fF
   5polMspeniX72CwoKolYKFTB8wj4SLbGG70pj8FTymhs8WNyCaAfSb6Gr
   qnNtCnhwuBbHhuykL6LZ1OwYdiHKcWhi0YUHW5fQU1hvUH4VYpre2Cak4
   A==;
X-CSE-ConnectionGUID: pMI0PNtjSN6nKx7+68nNSA==
X-CSE-MsgGUID: juQgKw0XSLWNweOa1VuHmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52407567"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="52407567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:40:37 -0700
X-CSE-ConnectionGUID: ahpB3JOXSDKSnpgv3Em1tg==
X-CSE-MsgGUID: 0opS+lZnSSGrjEuCr+fzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152655721"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:40:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:40:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:40:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWcla5nu+FRS69BzoKt2NRX6saEHc2c5IOnnjD4pozFyB8288MFfifc3aKUcEfDo45ULG3aWtG1bxKuCI3u3KXECDDLjbOXJpvIphqh8XbycpzflPe+YYG2UybQ+HQNyF7UqP1SsIUbLwKJariF6Afsgq+JtDgN+Bob0RgEQW+dl53jQfgIxO2VwrZKc3iRAWzGPd4IWWhXVSsa2FgXoJczkXzGKCoC5iy1ItSzuECp4/vp1DMZlP06/fh40pWhkufujpauSObDTEiiGhrm8y59izpb6C6xOa2zBqz73iI/yZ8MHfmbnAX0EKRj4RGlrqQFKtFy1/Q6+M9TZG+/x3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1sVOsBCcSf6QUloFdZQ7H2IrzKYhGE65jExIzL+a00=;
 b=Unk5mgr0tDoWYYbSvZTJL9u2gZYF52GceQjk3wqPPxg/Ks0ZcojMhKjkvcrHiAT0OZQcgG8w3yqcH0GWbBhPh38uD4f6gpAm4O6s1kQTEsTuogFBZcYjGgkl7Q1Y/ejokzZdjv5R1pYI9oNUOmDetkpCFHkLcHxdwf6Dx1ehgUzPyCxt611oQfz0I4txIynVbS3Ax7csJBJ48BEHSmKEsJGTUyaTNg0quKbhmol5CnoSYKwgRsBmfsPMSdRp9otfCsgGVJ+cU5F6k1gCbOShR37aPfBkFM7nMAddGBpYZtO/+ogzE8MWG7soyBcKA2G/bQmYYH/n+y+YySGc5ieJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 23:40:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:40:32 +0000
Message-ID: <367717a1-97e4-48ff-81dc-d6db90129016@intel.com>
Date: Wed, 25 Jun 2025 16:40:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 32/32] x86/resctrl: Configure mbm_event mode if
 supported
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <d0924000e0de931f414c7cc1697919f6d3beeff9.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d0924000e0de931f414c7cc1697919f6d3beeff9.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb984db-b2ef-458b-5024-08ddb441ac9c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnJJY0JxNkF1Rlg1ZnhLdlg4ZG9YT0pkbEpKeEVWSzR1RlU4UUdEbjJsa3FE?=
 =?utf-8?B?K2dZRHZBZklaQ3JLWkIweDVuWWpyVjMxSXdUVmJDTlJBNGh0eUo4a2F1R2Fs?=
 =?utf-8?B?Z0pTV2l2Umo4cWxFTTdIb2p0RUUwdjdPYTNoSGZPbDVQck9IMnB3ZXdScXNv?=
 =?utf-8?B?dVVXSCthalhaU0RxaDJ6NFc1NWw1cjN0L2R4LzVsU1liZTY5Y2laZCtqbjJP?=
 =?utf-8?B?aFJMQytCbTNsQzVaOFI5K0ZpRWxGanFVK1RRd3hOQXZXb3JacFlBcFhTOStI?=
 =?utf-8?B?SWxoQm5TdXByS2VvSFhsZTQxZFFiS3htWTcranltMXFQSTk5NzBGWWo2Undj?=
 =?utf-8?B?UWZ2Nnl2dUNsREs2aHc4TFZjeVpVNVlmMmFmckdqQUV1emhLZW16OCtiaFRn?=
 =?utf-8?B?SlU0YkN4UEo4K2dvWkhybSsyUTFWeXhYK01rS1ZZRDByMVVjaE1zc3NkMWlK?=
 =?utf-8?B?d01RMjJpZythMXhqVnk0RHhxdUlyZE9idkYzUUtFLzV5L3J6SThLbU8rVWZP?=
 =?utf-8?B?MlF0YnJoT2VDWUR1ZzNXT3RaS0V0OWxhV0F0RGtpdTZzWE1CdjJKcG9jN2dW?=
 =?utf-8?B?T0V1R0ZxUnJqc3ZWSmNEOXkycHRCOGsvREQwVFVRbFY0N3ZDR1V6WFFmOHRR?=
 =?utf-8?B?ZjVEK0ZQTkt2aFZGKytlWHFGOTJxRStQbEJnQjNmWHpWS1djWktxdHUxazRZ?=
 =?utf-8?B?cWNTQzZKTkVTUkxEUStVTnJwV0FwbXdtalFQWWp3cHJjbVhsdVoxdDZEaGtm?=
 =?utf-8?B?K3E5UXozbGZUNWhlM2ZxS2JtWWpHMzBIUGJZYjNFYzNJWWVyY2swUWNVZEd5?=
 =?utf-8?B?Ui9CZ01rYnA0U1liUVU3WjlXVTQ2bmd4UHZYVmt6MTRReEtZVnlNVStITlpv?=
 =?utf-8?B?T3NxZzNaZjhWZVVBWUlxb0RPYmgydEZTZVNja20rRmdHMkovM2F4dytyQ3FT?=
 =?utf-8?B?a1BDVDJRcEVyVDBybHRmTWRVeGhuaVF4NHFrSmRMdHBJUHFtSndFRXZQeHlt?=
 =?utf-8?B?ZWpxYmNjaEFlelRNaDErS0dSRldOSDhlalI4Z3RDMEx0eW9iZGZOWVloU0wz?=
 =?utf-8?B?MEY2TDlYZDh2bzdiRzZXUnBhQ2NIQjZBR2Nmc1cwbWtlK1AxWGt0eGpUdEdu?=
 =?utf-8?B?Ujg1RG0xcytNZThKdFh1RksxZlYrVTU3UlovY3NiZUdPUEowUVdYcTNYUExY?=
 =?utf-8?B?K1JJTForZHNJbUlXTzNyMWxHMTBtQmtLWjFPN28rMXIxNE1jZU5NSjFpOTRy?=
 =?utf-8?B?Mzd4bk14b0E1Q1l3SXpYYmZMZElINTRBU2xVR1RPTjdpeng3cWxvQUxZRjdQ?=
 =?utf-8?B?ck9ZdExDWktCbXdzYmRUT3B5SjgrK1NUbEZhZlBqSFVrK0FsVHJtTTZvT0ZH?=
 =?utf-8?B?aENicDlJcFJwR1lMSytwUTRCZ1h3eHFoNmtpQ3RZYmRpTER6NTZHNVh5dzZR?=
 =?utf-8?B?cjVxbTJ2bFY4WkR4R2ZGSmFJYndPeXVJQmcwQkxMYjR4cEhBV0xVakxINzk0?=
 =?utf-8?B?Y3VjVnlmRGtRWklKRllYRWpaNkk3WFZFVU5RVDNoUXlDV1ByM1lveXNRcmJB?=
 =?utf-8?B?VnBiRWplcm9IR2dXSFpoWGhPaUE3aHc3d3NVVjhpSkw3eEkyTUVlU0FLdEhq?=
 =?utf-8?B?eG9JSHh5ZVNiWHJ3bUE5aVkvOHYvc2ZUT1JIOFVzWUhlaXQzMkZySkNJWXdY?=
 =?utf-8?B?azJBUDBBMG8rWHF2Yzh4MFNTV2R6M0hXdkZHaFpiclUzU1ErTGZPRzVrOTBP?=
 =?utf-8?B?TlFIcGFaWU5JOW9FbGZLRm9Gb2JDS01JMnZSaTZZbENYOWFNRzZkMC96Tm5U?=
 =?utf-8?B?bjRqTk1TV1VFVlFiZFlqVWhOc3dBU1Nhc1dUdlJzRkNUNmNxTkdwTlZnQmRk?=
 =?utf-8?B?cHV6dlVrMlFoZnpvOFpHdkVSWS9XVVdGckV2bitPRGhvY1UzR2g4djdhVkMx?=
 =?utf-8?Q?TAs3/nBNqig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG0xNFBDU1FacXFnQjBIWWlwakNocC9UU2cyNlZmTHpoNmhlR0hHNE9wSzM1?=
 =?utf-8?B?YkUxL2xMQWlFRTRtQy9iR09FK2JsbU5zMlUrME9sN254UGlJdGNoOG9rS2Nh?=
 =?utf-8?B?N1A1WE9HTitHYjg3VktEYkIzQ1pac0gwVHFMZk9lQ2RYSzl0RS9UcklLc09T?=
 =?utf-8?B?MGRmSkJwSHdYNGljRmd5eHNQQ2dmWVI2bE1jeVVGTHQrbGRJbG9US1ducGhC?=
 =?utf-8?B?U1BvUDE1b2ZrdjQzK2ZNU2ZYelIrQ294elF3K2NVVkp1ZmxyKzY1Q3J6MVVy?=
 =?utf-8?B?TVZyR2hNYkZOdXRuYktEbUc1SjVIQjJxQmhFQ3lhUnNBaWVLT1V2T1JXa3lG?=
 =?utf-8?B?MGFKaGZOQ0QyVHJINUJ6UjA2VUFVTG0xVi83L2x5VlBUQkxjYjZvY0NvNUlE?=
 =?utf-8?B?bjE2Y3FhWERkS3BrWkwrVkdEZERwQlZWem5aV2kzZUx5eC9VQ0NxaGNhSkhr?=
 =?utf-8?B?QUtlekp5bm55UzZGUkIxRkpZb1k3OHVEdmF2K2JBbXhZeUZOSzFJcTU2V2hn?=
 =?utf-8?B?WTk3Y3g4eE5MdHliVWovd0g5VTNYSk1hek0vSXY1RExSZWlGekhsRmN1clpX?=
 =?utf-8?B?cytLZUdlVzg3ZGdUOXhWV0RPbWszbFJLekZuTXRneXduSjdLMFZDbTA0b1pQ?=
 =?utf-8?B?Ry9UWkYzaUhEQ1RXT3duczFRcVZoTGVvTU5Nd1QvV0daKy9vTjAvQU1pb2hU?=
 =?utf-8?B?eWFrMkx3SjBHU0lEc3Vkdk5XMjhuSjFOZTRuZWppeW5kWmFpSjhRUnhuOUVN?=
 =?utf-8?B?Ri9VN3RpeXhoS3gxQWdMN1AzT1ArWWdQYkd5OWtwZTJnMC9meUkreUE0NWhs?=
 =?utf-8?B?a3dOa2JUNERxbkUvR0gwNjNHQ29XNlNQYjV6YXZkcHArRlYzaC9tVW9wa0xt?=
 =?utf-8?B?Q2xqU01BWXkvcDI0R2p4Q2dzbWxnL3JkSHJzaVdLUDZOYUZvK0NRWEJBenlR?=
 =?utf-8?B?MC9TLzZ1SGlEZVRyMk5jUkRoTEg0blhRWDAvL3hsSXJVbVN3NFdXakRZUVhU?=
 =?utf-8?B?WU9zN2UyZG5SL1FjbTVkQitvZmdvVDV5ZGhHTWJtRytuVkRwWFA0cmQycm1R?=
 =?utf-8?B?ZFBJclZienJ0Z0pDV0FkVHQrZGlEc05UTmhKdFdqUlZSbVh5Ty9kYnAvSU14?=
 =?utf-8?B?dWx0Ui9GemRwWXJTQm1yeENENEtpbkZlYzJZZUo2SUdJV0tNbDlwVWtWRFZs?=
 =?utf-8?B?WDhDUnZZRmpHQTg3bjgxRmQ5L3pudU1YMWJtelNLTStja1hqN21SNVF6QjJQ?=
 =?utf-8?B?dUErdTNVUmdONmt2UDVFcTIvQ2Z5ZndiTlhxTHJrUHBNcVVZZDZDTFN6SnFF?=
 =?utf-8?B?ZjVyM3VEVWcxTFMzTUFqTzZRdFFVK25NRXdGbTcvbE03VFlVODVwVnRCREZa?=
 =?utf-8?B?VEE2TXBUMEU2S2FPcllHc0Q4QmdLQmNtNFU0djUyVzYwZTFKZURXbS9NaGdw?=
 =?utf-8?B?VkJJWDFjeXYwOURCRDV2OERKWXZiWGFXOW0rV3g2ajdwTHg1WktZTU03RzNy?=
 =?utf-8?B?VjdJVGx0RllONHVJdGl1bkllZjJHeXh2MVdESDZGQkl3WUFCM2RLSTZNdTNV?=
 =?utf-8?B?NFhrUHBKUTE0ZEptOURxdjMxSkMvRitOVTFuZGNzWDB2a3VwcDRjdTNKWjlE?=
 =?utf-8?B?RmdWVjZkUk1IN1RldDVydk56Zm80L1JibEEyZzVnMHVrbm82WkkrSUlaZktV?=
 =?utf-8?B?Sy9mazFhLzVYNzBVZjdPWnQzeGsrcERFSmViVVFGY0JtNmRRMnZOVVN2aE91?=
 =?utf-8?B?WUdBRXdheXZORk1WekM3MXRHK08zK1ZxRlVJOUFZcDFvbXhIbllzN1E2V1k2?=
 =?utf-8?B?cFhmWUgwcGI1a2NWUzNtNnhJczJVaTZ0NWxiTWZZMzJuNU5TYUh5bG5tUEtW?=
 =?utf-8?B?MmxkT21KQmdOQTBRNTVlV2JlL3RYY1ZzZXpVN3F3cFJtNzNkUmtTNElLNHpE?=
 =?utf-8?B?MHlhWkR6VWVYNTd2TVpRcTUvTWhQSjFpbkFKQnB3WFVSM2IrOXdUMTkrN2VY?=
 =?utf-8?B?eXRHUklBWGpPVTJ2a2FhcDY5Mlltb0N1aVJ4Y2NPc2VVcHhqQkphQlg5R3ZP?=
 =?utf-8?B?NVF5ZDdjQ3kzakRFVzNpRlVmbDZuejZnRXRFQSthb0graHBvbnRsOUxGZUJV?=
 =?utf-8?B?Um5vUnVOblBiVXppYlU5U3FjUktUb3ZGeG9rK0dkR3hUbXlTZTdqUjRqWjVr?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb984db-b2ef-458b-5024-08ddb441ac9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:40:31.9494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yDsDRnFaakQrKQsagBcUoZWkKfbp23+s3XFlTkxF5LIZANX1HLkmdQkmGpgpXUUDQ4hzMj4MGsa0RajmowAjUgSlslQ6Ai2siC0qpxZ7w0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:

> @@ -537,6 +540,10 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>  	d->ci_id = ci->id;
>  	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
>  
> +	/* Update the mbm_mbm_assign state for the CPU if supported */

"mbm_mbm_assign" -> "mbm_assign_mode"?

> +	if (r->mon.mbm_cntr_assignable)
> +		resctrl_arch_mbm_cntr_assign_set_one(r);
> +
>  	arch_mon_domain_online(r, d);
>  
>  	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {

Reinette
