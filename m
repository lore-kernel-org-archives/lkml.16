Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C971DE3AB;
	Tue, 27 May 2025 21:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382114; cv=fail; b=O+tRh3m1perUJRFTgWMC8ZF/MVhJt4/vIoU2j4OcE90ZE88bZRpXUa6d7w8FT2gKlQhGj3WBos9+qt0X3nYlPZ4Gp0rX9R/qE20tJPEe6kUdwiOiAcNAPPXrhbPTEJK6sNeAUUZpNhSa7LVgE5p9nVVPQ6aw28+lq1VgYHWxlFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382114; c=relaxed/simple;
	bh=o/anvEcMues33L9ZFSyMEmC/24edFo1h6ffMKlP7Rkw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RP4inwZOTRpYmKGro0GeRlUFcUnKL5loyr3/9XDdyFP/9zt/kE9yKPu9OVkajvwly59Ux2abX7TUaJ0arNAbA3woW9R1QberGx7z+3yUM9OxCoZ56jsnuQfzgwehwGf7LxbHdZLoqPoK6PvY454u9QF6Qhu7LPR2D+cEb6Fn86Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB0+i2xR; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB0+i2xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748382112; x=1779918112;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o/anvEcMues33L9ZFSyMEmC/24edFo1h6ffMKlP7Rkw=;
  b=TB0+i2xRhf4Gy+BJhtgPlQSzktodndAxw+eDL8V58onlxnypSkhiqnp8
   xNAXlfK90Nezcw9LBN4s32q6i+YyQ1khr3ez8DpK8H2Ma+PI0h8IK3fDO
   9FuMBUv3QWUe7W3fZcJQZ8GUnhfuGYZaDjMg253vuEsmK70PwZLhy+MfZ
   MdCUUhsvjW9H9dm0KJ0PLOPaZQvK6T8gXuh+gGIpA1qGcf+TYUT/rXmC9
   xvQn0bkIIwXuViakemJVVc0dkmJE4aneDLCwKWxYmKa4Fq5nVV/O8wTAy
   FUlYxTyW+AtvCQdhLxe/FgDDex1LAdUVPkQs6w/ryFCLxeiuvBCkdOUVZ
   Q==;
