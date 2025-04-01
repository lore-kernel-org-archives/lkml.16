Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B05103F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468153; cv=fail; b=MZyutDJVV6nCIMj50hr0CfyshWgvddhk2IEPnGG3fWLrwttgif+ts79sHLxxS5I8M9Q0g+QqZ9IRh88JBLtTgaJ7NJtbxm0mhbSL0hSrjbouahshNncM7MPVBqA/Mj0Kp3N+nnTrL99lhD+P45MVrCxHUUduFyLym/mxPMcF3co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468153; c=relaxed/simple;
	bh=w7Jls34whQlWWAbusjrCBM5j3yS1bbFUv9ZF9jCJgiw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DsZ7clNffXubJqk8huFAVY5q7pQ2tsHe2SwkqrD7Nhp8rYE+XjA6EV0kJKBnGhBrgtADmB56SBTLtp30svwyDSkCfoujSksudx9s+Gyo+rgTVQ0LLumFybn4UF+pa8gFr41yTaqYZ5anZiolU1yP/5XHS1BaZv5ljuk5C4Lj0CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqT9FQ/y; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqT9FQ/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743468152; x=1775004152;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w7Jls34whQlWWAbusjrCBM5j3yS1bbFUv9ZF9jCJgiw=;
  b=nqT9FQ/yOVP4aP7+KtvRZrROR/735Ql22R9zkz4q3CeLeu3irVzD2J7s
   uwXFqlWmI4vd56p51+PjSpXQ1mN4q3CW5fcmOChjHGk9tp71IOngrF//S
   k013oaERt119I7BDokysNWT+FlrtO065REji+mkIQ7QR8q/hLIfw53Kqy
   frDjB5KTXGXrKMxb4VkrlhiFGnCHiuNG7r00Is2NRQNEoXA/o+pLAtda5
   DHUzx+Xy/v7kniOg/kR2reQybb6mhuYQkv6g8L99IXzw9KKuyo1OTxY7J
   PC3ebftjc0Dbghw82ceAfHcIOygVQXuv4YQaqpQte/lW/fmI7zwEDC2vt
   w==;
