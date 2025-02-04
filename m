Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E132054E3;
	Tue,  4 Feb 2025 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738703424; cv=fail; b=YDtFHz/zQUg3KhKsv1dtLfITIvLMHhyqDK3pA7rP0PaUglwtabZqkPeanWI2wQgzof2deOXfi8CzSyzB+zkE8HpY6gXNXQEEDJ3AJdou0PN9OXF1KB+MPerJ65nFsP2H6bVKtMfyMHGMu2f39nbT1xS9NZn0nw23bigyzSfOVK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738703424; c=relaxed/simple;
	bh=BVHH3rJSMwd7yqMFplklmmln45q0iVqoa/JaexNRPVg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IImIgGUQARZLV18s9QsXPHDYvo1t6OmhWjYNtsaanI5tI+7SF/EXAp23Mkp4YzHJvxzeef0ByVfr/UFZYNUO2tc4kZY0uzb/ynCxsesFxA8+eAuc2xzFB5Dyc+L8xkbG5C+IA4tBbaV4hsuHVjqWUYsuNNlKWljbp4C973n+dEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAnDHgUB; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAnDHgUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738703423; x=1770239423;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BVHH3rJSMwd7yqMFplklmmln45q0iVqoa/JaexNRPVg=;
  b=JAnDHgUBhvDCTuXjBjf8vHy7dAiEJ3p9B+KKJYdJBtkR/UCxyFyf8aCL
   6r2vOtDXiiS62Q9CJa0hOdO8F7IAPmdIdn219F/0kWxJN6E7rkwP8aiDz
   aJmcepZxd88EPPEge43D+8e/GiYqZzgFcfbP9U12khKw31mT68xH7uD0Q
   AjEAyQ0EEjyKdEPyxuswDBppxVP4hPhutIjebdZjDfrx4z/LptI3sgE4a
   fvl10+1At6cDlCc+FjUEV/xHiRY9e6iVxLf0PrhCv6tlhfbJ0SYI1qRjw
   w58NVEwSeHiYoVeIOCFhASO/jikHzidrn1ATgS3FNo9/1hy+QYXMAMvWn
   Q==;
X-CSE-ConnectionGUID: lUqE1Z+9Re+5aThfvs2SiQ==
X-CSE-MsgGUID: FbMq/9o5RFy/mJY2agsjGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38483130"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38483130"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 13:10:22 -0800
X-CSE-ConnectionGUID: yf2BdLGpRaOnZm1uWJJ6ZQ==
X-CSE-MsgGUID: X8Ov0G12QEOg6Rf1n15CKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141586330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 13:10:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 13:10:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 13:10:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 13:10:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF5llwMY6A4XW1wGQ0T2Vh69zy9FghgTTFlTvu0R1U0xtvB08iLoolUH+vAU/liTIr9k/pYLWEW1qZ2rrFfsvoZly8pObKAMu92k9uEu2lFExGAEifc6rIWfOavwhXJCBPpYDNKQk+cmNGjwJ/1bhOAvxWAN7GSvuDK9pNWDJp/wYwppbGM+GNZEi9j+hYp9Yjma6JqcUVu2sITIh8tC6gwpuJWKr3GyAtxhNO7Skhtp4s6Yf6d4ywUUUr5lGzGrBTBVU/qCdZ74hYBCVk6t17rQIV6AbmB1f26CLMakAQ2otJoOR8+7NE3PsoY8vsC6GRzesyq+FUUl/hDjANm2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+CeOi13oULxMAbs1z6xbKLXp/FHbN3rQeq7wzq3aPGw=;
 b=FPVupQp9ojlJYha81qGE/D1GD/IdZqEFT+fC4eyKdcVT/SVi3CI8rPVcfyhvI5N5pZwV6ivbPK8Fnl3CThiv65kWHpkTh2IOpUEeYgA2aYZAPvOYlah8pkcVdu5bVJST9H7By+fd/3dz14hqGK6Y1599TpNWMV3jSrHN+Uvrl88UTJbTB4zzpTYpqro3+QQLr6FJrkY5eesCk+jnkRbBJpyRBVbgESed6c7ACisK7QRtjg8htfKAtUyPNAGYZszgyBZzMMrw/tYYvVHQG7zL94Z8JrmZelO6j4N4OGaoqhddvjUlaz3UVDm90xDWd5g4yvNBMw9CZHJVWpfCVOxmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 21:10:07 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 21:10:07 +0000
