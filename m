Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199E4C83;
	Wed, 25 Jun 2025 04:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825143; cv=fail; b=u1VQtpqfc5YvKkN7ivaKwOh17uMU0AHMOoxcBaKyvBgrD5l9luCLu0WPIgkPDWyPGi+7EWcmgW9PFugSoh++VKPnOA2j1pLY2T1UYdmDyV3Z4hV5KGhD8/9qrYpagtUnDVEodXY2OfMKG34aMc2QeiFdEpOW7Zg4z8cpVJGufGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825143; c=relaxed/simple;
	bh=YWe/HD7vNY/p0LVGnHjggGF733wcxHQ/X1n5F2MG+Js=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r2V0ov0uOlDNBb+7NH7kNItgGaFabqQeWexIqttvoA/0YJBJ9VsJUPDJKcGzFnfEqE/CNV76fKuqveFBwKwC5/IwdXmKMizPqa8BnzH4/hQVmJ3VJbSYDgQvWASW7wciXPDC6zwB3ccGaVgPu2IUG+XM3Xy1QOA0rsslgV7oXJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6HpNVO+; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6HpNVO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750825142; x=1782361142;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YWe/HD7vNY/p0LVGnHjggGF733wcxHQ/X1n5F2MG+Js=;
  b=c6HpNVO+2YrK0hdzH3jcEdRbNzWcq+17yPO4fAoh0ftSLTN76h511QUq
   FL9wwnR6yFQ5OnKjL9p+PbgX+25H1sCc1xjjc/EZLfQ9TjgJmQ+08YkQR
   g93+0wnSbJ3bZVlHzoHWJe/LNnWPJKJgkfY9atyfFBumvWKXbKosavjrB
   hUlvWOC/p2GQIvDkZfO7tqhRtzjDG/72hSRrRyWPcSdw7nq8kgTy6oplj
   dgBaRC54UJWJ9Fm8IneNy7/XmyoDhVMILhUASCoVdPMqfjBZ6/0d+z1wV
   TBTGHoZ7Qcehh6E8ucQZow493QxW6qqvlYhm3nTdPqqqCkc1nDNOrc+ip
   g==;
X-CSE-ConnectionGUID: TTH4kwo0QieAkWQw2S63sQ==
X-CSE-MsgGUID: Q1/GEmdFRVmnMycUtUOlkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63342563"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63342563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:19:01 -0700
X-CSE-ConnectionGUID: kirnyJZhRHSo3pIGeBiJhQ==
X-CSE-MsgGUID: FciDS6x3QCOnJpCsdFIWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="175744444"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:19:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:18:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 21:18:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAtbZiYaBWtK3G8thJAloK2Hxcx75PTEHkakfXq0k3ffd3+nG1cbGq+7QbMcz2dzhelbm9pBmdHm71SzlXj8JOeQ0DTpMQykRI2TawX3mdgOzm1Vw1bSvkMdu1zdxe8aFljoFjXf4cI+x1t5rpKh77Idi6Z3ZeaEaaVuiDY02U6bdvUWUK6y9AfuCJ2hP4tv2Zc0atK4GZntVJgk/JR/d+YjOBwua07uQ4tFEaPcmauyfwzny51CpmLTtPK8tqPwFghMt0lQEBilNXc8GKNoRMy4RZXT2Q3xMr+oE3SjGYte7zIGRnukd9PUwzhtpFhPEAa9ZZfSHgUOS5YkDneVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZK5Jo3wnplvOh1jAa/IeWxfvQ6wIvkBUnqUSOdjZgY=;
 b=Zj+YW8a4StlhDXxjN3bob2yo93M9W4o0VDaxllXuOMcUl4onbWMWl7VoTi9fGjBDO0ieW5ZN4Bgs4TYVEnrZe7O+gsMdrol7iZkTiOzk1yfpb56GMrALaluv48/gKYHJjO5vsdh2Zm/dEPVW0d3UQBDD/5mZE5etE6V+9b6xFoQr5/eB12TE4cx9iU0Qr6L5Ffs1YP5yf7pdOxm0HH0QKv8d0UFh/uClW8iVfKIlQewPcorH87HBtKvmCwNvdjeieKhP0/jrJubJ2UKW6m53TaHIM2t5WCVUgc77pDWUYM9E5mCwWtYUO/DJXLbib2Cg61hpx77ovXFrY9IKRePGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 04:18:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 04:18:27 +0000