X-CSE-ConnectionGUID: ShXYW0daT2W0tQPDyZxfNA==
X-CSE-MsgGUID: 5Of+otlqRauwdYPH/sGdjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61020254"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="61020254"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:41:51 -0700
X-CSE-ConnectionGUID: 3q2cAUf/RU+b8WAxcs6tiA==
X-CSE-MsgGUID: T/tfsszKT2K7101oES2f/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="180204830"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:41:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 14:41:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 14:41:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 14:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E94EhN4ilGRNcDEpjcA/CWuCeHzXOXWbvc0uwnz5jgm1VVXH+GwFuapp4Q+cwD0MS5YLamrHn/unKXBbBZUcMPo+8TJsSQOluPH5YA5XD4hqTnNjApXShUAncTLqPrBcyCMqo7grw9KqJNaf1C+ds1Ud23PkzobHpKMXloE6hEbpAGWyB/20Kf8/WzeEil4Hb1mL6Hypulecq16etBUoJds+xuglR34Tfo67JcY6RXzGHRqtVej8aBUFyGzcH5O03KMqxDJbgOEIluL4LgpAKiRDFwlg+Jl2GMgSQ4UOzDXwTnOnPEmpJ56/wFEizsSWEZM+SZcB44XrSD1U5Vz8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/anvEcMues33L9ZFSyMEmC/24edFo1h6ffMKlP7Rkw=;
 b=BXzB2PzSwhMBqVxXmwKmcizSMylOaht/kt3nNkBYEtE492LqZRcPLSxv/DvcEqpSKRXZhhYj9aFaCV/YDeAZfFHlXEb5mtJo2b5BdqVtKEJWwN2xNPD7ESg05bk5d8naPBKKT6cCzfqjEXheQpO14fRpUg1XFaq9MKpGW58pj92sW69r2w4bNG02HYQtWcJsyASTESYPfhTcbsVk3A7wrUFjPLOsyX65UnSjNha5ThHMMT/IIcI2i+SjYAZR2ZMy2dkLRk5oz+iQOi2EIPY/+CoJpW4WPytCrVuFNlB7m+iJ3o5k9dv9bPjSko9f6tjS8Ok17szTSD9g1/nCce1PVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 21:41:48 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 21:41:48 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Peter Newman <peternewman@google.com>
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
Subject: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Topic: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Index: AQHbxexNa7lb+uglWUizC2qcUfje+LPfO3wAgAAEXRCABbSPBIACH3Jw
Date: Tue, 27 May 2025 21:41:48 +0000
Message-ID: <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
In-Reply-To: <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW4PR11MB6837:EE_
x-ms-office365-filtering-correlation-id: 985c465d-1318-4339-fe42-08dd9d6748aa
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q1pPc3BsSlBEN2tzODZSaC9Lc1hZY1k5RnpHcW9OTHJZM1dsZDlaQzVGS2xv?=
 =?utf-8?B?ZkZQcVJOcUVyY3V5MjNaMXRxUkhWYXJ3ZGVwNWc1ZDNuQTF4N0NRS1hNeXVS?=
 =?utf-8?B?MnVycTcwZmVYT2w2MmhKYndlNW16WFFnRC91R0lDb3h3czM5emVqVERqK0pj?=
 =?utf-8?B?bCtzMGNhWCtLWExhdkJjN2xXWForN3Q2bFZsMCtVRWs1OFNBTlN3U2locC9C?=
 =?utf-8?B?NjFPMXBWYVZCMXc4citPWmx2OHk4dHVvNmx4KzFzMmQ0eExaL0RMczNXeDl5?=
 =?utf-8?B?cjRMK2tQQ3Y1Z0tHWGZCU1c3emNMUmhlOUxwVXZ1cUcrMVlFTDA2bmQzaVR2?=
 =?utf-8?B?RmgxWmVjbUVVQWVMVVlWS0oyb3Q5WXpJMFpvS3ZiUmdhOWFUTTdaTTlGeFp5?=
 =?utf-8?B?aTBCZTNtcno0NlYzVjJyck5MTTZTcGdKcU1wNWJudEdqV3dHWWtrYXk5cHc0?=
 =?utf-8?B?NCtGQkRSU050bXJWNzhwNWpiSWkzSkJISDUzb1haaVZEcENvR1N3N0UzNnEy?=
 =?utf-8?B?MXo5aW1mV0kyZmhCTW5tRlBHZzVhbk1LcHBaSVEvRGRERzJ2YnlTbmJvWXN5?=
 =?utf-8?B?QXEvWlM3V0JjUHBhaEM3QWtTek9vN0pZK2JsZFFuNitDNTU3QXo5MGYzU0hY?=
 =?utf-8?B?d1VLdGxsbFlyN2EyWElYUlg5VFRsSnVoVmJ6NWtzY0hEWkdNaytBc0FENGh1?=
 =?utf-8?B?cUZqa3IvSEZ0bjZWL3dSSkdRZHBER3M2NWE4L3o2dWF6bDVqYXc4anRCTURl?=
 =?utf-8?B?VmNUQ2FIK2MyM29qNDJaYXk1ckdOeEpVai9PdW1xaUZtQ3BVWjRWYjBDSjc4?=
 =?utf-8?B?M3JHYzliQTBuRElhbVlqdjc2WmY3cW8xVWlDKzVVVnRqVlFJWmZQaDJvS2FH?=
 =?utf-8?B?VWlsMW90NVVocWlHMC9KMGVUT0diekJtaDhGTFFIYWVSaDRZM09HektwQVVC?=
 =?utf-8?B?UFNKV21BRzhKS3dmMHdBTTVMbi83bFV3Wnp0MEpvQXlXbU1LK0dGek1ueEdM?=
 =?utf-8?B?QmpSZXZWa0g0dFl5c05DKzdkR3ltUVd6ZUhUN3I4K3piclZQWnZuZGtnYzlI?=
 =?utf-8?B?enFoMk9zaHNvTVArZlBDK1JJR3dzYWloS3NiYWFLNFB1MHQySmRKVmpoMGw3?=
 =?utf-8?B?QmR3UitXVUYrajc3TStxaUI5ang5ZHFybVk5dVFjajUreXFOODRJd1diTGR3?=
 =?utf-8?B?RjJtQjhKZXdxcG1QMEZCNHpkK0JRM2x6TUU2SmFIbVYxVzdOWHN5Y292d004?=
 =?utf-8?B?S2o0b2w3R0tqcDFVdFJDLzEyZDEvN0hMNEx4ZjROR3k4TDQxTHNIT2RQN21n?=
 =?utf-8?B?cnBZVHdNZW9pU0dLd2NQWjdWSE96ODQxR3RjTW55OEo3VHZHa2JWbzFIQWZj?=
 =?utf-8?B?N2JBOHdvaGJwaEZkTnZGWVhuVWVzSGxsdHJEeEp4UU5zS0FJb0pndlRYVmJB?=
 =?utf-8?B?SjdDNGJScVdXay90andVUDlLWlIxeUF4TDJFNWdidTdHZ0kvaytVV1duQ2xH?=
 =?utf-8?B?d0pnb1F6cWhmZVNUNkpkN0pYMXExR2NjOHhjcEFnekNtOWUrSjhrZTlzMzBv?=
 =?utf-8?B?bG1wTENEdWVvaXNuWE4weU1FQ1ZBZTZGanJnMWg1Q1Y4c0toaUJSSG03R2Ri?=
 =?utf-8?B?ZURibFEzaVd2QUtZNE1obk1xYzVhT1hmNlVzNmdISG9TOW1JOEdlZEZQQ2FZ?=
 =?utf-8?B?SmFZVVdvcyttYXljYXVXdlhDNG5VNlBic1BWV2xOWTBzMGJtQm5kbXBKMDBH?=
 =?utf-8?B?V25zTHZyWlZGNjdaaUtNcy9KWDY4OC84dURzR3ExTTAyTmY5SHRPZ2JyWS9t?=
 =?utf-8?B?Y0pRc0FQNWkrK0FKYVZzajZ5ekE0U0pFK1duY0VjdmNVd0dMRWpjeWV1Um4x?=
 =?utf-8?B?QzA5TmhOR05icndqWTg1WjNINkhxcDZoaUlXbG5DakloQWd5bVZ5ZFlyWlJy?=
 =?utf-8?B?dnBjRVE0dld2bkhvaEhhMmsvajNtYUtSTnNUWUp0a2FzZ2JhdndzS1VGUy9S?=
 =?utf-8?B?YmkyWDRhcHFRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjAwMzJzOXpKUHFUaHZ2QThrZnZHUVB1Ny9MVWRxOTdMUDNjTHBqeml0VTlH?=
 =?utf-8?B?T2NBcDArL21qOUd4anNlU2UxQllWR1Z6Y25oeHJKYi9odTM1YWRNOFN4akd6?=
 =?utf-8?B?cW0zVGYrNzRidG5KWFBiSTgrMzE2OTNDUkc5Y3JyYnJUNkFhZ1JiZjFoV1dy?=
 =?utf-8?B?eHhKU1FwcFpTcUdIU2NFbVpTY3dadkVjQVVRSlZraEJKZTFScHlNMko5S2M1?=
 =?utf-8?B?Z2NFVEdxellPWWVjV0lRQkphckFTS2JBWjdaQlZodTdJVVFCRUt0TWhKVTg5?=
 =?utf-8?B?OTdJL0RjaG9HZ3B0UExVdjZ6VU53ZENiNDJqL0NtKzNqeUQ3ZlNhb1o4M2M2?=
 =?utf-8?B?c0JxTDRHaTh5cUx5bk5VTFEyLzdNVytKS0czZ1U5Znk2TnNrNHJuZEJ4ZzJi?=
 =?utf-8?B?N3lHcHJvNHUyREVIN3dQQVNvN1oxVUx3ZjlLVXRtNHhBSGVCSTJsWUFFcTN0?=
 =?utf-8?B?dU90N1BubVVIWlY2R25Pd2hOZEwvZER6MkRpVWVFQkVSbmtLQzFRSkZLY0Vu?=
 =?utf-8?B?SUVSOEpobVIzN0RDRFh5V1lkQUFWWGhkaERxY2l6d000YzYwaEthNmVpM0hO?=
 =?utf-8?B?K2VVaWtKTllxaSs4Rm9VU2ZNTlJFL3Z6dUVnNElaZ2VsV2dRdjJGT2tYbzlY?=
 =?utf-8?B?ZkFwTU9ySHovTWRFbFgrcG8xS0JTNElsNzNUS2I3STRYQzJQYndxRmFzRkdO?=
 =?utf-8?B?L3QxTXp6WDZZREpWZGZRL05oS3Z4UUpzUndRNDM5MkNYTkJMZXFUcU5UWlM1?=
 =?utf-8?B?czNwU0NUb2pnMGpoNUY2S1NDcXdJQmJKbUY0dFdRdDRqTmRsNS9CVUhJc0pJ?=
 =?utf-8?B?QzVxTTlvMGREaC9GRmg1OStrdjRZb3FsOGdjVUI3bU0wQTdQQTBFb3BBWWhw?=
 =?utf-8?B?RGU1S2JVNWdITDByZWE5SHRhbVR5V3BCQXpYK2J3SFBvV0ZkeHNOb1A1ZDJQ?=
 =?utf-8?B?NzZ6UlNqWnRtUytDT0w1OTNhTEQzV0M2eXM3dmlwY2cvK2libW5MYlJRRENY?=
 =?utf-8?B?Skhta3lHUi9VNkVzSmY3ZnZ2ZmlUK0R4RE1hS1VOanEvMUIrOGc3WjhvbXEr?=
 =?utf-8?B?VGlXWExxL1FvM1RiT2dSQzc3dDhQMzQxcUhVMGw5VjBFWlMwTTdaNkhmb2R5?=
 =?utf-8?B?a0xjdjlWY1FLcUlHSUkxWE5WY093ZGpRbUthQVJaS3Q4bUU2eXUxbk01Z3Mv?=
 =?utf-8?B?ZHdkSUtMWnpuS0l4SHAwamtGSTREekxuUG1tTm1OVkd6RndhQk9EQ0hXSXhZ?=
 =?utf-8?B?OVhTc1BjZ0RrRW94d3l2M0pWTDAySGMxcWVIcGN3R3RxMEpKZzNyeDNZbEFF?=
 =?utf-8?B?RU9yNWFEcGFBbmdHWHdlMTdDTXhENmZkMUhLQzdDTGxDQWluOXJYTHVGY2dI?=
 =?utf-8?B?bFZOT0pIeldGN3l4aEFWdWZqY3E4ekJVd044NVFPb3FDakRDd2gzOWhMQ3hC?=
 =?utf-8?B?UVdvcUVqZjhzbmVzaFVubUxqNW5UU00xaWNyREJrWXZFa1NMZGJJOFl2RFk0?=
 =?utf-8?B?UEJJVm9ZcXRBaWJsdndpUDNMZ3hrSnVadU9FaXhGcXFuMks3TWcxeEZjbE1B?=
 =?utf-8?B?UU54TmE3L0VUOW1MMERUcVZmc2tQWXdGcnhidDRsTG5zSXJ1ZmlDQVFzYU1z?=
 =?utf-8?B?MmMyNG1yeFFmVm5OcllZelI3VlE1UmpXZGQ1Zis5dEZBaGNHSGZ0M0plbGNQ?=
 =?utf-8?B?MGdmUmxxM1BFdUlNU29vTHR4UTJtVGNELzZ1WWZMZ1hrZkJ3M29BcTJVWE1G?=
 =?utf-8?B?cHk2MjFMMlBlQmx1NklKMXc5Y05nR1VwTnE5T1Rmc3d6VXhoS2J0SVUxZUZD?=
 =?utf-8?B?dXNzeEwrd3g5ZVdxVTh3WGExSXZ6WWFRSEJNamQ5S3ZTQkhiL3k1anlQcVBD?=
 =?utf-8?B?NmJneWUyc3dFY2NNejhUWVhrYThXcGVTVjRNcTlhYzNiZEQvbWFvT3YxUTEx?=
 =?utf-8?B?eGRveDNPNGRIS2NvMWtrQnJiYU1ON1pmRm5TWlF2L0xvMmdaSjBFd3BIOG4x?=
 =?utf-8?B?RUNYaHBtUHlNQVljWVhXZURocVlTcGlIbmJRdjA2M0NsbVRLRkdaZjZWNWJu?=
 =?utf-8?B?TStXcGJaVExEMHYrZ3p6SnRZRkQ2d2RyTzRiU04vQ2FHWmlRSCtvL1ZsNHdt?=
 =?utf-8?Q?Nm/+gTenSZIxkw7WXXUcpI8Cn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 985c465d-1318-4339-fe42-08dd9d6748aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 21:41:48.2805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AYicRAUDHF1PUA+cTGIjP0EsUNZIn9siH5quWIKIBMfFiz5gxJ3A6OjS1yx1l9bLS9hW3voJC6nRwGJSIH9NSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-OriginatorOrg: intel.com

DQo+IFRoYW5rcyBmb3IgYXBwbHlpbmcgbXkgc3VnZ2VzdGlvblsxXSBhYm91dCB0aGUgYXJyYXkg
ZW50cnkgc2l6ZXMsIGJ1dA0KPiB5b3UgbmVlZGVkIG9uZSBtb3JlIGRlcmVmZXJlbmNlOg0KDQo+
IC0gICAgICAgc2l6ZV90IHRzaXplID0gc2l6ZW9mKGh3X2RvbS0+YXJjaF9tYm1fc3RhdGVzWzBd
KTsNCj4gKyAgICAgICBzaXplX3QgdHNpemUgPSBzaXplb2YoKmh3X2RvbS0+YXJjaF9tYm1fc3Rh
dGVzWzBdKTsNCg0KPiAtICAgICAgIHNpemVfdCB0c2l6ZSA9IHNpemVvZihkLT5tYm1fc3RhdGVz
WzBdKTsNCj4gKyAgICAgICBzaXplX3QgdHNpemUgPSBzaXplb2YoKmQtPm1ibV9zdGF0ZXNbMF0p
Ow0KDQpJbmRlZWQgeWVzLiBUaGFua3MuDQoNCi1Ub255DQoNCg0K