X-CSE-ConnectionGUID: nM9xBVt9S2q5ygCO6+5EPA==
X-CSE-MsgGUID: GOJCukoDTyC4E7XaTF1S7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55769087"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55769087"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 17:42:31 -0700
X-CSE-ConnectionGUID: RHdEsHGPQ6OmQcAgdJIIDQ==
X-CSE-MsgGUID: VowNlZhjS36juPNfnmV+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126129453"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 17:42:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 17:42:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 17:42:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 17:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwCXyYFPKJMD0sDdm5T1mylDEXVEo/w3GRs53RhtfSEx+nJpdiYi/dpHuzfCnMz8ZklwbeYWayEXChE2/gc1koBaTxmXhunS/fSGi+BHkhVjVkFR2slK0YwOanAZTA8slz7PAQVrUmGBfCJGCdJtyj8BC2bqd4CzOzHD/sgAZwGkqvRHMaVNGsw5PpkHFcftxXd7EY01+zpNgf5k0JhVNvHHt863+FgaAFypaLh7m+pDSzqM2HGgAFQo60MF+BuSCnGvsCgbMiLImuCXjpi8KYaMXklODhpV9wf6JTiduLoptgMxvCipT+vLdzJ/1UxOQgnkYbsqWk2oIQ8HEz4xNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7Jls34whQlWWAbusjrCBM5j3yS1bbFUv9ZF9jCJgiw=;
 b=f7G2v3yj33mZMmicIbBoRjqfDQ3EDFFjPbcyCc4P7s3NAtBFBEqwIyu2KexsBEpXE0AZgor85QGyfSayxid+wMHBO8toe3bqJYkeWyqHp3W4aUgS1nHu63aABriHwUmr4Sr3LDVV6VE/0YJTlLhljzV+rdI07HHQxTz9XY9HMMz5SSMagFRWTnz96q+0th5tAPEMH2y8HMYj8PfhaYUY4VJ6phiDeaJ+Xsdm45E4DbG3Z6gX/C1EerCpJmbP0SukHVqYVV4DYY5BGV5Kry8KN49dmIkYxvM2cNgizTOEQucKJXg8eIziiFfrrnKlr7p7jtkYfNwmKhGsDfRyKBwX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Tue, 1 Apr
 2025 00:42:28 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 00:42:28 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "tglx@linutronix.de"
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
Subject: Re: [PATCH 9/9] x86/nmi: Improve NMI duration console print
Thread-Topic: [PATCH 9/9] x86/nmi: Improve NMI duration console print
Thread-Index: AQHbn3LbuMx9jilId0eO7qnI77vKELON/veA
Date: Tue, 1 Apr 2025 00:42:28 +0000
Message-ID: <fdd8a59820d4e6764e77f61ebeaa85cb69c9fef5.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-10-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-10-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA3PR11MB7462:EE_
x-ms-office365-filtering-correlation-id: 03975411-e574-43c9-7cef-08dd70b61442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dks5T0U2S1AyVlRWbDNNbmRLSWZnNHFFRUlvQmZRWnVPUVNJa3ppYXZpRE1y?=
 =?utf-8?B?bWhsYXE5aytLUkROY3dvOFJqWHpOek1OelBFdlpFZkc2eFhRSGxYOEEvak5w?=
 =?utf-8?B?bStNajlndkp6d1lsaVdaT0lDWi96QkF4Z3FreXRzbHJ5cTJJZU1BYXBpUDJz?=
 =?utf-8?B?ejFZM2pMOW1YUndzYVNqa0w2Y21zYzE3dDE3NGM1TVJ2eWJ2UzV6VTNjL1ZX?=
 =?utf-8?B?WjNXdHR2bjVQem1MMDAyZGRqTHhIaVFzZ0V0QjREK0UxVCtOdnRDR3VGc2hy?=
 =?utf-8?B?RlJJMHkxWWR0cXVJMFdMRHErdGtZQk10RytoTis2NzNHeTNENzZGanB1TDc2?=
 =?utf-8?B?Tmx6M3FzMmZLT01Na0IxNUNaUmpROG1yc0MvOWhMSXV1YW9DSzFlNUlFbFpU?=
 =?utf-8?B?RDlHK2t4WjlZRHpiSXNuRUlCcUNzdHd5U2pzeEhhdjI5RjZNcit2blI0cFlq?=
 =?utf-8?B?T2VJdU5OTXNZRXdQY1FPUWVMTGdGa0tvZlVkNEI1NjVUQ3YzKy9EMm9Jd2Qr?=
 =?utf-8?B?cjR4dzNDVEtDclFIRlRnKzRMNFJsU3M2TndQUnNGWDAvcjRFcWppVyt3eTY2?=
 =?utf-8?B?aUI5NVRacTI1dEd2K1RRU1MwdTA1S2s4Qm1jUmc0RlVoNXlxTVJmc25QVnNm?=
 =?utf-8?B?ak01T082QTh1K2ZPK2VYYjdmRElodWZ0c3ZBNStzZ3hkNlU1TnpWTUxsS1VN?=
 =?utf-8?B?M0YxWlhrN2VGSHRUaFRQd2FsMHJSY2pHeWpBVzYrY2VmV243b25Ia1pnU0M0?=
 =?utf-8?B?N0w3Zk4vVWRHeGhGb2VvcEliZGZaYUJlOUw0Vjlvc0U2T3d5MGNiOUNOSm02?=
 =?utf-8?B?VGZ4elhWM0RraWVZQzR5UUJPNFZXY0tSWFRZVUgyZkREMnRzTmRHZXM3elp6?=
 =?utf-8?B?b0gzK0ZrcVBWOGw4d21ZQXJySWFxSEd3OEhsSEhudUxheXpTVGV3T0RyR2dI?=
 =?utf-8?B?N05zY3pxaHprVnZBUi9ycGtuVGNZVmlvK2JHMkxxYmVHWCtMWE04allMWXoy?=
 =?utf-8?B?YTgrdUJWUkt4WGdScG1tOExhZUdxQTlHbGRJS0lWZGdJR2V3WDNGdjc0dXVr?=
 =?utf-8?B?c1FPSWQzbkZWNjdqMk0wVzZaNVNLbDluazhSZWdBdzRsNVdxbmNnVHZPa04z?=
 =?utf-8?B?VTVDdS9HNFRoaHFybGY3bmxVZVRaNC8rOENTakE3ZHFsWWxFcUY0bFMxOENo?=
 =?utf-8?B?bWJwckM3aEZyN0pwL0dDZGt2UzBvYk9VNFZvcWtlWUVnOFBRVmNSZjNIQyth?=
 =?utf-8?B?U3cyYkpHNURobEhVcE9FMUZZb2c5RVF1RTRMczFiaUF1UmpVek84YmNid1JG?=
 =?utf-8?B?ZVVwRFBXN20zN21iT1JiVWVrcmpYZkVFZGs2NjlQR3ljVDMxQmFMVFNvQVNK?=
 =?utf-8?B?Tm1QRnQveHd1a05ZVkhSR1NUU25oaWEyUkp6SUNRMXIwR2YzOVZuMG5kM2VN?=
 =?utf-8?B?Mm5FK0dGUTcvb0NORURxZ1UwVldDcWhuUWtiRkhUTmVKSGxlVDVuNGRXYWVy?=
 =?utf-8?B?Q3d0Nk12dEdrc2ErQWlpWE5yN2h5bFcvVk5OQnhndXY0ZDZVOVVpNzZ2aCt5?=
 =?utf-8?B?Nk5VTGlYeWZTeVh6eldiZHBWVkh2Z29EK1pEeTFIdU1FUnZuZFpDUERKcGZ2?=
 =?utf-8?B?UnNtWmM0QnRwQ2NCMVRtYzlCYmt4Tlh5VGxiL1puYXVmOURjOHB1eUVyd054?=
 =?utf-8?B?N3VJRVNEeCtFdmhvZjIraGFBOHlWdXp6ZDRqNEFMQjBNMG4wQyszek93UTFi?=
 =?utf-8?B?a1JxSnpJZTVadlFTeXVwejQvZ3dzN1c0bnhxdk9vZmE3YWNSUnQ4eHFtSDds?=
 =?utf-8?B?MkVmcEF2ZjI5em1IbFdPWitMWmFqbzFKWmNCVmRiU3YyTEp6WTJHSkNqYmhJ?=
 =?utf-8?B?L054a2dxeSttOGJXS2pxQyt5TU1WRFVwOVFkUnJHSjVrUzdqcDZlQ0RNVXlZ?=
 =?utf-8?Q?OkSGaAU57swW3+1W9U0vqFoEOlfKyM/V?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWtTMzM0dURGYXkvRUNRQWNHUTVJQkpEQ2xpTUN6SVdXWUgvYVk4OVp5QXM5?=
 =?utf-8?B?QVZNeXBrY2FvUFFJd2JnTjZYV3FxSHhYKyswVHd6US9wMEFkOGRWUStTL3kr?=
 =?utf-8?B?bnlrU3RmTzJWU2UwOUdvbWJkMmRKdnF1U0NTK3pVb3dlaFVvcWVNbzNhejRL?=
 =?utf-8?B?YXBBamVNYjYyMmpKdHh3V0Q3MjkwQys5RUhySjlCVVQrZ1k1WTdoYkx2TzIy?=
 =?utf-8?B?S0dkak9DaGRPOGpjL2hNTFBuQitXTHdQSWFyOVNRVVVzYVZOb2FUdDNNOGk1?=
 =?utf-8?B?SEg0aXl0MGUrdm9xUjBuZ2pHR2U5aUJPbUgrRndGY0phcy9NdTR3MThWcEM0?=
 =?utf-8?B?SXZzeDI0TzI1U3dFSFY3YWtMdFlBSnhaeFczcDVHWE5QMGlFdm9kVlB2M29M?=
 =?utf-8?B?WHR6TWpQcDRZSGxEQWVOZnlmMHVWRFZyMTBTSlNCOGFCeURvV2trcWh5KzRw?=
 =?utf-8?B?d2tjQ1NnbUxORFp4Q0sxV0pHZnR4ZUhtNmhydkNWeEIrb3BpSXdINFBhZHRs?=
 =?utf-8?B?MFhqaW9Ralh1WHBrZWRXeHhkWTY2NktnaDZqZ0xKamN1SFpjSmNTbytGM293?=
 =?utf-8?B?Z1hpM1RVbE0zM0pET0MzU3R3TU9XQVJZNTdTSWtUWGJFTERDdXFkajBjdDNa?=
 =?utf-8?B?MlRGaktudXFkUFJPTjYxNU5uWW5MckEraHF1QnRMMTJBc05tV1l5ei9mek1G?=
 =?utf-8?B?UDVaK0IrZGdrUDlVdzlFZk9NWlJidk9CM25GYnZHeUoyNGx3bmlmS2FRaDZ4?=
 =?utf-8?B?SWlqbU1OMzRTVXZrYjdQblBWNXpZSXExQ2MvOWJMZzRuWnBwcEFUdXlHcEh4?=
 =?utf-8?B?UmY0SHl1U3lmR1JTN2xtZmgrQldDQnYxenlXRUNBTUZreDN2ZlBtM09mOW9U?=
 =?utf-8?B?aWdXaVBCdWdEWnlUV0hkNGlKNWhnalNUSCsrYjYzTUpMY2pzUWVKVjJ5ZTJu?=
 =?utf-8?B?RURXWXZDemtxUGp0ZVUrcFNzNVJKR1JNY2xkVW5UeWVreEFsSXI1OVRoOXVL?=
 =?utf-8?B?bzJsaG1JZWVjSGpHblNsSGx5Z3VMbkNObHFBenF5NFpTemFLWkZRUWdRL1hT?=
 =?utf-8?B?MnU4aU1KaUlyVjNwVlJDd3ZGQkZralJFREZsYnRaOTFYS2hmTmhabUFxbDQw?=
 =?utf-8?B?MzMvZFdJOEZ4aStwNy9BRWY0UUNXZkpZVVV4aHIyQlg3MVpMQ3pnM1hkSzZT?=
 =?utf-8?B?T0xaWmNpaTBuZlg3MkNqVDZqVDBTZTM3MytNeVJpTmpVa0pDdXZjY0E1N1JM?=
 =?utf-8?B?QTVpVE5ieWw3blh2RDMxdnN0Ny92K2JQdXpXampTcFRsZDF2V0UwUTkyN0Jh?=
 =?utf-8?B?OXhtOEF0SXFHaVMzalA0aEV6VnltNC8rVG5BN0ZPL3VyQnlxNG9PNlEweFlT?=
 =?utf-8?B?UGpxOVc1TVVjQWl1V1VjaDV0alVSak5IZlVGeE9laEQ1K1M3OUxCL1hhcHpt?=
 =?utf-8?B?MmJINHNOT0VBRjYyamhzMENlbnZBVlZXdmszMDFjTElhRjl3bUVEZkc1a3ow?=
 =?utf-8?B?UnJhOCtpYTEveU5aaWk1akZ5Z21PT0JNTDdXM2dmZldhc2E3bVUzbVp4QU9V?=
 =?utf-8?B?Z1RNNUNmS0E3UnJFQnZJVkFSREk1OU9JdzVNcjJqNDVLU1Y2NUxYU2NpdWNV?=
 =?utf-8?B?ZVN6aHBDUjA2WnY1QVorNHZ3VWM0eTB2aDJoOTVwYzFKY2doVjZJQVhuNHVU?=
 =?utf-8?B?anF4WFA5Q29OYTZjejBuYnhyT3NhQUxVOFVHdEhVZ29DSHZGMEV5Q0VOUWZM?=
 =?utf-8?B?OVp3a3dYdUZRN295ZURCeUtqRnlrSjYwNG9vTTB5b1ladUhaTnptMnZJcmV6?=
 =?utf-8?B?YXNMTEIrb21zTnVkc1NpMmVTZ0ZYTTlMUEhTRjE5OWpwUnVKR1B0VlROZW9Q?=
 =?utf-8?B?cnRvZVBRWjdaN2pacWx3YnRQbVFvWHIxN01rWDZDMmJGZGEyZ1MyeHVITDU5?=
 =?utf-8?B?MG4ydFFZbm1zeFNDU3pvSmdJVVA3bHVHdStPV2k3b0tpUTZjQnF5Nm53Q2tZ?=
 =?utf-8?B?OUJ4akhDdmhEcWczSE5GNlJycGZVV2VaY0pPWnNiZG16YWhpWTdEQUJJZnIr?=
 =?utf-8?B?NEZ1N1IxcmE3WnBhSGhFY2lWaXVnY01FUktrd29HZlVGRGlPekVLdU41MmlU?=
 =?utf-8?Q?0YSuIKPaPJLDuMB7LoXGrNwPN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B251A6AA1216E14EB723BAFB868E27A2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03975411-e574-43c9-7cef-08dd70b61442
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 00:42:28.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aLRLDXZfNGY9XizH8phAlR7LFm8tuiWiMreYcGme0udkxZ5J10IPFAH8E+FLerDyLEa13SWjwUwB2kteEUfVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IENvbnZlcnQgdGhlIGxhc3QgcmVtYWluaW5nIHByaW50aygpIGluIG5taS5jIHRvIHByX2luZm8o
KS4gQWxvbmcgd2l0aA0KPiBpdCwgdXNlIHRpbWVzcGVjIG1hY3JvcyB0byBjYWxjdWxhdGUgdGhl
IE5NSSBoYW5kbGVyIGR1cmF0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU29oaWwgTWVodGEg
PHNvaGlsLm1laHRhQGludGVsLmNvbT4NCg0KSSBldmVudHVhbGx5IGZpZ3VyZWQgb3V0IHRoZSBy
ZWFzb25zIHRvIHVzZSBOU0VDX1BFUl9NU0VDIGFuZCBOU0VDX1BFUl9VU0VDOg0KDQpSZXZpZXdl
ZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgYXJjaC94
ODYva2VybmVsL25taS5jIHwgMTAgKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
ZXJuZWwvbm1pLmMgYi9hcmNoL3g4Ni9rZXJuZWwvbm1pLmMNCj4gaW5kZXggNTllZDc0ZWMwMTBl
Li5iZTkzZWM3MjU1YmYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9ubWkuYw0KPiAr
KysgYi9hcmNoL3g4Ni9rZXJuZWwvbm1pLmMNCj4gQEAgLTExOSwxMiArMTE5LDEyIEBAIHN0YXRp
YyB2b2lkIG5taV9jaGVja19kdXJhdGlvbihzdHJ1Y3Qgbm1pYWN0aW9uICphY3Rpb24sIHU2NCBk
dXJhdGlvbikNCj4gIA0KPiAgCWFjdGlvbi0+bWF4X2R1cmF0aW9uID0gZHVyYXRpb247DQo+ICAN
Cj4gLQlyZW1haW5kZXJfbnMgPSBkb19kaXYoZHVyYXRpb24sICgxMDAwICogMTAwMCkpOw0KPiAt
CWRlY2ltYWxfbXNlY3MgPSByZW1haW5kZXJfbnMgLyAxMDAwOw0KPiArCS8qIENvbnZlcnQgZHVy
YXRpb24gZnJvbSBuc2VjIHRvIG1zZWMgKi8NCj4gKwlyZW1haW5kZXJfbnMgPSBkb19kaXYoZHVy
YXRpb24sIE5TRUNfUEVSX01TRUMpOw0KPiArCWRlY2ltYWxfbXNlY3MgPSByZW1haW5kZXJfbnMg
LyBOU0VDX1BFUl9VU0VDOw0KPiAgDQo+IC0JcHJpbnRrX3JhdGVsaW1pdGVkKEtFUk5fSU5GTw0K
PiAtCQkiSU5GTzogTk1JIGhhbmRsZXIgKCVwcykgdG9vayB0b28gbG9uZyB0byBydW46ICVsbGQu
JTAzZCBtc2Vjc1xuIiwNCj4gLQkJYWN0aW9uLT5oYW5kbGVyLCBkdXJhdGlvbiwgZGVjaW1hbF9t
c2Vjcyk7DQo+ICsJcHJfaW5mb19yYXRlbGltaXRlZCgiSU5GTzogTk1JIGhhbmRsZXIgKCVwcykg
dG9vayB0b28gbG9uZyB0byBydW46ICVsbGQuJTAzZCBtc2Vjc1xuIiwNCj4gKwkJCSAgICBhY3Rp
b24tPmhhbmRsZXIsIGR1cmF0aW9uLCBkZWNpbWFsX21zZWNzKTsNCj4gIH0NCj4gIA0KPiAgc3Rh
dGljIGludCBubWlfaGFuZGxlKHVuc2lnbmVkIGludCB0eXBlLCBzdHJ1Y3QgcHRfcmVncyAqcmVn
cykNCg0K
