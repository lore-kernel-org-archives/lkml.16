Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0C2AC17;
	Wed, 25 Jun 2025 03:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750820654; cv=fail; b=FlfcwdiIf+KIs3oYY1IyhO3geWG8Rg2sQ2HXCTjN5scs73IO1rQD8H1yqkxIEsbefwdh/n0/rsRRf/lx2vP2lD/pX0pGtNIqBc36GbOay6NRMGoXuEPks0CK4+LyodCibaJO0+BgtjnNXJE5Onbap5JS5jntCEOioOjtMFxdoaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750820654; c=relaxed/simple;
	bh=qSiXUmGbAa0JumMUWD+ZA+hdmTBzpqX+KA3lskDuH68=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JO6jHX8K0gkgocJ/GN33QxBjNNsQRlDBJwCdf4GyxQVP/a5Y+yEqWYol/NGxBnB6WcMWbMBF4oQQ2ofjvqj1RzHqpLUH1dbF5VPlBaYX0PK5Lx4tjwSVCfFB+ILzwVbKZVAxB7vkW7B4EGFOZNaRfLBeWqDfWT6EIl2t8qhZW4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6XJYtHt; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6XJYtHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750820653; x=1782356653;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qSiXUmGbAa0JumMUWD+ZA+hdmTBzpqX+KA3lskDuH68=;
  b=U6XJYtHtxsYX2N4Ia3kfnDi7kbaVZq+KvXg9bTChN6KKluTM524xDW9+
   vw4xYUGHCj3n11B9WMQVIGsBr+6/Cu7fki+jgmzKGP5IRzT5HDv2sJ53S
   xrvfNwjuWK1vwr6jkwyYJCndDVzK+TqjwWi0XU90moTjX+yJXaP7iFzyG
   aa32APBAJQFnLENTy05MFpdjGPaMXZc+LK3RdKrqZypydWLdhFV+P4R3z
   Ujki6PoMrYd5PZpbb1aNsKv6Gdp1B6ajIH2N5WSRCcvhF/uSRL1tj/pqK
   oTKbpDr1/t/qsmbuwzNx9rzCPxYZRfAKlCLdEw7w6ZUpL8QjA3gp/NJSQ
   A==;
X-CSE-ConnectionGUID: AIBBI1miR9iUJYX/lj8sjg==
X-CSE-MsgGUID: t8TjpE7eTDqMxaAZSS2kpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="75615029"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="75615029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:04:12 -0700
X-CSE-ConnectionGUID: NS3DXltmQnqprXGKwnRA5A==
X-CSE-MsgGUID: toRnXtscQPeMg8OErSMCHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152263735"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:04:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:04:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 20:04:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.89) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9fuYplFdn14+Z6on4GPZ6jcEec3h4AzXg9CmJ8IzyzVZu0KsdQirw9fZj5tIKk0ecrfcnRSzSvxNBCl13xoGRrYR/6ZAnuuKCTZRISrsBfsPsLkTU4mDaEaW/x0mU5gLsmo/PI6D4KCwV33T9qAMUWV+0fhe3S51Dm9KeNx884kOrRie017zwMRwyIRE31J/Xvxla1CytVZll4gGGWV99kwlaflfkeC8Fhzq/4xVz4zCOprym6ewIgJOay3rnXYEPjBWPFbgE6KYM3+LAB2A7yx1/Ldqij0qg5+QMzcqdx134xQO7rUouBtN2Nr3Ra2kaihGhXcljds77XCGmX4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cyh0Jy1fn/N9Y3ODK6pc93MSDls4Z1ae9FsQIWifd4=;
 b=suPcLnYvun5DMsjaxD2uZ49xPxILetxl3mbbEW7Nn7EKZ7iIzTzXZjMXZEwBzMEEPo675Y0e4yJTg+DAXhPxcvPEy+CyoeT9ZP4ViRzmMzIGdpnsA/PAASHLd+qQm5R8Bur1tG7xLK4qA4p0m4IcqJWU2YGOWBxb/Sb1hGYKjF3b6QFw1ekoCHKfXIA1txt1j+SP71VbKycA1y67IfMEDLGNs9E1t20g9U83yp2L0p7ngDkWgRhDGU4SEhp6jAYZTqhA++qHBL/O9fPS3wwZACnQjuHCJBqpERP+nsLQTHUAOpsLZQwaxpj3tGqnTpWBPq/UwRpKe2bSE/IfzjLu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 03:03:36 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 03:03:36 +0000
