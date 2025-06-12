Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F192F2BE7C7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752619; cv=fail; b=ufG/eym+6ngLLU5WGKpm/xvWcJi2+UcMVVR+Zs5tJLAF21zKBwTsUcbUtbgh7z8hf1oML35NbAES+sSzgw4oXOBqz7AL0YhNLDQYTwiz0Totox72HAVC8lFQerxbRV1JqVmKlIGENTVX96o9x7qwo6/Y/pWNBsmn4D3EkrK6kEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752619; c=relaxed/simple;
	bh=bKVD/xAfkcSM+V4TqlJbXw8/4lPwjlCfXs71YFRXfUk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mf6ZF5lrx8P7jwBUjnBRV51GT+2FrfLjLwoYzX7Be4hIFjW58OQP+uSGBL2P/bBg+Ha5jyNxADJuXXuZz/X2WaAo7eKnwiXaGR5lZUv7C22dvpC3mItDKwHkZmnMT35Cukc4AOF8y4GV8tFWLD2PjrU3V8PZePTrAIjnNLBv/nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULclhTrH; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULclhTrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752617; x=1781288617;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bKVD/xAfkcSM+V4TqlJbXw8/4lPwjlCfXs71YFRXfUk=;
  b=ULclhTrHu6ulCYL5hybaxtVf0OEmy5mTBZGjN4ey2OXftqKHACiSG71J
   V4LfSMR1yFzNLZH8qcil0AdJcyqcet+j3Gse3F/wOhd1XrWPxt0uQqbBp
   nO8+6sn2pECvGzE0dxghcZpSORJa2SugnKKFf7a+Ko2XrGBMNguHHpqYD
   Nm9woe/5DofALYEV9ay0Ysi9Ah419mYiW3Tpio32SKUmYKKNDd+Vi7fLP
   BAc2VwoUyZ4K7Oh1JhZ02UjDQO/s6FZVOhGLoznYK+swjlWPwA6TDtk7/
   IXy9+Qb1CCRmJa1BlSd6vgnlidKYslgQwLJJZPIQMPBKZZeEVdM1f4CbS
   g==;
X-CSE-ConnectionGUID: E+DKWPC/R+GGzW9QJU3YRA==
X-CSE-MsgGUID: cB5s/5QERxiNFsNP+n7rIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63297420"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="63297420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:23:34 -0700
X-CSE-ConnectionGUID: GJmOA1kyRxSLVp0pmX/t3g==
X-CSE-MsgGUID: viZlPrLsRUGrqFAgZVbm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="147436119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:23:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:23:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:23:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:23:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4pGixVXtnMbQ4DcbnL8LsKjgZ8n6PV9xlD3lVfwPevPIvC6P7fYro6Dx38c8vbHwf1FwTcvP989DAdnECOUEHZijSDnFIB30UctuorBgX9QeJrammJDo7B4hscfOGKOXmF4bw2v9zucA+k/mb+z/MZV1PYkFhvMt6PTVp4GJkqPjMIYE12RC6+IMhGV4X5v86Teo7dqx6Al0KwaR6KJhBS7+I0dQitbNJCPGXp0DiMADofQLZRU6Ssdvo34QkKv+JJgQ0lOb8uSYOwg37ZkA/+WIC2QJu8VnvVYHSVUXmTRe0Kyg2vP8JcaS8Pf+4lr6IIppB4Ng6VZz9Jwl3E27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmYtXXkVaagRhzY3/cFztwsdJF4baa8BSTTXK5jIJt4=;
 b=qLrIa4lWeyjcZVcPomj42mAlif2nRgrJ17MFbw+hjy0y6uWqYAafTcnOoB+QwKSY0l2pR6O1u4u1R6CtYMwULMkn2Ryl+j+2kEh4Te8QZb8/htdNuVdp3CnzICKb1WJTHbq2yzdXydE178YBcTJlXzVCwQr1rE91Y4WMDfNv0Jza90EGGmy9VM0mNqA5vRaN76MXWnDYYRN3YfdayLUV7LTuq7oefPdRhouRvcgOrClnOuhrVn+H9VCgPFNJaJGPJV+KwoqxIKY8a9JeecpAt5KvBnYOnR6FjRK0GRV12mXnoeM7tVKRDZzJUpSS/sKS69dZjVXIdeeOmZ50kYmsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:23:02 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 18:23:01 +0000
