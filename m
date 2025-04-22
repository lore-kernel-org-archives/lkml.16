Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E4C28382
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745295045; cv=fail; b=rod+xsvO6y30+fefeMzPwKRV010Bpi/3oILc5C33anZkSBETJD2c+aJ0e7ZplKSZhnnahMmtdxU60B691MmXauSqUM3GV3zrG5G9ZzPTSZt4rvhgrUdyOMVorVx+Vd6N8gvdDPVr2hrsUE6mJCMiH+7OWiwt4v/pGJglYCsS6Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745295045; c=relaxed/simple;
	bh=SE4blcybAKPvGkVDrTtiaP4DR2gmvWgZzda+L2qaC68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SP938u7la1E065te/B2QiLyuRJSyLdxHgBwpPW9qJZ8CM7T0nvHw8iNs0pp6K9zsDSbUQlaAD0pYFkgAWUhCy6YTPOsOQKxIYRyAQVE7ewhD+KBmPawRjGJubKIx+QKYYXXSzs2XZaLXyqi6QP4beV2cS5hhqhEq3M4h/W6ImaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THgW/Cte; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THgW/Cte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745295044; x=1776831044;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SE4blcybAKPvGkVDrTtiaP4DR2gmvWgZzda+L2qaC68=;
  b=THgW/CteYRimAKXDAUHcxBjIHAAQBa/ojE45vvjoKkOikZGIHWgwR7s7
   6NleDL0C5vh/iXq4/S1XzK0MBsRtQIJCC/YgXY4FNCkPJFERPsEmOlorL
   ru4p8Z/fwU1NMeIvR0CFuDbopiMyt8c69Jc0Cr1IooOs92qOJ1jXV+YCb
   rzbauh1ZE6CYydJl8ASUOVTRu6W+Zl/bE7xJGb9rTn+IOWg9Om/fvu9Bb
   Tbura7yuc7yB2/Tmti8T6mxsSV0V577gdPO6FMg6NyNEqrutlpR1KijuX
   HVB2mZdMnsK5bKscZIyZR7UPqOORN5O/wtuUFpGo30yV76N+PivC2LIIh
   Q==;
X-CSE-ConnectionGUID: JT5rgHdKSECFH+thI+1awg==
X-CSE-MsgGUID: XEMwRlzJQfe4yQxeuPVIOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46546669"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="46546669"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 21:10:42 -0700
X-CSE-ConnectionGUID: fro9vWB2TEipfwh6743pzA==
X-CSE-MsgGUID: RZr/zmg/TLCbWprtNA5R5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="132442021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 21:10:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 21:10:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 21:10:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 21:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPds3fhPNngvgl1euSEYRxr+s0p6ELdxKAf15bQlJTw10OM++dXmAzbgZmd+zihvijZdFleFnjGvUONNMU+bzk4YTVIgnitqKDehl9vCjxksUgpcyCVomiHgQi35r6seUhQcxFHJswn2c6i75Ll1QZQF+8O2+qHzhUZ+rL6bh3Q17Xhb3sxu7grR2NbyZn8OVZDxjPcotnle+gcYxnozGQ56TQaU6p2OLYKa8dAzEc6JjskvLqhtWzxnGz/iteuiQBx3KbE4aCYMJ/N07Efq6JuxMwf/1ZIZFeTkc6EaIPDr9r7gpOLEqhwXg35ZkKcvHQSFpZ+6DkpPmYR0+fsUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE4blcybAKPvGkVDrTtiaP4DR2gmvWgZzda+L2qaC68=;
 b=kSI8a4T4s/7afP3wITU9zqwdkF/Xzp8wE+LZdyyGcjhEkuEpNehCLV5JK/tcDVim+1b1Wx83J1z2BRjN63wjJS0THBIS1YSHEItgWATPZkjXN61BCHeZpuq5BQQX3nF0Gq5LpnERzTu1FMTI/E0mHG0b7eVBFFMyGUlZX0Yi+Falvw3kKOXoD74kBaaTzHdZImXyczb9yShnRDYn/Pf19XC5no6gLNGMCTeRAxObRslggkN+7CH3cp1+q/PkFexsb/xK6h7Z/J72kJOqC/QaL9ht/VCqbYf5E0pugCX54XhTvN1+iQblDnFMpctuGREuGrRzlRJw1PnAU9eoi/zttQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by DM3PPFE8B1F622C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 04:10:12 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 04:10:12 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"bp@alien8.de" <bp@alien8.de>
CC: "seanjc@google.com" <seanjc@google.com>, "x86@kernel.org"
	<x86@kernel.org>, "sagis@google.com" <sagis@google.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "Chatre, Reinette" <reinette.chatre@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Topic: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Index: AQHbryPM8SZ3YDTvhU2BZq6F7+XuF7OoJAYAgAAIsoCAAAnFgIAG5BkA
