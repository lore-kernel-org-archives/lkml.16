Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E93214216;
	Fri, 16 May 2025 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414810; cv=fail; b=CMzIBUuDbTowdHt7fKVHoHMFwO2bGKKBUAIc5qF+o63yYC2Lz2d29vEPbcb/Yce4D/4eb7bQyXyYoF8GRuQKOoxj6EXQ1sXZxd6YYYt6rE8msWGUUcpK1HcT2cZcpmhm5nVf8kqR9c1v1xJqdjTK8N7xQobIW2Ae14t4x2mXz1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414810; c=relaxed/simple;
	bh=TlKutT+afnCmYj3oF7/+VwGGJlz6+DAX+SgdiKc9yNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iUvQhpKXahW3xTl8hFLO19OS5nxnENjzcqHS2CWkvE98maDVEpDP5cF74gDMmGqtbnG+QR4I1YGHKS5/QmJp5+rrpd/7op/CfNkC1Icy0qZW0zg3B1+qe7iT4Ejul8tyEhlPndza1lSOX5uheu6SbaReJi8m5J3YtJlLgR1l4Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ei65mA/T; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei65mA/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747414808; x=1778950808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TlKutT+afnCmYj3oF7/+VwGGJlz6+DAX+SgdiKc9yNw=;
  b=ei65mA/T/oeHTgvvEXan7qnvha6EMcnYeoSnJitMzcZQr8qein6goiD+
   Z3PxsHi0y6k2RDa3txKw6CvtrJWJcTKc2v9kmsprPqos9o1OSH/kkD58o
   p2p3kc8EO7B1/YSPXobgMmBVS3J2DWl43Y6K2cA646kBv8FMbWywQSDJt
   PpgL0BkTBQocWpARpdXJZMsg+V3wTEUrvpXYvyDD6bS+dAEcqJS/ihV62
   tIDkeyOocYlve5gmlnzW2s7x5ir0bbHFs8/+7SlpVufu8LLtSpVe7i9k/
   wOt7hjCxNi2tIhIotyfwcVH/2BsoHepICGp0tYqaaqEC/WesMRmNd848w
   w==;
X-CSE-ConnectionGUID: nsgn8T4dTNetblPj/YAiCg==
X-CSE-MsgGUID: nFamdqhDQCS2+/zvQ5Vp1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66798601"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="66798601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:00:07 -0700
X-CSE-ConnectionGUID: 1NC5T0UuRquJRSs7d8FUgA==
X-CSE-MsgGUID: x7lAcfX3Qwaox15m+xJ7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138482961"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 10:00:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 10:00:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 10:00:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 10:00:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVEi+/D43RRIk7GfIsZe7017ePGeDRabh+uAFdkzgXJFZv/++7y4r3MSl4m0DSrHwfZKxz+6VNl4jepyEpLbt77USCS4RYM+LFbxnkRQNtmx26ZVRbyTiQQe8wg7o1my9NGcglqrZDrRFGqR9orIwftLedig9igQaMlqU9OEtoWux4a5Wa6a5+inE3GoyC51au79o91ln1TwB2vAkuNZNBydF3vMCwqdQkdll4+/2E7NSKEVMjHumB0TLr3gAf6ndAMd6s1OUVWvVr8ruqMeFPPKHEtzoTHD6B0C1Iud/vcY7gGoOkJImhax+jTeocOIRr0dE1UGcXftc3NjxdTzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPwgcZK4EEs7j35S5MCg1d4quF1LKaclWgN+OHTSefc=;
 b=Oxw68tHs4unFUukZngU8s92U8yJzDlLHK2rdjLRQcgGGCbtVm/+rF5glHp3NatN+UPGh29sezovyVjqwwYVPJvJpGuIURAVhOwyNg0DICtBdgCPQQ5+76TaOJJT/6hSKD9iTYvX66aF/Kg8pmpwc0ZWP9Cqgg7nsFZi/iM3nXYrMXosccorOIqmvV71ZOl/gkTMBJ8L9DJqcDT+hb60yqt2MoTqDWaj051DHD2LEwUwOmYbLOlaYhmYRPk898F1MDacTCqFNnSsCniSEMcQ0VPzKOVwWQH2EZpThwPNLJzjsfa62spDJjM//GaIbWJAkISvDcx8hyozsFXdF9FPuvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 16 May
 2025 16:59:59 +0000
Received: from IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9]) by IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 16:59:59 +0000
From: "Brandt, Todd E" <todd.e.brandt@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "xi.pardee@linux.intel.com"
	<xi.pardee@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
	"todd.e.brandt@linux.intel.com" <todd.e.brandt@linux.intel.com>
