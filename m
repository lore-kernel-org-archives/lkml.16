Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93420170A37;
	Thu,  6 Feb 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865151; cv=fail; b=sHt1uX/A87WNJFRmgzHdgkE0eY6OGHwucuGUwFYvp7tXpqrquXijYkM6Z6WlobK3oBkOIv+ou/I32/ugIw0f7r8HH2XX/rQThTD8uhdRO4W8VG65ful3EUU2kommYLiG166qaFmkZGD+7OdmziW2T02TxN6NoeI0CxqsV5g0Wks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865151; c=relaxed/simple;
	bh=SUd/59chPtF7dvo6NT2suRHDNB19zLQP2HQNMKhVlzk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TPUPD+LYHisbBrnh2k55dDc5JofCYgFV40TBSXPFba7ApN4OM8FrrVlFIF3nRpjTakm8miKHCRKyflAmKhcOF7WxOMyQfRcirO3O3r0lepLpkX5xsbsgnEhSQfddfyibpK5Su9nwkqhKEELOLb+dQdePoKyTzX+EGAcO+K/IdL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRA6x2ay; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRA6x2ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865149; x=1770401149;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SUd/59chPtF7dvo6NT2suRHDNB19zLQP2HQNMKhVlzk=;
  b=VRA6x2ayRhTWL8iQEevoF/QXFg+rS0IIAw/cj7C+1UL0DnmbbciAYSRs
   c8MlqkQBkChv6TqtNCOFfQfL1Xp78LwNLYO04Ecaa4tVDMMHzMPUH4Yhb
   0x6BrtSHZQxpGGUn7lCoybM4FabDC0lthuprf1IfCwKIRKaTbw6B7LHmh
   nmjKw6ojjKl9JZTCmi6nWT1A2HpjPfGX4rF4b61+KFS0VWNjDrrBHg9KA
   ub9Hlz10AZoqmmAinfY3SwZovTEXD4z/OIFLKQ0c+B0GxLCd/8i245+Nm
   3mzhgD5yrJg+/3DMrScVyN7itrslxMYrtpF2x1af7aSX6sFRU/sKjBVDs
   w==;
X-CSE-ConnectionGUID: ysW063yaQFWri4WaN5M99A==
X-CSE-MsgGUID: 3rE4vXWDTY2zZeXqyQDVvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50877459"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50877459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:05:49 -0800
X-CSE-ConnectionGUID: FIdrhWdnTTq6RXZFi5ol/Q==
X-CSE-MsgGUID: oKhPcwk8R4qv3qsyhqIrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116317048"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:05:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:05:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:05:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:05:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI+pxWj3aefSUoU4cGk4bpa8Gjuku7WBMnE0xb3wWUYFzgozj5ui3Da+evxRdCfMDk9TeP1h1eUxiMdGQLorv2bVg+ISjLlQWSwPNiqxyY4db7V3PBAYIeXsujT5nsTiA90mMMTSmsZR7H0n3vrfFESoW7CDg5uF/vPlJrWxRpZc5MCxjNYq655J4Va6Jdje+ppbPOTGO385KTCt0IozhL9OzndkWNsiOwnqyHlAazs3Thot8f2wu3/0Fsqwa5YhZZ+v15SbCxN3PC88y69qdFSIr3j8Glp3tOQ6d1XLYPLnOV0u5TqYKCBHF7Q48ih2j13/pW4hNXrbguJsazt7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYgPJsyB68g1bIIvDKl16pqFDfHZVWujypg1acLH2yU=;
 b=gH3nbe480KzDbxrTeknK5lgJu7myRchWftz9UCo92rTBLzlXhZ/Rt35stwuWtpaKb5v6ROXFEOqTKMGCivYKkhPue413zpHmCwg231XG9wAT1k+XgQOtOVBrCl/CASo6Nkx3XwPI9LMQbzcC6eaX41OqzVri9qAwYwgDm8gD1dFl+XXlcF6wCU2G+qleUBZS91fYUSWgZy6LKG1txj2rrajXQKRzKmOzMsl3oI9SeK0Jq7W9xnt8rzxQHrjEEwhhAxOFRhwgMTXts0T8k8l0cDAsKlZCwdd0QfXTLcZ5AOMgNrvulDOCgsadUC2EtEejRyxLT7z6x3GH5c5oG/Tgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 18:05:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:05:35 +0000
