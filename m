Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433118132A;
	Mon,  5 May 2025 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464540; cv=fail; b=UeRaE2y6qG5bU3M/JyG5osPFT3wNrkEOOjHqs8DLQHSbwoFygg97tfpkDfIE4QcZN/tCjBeNHXSKZN1czYE5uMD9tUYjY4aS2clb7ChDh7yMDn+DTvyBC2avJT7rzw3mDCwSYcJt1gmpcg6VqeUcGSIomTNCXcSAfPSXWWbr2P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464540; c=relaxed/simple;
	bh=UCh2SxoqEs/ZzUA4OQRPgbs7Ci3EIpTAajFDHkXxIag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b2Mo5tT1knI8lSjyOyyHIO5eH+odhqaGmL18pK1xqMhv5HI1HuYAOTzYxFOBI1CISomPAdoTuggRO7A6x8X3exjNmQ4wC0QvLDi4uYSP7kPNeG1De8+e/QL8N2I++h8X/xw1YNVo2tSCNeeAnrYMh4X5Fu7T68pDvC+glB3EHdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOmSX8pD; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOmSX8pD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746464538; x=1778000538;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UCh2SxoqEs/ZzUA4OQRPgbs7Ci3EIpTAajFDHkXxIag=;
  b=hOmSX8pDgxpClnl5YcU91rUEu2vRdXKQoUsM4jXTX2wJZsuMJ8tsamMe
   DtOtuZO/3ENRhwSV1gDsA/ayMURjfUQkyCQux+bq1PJEawlxIf7yo+7og
   0PlhlPXxkj5GRLVNzs47UwJvA2fS0D5Q3o046m8HVBTFQnWSbGKX6+1pw
   EVcwPrBFxN4ZwvSz9X1jV121SPsj7kHG98pfm34uB7docwPex4nJVByQ9
   8luwivIj8gwmtYfT4EocM5yxSswMmRF/C7uZR9NuvDyFjty8b3YaWv1+i
   J1aLLdXY3HeJzbk+Hn1BLQr4PFFL7Lh9s2DwydCUJhNfHRM01nMESN8t9
   w==;
X-CSE-ConnectionGUID: favtHFwnTQaPoX2AUeMPGA==
X-CSE-MsgGUID: 5zpPxc34SOiVPG5uych08g==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47966436"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="47966436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:01:55 -0700
X-CSE-ConnectionGUID: Uk84cZNkRYydErewoTa2pA==
X-CSE-MsgGUID: LnR0SMVJQ3eU+G9dPTGKlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="140086291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:01:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 10:01:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 10:01:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 10:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVx1Gh5Mzt6XtH8EzEf80jbHR4Yr/LEvYnJDmxbwbazeS8zxMx1e6fK7qy3sPvot8C0EixXI2/pqNPs9hTNWlpJfhCrBSVi11yfd8PyM6DuV94LYRkLd08JLy8bZ8yt4T2Uy8wL1jLDiiIl61gQdesOV9U63D4zRhMGGpbomOoab9C55wddskw1wKa1oGWqyY4iPFVn5t1OBvvpuzd3YOY21/jH3mEbCTkMk7lRdGLZgZinbY1IHFb9Oel8pjUNachWDNlzgZEQ6mVJknwwI0xJ7pfQbIL8YA5GaZYlDoHTcrRF1xOGCWkcVqn12hp7EYDZS7h4zKlT0G/gOm/V0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCh2SxoqEs/ZzUA4OQRPgbs7Ci3EIpTAajFDHkXxIag=;
 b=lXQZ0zV9l+QB+XhWJ7GBgdzKF9aYHKVlAng6wtNTwa6HWprdOpXQR1zWgR7mv/liYTOgq10TGgEteeuDhssn27OYZnoLh/N7BhUDu7AlF2onV7vBzlyu6N9GJyULNUXVSHMRKPFTA+kMr8mJPz4oeAi3ZwG33WX+c4BqrFxU6+fXDHGDl7S1qOoermu6tixSMir69BH3/ZyrLmlybMZGQ9IbUWEzMUg8nGZfDARtBibQCvgsFrtl1U6/q70cSyEzHgQlElPrb7DANbmKLqOASM0nDea21KjDX1ytQ905mrG8NInzf9k/G3E7u3Be3U58xo3PosZ1quBUI4LtNOeX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 17:01:49 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 17:01:49 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, "Moger, Babu"
	<bmoger@amd.com>, Babu Moger <babu.moger@amd.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "seanjc@google.com" <seanjc@google.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "riel@surriel.com"
	<riel@surriel.com>, "Li, Xin3" <xin3.li@intel.com>, "xin@zytor.com"
	<xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>, "ak@linux.intel.com"
	<ak@linux.intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>, "Xiaojian.Du@amd.com"
	<Xiaojian.Du@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>