Subject: RE: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Topic: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Index: AQHbxgWzbGCMJZdozkqdaIs1djNzgLPVIroAgABYoaA=
Date: Fri, 16 May 2025 16:59:58 +0000
Message-ID: <IA1PR11MB6267D36BB8F94253A7BA4E2DBE93A@IA1PR11MB6267.namprd11.prod.outlook.com>
References: <3492e00e6e343d03e28bc58c4365b282e71e786d.1747360275.git.todd.e.brandt@intel.com>
 <faee2ba9-dfb5-a4c4-77b0-7291400e0ad6@linux.intel.com>
In-Reply-To: <faee2ba9-dfb5-a4c4-77b0-7291400e0ad6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6267:EE_|DM4PR11MB6120:EE_
x-ms-office365-filtering-correlation-id: 62b0b5aa-054a-4b2f-5cbd-08dd949b1760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?UGCn6WWDQ73f9wjuoHAyRwwKpiWUAB3ejbgJEpOhFBqf7DwTtMjv1RA/k4?=
 =?iso-8859-1?Q?Wc5p2rP3feHZxQQcPSZlpAjX/7cuZ3Z0qncAtykadDHtz4ZOP2tICWbv2u?=
 =?iso-8859-1?Q?P8Z1tFLJ2o0gdwbAxoiYCX2ankT6e2VLsiE4IKPVZQBZLOH2DfSPRO5MrN?=
 =?iso-8859-1?Q?zFjNjxLgnlfdAJmiY+I76Dra4Vo1UvyoILF7eKcsBiPaJ+qLT28SjX72w5?=
 =?iso-8859-1?Q?JMU4E4cU5mGIhbGtw01nhBo6uQLJOO5iIRaFbE+R24q6kJlscL6olrMs6u?=
 =?iso-8859-1?Q?X98/oS1/MZRzzbK6h4K1GReSE6YvmYlEh+j58ph59t8j7rSWj4NaBaEQlu?=
 =?iso-8859-1?Q?xbzLf1E7fVEnxrgopQhRv+17QwEZ3n6gwkxo6avFSRW4OO3+xewelqH0Mj?=
 =?iso-8859-1?Q?C8w8QbVfu/lIpfMrT3AHv/fFLJT/6W0Ls+fyYuAcrduGS957ONwjyd/VNQ?=
 =?iso-8859-1?Q?Rgi7tbaEhiQVBAKwRHGWVacqUWLbFz2SCjQzkcVz80a6FHv0jlmPreFShT?=
 =?iso-8859-1?Q?z26h4d4M8RvF5fKgU9AAdrYCXuwPh/aPiQxFKGIl6xmbEVmbOklWfOGz3X?=
 =?iso-8859-1?Q?BN5M16a3H0aatV4rMDqpoXGuA2r6ZKFN4TYMzrfjTdA3PgVO92cC5/lqD0?=
 =?iso-8859-1?Q?5k+V8OaV+slYMz0oqyFsMMhEjgtug/oN0GB40TtBapy0XF/mTvG3Ew4dx5?=
 =?iso-8859-1?Q?XfvCvh65Y6d6o0Q1g+t6Xz+12lVUuANsYl6tep3r/gfxbNKo9Zg1WBulWo?=
 =?iso-8859-1?Q?WosizzX/lnlktLnu2mqx5wwoWmtmNfhXirYLUDEAWieNKlJM2YyKEOP27i?=
 =?iso-8859-1?Q?7TRWUvxE6pClHHJzjRRiLdRx3Af2A/UdmK84XEjSoCyEbvua2p2atfR+EY?=
 =?iso-8859-1?Q?7tZkfn1dibtGoydr53E0/syR9E5yvXdaICEIgVMiDYaPCU5zqN+Y0FChg7?=
 =?iso-8859-1?Q?ULon9HsMibb99jPCGdJFusGsvcDqYanbSA6m8ZyqVjb7rweaXVRkZBShtk?=
 =?iso-8859-1?Q?bHbmsouGrTouS28nu8uZGLeXsDbXpyY3jlOPDgJ2sRo+BNj+6zDSBm3DhV?=
 =?iso-8859-1?Q?S7ey5n3vKN9lqXxFg9mbRIWg5zjzLTCYBin9k3TEku8zWFpKAo9jB9PskS?=
 =?iso-8859-1?Q?Vqrc6FhMzgXRZ5tvtxqwq4FV3+9vE9GY7MOvB1sPMgk3J8oBeTJbLER0eK?=
 =?iso-8859-1?Q?7a77R5QcZYnT1aMuttZ2tDFt5kQm2ZxNq+mhINqHdIOB5Iox2ICiZJes6U?=
 =?iso-8859-1?Q?huFMun9DEK6YgBIQ/byCmM25FlOS0eLA7Izg/luSdSbZPBRPT6SZJTXn/S?=
 =?iso-8859-1?Q?bv9MDcJH5q68GUVbUpHI/LUU7mue2wF97M//bBx3Hvf5Z5Nde7ZJqkO255?=
 =?iso-8859-1?Q?7IBzX0RE5CKwoWXOmMs7Kc81zIii6PaRC/6CBD3T44KBW56mYyYwrAIxhX?=
 =?iso-8859-1?Q?j+NX4zQeKm/4L/hF7LBh3tf2miz7/aITIwP3XlVMNBUBW9OgmKDtKsz9Gu?=
 =?iso-8859-1?Q?swVLct618uH/iA51y+zFyxd+1NEBS/sNpNCCOZE02UwA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6267.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B6vfqHv4cY0eFfTsiFFasy9A3JEY53Oporn/yxNdp3uDReDbgLanZgEEUN?=
 =?iso-8859-1?Q?G7wBSOIBvi6koU45iDQWOgRJWWWBUeTUOSO4U8JwK9bnAv/zGt+Ya6esaX?=
 =?iso-8859-1?Q?EjOLlF0ARzJV+r74Fwrbr/PegZ/BV9MLKcSfPnv+sxug+KkZZcMYn6ms76?=
 =?iso-8859-1?Q?dO71Hp0htTavMP89Kcm0+yH0qAUI5LAiCxo++a9ciF5/vNev7Jit/7BBJV?=
 =?iso-8859-1?Q?NRoNjeRrHnERgwdyFad4dMSFkxp1maDKEnqh8M+vytlIYUjQxPXtVtptGM?=
 =?iso-8859-1?Q?zkQ5IXH5KzFuXQvedF4N74nq0KBtGhfVEg9UJKlzBvaDR/OsjaesjB9kdI?=
 =?iso-8859-1?Q?67+U6uabkHkNvpSX/a4x22WKwH6hbAbhpZ47I/bzDBO6d4tH9pz2uJq7Jw?=
 =?iso-8859-1?Q?Iw5soKuvkgEtoiWTMqDovhFRCFdwjzUA4gBmASKThyeF9SRRoSOsq4SS+N?=
 =?iso-8859-1?Q?t5QDXBdYLtMs9soWE18+kC2KAac8rr3SsGWfStGOgvfe3rhzxdYBrWBqTv?=
 =?iso-8859-1?Q?S3YaOE4T2loT6UfU/Ug/MAj/7x/kXtNDXTBaqxPcKCGoPDElRVoryT+EvP?=
 =?iso-8859-1?Q?VeO6KjTImod68rEVhER3nSfmlivB12WceZkN+eCXngCCjfCLoDYX4TsXZf?=
 =?iso-8859-1?Q?lHWTTAzal96bvmNIe+o7h0ExIzxYOke4rgpOQcz7RzHGAM2UElKRKc5+1b?=
 =?iso-8859-1?Q?3Q5CQQjK8ojM0s+wf1SKiYE6q829aKEFoeL++viqbWVs+SIL/323u3BD6G?=
 =?iso-8859-1?Q?P5L+8JlBgxFmbQqDHjKsYys8alCKRZtfPqrOPWPEArx1i7yWvt6PDI92qc?=
 =?iso-8859-1?Q?mbPaV62ER/YdoKbVeLtqktQQsiY2BYws+2tiHko8/Jdm1MPetepHN9MO6s?=
 =?iso-8859-1?Q?C2wqIK7pbDcGenf7vswQ7Oa+sGxRB1YOdfbx7bov1v68HXMJvWyhqJhTaz?=
 =?iso-8859-1?Q?EurbLygp9U7lvlISYBNBMTu6kh8hp1zS2UgVq12ZsS4oCVnoESJj8eEAAP?=
 =?iso-8859-1?Q?6WFR652sQIIic8XeboDbECIRejDQfpuTPyXEF/yXp5+7yL3ax87AhpPeZp?=
 =?iso-8859-1?Q?ZJZ9QqfufoGeUhI5O2gDHgGlJYu/trTA36Kiqfc8u7IA6/3QEm2et4U8ZX?=
 =?iso-8859-1?Q?d/MPExrfS5x0ST5ZceTgUVKCALF0FaBmk6ug2HBlP1bFQBddnBDai2qm93?=
 =?iso-8859-1?Q?LPgN5f80ktsxaE1Zs2ctSltUJ1fm/Pz6cC4r3V2d+jV4GAQMN6w63OEJ8w?=
 =?iso-8859-1?Q?tJwdzZs5KBLrkZgJbhQlJTIsEJ7qrS83qRnb7mXmmIgGs7QFmFPQm8kP42?=
 =?iso-8859-1?Q?0lj3cAy8Yblnw6vp4IyycSVjMYcuveKGHBIaZAKubduqhw4WvfBCW1vWsN?=
 =?iso-8859-1?Q?i2bnPYDx4CsrWK6v1seKIaZEaMzZwVoYcn0nuk6Bia3NvzqLRMhwO34zMx?=
 =?iso-8859-1?Q?apcNlU7N5cemWhmhkMnEDG+nNVABn3ZSXO4ewL+baiHI0oTF1rVXQ8ylJ4?=
 =?iso-8859-1?Q?S9VxE4kH020ZFfKBLvj6XJ1HtYlygRdnLpkdaUO7T7nl9EPdLIagx9a6P+?=
 =?iso-8859-1?Q?c7W1OEvmxZ98mIclN919qTNnsNQp4KjZmalyQdqThnmax6544WP6jO4Lsz?=
 =?iso-8859-1?Q?Fcj2qjOWnooIYo6XoqSNo9TuiojtyMMkwt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6267.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b0b5aa-054a-4b2f-5cbd-08dd949b1760
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 16:59:58.8867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H06eaGU9tt2Q4xLxEY2INnBx4GhQRe/hvZDeGsz/QQALHWYN9UxI+HDqSlj7TOhSybpxRGp713fLbw5uUtbAfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
X-OriginatorOrg: intel.com