Message-ID: <ad43aaae-7a76-4dd3-98f2-167962eba7e1@intel.com>
Date: Thu, 12 Jun 2025 11:23:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl: Remove unnecessary cpumask_nth_andnot()
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: James Morse <james.morse@arm.com>, Yury Norov <yury.norov@gmail.com>,
	"Dave Martin" <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, Babu Moger <Babu.Moger@amd.com>, Borislav Petkov
	<bp@alien8.de>, <shameerali.kolothum.thodi@huawei.com>,
	<bobo.shaobowang@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Xin Hao
	<xhao@linux.alibaba.com>, <baolin.wang@linux.alibaba.com>,
	<lcherian@marvell.com>, <amitsinght@marvell.com>, Ingo Molnar
	<mingo@redhat.com>, David Hildenbrand <david@redhat.com>, H Peter Anvin
	<hpa@zytor.com>, Rex Nie <rex.nie@jaguarmicro.com>, Jamie Iles
	<quic_jiles@quicinc.com>, <dfustini@baylibre.com>, Thomas Gleixner
	<tglx@linutronix.de>
References: <20250611021547.2766889-1-tan.shaopeng@jp.fujitsu.com>
 <20250611021547.2766889-2-tan.shaopeng@jp.fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250611021547.2766889-2-tan.shaopeng@jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: d4817a03-1fd8-4bbc-3e23-08dda9de2a87
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDloZHFNYmZ2MmZMb3c0SGFzNHlvNHBGeFdsWDRCaDBxUWQ3c01nV3dIMjdQ?=
 =?utf-8?B?cm9iekdvMlNyblZZSWo5VFRJUmJQcGFZY2Nlazc3VC8wbkFLYWF1Qk5iR2I5?=
 =?utf-8?B?MmNYNU5RM0RRVnBtNHdPL3JwdllvQ0xtdEQ4ck91K1FEdGY3RWRoWlhEOVBN?=
 =?utf-8?B?V0hZL0MwMlphejFMZlNESS94R2NBUHA1ditqdmozbVhZZVhKYWJVbW9RdXI0?=
 =?utf-8?B?b3lUM2xaczN0YUkzMFYyUTNOL0NWVXVYazIyQnV3dGZEVDVuTWtjTDJoQVJu?=
 =?utf-8?B?RjJ1OEtETktITVN4RDFPazEyVXd1cFFUUTdieGFSNjhWSFZ1ODh2amU2b05z?=
 =?utf-8?B?Z09jYXFpcm1UWnVQUlQrMG9KVmJYM04xNGFHUjBDeVJPdDlsL0l6cU5XZDI2?=
 =?utf-8?B?UE9abGlFa1hEUlowVlRKM2pzN3lPMWhLN01Udm5EazJUdmdBcGF0TThGb0lL?=
 =?utf-8?B?dXJmMzF4SjQyV3VzSlFEUDJpSVJWSkFGZjFqc09YVFhnNmNHajZydHh4U3ZU?=
 =?utf-8?B?Ym1NMEJRRkU0NHkraENLSFRoVlROSFRLUEpoa3J5NUJaUnJrb1J4dlZ1Tlhw?=
 =?utf-8?B?cENEWjllR0dFT3NhL3BKUWhUQ251ZHluNTJ6NTVOcDBiTy9LRlJoajNlR1B3?=
 =?utf-8?B?VHFXZEhyb3pha3VuQjNzK1RYT2UvVVUvTzdXdXFIU2plaUFlNk1sTWUrZWhT?=
 =?utf-8?B?b09LQVg0ZVJCZ3RURXF5UFdaODFLVUFzV1hVUmxTdlBpeDVvVjJPZ3ZnVVVB?=
 =?utf-8?B?NWprT052d0VsZU1RcVRoTnlwcWY4bmpLMTZLd0t6NDFBNzVwSmRGc090UHRN?=
 =?utf-8?B?NlZ3eFFoTDE0WWZMZVluQ05Ta2tZQTRLWWFDR2F5Q3M2SDlqd3oxMnpjOGZX?=
 =?utf-8?B?ZFh6d2FUMTJOZ0tkVkk0ZWV4cEljdDFVQ2lUNDZKOHc1VW1qaFF0TXloR092?=
 =?utf-8?B?cXE4NGszYWFxczhkaWZLSExIM2pmQ1lONTh3TmNGWXkxckFNSDNLbGZZdjd3?=
 =?utf-8?B?ekM3T1JyODIrL1RYZDFZOThDakpybWJMZ0FMTThramt5L1JoWVZpeWtraXJy?=
 =?utf-8?B?MklHTGs2SCtmR1VqaURwaDFOaGczN0xsNXdJU1gvbndzenFsbnVCeXJ0Q1JI?=
 =?utf-8?B?VjdZeHorZ1ZPZWhjaW50WU5aMWJIRTR1aU85d0gzcEc1R2Fzais0SjlrY2lS?=
 =?utf-8?B?K09lZXY2YVE4NG02dTVucGlZZmhqb3RiZ2dEdWtZZ05mV0lWOVpselpBOElT?=
 =?utf-8?B?SnJwei9aUDI0b0cxNUdnWTBvbHdtRUhuZ2c2T2MyVWpRd0hNWW1QSFRjUGpP?=
 =?utf-8?B?OTBBbEFreHNuZzRpeDBCeDlEWDc2M0RLTjdTeUJ2dVdvZkNPZHpkQmxwbjFp?=
 =?utf-8?B?a1I1NkovVHRSeEdyVkRrMndWcU5GV0Fxc3hFZHhMMHF2WEZsajdVQmFNMUty?=
 =?utf-8?B?c0NhZVlaY3IwYkZuQ011cWVPTzIyTDNjTDZENWxCL05Mc2FZRW5Yak1EOXBH?=
 =?utf-8?B?K1hqanRKM3FpS3BHNUVRdmhKTDNQeThVZERGejRVSzByNVNGRGxMZ1RnWnNS?=
 =?utf-8?B?OEpyUFNkQnNDZGdlbkFpUlcwSEZYRTBEbjN6NGhyZkh0Y2lUaDRKcW5yOHlJ?=
 =?utf-8?B?aXVmWi9aVWl4R0IwVXcyVUw2eTNsYTdKMTFvMlEyVGtpQlZsaWhjd2FOYUhF?=
 =?utf-8?B?K0hPeGVoeTYrVE9XQkJSbER1KzFFNHNMRE1meTlmM0s4SkpXZ0U1aFZJZXdY?=
 =?utf-8?B?SGhybmRRdDV6L1I2YmwxR01yTU84S2xGb0U0T2loK2pmeFdvZHppTmxnM25o?=
 =?utf-8?B?bDlaUjRVMWV5a0NMb2ZRMW9aZnVIVlJiT2l6YUNub21rWGhpbGRjQWRQT3BP?=
 =?utf-8?B?a3FhbDNkNm9BUDBEOHhKWnBubkcrS0FmeTYyK25JNXU0QlYwSXQ0VjV1SHdI?=
 =?utf-8?Q?bD3qHxzx5dk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDFxZlBEVmFza3E0VGROblNmS3hVeTdWd3FyNUJQZ3RzNlhPVkE4OStaSU9z?=
 =?utf-8?B?ckVCL3BjcFpvZHp0YS8zbUpJUC9mYjBVUllRV2VoTStTTTB6ZEVnZXFSM3ZN?=
 =?utf-8?B?MDVkZDlpT2RtRTV4Y29IcEF2R1dvdTVOQXRlNElGWVhJdklNTUt0Yzk1R3cw?=
 =?utf-8?B?RksxWHQ2MHB3U3JoVXNrbFNtYlRlYitsQnFDUUpzdzRqaGNJY3pLbndseGM5?=
 =?utf-8?B?NDM5TkE2OVBINEVQc3U0WFlSbC9BUzgzK3VIanljREZ5WXFWUnVpaU1DMmVo?=
 =?utf-8?B?Q21OWWphUW5Md0dlcG1YT05kR3JzazR5MXBhMndBRzJoTk5NUUtUM29NVTMw?=
 =?utf-8?B?U3JXQjd2aEdXblBxK0RDNGhoOWVtaHllMThlVmhvRkR4bkU1aXRXNUlrWDRS?=
 =?utf-8?B?WjQvRFZrdjNZRXdhT2hEbkxzODBYa29Eb3o1UWswRUt5K0lCaElxVHl4WUlv?=
 =?utf-8?B?VEhHN2FXc3BiYm1PK0R4VkVCN1RzS0lDR3g3Tkgycy9CMWRXYkw1N01TZURy?=
 =?utf-8?B?MWg2enNpb1N0bVNuRHRUQS9xM2tsVXp3cEdTZ1g2cHJwVmg1SGVWVXg1cUps?=
 =?utf-8?B?TEExUWF6SmloaE1oQUYxdy9sQ0t0MDRIcG93S0xtTlUxdFhMaVdxSmlKd01Y?=
 =?utf-8?B?VllzT0ZVblg1YUxrZnhXVzg4azgwekxycE1UeWJINndnYXlOR1JhVzkxUXhn?=
 =?utf-8?B?ZXlDS2VqZlVJeXFoYVdkQXQ3UFBxRjdHOWRUTlhXRTdaQjBpNXdET3lhT0Nw?=
 =?utf-8?B?UHQ3ZkxIMkUvMHlobTFOYklRSGRiVDZRNUxUYmlTaEsvbndHakRSUEsxOWRZ?=
 =?utf-8?B?cElQQUhWTUpva3dDZ1ZOdVg0OTRZeEhJWXZlNy9zMkx0TjdRak1EU084Q0lH?=
 =?utf-8?B?R3ZQSlhISWxFcXZQOEFIVThvMlF2K2RkVXE0UWNVZXNSekJBWFpLTE9CYm5M?=
 =?utf-8?B?dWpNSUVxU21BVDlWMFZDbHp0STQvSTFWelNjUklidWQxYTVrdGpPTzFTMzdR?=
 =?utf-8?B?NEhIZWV6YnM3WEdMMGY5SUFtNVM3dzRGNmUrS25yYmJjbkhYQjl3MjNSYkhj?=
 =?utf-8?B?bmpNSVk4dkRkdi9wdE5LQ1FEUXlPQys5VHc5dVZpNEVURUtvbG1zcUFtRFo1?=
 =?utf-8?B?M2xnZEl2OTVsSUF3Z0lNWHppUDV4WUZ5UEFnaGRUeTJET2dERWUzdHRhMFd0?=
 =?utf-8?B?dC9xNkxHSVBiS2svRHhzbE9paUlMWGpjVTV1QkRNQlpSbkZCcTFsOEhZeEhj?=
 =?utf-8?B?Ykl5YUNvUEJkY3dMV1U0TER2NVhMWCtpQkVmTjZaangvT2I3blNPWjVvdk0r?=
 =?utf-8?B?Z2hGZkRsWHV2dFEvV2ZINXkzNWFzZ2tzZ0Zud01zY2ptV2VwSkVyYiswdGg3?=
 =?utf-8?B?NHRQK2xYMVd1MmlQTFRHUm9VMGE0dlovUkViMURBc3Y2c2tZbE9ldzAreHQz?=
 =?utf-8?B?VXVTU3VFRno4aHFyZVZyT1VoK05TOVNqZEFNWm9CTDE3dWZpd2J2bklNeUYx?=
 =?utf-8?B?T2lDd1A1dEpwQU9HUWpCczQ3Q0I2UXJjUkZTZUFrb3h3ejhIeUFweGVmWjhw?=
 =?utf-8?B?ZENac3JnUFIxTWtwTmI3OWJaMFZWZmVVWkR4V0pFZ0E5R2NTMTIyUkFuaFNX?=
 =?utf-8?B?YVBFR280SkY2cWdHVkoySUIxbndIeVlpVUZmNWpNRm5yd1dNMjJMWkNMd1JD?=
 =?utf-8?B?cWFPSXdWT09kZzBrUXREYkVhZVFOMTU2NS9Ld1o3K2MrT3llbFVjak1lRVAz?=
 =?utf-8?B?LzhvTlZmQ0liNTVtZEtRM3FZSDU2b3dNZE5zUXhZN0NzOVp5MzBsQ3dOdHRL?=
 =?utf-8?B?a01CUVZXQnllV0VVUmpqYTRidWNRelArb3B2SkswbTUzck5KQjZUMlZtWE90?=
 =?utf-8?B?SURDbC9Vczl3TDNTeDdJSThUanZpRTdtd0NYVDlXREZLTEMwNG5nSVE0SlIz?=
 =?utf-8?B?ejJ0c3F6Wk1MUnlpTlFuK2hTajZvcjgrdDlQM3VISmg0VjZMam9xVWxzeVk3?=
 =?utf-8?B?YVIydE9aV0Y1RmFTRGhtaDExWm9pV3F5by9LSFBDbld3bjlVU1QrclBHTTEr?=
 =?utf-8?B?K2FsaFJpZVhlOWF6UEJDTWZIZnIwNkZmL2NZaXVkN1lwMkt2cTJPMDVNSmph?=
 =?utf-8?B?OUllMm91Z1hNVDZ4LytSaVhlR1lrNWlTUk9pNVZkS1c5dzRQaENpL3F3WVA5?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4817a03-1fd8-4bbc-3e23-08dda9de2a87
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:23:01.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vI0iivNl9l0WEj89qgPFqeOq2o/BESGtqr5KT0WVdOUiADudYfQnuH2oRPE1yrPOkzdJ+DEI+EBNbIPynBlcpcATXNZaSIdsObjBLxKkeJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
X-OriginatorOrg: intel.com

