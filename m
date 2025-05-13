Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56CE27455
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171958; cv=fail; b=sEDI+/OEq1ZqNN7krmIUM3TPcfQLMh10ALH3/yFVcsmN1hes4FVt9Bgm80Jpi8fsOupYgpBKwkn6X5zr35Dco+XKqSfn4DnxaiER3XKuDXsnmWXmpIW/eO9PfS6WKJsxnHgc2GqGdzhls2XpzOvFUqHpf8twQSbsuNC54Hcjm+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171958; c=relaxed/simple;
	bh=79dMxzmUbinccdJUuG+Ga8wYlnqFkJHET/p912aooc4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sJkfkuO4i2KliSEOYY4nmviu2ml46XlHIPWgw8PO4btg5P5sxyUZMoA4hinzAS5lwtdVPSkfrTDOfkb/1I73Ul7Aa/QobAiO7AMDmHN3F0OdfLusaaBZdxQP8A6Pu+63Uls6KNMD/iPRxHVcx91A5Uni8LBUdYRWR9KNrHpxk3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUAhAJz1; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUAhAJz1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747171956; x=1778707956;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=79dMxzmUbinccdJUuG+Ga8wYlnqFkJHET/p912aooc4=;
  b=QUAhAJz1vwMupFtNmts3+dAbqN3WwUNE5h8/xmEyy/aC5YULLzcdq1vS
   CoCU6/TzbPvMhi7O5BtKHEN6/Nz8gU2LyDWA6/wMWrnWKhi15MibpWiA/
   xd6Ohk9OoffJCtEccIeGWgvzUt8IE9VFAsukHJx0sz1/2gLnna//kTnG6
   tGYGXwCvKzS4v/EvzbX7uSucPQ2rvdXPFLhrmYwxa6pSGVrpMjm1tuo2w
   r4V6sbs6FgxcbZOI3qEBWtrYq8+uRjyVhCknAs3m9XMIDcPH+fjwTOojI
   J5grv+cRt/MYzhUGBpjVidDO7XgAOnoQVPxZw03flM9fnb5MuC6Cmi3eI
   w==;
X-CSE-ConnectionGUID: fbDOqgG7SQ6ISFXgDWK+7Q==
X-CSE-MsgGUID: c2XuQyZZRUmhv4av9Akh2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60381986"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="60381986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:32:35 -0700
X-CSE-ConnectionGUID: KeGawT/VQjib6bJZLSWB/A==
X-CSE-MsgGUID: CulvZb+rRP+0ImXtHLkxFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138262836"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:32:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 14:32:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 14:32:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 14:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjkCgL6dfS4dglPuOxT/tIdOK7Hti8aQF/ZCxC+/lwnEAUOAVrh71mm2JP9Ngfr9xI8i8LKiEe2kjsecFXc3nWxVVkv+Uk8shjvlKyt3yp/i2jI0ol25dmOlPl4Lhc7YaiXhPy+ENg5oSDkAp93B41N17KCEnD1oyDTUUORp/qhkfJ4g/29xwV9cFZoKOsqUCWntmk0YqPOBnxtKFpp3vPGnDIITTuMVbfLvidrABlgtAPeDpWU7A0PjeWFcL6Ty1PZfbe+ziz/FZnCmcwOws7uTN/CiAcFdjuvdRVsBkCeVZdBPHty8KHnlOYrOniZobZNbf43f49MGyV1lrQ/nDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPj7mq4F/s874AKkTeOHRQG+RpJY9zyO/XzOVU3nsrA=;
 b=ofyZ0yBuJOmFuKK92KGFJSe+VvqyyMqqWiLyH0N4AwP1xctfnyUqbWQ/UCWxO/s4fCvgFdesN1HU89iZc5vLlidXJxmg8l6U6moGXT6oNoc/YYsiUv6X50tvYoWSPVS8ggd5+NKGUjW6GRjYdk5lCtJb/0v6ilivCH98tt182N0rdRuiDitSZPWzqsE9J6xSyirpoJ+yPaptEe6OMe+hE9+rqTTzX1PQ3ZXMlgdFfAxhEuyysxHwfS+qTsrukYNRUw/UWqWdmIrCzBVMQsVSN12HXuPNlS7mttSIctIHN7LUI5mF/ukn17gV+nr505dzVh6n8fhCiLeVsKsyWFP4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Tue, 13 May
 2025 21:32:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 21:32:32 +0000