Date: Tue, 22 Apr 2025 04:10:11 +0000
Message-ID: <13bc2339182107848b72976f970c824f4902240d.camel@intel.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
	 <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
	 <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
	 <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
In-Reply-To: <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|DM3PPFE8B1F622C:EE_
x-ms-office365-filtering-correlation-id: d0958198-3dd8-40fd-c2ee-08dd815393e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bmdWaG96U05RQSt1ZExiZXl0YlZLY0cwNFRLSW9SMzl2U3Z0L2F1RzRDQXhO?=
 =?utf-8?B?WWVJRmtHbkt4eitTR2c5bjhWTC9WUkk5V2MrR2lWb1YvZFYyTzVENmdBZjFm?=
 =?utf-8?B?My9OZ3J6M0RwUVZPUHFYRDg1T2l0SVVRM09ndHpOUkdTTldaUmZxUXNkbzJr?=
 =?utf-8?B?dWF4UjhHdlFxY08ra2RQSVBoTlhMTUkzNlVUVndETTJyTVpreWUzd1I5NmEw?=
 =?utf-8?B?VFpzLzJBSGhVOGtKUm9UbER2M3JFZzEyVnRqWkdpZkNDTDhmVEZhQTZCaG94?=
 =?utf-8?B?QmtxMVRwMVphRDFNYmE2THBsbFZIQWFpR3hsd05wb00wSFI0dTdTQ1FmR1VB?=
 =?utf-8?B?b2ZMZGZjQ2xIbCtXcDFjTHp0QWN4SVE0L1RvV2c2QnkrZHpwZ3poV3N1aDlE?=
 =?utf-8?B?cDN0VEdzTHVDWmh4L1R1bjVPWXlyaUVSRTNteExhQmlrMFdCcHFpSE5ycDlX?=
 =?utf-8?B?S2hCNFg2N3VkOTRmdW5idVZxYVZyazhnbVhub0llUFpkVy80aHN2aDZuOHBJ?=
 =?utf-8?B?U0xxTkJRZk5hbDExNndyTVRVbURhQXFwbDRLblYzK1labTNkZExZUVV6MlFk?=
 =?utf-8?B?SzQ5UzNReXplSUVIKzNhRVg5Y0JHbEtLT3kwSWJqOGEvQkZDblRNQ2Y1dkdB?=
 =?utf-8?B?MWc4ZEFQRmpQUmRTSWxMUklYb01mcVUyUklWZC9QMnpDaGlVN2ErNHpLQnVi?=
 =?utf-8?B?eTl4cWdsNG9MNDZ2M1BnQ1RVaEo1bWMxU0JkOWgvOCtXdG9zMHJYNFN1Z3BH?=
 =?utf-8?B?V21hcFVRODdRMDZCYTdBWlVBUlBRLzNEU3g5Vk1QejBFMGVNdkI3N1lWeWp4?=
 =?utf-8?B?N09SQUxERWpDYkpwM0JUTTdrckdRS2YwVVoxSjVJaVpOdGlsWXRWL2JuaERK?=
 =?utf-8?B?SEtPZWptMm9OMTBWYWVpNERTRzNUSG1oV2s0dy81TzE5TzFsSmRHZ24wR1F2?=
 =?utf-8?B?eDRnbTdjbFprY21CbCttVnNiOTJ2Ui9TeklkZEcwa2M5b2F4ZURHSHJnTnFT?=
 =?utf-8?B?QVZkUVNtc3RkQjBkeVR1RnBscE1iQXR4amxEcUdBck9UZUFGdjl3NjJRMTly?=
 =?utf-8?B?VkRtalZnZ01UTlBHT0NQMTQ2aUw2RXBKSlRMWmovdi9udkJVSEZrc0dpWUNl?=
 =?utf-8?B?cFFtajYzODRuVlIxWXc5b0J0Nm4wRGo0NEpzK3R1cHdPN3pNdmZ3cHIyTHhU?=
 =?utf-8?B?OXNZZVphRTZYMHVqSmlOSkhIM2EvbThkd3hKakQ5QllXOUIwSlVGM2MwNUpV?=
 =?utf-8?B?Q1dqWXBmdVkwaG1MVW1iU1JqMS9BTE9XOVdLdmRSMTdxK0tPV0lvTUViNy91?=
 =?utf-8?B?UnlRVW8wbEt0OEdra2R5OUhwamUxbmZud3ZFZ0tWLzVTOUo3UzJSbEQyc2tl?=
 =?utf-8?B?TTZPUmxKQ2UvYWhWZkRkbzhuMUhRMktUaVU2QllySks4THVEdlQraC9mUDc0?=
 =?utf-8?B?UzNkZE1pSkdETVlXVHFnWUdxcFMyT2FWRHNYd0ZyaUNiSjYvbStxQmE0S0Jk?=
 =?utf-8?B?U25zclhUN3FQVFEwYi9jbGZka3ZMbFZHZnFyY01zR3BBZTBVdStPSm1xWVdC?=
 =?utf-8?B?cmNLTitQU3FhNEtaWDFSNjlLbm00YzdCYnJUOEVzZW5QWTNyUTVPRnZVRFVr?=
 =?utf-8?B?OW1xNm95OGphS01OTzgwNVVrZi9nMFVuVGdBeFFHcE9tbTh0QmJEWWZ0S29O?=
 =?utf-8?B?ajQyUEdwUFdhMXBIMGVSZlVTY0F4bUs0YlhNRWU1ei9XMm5mSVdwQUdZS095?=
 =?utf-8?B?cGZTdkNmcHQ1UjdxdEhqMkRFMmRhd3VYeWI5S2RkZnVqdjlNSXFkNkJnT1Fl?=
 =?utf-8?B?cVRqRmtXSkJBNVIxV2NkZnovbm5FMXRQSzZjV09GQXZMTzlEelljNk8yU2Zs?=
 =?utf-8?B?MXA5WXdEZ0NmV1JPNGttV2RqZWp4UENKaDV5Mk10ektaVUEvTkdJNlZOcDVi?=
 =?utf-8?B?V0RxbnNjbEtYVkN1bXF6bDB5OUtabkVqRFk1WGFaYzE1ZTNtaWdVanVHMks3?=
 =?utf-8?Q?gLto43Y4fSUcW8VrNLF5IeSdwqlCJs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzgxWnVaQ05yQ0YwRUlnRkpxTG1xTWt6d0lYREYxKzY0N3FVUjFIVHZqcVM3?=
 =?utf-8?B?dUxyZFh3TmJsbTF0M2NQUVBjV3JCS2ZHdDVFUXlBak9JVkRnNGk3dzNWb25u?=
 =?utf-8?B?Qk5lQ0lQc0ZxaVRuVG5tN1NRVk91Zk9PY1JJN2pKL1pCV21pOXZPVUUrVEZW?=
 =?utf-8?B?TVgvMXhIWWdmRFFCeVRQcGFxU1hyMWE1S2tkUzQ1ay9wV2NSc3FkcGdhbWlF?=
 =?utf-8?B?TmdsS1FILzFobDc3ZDZnak9Ra2FiSDl3U0FUYzRJZ1hIcEhZdURTMWd1NUZB?=
 =?utf-8?B?eW1CbHBMSkFtWG5hak5WMTVNZTFaVzRNYlV0ODZOdXRpZWZ3N0RpRTVzV1I4?=
 =?utf-8?B?MFMxMDNqeTlnS0F2NVI4VGUrYWV4RnR4MUxPNWQrZW9OcW1qZTNzUzJBc0lo?=
 =?utf-8?B?ckl2TTVHTUZrNnZHUnBsOU9raHFVZVRSaW02RDBacjNPUlVLL3RrTS9TRUIx?=
 =?utf-8?B?cCs1bHBrMEZSTThIZEtRSUVudStLTXB1eWJxKzFHSTR3Y3AzSnN1bEttNjlk?=
 =?utf-8?B?QlFGYzREbFpEWGRvOGtBZFdzdjRlQ3NHOVZETy84TzdieTlZbjJUTmphMmc2?=
 =?utf-8?B?c01NYnZxZktiRm9xU3k3TjlQbWZMd2k4MnR5M0xTQS9RNGNmOTJkYk1rWnFx?=
 =?utf-8?B?ZHBLbWNabGdIL2NTUFkyR3NranVTMmNTSzZnUUxTR0Y3bnp5VFkyUmJ1U1J0?=
 =?utf-8?B?Szl4QlZIaHl2UlYrNUJJUzU0Q1dsTFFIUkQzMC9nMnNiV3ptQnFhT05ia1lx?=
 =?utf-8?B?MHZqbmhERkEzRVNxL0FsWjU0d1lsN1RNVGJBZkxiM2V0OHlsQ2xSY1hvNlVu?=
 =?utf-8?B?TFppOGNzRjcrVE1PcGVueXlEYTl5MENER2wwMGQwd0d0bHBQejRPTlBUT2I5?=
 =?utf-8?B?SVdzOE0vTnJEUjBkQ0M3MUdVdTdtZExnVEEremFNR3pPZG5TQjFXN2pVUnNE?=
 =?utf-8?B?RFhSdVRmUjczMWJTRHpEeURBWVorMTdWSXhUOE9qMTBWZnZtUUVSeUNpMTho?=
 =?utf-8?B?bGlYUGFOWnVZeko5Z1UyREJoWDRVdXM4Y05ObE11RS9OdTlWSVluUGh4ZklU?=
 =?utf-8?B?Q2VNVm9FcVJyWThtZU5uSGRKOXY0UWU3N2d3dW91RmtNZms4NHJkak9jdUtj?=
 =?utf-8?B?RTdYQjBtaWplKyszdDNkZ1VCT2RRbXl1cVNYVGJGSHpyWFZhelhiSFd6RmRS?=
 =?utf-8?B?VDhJcm5peGtGSDlXNE8rYjlLUkFVaFNKNTdmYldsVXVLSTNIOGtGVkQ1TXJL?=
 =?utf-8?B?NjBnbW1wV2c4bFB3ODFSNGRET1Z0WE5jM3oybm1GQk1PbEdMSXF2SkZDR001?=
 =?utf-8?B?RjRCQkpJZi9XSDRiZXZySVFhR2hGQmpBR2xXOFVkWFVxTXk2RnQvcW5xdld1?=
 =?utf-8?B?NWVJV0tJZzVJYXBKWjNXM29QdVMxdENreEwzOXdaQUV6N0hJOEJJZzJkZXNF?=
 =?utf-8?B?ZUQ3SWEwbmpPbklkWXVpUlhGMGFIUm5HNjlXYmRKSjZlVEhyR0taWE4zeStE?=
 =?utf-8?B?bEUzd3hrNXRwVTZWKy8yd1ZWUkFNY1IyL1crVEhxQzRPVjN6LzFGc2E4TDg1?=
 =?utf-8?B?L2VsOEVDSy9ESTdPd0lTR2VhRlNYa0tTWHRmcGEzaFgyYmkwbk1QVHVsY2Q4?=
 =?utf-8?B?SXp4SG1OZGRYbXlydzhNY1BOdHNqZGE5TFl4Z3hSYkxrVU45WHdhVWNVeDRm?=
 =?utf-8?B?Rituandxc2kzaEFtSHZOY3RTNG5aaC9rRjc1UHh3d2RSaDRjT1lVWTMxSWtn?=
 =?utf-8?B?WGhDMmxFQTVMS0F2cnhxSE51bytDY0V1ZCtpV05xT2hwOHUxZFl3WHUyWXRT?=
 =?utf-8?B?Z0hrOStSWjFrVUFNUVcwSFBSRU9hZ1RZU1dwaDlFSkx0UURUQzhPNTFxcHJq?=
 =?utf-8?B?cFBjT2dZbDhTeVc4TjNrRTNOU1lWUzhWc0hQZDZjaHRzYUtYYmdDM25UVVFj?=
 =?utf-8?B?Z2gweFQ2TFpFOHdLazExK0NMaDZ6MUlGa3p1U1JweXM5WkJ3U0djR2svZTFm?=
 =?utf-8?B?ZnBvcW8zekNnbWZDYXFLTEdPaHdUZmNHaTZDZ3hrL0RNTER0a0JTOHlBQkNO?=
 =?utf-8?B?M3BxdUVZQXdrTlBidTB2TVEvU3pqQVhJcEtrZzJMeHVkcENGSlM0ZHI3NUFu?=
 =?utf-8?Q?D+wlAuDGW6zrjdgHDokmU4pqE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A004C15E30769741ABF6DF7CA6E0BD4F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0958198-3dd8-40fd-c2ee-08dd815393e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 04:10:11.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hmrggW0AFgSwb4elvhE+QAD0EFnbDIpAxw/SepWCPTXPLEBmHPXN4fDY5iHZ/N7a+5vurhnxWngEtOU5FpOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE8B1F622C
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDExOjU2IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
T24gNC8xNy8yNSAxMToyMSwgRWRnZWNvbWJlLCBSaWNrIFAgd3JvdGU6DQo+ID4gT24gVGh1LCAy
MDI1LTA0LTE3IGF0IDEwOjUwIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4gPiA+IE9uIDQv
MTYvMjUgMTY6MDIsIEthaSBIdWFuZyB3cm90ZToNCj4gPiA+ID4gRnVsbCBzdXBwb3J0IGZvciBr
ZXhlYyBvbiBhIFREWCBob3N0IHdvdWxkIHJlcXVpcmUgY29tcGxleCB3b3JrLg0KPiA+ID4gPiBU
aGUgY2FjaGUgZmx1c2hpbmcgcmVxdWlyZWQgd291bGQgbmVlZCB0byBoYXBwZW4gd2hpbGUgc3Rv
cHBpbmcNCj4gPiA+ID4gcmVtb3RlIENQVXMsIHdoaWNoIHdvdWxkIHJlcXVpcmUgY2hhbmdlcyB0
byBhIGZyYWdpbGUgYXJlYSBvZiB0aGUNCj4gPiA+ID4ga2VybmVsLg0KPiA+ID4gDQo+ID4gPiBE
b2Vzbid0IGtleGVjIGFscmVhZHkgc3RvcCByZW1vdGUgQ1BVcz8gRG9lc24ndCB0aGlzIGJvaWwg
ZG93biB0byBhDQo+ID4gPiBXQklOVkQ/IEhvdyBpcyB0aGF0IGNvbXBsZXg/DQo+ID4gDQo+ID4g
V2hlbiBTTUUgYWRkZWQgYW4gU01FLW9ubHkgV0JJTlZEIGluIHN0b3BfdGhpc19jcHUoKSBpdCBj
YXVzZWQgYSBzaHV0ZG93biBoYW5nDQo+ID4gb24gc29tZSBwYXJ0aWN1bGFyIEhXLiBJdCB0dXJu
cyBvdXQgdGhlcmUgd2FzIGFuIGV4aXN0aW5nIHJhY2UgdGhhdCB3YXMgbWFkZQ0KPiA+IHdvcnNl
IGJ5IHRoZSBzbG93ZXIgb3BlcmF0aW9uLiBJdCB3ZW50IHRocm91Z2ggc29tZSBhdHRlbXB0cyB0
byBmaXggaXQsIGFuZA0KPiA+IGZpbmFsbHkgdGdseCBwYXRjaGVkIGl0IHVwIHdpdGg6DQo+ID4g
DQo+ID4gICAxZjVlN2ViNzg2OGUgKCJ4ODYvc21wOiBNYWtlIHN0b3Bfb3RoZXJfY3B1cygpIG1v
cmUgcm9idXN0IikNCj4gPiANCj4gPiBCdXQgaW4gdGhhdCBwYXRjaCBoZSBzYWlkIHRoZSBmaXgg
ImNhbm5vdCBwbHVnIGFsbCBob2xlcyBlaXRoZXIiLiBTbyB3aGlsZQ0KPiA+IGxvb2tpbmcgYXQg
ZG9pbmcgdGhlIFdCSU5WRCBmb3IgVERYIGtleGVjLCBJIHdhcyBhZHZvY2F0aW5nIGZvciBnaXZp
bmcgdGhpcyBhDQo+ID4gaGFyZGVyIGxvb2sgYmVmb3JlIGJ1aWxkaW5nIG9uIHRvcCBvZiBpdC4g
VGhlIHBhdGNoZXMgdG8gYWRkIFREWCBrZXhlYyBzdXBwb3J0DQo+ID4gbWFkZSB0aGUgV0JJTlZE
IGhhcHBlbiBvbiBhbGwgYmFyZSBtZXRhbCwgbm90IGp1c3QgVERYIEhXLiBTbyB3aGF0ZXZlciBy
YWNlcw0KPiA+IGV4aXN0IHdvdWxkIGJlIGV4cG9zZWQgdG8gYSBtdWNoIHdpZGVyIHZhcmlldHkg
b2YgSFcgdGhhbiBTTUUgdGVzdGVkIG91dC4NCj4gDQo+IEkgZ2V0IGl0LiBBZGRpbmcgV0JJTlZE
IHRvIHRoaXMgc2FtZSBwYXRoIGNhdXNlZCBzb21lIHBhaW4gYmVmb3JlLiBCdXQNCj4ganVzdCB0
dXJuaW5nIG9mZiB0aGUgZmVhdHVyZSB0aGF0IGNhbGxzIHRoaXMgcGF0aCBzZWVtcyBsaWtlIG92
ZXJraWxsLg0KPiANCj4gSG93IGFib3V0IHdlIHRyeSB0byBwdXNoIFdCSU5WRCBvdXQgb2YgdGhp
cyBwYXRoPyBJdCBzaG91bGQgYmUgcXVpdGUNCj4gZG9hYmxlIGZvciBURFgsIEkgdGhpbmsuDQoN
ClRoYW5rcyBmb3IgcHJvdmlkaW5nIGZlZWRiYWNrLg0KDQo+IA0KPiBMZXQncyBzYXkgd2UgaGFk
IGEgcGVyY3B1IGJvb2wuIEl0IGdldCBzZXQgd2hlbiBTTUUgaXMgZW5hYmxlZCBvbiB0aGUNCj4g
c3lzdGVtIG9uIGVhY2ggQ1BVLsKgDQo+IA0KDQpUaGlzIGZpdHMgU01FLCBidXQgdGhlcmUncyBv
bmUgdGhpbmcgSSB3b3VsZCBsaWtlIHRvIHBvaW50IG91dDoNCg0KRm9yIFNNRSB0aGVyZSBhcmUg
dHdvIHBoYXNlcyBpbnZvbHZpbmcgd2JpbnZkKCk6DQoNCjEpIERvIHdiaW52ZCgpIGluIHN0b3Bf
dGhpc19jcHUoKSB3aGljaCBpcyBmb3IgYWxsIHJlbW90ZSBDUFVzOw0KMikgRG8gd2JpbnZkKCkg
aW4gcmVsb2NhdGVfa2VybmVsKCkgd2hpY2ggaXMgZm9yIHRoZSBsYXN0IGtleGVjLWluZyBDUFU7
DQoNCkFuZCB0aGUgdGhpbmcgaXMsIGN1cnJlbnRseSwgdGhlIGNvbmRpdGlvbnMgdG8gZGVjaWRl
IHdoZXRoZXIgdG8gcGVyZm9ybQ0Kd2Jpdm5kKCkgZm9yIHRoZSBhYm92ZSB0d28gY2FzZXMgYXJl
IGRpZmZlcmVudDoNCg0KQ2FzZSAxKSBjaGVja3Mgd2hldGhlciB0aGUgX2hhcmR3YXJlXyBzdXBw
b3J0cyBTTUUgKGkuZS4sIHZpYSBDUFVJRCk7DQpDYXNlIDIpIGNoZWNrcyB3aGV0aGVyIHRoZSBf
a2VybmVsXyBoYXMgZXZlciBlbmFibGVkIFNNRS4NCg0KV2UgY2FuIGp1c3QgZXhwYW5kIHRoZSBj
YXNlIDIpIHRvIG1hdGNoIGNhc2UgMSkuICBJIGRvbid0IHNlZSBhbnkgaXNzdWUgaGVyZS4gDQpF
eHBhbmRpbmcgdG8gZG9pbmcgd2JpbnZkKCkgZm9yIGJhcmUtbWV0YWwgbWFjaGluZSBkb2VzIHRo
ZSBzYW1lIHRoaW5nIGFueXdheS4NCg0KU28gSSB0aGluayB0aGlzIGFwcHJvYWNoIGZpdHMgU01F
IGVhc2lseS4gIFdlIGNhbiBqdXN0IHNldCB0aGUgcGVyLWNwdShuZXdib29sKQ0KaW4gZWFybHlf
ZGV0ZWN0X21lbV9lbmNyeXB0KCkgYnkgYWx3YXlzIGNoZWNraW5nIHdoZXRoZXIgdGhlIF9oYXJk
d2FyZV8gc3VwcG9ydHMNClNNRS4NCg0KPiBJdCBhbHNvIGdldHMgZW5hYmxlZCB3aGVuIFREWCBp
cyBlbmFibGVkLsKgDQo+IA0KDQpSZWFkaW5nIGJlbG93LCBJIHRoaW5rIHlvdSBtZWFuIHdlIG9u
bHkgZW5hYmxlIHRoZSBuZXdib29sIHdoZW4gVERYIGlzIGVuYWJsZWQNCiphdCBydW50aW1lKj8N
Cg0KDQo+IFRoZSBrZXhlYw0KPiBjb2RlIGJlY29tZXM6DQo+IA0KPiAtCWlmIChTTUUpDQo+ICsJ
aWYgKHBlcl9jcHUobmV3Ym9vbCkpDQo+IAkJd2JpbnZkKCk7DQo+IA0KPiBObyBURFgsIG5vIG5l
dyB3YmludmQoKS4gSWYgU01FLCBubyBjaGFuZ2UuDQoNClllcy4NCg0KPiANCj4gTm93LCBoZXJl
J3Mgd2hlcmUgaXQgZ2V0cyBmdW4uIFRoZSBib29sIGNhbiBnZXQgX2NsZWFyZWRfIGFmdGVyIFdC
SU5WRA0KPiBpcyBleGVjdXRlZCBvbiBhIENQVSwgYXQgbGVhc3Qgb24gVERYIHN5c3RlbXMuwqAN
Cj4gDQoNClJpZ2h0IHRoaXMgb25seSB3b3JrcyBmb3IgVERYLiAgRm9yIFNNRSwgd2JpbnZkKCkg
aXMgYWx3YXlzIG5lZWRlZCwgc2luY2UgYW55DQpzaW5nbGUgd3JpdGUgdG8gYW55IG1lbW9yeSB3
b3VsZCBnZW5lcmF0ZSBhIG5ldyBkaXJ0eSBjYWNoZWxpbmUgd2hpY2ggbWF5IGhhdmUNCmRpZmZl
cmVudCBlbmNyeXB0aW9uIHByb3BlcnR5IHdoZW4gdGhlIHNlY29uZCBrZXJuZWwgdXNlcyB0aGF0
IG1lbW9yeS4NCg0KPiBJdCB0aGVuIGFsc28gbmVlZHMgdG8gZ2V0DQo+IHNldCBhZnRlciBURFgg
bWlnaHQgZGlydHkgYSBjYWNoZWxpbmUuDQo+IA0KPiAJVERDQUxMKCk7IC8vIGRpcnRpZXMgc3R1
ZmYNCj4gCXBlcl9jcHUobmV3Ym9vbCkgPSAxOw0KPiANCj4gVGhlbiB5b3UgY2FuIGFsc28gZG8g
dGhpcyBvbl9lYWNoX2NwdSgpOg0KPiANCj4gCXdiaW52ZCgpOw0KPiAJcGVyX2NwdShuZXdib29s
KSA9IDA7DQo+IA0KPiBob3BlZnVsbHkgYXQgcG9pbnQgYWZ0ZXIgeW91J3JlIHN1cmUgbm8gbW9y
ZSBURENBTExzIGFyZSBiZWluZyBtYWRlLsKgDQo+IA0KDQooQXNzdW1lIHlvdSBtZWFudCBTRUFN
Q0FMTCByYXRoZXIgdGhhbiBURENBTEwgc2luY2UgdGhpcyBjb250ZXh0IGlzIGZvciBURFgNCmhv
c3QuKQ0KDQpJbiB0aGUgaW5pdGlhbCBURFggc3VwcG9ydCBLVk0gaXMgdGhlIG9ubHkgdXNlciwg
c28gS1ZNIGtub3dzIHdoZW4gbm8gbW9yZQ0KU0VBTUNBTExzIGNhbiBiZSBtYWRlLiAgRS5nLiwg
d2UgY2FuIGRvIHRoaXMgd2hlbiB0aGUgbGFzdCBWTSAob3IgVEQpIGlzDQpkZXN0cm95ZWQsIG9y
IHdoZW4gS1ZNIG1vZHVsZSBpcyB1bmxvYWRlZC4NCg0KPiBJZg0KPiB5b3Ugc2NyZXcgaXQgdXAs
IG5vIGJpZ2dpZTogdGhlIGtleGVjLXRpbWUgb25lIHdpbGwgbWFrZSB1cCBmb3IgaXQsDQo+IGV4
cG9zaW5nIFREWCBzeXN0ZW1zIHRvIHRoZSBrZXhlYyB0aW1pbmcgYnVncy7CoEJ1dCBpZiB0aGUg
b25fZWFjaF9jcHUoKQ0KPiB0aGluZyB3b3JrcyBpbiB0aGUgY29tbW9uIGNhc2UsIHlvdSBnZXQg
bm8gYWRkaXRpb25hbCBidWcgZXhwb3N1cmUuDQoNClRoaXMgaXMgdHJ1ZS4gIEJ1dCBJIGRvbid0
IHRoaW5rIGl0J3MgYSBidWcsIGJlY2F1c2Uga2V4ZWMgY2FuIGhhcHBlbiBhdCBhbnkNCnRpbWUs
IGUuZy4sIHdoZW4gdGhlcmUncyBURCBzdGlsbCBydW5uaW5nLg0KDQpTbyB1bmxlc3MgS1ZNIGlz
IG5vdGlmaWVkIHdoZW4ga2V4ZWMgaGFwcGVucyAoZS5nLiwgdmlhIGEgcmVib290IG5vdGlmaWVy
KSBhbmQNCnRlcm1pbmF0ZXMgYWxsIFREWCBndWVzdHMgd2hlbiBub3RpZmllZCBiZWZvcmUgdGhl
IGtleGVjLWluZyBDUFUgdHJpZXMgdG8gc3RvcA0KYWxsIHJlbW90ZSBDUFVzLCBLVk0gY2Fubm90
IGd1YXJhbnRlZSB3YmludmQoKSBoYXMgYmVlbiBkb25lIGFuZCB0aGVyZSB3aWxsIGJlDQpubyBt
b3JlIFNFQU1DQUxMcy4NCg0KU28gaW4gc2hvcnQ6DQoNCkkgdGhpbmsgdGhpcyBhcHByb2FjaCB3
aWxsIHdvcmsgZm9yIGJvdGggU01FIGFuZCBURFguIMKgQnV0IEkgYW0gbm90IHN1cmUgd2hldGhl
cg0Kd2Ugc2hvdWxkL25lZWQgdG8gbWFrZSBLVk0gZG8NCg0KCXdiaW52ZCgpOw0KCXBlcl9jcHUo
bmV3Ym9vbCkgPSAwOw0KDQp1bmxlc3Mgd2UgYWxzbyB3YW50IHRvIG1ha2UgS1ZNIGdldCBub3Rp
ZmllZCB3aGVuIGtleGVjIGhhcHBlbnMuDQoNCkFub3RoZXIgdHdvIGNvbmNlcm5zIGFyZTogMSkg
dGhlIGFib3ZlIGNvZGUgZG9lc24ndCB3b3JrIGZvciBTTUUgYXMgbWVudGlvbmVkDQphYm92ZTsg
Mikgd2l0aCBURFggQ29ubmVjdCBvdGhlciBrZXJuZWwgY29tcG9uZW50cyBtYXkgbmVlZCB0byBk
byBzaW1pbGFyIHRoaW5nDQp0b28uDQoNCk1heWJlIHdlIGNhbiBzdGFydCB3aXRoIGJlbG93Pw0K
DQotIHNldHRpbmcgcGVyLWNwdShuZXdib29sKSBmb3IgVERYIHdoZW4gVERYIGdldHMgZW5hYmxl
ZCBhdCBydW50aW1lOw0KLSBsZXR0aW5nIGtleGVjIGNvZGUgdG8gY2F0Y2ggdGhlIHdiaW52ZCgp
IGZvciBURFgNCg0KT3IgZXZlbiBzaW1wbGVyOg0KDQotIHNldHRpbmcgcGVyLWNwdShuZXdib29s
KSBmb3IgVERYIHdoZW4gWDg2X0ZFQVRVUkVfVERYX0hPU1RfUExBVEZPUk0gaXMgc2V0IGF0DQpl
YXJseSBib290Ow0KLSBsZXR0aW5nIGtleGVjIGNvZGUgdG8gY2F0Y2ggdGhlIHdiaW52ZCgpIGZv
ciBURFgNCg0KDQo+IA0KPiA+ID4gPiBJdCB3b3VsZCBhbHNvIHJlcXVpcmUgcmVzZXR0aW5nIFRE
WCBwcml2YXRlIHBhZ2VzLCB3aGljaCBpcyBub24tDQo+ID4gPiA+IHRyaXZpYWwgc2luY2UgdGhl
IGNvcmUga2VybmVsIGRvZXMgbm90IHRyYWNrIHRoZW0uDQo+ID4gPiANCj4gPiA+IFdoeT8gVGhl
IG5leHQga2VybmVsIHdpbGwganVzdCB1c2UgS2V5SUQtMCB3aGljaCB3aWxsIGJsYXN0IHRoZSBv
bGQNCj4gPiA+IHBhZ2VzIGF3YXkgd2l0aCBubyBzaWRlIGVmZmVjdHMuLi4gcmlnaHQ/DQo+ID4g
DQo+ID4gSSBiZWxpZXZlIHRoaXMgaXMgdGFsa2luZyBhYm91dCBzdXBwb3J0IHRvIHdvcmsgYXJv
dW5kIHRoZSAjTUMgZXJyYXRhLiBBbm90aGVyDQo+ID4gdmVyc2lvbiBvZiBrZXhlYyBURFggc3Vw
cG9ydCB1c2VkIGEgS1ZNIGNhbGxiYWNrIHRvIGhhdmUgaXQgcmVzZXQgYWxsIHRoZSBURFgNCj4g
PiBndWVzdCBtZW1vcnkgaXQga25vd3MgYWJvdXQuDQo+IA0KPiBTbywgbGV0J3MganVzdCBub3Qg
c3VwcG9ydCBoYXJkd2FyZSB3aXRoIHRoYXQgZXJyYXR1bSB1cHN0cmVhbS4NCg0KVGhpcyBjYW4g
YmUgZG9uZSBieSByZWZ1c2luZyBrZXhlYyBhdCBpbWFnZSBsb2FkaW5nIHRpbWUgYXMgc2hvd24g
aW4gdGhpcyBwYXRjaDoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80MDgxMDNmMTQ1
MzYwZGZhMDRhNDFiYzgzNmNhMmM3MjRmMjlkZWIwLjE3NDE3Nzg1MzcuZ2l0LmthaS5odWFuZ0Bp
bnRlbC5jb20vDQoNCkJ1dCBpZiB3ZSB3YW50IHRvIG1ha2UgS1ZNIGdldCBub3RpZmllZCB3aGVu
IGtleGVjIGhhcHBlbnMsIHRoZW4gcmVzZXR0aW5nIFREWA0KcHJpdmF0ZSBtZW1vcnkgY2FuIGFs
c28gYmUgZG9uZSBlYXNpbHkgYmVjYXVzZSBLVk0gYWxyZWFkeSBoYXMgdGhlIGNvZGUgdG8gdGVh
cg0KZG93biBhIFREWCBndWVzdCBpbmNsdWRpbmcgcmVzZXR0aW5nIFREWCBwcml2YXRlIG1lbW9y
eSBhbmQgZmx1c2hpbmcgY2FjaGUNCmFzc29jaWF0ZWQgd2l0aCB0aGUgVERYIGd1ZXN0IGV0Yy4N
Cg0K
