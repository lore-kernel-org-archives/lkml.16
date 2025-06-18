Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B501E0DFE;
	Wed, 18 Jun 2025 04:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219438; cv=fail; b=tbJo+hYfJ1posu8v9cPQe9O01w3+nklYQSy7wRkGzjvTJjKYiT51jwrnVi6lTgsSh/q8i2qjJEAew3+iaEEls99/kn3GrFj/ETTI95/B5dOjRsMQz1vt2jhNMp9E1ON9RMGy+Q1QZG5bax4pNRoLANrwSe/bJJDgcX5dCye1Yto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219438; c=relaxed/simple;
	bh=gjn85AJuchiiFWyQGHrXmVbCESWVfz7LSSsne+C7vHg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nO86wjJIeV19mNvHWwydwSMoo6zqwXEEkA5feV7GnhMUmJTcrQKqsrKBqWOiI5EhbJuzqsSqvYAw1suBB02vson4YqkJ0rQYj6AqgPsvu0+cbhUbsuVBTPHUX9q4KPZTMIJmhBImhsdE6V4l/51LgKPMsrlX78b3UnYqvH1KDeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NR59oJvT; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NR59oJvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750219436; x=1781755436;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gjn85AJuchiiFWyQGHrXmVbCESWVfz7LSSsne+C7vHg=;
  b=NR59oJvT9Z6CrDqsBOpdZ6VXoSx/30sr8PDtCfmdDbFTf24N9HvpFdNB
   FiqWrZC166PlmvP4FKMV3X1N0ji9VSu6GMSH8OvV94ehO2BaB8BphZftZ
   KOemyLKAHZVawDUg3jVGVCF/8OryOplihmHfEPkWj6xkF9ikAkhq4G7yE
   lrByAYKFpf8eQHqJJYfk71o94viXvOt5YUbzxCze8XT1i3ywGMPOGYSUX
   ZPJi5Y/tcIkAItrj+etZ7tQeTnUa5BjgDxGzYVrRcxng6bJRJoPAWIalI
   K23fdzUMess63eGyM8A4rft2leGPV9QFWuBgniRODV5AqS0T3rSIc/jlv
   w==;
X-CSE-ConnectionGUID: x+epsFA1Rh6C32w+Vw+3mA==
X-CSE-MsgGUID: lhkLIuaeT+qK2TLGGZXJSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56095546"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56095546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:03:54 -0700
X-CSE-ConnectionGUID: iU6MKBoOTFCm003s9wMnFw==
X-CSE-MsgGUID: CcWULWKhRCqLpxH41KckMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154667930"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:03:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:03:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 21:03:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2XLBoIBpZzr4tsIxTslD0KDY1kk3RivQK7oZNKPM/TzuPt2zWKEEdKII+bOboCvv41uS4bJLfYu2eN1sfQko+9GGSBQLWYeakHLGvBQ/gulJBmSTWlq1q573g3wpI3wnOy0P8qlnkogZL+k8oB9s0CzPAa4yLcYG9dBaVXMK1m2jtwonkYzj+dv/C6DFoQZ88pjoH0ivnTSf7tF88Xa7zsQBBroxnvU6JpXxWpIlIC3FU4pZaljP28Xiq7hUgVzWF6Cb+q+5b8SAqyvbFpxMNfNjQ5VQwZcQv3uQYLEZccd40x3YajkI28msmOYGuoWLTr29oaGY2+g0auoSzhLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp4siYI71dkbo1H0gfNViDbz9On3jHr1RPh6/vwbl2g=;
 b=liQWUS9juUweR3yGK4WkfOKLNILUHfWubL9rYrmIdndnS1zkjvyPG1ixuVUf176zsU7ID5+IKhbIE+qBnPdm8a/nitAA10jbafyhh1mmJRjq3QGKJNFvnq8D1+IGyRe29Xh9GLr1yyy7alzHKAcdqiPW1ccraYztsHmbUG0CZCkUrHaCvEP//L1pECgcozS9ELLCKZyEXuOUz5OC9VwXg84mhkj2iYtxY3cfvD+NAsyj+/PWXpy+nUjxo9Deow2MQ3A0t608pcf39OHsHy/HNGAlheiAcIkOQl+EXQRaale0IGpDPfrtzMyLYnw7PlQmpS4FSEz7nIykJk6XvKVKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 04:03:48 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 04:03:48 +0000
