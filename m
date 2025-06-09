Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D01253F13
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465424; cv=fail; b=WdHDnEJjHZImiHuYfywAXpHg05WhdSRPeAeK8y7RmT07eIP8wFgqjAH29CQieVWqOJOQIa/n+I4y2KkALip4WYOX7+cXHZOisyVJp2HbddM15ZjevfcxMS5bxDAjzcqmfO6pkI1+FcouVBnbt+sJWyl+8eAh0P4vReOV77XcF0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465424; c=relaxed/simple;
	bh=eH9SVeLjykM+B041L2VM0UnK+d0lD3KdFsfRGOu8YfY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GySu+U0lZEExw8quh/Bk7ooRqDMrzTMEUfmifUhv+IhLhmt4bwdHPAQLOGh1yH/ZN4HweOH869PJBdWVSC+qCfwkLGGEflgIuGCKZqjo1D7dNXLrz0W/bxUeJf7eTMViWX/GkesXnpE0t8ass0L1EH18fuxgWpKRE3pRnGdRk/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ci+8C/qj; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ci+8C/qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749465422; x=1781001422;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eH9SVeLjykM+B041L2VM0UnK+d0lD3KdFsfRGOu8YfY=;
  b=ci+8C/qj3Mup5nd2u0eAQd6add3miFhsdCad8yp3KbyuXR7tNvyOuO/m
   xNxi9w6xu2F6IEB9OF0hDIZ0yjQrdNejDf7IbgwVG4yjuS8fJGfMm6vkD
   cIyTyDAUG44VhjAGhGUi2B1zmRL60I8Var2POjjuauev78rDQZO/evPaO
   +MmfQZbb6b5no4hX1AFgAH7JUcjALesnUB1xfFpOmsy/0Fo9sVnbtRiAp
   HQq0yxgu2PeVDFRtzrlyoR5i1sUPaqmZhfGSyhgDjHdghhEUnRmM2DnnC
   JJ71YIoxEeAosNw/mai2iDZan7ltGQPcsoLV13SsRiY2Jx4zpJfKG/YKR
   Q==;
X-CSE-ConnectionGUID: 9b7PyyWwQ9CrbCZBBGXRSQ==
X-CSE-MsgGUID: Kwo+S4OERWqgkW+HiBLaHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55340393"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="55340393"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:36:57 -0700
X-CSE-ConnectionGUID: v21jef91RLukZpNiphD3Wg==
X-CSE-MsgGUID: NJgfD9MRT3m7JR/vhOH8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="169650797"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:36:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 03:36:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 03:36:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.74) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 03:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFA/wW8hYPnjS3s0CIWlmF+aQvByq9ggEveAzjxh1IlcvOHOeWJt01J1LE7zjjMKdOgjpzfKfl/5E/B/p7WST8g/TQvSp5k1m2xQXWaEt5ARwZOwMJ57xBORJ1+b3Rzg84ousd/7RL3fLXAtHmQujOhP7cfYjMuBbGnA4xYJfzascCsCL0cMFOAQYPGfgKI226iQ8GuJpA4BsbLI6CSBk6UmZBqKWzGx6zsIapNu2ChEqLH8PBy+ou0gpgiVEautXeigFwoDk4+qER5txYJFJAiVBJLTD3QFPfnYjfSW04c9MorklZQEoVCfBc6Pud02hg6b5WMEp6MHDFLBGqiDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH9SVeLjykM+B041L2VM0UnK+d0lD3KdFsfRGOu8YfY=;
 b=rmbx3aGNnvgkcemcShAsy3cN5t8ZUlgdDZUX0l+ytYkeBz5KyneFyaAq6o0ke1Gy67ia6RGR/Eu++Ob1gjIC/t2L6yNrD/h5fVA9EtNoNOy5jxJKTjD1raayFsQDwhhpSPbPSBhHlluZRc6FTwSSbZ72dkNsAEDsHSG4JG924CpSjxyOHAR+W056KeMVUVmlxTGeSVttOlAMFRbH1dpHZ6uR4ua6ChPoF/ErQqzBGQM0R63Zl1KgzGFilP0AruJXpG1vOxfDAr3kKjw/FLIFz4ZgZleTkZ7jYotRD1NAVan3hpYHnTjKjxJdQqS16/o8JazSm5xbWBGMMdwYfRj+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7452.namprd11.prod.outlook.com (2603:10b6:510:27d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 9 Jun
 2025 10:36:52 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 10:36:51 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>
CC: "samitolvanen@google.com" <samitolvanen@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3] x86/virt/tdx: Enforce no indirect calls of TDX
 assembly