Subject: RE: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
Thread-Topic: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
Thread-Index: AQHbsw7vvZflVvaoFkmFfWarLaR9mbO/6gOAgAA7dYCABCgpAIAACBuw
Date: Mon, 5 May 2025 17:01:49 +0000
Message-ID: <SJ1PR11MB6083919B4628C4957D099667FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
In-Reply-To: <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CO1PR11MB5122:EE_
x-ms-office365-filtering-correlation-id: f300cb36-506b-454f-3be8-08dd8bf686a7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Qnp4QjZ6Wld6dXNudjFjVk5JRSswZFpqSFJvVlR3S09HYWFiK2Jhd0RITW5z?=
 =?utf-8?B?Ti84aW5VYWhySTRTQUhXR2lEck1MVG5Bd2RuWm1jRzVRSXZnRHhDOXRaUUhv?=
 =?utf-8?B?ODZpTEszSHI1eUplRG1iZEFmcXcwdWI0YWF6L21uMUhteTBnaUFPSlp2MlBu?=
 =?utf-8?B?N1UxT3k2SDc5QUN6eHNWR1dDM2tHbFlkemdvUG9IdVhUaVdzYzM1MjlNeWs5?=
 =?utf-8?B?SmFsUGxWb05uTGJFZ21SVzhmeUlpdEhKRENVdHE2ZllWbWVsaGRDN2FXRVFi?=
 =?utf-8?B?dmNiNUhMck9TSlIzOXBpdzNQWUlnWTZqelFDTG1ZT0pGRDVCUHFsdlJYUTQ5?=
 =?utf-8?B?UzRsUnRPT1doNGcvN0pYSTVEOFpUanBaamIxQitHMTJOYXMrSDZabklNY1Rx?=
 =?utf-8?B?a0FVcCtKUHRMZHFPNmRaQjlDTUs2NEtvRlRMenAreHMwS0ppRjVjMTVreHpO?=
 =?utf-8?B?TjF3RjRMUU9KZjRXVkVMeE9yTkFEc2lLQmI0L0RyKzZlUzlyREhPT2kwcGNY?=
 =?utf-8?B?STVmTHZtTUx6WWZEUE5Vb01WbjhDZVozVEJ5ZnRtZXpsSWFVZzUvNXF3RDgw?=
 =?utf-8?B?bUVva2J6K2w4cHQ5NkFlQ3dOTXdVRjIxL25RemF0dlBYOFg1TzJBQ2UyQnZ4?=
 =?utf-8?B?ZWNZaWNzNEFyVEk2UDRLSzlBQjFaclgyNVRJRjBFVDRqbGpVMUIzbjhzOVlN?=
 =?utf-8?B?enNReVBqbmZZUld2Y3o4Zm1nMU5QNExXYUlxeG8wZzRIY0F4ajdnb1lDYVp6?=
 =?utf-8?B?ai9OWkZiUzliVlNqc0t0OFZGNXdTWWUyVjRjVzF0OXRNY05NUituWldMdzRi?=
 =?utf-8?B?ZEljbytlTmtSSkNRREM1NkdmQUNZa3RHQkdPZm53bzdTNVlYNHVXdzV4K3Ns?=
 =?utf-8?B?aXBTWXA4cnpld2RmcDY4d3VROWh3N0xKU05WUThrVTR4N054bURoZS9kNUli?=
 =?utf-8?B?ME9qOThqbHFRZmhXY3hNMWM3UVhaN1FkVnNuQldKWEFMRVlyMlpLeHRya3Fz?=
 =?utf-8?B?aGpiU21KYlUwTTJacWNlRSt6cGhGRnhiMkhtYjNOd1FQdDF1TUc2UEhOamgy?=
 =?utf-8?B?Y0ZJaEJCOW0vMk9wZXlxdzJUdGEvM0NhQ0VOVkwrakNmdENLbUxaWFJOV1p2?=
 =?utf-8?B?ampKQU53aElSTlVuSWJMVmwwbktvZ0dkMGc0anBaOVcwTGwrOWtNRmtOUU96?=
 =?utf-8?B?QWk4YmVjYjNpd3MwK09jVWlxNlhKeU5IOWRIQ0Y3bitBOVRQaGh6bXBvb1BC?=
 =?utf-8?B?NGpJVlJqZjRqUzRXcW1mK0lrc1ZQbFdTaThnSzBKUmx5T3VuSjZtWnFDdzcx?=
 =?utf-8?B?T0FJMVE5RDJxNkdPZlZWVVk1VzFSWUhPUnlWTDBGVlpLTUdVN3pjZThpRGc3?=
 =?utf-8?B?Mjc2UWVmblRoY0hsdis5c1krVVg5UDlOYUJBOXNEdHcwRWFqdkxQZ3pCUjNG?=
 =?utf-8?B?eGtyODVORGFBSnNZbmNIZGIyeGtMdmdPZnEvdkdwd3J1c1h5ZHVwMkRhQmxi?=
 =?utf-8?B?dVJ0ZUdmK1BmMmFYemtBaHZCVzdqY3BZSWtLTEVkZUl2WFIzZSszaStmRHg0?=
 =?utf-8?B?WUFwRnZUOW90RGRnYXVOUE9ScllOZjJ6OXNqVTVoalVGWTVJZU55NkdMamlJ?=
 =?utf-8?B?eWdGYms4VnR0a1A4SERsM0lFMnpvRWdBK3J3eEpNdnl0WjZ2elhqMnJtalJp?=
 =?utf-8?B?WEZWcjI0V0VYWk9rR2JTKzlNVWJyYWpsdU1VMmhsbWlaTVVXTzJDT2Vyb1hF?=
 =?utf-8?B?SHpPbVBqc0hhYU53WFZRSUpsYXlVb0I2TGRFU0VFSFMyRSt1bG8vN1QxY0s4?=
 =?utf-8?B?WU9scWJBblVLVk4xUy80V2d4MCsvR0RmNFVhalhOUkNmTVQvSUc3d0pyUnlS?=
 =?utf-8?B?cER4dFZCRU9uN3J1cysrTXN0aHk1T2RRK3N1dGl1WUtXeFlIOTBNdHBPRjVz?=
 =?utf-8?B?TW9Mcm9vS2pScWxhZnN4T0IwMXRKWXIvbTFaN2g0OXB2cHJpWWRDOHI3czR0?=
 =?utf-8?Q?KvKFIWzyKWk3mY4pALA5X/3l0mmy6s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkZPWnN5bGJtMTRLSHVlalF0VWQ0ekpUZW9iL3FlTkFNOTlFOVNOT2pvRlVI?=
 =?utf-8?B?QVZnSWVzRndKR1ZVbEtKZ3NQL2RkSzRTaC8zdTd4RWRpNExhamlCWHZDcC81?=
 =?utf-8?B?cTIzd3c4a2VFN29zVnFTNjRleC9BR0IySjk1U1U0WHFGcUpGZStrZ0pGMVN5?=
 =?utf-8?B?SllYNEViRTZXL1RrNUJkM1dZd1VKZ1pqQS93amlHbEN1Y0pYYklkaWorbWVH?=
 =?utf-8?B?S2RNbnBUTFZpQktTR0lMeUNsZmFyalRGdW9GSmlmRU91MVJyaU94Skw1UUJq?=
 =?utf-8?B?U29hNXVIUzBQZ1ZuMnRyOGJIbGltWDRQbHBNWmhVcFRlQmhwWTA5aWRxc2RQ?=
 =?utf-8?B?UzNGQUlWdDByY0ZFWWNwc3c0YnJWRllBMjY2cXI5b3BORXVkSlBndE1ndHEr?=
 =?utf-8?B?NHVuVVBVVEtBaHRFRU1pVWJGM3VRMUVPK2J4dytMRjNPV0Q5alJxRU1BbVJ3?=
 =?utf-8?B?R1FyTmFscUh5WS94bGE5NklubDNKcGJzL3VxMHBZZy8rSW9QZ3hQd3hERENE?=
 =?utf-8?B?dmhubTJoNWZOVkt4dkV2bTdpRTVUUlIxQnpKWDNrQXByNU0zeXhTbVhKMGcv?=
 =?utf-8?B?WHZJOGFDYzN6VytXaUlxYmtHaHNLMVB6TzBHSE9KQ1I0NURBYXhGSzlUNEFk?=
 =?utf-8?B?aGRuSDVVN2taWjUzZlZ0UktCN2ZjSEM0SkpRenZRVlFxYnVxT0xHTVhvVTk4?=
 =?utf-8?B?N3Jyb0d0QU1BT0FtcE5yeU9rdkVaTDluSmJucXMycVpIeFBhOVN3Nmx6K1BI?=
 =?utf-8?B?TnAyb244VVd6bXVjQXhYTDlyN0Y5K2ZzZFVqMDFtQmZ6U0dvaENJeS9rdlNo?=
 =?utf-8?B?Q2RvRlFNWG4zNlVDRkVpMmRZMjZVSE4yT0d5b1Rqd2pTR0R2c1hNOXY1OUZD?=
 =?utf-8?B?eUlmblMxeFpRNmRzdHJYTzh4L09BQk9VR1p2cUh0QlljYjh4UXhEb2NNcUZV?=
 =?utf-8?B?NGlZTDNKQWZxS2VPejJqL2l0Wmw2UjVFdnFhZHZTZnRHeFJNTHQxK3V2K0VX?=
 =?utf-8?B?RE9nbFVkSGlld05NT2RkbFM0U3hWcEl4RElWMllFUG1KM04zT08venB2cHY1?=
 =?utf-8?B?OFc0TG9zRnU0WmYvOTZRclZYSWIxS3BkbHpmMHNSYjVRSHZhMEhoQXhhUyt0?=
 =?utf-8?B?SUg5MHJBY2hHWTV4MnVNQlgyeEFIL2tJbWZRSXM2VUJjYmoydWxteFB4cW9M?=
 =?utf-8?B?S3VBVHp4SUVoNXp3QkM3RFVFbGNRU1FrTmRLcmlNOXptSWFxSVp2UUE1TG8w?=
 =?utf-8?B?TS9ESlRzVXp6RkJqSnJ2bU5NTlloa3N4amR6MCtYQ0svVGJpbXQzdURzeDQr?=
 =?utf-8?B?dmNiQ1IreElPbkUvS3czelBVSWZhRkQzZDRodkFBRjRjWFd3MlVNWjdQY2p2?=
 =?utf-8?B?VkFub05McENOano3MlFscS9uM3c5NHRwYk4veFluSnVHcjNWR2M0Q3ExY0c1?=
 =?utf-8?B?b2RVVzBVM2hHbyswOWJwUk9IRlBPNDhnQWRId0VWTXRhcTVIUXlrZVN3bjh5?=
 =?utf-8?B?V0s3UjRmRElBUk5kV2xtLzVadFprbEsxK282YWdONTN6bDJad0FzUWFPeHI4?=
 =?utf-8?B?TERyb0lEeGF5U1FWdWlmK204Y09WendpR3dwK2hWTVZoQ2tjUW1LWXl6R0NU?=
 =?utf-8?B?RWpmc3JxMUFVNkxHamhabEZkR0JTZ3JQK1JnaHFjbHYvMGVzMXVCVkJVaHRz?=
 =?utf-8?B?TGVlSHBsaVFGbTZlYU9ibHV3NzJIcURJUnZQY3lYRDNVMXc0ZkExZFJObHZY?=
 =?utf-8?B?VDRDdVREWTJLUHk1c2l4YmYyOE0vd09JNVQ1N0JlREkvVHBSZWRWblJic0RN?=
 =?utf-8?B?Um0zYkZTR05tMGhOZzFhZ2grZnNuNGRzRHhSRFNNM0d2ZmVZazBWb2NLSDEz?=
 =?utf-8?B?dzJCV0tYU3ZvNHZrYXRRVkdiNVI5SmQ3MlUvV3d3KzJRb2dhT0Y0a05Ja1ZW?=
 =?utf-8?B?RTRKMzJnT0YzeVNhUlY2czk5L0ExY1pBOEIyU0dkVGlZT2htOEtVdXNnUmw3?=
 =?utf-8?B?eG05clBpc2RuU1JSYmJsRmc3S2ROc3lmQWwyck9ydzBpbk1wMWZmaW5DMlZp?=
 =?utf-8?B?VHAvS0s2bFROY2ZtTVZ6TnJHZjM5aC84TUFtZk9QdWpFSXlyeFNzSkNlNSto?=
 =?utf-8?Q?7gz/CdIhKdfuqGQBNd9F9pIBh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f300cb36-506b-454f-3be8-08dd8bf686a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 17:01:49.3512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nK70qmlL0tHmuRkJHUQ1PCnhakL3OuQ+AM7rnnvBfhRcLsXMP1h1keCppqP/cL7akZkgK/nEmxS1egWKyXZX3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
