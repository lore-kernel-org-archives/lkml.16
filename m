Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B7296712
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253988; cv=fail; b=GkkB54VjS5sOt+dQO32jaWQo+txc3NnW+F2Q3lEa//6S9c8EbJ6+9SeepO+EwzLH7KWdbfaLhDHZeKM26srQRQOf5y3nObbMwooZwiHwpjD8VItfgfrpTX3iyRS1C8DXJqBjHClezky1iea4IEXNbA2DTrR94uV84sRLz3PVeaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253988; c=relaxed/simple;
	bh=KnI3jM+g+en3UKv9f9ABHnrcI507X89df5CNP1uAYaI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Iv+EOhLvmW3wA7bnoRKINz6dqKawWGmGZFj9uj4t0FCIrJqaJlmQG6JmBU8EnZYsh/RZgbNn1/I6HrV8UgIWkcqRaNN8zFC5ocjQpe9YsHHf51FljtXSlsFM0H69mrfj5PsflMkSNogfaVOzy1ujhM9/mhienpQd2LxYRjUEJDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLr+gKsc; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLr+gKsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747253986; x=1778789986;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KnI3jM+g+en3UKv9f9ABHnrcI507X89df5CNP1uAYaI=;
  b=gLr+gKsc6F79ShlbazTK/DcrsFwcqzBkOSRvBJ3Ic1wZLjSAU1qHaj9e
   TO3cKQMQVLm+23Wc98sKtW773Krtfh5irjh8yyHoDPXyofuhMrderXL8P
   78qgDwFrSu2+r3lW/XtEBla1r0IbxjtdioqiNY7FPxgLfYrbhVxPIjl15
   s+tGuTlerJJ7pXM6XUVCNwDZHQdmjUj+dUXry6rcKRSZnUHJN0e9Buux7
   hIxMEHqjmxImbHn6QFo2iPQpg7CsC6xBzacHHhYUp1ADVzWTIcJL/MOwU
   nvakQgCYA9k3chQZ6b+A0v4/FKEugF7k1OlkKPKtIQle/P+E1P3/3WMjP
   g==;
X-CSE-ConnectionGUID: XixdyTWDT6mtfMxXw9mKmw==
X-CSE-MsgGUID: POpRa/XuRmSQJLFi6WI72Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71678023"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="71678023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 13:19:45 -0700
X-CSE-ConnectionGUID: RC+AB+WIQGSjMY+xI1uDuQ==
X-CSE-MsgGUID: pXvwyy1JQWO192VH5AEoDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="143254058"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 13:19:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 13:19:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 13:19:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 13:19:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4gDzBpp3vgyI4D18uCybWziVr0JV2GfZwsPwEByd6P0yaeko9U9SmTg0XH6YNJ/x20k0cyaAlLL84z7inP6pEWDyUuMaf+0u0vvyXTSEgksm7M7OQ0qkKEKkd3VnZJMB7cyeLT3QN6y3aZlLVPNKrS9WNMq7kshJAYvrJBJI72AFOBpFnIwEQHyNzP+MbZTY8FpyaNWVj9x0gBpO0be+fm2c0A3xOINCqGbbECivVxqOH9vagz57P5ZcLkuZwBXZGzN92KWvxfPlLrqyIdoPqbQb7TUJR+vTTxRRl8AbEpioR4KK3/obduFNrKXPy8dX+Qbfa5qoPmZlZfgZy5mlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VApe87+MInqjzkqmKC5uJdfjWYHEDKxgBNlIMNgo6E4=;
 b=CTB4e5MYgasIdOz37BuZEx+iif+HtDg2MnzYlrvkCKI42MtxdXBdGezTVNz5eW9AsRKKXxcrwjOVCTx2fzw7HhEkzYsG5Pig/6ZsUgeMbEs59K3WF+VlvWrCTushJe+4/QquoinWk3vYqhTvNLXxATJL//93y2LIhoOfCJ+JZ8LWFpQTA5znucwRMMZILpUsfMkjBZQz4qjJKWrXHNaM75U/EHCO5CqTJyMLzGd8Xo6BzLSWZQrcGJreV9IGSgKWq0VQ6UO3K/Djumb9+3yHZtGP654Jwn9GXMxpjIsfD6sfnxaq9MVze9oNFpn5/d/cPR+ey7X6tCUslZvYWoNPDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 14 May 2025 20:19:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 20:19:40 +0000
