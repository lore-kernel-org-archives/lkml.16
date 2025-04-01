Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D071519B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494926; cv=fail; b=jXJV/s2stRbKV7arxmIf4iWTFbb8G4DQpQ6ucTxQCzb0ID7zcqLW/rGzSkSkoapfWq/9M/2IvH8XNBhWwyrhSPhN1QzdaHhCX5XYdVMxb+HZQ5nVZAkO0yhkvH5gsQ35JDptpHlr6mLEJdIGexO69bYhW2WkPbMjOXgcfZn7Bm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494926; c=relaxed/simple;
	bh=YTVugMUXd75qbCx4FiT5KwinE0FT2m10gPy7/+w+zdQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aF/rRKnGoWjXszrEG/x/lSdjxbBEZS6J7/ztTx1f+5R3lkOjDqmRZBqCTdpLyoY8H4Hc2HPazTkio4MkUaMIunMU2VWIM8oSs6UzUgx55/6L42FHH22OBY24+tbR5wRfM3oz7+QSqc18vqCllDrx22bfqJCjQOvo38D99TKNYRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIbWXNpY; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIbWXNpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743494926; x=1775030926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YTVugMUXd75qbCx4FiT5KwinE0FT2m10gPy7/+w+zdQ=;
  b=OIbWXNpYWBd+4O13UGZQ/Evl2PnSnvDITyh3Wwm+SU6udsMPwJDWOEx9
   IwzJKbqK4tlA3JLtQbB8JXnEKrnEsy64SfjGLvKkTaOFy7APIFZUXq2ON
   HyXeO/eGc96ABamhlih3UzR/9Exgz25q7VLEJU7FOFqGEgFBYFF4Zd72J
   LkufDTtpcbU2g2P398LiZahxEvjg/facgQHDU5xyrSW2hV0XBUw138tMI
   CvioD7wyP0+LLp364biPUqYfXWfo2LFe+KzfAX98qP0HU512ppnDAqGcc
   U2DlHYGClPG7DUxvVMrLsmw90L2t86JZHGjo+/Xk6XeANBoCpDsroU40c
   w==;
X-CSE-ConnectionGUID: oafaJBNjRsOSun4G5rCoBA==
X-CSE-MsgGUID: H5iOcgCjSh+YeK7K5u9yeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44903578"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="44903578"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 01:08:45 -0700
X-CSE-ConnectionGUID: 9RK+FO6eQ62s2LbdkABfjA==
X-CSE-MsgGUID: 0iCvw4mPR7yUwrF6IMls5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="163545390"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2025 01:08:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 01:08:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 01:08:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 01:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czfZ1/6G9hdyJuqwgpD/Tf1wZN3U7paCH0He/q3dMkcirQlF123USjqsP411L295L3l+xcEZXAi8D1eS8gmbEJEKqyfaHqG6bHVVrF7qrtKnQpgEEJhbvTaR1bHNFGr120r2jhz9UW9mi5+Q+Al4GMT9Y14ryINh3+3LxRsbn+dxzS8aYd04B6maYcZSVZ28Wm+/ijxJhex0VbQVXNBpYuZYTxuqb3Q3oQ2r1iFFgbb2tEcLxby4zlDbKQwMSbIyqihhSUgdE5c4U1YY3w9OyH2ijFZo/4mmcxpBcm5bDv99G60GxPBvHXjnhZVM7GlRAeAGRWMpk2mCPEpR9zorKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTVugMUXd75qbCx4FiT5KwinE0FT2m10gPy7/+w+zdQ=;
 b=bmPOWLcjpEuNLR8fc04lk+vaCgv++WTDKXpmSh5rMMHSU1WSdcccThsi/uGhG87weAdSlSGoWavc/WnOvieHpaV37Em+9yt7vTSOfZlOXQFKVyi9dRTZb+hr0DXKvl2CJ7AE0hhmaoFcdOuL9RYuzILjmoMGKFFa/rDbFyMMaplq6JTQkY6j6jqP4qCXnfyqGxiBrd1c4qZwLpWAcrF6aW8oJ3w5JFeVufm+iG8Z9VUKF6O1w5VyyI5unWff9NNJ5mLAp8BU056LjFxUfyjj8BBExeUgrSet4nlX758hoTldoRbxuU2XliX/BomtwYxxIVmuTudSyckOHXQXyv1fVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 08:08:41 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 08:08:41 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "mingo@redhat.com"
	<mingo@redhat.com>
