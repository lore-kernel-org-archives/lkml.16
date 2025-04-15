Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5319CD17;
	Tue, 15 Apr 2025 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745167; cv=fail; b=qTQ/59ocHMhPSZn8HOs6jV20e14YyLA/Fh1fv0ojnbvzEuKVnmz7+ScjRy2A1DLRlVSUpoyBJC5uNVxST3cQfSNG2ROHISPt5ua+SHCfbuyHVgX1AYGKobm8M9ghZWArPAikZZ16LERa1+/+ktt8GRM7CViNzhwhystXsqfRi54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745167; c=relaxed/simple;
	bh=fROaLc5Be89VL9lhDMrk1jDRyPWL2YEDVYVgKJZVYgk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PGLJrmVFqOYI70eLUKGIepuuIf8WNm2gIn36LcAvBbSbH7PtgeAuU3b/yFwK1tFtzUOLOyXmGf8VZ5Xs99Vy73fyDcmrebTGpXkjgoHXtJ5ORgUPoEqKpNgfmw+eKGuttybOz+iAUDJMBXzz1XM6lr3ELgb9vc3WKzY8/qUVAWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJf2Y6Nv; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJf2Y6Nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744745164; x=1776281164;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fROaLc5Be89VL9lhDMrk1jDRyPWL2YEDVYVgKJZVYgk=;
  b=PJf2Y6Nvij4Grxs7o9NbKdDN+JkEZ8ePjVx6b3sYhUrLv2PxsutQK0Bs
   dXisQGMzYTnBFqv4Owa6Ks0PZO+CCuX+uc8e55px1Vv8mk45ChQacLk3b
   7wg06E9JFxYMP4hzQlIK/+1obb3nXYV3DNnD0tUZ3WnKHLzbJqYEtohdX
   fOLaQfFVE3vL2r7QohoWWoFdkL/d/lB6KSld4cD8ANFcdYpJkYGQDPnJe
   MUrMsGg3y/6CKeSCxF0EZIqRJi7ytDeY4iS5urAzQpAyZBwOIahokY/l2
   3rSUIAnxufUAZ4twiSXpPg8zbTIrI4oM1EiSYS+/Dkab/w02kg2q12lvQ
   g==;
X-CSE-ConnectionGUID: hOXZ/PyNSf6N36y6kUwJZg==
X-CSE-MsgGUID: VXPu2bjDSimGJ6lyBERanQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50072070"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="50072070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 12:26:03 -0700
X-CSE-ConnectionGUID: z7knIANCQ6i9hA7scbKl7g==
X-CSE-MsgGUID: 8jFTQ9ZZRqGD/ebQnzbmXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="135001096"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 12:26:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 12:26:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 12:26:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 12:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iASutWoVmvFCX8tDon5aEK5E3FApxCc9toCCSMLlbznp7GA0v4aVcYVkKfhUKHpP+JIATpYct2SlcPMQCfTLKv23iB1Iye+vf3V7YR4namFnAB+K/CveE5BhK9Y2uIN/w16XgSaghwiCu5FeE9lQ0TYo8Hn7guSZzslX1vN1DdcfFwZsMVu/jNdOD1FdCntdYnWvoYhaNNPCVsjzHI42UGfPEAK8KWAbGjUR/dxIoGXhY+vThyY7p59CMl0SZy7L9kyn7ziUlSekVbjxh+wrypNEd3dx1OQZxOa5bUnmfArvUSkXvUBYSUgdiBGYSj2PcTvpz4mwS3xm5yDvu3WdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fROaLc5Be89VL9lhDMrk1jDRyPWL2YEDVYVgKJZVYgk=;
 b=pCAsOtQkMELAK87H+BSVNtnhsfHkJxpG1EgMuXS3OhWqPigET7c04NFRPLMUg8/JWv7H2b6gGaQF9SZH8+NU+oOtsToq+Rzka32Wdq1/gqWke9M+bnYBH2z3umH3SucuHDqPe522P2nzKuxa7iJUjleZcYuVj04dJCZ8te2/Mk92/DCwo5p/wb2aW5WoEOxOY63I7RWt8p46t2xKDqS7VgJ63ZwR1IH+i5Fi/r/N9tsfV+tGpSINPAcqeiAZEw1J6vIZm9TqkxW24F5/g1Xtu4FBRH9ACKNjVlpkZRWVDg7lU73Izy2gMzaNVSpPRE0l79jTF6omif1rz41UJ9UTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.34; Tue, 15 Apr 2025 19:25:58 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec%6]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 19:25:58 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "babu.moger@amd.com" <babu.moger@amd.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "peternewman@google.com"
	<peternewman@google.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
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
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>
Subject: RE: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
Thread-Topic: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
Thread-Index: AQHbpPeN3FmKEG7OtEWl2I+mztyZu7OfC9EAgAYYEgCAAAa5QA==
Date: Tue, 15 Apr 2025 19:25:58 +0000
Message-ID: <DS7PR11MB60771546582C59A917647239FCB22@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
 <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
