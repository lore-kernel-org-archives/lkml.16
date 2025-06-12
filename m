Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70A2C325B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752646; cv=fail; b=IIT7Xx7nPg37QCBmo7B6nQd6PM/oEqW0dlIsQJEMx8kEMcZqTQNmrn6zflhB440Jb77fLdrFoPYOSak2ss+eAZeSsQYzjVMMbW1WI+aJFyNWJf7ZJPN7L2/TEhEZXf1eHpTIpPgSNgfaI2yKOwOjvZTgWQKJn4NoRlXjfsXIVq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752646; c=relaxed/simple;
	bh=sIDLYISTeVS5qEcEuZUSJRuAEjoTqVJRl/oUXFgJVXk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JtrYQSfJuuWABq+MO6EZuu+2YxPlDVRMCN7W+aq+2PvhCpyYV1ho1NrPIjStfpsTiKp9ir960UcVt8QZc7K3UQpKt3U+9XU1eLgR8aQ9wWJBjjfNnniiqncxXMa3lqMK0OEO4qi5ZUzanR4Y2ESSrKVn7q1BgOyboCOJPsuZ/XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chS7GDZZ; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chS7GDZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752645; x=1781288645;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sIDLYISTeVS5qEcEuZUSJRuAEjoTqVJRl/oUXFgJVXk=;
  b=chS7GDZZXX3cnF8JKz90PUcci2Bz6wgt1bVfS0ZihYaG8ojzXRQX0Oif
   vERfahH2R+6D88ehW4sgzkJFtb4G+Me+s4WM+AOQ2ZMEN6x3wrN07kmZ4
   N0cqqXsszrlPPWh5M8Nyfp1lYC1n2W1V9w3wT6TL1scrBSb6GBuRJ9zyh
   3a3FXHj0xtwA9WE7YCxZceHXy4M7ekWmD5e0zXASTBwT8O+QLlYAHu2R8
   zEg2BSt4U14HzU0XLwv3hlhw+U4+3esZjkVnE2NLC6NZq1WiZEuecQYZX
   Q9uPtVz2GXn10fVuLfpq9FgwAE45B19opBBETYKi/u2ACUFfYkRub5KS8
   w==;
X-CSE-ConnectionGUID: hJoC4x+tRAycbzWG5kEG1g==
X-CSE-MsgGUID: JXkDhTbAQVSgYmpaTObffQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69389625"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="69389625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:24:04 -0700
X-CSE-ConnectionGUID: gLiN2RkBREmvVbNtlyPClA==
X-CSE-MsgGUID: 0mzlZjfuS0CHHNoaO7ezwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="178568546"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:24:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:24:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:24:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkdz4pW/SDk5NqaOBBUqNF/5ufbGVnDn6TxLf1hFVmoOzJGstJGO93EdIZLrqmhJz2+HeqRFvX1riDl3fzlAIhyE/5YQi8JdB8yFAoOUNozHe+dZKy4nvjVLVmvyuqpiH0KclTZfyLZaojpwsbMuqeSuyRk2hd3rcvl+XWbZ6QKdi245HQp7nHbV+SJNdEKCYEsSP/NhV06Dk52AzFsEYbYWG7ZhFPVVN22eMGaGDK8aFYR42ou4rs77CgAn9YXY3ev6Te6MhOzTDU/zSMxUiDZ2Ha416jQM6PA+cul8pO5eZGVbW+ipgLdKOQRCV10zTRFHA/3bjWcc4cjcIp/tlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVfs/NpYmNJ24TJ9s90yB+GnJBRqqjx5EFNifbOJ2ro=;
 b=S6DXFgnle7FR293binlzHWeRdjyACmg5hBMgSkiE26ORq4bsheV5xM1zn9DOBudvXn9aWZUHc1+b6lzQCGSCMSWy60XE5dOaMpeEtUkZAdTmS/vf1fDmOQCp/eoFRcHtA9mk+VdKQ0+BfdHpIaxyRqylOCNmC7uGvljjRgKXJAMdN8unoGXVWSPmcWrPoo8QIbzWKmNfNBKJUQwleX+BP17kjz/ZKHWRRC3Usuo2PgjxbNbJEq/XtpgGlOU7LaIbKNNkI+ToLzI6ZRPwnEB6XTd1jNRM5AAKCpvmKRWxD/+bn+Ft61qOQRfAQ6QQJARIP5+XhiVTm4enlDG5BSnxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:23:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 18:23:46 +0000
