Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331626BFC0;
	Tue, 20 May 2025 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737980; cv=fail; b=V6A9vZSIVFYpDMpDt70qBrQIotTu1/heShKzFdSFSdw8s1evY/E2S1oTEgClJuzsHQO+IHrvRvYel2A2cKllG8sXcr+4MoMbKs662uk1d/+AVY7wXuxWeMInebjrAUQS6H7WCTRrCQ/B59u7++2W4TNGq/JAAsuIpeA24wHVU5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737980; c=relaxed/simple;
	bh=SYT333mOMfC4MFMrQDvElOHdU9zkodDiqzkcC6lUSls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E0MRCGnNSjNu95V8Mbu/mP2gaFk7SZDmaVpzYRWnuvizlH9uSu4UbniBlWj8/mAOemDyeC9eR5LZue/3PrhG8WftxZtOEZbdypfQYQrOFtsVn+3WOXWgMyZovtTTMLO9z/EqZ66yxId441WRYHbF8HScBmQYK203UxTPr/ReD6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXQhuVnS; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXQhuVnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737978; x=1779273978;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SYT333mOMfC4MFMrQDvElOHdU9zkodDiqzkcC6lUSls=;
  b=BXQhuVnS3/UnIoLN7nxiXTGdCgyE0qZYv4JRi9ZQtIKPZVJEFQYn0884
   LuULopjZ6XJg6vzSBqH82S/mtfKvud2rO8ydF+bvkXZTNHwxbILbLmvJu
   yKUYXVGtz4jBqenw0BSeGybXrJXNzDWSCw7fFu5iDD8nZtXGlDH+CoTgS
   XpKZjKZks3Bv6ZwVBtfGLrwVUUsRMwJEGX9maVpwhwFnGGa++sYe/j3z8
   QLTM+BoNjQSMHKcq2KPZNWCkvv+0CXWK480LX9pydLc76iYTyZ/N7dde1
   PZCujCHjU+vWXKJjaKFwr/BFcUx5Z8Gyif1riqL2xRfgfAJzLKLTryc4u
   A==;
X-CSE-ConnectionGUID: uMLbuDa9Q5ucJe6X6fyBhg==
X-CSE-MsgGUID: rWU7nQHUQ4a54qez8mNFaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60702790"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60702790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:46:16 -0700
X-CSE-ConnectionGUID: nd+8oSrxTi2T1626USJGVg==
X-CSE-MsgGUID: YYkZx7KqSUiQy7BmGEG+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144644503"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:46:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:46:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:46:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:46:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCcM3cI8GqkWLiyhHEBgwu9GI20SIcfpoVzpO3vdYdKTPa4nKWgRkEaGMSRt8X+6z7iJNngXyzvzjaquhllLB1RKJYk4FbZh+MVRFUVFsz99+uA6peNHMscb2TupsQz3gH3/OpfyE7XIpj+i5XKmt2D2VkpzQ8XhyYV3vaD4jYLMd2OmeUlBESrFsITJUZMFq7FD2c9hji6sAvhnkJYXv+OCRypQSTn1MdMxhgoRG+mPFGTnnv0Yz2RVSrV+d6xMe2wCszqv5xEcp++j3/x1hkO/rr5X4tP5ADoaGqPR4esJKoPCp3L+TQuLosqnQPanc9cBPVYSZDvt9Movbh+aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYT333mOMfC4MFMrQDvElOHdU9zkodDiqzkcC6lUSls=;
 b=riXWZkcawSLXQg+kSHSTbaRiiRX1xbRd5ipZC+t7Q+OJoc+Y9v4X8Qf0TwAzlD5cdH3ViPw0cVA/DPjRm0Ve3lMYh95PSVgxEkmB1I+8KNTPKcK0fmmpru6l0qCtJsZF0OMZ/SmOEmAj7K9huHFriAdw7PbDm+EK02LiDV00cS9MVA62rTk3gIWkwS08ROIDLNlqleogqkJ3pbLxIZ2+xmT3aS0jH/3YP0ox9QwdYjpXkWPJfodvJRwhNBvPJTvkzxEe26fpQugbPJoGYSWhY5RQk4M8t4jGmcL/J1DqfHUALWrHtED8fbNaeZHxWwwqHnQ/ZZa4/VRSRnPet3kuIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 10:45:30 +0000