Message-ID: <b60b4f72-6245-46db-a126-428fb13b6310@intel.com>
Date: Thu, 6 Feb 2025 10:05:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 19/23] x86/resctrl: Introduce the interface to switch
 between monitor modes
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <cee46a0ddace8ea05ca5371a93dfc53c71016c77.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cee46a0ddace8ea05ca5371a93dfc53c71016c77.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0243.namprd03.prod.outlook.com
 (2603:10b6:303:b4::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a859b70-6fd4-4aca-4857-08dd46d8dac4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnFSQXdmbkJnMjYrdU9QZWdldzJqSXkvdHovRDllZUN2cCsxVTdORjlhSk9Z?=
 =?utf-8?B?SnIyV1V1aGUrY2RaWE0zaTUvNlZJalJGSDFCRS84cEpGM2hob2FabHNpR082?=
 =?utf-8?B?dS9IVzF4Y0MyK2pWeCtDVndvR0pvK05jVmF6UjYyZE50dFFxV25NeGlBZmY5?=
 =?utf-8?B?ZFNiOG5CZHhxTFkyaVUvMjZRcjJUaHJ6T2svVmwxU2ZYUE1JWk5yZWZvcTAr?=
 =?utf-8?B?Q0Z1U3lHUjV2d2dlRTNEQVduYTF1TTVadmhrRXMzWmJVMmhhNFBHdUZ3MFRj?=
 =?utf-8?B?NlpSNVBGTE9vSGNPN1dzWTVuZEFWL0p6N2pkM3IxVDdGNEFGcEFnMWlGQlRN?=
 =?utf-8?B?UDU1M1hXajVNUkt3WW5BcVpIbTA4SXFVc25OTFZwVXZScFMrTzZmZTNPSWFT?=
 =?utf-8?B?TXpZdWRrMW1RM3Zya2xwRzVyRFdmNlpFUmo3THpVY0RrN2x4K0dMbDhoOFRI?=
 =?utf-8?B?bTJrQzd3dmhZUDNzNUpCQURJREU1M1JBYVBGczhLcnZESDJRTlZsd080QmZG?=
 =?utf-8?B?ZnFkVmlvakx2ZWYyUW5ia0o5anN1OWoxc1d2cndBc0RVU2NxQWs4ZTg2L2lX?=
 =?utf-8?B?ZjhYeEQrK0d4ekRMenhNYllFUlFienRQSDdySzJ1ejRuVWx6QndPcFdTWXBG?=
 =?utf-8?B?bTZJN01HWmlocjVxQW5GUTd2Q3pTclhBTDd4bEdVTmw0L1c1aG1pQ3o1UWVO?=
 =?utf-8?B?TFBnUEFoWTFqbmJRUGhhQXVCYXNSdVIrckt1Q2pHVUgvR0tUTFdINXluaFAv?=
 =?utf-8?B?OWJVWlk2dmdnZ1JEY1QxUFF0c3NEWnhWSlZld1JKQVlIQXVtaHNaOWNjQTVl?=
 =?utf-8?B?NFZxOGRmNkozVEwray9YMUtmYTBVOUNJbGxwU3QwK1A3dk9hR3Z6WTArL0g3?=
 =?utf-8?B?V2lGa3M4OTkzd2dkaG5NeW1sTzh1ekcrT1YzbkhqVFU1Y1FFWXU4ZmZNTU5Z?=
 =?utf-8?B?TjdRVk4vSDJlN0ZOUEtLWjBKd05JWXNiTklPT0JRSmtJbDZKWitGUEUvcFJL?=
 =?utf-8?B?RlZNek1VbnpMa1Z4a3F0YWo1R0g5TWlXUVZDSEhXejFDM3psUHNoS3pGN2xQ?=
 =?utf-8?B?djZuUWdPODM1YWc2cDNDSFNyRGdqMzEyZ1g1aXlXR0Nlc1BOQWJ0VGJ0ZUl1?=
 =?utf-8?B?elBiTGphUHVUQlVJTlBkTE9sVnFxMGNyVjJqU2VIZlFIaWsrQVhKazBaMDc5?=
 =?utf-8?B?THBuQklRcmFGWG9xYUZSMXhCa1NEbUIvYi9OMlJCeXRnTWk0bmpROGdIa1ZS?=
 =?utf-8?B?dHo5RGFGcUpzaWhQZGNIVGl1VXF1YVEzd2IwQ0dkYjUyWHhPRng3VzJHKzEy?=
 =?utf-8?B?dzhRK0Z2ZUFVOTRZZk1BV1pabVBKbGl5SVpqb3V1QzlFcjRrcGpKakZYNVBI?=
 =?utf-8?B?aU9mYWJrU21rZzVxTlMrNDg3cUxkelVEdm9RMERRZ2ZpZnlQV0p5aUpaWXZv?=
 =?utf-8?B?OW5LUHBpU3hQYkkreUNxbDhrS1NIT3I3VDNLU2U1OSt4SHJvNDJOcmxQeGtG?=
 =?utf-8?B?TkM4ZDEwYjB1NlBIQWRWeG9rRkZwM2J4NmxxZmlJYUVIWVBBNm9TY3F6Tlls?=
 =?utf-8?B?RG9tM3kySDF6TWdxdXJtUGJpeENzYzFTWDd3ZTYyaFlWQUp4VVIrdmEwWm5h?=
 =?utf-8?B?RXpLZTRBT2t4aHBiZVJyM3BBcWg5VU01eGhaL2VwOHpGY1h5WU41N0hpVm9C?=
 =?utf-8?B?TzYzMEsrZlNRbHcrNnBrQi9mSWYxU045a3NMTEo0U1ozQ3ROeGhzeDRlc2Rl?=
 =?utf-8?B?VEFpWnArS0ZJR2hxbGlCMXBiSVJOVWFJNFI3UENUUWxoVlVyYlR1ditxYWZv?=
 =?utf-8?B?eXRaby9DWU5neFBxRU8vbXgxMzNyNGVjZ2RHVitpWWh3WVdhMk9kVnNKVXJB?=
 =?utf-8?Q?43Kk0e8E6wixY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHc1akJjbzAwSk1Dbk9iWEJPNDh0Qkd5cTd2OWhVak1Db2hrVW1QQjRUWGdT?=
 =?utf-8?B?QnU2Q09uSWp0VU5hK3VJTkN6ejNhU0crK2ZsVjVTRzREeWx0Wm1JUTFPNW1R?=
 =?utf-8?B?QVhhSklZY1NOTnBXUUVJb3BtSmcwRWdTZ1FWREgxZVZQR3hJTFRsY3NnUnBo?=
 =?utf-8?B?Uy9qc3dhZ0RXSlBHS3V3WWRwZXpudUNIR0NRZXlHblVYSDVyaGhsZUpDYWJ0?=
 =?utf-8?B?NFRWL1BuRkxBbnRRV3A3RnJXcGVHODZtNWRMM3dzejFEQlNSRFRXdzl6SXlV?=
 =?utf-8?B?WnMyeTZCQ0N3TkZ1cGhWMm1TQ295eWlZK3VEejBYRTI5MWg4RXI2ZkphZSsx?=
 =?utf-8?B?VWFoTnFMZXRDaG1lQW1GZ0lMMHVPYVUxV2JnQ0cremNSeXg5TU4zOFJvN3VH?=
 =?utf-8?B?VWkwZy83Q3dlL1BsT05hTFd2NlFlK1F4N3IzNjFkYW9jay9Td1JjMHpjZmNy?=
 =?utf-8?B?TTNQN3M2azhINnhTUWd0dTVnazVJdjE3REhpcEJDT2dBQy96SXJJY2pvRmZJ?=
 =?utf-8?B?bFY0T3lnOHk5QkFIN3V4Q0l2YitPUVlQN2EwYjZuVDluSjlXclhwOG9GZjZZ?=
 =?utf-8?B?NGhSdlJNb0s5Nlp0TTJSZXlXNi83YXVuMjY3cUJCQU5CL3RzRGV3TkkrRnp3?=
 =?utf-8?B?YW1xSXQrMGtrSWtBdXJpSjdYUG9iQUxkYW9XdENOVkNmYm0vTmtseWdnbU1U?=
 =?utf-8?B?MjdYYVlGTDV1RmZOUldiVlZOdGpBZ01TYi80V2Rvb2tCZ0tVT0VncFNXMjNs?=
 =?utf-8?B?QUpEWXF0RC8rV1J1QUlScGM2KzQrWUlBTThwTEpjdDBsc1JOREFvbFdGTk9L?=
 =?utf-8?B?d3BYY0Z0ODQ4K3k2R0VDb3VnejUxQUtqcWF5YUJ6MnJvd3Rnb3BvaXVleWpz?=
 =?utf-8?B?clY2V1RkMW9Gd2ZqTUIzaTJEYmJUY25zTHdsMnV0bmRCRlhsWVl4Zk9WdmlN?=
 =?utf-8?B?ejMwcDh5eCtCY3hXN2JLZGNUSUVjaThyVUJhQTV3azJ6ZUhzNVN4cDl3bm9Q?=
 =?utf-8?B?ekhPb0tFWEIzUitUa1NPNDBwNVV0eklrVC90RXVPaEluaEgvdnlsWTBQYmxU?=
 =?utf-8?B?SWg1WlpMQTltYUg3aThBQ1BWUWROOHcvMmMvcCtsUWNiYXhTcVF5RjRKWmhp?=
 =?utf-8?B?NVVlMzhEK0d4NFEzUS9pQmRNSlNKUUllcVNCZWt0YzRjMzhYVkkwa2RDTTJP?=
 =?utf-8?B?cVFReVo4UDQxTHBDNDFhUUtJWFA4OXBPT3NQc1BRR2NjbGF0OHQ0dXlnT1lu?=
 =?utf-8?B?aVpaOGVjbE9hZmVxekF0QWRBaDJkaGozSGkxSlFrb1JFbmZxUUU3bHM0L2l6?=
 =?utf-8?B?QllSTWFTNEQ3enVXZDUra3ZSeXMxSTRaMXpiN2tVWXpnL2VtQVM3UmdLUkRn?=
 =?utf-8?B?dTZwdjdNRWN5SW9wOE1FeU5PL3ptTVhqVEFLTkdaWUxNa0dCTlQxUWFMZTh3?=
 =?utf-8?B?Uys3ZE5yeEdIQmxKc3hLQTFjWUI5SEVMK1dzVXBRbW9yZms2RTVNbHJjR1RQ?=
 =?utf-8?B?d1dHempLRTBBTmVyY25PQjFLbHlRWXNWRE5wM1NvVVVEbTJBeVhlZmtXS09V?=
 =?utf-8?B?Vlg2KzZzOEJVYzU4V3FWMVBNZWoyV1VNUkc4eGp0Rk9lSHRYbE03dHI3YjZa?=
 =?utf-8?B?OG4rWm5OWE5sNURhUGY2MTE2TUcyb09jdld6UUxrVDRseGpMR2RJd0VaL2ph?=
 =?utf-8?B?TjZaUHhRZm1KdzFWMVlnZ1haRVlldFlLazAwMkZjSUx2cnE3TSs2Z3dMRFk2?=
 =?utf-8?B?YmZncnZlVHJTUzRkNzRoSTE2b1JZZXl6M1hGR2VERy9VZDZGZ3kyVm02VHdI?=
 =?utf-8?B?cTZESXpoZnh2OTFGdUUyL0lFcFhIZm9NaTR0dkxYZ3V3dHU0bHJ4SXNQYXJh?=
 =?utf-8?B?S2xGU3B6NjlpaVQzNXBRSm55UC8zMnNRd3lwUXNoNlU1NVVZVjEzS09ZQzNz?=
 =?utf-8?B?cXlaMVFObDN2OER0RGdNSGRXUjF2UnB4U1d6RzNXcXBuUEd3VFhhaEdvKzdO?=
 =?utf-8?B?ZzQvcGhHZDF3bk10QjJ2aWNhOTU2UU9qTmxpRTZQM1hnL2lIak52V1VvdTVX?=
 =?utf-8?B?K3hYdGpuS25maTRyTWRGSHdocmgrSSs1alJ5S2pqcVZYcEtHTk5qMy9CSlov?=
 =?utf-8?B?eEJDSWZJaXd0TitCNUxNNmVmcXJ0bGFYMmJYakVCTk1sWTg0eHF5b0xFM1JI?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a859b70-6fd4-4aca-4857-08dd46d8dac4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:05:35.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ri+pFvD3R2mansqps1Ny9Nb/PdNbKhFYKoojPfxypN0Yrqk2ABwbA/tIoNvkTGV4WYwV8B8xenX9ZcnfIgl0Jj7ts/qjiQECJJp6eUIjr3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> Resctrl subsystem can support two monitoring modes, 'mbm_cntr_assign' or
> 'default'. In mbm_cntr_assign, monitoring event can only accumulate data
> while it is backed by a hardware counter. In 'default' mode, resctrl
> assumes there is a hardware counter for each event within every CTRL_MON
> and MON group.
> 
> Introduce interface to switch between mbm_cntr_assign and default modes.
> 
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_cntr_assign]
> default
> 
> To enable the "mbm_cntr_assign" mode:
> $ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> To enable the default monitoring mode:
> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 
> MBM event counters are automatically reset as part of changing the mode.
> Clear both architectural and non-architectural event states to prevent
> overflow conditions during the next event read.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---


