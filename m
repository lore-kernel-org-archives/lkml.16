Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245B2153FB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120624; cv=fail; b=IUgFBqkThCaVTGFkdNjChf90xKyZqxetqTQyl9HSB+ygohu0/+kedm3VM5KJnKEsOYGUbWx/INxjYqLbAl1OxhBbNdjCdxpLUJUYlMHU/8p2wLS123LR+mhtAI2Kd+eJlhzjrhCfWClVB3LxpjdN9reYHHEZEVtOj+h7rXp5Mi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120624; c=relaxed/simple;
	bh=3Ht6S6vh/0aTB1iU5EWlXZRL9ND+jvgw9HIxPl93s2U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GaBx+kgyewjsq8+Zn0tYrbd1EiP8gyC1VBpjPUKW+RBH8YOkvqvz9SMgUOSThI6W1/JdhOkcC96dklsR6RlYGx5IVSomx/V7SZjfLrvnGSHn/zq5KA2O7ET+EXecFy/tmZ0Pm1BjDymZWSTMY/ktSAaFLtIKVRNe+G6eKLikZ4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIUiVBHg; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIUiVBHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120623; x=1777656623;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3Ht6S6vh/0aTB1iU5EWlXZRL9ND+jvgw9HIxPl93s2U=;
  b=WIUiVBHgOYTat8Y95CJQUlIuHQW/UuWqoJYV/t/bmB4eqyEFAsiEHuuO
   8ayBaZqGnR3pj6FSwJrFsl5aXeh0g4UjmUk7AXJaF5wdtWKNvRPjwuF6D
   ztIsyUI9jMyOsRgIAQK6BhtiuAJpJGDp1KUNjl8E7QvnZgGDz6JxvotZp
   UaAFKrLxzmw1yTsaC8anqC5YeJetBlGV9es3U/2ufUhJnvVNQPzhhwbWK
   5Fo1RtAOpM1Ng4rfX7F64ZEEmKtPHNPtLiKSHjKBkofaGH64CdyJQbnHs
   kecvytJ+fuvBhYk+Q2vX6bkuWYrhBOiDaa88VsvBscDmKYXJmK5FyidPN
   A==;
X-CSE-ConnectionGUID: UwmO8+cwQ1+89N10ImzcBw==
X-CSE-MsgGUID: dMFco0wqT3uNHPWDMuHd9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="70302291"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="70302291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:30:22 -0700
X-CSE-ConnectionGUID: 3GRgsMquTkO+zihMIzKG1g==
X-CSE-MsgGUID: IFeIVonXQ2agQeux45ubFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134353931"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:30:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:30:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:30:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6GkI/DN5x685bacwTMPDXkyLZQSOEYwlbz5j/qDkjN+Ge7AaZkXEvVgXKhlktpMYtzoKSmYMFUPji3L2x7PAYLmxF6woEW0iK9hPKF+VOLJClRtiEnvv36/GRyV3z6aW8haRv6UpyqJsH8tvND2n4E++4rR7W6DsxwadFOS0AlfDupefQlXmByBDPVjyeBNYp7hdAHAEn0kssipYOiIiHOG3eTUS+4kuX1nwxRaDtC1ppE9gUxe2L8DFP/jiw7au2OdQK52xgeVDOQJOxNIIi1fJf7j1iMUq3d2m15dwo8YsYntDBkzZqP6WtQoRkIl2f5i92p8U1ue1mJoJF6wGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GIN7SUwLlsqqv1cCyP9YTNtKElvjtHJcCRhIMtZ6Ng=;
 b=mZ3dQhoGhxoEsRGYE+MV6+5AD++heuaJ/QuzdFAGFTf3pIbcp9q/o0YHOwnqnXv2OXSEGCczx41ZoB/Sm+O29lX+vTgjfd9uaM7ZxN632anfYJ425JTdfl1lyWAAhXIE8aiEdVTX/v3NC6ohQIciIXGJi+Y61sP82ojRBt6xnjINOaef7HO3LEz3dn6mbNohBNLiD2GjMWevruCQWHclu0MAm044cojMOzJf2HZE3MFWZZxF+oWhamGjWO9BK5mhIOGQoXwBKUiRsTo6Y/cxIBBqKmc7EeDdeR6NkFQeOf5aYTiddVpNaY9V/8E6WWBryO8zPYn90kXVYHVvjji1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ5PPFE62D2CE76.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:29:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:29:46 +0000
