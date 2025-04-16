Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3716E863
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769691; cv=fail; b=seYztBnVQauXOiVv9WAyracFDoxADPgQeVhiqvJqjKGaLd2fIjMAm/BLqaQn94ad8r/nnxKq2NoemCZHW+/fyIw15q427ZjuIW8quH2OC7PoY8x1faF0AYbwZligTIRWuk176yLOSHIPcXjvMI92iBsIcF7dd9lTLXWtHI1WY/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769691; c=relaxed/simple;
	bh=A0CHLmvNmmkyLtWrZ++nqb6HScDC+dugQIxhNAeBJls=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M5H/aYJiJjqmkYuE+J4K48267rG4vjz2E68b6v6DKJUi/RxD7QTD4zgZ1JM6kkMk9264BRMYrGOmPDHSCTpxFuZJmAGsp4rwPAaOLxg7vujiX2nZvpCIm7btNMGz07CGJ6gV1DJ03YAkFWGhAQfjrMxHZhKvU58zQLl3KDX1ABY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBl8qOT0; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBl8qOT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744769689; x=1776305689;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=A0CHLmvNmmkyLtWrZ++nqb6HScDC+dugQIxhNAeBJls=;
  b=TBl8qOT0X7/rL5wSIb+tMA8ADS29kOAGFy/ZgxlXWZD6WRaRwtSr01Q1
   /CyO+bynjUbSfsq0HCHGIb1hZwO6DIOdGktWQqOz1KO3yapR/J6QpEfRh
   OiaFzFGLiNbAslDlAkbnihxzj0DKBx5sb3+CIy9AdMOo2L1QP6RfAJn7g
   4mxLyv7emQsr6a3+EmNgS0Smt7zrY7jQOloJiCOspwenopSisoMMzGsGp
   B7XmiPukhId4BZI+dSzq4tNNZHn7Ao59kXR5OF5j2TU7mG2lH6AeHBtvD
   t1Z71ICJRWCTDTct72toM9FSBoEBa25RWJdCD0ne6SA3QGzyyJROggKOh
   Q==;
X-CSE-ConnectionGUID: AddYPkTHQCuHlWuZvcCNJQ==
X-CSE-MsgGUID: jGUHZgWzQzyTutcQsMx2cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46390917"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="46390917"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:14:48 -0700
X-CSE-ConnectionGUID: pJ3VTI3mRM+0YlTTBfNEGw==
X-CSE-MsgGUID: /9Y2fEJTRd2J+3xitwpfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="167459535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 19:14:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 19:14:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 19:14:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 19:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftJhzItKnnGsYGlJ0+HOOrlTxmJq2fMQVrEmtydenqq40kZOQbwXkZy+2EHVE0yBp+XuJDJBtuhCAxMGyMvV+h1Oy/Q24QGPwpSycwKMI/MbZ2c+c6MuKM0UWRgBs7m587wI2ppDeN503md3XhcfjjFl4gaSab248MxzoRN5IkA0NI1IW7IcPHiYvgvsl/Nuw0qamMPzoYo+9gpKGIaofSRkz+AhwFKVdOHfBkGgV4soJrzuu3RXU7KrhvMlE0l4/g8+8lyB/DaCcyUNf9mioKG4wBWn0MldpxOWIL6cWa8HlNUSv2TjVWy16ClZGkj8pOoVd3MLtSpfVW7lGskStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYDuANRorP4jpU1VZn0dJEuFuKxMjsmkybj6+aiEATY=;
 b=cTJIbqnhLkb228ZEVE2WA5k9TJ8BRh2KRER6kHjrluuKwwF6AUuY+ppa3CZmkPBxrjA5WCJky30uZXP3e/N+wF8WGTeDbv34djvbicjPuF9piyu5ZgAwpSFd4qrDnw9wkmy2ZcNv7FYAHgFi6dhgD5hMV5mJBso8/768aipVECoWX04+Z78DldYT7u2ZzqXj9YDhagO0v7hJjd6zOQqE4SqXIerky3Z/r/SEPXoXYR/cvwsz78/2G77bRjm2cG0+iCpisSN52hArPorwUAP1pgb35WHuB1kKLdaINYcK0wdD0YPq5+HSQV5uSbIKaZxEIedPZDZGuZLfM6bkv4aPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 02:14:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 02:14:45 +0000