> ---
>  Documentation/arch/x86/resctrl.rst     | 25 ++++++++++++-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 50 +++++++++++++++++++++++++-
>  2 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 072b15550ff7..5d18c4c8bc48 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -259,7 +259,10 @@ with the following files:
>  
>  "mbm_assign_mode":
>  	Reports the list of monitoring modes supported. The enclosed brackets
> -	indicate which mode is enabled.
> +	indicate which mode is enabled. The MBM events (mbm_total_bytes and/or
> +	mbm_local_bytes) associated with counters may reset when "mbm_assign_mode"
> +	is changed.
> +
>  	::
>  
>  	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> @@ -275,6 +278,16 @@ with the following files:
>  	available is described in the "num_mbm_cntrs" file. Changing the mode
>  	may cause all counters on a resource to reset.
>  
> +	Moving to mbm_cntr_assign mode require users to assign the counters to
> +	the events. Otherwise, the MBM event counters will return "Unassigned"
> +	when read.

Again ... please be consistent in using single or double quotes for information
returned from file.

> +
> +	The mode is beneficial for AMD platforms that support more CTRL_MON
> +	and MON groups than available hardware counters. By default, this
> +	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
> +	Monitoring Counters) capability, ensuring counters remain assigned even
> +	when the corresponding RMID is not actively used by any processor.
> +
>  	"default":
>  
>  	In default mode, resctrl assumes there is a hardware counter for each
> @@ -283,6 +296,16 @@ with the following files:
>  	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>  	there is no counter associated with that event.
>  
> +	* To enable "mbm_cntr_assign" mode:
> +	  ::
> +
> +	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +
> +	* To enable default monitoring mode:
> +	  ::
> +
> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +

