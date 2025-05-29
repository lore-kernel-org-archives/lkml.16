Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC430202F6D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516838; cv=fail; b=Q8a/VwDMnx8YqsC2LUZg77umoXVX4Y6iz03JCb7ssAi3+zowwaK0/uygxsQw9t4byMYW06gSfs7qxsQTWLGxyakBX2a62ytRZzQqUKGGTbv/eLlaCytId9yXexfpMpnjObsejhTYI7u9XymzpUPycQq5pjBIlsl3B4YFczO9ap4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516838; c=relaxed/simple;
	bh=PbFNsNiwSVulkCFdgl/Ck3q87ZpFQnWkU1nfCwoUr6U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=osS14bedal+FEk4b+/WcuSSvG1UfSPmZRGpfBjDT8PcfqbFKuI1wWiJSDlwFOChF36FUqhEZE8kVqKMqkiy88dxuRwZc+maZSRjWrU5Nkj4VcZWq6mWSBcJAszRDCorMQxp5mKhmPKawJ8JlVV0tVZC9wPeyzo0Hetu+AXvvP2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR9S5SvV; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR9S5SvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516837; x=1780052837;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PbFNsNiwSVulkCFdgl/Ck3q87ZpFQnWkU1nfCwoUr6U=;
  b=KR9S5SvVPlDeqsIxuTcPRX06//5GQzVE6ubPAYBvsYESxWucmpmkIsEO
   /FAC57R1Juk5aXNgtR9qM+BRjch6+gx4hxtSRX6rSJBgD2GHfHe7UCUcS
   JtNartQldgrNdQ8eTJfAD3Rhdr3sDyJHp5TDjcYrURHEN7YoX6jsL9Cqn
   4NeR2QOaPnkHaLVCcdwht9op0UfaasBYPo0XR5fZsLrpGm8ydks3e3X4d
   j9i4WvX5fht8FIHsRs3GgZNPt7Em4BpWlc5Mhxn5K2TBJVzQIvR0hGRys
   HYiZjIMH+G0BiTutrWmw1Fu0D8ExVAjiXbfUeHcbo6jnAinEo8QTHuyrJ
   A==;
X-CSE-ConnectionGUID: BpOyyBQGReOkJSC8zZxX7A==
X-CSE-MsgGUID: MaJc9Q2cRD69EeM6XjIu0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68122027"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="68122027"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:07:15 -0700
X-CSE-ConnectionGUID: G4RO/Cj5R1euAM/fH/2gpg==
X-CSE-MsgGUID: SkMmdNwaTASaKsEs94a9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="144165395"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:07:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 04:07:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 04:07:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.75) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 04:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp4fHf0as/cHxhTObWJtXen9+ezJ7YcSagm/w3V8+3lN+ycs0IgSHweYVkio4rvx/xpDMg1UhrgRgbleNiFZE1EhEt151oeUuBxWn454QXsAkkqqA2pxFS659O7EgIgOEWJ5vPTfJ1iUaE/V+2IUvLUH6uaNRIH/bAWNVS19CRjbwbztmKmypwRUrwoNc+Cp3HexITlPa8MxOSrSgZI1b1tsW3EKmzAMtizEYLOXwogNg6zgELI5jUxH9wQAjatI2OMfQ9xtS4Ngp4KJoAXVdsW4GVIk8xBo6ge0zVYPpqSY5Yu63Y/yP/xAJVewqiN0byR2fDwtEGB4NvJLU97uWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbFNsNiwSVulkCFdgl/Ck3q87ZpFQnWkU1nfCwoUr6U=;
 b=rDtu5PoMj01tgd0ZgX+gxF4kJ4HH2G57DtPvzT2bSF7Q+UGzaE6uN2HVO3witsL6qqu83z8eMsAebuD75AQEWDX+HwdHuiCV1CKkKBDRDb0EMULB67YCKD78/aHfsTJTF3Fx+LmgMf5BX326qMxBQ/yieG+jTNTsZno3cJu+VUswHa5rrMGUFGxmOgA3vLruoujlJFhVpNqCxgDrtLKsr/P0WF9Xa85dt1MMzPY14LTnMxOkHPsx+/fpl0Bdjg1Vbo/XmcvZfI03v/hjn9q/IehGUuNjHZWxZTp/3KmjrwCFBGfnK/ryETMf1C5iUbqDEnRklbYxhDJn5L0QXITVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Thu, 29 May
 2025 11:06:59 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 11:06:58 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "peterz@infradead.org" <peterz@infradead.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	<seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Chatre,
 Reinette" <reinette.chatre@intel.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v2 0/5] TDX host: kexec/kdump support
