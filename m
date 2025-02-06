Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C21F416D;
	Thu,  6 Feb 2025 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857389; cv=fail; b=tK78x+hKs+gm6COsetMW4UAt/t0ej0PB9eAYi5SPCYwFMfyiP/IToE6vvTkjb8swA9VDUbGxf9gGAJ//tX0chE2bX4Hwt7EX/n9mygyn/2jkLQro+aQxtcr787HOrJWp3OjXwjxGCo4xn/Q7GWqWwul9pSS5f2RxV4jVD6GO0ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857389; c=relaxed/simple;
	bh=inj2ydbVV4buecs811lhsnNG1moR74FjF8YS2VilZCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DoA1LQQnpyKwyOxsrkr1UTkYUZiV+T1aWOpMyVi6mg37LIGnRyeYV+IiLxwZPbR3Sw+1K7W+urawa0cCJNchnyRuMveMSFTnyx/UF+DiO04Xw25rvlFBj0L0JA0wNcpvW3XSXL0ktoHO5Kf1FkbIBf7U7s9+0e9Y34wJCuUIXaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdD1UTV+; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdD1UTV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738857387; x=1770393387;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=inj2ydbVV4buecs811lhsnNG1moR74FjF8YS2VilZCQ=;
  b=hdD1UTV+kCtnis+5hqWcW44fUmEU/j9x7P/yOb5XeHlXEkcEwDV4NUB7
   7EeiZSe0iaLaR0UNVtAYb6q+7pG5kaFluRypZqMIQX58HhSZXiZRyVL8U
   tUAc3j/SO7R6isiaDXuTGs9jbE4LeR3ciQoRsQyyfKqsOsLhz0y8nE/FZ
   BwCzMiVXperB7cc0DZg/Fnx/jt07VCsJZnQqNVyARu0GREnPxCz/g4h4U
   hKURBBlNxYwQQ0CjSSmGs4/aEFiRSKrRvmcVq+SYASDPlS4Tuk7NfpGkq
   427mL7SHS1NzGo2EFZCqPIvTj/3EA2M1N/yQlb5+HFh4B7i2hSjMo2IgA
   g==;
X-CSE-ConnectionGUID: Lha6nT/LRMK3crjQBcJF0w==
X-CSE-MsgGUID: GNr7cRXxTX+hJ5NRmLJeVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43390118"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43390118"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:56:26 -0800
X-CSE-ConnectionGUID: EWtaAfL0QO2Hat8NbgA+EQ==
X-CSE-MsgGUID: xP/K2SjhSJq2dkqrJV7s+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111213769"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 07:56:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 07:56:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 07:56:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 07:56:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fS/gP0hxZ59Nt2/OLDclRDnK4xVX0FV8oOzO3wcpVejRZbUg1UgUEp48NVMUEORpwa0AjKp+MfKEbMEXojDLkysy8a4rixOWvXPFSaIhiWvHI5KTqvbdFnjFkd+0B4HQoiZsxxnk8vBIEpP01hVVrowmsTgQgUaNXovD8RhC23vtB6giYaMLpnmdpoydzvwYniR3o99pJuiDgZGe+Fqq4ZwmgQ0rswgxyrbYgDFd/w0dLNjzQl6alrronVPsWEhEfjwwhr9ynWNs7BYbVCz+GhovDVSG6CxR1Zuh5ldgQQ0OgmOF0FD8w2bsmPyoo3cRXsN2SM/yBWgMpQfOf9s8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inj2ydbVV4buecs811lhsnNG1moR74FjF8YS2VilZCQ=;
 b=xM2p4bCqx0SGF0C2HQZrPoEq5XMLyKBWaABtNIZ0wXA4aHRuzwiCn4Xxo98pO4rfLJts8U/e7QyO5p63tSOYv89YLDFJtKcpxhsG1hXacmezKqnTdnvf1SSgy5kbUkzKQPGxeTChwtg3uFab09e7E6lNX6F7w8wxtYrfiNdrqioGvuWQblT97SKR02/0Mz2jyij53zucAo54eiq9BUvtZIeDmj/GkzWxZNHRLfcYZU0+iO0ZtbgdMPfIM40JQ6BnMfsishqlceULleTuDqvDJ3zXXb+DmB+0K/gABhKlMjiOmnhRspTjYGmRwVXRUicUksdhbLA0mwMtgin6jb3cEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Thu, 6 Feb
 2025 15:56:22 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 15:56:21 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peternewman@google.com" <peternewman@google.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "xiongwei.song@windriver.com"
	<xiongwei.song@windriver.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "daniel.sneddon@linux.intel.com"
	<daniel.sneddon@linux.intel.com>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"sandipan.das@amd.com" <sandipan.das@amd.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"seanjc@google.com" <seanjc@google.com>, "Li, Xin3" <xin3.li@intel.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian,
 Stephane" <eranian@google.com>