Hi Shaopeng,

The subject contains "x86/resctrl" but the change is actually to
the kernel's bitmap API. Please split this patch from this series and
submit it by itself so that it can be routed correctly (separate from the
resctrl change).
You can use "git log include/linux/cpumask.h" to see how other
patches to the area are formatted. To start it looks like
the subject should have "cpumask:" prefix.

When submitting it upstream it should be routed to:
$ ./scripts/get_maintainer.pl include/linux/cpumask.h 
Yury Norov <yury.norov@gmail.com> (maintainer:BITMAP API)
Rasmus Villemoes <linux@rasmusvillemoes.dk> (reviewer:BITMAP API)
linux-kernel@vger.kernel.org (open list)

On 6/10/25 7:15 PM, Shaopeng Tan wrote:
> In commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()"),
> cpumask_any_andnot_but() replaced cpumask_nth_andnot(),

nit: saying "cpumask_any_andnot_but() replaced cpumask_nth_andnot()" sounds
as though cpumask_any_andnot_but() is a different implementation to accomplish
what cpumask_nth_andnot() does.  I do not believe this is the case, for example,
cpumask_any_andnot_but() receives as parameter a CPU to ignore that is not
supported by cpumask_nth_andnot().

I think the main point is that the identified commit switched the only
user of cpumask_nth_andnot() to other cpumask functions, leaving
cpumask_nth_andnot() unused.

