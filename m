Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57A2494C2;
	Thu, 22 May 2025 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956287; cv=fail; b=LYywiFkNlEhEp+DwpVesrwMcrazoOiYB71VC12tdfCv3Bd0Z02NDW1UNL1/vU0PcmFj3sWc7ro93W4q2f/uennfkMcz7j/8MdVmu7hQb+HZXu9p/ddxIjbH88XgdhDTMNzXxdygCKSpgTFjjNfV+zRmdLqVE+3VE6dVXkgZmBbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956287; c=relaxed/simple;
	bh=dGl4dIXPANCHDdFZd/JXkjE0qlwRgnw5luelIxN2jio=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ozv8WiUQ+KCPNZXcQf9CiOEM8WtjQJwmo7x7TKf4d0VafXcrUYW28VhwmBgmsHWHjrPZPP7w8XBJ+kCFPuK7SJYxWTh9CVw9mHew0vx3rPen5SYPNNHR7vsj3Bl5L7uOsSIjHoLwfT4tTaZhq5LoBqtxhgAF4m4wTuk7/Y7QiZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTGtfrPe; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTGtfrPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747956286; x=1779492286;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dGl4dIXPANCHDdFZd/JXkjE0qlwRgnw5luelIxN2jio=;
  b=CTGtfrPeeaNoFTVob46mTw1MTNY9CmeLxxMD8/zZWtMeCWbEpkZB9wWA
   Zg8z9937TxEz/DNLXusD2W+pVhje5JXWeoiMRGAOnQPz/6WoqJ8QN4iT6
   RL5vDpRdZZOEmUyUih7BKe0GKmYXB0JzKPbUfgD21XAhWY7ixYM+OsAZ4
   cUeDzEa4kRfsrivUwMAPiy7VmVmJGax1I+3gRDNjSgJe6QA/xFdot/7wH
   PYnFNaAo+yPcRSjAqZgNmOb2L11i6ZnAEsTukvPfP78BBoMVBhvGBrYFr
   rwI3WfOt3RHy2twS6gf9T1sEUz6Tkk4nmfe7rg9+3nsh/UIz6THNDRoG0
   w==;
X-CSE-ConnectionGUID: qT1mPWnNTdqsjpLhV5hdHw==
X-CSE-MsgGUID: Ibuz+DjOSPG6Be6WCN91Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52634695"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="52634695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:24:43 -0700
X-CSE-ConnectionGUID: rlhuIoBtQNuOfdlLL3xnzA==
X-CSE-MsgGUID: V+JbkxCdSKyCZdUcACA9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="146058871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:24:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 16:24:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 16:24:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 16:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN2WB1j/KyPrv+cUZprBwVQlLeOuuyNAB4gbn0c8CQSazxWBpWVyUNMzZHn3A/jXVVDKXe52hc9+TS1Ru3JElaVPgrGTmcpDQV9hPTWZzuTa1MfljaaMKpmab7LzLC7dX6zgXP1J7atO/uoTqUgCoMFGVqegA9UsNUA3z+3AfNgQ34X6D/Cz6Bz1NuQpnP2ZGHuyYJNOwfLchMtzyGfARGjXpEaM3vqw5lZPWHUkNH9l2ZZw7WX5H4C7KN2RckLYoQSD4iZ4SKmIv8At328da5H9uY/eax7o1uJOgQvBJPmC2K0ppI8D7G2ur60PF+ZOxXkLysuzoAvDM2ZXA0Daig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGl4dIXPANCHDdFZd/JXkjE0qlwRgnw5luelIxN2jio=;
 b=zWM31NSP4NU5NzG+aN/f+JzOzIefD+7PMPAZQ6MpBuORNwtjdEPp/mBCTSJs6VRFR28fSHwAqyrFHNTV47rx/Lxfmmm5p0cFL49VKBRlR7ndBEJs8NZkgiLQO3lCfQSEFrfvatBMh3u5R/dC+P60RMRHw+QEl/ZUiinVw5102NakxSjRkpo7999/6I4iSbDCllowAgumsh5yneVjMUrDyj0L4u461qbzLzO+dPmE2q2WM1TtQ/Gog01QtTg0VTPBFp/x05WHhlyozaCYT23nKgErbYr4wEo8lN1eYd3XKCE4a4wtQ9wMsNWzerhjPvW456KeOdcBCXCS+YTsC+iP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 23:24:39 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 23:24:39 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"ardb@kernel.org" <ardb@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "seanjc@google.com" <seanjc@google.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "Huang, Kai" <kai.huang@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "nikunj@amd.com" <nikunj@amd.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "Li, Xin3"
	<xin3.li@intel.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "Xiaojian.Du@amd.com"
	<Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
