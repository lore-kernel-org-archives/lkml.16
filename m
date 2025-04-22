Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF913C3F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745345450; cv=fail; b=c1nWpz1HKFEts0IXzv4LKnkpeP9cRvkHh8UPvzw3D+yiLvrSrHoajEkMGO9fVSFL75g0T3qyq+WSzIRmawJ4RgMwpuqIIMzphUOBwUaESy2kUI1ffmhIzi5sjLvaUf81cE8YmEB2uuEjbwqMdLD6lTKKJJIaJISYZTDWR1tFkcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745345450; c=relaxed/simple;
	bh=nF8cN+ZrAPNt+xOW5oCVq71K9/+TSFFUCfPI1OEekaE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qu/V16+hVMurQtu1bUTBLilVjheWGNX0qZDY6b13fcloMfDeqegt9torb+3XaFWNqC8of+/WH0kZoQa5zz25q1ScXv12YEuyPVsh7Jrn3cslfgIMhGPHZnDhEAALbMR5CfLkLJjF/btDP2FwZ3Aa/DaVpuwfcPWU81zmczl612E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgTSDETu; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgTSDETu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745345448; x=1776881448;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nF8cN+ZrAPNt+xOW5oCVq71K9/+TSFFUCfPI1OEekaE=;
  b=MgTSDETuZduyS49R5G3+KDhw30cit6ge9AzAvZTt+CcJRuITB/PuM+UX
   R/7s3SHPn0/Na/Tkxafmxwsjg0XDXXkoOw19T1Z0wHEnzCxeXVhhgLxBd
   L9Reo0zN9E0wvLd0WTK3aizwPvGhwd7mqhyWcsNhDXWxm4hFUl9ZMZF+h
   sx71lMJMiVwBKqu7HbiJW4E0nW1Rw01N7u14Stl4FxbdCYZuT8BrsCzFQ
   rEqIzzueiOwFbs1MMCifQ9zFx6yC3cOCqPK2qnU3bBR2/eqzvSHYUzZjp
   9uwkRTdBOMYDHF/KREGPtZ+2dh3iA3+hu/CP4dEiH9IneZWc7mmoBTnH3
   w==;
X-CSE-ConnectionGUID: HirxKQ6MRW6OloQvoJYZ6g==
X-CSE-MsgGUID: e2NiQeGRRiOBK8jj7hJkvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69409040"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69409040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:10:47 -0700
X-CSE-ConnectionGUID: 2w+Qhf8mSGmXdQ9G4e9R+g==
X-CSE-MsgGUID: G55G9BxTTCaAxkI98+CfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132623727"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:10:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 11:10:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 11:10:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 11:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qchAtEQOsF6UElUSljTVVqHBTLgHbBxqjXKU6vMEmEK/M0ZZ7J+rbqub6n8Oa7PnTsTLuaZKY3iEdVq7tclvwEQnzWoTQFgqL1oU7IQMYAT7JIeA/fa/tSr7LxKjEcRNwI7eVbCeUFTj+ol0mm+y/GNkE+rqMc3N/IJsffheim9J0oUuaXETvWk6iPcSoOM164hN6TujosIDS5JQWZa0LsqgP7VmJHor0RgbzQ0ChKZ22qy+vUvxNrebaS+zou42Ktrt7Q64TNGxOizrksiJSiSo7UmkNJa+XG/mGaNXKedygAREuBlKDu4UXp0RlutewM1i2opAUInCxvzICkhwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF8cN+ZrAPNt+xOW5oCVq71K9/+TSFFUCfPI1OEekaE=;
 b=w9bz6wVrSzVgWfEvpWKoqWYGUCJyLbjazivtPWutz7iiSldUVl5Yu40KzL7ZR73MgNMp9mF3HBlsXTUqrFqivry0xQfSrjisYINHmPgFh8SldTu88huSgQ/rUMmNzm34PWaUdqkdHowQgrn6VqIWOxH895I+OTEjbzGpFZq/qQEvj1E1bSZE0EMeUleIYBAsa1G53NLXbi5oA6/iF0dJt+wf3Iu79+ErBIU1Q6xiqGKwwaxh2v64iFVFxoVSawMlSH6fVSuSRdWiusVbPj7UGIlx3NB+k+Y0+3+pZbyU9XEOl64oR6+Ez12dBh5JUq9K4P93vyGJplFj3JdrPLwapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 18:10:27 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 18:10:27 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, James Morse <james.morse@arm.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, "shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave
 Martin <dave.martin@arm.com>, "Ko, Koba" <kobak@nvidia.com>, "Shanker
 Donthineni" <sdonthineni@nvidia.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>