In-Reply-To: <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6077:EE_|DM4PR11MB7255:EE_
x-ms-office365-filtering-correlation-id: b5a67344-0215-4dad-a0c1-08dd7c535974
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2NhRW5ZL3hJbXdhQ1ZpNUZuSEx2eVIyZURHdzQ1ZFJtVXRzaTRxTE5vUm5J?=
 =?utf-8?B?RnFrTFFkYUVMNS9mU3VjellHcDVsSUthK2lkTlN2cUJoYVpraWtycWpYT0F2?=
 =?utf-8?B?bHVQOTlxd1hNUWJEdjd2SlY4aUpWUzEwZjlpZzRRaHpLSmFWWmJxOGdTK0Ro?=
 =?utf-8?B?YlBHdW1JQmdHbHl1dHdOekhSSXZRdVhLelJjaTcwd2x0WnpvMGVpbHZlYkRP?=
 =?utf-8?B?alBTVkgxVzRIV1VPcE5UeXBBeTNzWWRPYU93RXRRbjQxRVJTY2VrbURyY3Q4?=
 =?utf-8?B?cE1pdlhlQ2lZcGExVS9ncVVTblQ0dFRuVlVnUWViSnpXU29XblVFREtsazdW?=
 =?utf-8?B?eUhyYm4xVHJyT2ZnaDFHbldVaVJURTE5MURiNkI1UFlpeXFBU2ZScVZqQmpN?=
 =?utf-8?B?b1lLcEVHejU4cTlNSXF0M3NqdnBJcFQ2dTQ1bUhlNzNCdHZGU2VUVGpublp4?=
 =?utf-8?B?NkprSWRmU1BDSjd6M3F1VDdsOG94UTBHd0ZYU3NDNGVkK1hYakpXQ255b1JI?=
 =?utf-8?B?NWtobDZxU1F2aDMwbkQ0V0FBU0dxYWkwZXN3RGdXaDlTWUhVZzBxQzZZRWJI?=
 =?utf-8?B?T044VDJsU2NlOWNKOWdnN2M0YmYvV3czM1dDelJuMGhWZDNOeVNVQjhNTjlV?=
 =?utf-8?B?Tmh6d29mb0t5Q0w4NGIrakNxQkxjdHRnYjdtOWcyWENEbTJQTy80ZEwxNU14?=
 =?utf-8?B?Si9IR2xoVVJlTy96T3BVeVVyQjdlSVcrL0RuZzJGaVBMbkp5L3ZBdGJiR2cx?=
 =?utf-8?B?amFPWVdxcmIxY280bWJrSjVrVDRxeEhKQUpmNDJoaWN4dWd6RTJZSmVpMi9K?=
 =?utf-8?B?ZFh6S2hYanBVWkttZ1JtRmgyK0FQNzVVN0g1QW9scWVCaEdaNmpXQSswMHF4?=
 =?utf-8?B?VGpwVUdDTHJPdWdWYXhxbnQ5NVNPdVYvT1ZrKzJkVDBOZG1mUk1acFJvN0Fi?=
 =?utf-8?B?ZzRuaEpYT0k4TDRKTHFuNXd2blJEYW50UnZ0eGlCSEVyQ0kyMEh6UTZSTzJL?=
 =?utf-8?B?ZWYxTVE1TjlnZnlaRzEyNk9iaDlsZTRncHAzUHY4bDBHMGpIYUE4SlI5aVpX?=
 =?utf-8?B?SVkydDFUMDErK0JjUllBeXFLakFKZURJRjFuTldlOGFOUnNWaHY1UEF6ZFA1?=
 =?utf-8?B?RGk5N0picTBUMTYxNVY1SXNSdjlqZFQ5T3FOUEtXVCtyU1M5UjZ5TXNtUVJk?=
 =?utf-8?B?eXEzUUdsSXhTRWtja2xFQXdVdEh1dXFPYXBUMTNlWXdyUnkxcnp4UGZpdERY?=
 =?utf-8?B?TW5ZcjUvOGRkaWlRclJYT241UE9qNzhsZk9Fa2dqTTVkbUxxZFJFTGVKVWV2?=
 =?utf-8?B?Y2Jtc2ZqT1RBTDRpeTdKcGVOVWRQTkxpQWhmZWMzeENjZmR6Yi84QUw5WTIw?=
 =?utf-8?B?YXZ6dnR4U0JWM3A3RU5uVGpHWjF2V2FhYytjT3U1SlhOc2MxdldGSiswSjds?=
 =?utf-8?B?MTFTQ0NzTmZvVGt0ckxqM3pxYWdaZTN1RGtqK21ueERCN2RDTkhwdEdJWEc3?=
 =?utf-8?B?ZGpnOUxvalQxNGMvbkN1OGFGZzVIZFJzb01Ja1RMOHVDQW5xVGtuc3RXZkJQ?=
 =?utf-8?B?amRETDBpemNtNldyS1VVQkptUGhVblBwWVF0dVNKZUJGb0poczk5OE92cHVT?=
 =?utf-8?B?Ly9jOGVUekZvVURNR0YzTnVtRWp2SEZ2Mm9EYXRiVnFWM2wvYXFOeVUxc2Rx?=
 =?utf-8?B?dGx1ckVrRWdGbGZML3djc3BJTHVXZC9jR3lXdXR4NWhQUTZxRGZXQW9LYjZZ?=
 =?utf-8?B?OFZzSUxPQjIzZ2ZTL0hNWUgwdjNFUTM3dHFPbzN4L3Jub1ZuemdPVERkS2dz?=
 =?utf-8?B?cTI5UUx1NjEzWGdHY1Q5RGJ3RnRCWGJTY09ZampCZWdwMndHTkR6UWE2Tkhn?=
 =?utf-8?B?THNaSG9OWDdYb044ZDVlQjQwSTVtWUtLQXNaV1BVanNBNThhZUYxeExVem5M?=
 =?utf-8?B?Q3lxbmViVXRIbm5rM2xzbFRNZWIrRWRvQU1JcGIrSTkydU1VTC9Bek9kZ3hN?=
 =?utf-8?B?c3kzNElKZUpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXMxaExyZldtMHVCZ0VLZEQ5SVl0YmNvZGhaOWsxc2pEKzdkMmM1SCtEOStF?=
 =?utf-8?B?SzRVeUhrQitIWWdlOGl3dE4rdXRIck1QU01BWm5Sc01QOTEySVB3emcyUml2?=
 =?utf-8?B?WlhjcS9zaXphUkUrS2xpTUdEQ3VFRjd0NzdDSFhGZTVwelMzVDJjalhCelp5?=
 =?utf-8?B?N3JvTkpreTNxL1B0R283K2xuN0ZlemVNa2QwUlZjaHZVTTR2cG91bmVZTGNo?=
 =?utf-8?B?M3dsWjVlTGo5VmFVSFY4bER1RThtOC9FZ01kUUQ5ZHdOaUtPRlJOMGh4Kys2?=
 =?utf-8?B?cjZsbHdsQXhOeFBOYzRiYXUyN1IwVjFmVk5tdUVGTkIwd00zL1VFU2RkVndu?=
 =?utf-8?B?d3E1dDNMUUJ3WnNTN2ttUldGNFY5OGsvUGRxRzFQZDZ6Wk9DUFI3SVZUeHJM?=
 =?utf-8?B?Nk94VkpaS2UrL3EyZkxwRm05dzBneC9rNWswaG1kMDhhZU00K0N6MXFUKzli?=
 =?utf-8?B?K3pESzVrRnAyYkFrNFlBZjJSa0lmQlcxYzJYcVBCQVQxWjVmckQ3cHpkRm4r?=
 =?utf-8?B?amNuMkNlNmV2YkVPUmRwOFBaNmxOaUFERlRKNUkveW5XMGE4ZEZjajFrQjMv?=
 =?utf-8?B?aUJTQWI1SjVXOENyTXhCTlpIbTJDNHRJd3BWNmtjdksweW9haENHUXZiZnBS?=
 =?utf-8?B?OUZvTmZMSEZxVThQSTFSR200ZnE3VC9wcWtKY05QbG1tVGNhbWQrWk5EbWMv?=
 =?utf-8?B?MXZvbVowMHNXbmNPSjM1YWRHQU50WmcvSmRORmtxN0ZMRTRKWlFELzNZTFMw?=
 =?utf-8?B?NllMajEwKzBPNXpxNFJ6Z1YxUFg2QlAyZC91K0s0RmRmNzBndExlMDlsWXdn?=
 =?utf-8?B?OWRxb0Rhc01ib0lkeDVGK0QxM29hY20yLy90WVRadHZFZi9BK21XUVV5ZFd1?=
 =?utf-8?B?Y09RRzc2UCt6MWNKODBaZ1FRa0ljVXYydmZDUE5JSTFKU1ZtcHlOdTliNDFE?=
 =?utf-8?B?Q2ZLaUNnYWJROE5GdjRTU1JrYU1PcGZFdDJucUtHZ3ZKMUxLcWhJeHdIM1RM?=
 =?utf-8?B?NnczOXFPb3RSckhuYzV1WWFYdGExNCtKTXJ1bkJoT1BMWjY0STVUdCsyM0ow?=
 =?utf-8?B?R1BiNEJHM2J6eXJYaVZMRWpmT1VUbzFBZzdiNDlObTRtMTFreXB4NWxWUHY3?=
 =?utf-8?B?WHE1VU0wekVESHdaL2pTUEpVT3Q4WkpSMEdLVTNhcEdqQnhxSm5YbW01RWI0?=
 =?utf-8?B?MTd6R2IreE1CZW5OSm50UER3NDFWR1QvSTdaOUlQYWk2blZLa05MRkFjMTRQ?=
 =?utf-8?B?Nnc2VWdDamg4Y2IzL3hvdlUwbldSVFh2ZDh3WnlsM0tvaHNZOEdUUDN0N2RB?=
 =?utf-8?B?R0gxRFFtRmdOMUJXMUVmL3BWVHRCemdRYzJ6YnErOEhDS01nNDgwaGhTb2R0?=
 =?utf-8?B?eSsxcWVRRnVNa2dFN3ZxaW5WYWFYemJ3YUs2L1RKUFhzKzYva3F3OXhBa20z?=
 =?utf-8?B?eDE0NTd0QmdBdCtwQ29yZTNuTk1hTW5acy9hTmE2ZUZmSWw0M3MwS2lGQjV1?=
 =?utf-8?B?WWhFSWc2cXRGbnYzc3M5NHFEbzZua1gwOXBKLzBNclF3WTcyQmNnc3pYQitI?=
 =?utf-8?B?N2F3a3dtZTR5WmlEODU4YlQ5Qm9XSWlubHBKTVh5Q1o1TDF5OUYwbVBGazY4?=
 =?utf-8?B?ZitnUFF0dlFTZjY5QkJJdGEwVU1WdnhidTNQblpiVS94Y1g1bEhJYWxPZnJM?=
 =?utf-8?B?empwdlN2UU9wVFN6bnMvUWp1SU9Sc0lCQU5QU1RFT3ZyZ2tzcDIyQWQyU0Jj?=
 =?utf-8?B?d2NHcUFvLy80aVMxSG43YW83VGN4cFRuMHJtQlorakRITXRHNGJiUlE2SWt3?=
 =?utf-8?B?N0sra0hVZkpNLzViVHhzdGFHMnpHQmFBSE5SMXorS091MTJZMkVUZG5ZUXJv?=
 =?utf-8?B?NkZHaG1QZEVTbXkrbHZ4ckYyUEFTUDVlK3VIdit5eUNrcUhoTHpMOTFlTnRZ?=
 =?utf-8?B?WG1IY01kemlMcCtpL1lKcG5veFJOMHlNK1RnVW5kNTJobVVKc3QvVEFYY0Vi?=
 =?utf-8?B?elA2RFEvbG1xWnZjS2svbjhhY1FHWGdxb25LSzlvUy9MenNuYkYwZjRodU5G?=
 =?utf-8?B?dTJxVDJTYzZzUHM2ZzQ5TXkycXpDL212N3JDRzZ4eXJ2d2ZlcVMxSEdJdCtK?=
 =?utf-8?Q?TDdvYNwRXEQpvaSBsKr+eEQB8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a67344-0215-4dad-a0c1-08dd7c535974
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 19:25:58.1238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7T9wGiNevlTXQGbdSTGPsTpZqkFkKgVGH89lZynP9m0MJxm67iRkR9EH3CUxG6jAaYR29OWECe3Qw6BZrvPFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
X-OriginatorOrg: intel.com

