Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334128DEF8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746651802; cv=fail; b=RXY6W4qO0tUxSOoNNSL/gnk0NcAZ+l4Q+MvEIyW4/V4MHxnRn7Z2+U5IsFEVgX+cAqtLvmKmMqtdeeqqWNAlGo2w/4ofVhQoQJsV9ZcnoXtwkUXg4p7GBgUOVNQrVEGafdzb0qefmtRFvRCxJ6y1miaPYK5Qm7HmnHvDo5mrWCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746651802; c=relaxed/simple;
	bh=6kpBIFYQDvgLGJ/JzjezJuw+TYwOGxz9T55O7nUbdN0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PFlnwW1c/gyGBdddh8zHBglbgLtLVLEMDY7sFAQR5CkXtdW1uY2XI9sxYLYyNHRrwcMo/s/twzXeg6rA8+PGN+6ufFQpf+iozaGM60qym+WhfdCVrSSxtOYKxB5OpdU0XuO+rFYYV7a9CRYBn/ub0NfkYpNmS4ftDhSYPz2ViCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvXXpX2K; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvXXpX2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746651801; x=1778187801;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6kpBIFYQDvgLGJ/JzjezJuw+TYwOGxz9T55O7nUbdN0=;
  b=mvXXpX2KLykoM7Sr9ihRwFWFqdDC414AnLygbxdbAtZ/JL5rmtDayC/R
   w2dMG8eR6u8jV6mCuJhtJhNDIrgaAaEPB8BJgWZD7mWkdHR6kH0vFNqyr
   A5xzVsKC3ji1zVo6g28So3KQ3oEeZQ6Zdmvtl2Xd1aDZAEOmFqt/v9nYE
   1MqLR0LFrARafw86MUf2Gw0BUOpdem0pq+BTlUixi+63LALfugoqIZnF+
   pFE+8d26pPaRlKp8SWmy73XhHRjLxkXK35wqZgdbzvQpAQ2iNqusYCktO
   jcQ7fR2G8SeP2yKI+ZXwqIWklBC2+qYKxsT9YjPvHAjty84NkXR77ODCJ
   A==;
X-CSE-ConnectionGUID: xacxePOgSwam3T1nvCU16w==
X-CSE-MsgGUID: DVLCxY79SyuHt2Hf/DHxyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="36039450"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="36039450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 14:03:20 -0700
X-CSE-ConnectionGUID: RF2JWu5YTHiijGFxfUscIw==
X-CSE-MsgGUID: DuDB85WUSf6OPZv/z5PgEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136579934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 14:03:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 14:03:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 14:03:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 14:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN1GCnWJfYzVL3uAKlGHGu0E6Ms8xpQ5Zg9oiciHlwtXAKaUBUHb8YTm10M6zdgkgWe2THJTD7A432v3A9gU98kkwwRe/ViYXlvef2pAeXc9I+mPwWk69gAIlxxulXvOWtIqpmpLqbycYADNNiw2q5MDMGRuT3OiInUnnRlUk9VxKRuQ8o57Zs3M6x0XFwwUAovMU/AIfW4Zgu/lgnZ5I6fLJTTb3a5PrAvJnVF0DjWpZxFiFZ472Tz30Q4l3IG9HdAzsrMW2cQFY+IX4IRLF6uZ5QVQuak7dHVrmNwwcclc4QxkJHXUiu19n9DTTRakH5AL2e5gBzAkv77fYGJvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kpBIFYQDvgLGJ/JzjezJuw+TYwOGxz9T55O7nUbdN0=;
 b=L3XB3ovWdftU8AAqHR3ArdIW6KvDbnBLzxGAFoSdqoyUwFtnbmuDLhySBtvbc9KbaeDurw08QeekAIS5OKhjHHqq+cnLxaqOZ1hDAviR4oBRIR1tWq8xBOr4N/eYZppcwlBOk3CApkZY/tRvjMtyUTF+5xTC1d8MCtqk8iiqEFK1U8Ld1M2nG2O3Bjy7TBkhyWml2SCtsKxdyy0IRyHz/OyClAon1Gs/AoUgvKMrIUIHf0rGqQ4rQamqTgotJNwMfR0nU3+vCDu5EM28A+sPbtmdVhFZeJNOQ/HWmrYlQdbfMcW8cUpCyUj5w+F9errnpBsGNbD4WUe0aav+PUI1Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 21:03:14 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 21:03:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "Huang, Kai" <kai.huang@intel.com>, "bp@alien8.de"
	<bp@alien8.de>
