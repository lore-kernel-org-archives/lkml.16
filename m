Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF01EBA08
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500938; cv=fail; b=Iz4yLYmEcR/xAQiOO+AYJxANf4l19JGDfeqGqpK1iaU/PFYo3wIkBNiSzP2d+5jWwP5DFsTX4u1GLtPzcXC7waQmlYb2hCIK+PYJ3UKMAkoiEl5WHTAY8H17Wa0FdTF7t6gtlVFGfwg09qDpOUAInMojQqS+UCMgkF/nzf2aaa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500938; c=relaxed/simple;
	bh=TVoShe+g13MIAf03pYybpJ3TVpnwqynEEWs/iCGSwuk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iDhMDUAQuNl0Wq2jfeaCZMrMPhlkq8inbNsAWGNT1KuRWuOBi/ZeKYgMd7oxSfNDqxb310SNqa0Z1URYIMJ5vmXDdyBEB+7VT52Dxgjz8Uh5o9PY45Is4VbTl0TSDmwCx2vGClcMCUviTezVV3DZTcXA7VrurJBiiS936i0kH+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAYoBs9c; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAYoBs9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743500937; x=1775036937;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TVoShe+g13MIAf03pYybpJ3TVpnwqynEEWs/iCGSwuk=;
  b=XAYoBs9cgDaxE7U5CeXS1wWCLG+DOIQlgrXxxkoOrJ8UnB8ns/W5Xsc7
   1uXblNS7VitdyQTYG3Zo5ZXXJ/I1OzuLZT9Pyh8IiqXiaA3hzUHyDLkHL
   te6XNFe0IgpPnGn4D3iuBKMSyuuBBGjR7USWvC9tm+srd3nrkkFcB5fkn
   lKmBxRx79MkBKOzUzdPMnNpGYrXccf/2oi3qZvrYOXxRp/SLimVpkz82a
   ffmV2E/FdOLSv1TRPCnvPZIW718K2KIApCRNF/TmYg8ENhl+ouF3+0ZgY
   3hp5u6lIaaKnC6gx0/VOpn4d8EVKMuGQFe8pFnUNQeCEBYllCskH4uPiu
   g==;
X-CSE-ConnectionGUID: eQrlrU9OQge3qLZPo67NIQ==
X-CSE-MsgGUID: yAekDMf2Ra2JnpWRw+SP/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48483103"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48483103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:48:56 -0700
X-CSE-ConnectionGUID: xfaBblfeQoGFEW/eea+qig==
X-CSE-MsgGUID: wlXtu+XgQXG6DgdRIQyPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126230510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:48:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 02:48:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 02:48:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 02:48:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjtgTZ49oKIAGV0f5Xs6nQfFIVm1CduwhALEMS0eCQcrkYneyGl+1cvvWEjzBNXa5nmnsMkjaKqI/1eIROT+NN3xyriVLw9xEo5qZEGChbRffLm0WZD05cM21r7Fj261AHOpTIbeZyT9ccVpTK4EmU9IcyTWUIPZk0x87JcPTZ5J2Xd7wJAbjReAXAs6qU1Lhi3yc7dQjhyK7SHz3lzkZuE5UqT8t2tQAZW3cYsaxHtbcArd8HeYj4D3wh18gWNib0JvyZ36xw7JNBpan5VPdY7USTxYe2E7VBW7DiUwzAjtPdHTRJn95DyRYMbtneYFv93/jd4h9Q2/HSJV73GhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVoShe+g13MIAf03pYybpJ3TVpnwqynEEWs/iCGSwuk=;
 b=yEPNSILc1ZTFRcRyYRxqlFAAACE2hMm1zdkpR+x8S5TTuHsilOmU2Bvhm3tFKLWpUUBO/VbhcdanWMaphV9ttTWY61garyqX2BAA8CSKGIseSCgsZjfdz+HGd+JcBSvr1aMuRZmJvnLoyq14zymJyF5NPe+PpmWMyVVGF/NRx/qwca1GbT0Q+aEMFS4Oxh7rWvnvpBGdJKqWSmijAR9m+DZhxfFKGDiamoSaaKXR66Hj1pvYoIOV5goP1hODWOiwkkbMVgkRSFXlvjPyD5Iw+udv2qtmZKex6JFntIfTcpk6gPGXpzR2/VHS+8cmXV4iLxeJgLmx7DappfJGF0xW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 09:48:39 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 09:48:39 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "dyoung@redhat.com" <dyoung@redhat.com>, "bsz@amazon.de" <bsz@amazon.de>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "horms@kernel.org" <horms@kernel.org>,
	"dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v9 3/4] x86/kexec: Invalidate GDT/IDT from
 relocate_kernel() instead of earlier
Thread-Topic: [PATCH v9 3/4] x86/kexec: Invalidate GDT/IDT from
 relocate_kernel() instead of earlier