Subject: RE: RE: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
Thread-Topic: RE: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
Thread-Index: AQHbqwDpCJPCUxJEkkqlOWfnOq4757Ov+7AAgAAAndCAAA5JgIAAAdnA
Date: Tue, 22 Apr 2025 18:10:27 +0000
Message-ID: <DS7PR11MB607779FA7437306CEB8D08BCFCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
 <70403b1c-d81f-4c5f-936e-f3cf3308822f@amd.com>
 <DS7PR11MB6077A729E4338E6C62939005FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
 <93da0002-a326-49f2-af5d-f89da9d3a8f6@amd.com>
In-Reply-To: <93da0002-a326-49f2-af5d-f89da9d3a8f6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6077:EE_|MN2PR11MB4712:EE_
x-ms-office365-filtering-correlation-id: a0e159e4-ee77-4744-c968-08dd81c8f5d4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dEc4Vm4rTFVFUFBzV2p3cGpXTEVpTEFIZEY1aWFpbE1RY2dFZWcrc1l3Z2Zh?=
 =?utf-8?B?Yms3QWs1SkxJWlJ5QldBZ2FrZkhsRjJvNGxHUG9nK0pBN1NyTHdIMXNxTTJE?=
 =?utf-8?B?T1ZaMzl2NGNtVW9lNDU2SU1wcFdVVVhXbnlXZWkyNFBqSUxHM3FaRjhPY2M3?=
 =?utf-8?B?NDkwQlJVT21aaVJ6dkZkeWxCRGFnT0FNK0kxMGYzM2JBYlU5cUVad3lXMldo?=
 =?utf-8?B?Nm1XZ1dSbU5ZNEMwZmNQbkllMEpWK1Nncm5XeENHdDZuWnl6dEFFLzBRS3Rm?=
 =?utf-8?B?aWY5aS9pVVRvaE9jNjU4RTJiNnFhSmtSQXNXQm5QWm9ZZDF0NVAvQ1JyNTlI?=
 =?utf-8?B?ZncvYjFrbHY5cm1zalJMZjBjeG5tcnJZOWkwQ3h6QUpmRGVjNW03cG02Q1RH?=
 =?utf-8?B?K2cyeExxOXM0cHhMdGxZa2lzNnRxZHFMNVY4bk1XRStFakxpZEhPWHllNTBX?=
 =?utf-8?B?dGdMclkxRFpYT1FVTTFlK1IyTzJ0cy91dUxkdVB4Nm05d0lCWGk4V0puSk5V?=
 =?utf-8?B?U3UrMUVlSDZMWjNhb0g5N0lTN1Buck1nRy9ocEJxUE1jMXQwdG51ZTJFMmZr?=
 =?utf-8?B?MVhHNDNnVjMvbUVOVUZ2M0hOMG0wWDU3QnRqVVl5YjhaTnh5RzRWY0xMWFF3?=
 =?utf-8?B?WEVUUUp4NHRvUTluUkV4TzI5YmJ4SjRNOG8wNFQ2R1hsMGxySFBmUFZGenB0?=
 =?utf-8?B?c1g1VEh1QjF6YXNPRC96TVNLWEJVcHRMaWdDdlBHQWgvK0V6SURiS1IrZWFz?=
 =?utf-8?B?LzBrUDR3Rm8yYyt6K2NKcVN2WXYySlJqRmM4L1ZacHBkQzFFN1UwVWlOMmQy?=
 =?utf-8?B?cHBWUDNYNmpVelB5Si9nM2dVSS9wUjBZdE1TckVHY3FOQ2s1bC9RZC9oV3NE?=
 =?utf-8?B?K1kySUQ4ZmdpZDcwanROamlJL3ovcHEvUE5aTGRLY3kwNWhoZTgzL3U3bW83?=
 =?utf-8?B?TnBkK0RYSWFMVXVCMEREait2OGFFUzVwUXV1TTZjUWExaWl4RVNHSDFhMHYr?=
 =?utf-8?B?eWU5SWdNdXRoSGRSZUJIVWhHcXdnbk5ORkpnQUZSUUN5aTFaWEJHbjE0eDB5?=
 =?utf-8?B?VHlONGNwMDFuWTFhZTR3dnZIMWdlbklMTnV0YXVjTk9MQ2VMSHdZOUNTZVJF?=
 =?utf-8?B?c3pKTVpwTzd3aFdDWGF3bDJDeVg5RVo5QnNDeCtxL0FpcXltczVyZUU0ZGp2?=
 =?utf-8?B?SnBxbWhUKzlsbDlCbzZnQnRRSnN2bkY4d01jU0hJWU1uTmwrWkEyMzB0WEFx?=
 =?utf-8?B?RHdPb21DY0Y0K3NvWUFsakttVzJWWXZRMWsvbit3VEg2VnFXbEJLaG1zcExD?=
 =?utf-8?B?UXNmUVI4TWxjOWF4NnVSbStyeTRMTTdSNnViVkpRditnVjMwNU1iMDVjSXNS?=
 =?utf-8?B?L25xZ3RhK3hYTUpRVW05RmJ3SHFzYjZoajY2clpBSXRyUTQwRitVbzFPZlYw?=
 =?utf-8?B?N3h4T3dQNkcxRTg4dTI1R3BEVWN4Z1E4VXNmSTJnNnVyLzVybXBNRXZUZFNU?=
 =?utf-8?B?QUt4RHo5eHp5NHNQODJBYVZsZnZNbmhMdFdXK0owd3dQSzEwSkNiMlljb2pF?=
 =?utf-8?B?ajArQTN2Q1c5U0Y0TVZjbDRaUERMY3laZEdPTHE3TWdET0xqK2Yzei9LS3Bs?=
 =?utf-8?B?OWl5WmNiQ3RDWE10czdpN1ZxS2QzQTQ1a0Z1QndwVWdDOGEwRTVmR2VXK3Rw?=
 =?utf-8?B?Vkx3cGVMQTAxQ1EzU2VhbkcyeW80bnpzalJja0wrMDF2RERwWnp4VWo0Wkpt?=
 =?utf-8?B?K3hJbE1HMFowUmdkQlpxWXhUMUIwaE95T0FQYWVjQm1HT1ZBTWE3Y3hDRGFk?=
 =?utf-8?B?RzJYbUx2Z0tyb09tNzczV1F5VE42WE5ZcEwrN2tiSzZ5YU9LTEt6NjM3aXdj?=
 =?utf-8?B?VDdIRHlORnhGOGpMYVI5dERBVDZzQjczc1kvdWkyMUI2czBiNTg3OU1QMUtS?=
 =?utf-8?B?UGJLc3YyaGlKKzRZKzJuZDYwMmNzOFgyMmRFWXlGVktKQlNYcHJGYi9jak94?=
 =?utf-8?Q?1L1ReBsJqbmPCl0zX30UzCeiw0z8/A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEk0eDg5MkM1OUtrOE9ROFE1MW80anVDZUs4YXFrNFRnMExCaFNmMFNXTXQr?=
 =?utf-8?B?RjZ3dklVQUp6b003ZTZyOHVGdnpaZnFxUlpJWUlMSFZJWDFRNndvMW0vN0FQ?=
 =?utf-8?B?a1M1bGNlVHMrVlRldnd1ekI5a2dQUE84MzYvQnNpV3daTGo5TitQMm9oOU84?=
 =?utf-8?B?WFVVeVR0Ync5UXNFSEVPQzVIUzR0aHNDVERrdkE0YVVOQ0JMU25WM2RiVHFs?=
 =?utf-8?B?MUlzUlJ4OHFVdmI4WEE3MGY2b0ozRFdlL25lOExTdXIzdjVUTHk3Z0l5T01O?=
 =?utf-8?B?UERUUFJlZzVORFJJSVg4WG82cVA4anVxZG9VMDFINXFNYWJDU21BVHpLc09U?=
 =?utf-8?B?RnVvaElTNXVEdnZZa3QyWnFDL0E2OUp3S1Zpeit4enBDQy9oNUZtSUR0Ymto?=
 =?utf-8?B?RjFkVmRPaDZ4ZWtyMFZOa3FkN2tWeFZqUG0yVFJTdWR6cnNwbHpwUHhZclBz?=
 =?utf-8?B?RmdpNy9Ed1JnM09wL2hXbFMyTFNxQjJUSjFvSllFdXVEQUFhbmZsb2s4TEVi?=
 =?utf-8?B?b1NVdTU4VkJTazIrQWNob3dlb0ZKYVJxcGNvNjc0cUhQcVpvaUUxbjB4bTdB?=
 =?utf-8?B?RERwdU50UmRJN0xqYlVSc0w5dXJoVHo5RXNBdmtEZ0JVMm5zT2ZkVFM4dldD?=
 =?utf-8?B?cjMxOUFKRG9jSzJJN3ZTU0dsZERjbGlQTy9xRDBrWDFIQ2JRUlJMVy9yakxa?=
 =?utf-8?B?d1B0RHh1WlhaZWZUWDlZNHZzQnhLR3hlSnlHMG80SVkxRDhXc05XdFRaOGRv?=
 =?utf-8?B?eWRqU2dxTDFQcTRMdDZRa3ZJdXU3Z2hsb084UUN0dG5XMlRTRkVIZ08vV0Q1?=
 =?utf-8?B?WGVUVmRhcFc1cGFvOVAyeFdvK3dxR3MxNURFaUtESnMxZFd2MWxHRFhXNnVs?=
 =?utf-8?B?T25MbFZVT29tUkExVEdqUWtQbm01d3Y1aDRvRzdXZUgrbnlyT2V3UE1DT2xz?=
 =?utf-8?B?UzIzVDYrR1JUamJSOHRBNTlsVnA1ZGJFV0kvTTZ2TmUvQmxZalA4aG52cUU1?=
 =?utf-8?B?cjhlRElVZUV0ZjN4YU1ZOG5NczJyZ1JiM2QxZDNNUFRCTTYwRktXZ2RmU1NB?=
 =?utf-8?B?QlpvT0FtMkdXUlgwN0hNcWhOUHUyUDJUa2RxdVU4bjJHdmkrN3pGc0xVN0Ny?=
 =?utf-8?B?QW1ZY21UamswLzdPZzRyMFFmUlhreHMvc0hCOGxBV3JJdm1Cc0hjaGVTYmYy?=
 =?utf-8?B?aXoybnFoTnBJYTR6dk1NUHE4Vk8vMlZRaDR1KzcyRzduT08zdTRqYXVMZGlk?=
 =?utf-8?B?MlVvT0EvRkZZZ2g4OHpSaG1Ed01kMzRhNVkxU3RDMXE5bUdZbmkvdndwZHVm?=
 =?utf-8?B?dEpxL2RIV3BoMVoxN2hrcVh5WDZuaGYzQTMwK2ZCcm9qSUFQQXB3R1l6VTFL?=
 =?utf-8?B?bFNQbXFoam5VUjY2TlhCTDgwbDJRZU4xb1RoREtOcFFDM3F6UEtqWHptenFH?=
 =?utf-8?B?c1FjZlhGeFdVYmloMUJlanZ3S1JNcENSMTRJTDQ2Y2c2SGdHL21FcDQ0dzJn?=
 =?utf-8?B?U2t2UGFwMkdzTTZ5MGxFR2s3b25JanVUVDVkMWh2ZkwrYW91a2lYU2swNmgx?=
 =?utf-8?B?cDRjaE04K0pONTBOM3hMNXgwc1FWcVpBNWxObmdTM2F0Mnpzb1lRb3ROQ2lH?=
 =?utf-8?B?U29DZ0ljd3hNSUI0QXF1dlVhSFEzOWYyQVdGRVplRW5GTzJjL3VPY2s0WWs4?=
 =?utf-8?B?VG1vRlUyRUwvTlBGMlVnTGdVRVdBWmtCWWlsSU5uRldGbm5aSktKWmhmbGFS?=
 =?utf-8?B?TFJKdDBBbXZqU2NJTnhiN0dMbktxVllqWkZyNnkvdkZCakxudkMvU25lNEVy?=
 =?utf-8?B?aHBZcGhCbE5qL3hLbWpCNlVyUjVBUHRNVkJUdVozNm9CSkN0WEQyNVJ2bmRU?=
 =?utf-8?B?NDJKMVRBUlZKM2h2RkExTERRRjVHNUVVNjFJVTRyenVwbVB0cktmSlJ0R2ZD?=
 =?utf-8?B?UnRzbEwzTmNCRSttQk1vWWJYaGtsZUphdDdNYXZjc0JtK2xIem83R3NHZ2o2?=
 =?utf-8?B?QjBTVjc4c2U1b2xXTE1WWUFqM243aVZnN1NrTXV3cXRPRURacmU0U2xST09K?=
 =?utf-8?B?bWJQNStzdjJYQmd0TDR2aXVIZDlubmNiSVE1MURkRWJVOUpGcnlPV3BMUGRm?=
 =?utf-8?Q?nkwMwKLuNobrvWe1JI3tr+MQ3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e159e4-ee77-4744-c968-08dd81c8f5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 18:10:27.4205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7W0X0B+5PCFLmntWAnNCf2c3KlWtpTcEzWNP4b4TrmNC3n6X4XkDN5REIBTE20a9oEIFvxm6TKdQnMQ9MmkdQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