CC: "seanjc@google.com" <seanjc@google.com>, "x86@kernel.org"
	<x86@kernel.org>, "sagis@google.com" <sagis@google.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "Chatre, Reinette" <reinette.chatre@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Topic: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Index: AQHbryPIQc8IA+YWOkSunFUCTSHsmLOoJAYAgAAIsQCAAAnGgIAfkh4A
Date: Wed, 7 May 2025 21:03:13 +0000
Message-ID: <9a9380b55e1d01c650456e56be0949b531d88af5.camel@intel.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
	 <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
	 <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
	 <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
In-Reply-To: <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|BL1PR11MB5979:EE_
x-ms-office365-filtering-correlation-id: 70581b8e-4d22-47cb-e47d-08dd8daa94f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SE1WdjQ4ODZuVE1lMWkvQ1ZhRzJ0cE84TlZSTDdGSzY1S3laV2N2VnhRRXYv?=
 =?utf-8?B?NmhCdHdqSnVjbnlzU3BZdHpuNSt0UkNDUVpHSTJGY3ZxUUxQSlhMOGRBQ2Qw?=
 =?utf-8?B?VUREOUNWVU1iRXllWUZjRkNaRDRFbDVkMWxYc2FBcTcrNVFYTFpvblZrUTRs?=
 =?utf-8?B?aWtqSlB2QUozdFRuTW9XWmgwazdCTUc5Z0NTd0N4elV3ekRyVXMyb1lvNEQ4?=
 =?utf-8?B?MUFtbk92WUF1amdzR0YvWVV3OEVVWnB3UzRXajBwT2lBQ2QzMlJoV1Q4aldz?=
 =?utf-8?B?a0JvcE9LUG00Q0JNYzNjME92YmFqa3dPZXpTR21Zb2JKQmJhN0lPZThvQnpE?=
 =?utf-8?B?TnB6WG9rd0daejlqOHRiN2IrMXArTnNyTjlxMEJDeEhZOURGZzFUQUtBcUhp?=
 =?utf-8?B?eUthb0VhaHdkQy9DMVF4a1hsa2t2TW9HdHk5d1hWaHhsN3E1TDdRVUEvOWVz?=
 =?utf-8?B?TkVzb1Yvd21zUXFyRmk2b2xmdjVZd05QSHM3V2RQRkhXV0hMUnhXZ1FKc25K?=
 =?utf-8?B?YVQ5Q2RNNk8rVWZnQUZhNFl5azZ1dXFTQUV0ZWo4dFMxMk5TbE1XbkNMbVJR?=
 =?utf-8?B?STB6TFpLdi9YTVhoWmhuZFllTGJEWHoza0F6TEd0NHNCTWE5cHhMUWozZDVI?=
 =?utf-8?B?a04vc0M1NlhiN092cndEWndVSURDeW0wcWpYc0JMcENqb3Boang4c2VQZUhh?=
 =?utf-8?B?RXdUT0RzS1kraTRGYnZHWldESG5SNDVZNVhISkV4TDlrOUMrV3JNbk1HdDZl?=
 =?utf-8?B?QmQ4Skc1cUFIOWlNMzZFZG5JSWs2dHE5Y2crcVFnSkFhMHppYzl0SlZ5TUF4?=
 =?utf-8?B?aEFwQTMvL3N3S05ka054Q1ZobzFvUXNNZzNVejlEVmRLVm52MDlzM0JuZXBu?=
 =?utf-8?B?cGxWKzZSaE9mdnIvbjNwWkRBYmZaa1NoUm1Kcml5UFZuaWJPSGdqRkdYNDlF?=
 =?utf-8?B?bXdpNjJJYXdBZUFjNzRJUUQrVXNIY3M4c3IwTzZPdURyblROcFFRWjRVbG5y?=
 =?utf-8?B?cmdvQVZLQTJsbk9oWm1Fcjc3bnNrMUZldGhpdUFGVE13akFQZnpsc0xrZWgx?=
 =?utf-8?B?d0cvOElqTlc3NU1OZi81azZ1Nk0xeUJ0elF0anN4MjBYVlFkVDlGTUFnaEFm?=
 =?utf-8?B?ZkxCeGtPWmtQcFB1S1JkZXdaT3FWSGhxSDFCNVA3T2FyVVlTWHJYejJtSWFJ?=
 =?utf-8?B?bmQzaUxORFp3RUF4TGhvNmdYRFhlaFUrZHp2enZzZjdJQjBlRStGd3d5NTBU?=
 =?utf-8?B?cUkvRjVRbmhwUXd0VmxpYXRoaHZRV083SFoweDVOMHhOeXlVdjkvb2p5ZFBt?=
 =?utf-8?B?NDBCZnVvRStVSTIwaDlFWlJ5QVY5TmtaSjB1Nmc1UDBNM2dvZEdoa1V3VDkw?=
 =?utf-8?B?ZGdRN3J1SnhYYmI3MG1DVTNJN1JvaGNBQzY5RWJ3YnhveUZlamd2R3dCNFpQ?=
 =?utf-8?B?UUJ5VDVBa2x4MkJPWTh0R2lwK2w1MFAvUWNsUnJhci82NVlxbWlKdStGejBJ?=
 =?utf-8?B?aHd1ak90NXY0YXB2R0ZTYkc2QmxNYmIvUk9tdWw0bW9SODBwWXdQLzE3M3lr?=
 =?utf-8?B?SVFVOTdhOVpCNmdFWjRzaEdxR0FtZmhUdm0xWXlkY3pPMkgwejgyYWkxRzJQ?=
 =?utf-8?B?aktyWTgvMzR0RDNlZTlSV3E5ZnZjZ3B3MUllUUZNRUw1c05NNXFvTXFtRWtY?=
 =?utf-8?B?ZGprNllXdGRRWWFkTFlDQ042WjJtaHNUa2dqcXh4NmI1V2ZnT2NYZjBuMUxU?=
 =?utf-8?B?UkJhTGg4d0laUXVwZDBWdHh1NHloS1FZQ0poNVgyWUdZRzkwN0swTFBRdC9T?=
 =?utf-8?B?NjdwejNXcWxrZWdldTdJblZxRDRIY2plQ2tScm5OT0VydTFyMkRyR3V5emdZ?=
 =?utf-8?B?Zk9wSkVBT05jYlRKY1ZzdmRpcmcrd2E3Y0RhUDZTbXVCcW1UMWZTZVlyTGJi?=
 =?utf-8?B?RGtMdHNJUE1qTm15QTFScENrcW1TenpIcVFHdGpWV1paTGFXUUxwMWhLdmkw?=
 =?utf-8?B?cEpaWTZjN0JBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1A0Qmhuc1VWWnVtTGxPVkVLc0p4c3lmVzUvd2g1UWF3WUxhNUxIN2JKeE1j?=
 =?utf-8?B?TWRPVHlDelFwcGJoZ2FxWjhwZDg5eVJsRTRaTG10K044MmdsYituRWhvZUIr?=
 =?utf-8?B?WjlldHlQSld4TUpNeVpPbjVNbUgybzFwckhOMjJBM1pYdFJrcllIdWlJdCtx?=
 =?utf-8?B?R2lEMGhMZWlQY3VLUHl6YjZneHRsTVpvK21mbUJlbldiT1AxZ2xtY3QyUG5i?=
 =?utf-8?B?UWo2b21vdytsempwbnZLUWUwNE1oZjNZWEpBcTdHU1BIWWtDVGx4WWI4RlRH?=
 =?utf-8?B?MzFheGlxcDQ4OHF3elFkcUkzb1haZkhQUU8wZm5YZlFXdk9xdjFMVTJWNzd4?=
 =?utf-8?B?Q3oxamxZRUpYYnBIK05UQzVYcjZCUTZ5ajFRaElRMlV0Umh3cGVLVXhCcU1k?=
 =?utf-8?B?NW5IdG9FdUVRZGtjbGZIWFBka3kzSGhHYUFKaGF3Y29EeWdFTDY2RVg1cmVP?=
 =?utf-8?B?L2pBaUdTRGIxazc2T0xqaS85Y01Nd1RNdHgrcUtUNkxsQW5SQWwxRlZYajBn?=
 =?utf-8?B?bzd0N1lnUlhyajhPU0M4NG5KSW1tK0ljenhGSDJRZ3RFMFc5MkpUcmozTXUz?=
 =?utf-8?B?NnRncU5SZmdpb1hMcmU1NEJLajBXeCtoNysrSXlwUG1IZU9pY1E5UkxTYThO?=
 =?utf-8?B?V1VXVjFzd1JtWlFCVy9XcGtLOUZjOWF0dG1NSllmbTI5WmNnL2pZakNZbXl5?=
 =?utf-8?B?dGRBdkxORHdXMG93Vm82Z3BDdS90dmJab1J3eitXZGorc05Wc2FRcXNGMFFE?=
 =?utf-8?B?b3duOUw5ZzRlL2FmMVNYVkR0ZVkzVm45UVlxYlp4emVGQ05vc2xJUnZ5UGtz?=
 =?utf-8?B?ejFMbEk0UlRpNnhhakYvOWVnaEtWNkY0RlpVZkdMZllmakFOUCtYcENSeFRq?=
 =?utf-8?B?ZERMYzhjdlE1MjY5TEJzbHlkd3FmN1ZRb1VuL204WDBPU1U4cWlqTTlRN0pj?=
 =?utf-8?B?WE85TDMvZ3NldElmUzJNbmRDY1I4WmRmKytyZDBKV0lNM3krUUMxVU53eCtv?=
 =?utf-8?B?RnhwMWJCN3ZJSkpTbG1CeWtPREJzRExQNUN3R3JMckV0b1drTmlyOEc0VXFW?=
 =?utf-8?B?VWNMZW5HY2NhSHYrZGR1V1lvK0xxT0ZBSnVpVE5mR2FnOGJ4UGMvN0JHcjJU?=
 =?utf-8?B?akgyTkM3ck5Ud0J4RS9iRDBiMXowam03UyszZlc1QXBhWTk5U2hKZUgvUkVw?=
 =?utf-8?B?akRjUlZZdUxNUHRWTllUZGdXdzVaTnR3eTU2cGlVTFROMlc2ck1TNnlOT0lL?=
 =?utf-8?B?SkJXWUZMRWVRRGwzdGlYUTdjZWU1MVQyd0JSY0lXOGwySFoxdnJ0dFlCT2Vj?=
 =?utf-8?B?K1EwZ0Vtb2h5bERjd1BreVJuM2d4RVNpQkdoQmpzMWkvUjVxRmNTamgvRzQx?=
 =?utf-8?B?aTNvY2s0WFBjbFpBVE5mdjUwSm16VW9XVnV0SnVTQ0kxNnEvS3ZpSHpzblNL?=
 =?utf-8?B?alhMKzFXUzZFZ1VwejI4d3BZOHljZUZBWTZUU2YwRmpqN1NjQ1hUWTdlcXVU?=
 =?utf-8?B?R1lVS3E0bmlvblhJUDFPV0h6S1NxcGZDOEhpUk1Pai8zSkc2OU1yK2dFdm1B?=
 =?utf-8?B?ZWo3RlZMNXJYV2Z1M1hzUXZQeHkzQ0M3ZXRnRDRKR0Z5eEtNanpzRUdxQ0tE?=
 =?utf-8?B?VEpaRllqY2N4WkRpNHdxKzVnZVpKMEJtYm9raThESHFwWEhjTU9pMUJZdkZS?=
 =?utf-8?B?N0FXQWo5aDdjUStFeVBCVFBVWlZDMXBWWVJIcEh2aHNWdTBRT1QvRjRMdHFX?=
 =?utf-8?B?eTNwZXhjdWxxTTZEN3A2NUNvSGlGdDFnZkhnNlRjcFJvVzNEWldRUGVDbElI?=
 =?utf-8?B?b1kvNEJmcFJ0ZkFVYWRjYm1ncGo3M3FBN0EycVFVTnJ2VkJ2WnBmUU5MR2tr?=
 =?utf-8?B?VHowL0RHRFk2WlB4RG1mdzBkdUZ5VGVhQlBrTHJReVdHVXd4eitqTFk3MjZn?=
 =?utf-8?B?Si9ERHdZVm5KT0lySzQzNmg0MHp5ZW11UEVPcjRUMnpadWZyZ3BjemVwRlVv?=
 =?utf-8?B?ZXQzeVhDYUxiczBqM0RXNlpPNGQrcW1JTDljWE9PckRyY1dRQWt1Mkk3M09v?=
 =?utf-8?B?dE10T253dlBZeWtXd2tnZVRZSkl2ek5NYmNmRHprRVIwTERndmtUaUlCQS9m?=
 =?utf-8?B?ZWlYejRRN01kcGZNZFVaK05QeE45R0ZzMzdHeVZTZ3FRRDZRMkpIREVzcEFo?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6655FB23F7E41D4F83A0E2988B820C57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70581b8e-4d22-47cb-e47d-08dd8daa94f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 21:03:13.9223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dYFnlND5WR/LlE5/fPY9+5zPdS8ehd2TZgE5ImJF72tzqy4K5NakRiSkV7oNVAIW1Gu9B7PoJjFnwoDD09rgip25XyRloVzcs7parQChBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDExOjU2IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
