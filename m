Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E451FC3;
	Thu, 22 May 2025 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747873310; cv=fail; b=Vwu4rWkFePNOVN3kByewOx+1x3P5NI8iMfSvP0nCdlhKzZ25z1CGdysv9oBh6eJD0ey0GoVn8zcg5OJ5qY7l61Sa0n/6p7SD0hqM2yvUwOrfDl4uNx0ZST8KJD/2Eu+u7oYNYJmIbIHbQbG16Qg5kU08Q1MKErQc4piI4gHR7zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747873310; c=relaxed/simple;
	bh=otRk4QwxR4HbeESlO/5PhoS4XFoH8CdJkfuO69lpWQ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PLIME3ze563x5UiryzHOkbkYQP4Gc84ah9AFfvteYd8x3qTNUjUEuSbTlmS1LzPxtrTGQqE/wqo/tRuCvW8MomwXVFzSl5LUWqtpvh47sl1XHWJFRal7pXFppjEGtYB2Pqbd7MC+H0Ze7LKGGADFSDQ/msDJnRq/lraPcAYwYYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Frn29To4; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Frn29To4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747873308; x=1779409308;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=otRk4QwxR4HbeESlO/5PhoS4XFoH8CdJkfuO69lpWQ8=;
  b=Frn29To4f6Gvfx1UfOHsLGr4HPzdg8PJhemSuIfl9G92m5oT2ZqWL88A
   iMVj9lx3mONLjtwzeujuThxPMiushWemGJmVWaq2fb+YZOnSt9hSlyeyl
   HXd/CvNphl7U6Me6WDVX2Eh1wTCVZm8jVR5vP5Vu+YgtcGhZ+9TOffRSc
   LItFoYNZ4QCDyqoWKkVTDNjVYs+XgLpClyp/Z0JFiU9zEbyG7lx18wY8k
   iq2WNPXWgXwdjZaXYuqVh37PLcUxBpq9EBX1G+5iCY/5zOCMbGXE//8H6
   t1ebdBcnq+qxXYfmhIsV90qE/R4NizgmcwdakwJlYs2/Abb3hyPMPd7e3
   w==;
X-CSE-ConnectionGUID: 8sMcdYOYTm6UiZYEqp0XOQ==
X-CSE-MsgGUID: svVpwXjvSdO/JR4cTreArQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49134963"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49134963"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:21:47 -0700
X-CSE-ConnectionGUID: DCbv3cyBTeC/e5Vp7teF2A==
X-CSE-MsgGUID: YkiSp7gqQxqiIkc0BNEezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141381752"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:21:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 17:21:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 17:21:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 17:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDjjlfA+94WgzhohiJfuDxeMIckv+eseM1dFy1F7SDQRMgpwJuyObHi+Cxd1+5VuWKLVXRH1a1IJ/Q4RiKdsNjN5aAMHFRApfYUt7UwR8O5JHCpyNUY3mQbu1S2VUM/CBfsu4hMBjg5BapmLLCuZwUvlxXNhVle64yzJ7GbIIA9Q6KJkfNcwD3wVbwI0SExNdSWONXAen+c/xf9sAXMztDRIchtGkNwQuNX7Ocx9CCy25tCk7cQIdhcH70a7XOn82Y/iEofTCnOh4sIHVomVqeRs+hIeK5IlvpVuqpwyeOSpxa4skY0R10citJOm01Yoq2Uy9QKnL8kmOmp2NSS26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otRk4QwxR4HbeESlO/5PhoS4XFoH8CdJkfuO69lpWQ8=;
 b=h5M9sMi0TsMgg1o7KB3K+lFh3dI2BJXl4cootoz57wPttDgPMECHKs3Qmz3LsW8OnvAvEZmBCLuItGSLiD8iyYj/W9HfEWM4/0dbZeNgrN7s2nIcEMj5mmon1wPzIrmGr5mGWRQX5oR4ygOTm2inxsaIkTnaSMI27pIqQ+bAruMoe4sULZw8w5VEy2b/ad0xEw3pjLI9VQ0wNr3/aA40f6NmT8xjtdCZyyQltX/gabpyZpapU3MmML/s120iZY4uMlOOskx+/h9FoIRlSHuJDRzteIHg/vnddxkY/yEGNuLaODfLuuenJLvey64+MF3/t3MARrqcEFQbHdqoH+98AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 00:21:41 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 00:21:41 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>
