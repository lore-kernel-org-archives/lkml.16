Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842101C8613;
	Thu, 22 May 2025 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952198; cv=fail; b=WnDw9P8O3apjqMz9iHcWIQTx9h86YttgHEXnqg95y5vlfpZz2ZN/WEpOEsNJWjV4mksbcKK9d9OChyY7eFqobWmnuQ/1FAG6/Q1NV2tCUbGkdQtQzBrF76FsQGuy1QEFQwMLMdS8nNKioYEcZNh+bLE+LiYEuHDPxRzchF+0oVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952198; c=relaxed/simple;
	bh=PTj6JgBppyE1mWJk/Osz5X5otsjsh1EXT9RKRK5j350=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qS6tPR0BMbpmtGnxOZQX8vNOesdHerU4KRf6dUKGvmoTg8sxu8i1AQGKZPQRpeOl8pFBO4t5uv1FmuDphhC69ONEU3rKdT9ljipciMekcnb5sC15HOlt5QqS7IMoO3yo/CZjm9QC9m+oyhSco1hiLQVnX92y0oO3WaU8oMY/BP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BV0rGOkR; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BV0rGOkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747952197; x=1779488197;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PTj6JgBppyE1mWJk/Osz5X5otsjsh1EXT9RKRK5j350=;
  b=BV0rGOkRJzonRUPoPGdkF/xqyeavfuu1aj8nCPkQbFoKodIVRf1W0Ig/
   rZWhvXe2Imh97eFJbsvHlKobTCR8M4JVp4px9lgB57RZkKXLc7p/zDKbF
   uUfqRr0LVm1bwipHmNrFRG3Pns31dtHzH2iA04rH2FEls6IPp4kR/IAbb
   OhnHDEAY9Nlvu+ZWLBBONn2KDCautm95aQvp9t+Tx8wZmtYyUhln24Nqm
   /Oq/Kq45hU7X5fqYZAFTwWb+zhHh59RZkBljHeltwbmFfnQoOFHI03Xz9
   DGaaX8lQda+0HhkIv87oJtCUkkkbAhATcFP9w7MeTh18nsv9nt+FeAV2Y
   Q==;
