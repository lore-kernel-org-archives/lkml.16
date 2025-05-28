Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1F221736;
	Wed, 28 May 2025 22:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469664; cv=fail; b=pBTx5FFzWctBbgi2EAsXBRFPlkXCq8nyL9Wmod/86Iqk7QqnUrmFQAebk9O0AA5gmIG/DdA/7u8HmokXcPo+ZafvvrRKZ5nqUu+QB6r0Xwzskq5tvZp2uMesPrleekotfuwaEgpF0BlvbxfeRYCPlALF89FYh7Jvt1aDb1nGORY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469664; c=relaxed/simple;
	bh=AG6qTmxtUWfk4FNAv7GnjHQtiXrSiHHbjWYiNYpoi6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OpQq4CJqP0Bw1Hso6yYduQPNSSWdRMDHUglE8f7Wsd7M/pI7X8iAbHPFFDe+uhUdjeET6Wm0eM8ygBBmlcdEbnUsg+XZuDRc4ohogDboGLMqxo86q1a9+46ofXr1zNNA+LyYECVisroth7Wr8O2J9SjQf/esJGUFjDG9V2vd+qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpaYfPT5; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpaYfPT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748469663; x=1780005663;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AG6qTmxtUWfk4FNAv7GnjHQtiXrSiHHbjWYiNYpoi6c=;
  b=RpaYfPT5uDhQPkUv0kQJGuAxEnWWl8+F0/YuJWLfwriqQJFvIDTsCpNj
   la72oBYPt7NIVPTs7SYJN6A5zA7NMjTsUXRpKBaRWRHFeLrtK+ZXZCdOW
   wPe4by24A5gY35VnDd6ce+xACDOWKMpCPp4DDqEKaWiE+LpRaBdejicyM
   a6tKnnl61aUjIyQN/g8zj/EZHdpGhhF1nYKYYSLPEDpGj3yOykHHVhgMX
   wgf9dLtXvk2X4j91hAk6sUIoAgu4q83mztvwUQghJI2cuZF3+u518WF5O
   J1XCPlAnUfgT9gisG+p5ifMoKUxRrL8hWKsaPVckkSjPwMUQph3nTQ1zX
   A==;
X-CSE-ConnectionGUID: xdoBIgPfQg+fseLR5KpTLA==
X-CSE-MsgGUID: FQj5h3ZxRq+XisFUrojCaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73045269"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="73045269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 15:01:02 -0700
X-CSE-ConnectionGUID: z+PQxzRrTOafY2+TIiftoQ==
X-CSE-MsgGUID: FhEUrMGhQK+LcIgRu5oJWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143202637"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 15:00:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 15:00:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 15:00:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 15:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6hhdilGtnLh9dX82eK/2vPU2kTvls7sBvKULMlvCJwfNwFoKxmFCDFxjOBMXmvtSvupsZjodJHoTcqE8Mia5+P+IdvBAGjKzb1a2i6iBPB2meAHIb0v41bLHgMm2nTPEz2T1yI5eRSqAHqwfoC6Ru4FQLE4ErrBW6bHoI8sKAHxYe/kZb2dBcaQlvcPCxX1TYd1lV6GlWwABhjbllfK7lXtqOsXpgGWz2X2xsfL39y10nxWCywSajfvIA8JrDnX+ge3PL+fKOhRb++cTIQu/wEAE3JCqcCnqIFNyCQrVvbU6KToKOWBv3qakUFuazXONRdvzE+Xl95Ujz8IlgEUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG6qTmxtUWfk4FNAv7GnjHQtiXrSiHHbjWYiNYpoi6c=;
 b=XxJB1cJUXYtdEf5ExEl01hnx+7NrcAeEIiMoToxOaMW7ofrJP5YT/mYIMyjfWdFk5LsuXaGAZhk50wtc1PSjs+X0xKUItuGNeo2jJCo9hDVPhcMIkST/ruOWAChix5JP39EuSjWOXjP0GpQu6nJ5j/GseM90FUbZ05XbRGfTw6nYAAPoAzYe6QfsdndL/IPD54XDzkIbLRhF1Gli9pOMUWLTBgd7P7U/byXrQTdVjFrxa5w24RifRtP1cscVbPWxbE4yi2VIGSxJZgTl16WvNGIrMoNE0VIYHOZT8eo77O09KhA6wzKPcVrhyvzH8HtBKJlnWvl0QK5cwMMMXqiGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 22:00:53 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 22:00:53 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, Peter Newman <peternewman@google.com>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "dave.martin@arm.com"
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
	<linux-kernel@vger.kernel.org>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com"
	<gautham.shenoy@amd.com>
