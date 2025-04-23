Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF814244684
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443699; cv=fail; b=OUtjlGj8e2+9IZuOSPbGF+bT40EehE2JXUDimlu74Dgs2yVELR/cA+h5JVawlLWGUXY6BjGHQi9F4MlNYUn47cw5wdiLeeDbC5FzyN5OeoisZbJGG/5ScXL2a65WYi6Zs3BkaWcK1uTRb5GYo1uxipCBD3aKtMO+itt0TQnuSGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443699; c=relaxed/simple;
	bh=JtzFrT/7nXO9N5OlAB+Si60231WENsUzXyEtNUbJn7Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dw57jYRrWpfl/Zv45sl5s8cMlMmfjD+wEEFcD3K0pw+g43jPFvyfyLNgCow2kMmaApe+koY3gY72nLhSg9vkGEI+0b9Vjwsz7P4VlAayxiRdIBBZk93xlyBcIwl2iDTJgMm+ZddQWdBsIjG1J4neg2kxXl/YO3WeTJBor4RFbUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYaCKsPm; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYaCKsPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745443697; x=1776979697;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JtzFrT/7nXO9N5OlAB+Si60231WENsUzXyEtNUbJn7Y=;
  b=hYaCKsPmnG4Y+4gcYf6LjkKWLJq/AbPeR9OFrxVv3ignXNLmGsFCfAiC
   u5xyTOmxmZA+tEK6nbLzuAAElMCwIMoaFhDaFjWIkWHLOgmlgrkgkKU9A
   O/B1U8amlflXxSwia268WVniI6TksOFDYxPqsmhVKByybBcd7e3YLoj0S
   aoNpDO6CVYZBgXZlbqssDwCYxsSi7hRm7MANh/7qbQeXXg0qa+/Mc7CXq
   XqWlAsxozupOZpgg2YKBCVz0na71OsbScUWghNCxYSmfvgAt8VsKvONnR
   X5ZEM440v/ZbPQCDddCU3jL4MLAGILDOUxzmsTKEh3nNkDXqpJxQjgpYA
   Q==;
X-CSE-ConnectionGUID: jVWAt0buRdGE3EBffBgC7A==
X-CSE-MsgGUID: 8TBrecCgRDau76jAIgDGKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57697717"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57697717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:28:16 -0700
X-CSE-ConnectionGUID: qu5+/xDVT9q+RPezWT77Lw==
X-CSE-MsgGUID: IDUOVHBNRvOnxycGifzR6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163398386"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:28:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:28:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:28:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocbEWxQEahh2Cs/Aod+DspYwWoxH4a/BtAVYE//5sJcDEIV/Db9weoR/bE5xf01XtKAHYBm8/6d66eK/73f2tr1yCLpHjevboSprztlEGUxmQDsiotYOKfK2/yXJ/E9cR311u1J16074eC6z4f8JfLigby3r8ptfTohp8ACJphgxmy1HdMBlta4dJUIg5eC/SagqiyH6Vsg2elU+iPLVCgUfUWsbLmJptPwZsjYuiVYVuQMaBVhzjBmEwDO9oN6/yMB4quyhfXwe3XhJtVpbcyvZkla1C6t4pNwLMQREesNYYOtaiy9WSRAta9xZk7xtBF29LkfQ3y7Ub6Zml0ACug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR9AqA6xR8oQaUB8XUyGTvEjl66Bx70m68Y1rAf9lBg=;
 b=yqpiR4SDzXmtbMjip0lHYVoBuEBOMtgBmZk1vI+QtUg3vuN+6Xn95K1uTVfqWC6PJJwhjNCG+flpQ/fbxLd2T4rGnc/hJZXcfy6wcMXpVF+ewKmQFArmP1lQInHPoCFLQYEdaBYUms8yF8W9WOh79TCyNMDwK9OdlH2LfzWWHZ2pHK0c2JWpDSCVEl3rGJ4KTSRM9FGQBPdbAqf/TTn7kgOOCm8iUpVF4kitpLDZUev+UHp2mzw/xcBssLz3iXLeqCfhKKNSspaMX8yYMVpdWYaAg9W4ZokYZgeWK8qV6dOl0UmMc1X1ivey6FIJYcizQw5Mhd/k1LiGjjaUqakCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:28:05 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Wed, 23 Apr 2025
 21:28:05 +0000