X-CSE-ConnectionGUID: HGiIaTHKRPutvwCZzPSFJQ==
X-CSE-MsgGUID: NVsK50y/TIG1ovd18wbVKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61048223"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="61048223"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:16:36 -0700
X-CSE-ConnectionGUID: CLENsUChQVOCnJMdnmQ5uA==
X-CSE-MsgGUID: 54CMKM9DQQG0oQ6t5Su2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="146039948"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 15:16:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 15:16:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 15:16:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 15:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as4DqvvcYhFzsJW83S5xlu+t2KbozFiNUaH/nzcwYVP/HUPUKMdBbtMa7FpsvzHuxpohszcXS31+tSuRfaFioyGdEqBBmxvsBlC+eUhSM7TvWbCNQ6RDyTzjew171OkqH43oNACYIJb7A+y3TtsKVtKCLJtb8wFeX7abYTGFtX9aGXa+ziPnrwiXylKI5snUkbfGn1u9LJCR708E2IiQVYC9ik6OSTOc2wJLZnisI+MeHMO9By+dFGr3iIOU7RnIXbsGPEx8BpmJIyJMMNVbqzy5gLFFCrjjy/UqM3leihhgkWJOOmSlpC/teTnjw+BCpUFvlogtw1cqVor0Wm1f3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTj6JgBppyE1mWJk/Osz5X5otsjsh1EXT9RKRK5j350=;
 b=BFKdaNZfl+7V7ZE0t6PLMG1RGitQ9m4PgALfgzVtcfeiYXi/3rfcxDsuqXUTZV3ZWPLbnIhtzYANMKNAJHd0CSVXnyj0OYoc7xCMR0990qdipRLOZz6zZN+PYKKYMqmhe2mzgmwNS1eT2wi4GiSsuIfLscDBnXSvw0ddnpPRBroAyjdxbKpWOk9gVDCDa+VTC4u+RsuAZWS0Dwt04ZsBGfzVS/RHgYYw/Z8sp3asQWmMhcCtMaS8ILDvpRLK0RX9ZwHuysoEfvjlcL8iOPPQ4b38k6Onq4w9wXUqfPVNHr0VstI4iElQc6xURFpeiE0/+OyCI5D9ekvke4YG/WV06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH3PPF8B755DBFD.namprd11.prod.outlook.com (2603:10b6:518:1::d36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 22:16:16 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 22:16:16 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "james.morse@arm.com" <james.morse@arm.com>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org"
	<ardb@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "alexandre.chartre@oracle.com"
	<alexandre.chartre@oracle.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "Li, Xin3" <xin3.li@intel.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "peternewman@google.com"
	<peternewman@google.com>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com"
	<gautham.shenoy@amd.com>
Subject: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Topic: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Index: AQHbxexNa7lb+uglWUizC2qcUfje+LPfO3wAgAAEXRA=
Date: Thu, 22 May 2025 22:16:16 +0000
Message-ID: <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
In-Reply-To: <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH3PPF8B755DBFD:EE_
x-ms-office365-filtering-correlation-id: b111e693-7c0a-466e-4c53-08dd997e4528
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cG0xamtmZnFJOTZGb3ZsR1UvazRpM2MrL1NrWGFxYXBvVURuSE51dTBDYkNE?=
 =?utf-8?B?SkpBRUFLaTR3cjllOW5YTnBTTHkwSWR0WkZyc2xjSEpkb2Q2bUJ5ckRaQVlk?=
 =?utf-8?B?ZDZnTUJ1ZWxrSmwzcmt2N0hPOEpyeFRJZ0Jvc0dUTko4dFJYNVE2MEVGOTFW?=
 =?utf-8?B?RVlmTFVrVVVzNU5HN2NkcFROck5VcnBZaWpCYlVhRERVajl1SStBR3Vjb0hZ?=
 =?utf-8?B?V1VaclBFL0g1YzVlYXJEMU5ESjNkdW1raUh5b0IyQUpyNDFZWWJDMWQwc0Mv?=
 =?utf-8?B?M1dSVHJvNWRWeWNNbUkvb0cvY3h3Q1hybzZWU05WdjdUNDRmcUdPVk1RNUtk?=
 =?utf-8?B?ZFBCSnNzdXBnNlJpTkFmZlNTdGR4SWVlUXNTTHlxTGpsMGV5bk8vdDlvaU01?=
 =?utf-8?B?dnRIdVpOclBCRUx4M2R3OEcwclhnT1hxZkZNUE5sNE1jbG5MeURmK0NPWnUx?=
 =?utf-8?B?ZDQxdE5kSGFDOS9CU2Z6VFoya2lrN05rWVgyc1phaDBTR0orb2Foa3ovNE03?=
 =?utf-8?B?RGpaeXEyb0ZTMFpDbWNtNHpqSVNHVDArQmFOSDVlN1ZmTnNnTVFRb24zVTFn?=
 =?utf-8?B?QWZncGYxRkdJWWVadHRDMnJUU1hUMTJoWDkwRGFhMS9NbVZaOUdzVzR6VkJN?=
 =?utf-8?B?QlpIRS95dmFyR0xBTmd0b1oxVW1samViSlVoRW1PckFZTjIvaGowOGQ1UVU3?=
 =?utf-8?B?VnZqdktJSjB4ODREV1dJRGo2VVZzYVdpRzZXbUZPSlh2bkw3OGVnVDkxUE9m?=
 =?utf-8?B?aFdOWTVMZVdkaXhmUytsQkRNaTByMXduVHFtL3loYys2UTFOTGRwRnJzM3V4?=
 =?utf-8?B?Um5mWmdYMytIdGI2MXkxd3VISTVzNlVhVFJuK3dVS3JSSDkwWVBvQnZqQUxo?=
 =?utf-8?B?dnl5L2pLd0M4SGRSTGI4NlFka09lVXpYZ2lOK3A4U1cvSEQyWCtad0dibm9w?=
 =?utf-8?B?TzJJaFQ0RU9MRGdVNXo4bmVIbWs5VXNOSG9ydmJMclhJSDhVb2Z1MlhJOHFn?=
 =?utf-8?B?RTVnWXJ0dTVLeDJjTDNEcjBFRzJiaFlJM0dHSm9NSWJuMFVUb1hJUnV6Wmlq?=
 =?utf-8?B?MzQrdTNXMk5YUXozSE9udEhPSGZVUk83a2tkTjRTUzZEeUFNTUFjL0hnQkhn?=
 =?utf-8?B?MnhoMkRjTVBxbndPcWdEQTEweUlzQkluTWNtbWFMUWl6dU5KcC9tTlRIVGFk?=
 =?utf-8?B?blBKd3RKU0l0T0oyVjJVOVFZZ0pRaHJSWVJZbXk1ZVNIcWc2NlArcW1OTk9D?=
 =?utf-8?B?SXhzU214RTl0ZTUwQVZmdlkrY21qME1BTUlHdEE4TnBhQ0Q4TTI0REtvQndR?=
 =?utf-8?B?WmY3ZGFwM3JBbTRqd2hNd3VSZUdyU0k2WFBnTndOUzNkRmNBOUh6dzFybGFJ?=
 =?utf-8?B?dkRHaU5oTllucjUrS1JZMVZ5WG55THJ1M1lMWnRJaWtiRm9OQnNIS2creWxy?=
 =?utf-8?B?YWt0dlM1RlpVSHFFZWxlZlFiREVjSVNYYzl6SFAxcHNDOEFMZDMvSVlOOWtO?=
 =?utf-8?B?TksxWC9QVVowVGhGMjdiTGd1eGVYMmJWQllRNkZheTQ4RFpmZjBZVmlSODg2?=
 =?utf-8?B?QWFuTEcwRkpRRmZ0ejFweDNUY1ZoOG1hVTJXamRpK1dPQi9GK1dvbXBDRW5Y?=
 =?utf-8?B?UnFiNVVabTM1SUxXUHdydEVvMStnWVZWY0RsWHA5MUNFT1RRSmIvVmdpVUdG?=
 =?utf-8?B?OUxhNjRUZzFqUXY3N1pNRWtPc2FwOVRvUElmYmNxeW14V0lnL2hpNnRsS0o0?=
 =?utf-8?B?VkVlZTJ6bEJkMUQydkNPSXFqajlqMkwxSldIQ1d0dzhOS1ZabWtvMUdycng3?=
 =?utf-8?B?emlxbVBqRHk3REs1VzhhRVlJNjkvOVlhVTBuUXQwd0kyeEhrMjRUTmEzTXlv?=
 =?utf-8?B?RXA0RzNZTGxMeks1T3Z2R05xem84QmpoWHpKNkhtd1YxNlIyeDA3bWszVUlk?=
 =?utf-8?Q?oxInLi21/NE7dEgM/bTceeXYjV3TddO5?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFVxZHdpMjZyckhDdkFCQjJrZ1hFcjJzZTljN0E0QUdqeG05RGlrNW5TQmVE?=
 =?utf-8?B?YkZwZ3ZhcE1jNnYyNmJjTisyWE54cVZjc045Q00yVys0SnhEcmcrMm1wVFRw?=
 =?utf-8?B?ZFRLdEpEeTk4cG9JaU5LejZ1ZjAzaWFJOFVHUXM2U1U0RDkxVFc2T1ROZW1N?=
 =?utf-8?B?RWpWU3RxQ2Rra1d1VTUvVHdqWHRjUThydS9ORVJWMWlXUklPQTM4TThFQ09Y?=
 =?utf-8?B?QVNPYmpJNVA1RzkyaVZONkFqR1AydUFHOGgvVk14TXF2RjBuV3ZwNUVSb3Zj?=
 =?utf-8?B?c1NDM0djN09GWGFhbE5EUFFlMU9kajFGaDlUYU53UTJIaWpoYVJtM0JGczJZ?=
 =?utf-8?B?aENya1Q4TDREaGtnWTBDQ1RPd3FTMktHVCsrbUhrS1VDdnJRR2U2SVA4Z1Bl?=
 =?utf-8?B?L1ljQnRnVUJrYkkvT1BTaDVBVU5oYjZ5ZjcrUE9zbEU2ekFpNFdYMlQwMWxr?=
 =?utf-8?B?TzhRWDlFeWl0ejdDaFNpb1l3b3N1NnkvS09LRUdRNlQraTlIOTBXbWZoY3Uw?=
 =?utf-8?B?WGRmK0ozOGRtc1N5bk9tY2J5dVlLaXgxbnozZ3hLZEhPRTdWVlpFNVVCdW9R?=
 =?utf-8?B?V0NMRWF5cnBRaUtibC9ScHE2QlNjM0d6bEhvMkt3K01YOEhKY0tPOElrT1FH?=
 =?utf-8?B?T1I5U3FpcGIza0R0WWxpdEw5ajFDaDRvRFAycmxOdnBTY05mZjlrYTdoN3Az?=
 =?utf-8?B?NEZncWpCN1BXVmRqT1RCeEVjNW01TGw2RTc1MlAxa0lxMytxM1g5Nkc2MHlY?=
 =?utf-8?B?a2lWRUpGaGVURTMyL3NxQitGeXhJb1ZyZzdMT09RVTh1bXZrRG1OTlkwU3pi?=
 =?utf-8?B?NWE2SEExbHFGVXFaOEtYeWwrdFhtcFZJdEZNZTNRdmpYRWtmb2h5L3ZPbDZu?=
 =?utf-8?B?TVNPQ29LRFlRTHZEcGxTcGVwSGpSSEl3R1JnQk9nd3hHMEZDdkw4WUdJM3R6?=
 =?utf-8?B?WCtzUDl2Q25yQ3FEVVY5aHRDZjl6YUluVmUreHlRUEdqR0FxUnF4a21FUW9K?=
 =?utf-8?B?bTlZSVYxeXVFREVxOW14Z2tYN1ZoNDZzM3NTejNKR3J0czlsR3BHVWpHYUhv?=
 =?utf-8?B?aG43TE9Ib0x5aGIyYUUxNDZhTUc5TVEwb0Y1Zjk1UndVRjR4dXl2clJmcUxG?=
 =?utf-8?B?ZStCT3hBd1BqRzRJZFdsUVVyWDhYSjYzTUZ5bTk2MGNycnBpbTZ0eVZuUVVZ?=
 =?utf-8?B?NVl4YmVLNEFmVGk5M0F6UGZ3YTlxdnB4a2ZYdXo0QXhWQWl4OWYzNy9iRHgv?=
 =?utf-8?B?QmJackRMVk9CWmRRWWRZbWlmZ0VYUTdWY1RvTWp4alhLWmRGU1EvQ0VYU0w1?=
 =?utf-8?B?ZytxeWpuZk02YlB0NFJYTll0a0RYMFZVaGU5Mmh6dW5GakRKWTRUVG9YR0hN?=
 =?utf-8?B?UHFWUHllSXI1MWFQSkZuZDk1elcwUEowRmhOMG8waGZPa2h5M2pmV3FDcnE4?=
 =?utf-8?B?V01DVjgweDU2NzcvTERXelRtY3VLNDJzU0VNSGI2ZHNiL2Y5SlZsaGdoZVI4?=
 =?utf-8?B?R1NQZTlWaU8wcFp1SDk2dHhmbW95aGdyU05tTTdFZHJORS93cWYzdjhJUWZl?=
 =?utf-8?B?d3NEM2tWTTlXTGxHWVlMNXhmdTNzN3RPeWc5THJyRkFDVWNLdStVL3hlQ1ZF?=
 =?utf-8?B?MXNUZ2JQWGNqZUhWenNuVkFwMXRydFVvYUh1SG82aldnVmJBN3ZkZEdvdkNR?=
 =?utf-8?B?VlI0dXB3cFFwZW9ubDBFV1lHTmM1Wm1DZ2VQa2NZUXJkZlJVcDRsQ3U4MUd6?=
 =?utf-8?B?djdkWWN4aWZGdm9GSWN1ZTBpd09BRmVTVWZ3R3ZQUmN1bVdVK241UEUwRVpX?=
 =?utf-8?B?N2R6bTZ4N0RabXFodHBXVnRXcEtmTVIvWHhFV3hnTDFpclVJZ3hUV0ZBU1Vj?=
 =?utf-8?B?NkVJUXZQNDZLV0duTk9pOXB5RlpRS1BEbEZMdkJXbVdKQzFBV3VLYVd5Q0dP?=
 =?utf-8?B?dGc0ZjFpZlJGMjFzN0xZZ2NTK3BwcUpSTmFLYnBjbW81Q1VEZVU1Q0pEKzBD?=
 =?utf-8?B?VUZnM2xzd0Y0aEFhbFNwcTZYL25ScVpCMXNzcHpKSlhUWTBLczdRbG5EV2dh?=
 =?utf-8?B?ZjAwVUR6dTFWNTQycmh0NjkyK01SanlhODk1ejNVZzhPTDVtTXYwVWNmZEFF?=
 =?utf-8?Q?aAnCvJSK/1fffO/fZzgFdBt8t?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b111e693-7c0a-466e-4c53-08dd997e4528
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 22:16:16.1211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gbIWzlTaUzYhktKutmu82KIaZVxXSjhb4G95FrTC5keBOH+Zal3jyWgV/QtCYLP9HrVfeR3LX6x4puX2Mogrbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8B755DBFD
X-OriginatorOrg: intel.com

PiBJdCBsb29rcyB0byBtZSBhcyB0aG91Z2ggdGhlcmUgYXJlIGEgY291cGxlIG9mIGNoYW5nZXMg
aW4gdGhlIHRlbGVtZXRyeSB3b3JrDQo+IHRoYXQgd291bGQgYmVuZWZpdCB0aGlzIHdvcmsuIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA1MjEyMjUwNDkuMTMyNTUxLTItdG9ueS5s
dWNrQGludGVsLmNvbS8NCj4gc3dpdGNoZXMgdGhlIG1vbml0b3IgZXZlbnRzIHRvIGJlIG1haW50
YWluZWQgaW4gYW4gYXJyYXkgaW5kZXhlZCBieSBldmVudCBJRCwgZWxpbWluYXRpbmcgdGhlDQo+
IG5lZWQgZm9yIHNlYXJjaGluZyB0aGUgZXZ0X2xpc3QgdGhhdCB0aGlzIHdvcmsgZG9lcyBpbiBh
IGNvdXBsZSBvZiBwbGFjZXMuIEFsc28gbm90ZSB0aGUgaGFuZHkNCj4gbmV3IGZvcl9lYWNoX21i
bV9ldmVudCgpIGhlbHBlciAoaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDUyMTIy
NTA0OS4xMzI1NTEtNS10b255Lmx1Y2tAaW50ZWwuY29tLykuDQoNClllc3RlcmRheSBJIHJhbiB0
aHJvdWdoIHRoZSBleGVyY2lzZSBvZiByZWJhc2luZyBteSBBRVQgcGF0Y2hlcyBvbiB0b3Agb2Yg
dGhlc2UNCkFCTUMgcGF0Y2hlcyBpbiBvcmRlciB0byBjaGVjayB3aGV0aGVyIHRoZSBBQk1DIHBh
dGNoZXMgcGFpbnRlZCByZXNjdHJsDQppbnRvIHNvbWUgY29ybmVyIHRoYXQgd291bGQgYmUgaGFy
ZCB0byBnZXQgYmFjayBvdXQgb2YuDQoNCkdvb2QgbmV3czogdGhleSBkb24ndC4NCg0KVGhlcmUg
d2FzIGEgYnVuY2ggb2YgbWFudWFsIHBhdGNoaW5nIHRvIG1ha2UgdGhlIGZpcnN0IGZvdXIgcGF0
Y2hlcyBmaXQgb24gdG9wDQpvZiB0aGUgQUJNQyBjb2RlLCBidXQgSSBhbHNvIG5vdGljZWQgYSBm
ZXcgcGxhY2VzIHdoZXJlIHRoaW5ncyB3ZXJlIHNpbXBsZXINCmFmdGVyIGNvbWJpbmluZyB0aGUg
dHdvIHNlcmllcy4NCg0KTWF5YmUgYSBnb29kIHBhdGggZm9yd2FyZCB3b3VsZCBiZSB0byB0YWtl
IHRob3NlIGZpcnN0IGZvdXIgcGF0Y2hlcyBmcm9tDQpteSBBRVQgc2VyaWVzIGFuZCB0aGVuIGJ1
aWxkIEFCTUMgb24gdG9wIG9mIHRob3NlLg0KDQotVG9ueQ0K