Message-ID: <fea254dd-c622-4868-b9ec-3a902c5d7fa6@intel.com>
Date: Thu, 12 Jun 2025 11:23:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/resctrl: Optimize code in rdt_get_tree()
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
 <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 723ab1ee-307f-4290-e685-08dda9de454b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDlpRnhqa3pKRGU0UUVNQ2IyS2RETHN3ck1FVE9LNVZkVkswUDlQMzBaZ3Zz?=
 =?utf-8?B?bFNhL1ZyQmdFMFBHTHF4UVdQOXlkcFBFZVdWQVBCUGdLSVduaWtFZDNZdWVH?=
 =?utf-8?B?RGpZUjFaeVBPU2RJNXhuNitJc2QzRUFlbFJwdDRXajlqV05xTDk2T0ZwVkww?=
 =?utf-8?B?RU9GUWxPazFFY1NjS3M4YWhPSnlsaFkyaUZGQlFsc1lSdENSbnlWLzMyVFov?=
 =?utf-8?B?Y2VIRFJmbjd4NE9OamZRZ1VJU0dvVGZJU01QYXpKS0hEVTJmeFhoc3MyeG5T?=
 =?utf-8?B?NzdPVnNuK3VXVEx4eFFVZHpVZm8yV1JUVHF6eWhTSGpJTTNDMy8yYk5aVFJl?=
 =?utf-8?B?bDRSWXUxMGU3V3JiSGhyWW9aYkp1OWlPcVV1N1ZnS1BaaHNGeG5pZlB0VUFY?=
 =?utf-8?B?S0N4V09kalVZTUVlNFc4VkVsR1dBVEVPSzJlUXRlTkpvbWI4dUpBYmYraURQ?=
 =?utf-8?B?dUxoMmkwSnpnYWRYcEhMUFBoNGJqdHYxaHRxWlRBNlZrVk1NZzJ2NTVFMmht?=
 =?utf-8?B?V3lSMkx3cEl1dEswY1JJMk5ib3hiYXZqK0RaTkJKNlJISFZhL2dUMm9Kc3M5?=
 =?utf-8?B?WGJMOUZPSWZ5aHRPZWJYbjBhMTFybVdGOGdGWWF0ZUhaUSthZnVJY2NmVDZ1?=
 =?utf-8?B?RzNYdGh4MDd2WXQ5QUtaN0labGJPamhNaTQ5ZWQyd2JoSkgrSmo4K2grYndh?=
 =?utf-8?B?R01wd3JNVW1GQk9IeEJXY3lUVndCSjlpb212N0l3TkFibFlHRk9hSWlwU2U0?=
 =?utf-8?B?d0t2VlI4aHdlUmtwQ01vZ2Uza0VkbldiRlk0UDRiME96NG0rRkVTMmVpRHNP?=
 =?utf-8?B?TCsvS3ZBQWluOTJybmRuc2dRYkViVFQ1VG9HOFpYL2ZoRDNtZElPcGVzSTc4?=
 =?utf-8?B?SFNjenpEMzF5azQvT1JCVmFnb0xIblJvaG1xbVBQY01ibnZhY0lodTZSVlJ6?=
 =?utf-8?B?NCt1OWt2NzhOVVVkQXgvS0NwcTl3Rnk5aVN2UlE5c29oc0NDWVV1NktzV0gx?=
 =?utf-8?B?Y0QxaUFuSHkyK2tDLzY2WWtld1JRekNVTk12L2RzY0NFYUlsOGZuME1YNVNh?=
 =?utf-8?B?R2xZVWZhcVlaelBSM09Ba2lFS21kb2x1TytLMVZtY2RKMHdFdlV3TW1VUEVz?=
 =?utf-8?B?Y3lFNHNPNVRVdzZMQkdzRmNrbERFTHlwSDdVS21YU3J0YklOMFdzZTcvbWZF?=
 =?utf-8?B?MXp6NlRoUkIvNG1SQkJ3T0lvdWdZd0h4a01hUFQzNlorb2EzaGdDaEVzRlZ2?=
 =?utf-8?B?SVJSY3p1Y1JrOWpXL2VDK3BnWS9GdXVVMU9JUXZ6WkRLbnhJZ204WlhyUi9G?=
 =?utf-8?B?MnlMclRBZUIyemFvK01KUnJIVXIzd3dESjJNb0psWUpBQnhjY0xjK2szVzdR?=
 =?utf-8?B?OVZITzJ1STQrakY5bXZLT0xMN3dTTHJNdFdKL29wZ3R2S3RPZEhvLzMwRnNE?=
 =?utf-8?B?S1QvZ2s1RzJ4MXk1bU1GK0lDUENDY2FqcW5NWHlkWDRheDVqWTVSMWRmNk85?=
 =?utf-8?B?YS95L3VFdnNEUE15UnNxTVlVT2FJZ0lCR0djT3dHSEtHY2xLWXFFT1FySnVo?=
 =?utf-8?B?WEFwTGFNc0w4blNDUTdVK28zLzdyKzFXeWYvVm45MDZ5bXVZV05OVmFzckpz?=
 =?utf-8?B?cE9XK01EMXhqcEIxK3pQUi9NdVN5YmhIOVJ2UzkxeGEwdVJlRnE5RnQxbFBx?=
 =?utf-8?B?TWZTa1lZSkNOVTRaUmRadUNTVjlZTFRuWkplTEh6RDJQTURvU2VVblRSK2c2?=
 =?utf-8?B?MXFobnJFa0xtTWZFUytUZnM1NGliWTVXdXAxVzNmaitvckkrQ0w4MXVDZ0Fy?=
 =?utf-8?B?V0pIVi9nM09UZVFOTjRFWkpsOTRPQUFGS1RJSTVmYXdiSWExanZpaWhQT1V0?=
 =?utf-8?B?SFJZS3BmQW1XV3hqb2F1RTJialFMbnZmNVlOclJzMWZzZXNWZEZQSVBFcUdq?=
 =?utf-8?Q?FGUCWbsNuLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNuMFU3eGE1eDNVeEVXUXJIaDB1TFViTUp4bFhyUGs2SThzd2JWTUpqWm14?=
 =?utf-8?B?VmJ0NHJFSkVrNWJSb2pNdDB6VXJaak9UaFhwbUFYeWk5dzJ2ZkoyNWM1NW9a?=
 =?utf-8?B?dUROcU1FYWhXMG9vZjFLSVg1TVlvZysrRGpCRitiRUwvKzFrSEI2VmN0VzZZ?=
 =?utf-8?B?dFJqV0E5UUhSdlFKazRISllYcXBBZXN5M3hCaUVvbm9mMDZrcjFaL3d0Nmda?=
 =?utf-8?B?Ujd6Q2NFT0V3aW5qR1FXd2Y5eGduN3ByaEVqT0JvRjdJMnFGVVQ5VGoyU1Ft?=
 =?utf-8?B?M2Y0cXM2QlViNHp5bHJzWUlWamRTN09hYkJ2ekluMWVJNjE0bk5wTUdGSUxt?=
 =?utf-8?B?VEcwNXV2eXNIWjBJeExjeW56bmN0RG8wbzBxSnNTeEZENUJacENrd1JFek5V?=
 =?utf-8?B?SEo5ZC83UFNKb0ZVK3prYVFhY3NSZ0E3RWx4Zi9hd0dqQlpyN3N3REM0WG9H?=
 =?utf-8?B?ZVRQZytrc1VYR2phcTkrNENaZUVlNHM2WWhZa0xJYVA3WkxOOWd2dyt3bUFV?=
 =?utf-8?B?dmt4elQ4bm1GYW1Gbm5yTHYzeGYzcloyclhKV2F3RUN4WWJrMXpjN21qZzVE?=
 =?utf-8?B?SlJiblVlL2tLS0ZhVmJKYllpaG9taWFoSlZoV2FTUnRSUWRKZW8zaVhVT2g3?=
 =?utf-8?B?V1hIemRIZmdoNUU0QTI0OGdPcWc0aHVVcllNSWpySzdnSlBENWlBeTFXY1Jt?=
 =?utf-8?B?eWw1RGM1QnhNMUltVEhrQ3pUV2cvbUJTc0l0NFFaaXdxL09JQTZyT3dzQzl3?=
 =?utf-8?B?MU4rTzBJU3lobWJaSWJXaVRlRHYvd3ltc2RKL0RZazhmV1BoSGRtM21HM0x6?=
 =?utf-8?B?SlVwaGZ6L0tzNlRMdW9CVzVqOTFob0NxNWVQbnQ5cEYyZ2ZrSmxYQTRNZXRo?=
 =?utf-8?B?VHdBbEs1S2JxOXN0a1BmYUtGVkhHQnVmVG82NE1qUVJkbzY2Q0FoUjRJMzRK?=
 =?utf-8?B?TWxVTDNscDg3S3hJVnZSUEZPZlpYZ29CZ0FWUUZTOHhCSDduMTdzOWp2OHIx?=
 =?utf-8?B?MHJRNXdhRmZyRVU0SnFxSGU2a3VhV0VTTHBEeU1qR29hd2hYUzAzNW53ai81?=
 =?utf-8?B?bnBISzNsZ3QwOUlHaFlyWlZOcXRxUVdFTTdpenlidnpCNmhOVHpjaDE4K0Rp?=
 =?utf-8?B?VURPbjFnbUN5T1RkVm8vanFnQUtZa1k5a3p5N0l6Y3F3UHpxMVRZUVBIbUJu?=
 =?utf-8?B?aTJhY2s3dERBNHdNUG5mVXo1U3o3eTZDMUVjUDNTNWdBbEs3aURzR1B1M0g2?=
 =?utf-8?B?YVppRkFTTnlGMEx0clJmTTkrVlFKYmlxMk5NV2dnNitRdWxVSWxEbkhlcEx1?=
 =?utf-8?B?cDNlVXl4cDR4UkwvZzIwK1FGN2wzWktuY1lqb2crSitCeEgreklFcVpqREVx?=
 =?utf-8?B?d3NkNUdSVVRiTTFudHB2TFd3UVpwdWU5eTdidzZSb0U3U3dDeXdjMlQ1Wjd5?=
 =?utf-8?B?Yk14d055SjUxL2lQUTJRU2lPM0dYaEJXYThEWFlycnIvN3gxOXh1aVRGbWhB?=
 =?utf-8?B?QnNlcHVpQzRRd3Z0bFpJRlRtVWF6WmZiTGNZa3E4aDV5UUNncWhLQTJuRUt5?=
 =?utf-8?B?UVJPRldrVzJLOThQamNDbzVVODBYYXF6a0N1R2FRckhTZzViQmYyK1NSWGI5?=
 =?utf-8?B?UEgrVjB1cGhJV3pqci8zZ1pKTzdVSUZHNHRZaCtpOVZtc2phak5hZ0VtRG1n?=
 =?utf-8?B?enArQlVUWWRhNURwYk53bVhHTENCRDlMTHp5NktrUUtCaFVXZHRtK2p0ZG9I?=
 =?utf-8?B?bEhMVVBGR0dkQmluMWplTmUyeHE4Tjg3cHJkcFB6V1IyN1JadktSTGt6WWJu?=
 =?utf-8?B?RFU1SWNZR2FrM2ZHZG5BTWN1R2RoQmlVWjB0Ri9FMXhHSDg5aXBoSTdmQms1?=
 =?utf-8?B?ZkY5cGh2dlJWZTNZWW1oL1hJY0VsVUV6UTBUVWZYVmJGVUJaVkVpRDQzMCtD?=
 =?utf-8?B?b0k5VWxFSEVqOW4raEtLU2xXUExVUW10TFFUZXBVWk1zakJCRmZuUXZUVFFr?=
 =?utf-8?B?blc0RHJrcWd4cjFVSkUwN3BWdDIrZkRmNzRsYlRWVU9mZHRMODdUMGV2aVZX?=
 =?utf-8?B?NFFZczRpeXg3UWg2UGl3eGxiL2VMZkJqc01WZWlSUGFYdFJXY3hldk92Q2sx?=
 =?utf-8?B?dW5LUkJNM2czME1LRkN5QW5YUHhDVjFlYUJ6K2hVSXRQMVlRWXFveVB4dmpz?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 723ab1ee-307f-4290-e685-08dda9de454b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:23:46.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWXs8SQenT7Zlz3Vqw7WfG0ETVoD3XMHO/7CQ3dKOv3VDwTJm9I23BUYsPNPANF9cvQ3I6nCvyLqCGKC13yX2YCzaiSlKNOh3fqzu3L64KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 6/10/25 7:15 PM, Shaopeng Tan wrote:
> Inconsistent context format. Optimize it,

What does "Inconsistent context format" mean?

> not only save a line and also make it easier to understand.

The changelog needs to follow rules found in "Changelog"
section of Documentation/process/maintainer-tip.rst.

Here is an example:
	schemata_list_destroy() has to be called if
	schemata_list_create() fails.

	rdt_get_tree() calls schemata_list_destroy() in two different
	ways: directly if schemata_list_create() itself fails and on
	the exit path via the out_schemata_free goto label.                                           
                                                                                
	Remove schemata_list_destroy() call on schemata_list_create()
	failure. Use existing out_schemata_free goto label instead.

> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---
>  fs/resctrl/rdtgroup.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 1beb124e25f6..8bf87211eadb 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2608,10 +2608,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  		goto out_root;
>  
>  	ret = schemata_list_create();
> -	if (ret) {
> -		schemata_list_destroy();
> -		goto out_ctx;
> -	}
> +	if (ret)
> +		goto out_schemata_free;
>  
>  	ret = closid_init();
>  	if (ret)

Please address the issue of now unused "out_ctx" label reported
in [1]. Looks good to me otherwise.

Thank you for the cleanup.

Reinette

[1] https://lore.kernel.org/lkml/202506120440.lz9OAoXE-lkp@intel.com/