Thread-Index: AQHbnlrO2GaQR/jJWU2rsGeEYOGHqbOOmcQA
Date: Tue, 1 Apr 2025 09:48:39 +0000
Message-ID: <7e48a0ca808c9ec0520fe7769a4e44a86fbcedb6.camel@intel.com>
References: <20250326142404.256980-1-dwmw2@infradead.org>
	 <20250326142404.256980-4-dwmw2@infradead.org>
In-Reply-To: <20250326142404.256980-4-dwmw2@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|BL1PR11MB6025:EE_
x-ms-office365-filtering-correlation-id: c6e9dc1c-f09f-45f2-0cb7-08dd71026182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SW94QmJLS1B6eUVlRmtYUlBzZEw5ZHhtRENzeVppOW02Y3R4ZWlISGsxY3dm?=
 =?utf-8?B?eU1mZ2w2ZGNlT0VBUUplK0FzWUpPOENacjBESlpWZVZvTm9iQ1VrUnZmZm1z?=
 =?utf-8?B?LzVQUi9YSjhSNWZyY2hMS2dSOHRBdUJtOTlCNUtTSDNXNW1YcUNNYlpRN1I5?=
 =?utf-8?B?Z3N5M3F1MHAvTmFGci9GYitkM2ZITGR2RzZTeE5xVElOTGRBU0hvZWh4NCs1?=
 =?utf-8?B?Tm5WVW1lNVhYaDNzOGh5ODl2SThYVW94ZWhnTlc3N0RqN2s0amFuWDNxREhJ?=
 =?utf-8?B?VVlPa09aWEtzclhSQUhoSkZqeWxOYjJMSnJ4cFhSeitmRWJOR09SNGYrT09S?=
 =?utf-8?B?TmFaa2k0U09BN295cTFmT0JHVnB5eXFOemRMQ0w1aWsyZmtqZlpyRlo1UDJu?=
 =?utf-8?B?Q3VucE5PS25yaXJuRXNDQXo2cDFnVm9zejQwVXR3TlQzUU83RkNrLzJINi9P?=
 =?utf-8?B?UzNZN2dmTW9HYnVPU1BDSjFpT2VJMmdtQ1pnNmtxdjFub2dzT2pjaVdTMWJl?=
 =?utf-8?B?Mkh3YUQzVHozNDg1bUpFNWl1S2phSGJHb2lyczlDb2FVOWtrZWFDL1dkYkVE?=
 =?utf-8?B?UXo2R2JGMmJSWm1VMW1CdHVaRzJpc3VEZXJLQ09VNWFiblNiQmF6c2JSVnYz?=
 =?utf-8?B?ME90WWJIdmN4Z2U1cGZqRFE1Q3crNlRmUFZzcnV6RHhYV29qRXROVXM0VFFL?=
 =?utf-8?B?QlYwSVdXcFdPWDZ2NCtmYU42SFkxVUpRY0N4YVovL1diSlJTVTRlc0RFdktE?=
 =?utf-8?B?TkFyRHpIdWlJbEJhUzdrOFpYaUtPQXF4em9YQ3JkMVo0cmtyUmxJMnh2S3JP?=
 =?utf-8?B?ZFdyR3Z2VXN5OHhQMEFqNXhsQzJ1eXBpTE9NTnMxc0NOT3dEeVY3Kyt4ZDRB?=
 =?utf-8?B?KzlvbHFOaStHRVVsWW5EL0xsSUVDTWhmdVRZb0U5QVN1dFI1dUFBaUlTblRU?=
 =?utf-8?B?aU5qeHlXdVQ4NGdKd3AxdXBkanc0OUNQVDBRVm9rUkdacG1JNmk5eTVCOTYx?=
 =?utf-8?B?anRoMHNCZW9mUVo2SWxodmcwTTMycnZ1YVlJYURYUEpydDhrYi9uSU1HbUpa?=
 =?utf-8?B?cWFKNlVrQWgrWjl2TTVITnAxT3ZQTDhmNHM4RVBHZ1h0NnV1UVMrWDJQdzNW?=
 =?utf-8?B?ZEpJWHI5TUxDWFNiTVpuVmxnYnp2Ty95dTBaSGV0UTJzcHhsaHpTdWtjZExM?=
 =?utf-8?B?SG9uRG5vMnRNRHI1OHQ3UHV4Mlg0dGkxMDVjUVhFNk5DdjhzR0hEejJJSVl5?=
 =?utf-8?B?Qy93dDVWa0licURXZmxoMFVPNTFwMk16Zm9WdnJmUWZPWUZvRFhWYTMycVlO?=
 =?utf-8?B?UGV0cDJxNWY5OCtWR24rdHkzanRRRkE5NDZFelJ0MWpQaVdLamZ1SlVIdkV0?=
 =?utf-8?B?dVdveUJ2VWtoanRwN0t4K0RhM3ExeSt1cEorZkpDa3dlb3JVSnIvV1ZOVEZv?=
 =?utf-8?B?dUdPeTFFb0pHSmxsV1l3d3VrWG5BQjBncGFPZFhxcDgrNjVWcGRFZDZSRkJy?=
 =?utf-8?B?Q3ZnUnlObXFaTjBSNkhXcUY4bmE4TG5ZYStFemxVY3pVb2ZqdEhnY2Q2M0d6?=
 =?utf-8?B?Ui9WOTZyRk5BdGJXSXRjdnMxY1pRaURvR3JWMm9acXhHNTZhWXcrUVgxQjg5?=
 =?utf-8?B?MGFNVjcrQTNtSEVlTlcxN245N0oxd1M0VDNsL1NOYWNOb0RoMU9UNS8rQjh4?=
 =?utf-8?B?RkhMb3hMK3JDYXpUZmhodWUvRHBqVVRWQ0gvOC8rR3UySit2RWNRaGU0bEls?=
 =?utf-8?B?NzR1K0Y4cVN1dUVVZGpJTVZnak1GbXgxOU1ocEZwSW9aemZ1ZE1xUERTSytI?=
 =?utf-8?B?WVRHVjQycW1UL2I2dzdLTjhmemY3bVZRaEozT3o4ekdrODg2SzQ1Zmhlc25j?=
 =?utf-8?B?bDcrbGN4S3FaZkVCcnJvdFVCbmtuNjZwZHhNK1d1QkVpTWtNUmZVVHMzN3Vi?=
 =?utf-8?Q?QTMO6e13Bw0uFbLwpH0Ij2ElzOu38T70?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2Fpak02VHk4MkljQk9Fc1pCSUVXUERuL3Q5QXpyc0xnaVJCZms4SiszQ3JP?=
 =?utf-8?B?QS9TajRYU1JCMTNKNm94dXJicHVnZllZTDNjcWVxS2dYbmZFU1BCYnMrVWRR?=
 =?utf-8?B?d1Y4a1JiZFJTY0NFUkFEM2lzVHNOM0dTd0w1M0xhQ2cxVjhCN2EzR1FaZ2xO?=
 =?utf-8?B?bnh2NnFtNWtNaldZUmtwUGE5MkNaMXgvUDgrU09HYkNMQ0huUWJja21oUWVZ?=
 =?utf-8?B?MWJtMTFxQVRuVzdTOVA4SkIvblllVXl1YUNFV3ZkUTNJN0lCd0hRL1pGWk5P?=
 =?utf-8?B?ODNtSUNlRXpKaHZsZTZ4RTM0TTRHdnZxT2I0UnJEVzFWQjZTOUhCR3UzWTlR?=
 =?utf-8?B?RXo3dXhJSi9XbGY3ekxuVitsZW01LzN2c3lVME5TQWZKSmpmeFVzQ1hhbGE1?=
 =?utf-8?B?cTZ5WHhPZzAxS3dhZ1JsQ1NrRkJIOStqYVpRZkJTZzloMFRRZWliY01RdHBC?=
 =?utf-8?B?K2gybysrTkVTMlZvTDRTamRwYzRmZG5RYVpaZ2FJVWJlZjc3VFpITkh2ekoy?=
 =?utf-8?B?L2hZYXdJY1c5RmZ3Q1pwT2lUQUpISGhzbmhLSlBNc1UvcERPcDdYdzdndHEw?=
 =?utf-8?B?WXVFOVE4RzFXTkxlZHkxZ0ZOZC9MbCtzSTlqOTIrWEV3K3p2aDZRajc5R2U4?=
 =?utf-8?B?SDltallEVFFFeElyU2dTRkpubGxjMTRoV0xweXQySE0reHBZUXRCS29pWFRq?=
 =?utf-8?B?QnZQRlg1M2FIZ0dZREdWdFRxaEEvK011ZGU3Z1lqcWs1SUZLKzR5MFB4OWxY?=
 =?utf-8?B?VjdQeis0L0VrOUVZNFFCYnkybjZLWTR2YXREekhrTmJwamwyRjltRUw1ZXhs?=
 =?utf-8?B?Z1VpaVZUVUJWZDZJWS9IaDJpQWdtM3Y3T2VMVEUvYkFwaHJuRTNRM1BTV0dW?=
 =?utf-8?B?ZjN4Z0h5bnQ4QXg3dFJ5Vk92dkpmaElBeEwzcXhxUHY5S0ZPK3VGaExpcUw4?=
 =?utf-8?B?WjYxK0srWFFXd3BHc3RHWXp3cTRwTlorMUE5dStqM2JmQk80NGJvbE9RL05B?=
 =?utf-8?B?bmFBSnlyTnhWd2xXSm5Hb3BRTitJMktvR2xJTDBSaGJlNmQ0MDFuckZQLzNG?=
 =?utf-8?B?cjZMc0J0VzJ2cHlqSThjTTkrc0FxenR3MmtOU3R0a3hURndYRjVaSjE2VzJO?=
 =?utf-8?B?TVFhTUlUN2xjNU9XY3VndEZMeE5JUjZFakJpWkF5RGw0RUVEY2VGR3FnVVlj?=
 =?utf-8?B?MFRqeVREVSt4OFZEMXJRdHRtZHl2bWdWRU9WdzNEWmVObHhMaU84TTRBZW9G?=
 =?utf-8?B?bUJZeEVjNzJBaFMyVGFDNlcwT3hPRzNZOHF5VEFJMEtmTWR5MG9mV2hCMTRh?=
 =?utf-8?B?ekQ3Y2l0Q0VIaThNbFhUcjYzRGZqTmEzSzhqUmVDKzFoTVNWd2FGTXZMclRG?=
 =?utf-8?B?MXFmd1ZCZTlLZzIrbzF2VjBNWlFCTjlwOXEzV2dabXJ6TlBmTitHc1lHOXhn?=
 =?utf-8?B?NnBIVmtLWDBOK3BvK296UGttaHkzMDlMQTFiVEZDWGxURlJ3dmVUZHBnZlhz?=
 =?utf-8?B?enZGRUNiWWtwdWhLQXBMcCt0YmpKU0JvMWlBa3VDRnBkMU8zQ2h1Wml1Rjdz?=
 =?utf-8?B?MnJaV0RyTEZSK0JMUy9MUjY3eTJaeEcwY2VQd2ZNTGpGSm1NRWp2ODZ1eHNP?=
 =?utf-8?B?bCsyUUVGU1YzN3JwdzNJR2R0NkhSSXViTjdjTENHeENCUnpSK0FXZjNRc3J3?=
 =?utf-8?B?WjNKcWZFTUowdXdzak1CNXpOajdyUWxDVTBaSDcyUmhTM1RMRE5VOGRseTJV?=
 =?utf-8?B?ZVc3bTcxWndCUTQzVTZ2cndjemJJcE5HdStIbEc4VFI3T1BiSjZmR2FLa3RO?=
 =?utf-8?B?TzcxSmsyQksrMUJZOSs1eU5HU2pqcVNPM2d2L0pPV3NlSzlzbS8vT1FvckZJ?=
 =?utf-8?B?dlNwS3VsbVN2VW0xMU1GamlkaHRVSmxSc0EzTjgwTUNBRUN5bzJvQmNyVHA2?=
 =?utf-8?B?V3lERUxxZzZQVHFQTExmZDF0RmZLNTQ3Y3JDOEVEQm56WWEwenZLSFFxdlhu?=
 =?utf-8?B?bUhaTlEvSUlKU0xNTEsrY283bEdGZ3ZVT2NsdklXaStWMWNZQWlxL25uMkJs?=
 =?utf-8?B?ZVBDRm4wZlNXRzMveTFlOTJOb0J1ZVhQSjhWajJPYmVmenczQStEM2tUUjN0?=
 =?utf-8?B?TkN1U05wN05oWVdKZTBGVEJqNnpXY01WS3dDQk8yVVU4NHZ0VnBURlc1a0Q1?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83B069581252754791F7787A743089B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e9dc1c-f09f-45f2-0cb7-08dd71026182
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:48:39.5779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggUa4o5FrSIwxVl3RzWoltLJJYar8rxXZ11792/5S5wBQ9CuvtNBvqgL+G7iTs+Qbo4dXhcSwPklxT95G23kNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTAzLTI2IGF0IDE0OjE2ICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQo+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQo+IA0KPiBSZWR1
Y2UgdGhlIHdpbmRvdyBkdXJpbmcgd2hpY2ggZXhjZXB0aW9ucyBhcmUgdW5oYW5kbGVkLCBieSBs
ZWF2aW5nIHRoZQ0KPiBHRFQvSURUIGluIHBsYWNlIGFsbCB0aGUgd2F5IGludG8gdGhlIHJlbG9j
YXRlX2tlcm5lbCgpIGZ1bmN0aW9uLCB1bnRpbA0KPiB0aGUgbW9tZW50IHRoYXQgJWNyMyBnZXRz
IHJlcGxhY2VkLg0KDQpTZWVtcyB0aGUgZGlmZmVyZW5jZSBpcyBvbmx5IGNvdXBsZSBvZiBpbnN0
cnVjdGlvbnMuICBBbnl3YXkgLi4uDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFdvb2Ro
b3VzZSA8ZHdtd0BhbWF6b24uY28udWs+DQoNClJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5o
dWFuZ0BpbnRlbC5jb20+DQoNCg==