Thread-Topic: [PATCH v3] x86/virt/tdx: Enforce no indirect calls of TDX
 assembly
Thread-Index: AQHb1uQOdVh17hEqHU62YhyCVIxPTLP2SdsAgARdLIA=
Date: Mon, 9 Jun 2025 10:36:51 +0000
Message-ID: <6738356acee148b2017642baebc9abcb332231bd.camel@intel.com>
References: <20250606130737.30713-1-kai.huang@intel.com>
	 <ade8a82a-23c6-4a7e-968c-e4b0d4bcbc46@intel.com>
In-Reply-To: <ade8a82a-23c6-4a7e-968c-e4b0d4bcbc46@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7452:EE_
x-ms-office365-filtering-correlation-id: d5f6935f-d79d-4ee5-2dfb-08dda7418bf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1Zwb2JtNnJaUmdsdHlYK2l0UVR2MEdyS25Ba1g3RHh1ZlVYUjJTYzBYVkND?=
 =?utf-8?B?YkZEUGpzdXVJaDZ6TWRwekpUR0t2YUdkQjh4MWFyYkhTK2c5YUxFbEZIaFZS?=
 =?utf-8?B?b2VoWWlBRFFNb0V1Rk8zNTNqS3doK0M2NXUweVV6Vmc0TDFhanRFRHJrUzln?=
 =?utf-8?B?eUFrdXF2d0U4U3B0bGtsT3NvamtOdUh4TnNUUXlOVjE0RDZnU3h6V0E0YmpV?=
 =?utf-8?B?WDFhVEJoWWoySzAzNWRHcjhZNVVZMTdkZ0xHZy9tOXYzdnc1eHNSdVZ4Z2Er?=
 =?utf-8?B?SzdsWGVxOEtqMGZ3MkNna0JlL0VhWFBxc2FZcnpheUN2Rm4xTWxWbkVrSmZH?=
 =?utf-8?B?dldzcjR2MHRyWUIvakRSdmtGbW0vNjlwb1FuY3drUUFZTlNaTWhta25Sczly?=
 =?utf-8?B?S3YrSVdRS3RsUEZzaG1GMlRsVndmSnhmWGhmUVJVWGcvT3VHNzB1eVpmRnJS?=
 =?utf-8?B?d2Y0U3V4cHl2NnVuUXYrMG5Xb2o5Y3VwZ3N6Z3E2R01acXJxMzdZZm1MRnFv?=
 =?utf-8?B?WkUwRU5EUkUvYUM1NEN6Nk5JUzROc0lZSnpqaGd3RXRWWmlsRElHZHRaR1l5?=
 =?utf-8?B?MWhXQklxeThhZW1GM1czcmllSXZVeE4zRlVXT1R1UVZOM3I3VEd3cUlPcFcv?=
 =?utf-8?B?dm9BY3RicjI4MkdjeU5KZlNxRjZHdStuOVNXVU8rbnlQNHl2WmI1SlNRN1Vq?=
 =?utf-8?B?TG1qN01BT2QxcEJITGdSVDhaLzdhYnRMZzQvS1RhcmcrZHpJWGRyTzhtRWdV?=
 =?utf-8?B?dGJrM0FEY0Z1dmRwZ0hpZFRldm9qYTFBblRneG9TOENKYUJTd2IxSHdvMmR3?=
 =?utf-8?B?Q2k2WjBnSXBPVGw4YitlV1pSMkJiVWhyakxEcVQ0TVpjMVhZZHNZcDdOcVd2?=
 =?utf-8?B?bDBKdFlHcmxObmlLMkNsUEErWjZ6aU9BaDFLdWoxUE5RMDNwd3A1TDRuY0xI?=
 =?utf-8?B?S0YwTjVzOEtKRDVNVDJKL1JyaUNKdy9oZVE5SVgvRkpjV3kxOU9ta1RGOCt1?=
 =?utf-8?B?WXU1N3RQdDdGZk1QbmI1SGtaTUYzN21hRGUyQkp1Q2RKVnF3bmt4MlRCNUdY?=
 =?utf-8?B?VlBMbmhZRytYRWd2aUdBanBQV2RrT0JsOTFmK0NCY2F1b1FXSnJIdjdZRmZt?=
 =?utf-8?B?RWpUa1hzVEdVUWI1OUJuRW5UcjJUTTFLeEVVbkhQeHZ4dVphVHJndXZid1p3?=
 =?utf-8?B?Z0VMM0NRdVpkYnVRS28ybGNTTzhVdUpRMm9XZ3FHYkdvbHhZOUVwZ2piaG9j?=
 =?utf-8?B?ekRybXYvcDM4aSttNDU4QjFwelhTOGJLUVBZQ1luYzg1VTBPemtUOHI4cjVu?=
 =?utf-8?B?WnpiL2tPTlRzZzhCZ0wzQ3pyMVdobnJqN054aEtqcVFYdEVsL1JBQjJlRGJN?=
 =?utf-8?B?ZjEvdWhBZnVPZ2VQenFNdWNKUXM2NjVNVmYxazZESlB5SVJQM3FjQzV6Z0RL?=
 =?utf-8?B?SURlL0ZqZkNrcUlXUktnUytSK0pkb0UwcFdLODZpNk1uMGtVemZuem4zSTdh?=
 =?utf-8?B?bmQ3Y2JzN1lkb21ZUC9mYTZJNWZQeEpZZlczZzQ1eGpTeWt0NHFnZlR6RTYy?=
 =?utf-8?B?RHNmVU9kZHA3dkxGaDhMQ1FobHNUeE1ONzJndE1aVXBLYno0TFBhWVUvR1Nn?=
 =?utf-8?B?OWVIVmtuWmRkNG9Ydi9JZkYvZlUxYllpUEJiTSthNlJ5VlUySktjVTJjYzlH?=
 =?utf-8?B?emNaVEV0TzdJOVRhT1hDb0pXSk9LdWN4WE15M2czTmxBWEYwaDhtVVNPVlJi?=
 =?utf-8?B?Tm4wV3k5OUVnZEZic25SRkRvcy9XUXRNOFFXOEFzZERacWdqOTFmNHN4bHhB?=
 =?utf-8?B?SlhrYWRTL2d2dDZycGJoTXhZK3hjNGJZSWpNWFpGd244K0dqajNXa1dlcEk2?=
 =?utf-8?B?b1FSZVNvNmN6WFhHcFdOWUxxNit5RU1BSWFEdklpSE9CbHJrSHduYzZVUkl3?=
 =?utf-8?B?eTBaMy9BTnFJWHR1bHU4QkdHSkFoM3QrM1ZZd2NYZVE5WkdndEZvU0Y3TE9k?=
 =?utf-8?Q?lgdK/RJ2Kne5MNyXW5o2O7YK2DcGVU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzFEbWtLelVLWk1FNGcrMVNoMkJBUFVXRExHaUxZanRrY0wzdkNydEZtb1Rr?=
 =?utf-8?B?ZG9ZcnpjY2hObjZUSTFYSlJ5MCtqZzRjRVFXN2VkMTJjVHBGY21PNE5sMjhW?=
 =?utf-8?B?MnoyNndrUXYrYzJXTDNPaTYrdjNlNkRDek9IN1JiZFRtM2NoVUxCRTNqV2F5?=
 =?utf-8?B?WnVoVTN6Tjk1MzJRRVhyUVZEY3hXazltZHVqSkVVREZDLzgvcVZwb3l2Ukh0?=
 =?utf-8?B?L0RZTVVKVDRiSXZGci9nSkplZnljdEhMTFRVSW5JQm9KMDAzTzZyOUh6M09W?=
 =?utf-8?B?Wklha2FVR2h3N1h2T3FzZmtUa2YzMThjYnRsc1dCMk1DdVg1QjFUUnZkK2Fu?=
 =?utf-8?B?NXpZWVRPN1dDU0duay9SVURhajBFL3VLcjdLdDhmUnhYaVBiR2JPUXMyTnJD?=
 =?utf-8?B?WFR5aGFmSjhqdTQ0Q1c0SXREVXJEWEE5LzlYTVdUeE9IclkxSHVJeHZheElk?=
 =?utf-8?B?UXM0UC9JRk9lZEJoT1I4Zlp6Z2w4N2ZJaWswUkFDWTNxSE5FUDlQVXcxQkJi?=
 =?utf-8?B?YjNkWGtRNGxRdTFHNjYwNC9LeDgwdHQzTHczbTJCUnVqcUpBWWtqTk1hbGlV?=
 =?utf-8?B?M0xxQmdyMldZRTRrZ2hsTGZDdlNxL1dncnd0cS9VMzU3K29ZV3ZsdUZaWTFt?=
 =?utf-8?B?MjNPRExWUm9qTnNpOVpwdU5OeENDcm9IajAxbVBtK1QrYk9DbE1yeCt4SXgr?=
 =?utf-8?B?dEZPUnFpOFRySGp4akpNNjY1U09xODJ6MjI5c3FVdlk4aEdURHpLbGtSaEtM?=
 =?utf-8?B?T01jUUpyZ0lMWW5NTDZYZ2piZXRKbGExZmZDdGJlaGRQcTlha1NXbFprVlUy?=
 =?utf-8?B?YWYxRG9nZytqTHZ0eWhCTTk5MzVZZThEb090UmNXbVZ6SHljNlFtMjZuMGNU?=
 =?utf-8?B?OGlycGE5aHdqVGVqeHI1WHZVSUEyb2hueTNKQ0tDbmczeis4a094YUxHS0hL?=
 =?utf-8?B?WnlFYTgweStYOTRSandiRlkybDdUa21DWU5mbzhRUjM5ajVuWDB5NjFDL2Ry?=
 =?utf-8?B?b3g1TWw4VDVESERYaDdYN2hqWTRtU3hlWTBKTUpVci9hODRJZ1V5ZUF1QXo3?=
 =?utf-8?B?L0M1VXQ4OEZ3TUh3bzFFU2VhMnM1cThaWXhiTi9qMDdLdnl5UVBmNFVsRXk0?=
 =?utf-8?B?dUJ1YUNyQ1pNSkowNmNidnR3d295emVoSEN6NDkydEMzWWp4V1FMT000bnhG?=
 =?utf-8?B?YVpwOXc2a3dwdmZDbmh0dmV3bmRDY0p3Sy96RFByMTlORzlhalNSVkwxTXhE?=
 =?utf-8?B?dGgzb05Fczk4U203VFlwWnBpWU1veFA2YjlZMExGdkFnVGNsM2xkRytMTUhY?=
 =?utf-8?B?N3l0amJydjZDR3Y0cWNLNnBUcmY5V2N4T3d6UkZhZ1J3T1J5RWcyMU4xWG9N?=
 =?utf-8?B?VFBjZVcxRXZJQWRvemRqRytMVUoya216NCtmcTBsbHJKK3AxMHFPWHY4VEFa?=
 =?utf-8?B?YWZYdS9BR2ZVMFkrY01sb1FqaFVOV0dHQmlzVFNBNi8vSHBNSUVsVCtNVTJh?=
 =?utf-8?B?Q2pPTmgwYTdwS0cyaDBLcHV5aGJMcnQydkliejdvVjVLZGd1Y2x0eVZaanlu?=
 =?utf-8?B?RkhiK1NFbXRzWjBVYWhiUW1yTHhmcTNwVnNQRjlIZEtxVktGcStaT0lYTi8w?=
 =?utf-8?B?eHZmUDFQYW9DeWtnYlpTaG4yNlpFK0FtUmM0S01ad2ZCbWQ1Ym9ISWdBeDVk?=
 =?utf-8?B?SUZDMlFMT0pPWUptOG5FaXB5T09YSWJuVEdEUmFYS0pXc2xrbm1qN2Q5aEFm?=
 =?utf-8?B?N0t2a2IyTHFxUk1aZkJsVGw4aW0rSFM3dGtlM3F1dkpFYnFKOExPSEhBTXVa?=
 =?utf-8?B?U2xyVGg3emk2TC9aMkFUR2Y2N3F0dkJCYVB0V3pzRStXZmduRkwySk1rSDF2?=
 =?utf-8?B?OTNEZHgzN1dOY2JhTVVBVWNtOXZxTm85OU9wRXhKT2xkSWVuem9lQTFRRjRq?=
 =?utf-8?B?V3JuVW1GYXp2Z2krYVd5NjBTbk1NTTEzODRVa1dlcWMzaDdsc1ZrcitZV0NP?=
 =?utf-8?B?eDdMU2tPVXR1bkxlYW1VSUQ1SjR0eE43SVRCNG5pNzVQZ2ZFdmUrRWN6SEVE?=
 =?utf-8?B?eGhUaVR5WmgzYWJSaWZvQThiL25Sa2lFYkpTeTN6NGhNUFBlZ3UvcFc3cXlJ?=
 =?utf-8?Q?PmB7Sf5+vNKL8H/kzWT4nSxQE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F732567F8FCDA64A87FDDA019210239A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f6935f-d79d-4ee5-2dfb-08dda7418bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 10:36:51.8799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAALZy9wjl3WJRO/HVWJQTNbeyV1+J4dqrlAGyCqPAl44yzSZAN0gwdaM2YoKFEGIkd9nMY9S/4bBWkIecg42A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7452
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDA4OjU4IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
SXQgZG9lc24ndCByZWFsbHkgImVuZm9yY2UiIGFueXRoaW5nLiBCdXQsIG9oIHdlbGwsIEknbGwg
anVzdCBmaXggaXQgdXANCj4gd2hlbiBJIGFwcGx5IGl0IGVhcmx5IG5leHQgd2Vlay4gSGVyZSdz
IHdoYXQgSSdsbCBwcm9iYWJseSBhcHBseToNCg0KVGhhbmtzIQ0KDQo+IA0KPiB4ODYvdmlydC90
ZHg6IEF2b2lkIGluZGlyZWN0IGNhbGxzIHRvIFREWCBhc3NlbWJseSBmdW5jdGlvbnMNCj4gDQo+
IFR3byAnc3RhdGljIGlubGluZScgVERYIGhlbHBlciBmdW5jdGlvbnMgKHNjX3JldHJ5KCkgYW5k
DQo+IHNjX3JldHJ5X3ByZXJyKCkpIHRha2UgZnVuY3Rpb24gcG9pbnRlciBhcmd1bWVudHMgd2hp
Y2ggcmVmZXIgdG8NCj4gYXNzZW1ibHkgZnVuY3Rpb25zLiAgTm9ybWFsbHksIHRoZSBjb21waWxl
ciBpbmxpbmVzIHRoZSBURFggaGVscGVyLA0KPiByZWFsaXplcyB0aGF0IHRoZSBmdW5jdGlvbiBw
b2ludGVyIHRhcmdldHMgYXJlIGNvbXBsZXRlbHkgc3RhdGljIC0tIHRodXMNCj4gY2FuIGJlIHJl
c29sdmVkIGF0IGNvbXBpbGUgdGltZSAtLSBhbmQgZ2VuZXJhdGVzIGRpcmVjdCBjYWxsIGluc3Ry
dWN0aW9ucy4NCj4gDQo+IEJ1dCwgb3RoZXIgdGltZXMgKGxpa2Ugd2hlbiBDT05GSUdfQ0NfT1BU
SU1JWkVfRk9SX1NJWkU9eSksIHRoZSBjb21waWxlcg0KPiBkZWNsaW5lcyB0byBpbmxpbmUgdGhl
IGhlbHBlcnMgYW5kIHdpbGwgaW5zdGVhZCBnZW5lcmF0ZSBpbmRpcmVjdCBjYWxsDQo+IGluc3Ry
dWN0aW9ucy4NCj4gDQo+IEluZGlyZWN0IGNhbGxzIHRvIGFzc2VtYmx5IGZ1bmN0aW9ucyByZXF1
aXJlIHNwZWNpYWwgYW5ub3RhdGlvbiAoZm9yDQo+IHZhcmlvdXMgQ29udHJvbCBGbG93IEludGVn
cml0eSBtZWNoYW5pc21zKS4gIEJ1dCBURFggYXNzZW1ibHkgZnVuY3Rpb25zDQo+IGxhY2sgdGhl
IHNwZWNpYWwgYW5ub3RhdGlvbnMgYW5kIGNhbiBvbmx5IGJlIGNhbGxlZCBkaXJlY3RseS4NCj4g
DQo+IEFubm90YXRlIGJvdGggdGhlIGhlbHBlcnMgYXMgJ19fYWx3YXlzX2lubGluZScgdG8gcHJv
ZCB0aGUgY29tcGlsZXIgaW50bw0KPiBtYWludGFpbmluZyB0aGUgZGlyZWN0IGNhbGxzLiBUaGVy
ZSBpcyBubyBndWFyYW50ZWUgaGVyZSwgYnV0IFBldGVyIGhhcw0KPiB2b2x1bnRlZXJlZCB0byBy
ZXBvcnQgdGhlIGNvbXBpbGVyIGJ1ZyBpZiB0aGlzIGFzc3VtcHRpb24gZXZlciBicmVha3NbMV0u
DQo+IA0KPiAuLi4NCj4gDQo+ID4gVGhpcyB3YXMgZm91bmQgdGhyb3VnaCByYW5kY29uZmlnIHRl
c3RpbmcsIHByZXN1bWFibHkgc2V0dGluZw0KPiA+IENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0la
RT0xIHdoZW4gb2JqdG9vbCBzcGV3ZWQgYSBidW5jaCBvZiB0aGVzZToNCj4gPiANCj4gPiB2bWxp
bnV4Lm86IHdhcm5pbmc6IG9ianRvb2w6IHRkaF9tZW1fcmFuZ2VfYmxvY2srMHg3ZTogcmVsb2Nh
dGlvbiB0bw0KPiA+ICFFTkRCUjogX19zZWFtY2FsbF9yZXQrMHgwDQo+ID4gDQo+ID4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDYwNTE0NTkxNC5HVzM5OTQ0QG5vaXN5
LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvIFsxXQ0KDQpBbmQgc29ycnkgdGhhdCBJIHNvbWVo
b3cgbWlzc2VkIHRoZSBGaXhlcyB0YWcgaGVyZS4NCg0KU2luY2Ugc2NfcmV0cnkoKSBhbmQgc2Nf
cmV0cnlfcHJlcnIoKSB3ZXJlIGludHJvZHVjZWQgaW4gdHdvIChjb250aWd1b3VzKQ0KY29tbWl0
cywgcGVyaGFwcyB3ZSBuZWVkIHRvIGFkZCB0d28gRml4ZXMgdGFnczoNCg0KRml4ZXM6IDFlNjZh
N2UyNzUzOSAoIng4Ni92aXJ0L3RkeDogSGFuZGxlIFNFQU1DQUxMIG5vIGVudHJvcHkgZXJyb3Ig
aW4NCmNvbW1vbiBjb2RlIikNCkZpeGVzOiBkZjAxZjVhZTA3ZGQgKCJ4ODYvdmlydC90ZHg6IEFk
ZCBTRUFNQ0FMTCBlcnJvciBwcmludGluZyBmb3IgbW9kdWxlDQppbml0aWFsaXphdGlvbiIpDQoN
ClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBhbnl0aGluZyBtb3JlIGZyb20gbWUuDQo=
