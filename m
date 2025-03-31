Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAD48635B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743461414; cv=fail; b=ZXPxA+pr8ksD/9pFnvDg0hUTy+emTTeiaIQ6pNhEaJGtQ0ROMLAnZeXvByvxq4O/R7EXlQv0RK23j6SyK5WvgANa1JgT3w5ss36ItumXurF9tLaroAqXDOSsHBM6sh3jfcnWyjpRO/SHBkA87qA75eGh3lY3GBl/D6T8VDH2oE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743461414; c=relaxed/simple;
	bh=ZHT8CdIN2IE/ef1kXZYbV+4WlX5vgZaQNycxawwvNj4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JevPsBYfbQCrdUTfmzVXlcwzqyMxp8762uPVJkoV1ZECNHDrzTYvpYeqZSek6vYIM2YAT70Bfz6eRJ9sx2jcTeWMjlexwglZmpu4PApvx8cMRxvd2HJtG4eiFbefi89+Pf8rcK33f38q9lOMiB/HSbfI1Ao4k17/b92mzGGTWHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hB282sjB; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hB282sjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743461412; x=1774997412;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZHT8CdIN2IE/ef1kXZYbV+4WlX5vgZaQNycxawwvNj4=;
  b=hB282sjB/mvEmF/lZ+uoIaHBUEKzWomKE3HB8g4mdtjSssOohCXrwSBD
   3uPT72gnD79o3Gw8VHf22Lr/DczCzgkPcxfu7/jgg+roszkibmnTtnanc
   oONa181CR8dxtX2TO/xAn8yn5kBS4yGDXIDPSCJjBofMbhUDPQ9JB+tBD
   EpqeyP79+Zs/Gil6zlOeenqjyAa7/KS6eOZD8EbxxERLj3EZwJg1cxLOL
   6A6Tgk6z6YK4r/IzmEagvJvL4A86SvUdg90X1754t7l043MW0LtZPrpvy
   Vnp9TwuUZwrnT6cLL1KeT2J/4IW+WBfHBJth5JLW7je3F58YAsNckXoQp
   A==;
X-CSE-ConnectionGUID: B2rkVyw8RDetH3SyPyuE3w==
X-CSE-MsgGUID: 2XEqIUjNQOOIbLNsXG3P3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54962485"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="54962485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:50:11 -0700
X-CSE-ConnectionGUID: MDe9r/QtSG+bwTsYe6VUFQ==
X-CSE-MsgGUID: hgn+lJZFSuSV1Gsj7d/sKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="125967155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 15:50:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 15:50:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 15:50:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 15:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAKRB8mJ5CbvCvw2yUeFs7UDd4kkyj7cHFiHJL5DW1ZCGpD6zGLBXtdhWx5L/wddNaIr76G2VMyyvGYLpCGu1d5OFq5zD5Xj0CThvz5wYWM4UOdJKAQV3h29ba8UdChwmBK52EQxNc4LJFCk4fyLGv/dutQULJOipc91d4gcxaFIJxLrnqxLM0ph12OELmLsOiupC5l+kB8+TySS14Rqb6GV1CjHIDubEMfngvls2/RhtJvzfGtc3+tKGah4iJ8jxLEHp6aIFnM/xHqEns5ZdkUW/jPHpzOCB/3FNGGKqAZ9AcGMyIUmfflDDRTjb12wqc7OpRqU5KAJvwC/0ZAGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfj30sEC8/pD3+HK1G5U3IIwlANq8ckFSPZILm6yCDo=;
 b=i6qKNtLFp+ImaVUQf2OZN70nJDzU5LXHodwsatVEZuDkc7aCAxcfGkzE51TomySV5Fh8EKSiZoWUbAl+vB4O6c3lr6SHoXyRZhOB4HlR22yzdjcxRStTM2Nfac+4wH9/lT/8w7gnyJ7lRliHssFMDImqv9zRj5uNAjF+/bmMELTz4hP8OK9gh9Duus3fqZm1MLqjPXZ3Er04+qgvqWbY/P+bZ7H9EwDeUN6DZeWLJKOTRYlNAyP/XJSOv8jOyPSn/oOY0Ub3PoBndXXEaI8ITTTk7zGzqPHcLZshOFcEox/7H1VDVD8sdeuxShwLLBmmocDHwXLW5GcHVL4/LuHXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 22:50:05 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 22:50:05 +0000