Message-ID: <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
Date: Tue, 24 Jun 2025 20:03:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 17/32] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0036.namprd21.prod.outlook.com
 (2603:10b6:302:1::49) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fb6f8e-6379-4323-373b-08ddb394e0a9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlA4R0ZtQlNhQUNEY2thL0V0ejA0N24wZmFEOUFPMWFSa0dWb2Zrc041Ryti?=
 =?utf-8?B?WmRXZ0J2dEsxTlB2NUdxY0kvK1ZtNG1FMnJNc1ZmcWwvR3JUakV5SjhkTDly?=
 =?utf-8?B?cVhGSG9TSWVSZ28zQURTcUsxYjVyWlFxc2psdjVtSlhaNnZkZFE0R0puZ0Iz?=
 =?utf-8?B?d3NuZEVSQnppUkhTYmNsaDk1RmE0WVFFRThjOWJPVHM3ZkF3OXJmOUJ1OExX?=
 =?utf-8?B?N1pFYm1Fck5aclcvSlphSVY1SVdhZFdSZTViUGtQUGYvaWRRQXFxcU5aZTRC?=
 =?utf-8?B?V1VZMnlzaEt1czQxWXAzcktCMXRMRG1ZRjNObWt1VEcxc1UrelAvWW91WUZC?=
 =?utf-8?B?MDQ3TmRiSVJmVXAxS2lGK3NXRWxESE1idWhWd2lzSXlWQlZ6TDRGVDE0UjZ2?=
 =?utf-8?B?YlhkY3RrRE4xMHBJZ0xSRWNQRU55ditxYTVjYjVFRzF0aGZPc2xQSm5UT0s4?=
 =?utf-8?B?RS9ONGxLaHFnbW5hZWVGeTQvVnVLcktRWmE5MGxWOUt5NVRORlY4ejByRW1Z?=
 =?utf-8?B?c005UTU0dnl2NWgxNmRkTTVaUjY2WkYwQ21rZWRlWENVOFFQK3I4Sk9nS2Ey?=
 =?utf-8?B?OE9MelNPMy9MdmtoZzkrb2p2YlBRRXRZQURkWjVmWHF1SkpnUmI0UERjQWlL?=
 =?utf-8?B?VlRHVmF3bTZrSWFab3FBOEJ4YWgxTjYrWlAraStzM0hJRUxPcjg4dUFnMzda?=
 =?utf-8?B?TG1RdGkwRjZOVTRaTnY3Q1llNnVrUVlDS2hkRzZWU2h0Y1VwU3hwcGROK3FM?=
 =?utf-8?B?T1k0cHMvdTNyYVBhQ2JaR1VsdHl0UnYrOWlqS3RFVUg2dDArNVZmeEJOcWtv?=
 =?utf-8?B?b3ZiZGtwWUN5dHNhMnU5RTF6dGxDWWh3c0VyY083RjBPUW9XQVVEWHlLRks4?=
 =?utf-8?B?NFZ0ZGMwNnNRZy9yRGYvZTdGMGIvdkVlRStRd2MwdXpER3FkbkJSZjFRS1FC?=
 =?utf-8?B?OFBXNnBUL3dpYWM4REtVSUp5Y2lTM1p6V0l2ZVpxd282OU5mcks3RzJNYmMv?=
 =?utf-8?B?S3hsWHpFcUNqUjVQdHlqc0x3WVBKMG9JekRJWUVaUDdlUjBuMVhVQnBLQzF4?=
 =?utf-8?B?bTlZK2Z1emtVVFJnYUR6cm1MVzRYS3ZaUDJ2ZXIvSXR4R3JVNEdyRzFieEwy?=
 =?utf-8?B?YmU2Y1R4NTg5TEk4WGh2Q1pFdk9XOG41anpQYXphSmRXYTRuTlZsc003TTRG?=
 =?utf-8?B?QmJlM3BFMEJ4YVJZNGJWUTFjaXByT0prZzZQTFNRNFdxU2FhSlAyT0VSSmdT?=
 =?utf-8?B?WEFJSjN0VXU2ekRRQmFNY2xNSUp5cUZKb2YrNjZpOGRtODRjVEpCLzJpUjNq?=
 =?utf-8?B?WDFlTG13UUhHVXlBY01CTkdhRUNzbDVGTm1zNkFwWEU5QzNjZDNKeTRRZE40?=
 =?utf-8?B?amdtR2dTZzFkdEV5aitRRnBndHkzdDdsZGExMnV6SU8rV1ZiQlpOSlh6K3Qv?=
 =?utf-8?B?aFh5QUhGcnRGbHduZFJCL25XQ2I2eFRLTG9Ea3NQR1FEQTh5M1ByYXNyVExH?=
 =?utf-8?B?VElIUUlzbEVUS1BGQlRhL25udnBNVFZScEJiWm9tODJHQmpOMTJQK0l0bEdz?=
 =?utf-8?B?N2EzWUFaTEJUNm9uK1cweVVUVVp1NC9rZ0NEQXVhUVRVY2VWenphbk9XMW9r?=
 =?utf-8?B?UXVzNlBPcHJWYytSeFF6ZTU4dEVlcXVNUXhqZ2ZISTRIUUxaUnlOZ1RKSXRz?=
 =?utf-8?B?ajE0TnZ3OXpxWmRtT0I1MDRqU3c0cmN5TzYvSmlaYk1BZnVkcmtUWmxlRjhG?=
 =?utf-8?B?UWtWa2J5QWQyUzZBUUlSaUp1UUZwcHQrTmRnMUhYM3RTZ2dPVHRrRmpTZ2dX?=
 =?utf-8?B?eWpnNlg5VTNuRmxkdnpwTEVmbC9oaVhFYkdDbmdPc2VRQkQwNTQrSFdGK1hP?=
 =?utf-8?B?dzgwdnFWaEhDazNXMmthNEFhR0NDMm1TY3JONmF2NXRHbmplY1FNZUJhYlBP?=
 =?utf-8?Q?XsU2VvixxbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3N2SUQzc1YrNWUxTHl6R0pQY0t6WVJxNUJlR2pqcWZJckVDek80bnpnaW9D?=
 =?utf-8?B?UjA1MWxIZGJzTzhFVEZzTXd4U3ordXMyM055b3FZb2tXUW1LSFRvQ25JNkJv?=
 =?utf-8?B?emMrTzlsTVo1WEZlUVFCR0FzWFoveVQyb1YvNXA4M1pVR1JOKzQwUHJVNHhr?=
 =?utf-8?B?S2loVmhHVnE1L1FBU1gwbXc4OC91anNtWGt2NnJVUnZTc3JTU2QzbW9NTjZm?=
 =?utf-8?B?TTJYTU1XdjVEVGk2eW1IU2xVRUNOM0IrajM1dis4WTQyQ1JXUmdpMk9SaHVs?=
 =?utf-8?B?cTNQcjB0VXpjcFFLOGE5eDBEbC9SOVVIZGxBaExsOVpNTyttOElqVzlKMjV4?=
 =?utf-8?B?ZmlRTWRoUTdmYnNSUVJuT0NreUttVG0zdzVrN2FmbktyWWZYVVNBaDNZMTRK?=
 =?utf-8?B?bE53QkRNUVlia0g1Nk82aUswa0hqN21CTUVwamJGRmU3R2UvcVlrMDc3bXFm?=
 =?utf-8?B?ak9taUhTUXR3OS9hVS9LSmIyN0d6UWh4U09WclJndGd3OFBzb2ZVMDZCdGgy?=
 =?utf-8?B?OUcwUmhoUmVMRmE5Lzg4V2d3K3FOcVY3Mkk1c2xMZFVzZWNaUEtydXVnTTUx?=
 =?utf-8?B?RHFvVW5TVU4zS3dhOER5ZTFzVXNXQlFEMGpNVXg5TmdHQk5LTm1vWi9TdzI3?=
 =?utf-8?B?TERGdW5VVHdkbVpJL2hOMHpzdzBiZTV0ZEIzTTNTbTRrVEQ4NHhCS3ZjZXZL?=
 =?utf-8?B?UUJtVWhuZU1DUjgwMUM5MEJiZEVjMWlXRXRMNGQ3Qy9kVWhGS0VLaURDOGtC?=
 =?utf-8?B?MFN5WFdjczBta2xLRzhGRFBCMTc2MjUwdm1qQlZGRWQvMUVNa1lzWm9Na1JE?=
 =?utf-8?B?VDNGa2M1djRNWXhBWDJDcW9TZzNoMThJVTRYSExveXhWSFRyWUJtSFY5WFM2?=
 =?utf-8?B?YlpEdGgvTVI3aDVqbFF4andGQWpYYkZ5OGdlYnhDTS9IQ24rNldlYW9MVlVV?=
 =?utf-8?B?QXFpZWM5Y3VPNE42OXI0RnVsYU9UV1BZdGhFSjdUSTBsQlNMZlVxQ2lIT21l?=
 =?utf-8?B?TWlMYlAzMm9QY2RrVEJaV2I2a2Zsckd4SGhpbmVoUjkzU2VrblVyUGhVTFFO?=
 =?utf-8?B?RUZQdWpKVUVYNnFtWWxNRUtGMEkxUHhlY3Z3cjBwR0I5VFJZdjMwaWVvRW85?=
 =?utf-8?B?OEc1MzI4TWlIN2w1dnJSUkhKMGNET2tKWmtwa3ZjRVRaT085T3cwUktXNith?=
 =?utf-8?B?c3lNOEg0bmg4cGZmSStpTWFzdWdSQmtqQUdKOXNvaUIvYXA2aDFZTm1CK0pM?=
 =?utf-8?B?cEI2WGZ5VVcyZzBUVFFnZDNCL0xUN2wwdWJhR3loREZOVUt4VFZycFRMTGdx?=
 =?utf-8?B?c3lkTGl5VTRzZTVKQUdZTDRSQnFMZnNGQ25vWmhLYTlSeDNHMVBXTUNSQjFH?=
 =?utf-8?B?QXlwZThDTGFKQW5rR0grWEtXaHpQUHVJTC9Ldi9FV2lYQ0I5bndCNWRDa010?=
 =?utf-8?B?cko4YlBhVGl3RklrVGJnNUF6amVkeE04ZFZIVHZCZWtJdEJqeGMvK0JqK3dj?=
 =?utf-8?B?Ukp3eWFiZm5EUU9MZlFBTmVpNUJ5NFdZYjR1YXJCdTMvUnM5VDZnWGd2a0ZS?=
 =?utf-8?B?V2VTZVRrZi9SYnN0TU11MG8rK3dady9ubFdCY3hOVXowWTRpaHdaVXkzYjlj?=
 =?utf-8?B?RVM3VlFoODkwRnNyUk1rUGJwdjd4djlIZzhiVTVoMm9UamdhSy8zOFY3UTJM?=
 =?utf-8?B?Zk5YR1VWdHpRZU80MFlRSEN6QXN6aFIxckc2RUI5eU42d2ptTWdUeHRuVHg1?=
 =?utf-8?B?bm1HMyswRVJ4NFpIRDRtNXJDVHRCRTZqM1dnU1UzY3paWWwvdCtCV25jdkFP?=
 =?utf-8?B?U0JZZ0tXMmRha2JVRUVVVFgwQ2FQcDdsd2tRTmt2Sndkc2J4QUFaZGpEd2lo?=
 =?utf-8?B?Y29zb1VHUzZxTEpXU2tZK2lnc0YxTndEbkZ6cFVEMzdqbFhWNXRreEZqY3lx?=
 =?utf-8?B?WFErbDcvY1VJR2VXY1RLSlRiTjE1aEJuOGUrekhvSWtvaVFRcWhlVFMvUkVz?=
 =?utf-8?B?MzZsSjFyYnhMMTBXN1o3dndsb0FVV3dpQWhjNm9PTnlhb2c0eER4aWFWUmc4?=
 =?utf-8?B?ZmNIamtaa1VjcXFBQTBSWmU1UW1nV3ZKbVIra25POGxTT2k4RXBmVTlUSVk3?=
 =?utf-8?B?S2dFTEdaeklTMDN2dEtWSEExVHFlekppRzdzUzN4SlA3Yy95alphd0xTMW90?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fb6f8e-6379-4323-373b-08ddb394e0a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 03:03:36.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk5rZJuJ0YW1FF5DVrgopUXuOiUDz3gLOnd2tj4aAXTFbqs8BogcY8gwSSsvcMeHbdpUZxrF1blJUdB1abqBYHM9Uq4SvRSa79RYrPkCK/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