Message-ID: <d6d469e0-b5ee-4e19-917e-a3bb4075fd27@intel.com>
Date: Tue, 17 Jun 2025 21:03:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc
 Capacity Bit Masks
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 992132b5-d2e9-4117-a283-08ddae1d20f4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUY1NFY1bXR6bHc4STFsSlpvaFhWcGtCa2JpREhuamVlNFhNb25tMk5QRHpK?=
 =?utf-8?B?TFBVaUp0WDQ4Zml4MUxlQ2xuTTdXRHBia1gxdUI0YlZBZGdLVTkzY2x0Wm8v?=
 =?utf-8?B?amJ3MnYvYVJ4dXNTZVpiMERvYWI5a0lGelVEZ2dlOW01R2QxL00wZS9vcWdR?=
 =?utf-8?B?K1BtQU12ZTdvMmZqMExGalFjdG12SituOGJVYmlacG96UlI2U1UzR0x2c0ZL?=
 =?utf-8?B?Y25veHF1R24zNm96eU1rcXRTVjlBTTNSTlV3dDNhTG11TG9EMWo5Uk1vZkdX?=
 =?utf-8?B?K0Q1bVczUmlnZGk4RlUxSXllZjZjajhHcS93Y3hXQ3lDb1llLzUrTysyZmpn?=
 =?utf-8?B?RlFiTFFibzlBY1hGS3A0QlFMR290aTNYRWw1YTJEQlRtUmhISkpZZTlqMmVY?=
 =?utf-8?B?eEdnaWkwczNiSDNZdUYvMXQ2Z0NvMm93QXNIazRFb0xKYXlqeGU2c29TV010?=
 =?utf-8?B?R2pLQTMzMS8rc28wVWxFcnl1SGVpaGFsZytyeUdtK1ZRTDlzVEFuemlwTHZu?=
 =?utf-8?B?a2o4Vk9PcWlZUUhNWHZ1MXRYWElCTEpPblNmanVZbndKRTBJMWVtOFBkT05P?=
 =?utf-8?B?NGI3TUtDdks0Y3Z0OFpybWZWaEFBU3NUclR4aExSNkJ1VytOeEtjZ3FGN2dt?=
 =?utf-8?B?ckMzZWUwSlZ5dk5mQmRlSENDNzYwczlwZXBnNXYyWjBRUDQvcEtGWmpoOFFa?=
 =?utf-8?B?QlVnNE5rWHpFZElSV2Jva1gzQ29OMFhINHV3RkVuWHhBa3c4ZkZwZDJ6cm04?=
 =?utf-8?B?UVNldE9tdVM0dDJISG45T0tudmJlQ0ZzRGNjZGc2S293cTVqMnpmVG0rdkho?=
 =?utf-8?B?UGJocFdwUzBOaE0yMTdVbTlhU3ZQTHd6VHlhVXpKUGJMaXF1OHdqckdjbzlz?=
 =?utf-8?B?bGVFbUFITytKbDJyMjZSNkZid2s1L1ZiRGFoMWEvNkxFaHhzWDZZM01IU3dh?=
 =?utf-8?B?WklLVkFUS0FqcTF6TFVGb0tjZUlWdzRzMWdBVEZkdllXRDM4VmYwZGJGV203?=
 =?utf-8?B?NHRGelpPTDM5aGJzbndvMjlQZ0I3RkY3STV2QWUydjdOUDJHRGtVK2JicGNk?=
 =?utf-8?B?eWFyL0ZMMWVIUlc2a3dMVzY2KzhLaW02bkNJeTE1L2lQWmZENU1BNDZxeU95?=
 =?utf-8?B?Ny9WRmxObmJYZTdSSm8rZDdlTTFFZlNDeW5rSWlXSmJsWDQycTI3bFVRaXlZ?=
 =?utf-8?B?NEYycWJHVHNESDQveCtVbWVxOXBPTW9lM2RvcVRIVnJ0ZjhrTzBod2ZnYVI3?=
 =?utf-8?B?ZDVGRnlJSldOTUFGUExrSGRpTGJWbVJhM1lWZjlZYXdaWnpKU0dFZklhUUIv?=
 =?utf-8?B?NmFkWW8xVk1XcGlRcE1EY2owVGw1MjYxS1phbUlsYXlicm4yZm1HM2hRL3U4?=
 =?utf-8?B?MGdMTkphSm5DQUlwcjFVYVc5MllhVUdmNWVjdEx3dVBLNktWanV4VnpmSXUv?=
 =?utf-8?B?Z1Q2aVI5YVBLVm9hQzVMSzN1QjVwUEVjejVhQVJLdXE2SFREQ2FvdFRqOHZG?=
 =?utf-8?B?YysvYy9LSVZQTjNqZzBPY2gxczkrMDV2WUN4eFZmRXpHbmVYTFAzMjcyUHZt?=
 =?utf-8?B?MHlzbkU5U3ZVVytYdjJnR0ZIenFxL3FrMGduL2tVc1ZyaVQrOGZXZEtiWW9Z?=
 =?utf-8?B?dy84d0FwV3FqS1NFaGNXaG5XQmsxSDd0VjhoM2MxeUJpYnN0Y0JQWnNsQ0Rk?=
 =?utf-8?B?aU1KL0tFdTVhQ2FWcmdTQzVBMllTZ2dPaVRzdUZzSmJ5U1MzN2RGU0NXM0xO?=
 =?utf-8?B?VFlqQXZTM1BjM1FFMTBVbTU4cDNDcXp6eXRiYjdkc0t6TWdGZWN2QVlSZ0JY?=
 =?utf-8?B?OFZRc3VrMis5bnR3Z0EyTnF3QktzS0prNGYzb0YwMzc1bGRGbXJjV1JJQWRm?=
 =?utf-8?B?a1QrYTNYcC94bVRNdWxrdVE5OTY3OUROWWNHK0IrbTNYbC9LOVBKdWg4ZEZX?=
 =?utf-8?Q?dT7ANrCis74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNzaFRwZVRzQ29ob2NlcUhkSVFpb3VsVnVFZjZzMnd1NGtBZ2FhMTJYZ1dl?=
 =?utf-8?B?NExhamRZaFpaaGFKdnFuYzNmcjYyb3UwMGtHbFoyd3RaTmN3a1ZZUUpxd3F3?=
 =?utf-8?B?QTVkQTJ6LzBOUzVFM0FYV05GcWd0alNYNks4cGhjVC85bDhlMTVOVGpXTXA0?=
 =?utf-8?B?OUIwVURiSFVWTEdabmVQWWk2d1luTS9ZeWxmMXVsSTA0aXVHKzBhNjdraGp0?=
 =?utf-8?B?UkE0SW9QLzYwa0dDbFlZVkpETjVNcjVxaVMvcHdlWWEvSmR1SFhWeEZIdGdK?=
 =?utf-8?B?YW5iMHlBTnUvZm1vZmRRa1Z3OEZvSnVSdTloTTFoZ3AvL0V5SG00dnVROU5h?=
 =?utf-8?B?dHZPbU54ZUNkWWlOVko1LzdIUEdaMmFudG84aU5IQmJndHhKSG9lenVVMDBq?=
 =?utf-8?B?WXNGOXVrVTJ0RnYzdkhLWXdtNyt6SXNGc0Q1SklveWxTbytzdUsxYjJPdjZ5?=
 =?utf-8?B?UEZpcXRoY3NpUlRvVFU3dnZoOWdhV255UWdqWTYwbDFXYWtNRUxJTDR4NmJU?=
 =?utf-8?B?WFp2cHd6YU1xSGNpOUNudElNQ3ppSHkzQmxYZTFBMXVxcTEzcWdjOUw4NnRK?=
 =?utf-8?B?ZHJVSENPenJzUUJTQ3lnOGlUdS9JMVhqaDViNk5mVWRoMUo2K2Q1dSt5Nnpj?=
 =?utf-8?B?TEJLUEFncUdwNy9abzFYV1JsZ3VnY0REZjZwblV1Yys2M3ArNUVRejd1VGZS?=
 =?utf-8?B?NWxKTTlyR1dYd1UyZ0c4eWorWEhLVkhaYUR6NG4wWDNZZHRUbHM3WjRQcUpv?=
 =?utf-8?B?K3hWRHhzKzBmWldjL0VlbStzd01nUnJKV0NRS2hzY3k3aC9Tb291TEVOdll6?=
 =?utf-8?B?RGJCRjVXQjRjbTlLN1BJblhwc0RNbm9ubVFnbkZod2l4Q1ZDMHhaUXRVRDVT?=
 =?utf-8?B?MlMzRVBhdHNmMmljdHpIc1BMeENYLzlSM01JdlcxYXpyeWtQOWxpNndFU1hY?=
 =?utf-8?B?ajNYemtNZ1MwSjlpR2ZBU1JMSm1hQWhDeU5sMW9tVUIvSkJUWFdMTkpxU053?=
 =?utf-8?B?U28zdEc3YXJaakUvVytZbldNdmFiMXNwWVkraDAxb1NVYTZuOXE2TlBuMmtt?=
 =?utf-8?B?cGxRTWJQazJZaUs0OXdwYnVTK0piOHdCTlBENnVTN3RjNkFzakVtaXdmNTdn?=
 =?utf-8?B?QmJyalJSeHJiRGxzWmdEa3VNbWNFdmF0cU1ueGxvOEZqM1I1cytUeThFMG15?=
 =?utf-8?B?b0ZLU3JYblRseUtwNitOVjVGSmQxNmFvdUI2citZbW8rWlhoMG91dGhoNi9T?=
 =?utf-8?B?a1QwTXB0SFpnYzhld0pQcGRKTFBlNU1qMWhyMEVkeldIdVRnWUxpcnpEM2l6?=
 =?utf-8?B?endkc3BUZVNnZ1IxTE5OZzhRd3F6Z1VES0owQ1d4UnNXSDNsQjNXVEk2UHJU?=
 =?utf-8?B?LzFLSWkwYllkajdaZE9qRTh5NVFTL0JaaXlDYW1sbDdCaEs0WlNnMlFTS2RE?=
 =?utf-8?B?V2xxdTNGRVlvamM0U0xrQlpONTFEOWplSGY5cmREVkN5TlVWL0craXppY0Zk?=
 =?utf-8?B?TS9jTGF4OXBkZEZJNXZGc1BJY1RlakdRazNzTGM0QXRYREN3ODA1TWp5R29X?=
 =?utf-8?B?dTBiMW5PUXB5ZHF3WWZRV0RtbEtseCtLSzhLcjZXS0VEaE1hRC81L1VidFd1?=
 =?utf-8?B?amkzV1VjSTQ4NE4veDExdFFTNk1QbEVZSWdYMDhXdkFxeVBNWCtoM2JuLzlu?=
 =?utf-8?B?ZkdYOHY5NkR2Mm4yM1RmQnFRT2JnNm9Nb1RCa2w2RHN0b0UxS1ZSS1BEbHk0?=
 =?utf-8?B?MXpyK2s3amtWTEhLeDFFb25JQ2cvbllmZXlQRERhaDZnUWhiMDZrN0pvT0lr?=
 =?utf-8?B?RHJkREtMK3lPZUhCL1dWTzN6NnBOVUdZRjNpR3plOUcvM3dYY1Nnb0ZQeSs5?=
 =?utf-8?B?aEJWQy9CdnRXUThsN1hTNHBQd2hQREZRMEpFSmd1YXJVeEE0dGlFbFluT0hR?=
 =?utf-8?B?VzJKUjlVR0R0MG4zUFFLU0lBaW1xT3lWTzkwWnRRenI3Y2szb2hSdi9vZThK?=
 =?utf-8?B?NkFtOXV6MmNKK0dNeDE0bmFrdzRld3IybWVVRzRlNG1CY3dlVGNKK0loemRz?=
 =?utf-8?B?SVorVi9kNSs3OGxqK0wzS0JTZlNBb25aMUVNWTZpS0ZRbmN0OE93WDVZYVd3?=
 =?utf-8?B?Z1JRMGpGcHhiZjMvUUpzWk1HcTdrOVZlZHpQN2ZkOUIyN1BUVzZGejhkY2Nk?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 992132b5-d2e9-4117-a283-08ddae1d20f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 04:03:48.7768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRH9kNt838yzlbBKk3tcLOG1eOPPz25WjxNlIJtTmRqeeKwhuA4/Gn+RR4usz669ZFG8VCxrBi6f1gtppzPulekK6Yoes6qZS16+mxgKumg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-OriginatorOrg: intel.com