Message-ID: <d590fa55-667a-4da8-a414-12e6f3ab06a2@intel.com>
Date: Thu, 1 May 2025 10:29:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/27] x86/resctrl: Move pseudo lock prototypes to
 include/linux/resctrl.h
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
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-16-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-16-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0287.namprd04.prod.outlook.com
 (2603:10b6:303:89::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ5PPFE62D2CE76:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6b406a-4e7d-4876-686c-08dd88d5c4b2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmR6RisvYVRpV3BLanZGNmlNcFZnTlhuaGRHS2Fwc1NoWkpqaU16NFpQWTBT?=
 =?utf-8?B?bjRvZTJaM2x3Q0NXMWIwL0NDVEk2YXRwaElid0lPaDl4UXpSOGlzTUZxZ2pW?=
 =?utf-8?B?ajdGRTZpcGxMdXdEaFR5Sk5XU3Bya3UvZGJ2VkVlejEvVUthVnpRTDNFNEUy?=
 =?utf-8?B?S2hvK0c4N25uTjVMaVFiek9iOVEycTJ4Z2dNanY2eEg2RElvaGdNWkowVDNJ?=
 =?utf-8?B?eThsOFlXbWNVa2cvbVVWdGNNcEhxOU1kMWpKMkQvZnp5NUtaOW9LTVNlcm5N?=
 =?utf-8?B?WnpCRTZ5WStkK1hhM1U5RjdrL2ZvWW5LQVBxMVROeXV5MDM4Wk5uaE4zdWVn?=
 =?utf-8?B?elhTYkExa1psK3J2aktkSW9DMnAwSEljUGs1SGNLNENlaXVGREpiV0t4SWVL?=
 =?utf-8?B?T3RQdVRzRlp0aSt4dlJsdUo5ck9pdGZ2ZDlkcWxvbzVNUXBRMFJVNCthZjhJ?=
 =?utf-8?B?cmZWQ1EvYVcwRFlLSXMwdUE1aWU4ejdLUWZobXZYZmx4eWdNaCtmeC90TGwz?=
 =?utf-8?B?VlR3Y213ZmRxUjhRcGx1UHNHdFMwdHdKU3dlZ2Iya2JiU3pvNEJpQnhhUDRG?=
 =?utf-8?B?TG03c2YwTHhOaTlCZ2VGMlR4dEpJZlpEYVY5b2NuaGVENXBQckdzVGM0eFlQ?=
 =?utf-8?B?WXhkaDFadFFUVjBMYWdMQzNWVkozaWl2dDhPdVhMRnAvUVRzeHJzdTZodHUw?=
 =?utf-8?B?bDdtVHNGcVpTSnNmMkgxUnJ6bVh6Zm1QelF0MnVRZWRhSUswL0F3RE1TSktL?=
 =?utf-8?B?ZzNPblNqOVRlU0xhNDg5bTMxejF0SCtmQjFZZGFYUG94NXMyd3B3dVBGcmpG?=
 =?utf-8?B?MHlkR2VEUkxOQnRsanFpNGd2cDVZRDl2YW5pVGwrcklxUmYvcFpJRFY1YkZB?=
 =?utf-8?B?Nk9GaU81QklmQjhFOStDeE5hY1NqTUgzR1Nkc1hKaUdNcXkvYjlJMHN5Q3lH?=
 =?utf-8?B?ZVM5QzUwd1IrZjNjaXBCR2phSFQra1R6R0Jzd0RxTmszWFNIK2lNdUF3eW9D?=
 =?utf-8?B?TTJzaklxcmMwWno3WTdqRE1Zc2lRSTJNMjhscWtwUUhFWlAvbXZVYnJNRFlm?=
 =?utf-8?B?VWs0Q0hpM1FrakhjQTdnU04zSzZsaWNBdzNNMENhY09KdytCRHZzOFc1Ylhy?=
 =?utf-8?B?YzF3Szg2SlJPNGh4L2Z6UGNBSUJ6eE1DQlJuNStCQWpQUkE4TDQ3djNvNUJ6?=
 =?utf-8?B?VTNkV0w2Rmh2cVU5SzRocFhHYnJHZHM4UWVPbzM3Yis5V3hyYnZ6RGFlZ3R6?=
 =?utf-8?B?WmZUdkVjL2l6NE01UHpDSExGaUhMTk5vL3pqcm9yeFdZR2JRN0xxNVdrZ3NK?=
 =?utf-8?B?ZXZqOGFISVBWSkovb2htMUVqSlcyMGt2WFhFNnpjN1NnSm1DSllkUklFSCtP?=
 =?utf-8?B?SHgyeVlWTnBPR2d3cUljYUF6a2NlNklwaXUxK3hqS2xpd3dsWmJVNG1TVWpw?=
 =?utf-8?B?OGx4T0NURHJ5MFZPdjdybDdhd2lkV2lzMkRFQjJuWEd3NVJ0aU8yOHRCSnB3?=
 =?utf-8?B?OE9PaHBUbjJNdy92cjRwUXlTb2E3cDRSNitxYWh0ZkVLdGk5NlpSK1hHYjBJ?=
 =?utf-8?B?VklEZmZ0M0swdjc3R290aFh6QnorMVNMVW1xSUE5RUdsVmZWY2xIVmVuRS9M?=
 =?utf-8?B?c3VvR3ZaSHVGN1FGZXh4QjR6VGd1R29JcEhERXppSTFnSHkyZVAxUDBrUFFm?=
 =?utf-8?B?MHI4cE5LZTIvSEoybHdCWW9tN0JnMjZVK054WTFuM05FRjBBZXpZOGJObVV5?=
 =?utf-8?B?NGNTYURCQklYN0RuNEJQZzlKUDk1TjZualphaXA0V25tN1UwZHFTNWtaa3FS?=
 =?utf-8?B?RDFKQ2pZVEJwUUtGWHBpN1IreDI1ZVpWUGhHcnBPVHZkY0Z1NXo0NzB6cmpF?=
 =?utf-8?B?WThUcnFFYWxsbWR0L2g3b3BUck9peHluM2RGZEFjVnB0NE1ZaXhSMWo0RGdO?=
 =?utf-8?Q?vRBUS1FXSt0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHA5UTA2Z256ZGdhM1Nuajk5U0ppREVPcVN2Ty9BYlllNHp6RGI2Q0g3dGR2?=
 =?utf-8?B?VFpYTThxbUl2dlhxK0lHU1U5Q21TZUdidVVHbDZzdGo4bk9UZDN2SWFHam1m?=
 =?utf-8?B?QWVpMXA1WVdKOGhwRVFIR1djWTlubDIyMHJBR1ZPaUFldUFzbmdNMC9ZUVNI?=
 =?utf-8?B?bHJZdlFjRkVHc0lZVkJxblphdUsxWFhSSG13b08rbU9pNkV6T1NybktqMU1Y?=
 =?utf-8?B?UTd6MUJRQUVzeE5qcVVmRE1rZVhmdTFwSnhGUGNGWW5NT04zQ0ptTGJVQ0hz?=
 =?utf-8?B?Smg2bTdlbTcwazBaalkrdHp3RnNsZThLMHpqQnVIQ1pja2ZEdXZqd3VGZGlC?=
 =?utf-8?B?UW5CSmd3Wk1hTVZDK0k3emM3MXpjRTB5bGJyVXc0NjBseVZINXhJOXJYMkZx?=
 =?utf-8?B?NHR6MUdUTjh5L25WZG16OU8rcUVYNGROczBqdVc0dE9SblJUWlFMTEtaU2w4?=
 =?utf-8?B?SjFpTDZWWVVGOGY1RTlSM0sybU9BclQrS0ZqU3ZVRjBVZnJJNnA3SlJuZ3cx?=
 =?utf-8?B?WUErcmFnNTYrdFg0SzdXc01GUFFjaGJiQ295SlN2cFVBdisyRTVvNXQvTGkx?=
 =?utf-8?B?MW1hS1EwV3lrY1BlQXgwaGFrczNYYXZ2NmZ2OHQxVmplUE9XWGJXcnFBeGxk?=
 =?utf-8?B?MTJCZTMyamhLNkF0RzRhRTlIMXl5eFpNZ2VRa2FCUy9pUk1nalgzQVg3N1I5?=
 =?utf-8?B?TWJqbmJuclNVS1NDZXFOOXhMeWxxQnpKeWlUK0JHNWFhbHpFMHVHZi9KZlpn?=
 =?utf-8?B?T3U5SFhFRFZrcnFSS1lDVlZKaTZiT3RnSjZWMWRjYjRlTkZFZTNXRDF1RFNs?=
 =?utf-8?B?UEFHYytDRDJUQWRyRk5taWoxaWY1Q0VaSmZIa2R5anhGODdqNkt3b3A4SXN6?=
 =?utf-8?B?VEdIUThRWEpORDVuYnFmbC9sejNMNEY5TldKYkpUUStwWHFZTkR1bE93WVNx?=
 =?utf-8?B?ai9WeXIxV3QxMk92K29YdisvbnVFNnZ3WnpKb204R2JZVmltU0V4bFNKNW5x?=
 =?utf-8?B?bXJjN3VuNFJKblVpZlZXWmxWTWhtN3BZSWFERm8yY2l5V2ZUVzlOaG5Ob0Ft?=
 =?utf-8?B?VmI5REtPckVYZk55UHZWWHgyRWFrcFZBRUpQNi9pdERLdjhMb2QwalJJazRJ?=
 =?utf-8?B?RWU5ajdIUHN4SE1JRzJHUFAzMHcvZmFYUVpxV0d6cEI4YXBGQzMzLzI4RXJH?=
 =?utf-8?B?cFBDRjdkTzI0L0Y0WWZMU0FCNVFyNVpINzQwSzdDd21IRm1hcUQ0MVVlVStk?=
 =?utf-8?B?K3NySi9XL0FpTWJDTmVOcjlwdHFtZ0hqbzZRMzJ6S1JnSVdLQmJMZFdCaGFj?=
 =?utf-8?B?RWZ3V1JQRkRnNEVkOUM2TFUzSUh3dlNrMDdsQ1oxQWl5ZFB6OUloYWxoN0I2?=
 =?utf-8?B?M1AvU0kyUzQ0TXc2Vjg1c0luZ3B4K0lhUUZSTmxjY2JRMFAzc05VK3N5d21E?=
 =?utf-8?B?MER2a0dsSVNocHBReFdLTVRqdjlzMUttbTVjVnljVG0yN1czTERZS3NLYVU3?=
 =?utf-8?B?ZDUvYk5HamNkdXl5VmJzc21RbUphc1VVSHMvQ1pYeUplZTJlSm9BZy80RzVP?=
 =?utf-8?B?WlRhRzNMcjQ5ZXpiZHc0YzhmOWtIME50b0YyVWd1aUZiNEw3b1ZXUWc5N2k0?=
 =?utf-8?B?ZVBveGkwYmtQZDJkMWdhMUcxdVA2dy9XYUtNdnFvV3E3Nm1Rdzh0MXpTb0Fo?=
 =?utf-8?B?MUo5QTdnNHZzY1ZHb251MllOYnFYQStEbHd2b1RwNkFSSGVWUzRhaVhSYUhu?=
 =?utf-8?B?YXZsbkdXTGtJL2Q0MTBkYzFVcHMrS0ZCSWVyeUwwQ1M5TngrRmhNbVNPeklY?=
 =?utf-8?B?djUzVm13U1RCZFdtb1RlZXdwTWFQdzJEUEdzMktRTHpkbDR4ZE42SHNCV3ds?=
 =?utf-8?B?ejkyY2hOQkVCMHk4NldPeTByYzdQYzBGNWZjSUlDR3g1TER4K1ZTMjdNazFm?=
 =?utf-8?B?ZW9uWFJoUVU0aFhSYmpqdVU5bjQ1RWRXVjRYOUdzZmp5M1ZTaUtrb0NxSC8x?=
 =?utf-8?B?Q2FQbzVrNXE2Y1VnZjVpd3I3dXloMkpIK3RZMkpWNFd6dTFpa2dld05nSnhV?=
 =?utf-8?B?UWQ1NUtoL0tTNEFKZFFqYnF2SHRvV3N3c0FtYmtUZy9mVE1aeFZFY2VseUpF?=
 =?utf-8?B?N0V1dTVzRnZQSVltdFJTK29lbzk1bkRjOUN6OHQ1cnhVK2pJN3ErZldtZ3d4?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6b406a-4e7d-4876-686c-08dd88d5c4b2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:29:46.7678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaOse2WKXmevcL/ggWyHrrin3bXUpbs2OESo3fnATKt0SaiVeUmnu2b7T5pVUt5izgwN+65D+9fxSXQpHOsJfT9gz8XrmPu9uG7NZM6lQno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> The resctrl pseudo-lock feature allows an architecture to allocate data
> into particular cache portions, which are then treated as reserved to
> avoid that data ever being evicted. Setting this up is deeply architecture
> specific as it involves disabling prefetchers etc. It is not possible
> to support this kind of feature on arm64. Risc-V is assumed to be the
> same.
> 
> The prototypes for the architecture code were added to x86's asm/resctrl.h,
> with other architectures able to provide subs for their architecture. This

subs -> stubs?

> forces other architectures to provide identical stubs.
> 
> Move the prototypes and stubs to linux/resctrl.h, and switch between them
> using the existing Kconfig symbol.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
