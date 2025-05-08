Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C721E04AD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728576; cv=fail; b=vEhOM0fJ4ayRjl6HynJwYVS12l1kX9o5/G296r9VUEzcPwUxibesqSfUJYLsHliS9DWNMLcQdl8V3uSbJj+drljwJcwcJOcW43tYyUQOytVthfydPBHFsDO5uOthty9P1qq+GRE478P6dNA6VndUEVir5SEZPojOW3UUKgmivt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728576; c=relaxed/simple;
	bh=HpiQbKrsI+Y+sWoXKlnOOl1lIAAlyGxXiEvUTjxcrrs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eapi5RTV0QlVhJkXdw1RsB6xsRJB/H8YLhuV11F7E2+dwZSbe6iuKjN+4wSrgENsXD9xdO5VTUdUtZuIdUkNZrUD4M+HvVHzSOuKoUYeVYeoVu9oLS9P7YvSAf74Dsmm4iOYHAgTmHQrJdgMwUujfDTQ2mydcWQyn8wc5HFwzO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSwOoey+; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSwOoey+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746728575; x=1778264575;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HpiQbKrsI+Y+sWoXKlnOOl1lIAAlyGxXiEvUTjxcrrs=;
  b=TSwOoey+NbPZEWT649Q67aBHWmevdCab9THaZlQ+cuJwRGgcSkYfNJmx
   VWrSY4jHyO9UCpfvQ5qKiAog0BsCt8M/pdbP5BDz5zOfZX9ZlxfvIC14J
   ejX0C1uEJ/by3AeWImMcujs8fKU41mAGlfNPtHAZZXSFhG5xqjQ286Ela
   O56gbGFbWjM99mjDfzLySFLb1jop9XDH9jGhs/Y86IvvR9pl2FJ2IBNTq
   FOdNIQcI79diWPn5GwLy3uI4vzMKg7lp8EE+slgvu7jJ8mtnMCVkrAkPH
   SPEhqQ9aR5RTGFclcEJ5p1b6Fdz0PIVp1q+efjhESD+Iv/9OWrpXvOFVF
   w==;
X-CSE-ConnectionGUID: h1UdonDwQ32ISJ4C7eZqFg==
X-CSE-MsgGUID: qRJhjTcHTguzrsGlDX/A5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59528529"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59528529"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:22:54 -0700
X-CSE-ConnectionGUID: I5DFG9EZQ2qG6JgZaaekqA==
X-CSE-MsgGUID: 423lvJJpSue9f6q7VJTaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136385506"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:22:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 11:22:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 11:22:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 11:22:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zpk2yZNb8yQ02tpbDwvCZSPGhfwH6nZmNPYLpUtRhyuQV4UaD5lQhuepEEYd7gl8Yd5Unni8/XBfBOu5qTwSjWTW/cTdpBLfVvZsjup5nG6SJUg6tAOJA31P3bhNeWp6itlFl14gyp2+Q3umjvWORLiBu/KjuhWtH5ub9nx5tw7e6hd1jrk8TABF9hrQaukK6y9xynqifGbHYT1TTTuv3Fq6FfXo04aYWEEnSb+2kS01S9ukRB/OxjOksvzL6PFlqVKBF4Jm5BelHT7b3q03VgFLbvQdkZQ8hfEp0s2S4oeunWqIrW9CvUMYXCzRsBLc0xCmC5XibPub7ygtnWpGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3GXPJlRdAp2D60/J5ufHGGccZsVw1mXrOZoqp+3DlA=;
 b=YXT/MKTafq+0BRWWXAzXO17s4tfb3KoTA9zeSKvnzWM8sXiFkG/cPIQhhFHeTr+fxXDdyvh2kT4UVi18eiECHVkALsz8ciqWOk+LDVu/XfWlWIH7Pds0UJ3sIEHND4fvISwV4bk5x8wDf2YxBDaWkjRFW5BfarWe6BCcSLOapM4kXYvdt+sj151ON4RXlQt11kuEqgoD/7kNqVzLv4YWWQmVVDU+jcETdklcEzzp+LV41v4YaNS5LXxGuKSnsX5y36Osrw1HAwP3tfXBwm+JIpHhgRAihIq5dPGZFQ6IQrEm1wcl2bakFM7AXqcd506fJExS2KTRzRf5iiAa/3Z6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 18:22:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 18:22:45 +0000
Message-ID: <8319255e-82e8-47e8-a7f8-cd42df04e32a@intel.com>
Date: Thu, 8 May 2025 11:22:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 25/30] x86,fs/resctrl: Move the resctrl filesystem
 code to live in /fs/resctrl
