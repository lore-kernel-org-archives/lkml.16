Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E423BD13
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070370; cv=fail; b=LSDbYP8sedbyJEQqiuOM3naRiQyDkRQto+EUgS861yzMJdtoGVrXQQH4DS4tDu30XgH8xI+rCApztuzWt8I8VgLGLFjB2rzczZbC0iWiO1LK2pNgPij/pi4kfNO7WBb8cq6AKaEoaaY93mNTv/pIsfpOPVFf6Ozd9P3fFsmXqMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070370; c=relaxed/simple;
	bh=ywpJf6zL6W9kE6eE2L4g/vZTe0HwLTz7GvXthLUNb+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d+hxahSRe/J/GmsndAj974VDj4NhhCv2NYaHR4/FVjIvliAG9QeTKYjVbtUE5YomwBu7YdTntoPjM9e0c6etE0LuCCkyOn8Ez3lK20XsJmwjFEr18fDVcDjuNK02eZ9B/8IH9qMTdAPXsf3+9nG4xV7FKxaS9FyGtO/B8j1YoRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j33uIPKR; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j33uIPKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750070369; x=1781606369;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ywpJf6zL6W9kE6eE2L4g/vZTe0HwLTz7GvXthLUNb+E=;
  b=j33uIPKRLluYXk9FGyP4Ww2A+7QXxGregO6NQAXXO5nLmUzEhz57NVTR
   CUnWQv1mZGntMei7h27GuUeFQGfySDPhvMbjxuljeBr3AmeKjH8J/FAQV
   NagcCGxpXa0lg0vw5Ceif+IRoeLybEQV6j+KzhSaSD0vu6qUpPWE4ya43
   LHRJKBIT5SRqHAgZmDOFkfVYGYLK1fKxkZLNrwNJrCpz2P/YEBOFRKC50
   NVFarxgM0hTDQWJBYBq86AYO276rhu6lxygYBDYy+2Yg4pFS0jsZwF+IT
   KGsA8pAGSgF7dZ5gGEmcx4sRK5C7tX8tXOevXjkDxIgoLCn4w8DUoEt3w
   w==;
X-CSE-ConnectionGUID: MYK3uCWtTxuNbOI5cprT+A==
X-CSE-MsgGUID: sSqlAS2HQni6DS85eYornQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56010097"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="56010097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 03:39:28 -0700
X-CSE-ConnectionGUID: Kp6ff/weS4mEzNmBZ3uCkA==
X-CSE-MsgGUID: U4E2aMTNSCu83koATJlP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148340391"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 03:39:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 03:39:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 03:39:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.85)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 03:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb0NtUz7UW8fhZsdxFPMDFGCO7zm0Mky3L1BcuUEp/4PKWL7eXPCe4gQqfMJxD8pFPbXj5Ju0ZN1+4bL7Wo6MvzBfV6BwpUE3tq5/cdsYg57d9b1gKfkgGHwcjN0ik+Hw7kWKq0WuwPsaF9Y2y3BeTmrkQnTS5nvZZkVxmu2XdE40592HzClnbc4rFz293VOmLGhE4hV0q40R/osqwC+MQ2UODkiYKp3R0OnNX7NhoU8+tSPRwsC65YWu6CXRayFSs7kbSMoZrA7DHGpZuc/t09Bdhgm1BPwSreXTadrNRD6kWnFBNRT6rGhu89TAbTQGaX4G/IlsHm5erGGQRqnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywpJf6zL6W9kE6eE2L4g/vZTe0HwLTz7GvXthLUNb+E=;
 b=kGeQ+6GHAcuPzF5QrZy8hlt3CYB0HjkYT1xWqltlwukuD0NAtQ6SVFRAT4UNWzyhM61mjY9pnj7ghS6uVvvkDOkCCpYC6K0jn4tcMOMmM83rm+kwuS2pBRC+D8R0AYW1pfkJLqG5pLybiWjP77eI2NXjVuM08BH42PmZJSBmD0CkVCzjuvAfu0ufrCLVrXkipRwbnCeSsHUWYWzEEm1Kf0I9udJRUGV3Do/O3v8m+/6NEeHT4/jCQdpmQvp7iTTiG+rK4Jl/VQlyE0UWsbl0hjEG4p3EwP5CDCrlMZnkbdZ6kUVWgQc3YBu2nVlPCeTbP8VOIVQYKhiO00e1bq4dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 10:39:25 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:39:24 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	<seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "Williams, Dan J"
	<dan.j.williams@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>, "nik.borisov@suse.com"
	<nik.borisov@suse.com>