Message-ID: <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
Date: Tue, 4 Feb 2025 13:10:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation with image
 download path
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <tony.luck@intel.com>,
	<ashok.raj.linux@gmail.com>, <anisse@astier.eu>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
 <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a31314-cdc2-4bdc-f528-08dd45604d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkU5Vk1hbHZDK3pwc2RzeG5GcGhVZzEzUmExa2tLSXNjVjJQL2dQbW00VXFp?=
 =?utf-8?B?a3dEcVlDMUlBVlNNdW5Vd25hdU9CTnh4V3Z3dkRaLzFXV2lOR2U0VUQwQThG?=
 =?utf-8?B?eHF3QlRaL1lCODNiUDNyYjY3NzNudHJqVlFaQk1rbW0yaHdEQkh3d1BVNE45?=
 =?utf-8?B?eXNMNlFXei8yN0xGWlkyT0FleHFEVWJyVTRIM0svWEJqWXoxckxPSzByeU9s?=
 =?utf-8?B?Vit0WS96aUZJSDdEekpGQmtpQldqR2FvcTNabmJXWUp1dXY3R0VaVEZsZm8x?=
 =?utf-8?B?TzBDOHB2LzdDQ1grQ1V0eHJtZ0xIR0d3azFQVWZWbUdKaS9VNkh3ZCtMOE81?=
 =?utf-8?B?aVl6SFlKN0lKcXRvbW9UYVA4dWNIeEpuUTZjMzNKOXRoTjdBMFNEdVg5Y3Ri?=
 =?utf-8?B?T3FXalNGTjZ2bVlzRjI2RkE1RlRMcjdKcGhHZHhxQ1JYN1FGMXdPdnIvaGZX?=
 =?utf-8?B?a3A0Y1hwbXFCazU3VmU0MXRZY2dWU3VlTGVHckFDRUc5dEx4Yit6VW1TNUdE?=
 =?utf-8?B?NDU5YnVxQXZQNS9XL2FWWmIrTXRPOTlwbmlBalBRVS9CRDQzbGZ2ZW1YYld2?=
 =?utf-8?B?dFFwNzhnMXp5UndHYmxmc2FsUERmZFpwQVArZDJRZGxucnFMRFBpN00xODdt?=
 =?utf-8?B?aWsxS3pOS3RmNHVpV3d4dEhkcTl0Z3FOOFRJRGlQMmlwUkRnVTVqalExN3ZD?=
 =?utf-8?B?RkpPZlFKdkIyUU5iS2dTeFRwRkltNE9VUlZCaEJKbFdEOTdqQTZ0c09rZkR5?=
 =?utf-8?B?dEpnTCt5TGg4dld3L0x6T0dCWG5NVlpnWC90aDdJdkQzQmF6OHdpQWRnNTFD?=
 =?utf-8?B?WUEwVkRRVEFBcUp4NHJEZHo1S2FhVnh5WmQ5WGxIeU1QRy9KSlduUGgrcllU?=
 =?utf-8?B?bVVlVzgyWHFZYmtsaHhBLzJ1WkhpT3YrcTN1Tm5FODNtWHJ4OUZOSzNaZk1p?=
 =?utf-8?B?OVFEUDE3YTVKbVJneDVVaUpEMks1K05xT1NBdEFRekRKT3c0QndJZ1REUjJz?=
 =?utf-8?B?T0tCZnZTYWtPaXFhNFR5ZElWOTVXZ3R5SmtnUWRRUVVLVDdzQ0NvMTRxM0I1?=
 =?utf-8?B?TFdEYmlQNjAvTSszckRiUmgrQzZGSDBJQ3dBeG4yQnRkMWZXRnowOGxacDZG?=
 =?utf-8?B?VllWUzQrb0NyWWtMYTY2VjBXN3lua0xxRi9UOUFJNk1BQlFjRDF2WXVodS9M?=
 =?utf-8?B?WHZIZ2F3cnVqeWF4MkxaWTVYTnRoZzBoVkVySnVtZXVPTWJIMC92dlJjdXhV?=
 =?utf-8?B?REhjK1pBd0llSU1Ud3IzY3Q5Y0I0WEQ4cHpEakxWZENDOGdwVU5pTFI5ZkJX?=
 =?utf-8?B?bStqMGpQaTVuNHFCTTJUbEZORWZMZUZMRnZKb1luc01KbGVobEQrVlI2anVr?=
 =?utf-8?B?LzVkV2RuUzFoaFh3eW9QOGVqcGlKaUU4WW9adlJZS3dsdU5UZ1FiQTJRa1Yr?=
 =?utf-8?B?VXV6cEZ5R3duRjVLNnZOamlncVhUSVF3UFRwcGR6anFzR1c3M25sQkNHdTJ3?=
 =?utf-8?B?V2Y3b2lSRHNmMThwWkNuK29MQndxVi9ZVkNEbmVlUEw0bnJLUmdjQzRTZzFW?=
 =?utf-8?B?c2NQWXV6WUtGLzFzK0tpWnlrTHhwK3paRmtja1FXeUxuSFErRGFYRlN2dGl3?=
 =?utf-8?B?dHlhVDZhOFNrNjVCUmdLUm4wd1N0QWRzTysrdllaaGFNeUpneWRLc0RMSW9U?=
 =?utf-8?B?U1g1eXNoYmJHSlJhUkI5eVhBVGN5bHRFYmFzZlgzTWFVblpadHJkTy8yWXha?=
 =?utf-8?B?VzlDZm5za2haSlJBcHdSalFxbkFUZCs2UXNMMzFBS0RObk0yUWJLOU5lTEs1?=
 =?utf-8?B?ME1xRWdIMjVMT1o3NXFoaVZiMytaMmREL2FLdUpkS2pLVzJTbEdzL1k0eGpl?=
 =?utf-8?Q?F5iP+XvCtkpwX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjBDTFVVSHl0OWkxVzUxVnJRQXp4bGVLYUZrYnB0OG1TRWg5ZmxKTC9SSDZX?=
 =?utf-8?B?R0labit0UjAyTlhseThDU2thSUxwVkorNnNWWk5NelkxKzNzTmY2VlpuQzd0?=
 =?utf-8?B?bUdvZGRXNndWUWhCWXRIRkcyMVhIQVRsZGh3NUlFaFVUTlIwSDNaWVZqTXlk?=
 =?utf-8?B?RHMzWGFWNisyOWJncU1mUGlKZENGZkkzMWtyRjdVVkVLRkpseG5vV2w4eUgv?=
 =?utf-8?B?cHNlMjVYQkFnVStrUDlzSEl2UWg2MG15bms2ZHBTNS9nbTZVVmRpQ0ZIWlpu?=
 =?utf-8?B?YjdGY1BvMlNRMTY1c255TWJ1Ym9aWVl1bTlpWUJLbDF1c2YyVTRsOXhJOFBX?=
 =?utf-8?B?TGVrTEhKOUo4aGRUOFZVdUJQV1FJbHhFWFI5MUtMYTNQVlRvazk1QTFycUkw?=
 =?utf-8?B?UjFqblBQNDVsSmx5V2w5SGU5WURNdmtjYUpaWHF3dW9lclE2Qjh4Q0Faa1dJ?=
 =?utf-8?B?Wk5LQ3BLT2FMdFBaWm8rdlpCZ0cyNlpZdFhCWXBlWUcrM0hJdTJEaUJQRzVs?=
 =?utf-8?B?aTdJRmJRMzRtUHB4TzJDS3R4MVVzcGFiNU5sWFptK3FIMGZITi9BUS9GVmI4?=
 =?utf-8?B?U3pnbEJIeDZBejFjU3FSdlllUXU0UytCRjlneXV4dWwraTZ4NEdKL3FhM0NL?=
 =?utf-8?B?YW50T1NNc2hLbFk2RHR1Zmwyb0x4QW15QTdQazZHZVZSMDVqYkhtOE5BdUxU?=
 =?utf-8?B?akIwc2VvSytiZ0psREczU0J5OVNQQzNRQmxud2taY1ZVdDVJVFBIN3dTYjdw?=
 =?utf-8?B?QkVBaVBqeUhCRkFCaHBEYkl2NEZtQ21CQ3MrVS9BNCsrVWF1MjFMWldOeWgr?=
 =?utf-8?B?bm9qN2hBSktySEc2RFNRTG9aM05VZnd4UnhLYzJUb3A4RUQ3T3RQYU1sRmVa?=
 =?utf-8?B?YVhTaVgrK1FtbDlBSG9FV1ZvZVJraVJWbytHOUhLVmNuc1NkNFVVSmQ4SFRR?=
 =?utf-8?B?S2I5eG9lNjZWL085djQrTmNxVDVlR1M4RU1tVnpQcktmbGQzSmdabUlNLy9v?=
 =?utf-8?B?NllpN3BKWDBZN2hYM0N5d0hnWVdEZEp5R01vUWZ2cGM1eVRqMmxXMTVwZlJi?=
 =?utf-8?B?ZGRhUUtYazVDeGZvL1NhY3VGV2JmYjR1TXdFQXBJbTY4UjMrZ1hKSU5ScFpD?=
 =?utf-8?B?VldJUFFUOGc1d2ZHSmNIZWk5bEViTUg1MmYwaGl6bS9oWDA2QnExOXRGK3gy?=
 =?utf-8?B?Y0hGM0tpRUo0SFVkL2g5L0EwMlZkaXZMc2Z3b2ZZZTJaZFJMOWdCcm5Oc2Fx?=
 =?utf-8?B?cVEzNHFVZlg0R2dmTjRqc3RFaTlXNGlXNy96eEMxSzQ5cWE1eDNSR3JyVG5k?=
 =?utf-8?B?SDMyblpzbEU3Z25TRTJHcGN1bWVWTHVPSXBETkpuUkhJUWJNQ3dSY2wweXYz?=
 =?utf-8?B?Y2pQclpEaDlyY0Rjb1BkSkM4Q0FFR0R6Mk9SUXpVZ1kzdWJSVERvdDNrQ0Z1?=
 =?utf-8?B?MnNsSmRUUktsUEJORjZERWJGNS9JSWRPMC9CWlczbkZCOFlrbjF6S1FVdWhp?=
 =?utf-8?B?dU01ZVZnOWdvVUcvbzhLTUx0d2Y5VzMwTllWbzBia0JNbE15MzVtWnFBZ2Iz?=
 =?utf-8?B?UmFLMm1HZG9ER3kwQjluUzVEUXlxbzJMZHcvMCsraVFFRnVPSTd0UUZJSWNQ?=
 =?utf-8?B?WHJVcjEvTW5OM0ZlWG9EbzcrNmt3TWxLVFFBdHg1c1IvRmJvN2hQWGNLMnNm?=
 =?utf-8?B?T09PU0hJMFlGSFp6Z3gwOCtYQVhqMmFtYXdGMGcyQ016S3VRWHBCamt3K0dZ?=
 =?utf-8?B?Um0wQ2pSaHZlMDZ2ME9NRlBOWTQ4S2d5WWx1bVdRU0gzSTlrT21najJJZnZh?=
 =?utf-8?B?T0JMTTI2dGVkRWxyUGVoaC84VktoN3pSc1dPTisvU2JyTGRxS21CM3Vsbjh4?=
 =?utf-8?B?bTArekkwbTZLdG1tOGRyMTI3TDhpR3dYQnFUaDVwaWZCUjJoU2wyTnVlb3FL?=
 =?utf-8?B?L293RVp1ajJOUUhTb3RSSENnMWsrNmhCUmU0SjVpQURJdHk4T3dMc1V5VWVm?=
 =?utf-8?B?RWNBTWNNaU5YNzYvQnYvclAzVkZiVTVkczRHR1hYdEFGb2ZleHh6QXQ5T0ha?=
 =?utf-8?B?Y3BDeEVMdTB0Z0x2bUxnbThjbzJIL2VkNTgyMmI0ekRIN1JabGlBRWVIcEpk?=
 =?utf-8?Q?TIPIS2Ark6sA3IHeavUs6Dykb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a31314-cdc2-4bdc-f528-08dd45604d3f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 21:10:07.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqZ1VMKDNSIR2YKKnxYobJvP6DNh2kYQHnhirRd39tSF8rypYqKsA31ItazObJgWWnzLO4+4zo/RUbJE9I+tJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
X-OriginatorOrg: intel.com



On 2/4/2025 12:07 AM, Ilpo Järvinen wrote:
> On Fri, 31 Jan 2025, Jithu Joseph wrote:
> 
>> The documentation previously listed the path to download In Field Scan
>> (IFS) test images as "TBD".
>>
>> Update the documentation to include the correct image download location.
>> Also move the download link to the appropriate section within the doc.
>>
>> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> 
> I've applied this patch into the fixes branch with Anisse added as
> Reported-by.

Thank you, Anisse,  for reporting this, and apologies for missing the Reported-by tag.

Thanks Ilpo for taking the patch and Tony for your inputs on how to go about this.

> 
> Thanks Anisse for raising this issue and Jithu for getting the gears 
> moving to provide an useful resolution.
> 

Jithu