Subject: RE: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
Thread-Topic: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
Thread-Index: AQHbbQtZd4aM1zJp90qUD7/fp7ZQNrM5eYAAgAAMguCAABB/gIAA7Prg
Date: Thu, 6 Feb 2025 15:56:21 +0000
Message-ID: <SJ1PR11MB6083C4FA95527464031D5379FCF62@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
 <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
 <SJ1PR11MB6083C234656AF934E41A7BA8FCF62@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <2a78f9a1-e03a-4e82-836b-26d3175d3f2b@intel.com>
In-Reply-To: <2a78f9a1-e03a-4e82-836b-26d3175d3f2b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB7122:EE_
x-ms-office365-filtering-correlation-id: e97474f8-9a77-4c2f-bf3d-08dd46c6cd24
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OThrRGdaN1cvUzkxVVoyVi9qaHdoRmhHWk9wczJ5L0dZbGNYMTh1VTMxdWpn?=
 =?utf-8?B?eXdxM2tpR0JVQ2FxK0pOcGtKT3hxNVZ0TkpheDBXaE8xWTIwZVlHemNIbXBu?=
 =?utf-8?B?WnJpTWJ5SmJYOVFOMm9ITUZqTFhNZ3NJOVM3OTVsNGZKNGpGN1c4WVYvNmF6?=
 =?utf-8?B?RkRFOUN1QVJEbXVVem12TnlRTHFHektNV095QkFROXlYYVBWb1FTaWdUdXQz?=
 =?utf-8?B?SGVra3BYcEtKVzIrbzNCVkFOZE54M3JOR2R4WkMwQ0FmUFNJVFRIMUFQZlRV?=
 =?utf-8?B?ZWRLeDNDd3diYXpQZW45aTJOcURnVDVlNG82VXAzR3Z5K2U1amFrN3pBNVE1?=
 =?utf-8?B?RUpiaURsN1ZnZWpuZXBjMEd4b2tiUDBIOVRnR3lNU1pRbGp3S0o5R2h0WmJO?=
 =?utf-8?B?Rm81V041VmE4KzFXeXU1ckJobjdNa3VtNnZrWUpnMFFVS3JHS2FycEl1NlFa?=
 =?utf-8?B?akdsOEorVytERVJVWW43RlQ5QVVMd3JBaEZvQm15S3FWY2lMOER5UGhieGwv?=
 =?utf-8?B?SUVyZGpJY0VGTzFYWG5pYUcyYnBuWVlSZWFyOTNvN0I3anZvQXpiUDR3ZXcy?=
 =?utf-8?B?My9ON3dxekNOZ0VlNmd1R2wxZDM2LzlFL1Ira05kVEo1ajI3akc2SU9WZERC?=
 =?utf-8?B?K1Q0Tyt3VzMwVGxMN2RGcXA1TnhRcHVQSFBreWhWU21KdlEwSXdFam05VkVR?=
 =?utf-8?B?YVdrZXVMOU1ydmkxL3lBZ3I1TEJIdy91ejRiVmdOVnY5c09WL3lOQXJLOHUw?=
 =?utf-8?B?M0RNc3BxazhyOGxsQ2VVOWErMEs5WURIck1iTlo2SHZoYWhIOUwySTZNWnM4?=
 =?utf-8?B?NFFWUWY4b0F4UGg3Wmt2QmpFelljRjdRUjZTd2NNNkNMdXQzV3pvVFM4WGtL?=
 =?utf-8?B?azF1TXVYWS9rczMxQ3R4ckFLOHBjWmdCM0k0dXJiRURrSXJUTk5yVjFubUhm?=
 =?utf-8?B?YUo0WVVkVENnem9XSThjUVNNbkVuV005SWJGNXFzOUc2NTdZalpweUU2aWFN?=
 =?utf-8?B?V3o0Vzg4Y0E3bzZHaitGOHF2OHNCTmtObXdnN2gxTDN2ZTJrdmFYWjBoakh3?=
 =?utf-8?B?NlptSVNCMzVhWE9kOG9JQ255TDNCc0ZFbTlUS1JPd2g3Vlc3YTV2VUgxQnpJ?=
 =?utf-8?B?YktObmxKRzdGNFRVSHlZUkF4Z0pXVDlhMmE3cGNETjh1VEx6YXFUWThMSWVx?=
 =?utf-8?B?cGV1K053Ni81NWlhMW1PUC93Ni9IMXp1TFlrWDZlRGgrOW5QdS8xa0NZNDRJ?=
 =?utf-8?B?WGtXRHRabGlBblZibVdjYVRZcnJna2hwalREM2orL0VDOVZ6eUl1WE94OFo2?=
 =?utf-8?B?RUdDaThTcUVQb3VCTXFmSnUvT2FpL1V3OWZRVHYwT3F2aUVtQ1VVUHozNUVj?=
 =?utf-8?B?RWZBWXlXSkJ3ODd0YlVTd0VhelN1b21jUTV3MmtFR2FDYXN4RW14Qzh0Wmt4?=
 =?utf-8?B?aXlMcmlZSEFrTGV6THRaOHpON2RscDRON2hDZmZ3WlV2TGt6ZUNpQi8wMzkv?=
 =?utf-8?B?bGJYZlRFcER6N0VZQWsxQ1cyTjBHVWpvNklsSE8zTjRpMThVMHlxc1NLdVRC?=
 =?utf-8?B?dDM3ZHlVYUUxM29Iek5HZTJ0SW1xMmpyem9Ldy90K3FJVktpbzBSa0JjUzBw?=
 =?utf-8?B?b0hJQ0E0UDdGdGxlS0ZyM3Z2aDFiYVBkaHA4Zjd5TmZVdFpHamtLbkN5MXp5?=
 =?utf-8?B?aUhaWEVCQkJoZ2VjZG05VVkwMnlFZVF5THRCSVp3aHJKdGtlTWw0c09yekhF?=
 =?utf-8?B?RFk5ZlpESlkybSs5Y3BHQ1k2T0lkRFdIZUJDNjBDTHlvRnJqckxjTTg0UnhN?=
 =?utf-8?B?YklML2F3dlpTenJlcm5YQTR6aXdYSTREOEMzMmQ2cWRDRm9OR1Z0WXd4YWYw?=
 =?utf-8?B?WS9mY3dPelNLL1Nvd05Ia0s5TCt3aHEyUUdacWRoUFQrTDJuU3NqcUxLcTlv?=
 =?utf-8?Q?HQLZ2H6NYhgVoADITjQlJOUFOJtNEeCg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlBzdTB1Nk93c3dTKzIwSXlLVzN4emQvbUg1d0NnN3F0UGpGVStydU5HWmtN?=
 =?utf-8?B?VlliYWlOOGhXWFZMMThNUWlGUWllSzRFbGdLOXlQVENDemptNnhTUjNkTU5v?=
 =?utf-8?B?ZUpKdUJOSWszU0hGU0NrWUYzdThrYng2VU80bzVaOWNXek5TUDFzK2Nlenhu?=
 =?utf-8?B?MXpZQ2IvUlh0OUEvcHFOOCtWelhUZ2JENkJjT3VraW8yUTV1RHhOVU8vQk5m?=
 =?utf-8?B?cG1wYUVDNnhvZlBSZ3oxOERBUXNVUlR2K01GTXREMXM1VC85UFVSbnVGT3NT?=
 =?utf-8?B?WUlhQjQvL2JaTjNwZks2N0MzTkpjUWdRN1NOeVIxUERvdWE4WWU4REFWVEFq?=
 =?utf-8?B?UUk0bTI1K1VKK0owa3laY1NVb2htbnNTOUdyVWE2SGgyRnEvZDVrNE9mRDlo?=
 =?utf-8?B?Q1A0NnhoZW1TbmhlcERMS0libHowcVNMcnEyMUtOelY4d0F0QTdLVk9NSWdP?=
 =?utf-8?B?enNxZ0h2aFNtaHpnSmJVbTRkdzVaR2NIanU1VTZUMkNsOHkrQ1NGbHo4TTlx?=
 =?utf-8?B?cTBxUkErVGNsM29VSGVHbGVCVEZ2TzVRR3UwQm9mMFJoc2JuaDEwMUhaTUkz?=
 =?utf-8?B?czVuMjVsZXRJRUhJQnY1UXhrSlZ4bEE5TXVKT1ZyUHVpOC9QcTA2UkZzOFA3?=
 =?utf-8?B?OTNxQjZhY2RlMmdXbG9uYTdDc2FFY1poV0RKZVU0czB3SDF1L1o5Z0RPOFh1?=
 =?utf-8?B?UlphY0RwKzF4MjJuN3pwK2VOejFsV3Mvb2N2Q0xiTWZTbjJGRTRkL3BEL3pQ?=
 =?utf-8?B?OU5TWXRWb2VJWCtuNGxBeWpMUHQrQnVVUjNsQjAxaVFOamR6b3NEbllxY3g2?=
 =?utf-8?B?ZHBvVnRzOGNNS21yOERJVSt3MGNiUG5zU01rRTZ2THk2V3lGMXFCUVNaVFVJ?=
 =?utf-8?B?T1BoL1RlWEt2UU5vQlVsQUJoMDdKaHcwc2U2aWQ0cHRnTC9wb09DV045Q2xD?=
 =?utf-8?B?aEVlNGx2RXdCelA5cUZPM25qSm8ySG9WS0VTc08vOVB5VzJVTVJpM2V5UUJH?=
 =?utf-8?B?SWZ1WnNFRzBhc0VyZ3VHMjJzenNkWTROeVNnOFdJOVQxaFhSMmNpNEM2YXhG?=
 =?utf-8?B?STVDRTMrM3dlRU1kaXJHUTdMQWtvQ1JpeEJDSnNaZm5tTkhYVG9ZRU8zWDRv?=
 =?utf-8?B?ODNjY3Uwa09BMFlsbFVidnpXQ3RueUlFdkdCNVo4NTJRNnVBc2xHeVpuOG1p?=
 =?utf-8?B?VnFpYXIwYVA5VlV3RTJwRG1BakhrdE83L3hodE8wRGFhQWFTN3pMTXlxd1pR?=
 =?utf-8?B?cEJFd3Zxbjl2ZXd3b2Q5d0xhTDk5YXFjR0JQdmZwU0tza0pGR1hBVi85OXhl?=
 =?utf-8?B?WTZjUi9FeTkzTjNhN0h3czJ1c21lU0I2QWYwSzZZcGZ0ZGFDU1FDeGV5M2FH?=
 =?utf-8?B?d000OWR2cm1WYzNyT2d4aVQ2ZXQ4emcyelBhSkN6NW1jM01EUUxtaXhzako5?=
 =?utf-8?B?bzJBL3FlNjRDVndPc21lNHRIRldHbVB2TGVBbEZKWm1MUmgxTXVDeVpkOUtV?=
 =?utf-8?B?a0p3NnYzVlpjSFY4Y2dwMlRrWUMyNWIzSDVtdjBQcC9BeUNEbVU4UGI2cDBl?=
 =?utf-8?B?c01wdWNxUnA3NmoraTlSc1pXSmt6cmVBMHAxMlRuRWIrMGF2Nzg2dVUxcld5?=
 =?utf-8?B?SlhCN2JFdVpzWXpyTW5WdXhIeEFRdU1Cak94Z1k3cVV6dlRRcnJOd3o1dUl4?=
 =?utf-8?B?d29KQXNqRkFVcTM0cndsNDlFdThDQ21uODNOR3FEZWUrODJ6U2RPUTJIRDE2?=
 =?utf-8?B?ZUtHYzFJZ21Xa0Nka0VvdDBzSFE3RU5UcDR4MUlBV05rTE9xaTJ6ODc3NStm?=
 =?utf-8?B?ajhxakZNUEVjVEMzNWxxWjJkTHVuMVFsTi8vWUNmV2lnTDdBRjZtTXJFWGdL?=
 =?utf-8?B?YkE5NWpkdDN4eXp0VitKVS9RVVUxQ3F5N3E2OUdwU2pxMHhpSDUwRWtRR1p3?=
 =?utf-8?B?aUh5N3NiUzY3SitvU3VWdTBBaC9kNXlaYTFjTjgrQXMvdktaQTg0eENya1F0?=
 =?utf-8?B?K3R3WUMrNlFFM3k4UkMxTHNhYmdKOUtoQXJJc0ZmTm1SaElTNkROU0xEN3dV?=
 =?utf-8?B?T0Z0SFMvcklwNFEwOXEwSVlxS2ZuaCt3TXFOZHhSWG9qVFE3OFBNSHJOWjBt?=
 =?utf-8?Q?RVPJi6t+n467srE04CubwDDy2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e97474f8-9a77-4c2f-bf3d-08dd46c6cd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 15:56:21.5307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCrETXseeZKy8AoC+DRYBE2qcrPG8fNT0J7EtoOn/iCiTdHX87ggql8OEYdUDSIGrvTjYFvxuDA+dLwRMAs83A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-OriginatorOrg: intel.com