Subject: RE: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Topic: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Index: AQHbxexNa7lb+uglWUizC2qcUfje+LPfO3wAgAAEXRCABbSPBIACH3JwgAGSwACAAATw0A==
Date: Wed, 28 May 2025 22:00:53 +0000
Message-ID: <SJ1PR11MB6083A51C7607D419646DCE3BFC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
 <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
In-Reply-To: <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: 9cb97d70-ecdb-4ea5-7c73-08dd9e331ddc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RldUbnFONWd0NDMzVVJVNkcvTWREbVVpYXR5THUwQys2YWw5NmVpNmozZ1g4?=
 =?utf-8?B?aVlWVnJIaHBLK0ZWWis2SVhtUzRkV3ltbWltR3NMUVhuZGZGTnUrMFZPR1Bw?=
 =?utf-8?B?ZUk3THAvWWFzczVESXZnYXF4WmdTRW9wbkhZWDVtaTYyNmFpRDFUZTFKcFpk?=
 =?utf-8?B?RlVEM0dEL3phTmVmZzBsT1lUVHZONHNCRlVBMSs4cGQzREZrSENlVlpVUjZq?=
 =?utf-8?B?OEJRVStZOHY2SW4yUUMvT2xTYWJVMUg4WW8wdEl2cDY5cFFLTWpUcFIwOVdB?=
 =?utf-8?B?OUF1SFc1VEorY3ZDR2Y2QXc4WlE0QVBaeDNFMENOazBuQjlxSzJDNmV3Zjl5?=
 =?utf-8?B?KzFzcktDVnlGSzMzdEhqNUJuUmUzalZrcmxuWDkxY2xPcFlGbVFLRjhvR0pH?=
 =?utf-8?B?Q01EZzJWZTloYngwSkpRenJnUWtBek9zNzJJRmJWM2NhdmxsbFlKck5weXNX?=
 =?utf-8?B?U3BBbnVlSU1ubTFZM252cDZ1UjlVbGNhQk9uaEFEbmdnaHlCeVJodXRUVnlx?=
 =?utf-8?B?a3UwUUJLS3djRHVPWE8yNkp2djd3dExLUERWMWxJV2k3OWtZUFd5WmZHT2hF?=
 =?utf-8?B?UkhvZ3F3aHU4aHluU3llRFVWYVVpYXhsazY0Y2RaL0Ixd2w4LzdGdlpyOGlu?=
 =?utf-8?B?UjZiU0RUb2lQamFIS01lTlFZRVRYUE82Nld6ZkFjN0lCMTRwcjNQL0wzR2do?=
 =?utf-8?B?cnk2Y1c0blF2bXphRVdybzFxaEQ4NHJpS0lmMVFlUnhvcVZ5cEJMYkxtM3Vn?=
 =?utf-8?B?VjNuSy94bUVvQVBNdjFkWGRERDJmVXExVDZyTllraG9PYW16QjRYZjQwUzJy?=
 =?utf-8?B?WnFDNmYxVUs1K3VPZlE0eWNET2t0ZjhnaHRuKzlUbnAwSFJRaEF4OEtMMDBn?=
 =?utf-8?B?S3NGZ2EraHlUUnBicUhodjJpc2VzVXZja3NKajRBK2Z4UDVvN1lIcWxMaENQ?=
 =?utf-8?B?VFhyRjdQeUVIUU9RVGYvendkQWU4TlU2Rmpsa1JXRVppaEZSSExtMnpXeHZH?=
 =?utf-8?B?UFJUK283Yk1LTzFkL01EUkpPR0pjcEZqbTU2WGFZUm01czl5MEJsMHRZSGhK?=
 =?utf-8?B?NTdGN1QrUHl6QUtrRjN0RHBNQjNzRSs4Z3ZRQkM0aGx3L0V0cDFPeUt1WWFj?=
 =?utf-8?B?THNCREp6TVYwOHF0clhIRHBtMUJVOWJBSlZVUENjRkF1TVIxdGJaUHJ2d3Zh?=
 =?utf-8?B?Z0lEZFdqT1cySHhsaitVS042TVRmaTVnaVY0L3c2Yys3M3ZIQXVFS2tGelUy?=
 =?utf-8?B?Q1NmbEtGZE5PSEZvVHdHSXJvdW56ZU1qVy9UOHpBMUhkY1R2TlRHbU5KZGxY?=
 =?utf-8?B?V24xMittNm00T29JM1kzenphYUFMbGp6MlpObnZTajFUYXBVWVFsZ3BvL3dC?=
 =?utf-8?B?eW42WkhTZHFTMDF1RlJCejFUQTV6SisxSDlUOGRtazhLT2NPNGRZN1BNOFFK?=
 =?utf-8?B?MCtGRzVJVWNFRE9qQW5PVWdSSkprdkN3TCs0N212eHgxWkp5Vm5oV1pCZ01y?=
 =?utf-8?B?QTlWcGFLcWQwNk0vcWc1T3BETjQrd2VsV28xSTdxZ1NHeTR0bG84R215R0JG?=
 =?utf-8?B?Mm1MVVBtOE1HbHpRcm1Ib2VnbU9jV00rbTlTaENXaTZOY1dIWWQ4eDhYQ0I0?=
 =?utf-8?B?NE4xM0ZFNkdMRlhQakFWcDRrY21jYXAxM0ltOFVTYitRc0wyVjR1UFhzellr?=
 =?utf-8?B?c1NBZnQweVVkU2t3ZlEyeVFXTU12dGFnN1Y5YU1vOTlObHIrb2puR2ExcGh4?=
 =?utf-8?B?NTdpdmFGbjQzUkZSdWExYUhETmJvaEMrTVlzUXpQQmdoVzYyMUtuNWkzN3JK?=
 =?utf-8?B?OTlOOVZXbzdrQm92MUhhNitEWXFlYjhDdk9xMnZxOUxxM0JyZXhST0ZHMjVq?=
 =?utf-8?B?dytiVldYZ3crbTBBd3dZN0pZMnJaM3JjYmtTWDVYK0NkUzF6S0RPS0tPLzFQ?=
 =?utf-8?B?YXJWR0VKd3MrTTFvZFkxZG9sUlMyc3BxL3lEUEEzMk81ZU5nWVpFenFnR2FO?=
 =?utf-8?Q?SBKT3X9V7/w27xd6dCOVn7vEaGZzO8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkNkTkQ1akVzMGlEMmtUVUpuZGVnSERzdTJ2QUVVOWVyRnpKUGRjckUwRlRM?=
 =?utf-8?B?cHNEZ1RGYWNZaytkUzRESlRwSnlERmdOdnprVURTRnFCQjNIeXZWdDZZZzlP?=
 =?utf-8?B?RFNMSzdLTU1Lei9IVWl1M0pLQitvUGg1Y3EzTGtYU2xEU1ZrRTltQk80N1VH?=
 =?utf-8?B?dDAwMEVha2c0MUxPZFJUWEdDd0hDUHBidzdCK3pXV0xQMGs5MkxoRDByTnV6?=
 =?utf-8?B?RUpqVjR6dit6UW1QdCtuQWlDNGd4RGtkUDZ1bW10Y21qdlVYYnFycXVrVHRQ?=
 =?utf-8?B?UDh2SkloWW5OQWFCYlg2bDM1VXRWbDZwR2VZb0JiSnk1RzZqZitUaG5PVmlW?=
 =?utf-8?B?aWx3ZkNjRVcxNEp4YVlaa20zRHRGbmxDWFlkakpxbkM3eUg5ZGl3RjZIbVYz?=
 =?utf-8?B?NDhLN3lKZ0txSWZNV2ZGbDhFRFAxeWdZblNSUGQ2WDRzclRIMEY5WVFxblp2?=
 =?utf-8?B?bTFTL3dqeU1OeldjVDI5U0JNTVNHVGVmQkRnc2dtN1FiRUJFdHAra0NoTzVB?=
 =?utf-8?B?VEVNNVdJYUtBeXgydTdiRld3VmVnNlBQVVhSSmV5bHFxVW16Q0hmR2Z0aTZD?=
 =?utf-8?B?WDhxZzlFdFFtc3U2eU1COUcrdGRSZFRCcVZ1bEM2K0V0YWRVMGZWZDVwWEFF?=
 =?utf-8?B?VzVmb293T3BKRngwNUQ0VE9oL0FGKzEwa2NkUXpVV1N3UkhwanNybzFQaXcy?=
 =?utf-8?B?alBoSHpCT3pDazVkQWhYbDdnMHR5ZWR5SjlZUEp4N2xkaVI3djZ5M1ZOMElH?=
 =?utf-8?B?MmRRV2V3RndFaE0rYXhtUnhUQnd2bHhVLzl0Mm1BeG41YTVyZDlsTlJXTWRJ?=
 =?utf-8?B?d0NoSHc4cysvcWFPNUcycWJuU1JOY083cmJ0UGhjQnVQQ24yd3dlR29OSTJy?=
 =?utf-8?B?WGQ2V25rR1o2Y1lWTmdVaVd6aWJUcE5DeDUyemhIQjdjNGh1aDBtUDdnUTNV?=
 =?utf-8?B?MnNOS0V1RktuVnZxZFFlaFVFRDJpVlRNb2kyVWV2RURvVi9ka3M3QjlOcUpz?=
 =?utf-8?B?SFFRRHpMbEQyQUkrQ0xYVmxaQ1JWL0wzU0dCRmFLQU1HNTd4bDZIRUNMQlhV?=
 =?utf-8?B?clBKbFA1MDdCRnZoR1ZraDZ1dWdLRUZGekRyNXVsNGU3eDFvM1Q1NWFhZEh4?=
 =?utf-8?B?WHVzV1ZMYURVRkE0M2ZDcEJudjdVSGV1NUNzMEoxeHg0OXVKTWFHNlpMZjBX?=
 =?utf-8?B?NUU3c0s1bGZ4TkFZTnpSRkszY0NIWnRWNUtMNXFHbHR6U3oxaTNDdU56TVNW?=
 =?utf-8?B?OWRRVURUVHBtS092N3N4bFFRY1A2SkZieUZxWmdPek1kYThTTWF6cVQzUnlO?=
 =?utf-8?B?bDFHUGRWZ0FGUnpkZ0ROUTlHclM0TFAxS2lOTGNlcEhlMDNEdStGSi93ZUxl?=
 =?utf-8?B?NGlNNGlmdkI3dUQvUUJzK0pPTkJVeTZ5a2hBbWtrVTBmSFlmNTJMcTNDUk4x?=
 =?utf-8?B?NDVWRHU5NXJ2UklqNnpvN0dVMWg4S2w5YnVOMWtZSHRNbUhCZU5LaWh5QUFz?=
 =?utf-8?B?UWFlajA0cXQwVVhQRmhpK2VvcWtqOXhSYzV3eHA3S0ZwUC9QS2ZmeU11L2tI?=
 =?utf-8?B?VzYzRWdSSlpiSm5IMzNrNTVhcEtiQytrM0N0RGNPdjlJdTAzNGcrT1JlSzA1?=
 =?utf-8?B?ZXhaakxNVVExYVNab2Y1RGl5U0RScHd0TnJoYXVsR1BGOU56akM3aVBraUF4?=
 =?utf-8?B?V2ZLNFZyOG9JZVhUeTh1NEtrdHNxS1hvTE1pSnhseFg1OWVPc0NNZ2MyRy9G?=
 =?utf-8?B?R3JPZzMvVDVUckNvRjZuaDA3d1BZd2RJbTJLWVMvVjYwWWw3eWFlNm82MTBy?=
 =?utf-8?B?M2VXUEMyV3ViRXBIWHRrQVJRKy9sQkFOUDF5Ny8rNnRmdEtWanVmWlJqbzJS?=
 =?utf-8?B?UVZRL1RCMXRqVHphcjhseHB6cGhFV1BaOHpYN0ljSzM4VllXb25neEpLWUEz?=
 =?utf-8?B?c3VlS21EN2ltT1JEcisvK1BUQTM4K1FTT3B5elVZakJqWWtLQmN6d0FiY1dD?=
 =?utf-8?B?ME1abVhSWElReHd5Ky9KUkkzREtybi95aVlxd0VhZVZVN1NQb1JmbTl0Szhl?=
 =?utf-8?B?bmZoaHRKcmZIbW1NRjZnRTV3Z01qZWxaSVd3N3FzamhRdThxT0NjNXczUXM3?=
 =?utf-8?Q?KGbn29XP6xeERqQcoJGSnDo4r?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb97d70-ecdb-4ea5-7c73-08dd9e331ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 22:00:53.7533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFzPfSkFwf3UQhINN8QGKjUDGTRMXt/WSHCbnP+mugPwBveC8H6HmbHl3C9SKwdiQ90gf9XJJiyhxJtCmQM0Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-OriginatorOrg: intel.com

PiBPbmUgcXVlc3Rpb24gdGhvdWdoOiBXaGVyZSB3aWxsIHRoZSBQZXRlcidzIGZpeCBbMl0gZ28/
DQo+IFsyXSANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUxQYW9DajdGQnZfdmZE
cCs0dGdxbzRwOFQ3RW92X1lzK0NRUm9BWDZ1NDNhNE9URFFAbWFpbC5nbWFpbC5jb20vDQoNCkJh
YnUsDQoNCkknbGwgYmFja3BvcnQgaW50byBteSBwYXRjaGVzIGFuZCB0aGVuIHJlYmFzZSB0aGUg
d2hvbGUgYnJhbmNoLiAgSG9wZWZ1bGx5IHNob3VsZCBub3QgdGFrZSBsb25nLg0KDQotVG9ueQ0K
DQoNCg==