Subject: Re: [RFC PATCH v2 6/5] KVM: TDX: Explicitly do WBINVD upon reboot
 notifier
Thread-Topic: [RFC PATCH v2 6/5] KVM: TDX: Explicitly do WBINVD upon reboot
 notifier
Thread-Index: AQHbwZ5HgFp1ykepOka3xzHJfyBpNLQBK6YAgASm8gA=
Date: Mon, 16 Jun 2025 10:39:24 +0000
Message-ID: <8327b8ebab52a7b38431169193e7281e92e9bf01.camel@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
	 <20250510112503.23497-1-kai.huang@intel.com>
	 <3a7c0856-6e7b-4d3d-b966-6f17f1aca42e@redhat.com>
In-Reply-To: <3a7c0856-6e7b-4d3d-b966-6f17f1aca42e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS0PR11MB8205:EE_
x-ms-office365-filtering-correlation-id: f87f5f2f-9562-4a75-13a5-08ddacc21005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M09ub2hTdnh1eFUzM2Y5U0J5ajVMaXc1R2xZMTRDZXZ1N0FjSEJNdXFIc1J2?=
 =?utf-8?B?SnRPd0JtNGdxYVhUdjlVS3pidG5MQ3VYKzN6U1lKcHZ0dTN2RFgrM3Q1NDd5?=
 =?utf-8?B?UkZ6UWJyQVF5V3R6WVkwMWg3bUxXcHBkS1VvbVZ0S0Q2M3FaMEc4eVBtVkJa?=
 =?utf-8?B?eGFkOEJkT3pKOVViUnd3U3VrS1ZHbzNjZzhyU1E2eDF0d3lWQ0pvalF4V09B?=
 =?utf-8?B?c2Q3cHp2RnJkVFVPREl5bzBOQ2QvS0hSNkdPSTRBYnpJcUlmSmU2SVdlSm9J?=
 =?utf-8?B?WExhbDBFTjRRc2V2aWZtNGJobm1zUEtxL2pHbndlT3FOaXRtOE9KUHBjcG1G?=
 =?utf-8?B?NFVja1BDSTdndTdFOEp4MG8zUGdaNmZRQjBCU05kSWE4WXhJNW1hUmtibDB6?=
 =?utf-8?B?OGlUT0svWWMwcHBxTTNiTVlQTENTQStZb2Mya21LY1p0b2RLVGttZ1lCa2JN?=
 =?utf-8?B?UDQzWnY5QkwybmhHcWd4TlRUQ3VYN0g4OTd2MjFaYUFtQnR0VmJzTWtkc2NI?=
 =?utf-8?B?Q0d1Q0c5SVFDcXAveUJuU2FHQjZzTmN3VnJJTEJtcVdJcDhHWUloblg2bVBn?=
 =?utf-8?B?aVFtTG9QeVhwYmlnLzBRUVljbWlQNUQvbTNBam0vNGpOZzNKTWJreHdpc2Nn?=
 =?utf-8?B?L3I4aEkzQjd5dHhqYjkrV0xDYnlFUUNYRUpmanZidytiQTNJdXIzZEp4RWZB?=
 =?utf-8?B?YkhITGp5V1N2UXNNM0VYY1RXd0VmZTF3eGliRGl6OURaSHpibWVjVnVTbm5V?=
 =?utf-8?B?U1VmMmpSdXVWRTNVNUllQmRhdyttak5XZmZmMzRtSUlTWUpDMmRGNmdnVGIw?=
 =?utf-8?B?OEY5MHZ6NnIwMmhDeUkxN0tLaTFkM2NWTk50UTRucWxZUTNTbmRGcDBWeVox?=
 =?utf-8?B?S0hlTUJFOWJRRGlETGlEbkV5YVlqYW8vSUlkSmJRWG5jL1F6RE5DYmswUXRF?=
 =?utf-8?B?by9Qb0FYWDFlZW1lK1pCclBkVG51UCtVYjdjTEtiMkdBOHBYajB1QW1LbjY3?=
 =?utf-8?B?STZ3bkpia1hsZjg4Y05xVUhQckthaVlhL3pjVW5TS1VuK1JKUVprWVdROXFS?=
 =?utf-8?B?b2NDTjVFUTlycUZRTFVZQU94aXJaQ1hwU0g2OEZjY1ZheTNyaUV0c0FYeE4z?=
 =?utf-8?B?Ny9hcGNLUXdjZ2o4ME04WjlubVRwaU53ck41L2E5eHlmQlo1bzBBSCsyaXVM?=
 =?utf-8?B?M2NQaXd3OUJZbDMvQUQrNm5SL2Z3UG00cFF0MVp0ZU1ZNnVWSXUzeUZjTzhP?=
 =?utf-8?B?M1JMYTJrYURtcC9zNXRsdUN0L1FUelhoZlgxU2NHYm1VR2RtSnpsTmo3aFFY?=
 =?utf-8?B?NTloYTc3L00wRGF5UEs5cDZJT2tlTXZieWVSNlB0KzN6NmtuSE9acHVTUXV0?=
 =?utf-8?B?UENyNUdOS3RKUXdOS3oybnc1UVBPRExBRHNsZFhkaGVtV3FBRmgydmx6MnZ3?=
 =?utf-8?B?MzM3Ni9sQklTMUFmWjNXanJhMVNHVURneVA1RVQ2d0FvM3NJbTJ5dHp2Sm9s?=
 =?utf-8?B?dGN0eEhmZHl0b1BnYStCL3gyMDczMEhORjN5VkRONW1KRklRbG1DSUdSOEVs?=
 =?utf-8?B?SElmd0VPNG40YUo4K09EaGlQTEhZektVcjlidWQxbytnaDNpSk1NRnhuRllt?=
 =?utf-8?B?Tk0reThIV0ZrRGFPbnIvaDhxcy84RHF3ZjdrZWdsaXJrL2NxNkk3SllNZmw2?=
 =?utf-8?B?L2tFNWNjQ0VUTjBTNWpmQ1BQUXkzckkrbU1FcDVtQ05KTWt4T0p3Y0Jpand4?=
 =?utf-8?B?eU0rUDNBTXdqS3JPWllMSjEzZXptaUpQajJXK28vUFFBb1BuZVliTmM2Zm1n?=
 =?utf-8?B?ZTlJREM2Q0UrMEExRHkwK3FNTG5HRmZBT0tJMWdsMjJaSE1yQy9zMGNUSXFl?=
 =?utf-8?B?RkdqMTNCS2xBUlJxUFBOMjRGWitLemVzUlVTbWZxOHBiOElpMGpmaXl1NDNl?=
 =?utf-8?B?ZnZxUnM1TlJTaytTVk1SZmx4dGprUnhtbUF6NFlZZTJ6VmJYek5mbHpRMGNK?=
 =?utf-8?B?MFhUcTZwL2JRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHRxbjNGRHFKVmNzVm5NVkdZSEdYSmUzcWtOZ2liRHBNNmlFbHhQM1dvRitP?=
 =?utf-8?B?TSt2UkNLUjBiY2UyN1VpYXE3RWRWRFAwZmpyZytGMXZmQVhjTm9uS0RlQmtG?=
 =?utf-8?B?Ykpvd0grUXp6WDRXL0g0ZG5ZNkI3YmZ0UFo4RkpzcktVbzRZaktxSGI2am0v?=
 =?utf-8?B?WXFXaWR5WlZQZDV1YmdlVVM1VnhyZ2FQaUl0WXJRUUJraU9WYnJ3bkNONmdZ?=
 =?utf-8?B?b3Bjd0F1RHJubUtmbU5zUjI2bUk3UGpVZCs5MHFtcklKVllsU2QzUXFQQ0hi?=
 =?utf-8?B?bU16b0lMemxpT2NuM2ZNTjkrMTlhYlhRbDdkT3BmRHYvZDVPWExQbDBnb2tK?=
 =?utf-8?B?RVJyZ2hEbWwxL1N5NFQvbkNFU3V4TGhZRWFRQ1N0WTRRTXZtNzRoUWFGMGFi?=
 =?utf-8?B?UnFzcDFlNGJDbDZ3bXY3NnJXb2gzVXZjNFZ5ZUFvaGlVdFpOZGVXSnNnQW55?=
 =?utf-8?B?MzBXajlkQjRPOVRrMUVrK2NMcFl6VW83MXVsUFlQdkZ3eFd3ckVTVG1vQUpM?=
 =?utf-8?B?a3RDOTJoMVFsOHRtc3RnaG5UWlYxT1BpbGNUNTMvRTUveG5HVWpJeHZ3OHdX?=
 =?utf-8?B?SEFoelQyMExIa1Y3SUdZcEpxZ01DV0ZrN25pZS9pQU5WVlRneGFpbyt6VklB?=
 =?utf-8?B?WkY0WXhnK2w3SXIrZEFBYkdWUmFmUmxDNkpuZEJZWkpxOGhqTnJZakE4ZXg5?=
 =?utf-8?B?QklMeGp5RVVPaWo4UWxkcjdZWEJJK1F6NXRSVzQ5cVNXWS9qMWx2UmdnMWZY?=
 =?utf-8?B?eWNuZ3VlcVUvdTJ2d3VzUHBUdkliM3FyQ1R4Q3Ira3dINWlvWTRydVRnSmsv?=
 =?utf-8?B?K3hmeGRTQ0JhYzZCUXRUNHVVb21MczErelZSWWpNYzExRXFrblYwa0Eva05s?=
 =?utf-8?B?QjhKaGc3ZHk1Z3FXc0kwckc0cGpaQTA0ampXY0cxZ1E4cWF2SG0rU2FQdndo?=
 =?utf-8?B?V01aMjRFODI0ZTJ5Q1pyMUdEb285Uzl5dmdlK0trV3lUYXJtSDRMZFovLzFQ?=
 =?utf-8?B?STBwc2dVSC9RNnlFZ0RJWjZiL1lWd28xQW1TMGZ0NmdNY1dBY2Z1eFhtYTFz?=
 =?utf-8?B?WUhoa3ZiMUdaWXZEUUdHSDRRelhoWExHNWpkaHltbEpHWW4zRy8yU2NNOE9J?=
 =?utf-8?B?K3d1YjZSQ1RTYnhHdHlvTVhaRkIzMGF1ZFJOL3pYZkVNajZCbzRTYkZnTnNZ?=
 =?utf-8?B?U29TWER4bzJiTXhaTlAzdnNvdiswMEJ3VG9TY0h6UDl0Q2JTdDB6emYxcTF5?=
 =?utf-8?B?dVpYUlN5M0JrYU9GWWdFanZMVGUzV2hWV29pS050Y21WWGJ3bkh1RG0xc1Bt?=
 =?utf-8?B?YlNWY28xR1FSNXhYQk1mcVdhQm9FaWJUbVZ4UEUyTFJRZXpBdnJYZ1lFb3A3?=
 =?utf-8?B?YzNLWS9aczJkYTNpSFJ4c3VPamdoSzlTTVp5QWwzT1ZsMklhQUxKZXhLYnQx?=
 =?utf-8?B?VE4vaEpCTXE0ejJMVHl4cUd2SzFPUzB1NWk2UzF3UjhrRHFGbGlRMHkwcjVD?=
 =?utf-8?B?Q1FWNVRRVkN5VmV2UnRTNmFhd0l4Yzk3THRKb0FIV1UveWFmTVFwdWNWOWdK?=
 =?utf-8?B?OVRGTyt4dmpSRCtXSEo2SkcxL1dCaDJmOUd0bHVZN2VKUlBuRG5GczBRSXNF?=
 =?utf-8?B?dE9NRWxxTUpLYXlBUWhaMEdsSENPc2o2cloySXZGTmlZa0Q5SkZRUWh2dGFN?=
 =?utf-8?B?b001YXRqV2I3UXcyQTdVbCs4UXowbzZaRXhLUEdFYTBPRGZONkhzMm82MkVQ?=
 =?utf-8?B?aEVoTzU4VWNTVmN2S05EVm15bnViNnc0MVFHNHZlY3BxcEJMRTJBbWc1T1dq?=
 =?utf-8?B?TTBtREZGTXRPTUgzd3QvR3pTSmNtNVBHSUNBcHpEWjNjTnVjTWkzVFI0Y2dD?=
 =?utf-8?B?djRJM0x5a0xaWDdQbE5qVHNpc3FtRlVUV0djd2s0SHhuOWgvV2hvd2hlS3Vt?=
 =?utf-8?B?T01yME12bmFBOFVvclRBOXFKUzRuTUpNZDc4QlB6ZVNhZ3psdmNiVUN4Z1JH?=
 =?utf-8?B?aHVCK3Z3SXZhb1FKQm5OR1J6OXBDSXViemdvWGZGUGVtVDc5ZGhCa1B1Mitp?=
 =?utf-8?B?Nk44KzhjeFZkZDgyb1JNL0YxaVNiUnIwN3FzY3JGdm9PN1RldlRTem1pVEhC?=
 =?utf-8?Q?Ffb0l0ZvQLnfgVfuyk7Y/Xk7a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4ABA80AA74A32A48968D4D840EC7DB3C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87f5f2f-9562-4a75-13a5-08ddacc21005
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:39:24.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UOWf14pv5BV130veX5AgZJYHi2y5Bv1Ll3BF4a/wUSHGdQTvUYt0HqsGR9ShyDmboUFd9+zqWSlFiORntztBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA2LTEzIGF0IDEzOjM2ICswMjAwLCBQYW9sbyBCb256aW5pIHdyb3RlOg0K
PiBPbiA1LzEwLzI1IDEzOjI1LCBLYWkgSHVhbmcgd3JvdGU6DQo+ID4gT24gVERYIHBsYXRmb3Jt
cywgZHVyaW5nIGtleGVjLCB0aGUga2VybmVsIG5lZWRzIHRvIG1ha2Ugc3VyZSB0aGVyZSdzIG5v
DQo+ID4gZGlydHkgY2FjaGVsaW5lcyBvZiBURFggcHJpdmF0ZSBtZW1vcnkgYmVmb3JlIGJvb3Rp
bmcgdG8gdGhlIG5ldyBrZXJuZWwNCj4gPiB0byBhdm9pZCBzaWxlbnQgbWVtb3J5IGNvcnJ1cHRp
b24gdG8gdGhlIG5ldyBrZXJuZWwuDQo+ID4gDQo+ID4gRHVyaW5nIGtleGVjLCB0aGUga2V4ZWMt
aW5nIENQVSBmaXJzdGx5IGludm9rZXMgbmF0aXZlX3N0b3Bfb3RoZXJfY3B1cygpDQo+ID4gdG8g
c3RvcCBhbGwgcmVtb3RlIENQVXMgYmVmb3JlIGJvb3RpbmcgdG8gdGhlIG5ldyBrZXJuZWwuICBU
aGUgcmVtb3RlDQo+ID4gQ1BVcyB3aWxsIHRoZW4gZXhlY3V0ZSBzdG9wX3RoaXNfY3B1KCkgdG8g
c3RvcCB0aGVtc2VsdmVzLg0KPiA+IA0KPiA+IFRoZSBrZXJuZWwgaGFzIGEgcGVyY3B1IGJvb2xl
YW4gdG8gaW5kaWNhdGUgd2hldGhlciB0aGUgY2FjaGUgb2YgYSBDUFUNCj4gPiBtYXkgYmUgaW4g
aW5jb2hlcmVudCBzdGF0ZS4gIEluIHN0b3BfdGhpc19jcHUoKSwgdGhlIGtlcm5lbCBkb2VzIFdC
SU5WRA0KPiA+IGlmIHRoYXQgcGVyY3B1IGJvb2xlYW4gaXMgdHJ1ZS4NCj4gPiANCj4gPiBURFgg
dHVybnMgb24gdGhhdCBwZXJjcHUgYm9vbGVhbiBvbiBhIENQVSB3aGVuIHRoZSBrZXJuZWwgZG9l
cyBTRUFNQ0FMTC4NCj4gPiBUaGlzIG1ha2VzIHN1cmUgdGhlIGNhaGNlcyB3aWxsIGJlIGZsdXNo
ZWQgZHVyaW5nIGtleGVjLg0KPiA+IA0KPiA+IEhvd2V2ZXIsIHRoZSBuYXRpdmVfc3RvcF9vdGhl
cl9jcHVzKCkgYW5kIHN0b3BfdGhpc19jcHUoKSBoYXZlIGEgInJhY2UiDQo+ID4gd2hpY2ggaXMg
ZXh0cmVtZWx5IHJhcmUgdG8gaGFwcGVuIGJ1dCBpZiBkaWQgY291bGQgY2F1c2Ugc3lzdGVtIHRv
IGhhbmcuDQo+IA0KPiBzL2lmIGRpZC8vDQo+IA0KPiA+IFNwZWNpZmljYWxseSwgdGhlIG5hdGl2
ZV9zdG9wX290aGVyX2NwdXMoKSBmaXJzdGx5IHNlbmRzIG5vcm1hbCByZWJvb3QNCj4gPiBJUEkg
dG8gcmVtb3RlIENQVXMgYW5kIHdhaXQgb25lIHNlY29uZCBmb3IgdGhlbSB0byBzdG9wLiAgSWYg
dGhhdCB0aW1lcw0KPiA+IG91dCwgbmF0aXZlX3N0b3Bfb3RoZXJfY3B1cygpIHRoZW4gc2VuZHMg
Tk1JcyB0byByZW1vdGUgQ1BVcyB0byBzdG9wDQo+ID4gdGhlbS4NCj4gPiANCj4gPiBUaGUgYWZv
cmVtZW50aW9uZWQgcmFjZSBoYXBwZW5zIHdoZW4gTk1JcyBhcmUgc2VudC4gIERvaW5nIFdCSU5W
RCBpbg0KPiA+IHN0b3BfdGhpc19jcHUoKSBtYWtlcyBlYWNoIENQVSB0YWtlIGxvbmdlciB0aW1l
IHRvIHN0b3AgYW5kIGluY3JlYXNlcw0KPiA+IHRoZSBjaGFuY2Ugb2YgdGhlIHJhY2UgdG8gaGFw
cGVuLg0KPiA+IA0KPiA+IFJlZ2lzdGVyIHJlYm9vdCBub3RpZmllciBpbiBLVk0gdG8gZXhwbGNp
dGx5IGZsdXNoIGNhY2hlcyB1cG9uIHJlYm9vdA0KPiA+IGZvciBURFguICBUaGlzIGJyaW5ncyBk
b2luZyBXQklOVkQgYXQgZWFybGllciBzdGFnZSBhbmQgYW92aWRzIHRoZQ0KPiA+IFdCSU5WRCBp
biBzdG9wX3RoaXNfY3B1KCksIGVsaW1pbmF0aW5nIHRoZSBwb3NzaWJpbGl0eSBvZiBpbmNyZWFz
aW5nIHRoZQ0KPiA+IGNoYW5jZSBvZiB0aGUgYWZvcmVtZW50aW9uZWQgcmFjZS4NCj4gDQo+ICJU
aGlzIG1vdmVzIHRoZSBXQklOVkQgdG8gYW4gZWFybGllciBzdGFnZSB0aGFuIHN0b3BfdGhpc19j
cHVzKCksIA0KPiBhdm9pZGluZyBhIHBvc3NpYmx5IGxlbmd0aHkgb3BlcmF0aW9uIGF0IGEgdGlt
ZSB3aGVyZSBpdCBjb3VsZCBjYXVzZSANCj4gdGhpcyByYWNlLiINCj4gDQo+IEFja2VkLWJ5OiBQ
YW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiANCj4gV2FpdGluZyBmb3IgdjMu
IDopDQoNClRoYW5rcyBQYW9sbywgYW5kIHdpbGwgZG8hDQo=