Let me resend with a fixes tag (sorry about that), however this might be to=
o late to be included in the upstream 6.15.0-rc7 kernel. So maybe we can sl=
ate this for 6.16.0-c1. I also want to get Xi's feedback and she's out this=
 week.

-----Original Message-----
From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=20
Sent: Friday, May 16, 2025 4:41 AM
To: Brandt, Todd E <todd.e.brandt@intel.com>
Cc: platform-driver-x86@vger.kernel.org; xi.pardee@linux.intel.com; LKML <l=
inux-kernel@vger.kernel.org>; todd.e.brandt@linux.intel.com
Subject: Re: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to i=
ntel_pmc_core driver

On Thu, 15 May 2025, Todd Brandt wrote:

> The ARL requires that the GMA and NPU devices both be in D3Hot in=20
> order for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U=20
> addition to the intel_pmc_core driver attempted to do this by=20
> switching them to D3 in the init and resume calls of the intel_pmc_core d=
river.
>=20
> The problem is the ARL-H/U have a different NPU device and thus are=20
> not being properly set and thus S0iX does not work properly in=20
> ARL-H/U. This patch creates a new ARL-H specific device id that is=20
> correct and also adds the D3 fixup to the suspend callback. This way=20
> if the PCI devies drop from D3 to D0 after resume they can be=20
> corrected for the next suspend. Thus there is no dropout in S0iX.
>=20