Received: from IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9]) by IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:45:29 +0000
From: "Brandt, Todd E" <todd.e.brandt@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"xi.pardee@linux.intel.com" <xi.pardee@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Topic: [PATCH v2] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Index: AQHbxoS+7Wf4rkCC10qT+F3jJ+BW5rPbUywAgAAIYQA=
Date: Tue, 20 May 2025 10:45:29 +0000
Message-ID: <2ec5a9b0623e7f68ef37627f8f8a41b950a6c178.camel@intel.com>
References: <20250516170507.4064466-1-todd.e.brandt@intel.com>
	 <174773612605.1880.7682337143207967545.b4-ty@linux.intel.com>
In-Reply-To: <174773612605.1880.7682337143207967545.b4-ty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6267:EE_|CO1PR11MB4819:EE_
x-ms-office365-filtering-correlation-id: 849bdccd-57f5-4636-c50e-08dd978b701d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODFlQ0lwUVZKSmg5TFdURDJJa0w0elBtcHE1eHRqdk1rd1A1MGl0TFcwbSt4?=
 =?utf-8?B?TGNvdVBuRjYrZ2VYTWNYWUdjK1l0Ykh0N2t3cVFweVJkQ0sxZDQ3c1d5c1hH?=
 =?utf-8?B?dWR0a2JyRGNCdVVjS0xFQThXREhYUzNUSENkb2Zsdkt0enVkUVpPL1BLUk1D?=
 =?utf-8?B?blp1VnhlaDdUanVlQjZET2dHR0FvbHFpMGc4OUFqRFhkQUt5b09wV2J1VG90?=
 =?utf-8?B?YzE3czB2RHB4eFZTbUJodVZhU3dVSDkzb216emFUU0VuT3k3cVhtZ2pEM0d4?=
 =?utf-8?B?S2QvZDdUMXFXcHhlY1RWcXpYOVJ2cFQwWWFEZDhWQ0Fxd1k1dXJBUzM1c1ZR?=
 =?utf-8?B?OWJzdnFOcnorZFlSZVMvVEVORXpiKzc4emkrRnJXWlVVdE1XNUhqNlc2TUND?=
 =?utf-8?B?UW9uZEQ0MUZ5TFd4Q3RWaVN6RDhJWjlkeEI0Qk05L3RUS0FqWFdJR1Vwd2RX?=
 =?utf-8?B?bDRzRktyYWo2Vk5MRy9MclJyN1BVNmVERGVYYmRnSnIxeHRuby9IZEh0RlVq?=
 =?utf-8?B?UHBxS1RxTnNxUWtFQ05aL05TZkNualFQVWdKck5CQUlHTENiOVNqaHd6OU5D?=
 =?utf-8?B?L2FQb3hFVHRVTFMyeThDL29seGhPVGN0WVNBYVVkaG1JT29PNkFyQkNJYlBp?=
 =?utf-8?B?WWpkeTdzM2xTQmxCck1FVDhPYU5ScEo1ZXpiMXZwMC8rbG1vUWpBdnNzODlN?=
 =?utf-8?B?cnhEKytiZkZDOUhRYnc2M0xOSlhiMFFzaURUd0l0Mlo0QzArK0hYc2p6Mktp?=
 =?utf-8?B?MUxDcXhoR1ZpTjEwYXdQOGdjMEtwcEdKNFZiWnhONnJjMVVXb0Ntd29ROGFI?=
 =?utf-8?B?dlpxbnlyUHFGcXo4Nmc1MVlwWFZtVDFRZmxaK3JlbnhIUmx5azdWK0k4Qk15?=
 =?utf-8?B?TmhTQzdqMFRnakVqWklUOHlURHZBd1ZsM2wwMUpyUCtTc1QvUWRKNDRwRWtN?=
 =?utf-8?B?RnowK29ZMG1yVnJ2K0pYRHZMTlpvVGxHNEVibHRuMkF2b2IyL1N4dFQ2WVNs?=
 =?utf-8?B?ZndPTUttS0htRzNVUllhMXpVdDlJN1NmWk52UlRzK0VQeHZpV00wN1lnb3Uw?=
 =?utf-8?B?elBFWFFOaXZtL3dTck5kSmtwSkcraUp5ckpyaVBna0hYd3IvQmxPYk12S0hE?=
 =?utf-8?B?WE02dU4yQ3ZQYlBkTkQwcCs0b2RjcXdJNFNheGNhazZzRVN2OTA1aUpidERk?=
 =?utf-8?B?dm9CdWdJN2swYmdzdVdTZDVWN0dvV1FnNEVHMWJQYUpUdVRkWUJHQnhQMFZO?=
 =?utf-8?B?NGdjYjhLRERqUHhpZ2xIQ1lRQlZPeEw5Vm5uSEdtMHVUZkJRRWRjZ3dYU3c4?=
 =?utf-8?B?SVk5OUpYdmxKRjZUYlRqRStCZ3o2aHJINGcwdmFnRUhYMXp3aEZ4MFdhdnlG?=
 =?utf-8?B?QmJTaklLNWM5UnlzbWE3bk1kTGNTWVJvTE56NmsyZ3FvamllVUl2dlVrOC9u?=
 =?utf-8?B?cFJ5d3VYU3JyZkM4QXZXUGE1YlZPTXJMUkxiakhuZjl2NGk5REhVVzhjMUlU?=
 =?utf-8?B?c0p0R2hHejUzNWhrRXlHM1oxdnlRczlqbGxKcDBUNXo2c0tGb0lXVE9NNExv?=
 =?utf-8?B?OVJQTUhpejNMWVFsMHhjY2RWdFpjeWE5MmpPbnlEU3RLcUQzdm0zWVhVUGJm?=
 =?utf-8?B?YXZnQW9hcURrbytmQ0g5dnNCNGxGNGNOVTIyL084VHEzWThodU9ZU0dET3NG?=
 =?utf-8?B?dnh0cUxoWlJnYllybDI3cUd4ZWI2bjVIQjZJUUZPM0ZkWTcybXVRSVlyYUpX?=
 =?utf-8?B?VEsxNTVOUkIvL0tPUXluMjhqMW5ZbElKZHMxWVU4VXY3dW1xTEh6S2VnbXZG?=
 =?utf-8?B?Rk44MmtBU0kzK3RQb1o3SFJjTjg5SnV4QXdVc2pqNzQ3aXdRQ2wrNENQVVRK?=
 =?utf-8?B?dDJRUTcrWFh1YUN2YkJqcjM2SmdlT1BxcWozYXQvb2ZBSGF3M0poYm5tRXRv?=
 =?utf-8?B?Uzd3MEk4RS9VNDV3S1BPRzVLaldmNWFiaTZTYnV4eTZLdkFvK0d1RDlIZHpY?=
 =?utf-8?B?SXg4OCt4czRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6267.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzJVOS9FQ0ZuY0ZnSUhHSXBjL2dRVllnY1c5bXdaVFo3YXdLK0hqQUR0WWJW?=
 =?utf-8?B?Zk0xVGFyNytNQkpISFQ3NG1MTStqb1dmM2tUeGdPR2s0YTNyVzI0cDVpQlF6?=
 =?utf-8?B?OFU3Qmpjc0tDT1FJK3R6RWhhbXgyQlU1dVQ2em85M2pRUmZjZUFpeGlOdVRu?=
 =?utf-8?B?WEpkZUEralZseXZtdVJ6Mm9KZ2RpRlR0eWY1S2VmMmF0ZnhRUWhyb0UvZS8v?=
 =?utf-8?B?REVkak9EL2NiTjhTNXc0S2RyRFRhQkN2VjJPQ2daRXpLM3lXYTF6aXhWYVI5?=
 =?utf-8?B?U055anJQYlFSTElXMFFucXhROFRZQU1LZGdnQ0xHemhHSG9NeEpqS2h0cDln?=
 =?utf-8?B?VFpCYy9LRDkrRUE4NG9KNW5BRUhHSjJXOHQwemo2T3BLR0NPS2N5Z3lsamtU?=
 =?utf-8?B?aUovT2tzV0JMU2Y0ckdwMWhzdms5aXllTzVBa3B5Z0NRT2N0bnQ3R2JpVDdP?=
 =?utf-8?B?dlNoTWZZaGFnMU1mRnkza0dDY2RZelZWV2F6ZG9xM0ZwVS9pSDJvUnNkYU5q?=
 =?utf-8?B?Z0MwRitEMG1tM2VFL1N3VktjQlh2amx2YUlRM1M5S3g1SFRSUmhrOWEwTUZ3?=
 =?utf-8?B?WTZjSjdIZW04NEkrWDJFNHZaK1U1UFovR1pnNEJPWVVvNUVBOFJibHZNYWhw?=
 =?utf-8?B?YkhPVTlVbjlncEJoaEdGSU1lS1l5b1dLcmg3TGM3QkJHaTlFSGJWMjJhTmJ4?=
 =?utf-8?B?VGcrU0trTFBnRmRoOGpEaTgyOXUwSFYwR3VUQ3o2VzZzL3laYlhKcWp0ejQr?=
 =?utf-8?B?TXRzTHNYM3VST3kzRzg5VExoTi84cW1LL0VVZnVzcTZOem80ZDlpMklHUXdr?=
 =?utf-8?B?RmhsNm5ma0JacGhOZ2lQNG5CeGIrZERKbXYzZHlBWmpZb0x1QnFoaXYrYjFn?=
 =?utf-8?B?Z1dIbitlN3dTVG5NTlpqTEJtVEVHdUVrR0pFbVVmRkQxZ25nMW5Wbzk4QUwy?=
 =?utf-8?B?L0laSG02VStIN0ZVVlZsYnFYaDA0eGJ1RkNMMGJYbTBiakNoWWh1UzBVUHJz?=
 =?utf-8?B?eFdYL2RZNWxjWGQrcmU5NjYvVVpnaHJXQ2hGNm4xQkY4VVJnRVZ0V2FHVHox?=
 =?utf-8?B?c2gzVW8wSUI5ZTdzQ0IwN3NIVk9RbVBtZVlTTkt2MkgwbXAveFdWZ0w0NFZ4?=
 =?utf-8?B?RVBLVmZITGh5L054WndOY3NWZHFwODR4NTFDdmo5YlJ1alhQQ3JsYnhEb0RR?=
 =?utf-8?B?T05XMVpzNVoyVml2TlFQc0V0WkVDS0liQVRPZU5lWm9iU1NFR3JNV2hSeVhE?=
 =?utf-8?B?QjZSeVYyTXJuejRQeTdycklHN0xqRFBnUjhLWVJEVzBDMkV6aFNxOENTQTNU?=
 =?utf-8?B?eVlPUENMbGpPWDhBNk5icUhHL2lCRTUrMjM0WVRnVFVITHZaVmNqVUxXWmsy?=
 =?utf-8?B?MXZvcDBsWWs1cmR3OVZyZmZDbnRsTXVjNjZsUGlxR3AxUlBVME50ZThnUFBx?=
 =?utf-8?B?MUtwbUkrbTE5WFdiR1I1c0FDSU5BOGZxcUtGQXI3bDI5UHE1WDdZdmZSaE1T?=
 =?utf-8?B?NXh2d21uZi93U28yMm1OdmRxM0lXQXFUb1ppRFJUUU5aTWVKb3p5UDA3d3h3?=
 =?utf-8?B?a0VYaSt0V0EvUmVZNFNSd3F3aXNBUG4xcjE4WHhGVnMzeTlGaHo2bitZQXR4?=
 =?utf-8?B?NzE5VTVtNVRHLzVrZXNlZVlCWE52VHZtWmxZQ2hBUkFqNXVDcDRvZTNEZ1pi?=
 =?utf-8?B?dzlxN2F3c3NuSkROVS85TitLaWFjRnRLcW9wM0pvdnJ6Qld4QWtZUUNHZVYr?=
 =?utf-8?B?NjVQNFF4c1F3eDM1dXJZeHpQSEtpYi8wZnR0OERyUmx3VXlndk1vOFYzMEhD?=
 =?utf-8?B?YW5IU3JsbTQ0M2wyUE9PRjh6WmV1KzNzZms2UFUrUVc4cW9LeVdNNHZwNk5B?=
 =?utf-8?B?aEtyTkR2a1dCaGtiNURvS1lHWm4xVTBzWXQzTUlVNjRCM1QxT2ZPcHJnTllD?=
 =?utf-8?B?TEQ3Wm1Ub3grM3lMWWx1YzRHT1krNFQrMVFHNERhVTZuak9DZzd1dnIzVjNT?=
 =?utf-8?B?c1VaUWtLSDYvT3M0SWUzYmpZVzZxcXAvaGI3eWo5RlVjNkZuY043TlpDcnUy?=
 =?utf-8?B?U1FEeDJNdDA5UC9DL1FQMGFydjlFOHVTdXVaTEFnNUFZcUdKc2RoQ0trYndl?=
 =?utf-8?B?VWxSVUNuUmRHSDc1ZWpEV1JBYnEwM1ZMRnhVZ3pnMlA2aStsRUJMTDZPRTRk?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <890D961B662F514A9237C4785526B664@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6267.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849bdccd-57f5-4636-c50e-08dd978b701d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 10:45:29.3148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /h2JZs9s8TIMYratci1pC9D09RzIT3qTVjWQdzhxdQeVvrMRemy3bESeHB0nuSOjfUhEHu27yeiB6IvKlbEojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI1LTA1LTIwIGF0IDEzOjE1ICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gRnJpLCAxNiBNYXkgMjAyNSAxMDowNTowNyAtMDcwMCwgVG9kZCBCcmFuZHQgd3JvdGU6
