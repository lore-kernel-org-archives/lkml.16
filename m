Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25E26FD8A;
	Mon,  5 May 2025 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466062; cv=fail; b=QllzfWpfjouChaTaxDC6WJJBKB5fldu3CC55Kc3eDgvqBCrODahkHHb8ps8RSTCFhY7UKMJgsYPGzjtjSoFUQ3uEIns+tIpHdAlkMBwUxjyrFO6lU08b678HUjD90n5WCsdhTeb6zH926hJHNbvIy57456ELVW+b4bucR+EF/e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466062; c=relaxed/simple;
	bh=dzzWMX8s+6MCPOCrKIFUUVM16gAkLeg/k3wgVkjHGjY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jTbhlRTz5pFusL0f9X7dxZP3BNP2//+HaXlqxvSWcACBhAa35xgXJH97zHfrkDyT+xeMeMw+vTA7l/bbUYYjSYWuB8JEdDt+TTWOiwv+fTO7wqtigMKxynOnZ5Lbq863lPgiQ4PEt1/Q+AbODz+BBXp1hn3OQYLNgx7EZwQwadk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJ87Yae3; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJ87Yae3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746466060; x=1778002060;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dzzWMX8s+6MCPOCrKIFUUVM16gAkLeg/k3wgVkjHGjY=;
  b=GJ87Yae3pfE1/AJz4V125JfdhDtCfAAGu20zvbsNAzsMv8KexuGAqOSR
   0ofprAff6BTFhnjPIr7keSZOMOg6jT8+rEeFjJU/x2JMT5n6+HcXx1lA3
   Sqf1UpfZU2KeWbGVk6iCk5/aPsXR+qufJqzD2KOBPeG/TnSC/IXauAJyv
   ELEK9QMnqLmvkm9he42JBVgCemOGiQFwoU594i8qHVpFFbxMLmD/E99JJ
   UkoVCgpqTehMbaPlieH4KwZL/SC3/sU0PpT126GIpgz984YjgFCJG4fsC
   XFn6JhQF/mvWlFSHmLY4pAV6VDRoh4gp7bfwP4FgrN/UVmcigM9U2y5Zb
   Q==;