X-OriginatorOrg: intel.com

Hi Babu,

With the new arch API this have "x86,fs/resctrl" prefix.

On 6/13/25 2:05 PM, Babu Moger wrote:
> The ABMC feature allows users to assign a hardware counter ID to an RMID,
> event pair and monitor bandwidth usage as long as it is assigned. The
> hardware continues to track the assigned counter until it is explicitly
> unassigned by the user.
> 
> Implement an architecture-specific handler to assign and unassign the
> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
> specifying the counter ID, bandwidth source (RMID), and event
> configuration.
> 
> The feature details are documented in the APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>     Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>     Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
>  include/linux/resctrl.h               | 19 ++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 0ad9c731c13e..6b0ea4b17c7a 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>  {
>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>  }
> +
> +static void resctrl_abmc_config_one_amd(void *info)
> +{
> +	union l3_qos_abmc_cfg *abmc_cfg = info;
> +
> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
> +}
> +
> +/*
> + * Send an IPI to the domain to assign the counter to RMID, event pair.
> + */
> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			      u32 cntr_id, bool assign)
> +{
> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
> +	struct arch_mbm_state *am;
> +
> +	abmc_cfg.split.cfg_en = 1;
> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
> +	abmc_cfg.split.cntr_id = cntr_id;
> +	abmc_cfg.split.bw_src = rmid;
> +	if (assign)
> +		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
> +
> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);

