Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6425A650;
	Wed,  5 Feb 2025 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737123; cv=fail; b=tOCLXs9ztwRv8LUScbYVoHAoSRXMGNOPH4UhPhHT/48bhprLZtJDruAnqydtEZxWedKI0bRTeYF/uq61h5VxLlsbXv/AX8tSkD+6XITtxJGaimORD7iroRnPwQ6DzWFmr5+Ek4ZMLX1qI6Bb1jPphE41EJxa3NcO8G/jUacny/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737123; c=relaxed/simple;
	bh=NmsCT2aKucIvXAKefjG3xa0ufciCiHJW/iOCwAXzEKE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U2O6cLAwhyoVUJw3bsrAIYA4MS+s5+MxZUofvG3BuqKynDGPWWU6oFwZpugMHoYuDC2mD4EG9QMqxIfDWcFeTVunyIyFuV6++znSY+fEW0AZ4QpWbGUjezJWU8HvYPA+UglmGJTlcV6kteQO4oHrAPCAxMPeIXR5gLe30PibCR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crf67mjx; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crf67mjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738737121; x=1770273121;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NmsCT2aKucIvXAKefjG3xa0ufciCiHJW/iOCwAXzEKE=;
  b=crf67mjx2jl4AoMpNoJvO2/obNfWe4nwVUpZvCs11qZCvmkggggSm9Gt
   TWDPZkVQH+KLieOP8ijamd03zq1azSe/V6YsfjG8DM+xWovddxJ0az45w
   xxTUNXb80/RE95krSeJy7tx3b2K1QyQOBFJPdvT5RERYxMEAX9oqUNaHj
   uBI64GJT6VuGeat/+KKoty+3iILkSejpYehwssczlEaey6lJDyJ3zU+qW
   iZvU7/AO3seTYupy6BrJzrUJWl3Wf/SMCtkIhWvTwXPbyQzQ8h9uukiDl
   KGgT0zSPA54Ao/7oDZu8EIWxWGJfUBPx31pQWNaa+CZyoJRZ8+tRvj08G
   A==;
X-CSE-ConnectionGUID: NSbSODf/T/GrqaFTbEe+wA==
X-CSE-MsgGUID: RPcmSSt1QuSLyJoT+CNM+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49541961"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="49541961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:32:00 -0800
X-CSE-ConnectionGUID: epJUCoKfSMqEEZ+kwYL/Iw==
X-CSE-MsgGUID: hWn20vtVSA2gnM8nk7Bjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148026211"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 22:32:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 22:32:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 22:32:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 22:31:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unGntLWVf9FPPci3gXuPnEEvUH4h4xP6TlUq1hDYXh/Z30SOm1G+ZVfRFW6tdkZmuNKj1cYPHFE1tJLHFZCtmQi3pffWpQc6P7q+2Wmgy3Jo6KIgaH+pwBv0Q2+/X3mKcYraNObmMLBFYf/7gkkPUciM1D8/ZpE1eDlaqhMJ8kBSDl8Fhmw/chA3BM+LeIyYvWDcQcCZHCn1l5s1pnBtaSTNpAD/6delIAHobAkxB54y2aZhsupTzf3KsBPHH9Hi9EEbqdLs0rNBmHSMba44cVEG44OgA4O2kSPduuKdqD6Nthzi/aeEcOvJaCgTECJt3wbXwYKVEl7AO4GH228idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB80qyN1xNbE0QO7V7C17sMQnSzFvC5NnvcrOIlt254=;
 b=y8j9LlC/ClBjTY9pYnVjtQF99VOQ+ad7cdwQDV3JhCPB1grSG80SFM164oBOGvh+vks50+hCX2C0vl7lurI4yDVtF09pIOBME2EAHqLwG6ev1Gp7oMiK/P376RnTkmsCC893deUdx/ZkoUaQs/ahR6eKfdae4YjHQeAvEDdJPgb2NcfP/IH4XHWAW+FeC01SlEjSbqSD4drTcL7vS28qt/T9P1YSLJuH7qw1HLIkBQTUuFK+vHB0Rb2cRulL98gltWBnnDk5c9tQ1yg4szkKpzdiWjmTkir/6h5WghAa+PREX8rqiuJ1Eyl3pfkh+QeRpl5TtbK7xCu8h+aIdUCQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 06:31:30 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 06:31:29 +0000