CC: Peter Newman <peternewman@google.com>, "Moger, Babu" <bmoger@amd.com>,
	"babu.moger@amd.com" <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
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
Subject: RE: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
Thread-Topic: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
Thread-Index: AQHbxewRz4lY58rpOkqW5MzQ3LhdNrPaIhqAgAGJyICAAAqYAIAAHUmAgAAI+ICAAFRiAIAABTGAgACglYCAAOZvgIAAEqp7gAAB0dA=
Date: Thu, 22 May 2025 00:21:41 +0000
Message-ID: <SJ1PR11MB6083B627895846B8663B4805FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <aC5lL_qY00vd8qp4@agluck-desk3>
 <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com>
In-Reply-To: <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CY5PR11MB6365:EE_
x-ms-office365-filtering-correlation-id: c33d4075-1f53-425d-28e0-08dd98c6a04b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MDRLbXNYNUVmL2RNTXB3ZURtY1czaWNEWkN6RWpTYnQ4R2J6ZjV2ZWFHMVJJ?=
 =?utf-8?B?TUZRajlROE1CbzJvUmRIdkl6M2xZQi8xY3FzVWxLVUpoVGtjV2t5NTREQjBV?=
 =?utf-8?B?dVlQM3dRRmxVbUdHSVdDRzcrcEFyZDNXV1JhVDFXNGhob01paWw0azVkak1B?=
 =?utf-8?B?OEtKSzlNbXNOSDV0My9tT09yRG1EVmF5N0t2RnNWSmZ3VTRwY01qblNnakNp?=
 =?utf-8?B?Tk9idmc5UUVSREVsUlBuSWpTeWxoUGJoaE9TcXRBd1dpQjBxenY1U0cwZnVl?=
 =?utf-8?B?VG5EUG9tMUVOYmpHMEZRZ1ZENXZmVkgzc3pQQXFZMWVrS2FBRGtVdUtBVXBH?=
 =?utf-8?B?RHJqMUZGeHVFd2tSN2c5eXUwQ0V3b3haSlMxcUVFT3BqY3FWU053a2dlNmFO?=
 =?utf-8?B?V2FTRmVpbUJHRVQyUGdqUmdkNmRPL3lxL0xtbmp0Vjl4VEdBQXpVNWJhK3pX?=
 =?utf-8?B?QUYxQnNwZE05aVV2SnY2eXM5eEdWK1NkSHFFNWx4MFJBelFxck9SRmdGTmU3?=
 =?utf-8?B?VnlnYlM1MXJ5OE5xcGU4alJhUmlQUFF6a21IMTEyZmhNa0tFVmtNcE5JNGlm?=
 =?utf-8?B?ZGhUVXUwdmdSQUhqZkhiU3FaOG5ZNGxrM3A5OC9ra2pxY0NjN1k5VjRPcHh0?=
 =?utf-8?B?T1FCZkY0U3RoRmFPV1NoOGxwTUJURSsrR3BTMlJDY0tVekFweGhQc2xBOUxa?=
 =?utf-8?B?MExGL0VvWkJTc2VRTWR5aGl0dE94QmRLaGo4aHZqMDUydmFyYmdScGZ5NFdS?=
 =?utf-8?B?L29yUWs3UGFLdFpiZW1mdWVQbGlZdTlOd1QzeTdxMi9sTVMxSXEzbUtBVkdu?=
 =?utf-8?B?c01QdjNCbnpMYlM3a05ZKzF4L0VRWEhuNnpMZ1NWWTJaTjZwOXZ1clVTa2h6?=
 =?utf-8?B?OEZhUnRlSnZkY1pTWjZCODlJT3ZsZVhSd1d0eUVBMGtiMGp0MnB4S21GeGh4?=
 =?utf-8?B?N0RJeHBkeTBtaktZa054cEpqaEx5REt2UmNqbGx1Mjl4U3BXaHFDR0FBdFVB?=
 =?utf-8?B?QmxVbnZWSVN0MUt0THh4NDFGRG03SktoQjBaanljRnhFZ0t2YWltcC82VE9R?=
 =?utf-8?B?eFNkLzhLUlI2SDA0R2R0dThCeUFadklpQVdQZWNsM1FpbHNmdHV2cHFBU25i?=
 =?utf-8?B?TmxxMnJ1TzRIQk9PRWd1YWQwZzJQSFB4QjlLb1REdFp6Q05zRXl6eExFcWJO?=
 =?utf-8?B?TFI5dktJTFpab2dQaGxWbUdzK080eGZmak1UV2dNczlBaDkzOGpEaUoxdWFm?=
 =?utf-8?B?NGF2T08rTVBCa0FSVDZJc0FrdXRWYUZlSm9lUzZqNitkWEJJT3FlbTlEblNF?=
 =?utf-8?B?SFcvMlNwdGpQR2Q4MEMwOEJFT1hVWGVsTTBQS2U0WWp1Tmg1TXdhSjFoR2hN?=
 =?utf-8?B?ZHNzRVJZL2VLVG0yNFo5YXJ3WllSL0E3WWxic25YMnRHU243WDZ3aGZycTAx?=
 =?utf-8?B?N1ExVjlPTjI4Rmc3TUVpV3JmanE2LzJ6dnpPcWdnOHZDWE1TZW4weGJnRy9v?=
 =?utf-8?B?cFQ2SHNGcXBqN0g1UzJ1T0l3RXdiMjJWRFBDTjJlTEhhZnUzcWxpY0Y3OUF4?=
 =?utf-8?B?aVNHMDNQcmJKR25IOVpVU3Y5Qm11d2JZS2t5OFFValhDRzQxRVNkaGhMZzho?=
 =?utf-8?B?TklySGowZE9sOUluZlB6WUo2MklUNk5PaUpURE1mN2lHYmtGRjJENWRPYWRq?=
 =?utf-8?B?cWpzRmZGVFFKM2VWbFVJVHQ0VkNNN003KzBlU1l1OEVMQzJ1ayswRkVXQmpI?=
 =?utf-8?B?VXJ5Lzg0NVRvK3ZaY0JZSnFjaEdrQUpMSk9ueUkrc0N5MnhJYVhqOWxpZFNl?=
 =?utf-8?B?U3lpMVczVFk1Y3AzRWNoMFExRE96QitWbUxYanpFQXkzMlVBSG51RDlvb0Qz?=
 =?utf-8?B?T2NyM0lhaXUrMVl0emlVcXZJTGUyVllSeVRCdk1MYXJkWFhWVWZZamdyY0I4?=
 =?utf-8?B?dDBzaFJTZVFBbVFyVWxCa2RQcFhiUFk2aWJEbnhqSng3TnU4SzYyVEpNeXkr?=
 =?utf-8?Q?IF73f6yF7xLr7/O6bIsnDC6XUDTq5I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJiLzdwTDd1bHJIdXFDK1VXWmRJcFhaSzBWMlF5dXlJUWkrdWVKUXRxd2cz?=
 =?utf-8?B?dGRJUTVzdzY2NDNvUXhwRWhjMTB3NlJtQkd4Y0VKUWtEYjZJUnd0clRNOHdV?=
 =?utf-8?B?Q3VEcGxZK056ZjlRb3BGRWZBTTZkNXRjN0JlbkJuM2RvdnRrU1dDUWNiS0lx?=
 =?utf-8?B?MXoxUHFYTnp1Z2dlK1FneHZ2QU9VWUhPNkQxdmxaQjBLUEJCM1E3Rko0a0pL?=
 =?utf-8?B?eFIxZitLak5JalNhU1NKRHBLb292UHdKcys3anhhenRBNEp1aFIxQzVGaGdS?=
 =?utf-8?B?K0VTcHVFWGNGQ0RxYmNqWXBoNDBFa3FIdEx3UmR5dUVpN0xrdVVYc09ENmFz?=
 =?utf-8?B?c2hpVVJJVDF3eTVNcVlmZ2NCQ3hpbms5Wm91blhzV3RIL1BpbTZuSGVwVkRR?=
 =?utf-8?B?REhYVEJlRkRYb1g1SlZyR0pkUWVDN1Z5RlorcnR6a3hla21LbFRxanZVckEx?=
 =?utf-8?B?U09iL25yZ05velBPN1NWWXl6L3M3Z1JSSUlkMG1oSUFyMjRWek12dG5iZVAr?=
 =?utf-8?B?UDloVUYwZ3U0WC91QnVzUm1tZU1sbG5sS2FkY3U2dU9QUlcyU25GVHZSdmhD?=
 =?utf-8?B?NCs4T0trdS9SM2Nid29MRFFvcUV4MDVaQ1FmQTBUdkFrWWc4ZDl0dHJ3bVlz?=
 =?utf-8?B?MjRDY2lxVENsdDhGS3FvNllrUGg1U1VFL21ZUGYxZ1AyNTJVOWtmY2luL0Yz?=
 =?utf-8?B?RDl2Z2RMT1dJL1dQelRGaWlSZkR5SHhIZ3h2VXlVQkhrekNqd3NTcU5lNytK?=
 =?utf-8?B?b0pFQjVxbDFhRW1ZOUdZcUt6UloxdHI2Y0JZOGdYUldkVGJwM05CRFlKd010?=
 =?utf-8?B?VXR0cVdsVFpPVE12MjhCcFM5TGI1OUc4aEJzSmZzVy9uR0FoYldDQ3lQMDlT?=
 =?utf-8?B?QlRoTlBvZ3VmSGZkTDJ5Z3UyWEFKYkZCQnhkSUR1YkRaN0lRcjN4R2JsL2h4?=
 =?utf-8?B?Z2tJcXgrbEU3Q1R5WTg4VklEdE0xYklMS3I3c01zN1BJVWt6clg2TDJXOUV2?=
 =?utf-8?B?V3VDSmh0bUgzR0pieFh3QXUzeGZPMXNQNDVWWU1xZXU0bHRNODY3UmVhRVJY?=
 =?utf-8?B?ZWQ0anZyaWlrSUZnb3g1Zm9MMWhpMmlFTWl3M250SE5PeFo3emZvcUMxWFMr?=
 =?utf-8?B?Y2QvWTYyRVhzNnRBVGhLTmVHWTAzekUvTVdyekdNZGNJYTJOemxiQ1EwZExC?=
 =?utf-8?B?eHBtQlVST3JmWkhqWVV1dlpSSVU5T3hWVFVEbjhRamUvWk1zM0RvMVVDbCtl?=
 =?utf-8?B?azlXSFRkUjMxQ0RLSkhWWTZuVXdCNHI2eTd0Y3hIL3ZkdXBadFJlV1pxU1pK?=
 =?utf-8?B?ZlpaUnpsdnZmb1JMcG5NMHgvMVJmZWFGb3dONDFyL0dlRk8vQ05YSGVpWG91?=
 =?utf-8?B?YUpLamZENTV1NXdUV1RmTS9ZUloyZUlvSDJMNDVWZUppN2hXeUN2ZHRpTkhK?=
 =?utf-8?B?Z0Uxc3dYbzBrYnM1SmxBK3c5a0JZUkVobDBScVpZTUFITzJpaHArWnBOS3FL?=
 =?utf-8?B?QlhEdHBFcVdFT0drdHRsZHdvMUl0WDRDU015bjNuakJ4dThVd1pjVTF5a29U?=
 =?utf-8?B?Q2lRenFqNzB6eGFzdms1a1poN2ZQVUFQaDMrc0YxMU9jL1hqNTBXTVNQT0pS?=
 =?utf-8?B?U2dKOFpHejZZeVlSb2dzeUVXdGVMTVFCTVhRNC91bEYva0FWWkdFREt3aXJH?=
 =?utf-8?B?cWM5SEtOa0wwTjZoUTIvdTlLN003ZEczZ2RpRnR0R2hJUEdGYTVVUFZSSUp2?=
 =?utf-8?B?eDVEaEwyR1FtKzJNWmxOdWpSRXZnNWVJdFVvK3BqRmxzeDhSc2VwUm41SEx5?=
 =?utf-8?B?L1ZLbk4ySER1RUdwOFhIc3F3dWVPTmtjUi9IS3czUDZrcVpTOFNmZU5HdDNC?=
 =?utf-8?B?ZGtPdHNnYkRMMHlRMUFVUG9FZEtJMGRlRlVpQytUWEFVQ2hCK0NZeWNhVytT?=
 =?utf-8?B?TTZVU0NpQjlzZlBvSHNuV2dOdzNxSUpyYk90cS9oK0ZCU1RBTjI1Sm5vVkEw?=
 =?utf-8?B?UTRXVFg5WG5JdXhPbGwrVy80a05Gek0rSG5vcEZ3SkNqbEd4MkZPVVU4ZjRv?=
 =?utf-8?B?aktBektzczExVjVnK3Y2ZXpFZTNwcGh0ZHgrRzdmbkN3ak9yWDZvVEhqRDBw?=
 =?utf-8?Q?Rxr8Q8vFJb90NZsY5c1UHz1wB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c33d4075-1f53-425d-28e0-08dd98c6a04b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 00:21:41.6291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2goqegaQH60KXc2ppIgqV3IO18NHO/jZp4GiGxWvWkB4YlQ8HGU6s8fMpL2qEnfWqI+MbSGssFs/WQ+Jxor8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