An optimization to consider is to direct the IPI to a housekeeping CPU.
If one exist, a further optimization could be to queue it on that CPU
instead of IPI. Your call since I am not familiar with the use cases here.
Looks like all paths leading to this is triggered by a user space action
(mount, mkdir, or write to update event config). This would require exposing
the housekeeping CPU code to arch.

> +
> +	/*
> +	 * The hardware counter is reset (because cfg_en == 1) so there is no
> +	 * need to record initial non-zero counts.
> +	 */
> +	if (assign) {
> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
> +		if (am)
> +			memset(am, 0, sizeof(*am));
> +	}

I am not able to recognize how the struct rdt_resource parameter is used. What am I missing?

> +}
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index a58dd40b7246..1539d1faa1a1 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -594,6 +594,25 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>   */
>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>  
> +/**
> + * resctrl_arch_config_cntr() - Configure the counter with its new RMID
> + *				and event details.
> + * @r:			Resource structure.
> + * @d:			The domain in which the counter ID is to be configured.

"The domain in which the counter should be configured." or "The domain in which counter
with ID @cntr_id should be configured."?

> + * @evtid:		Monitoring event type (e.g., QOS_L3_MBM_TOTAL_EVENT_ID
> + *			or QOS_L3_MBM_LOCAL_EVENT_ID).
> + * @rmid:		RMID.
> + * @closid:		CLOSID.
> + * @cntr_id:		Counter ID to configure.
> + * @assign:		True to assign the counter, false to unassign
> + *			the counter.

The changelog and comments only mention counter "assignment" but this same call
is used to update an existing assignment, which on ABMC are done the same.
This may be ok for now but I think it will be helpful to amend the above to say
something like:

 * @assign:		True to assign the counter or update an existing assignment, false to unassign
 *			the counter.

> + *
> + * This can be called from any CPU.
> + */
> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			      u32 cntr_id, bool assign);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