Shouldn't this have a Fixes tag?

> Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
> ---
>  drivers/platform/x86/intel/pmc/arl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/arl.c=20
> b/drivers/platform/x86/intel/pmc/arl.c
> index 320993bd6d31..5053e3dd8f5e 100644
> --- a/drivers/platform/x86/intel/pmc/arl.c
> +++ b/drivers/platform/x86/intel/pmc/arl.c
> @@ -681,6 +681,7 @@ static struct pmc_info arl_pmc_info_list[] =3D {
> =20
>  #define ARL_NPU_PCI_DEV			0xad1d
>  #define ARL_GNA_PCI_DEV			0xae4c
> +#define ARL_H_NPU_PCI_DEV		0x7d1d
>  #define ARL_H_GNA_PCI_DEV		0x774c
>  /*
>   * Set power state of select devices that do not have drivers to D3=20
> @@ -694,7 +695,7 @@ static void arl_d3_fixup(void)
> =20
>  static void arl_h_d3_fixup(void)
>  {
> -	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
> +	pmc_core_set_device_d3(ARL_H_NPU_PCI_DEV);
>  	pmc_core_set_device_d3(ARL_H_GNA_PCI_DEV);
>  }
> =20
> @@ -705,6 +706,13 @@ static int arl_resume(struct pmc_dev *pmcdev)
>  	return cnl_resume(pmcdev);
>  }
> =20
> +static void arl_h_suspend(struct pmc_dev *pmcdev) {
> +	arl_h_d3_fixup();
> +
> +	cnl_suspend(pmcdev);
> +}
> +
>  static int arl_h_resume(struct pmc_dev *pmcdev)  {
>  	arl_h_d3_fixup();
> @@ -739,7 +747,7 @@ struct pmc_dev_info arl_h_pmc_dev =3D {
>  	.dmu_guid =3D ARL_PMT_DMU_GUID,
>  	.regmap_list =3D arl_pmc_info_list,
>  	.map =3D &mtl_socm_reg_map,
> -	.suspend =3D cnl_suspend,
> +	.suspend =3D arl_h_suspend,
>  	.resume =3D arl_h_resume,
>  	.init =3D arl_h_core_init,
>  };
>=20

--
 i.

