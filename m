Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F01E3DEB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460991; cv=fail; b=vFgpPCxgcIAxM8mpMHkfL3eUdRKYMSUr5yO7QKUGVM3h8qOqZOkVoiT7DX0Zz5rlFtKAbgykDRZH+LJsOyBTfdyX8Rnt8C35QhaDMacEllsWF/4G36QeCR+M5K1T6dWYUrDVE95BExVZF/Xwt9kJj000/CF624Dm4cM8bP/txxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460991; c=relaxed/simple;
	bh=mJlGhoYSUqdFMbP/d63UddnpKc7VhHCgmgzj1uhtHz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bx81ltyr+I/eauRvTw5DWeUFTyoLASoYP27Tql+xSXZvU09Irpz7TonJcsHd03idLjI/wKyEETz3mgKRch2RsEVH4mW46BT5GQGpc6u3Zy/jXWztJoQzBhkSk9ZwfbN8AnApzjrse4xlIaZiqbySPdyc6Z+cxIxdGWMVcNCyGfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HD3zTtQK; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HD3zTtQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743460991; x=1774996991;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mJlGhoYSUqdFMbP/d63UddnpKc7VhHCgmgzj1uhtHz4=;
  b=HD3zTtQKG1dADRa0Xkeyr62j782XTOS6etRNGqqBb5fypDXdnxznrMOV
   GLAg7EhlN42/ymmXnnImB/L1dgcTzOEEEnLsmAlDimXR0GOlV/XUaLior
   mJTwEymyTsxgERseTLvEmZGwhehTG6y06q+ji4K8srXWCok7sV7uvAYPw
   GiqaZuo810LgohXwePhg8m1poSBgvTa/ERRZamYyQUjmlZU6lk4cjeaEg
   89VsCUfgvT4BAfWEzy339R9OKYGKwdxp1qihbaLdkVIezK2GbQU1G2mAS
   M0BZP75/VHyjWaLNKCdpbVGaFNbdelM6fMU+MFdj84QuFwYAN/kdSQ3ee
   w==;