Message-ID: <2aa4169d-a26a-429b-9deb-dcf19baa763e@intel.com>
Date: Wed, 23 Apr 2025 14:28:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] cpumask: relax cpumask_any_but()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-2-yury.norov@gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250407153856.133093-2-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9e6eba-5b38-46e4-d99d-08dd82adbbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1R6TnZmSzJqVjlJeDVOWFhwdXdQMEhZVE0wYVlmVlFsNEhhT0lKd2huMG1E?=
 =?utf-8?B?WkdjV1YyYnpiU2l0RHZGcGVXanJFakJzQ21keGh5eWFPR3l1UTlrOXhtcjJq?=
 =?utf-8?B?Wnk4V0NKMUlBUnFFUmRWdlpMYlpVSXZnalR6azQycTJ0dEk4MTI2MkQxVnV3?=
 =?utf-8?B?UHdOemw1ZnZjVzc5OElqYklvRDI2WExSQ3lBckw2Zm9Ka3hwQnIyekVyZXh2?=
 =?utf-8?B?Umt4Y0pPcndVUGswWWRFcC9KcHAzRDZnV1BmSllzWEkyRVF4QVg5QUowYUlR?=
 =?utf-8?B?ZkRNRmFYYmoyWUxVOGdtN3pSUWxnYnN6cFgwMDdnV3BkdTN6eFpZVk5adzFI?=
 =?utf-8?B?bmxtNzVZQ3hacUdLUkI0RlZ5Y1FVcDBBTm9mTHBVd2J1ME5qSmcyL0pmWC9B?=
 =?utf-8?B?d3pIYmM4MjhhSWJSTzM0aFBFS3E0bU1yVkV3VG03R09vVDBUU1Z4M2l5em5L?=
 =?utf-8?B?dHQ0Y2ViMVVaejVEc1NPaitndCtQVzFBSWk0WWV3bzNyb2RVMFBOOUtaNXFR?=
 =?utf-8?B?UmUvWjcxbHMyZXlwSkJJWmxDRFg4K0xkQTA5VG9SNzUzc2pxNDQrQlNnMnlR?=
 =?utf-8?B?NlluR2lKLzN3cGY4cDVwbGcvM3V2SVRVUHVrZDF4ZFRsNmxKTVM5aGJuZkg0?=
 =?utf-8?B?aXpwdnE2dDhDQkw1ZDRnQUU5bSsvV1NRRmJDUEpTSjl3S0NLdHUwVzVNWk9l?=
 =?utf-8?B?Y0txMHFJVzRpYlNmTU9jUEFoYUoxelk4Tk1ZR25NMFlSVGlKNW1Xa21ibk5R?=
 =?utf-8?B?RGNOMy9xc1pOU3NtMnU1U25vQzdibnU3Y3lkT1ppTkl5M1crdlo3NjVzcDEv?=
 =?utf-8?B?TXdNdmJCRnQ3dTllUTVoVHNmRHRvR1poQlpLb3hib1hlSS9RTjk3WGZ4WFRR?=
 =?utf-8?B?NEYrYzlIcnUyK0VudnZIbGdZQjE2bk9DcnNZdnRUK29LMGtlRmJxUEpwSTJY?=
 =?utf-8?B?TDZOeitYcEpXVTNWSVRzNjIzVFI4cWJ1RnpzSnRReXJhNlcxRFJpWXlUSDRF?=
 =?utf-8?B?VmVDMmg2NGI2YlFqUFpLSlRnbTFqUGtERExjWXpCSXN3TEoxZ2pJeUpzNnRH?=
 =?utf-8?B?Z1I3Z2V5ZTU4cFBTS1BXWFVzVkhkZzNla2JZT3BMT0JLamE4TUs1dDZQdGpF?=
 =?utf-8?B?d0xFSmpkYkZPYUJTZFVwS2NmS3hiYkxJN29aYjZSWUtGZkk1cTJGcUdhcWRY?=
 =?utf-8?B?enpSWm1YYzFOZmtYd2hxcjZJdGNsdnhENVAyMmhGZXVyODIwZGQ1blB2ZkRk?=
 =?utf-8?B?THZqTk9FNWxaQ0xtUk80RHZIWUtHeHVNKzlaSnRMbWxHRFlMTlYxM1RUZVU0?=
 =?utf-8?B?cFpNQmlKOVlFTjZDelFIc0RqT0NjOGJNN3lxV2JaeHZpNTIyc2pndm14VmdZ?=
 =?utf-8?B?YVBURmQ2aTRmcE9ZUitmQmdZSGY2K3h0N0NuREpxcjR2UXk4dHdyblQ4eWVh?=
 =?utf-8?B?ekhpRVRCRGg1MnlnTnduTVZOdVQ3YlJOZnZwQ3VkNGk5WmtBRHB2NnJEMURa?=
 =?utf-8?B?RFN0bHA2MitxMTZLR3pUZTNYbW5wbWQ0dDE3dk9IU2VCSVhhdENXdkxGUkE4?=
 =?utf-8?B?cE0ydmV4bi9reEZZSDBsNS82ZzBSbnFSOThmWWYzZWxUOXVvV2NacWYrQjR6?=
 =?utf-8?B?YTNuWDBRVnI5RUp5MEFOcU93OFdiMkZPR3ZBcWNvYTVQaEhLZndHWWpMMzl0?=
 =?utf-8?B?dDZIajdYNTlsck5oNmdDeVIyaGVscTREeHhXbEZ6b05aUzNyR3RncThBZFVs?=
 =?utf-8?B?aWRmVmhxUmttQWdCN0VyOTR1K1psR3RKcTR5dVJLVWtwL3RwM0tLSnRWeGNS?=
 =?utf-8?B?Y0FXSUhRWUlPMW9YS1diWWV3NmNockxaL0tFTFJzcVcwWFdrK1RkZUZ0akI1?=
 =?utf-8?B?TmE5U1hlaDNwajh4NkVpSjZvbzZGRGlEYktaSi9ITVVobURPOVdmbWs4OFBF?=
 =?utf-8?B?RnFvRDRPWnRmMFY4aFpjN3pXQ0UrcGFCa2NKakdHdHBaZFZBSVRmWlhyaXRX?=
 =?utf-8?B?MHZoQmhvbVlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RjVTVDcGpHNys1REJSUDMrUVQrdmd5eXkyWi9EZlkvSGVhK2hMbm9ZVjlP?=
 =?utf-8?B?cVAxUWNrOFFBak5mWmoxdnBRUkxBYW5lSXZZb1ZXdklNVTdKVm9SQ1J6WWFI?=
 =?utf-8?B?T0FHaUlXanpMTHlkeEVwT2VjQ1ptalkxQ2oyQm82ektybGxBc3RQdC9JZlQ1?=
 =?utf-8?B?cVJLQ05BOEdwRkt3c1QxbUlITmJCY1hLS0tMMHYrUFVHc0MvR1h4WUJVRU0y?=
 =?utf-8?B?OTFCZUhkVnRyT0dId1pkSmJnTVRXK1p1cUlkYjlLeEVCdlRMV1FQeGdGMHJW?=
 =?utf-8?B?UXJKaXhFeVhTcG5jdFhiUHRJSEZtWm1hVSsyZHRhOVBGSHA3N3RkMkpsVmpB?=
 =?utf-8?B?aENVejE1eEkySDhuZUpOVjVDWjh4b2hKNXdZdDhtcXMvT2dBbGJOOEdqQzVS?=
 =?utf-8?B?WVlJZnNyWlhnZWhGVjdOVXFSeVdPZ3ZCUE5zamFOVEpNbWhhekl3SFBYVmM3?=
 =?utf-8?B?cVVSb1ArSm8rL1lrSmxtczNGYlMvUVcrcjI5SmNXU1VFRDEvZGMwcWtZMWVp?=
 =?utf-8?B?cEdFMDRaN0RFdzAveHBXU3VpUkRuWFQwdTl5NmppWmxwOGJ0NE5XdEVnZmVv?=
 =?utf-8?B?c0R0S0RGWHFYTDVDQWtVcm5jekF3TjYvdmRxckNCb2RTdjBTK29WWnQwS1NF?=
 =?utf-8?B?UXhVSXZHbWQzUWtzYVVTUUttZVRRV01LZGZmb05wcGNxQ0UwejBEUzJsSW9s?=
 =?utf-8?B?bnNNQTVHRHFYdThQd3NPRFdZUzIzTTJmcnVLTmFobXpqYXZYSGJRZlhuTkx3?=
 =?utf-8?B?amk2RnhrclFiRUpoV09MNG9NUU5FaHZkMXZ5V3QycmlYeC9BMnNHeXBTRWxB?=
 =?utf-8?B?UFk0QjY1OGwvWWwyb1VqRkFKdFp3MVJTUzFKUlNGK1NwU1BYWWd1L1NnTlBE?=
 =?utf-8?B?RUlpbWRJQXRTOExyTU5DTGdSZVhkb0NtSDYrUmtjdEx5U2hWRDJIMW1pRUVI?=
 =?utf-8?B?NS9zcjJmWDhnTnpEOFdlbTN6ZzEvOUFlYzM0a3ZPUUE3VkVJZElPcjV6RlBX?=
 =?utf-8?B?NnJxT2NZZUVRdFFqY1dWa2JDc0x2ZE9ZV1FLNExZcW9LZDUwZ3ZTdVEzYWMr?=
 =?utf-8?B?YVBsdjJhbjd5aEVoWmJ0ejVqOCtTeXJrTEdRVUVGYVR6WCtZUEZSOVlPeWpy?=
 =?utf-8?B?dTZXQ0RPaTB2QnV2UUIrTFNBWGptVFdBSXZuSzRuaERQcTFCMkYyRFk2VzJY?=
 =?utf-8?B?UnVURFFCcTFxSmN1b05USzdWYWFmOHVuUDVkckowWXJPRXdNNHRIRlZtaTNt?=
 =?utf-8?B?YnlWTHYxQlpqelJVbWtEb1RnKzRsNjZyRWROYmwvZm1VUU9rM0R2eHpMMVc5?=
 =?utf-8?B?V0FlUlZjbnFIb3NhMW5FL1VXK1YycUl4NWZOdHB4VWhOV2VMQ3hVUUNBL2R0?=
 =?utf-8?B?S3pDaXQ2VDlOUEtEcmVGb29vMmZiSy9WY01hZHhTRXo4V2trdUM4UWtNTnZt?=
 =?utf-8?B?TGFZSmRHQW9vekdQUU91djFNK29BK0JKNW1wZ2pscThJWlpvazNuMTA3Y2g2?=
 =?utf-8?B?WE01alpoaFpmMytIZ3Q3L2FXSU1kYWdSZ1Y1RTZ4bVhSeUp6SVBSdjdDdUlM?=
 =?utf-8?B?ODhQRXM5dFRubFkvWmcwYlNTSWlGdEg2am80MFdPbWZFTng3WmZTL2J3OGdv?=
 =?utf-8?B?MnFNKzQrUTVEdWs5Tk9tMGhPdHEvYjBUU0UrTDFQam9UV0g0L3dIaVlmeTgv?=
 =?utf-8?B?ZkVEZzl4WERPL0JZbHc0OXVUYkF0NVpEeGRuUnFKeTBnMEVieGRzZDBKTmJi?=
 =?utf-8?B?aUNYMmpJSHBBbjVQNFNyNVQwR0lhMFNjUXFMSUd5OW9hSUc2ZWJDK2g4Ymhm?=
 =?utf-8?B?NEd4QkZJWGRjMUdGSVQveGp0TkxIZ3dBSmE1aFFXa2tyLzRPN0htcm1DKy9H?=
 =?utf-8?B?Z0txdjNiNW5XN2JsbnhvQnZOSWlFMHBKUis0MldOZjVxT21tZlBNVGYwUmZE?=
 =?utf-8?B?Vm80M3c3dWYrQ0tSUGtWM2Z4ZVRuc04rMEVvS0FOSGZXYU5Ia2QwZ0JRZ2hR?=
 =?utf-8?B?a3dpYW5mSlpBQVBJeG92bDIzV3VaL1o4WjJxM2JZc0pudUZ1K0Q4eTNkQ1F4?=
 =?utf-8?B?a1VXZUVGWkJOM0RZOTJrQ1JyTlh6NlNDL0xwblA2NDNwZXg5cDEyWTFMdmRv?=
 =?utf-8?B?MEJ5SGo2andodUdnNzNDNERMVE9KcXgvMmlNMWhkZ3BpbXRhQ3NIUUVlR3RE?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9e6eba-5b38-46e4-d99d-08dd82adbbd8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:05.0346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFIyoQMXSi6h6cLCw03Pf5DAjFEqcNqGzEhLWzzuuOTJO6tCswjzNYHwO14It+6rLGY2ooMR9PUMMnxHOE6IiyvC++v2m1z7BX1tWOywXjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