To: Yury Norov <yury.norov@gmail.com>, James Morse <james.morse@arm.com>
CC: <x86@kernel.org>, <linux-kernel@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-26-james.morse@arm.com> <aBz1iiug5KBnumck@yury>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <aBz1iiug5KBnumck@yury>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe95f08-e16c-4e28-eac0-08dd8e5d5426
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZS93V0syYU5qa0s2cStSbHVuL3VnaGhPZHZmZ0psc0VNNUY1QWRSbDJ1WG04?=
 =?utf-8?B?b2g0YWJyUWgrcm9vUG9aaGU5TEJGSkl3Y0c1UjMwY0ltOEt5TzdRdGVaWnRj?=
 =?utf-8?B?ZUFGK1hOZUx4a3lUVUFHc2NWV1pHSXcyb29hLzFSNTZYb2VYenBBQzJHZUNa?=
 =?utf-8?B?Y05KSHlSTkJ0dHJ5RlJiTEhyS0VQdzMrcjQxUHArV2t2REdwVnlHbDE3bE5a?=
 =?utf-8?B?Q0srejNONXY2ZGY2dWpjbUFiWURKb2sxZEdRMml4M1RuS2h4V1MrQ3dXY1pL?=
 =?utf-8?B?M2tFT21mL1hUWFA3OVBxclpxU2hQOXM2bnNQVFBFajh1Mlk0ZnFEOGxtOGph?=
 =?utf-8?B?WmdjTmhrdmpsSDd5OWlkSnRJMGhELzFHU0hrLzZmdkhWdFZ1bEt6MHlTOWZT?=
 =?utf-8?B?MzlvK3BDQXl6UFI1NHljdkVwMVRZQkhNbWgrVlR2cHkrUFR6emR2VFo2eE5p?=
 =?utf-8?B?RDBBczJORnFQUlNqSHF5Q3BwU1FiYWQ0WDg4L3RkdXpXUXhWYnlHa2p2R0pv?=
 =?utf-8?B?QWdOWk96Wlc3NzlPT2hxWTc2ZGpSc2pZUytoeGVZUlozUDhMcmh2MU03M0xh?=
 =?utf-8?B?NHV2Z3czQkZ1VzN6amZ3RDJLUnozTzN1TVc3OE0vM1lGTURSenErK2o1K1FW?=
 =?utf-8?B?WTRBL0xVTHFlN2dPS1dadElmMTFHeHlxUENtNkliN2k0Vk1NMXQ5S1B6Sk4w?=
 =?utf-8?B?Z2hHUm5zYUN3RW14T2twcGRvbWwvdVlPdGkxOXFQYUlYOXBWbWZOWVp1dzUx?=
 =?utf-8?B?SHRQaXVHUTk0cS9UaW0yT3lXVHBRajd3YjNmWVpRd2dpd0I5TjZSc1h5cWNx?=
 =?utf-8?B?d0IwaUZHcHdHcVFlKzgybndndWZObnczcFBaUzJJMXZrMGliNTdmaHFTejBn?=
 =?utf-8?B?K2Z1ZEN6eHN5eUc3RVBWeXVJOGlYMnFUQW9rWmJzbzhwR3RUQzRCcHM0MnFN?=
 =?utf-8?B?TCswRlBZcFlFNFNuVnVJMi9wQndzQmErY25kMXdoL3RUbklyUFVVcTVXYWxY?=
 =?utf-8?B?WjArNHd3TU8yRzY1MmNrTnk1V0NSdno0bURTUElJT0pYcEFvSTg5R0RzMHN1?=
 =?utf-8?B?WmV5ZHh1a2JrTlFxYmFLSTczM09kSHBpb1dRK0RVejVNanJwRnp4ZW5DVWNa?=
 =?utf-8?B?REZ0a3d2V1VIU3RsSlBWNUNLeXdydE1oYXVvY1dwbW9XOFJKcEQ3WVBINS80?=
 =?utf-8?B?SndlZ2FQVmV4d2lWUXMxZ1E5M1BNbS9lN3AwcFkwM2t2NzEwWTE3WUxJcC85?=
 =?utf-8?B?cHFReVo1Rm05L2dqZUFvTGhzRHBkK0VsVkExSDhHMUpsV2ZMR0Ird0UzZFcz?=
 =?utf-8?B?ZGFtRXQwUmhPdU9jZ2VObEZqWUJKL09adG5kMm1hRjNRNVJzSUtreE9aV0wx?=
 =?utf-8?B?emJCYlJGS0gvVUhrYTM4dmhFaHRRUVlacmlUQmQ1LzQrSTdUdXdyaVd2Wm1E?=
 =?utf-8?B?Y3V6N085cVdBWGx5RnAxNHgwN1lJNlR4MC9ZaWZ4N29IS0dHdkN1a21mSDla?=
 =?utf-8?B?VEpoWEVFTnRaUERNNlk4WjEvbHluTVl2Y1J3TTUzZTdzUHJwZFA0L1I1ZTZv?=
 =?utf-8?B?aElKMW83WER0Zk1DUmxGZ28zSm1ZN2hhYkhqa3RHMEhvNS80R1BJa3hyeGU0?=
 =?utf-8?B?MW83WUpZSDhTK3FET1JwN3RLU0NselBrMzdyNU5qeUpuZENmZzBXcGxhY293?=
 =?utf-8?B?QXMwK2JTUjluVlZUMVNmbG5xcU1yMXg2NG5mQmoyVTFFcE5acElsaENKZENH?=
 =?utf-8?B?T3FPUmxid0xWYXZGTHlDeUhpRjU0RThXY0FhUFRmNm5QK1Z0RTQ0d2dmWUJn?=
 =?utf-8?B?eVdKcnJjaVUzOXdrZGhzKzVLejdld1FEbXZRSnpNcHhkb3k1U2Q2N3NUaHZV?=
 =?utf-8?B?MFppSnBvd0tDNHFpL0YxNC9DaW53VlBNWmdqd0J5eUVXQkw4RGxHbWFKdHBO?=
 =?utf-8?Q?Hd3Rex4eqpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFJTU05KMExVdUpsbExMUFVTSEVqcFpNVU83UWxnakVJcU1QYllPSlNFTVBW?=
 =?utf-8?B?NjBvaVZEWTZLTEliY3o2aDA0cUx1NEhzTFdTSDFORU9zN2hFTm0rZE9NdlBC?=
 =?utf-8?B?R3FoeFpKK1pub0R4Q2RSRnZLWVJpaEFKN0taSm5EVERrT2ZoL3pvbU80TjRG?=
 =?utf-8?B?SUc0VzJsdzB5aXQ3Vm8rR241SGpYTTF1U0szbXllNFhKaU44TnlUamVzSWFF?=
 =?utf-8?B?d29jNlZjcm5JQUFWYlpyZTM3UThteFJnVnNXY29waDdRS0NYcWk4ZjVLdHlL?=
 =?utf-8?B?Y2g1QVlMYzdSdEQ3ZGpiU05XS0hGUCtNRGIvR1EvajVwQUM4LzhwaTlZQ2NF?=
 =?utf-8?B?Q2JNRng5VEhNRENTdmFaUXhSZGxRbi9BSlM5cnlnVDFFcnRUaXJrU09jR2cv?=
 =?utf-8?B?SGdSZFNibDB0dHk4VGNVK01iL1BWZkIyaFR0RklKSStncVVkWTZhYmRGQ2Ns?=
 =?utf-8?B?Z3M5V3ZNaDQvSlpPVTBVNVNOVnE2ciswRnNNT2s1aEJ6Q3JvQmxYSy9LNjJm?=
 =?utf-8?B?b0hqbHNEZndON1Y0Um16aENxb3NxM2hPeFhyQmNuR1pTUkdJQW5RbWZuam96?=
 =?utf-8?B?ak1qK0ZsRWNhNmpwYm9kTFFzUFZpemp3OFNRL3dmeEdweEVpa1FCT3hrdHFX?=
 =?utf-8?B?TDRoM045YlFLbkRPcWZSMlhDblpleXZjUStJZ2ZGekJtMkxhaE1zRmtoSmpZ?=
 =?utf-8?B?YjRhZVMvL0pIOW5jL3Jjdm9GUDQvUzNkaEFNQ0pvQ0xDNzJhUUVabGo1bXBj?=
 =?utf-8?B?a0tFbWFjQThTcGpYR0tkSzJlTzEzYUVhUGUxbXd3YldNalh6M29jdStuWGNl?=
 =?utf-8?B?Ym96emVXeUZHVCtQc09zMnFHOUZoaWoyYU1jWnlaSis2Y05INkh5cEdKNzhm?=
 =?utf-8?B?MnpLQWlqaXIrUFZ5aERGR2xHdE51b0tEdWRKNE4zRTh6bmtXbjg5L0dpeUJm?=
 =?utf-8?B?bUF1MkgxMXF5L0FvTjFsOXdpQnJ0ZmtoOGgyUTBJaTBXZ0gzMjBBVWQrN3BW?=
 =?utf-8?B?cTZSZW1EQk5adkdVL3JFZjZyNlNHelVSd0VaWXRPMXBmK1VpR09wcU9rbVJC?=
 =?utf-8?B?RFF0eWpwSXdBOTQrRFpxWHFLM2R5TlFqMjQraWJUK05SQ3JWdVRlSHd0bEFK?=
 =?utf-8?B?NmtySTVMbENtQTVqQXNlNy9yNTh2N1BicDg3dzJ1dU83ZWl5SS9EWDMwWlBm?=
 =?utf-8?B?VjlUODl6WHVBNWhocHVxc0JoSUMxdG01N3dhOGlOZXl2RGtQVkhzSENLTGN4?=
 =?utf-8?B?aG9ycG9meWRvbytPWXY3bXlaT001QmpzWm93eWpZdkxXTmxCMS9ya1g5Mzhn?=
 =?utf-8?B?RWVXVWh2UDF6YXVuNXpvNGl2MUJtTnNyVXRVR3RSaHVjZFBoaDd6RjVScS82?=
 =?utf-8?B?V0dEOXBQVnNrcDY3NDYwSDVtUDV1c21WVDVFMEFVUTVEMGdBakgya2lEREtE?=
 =?utf-8?B?aEFHdW85MVl6eW5ON0VabEREN211T3BCV0hxRktlOTNZbitQTDRrWnA4MHU0?=
 =?utf-8?B?ZVlBNzh6S2ZkVE9FQmJDOEdFczREOGZPUTVud0grNnJ3RXp4ajBBaWYwM1E0?=
 =?utf-8?B?RDRaLzZ4YWJMS1UwaEN1enhhQjROMkxQVkVzRjR3UXZnTE9tRlU5Z0xha0hQ?=
 =?utf-8?B?RWM0NnBXYmVRMXFYYUVqZGt3VHVWeFhtU1BTMndzS09UeGpWcjdtcm1EaWtr?=
 =?utf-8?B?NlV2SzZQMHJKbjJwUC9jZlYwL2gzZjczcjZod0hSaDV6c01FUGJNV254akxJ?=
 =?utf-8?B?NmlvVHBmZkFpYmxzVnEyVUZSZHJ5UGpyQ2pPTG14enVwb05uNGtUaHBOcXVL?=
 =?utf-8?B?S2w0OTlEczRqenljUElDTXE5dDI1MGU4MHVIQTFkWjFzKzJyblY3S3pFQWVw?=
 =?utf-8?B?VEhUSGFOYkdMT2VOZTlwRUhzVmNPOWdOWjNxNll3SFo4RllCVDJRQlBwTW9U?=
 =?utf-8?B?Z05saG85YkFNSUxlQ0VMMlAvMDFBaDBYdkVkSkxMZG4vVVlzbGticXRyUDYx?=
 =?utf-8?B?ZkhSa3dlSW9Wd1I1c2lJWmRxRzBrOHNHTnhPb0lTdUg3dkhreHlWS0hIL2FS?=
 =?utf-8?B?QzRPRVhJSXFVSmswZThZZXhpYUV6ZUtaWUJVUFE3VTVzRlI4UE9kMWhwU0N1?=
 =?utf-8?B?d3pMOUxibG40NkpYYmxrZmtLUWZEdE9vM2U5anhaa0RLZGxMWXZ5RXcrRUtY?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe95f08-e16c-4e28-eac0-08dd8e5d5426
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 18:22:45.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx4vyKRQwjVkHGmUKxmXE7b0x9UAKYNRehs7XCog6LNYrKUdoZAMQlGTQv7TcSnfJ/jzdNB9qoFzYcRs+UVwZVjLyLsob5kU2KkGxDhclGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-OriginatorOrg: intel.com