X-OriginatorOrg: intel.com

PiBUaGUgb25seSBhc3BlY3Qgb2YgImNsb3NpZHMiIHRoYXQgaGFzIGJlZW4gZXhwb3NlZCB0byB1
c2VyIHNwYWNlIHRodXMgZmFyDQo+IGlzIHRoZSAibnVtX2Nsb3NpZHMiIGFuZCBpbiB1c2VyIGRv
Y3VtZW50YXRpb24gYSBDTE9TaWQgaGFzIGJlZW4gbGlua2VkIHRvIHRoZQ0KPiBudW1iZXIgb2Yg
Y29udHJvbCBncm91cHMuIFRoYXQgaXMgdGhlIG9ubHkgY29uc3RyYWludCB3ZSBuZWVkIHRvIHRo
aW5rIGFib3V0DQo+IGhlcmUuIEkgaGF2ZSByZXBlYXRlZGx5IGFza2VkIGZvciBJTyBhbGxvYyBj
b25uZWN0aW9uIHdpdGggQ0xPU0lEcyB0byBub3QgYmUgZXhwb3NlZA0KPiB0byB1c2VyIHNwYWNl
ICh5ZXQgdXNlciBkb2N1bWVudGF0aW9uIGFuZCBtZXNzYWdlcyB0byB1c2VyIHNwYWNlIGtlZXBz
IGRvaW5nIHNvDQo+IGluIHRoaXMgc2VyaWVzKS4gU3VwcG9ydCBmb3IgSU8gYWxsb2MgaW4gdGhp
cyB3YXkgaXMgdW5pcXVlIHRvIEFNRC4gV2UgZG8gbm90IHdhbnQNCj4gcmVzY3RybCB0byBiZSBj
b25zdHJhaW5lZCBsaWtlIHRoaXMgaWYgYW5vdGhlciBhcmNoaXRlY3R1cmUgbmVlZHMgdG8gc3Vw
cG9ydA0KPiBzb21lIGZvcm0gb2YgSU8gYWxsb2MgYW5kIGRvZXMgc28gaW4gYSBkaWZmZXJlbnQg
d2F5Lg0KDQpUaGlzIGlzbid0IHVuaXF1ZSB0byBBTUQuIEludGVsIGFsc28gdGllcyBDTE9TaWQg
dG8gY29udHJvbCBmZWF0dXJlcyBhc3NvY2lhdGVkIHdpdGgNCkkvTyAobGlrZXdpc2Ugd2l0aCBS
TUlEcyBmb3IgbW9uaXRvcmluZykuDQoNClNlZSB0aGUgSW50ZWwgUkRUIGFyY2hpdGVjdHVyZSBz
cGVjaWZpY2F0aW9uWzFdIGNoYXB0ZXIgNC40Og0KDQoiIE5vbi1DUFUgYWdlbnQgUkRUIHVzZXMg
dGhlIFJNSUQgYW5kIENMT1MgdGFncyBpbiB0aGUgc2FtZSB3YXkgdGhhdCB0aGV5IGFyZSB1c2Vk
IGZvciBDUFUgYWdlbnRzLiINCg0KLVRvbnkNCg0KWzFdIGh0dHBzOi8vY2RyZHYyLmludGVsLmNv
bS92MS9kbC9nZXRDb250ZW50Lzc4OTU2Ng0K
