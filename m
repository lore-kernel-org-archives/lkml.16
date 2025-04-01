Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9E1372
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469589; cv=fail; b=kJdaM1LPf8WREVT73K69L3hYK8ICbuRhA3gBuxx97ypP/vmppKihw1hDUc2bIJehYaXtaNxndvT/+a14ZoaoABlukCtGhKzX/YU8dR8egGOL3EH/mOAwT6SGR0wHhLslkxlF1U8B+1gqSIjJ/XJGPwlYVFCI810JHN0nqtbmH+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469589; c=relaxed/simple;
	bh=4rqstzX2087/2IM1CIAom/l2O7r+pRYDzLXeegQszyg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E3NMdNbFq79tq+zMEXLPU2w/qgt18OMojgZP4j8in8g3HB8hSkNncslUQKEd0Ruoy9jKdtC1Vx9v2OYj6rt6e/3zTrFynLJuVocv9A/9maZVAvLMCCiZBw/z+lZifzXNnCirvwr7vQ33r01u2skxMz80osaACZ+a2RbRN8ZWTPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJmF6NO6; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJmF6NO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743469587; x=1775005587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4rqstzX2087/2IM1CIAom/l2O7r+pRYDzLXeegQszyg=;
  b=KJmF6NO67qlgP24w1ms/YMOOtX66Tg3RRFHo7WR8posVUYjbc6Kq9VOH
   cllCDhi4Ls+uvWHYNCEMLMmqLhfFh15foC+pY/Qiy5oGLJQY03M3ajLkW
   tkU2vRxdKmMoq/+WM1d0jKKWoRc5CbSJscpmY/CWkF7LOXGV2i0t7M463
   i5/nvnEDUYIBYxHJR+snwtMwEF+rOeaCcYRmKzi1DjYP9NQYPA5VX9XLw
   oJqMARPQybcuMphIEPWty1oms5QAMsYQDtTPurr6dVNXBnK4UXAUQ2b4h
   uvVqTxCIU7bOy8/62Ro1W6UD9YtHbdfPFVCXSpcCjJ9fytd1ir+zjzgZW
   A==;
X-CSE-ConnectionGUID: 9TjJt3B5TSmRrYOyNu+NyA==
X-CSE-MsgGUID: pBr2jTAMRSqDKfHJmQDCAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48647536"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="48647536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:06:26 -0700
X-CSE-ConnectionGUID: 9mIGKS58SeCvwPL3QxxPWQ==
X-CSE-MsgGUID: rrqZ5sYdTIuqdqi8tWV6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="131234229"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:06:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 18:06:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 18:06:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 18:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvcMKksnZW8YvlFKGhSD2Cui4mD1OPik5a8PhmEL4ooB/cWGEddhEDaCfRXwaA5KGWUKQ4qgNhdGvXFoo5KaI0v1zcNV8IIMolM3UhWJ95YhSoaSUN3gxotxZHAIZ21inlok3jyz5ooa2pPNnJuYs7JMf8h3te3uLPSOZZXvZPy72jJwW1lvM687sJZ2iy/CEWnXp+K+jSpXiIBAODKtG3hCpgZS0GPjUhPgqKfza1Ba1GrRjXAHTvOIlQxmcbRHTyxjCWPo2+GkbwOD1g7/PHbK8SJYPO7IMI/9LeUXLnVG8VzAAMj6stxERv6qni0a6mjZvjPrze5YC1V60MUXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rqstzX2087/2IM1CIAom/l2O7r+pRYDzLXeegQszyg=;
 b=Sv9yHX4nG7WdyGCdQzqSP9daImjaYvqI+Lh3SIPsaAjFBv4JWvHwWVKL0n/px0xKkGQhwXxxGPl/QPbbZyXKc7au4vkGVvNkFiVu/iMeOtTRcSAxOeNjL1asMuEgh8zccImUSVk5InazRYU4tvvek1dO2zBKUr+IH2zEPHu9+xHRMlK9WHMpI3qdHmKOdc4dsK7UdawI9OCwq5QE0F1HlOAmq9KlVEqx0Stpjjq1KuEPXe4IE3qHdE1KwCvuubhcb2X3FmtlTdRGL3D11JJKQiRryNcEg0mv27gDsHbExykmaJJpnpk9KZ46IKGewHyY3tt3At+gOIrBwdAkSoajpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Tue, 1 Apr
 2025 01:06:23 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 01:06:23 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "mingo@redhat.com"
	<mingo@redhat.com>