Hi Yury,

On 5/8/25 11:18 AM, Yury Norov wrote:
> On Thu, May 08, 2025 at 05:18:53PM +0000, James Morse wrote:
>> Resctrl is a filesystem interface to hardware that provides cache
>> allocation policy and bandwidth control for groups of tasks or CPUs.
>>
>> To support more than one architecture, resctrl needs to live in /fs/.
>>
>> Move the code that is concerned with the filesystem interface to
>> /fs/resctrl.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>> Changes since *:
>>  * This patch is generated by a script.
>> ---
>>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  637 ---
>>  arch/x86/kernel/cpu/resctrl/internal.h        |  366 +-
>>  arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>>  arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>>  .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4311 +---------------
>>  fs/resctrl/ctrlmondata.c                      |  661 +++
>>  fs/resctrl/internal.h                         |  428 ++
>>  fs/resctrl/monitor.c                          |  932 ++++
>>  fs/resctrl/monitor_trace.h                    |   33 +
>>  fs/resctrl/pseudo_lock.c                      | 1115 +++++
>>  fs/resctrl/pseudo_lock_trace.h                |   17 +
>>  fs/resctrl/rdtgroup.c                         | 4346 +++++++++++++++++
>>  14 files changed, 7549 insertions(+), 7299 deletions(-)
> 
> There's no MAINTAINERS record for the new files. Did I miss
> something?

Thanks for taking a look!

These files are created/introduced in earlier patch, "fs/resctrl: Add boiler plate for external resctrl code"
[1] with the MAINTAINERS record updated in that patch.

Reinette

[1] https://lore.kernel.org/lkml/20250508171858.9197-16-james.morse@arm.com/