Hi Babu,

On 6/11/25 2:23 PM, Babu Moger wrote:
> "io_alloc" feature is a mechanism that enables direct insertion of data

""io_alloc" feature is a mechanism that enables" -> ""io_alloc" feature enables"

> from I/O devices into the L3 cache. By directly caching data from I/O

Drop L3

> devices rather than first storing the I/O data in DRAM, it reduces the
> demands on DRAM bandwidth and reduces latency to the processor consuming
> the I/O data.
> 
> "io_alloc" feature uses the highest CLOSID to route the traffic from I/O

How is the CLOSID related here?

> devices. Provide the interface to modify io_alloc CBMs (Capacity Bit Mask)
> when feature is enabled.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 13 ++++
>  fs/resctrl/ctrlmondata.c              |  4 +-
>  fs/resctrl/internal.h                 |  2 +
>  fs/resctrl/rdtgroup.c                 | 89 ++++++++++++++++++++++++++-
>  4 files changed, 105 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b31748ec8c61..ae1157dcb4a3 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -181,6 +181,19 @@ related to allocation:
>  			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>  			0=ffff;1=ffff
>  
> +		CBM can be configured by writing to the interface.
> +
> +		Example::
> +
> +			# echo 1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
> +			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
> +			0=ffff;1=00ff
> +
> +		When CDP is enabled, io_alloc directs traffic using the highest CLOSID
> +		linked to an L3CODE resource. Although CBMs can be accessed through
> +		either L3CODE or L3DATA resources, any updates to the schemata are
> +		always routed through L3CODE.