Thread-Topic: [PATCH v2 0/5] TDX host: kexec/kdump support
Thread-Index: AQHbwZtbGZeoyLnlbkGa9srHpvt1sbPSFsWAgBd5l4A=
Date: Thu, 29 May 2025 11:06:58 +0000
Message-ID: <51372e65ed19baa251ab8a11266509fdf7f868b8.camel@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
	 <9a88386d-6610-9ff3-2a71-42961e7168f3@amd.com>
In-Reply-To: <9a88386d-6610-9ff3-2a71-42961e7168f3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.1 (3.56.1-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA1PR11MB8544:EE_
x-ms-office365-filtering-correlation-id: f1669ab5-45a3-4f92-8b2e-08dd9ea0ee73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MnJIU3d1S1k5cjJJUlJxS2sxdU56NWVyUDI4N013d1h2NkpUTE5EYmRMUWhq?=
 =?utf-8?B?RnFtY0ZibU5nUFlyWHYyMHNrTGFUdm1aRUFYTTBGVlRzYkZNUnNzL09CWkY1?=
 =?utf-8?B?cUVVNU5pMm9MK3NYaHJ4cGJZQjl4MG11NEx4dzgwNlpEM3N6MXBiVUNPejVC?=
 =?utf-8?B?aEhLbEN3VTdvclNVUUdHL1h0VjkvM0QyT3VObERtUXU2U28zSzZRZHNEUE9r?=
 =?utf-8?B?NWp4UXh2OXdZVnUxYWxZU3FIbXVibFlyemJpYkFZQVQxSVlsRGgza3l5b2hE?=
 =?utf-8?B?WE5SVzhPaWJHYUJnamk0d3RJL1VHaE1sRWtiY1NXT2gzZ0QxZW1IbEZubzNm?=
 =?utf-8?B?TUFRY1Q4bmgwN2ptWkxLS21KNC90S2VCd0dFQnRoNlpBcmNLZFN5QnFSQ0cw?=
 =?utf-8?B?MW9yS0VVVmV6bzl4cWs2S3pxYVlndmNaSkhzVnBKeE1lY2pBdkJDK2p3WVNP?=
 =?utf-8?B?THpEWVlUcUovTytFdnBjbDlleFE0dzZUK1F2b2xteUkvV012bmNCKzZWdk5T?=
 =?utf-8?B?eWVZc2hkUmR1WFFIMlU3cFBXMFRyRE5naklYdldYbThMb3pKc2ZWOHlFQ2hH?=
 =?utf-8?B?WWlPRStZR21JS1R4Wno3dGpET0J5WVRXR2xMN2M3U2dpT0tpYmRGdnQyemZT?=
 =?utf-8?B?cC8xVE5TTjhST0IxRWlCbklYMEdaWUkwditnaXdSa240eTZuNW9CTU1mdFhK?=
 =?utf-8?B?M1ZQUGh1N1JPcWlmR3ErMmZGL1AxVjR5U3ZkdElzdXBwSFUzaVBpb1Bab0J4?=
 =?utf-8?B?SVVCTXhZN0JwZFVnWnBIRENtRkFjdmlvbmQvYVVNTFJzMWdjd0tYd05nTGR5?=
 =?utf-8?B?aTkvWFFCMjVWWTN4N2tmMjNrUmh5aTFGTFRuTHJ0TytqNzdqMkRBdUF0OWVW?=
 =?utf-8?B?TEUvMitPZUg4YW5EQ2l1bXpTRktJRUxQbkZ1a3BZZFAyNTYrZFF5UXZKN0U2?=
 =?utf-8?B?SVpEUTI2cU85RXNhVUJvcUw2dTgyNldhMW5SLzB1TWF5d3VxSHNLdDgrd3F3?=
 =?utf-8?B?T3pheE5Demxxc0h3Snh1Rnd2bEM3OXZvenkyNGNHL2NXZjdqMzEySFZZdlE5?=
 =?utf-8?B?YUVoSVpLM3pka0IwWU9WMjFDK0pVOWo4cDJaMGpFMmpnNkNSOTRQdkNXRTJs?=
 =?utf-8?B?cFNCQlBzRVpLT2cvb0RxSEF0MWlLZ1N5cGhXYW41RXRaSytPZkl1a2FvMnVl?=
 =?utf-8?B?R1kwZDRLQ2VGR2xvZ2RGUS9pcHRNK3d2SE0zMUdTcnByWlhYRXNJbklxVFdI?=
 =?utf-8?B?VlF4ZWZiKy9SWEpEOTIrYlZjL2FIVzZVM1RiazBLelo1Ym9jMEFYYWk5eVNH?=
 =?utf-8?B?ZGJDT3ZaYmUwVGVuNmsvUzFUbmtOZE95ZERKVTB2Y3E2V21saE5uYjZuR0pE?=
 =?utf-8?B?cjhkNHZUdGZpcG51bXNXbXR1QnVvc2hXV0xJWUlyUDd1U3ZBOGlQK3oyUFJM?=
 =?utf-8?B?RjRFemRsYW1TRFZDRUdlWjMwa2VvUGV2QUtNbjJvTnNuTk5ESHR3Z2dzeDV5?=
 =?utf-8?B?MGtNVHd3c3FWQisrYlhuKzRqVUJqTi9CbER0NzUwVmg5bXlOYlFNKzVZaStJ?=
 =?utf-8?B?dCtXbHoybmhzVEJOMmVkanA1Q1hUQlIrdHZITGl3a3VqSXZLWGo3K0RxV0RL?=
 =?utf-8?B?ZHBXRGZUU2IvSkxpZTk0TUw5eHBQdXZsa2N6cWJWeVNEUUh1clNFMmg0Q2hC?=
 =?utf-8?B?S0ZyNDVXeW0zVzBLMDB3eVErWHZrOVRnWDJSYXUyQno3c0xiNlB2M09lU2xY?=
 =?utf-8?B?alBSci82T2tHZFdMTU9Fc1dlMXVYNDQ5dWtUK2xkckcvVVNPNTR6WkxURmlZ?=
 =?utf-8?B?Q2xlUHdhb0hCeitObFg5ZWh1dUM2WHpFQmVycUp2SWFyQWdEbUNyL0hmazds?=
 =?utf-8?B?bXNGRTBqYzR2UFRrUEVvbnllK1pCRTBlMkV6TmRmODBaU1RzMXd1UFduejll?=
 =?utf-8?B?bTJpbmpWOFFtL3lnbWRDYXpEQXJSdkxmaVE1Q3MwZFpYRUpzMHYyR3FseFB0?=
 =?utf-8?Q?E3HNUqnQ2N791q8Ss/ebHze9P7OH+0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlAwTDNuWGtXa1U5RSsvKzJReVROdzNUWTlqYThsajhEOWZ4K25qNlhSeG9m?=
 =?utf-8?B?U3JncjVNZlBReUZCRG5sQWJmTzRUMFpDNGZwTXdaNXJHL0Y1VnkrZDhoYkxN?=
 =?utf-8?B?QzFMVTlzcE8wOXdhY3ZYSzdEaDIrTThadzNOUnZHbEE2aXVnL3VYd0FhempP?=
 =?utf-8?B?b1lHSGEycjZ0VlQvdmNxTnV4Z3hxRFgvZ0lzNFpCeDhDRS80bDZ4akJaT0xn?=
 =?utf-8?B?U1lNMnRPZENQR3Y5bkpqMEQ2ZG8xclVxazcwdmtoTGpHN2k0cUR4YUt1aDM2?=
 =?utf-8?B?ZTE3Z1V0K0VpbnVLc00xclFBbytOdWNMWVI2Qy83YlRiV3JrT2ZTaityRmdC?=
 =?utf-8?B?K3FTRUJkS28vcmJObXhVa0tGMVFHSTdNWFk1RXdwSTJtTkQ4WkRqRTlDNTlB?=
 =?utf-8?B?QmNwVlVqS2ZOSENmMDhkVXB5RXl2L3RFcnFQTDVuK3VzWmxOc0hqeXhCd2Rn?=
 =?utf-8?B?OHNVcU12aXBrOXV0Q1dJOHB1L0ZuVkkzYzFhKzhweGVXVWplZStuRXp5TUt5?=
 =?utf-8?B?VjVWd0p1dmR4Q3V4QUYwcnNMVEhYUE1kV2cvWVN0MFY5ZlVOMjlWRlZxMUpm?=
 =?utf-8?B?UHU0OE1FVTMrcWdoTTJhKzhBMzFGVks2aVVZc0lqWnY3WmxhbG9yN0FkWXNj?=
 =?utf-8?B?cDlZVVAvNDNaeE9KTFJOLzBuWndvTGdrd3h1SWlhSXlWbGtuTk9lSFc0TEkv?=
 =?utf-8?B?QjhFRmlPU1c1aHRjQWZLS0hvblc4RWlPK01kMkFIMFd6aDdjRk5VOVdUeU0x?=
 =?utf-8?B?bUNuQ0dmbmZvQTF6RlllcE40TGljeFZ6YzhnemNoV3VnWWxqWlRVMmxSakVp?=
 =?utf-8?B?cFB1RDNML2JOWkwrdElMRmdnc1MzcVdPWXBmQVluZFJIL1MwYlFXaDV2aHVZ?=
 =?utf-8?B?YTRLNnF6UTd5NWJtTEM1NE5JVE0yWWhQa0RITEFGRjdZVFB0YXZiamZWWVcx?=
 =?utf-8?B?V1dpdnFndnh2VnVEczJiblV3cVJKQVQvQnVHOGRkdytBZmVxd0g0N1kwZGJZ?=
 =?utf-8?B?WWFrWWpPTnJLcHBlVldzdjBPRXF5RnBuczdMTDRsUDhvWTA1Zk1rNXQwemN0?=
 =?utf-8?B?NUNMQXJtc09xNDRhRTBzMDJNLzhpQmNCUEJkand1akNka0JvV0JRUmRhTWlC?=
 =?utf-8?B?amtCODNYZTRNUE5WUVYwYjV5UE5EeS9GVjNoTFViTG44WXdidFBYSUFpSmhV?=
 =?utf-8?B?SndQdFVTMXNpTUFKallyU3ZhelhMR2pTUzBzNElFRUloSmZ3RWZIcE82Nlkv?=
 =?utf-8?B?L1lFVFk4aGdWZEVJL1Bvc1pMSFdOTHdCZU84ZTl1WG5mejR3MUZPNk44L0JJ?=
 =?utf-8?B?Nm95Z3pLZk8vbm5oVldtVEg3NGl0ZytVcVhLUkdIeGRXWFFzSUdzQWVwb2VV?=
 =?utf-8?B?Uk90UHhQS2hQQXV2ZG1FUHRYckowOU5jVnBxVGF0elAvTzByMm5hRitSc0x6?=
 =?utf-8?B?ZGFVOStGVHJ5TzQ1S2FoekVMeEZtTDN5YVdIRVV4UHJDbW02T0E3WWpHOUp4?=
 =?utf-8?B?aXhtQ1JKYXM5cUN1T3k4TVlMMk51NFIwMmFlb015azduakQ1MHI0Y3IwNURl?=
 =?utf-8?B?dEV5RnVLRmVvdUJyc3cwUXJqK0hKNlJYUGZ4S1djckxtSG5VTWVDd1AxOXBJ?=
 =?utf-8?B?QTQ5a3g2b1A4VFBIRGwva1QxU0pjWk9MbDZwWjNpMmNyRUN2WEkxQlAvS3Bt?=
 =?utf-8?B?RDZmR2N4ZHV6YWxPQy9rS3lGK0FYUW1HamVoK2REeVdzYWwxUGR3UU5KNnY1?=
 =?utf-8?B?UWdMZ1E3OER3eDllb2MzbHViR0FQcFNkMUtjanY2YWtxU2pQRGhTcnNzSmlz?=
 =?utf-8?B?SmtFcE1LYkFYRVFjKzJnbUV3am1UVEN5MCtDMnNNNnRzTlhtMDdDOUVUVGJj?=
 =?utf-8?B?bCtmbUpSWXhIYzdPSWlJZU1xYWJVRmhNTzBaNkNtM1g2YzgzZXZJblFUU2R0?=
 =?utf-8?B?NDZPekNpVTJGRVQ1MzVwT2ZMaTBOb1ErKzZVNC9GclZXbnE3OXdvTFJFcUhH?=
 =?utf-8?B?c1ovcVp3Nm5XQUdhdk9YVnpkdTBXZ0pFc1VEV3A1dTQzNjVodTZ5QjVaVnRX?=
 =?utf-8?B?OEFvU0hPb3Y5NXpQdFpVZVBKaDg4S2VGQ1lxUDZTWXJFTG1GdC91ek1FdHAx?=
 =?utf-8?Q?YZON3AyfFZOhdrFh9hwciTqhh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A3FEA0AB6C9144D8EFBC598EC20394A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1669ab5-45a3-4f92-8b2e-08dd9ea0ee73
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 11:06:58.8438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /K/rErC7/sIzXvYVaEik06NeW4VJT0pNRuEj5NzWhFljDxCBvzfgUJB+f1tNwsM5hgKoG43oiZjUKn8/ElRDjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDA3OjM3IC0wNTAwLCBUb20gTGVuZGFja3kgd3JvdGU6DQo+
IE9uIDUvMTAvMjUgMDY6MjAsIEthaSBIdWFuZyB3cm90ZToNCj4gPiBIaSBEYXZlLA0KPiA+IA0K
PiA+IFRoaXMgc2VyaWVzIGlzIHRoZSBsYXRlc3QgYXR0ZW1wdCB0byBzdXBwb3J0IGtleGVjIG9u
IFREWCBob3N0IGZvbGxvd2luZw0KPiA+IHlvdXIgc3VnZ2VzdGlvbiB0byB1c2UgYSBwZXJjcHUg
Ym9vbGVhbiB0byBjb250cm9sIFdCSU5WRCBkdXJpbmcga2V4ZWMuDQo+ID4gSSBhcHByZWNpYXRl
IGlmIHlvdSBjYW4gaGVscCB0byByZXZpZXcuDQo+ID4gDQo+ID4gVGhlIGxhc3QgYXR0ZW1wdCB3
YXMgdG8gaGF2ZSBvbmUgcGF0Y2ggdG8gbWFrZSBURFggYW5kIGtleGVjIG11dHVhbGx5DQo+ID4g
ZXhjbHVzaXZlIGF0IHJ1bnRpbWUgd2hpbGUgYWxsb3dpbmcgdGhlbSB0byBiZSBib3RoIGVuYWJs
ZWQgaW4gS2NvbmZpZywNCj4gPiBidXQgaXQgdHVybnMgb3V0IHRvIGJlIG92ZXJraWxsLiAgRGF2
ZSBwcm9wb3NlZCBhbm90aGVyIG9wdGlvbiBvZiB1c2luZw0KPiA+IGEgcGVyY3B1IGJvb2xlYW4g
dG8gdHJhY2sgdGhlIG5lZWQgZm9yIGZsdXNoaW5nOg0KPiA+IA0KPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNTA0MTYyMzAyNTkuOTc5ODktMS1rYWkuaHVhbmdAaW50ZWwuY29t
Lw0KPiA+IA0KPiA+IE9uZSBhZHZhbnRhZ2Ugb2YgdGhlIHBlcmNwdSBib29sZWFuIGlzIGZvciBU
RFggd2UgY291bGQgZG8gb3B0aW1pemF0aW9uDQo+ID4gdG8gZG86DQo+ID4gDQo+ID4gCXdiaW52
ZCgpOw0KPiA+IAlwZXJjcHUoYm9vbGVhbikgPSAwOw0KPiA+IA0KPiA+IGZvciBhbGwgQ1BVcyBh
dCBlYXJseSBzdGFnZSB0byBhdm9pZCBoYXZpbmcgdG8gZG8gV0JJTlZEIGluDQo+ID4gc3RvcF90
aGlzX2NwdSgpIGF0IGtleGVjIHRpbWUuICBJIG1hZGUgYSBSRkMgcGF0Y2ggdG8gc2hvdyB0aGUg
aWRlYToNCj4gPiANCj4gPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvdGR4L2NvbW1pdC9kOWYw
MTIzYjFkNjNiYTI0ZjQ3MmRhNjk3MTE4MTkzOWNlNTNkMmUzDQo+ID4gDQo+ID4gSSdsbCBhbHNv
IHJlcGx5IHRoaXMgUkZDIHBhdGNoIHRvIHRoaXMgY292ZXJsZXR0ZXIgaW4gY2FzZSBhbnlvbmUg
d2FudHMNCj4gPiB0byBoYXZlIGEgZGlzY3Vzc2lvbi4gIE5ldmVydGhlbGVzcywgbXkgZXhjZXB0
aW9uIGlzIHRoaXMgc2VyaWVzIGNhbiBiZQ0KPiA+IG1lcmdlZCBmaXJzdCB3L28gdGhlIFJGQyBw
YXRjaC4gIFdlIGNhbiBmb2xsb3cgdXAgdGhlIG9wdGltaXphdGlvbnMNCj4gPiBsYXRlci4NCj4g
PiANCj4gPiBUaGlzIHNlcmllcyBpcyB0YWdnZWQgdjIsIHNpbmNlIGl0J3MgYSBjbG9zZXIgZm9s
bG93IG9uIHRvIHRoZSBSRkMNCj4gPiBwYXRjaHNldCwgd2hpY2ggd2FzIHBvc3RlZCBiZWZvcmUg
dGhlIHNpbmdsZSBwYXRjaDoNCj4gPiANCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
Y292ZXIuMTc0MTc3ODUzNy5naXQua2FpLmh1YW5nQGludGVsLmNvbS8NCj4gPiANCj4gPiBUaGlz
IHNlcmllcyBpcyBiYXNlZCBvbiB0b2RheSdzIHRpcC9tYXN0ZXIuDQo+IA0KPiBJJ20gb24gUFRP
IGZvciB0aGUgbmV4dCBmZXcgZGF5cywgc28gSSdsbCB0cnkgdG8gcmV2aWV3L3Rlc3QgdGhlIFNN
RQ0KPiByZWxhdGVkIGNoYW5nZXMgd2hlbiBJIHJldHVybi4NCj4gDQoNCkhpIFRvbSwNCg0KSSBo
b3BlIHlvdSBoYWQgYSBnb29kIHRpbWUgb2ZmPyA6LSkNCg0KSSBhcHByZWNpYXRlIGlmIHlvdSBj
YW4gaGVscCB0byByZXZpZXcvdGVzdC4gIFRoaXMgc2VyaWVzIGNhbiBzdGlsbCBiZSBhcHBsaWVk
DQpjbGVhbmx5IG9uIHRvZGF5J3MgdGlwL21hc3Rlci4gOi0pDQo=