> but left the function cpumask_nth_andnot() unused, delete it.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---
>  include/linux/cpumask.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 7ae80a7ca81e..498790f74fa8 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -546,22 +546,6 @@ unsigned int cpumask_nth_and(unsigned int cpu, const struct cpumask *srcp1,
>  				small_cpumask_bits, cpumask_check(cpu));
>  }
>  
> -/**
> - * cpumask_nth_andnot - get the Nth cpu set in 1st cpumask, and clear in 2nd.
> - * @srcp1: the cpumask pointer
> - * @srcp2: the cpumask pointer
> - * @cpu: the Nth cpu to find, starting from 0
> - *
> - * Return: >= nr_cpu_ids if such cpu doesn't exist.
> - */
> -static __always_inline
> -unsigned int cpumask_nth_andnot(unsigned int cpu, const struct cpumask *srcp1,
> -							const struct cpumask *srcp2)
> -{
> -	return find_nth_andnot_bit(cpumask_bits(srcp1), cpumask_bits(srcp2),
> -				small_cpumask_bits, cpumask_check(cpu));
> -}
> -
>  /**
>   * cpumask_nth_and_andnot - get the Nth cpu set in 1st and 2nd cpumask, and clear in 3rd.
>   * @srcp1: the cpumask pointer

Patch looks good to me. Thank you.

Reinette