CC: "x86@kernel.org" <x86@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "Luck, Tony"
	<tony.luck@intel.com>
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Topic: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Index: AQHbn3LZZapA7fAReUqsEyYm7m1m27ON3Z8AgAAB9wCAAAQ8AIAABGeAgAAdbwA=
Date: Tue, 1 Apr 2025 01:06:23 +0000
Message-ID: <dcd22645ee5e5fcbbdb03ead0c6c68e4c09923df.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-3-sohil.mehta@intel.com>
	 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
	 <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
	 <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
	 <d6f148e4-085d-4bd6-b0a8-394149d8aeef@intel.com>
In-Reply-To: <d6f148e4-085d-4bd6-b0a8-394149d8aeef@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH3PR11MB7202:EE_
x-ms-office365-filtering-correlation-id: 016f0897-fcde-47dd-1179-08dd70b96bc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TlpZNk9ZTU16NTNwZ2loQjYwalQ1U0Y0ekhlUlJYWW4reWg3YTlRb2Yva0F1?=
 =?utf-8?B?bS9zK3lLRnBRQWpvVXFuZWJjNnp3dENiSHBvdU14QkZYcWw0M2kwcG5KNmdL?=
 =?utf-8?B?d285OElnL2wvNlVXQks5dWxZV0ZVVTE2TTdNaFovbU1sVXZVM3ZMVG01ZjBq?=
 =?utf-8?B?N3JJNEwxakltRGxKL011b01kMm5oaE1wTDV1ZWxOR29IWlAvS1orNCtkK0Yx?=
 =?utf-8?B?ckJOS1J2UUdXUW4xZS9xT3JjTGw0bEFzZ0tDTXNLbk1rdnBBbEVvME1xM3Ux?=
 =?utf-8?B?TDd4bUduZUs1WFp1YmhYYThzVEhRWmZvcndwdUV0WUc0azcvZHlhaVVETHND?=
 =?utf-8?B?OVpZTmkvSTdFN29hWkpoYzlXTGlGZVFXVUpmRnkySjF4Z21UdjBDdUdpcWZw?=
 =?utf-8?B?Y25KODdsQVBLQnFFdVFxbTF2S1RJSXR4UTZ3cVMwT1g1M2lUWnp1eEt2MW9t?=
 =?utf-8?B?a2I1eENVTFIxTitCN2RDMlNlZVpPTUVQYjNxc2UwbjUyTFdPQ3ptMUYxWkYr?=
 =?utf-8?B?VGpGZzZJQngwMFdyYjJDQldNa2FBY21obFlPbkdIT1lwdWRpbmJGSlIzOCtT?=
 =?utf-8?B?T2dRZDRQTE0wcUlhTk40cWJUQ043VUxkd0xtZTEzY0RkVDlxSjNCWnBDVmps?=
 =?utf-8?B?UUVsRkNkNmZtTmU5blBiTnhsdVZsV0RBUlQ5dmwwc0N5ZHREeVQ0cFh6NmxP?=
 =?utf-8?B?YTRDMzgydUFaTE16enlhSExHNVdGWWhBWk1OSjdKTGQ1VjZiODdqZ1pWTzZz?=
 =?utf-8?B?V0E2aE03amxvTnl5NmxJcTE2clZpMzZNbXBLc2YyZ2MxcHMwZVJTK2pNcEFR?=
 =?utf-8?B?dVd1V3UyVUR0N2ZHNFRCQUIxQjFYaVF0SFBXNHg5WXFxZXpjRThySWFlbURT?=
 =?utf-8?B?OFFuRHpKejZKVzROeHd4cENCOTl0ZGRsS2ZZSGY5VC9HYnZXcDNnWUVjSGRy?=
 =?utf-8?B?aXVKZHgvbC9mUVhsb1g2U3hnellTWndlRGVlL1NJbGtaWGRPVUJ1WEFNZmF1?=
 =?utf-8?B?OGN2R0Q2UG40L290WVhHZTNrZi8xOTdGSXVucXBHcnBxVWt5SjZOcHVCVHVO?=
 =?utf-8?B?bGJab3AvYkRBdGszYVAzQ3V5YVcrVklxMVZPM3JqK3FTcmx5SjZ5aXo5eGRZ?=
 =?utf-8?B?Y2hWcXloaXFnUWVxQTY2TmVFZHo4T1FkNU1OcWgzTHhTMEFLUjBlMnVKWVRM?=
 =?utf-8?B?SDhoQzFBNXNiZ05WNlVHQis2YnAyUisvQ0RybG02NFpEVjNaUG50T1k1Tnlh?=
 =?utf-8?B?MWJUdjBCZ0JmVmlmQnVJRlh3d1prb0hXVVAyRGpyTm11U2xIT3FNMFIzZnZE?=
 =?utf-8?B?U1V4YTVFSFlpdWpWOVRaN2hpdE8yM0FsdXpZVGZuOGFvNGsyQkd5U2VWUGM5?=
 =?utf-8?B?ZmlFbzA5UUxRUllRNld5R2thK3kraXNUZmRBdHFIZjUvRGlab3JXZmpnWnJP?=
 =?utf-8?B?N3pwQVNmbjQyVGgzQk5ad1RRK29pQjhnSUJiRWJLamUvQzFlS0RTbGR0UURm?=
 =?utf-8?B?aWE5Uzl6YjFzZ0JKZHlWVDMzb1hiaHVMVmszSHFKUFJnWjdFd0lHekp0WkpF?=
 =?utf-8?B?Y29hL3dEWmFJWjBIUnJ5Uzg0YXRXRUpEOXE5RmE4VWpoN0R5YUNiMk9GU0or?=
 =?utf-8?B?d2R6TGRCdWtJS1RvNFhyZmsxRm00bnVNczgydHRxVlRVQVE4UTAxd3EzUEtp?=
 =?utf-8?B?SmNFSFYxc3o5U0ZhV0tVSmxac1J3bHpxKzd5WlR5T1l0M0JpZlVWTEJHVFRW?=
 =?utf-8?B?NjhBUktPcjJkR0ZuYytuRDlrWmNQYktaeEhmcnR5dEs5bFhzMEo3Wjc3ZXNq?=
 =?utf-8?B?aktDdVQwdERYYk1lNys1SjloM1FrcWpkSmFFdHBINnRGaWdPK2s1RVRQQjFR?=
 =?utf-8?B?b0JuMm9rUndYd2U5b3poQUdWNUpuVlMwREI0dGl1MHU1M3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1JZVkkwMDY3aG5vbVp0Ylp0Q0R3NisvRnRmNWRlbVUzVWtBa0ZFalZkRmt6?=
 =?utf-8?B?VFAxZVEwYzN1bm0vNWJ0NW9DZ1dlcWpEcEFOdC9LTlVPV2Yxd1BRRTZjaHU5?=
 =?utf-8?B?OEtKMXY5NTNlK0M4RS90VlVITGNlZjRqd255Q01hdGJCNlRLcHo2MnFCU0Fh?=
 =?utf-8?B?dWplM013M1hTOTlmYllYempSNUZDRTNMV21VeE1uMFlmeDJZYkVkT3duanlG?=
 =?utf-8?B?cy85TzRsM3NuS3B5Vnl5VDcvcXkzV0trL3dvYlhJSnN6aHEvci9VTm0xMStK?=
 =?utf-8?B?QmlqMlI4bUVuY3U5RVQzOEFJcHVDMXpWbEF0MnZNbmFCejE2aVFqcjVzdFRq?=
 =?utf-8?B?dE1lN0ROR2hYbWVjZnhSZkI3VFJaYUJDZzhFbjFTblFIczI1VGV0eTJERDA3?=
 =?utf-8?B?VlJ2V05Jekc4VlJaWGVNTVNBOVJFVElKQmpXWEZ6S3Izb0RKS2dldXJFZXZU?=
 =?utf-8?B?SkVzMW9aLy9GNFE0OGNZTWRLT1dwd211WVlxRlB4REdEQXpCdFVndGVScUhx?=
 =?utf-8?B?eWVVcEJuWWJ4ZisycEdHM2MxTXlmT3NGOHkxcXY0Y1FpT081KzNYVGFzN1dh?=
 =?utf-8?B?OVBLMCtVUTZsb2dmZ0g3QTl5NVl4UHV3enc0bzJ5YkF2WUh2N2g1aFE1MmtR?=
 =?utf-8?B?SmFpV2xxeXBJUE5mWlhWdjVjRC9sVW1ndTBTdW9QL3JndVVqRUtQOU8rNmFr?=
 =?utf-8?B?ZHBmamx3SElKUlYwdTkzcHJVbFRCQVR0bHExYU5nMjRScEZBYnVWNTA5N0hl?=
 =?utf-8?B?cXlVajFzczFiWVZDVEhRaUtTcXRDRkhqcFpiK3lXME91dWI4VXpsQ0VuNzM2?=
 =?utf-8?B?ekRiM2hkZ2FGTFl5RXgzVThXcDFYOGlDaEJBd1EwSW1WekVXVCtqbDl5MlBp?=
 =?utf-8?B?WjdhTzlXVDdvNzI4K1pFTnNPZTRPdGFwY2JVQlBlUzdhSSs2dFkrYnh2VXFR?=
 =?utf-8?B?R0wrQlQ0bTFhekdnT1J6SjFrNm83cHhUcVZnRlAxS216TEp6V1daSW1DNGZ1?=
 =?utf-8?B?NUxueisrVkpEdVkxMi90WjB0WDhWQnhBSlFVSE9xS2ZyOXp2NlpLNTIzWE01?=
 =?utf-8?B?NGkxVHVQY3piL3VnNUtNVVoxUWpJWGdDYTdDTk9RSDRmbmJxOTRGQ04zM0M2?=
 =?utf-8?B?RDFIdlZWdkxLVmV5R01JUSsyMmI0VXdoZnVvU0JYRU9aRTJ6WDIwL2I1cUli?=
 =?utf-8?B?OTRSV2RkOWFtTUwzTmp0eHdaTW8vVFc4cHpqb1ZKKzkwdy9xbWVhVGpWVm9L?=
 =?utf-8?B?cTZZaFpIZVBER3lGcDNJREx4c0ZYZUhBLzZkcE9oUzR2SHFIdDFIUXBOdlkw?=
 =?utf-8?B?QW82RFRqQm16UWFqUUh0RGx4NVJrckwyQVErMHI5dS9BT3VKKzZiaTIzWWRJ?=
 =?utf-8?B?SU1uWFNHbHpaMWpvMXFQM29NRHpSN29Md3h3ZzIySTk3RTNTZ2FsQTlWakdG?=
 =?utf-8?B?ZUxScXhNbFg4cDFhL0VOdVVPeExYaWhEeHoxL0JBZjJtek5TTTEwVFNPbXNI?=
 =?utf-8?B?VXhWTEJJODN2UTlQZkthdDU2alQyNUdiZ3k4RGNNd3ZQVjZrc2EvVERMKzlC?=
 =?utf-8?B?Z1kyL1RsQXlPV29NRzJrNFo5TCsyMUMyQ2NmVGxYUEZOMTNOYTFpWFVrM2h1?=
 =?utf-8?B?ZTRjWHZBK0xpL0hoTS9iYmhOWnM5SHlXRmhHLzNDc3BTek0zUVpWU3NVNW13?=
 =?utf-8?B?RFp1a2N1emlyNTk3WmNTSGJWTDg0YTZQaGhSRFZZTjhrcWF1UU90SitBWXF5?=
 =?utf-8?B?SDNJWmltaUZYQ3JEaVdSeFdnelpRdXRQN1lVWHRXN3FKc1VrK0hCK3dScmNH?=
 =?utf-8?B?dTJPWkxzeHh4WU00WExLSmNsRUtEY1dkeEFXWG12T3pnQXh2U0RoVTVmV0ha?=
 =?utf-8?B?bWp6T0hqQ2tYV1VxVzg2UXgrLzN2VTNybTQ3WmloYlJWdGo5bnJZSmR5cHdh?=
 =?utf-8?B?KzdSVHIzVHRGZjgrSmRra0t4NFNmMU04VUtSRVhkcHlhTHpQUDhoUGRvSzIr?=
 =?utf-8?B?MTF4cFZRbmxTN2MydkczazE0V2VBaDluY1NtdXNFTEV4bG9Xd3FzRC9BQ242?=
 =?utf-8?B?YU9OL1kwWUUyakZzcTVQZkJjM3lheDd2MXRsYXM0a3AvUFZuMURlOUhVNUVm?=
 =?utf-8?B?clRzK0prOUY0VlRXazNCa2l6RmdxaFltN2hEZGk1V2krVERzbkh4enplR1Fw?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4645BE8B0BAC7A4A90DC52472D22623B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016f0897-fcde-47dd-1179-08dd70b96bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:06:23.5302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LThgzvZErt3nXvaiDc0SKagsypI1xZZ1blVl7lu6k74kH/gkCt2UEp9Pzso5Xny8TLa/Qnxlxs9LB2sHOlPWGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDE2OjIwIC0wNzAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IE9uIDMvMzEvMjAyNSA0OjA1IFBNLCBIdWFuZywgS2FpIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAy
NS0wMy0zMSBhdCAxNTo1MCAtMDcwMCwgTWVodGEsIFNvaGlsIHdyb3RlOg0KPiA+ID4gT24gMy8z
MS8yMDI1IDM6NDMgUE0sIEh1YW5nLCBLYWkgd3JvdGU6DQo+ID4gPiA+IE9uIFRodSwgMjAyNS0w
My0yNyBhdCAyMzo0NiArMDAwMCwgTWVodGEsIFNvaGlsIHdyb3RlOg0KPiA+ID4gPiA+IENvbW1p
dCBmZWVhZjU1MTI5NDcgKCJ4ODY6IE1vdmUgc3lzY3RscyBpbnRvIGFyY2gveDg2IikNCj4gPiA+
ID4gDQo+ID4gPiA+IEFGQUlDVCB0aGUgY29tbWl0IGhhc2ggaXMgd3JvbmcuICBJdCBzaG91bGQg
YmUgYzMwNWE0ZTk4Mzc4Lg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gWWVzLCBzb3JyeSBhYm91
dCB0aGF0LiBJIGVuZGVkIHVwIHJlZmVyZW5jaW5nIGEgcHJlLW1lcmdlIGR1cGxpY2F0ZQ0KPiA+
ID4gY29tbWl0IGluIG15IHJlcG8uDQo+ID4gPiANCj4gPiA+IFRoYW5rZnVsbHksIEluZ28gZml4
ZWQgaXQgd2hlbiBoZSBhcHBsaWVkIHRoZSBwYXRjaDoNCj4gPiA+IGh0dHBzOi8vd2ViLmdpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdC9jb21taXQvP2g9
eDg2L25taSZpZD0xYTViMTVmNmI0ZDE4NTA3ZGMzYjI5NThjYTAxODc3Y2ZjODgwOGZkDQo+ID4g
PiANCj4gPiA+IA0KPiA+IA0KPiA+IEFoIEkgZGlkbid0IGtub3cgdGhpcyBzZXJpZXMgd2FzIG1l
cmdlZC4gIEkgdGhpbmsgSSdsbCBzdG9wIGxvb2tpbmcgYXQgaXQuICA6LSkNCj4gDQo+IFlvdXIg
cmV2aWV3IGNvbW1lbnRzIGhhdmUgYmVlbiB1c2VmdWwuIFBsZWFzZSBjb250aW51ZSByZXZpZXdp
bmcgaWYgeW91DQo+IGNhbi4gWW91IGZvdW5kIGFuIGlzc3VlIGluIHBhdGNoIDEgdGhhdCBib3Ro
IG9mIHVzIG1pc3NlZC4NCj4gDQoNCkkganVzdCBkaWQuICBJIGRpZG4ndCBmaW5kIGFueXRoaW5n
IGFwYXJ0IGZyb20gb25lIHRoaW5nIHRoYXQgSSBfdGhpbmtfIGl0IG1pZ2h0DQpiZSBoZWxwZnVs
IHRvIG1lbnRpb24gYW5vdGhlciBjb21taXQgaW4gdGhlIGNoYW5nZWxvZyBvZiBwYXRjaCA1ICJ4
ODYvbm1pOiBGaXgNCmNvbW1lbnQgaW4gdW5rbm93biBOTUkgaGFuZGxpbmciLg0KDQpUaGFua3Mu
DQo=
