Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA725B68A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023666; cv=fail; b=nN6DuXQkh/q60Kl5UOVy32BIWZZOqjIPyMSmKsqhobKJjH93A7FHA3nbK2o+lhQpU7uJxiugJQbyvcD2T2CCsknDF07jcLgmJOPHJRPY3pGbX6cp9SNOt8JqRPkU2WPz8jLcYW01V+MPHp7Pa+/py5pq21x2Lqn+oM37vNmtsAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023666; c=relaxed/simple;
	bh=iNvEV/gYDdm1yoQ9DhzmzPcFjHygXvyk2RENAG5RbQA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bbv4+prPUhvGWHn1WmfH6CZ+a7CLq3PXKvad5Xx4GnlYA/nGG/BJRMTOn3Nc4PqmEy4AnIqORzj7y2dI8qEFaoRa7Je/QGtv/I3+t4ZH5F2IjZ259bVpDQXExqJ4IaMJnltvK6NL32LTNj6M2666Q4HxWCkhfRRlrm5O3Sjta6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mon5n5nC; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mon5n5nC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746023665; x=1777559665;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iNvEV/gYDdm1yoQ9DhzmzPcFjHygXvyk2RENAG5RbQA=;
  b=mon5n5nCaXq24UghqRKeAtwX6DKsM2VaPCgaUaeIxDRAWqIpqzZ7Qjwq
   2nNjrsVoW2ld4jYNg4omLveiKd+4Gcq+QKZDBSGyg0ldOgdWFSkjG7y4f
   7i+V9sa4Z/nTRKax1I0XYycgXgWJL1EwValCzFyT9taSBz82+hXs14oc1
   3P2Sioany1WTByCbKVlAKLycgTn831h+zzKf5wmD2W8tlnvXohyDcTlZv
   2ztt2lTeoWewTb7PG8xqGtFgxDP5UhKGktL19HHWEPD0M1i2deEvwtizX
   dMZVpnHCsZnyoM4I1kUcSGsYNnYfcF8vAYSar4KaO1AHcoVgL5HRBAb5Z
   w==;
X-CSE-ConnectionGUID: Tvj2yONsR4urOhm/B+SMiA==
X-CSE-MsgGUID: fZ4oxnrlRjusSpSWxl9X1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47776108"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47776108"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:34:18 -0700
X-CSE-ConnectionGUID: KALDt5H+TgyjeukHd0bA7g==
X-CSE-MsgGUID: o9kMy62SQDWKLJIdo1qOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138146893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:34:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 07:34:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 07:34:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 07:34:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lshTavTd8gEM7oEe3N9kPLJzGQIKAPFTmc/4lTDhuePUHcIC4lVR+WC4uVg3xtsWSCuSIgteOIY3JSH55WFF0W9fJsF7voh2KkjA2LpQObxIx1v8wEXkg0A4bF4eWuj3UCaneUrOILtvV+yVLl3wVm7v1fVgYj9LY7hPzLDzBizWk/jT7HNtU/0EFFZwFNp1qkrhFkxHXyUIIcbl/+TiKKCU/ms1lO6KbqyEENMhvctsSUDf298m9/FVQiuhn/KbLT4KR+jX6Zl5rmjJeVQhsGl2BgF4Nt5FTiU1qCjpJOI0CkcXVOHKJKoB3Im6AgTx9xTxT0HnyttCmpEYaV56YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXOyZUjf3XsvYer376luL46Iz/M7no4cbxWGOKlGxKc=;
 b=jQ/ztRa0y/mBNWjgWQFKxY6lwqxUp7SXnBci6OY+Q+f40YIoZjDi/JQuD+XHVhaUrsZ4X0qoyMknM7z9dW5JgmCAWcQL0K0YooAYOQnWMUoibRFUbUgnp/vFWnhpJ1IDqM9Fr1gB0zA35CoImIUkushyNp7LaRXIq3EY4qylcqAIFQbpMm9XK/whE2DydxoSNndPVh/PMtiXPl6t6DzcHbzVbxo0m25YyeRD5HXBwbJ8iqo7z6jmcI8PbhBfLZI8cCjar39ux0QvuYI75OeSW/F7gqGqz6G6kWjm2R9/Tt1BHNwf2/Yw4CLGx9ikiSvvNv1vQ+PstxIjYw4VzNovcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 14:34:09 +0000