Thread-Topic: [PATCH v5 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
Thread-Index: AQHby1MkVwogaHZRp0C0V7JU9YRScrPfR2x/gAABQ8A=
Date: Thu, 22 May 2025 23:24:39 +0000
Message-ID: <SJ1PR11MB6083EE7F5311E20AB82FBCB1FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747943499.git.babu.moger@amd.com>
 <3946e8cfd3ce77028cdcf79a1ff5d5f70a714698.1747943499.git.babu.moger@amd.com>
 <aC-JAdEYyhshVIQA@agluck-desk3>
 <e768535e-444d-4fa8-bfe2-f8e8c0b1d4bc@amd.com>
In-Reply-To: <e768535e-444d-4fa8-bfe2-f8e8c0b1d4bc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MN2PR11MB4599:EE_
x-ms-office365-filtering-correlation-id: cf57290b-adf8-4ec9-6ad7-08dd9987d2e3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGt5S3lycFNwaFFqdEFOMSszeVQxWHNqcC9ZZTVmMnh2SWc0bDUvWXA0WWdQ?=
 =?utf-8?B?VGtCUmZZOVpzR2RGMEcrTEdlWkNPOGlqbWlPbG43dzAwNWpmVUhPemV0cGlC?=
 =?utf-8?B?cDZFT1duZ1dYLzZDakVZSkxOV1I3dE0remdIKzZycGVHNXJOZ3AzWjZUL3k5?=
 =?utf-8?B?UXp5N0U2YVVKWDFCYjc2bFlOakR5MS8rZi9VczdjU1pHUXgydVdnNUZ6RnBQ?=
 =?utf-8?B?WGt3TTlMVkdCOEFadlo0MC9KRVdnaTNUcXkxdS8wNkFMeFlmVFJMK3A4RG82?=
 =?utf-8?B?enFKNWIyTXNNdTNuaWlCSDVYekJ2NGpVL05FbStHenZURzA0UFN0SHhFSFMw?=
 =?utf-8?B?WDBYdjBKbVg2c1hWM3R6ZXhsOVhQZGU2dDNGbCtEUFNyZHRMK0x0QnhpUC9k?=
 =?utf-8?B?cjRUL3ZHUDFKS24yOGEyUjB2SWhyZWFzbjlyb0JGcWl5d050R04xdXBxREFN?=
 =?utf-8?B?eWFTOHppYmZROG5QSFdJV004SzVhd0tPaklDOGhuT2xTWXN1WkJpL0Ztbmxu?=
 =?utf-8?B?d00rbHVGeWFGcVFTRHNlengwanBwbnFnbEZqS2dvOHlBNWR5cXFCRUFZVnFK?=
 =?utf-8?B?ck1tL1NzWFpYd3pMZ2g0cDAyWG8rTG9jbFUwWTk3cGI5cmR6RkpYcStkNk5O?=
 =?utf-8?B?bUNQdXI3UWV5bmttOUNrMjJLOUtnUytJV2VueldHekQ0UEN5SGNFWDlLOWs2?=
 =?utf-8?B?dzZJb3pZLzZEYzN1TThxUy9RcnMzOXZpY0NIakRkeklvdiswWGlqY2t2UUdX?=
 =?utf-8?B?RzRIYVFhdzFQZVRuRDhXbndDQlFRb3FtQXUvL3lWVk5FNWVyS2ZDcW00SW4r?=
 =?utf-8?B?cnBhYTNxV3dXZk9mVGloOCtBL1BwLzhXOWpRdkF1Z3dGUlhzbnpRSFBkQjN2?=
 =?utf-8?B?L2xoa0lpSEphYTBQTXR5ZGR0WkFOOWpkZ25YbWVqOEdzOW1yemJOcDExZ2g4?=
 =?utf-8?B?LzJNUUxQa0pQVDJqdmVUa0taM1VRUXNZUkdoSnhsV2g4c2U4UDA4UUpQMmZ1?=
 =?utf-8?B?WkdZT2pTb2UvZkhkbko5T1F1c2R2aXlYZUZGL3FLb0hWYUFTWGc3R2NKMUNh?=
 =?utf-8?B?VzVmaXNIdGwrUVJ5SXBIODQxK3F0MCtieTJmenZkVEFLeXd2OWdrQllXVHdu?=
 =?utf-8?B?VUZ3cmkzeXpNbE5oc3JtYjgzQk9PQlpVZWh2YzZneHlpK1N3RTVMVkY4a3ZF?=
 =?utf-8?B?N1hPcXdVYmlzN1hIcFFNSWhqbXB2WlpPNi84U0JFQVJTc2FBaTREOTJ2VGVV?=
 =?utf-8?B?WWxMQ3ZCME9BVng5SEd5NnByZWJsdDZha05CWDJRem14S3crN0FCdFBGYWxP?=
 =?utf-8?B?ekNpRU5XeGFKb2pMZllaL0RNNHN3aTFvdU92MW9WajdjbEtpZ3JQSnFiaVJR?=
 =?utf-8?B?VVZOaVUxZzBjQUJEYng3K1FtbU56NTNqVi9xc0VxZjU0ays3R0U5aCs2Zzc5?=
 =?utf-8?B?ZDVHb0FUVkpwQ3VUQk5MZ1dBYlZWakdFTG1NQzZuT3dyb1dkRXloTFh1bHFn?=
 =?utf-8?B?dnAwUS9ha2c0K0hXQzlXT0d0TVlYcHlTcVlwUFZXYnkzd2pEUkhocmVmZWhu?=
 =?utf-8?B?T1M2QjkzVWsyZ1QvZWlZaXowZzc5SnVRSzlPNEd2aFhlTFJQT1RxZk1YS1Uy?=
 =?utf-8?B?cTArQ2U4cXRpT1c5anVuanh3RnFFditpU2RLQXBkZmkxampBOVVIZ1RjcVFs?=
 =?utf-8?B?QU1nQStnU21iSW1wTWFFR1QyZ1hCWmRpUTI4UTc1TW13TnVMOE1RcVFaT1ps?=
 =?utf-8?B?VkY5RUF3K21qL1VZOHpXeml6ejRkZmgyRlBRNnNJYkh4eHVFd3lxVUtxOE9Y?=
 =?utf-8?B?aktBem0rcWRnaWZqL0ZZM0pScGsyNlJIWG90MEh3V2duSG0zenpvY0YrQ0ZR?=
 =?utf-8?B?aU9aK21hYkdmVmpVSlFVc2F4bEU0akl4VnFUaGJEQWFDejExYTduVzJ0WDhn?=
 =?utf-8?B?dm9oQW5hOFJaSnFrU2ViaW8yREVDdnZRTEhSYXpIQThQbEN1YlVnZXgvbWla?=
 =?utf-8?B?L3JKVzNwYStRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVQ5RUdGdWdxcWpBYTZ2SkNwNFZMSW1aNEdkbDNvYnoxRW50U0RZb1Nwd0kz?=
 =?utf-8?B?Y3MrYnRxOW0zRGJWdnZ0SWQyUVhmWFk3NE9kUGhOdFBOZ0tSa3dZTHdqVlBG?=
 =?utf-8?B?dy9QVENYRktvUUF3SlhqS1oxUjJDUFZ0T250dXNPYk1ZbENYU0drRHFnZFBn?=
 =?utf-8?B?REJDTDdsZHRvUlh0MHoxWlo2YlRkOVF2MHlVdzJWQ2p1YTVVV2hiNTh3KzJI?=
 =?utf-8?B?aldKWXo4TE9oSmV5Z3ZtS1NkcFFYOTV2bDZrMzhITDJuOG5lRW1ORE5HYk5F?=
 =?utf-8?B?YXNUUmNpZmZxTnAzOUZIazl2NUJNMEZ4bzRuTVZ2a09DWCtmRm9FbUdkaDkx?=
 =?utf-8?B?QkFIOVA5cmdtaUNFcXZIZWZyZGJjL1FHYXJnMUltYjdUQjY0QzV5cDBDdzBp?=
 =?utf-8?B?V3VXUTNyY1BVR01rZUdJVWNVajVYVDJJUW93Zm9IRzREVUVmUThhcGtEQ0tm?=
 =?utf-8?B?TG0zRzhRdEIwVWY3NHhaNWFFUHo4RmZ4MkUvSDFuWkVhMUdMYTNWd1B2MUp1?=
 =?utf-8?B?WkVqblRLUWtmZ3E5OGRkWTdrSjAvS1pZUk5BUzV3dXFVREtObjdjU2IzUWJx?=
 =?utf-8?B?dzhJY1Q1anFoaEFhdU1YK3dRYTdvT3RZVHV6dFBJSTZzOUhCV3VsV3F5czFj?=
 =?utf-8?B?Tm9oY05zMHdraDhsMkMvTVEzb0tTWmlXVW9lVFVISFNhTG5mMzUyN0FSV1lK?=
 =?utf-8?B?QTMydlpRNGdrc0ZERXJDb3ZsdEVaeXl2czRWOUVKdElIRkFaR3Rsb25zcTZh?=
 =?utf-8?B?ZWhhWnBwL0FPMWRoVElocG5haE9jUEpiZ3RlVHdMbHVNaGJmRUE1TUptd2Vp?=
 =?utf-8?B?NlgrYjdQVDVKeFBTMW5VRGlTR2F5Y0pYRk1xN2FzVmJGMlRZc284NDRhNmZy?=
 =?utf-8?B?aVpZVC80TXJDSlZta0lDT2RWN3MyeWEyNzd0OHUvT0p2U2pFMFUxOEZaOWJy?=
 =?utf-8?B?Vm96aThNamNaSjNzdE9ub1N3VUFuVC9IdmMxc0p0RUZVUzlpKzdsRzZXYU45?=
 =?utf-8?B?MEY2eG42bVVGNEsrdWRxSXdyUmRzVXdvNEpTU0I5dXVrbFk3NnMvb2o5aFRy?=
 =?utf-8?B?cmdEOGhMRG5YaGtVQjgzOTB1TmdFZFlabHh2SmRyL1ZDeVh2M1hSNS8rdVpW?=
 =?utf-8?B?QWhMSE96aTZRZm55MXE0QnROdVZyM2VTeVM4U1lySUs0T0VuYWd1VTZGSXpI?=
 =?utf-8?B?Sm5vdXdDdVEyd2lUSEVyWWtROTg2aHY4TE1QYk9kWjlWVjVOZDZzYklteFVT?=
 =?utf-8?B?QnFwTHpIN3N2TGRlS0xISTZmMWNFWGdLYW9Sc0ZQQ0ZUMlN5OTdVVjAyMG5E?=
 =?utf-8?B?RXNsQmdrcHNPS2RteFNkeVluNmwzUDdweTRrci9oMWdUVndKNHQ3bFlqL05s?=
 =?utf-8?B?V0xacEg4UXo2d29HZHJzY3c2MmkydWlFaFFQWlQyT2NNbzkxKzQvcW5KaW04?=
 =?utf-8?B?TlBTVTNyOUg3WjBJS0FkbzRncnRJT2hRTmxXS3lXbEN2Q1lLcE9XaUpqRUE3?=
 =?utf-8?B?bkhjWnV6TzBFbVpsZGtWSjhLaGtVTlN4d3VyemlOaTNWUTVlenF4bEpDU0hT?=
 =?utf-8?B?NDBUWDVkUHpUM210aTBvRG1KL0J0U1puakQzWk5jN0pWckhBWGhmWXlJYlE4?=
 =?utf-8?B?K1ZhQnluSFZQallpSGRKamFmaHpQRzlTYThIYVd0Vit6blNoZllJYUhRVGFp?=
 =?utf-8?B?dXM0SEdyZjdIYjBvK0JselJmNmFCRzVuNHFUVnk3MFlwelNuYXpRMml3RTVJ?=
 =?utf-8?B?SmU5dWdxM0cwcjR2S0hIUWNKbEt6M3ZkSEoxZm1TK2VBL3Uxdjh0eTIyMFVu?=
 =?utf-8?B?OTRxL0tTSkd2TGhpU1MrNTFDWGFFOVhTV2ZzUXZweGwyMWU2bkl2WmZxSG5M?=
 =?utf-8?B?V2ZYUmlsRllzU3cxN1RLTVJiV0R5b0lRVTNuOGorV3pJdWRUOW1RUUhjdUdQ?=
 =?utf-8?B?b0llUkpITU9rdnZrVHg5UHpqRTFxZ0plQ01NQWNZWFJlSUEyTUJqU0tUUGNa?=
 =?utf-8?B?QjkwRUQzVE5YeWN0VmRYWGd5RFBaL045TlovZHV1TEZGS1d1elBsN2t2TVM0?=
 =?utf-8?B?eFF3b2szUGwxTDFzMDRkbzMvc0pwVE5ySmlQSWgvSjRBZVByaXc5eGh1b3ZU?=
 =?utf-8?Q?GyVcxuxshceX5Y3a4u2/qjl5e?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf57290b-adf8-4ec9-6ad7-08dd9987d2e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 23:24:39.3832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzEjhig8WKhm6JOfvR89zqhNS8xEcJH6ivA1yvAz6DCZqubXHSwX2xMw8M4U3bBHrTC4Srhtgf8h49eA75u/uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
X-OriginatorOrg: intel.com

PiBXaGlsZSBpdCdzIHRlY2huaWNhbGx5IHBvc3NpYmxlIHRvIGltcGxlbWVudCBhIHdvcmthcm91
bmQgZm9yIHRoaXMgDQo+IHNwZWNpYWwgY2FzZSwgaXQgd291bGQgYmUgYSBoYWNreSBzb2x1dGlv
bi4gSXQncyBsaWtlbHkgdW5uZWNlc3NhcnkgdG8gDQo+IGdvIGRvd24gdGhhdCBwYXRoLg0KDQpP
Sy4gSSBzZWUgdGhhdCByZXNjdHJsX2lvX2FsbG9jX3dyaXRlKCkgY2hlY2tzIHdoZXRoZXIgdGhl
cmUgaXMgYW4NCmlvX2FsbG9jX2Nsb3NpZCBhbmQgd2lsbCBwcmV2ZW50IGVuYWJsaW5nIG9mIHNk
Y2lhZS4gU28gaXQncyBhbGwgT0suDQoNCi1Ub255DQo=
