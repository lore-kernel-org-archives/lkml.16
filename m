Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7F26AAAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749081434; cv=fail; b=rZOEs5HdPIIrXiHVtnQKkZTNvP8pCOJ/iqrvkYMnO+z/SnYje1Yg7ig3AdZoTkZYYBg35hzLJJWLEvIzkaBXBQIQECaTZaxt4VNXv3smAWbiSZW965XdPD1e8jBGfdDXW1jVEi5uxj5Nv+ewxraApLD3JbvG0yKegMfFMeSzLHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749081434; c=relaxed/simple;
	bh=1tGafdWhpRodVrZGBfp+8cC5nS7SPVBpZ52NQVl099A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I7zr4kDuSar6NrDe1ZVupXDV0jxKaxZyc9Rp0kgD3H9OZ+C5BgETLrfbnhcLa5Y07ybtbb2B2vjdLSP4D+ZWL9LsX0p3Y9+vh7ZgctheIVHnfp3tcEWExtH8ToqSMWrjtDnxAgpl1R0EcTDwgXgrijWHXZOg851F2KALySTZOeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFOk9FTe; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFOk9FTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749081432; x=1780617432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1tGafdWhpRodVrZGBfp+8cC5nS7SPVBpZ52NQVl099A=;
  b=PFOk9FTe3Fttjxa4tf6iTCrrREYh5sznpo7F5me0dyxDNvi0gAOl39KP
   4iV9OpbMBt6T1XnJKu7t6HVY1QM+2P6OAaOy5z1IqL/YMVXifrJL1PExg
   J6d0p5XDjY+rFxe96SnOPpRg1vbEx/S6RgCrzn+HOWob3H+MBnZVIcokq
   egDWqguCArziRzq9Srf+hYjScrvFDd3a4ZD+WW7r2uxZhSNLk6WLbX3mz
   7dzj79BkodYE83NDjEPi1L8l+ADpQmZmOQCXen/iwlzC4WHw/ZklmpS3S
   yYmEyl9VgP3HGeewqOQDx9FaY8qpf/2cDaMmdW3/Jx4gClCRsfh9JXPcv
   w==;
X-CSE-ConnectionGUID: 8jBTHLKbQe+G8AZioDxEqA==
X-CSE-MsgGUID: xEilz8gQQcm99+f+KpwScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="53815524"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="53815524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 16:57:10 -0700
X-CSE-ConnectionGUID: hDBxzf4CQFiCPqmbsDRTBA==
X-CSE-MsgGUID: Zhqk8/CMRjOIDye7xpTkLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="145290976"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 16:57:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:57:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 16:57:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.75) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 16:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHKHh+fC7txLRetWOPzFU80Hry3qUAD+eqXFELuL5+kXPdDT2ESMw0/dmdIJ4qQcqw7lBDvGCxLRy9+6N6wPi0U4QFT85wvp+/R+Y1+hkrIKyp1BAe3RfRRH/bA1kIMTR6SxO4ZooPHOdsvs58jHRbt/ORqOQVi/nC59PAZz5PmjN+Y8O0EcJZ0Om23cxiNTeopEs9ogCSnHbai+I9kJrF3fzIyuN5Me5+B9gokX7WCmUawNY8u3ZOmJjxxrSl+9ylB0BCUKW/wbX/q8u3+dqKc1PzLeoTmKJ3d+tMqpVIyAMLBbM9lodldRvms5ajcnxwOIN0uhmnRS1zJR9M/2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tGafdWhpRodVrZGBfp+8cC5nS7SPVBpZ52NQVl099A=;
 b=p0ywZ7LgzmeP1WF+ZLbS7SNkzeUHZTxSsDFjsFCV1C4vaOxLy9eAIwJUsBxbvHw7bmOKPM9NvVdS3r/8fYTz5M+indTmvCWH2Urs7QWpIvfy3p6I+gNVl9ohpElT5RanlGy6Q2SGQDxSjflfWl4Gj7H88dfbFEmM/EF4nJcZq60IxH9YodwqEb7XUb0ITxlj18ocs3zvu2tAvdPXABrUFumsz5tG2jqZFJZ2K+92VMw2O6fEPTP+F3yXe/uonZM9ATHSBzNOgao3xZy4NzTMfou0+UmUNK8SGNC6pzYw3RPl+NJaoxPuAAQjQlOxjTSpxSWiaUiN2QDWn0hM5wZhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 23:57:06 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 23:57:06 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com"
	<hpa@zytor.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Topic: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Thread-Index: AQHb1OklVaYPTytbT0efy84CnI49T7PzaN0AgAA6oQCAAAIvgIAAAQ4AgAAILIA=