PiBCeSBkZWZhdWx0LCBlYWNoIHJlc2N0cmwgZ3JvdXAgc3VwcG9ydHMgdHdvIE1CTSBldmVudHM6
IG1ibV90b3RhbF9ieXRlcw0KPiBhbmQgbWJtX2xvY2FsX2J5dGVzLiBUaGVzZSByZXByZXNlbnQg
dG90YWwgYW5kIGxvY2FsIG1lbW9yeSBiYW5kd2lkdGgNCj4gbW9uaXRvcmluZywgcmVzcGVjdGl2
ZWx5LiBFYWNoIGV2ZW50IGNvcnJlc3BvbmRzIHRvIGEgc3BlY2lmaWMgTUJNDQo+IGNvbmZpZ3Vy
YXRpb24uIFVzZSB0aGVzZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb25zIHRvIHNldCB1cCB0aGUgY291
bnRlcnMNCj4gZHVyaW5nIG1vdW50LiBBbGxvdyB1c2VycyB0byBtb2RpZnkgdGhlIGNvbmZpZ3Vy
YXRpb25zIGFzIG5lZWRlZCBhZnRlcg0KPiBpbml0aWFsaXphdGlvbi4NCg0KSSB0aGluayBhbiB1
cGRhdGUgdG8gdGhpcyBwYXJ0IG9mIHRoZSByZXNjdHJsLnJzdCBkb2N1bWVudGF0aW9uIGlzIHNv
bWV3aGF0DQpvdmVyZHVlOg0KDQogICAgICAgIEluIGEgTU9OIGdyb3VwIHRoZXNlIGZpbGVzIHBy
b3ZpZGUgYSByZWFkIG91dCBvZiB0aGUgY3VycmVudA0KICAgICAgICB2YWx1ZSBvZiB0aGUgZXZl
bnQgZm9yIGFsbCB0YXNrcyBpbiB0aGUgZ3JvdXAuIEluIENUUkxfTU9OIGdyb3Vwcw0KICAgICAg
ICB0aGVzZSBmaWxlcyBwcm92aWRlIHRoZSBzdW0gZm9yIGFsbCB0YXNrcyBpbiB0aGUgQ1RSTF9N
T04gZ3JvdXANCiAgICAgICAgYW5kIGFsbCB0YXNrcyBpbiBNT04gZ3JvdXBzLiBQbGVhc2Ugc2Vl
IGV4YW1wbGUgc2VjdGlvbiBmb3IgbW9yZQ0KICAgICAgICBkZXRhaWxzIG9uIHVzYWdlLg0KDQpU
aGUgc2VudGVuY2UgYWJvdXQgQ1RSTF9NT04gZ3JvdXBzIHByb3ZpZGluZyB0aGUgc3VtIGZvciBh
bGwgdGFza3MNCmluIHRoZSBjaGlsZCBNT04gZ3JvdXBzIGlzIG9ubHkgdHJ1ZSBpZiBjb3VudGVy
cyBhcmUgYXNzaWduZWQgdG8gYWxsIG9mDQp0aG9zZSBNT04gZ3JvdXBzLiBXaGF0IG1vbl9ldmVu
dF9jb3VudCgpIGFjdHVhbGx5IGRvZXMgaXMgdG8NCnJldHVybiBzdWNjZXNzIGlmIGFueSBvZiB0
aGUgQ1RSTF9NT04gb3IgY2hpbGQgTU9OIGdyb3VwcyBzdWNjZWVkZWQNCndpdGggdGhlIGNvdW50
IGJlaW5nIHRoZSBzdW0gb2YgYWxsIHRoZSBzdWNjZXNzZXMuDQoNCi1Ub255DQo=