X-OriginatorOrg: intel.com

PiA+Pj4gVGhlcmUncyBhbHNvIHRoZSBtb25ncm91cC1STUlEIG92ZXJjb21taXQgdXNlIGNhc2Ug
SSBkZXNjcmliZWQNCj4gPj4+IGFib3ZlWzFdLiBPbiBJbnRlbCB3ZSBjYW4gc2FmZWx5IGFzc3Vt
ZSB0aGF0IHRoZXJlIGFyZSBjb3VudGVycyB0bw0KPiA+Pj4gYmFjayBhbGwgUk1JRHMsIHNvIG51
bV9tYm1fY250cnMgd291bGQgYmUgY2FsY3VsYXRlZCBkaXJlY3RseSBmcm9tDQo+ID4+PiBudW1f
cm1pZHMuDQo+ID4+DQo+ID4+IFRoaXMgaXMgYWJvdXQgdGhlOg0KPiA+PiAgICBUaGVyZSdzIG5v
dyBtb3JlIGludGVyZXN0IGluIEdvb2dsZSBmb3IgYWxsb3dpbmcgZXhwbGljaXQgY29udHJvbCBv
Zg0KPiA+PiAgICB3aGVyZSBSTUlEcyBhcmUgYXNzaWduZWQgb24gSW50ZWwgcGxhdGZvcm1zLiBF
dmVuIHRob3VnaCB0aGUgbnVtYmVyIG9mDQo+ID4+ICAgIFJNSURzIGltcGxlbWVudGVkIGJ5IGhh
cmR3YXJlIHRlbmRzIHRvIGJlIHJvdWdobHkgdGhlIG51bWJlciBvZg0KPiA+PiAgICBjb250YWlu
ZXJzIHRoZXkgd2FudCB0byBzdXBwb3J0LCB0aGV5IG9mdGVuIHN0aWxsIG5lZWQgdG8gY3JlYXRl
DQo+ID4+ICAgIGNvbnRhaW5lcnMgd2hlbiBhbGwgUk1JRHMgaGF2ZSBhbHJlYWR5IGJlZW4gYWxs
b2NhdGVkLCB3aGljaCBpcyBub3QNCj4gPj4gICAgY3VycmVudGx5IGFsbG93ZWQuIE9uY2UgdGhl
IGNvbnRhaW5lciBoYXMgYmVlbiBjcmVhdGVkIGFuZCBzdGFydHMNCj4gPj4gICAgcnVubmluZywg
aXQncyBubyBsb25nZXIgcG9zc2libGUgdG8gbW92ZSBpdHMgdGhyZWFkcyBpbnRvIGEgbW9uaXRv
cmluZw0KPiA+PiAgICBncm91cCB3aGVuZXZlciBSTUlEcyBzaG91bGQgYmVjb21lIGF2YWlsYWJs
ZSBhZ2Fpbiwgc28gaXQncyBpbXBvcnRhbnQNCj4gPj4gICAgZm9yIHJlc2N0cmwgdG8gbWFpbnRh
aW4gYW4gYWNjdXJhdGUgdGFzayBsaXN0IGZvciBhIGNvbnRhaW5lciBldmVuDQo+ID4+ICAgIHdo
ZW4gUk1JRHMgYXJlIG5vdCBhdmFpbGFibGUuDQo+ID4+DQo+ID4+IEkgc2VlIGEgbW9uaXRvciBn
cm91cCBhcyBhIGNvbGxlY3Rpb24gb2YgdGFza3MgdGhhdCBuZWVkIHRvIGJlIG1vbml0b3JlZCB0
b2dldGhlci4NCj4gPj4gVGhlICJ0YXNrIGxpc3QiIGlzIHRoZSBncm91cCBvZiB0YXNrcyB0aGF0
IHNoYXJlIGEgbW9uaXRvcmluZyBJRCB0aGF0DQo+ID4+IGlzIHJlcXVpcmVkIHRvIGJlIGEgdmFs
aWQgSUQgc2luY2Ugd2hlbiBhbnkgb2YgdGhlIHRhc2tzIGFyZSBzY2hlZHVsZWQgdGhhdCBJRCBp
cw0KPiA+PiB3cml0dGVuIHRvIHRoZSBoYXJkd2FyZS4gSSBpbnRlbnRpb25hbGx5IHRyaWVkIHRv
IG5vdCB1c2UgUk1JRCBzaW5jZSBJIGJlbGlldmUNCj4gPj4gdGhpcyBpcyByZXF1aXJlZCBmb3Ig
YWxsIGFyY2hzLg0KPiA+PiBJIHRodXMgZG8gbm90IHVuZGVyc3RhbmQgaG93IGEgdGFzayBjYW4g
c3RhcnQgcnVubmluZyB3aGVuIGl0IGRvZXMgbm90IGhhdmUNCj4gPj4gYSB2YWxpZCBtb25pdG9y
aW5nIElELiBUaGUgaWRlYSBvZiAiZGVmZXJyZWQgYXNzaWdubWVudCIgaXMgbm90IGNsZWFyIHRv
IG1lLA0KPiA+PiB0aGVyZSBjYW4gbmV2ZXIgYmUgInVubW9uaXRvcmVkIHRhc2tzIiwgbm8/IEkg
dGhpbmsgSSBhbSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlLg0KPiA+DQo+ID4gSW4gdGhlIEFNRC9S
TUlEIGltcGxlbWVuZW50YXRpb24gdGhpcyBtaWdodCBiZSBhY2hpZXZlZCB3aXRoIHNvbWV0aGlu
Zw0KPiA+IGV4dHJhIGluIHRoZSB0YXNrIHN0cnVjdHVyZSB0byBkZW5vdGUgd2hldGhlciBhIHRh
c2sgaXMgaW4gYSBtb25pdG9yZWQNCj4gPiBncm91cCBvciBub3QuIEUuZy4gV2UgYWRkICJ0YXNr
LT5ybWlkX3ZhbGlkIiBhcyB3ZWxsIGFzICJ0YXNrLT5ybWlkIi4NCj4gPiBUYXNrcyBpbiBhbiB1
bm1vbml0b3JlZCBncm91cCByZXRhaW4gdGhlaXIgInRhc2stPnJtaWQiICh0aGF0J3Mgd2hhdA0K
PiA+IGlkZW50aWZpZXMgdGhlbSBhcyBhIG1lbWJlciBvZiBhIGdyb3VwKSBidXQgaGF2ZSB0YXNr
LT5ybWlkX3ZhbGlkIHNldA0KPiA+IHRvIGZhbHNlLiAgQ29udGV4dCBzd2l0Y2ggY29kZSB3b3Vs
ZCBiZSB1cGRhdGVkIHRvIGxvYWQgIjAiIGludG8gdGhlDQo+ID4gSUEzMl9QUVJfQVNTT0MuUk1J
RCBmaWVsZCBmb3IgdGFza3Mgd2l0aG91dCBhIHZhbGlkIFJNSUQuIFNvIHRoZXkNCj4gPiB3b3Vs
ZCBzdGlsbCBiZSBtb25pdG9yZWQsIGJ1dCBhY3Rpdml0eSB3b3VsZCBiZSBidW5kbGVkIHdpdGgg
YWxsDQo+ID4gdGFza3MgaW4gdGhlIGRlZmF1bHQgcmVzY3RybCBncm91cC4NCj4gPg0KPiA+IFBy
ZXN1bWFibHkgc29tZXRoaW5nIGFuYWxvZ291cyBjb3VsZCBiZSBkb25lIGZvciBBUk0vTVBBTS4N
Cj4gPg0KPg0KPiBJIGRvIG5vdCBpbnRlcnByZXQgdGhpcyBhcyBhbiB1bm1vbml0b3JlZCB0YXNr
IGJ1dCBpbnN0ZWFkIGEgdGFzayB0aGF0DQo+IGJlbG9uZ3MgdG8gdGhlIGRlZmF1bHQgcmVzb3Vy
Y2UgZ3JvdXAuIFNwZWNpZmljYWxseSwgYW55IGRhdGEgYWNjdW11bGF0ZWQgYnkNCj4gc3VjaCBh
IHRhc2sgaXMgYXR0cmlidXRlZCB0byB0aGUgZGVmYXVsdCByZXNvdXJjZSBncm91cC4gSGF2aW5n
IHRhc2tzDQo+IGluIGEgc2VwYXJhdGUgZ3JvdXAgYnV0IHRoZWlyIG1vbml0b3JpbmcgZGF0YSBh
Y2N1bXVsYXRpbmcgaW4vY29udHJpYnV0ZWQgdG8NCj4gdGhlIGRlZmF1bHQgcmVzb3VyY2UgZ3Jv
dXAgKHRoYXQgaGFzIGl0cyBvd24gc2V0IG9mIHRhc2tzKSBzb3VuZHMgd3JvbmcgdG8gbWUuDQo+
IFN1Y2ggYW4gaW1wbGVtZW50YXRpb24gbWFrZXMgYW55IG1vbml0b3JpbmcgZGF0YSBvZiBkZWZh
dWx0IHJlc291cmNlIGdyb3VwDQo+IGludmFsaWQsIGFuZCBieSBleHRlbnNpb24gaW1wb3NzaWJs
ZSB0byB1c2UgZGVmYXVsdCByZXNvdXJjZSBncm91cCB0byBtYW5hZ2UNCj4gYW4gYWxsb2NhdGlv
biBmb3IgYSBncm91cCBvZiBtb25pdG9yIGdyb3VwcyBpZiB1c2VyIHNwYWNlIG5lZWRzIGluc2ln
aHQNCj4gaW4gbW9uaXRvcmluZyBkYXRhIGFjcm9zcyBhbGwgdGhlc2UgbW9uaXRvciBncm91cHMu
IFVzZXIgc3BhY2Ugd2lsbCBuZWVkIHRvDQo+IGludGVyYWN0IHdpdGggcmVzY3RybCBkaWZmZXJl
bnRseSBhbmQgaW5kaXZpZHVhbGx5IHF1ZXJ5IG1vbml0b3IgZ3JvdXBzIGluc3RlYWQNCj4gb2Yg
Q1RSTF9NT04gZ3JvdXAgb25jZS4NCg0KTWF5YmUgYXNzaWduIG9uZSBvZiB0aGUgbGltaXRlZCBz
dXBwbHkgb2YgUk1JRHMgZm9yIHRoZXNlICJ1bm1vbml0b3JlZCINCnRhc2tzLiBQb3B1bGF0ZSBh
IHJlc2N0cmwgZ3JvdXAgbmFtZWQgInVubW9uaXRvcmVkIiB0aGF0IGxpc3RzIGFsbCB0aGUNCnVu
bW9uaXRvcmVkIHRhc2tzIGluIGEgKHJlYWQtb25seSkgInRhc2tzIiBmaWxlLiBBbmQgc3VwcGx5
IGFsbCB0aGUgY291bnRzDQpmb3IgdGhlc2UgdGFza3MgaW4gbm9ybWFsIGxvb2tpbmcgIm1vbl9k
YXRhIiBkaXJlY3RvcnkuDQoNCi1Ub255DQo=