Date: Wed, 4 Jun 2025 23:57:06 +0000
Message-ID: <9a3f20181244d6cd4eaac6db1d16c2afd555b2f2.camel@intel.com>
References: <20250604003848.13154-1-kai.huang@intel.com>
		 <55e5b3f8-3e17-4962-af2f-75c98ccd414f@intel.com>
		 <f442380c2d8cc51b38105c6316cbe224a248fdfe.camel@intel.com>
		 <5876fb5f-dc8c-401a-833a-a33265ff1fc1@intel.com>
	 <5ebc8a6497b7dd7029fd45e7516228e65eceb6ab.camel@intel.com>
In-Reply-To: <5ebc8a6497b7dd7029fd45e7516228e65eceb6ab.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB5957:EE_
x-ms-office365-filtering-correlation-id: bf809982-e38f-402a-c9c8-08dda3c38295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cERudkwycW9rejJGSVdDU2l3MWFTN2drODhseTNiVVBkNWQ0ZlQ2NEJYcnFO?=
 =?utf-8?B?RXdHOTIra25BMktZVEpLY0toandYWHZWbzYyZ214dG5UaFdybDZMMTN6ZDUz?=
 =?utf-8?B?enJSbnhpS05KS3BQOXVRSytiU09MOGJTdVdKQ2paUnBYLzcyU0poL0paa05j?=
 =?utf-8?B?b2x5R3NqM21ORVJnMXdFaXg0UE4vN3hmWmdzbm95TWlteFZobktrOEZFdWtq?=
 =?utf-8?B?UmVseEx0Y01JbjNZdHZMYkltclBMS0wrYnVVMHBWeGZEdVFpM3NNa2ltTnZu?=
 =?utf-8?B?WmhLcWNvWEt1TVlFYktveW12SjJsVlRtZ0w2T24wSFZHd3JBOFlpZERUQVAz?=
 =?utf-8?B?MkloWXRBeGdjaTMvWmN6R21GV214SnFHZHJqTEtwRU9UQVJJOGdJbGNiY2xu?=
 =?utf-8?B?K3k3M1ZoODUrWFJQR0JHc1YrL1ZLZkZmVlRsalkva2FNdWRoODBSeWp1ZkRV?=
 =?utf-8?B?Y2tNSThPZENpbGNFUVFxbzVzbzFFdzRHK3hFaEJ4cWNsVlcxWkxkSkhXdGlY?=
 =?utf-8?B?S2ppWFBaVTFRVkFVdHgzTWRRUUZYM1FPM0VDZ0dVN2ZHVDd2Wi9LSndkZXdn?=
 =?utf-8?B?WW1zcFl0VUJqUmFPOEh2ZHRYMnAxSG1ORTZ1bHpQRkowL3dXWmNsbzlVR2k2?=
 =?utf-8?B?VTREMU5FM1hEUDRMbXNreDViQlFMS1BvaHNtZGN4Z2JYazVUdG12R0hwMGZw?=
 =?utf-8?B?WUg4NkpxamhVSENRRnY1NFpLMG1VZjBIbW1PbGY1Tys3OWxMKzQrd0ROc1pG?=
 =?utf-8?B?cWJNaXlDdjUwNUIxWlBOdkZNb0k2QzNaV2tmRDFseVk0SlhGaW51Z25PR0ZU?=
 =?utf-8?B?dlBLSjF0dkdxaGpVQ1VQUmc5NUZMM1doc2NQV3dkRDFGbkxVMHdmZlZobHVk?=
 =?utf-8?B?MjB2SW1wZy9sWjk2UDhubDVMQ00rTUhTQnlBVHhUazdaWlZCRmNsVzBqcmVj?=
 =?utf-8?B?Y3AvM2c0WDd6eTNiVDd6RGlBalZiWWhiYmpVSEVIb1NqTkxBQU44ZEU1d1Zk?=
 =?utf-8?B?aW9XVTl1Ky9HWVU3ZXdZRlpQUWdHYmdpYXlicSt6b3JSWGFaVEdqNlE1eXk1?=
 =?utf-8?B?MGZVRm5zaTh2NkNUU0xFcWlVMldDK3kxYkF0Sk5lOGFxaFRtcmJNVU1UZ0pM?=
 =?utf-8?B?aEo1Tk9STk5ZNlpPc1RhbGdmV1NlR2RkYmcxRGJ6dk1nKzQ2QjNZM1BiY2oy?=
 =?utf-8?B?NjVLRUJkQTNIeGxEb0MxV3N3YU41T2FoOEcyS2tyMEVLY1NweXlSKzB2aW54?=
 =?utf-8?B?L2Q5ejVDRm11Y01NSGNBR1NiMk9SRXBVN2d3Uk9rYXRuZVo5VDE2czBwam43?=
 =?utf-8?B?R0pkS2hDZUprY1VQMmR5MkdubEJnTHc2b2tOMVBsT0lCNWt1VnB5RmdhTnly?=
 =?utf-8?B?SXlLMXh1eGdMTENlaitxWWlvd2VkL213QjhvdGgrNHQwMytlYUJYZ2xJZGt0?=
 =?utf-8?B?VU1SS3F0Y3h3cHVJeDNsSWsxbUREditrMWo2MXV1OEZIY25NcG5Ic2lRV0tN?=
 =?utf-8?B?MkF5dFhNKzB5ZEtjWCtuYTBFMkNoaEgwRmJOQ2IrVmhaWitpTnpqRm1zSkgx?=
 =?utf-8?B?cDhMcVhHd0ZtazNMaHJNWFJ2b1h6b0k2ZHA1bVJVL2ZQQ2I5YVh0OHkwTlc2?=
 =?utf-8?B?QjI0Q3MvVUtSeXRzUFhaS3A5M1QzT3J2c1Z4M21GRDdlSEUwb1J4eVNtQnpU?=
 =?utf-8?B?a3ZOd0d0VnM3dlJFK015NEZJT1VvZE91U3l3NjhINEtlVTlwekhXNEJHcHdJ?=
 =?utf-8?B?LzdVNVUvVkJIRC9zVVVUTW12SzhDZ05MYUFiZ1ptamhBbnVlcGYza1ZDeEo2?=
 =?utf-8?B?d1B4Qno5dlBNYk15VVlNYjFpNVNUQjNxZGE1TklBL2VZK2x1eG1nbHJ5UXBQ?=
 =?utf-8?B?aTNqWHlQVWNVU0R1aFVLaHcvNERqWTlqN0FDSzc3eTJPck11d1BZOVZOWVNG?=
 =?utf-8?B?Q1hCSFpXUmlvcjJhSUdFVmZZWFNVQTN5VG53N0x3Vm5tTmRkQStKZW1iVEZk?=
 =?utf-8?Q?pVnVNy6Wo6w3Nelxy8+nDPvxSlfKcY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWxyTnVRK1dvbFduUHh6MlUrNEZidGN6bE1iMm13bm9mUjJYdjBxUmtkZHht?=
 =?utf-8?B?WG1NMzZQUVJnL2puQ2JKZGw1VnhQMWphR21EK0E4SEZRcW1WZXZzRkp3dkdY?=
 =?utf-8?B?Yy95WmZlMmZaRDgrdWlQd2pGcllBUWVQMXlLNnQ2Q1liNlNWdWdIMkdNMjZh?=
 =?utf-8?B?cStmTncrMUR5ZTdkV2hIWUFQaU5Eeld0bmppUFVBS3c5TUtXdVBOKzNIMGg0?=
 =?utf-8?B?RmMzSG5IWElCTndpTXhPZ0tES24zMGQybmtpQXJJbDFpMFRTSTBISGhKbVZt?=
 =?utf-8?B?ckNKSUZtTnJ0eGY0bGJ5Sy95dWVtN3AvbFRUOEdvb1JONkh2Vkp4YVNqSi9s?=
 =?utf-8?B?UE13a0JKcURQM0pxVjQ3cE9MdWMwa2lFUVdhbUlMQlExa09QelNPWnhRbzFa?=
 =?utf-8?B?aFI2MkFSZXhJb0NKRmZMMnc1b3JZNjNRQmNBdGlwOThFeVlPVHJjMnFSd0d4?=
 =?utf-8?B?ZmNDaTJZRDFFb25OdXkvcjdic0t1Y250eXZqcGQrREpudHFMengySXIwMFV3?=
 =?utf-8?B?L2hyN0ZoQWNSTzlDUGtVZkJhSmdEY2JKbmcrNlhUaVNPWjhxTTBzZGNzMGNX?=
 =?utf-8?B?bmkwbkwxYWtQbEJJaU9Vald1WVlqTmFWOFNNdU82cXAvUXN4eHNpRlV4ZkNz?=
 =?utf-8?B?eE5DcUIrREhuU3E4UnBsQnJEcjRoUUt4eDNRNVQxbzZSQUpmVHFIS0N5b000?=
 =?utf-8?B?dUkrcGdqUDFQNjVuZUlzb3NCVndmWGpST0NHQm9ZK1ZyMzUrMFJSZmRWbmNo?=
 =?utf-8?B?WXVkRC92VHk0RWpBLzhGSlgyd1h4UVVhZ2ExVnRNamp1ZXBRM1pHL3h1ZzJv?=
 =?utf-8?B?bTJ6MkJOdWtFZW5ibzZReG0xNmdjR2Uvc2tMYmtwai93Ly9LYVZUUHNLT29n?=
 =?utf-8?B?by8rV09RYWJvd0VmcEM0OXJSUmF2MDBRZnNidEUzOFRLN2VqU1Jtc3BHbnRy?=
 =?utf-8?B?TnFYdXlKWHRMSGFBcXIvTmxFTHFmc3ExclhlUXVhaTZCTHdoYnF2YWoyUjBH?=
 =?utf-8?B?VFM3bXNDZjBrNXp3TmsxUG5ySUdrQmNYbFIzYjJIV2lFLzJ1UmxpeUZ0dWJX?=
 =?utf-8?B?VTlOZ29zb0FUcFZBNXZzaldmMFBFbHM1RVZBZEZwU2x4YTF0MWRQZ3AwNThY?=
 =?utf-8?B?VFdjYVhmZHAyaUF3QUU5YTVTT1dkNXBLMjNnaGZ4bUVYdFltWjV6dkd2WUhC?=
 =?utf-8?B?RS9SSlc4OHlGdXJtQVRwTGI4KzVtbUFRWEdFNnJ1ZDl2ZjdkNVJGYUJKNm5w?=
 =?utf-8?B?clNFdDJUVi9JTUo1SmpTcGFLMWI1di9lTjZWVHdZQ0lLd0p2V2lUVXRkcW50?=
 =?utf-8?B?V01qQi9kdzErdEozelY4THAyZVhqSVdKVDFiNXRYaVVDeFAvQmw5cmdxSHQy?=
 =?utf-8?B?b3ZsSktTZnJlVTVrcWphWlFYanErOFdIYVRKUnUyWUFDOEhUMjBGaXR6OXd5?=
 =?utf-8?B?M3dTQ2RpUEd2R3lGWnlKZDFURURHY25zcU8vTmVsWjVWMW1KSWdMcGNHYTND?=
 =?utf-8?B?K0JVYTZOYnhCYTlqU3lOQ2JrN1orN1U3emxhVmVwemZkRDJGMFYrVjljaFlu?=
 =?utf-8?B?OFBuRUs3OEtENGN6ejBZYU9kR29ZdDQzcWZYSmhIZE9VeW1Gc3Y2ZTRvSThv?=
 =?utf-8?B?MTVpejVnaGdjNVBMR0ZiSWt5L0s5Vzc3Zk56UGo0SHlNUi9WVFl3M3FDZHdy?=
 =?utf-8?B?bElXRFlZQTZHWVkyOG00Q1YyT0hWNlo5aVNGcmYrYk1HVlZUam9oZXozZUhC?=
 =?utf-8?B?TVg3Y3MwaHBQcFZsZDJuTGcvOFkwaWFhUS9HUGxVTHNhSUhlempNMDRpQ1Ri?=
 =?utf-8?B?dGJxaEZHcktGZld5dU1mNE1GaVJTanljYlFtcjdJT2twTjdPejVuS0xtK21H?=
 =?utf-8?B?T0VDd2Q3b3R3OGZGZnFaMFhaeDhKK2ttQmp6TmZBc3Z0aTFEZVdqU2NOZThI?=
 =?utf-8?B?SzhtT2NrSUhBODg0VGpUWVBPL0tKTCt3T0IvYmJnYldFM2g3bkVFWWhmVjZL?=
 =?utf-8?B?ZlJ2bkdPaCtTWkxYcC9nR2oyL0hPV1A2OG9JdmpuVkJNQWt2NE1JNlVzenJ4?=
 =?utf-8?B?ckR5SFc4eE1SbGlCWDI2dCtXbEJFY1JpaytNcHRDcS93b0pTTktrVVB3anA4?=
 =?utf-8?Q?vDT6/e1x9CmGJ00w316hbmlgp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F28C49E373734241AE9CDE6F9C448584@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf809982-e38f-402a-c9c8-08dda3c38295
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 23:57:06.0760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZwaAEXm1Omq8+ghHzFm1px139zlLo5rX4u/khC1HCsDHVwy74a0+EKhjzkmFBp0jUx+iZ+0UmobQJcWiGvmUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDIzOjI3ICswMDAwLCBIdWFuZywgS2FpIHdyb3RlOg0KPiBP
biBXZWQsIDIwMjUtMDYtMDQgYXQgMTY6MjMgLTA3MDAsIERhdmUgSGFuc2VuIHdyb3RlOg0KPiA+
IE9uIDYvNC8yNSAxNjoxNiwgSHVhbmcsIEthaSB3cm90ZToNCj4gPiA+IENvdWxkIHlvdSBhbHNv
IGxldCBtZSBrbm93IHdoZXRoZXIgSSBzaG91bGQga2VlcCB0aGUgRml4ZXMgdGFnLCBhbmQgdGhl
DQo+ID4gPiBoaXN0b3J5IGluIHRoZSBjaGFuZ2Vsb2c/DQo+ID4gDQo+ID4gWWVhaCwgSSB0aGlu
ayB5b3Ugc2hvdWxkIGtlZXAgdGhlIEZpeGVzOiB0YWcsIHVubGVzcyBJJ20gbWlzc2luZyBzb21l
dGhpbmcuDQo+ID4gDQo+ID4gQXMgZm9yIHRoZSBoaXN0b3J5IGxlc3NvbiwgeW91IGNhbiBqdXN0
IHNheSB0aGF0IHlvdSB0aGluayB0aGF0IHRoZSBURFgNCj4gPiBjb2RlIHdhcyBPSyB3aGVuIG1l
cmdlZCwgYnV0IHdhc24ndCBjb252ZXJ0ZWQgd2l0aCB0aGUgcmVzdCBvZiB0aGUNCj4gPiBGaXhl
czogY29tbWl0LiBUaGF0J3MgYWxsIHlvdSBuZWVkLg0KPiANCj4gV2lsbCBkby4gIFRoYW5rcyBm
b3IgcXVpY2sgZmVlZGJhY2suDQoNCkFmdGVyIHNlY29uZCB0aG91Z2h0LCBJIHRoaW5rIEkgd2Fz
IHdyb25nIGFib3V0IHRoZSB0YXJnZXQgY29tbWl0IHRvIEZpeGVzLA0KYmVjYXVzZSBhdCB0aGF0
IHRpbWUgSSBkaWRuJ3QgY29uc2lkZXIgQ0ZJIG9uIENMQU5HLg0KDQpXaGVuIFREWCBjb2RlIHdh
cyBtZXJnZWQsIHRoZSBTWU1fRlVOQ19TVEFSVCgpIGFuZCBTWU1fVFlQRURfRlVOQ19TVEFSVCgp
DQp3ZXJlIGFscmVhZHkgbGlrZSB0aGlzOg0KDQovKiBTWU1fVFlQRURfRlVOQ19TVEFSVCAtLSB1
c2UgZm9yIGluZGlyZWN0bHkgY2FsbGVkIGdsb2JhbHMsIHcvIENGSSB0eXBlICovDQojZGVmaW5l
IFNZTV9UWVBFRF9GVU5DX1NUQVJUKG5hbWUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KICAgICAgICBTWU1fVFlQRURfU1RBUlQobmFtZSwgU1lNX0xfR0xPQkFMLCBTWU1fRl9BTElH
TikgICAgICAgIFwNCiAgICAgICAgRU5EQlINCg0KLyogU1lNX0ZVTkNfU1RBUlQgLS0gdXNlIGZv
ciBnbG9iYWwgZnVuY3Rpb25zICovDQojZGVmaW5lIFNZTV9GVU5DX1NUQVJUKG5hbWUpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCiAgICAgICAgU1lNX1NUQVJUKG5hbWUsIFNZTV9MX0dM
T0JBTCwgU1lNX0ZfQUxJR04pICAgICAgXA0KICAgICAgICBFTkRCUg0KDQpTbyB0aGUgVERYIGNv
ZGUgd2FzIHN1cHBvc2VkIHRvIHVzZSBTWU1fVFlQRURfRlVOQ19TVEFSVCgpIGF0IHRoZSBmaXJz
dA0KcGxhY2Ugd2hlbiBzY19yZXRyeSgpIGxvZ2ljIHdhcyBpbnRyb2R1Y2VkIGluIGNvbW1pdA0K
DQogIDFlNjZhN2UyNzUzOSAoIng4Ni92aXJ0L3RkeDogSGFuZGxlIFNFQU1DQUxMIG5vIGVudHJv
cHkgZXJyb3IgaW4gY29tbW9uDQpjb2RlIikNCg0KTm90ZSwgdGhlIHNlYW1jYWxsKigpIGFzc2Vt
Ymx5IHdhcyBpbnRyb2R1Y2VkIGF0IGFuIGVhcmxpZXIgY29tbWl0DQoNCiAgYzMzNjIxYjRjNWFk
ICgieDg2L3ZpcnQvdGR4OiBXaXJlIHVwIGJhc2ljIFNFQU1DQUxMIGZ1bmN0aW9ucyIpDQoNCkJ1
dCBhcmd1YWJseSB0aGF0IGNvbW1pdCBkaWRuJ3Qga25vdyBTRUFNQ0FMTCBoZWxwZXJzIGNvdWxk
IGJlIGNhbGxlZA0KaW5kaXJlY3RseS4NCg0KU28sIHRoYW5rcyBmb3IgYnJpbmdpbmcgdXAgdGhl
IENGSS4NCg0KQW5kIGlmIHlvdSBkb24ndCBoYXZlIGZ1cnRoZXIgY29tbWVudHMsIEkgdGhpbmsg
SSB3aWxsIGFkZCBiZWxvdyBhcyBGaXhlcw0KY29tbWl0IHcvbyBtZW50aW9uaW5nIGhpc3Rvcnkg
aW4gdGhlIGNoYW5nZWxvZy4NCg0KRml4ZXM6IDFlNjZhN2UyNzUzOSAoIng4Ni92aXJ0L3RkeDog
SGFuZGxlIFNFQU1DQUxMIG5vIGVudHJvcHkgZXJyb3IgaW4NCmNvbW1vbiBjb2RlIikNCg==