Message-ID: <918e2679-9778-44ea-9755-270658578f76@intel.com>
Date: Tue, 24 Jun 2025 21:18:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 21/32] fs/resctrl: Pass entire struct rdtgroup rather
 than passing individual members
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
 <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <84e5cffb2b3f8088f77781babe89b0cab513ed79.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:303:2a::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: f31a93d5-72bc-40aa-36fc-08ddb39f5566
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDA5VDVtMThtMXNwVnNXQnlxSTFRZjkvNXVDbExONkpXaFkvVU16VUpveUVX?=
 =?utf-8?B?Y1lOcjFCazBBZGRLbE9XZEdteVE1YmFBK25scUhNdFcrWk1xNDhoaTkzbW0w?=
 =?utf-8?B?Vm5FQm05MWw5c3dndm55OUxKbkNycWpxeEpNY01HNFo5VDZPR0ZHaVhyQkxx?=
 =?utf-8?B?Z1pzVlZoeXJadkthU2w2UTFDaUpvVmlWbWNhNEEvcjA3ejRWUnNNVFkyOHEy?=
 =?utf-8?B?UVFvbFZheDF3NU94RnU3SFloNktCd05PM1Q2dXhmLzRjendkL3RTUVJpTnB6?=
 =?utf-8?B?TGt5TnNaSkhkaXo0MlcxMlVObmFpM2UzcUtqYm42RFl6dHc2cVppWU5pTTdy?=
 =?utf-8?B?RWZqVlB4b3JWVU9uWDg5WGhkVnlpcXg0V0k0UkNDWlU2dmtYdGFESmY2MlJY?=
 =?utf-8?B?cEdMMkxlSnpkTmdaTytnSVc5RDQ1TW1mWlRySUFXYVFselNkS1V5Qi9RL1pm?=
 =?utf-8?B?NVJsZXhPUWhxNzBKKzAvY0g1c1RxSUFjb1hWd1N1MGNhT3UvWWlOTGNqejVF?=
 =?utf-8?B?ZHMzaWRBSnQ0SHlZcW5UZHhycjIyTWdkdzNmbHpDeHE4M2Y4Z2pSb3N6bVJ1?=
 =?utf-8?B?Q3U3a3B3UE5zVUtZS1ZSL080b05Fa0dObCt1RUlQTHZLNFlXVG8rRENkVUdT?=
 =?utf-8?B?SERyakVxUy93ZWZxcmZtWHJ3UkpkSGdoMEY0YWdqR0c3VCtBNjM0MVgxYXdW?=
 =?utf-8?B?cUR2S1BvYlBnMDZtM1ljbVM2WTZ1ZnpHQWZlVFl0L29aU0V1Z2xpRkNGSkxD?=
 =?utf-8?B?dmkzTU8xUGRiTnJjTEVpOXJmNkF2U09YanJERUV1VUVZcUVybG5oVHVOQXFN?=
 =?utf-8?B?SFFteG5VRXNwOVFlakVnWkRUNFJYUVJpVGpRaWZGWlI4N3ZlM294YkZ0Q3R1?=
 =?utf-8?B?S2VqYW01SG1MVW5SZW5xa0pNbld0cWpmdzdBendiczJESWtINWRnT1hQUng5?=
 =?utf-8?B?L3lzZFlIRXhCbEhNMXc3bXdYSFQxd05BWjJCNURMSDE1YUtwem9XTDU0KzRF?=
 =?utf-8?B?NnNGd2JSNlVNcFlDWFE3ZE1QeHJlTDg5VG5GbkE1VCs4d1o5bGU4UXM2d0ZQ?=
 =?utf-8?B?cGtTeEdYZEFIOU9IT1NhcXE5RG1WVllvR1FzWFZ4cGIrL0dOMEpneldnbjBV?=
 =?utf-8?B?cklQYXVzRDFUNEpudU80ODZIZDFaU3FLTi9QUEpjZkFXWUMvY0lZQ3kxeGV5?=
 =?utf-8?B?U0J4aGhTemdWZGVmY2lzei9hSGMrVVdBL2tJTSt5ZHpzN0JzWitWVUtGU3BK?=
 =?utf-8?B?dlovdGJUdjBHSGZJQ2pMSm5HalF3WUhHRytJbDBEbmxQNkl2UWxqYW1XVGJy?=
 =?utf-8?B?L3ppbnpVQkhZUlp1RURaVmRtZWtCVTh4d1JaU0NJYnRzOUlFT1k5RnVtYXVO?=
 =?utf-8?B?U2NNVE5xN081UlRCOHlIMGZOeWVLUk1rejgrMGZLUFMwaDJsM3lHTElGelpE?=
 =?utf-8?B?WitYVHFxMEg0Q1R6UmU5NW1oaXpleEN4QjNHb1VQMGI1cmM3ZmFnWXhTbzJ2?=
 =?utf-8?B?NzdyZE5uUHMzWEx0WFh5T0wxQW9YeVRsV1QvZGdJWkhiclAyUDVlVUt4cmk4?=
 =?utf-8?B?b2NjWlNXdWZoMGNIMHZMNzdJVmtMNHpzNm5MTU1QZEZuM3RubnhMVGZvdHoz?=
 =?utf-8?B?OG44N25hNnZtemt5RFZyYjFiaVVKOWF4cVBhY1NnazFnUGsxOHlSVXFCcmFr?=
 =?utf-8?B?aHdhaEdKL2NHNHBEV3J1aEd6R1g0R0tZbWZSZnJZZTVkRWhEMklvMUI2OHJB?=
 =?utf-8?B?RGhIN1lURDQ1OEdObTk0SHp1Y2RHNENUaFlWUXU4YW9EZmFGOGpCc0hMVVVF?=
 =?utf-8?B?bHV6RCt3WlBjbVdHRUY0NGpTZkRRc2Y4YUFicWlRUnFOeDU0VjkyVTRVMnJq?=
 =?utf-8?B?aURGTXhLOHZLLzBHelM4NVo5Z0pOaVJHYXl3L0NjU21veXg5UkdoRUd3ZllD?=
 =?utf-8?Q?4NujT1hrbnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlQMmFMYTJtRk9jbmU4UUlKczcrai95QUxiYTF6cjJDb2xDeVhyVzBUckRt?=
 =?utf-8?B?TVRIU3h3YUliSVp2Y0JtM3l2RmtzaVNKQTVvV1pPRFo4aGxzT2I2WTZGZy9D?=
 =?utf-8?B?MldlK1pXVFdpNjQzZ3NHUDRsTHlYa0EyVWlmUHhHZ0JYZ3gwYndKNnU3bmZB?=
 =?utf-8?B?bTJxem1wZnBkbXlldmxIT2hRbnJZc0N5TjNlalRzQThRRVVWUXBqbnd1RHFw?=
 =?utf-8?B?bjdYR3pUL1IzQnI0SUxMZ2pEc1V4SXJwajdmcVJNb0R1c0VBZ3hOSW5MamJm?=
 =?utf-8?B?ZWszblBrN3VRM3FGRFAyOVFPRFR2cUZiVGxDck4wdzdwNDQycTlpRFVXWm1z?=
 =?utf-8?B?TjM5K1IyNDJBK1dqRG1ueTNWT2E0b2VNT3p2SHI0VHNaTmJ5MER1NDNVMUZM?=
 =?utf-8?B?ZmsxM21VRFV3enpvazArR0xXUDVsWk1pR1BmZjdtMTZXM2FaU1Q2ckkvczc3?=
 =?utf-8?B?K20yOG5FTmFCMTllNDMwMk02ckYzTU03WElyR1BDSVh1aFNqOXU3SHFnUmNt?=
 =?utf-8?B?bU0waEh5N2hBekhzUHBObmRCTlFCaEhpcjhmd2dPc1NmSVhSQmkxdEVTcldv?=
 =?utf-8?B?VU00bU94b2djWlRjS29McGVqbVIrdVFNUExhbllVRzZNZlh0VE90aEFkU1ZZ?=
 =?utf-8?B?WXdiNjN0a3h4UTNvQTB2cHZFSURFbThwdnc5UTUweW5MRVF2dUg3VU9JSkFH?=
 =?utf-8?B?TFk0YTNHOUpqaGFFbTY3WTdNOFlURFdnaGJsVktrRXZZSWZCd0VxS2hrZ1FZ?=
 =?utf-8?B?WmxacnJROTROVGxmU2xRd3JzSm9XUmNZUWNQcnFaeW9CU3NuZzhXSVFjWFdT?=
 =?utf-8?B?Ym1ZSXdybTNicmFKVlI3KzZSMm4xeHVjazU4eDJOTVBIa0RRSmpiQUtOZWtW?=
 =?utf-8?B?OW5UZVRjQ1R0a0swd3QxRms0YVJtN1VBT09Ecll6aUZGOUtzMDlQeHlPNmVY?=
 =?utf-8?B?eGQxZjgvRnRXdXI3ZllRR1F1VWtpM3JTckc4ekJNeUhKVGxCRG5pZUNXSy8w?=
 =?utf-8?B?SGx1eit5bmlrbDZZL3ZYUlUzTmhEaHE4WXZyaVNadUpoL0E2eUFVSUVVdExt?=
 =?utf-8?B?MktocG9aTzZwcnZLS0lOaWd3NVlZVXVUTkIyY1NEdnhoQnpHMXIybjJoZTNR?=
 =?utf-8?B?WmN0b1hsc2hUS1dxZzZZUk1jcEUvdVpwVjlpNS9hdG83UzFPWXB5MHhGYVFL?=
 =?utf-8?B?dFNIRTZVZ2FGcnNjRHk1Q2lXbnNxb3ZuRVBQVzdqZlE1RWpOU1hSR0x2VE5C?=
 =?utf-8?B?WHJFMEJsR214Mkw2R1c0UUcva2diZmc2UTRWajBlcER6M3V4YjZHS29QTGlw?=
 =?utf-8?B?eXlDNkNTdHJzWFpLRWlTcm9hWU5CMjN5T0dLeFRZMVFCZTRWZUlhd3hDSFBw?=
 =?utf-8?B?MzlMb3ptWS9sWFdSdHFXeStSUXJ1WndvdzF0YSt6OFNDYXg0WTMxVUQ3YzMy?=
 =?utf-8?B?ZHg2Y2wzV0JJYWhDaHEyR3BQZDFrV1R1TlhlaVNEM2kwNnBkdWd3RU1xdTF0?=
 =?utf-8?B?WWRQWEIrK2xQK25WUXpwdFVlQ2tjSFErd29HN0tPc3FiNEduYndxVkFjNktU?=
 =?utf-8?B?bGY1M0RhMmZCRm8xMXpDTnYzZmw5QmNFQzBNMGd0blprMUpETUpnUnhXUVJ1?=
 =?utf-8?B?c1RHSjJSeVhoK3lvb0Q0dzFXSy8rckQwS1d4VUxoblZvS1hnMmcvWmdDblBQ?=
 =?utf-8?B?TGsyNFk4elRTNlFDUHRvWFBRZlU5R0FkS0Y1VUNsMmp5ai9hZ2JVZkRIc2xU?=
 =?utf-8?B?M3VDSmlWOEVZc25Rbzl3emptVk5MOVFiQjh5WVFmdDNnZHFpVE1QMFY0RHBP?=
 =?utf-8?B?Zk03cWtHcnhBaGZTMk9zT3c3NG0yRVlsaXlIcGtBR1FiTEpjSllPVnpVMjA5?=
 =?utf-8?B?QUVoTjR6TmU5WWRZdExNNFJOZlJ3WjB4aWFWUWxhS2tha3AxNmUza1ZIYkUz?=
 =?utf-8?B?Z0NuS0U0c0JoMkdjVUJ4MjVUNlNDSllQVEhSVStENGpZYTJhZzk4TkFMYm84?=
 =?utf-8?B?emR6YTU5aFF3VGdoQ1FaeDdubElyUnZtbi9ZTUtzUHdnbytTdDRCSkdnUmd5?=
 =?utf-8?B?WHU5NU81dTlRb3V1bmZ0d0RHVC9aWjNEcVp4aTBacEtLYkVJS2Rxb0twNWo4?=
 =?utf-8?B?VERWTU5HUC9JblB2VmRBd2JkYUJ3elJLanJma3NEWFFPdFFacHFpcFpLcW9k?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f31a93d5-72bc-40aa-36fc-08ddb39f5566
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:18:27.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOjeZjXeCdYINV6iVi4cD2Xp1HPIgG7q0ZWA1UlHxR0DnVqUFViYhvKgPVwRHPGOq4WYu33xcDKQT3FH3s0t+q6fsROhQrYsvL+hM92PgLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> Reading the monitoring data requires RMID, CLOSID, and event ID, among
> other parameters. These are passed individually, resulting in architecture

It is not clear how "event ID" and "other parameters" are relevant to this
change since (in this context) it is only RMID and CLOSID that can be
found in rdtgroup.

> specific function calls.

Could you please elaborate what you meant with: "These are passed individually,
resulting in architecture specific function calls."?

> 
> Passing the pointer to the full rdtgroup structure simplifies access to
> these parameters.
> 
> Additionally, when "mbm_event" mode is enabled, a counter ID is required
> to read the event. The counter ID is obtained through mbm_cntr_get(),
> which expects a struct rdtgroup pointer.
> 
> Refactor the code to pass a pointer to struct rdtgroup instead of
> individual members in preparation for this requirement.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

Reinette