DQo+IA0KPiA+IFRoZSBBUkwgcmVxdWlyZXMgdGhhdCB0aGUgR01BIGFuZCBOUFUgZGV2aWNlcyBi
b3RoIGJlIGluIEQzSG90IGluDQo+ID4gb3JkZXINCj4gPiBmb3IgUEMxMCBhbmQgUzBpWCB0byBi
ZSBhY2hpZXZlZCBpbiBTMmlkbGUuIFRoZSBvcmlnaW5hbCBBUkwtSC9VDQo+ID4gYWRkaXRpb24N
Cj4gPiB0byB0aGUgaW50ZWxfcG1jX2NvcmUgZHJpdmVyIGF0dGVtcHRlZCB0byBkbyB0aGlzIGJ5
IHN3aXRjaGluZyB0aGVtDQo+ID4gdG8gRDMNCj4gPiBpbiB0aGUgaW5pdCBhbmQgcmVzdW1lIGNh
bGxzIG9mIHRoZSBpbnRlbF9wbWNfY29yZSBkcml2ZXIuDQo+ID4gDQo+ID4gVGhlIHByb2JsZW0g
aXMgdGhlIEFSTC1IL1UgaGF2ZSBhIGRpZmZlcmVudCBOUFUgZGV2aWNlIGFuZCB0aHVzIGFyZQ0K
PiA+IG5vdA0KPiA+IGJlaW5nIHByb3Blcmx5IHNldCBhbmQgdGh1cyBTMGlYIGRvZXMgbm90IHdv
cmsgcHJvcGVybHkgaW4gQVJMLUgvVS4NCj4gPiBUaGlzDQo+ID4gcGF0Y2ggY3JlYXRlcyBhIG5l
dyBBUkwtSCBzcGVjaWZpYyBkZXZpY2UgaWQgdGhhdCBpcyBjb3JyZWN0IGFuZA0KPiA+IGFsc28N
Cj4gPiBhZGRzIHRoZSBEMyBmaXh1cCB0byB0aGUgc3VzcGVuZCBjYWxsYmFjay4gVGhpcyB3YXkg
aWYgdGhlIFBDSQ0KPiA+IGRldmllcw0KPiA+IGRyb3AgZnJvbSBEMyB0byBEMCBhZnRlciByZXN1
bWUgdGhleSBjYW4gYmUgY29ycmVjdGVkIGZvciB0aGUgbmV4dA0KPiA+IHN1c3BlbmQuIFRodXMg
dGhlcmUgaXMgbm8gZHJvcG91dCBpbiBTMGlYLg0KPiA+IA0KPiA+IFsuLi5dDQo+IA0KPiANCj4g
VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiwgaXQgaGFzIGJlZW4gYXBwbGllZCB0byBt
eSBsb2NhbA0KPiByZXZpZXctaWxwby1maXhlcyBicmFuY2guIE5vdGUgaXQgd2lsbCBzaG93IHVw
IGluIHRoZSBwdWJsaWMNCj4gcGxhdGZvcm0tZHJpdmVycy14ODYvcmV2aWV3LWlscG8tZml4ZXMg
YnJhbmNoIG9ubHkgb25jZSBJJ3ZlIHB1c2hlZA0KPiBteQ0KPiBsb2NhbCBicmFuY2ggdGhlcmUs
IHdoaWNoIG1pZ2h0IHRha2UgYSB3aGlsZS4NCg0KSSd2ZSBtYWRlIG9uZSBzaW1wbGlmaWNhdGlv
biB0aGF0IEknbSBhYm91dCB0byBwdXNoIG9uIFhpJ3Mgc3VnZ2VzdGlvbi4NCj4gDQo+IFRoZSBs
aXN0IG9mIGNvbW1pdHMgYXBwbGllZDoNCj4gWzEvMV0gcGxhdGZvcm0veDg2L2ludGVsL3BtYyBG
aXggQXJyb3cgTGFrZSBVL0ggc3VwcG9ydCB0bw0KPiBpbnRlbF9wbWNfY29yZSBkcml2ZXINCj4g
wqDCoMKgwqDCoCBjb21taXQ6IDIxOWFhZGM5NGJhMGJkZGMxMzU1Y2U1YzVhYmJhN2ZjOTZlNzU4
YTINCj4gDQo+IC0tDQo+IMKgaS4NCj4gDQoNCg==