Message-ID: <ce10214c-84ac-438a-ac0b-d876e322b2f6@intel.com>
Date: Wed, 14 May 2025 13:19:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/30] find: add find_first_andnot_bit()
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
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
 Donthineni <sdonthineni@nvidia.com>, "Yury Norov [NVIDIA]"
	<yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-3-james.morse@arm.com>
 <4f8b88aa-524c-4416-9eaa-74ea68ff1ed6@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <4f8b88aa-524c-4416-9eaa-74ea68ff1ed6@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1f576b-8923-4ea6-0666-08dd9324a7f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVlhRWRQWUJVM0pQV2NnckhsSEw5MGNrQi91aWZVNjZpeldLRXNPUmQ4dEZJ?=
 =?utf-8?B?QjNsSEtJVEk4bUlwcmlJb1J5V05NY2QxRkNONWNDeEpWTFJpb3paOVdRVXdX?=
 =?utf-8?B?RnZVeC91MnVjajB6NkN6dGFia1FJbGVhekJoZTc4QWJzNVFpdzZpRGJIZzNE?=
 =?utf-8?B?UkZDTFNRbWkzZVBla0ZJWFpqYmxVZlQ5dmNPanRoS00rZW8zS3c1ejhnc3o2?=
 =?utf-8?B?djF6R0w3NGVQTG4vL3VFaHQrYmZEWDVVa1JRYzlsOWJOWVZpWFRhaWg2RzY2?=
 =?utf-8?B?aW1Bc3pxZ0ZpTEpiZU9tSENibmlFVzE1cjJVMEJ6Z1JpK3lIR1NtMnRRTFU3?=
 =?utf-8?B?VnFNcmo5dXBYYWI2V3ZiN0tnL1BKMDE0OFRYMzlkTWFwTkZDZEZHNFhZLzdo?=
 =?utf-8?B?R2U5aGtqRWFPeGFzZkpzbVhkaWNZeXR3bEp3TmhFUnRoWnMrMmVmUHlGeFJC?=
 =?utf-8?B?TVdZdk5MaVFiekZMM2kvWXVXY1NWOEJiWUR0clBjNFRCUWk3ekZnQTQwenBI?=
 =?utf-8?B?VkVORytpcTVaM1JEUGJNa2JvcnVSb2loeDRUVmxJcDZDenBFUDZNMGYrNXF5?=
 =?utf-8?B?bEwxR0JEUWpZWmdGOXJKck05aDlkUzk4aDVOOFk5aFl6bHlabG5FY0lHOXEy?=
 =?utf-8?B?by9JUmt1SlhhbytCczlIdUcxZU82QXBCQk00S1NKS0FVUDY0YTlVSWNoWlRQ?=
 =?utf-8?B?NW1tY3BCWnBScXJSYWtGcG1IOVRRTmV5ZGpqRFYxeTF6bnBRMUs2NVJXamgw?=
 =?utf-8?B?NDlIK0FWRWZPZVpPSGFNZS90YmpZNENBeTBvNDNCbTNhWVNHTnpueXBBOC9q?=
 =?utf-8?B?b2VJZUpUeHJvdDRncnoyeWY0ZWEzd3FNTjUyNnFtQ2doRnVHdXJSTzd6NGFQ?=
 =?utf-8?B?L2xQRXY0RGNPdVdNb2pZSjYramdrSGEvSjE1WGp0bTRLNEp0UU4yV1NHUzFH?=
 =?utf-8?B?aDhYZ1hnb0FRWWJ1YlIwNnFMZkRsTnpMK0k1bk1RTEp4cWRLQkNRRWJoRm0x?=
 =?utf-8?B?QTNPdEh3a2hyNmpqL0NOenZhSXZvcno0cy82M0FSNFlNQ29zTlh2MEVnZ1VE?=
 =?utf-8?B?cUo4TEZoZDFGVldwRWVZRGFadmI1ZHlwRVBCR3lGWUx2SEdpNXRLZkVvVE5P?=
 =?utf-8?B?VVErVlFxQnB1RU1hU0dqbHk3VkJqVU9VNkg5aXZiNTFFZW5xOGJTN2RaUWtu?=
 =?utf-8?B?SmlmcFFlRkhEeXhLUSs4a1ZBdzkyajZ6YnRsQjVxZWFCTXYvKzRCcTVxbmxz?=
 =?utf-8?B?YW4zOFNpMUVQeWFaTE1HUTg0Tm8vN0FZeXVNcDhza2hjY0Q1NjN2Y3lDWU1a?=
 =?utf-8?B?YWVQQkRjNFdlR1lwTDNqbE1EVHFnenNXQU1QR0h3QlIvNVNSblN5UTlMajNs?=
 =?utf-8?B?RzN6TjlLRHlRdk0xdUpUMlFJYUwyNmFhY1ZheWRlRlpKQlhNNFhSUm5FakJT?=
 =?utf-8?B?RG1GdmtxdEpRK0ZOc2kvaGlqbHZLZVJoUWxVNjd2ajl6U3c5b2VRclZ3M28r?=
 =?utf-8?B?aVJ6TnU0eTlWNkt4R3FhTlpxOVFqU0Z4Y2JYdFp2eGxoUmhpOXNDamxnSGR3?=
 =?utf-8?B?aElYMllYTWpMK3JzVjFMc2hzakFwQlkrOWF6a0dYSE9qNHhDaUxvYXNlckJl?=
 =?utf-8?B?dDZnUHordytlT3hoOTgxU2k3NkJXdXZ2NDVLY1pXQ1RiVThnSGhmZG1pRlJC?=
 =?utf-8?B?eG1xUEZUMXdkTEQyZEQ5MXordlRiRmIveXF0d0dvOGdrZlJIRU81S1J0M1M4?=
 =?utf-8?B?VGdING4zM3czQy8rMXNQQlBMZFR1cDdva3BCY2NFeFZBK1hJRUM1emMwdlpa?=
 =?utf-8?B?Z3piRFhVODNpM1pLS1ZuWjlNVld4MFR6NHJjWVdHb0Jjcm5odVZQRVZwOGkr?=
 =?utf-8?Q?yqFCkbVltMUUj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni9nZlhwQzkzODZLZW5hVlB3Mjk4SGsvTHJ3ekl0TWFXOEorWHRWR1puVWZl?=
 =?utf-8?B?NmFmYVh1UytSODdMOFM3WmgzYXVQYi9NazB5Z1E0cFo0aXE3eFlsQyswdUZa?=
 =?utf-8?B?QklBN2s1eUZvL2IxdzZqcEJlU0wvNUhiUm1xVG0weTE0TkFxRms3K21HV01s?=
 =?utf-8?B?dk9id1I5WTBjNWQrd09QQmJUdDAwbkZ0SUY4VldSK2wvdmRTMGhCbXIvWktC?=
 =?utf-8?B?d3VuSzh1bFQ3cUNwUlRyS2lwTUgvdjEwUXBJbXpOWVZqcW1sa2d1SWQ4cFAy?=
 =?utf-8?B?MmhIMU9CeXAzSXNzNXdnc0RuTURXZDB4cFlhYWpQbjNlWUVuQU5PRE1BbTdU?=
 =?utf-8?B?eThUaG4xU2FtY1FxS1hxOHozNjRITGFLeEhoOGcxT3FOV3Y2ODNuaWJGMkg5?=
 =?utf-8?B?UFl1OE03NzI4TW1YWWE1TnhDR2N0RXVaanpibVloMWhSR3hzSFBEdFptMnJT?=
 =?utf-8?B?TUtWaVd5TngwNFF0blROMjduQnhqbHk0dnVIc0hzT0NlTjUzZ1RTbjA4bHVm?=
 =?utf-8?B?dkFzdFhCRXhiUEw2bmU1R1kwWWV4K215RWtrS2E3bUl1NXN1cmtoL2FOWW14?=
 =?utf-8?B?TnlhdEZoQkM2QWllVW1mSXk2MmkwY0NtL21sRTl4Y0IxQTlvaldBWmFIZHpt?=
 =?utf-8?B?WXJPSzJSL0hSeDRBelQzZGZwRjVGclZxOEkyaWtWREFUNjV3c0ZRMnUxKzRK?=
 =?utf-8?B?SW02RGxtSEZnMTFYMXZFZ3RsZDR3ZjZMR3NvK2JJTFNmVGNQcUZFN2tsUXJu?=
 =?utf-8?B?YXNQQWpzS2UvMDVnZ2FPcm5rK1RJTDJaNGJhamErYmIrNEw1bHlUcmZWWGk3?=
 =?utf-8?B?RDFid0ZTWERnN2hlc1crNG5aa1krM2xMcjMzMjVrUkZmbG9ZUkNyREZoY2to?=
 =?utf-8?B?ZlViK2NpSmdtWWcrQXdWREdVd2ZmVGtYamhtMGpIaTh5cHRTcVBzNWZOMkt3?=
 =?utf-8?B?bjNMMlkxeWlDNk5SeEVqeDJUeEphTjJ5bnltb2I5TjBnQm53RTEwOVFCOUJ6?=
 =?utf-8?B?TjZ3Tit6WXlQeDF5R2hNeU5vMHN5UG5ndDhSL044djFSN3pQQ2tWMTNzNFI2?=
 =?utf-8?B?enpacHAvMWlPYkdJYTdkWm9qOTNTZXZ3TmhJMUY2RmRxZ0RPNTJxbFB4byts?=
 =?utf-8?B?MDQ1cmkrMGN5UytKVlo1cUk1S05NY3lOTjlCa3dGN2lGVjlVeTN4NXdXV2JZ?=
 =?utf-8?B?Y3A3Sko3ZTAvMXpqemtBQVR1QUJ0MDhKSTkrT3Q2RDAvdUcvcnROK3NpVkZa?=
 =?utf-8?B?M3BpaTR6eFlSalUrUVF5QkxCK0NVUXNmaFZrUU05QUNjMGVVVVE1UkU4S1VY?=
 =?utf-8?B?c1k2TFZXcDBLYnpNOEFXSnJHemlaYVp6bVd0aDZWLzFKaTFYNUp5MUlqeGxZ?=
 =?utf-8?B?S2c2bC9Ib3A3ZUYyMGdTMEEwT1JGN09lbzZyQko5YzNmcTU5OEV6V1dlN2dE?=
 =?utf-8?B?SUUvKzA5S1JqQnVLbHFHa2VzbWkycFVVQjN0Y084ckRwMzhoZmUzcytoNU1n?=
 =?utf-8?B?WnNaQ2ZmNHpFL0JWSVY0YldkbTlvL2FFalFkRDdrdzJCbUxWUjVNU1BsTCs3?=
 =?utf-8?B?OUJqcng1YVhDTU8wUm1CMUlYRWQyNk12MDBXNSs5MVpDak9TbXNZR2ZmclI2?=
 =?utf-8?B?ckNmdmp3TWtjZFJWQjZhWXB3Zm1lVVYybkN0WkVPYlVtTkZaZGp6d092VmVD?=
 =?utf-8?B?RzdiRzhaTXFYQnNVRXA1ajNDRkNwTXpZYmlaVFRUMGpmU21oTmkwRzZSVWRQ?=
 =?utf-8?B?Vng3bzNBNVJibVc5OExaNGRRWVdyajJIRmN5STdzNDRjRE9heEt5emdLWkZx?=
 =?utf-8?B?V3RQUUlWdTFtdjJEU2hUVUdpYzBGZ1FWOW15V3VVVGd5dFU5OWJVUVVkVTZq?=
 =?utf-8?B?YktZMzhVeGVGRFRIUVhNM2NBSVZBM0NqMUhyNzRsT1B0RVF1TmlSdmRXem5M?=
 =?utf-8?B?cVJCTU83V1R2aXN1Qmsyckw0NmY4bDRvTEZIMVV4Q282b3RmRVlNQ2J0SmhZ?=
 =?utf-8?B?UHpLUnNYWEhTTWJMT2tDT2RGUmhkUE12d0RHUWwwMGxtS3JraTdEYjFEa2tl?=
 =?utf-8?B?WTZvTitlZllnN2kzdjJMK294YVBnMlRIa0VoQ29XOEJvTU5XUVplK1QzV2xT?=
 =?utf-8?B?T3R0UjEzOVFsRzdlSWhwcmZxVWhmOGVJeFg0aENGTmdrYVozWTZtS1oxa1Z0?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1f576b-8923-4ea6-0666-08dd9324a7f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 20:19:40.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eXc3zs1S/DoeRrlYFVkx9tPL5YVX5DlnCw+QTafLDamQvZqilMatfyqjrSTJwaOeWZ2ZZpFk33/CnyoBicxwBhKQj68srms3eCJGKuKS0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-OriginatorOrg: intel.com