X-CSE-ConnectionGUID: 65Agc4wfQD25IebNTKfx/w==
X-CSE-MsgGUID: oNV1jdTaRHyW5JMAzHcHNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="70127663"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="70127663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:43:10 -0700
X-CSE-ConnectionGUID: sA0BLxzgSCWlAkNgV6qQHQ==
X-CSE-MsgGUID: djpNJo5STWaycJm6+nXCNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="125966264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 15:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 15:43:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 15:43:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 15:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUKvZUkxgCu0YRJxfKTFwH089gFrZl2Ib5cJjL7Br7mR9k5W60nM6FuJezgGVY3ZL1sYT7vPBwkV8bymzRT0+wbYpLpfAk5nPMICy00ZYrRED4Z+S3V5GwmMEVhpMkSjXHst98fcl85bd9teEvdc/9+N0KVdTHDq6+V24bMBt1p6q/Cxf/QnMnBnYyE5bSlIvgev876opLeuY2KWS1I+gfHrGnB7S+LaAovPL1dJUtQo1QZ8dYBL3Qtan6IOgRLcINP0Ic+iZNvnnDyCAtI+0t8Upn6Z2VTDvM0SKyT3GFNCuAsVAcTu9r+FCAlZ8RaZPpsW8OUpdn+4ooRKq1YSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJlGhoYSUqdFMbP/d63UddnpKc7VhHCgmgzj1uhtHz4=;
 b=IcT8cX9/oU41Fv4bhGfx6ywWVGWdMC+m8xk3GujZhXZmjyORri1w0BfSW7tPu1a3qAQZLVsZLElGNWF205tEhW15+FtWcSvERERJd/e8UWmbt8Cv6+QMw6AeNFRpvfsxcnNCg8/TV2iwTlukoH3cpwzcqGF/E9oUca50SkZAj0eal/K9qgjsJOGzmi1j5yTxcsEav69OFxh9qKPfq+0Wvqj5ahrU986WkeuamKVJq3WbVS5EneR4RxXbZvy7YV/qWRUiEopC8CKiVbH3XBY4pQXhtMaIPApJwuTIvx/Ps36FRIkoCKcWWA2WyqFouLE6NaT8zSHAuMXNVXEQ511bVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Mon, 31 Mar
 2025 22:43:06 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 22:43:06 +0000
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
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Topic: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Index: AQHbn3LZZapA7fAReUqsEyYm7m1m27ON3Z8A
Date: Mon, 31 Mar 2025 22:43:05 +0000
Message-ID: <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-3-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-3-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MN2PR11MB4613:EE_
x-ms-office365-filtering-correlation-id: 50f4430d-ef4a-45a6-2db4-08dd70a56732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M2pZcmdKcmNZSmMyOGJrTzdNdU91K3F1MXhNODFGQWRBVDRubStTVEsxck5v?=
 =?utf-8?B?eHduRnh0VXk5VEJmbDZFZEYycnZ1bUh0cWpRNE9VOEhta05NRTZqU0hZZWFq?=
 =?utf-8?B?WXFVb2ZoaVB6dkxzcGh2cTViSnQzR0pWL1ExOWxsdnE5dmZ3ald2OUIzS2lp?=
 =?utf-8?B?VUdod3FpM1QvNkp5THNyQjc2cmhXdGxJdldUVFpFNnBuRVdRMEM1VnNjVVVH?=
 =?utf-8?B?cE0xVkNoQmdET05NTElGNi9wL05yRG1BVTNGU085M2RSY0FHNnI1YUQ3ZElD?=
 =?utf-8?B?cWh6L2VBSW0zM1o2ZFpDUlRkT080WGUwMGFVYmo0QWxsZjRXalA5b2ozQzRw?=
 =?utf-8?B?U3JDNWViQUlycUtDU3ZaYnJTMk1uWGhxOUxtdW9zaUJJTjVZeFZjUkxIcjRG?=
 =?utf-8?B?QVpveE9qYTBJbXZZZGlYbk82UEUvVDg1R2dkNGhPNm14cTlRVjFZVGg4UmJ3?=
 =?utf-8?B?KzF3NUkyYnM5U2kzM2pvQy9Td0J4SVJxdTBoWjJ4ZkRNaW1tZWRjSmVvNC90?=
 =?utf-8?B?REExbGl6TXI3WGJYeTJJcmhDUE5rZlM4aVIvWkdXSG9rSndIWGRlVDNzMFRV?=
 =?utf-8?B?QitUVVJLOC9PU0dxTXhLNlU2L28rYVVMdjU4Rmt6OFMyRGY1bDhyZkZTcjJ5?=
 =?utf-8?B?RUZ5OW43UExyaStzUG41L0JLNjgvblV0cW5kSkxscWxaSnphSVI1V09ETHI5?=
 =?utf-8?B?MThzQ2N0Yy9yRTNpbGp4aEVlRUVYdkhTZjBzblpVZ1NoYldHd1l6MVNzbW9J?=
 =?utf-8?B?c2NBb09wMFl0ZUNLMWpIVStzei9BbmpCS1QrcExOQk1GQTFJZ2JnOEtGQ21M?=
 =?utf-8?B?WmhseXhBNmwrL0doSTBkdDljSWtEMGVySEE0aDlMMVQ2RERKdFp1RFEvQ0da?=
 =?utf-8?B?TmlyY25tVlAwTmVwTVUzTVJHa3NTUVBHSEx1bDJORUgwdHc3WFAzU3ZTVSs0?=
 =?utf-8?B?UFp6V1JJWStjdllpekh0Z0w0QkZFTUlpNnB5L1RaeGswemllVyttVU42ODVO?=
 =?utf-8?B?aElrSkFjMDNINlJFZWE4bmR6T0JSYU9hdjhMVG03WG03WEszd3RUb2VmbHZu?=
 =?utf-8?B?ZGhXcXlRZmpZdlZiL3pmRkJZTjJqTmdaUFlkeXN6Tmt1MTJKMzEwY1dydTlJ?=
 =?utf-8?B?M0UzUEhwNnk0a2RsL2REcjRrTVNoV2VLTlJLSWo2My9seFhSL0YxNXVWdk1V?=
 =?utf-8?B?dm56eVpFWnNtS0Mwb1F0cEdpS29sc0RiekhhNVRYUmhnTERRVkJSOFUrMUdW?=
 =?utf-8?B?UEpGNzlmUndLN1BaQ2lSQlM0NUh1a3lUVjN3UjYrb20zaDVIcjdlRlRISit4?=
 =?utf-8?B?RXJXZ0VBWjdzamJGamZqOE84eUsvZFFDZzlrbmg0M1VjWXNFbzQwVFowakQ0?=
 =?utf-8?B?NEZVNk41ZUV0QUlRQjZhUU90ZTJuTVY3U3VtNnh6MDVtVHV0YjVUWnhpQWgy?=
 =?utf-8?B?L0x6NDg2OHR6bGpseEtFK3BHcXRsU04wODVCUFVBMHZaZ0Z6MDV1WklpeVBn?=
 =?utf-8?B?UjhWWTFsbzhjWVhMRVdMTDcydGRVU2xKbVY3YVBSSi9ULzBPNUdGa0o2YStj?=
 =?utf-8?B?WmtaUldqcnlPMXlHTERsWGlmaFprck5URkkycVJMZ0lZTCtTbmVFQThwdlBT?=
 =?utf-8?B?NktpWjczZEh4OVVmamxhOE9oS0hRZTNlZVQ2WTdiVjJHSHo3UUlHSUhCdlhs?=
 =?utf-8?B?NXVLTmFiVTluREMrMW0vTlAyS2h0YTRqTkxwOGREeXlPNDNFQ1Bha3dWNWxY?=
 =?utf-8?B?UUJoT01pRjJ5Z0tBUm02U3BCUHJSTmtzdkJNbHhkWDlHRng5RFFLSkJGL3pa?=
 =?utf-8?B?YXQwMGM2blh6ZUdhVzFuOVhlbGVWem96cVVNb2pUN2Q2WFJUOVQ5akdRN0lB?=
 =?utf-8?B?ckFLZXYyM1RrVDczamtMblE2dWF4Qm41YzYybVFXcEU1MDBDMWtUVitIUHJ0?=
 =?utf-8?Q?lqT1iX5Jkhrtr9IgKBZaNy/PcoSbuofP?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEVvZUZnaU1aakV6MzdyMENOdG1JZFJrSUFxN0YxUFVva3FPZHhVTGxaR1BJ?=
 =?utf-8?B?TExpSUFDZzB1V1c0VHY1dTlFK3VGZGxQNnJhZHI4eVRmM1FWZmVMbzhIclRq?=
 =?utf-8?B?OFN4eHJWa3drdXpHbjhCbTJkRjNwTC9wSFRrT2xNVkRneWdQbjF5d05NUGZK?=
 =?utf-8?B?andSeE4vVWt4NzVwUlFHY1ZFSXBMR2NPTzVPN2RwUW5wYVM0K0EyOEVGU3k2?=
 =?utf-8?B?Mkc3cWlBNUR2YTlBV1hqaHY2QUZ5T1psMXZ5Tk5FRHZGWk5kT0FsMHhBN0Fu?=
 =?utf-8?B?ZmF5aFpHWG5ncVdHTW9KeUxJN0I5N21EVkIxNU51VVlzT0ZOQVlyeDRYZnFV?=
 =?utf-8?B?VFVENGs0cFdoTnJpY1JRT1FoeHpIWFRIRXNlTHd3MlFRS21lQ09EYVNKalZy?=
 =?utf-8?B?RUNmdWZoZldXNzAxQWE2RnI3YnRGZU5jOXptZnFUOUNsNjNkNWRGOU15Rlg3?=
 =?utf-8?B?NWRuZkNCU3FWdDNRaUIrMFd3LzdJSkg0WWFSbWsyeTlCVUdWeUR6UVZ6UVFr?=
 =?utf-8?B?OE1FNGtneGtYWXcwbVUxZW5BdFlXYUZlMmgvQ2ttdVhUemFMUG5zelEwMkJH?=
 =?utf-8?B?R0lFVzZtVTZyMmZ4S0lNY1YrNHlEMjNRNE5TRTk3QndYa0IvNVhBeW5ER0Fn?=
 =?utf-8?B?UWg0OWJaM0pVT1Z6Wk9ROG81YldEZDU3SDFHSDhROFhGSjVrQXpHcjc1cDd4?=
 =?utf-8?B?d3dHeU1oTXRiWmZ5TXRQYVdTTHp5TFN0S2FNK0VpeUhlMXdoVW1RalN1eERK?=
 =?utf-8?B?cDhYWnFBcFNEMXUwMDhidWpNYVRldVFTM1RHcUNrbmNOL2dnaHMzaC9nVkNT?=
 =?utf-8?B?bExwdDRiK0RnOGFYeFljVjkvNGZRM1lWaHRhSzFjc1hTTWJJQloraXZYQ3ow?=
 =?utf-8?B?NVhpalk1bHl5SmRCdlhPS0gyUE1yLzRvRzV3emdoSnE1eFQvQ1RWMy9iaGZB?=
 =?utf-8?B?RHh4Q1Z1ZCszejF5bmRXTUNkRnFVSGpmZjVCZG9Kb3AraFhtWmZFWHpYY1Zi?=
 =?utf-8?B?NkdrTHpFdUJIY3FlamVwOE5vNWdUNEhoaHF1RzFmOTZVZ0ZpNWZ0R2FSenhI?=
 =?utf-8?B?UHNCWFFONG9yMENTaEs4YUdXRmZtRUxGa1V4NmczRWprT01wdXhvTkhYbENq?=
 =?utf-8?B?WVFRc2VpakxaUE16cFJOYUVJMzV0SXcxU0I3a2ZQbEp6OXpuL0l2OU05RVd2?=
 =?utf-8?B?L1JRWjRnQ2N5QXA1TFdrZEgyUTlRSXVyNUJsR1RnZFB6ejcwcnNCQSs4ZXlw?=
 =?utf-8?B?MUpKZUVtMzEzcWJQKzFFaCswMXJQUVNWMTdNTXJBUkxIdE5Wb0l5aTdzRVIz?=
 =?utf-8?B?TGYwS1pwcEdTT0FZc0pyOVNQMURJaU01YXlFZElpV3IyQlQ2OFg5OFV4Z1do?=
 =?utf-8?B?eUlFaE1hWkY5SS9TSlBISnFTVVo1VzdiamJZd0VkUmRTNHZQblVzTVVNUmxZ?=
 =?utf-8?B?RHBNbEFmRHNYSWZwN041VlNUTWNtUzFlNG85MTVTWXVjVTk1dWd1dFVRaC9r?=
 =?utf-8?B?Ris5eDYvTXU5WG9oVStBWG5ZZlZwRThXOERHSngvRis1NFV4bFNNbWsweGhZ?=
 =?utf-8?B?UUdydTN5YTlaTDZ6UmFpSGtKUGNZTUgrbmZXYnRPZW9vdzROR3J1UGs4a01u?=
 =?utf-8?B?UXd5QkRVb3NSMGJlelVMbUtObDRXcVZzWG5aL20zQktuTmQremtObFNONlI0?=
 =?utf-8?B?THhEdVROUm5MTW9Lczl4VUhTTEwwWW94eDBuaGxzMzdkdTllQ3d1Ly9pY0J2?=
 =?utf-8?B?aktkZ2M1YWRlNmZIYWJjaU85UFR3NDU0YnpoWUtXRTZFVENHZlZjOFdMREMz?=
 =?utf-8?B?S0NmYS8wMlR3Uitwb2xzSkk4NVplb1RoWnhkc29BMVFKMU5vYWJmdEVycEhK?=
 =?utf-8?B?WFk2bWdCQ3RqakRmOXcrWmUyNUJveWJwZUI4NU43aFBHUlpLeDRSaTFOTEFH?=
 =?utf-8?B?UDJ3SzZBek1WNm1OMUtPaFU5MkRmOSs2Z0M2OTlqUFVJNzB6SXozeS9STDIv?=
 =?utf-8?B?VHBFYXVDcDc0Tm5sWVEwTk0rQXBSS0t4WXFlNWpiTk1OOWFMbXpzdDA4OUdz?=
 =?utf-8?B?UmJ2d3FyQ0ZKdWF2UStEQUhRekEvSUljZzdPcWdEWVNpUi91YlVwYXI0VTgr?=
 =?utf-8?Q?t14W07+nrnO/6s/4rfxiziYIW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C08354C0D396C4BBC6C102CC29DC6D7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f4430d-ef4a-45a6-2db4-08dd70a56732
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 22:43:05.9463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxDpRf79pPH8u++bBaZj1Ah9Isyq8HT89JiWycXoAlizpVC9C63wcZaQsVgwlTmSIZpUm2aUiblz63qHs3wRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IENvbW1pdCBmZWVhZjU1MTI5NDcgKCJ4ODY6IE1vdmUgc3lzY3RscyBpbnRvIGFyY2gveDg2IikN
Cg0KQUZBSUNUIHRoZSBjb21taXQgaGFzaCBpcyB3cm9uZy4gIEl0IHNob3VsZCBiZSBjMzA1YTRl
OTgzNzguDQoNCj4gcmVjZW50bHkgbW92ZWQgdGhlIHN5c2N0bCBoYW5kbGluZyBvZiBwYW5pY19v
bl91bnJlY292ZXJlZF9ubWkgYW5kDQo+IHBhbmljX29uX2lvX25taSB0byB4ODYtc3BlY2lmaWMg
Y29kZS4gVGhlc2UgdmFyaWFibGVzIG5vIGxvbmdlciBuZWVkIHRvDQo+IGJlIGRlY2xhcmVkIGlu
IHRoZSBnZW5lcmljIGhlYWRlciBmaWxlLg0KPiANCj4gUmVsb2NhdGUgdGhlIHZhcmlhYmxlIGRl
ZmluaXRpb25zIGFuZCBkZWNsYXJhdGlvbnMgY2xvc2VyIHRvIHdoZXJlIHRoZXkNCj4gYXJlIHVz
ZWQuIFRoaXMgbWFrZXMgYWxsIHRoZSBOTUkgcGFuaWMgb3B0aW9ucyBjb25zaXN0ZW50IGFuZCBl
YXNpZXIgdG8NCj4gdHJhY2suDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb2hpbCBNZWh0YSA8c29o
aWwubWVodGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdA
aW50ZWwuY29tPg0KDQo=