PiA+PiBUaGlzIG5ldyBhcmNoIEFQSSBoYXMgc2hhcnAgY29ybmVycyBiZWNhdXNlIG9mIGFzeW1t
ZXRyeSBvZiB3aGVyZSByZXNjdHJsDQo+ID4+IHJ1bnMgdGhlIGFyY2ggZnVuY3Rpb24uIEkgZG8g
bm90IHRoaW5rIGl0IGlzIHJlcXVpcmVkIHRvIGNoYW5nZSB0aGlzIHNpbmNlIHdlDQo+ID4+IGNh
biBvbmx5IHNwZWN1bGF0ZSBhYm91dCBob3cgdGhpcyBtYXkgYmUgdXNlZCBpbiB0aGUgZnV0dXJl
IGJ1dCBJIGRvIHRoaW5rDQo+ID4+IGl0IHdpbGwgYmUgaGVscGZ1bCB0byBhZGQgY29tbWVudHMg
dGhhdCBoaWdobGlnaHQ6DQo+ID4+DQo+ID4+IHJlc2N0cmxfYXJjaF9tb25fZXZlbnRfY29uZmln
X2dldCgpIC0+ICBNYXkgcnVuIG9uIENQVSB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byBkb21haW4u
DQo+ID4+IHJlc2N0cmxfYXJjaF9tb25fZXZlbnRfY29uZmlnX3NldCgpIC0+ICBSdW5zIG9uIENQ
VSB0aGF0IGJlbG9uZ3MgdG8gZG9tYWluLg0KPiA+DQo+ID4gSGVyZSdzIGEgdmFndWUgZGF0YSBw
b2ludCBhYm91dCB0aGUgZnV0dXJlIHRvIGhlbHAgd2l0aCBzcGVjdWxhdGlvbi4NCj4gPg0KPiA+
IEkgaGF2ZSBzb21ldGhpbmcgY29taW5nIGFsb25nIHRoZSBwaXBlbGluZSB0aGF0IGFsc28gY2Fu
IHJ1biBvbiBhbnkgQ1BVLg0KPiA+DQo+ID4gSSBhbSBjb250ZW1wbGF0aW5nIGEgZmxhZyBpbiB0
aGUgcmR0X3Jlc291cmNlIHN0cnVjdHVyZSAoaW4gYXBwcm9wcmlhdGUgc3Vic3RydWN0dXJlDQo+
ID4gcmVzY3RybF9jYWNoZS9yZXNjdHJsX21lbWJ3KSB0byBpbmRpY2F0ZSAiZG9tYWluIiB2cy4g
ImFueSIgZm9yIG9wZXJhdGlvbnMuDQo+ID4NCj4gPiBXb3VsZCBzb21ldGhpbmcgbGlrZSB0aGF0
IGJlIHVzZWZ1bCBoZXJlPw0KPg0KPiBobW0gLi4uIEkgY2Fubm90IGVudmlzaW9uIGhvdyB0aGlz
IG1heSBsb29rLiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8NCj4NCj4gWW91IG1lbnRpb24g
ImEiIChzaW5ndWxhcikgZmxhZyBpbiByZHRfcmVzb3VyY2Ugd2hpbGUgdGhpcyBzY2VuYXJpbyBp
bnZvbHZlcw0KPiBkaWZmZXJlbnQgb3BzIGhhdmluZyBkaWZmZXJlbnQgc2NvcGUuIFRoaXMgbWFr
ZXMgbWUgdGhpbmsgdGhhdCB0aGlzIGZsYWcgbWF5DQo+IGhhdmUgdG8gYmUgcGVyIG9wZXJhdGlv
biB0aGF0IGluIHR1cm4gd291bGQgbmVlZCBhZGRpdGlvbmFsIGluZnJhc3RydWN0dXJlIHRvDQo+
IG1hbmFnZSBhbmQgdHJhY2sgb3BlcmF0aW9ucy4NCj4NCj4gVGhlc2UgImFyY2giIGZ1bmN0aW9u
cyBhcmUgZXZvbHZpbmcgYXMgdGhlIHdvcmsgdG8gc3VwcG9ydCBNUEFNIGlzIGRvbmUgYW5kDQo+
IHNvIGZhciBJIHRoaW5rIGl0IGhhcyBiZWVuIHF1aXRlIGFkLWhvYyB0byBqdXN0IHJlZmFjdG9y
IGFyY2ggc3BlY2lmaWMgY29kZQ0KPiBpbnRvICJhcmNoIiBoZWxwZXJzIGluc3RlYWQgb2Yga2Vl
cGluZyB0cmFjayBvZiB3aGljaCBzY29wZSB0aGV5IGFyZSBydW5uaW5nIGluLg0KPiBUaGlzIGN1
cnJlbnRseSByZXF1aXJlcyBhbnkgYXJjaCBpbXBsZW1lbnRpbmcgYW4gImFyY2giIGhlbHBlciB0
byBiZSB3ZWxsIGF3YXJlDQo+IG9mIGhvdyByZXNjdHJsIHdpbGwgY2FsbCBpdC4NCg0KUmVpbmV0
dGUsDQoNCkkgaGF2ZW4ndCBmbGVzaGVkIGl0IG91dCB5ZXQuIE9uZSBvcHRpb24gd291bGQgYmUg
dG8gaGF2ZSBhICJjaG9vc2VfY3B1X21hc2soKSINCmZ1bmN0aW9uIHRoYXQgdGFrZXMgcmVzb3Vy
Y2UgYW5kIGRvbWFpbiBwYXJhbWV0ZXJzIChhbmQgZ2l2ZW4geW91ciBjb21tZW50DQphYm91dCB0
aGlzIGNhc2UgYW4gb3BlcmF0aW9uIGNvZGUpLiBUaGVuIHVzZSB0aGF0IGFzIHRoZSBtYXNrIGlu
IGFuIHNtcF9jYWxsKigpLg0KDQpPcGVyYXRpb25zIHRoYXQgY2FuIHJ1biBhbnl3aGVyZSB3b3Vs
ZCByZXR1cm4gYSBtYXNrIHdpdGgganVzdCBiaXQgZm9yIHRoZQ0KY3VycmVudCBDUFUuIFRob3Nl
IHRpZWQgdG8gYSBkb21haW4sIGEgY29weSBvZiB0aGUgZG9tYWluIG1hc2suDQoNCi1Ub255DQo=