SSBnZXQgaXQuIEFkZGluZyBXQklOVkQgdG8gdGhpcyBzYW1lIHBhdGggY2F1c2VkIHNvbWUgcGFp
biBiZWZvcmUuIEJ1dA0KPiBqdXN0IHR1cm5pbmcgb2ZmIHRoZSBmZWF0dXJlIHRoYXQgY2FsbHMg
dGhpcyBwYXRoIHNlZW1zIGxpa2Ugb3ZlcmtpbGwuDQo+IA0KPiBIb3cgYWJvdXQgd2UgdHJ5IHRv
IHB1c2ggV0JJTlZEIG91dCBvZiB0aGlzIHBhdGg/IEl0IHNob3VsZCBiZSBxdWl0ZQ0KPiBkb2Fi
bGUgZm9yIFREWCwgSSB0aGluay4NCj4gDQo+IExldCdzIHNheSB3ZSBoYWQgYSBwZXJjcHUgYm9v
bC4gSXQgZ2V0IHNldCB3aGVuIFNNRSBpcyBlbmFibGVkIG9uIHRoZQ0KPiBzeXN0ZW0gb24gZWFj
aCBDUFUuIEl0IGFsc28gZ2V0cyBlbmFibGVkIHdoZW4gVERYIGlzIGVuYWJsZWQuIFRoZSBrZXhl
Yw0KPiBjb2RlIGJlY29tZXM6DQo+IA0KPiAtCWlmIChTTUUpDQo+ICsJaWYgKHBlcl9jcHUobmV3
Ym9vbCkpDQo+IAkJd2JpbnZkKCk7DQo+IA0KPiBObyBURFgsIG5vIG5ldyB3YmludmQoKS4gSWYg
U01FLCBubyBjaGFuZ2UuDQo+IA0KPiBOb3csIGhlcmUncyB3aGVyZSBpdCBnZXRzIGZ1bi4gVGhl
IGJvb2wgY2FuIGdldCBfY2xlYXJlZF8gYWZ0ZXIgV0JJTlZEDQo+IGlzIGV4ZWN1dGVkIG9uIGEg
Q1BVLCBhdCBsZWFzdCBvbiBURFggc3lzdGVtcy4gSXQgdGhlbiBhbHNvIG5lZWRzIHRvIGdldA0K
PiBzZXQgYWZ0ZXIgVERYIG1pZ2h0IGRpcnR5IGEgY2FjaGVsaW5lLg0KPiANCj4gCVREQ0FMTCgp
OyAvLyBkaXJ0aWVzIHN0dWZmDQo+IAlwZXJfY3B1KG5ld2Jvb2wpID0gMTsNCj4gDQo+IFRoZW4g
eW91IGNhbiBhbHNvIGRvIHRoaXMgb25fZWFjaF9jcHUoKToNCj4gDQo+IAl3YmludmQoKTsNCj4g
CXBlcl9jcHUobmV3Ym9vbCkgPSAwOw0KPiANCj4gaG9wZWZ1bGx5IGF0IHBvaW50IGFmdGVyIHlv
dSdyZSBzdXJlIG5vIG1vcmUgVERDQUxMcyBhcmUgYmVpbmcgbWFkZS4gSWYNCj4geW91IHNjcmV3
IGl0IHVwLCBubyBiaWdnaWU6IHRoZSBrZXhlYy10aW1lIG9uZSB3aWxsIG1ha2UgdXAgZm9yIGl0
LA0KPiBleHBvc2luZyBURFggc3lzdGVtcyB0byB0aGUga2V4ZWMgdGltaW5nIGJ1Z3MuIEJ1dCBp
ZiB0aGUgb25fZWFjaF9jcHUoKQ0KPiB0aGluZyB3b3JrcyBpbiB0aGUgY29tbW9uIGNhc2UsIHlv
dSBnZXQgbm8gYWRkaXRpb25hbCBidWcgZXhwb3N1cmUuDQoNCkthaSBhbmQgSSBoYXZlIGJlZW4g
ZGlzY3Vzc2luZyB0aGlzIGludGVybmFsbHkuIEhlcmUgSSdsbCB0cnkgdG8gbW92ZSB0aGUNCmRp
c2N1c3Npb24gZXh0ZXJuYWwgYW5kIGNvbnRpbnVlIGl0Lg0KDQpUaGUgcHJvYmxlbSB3aXRoIHRo
aXMgYXBwcm9hY2ggdHVybmVkIG91dCB0byBiZSBwZXJfY3B1KG5ld2Jvb2wpID0gMSBwYXJ0IGlz
DQpyYWN5IHdpdGggdGhlIFNFQU1DQUxMLiBUaGUgdGFzayBjb3VsZCByZXNjaGVkdWxlIGJldHdl
ZW4gU0VBTUNBTEwgYW5kIHRoZSBwZXItDQpjcHUgc2V0LiBEaXNhYmxpbmcgcHJlZW1wdGlvbiBh
cm91bmQgZXZlcnkgU0VBTUNBTEwgc2hvdWxkIGJlIHBvc3NpYmxlLCBidXQgaXQNCnNlZW1zIGEg
Yml0IGhlYXZ5d2VpZ2h0IGZvciB3aGF0IG9yaWdpbmFsbHkgYXBwZWFyZWQgdG8gYmUgYW4gZWFz
eSB3YXkgdG8gcmVkdWNlDQpidXQgbm90IGVsaW1pbmF0ZSB0aGUgY2hhbmNlcyBvZiBoaXR0aW5n
IHRoZSByYWNlLg0KDQpXaGF0IGlmIGluc3RlYWQsICduZXdib29sJyB3YXMgYSBnbG9iYWwuIEZv
ciBTTUUgaXQgY2FuIGJlIHNldCBhdCBib290LiBGb3IgVERYLA0Kd2UgY2FuIG1pbmltaXplIHRo
ZSBjaGFuY2VzIG9mIHRoZSByYWNlIGluIGEgbGVzc2VyIHdheS4gVERYIG9ubHkgbmVlZHMgdG8N
CldCSU5WRCBpbiBzdG9wX3RoaXNfY3B1KCkgd2hlbjoNCjEuIFREWCBpcyBsYXRlIGxvYWRlZCBi
eSBLVk0gKGN1cnJlbnRseSB2aWEgbW9kdWxlIHBhcmFtZXRlciwgYnV0IG1heWJlIHNvbWVkYXkN
CndoZW4gdGhlIGZpcnN0IFREIGlzIGxvYWRlZCkNCjIuIFdoZW4gdGhlIG5hdGl2ZV9zdG9wX290
aGVyX2NwdXMgaXMgaGFwcGVuaW5nIGFzIHBhcnQgb2YgYSBrZXhlYy4NCg0KVGhlcmUgaXMgYWxy
ZWFkeSBzcGVjaWFsIGNhc2UgbG9naWMgZm9yIGtleGVjIGluIG5hdGl2ZV9zdG9wX290aGVyX2Nw
dXMuIFNvIHdlDQpqdXN0IG5lZWQgdG8gYWRkIGEgY2hlY2sgb2YgaWYgVERYIGlzIGxvYWRlZCwg
bGlrZSB0aGlzOg0KDQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYyBiL2Fy
Y2gveDg2L2tlcm5lbC9wcm9jZXNzLmMNCmluZGV4IDk2MmMzY2UzOTMyMy4uMTQ3Zjc4NGQ2ZDBm
IDEwMDY0NA0KLS0tIGEvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYw0KKysrIGIvYXJjaC94ODYv
a2VybmVsL3Byb2Nlc3MuYw0KQEAgLTgxOCwxOSArODE4LDcgQEAgdm9pZCBfX25vcmV0dXJuIHN0
b3BfdGhpc19jcHUodm9pZCAqZHVtbXkpDQogICAgICAgIGRpc2FibGVfbG9jYWxfQVBJQygpOw0K
ICAgICAgICBtY2hlY2tfY3B1X2NsZWFyKGMpOw0KIA0KLSAgICAgICAvKg0KLSAgICAgICAgKiBV
c2Ugd2JpbnZkIG9uIHByb2Nlc3NvcnMgdGhhdCBzdXBwb3J0IFNNRS4gVGhpcyBwcm92aWRlcyBz
dXBwb3J0DQotICAgICAgICAqIGZvciBwZXJmb3JtaW5nIGEgc3VjY2Vzc2Z1bCBrZXhlYyB3aGVu
IGdvaW5nIGZyb20gU01FIGluYWN0aXZlDQotICAgICAgICAqIHRvIFNNRSBhY3RpdmUgKG9yIHZp
Y2UtdmVyc2EpLiBUaGUgY2FjaGUgbXVzdCBiZSBjbGVhcmVkIHNvIHRoYXQNCi0gICAgICAgICog
aWYgdGhlcmUgYXJlIGVudHJpZXMgd2l0aCB0aGUgc2FtZSBwaHlzaWNhbCBhZGRyZXNzLCBib3Ro
IHdpdGggYW5kDQotICAgICAgICAqIHdpdGhvdXQgdGhlIGVuY3J5cHRpb24gYml0LCB0aGV5IGRv
bid0IHJhY2UgZWFjaCBvdGhlciB3aGVuIGZsdXNoZWQNCi0gICAgICAgICogYW5kIHBvdGVudGlh
bGx5IGVuZCB1cCB3aXRoIHRoZSB3cm9uZyBlbnRyeSBiZWluZyBjb21taXR0ZWQgdG8NCi0gICAg
ICAgICogbWVtb3J5Lg0KLSAgICAgICAgKg0KLSAgICAgICAgKiBUZXN0IHRoZSBDUFVJRCBiaXQg
ZGlyZWN0bHkgYmVjYXVzZSB0aGUgbWFjaGluZSBtaWdodCd2ZSBjbGVhcmVkDQotICAgICAgICAq
IFg4Nl9GRUFUVVJFX1NNRSBkdWUgdG8gY21kbGluZSBvcHRpb25zLg0KLSAgICAgICAgKi8NCi0g
ICAgICAgaWYgKGMtPmV4dGVuZGVkX2NwdWlkX2xldmVsID49IDB4ODAwMDAwMWYgJiYgKGNwdWlk
X2VheCgweDgwMDAwMDFmKSAmDQpCSVQoMCkpKQ0KKyAgICAgICBpZiAoY2FjaGVfc3RhdGVfaW5j
b2hlcmVudCkNCiAgICAgICAgICAgICAgICB3YmludmQoKTsNCiANCiAgICAgICAgLyoNCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc21wLmMgYi9hcmNoL3g4Ni9rZXJuZWwvc21wLmMNCmlu
ZGV4IDE4MjY2Y2MzZDk4Yy4uYTI1NGY4ODQyY2E2IDEwMDY0NA0KLS0tIGEvYXJjaC94ODYva2Vy
bmVsL3NtcC5jDQorKysgYi9hcmNoL3g4Ni9rZXJuZWwvc21wLmMNCkBAIC0xNjAsMTAgKzE2MCwx
OSBAQCBzdGF0aWMgdm9pZCBuYXRpdmVfc3RvcF9vdGhlcl9jcHVzKGludCB3YWl0KQ0KICAgICAg
ICBpZiAoIWF0b21pY190cnlfY21weGNoZygmc3RvcHBpbmdfY3B1LCAmb2xkX2NwdSwgdGhpc19j
cHUpKQ0KICAgICAgICAgICAgICAgIHJldHVybjsNCiANCi0gICAgICAgLyogRm9yIGtleGVjLCBl
bnN1cmUgdGhhdCBvZmZsaW5lIENQVXMgYXJlIG91dCBvZiBNV0FJVCBhbmQgaW4gSExUICovDQot
ICAgICAgIGlmIChrZXhlY19pbl9wcm9ncmVzcykNCisgICAgICAgLyoNCisgICAgICAgICogRm9y
IGtleGVjLCBlbnN1cmUgdGhhdCBvZmZsaW5lIENQVXMgYXJlIG91dCBvZiBNV0FJVCBhbmQgaW4g
SExULg0KKyAgICAgICAgKiBBbHNvLCBURFggbmVlZHMgdG8gZmx1c2ggY2FjaGVzIHdoZW4gVERY
IGlzIGxvYWRlZCBmb3IgdGhlIGtleGVjDQorICAgICAgICAqIGNhc2UuIE1ha2Ugc3VyZSBzdG9w
X3RoaXNfY3B1KCkga25vd3MgdG8gZG8gdGhpcy4gT3RoZXJ3aXNlLCBza2lwDQorICAgICAgICAq
IGl0IGR1ZSB0byBub3QgaW5jcmVhc2UgdGhlIGNoYW5jZXMgb2YgdGhlIE5NSS1jcHVtYXNrIHJh
Y2UuDQorICAgICAgICAqLw0KKyAgICAgICBpZiAoa2V4ZWNfaW5fcHJvZ3Jlc3MpIHsNCiAgICAg
ICAgICAgICAgICBzbXBfa2lja19td2FpdF9wbGF5X2RlYWQoKTsNCiANCisgICAgICAgICAgICAg
ICBpZiAodGR4X2NoZWNrX2xvYWRfYW5kX2Jsb2NrKCkpDQorICAgICAgICAgICAgICAgICAgICAg
ICBjYWNoZV9zdGF0ZV9pbmNvaGVyZW50ID0gdHJ1ZTsNCisgICAgICAgfQ0KKw0KICAgICAgICAv
Kg0KICAgICAgICAgKiAxKSBTZW5kIGFuIElQSSBvbiB0aGUgcmVib290IHZlY3RvciB0byBhbGwg
b3RoZXIgQ1BVcy4NCiAgICAgICAgICoNCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni92aXJ0L3ZteC90
ZHgvdGR4LmMgYi9hcmNoL3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmMNCmluZGV4IGFmODc5OGJjNjJl
ZC4uNmNjYTg0N2U3YTljIDEwMDY0NA0KLS0tIGEvYXJjaC94ODYvdmlydC92bXgvdGR4L3RkeC5j
DQorKysgYi9hcmNoL3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmMNCkBAIC0xNDk3LDYgKzE0OTcsMTgg
QEAgY29uc3Qgc3RydWN0IHRkeF9zeXNfaW5mbyAqdGR4X2dldF9zeXNpbmZvKHZvaWQpDQogfQ0K
IEVYUE9SVF9TWU1CT0xfR1BMKHRkeF9nZXRfc3lzaW5mbyk7DQogDQorLyoNCisgKiBDYWxsaW5n
IHRoaXMgYmxvY2tzIFREWCBmcm9tIGV2ZXIgZ2V0dGluZyBsb2FkZWQsIG9ubHkgZm9yIHVzZQ0K
KyAqIGR1cmluZyBzaHV0ZG93bg0KKyAqLw0KK2Jvb2wgdGR4X2NoZWNrX2xvYWRfYW5kX2Jsb2Nr
KHZvaWQpDQorew0KKyAgICAgICBpZiAoIW11dGV4X3RyeWxvY2soJnRkeF9tb2R1bGVfbG9jaykp
DQorICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQorDQorICAgICAgIHJldHVybiB0ZHhfbW9k
dWxlX3N0YXR1cyAhPSBURFhfTU9EVUxFX1VOSU5JVElBTElaRUQ7DQorfQ0KKw0KIHUzMiB0ZHhf
Z2V0X25yX2d1ZXN0X2tleWlkcyh2b2lkKQ0KIHsNCiAgICAgICAgcmV0dXJuIHRkeF9ucl9ndWVz
dF9rZXlpZHM7DQoNCg0KDQpUaGlzIHdvdWxkIGxlYXZlIGl0IGFzIGtleGVjIHNob3VsZCBiZSBn
ZW5lcmFsbHkgZXhwZWN0ZWQgdG8gd29yayB3aGVuZXZlciBURFgNCmlzIGVuYWJsZWQsIGJ1dCB0
aGUgcmFjZSBpcyByZWR1Y2VkIHdoZW4gaXQncyBwb3NzaWJsZSB0byB0ZWxsIGl0J3Mgbm90IGVu
YWJsZWQuDQpJdCBwb2xsdXRlcyB0aGUgbGF5ZXJzIGEgYml0IHdpdGggYXNzdW1wdGlvbnMgb24g
aG93IHRoaW5ncyBhcmUgY2FsbGVkLiBCdXQgaXQncw0Kc29ydCBvZiBhbGlnbmVkIHdpdGggaG93
IGtleGVjX2luX3Byb2dyZXNzIGFscmVhZHkgd29ya3MgaW4gdGhhdCB3YXkuDQoNCk90aGVyd2lz
ZSwgbWF5YmUgd2UganVzdCBnbyB3aXRoIGFuIFNNRS1saWtlIGFwcHJvYWNoIHRoYXQgbGltaXRz
IHRoZSBXQklOVkQgdG8NCmNlcnRhaW4gc3lzdGVtcyBtb3JlIHN0YXRpY2FsbHkgKGkuZS4NCmJv
b3RfY3B1X2hhcyhYODZfRkVBVFVSRV9URFhfSE9TVF9QTEFURk9STSkpLiBUaGlzIHdhcyBwcmV0
dHkgbXVjaCB0aGUgb3JpZ2luYWwNCmFwcHJvYWNoIHdheSBiYWNrLiBJdCByZWR1Y2UgcmFjZSBl
eHBvc3VyZSB0b28gaW4gdGhlIHNjb3BlIG9mIGFsbCBrZXJuZWxzIG91dA0KdGhlcmUsIGFuZCBu
byBsYXllcmluZyB2aW9sYXRpb25zLg0KDQoNCg0K