Message-ID: <9107263e-38af-4679-8cf4-8ff51fb69abb@intel.com>
Date: Tue, 13 May 2025 14:32:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
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
References: <20250513171547.15194-1-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 65da80b6-a5c6-40ba-c4ca-08dd9265ab3c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0s2UmtvWWVsMmFWSW8wVmxKNXNxMTlCV0cybmVSSm9FTkdpZUNEeC9GWUhx?=
 =?utf-8?B?QXI1WDVzY3BMdmNwYmxFVGhIMG96UGx1bmZvYU51NEdJbkhxUTZYY3hKYnh1?=
 =?utf-8?B?d2tHZE5iS1kvY3RYUTVtWnExRGY0YzNVR2pZZXEwRFVaWXJDZm5aelRGR3g4?=
 =?utf-8?B?dlIvMHF4NE51NXR4MVVudmJscmNucU8wOG5lS3pDM1pZeVk5QWJuZE1PSEdq?=
 =?utf-8?B?TFNjaFdoanZ0UzNSWkVKRWtDRDNaeUMySnpYdG81SG51ckpibnRGWXZ1dStp?=
 =?utf-8?B?RDVGSFVIb21lc3pUT0M1ZFVXSXpHSEFjSnM0ZFJsVnhYNEt3NDBLRHZvczg1?=
 =?utf-8?B?bUxkcGZ6OWhzR0N0dW10UnFTajBDeWQzdEtrRUxFWHB3YzN6b1BjcWQrVGJH?=
 =?utf-8?B?cjJxMnJOMkxNSjFHeEI3NnFSVEFoZG5pWUFQNXNOcndYY0dKcmFVd3NxNHJP?=
 =?utf-8?B?N25iK25LSklsYUd5cWZ2bVlPcjZhbkFiL2JJOE5NYm5wblNOczRwUzYvY0Rt?=
 =?utf-8?B?V0hCdG1yME1ucFpiY0w5NHZwaDV5MnhvOUJ1Y0JDeXNxOWVlZHpiSzJFZkM3?=
 =?utf-8?B?UDNQRzMvcXNnOWpnK0JlSzk2UWJ1NWFjVHI1VDJxTU9hdWJKMFRETk1PMlZR?=
 =?utf-8?B?TFVjTE43ZFBzcGJkU3IrTnE5Y0dlY0RlNUhESnhuSzA1bVJFSnloaFFnVFRY?=
 =?utf-8?B?SnZTQW8yVjVxeTJsc3QvSVh3d3o4SVhyWUpLaHZpZDJTZDFicThHSnljVzEw?=
 =?utf-8?B?TDhQT1Z1TDBud1ZsL2RjR2hoTGRTUmUwY0Nta2VBamd5NWdTMENZTXdyRFpG?=
 =?utf-8?B?ZThzYXd1bmZMMnF3OFdYczk3RU15SFpmenk3aWc2Rm1xTFBsN0NmZlRLVzh3?=
 =?utf-8?B?RFZnV0V6TGNwTlFJK016VVRQTk9ndkdMQjVqYTRYbWE1SG5INmlEQVdzU3M3?=
 =?utf-8?B?ODZ4R1RmeFh6Qm1QYlhnbmwvenpGcjlHT2hhdGRqZW5ZWmhkOXJhbCtHMFlR?=
 =?utf-8?B?bmloWkx1YWlBRFRyREpUektJcnIxT1YrUm13Qi9pV3FteXZTbzVqbUZqNnpx?=
 =?utf-8?B?ZEg0K2MxQ1hRMldkU0ZSTXVWbTdvQ29IclcyRE1UZjJwdmNWSW10VUdIdllB?=
 =?utf-8?B?eFFiT2EyalVwVjVsQVFPeEkyeDRvd3FmeFlWY3lBV3RZUnpWOWpVRmVLS3hs?=
 =?utf-8?B?aldZVFdJQS9welg5N2JnQUtLRFNSRUFlbkhydlZ5c1JSclRZaityMmY0QlBp?=
 =?utf-8?B?K0lIMWlYT1c2ZTZTb0VMUzI1N3NqWndPUngzZFNPQXgvekMrQjdVcVh3Z0NC?=
 =?utf-8?B?SVJoZWJCYWpQMHZUalRYam1KVnNXQTdhWVNiQ1JiNGU1bUswbWJOQTJERmhQ?=
 =?utf-8?B?Z2pXcGdTOEZZdUI0UlpqZXJJZzBsRTBOWXpkOExrcnJnaG0vcXRaQWlOL1BN?=
 =?utf-8?B?QkZwRXA2SzU1dm1WRXNBYk5xQ1lZc21HZ1lwZ3pjZ29mSWprTC8ydUNMRWtW?=
 =?utf-8?B?N1dnWWluZ1d5M2d4OUJSRnpMalFxQWxudHBkV1hyYjJ6VmpRcmdyK2liWWh1?=
 =?utf-8?B?Y214b0ROM29OZU5PZEZPbjZmTUVCMnBEcDFyR3VLMkRJTzFWR21XekZMRlFK?=
 =?utf-8?B?bXpub2Zad3BOL3k3cTBaT3VmVGpqSk5acFE4aTAzWWdTTDYxc1pyek55WG1i?=
 =?utf-8?B?UTZSaFN3R2oxN1BqVVhOZnNlTWc1NFFwK2tUQS9YL0VYRjlzQ0FpSFhBcDRt?=
 =?utf-8?B?VXV3Z3dQODE2WmNBOFhJc1hqb2l1dnB0cW04b0MzdXRWV24wbHhQN1BVRWdl?=
 =?utf-8?B?Vm9hL0lmQ3h4M1pFRjBFbnA2Tk1ETDZ5RituajQyUEZBQzVBV3JVRi9HckRI?=
 =?utf-8?B?eUg5OEFGWkdZekhEcEhhSVNUdWxmUUlyY3FhK0YyTkJBUm1mMlhuMC9PQ0JT?=
 =?utf-8?Q?jJ+RzjTG4MY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhibW12dEgrMGpZSmwvRDFnVUNWUDk0azdMZGw0bW1MNVltNVBYMkVkUUlo?=
 =?utf-8?B?Q0Z2bE5FUlBtSGl0N3YwRVVxUnNNNDY4eTMrMzA4d2U2SFpJNEVlb1h4d0xF?=
 =?utf-8?B?THZXZ0dkY2pwcGVZU25KVlpoZWVOR21VbzQwMTVTNWpUUTdPU3g3RHpId3dt?=
 =?utf-8?B?ZXh6ejBtL09rcXFXQ1I1c1JOWmVNMmtETzkyWVllbnZ5YWlTUXNCa2pwRmZp?=
 =?utf-8?B?ckEyWFNycGFJZ2ljdVVrTnh2ZmFOWTZyNWpJenI5aG85ZjZzdTZ2WS9LbXNK?=
 =?utf-8?B?Q0tCVGR0QnVJMUt5RFpnYjZMc0pUOTQzWDJmT29OY3pjYmdTUWZqWUtJZDRq?=
 =?utf-8?B?Y045ekZGYnlXNjcwZ2pVTUh2R2lQeVVUY1JqalYrYk11aGZTUGNMUllFOXI1?=
 =?utf-8?B?TGFDSUdERkEzK1ZERStWaGVuMUJUVlo4bjNkM0I3OFlnZzZQNndDODY4Njgy?=
 =?utf-8?B?blhWbCt6ZTJwaHJuM0E3VkRLRTNseFJtQk41dUQ1UUJrMkcxenJmeWRHNTJq?=
 =?utf-8?B?bHEzZTBROGtZS1h1RXQzVU5sbzkzUStvWUhaM2ZTekIxS1FRTjluRWpZMXMw?=
 =?utf-8?B?bnUrYU5jZkpXOHpBTGFqWVB5eUdkNHlDMmFCM2JlaVYvM0s1NkhEcVl4Q3Fm?=
 =?utf-8?B?OHdWb0dFVlA2ZktIMmwyRTl3MTA2bnVhclFla2pQTDhPazVSNzZlelZ1Nngx?=
 =?utf-8?B?cE51Q0Z6NktCNzI2WXhXcmFZd3R1QkNEVExqZTNvZHZJclVNWDBMbUVURGFr?=
 =?utf-8?B?VkNJdTcyQ0hWU0xIcDZKVnpqQTJSMVlUWXg2UnkzYXE2QUxCZjFZMy9jVjdF?=
 =?utf-8?B?SHpoRUh5UytOZ1FBNVR0enN2SEZxUUxHNE41ZjFQcXBxdWJSYjdPMmFMNkQ4?=
 =?utf-8?B?K3Mrd0hKKzUrSGR2M1dnYUVGK09GYThwZnVvZnpCSGNQT1UzeExQam4xQTZR?=
 =?utf-8?B?UTM0WXduVGdsMU1PbnU4c0pJa1luQW53R0Rpem1qY3JUdEJwRG9mcDh3Rmtn?=
 =?utf-8?B?TiswV2NsSG9iUDI2NURaQnM2eTJ1Nloyakt3YmlxdGJJVkM0K09TYjVvSWc3?=
 =?utf-8?B?Vis4d3JRVGxmQjYwTVZqckVaelpoNi9lUU16WkkxR0xROVoxUnNyM3hiNXI4?=
 =?utf-8?B?ZmM2RnRSV0VtK0g2VGxIcmZNci9tNHU0OW92LzlseTZSS2lMV3prcTVBdTZY?=
 =?utf-8?B?VFBENnRxY280cERrd3pJQ1dRVGlUdHVKNGVvYThwNG9yUG8zVGVjckFhSmRq?=
 =?utf-8?B?aUJ6SmRPVERHbDZscUN1ditlMjZhTnlIaE1sZkVyYW1yN2swZWdIcjBuN3Zi?=
 =?utf-8?B?enh0TjlnS1pyUzliVzRiVHMxUlF0YnArY2hMWm8xTDFzN1N2OU14dlhmRXUv?=
 =?utf-8?B?dkhuak1yL1VkMVNqYlRXTk9WYUpyb0lOdFlYd2JQWTV0dW0wbGczak5FTFUv?=
 =?utf-8?B?cGV2RXpHTVFrTGo0U2dmdFErUnh0eFdxeUtLRGx5NFV6eXY4dUdPeDJDbzgx?=
 =?utf-8?B?b0hDcnNiZXpTVkNleUdiRVZ5N09xaDA5KzBkcGtRUEI2a2o1aUdMZy9FNHBR?=
 =?utf-8?B?Y1FUNHFORjBlbHN3cDBZZ09yL2JvcXpKWUhBSHB4a3lWbE1GZnNzM3BWZEht?=
 =?utf-8?B?anRTaHhZdGhaQ3ZIVnFZK3FEMDNsbnI1VURZaTBVazhXTm95T1hBazhIdjk4?=
 =?utf-8?B?dGloSHNRN0VudTRvNUo1RXFjbjdaSlFwamhaMGhMdlY0T3hrYXRsQWtKL2Z0?=
 =?utf-8?B?cjliMDBQUVFoVVQrdXNVd0pKL2JmcGhPV2JEZzA0ejl3THowSGZCdENrcWdO?=
 =?utf-8?B?VjVSS01uc2tSOVR3Ulk0dk1IK1RNNXlUalcxdmt6LzBkSmJPUG5PaXNGZVho?=
 =?utf-8?B?d0J5MUxqTEd0UUFHRXBHYWRQMGcxK1FSb0Vnb1htQUtPd1B1NnN4Wm5JMzBX?=
 =?utf-8?B?QW5GOVZWZUpqS2VncWhvdFpwNjZxNHBzbzlhY0ZXQ201U2xBbnJPQ25UamtQ?=
 =?utf-8?B?RW1UUGFVTHpQaUNmWW5idFFlRzIxcHNhNFhabVRDeUlRTmVmcWFzR0FJVVZO?=
 =?utf-8?B?dmtoSnhjcVFLTkZERWk0NmFYTzZEZmdQQkJleUR1VUVFOXpEcko0NzB0SVVr?=
 =?utf-8?B?d1A2WEh4TWVCM2RoLy9jZ1kvN3owQXBhTU1VQ1doTFhyOXliOGVSNmtETXhv?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65da80b6-a5c6-40ba-c4ca-08dd9265ab3c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 21:32:31.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3tKp+oN/wuL7bG4tpmJcuoNd/bAq2kJMrU85/Irt1AsVfat5f7qLeVBmK2VTkQMZS+S/F+SAueyOqydQ272TQj14pwHij2yOm4FhY4EzBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
X-OriginatorOrg: intel.com

Dear Boris and x86 maintainers,

On 5/13/25 10:15 AM, James Morse wrote:
> Patches 24-29 should be squashed together when merged, taking the commit message
> of patch 25. It probably makes sense to drop the tags at that point as patch 25 is
> generated by a script, and impossible to review. They are posted like this to allow
> folk to re-generate patch 25, then review the differences on top. Not squashing them
> together would expose a ftrace build warning during bisect. (but who does that!)
> 
> The result  should look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11_final

(awaiting this branch's availability)

> 
> I can also post the 'final' version to be picked up if that is less work.
> 
> 
> This series is based on rc5, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v11
> 
> With the exception of invalid configurations for the configurable-events, there
> should be no changes in behaviour caused by this series. It is now possible for
> throttle_mode to report 'undefined', but no known platform will do this.
> resctrl_exit() is now something that can be called, but x86 doesn't do this.
> 
> The driving pattern is to make things like struct rdtgroup private to resctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to disable
> it at compile time is added.
> 

Could you please consider this work for inclusion? Please provide guidance on
how to support inclusion of this work ... James mentions a couple of
options above.

Thank you very much.

Reinette