X-OriginatorOrg: intel.com

Pj4ga2VybmZzIGxvb2t1cHMgd2hpbGUgY3JlYXRpbmcgbmV3IGdyb3VwcyB0byBmaW5kIHRoZSBt
YXRjaGluZyBvbmUNCj4+IGFuZCBsaW5raW5nIHRvIHRoZSBzYW1lIC0+cHJpdiBwb2ludGVyLg0K
Pj4gDQo+DQo+IG9oIG9rLg0KPg0KPiBJIHdlbnQgYmFjayBhbmQgbG9va2VkIGF0IHRoZSBoaXN0
b3J5Lg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAyMjgxOTU5MTMuMjQ4OTUt
MzgtamFtZXMubW9yc2VAYXJtLmNvbS8NCj4NCj4gU28geW91IGFyZSBzYXlpbmcsIGtlcm5mcyBs
b29rdXAgbWV0aG9kIGlzIG11Y2ggbW9yZSBjb21wbGV4LiBTbywgaGF2aW5nIA0KPiB0aGUgZ2xv
YmFsIGxpc3QgaXMgZWFzeSB0byB0cmF2ZXJzZSBhbmQgZWZmaWNpZW50Pw0KDQpDb21wbGV4aXR5
IGluIHRoZSBjb2RlIHRvIGNvbnN0cnVjdCB0aGUgcGF0aCBhbmQgZG8ga2VybmZzIGxvb2t1cHMg
dG8gd2Fsaw0KdGhhdCBwYXRoIChzaW5jZSBrZXJuZnMgZG9lc24ndCBwcm92aWRlIGEgcm91dGlu
ZSB0byBkbyB0aGUgcGF0aCB3YWxrLCBqdXN0DQppbmRpdmlkdWFsIGRpcmVjdG9yeSBsb29rdXBz
KS4gVGhlcmUgd2FzIHNvbWUgZG91YnQgd2hldGhlciBKYW1lcycgY29kZQ0KZ290IHRoaW5ncyBy
aWdodCBmb3IgdGhlIFNOQyBjYXNlIHdoaWNoIGhhcyBhbiBleHRyYSBzdWItbGV2ZWwgb2YgZGly
ZWN0b3JpZXMuDQoNClRoZSBsYXRlc3QgdmVyc2lvbiBpcyBmYXIgc2ltcGxlciB0byByZXZpZXcg
YW5kIGRlY2lkZSBpdCBpcyBkb2luZyB0aGUgcmlnaHQNCnRoaW5nIGluIGFsbCBjb25maWd1cmF0
aW9ucy4NCg0KLVRvbnkNCg==