CC: "Luck, Tony" <tony.luck@intel.com>, "Nikula, Jani"
	<jani.nikula@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "rppt@kernel.org"
	<rppt@kernel.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"xin@zytor.com" <xin@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"pmladek@suse.com" <pmladek@suse.com>
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Topic: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Index: AQHbn3LZZapA7fAReUqsEyYm7m1m27ON3Z8AgAAB9wCAAAQ8AIAABGeAgAAdbwCAAE5lgIAAJ5WA
Date: Tue, 1 Apr 2025 08:08:41 +0000
Message-ID: <58f9fd5d7d0758c4877d3e0c70f63af49e211ce3.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-3-sohil.mehta@intel.com>
	 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
	 <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
	 <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
	 <d6f148e4-085d-4bd6-b0a8-394149d8aeef@intel.com>
	 <dcd22645ee5e5fcbbdb03ead0c6c68e4c09923df.camel@intel.com>
	 <6e9bf509-ebf5-4703-bab6-fb9770f975d1@intel.com>
In-Reply-To: <6e9bf509-ebf5-4703-bab6-fb9770f975d1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH3PR11MB7391:EE_
x-ms-office365-filtering-correlation-id: 100e725c-f5b8-436f-6f94-08dd70f46a58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QUxLdjZBdG1qRVFqMDJsVkJicXB6RXRvOUQzcTJpeXhzY3dPeE13cmRHa3JV?=
 =?utf-8?B?YXZkK1dZOURuS3g2aFJHRVh3dkpTcGZIWVpqWHB1OFJ1a1h0clNRVDZ3bGlL?=
 =?utf-8?B?SXlKZzBEZWROWE1vQzZoSWF3bEhvcGwyZW1WN1g3dzE0L2kvcjRKcEprRm5r?=
 =?utf-8?B?aEpXSlYxdlRmd21HWVBHNGU0SldaS3dteFIyNktqNGQzdVg4Vm1wMHF3ZlBF?=
 =?utf-8?B?VDd3ZWllYjdGTE5DdXFJc3ArYU10c082WmN4RlpsUFlhQ3RoK2lzU2Y0b2J2?=
 =?utf-8?B?SW9CV3cvb1Qya0tyS1lQbjVzTndoUUZxVDZlVnp0Z1dGMmVRUmlIVHBobWtL?=
 =?utf-8?B?aVAyTzBQZmlQeWJ1YTFtemJuZnVydkxKaEtNcDE2VlZISHZ0Q2V3UU91NEVo?=
 =?utf-8?B?NW5JNzUwQyt2bHI1dWV0NnlJaHZtbHA4NVF6Y1dGcXc4bUJiamJFN2I4Z1ky?=
 =?utf-8?B?S2FUbkdxVWNpMG1ZWXRiaXZNcXE4QlZaQXlSQnQ3OGdXUzRxMGhoWitWbTlk?=
 =?utf-8?B?ZVE4ejB6WksvdmVET2tRZjk1YU9uWVM2MFV1K0pHMkRCZzNqWWRmVWE5RExM?=
 =?utf-8?B?ZnNCQW5hMWxOWGd2Y3hSYTU1akc1SzBjT3QxQ3ROOWd0WGYyTEVrSVZiczIy?=
 =?utf-8?B?VHdBQ3lnd1JlTmdlK1RGM3VWR0xPaThBbU1NUng2L0RsYXVzcEwvcHc2U0s3?=
 =?utf-8?B?Vmg0QVUwNTRkREVKdTRpdWJRREhJdCtHQ2wxb1JYZHlnYzVGQ3E4cTJwQ3Ez?=
 =?utf-8?B?cXBvcHBBRVpwNEVpZWZER0JMVHU1MitYQzVwWXJ3MDJmNEtuUlpxYnJSdTJt?=
 =?utf-8?B?alZpSTZQaWFCT0UrZTJHVXFXdm1LQVNPRXZLUkZQNlJPeVc3SXhwaEJMckFE?=
 =?utf-8?B?MU0wVFZNbFdpZFM4YzFrTFZqeDVBbnYwVzNjSVoxZ3lCM216T2ZndllXd1FD?=
 =?utf-8?B?K3h1VGdIQXlhSURDWlNKSDY5Z2lZYmlrM1VvN2tHV3NQdlV2MGRFaUxpbUlY?=
 =?utf-8?B?L205ekNiejkzMlhTRDR6bmFyakpaNDJaRnAwZ2pyQkdqTnk0ODdGK2h2QXVo?=
 =?utf-8?B?NTNKdzV1V0J0Z0JOWVo5RllPZExEeDRWZWFJdmw4TEpCWS9pUUZRVHJQdTlL?=
 =?utf-8?B?WnRiUlFSYzhRK0YxSnNqMmM0b1h2UjdNYlQxdzdoNmdtaWdGSlBlTzBLejZ2?=
 =?utf-8?B?QVM5YjVBYWJ3NnB5U25OWUY1U1dMSmRHQmJQcXhhU1R0ZWEvQUZVQ0Rxb2hG?=
 =?utf-8?B?OTBBN1c1b3JjdHFCcUdoRnhzcDFUOUZQY0YzR1RMYUdmVUhTL1Q5clg4cWRY?=
 =?utf-8?B?bUgzRW1leWlhbUhKUlBFU1ZDRVRSeVVGOWxIZ0J1bUcvWFJVTjJXVnd2czBW?=
 =?utf-8?B?dTFhYlowOEt6WnNvMUNCYlRQaFlDZnlvTzlMSFlTQkk1WWprLzA0V0dhSDF2?=
 =?utf-8?B?TmhkMjRHZUp3OFFzTUZsTzFDaWhsMitzOWxrUFdUaWVoVEN1OVF5ejZHTkI2?=
 =?utf-8?B?d0VsSkppa05IM2FwWFpSZm0zN1lHeForQ1djOGxyS2RYdnpMdTBQNEJaL0NK?=
 =?utf-8?B?WjdzSzVWV0toUlpBN1R3a1MySllUZHkwc0U4Q1dFQVFwdnZmeGJWYnlQRU1K?=
 =?utf-8?B?VWVUK1dqeXYxc0k2Z3RPc0Z3RkFFMDhMTlNueFdWZktDTFN5bmwyZEFwOGRx?=
 =?utf-8?B?RzlRSldNdDBadEVXK2ZPWVBzMnU4MStWMzRwcGMrbHZ0MFdPQytqL2NyNU1o?=
 =?utf-8?B?cEZ6TWYveGg5clpmWVJEb1VSNS8wK2xTU2JYMzVuaUF1NTIzOWd1N2JuOHc3?=
 =?utf-8?B?YzArMDR1NlE3ZmRFeFdQVmZMRC9zcXpwMEd5NUROVHlqZk9GTUxsYW9Wc0lp?=
 =?utf-8?B?enlVeW9KV2xPdk41UkVFYkRDSUZlYWhVSDB1SGRVb1ZzUWpFcTJDYjlzaG4r?=
 =?utf-8?Q?wM6PaHq/Yk3t+mna1u5p/WBYombyTHAm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3JLcGhsWFB2RHFJZE5GUUI3ek1KbGhpN3MxWlBtcFJRWDNkMWN5bW1haDU0?=
 =?utf-8?B?QjVldjZ6eEhyNzFReTFvdEd6alh1U3dlOE5iOUVtSG9zZlJYQ00wRWZZb0g5?=
 =?utf-8?B?TVJNNVRIT3BuVUMwazNrL3ROM3hOaTBST2pyUGxINFlVSjA1aG1UNHB1RWlx?=
 =?utf-8?B?eWRxMmVUMS8yN25Xc2srQ1d2WFRPN3NudDgvSTZVb1UxdjBPc1hBeE56aTUw?=
 =?utf-8?B?SGdoaFVsUytETXBiZERMTHV1MmpKMEdTaHRmemR6VWV1WEpPYzV3QTlOa2tP?=
 =?utf-8?B?OEZSTkdiOE1XMWQwM3Vic2VwNDc1UjhBZmg3MW4vM0Y2Vll2dW9hdUtHa3FG?=
 =?utf-8?B?V0p4R3FZdzBJL1FqY2JrdGdIRTlqNWVBM3ovOXFHRmpZMzUxWW8zelpScVdL?=
 =?utf-8?B?NkNjbGQwdjlSZWJHekJ6U2MzTXBrcCtpQ3hHRXBmVXRUVWdMMjlKSFdtUmtz?=
 =?utf-8?B?M0kwdFBUbUltWUNUQXhHYko2OURyWnREMWJibWQxTHNoYmtUMlpmVU1Mcmp1?=
 =?utf-8?B?Z3QvRklBRTExNEVDMjlkNFVkN3A2b0lHejk4YjVEbVA0V3JTRTd6WDgxdzk3?=
 =?utf-8?B?SWdqWEIwTWdSSGF6YWVKa3E3Ky9UY3JJaERldm5MeTV0SjFyTEhWZ2hZUFFl?=
 =?utf-8?B?VHVDeW0waDFMRnRHU3FzWDByVXc3M2U3a2phcFRibkRYWFZmOVdJM1lNYVp3?=
 =?utf-8?B?VlFJYk5CVk1MWEQ5ZkxWUXBUQnVJUHhCc3JNQkpid2hKWEpIK2NTVkNJSDd5?=
 =?utf-8?B?Rno0R1VmUnp3dVpjcFpEV2tGTHlCN2g5bStYWkU5MjlzcElLd3k0R2R4dUpP?=
 =?utf-8?B?TWxXQ0R5Ry9SK1Z1UHVzMWd6SmtxbVR0MWlOSEZtcTcrVXhOSHl1MFg0R2Ri?=
 =?utf-8?B?RnBVTEVXcmp4NjdGYW16SXZwSzNicTlXcmcwRmtTSCtRdTBGaDlQU3p0WGNQ?=
 =?utf-8?B?Q3VlczlsSVpaSWcrTk1tNFV4ZFlseFJCSmFJMGFsUit0QmU3c1VyN0FnblBP?=
 =?utf-8?B?N0VhTGhseUUyNzJ0OXlYbk56eENhZlFBOXAyenBiekVGM05JQlJ5UmRnMWwv?=
 =?utf-8?B?MHpwZ0NId1VpdVFlYnU5OEV6ZmFrL25nVWxWWHlSZVFVRnlraVBlaG4vVTVa?=
 =?utf-8?B?K0hqejF6c2FIY0lpS0hTeDAxMFo5WGxOSHUxV0svYUZUem5Qb081M1ZCdDFK?=
 =?utf-8?B?bGk2MkQ3anJGNll5S24zSy8vcVBwNVFzVExBQVh6elZvdjVCdnArcjU2cnVJ?=
 =?utf-8?B?ZTdMU2dseE1CTnJPd3g5dmgzSVZud3UwWXg1Sk1FYXpoTmh2enQzSVE2NkZz?=
 =?utf-8?B?bUhUWXArejl5VUZGUmtCaWFaYzZ2Z1RhdzRkMzZOZ0VOSlZ6M3h1YzVFUEFJ?=
 =?utf-8?B?OUtkVkoxb3pEZk9lcVZENTZoWjdWMkdNZ0wvR0ZMR0NQV2Q3Y2lxeUNrTm9o?=
 =?utf-8?B?RWJUQ1VRUWZjOWdvMGxHSEk1dXd5WWxrc2d6WE9VcDZXaFJYZGMvSWpTM28v?=
 =?utf-8?B?NFJEaUJnUmVqcjVtVml5TGtnLzd0Nkd4SlNYbXJSaXp4YUpxQ0F6bkZnK3E2?=
 =?utf-8?B?ZmlRcUFRRjcwSll2MEpSa1Z1NWlqU1JnZllOUHFBMllZVVZjb0VkSVRVUEFS?=
 =?utf-8?B?ckkvVE1JZDFLdjY0NWVER2FqRVgzQXQ1QzcrcjJ2WkFac3VUYzVNY3BPNGhL?=
 =?utf-8?B?bUxPdXlod01YQWFuVGlMb05DWWdZTVhLazVmTkx1Wk9XMEdmdlZWVDI2VjRU?=
 =?utf-8?B?OUY5Q1BzZ2hvZnFRcVFNU2hkVjFZbVBPbFE4RERuWWNWOE1rQzRkWFpnWndP?=
 =?utf-8?B?TGJxOGpWQzJ6dExKWlFHamQ2a2FNSWhBSWJydENVNXI1ZE9rQSthbllTZjRa?=
 =?utf-8?B?T1Z5U3doY2gyVWY5RmxGSUxJQm12VmtTOENiaGY0Z2x5cnEzcThWamltOWlw?=
 =?utf-8?B?RUtzaVM5c1MrNHMxamo2ZFlSNFJRR1RTV3ZXL2IxVlByWE5yZExlWnFtT2hF?=
 =?utf-8?B?RG5WdTNydEMvZys2cmo0R3FzbzUrZ0ZwakxCUmw0bk1MUnBzYlNlbGt3UW9K?=
 =?utf-8?B?ZHBGSkt6bjVMc1pGMFUzNHJMRFYzQjVyeWFKYTNydHY4RW9naHZmOGNRUUhS?=
 =?utf-8?B?c1JQRWNSZWpPZDdGcGIwdGRqdUluRWVjYWJtTW1sWmZWdXF2K2VyYTJ1L2Fi?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <694D5BC4F847284198F0CC02009EDCC3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100e725c-f5b8-436f-6f94-08dd70f46a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 08:08:41.4746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l+tJQoyhwZohbuI7XiesUMHq050XdzJRm5WB0xJROMW8B2qap/qdUWmSFpmxkRjKUl/O6bWHdvvgBNaUCEMIew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDIyOjQ2IC0wNzAwLCBTb2hpbCBNZWh0YSB3cm90ZToNCj4g