X-CSE-ConnectionGUID: HFRp9AW2QkmtlNfrg7Ipuw==
X-CSE-MsgGUID: bXmRh6pMSj24xDic29arOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58719846"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="58719846"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:27:39 -0700
X-CSE-ConnectionGUID: 6qSz4KgORNuMGDMhzNpabw==
X-CSE-MsgGUID: tVY3WPIVRYa4IsCWAn7ofA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="135052351"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:27:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 10:27:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 10:27:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 10:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaGhvma1sniBp3IJAD7ngGbuXdrA43ilWYBPFBD4aMOfAZFpovSKOs12m+xwMPDrNIta22nTPeTPYeL2C6aM62+zboWPZTVLpQmzZSMBVwu/EUxD2BOH9O7bOSA6OBMRF4te+P2OIGanYhPMvRAHjvgWJwDKV9q4CO3qbQ5Q9GfOLPwBsvVdljPeJ2kb2HlyzxXPpwF9forJsL6r4Kb+haorBKezvjrQvngslkM0ZAqfXnNAh6iheSY3gZntwoZGNlqXxGKUZw+pkCJIu8Sf9NG9R9Z4VWdYzRP0VEKOFaqXClP1dAh3CFqqfl7W1udA7jw55ZULHe2qvxfUPvJULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzzWMX8s+6MCPOCrKIFUUVM16gAkLeg/k3wgVkjHGjY=;
 b=ftMUWRbJ8iP03pL5kHOuyPJ3CZ7xi+Y4b20yT3whg2C7vTI49jIVlVIsn6xhGsp9Mdl93YfATUjgPSLT3CLt/omJaowiNqbER6U9TwxGEAj/ixcxpbuc8ee54Ac/5lPht3xldkYBEXO6LkLaSgRMfbcYneOHDKHyYszx2Q6qnc5ZSVSG0Q6C1wLl2UeloUUN17Rn/Xm24fbZqhsoe/gN6+RMIHjDcwW6Fz1ymiy8LnQqIHmD49hfGC6mz9G1H+gU/+1zID7cMcRl5RIX2r+Gc91X4Qf8aL2obOY1XIx1BlwFyAWyinPmWX1QqRtWOxPveDR+x30uh+tqRnI/j6p8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ0PR11MB4909.namprd11.prod.outlook.com (2603:10b6:a03:2af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 17:27:07 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 17:27:07 +0000
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
Thread-Index: AQHbsw7vvZflVvaoFkmFfWarLaR9mbO/6gOAgAA7dYCABCgpAIAACBuwgAAGjgCAAAFrsA==
Date: Mon, 5 May 2025 17:27:07 +0000
Message-ID: <SJ1PR11MB60838694300279E4A0E4506EFC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
 <SJ1PR11MB6083919B4628C4957D099667FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <d84d7299-d0d3-4027-b256-f1e24d8423c9@intel.com>
In-Reply-To: <d84d7299-d0d3-4027-b256-f1e24d8423c9@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ0PR11MB4909:EE_
x-ms-office365-filtering-correlation-id: 7c8ea68a-7dc7-48f6-f604-08dd8bfa0f76
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UFhZYm9aNlhxM2RHODlKd2RVUGF0TTltSmxrSUU2UTdPMCsvcCtVWnpxZkdH?=
 =?utf-8?B?cEMzMVFDUzMrYVFhaEYzV1hIbUZxMGRvUlRySW4waTdVSWlCbVBPY0VXNGlh?=
 =?utf-8?B?dHNCRmkyd01xckVIeWxNYXEwTFFhZTRjekk0R1ZuV3R6anQyRVA2OWNuSnF3?=
 =?utf-8?B?Z0lCOGZsNkgrYWJxa0ZUV1gyekYyaVlrQTRoRFE1amM5VHhqS1FTcGJuL0lo?=
 =?utf-8?B?RVVDTmJxMm5PZ09vdTRESkRxTWg3U3lhMVFXbmZZL1QzbytNU3d1dWIzbGVD?=
 =?utf-8?B?T05zWXZDckE1RlBVOU9VWGFzTkhtQngzTFNScmZhNWVDSHUxVmlhNGY4S2Zk?=
 =?utf-8?B?TS9rUExiR0pnWHNac1BWZWJSczREZmcxSFF2aEtjMGhzWVM0citLdVk3OEhm?=
 =?utf-8?B?QTVtcktlcVhVeSsxQ240eXpzMmxsZnZIdWVtUmJiNlFlc294VEZIQXdpeFc0?=
 =?utf-8?B?R1dNNDZvWkJUV0YxajcxQ2p5SDhaV2xxNWcyWFZyQW1ydE1iYmN6VS9yQURX?=
 =?utf-8?B?VVc3a256dFBTTEZ3WVMwblpCU0U5dHhrSGd2U0l6UXdoYXZJcGJ0cXYzZXgz?=
 =?utf-8?B?WldqMjBxVzVET3JoQ1h4c1JyUjVCL0tyV1RTRXN0aTlYMkdKTlpVSGJnVVJQ?=
 =?utf-8?B?Tm5yUVFyNSt4aHd1dVZtYTNtTENveWFHYndtZlN5VVRqWDVwTCsvSjgyYTBI?=
 =?utf-8?B?V2IwUFJMOHB5dXArQXRtU2lRQmtGTXlLVXlCS1RVQmN6MXRyaFcxOGJPQ2s3?=
 =?utf-8?B?UUVLUEVoWEQxY1hsclI3Y2J4eUhRQ0p5QnpKNXZBYlRwVXBzZGJ5SEQwejdE?=
 =?utf-8?B?Y3FaeXZLU1FkSzBPa242ejIxeXg3ZWV0Y0JvK0pYdE5hMUNwTUd0YUlCV081?=
 =?utf-8?B?OEJxNnZnZkpkRXA3Y0VpVVY5UnRoM1RZTUF5MGgvNVBtLytOSnE3T2s0UkdC?=
 =?utf-8?B?YVpHanFjdVZvK043T1d5RFNLeFgxZGpCOVJwZUduK09vVEEwRHZBeUdWVUNM?=
 =?utf-8?B?eWVsckhUMzZ1bTBkcnNJRVUwdFVkUitsZUdwZmREVms2NEs4SklHbktEU0NR?=
 =?utf-8?B?Y2JyaUJXZERyVWtFQUFQYVJTLzRqU1lSUXpwWkxwOGhwbmNTMUNraS82UjJy?=
 =?utf-8?B?a2xGcjRzN04yMC9aTFNJOG1sTERRdlh6eFZJR1NYckNuSEVaMFB3VUdLVkdO?=
 =?utf-8?B?TExyZkFzSzBuRjhObDNSVjFib2oyQ1Nzc1o3K2xlVTF2MXVVOTlMc1o4MVIv?=
 =?utf-8?B?dmQ1cy9uOTNHZVE1L2xJOHlLN3o3blFxcHg4OUo1dkhod0R4OG9PbTAxRHdw?=
 =?utf-8?B?aXJ0WHN2eSsrbm5LRndFSFNhMG43cUpnNUpSRjE3ZEZsR0JTcFNwNnZpbFhq?=
 =?utf-8?B?YkFvTldpbG43VVArTmVVUFVuSTViSFVJUDdNeTBVOURDS0Q0cmE0Mk56cEJq?=
 =?utf-8?B?bTJXY2gzYm9iZENpeVB2RmRtYXlHb0cvM05MdHFwN2h4OHRTQVAxcjZFVFJv?=
 =?utf-8?B?OGMyeWtqdFZGalVCZHdBNktkNUVyak4rdExuNWhRYjlDQURNMjluYk5kSU1Q?=
 =?utf-8?B?dHI5bU0weTdiaG5HWWNoK1d1RHA3Y3BBTnA1UGw3RDNWNC9BNExoZUVyRXJ5?=
 =?utf-8?B?d0xxeEU5eFk5VVIrN0V4RUs2N0szd0J3TXpkSjhJTzA1aGNTc3hTdGx0NjJY?=
 =?utf-8?B?b2xGL3lQK2twNXgra2w2ZnhlOThrdWo1L2VLNWVmdXh5WnorNFg4YzFpa0FP?=
 =?utf-8?B?UU5uYmhXOEx6eTZoZURKMHY5dVNTUjc1REJraXhDQlRJNkJ2YXovZ1QvblIv?=
 =?utf-8?B?d3E2WlUzR2hZQ1hTNk82TmJCUjNuTm1xb1BFTlB6WXFxb1RyZnI3c2pRVGc1?=
 =?utf-8?B?eTRWd09MS1JJbEVHQ2twSzArNzIzb2srTUwzUnBzMU5kNnhjaWZLbmZuanEw?=
 =?utf-8?B?aXdPWjN2VnAyWllEZ21adTdDTHhBNGVnTGg0VDJnU1pKVmY2dFYrRW1FSEdL?=
 =?utf-8?B?SE1PaEc0TlBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODFnMTVPQjRITndEc0JHd0ovTDZ2WHNBUC9ORTV6c3YxR1FGREZGMVE0ZGhz?=
 =?utf-8?B?Nld4MU1pVHM0VTNRR3ZkbHZ3cDhvb2pYdHB3KzVxMXJpYllYb2xxU05pT3VM?=
 =?utf-8?B?ZFJJazJyRVpvVDR2cWRnOHV3S1QwRHVSbFE4SEZ3aFdsaFM1S0QzSUI3Ynlr?=
 =?utf-8?B?SXE1dVI1M29LSHV5Y0pjSlNiWURyZzlkUkxyZ0dOdTNpZXltYU9PQTZuSEM5?=
 =?utf-8?B?WUtxVi9pVElvVHVldEw2MDVTdUsxSElEZUhPNkZ1alEyYmN2Y21yUEFmWncr?=
 =?utf-8?B?U2hWN0xVSUpqWXVLSnpKaWFyZk1wNXI2a1drK0tzUTE3VzZac0lDWTlMMVpa?=
 =?utf-8?B?alBDdnAxNldidUxCUVpQaWdYRC8zZlhKR2dGMHVWeU5STnRTc3pTUEp1MlBE?=
 =?utf-8?B?YXBOSHBBdkF6TmhxelBVMFdXMm1FRGpzdUNYMlVyVkloUW54VUJYelE3SDFm?=
 =?utf-8?B?MC9vMlI1d2g0eXpCNHhxaGl6UHZNRjJOUWlaaXdmREYzZ242dFJSOUt2SzVN?=
 =?utf-8?B?b1NyUEtXdzVDZDJ2UVd2MzBkUGFrL1VzSk1vTHR3Yjg5UkxkdUJGU0prNlVD?=
 =?utf-8?B?eGo4UVp0RG1NZ3JyR3ZTM2xOMERxeXdNMml6QURwWlJ3OTlUSStzelZuY1BW?=
 =?utf-8?B?TzZVZmlJNllXVUhQaUF1MTkxRGx6amlSdytXTkREMmtnYTF6a3lXT3hJanI2?=
 =?utf-8?B?NGN1azhFYUkvMHIyOHlaYzlpKy94UUt2ZFRSeVVXT2c2clVveDF5Y1VwVlB0?=
 =?utf-8?B?R1FTczJXQmI4STRCbmlQeDc1SDNGZm9wbFVQMzdLZXBwbXFYb2ZHNkd4OUZE?=
 =?utf-8?B?V0w2QlRLbU5kM2JWMG50ZWJJUHhWY2V5VHRrT2hUM1h0dzYraUVmQ2RVdXA1?=
 =?utf-8?B?OE1EV3ZpVG1pejhGWG50WGFnKzcrNlRVV05wMHVPK01IQzBoU2JrVTJiVkg0?=
 =?utf-8?B?ZVhMMVZycXREQ0ZaVVllcVN2MUpEVlNweWdQVTc2Q2ZaN25qUS9LdVZLeEEw?=
 =?utf-8?B?V2ZGTzZKZVEvZVZsYnJseVZMenY1OXpLR3QyMHAzQjcwM21hWkdSREMxWkQz?=
 =?utf-8?B?WTZ5SGhocXhiOVJ4ZUp0MFlnUTJWbTdzTTlzKzlBZ3liOEJzWkxZeWZyeWRN?=
 =?utf-8?B?VUZUbDhBWkFDOXNJNGw0THpUYmh2Sm9sR0FlcGFpalJYemt6dHRDRnBTeXJB?=
 =?utf-8?B?eG9HSlhzQnBlZDNCM05RQTJQbGZJVmxxRE9pMm5BbTlMRjBpQy9CUTJ2ZVNu?=
 =?utf-8?B?YVRnalZ6aXl0RU5qdHBTSGdaT21LeUJCSENybzlvRkhtMEdBTFFEVWNoZHdr?=
 =?utf-8?B?TkhwM1dWbElKT3ZJN1JRWlE4dGk0QThLck1RQUxaU0svU2FjcUJtOGIzNGFM?=
 =?utf-8?B?NDgrd1lteG9zVCt0bU1sU05HejdBYkY4Vkl3Qi85UCtDRHJyNkNpWngzcVph?=
 =?utf-8?B?ajFiOUx6R0tjNFZiREJjSEtjRnRVUWZ4S2oyUjN1bFNnUWR5MFgyYnNHUE1P?=
 =?utf-8?B?Yjh6TDhSZFFtajhHM3FPZlBmb3NBaU5iL2RsSSt1aXYxRTBEbjhpVU45R1Rq?=
 =?utf-8?B?azAxTm1RSjV2YUVwTlVRSVV1TTNDcWRQMDFyMngvaG02d0tHUXdxbGp3R2xJ?=
 =?utf-8?B?dldFRmNhNlM5WHlic1gxVEJvbmVIUERFcDhqV2RrOTNucHZOMThVNUR6dzFs?=
 =?utf-8?B?NUt6bnpES3ZVL2NSNXJOcmVzL2s2Mkc2dkMvVlNkWEFVMDY2TTNjaWMyTWFj?=
 =?utf-8?B?MHh0bWgvMi82cXIvZE0rTzlwTDZRYmFiWkQ1UStWZmNzRnIyNHlZbjhGTUl1?=
 =?utf-8?B?OHNyUGQxOFlKZjZCM1cvSjRiWk95aUNYT1g0VG9vbU1HeDRlWE9RS1NVV1pE?=
 =?utf-8?B?WkZudzl1cElBTXdORkJLaE5pK1JXYk0zbnNsbCtacDhPZHdrNVJ0K3RJazFQ?=
 =?utf-8?B?bU5WNXM3Wko1N3lHNjJrRC91bGN1V2NDNUo3OVhqdDhYWFBuZU1KQndib3lL?=
 =?utf-8?B?R2ptR2tOWlIrdzkxTnhtc3pCSzFlaFFNdmhWREl3N0pvOXZkQ2FhbHYwbElN?=
 =?utf-8?B?ZkpIYUVxNWNCajFJSVk3WEJGR3N2cW9wbzB5MEZSZ0lpS2xxamFNbFdxTlJE?=
 =?utf-8?Q?WykEqHqJfYD6UfKr9y5+2BgI5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8ea68a-7dc7-48f6-f604-08dd8bfa0f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 17:27:07.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57QZ4XNFhfx5BTDJQ5U7KMbPpuZOnedLeytrMVcqaktYtsubxwm36nIeSRGbRIxNpJWayP44TRyPaRsiAKFL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4909
X-OriginatorOrg: intel.com

PiA+ICIgTm9uLUNQVSBhZ2VudCBSRFQgdXNlcyB0aGUgUk1JRCBhbmQgQ0xPUyB0YWdzIGluIHRo
ZSBzYW1lIHdheSB0aGF0IHRoZXkgYXJlIHVzZWQgZm9yIENQVSBhZ2VudHMuIg0KPg0KPiBBcyBJ
IHVuZGVyc3RhbmQgQU1EIHVzZXMgYSBzaW5nbGUgc3BlY2lmaWMgKHRoZSBoaWdoZXN0IENMT1Np
ZCBzdXBwb3J0ZWQgYnkgTDMpDQo+IENMT1MgdGhhdCBpcyB0aGVuIHJlc2VydmVkIGZvciBJTyBh
bGxvY2F0aW9uLiBXaGlsZSBib3RoIEludGVsIGFuZCBBTUQgdGVjaG5pY2FsbHkNCj4gInVzZXMg
Q0xPU2lkIiwgaXQgaXMgZG9uZSBkaWZmZXJlbnRseSwgbm8/DQo+DQo+IFNwZWNpZmljYWxseSwg
aXMgdGhpcyBkb2N1bWVudGF0aW9uIGludHJvZHVjZWQgaW4gcGF0Y2ggIzUgYWNjdXJhdGUgZm9y
IEludGVsPw0KPiArICAgICAgICAgICAgIFRoZSBmZWF0dXJlIHJvdXRlcyB0aGUgSS9PIHRyYWZm
aWMgdmlhIHNwZWNpZmljIENMT1NJRCByZXNlcnZlZA0KPiArICAgICAgICAgICAgIGZvciBpb19h
bGxvYyBmZWF0dXJlLiBCeSBjb25maWd1cmluZyB0aGUgQ0JNIChDYXBhY2l0eSBCaXQgTWFzaykN
Cj4gKyAgICAgICAgICAgICBmb3IgdGhlIENMT1NJRCwgdXNlcnMgY2FuIGNvbnRyb2wgdGhlIEwz
IHBvcnRpb25zIGF2YWlsYWJsZSBmb3INCj4gKyAgICAgICAgICAgICBJLzAgdHJhZmZpYy4gVGhl
IHJlc2VydmVkIENMT1NJRCB3aWxsIGJlIGV4Y2x1ZGVkIGZvciBncm91cCBjcmVhdGlvbi4NCg0K
Tm8uIEludGVsIGRvZXNuJ3QgcmVzZXJ2ZSBhIHNpbmdsZSBDTE9TLiBJdCBhbGxvd3MgdG8gYXNz
aWduIFJNSURzIGFuZCBDTE9TaWRzDQpmb3IgSS9PIG1vbml0b3JpbmcgYW5kIGNvbnRyb2wuIERp
ZmZlcmVudCBJRHMgY2FuIGJlIGFzc2lnbmVkIHRvIGRpZmZlcmVudCBncm91cHMNCm9mIGRldmlj
ZXMgKHRoZSAiZ3JvdXBpbmciIGlzIGRlcGVuZGVudCBvbiBoL3cgcm91dGluZyB0byBkZXZpY2Vz
LCBub3QNCmFzc2lnbmFibGUgYnkgdGhlIE9TKS4NCg0KSSBoYWQgc29tZSBwYXRjaGVzIGZvciB0
aGlzIGluIG15IGFiYW5kb25lZCAicmVzY3RybDIiIGltcGxlbWVudGF0aW9uLiBObw0KaW1tZWRp
YXRlIHBsYW5zIHRvIHJlc3VycmVjdCB0aGVtIHNpbmNlIGl0IGJlY2FtZSBjbGVhciB0aGF0IHRo
ZSBoL3cgaW1wbGVtZW50YXRpb24NCndhcyBtb2RlbCBzcGVjaWZpYyBmb3IganVzdCBvbmUgZ2Vu
ZXJhdGlvbi4NCg0KLVRvbnkNCg==