Message-ID: <b6157185-9c9e-49f2-9e4d-03ad6e26f898@intel.com>
Date: Tue, 4 Feb 2025 22:31:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation with image
 download path
To: Anisse Astier <anisse@astier.eu>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <tony.luck@intel.com>,
	<ashok.raj.linux@gmail.com>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
 <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
 <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
 <f33148f4-f9f2-4b7c-81df-346b750eb2dc@app.fastmail.com>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <f33148f4-f9f2-4b7c-81df-346b750eb2dc@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b050f2-607f-425e-76af-08dd45aeb980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU1TSVNlRU9uZUNPdkZYQThzWldIYUNucDlqZVkzTC9qTWs4RFR2UkVsRG9m?=
 =?utf-8?B?ZThQSFVwWmJWYk15bXE5a1BUR240aVBJQU1aMG5BSldMVTR4RU1pMFM0Mmo2?=
 =?utf-8?B?T09DRnV6azMvUkFOeVVOMmdpc3JidXpjSDhvQVk2YkxxY2lkM1Q4WmtFdk5S?=
 =?utf-8?B?ZklKZnREZUVuRjVCYlFyUU95dDFnODg3MkVLMm10ZkJkU29lTVVYNnZMcHBY?=
 =?utf-8?B?aS9ObEl2RnE2UEIvN29YMFVLR3dFQzZ2aXB1NzZBL1l0SzZyNy9CUEMzTXNZ?=
 =?utf-8?B?OGdsZVVxZUFSNVo3RFdESFNoM3laSjVXeUduYUVHVUo0c241RlVxNzhaYVVm?=
 =?utf-8?B?NGZJWVF6NFJPODUyK3BYQU1EVGF1S1ZheWlFK2VSQWpzNC9tN1IwR3pPRjU2?=
 =?utf-8?B?dTZpdEt3Rm5qT0lyM3hGUlFOWUJUSjd1WGZlNUwzU2hxZU5FTTZCM25JSXFW?=
 =?utf-8?B?VW9Kai9XRnRlKzAvaTYxS0xKUlNMUWlncE1Ba2xRZGVoZGV0Zzlqb3IveHZZ?=
 =?utf-8?B?dFVwWjR6Zy9oenQ0WU9qaytlYW5raUoxQitYWTFaTXNHbDJPeExwNkZubzVQ?=
 =?utf-8?B?Mm9mQXJkNGgySHA0c0VHZy8yVUY0UnhBZjQydHh1QnNWM2ZhN051ekRqUzN1?=
 =?utf-8?B?QXhRSm9rSVdzSGJyekJ1MUtLbmYxT1RJRHgrZW9BZXByMkgrV081a3JYMVFu?=
 =?utf-8?B?LyswREJCbEhKa0Y1V1hjRmZVVS9SbE5KQzAvNHphMXZTNk04Z1pFbHNxd1Vr?=
 =?utf-8?B?U2xVTTFPQ3lsSWlWbFlPVS9SVG5TRUlBdE9iU2gzbnlrZXgrSVh0UGw3RU1P?=
 =?utf-8?B?MVhUU29sV1ZEOUNLbUNCbCtiRXVpV3ppR0NFemJGWkt4TjVLaUdLbldTc2t4?=
 =?utf-8?B?UjRrRXRnN1R5aThtc2oyaDNtS2Vod1RFN1NyTDhNOEt4Lzc1dDhVQWRPT3Bs?=
 =?utf-8?B?c2s2MitRUk5RbGdpN2pVYkp6Y2J0R28wMlNKZmZTcHBUSllOdE5ENkhSd29w?=
 =?utf-8?B?cG9xQkd3akRQV3ExSzBqUWV5dUN5WktoL2s3b29jN0pwcW5LSkFZSHhJV1h3?=
 =?utf-8?B?ZWt3WVo5QTQ0QXpOaVZ0c0h2VkkxUTkwcTBqTkJpL3N0Q0ZkR0g5WE5uOWZn?=
 =?utf-8?B?QlVtK1lLZHI4cmc4OURob0hVbE4yN2xCK1dtK3FjRHUyOE5HSGN2SkJOQ2Y0?=
 =?utf-8?B?RkhuUFIwQXdnL29MVXNUeVN4a3RHY1JXejZXQ2NtY1NaWktmQTduM25XODho?=
 =?utf-8?B?eHE3OExlK0tudm90RzhFQ01yNHdqeW1yNkhiWHQ3NGZmSGFkbThTbDI3ZE5k?=
 =?utf-8?B?M3Y1SDlRK1FQR1B4Ym1VdFh2WE1DLzFBK245OW1ic0lBbVVwaUxUTXVuUWZr?=
 =?utf-8?B?NkZhTzNBaktUWmRLQVFzUC9yQlBBOVFLM0wrenVZMmFQdUwvZmIzbW5reXlv?=
 =?utf-8?B?dXV5ZFFGZzNUWEZaNnpsaWRqSmU3QnZrdEdhN2pidkU0WG1MYWlhL25PSXFm?=
 =?utf-8?B?cDE0R1ZMY0FHaVZDZ3NwZlZnWWdCQmNQOXRKOTlkUW8xMVRkVDNKWkxobDJM?=
 =?utf-8?B?dHNzTjlMYTJhUEJNRUNTaDhtRkRzU0kyOGQ4MXpZRG9hWjl3SEt2a09SUUx0?=
 =?utf-8?B?SEFJTjh0cVpwNDJwc2dEVWQvQTFzTWhtenZqVksrNTg1OEZMWlhGQ3hnQTI4?=
 =?utf-8?B?SVc0NHhnRkJzR3FMMVM0K0xDbDROazJTaVNva2dqZWVYSW0wdWN0OTg4NjRP?=
 =?utf-8?B?TjRhUW42eGwvNkpqbnZXRTdTVGJUeStpK1NIZFhYdENVbFU3QXk3ZWhNNVo2?=
 =?utf-8?B?YlFUcmZEd0twMW1yQnZsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZrVU9Gb0ZkbWZPT29zbXRBck1EMWM4WER5em9kZ3gwam9FU3A0b0tZMHgx?=
 =?utf-8?B?cFhscWxUQUpWR0plRE9aZERsbUxsWGdHcmU2N25tWkVFYmRjWkpYTERnNFZq?=
 =?utf-8?B?Tm14bVIrcnJ0TytQeDhpa2RiOHhMdDlZYlhtNU9OV0RDRU5pdWtIOEl4Wisz?=
 =?utf-8?B?L3ZEVkVqQ2ZBTmlQY1hTREllMC84ZnZ0T2tsazdvbnVpQlRJMVlramUvUUM4?=
 =?utf-8?B?TldsbnUwaW1TNlluaUlBNFFLaTZqcmwwOU8zdjUySUJBMHBXRzMzZFMxUlJK?=
 =?utf-8?B?QnVuaFl0a0dvT3pEdXdhL0lta005U1hmY243MTlBOS94NVltZUtDYmJTMm9j?=
 =?utf-8?B?QXNjMU1pNHBXNjZqUVZnS3hqYUM5OVpKMlNwZExZdDMrNjNKWE5NV0xCNmpq?=
 =?utf-8?B?TWE1OXZFZHkwbkJCV3V4b1I1cHAvNVVWcHBjWlBiVVVKT240MXJyV3IzUUZ6?=
 =?utf-8?B?N0dzVmp4MS9TWlV5TVBHZlA1RXJZanRIUUplNHB6S2JWSk9aWW56VkZndTNy?=
 =?utf-8?B?OHVWWWthVytrbUh1K0trYisxTUllMDJDazl2MHp2UWVHY1RmdFhjSnFicHlZ?=
 =?utf-8?B?b1d3WElEenhXRU9tWE5Id2xRVnRUNGMzVS9KNEFPYm9hNW5NMGNFVzlUa2hW?=
 =?utf-8?B?SS9NOE12SDRsbkg4N2lVT29SbnRWQ3hncklXY2VNZlZvWlZlWjNIOThlZkd0?=
 =?utf-8?B?b0d1YTc0NHZmRDFsTTJuU0dxcEFCdUY0S2ZYQkZlMlZORnRnZTF1VElBNUdK?=
 =?utf-8?B?dUIyY09pZWU0bU1SeVJkQ1l4b1dXMGNsVXo3UWZ5b3lldXo1WE03dXZDSmhJ?=
 =?utf-8?B?cEtpY2gyUGVId29TcDRqVlRtbGFNYXVWZmVHbDBmOU9jS0ZRajBuWCtSTFpT?=
 =?utf-8?B?RWdUaHcxNFNwQjI3a0dUWVJEYXFoMStjOVZtdzBKUnVFbyt1T3Nmd0l0eEdN?=
 =?utf-8?B?ZEJpRXh5VTV2YUw5UFlNaWl5d0JNQk1MampjWlJCemg5YkJhc1NQNW9rdkFN?=
 =?utf-8?B?S2dYcVVueXhOd04wdG9OaVM0WUZBSDRiNmtWMkhueDFBZHI1eGxIbUxLY1or?=
 =?utf-8?B?ZVFvb0t0dWRicmZCazMrL3BZMUtRNmp0bnhGbXpyRzZicnRMTFB2ckQ4c0dP?=
 =?utf-8?B?WXNwVDdVc2FybFdMTEZXTGc0ZnQ0T0UvWHNSSDhpdWRtc2pPb1dNczJVUHcw?=
 =?utf-8?B?N1h3Qmd4a283TWsxdFN6VlBwZ0hsUFE2bndraFJGZy8vOTRrM3ZPaUF5eUpG?=
 =?utf-8?B?VGIvUWdlcmx4bmk2eUl5TjFNRml2NkFjMnRnNFVaOXk2SlJuekNWcDNxQk5h?=
 =?utf-8?B?L1lDWkZSbm9reG9yVktGcXdhV2lmVDVwRFR3ZVgzclpaOWhPSmRtSkNoNXJU?=
 =?utf-8?B?OFFPeFdxK01ONU1NY29VWFZlSktxRzR1UFRPbFBKWnBxeGNrVlBCanVDSUpH?=
 =?utf-8?B?L04vcDRqS3hHUGNqSzVyMWd5SnlXT1dOTXhTUytiNklTTTBFS0VmV0sySlI4?=
 =?utf-8?B?NGFYb3JUZmtxNnl2T3FWSDZGY0ltVGhmbnZ1ODdybzlxZXBtbEZDZDE4a1JC?=
 =?utf-8?B?OVRBSUQxRlduWVlpWWs1TTZlaDJVV1ozSGpldlM3aEE5UWFYM05GQ3V4dk5T?=
 =?utf-8?B?QWpodjBPa1VtcXg3Nk5ONFVLd2hjWC9mUFdSYkFEaG4ycVZwYjVNRldnTVJK?=
 =?utf-8?B?bnhHYWpSL3FkeE04bHFmUk0yeVNKN2wxbEdDWU94WVNibGN5ZGtadEpuS2Nq?=
 =?utf-8?B?aU0xK0E4S0dVUVVuYjRyTGVUN2V5WjZOcExPU2wxTlkwUzlpR2hkcHYzcWoz?=
 =?utf-8?B?K0JGSzg3V2V2Q1J3enVEMVhzOW9WRllYM051cS82STUxbE94czQ3dzB3VVY4?=
 =?utf-8?B?eG5oaU1BaWZKUzBMVmNVaThsMkFrQnlJN2MvdmZvTXJheGJPSDBINnlTaWk1?=
 =?utf-8?B?Zll1WFNIQURkZVRJUmUvZ3lzUFJ5eWpUMjRqajUvd3FLZTBQTUQzSldiL0Za?=
 =?utf-8?B?NUFmZFZ0TFBGUGtHTHdpUHF5dWV4QnJva0FScVRUeGIrbDVWQnlEMkZRcDdM?=
 =?utf-8?B?VnIxL1U2SGlSM20xc2c3ZjYxZE1qUHZ3NkQ5bGIzM29WRmtPd0JUVWsraVY4?=
 =?utf-8?B?dlg5cGRYQ3JyTUZGeWE2UUExUnE2cVl2WmZtYlBvaG1HZDVVd3puTjVyd3pn?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b050f2-607f-425e-76af-08dd45aeb980
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 06:31:29.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIPMaqfmbWuXi4UyY/LOfHUfB76w92OU1NBfDzbsCDC9vukxxV7S3kWHphesm3aoUpgOMb3d+9AJn5yIBsQlxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-OriginatorOrg: intel.com



On 2/4/2025 9:50 PM, Anisse Astier wrote:
> 
> Thanks for the update, and the Reported-by tag.
> 
> Does this patch mean you got confirmation that the scan tests firmware images will stay restricted to Intel customers with an NDA?

On the contrary, Intel is making the images publicly available. 
A new section has been added towards the end of the page[1], allowing anyone to download the images without requiring an NDA.


Jithu


[1] https://intel.com/InFieldScan