Hi Fenghua,

On 5/14/25 12:59 PM, Fenghua Yu wrote:
> Hi, James and Yury,
> 
> On 5/13/25 10:15, James Morse wrote:
>> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>>
>> The function helps to implement cpumask_andnot() APIs.
>>
>> Tested-by: James Morse <james.morse@arm.com>
>> Reviewed-by: James Morse <james.morse@arm.com>
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>   include/linux/find.h | 25 +++++++++++++++++++++++++
>>   lib/find_bit.c       | 11 +++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/include/linux/find.h b/include/linux/find.h
>> index 68685714bc18..5a2c267ea7f9 100644
>> --- a/include/linux/find.h
>> +++ b/include/linux/find.h
>> @@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
>>                       unsigned long n);
>>   extern unsigned long _find_first_and_bit(const unsigned long *addr1,
>>                        const unsigned long *addr2, unsigned long size);
>> +unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
>> +                 unsigned long size);
>>   unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
>>                         const unsigned long *addr3, unsigned long size);
>>   extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
>> @@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
>>   }
>>   #endif
>>   +/**
>> + * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
>> + * @addr1: The first address to base the search on
>> + * @addr2: The second address to base the search on
>> + * @size: The bitmap size in bits
>> + *
>> + * Returns the bit number for the first set bit
>> + * If no bits are set, returns >= @size.
>> + */
>> +static __always_inline
>> +unsigned long find_first_andnot_bit(const unsigned long *addr1,
>> +                 const unsigned long *addr2,
>> +                 unsigned long size)
> CHECK: Alignment should match open parenthesis
> 

This was brought up [2] during review of V1 of this specific work [1]. 

Please compare this code to the rest of the file. Specifically, this
alignment guidance is not adhered to in this file. In this contribution
we thus accept the contribution from bitmap API maintainer (Yury) without
dictating how formatting should be done.

Reinette

[1] https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
[2] https://lore.kernel.org/all/062e5e61-e2c3-418e-987b-33fd9009d03f@intel.com/