Please be consistent in the documentation.

To enable "mbm_cntr_assign" mode:
To enable "default" mode:
or
To enable "mbm_cntr_assign" monitoring mode:
To enable "default" monitoring mode:
or 
...?



>  "num_mbm_cntrs":
>  	The number of monitoring counters available for assignment when the
>  	system supports mbm_cntr_assign mode.
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index f61f0cd032ef..6922173c4f8f 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -928,6 +928,53 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
> +					     char *buf, size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	int ret = 0;
> +	bool enable;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!strcmp(buf, "default")) {
> +		enable = 0;
> +	} else if (!strcmp(buf, "mbm_cntr_assign")) {
> +		if (r->mon.mbm_cntr_assignable) {
> +			enable = 1;
> +		} else {
> +			ret = -EINVAL;
> +			rdt_last_cmd_puts("mbm_cntr_assign mode is not supported\n");
> +			goto write_exit;
> +		}
> +	} else {
> +		ret = -EINVAL;
> +		rdt_last_cmd_puts("Unsupported assign mode\n");
> +		goto write_exit;
> +	}
> +
> +	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
> +		if (!ret)
> +			mbm_cntr_reset(r);

The following APIs interact with the MBM assignable counters:

mbm_cntr_alloc()
mbm_cntr_get()
mbm_cntr_free()

mbm_cntr_reset() appears to be related but does significantly more
than interact with the MBM assignable counters and that creates a
confusing API.

How about introducing mbm_cntr_free_all() that _only_ releases all
MBM assignable counters and match with mbm_cntr_free() that releases
a single MBM assignable counter? mbm_cntr_free_all() lives with the
other functions operating on MBM assignable counters, thus not
hiding its functionality in other parts of resctrl.

This series open codes reset of non-architectural state in two places,
within mbm_cntr_reset() and within mbm_config_write_domain(). That
can be turned into a new helper that only resets architectural state,
for example resctrl_reset_rmid_all() to match existing
resctrl_arch_reset_rmid_all().

resctrl_arch_mbm_cntr_assign_set() can also reset any architectural
state leaving mbm_cntr_free_all() and resctrl_reset_rmid_all() to be called
here and from within mbm_config_write_domain().

What do you think?

> +	}
> +
> +write_exit:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1945,9 +1992,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "mbm_assign_mode",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= resctrl_mbm_assign_mode_show,
> +		.write		= resctrl_mbm_assign_mode_write,
>  		.fflags		= RFTYPE_MON_INFO,
>  	},
>  	{

Reinette