Please do not commit resctrl to this implementation by documenting it as part of
user interface. Could snippet about CDP I shared in patch 6 be placed here as
a replacement? Not the usage of *may* to keep implementation options open.

> +
>  
>  Memory bandwidth(MB) subdirectory contains the following files
>  with respect to allocation:
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 6409637b4de6..f3e5e697945c 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -148,8 +148,8 @@ static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
>   * Read one cache bit mask (hex). Check that it is valid for the current
>   * resource type.
>   */
> -static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
> -		     struct rdt_ctrl_domain *d)
> +int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
> +	      struct rdt_ctrl_domain *d)
>  {
>  	enum rdtgrp_mode mode = data->mode;
>  	struct resctrl_staged_config *cfg;
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 10a3188ffa54..755f23934295 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -382,6 +382,8 @@ bool closid_allocated(unsigned int closid);
>  int resctrl_find_cleanest_closid(void);
>  void show_doms(struct seq_file *s, struct resctrl_schema *schema,
>  	       char *name, int closid);
> +int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
> +	      struct rdt_ctrl_domain *d);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 0c2d2cf4baa1..f6c44fae4b72 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2037,6 +2037,92 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
> +				       struct resctrl_schema *s, u32 closid)
> +{
> +	struct rdt_parse_data data;
> +	struct rdt_ctrl_domain *d;
> +	char *dom = NULL, *id;
> +	unsigned long dom_id;
> +
> +next:
> +	if (!line || line[0] == '\0')
> +		return 0;
> +
> +	dom = strsep(&line, ";");
> +	id = strsep(&dom, "=");
> +	if (!dom || kstrtoul(id, 10, &dom_id)) {
> +		rdt_last_cmd_puts("Missing '=' or non-numeric domain\n");
> +		return -EINVAL;
> +	}
> +
> +	dom = strim(dom);
> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> +		if (d->hdr.id == dom_id) {
> +			data.buf = dom;
> +			data.mode = RDT_MODE_SHAREABLE;
> +			data.closid = closid;
> +			if (parse_cbm(&data, s, d))
> +				return -EINVAL;
> +			goto next;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
> +					  char *buf, size_t nbytes, loff_t off)
> +{
> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
> +	struct rdt_resource *r = s->res;
> +	u32 io_alloc_closid;
> +	int ret = 0;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	if (!r->cache.io_alloc_capable) {
> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");

rdt_last_cmd_puts() requires rdtgroup_mutex to be held.

> +		return -EINVAL;
> +	}
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +	rdt_staged_configs_clear();
> +
> +	if (!resctrl_arch_get_io_alloc_enabled(r)) {
> +		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
> +		ret = -EINVAL;
> +		goto cbm_write_out;

can just be "out"

> +	}
> +
> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
> +	if (io_alloc_closid < 0) {

Similar to other places, since this is preceded by resctrl_arch_get_io_alloc_enabled(r)
passing the io_alloc_closid has to be valid and can use proposed resctrl_io_alloc_closid()
helper to simplify the code.

> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
> +		ret = -EINVAL;
> +		goto cbm_write_out;
> +	}
> +
> +	ret = resctrl_io_alloc_parse_line(buf, r, resctrl_schema_io_alloc(s),
> +					  io_alloc_closid);

Here too I think both schemata needs to be updated.

> +	if (ret)
> +		goto cbm_write_out;
> +
> +	ret = resctrl_arch_update_domains(r, io_alloc_closid);
> +
> +cbm_write_out:
> +	rdt_staged_configs_clear();
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2198,9 +2284,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "io_alloc_cbm",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_io_alloc_cbm_show,
> +		.write		= resctrl_io_alloc_cbm_write,
>  	},
>  	{
>  		.name		= "mba_MBps_event",

Reinette