Message-ID: <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
Date: Mon, 31 Mar 2025 15:50:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-3-sohil.mehta@intel.com>
 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1a812d-7e72-4299-71d2-08dd70a66117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5nekpySGRsazduWlRKRDdYZGY0ekJFQlp6RlQ5eDZtakszZHVNMHBiUUtB?=
 =?utf-8?B?aVE1SWNTRzY1NkNVZnJHSVhNYTZtTEVSZEJNNGxMUkRuQ2k4QmJwWkxibkd0?=
 =?utf-8?B?b1licldoWHlZZzJVNFFpSnE4c3hIRUlvSW0zRGNkQkFtMTVGK0dWZHA3Ky90?=
 =?utf-8?B?dU8yaGs5YjVNUHdqL0IzV1VHdFEyY2txZjZXMXhKalFmaVcydnpPV1NNTXVC?=
 =?utf-8?B?NWVLTTF1V2JlNWtBWHRmTWVPNUFnZXd3TldUeW5xdTdZNUE4NmNWbjE0NnhC?=
 =?utf-8?B?MXlCRXVOZEFTTHJteFBhdWtYQW13QTBUb25Kb1lQZnpreFdPYXlvOENDdGR2?=
 =?utf-8?B?UVVra2hCK3QwSHd2dmg1SVBtbDRPQnFncU4wcU8wWTh3TUtMZUh3eTA1cm1I?=
 =?utf-8?B?NWtVai9BZXpuUlpUZTN6bTAxeDA4Zlo2WjhGUWRQcWV0Vm5FSkZaOVN5d1hT?=
 =?utf-8?B?eVdDekxYdnVLTU4wbjlUQmhVRVdWK1VkTG1yN3JLczR4dGtYN2ZtK0J2VFFl?=
 =?utf-8?B?YnRKOWxpSnBZUm5jTW5PbWtsSU9PeVJVRHZrcG5FajZZN2ZUYTNKSU0vMkow?=
 =?utf-8?B?RWpWaHV3RGdCWUl3SHE3bHN5cWhoMStvbngybGtMUUphUmNIakNPbVFZaDdD?=
 =?utf-8?B?cW1ZcFVjWlBIWjZHcUl2VWRVNFdYRmhERElpUldoMjN2alRLbVRUakJCa3pa?=
 =?utf-8?B?clJTTWhDWjJCdEJrSDVnblduY1B4MVpBYStCTzVObDZqK2VCL0Rqa0J1QXhy?=
 =?utf-8?B?dzFxZ3hhRW93WnFQTnk0dlVzRXF6MWhkZUgrOVZ5U0xPeDZvdXcrVEgya29t?=
 =?utf-8?B?ZHZZTUtIaWhKakRJeFhNeStJR3RJREE3MENQMVJPK2dNS3BpMGFoVjBpMDVQ?=
 =?utf-8?B?RjZvRWdFRWlqM2dna1JyOG95NklLdENoZ0k2S0lpNXhIalNZVGY0dE1kVXdl?=
 =?utf-8?B?SVZXZ2N1MEYyWktJR256RTcxeHAvbFM0bXFFZEVFeXorZHRNb2gvNG41N1Ru?=
 =?utf-8?B?c0xvYjVOd2JzU1ZDSmNVeVdHNFN6R25NV0loYk9QaGVpWno3cXovYzI3THN3?=
 =?utf-8?B?UVcvek0wN2hBdlNlbi9uRzAzQVRmWC91MCszTVd0UXFUQUdaMXpUNGg2d3dG?=
 =?utf-8?B?TmNqcmI1RHpyNzdxWTlScGdiNC9YRVdkOUc3dVhDVE13RC9hNThzcEVqOFFm?=
 =?utf-8?B?aFNFczBqQ0VBUVozYkZRdUYrUm1QSlFZalVCY0lEakhObi9JS1dHSXpJaGNZ?=
 =?utf-8?B?NG9LSkozL2xtWXl2SmcrTW92d2JFWHRBSk55YUJXbXdUSTcyeURhQlRsRzk3?=
 =?utf-8?B?MVp5ZEJ5LzRyZVQ0a0EzOG1TZE5zcVB5MHpZNUpiSFBsNkhDVUppTzZMWmZ6?=
 =?utf-8?B?NndBVFFMUFZQdVNZK25NWWdGUm1IOFNxRnVBSHJMVDkxN1VpUnd3NjFZc3dT?=
 =?utf-8?B?KzhMMUxKTERVaEJ4eXRTb0d1a1c1b0IrZVYrVVMrSzVSdC9xV0l6Y0diYlJL?=
 =?utf-8?B?SzAwdnpkZis0aUQ3NWpJS0ViakxOajV4aWR4WXZwOXU4akNjV1I1c2gzQVA2?=
 =?utf-8?B?cER1eElLOHJzMGtKVXNpbERZL0tqOHBOUTVHeHIxenJIQTZRdXJuZFpPZHBG?=
 =?utf-8?B?cUtndUFoSDYwMUtlb0tMdzVxQ2ZEZk8vUWw5dUFEejJ5YkJpOXFISGhUcjZ4?=
 =?utf-8?B?ZkhicjRMNGFwTjRnbXZwQzNqZGlCbm5iMjdPMEUxQzFBL1VXN3F0SE5ZLzkr?=
 =?utf-8?B?UVJ0eGl6T0NjRHdVRUlSZVhuczQrMEJ3QkFpQjAxUHBVeWN6dWs0SXc3enQ0?=
 =?utf-8?B?N3U0ZE9tYVltSFg1cjc4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RJSmFGOUNhckJSd1Z4dWZJRkdNK2VlcTRzYWlub3NZRUprcTlueFlMOUZ4?=
 =?utf-8?B?RGtockxnYTh4VGNHamNBYnJqdTZlS2k0b3lEekhic1dhVUFoS2pEWVM4dk5j?=
 =?utf-8?B?anpUU2RaVmxKQW4vS1pjUXBGMTdEcXJaYVVpaE55QVBDTG9KenAwQjhkU1do?=
 =?utf-8?B?ZGp0bXpyM1ZMUHVEaXNwODM2WmZaZVBJMVY1YTliUFdyZzBReEVic3l1NmVr?=
 =?utf-8?B?NnlEQ0dPQ2ZlWTEwZkpoZUd4bUNsRXJ1aGJwMGJ6ZForQkYyNzQ1TXo5Y3I2?=
 =?utf-8?B?dDU3aVBFYWZENll1QnNqYzFQWWFPaDRGVXBVZ0Q5WmIrZjhqK2dxd253SXhh?=
 =?utf-8?B?V1ZrUHhpdnN1QVdWT045UVhJU3BRMnBrMzBqQmZraDZ2TkF1ZmVUeHBrKytZ?=
 =?utf-8?B?b3ZNNWJraDhuVDExMVJHMWJzNEZDNkVxa2FOK0RoS2Y3QVZUdHdHdDlzODZJ?=
 =?utf-8?B?djgyeVZFS21weGJMOXhyTnh1YVk1VVFXd1p5d2l2REpzaTBleW5Zbm1oZzNF?=
 =?utf-8?B?NzhoT01EZGJGMVEzZlFkYk5jRjB2bzQxaWhhaER6VzRka1VSM25IQUM0ajg1?=
 =?utf-8?B?OGRMd0JsS3BzRkp6NVcxVnZXdFplZk9BUkZySHo3cHg4b0hxQ2huMlVQbDNL?=
 =?utf-8?B?TldTSTZWUVdFaFE1UWFHRVJhOEtnbk9KUExZejRua2lJOFBEZkswa0NyVC9C?=
 =?utf-8?B?S0ROTmdobFppTW94YU90eFkwRjV4QUdsUi9EZFRVQ0NyWnJOdGozNHFZdVJQ?=
 =?utf-8?B?QnVxK3FQNDVpMHg5TldhcXMxakNLazI1RTA1OUN4VFBtbE0yQlQ1RlJ4N1Nk?=
 =?utf-8?B?QlBDV1NyK2p4RklKK1FJZUdwVnhNeTVucnRnWXBrUTRET1FuQ2llVnV1bEli?=
 =?utf-8?B?WXJvUmgyMW1Dd253Y0lTUytlb1B6K2dhUGpGUWdHSCtCemhkK3N0b0ZuOEV3?=
 =?utf-8?B?U3NybXN0M1pNdk9ENlNEQkxJaUp3blJmelZacDNGSW9IVk05NklYRXdIbmhG?=
 =?utf-8?B?MDJsZEpFSkhVUEFWVjNSeUlOQ21JSFpRMEI2aitMTnZvdk1paUpMK0s1OWYr?=
 =?utf-8?B?RjgvRUdZMUh2eHVzRjRUZHNrVkovVWJ3cDNid0tWUmZDT05KSUhJOUw0R0VK?=
 =?utf-8?B?ODJZYXRGZytTbW1haisyZldBcHgwZ3g1Z3J4UDJmTWxHRmJQZFRkeHhnSnBj?=
 =?utf-8?B?b0R0ZTJTWW5FYlpHSmhXRkVnZXlIRjNHbnNUODhtempQTE1pTll4Z09uVFRR?=
 =?utf-8?B?NlAwNy9zZnpTRWpMcXhrSDBzOUV3UTFvaW1iVHgvNkRiWUgrbGh5bSs4WTNv?=
 =?utf-8?B?dU9NZ3I1b2labUFjVnB3MU9CYnBmb1RoSDNYNlI0SUgwYnhkYThMdXIycSt4?=
 =?utf-8?B?eEtzL3B2bklqbHdiNCt2NXFXQ3MrQmlzWDV3VEVleW55TlJrU2JDNlhBMWVX?=
 =?utf-8?B?andkZmNBYUZHTm0zNnVxRU94UXNKQlJON3ZnWVd1UnVCTVlQNlhKYjZDZDFt?=
 =?utf-8?B?Wm5DckViOXpqUk5OeW9BOGtlbEhXOGJ0NTFnQXV0S3dySVVSTXd6UWIvc0Z1?=
 =?utf-8?B?Z1ZRZSs0WWI5TUl3dWxkeGhMQURPM0QweklQSFdLaWVTdXo1bUNDZ0NMRUJG?=
 =?utf-8?B?NENBR3M3bUFEUGo4RjlObTZQVVpCck1pcEZMUHJRZ1BmYjU1QlBGM3Fydjky?=
 =?utf-8?B?aldMT2hieDA3OTZmRXNGOGphUG1VSDRrRFBNaWp2WEROSWlTMm5EMFlVa1g0?=
 =?utf-8?B?WEk5ei9tRVF0d3FZbmlIeXlrMG5JU2c1cDNMRnV2UVFXQ3hnVVY2TndtUkhv?=
 =?utf-8?B?VUMzSktOcGxNVGE3LzBPZDdVRnJQLzlmSWtoaS9yQ0dSN1liQWFHa2kzQXFj?=
 =?utf-8?B?d3FhdTI2QUZoNFc2Zk9QaTd1b2pYTXB1MytLWTJPcFllMlc0aWRqUy9Lak15?=
 =?utf-8?B?N1Z6RWVnT3REdTdKZWRZRXRLWUttajFrakNGUEsrR0I3SFlXaFI2dXhNY0lW?=
 =?utf-8?B?c1ZENDVwZWxmYURzV3RsTTZRN2hMNEQrczFvaUsxUmNNcXJESUtyQ29NU3Fo?=
 =?utf-8?B?VTRQeTBJSEw2Um5zaVpDUlpEa1JUTkJSV2JlTjcvVGRSRGNLa0lnaWg3WUZk?=
 =?utf-8?Q?iWIWdNFlgIPXeJ9DnfXMixN+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1a812d-7e72-4299-71d2-08dd70a66117
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 22:50:05.7566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIuOSthzfOs22M442MGoRGUh9u1+Gv61cJM0VH99olKdZK6NFNcNiONG5jYE31x74CH7Ys17mpSzdZqyWDr4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
X-OriginatorOrg: intel.com

On 3/31/2025 3:43 PM, Huang, Kai wrote:
> On Thu, 2025-03-27 at 23:46 +0000, Mehta, Sohil wrote:
>> Commit feeaf5512947 ("x86: Move sysctls into arch/x86")
> 
> AFAICT the commit hash is wrong.  It should be c305a4e98378.
> 

Yes, sorry about that. I ended up referencing a pre-merge duplicate
commit in my repo.

Thankfully, Ingo fixed it when he applied the patch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/nmi&id=1a5b15f6b4d18507dc3b2958ca01877cfc8808fd


>> recently moved the sysctl handling of panic_on_unrecovered_nmi and
>> panic_on_io_nmi to x86-specific code. These variables no longer need to
>> be declared in the generic header file.
>>
>> Relocate the variable definitions and declarations closer to where they
>> are used. This makes all the NMI panic options consistent and easier to
>> track.
>>
>> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> 
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> 