Hi Yury,

On 4/7/25 8:38 AM, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> Similarly to other cpumask search functions, accept -1, and consider
> it as 'any cpu' hint. This helps users to avoid coding special cases.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  include/linux/cpumask.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index beff4d26e605..0f816092c891 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -413,6 +413,7 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
>   * @cpu: the cpu to ignore.
>   *
>   * Often used to find any cpu but smp_processor_id() in a mask.
> + * If @cpu == -1, the function is equivalent to cpumask_any().

Now that -1 is a legal argument, should the "cpu" parameter be of "int" type (instead of
"unsigned int")?


>   * Return: >= nr_cpu_ids if no cpus set.
>   */
>  static __always_inline
> @@ -420,7 +421,10 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
>  {
>  	unsigned int i;
>  
> -	cpumask_check(cpu);
> +	/* -1 is a legal arg here. */
> +	if (cpu != -1)
> +		cpumask_check(cpu);
> +
>  	for_each_cpu(i, mask)
>  		if (i != cpu)
>  			break;
> @@ -433,6 +437,7 @@ unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
>   * @mask2: the second input cpumask
>   * @cpu: the cpu to ignore
>   *
> + * If @cpu == -1, the function is equivalent to cpumask_any_and().
>   * Returns >= nr_cpu_ids if no cpus set.
>   */
>  static __always_inline
> @@ -442,7 +447,10 @@ unsigned int cpumask_any_and_but(const struct cpumask *mask1,

Same question here regarding type of "cpu" parameter.

>  {
>  	unsigned int i;
>  
> -	cpumask_check(cpu);
> +	/* -1 is a legal arg here. */
> +	if (cpu != -1)
> +		cpumask_check(cpu);
> +
>  	i = cpumask_first_and(mask1, mask2);
>  	if (i != cpu)
>  		return i;

Reinette