T24gMy8zMS8yMDI1IDY6MDYgUE0sIEh1YW5nLCBLYWkgd3JvdGU6DQo+IA0KPiA+ID4gPiBBaCBJ
IGRpZG4ndCBrbm93IHRoaXMgc2VyaWVzIHdhcyBtZXJnZWQuwqAgSSB0aGluayBJJ2xsIHN0b3Ag
bG9va2luZyBhdCBpdC7CoCA6LSkNCj4gPiA+IA0KPiA+ID4gWW91ciByZXZpZXcgY29tbWVudHMg
aGF2ZSBiZWVuIHVzZWZ1bC4gUGxlYXNlIGNvbnRpbnVlIHJldmlld2luZyBpZiB5b3UNCj4gPiA+
IGNhbi4gWW91IGZvdW5kIGFuIGlzc3VlIGluIHBhdGNoIDEgdGhhdCBib3RoIG9mIHVzIG1pc3Nl
ZC4NCj4gPiA+IA0KPiA+IA0KPiA+IEkganVzdCBkaWQuwqAgSSBkaWRuJ3QgZmluZCBhbnl0aGlu
ZyBhcGFydCBmcm9tIG9uZSB0aGluZyB0aGF0IEkgX3RoaW5rXyBpdCBtaWdodA0KPiA+IGJlIGhl
bHBmdWwgdG8gbWVudGlvbiBhbm90aGVyIGNvbW1pdCBpbiB0aGUgY2hhbmdlbG9nIG9mIHBhdGNo
IDUgIng4Ni9ubWk6IEZpeA0KPiA+IGNvbW1lbnQgaW4gdW5rbm93biBOTUkgaGFuZGxpbmciLg0K
PiA+IA0KPiANCj4gS2FpLCBJIGZlZWwgdGhlIGFkZGl0aW9uYWwgY29tbWl0IGlzIGluZGlyZWN0
bHkgaW1wbGllZC4gSSBhbSBpbmNsaW5lZA0KPiB0byBsZWF2ZSB0aGUgY2hhbmdlbG9nIGFzLWlz
IHVubGVzcyB5b3UgZmVlbCBzdHJvbmdseSBhYm91dCBpdC4NCg0KU3VyZSBucCB0byBtZS4NCg==