Message-ID: <a61c329f-370c-412c-840e-b088d82b9dc3@intel.com>
Date: Tue, 15 Apr 2025 19:14:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/21] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-17-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250411164229.23413-17-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6805cd-fe27-4b9b-2700-08dd7c8c74e5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGNaMDU0VXM5QUlKdUs3YTNicllLbzh4QzJ5TmdkcjY0UWJzUXlEbXFBV0Vx?=
 =?utf-8?B?bFQzQWt2dWJWZUlSNk52enB2WVBvUnYzNzVIb3ZIV2lzOEUwbWpMeW1weTV4?=
 =?utf-8?B?a29zb3dCQmhCK3ZPMm11cUhLdkJPa3VZOUh0WDJneC9zNGgydVo2SlZyOTk4?=
 =?utf-8?B?M1FYVVVQL1hwY3M0dXBLY3BWYkJLVlhNUm9YRXBnY2pqdXdjSVA0Wjl0WGFT?=
 =?utf-8?B?T3ZEdnV4RnB5blArQzNZZUVXZTdKWVpOQUZyL2d4LzRQR0RhVGJuaitEUWMw?=
 =?utf-8?B?NWFpRVNXSVBac0JqRW9xRXhsQWhta1lsQU5BR3ppUUViVUduK2FHcXNLNFBH?=
 =?utf-8?B?OUxZcVNSWG8vMGx5Z05UYXBOWW85cGxKZTZtZVgyZC91WVJxSXV5alQzVFVX?=
 =?utf-8?B?eUtGeTFtc0lsZXltd1NNMTBWMko0WDRZYXR2TkpSZ3V1aWJxRW9VUWlIN1cx?=
 =?utf-8?B?bWVacFgzVWF6c043UTZEQzV5cTJJK0hZcEdySzh3K25pUmNVeXQ3cWVGN2xv?=
 =?utf-8?B?SXQzWkRTenNnSVJjS01Wd1VIUDdVRVdPS2NFOFJjVmdKc3hTSzhmZC84bXRx?=
 =?utf-8?B?RDREWGFuVFNvZ3JmVUVBVnZ3UDhENFRDN3hiNVlONzNpV0lQQzVFQ1daRG1L?=
 =?utf-8?B?WWdSVDhCemE1SVRZV09ZdXRJQmxWemhWaXF2QzR6NEhObG41VkwwWjJkOXJZ?=
 =?utf-8?B?Y3A0U2lqeHBCdm5XV1JERE13Rzc4Q1pGMVJPYTJnekNHNURKMVJnQ2Y5RDNW?=
 =?utf-8?B?QURxUDBvM1VsdVN4QThHd2o2UmJiZzV2T3p5TFExdm82MFgvaG82QVFDblJI?=
 =?utf-8?B?N0R1STV6ZUN6NjhTM1V0Z2tkVXRxb08vYVBPRGRlMEFzbk96WnAxOG0ySFhh?=
 =?utf-8?B?MlRBU0U5VnRjeUhpcmgwdmVsNjh3V2RZVG5JOEl2YzNBZW9nZjlxWEN4UUk4?=
 =?utf-8?B?MXpzdkNuRms0TkRvMmp4WWdzQ2VnbWo4cGxrSFlPQVZlU0o3N0k2T1V5TkxQ?=
 =?utf-8?B?ZmVWdzlwNE94U1hjMm9QU2JjN29TSVdNTmR6NUFhZ0FqOHpQaXJFSGZoKzB2?=
 =?utf-8?B?ZFpnRTF0SThSZHBqaEVualpaWERHSTQzOVJZaXpxMXFlU05SRjdnS3UxUXJm?=
 =?utf-8?B?TWtEaUwxWDRtN29JTmswUWRPTWpEdXkvcXQvdHBMTzRYTnNNdXdFc3NxUGt2?=
 =?utf-8?B?bEUzdktBQzRaeXFiOVFxeWw2YTJ1aHM1dFlXdXFOYmVpRFFHdnAvVTVFemlk?=
 =?utf-8?B?bDRMc2lhSXlDaXhqelFhb3B0NEVjVVJiUUVmN1lLQjRSTnVKL1BWdDhJeEsy?=
 =?utf-8?B?cHdMUkNMSiswWHd5MHpBcW9jYnIzMDBYZmFHOGxHQkxXZjRBZ2pkTFdTQ01W?=
 =?utf-8?B?RVA2L2E4T25vMTF6a2cyWWRuRGMvdjNwc2VzTEN0RWdSZThGYU5aL1B0UzMx?=
 =?utf-8?B?Wm9rVlUrdzB4eEVwNDgwelBiV0xLUjJHZzdpcW01aW5mWW5DZElSaTZ4MGxj?=
 =?utf-8?B?VU9QTk8rNWkxUUtqUEs5MHNKSVJMbUV5TXpKMldMUDkzcXFMOFZBNTBMU3gw?=
 =?utf-8?B?OGdhVHVXdkg0bFljSWUraEVIbmdKWjhnRXM4TThxTnJ2K1BMalRqOUNUTTJO?=
 =?utf-8?B?Y3l6eXN6blk2YlNBZE1iZ3FuN3o3b1VJNit6aEdXMGZZSzNSRmFjMS9UcjNW?=
 =?utf-8?B?ckRlNi9lTE93Njdnb1pnT3IzenNkTXVJTWduc2lndHBsdHFLUFF2QUQwY1Vm?=
 =?utf-8?B?NU82MmQ0MjRISEdXTW0xVjVOVHhwSXFrZU94MkJEVVczWjNjMEdubVZxYlJl?=
 =?utf-8?B?Yi9mZ3FHdFdscTJjdUU2OGdGeHY3M2l1blRHZ1BFTVJickEyYk91bm9PSFR1?=
 =?utf-8?B?VndJbnR3bWNOeXhMTU55YTB0akhPQktwYURoaXMvWnFDbmcxelp1L1BZVUtQ?=
 =?utf-8?Q?arEdM9o3xVQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elQvSVZ0R2xQenlhWkRSckNTa0w4NjArSmdXd1RyR1liUDZjd3dweldmVHVn?=
 =?utf-8?B?K3ZmZTgza2p2TVIrWXpEdUFVZVZ3L0tlN2hPZWREOU9aeWE5azR3c2orbkdk?=
 =?utf-8?B?NXJjUGZYN0ZoV0hudEgzN0lmZTVnNXU2Q1lVN1FKU1hyZ0UybmdvZW5xVzUy?=
 =?utf-8?B?WXBFNTZ1dDREbTFpLzhEcGYzQ2RCQVJLSlIvdThIU0VRTmRNR0U0dVNMdFIy?=
 =?utf-8?B?dzhUcWpJUGY3N2M5dWNadHl4NXpsMjhDcDA4cXhuZzNNbFV2TXg4cHJMVUo2?=
 =?utf-8?B?QWVnNi9aUXN4R2gvalNsd0ZRQ2lUbUUrdnA1MzdaampzRTFRaHRSbDFoNWpo?=
 =?utf-8?B?MHlTemhicUxvdFpMOFdxcTRuTjdmUjdLMERsRm12aDFrS1MvMEhPYnlldzg0?=
 =?utf-8?B?b1pZUm9vQkpGWW9DdXlUN2xtMGM1SytQdGxQYlFZcUxHNDdaWm1SMEptTTZk?=
 =?utf-8?B?WElsTkhkVXRtMzhNVTViY0pPMTM1NUl1VnptU0hFbm9yNCtQVmpTZmZMOXRV?=
 =?utf-8?B?Y2NlUkZ4SmZYTTZ5N0FISjk0Yk1NbWpBUTRNSXI2Z1FEd3U0bUhTcURna3Rk?=
 =?utf-8?B?ZytXbEFLa2hKeklkSzg5dERGemJnOHdGUmQ5ZDFoLzFGb0JBYUk3OENOV2xl?=
 =?utf-8?B?SklkK2RIRlZUWWF5T2dKaWNiNm1OOU9MV0gxeWNPV25jS2thdElkN3NPYno4?=
 =?utf-8?B?WXJZRTk3Q01lYWppaXliSjBoSW9tSUVYaDQ2cHFyMmtSRFRhR1NFVkQ0WkNr?=
 =?utf-8?B?NStDajlmUFdManVIVWNSRkpvRUEzTXZHREhqSDcwaVRDRUdITmhCMlNibDZR?=
 =?utf-8?B?aDRNcjNiancxbVlHNkNMZWdLek1DM204Z2hyTitVTVdMT2NhSFM1a3JQb1BC?=
 =?utf-8?B?Tm14WGZtNEsxMzhzNjlucFA4ekttM254b3U5d01jelFvelU1V2ZXc1g2QS9I?=
 =?utf-8?B?cmNadXBpOU9scWRNQnlEcElwdDhzMi9UdHd5QWNqVGk3WGp3cEtraVBVWUow?=
 =?utf-8?B?MXlOeTV6QnhGZFQ1dUtLVnlLZ05yYnJ2S2F2U01IRWRmK0h0ZWpndnZ3Umwz?=
 =?utf-8?B?QnhDNTRjYXhDeGI5Z09uNHBCUHFyQ2xFYmV0M2FKYnhVSEdUb0pod1FGZmRG?=
 =?utf-8?B?aVZQTkwwVmMvOUpOTTlCdXA3YSs5ZW83OUc0Zm1QT3lKSlBEaERIUmRaaU5r?=
 =?utf-8?B?YkIrV3ZCbmh1NDZlbkVkNUtLQUFJMC8reVlMbFVBY0ZHc1J5bEJXd2hpOUNN?=
 =?utf-8?B?WWpZRFlybHlNMmM1RENtUlFOWVBNRTV1Um1ONTF6R2xMM0RBRUpFZ2VCYWlV?=
 =?utf-8?B?RktGYTI5cXFvdDlqWUJURmF2Zkx3aTRNVkd1QUNvRzNZRm5GcTFaQkRpdUlW?=
 =?utf-8?B?VEI3SWYxdWZ5eTVyVEF5d25XcytWUlN6dWNsMU5DR2p3dFp0aWRBOTczYmRu?=
 =?utf-8?B?RGcycWpwdmVMVUhKWkYvNGFYQmpJYTY4eTZWT3FPV2RrVlcvZ2ZiUVhFbzBU?=
 =?utf-8?B?bURyUWp2QWNCY0ZEVFFwS0Vwb2ttelZYbE1sVWdYSUNUd1MwR2Uva0pMcS9v?=
 =?utf-8?B?R3RKb1I4dGJWeE9oRXFmMTNOTDRGM3BBdHhKUzE2UGZNZGFqWTZhSnJjUndP?=
 =?utf-8?B?elo0bnN6TFQxcU5Ka0t6dWI3V3FrSHJHdXMvQ0lrYzU1Zm5iOWhqdkhUTWpD?=
 =?utf-8?B?d1ZBVVFtMTlURUNtaEhVRGFGWjBCTHJIaUJWTS9RNm9rU0tlekFIdjhpTjJP?=
 =?utf-8?B?YUJETnBMdVlhSkZGclZNOVNyc2VmQStOYzFpcnZlY25rcis1ZjgxNndQbmlG?=
 =?utf-8?B?bHVrRnp4a01LS09BTk9QVVlMYW5JMEJpRVFsME5TYk4zQW9rZkhWMTVpYXFn?=
 =?utf-8?B?RFdSUzhZTktueDk0MFhjOTI0QXVuVDhObHVMVVR2Z1duUm9YY0paTHIwNmx1?=
 =?utf-8?B?VzZ3aDMxK0NvQnFOcmxxT3BTU2Z2Z2lUdlRIOTFySjlkeFNOTjlJVmxOSGhv?=
 =?utf-8?B?ekRSRVZJTkJ1NWdYd3pLSCtPWVRSSHNOVE83RWpTWjNhdHlmd09IZzRHRlZE?=
 =?utf-8?B?aVNqT2t0a3dHc3BLN3F3Rld0MTMyV0h3cGlvVWdOZzlBWEJ2VFVHcEZkZDBZ?=
 =?utf-8?B?eUl2cys1a0ZZMlFwb2pUVHBjSXdxV2pBK0NaV25Zb3BZNWdyeWxzakI2dENE?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6805cd-fe27-4b9b-2700-08dd7c8c74e5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 02:14:45.6417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Thitn1pwoyQw+eC+76uXuJgX2p+EPhxGo77L0lbOd2q843xWmVWe/Dmx4GiOWGAk3CCTpEc+ddqa1Kv9drprJDMq1+p1jlmxF5uB4ZPQ+Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:

> @@ -996,7 +992,11 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)
>  static int __init resctrl_arch_late_init(void)
>  {
>  	struct rdt_resource *r;
> -	int state, ret;
> +	int state, ret, i;
> +
> +	/* Initialise all rid values for_each_rdt_resource() */

I find the above difficult to parse. How about:
	/* for_each_rdt_resource() requires all rid to be initialised. */

> +	for (i = 0; i < RDT_NUM_RESOURCES; i++)
> +		rdt_resources_all[i].r_resctrl.rid = i;
>  
>  	/*
>  	 * Initialize functions(or definitions) that are different

Reinette