Received: from PH7PR11MB8478.namprd11.prod.outlook.com
 ([fe80::6961:eda0:dc93:5b4d]) by PH7PR11MB8478.namprd11.prod.outlook.com
 ([fe80::6961:eda0:dc93:5b4d%5]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:34:09 +0000
Message-ID: <0e298f80-5361-4376-a099-d3457c8cd349@intel.com>
Date: Wed, 30 Apr 2025 23:09:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
To: Dave Hansen <dave.hansen@intel.com>, Jun Miao <jun.miao@intel.com>,
	<kirill.shutemov@linux.intel.com>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, "Du, Fan" <fan.du@intel.com>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
 <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
 <e8d3fe25-0f97-4edd-abad-dc6b96430965@intel.com>
From: Zhiquan Li <zhiquan1.li@intel.com>
Content-Language: en-US
In-Reply-To: <e8d3fe25-0f97-4edd-abad-dc6b96430965@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PH7PR11MB8478.namprd11.prod.outlook.com
 (2603:10b6:510:308::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8478:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: eb486cf9-b705-4c3b-b392-08dd87f4112b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVdyRjJUQlRTdzNEMmpzZ3pTNm84anhscWFHUGV5SVFCUEZzcTV3NWdxaXJr?=
 =?utf-8?B?N2gzdTZQb1BvdGs5SG1pVXBPdkMwT0JYSWJQczVmZnRNRGFISGVKNm5WbDlU?=
 =?utf-8?B?VWxLVDRZOWtrRERxUUJzWGZnYmNKaytBQTVvanYybklJMEhmMEV3SjRhc2F0?=
 =?utf-8?B?NjcxSXR1enBMMFhjK2dGOUM5Rk5OaFNrRjI4a1pEOWxWKzhtcUZ4WXlhMVda?=
 =?utf-8?B?R0Y1NnFNUEl3ZHlXNFc3ck5uNzJKZE9vYXpnTnBwMFNZSVNMTXRRSlFSbkhU?=
 =?utf-8?B?SkMzZHNBcitRNlVxTkFmdkFaOE1wRGYvT1VKcFRTV014TGhsZXdjU2RYeElN?=
 =?utf-8?B?QWcvekZYR1pzVWdIbW45NVVjdzJYZVoxQlBjb3RxQXdaMEFqcWVkTm9kYklS?=
 =?utf-8?B?dFZuVkpqaFpPWXNOaS9OMXBEM2ZremlwMFZqWVhLR2xiY3FkOTFsdVk2dmtk?=
 =?utf-8?B?VmdmMEVuM09BeWF2UEMwRERtR2Rrb1h4SFZhTFdQL004ZlUwZmtGQ1RsQlQ0?=
 =?utf-8?B?WUJVeS9sVkczWThkWVN6SGNpdlZMNko1MEVLdGhvWDNHTytwMFJ5bXg5MFFZ?=
 =?utf-8?B?QXRhU2lMWTRwS1VrUzFyZGNCaXU0UmRsTElnTm5jYVVkY0QvWHAvVGpMWXkw?=
 =?utf-8?B?MDVaMTV4VGlDVDY3cm42QVNPRk9zRHhSbGxITGhKanphdnZXTGtXSDlSd1Nt?=
 =?utf-8?B?MVBOQ0hENkFWeEhwMjR4SVVMeGRZV1lIM0NweFNIOUVFK2tsVCt1ZzFOTlFV?=
 =?utf-8?B?dFZQMTRMZ3V4bjlHM2pNOTJaTS9lcnZUYjNyNWprQzVuaXAydllaUkN2VGcr?=
 =?utf-8?B?cEtlSmZsQWxrdE5zVmNxT29tNlpYd21SVDRpTzJqNG5GZEtVVnRpd3VFSHdS?=
 =?utf-8?B?T0hVY3M3SzZGVEMxQXd4ZHVSNDh3eGhnUVZpZDdBMTRPdVRpTWdGYWVaSXVt?=
 =?utf-8?B?V3BvTnZwZDQ2OXFiSk5JQWJ3QnJSb25GckhpZjJJaFdjYlJEMHdsRFZDUHBT?=
 =?utf-8?B?L2tIbzhDeFNTcHRta3dZNG9nZGhBMGM2U050c3hrcjZVMDVtUm41T0lBTTNl?=
 =?utf-8?B?WVI0cHpZd210WGxtUEthOHNRaWMydlEwSmh5bXR1ek5vbmp0SmJuZlJHeXh3?=
 =?utf-8?B?R3hhQTlkUlA4N2lOYk5HN0FUck80cEFsdUQzQ05UQ3Y1UnFwVzVQRFhJT3ov?=
 =?utf-8?B?NXE3aitJUzZBZUxHVWdIajZjaFhvWmlZWERyMVEzYzBJOFdnblg1Ym5MMnpk?=
 =?utf-8?B?MUYyaUVaNFZ0OFltdHN1WnQ2V3c4ZkJlVFhZL3NtS21HT01uaHdHZiswRjZw?=
 =?utf-8?B?ckoyK1Y2TVkxRmNBSHJKUUJqcXk0RmwzTU1ybnBNUUd4dlc5eGlKWEw2Mms0?=
 =?utf-8?B?WVIwWkh0YjJoTTNIUGp3d040ZzN2Q2JMWmwvN2JuZmIrWlRtanFacVkwK1Vx?=
 =?utf-8?B?STYxNDluSEgzNkVZRzNXS1hBcmNjYXQrZzR6YTlOYmM4OTRGNkhFbEVnLzNw?=
 =?utf-8?B?MkRWRnVhQiszUzF2NHVzNUZmdkZRKzVycWdoMklUYllqQWhaSEsvQlhoeDZU?=
 =?utf-8?B?TVhNQ1FyT1Z5YlgyU2Q4N1hpSjJOOHMyalVFbDRoaE9hWXhNdWpZbHBCVm1p?=
 =?utf-8?B?RWNrejhaOXgrQmFEQ1h6YnoxemhuS0VPM0JJdWdjT3J6VFFvZHM2THc4dFR5?=
 =?utf-8?B?dEpDdVNkY3UwSGtJUyswU3dhQUlkUTQxb2JaeDZ2bEFKRTVwRnBPNTREZVQ3?=
 =?utf-8?B?UjZpd1FEM3ZUM2pkalR6a2tlbTMxQnRhdGlKcjRDMFhkcHVDLy9IM3ByYVFG?=
 =?utf-8?B?ZkFiS2o3TVoybmEyYXFRR1ZSNHM5THY4U0tSaHRweTF3UlZtWHJVMUtPYlBq?=
 =?utf-8?B?bndDSEp2ZHFaTWJrdit3cGlTeGJSM2VaeTBuck5Qa0Q4bkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBxeWJ5SnNiQ2YwRXdNMElraStQbzJNS0x5c1N6Z3A3ZGhyZENOaFVhS3l5?=
 =?utf-8?B?bWN3Rml4RTNLOXlBem1ib29IaVRIbTNDL0JKZzRXYndyTXVUcTBwOHlIekUv?=
 =?utf-8?B?QjFITmFUZCtNSXRRVXdUSDNkQlBhM1MzaGc2TmFuWUx1SnJkZWV6a3E3Tjcx?=
 =?utf-8?B?WE1MaEFpb1hTNFYxdCtvam1VSVNaTUhCK3dCR3pBbDRYeVpQMy94R01Ta0F3?=
 =?utf-8?B?VUZMb3ZuK0x5TGxGMUMwUGgxVi8vcUk2YmpuVTJYbDE5OFpITTI1amJyTHRq?=
 =?utf-8?B?elFSeTNVb3RHU3JJcU1QL0lESWk0UHRBR1R3bHA2bWxoQVo0alVYS005dVZC?=
 =?utf-8?B?VzVSR3ZqS2l5RWY5ak1UTE0xWnhTNnk0QStJQmN0Q2VMR05tTHdQMTVuRXli?=
 =?utf-8?B?ZDdBajhVYzg1TkJLbHRtWUFWb0ZicGlqcXhoUXJ5TWQ1bGNRY2tVRG85c3BO?=
 =?utf-8?B?VzFNU0ZwaGdvYzdQN2RRek9FWFY5cEdtTFBIelF1Nk1UeEx5VHBEbTRkODlK?=
 =?utf-8?B?Tyt0VlpabDZ6K0hZNWtFK0Ivci81RVc5Qmsrb21sbDJCMTV6MmVNNk5nZHA5?=
 =?utf-8?B?M3dTNzNMUHlDZ08vSU81WjFGWTBEcnZVMWg2UUtjNTFTamV2Q1FHR1VGY2t1?=
 =?utf-8?B?cnRPbG0rbEZRNXB0eFhMdkFtWisrMWtOdU9TRDFDSXNGUlpySTdYTkY4b2FV?=
 =?utf-8?B?NEpRTnIzamNjd0NydkpWYmZicHpnZHNqdysrKzB2NW5qZ3lncWFQUk5WRTRl?=
 =?utf-8?B?dytIdzQyQUtsVktQMTdDRDJCc3VIdzNoNngwVk8rcHJGTkNhNFFTeE9HdmhI?=
 =?utf-8?B?dWoveXlpRGFZYmNsTWxPeXRsZVNKNm1kWHFram5VWXhySFU2Qy9RckJrMVBi?=
 =?utf-8?B?bmhuaHJjQ01NcVRGZGNRR0ZDK1VkUFIzZWg1TVhTeWoxa3I2VHFoTnVYMUJO?=
 =?utf-8?B?cjBKalBXcHE4Q1YwQ3FYVkRzZ1p0ZHVhdDByRkg1YnptSVpYSHY2U0tBcTJk?=
 =?utf-8?B?OURKTkNpaG42bWlQQXI1aXhJdURsQ0IxWHBIZlM3amxQWUJlckxnSlI4R0Y0?=
 =?utf-8?B?WFNFczJRVGpzVUIvZ2hPRHJ4VG5nSHhhaXpESE05U0lVYnRXMU1nRE8ydWhP?=
 =?utf-8?B?bllMNjNJRzVwTktIM1dpTk5RTGR6am1IT1ZuODBZSHJrdjlYSTIxaFliZ3F3?=
 =?utf-8?B?L01LelNUMGNDWDNoVWpubThKVUgrRyt4K0NyTlV5MGE5SmdvdU96bk5KUFdr?=
 =?utf-8?B?M1BhelVFVHduKzNoSFU2Wld6akprZTlTcFdpQndWM2xhOWIxbkZZUXlwTVZW?=
 =?utf-8?B?M1ZNNjFPU0hiRWVGWFRpZzZuWkx0S05zcUhILy9kZEdaOWNyWmg0bXNSNkdY?=
 =?utf-8?B?YkZacTRubWcxMVQ5MVlLZ1dkS093QmQ5aXNXYlJHY01ZdCtONWFnWm9haFlR?=
 =?utf-8?B?QTQvOGx2Z1NLUTJmWWl3MEdHSXN2aStCOFdQSG5waEhNdkRQeEdQQzhidkxF?=
 =?utf-8?B?Q05TM2JqVStYMWtjNDFaRHE2WTRBN1RmNUd0Y3NDMFFsb1UxMEVSMCtaRUFW?=
 =?utf-8?B?d09zQlMyU3hmdCtwUkNXTTBtR29aOUdBRkNUbGdoV2pFb0ZoY0tNWWJKRDNv?=
 =?utf-8?B?clNPSk8ySDE2QTl2UldmdGoyQTJtYW5QWUZKaWV3VXBYQy8vdnR1SnRRZG5p?=
 =?utf-8?B?ZHpJZ0UraktCNW04N0Y1VmNjdWM4ZjBtWGNKdnU0Zk1wOGt0WXp0dmIxUk04?=
 =?utf-8?B?SlA3ak9iRHJkQXRsN2taeTIxVm5rdHhQYkxJSXJRUklDTXU3WkVTQUhRdHdT?=
 =?utf-8?B?TnlrMEQxbmw4djdRN1lZbEhoQUxuNVpqNk9sb01iaVlLT3BWblR4YkZvOTRI?=
 =?utf-8?B?YjBWOUNHajlOWW9CRlh6OE9OMnA2a25pRHdFemZENGhBaWR4RUhVU3cyNmJr?=
 =?utf-8?B?MkcxZi9uWkxiWUpHbFBsVDBPL2xoVXhzS0M1SDFkRUd1emxPdEE5bnpnSFJj?=
 =?utf-8?B?TURQdng5ZHJUS2tXaFd1anQ4ZDJ0R0haZDZWQmVXaG9EQ0xzQXIxTVA1cHAx?=
 =?utf-8?B?UktGKzBleXo2Q1ZQRGFMVzlaMEMvLzV2b3h6Vmo4MjFocUtSdGVWRHVmYklT?=
 =?utf-8?B?T1lSVTM1cFc1MndPeU9SSDYxMWdFWkcyM2J0TWFzdzBWdWdQeFc2VmQ2eFZl?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb486cf9-b705-4c3b-b392-08dd87f4112b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:34:08.9555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmmAu9aO0uz9CVZgVZ0PF5Rtoy1JDn2En8hvy4zf8UQUQnWjQJKwo/dEgiCxvqz36bmY7dzyZ+EY7nNngnT1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
X-OriginatorOrg: intel.com



On 2025/4/30 21:44, Dave Hansen wrote:
>> Currently the most customer's complaints come from the CPUID leaf 0x2
>> not virtualization, and most of access come from user space.  Is it
>> appropriate for such behavior directly cause a guest kernel panic?
> If a VMM doesn't properly configure topology properly and allows
> REDUCE_VE, then panic. They obviously got something wrong because that
> configuration doesn't make any sense.

OK, I agree with you.  Is it better to simplify the logic like this:

    static void reduce_unnecessary_ve(void)
    {
        u64 configured;

        /* Has the VMM provided a valid topology configuration? */
        tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured);

        if (!configured)
            panic("VMM did not configure X2APIC_IDs properly\n");

        tdg_vm_wr(TDCS_TD_CTLS, TD_CTLS_REDUCE_VE, TD_CTLS_REDUCE_VE);
    }

Since merely fall back to enable ENUM_TOPOLOGY isn't enough, the guest
still suffering the CPUID leaf 0x2 not virtualization regression, like
the glibc bug.  Full REDUCE_VE is really expected.

Best Regards,
Zhiquan

