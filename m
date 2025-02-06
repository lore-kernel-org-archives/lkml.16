Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83203151995;
	Thu,  6 Feb 2025 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803127; cv=fail; b=mQWM0qpIX2REPhGoPgzIaHSuF5HE3iyM093owa81j3xju374dvOArnpcLf5iFnIYm1r+JnLEjPTu/qcZD7hYY2w3HKDphPAgpIaB58eUEd78TqZg8WLViBA7cBL563T1RePtpXQq46oKzrWGO6KomDYIVpnM1+yfOF70TTACmeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803127; c=relaxed/simple;
	bh=RxPPAkJRu80LBv9I9VP7KIZX197m++ON/XIP7X4UPWk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qew95AHQjWDjB2xGBqFs5Ehe2/hi5qmim1TfCmloBb2lOAnFnFzkUp8hAeXOqNZh21w/vQjwRb0NrGoC6N4E8/jE4w05FfOkZkD0EGp1aCI0fTbyRhX6ItoO7tex0CMpGChkDNf7M3xR4RlCJkg9Xm1ryDVCxk20A6cce3t5+JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTwbxJhu; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTwbxJhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738803126; x=1770339126;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RxPPAkJRu80LBv9I9VP7KIZX197m++ON/XIP7X4UPWk=;
  b=CTwbxJhuS0JXiaoA0hHS4agAbK9oi8+wmhqTyKl4ePZ3w7D9JSyCtTdk
   29TYMtR7zTVYXdM3/5cOKswn3DHt2B9Ukvr8+YqjDftBASfInSK3z4Uny
   poYfrKPIpeuBTLJt+eoqPoeh6NaVqryXwrkyABOJOLSGHbBJ0U+5vDv9X
   ZpiM6RIE/2BME+gPOfGw/uEBj5hcMMxhPSOrgP2NeCT5qvoHtV/14q6ux
   x41paX1eX+EyeptKWsO9DuzAnifrLYFfrgtW3NJjP4cNHD28HGMAfKj6n
   K4Fh8tlzwMGtEwYx4q6ItmXZYFZKRt7Htf4NEGprKYnXfDouoRBW82dyu
   Q==;
X-CSE-ConnectionGUID: CZh89ovJRiypmloIPTy88A==
X-CSE-MsgGUID: NAd46k/MSWODWZj7YM9scw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43315314"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43315314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 16:52:03 -0800
X-CSE-ConnectionGUID: uNLrFMhLQuy1s4D6IV9YcA==
X-CSE-MsgGUID: 1oILgJ+fTEap2YVuRLZzXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110913052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 16:52:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 16:51:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 16:51:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 16:51:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUyDgcZupByiedoYmLHqOY6gn5JOqwtwLVxM9lIxFTAbm4Pd+fni5CXKbVlsINfTBddVgSim/kK3LfZqkHMHUFg0TWIUSxzXXmZbVxqkVroxMZkFxsH74BSvGxgbS+FM9vFJCd7Ea5sI0OHTlbAUofNoxHsefjKGCo53IhqHfWWm35PxwHTnH4/q3+4JfjPTawCqxNeMC/kxLF2tiC+vKbnmgxqAS2R1ExrJrJFWAUFYwxoWUpXp394c3lSJNaZmJzjhbx43GJFIyvqOqGbjpb+mn+/Q9R7FHTFP4GakziFjOO3uKuPv2doAinh2bUcrn7gzZ+zEOt2IMO6w4pnaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxPPAkJRu80LBv9I9VP7KIZX197m++ON/XIP7X4UPWk=;
 b=tXmhUuQix7e1YZcFVn2WpnP7aOgCQog+Bl0zNi4Mswbdnd5rB5NCf1aTvR8EjkLR7JDbiTzg88FO0F4lsLXoip/cQ3Lqb2wdDVDBUQxLDyC8lgA7L5TwhqbfO2x90LnHDhlT+iwEBW6twUG08+HMYYUkm8BzTFW97A0/B9VvcJdmh6trtKoRNOKy66swoRX6di5x88cLvutfp/5d+9YfSOoTlYjvUodRb+UcxFEQMFIaR0Rb6hCUo06rVCmoIngUfuNMrU/T/hzSUMyORACFpAmJ+woxjP34DcMPJEnEkhf/r8N6VvM+CHsgySYyK/kO/T1Vl7z5UEghT5dSXhrErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN0PR11MB6277.namprd11.prod.outlook.com (2603:10b6:208:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 00:51:23 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 00:51:23 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peternewman@google.com" <peternewman@google.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "xiongwei.song@windriver.com"
	<xiongwei.song@windriver.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "daniel.sneddon@linux.intel.com"
	<daniel.sneddon@linux.intel.com>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"sandipan.das@amd.com" <sandipan.das@amd.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"seanjc@google.com" <seanjc@google.com>, "Li, Xin3" <xin3.li@intel.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian,
 Stephane" <eranian@google.com>
Subject: RE: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
Thread-Topic: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
Thread-Index: AQHbbQtZd4aM1zJp90qUD7/fp7ZQNrM5eYAAgAAMguA=
Date: Thu, 6 Feb 2025 00:51:23 +0000
Message-ID: <SJ1PR11MB6083C234656AF934E41A7BA8FCF62@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
 <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
In-Reply-To: <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MN0PR11MB6277:EE_
x-ms-office365-filtering-correlation-id: 2fe56cd0-9769-49df-31dd-08dd46486123
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3hienFlQXlKWDB1WmlmOXh5Ujl1SFM3bytpTGc4azJHdENjdnhxOXRMcXpV?=
 =?utf-8?B?aGtvUHQ4eElqVXFaTzcrMGI1V1VSOGsvWTArY1lDc3BsUmY4b0tDakVQelMv?=
 =?utf-8?B?NHBFc0JrZElSUk1UMzV1cURsTnhROVVwbmJvSW1HQkdrZnNBejhrc3JUNUFE?=
 =?utf-8?B?UTcrTGlWUUN3WU1oTTk4V09kcE1TajRtR0w2OC9McE1KUjlSbFpaSTRsMFBW?=
 =?utf-8?B?dHVYYVBNbWpBT1FZS05uemZlQ1dMbW95L2gyWU9EcGh4OENGYzdXQkNydjRr?=
 =?utf-8?B?ZjBmaHVtZFJTOEFrTTBtVHdtc0d0amFVWGhFL29TdDc5UUEveUFGUzNpK0ww?=
 =?utf-8?B?Z3kvNGEzTTlJNVBSQTNkUTQ1d3ZwNmNFYW5IblJPMGZpUDBhaHY2T2pFZlU1?=
 =?utf-8?B?Kys4VVZHakdnbWFnemkwMWlxalU1Uk51cnBwbzUvSmoydk5FaDZ0ZE9jYW0w?=
 =?utf-8?B?NVh5bEk4dFV1STdBTTM2dW04ZElCN1pUSkwwalAzTmVaMEx6TUFBTjRUWG9C?=
 =?utf-8?B?QTJLTFFHMkY0bEJlU0ZpZzQvc25Sdlh2bHp2aEYwVHBxNmJhNjl3S2VzWHJo?=
 =?utf-8?B?WVpId0ExaFZwUUdwYUd0YWhldHY4OVJwMU9wV3ZHTjdTS2hncWgxZWVzRU9a?=
 =?utf-8?B?UTZkamdNVTFIVzBCR2lBTUZVUWdKc1FHZWcrRU9TVFhmTi9GRnBSMFRzejZC?=
 =?utf-8?B?YzdrcWxGV1JYVGs5c3hieTB6MjBTdmJ4UG1Eb0RxUUFWaDBKcEhHY1ljQzl3?=
 =?utf-8?B?NTJlR3MvYmJMZHhsL25Mc2Jjbm0ySExnUVpoR2JZTXlsWmxoLy92NE04L1VY?=
 =?utf-8?B?UjhqaDdjRU5Va0Y1cHNidUNpeFpoU0pNdVZkYTI2UHp5b0o0NWdBNzZZOHhz?=
 =?utf-8?B?U0o0bHRQZXEyNFRoOXJPdk02TUpVQzZDd1dCWHdHL0NoUXNOaXhtZEdXaHFJ?=
 =?utf-8?B?eUZpN2NMS3lwTkxXRU9pVnBRejFKUVhUSUM5eVVndHhSZnMxMmdhbTBIRkJR?=
 =?utf-8?B?VytxRUJBVFpPb1dUQWxSYVZPUlB1eC80K3ZmQUg3ZUN4VzFRanNNbnBsa1o2?=
 =?utf-8?B?bkw3Wlo0WW5JeWhCRlM2NzRwakZxTjlEaVJVNDhaVWpVbFRFZ3JzOFlEVzZn?=
 =?utf-8?B?RHJMVEhLV2VWVG05M0V1a3NLWVR1UmtxUWEweDBZR09rVE1XNGpsUm12OUwz?=
 =?utf-8?B?NklRbjQyNXdvY21wcnhYS2hZSElvemoyUkhOUDhYZXJONVdJK0xOT0psR0Ft?=
 =?utf-8?B?bUZXRDU5Q1g5NUorRnFKK0FnN05ieEJNUW5OWE5lbWN2VGtPSlBxVGhpb0JE?=
 =?utf-8?B?d09WVDZzWnRZVVU5RkRMUjgwUUNSVFl6dSttdWdRU21Ta0xiL3o0ekkvWkZW?=
 =?utf-8?B?SXdabXpiTEowdFFPMEE1VGdEcTBvK1FXR1Vhc2JmVWVNY0dPMmJMT0hWLzNh?=
 =?utf-8?B?eE1rOStCNzIwUFgyUkZkRHF0ZlJ6QVZPQkNkRFREbnN3V2JJRDVhZmN5aVZ4?=
 =?utf-8?B?SzE1aTlmdE5COG0wdHU1UmpCUGZjUkJWRWoyNkxVTGpsby9XNTR6L2QvNDFW?=
 =?utf-8?B?TitYdGlCQVRQaTRqbjkxbjYwUHlLeGxBYS9Ub0gvMXltbTBRVXpIb2FFN2Y1?=
 =?utf-8?B?Vmc0dGtTVVZkZHJYWHl3VDhrWWZKZkJzNldUeEVBYi9jamF4RnB3TEs1cTZl?=
 =?utf-8?B?Qm9Ca1BRTjBzUDNUU2ZZSmE0NlgvU0k0ajJxN3czVDZNUk1aN3RVVkhUSldL?=
 =?utf-8?B?b2EwZTFhaTFtSEtwYXF4SmQ5OG1WbzBZcHFHVm9RQ3R5bzQ4dnNCeGIvTWpD?=
 =?utf-8?B?QlpwU2E0UDNTSGpkaU44YTB0cUE0TklxV2lKbWd6TjhKVzU4N0syc1VvbVJ2?=
 =?utf-8?B?d1Y0ZGI3T1NVMWhYV2NXYUJWN3JXYmNUOXBzeUovekV2WXZVSzBqQlByZEZ4?=
 =?utf-8?Q?zXLh9gmb0LWyl9IggkVZEI1Fj8ZMrJZa?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHpyaTF1SXQ3TXIrQ1RLL1dPakVGMEF4c3hlZlIycVF1OU9lS2VDQi9JUitj?=
 =?utf-8?B?dnhTZTVKRDhPRDZSSFppd0NybzhXN0RDK3IzSnhNR1dGWjdJNzhtWm4rYzh3?=
 =?utf-8?B?d25LM2JkbHV2SUFMVXY1ZVVnUG9icUdsZ2psVE5jbWtnNmh2VUdzNE5xRnVm?=
 =?utf-8?B?aFY3VUlSZnNUWjRjKzFzcktzWXgxK3YvZ0hkN0lya3NISFFTOG5SWmNiMHFR?=
 =?utf-8?B?U01uQkh6S240UWhiMUxoQWtIRzQ5OWxDdTJMc0tTcnZkNG5EL21QZ3Brem51?=
 =?utf-8?B?S0cxelZYTFlKQitUVHVMWkxQWHk4aXF3aDhBVjVudHl2bGF6U2h3Ykxxdkoy?=
 =?utf-8?B?THYzR0hBYi9Zemt0WkJDWmI3NDVjVEwxWEJZQ1RoOWhOVUR4bHRTUHBrcGJx?=
 =?utf-8?B?THZ5OW9nQUw5YlY0Ky9YWmMwMGRPaDJWS2RVVytXUi9oRXQ5Q1pCRnNtb0pW?=
 =?utf-8?B?dTE2UHNYeUw3WUNFSmgzcENVSXNtWHh5ZFBJNWl3c3MzM1hGZ0JFUHkrbXNU?=
 =?utf-8?B?eVB3bDZtbnpER2kxSTF1S2hKYjNRYngxa2xlUDU5ZVB4Wmh1SlhKWW9ubnZt?=
 =?utf-8?B?L0s4a3E3bXdhY1pXVlRqWlVpUWZBMW8xYzFCUHVFeWwxTzNpNVVEVGFYYjA1?=
 =?utf-8?B?U3pBNmV1NUFqUFhUZTY5WFJUTGIwQy9ad2ZnUHZQV1Ixck5FTGxoVVJHeXla?=
 =?utf-8?B?YmZuNVNRcUVGdlpoYWRBRHR3RjZFTVBsd0tuVnI4QkRHUWVmNGtRQ2g3VUYz?=
 =?utf-8?B?YXIrK0lZYUxNa0l4akNUdWtNaFBnYjVLOEFLN3AwVCt1V2VMOW1PNWtMWWN1?=
 =?utf-8?B?M0srbzFVSHVNenV6aitvNVlGaTAyd2pwZlVTb2RVV0k0alJEZGpvbk5YeUhS?=
 =?utf-8?B?NE1HamZ2K2NkMmQ3VXRBcktnaVVXQzNDa0tzSU9CQ3JHYmJhYmVRVWMvNVhj?=
 =?utf-8?B?aHh4aGlHU3BSU0YzRWNBSHFMV29Bd2pTcnh5S0g5WFJkRmFmTHRGTU5aZXNP?=
 =?utf-8?B?bWpSQnIxYXJTa2o1eDZDb3I2eUhXbHM2cnljVXIyYnNpbzYvMGU2N09Jc0VQ?=
 =?utf-8?B?UER6NjBUQ2JWQUlNeVFoZVJObGNSQmcxWjZHaFFqdmVHUE5JeVVPcXRxd2hk?=
 =?utf-8?B?MlFFeUxDdzkzNHF1NUVnYnNoT2p0WjJ4SjBFYWdBR2pWQjd0YTlhb1hPY1V6?=
 =?utf-8?B?ekkrdXlabStyMWJOY2h5MnNXQlhKbFdtNk1FL1J3THRrR2t2RTFMVHBiNGc2?=
 =?utf-8?B?UVRhaGhIa09PSzJFQndtRTQ2Umx2NUxSRyttN2s3RkdZZDMzMTA1M1d0cCsy?=
 =?utf-8?B?UTlhWWxPejJYWWI1Q2JEK2dobVlVWk9GS1BZb2dMd2RYWTI0R3Q2RCtoTzJB?=
 =?utf-8?B?R01rQnMrVk90eE1mM0VseFBkdkZ6a1loZ3pldGdDc2Z6NE1WaXZzaUM1MVY1?=
 =?utf-8?B?N1FianBMRVlWR3RUWWtkUHErb1hmSytQTjZ4S3NWdDh6QzBHSlBxb09wUXR1?=
 =?utf-8?B?dzZDRWxZaXBBWmFzNTRNNStxcHFscHpLbmJzamtvWG9PclZvdmJlbGVBZm5P?=
 =?utf-8?B?WEx3eXBqS3BHMnA2Njg0WndremwzMjBobVMzUTdyQzNyZFRncTMyMFNmckRw?=
 =?utf-8?B?NzlEZVJ4V0JDM2g1S1dqVEUwcTUyS29jbXFwTXBtVWVycUd4SzgraXJqc1pJ?=
 =?utf-8?B?NXNTNHNlTkg4d1VJNzVCaSs5Y3k3UzYzTU5Kc0R5SW11OVhpUlBLR1J0TUEz?=
 =?utf-8?B?aXkvSVdVbDRUMEE5SGdZUnU3bVZlSjN0OVpoZll0b3BqZ3Y5QktTZWw0OE9H?=
 =?utf-8?B?N3V0dldUY0JSbEVHbUJSeERpaEVhcG1pUzJtalRCc3JsREJXcTc1SzdWRmVh?=
 =?utf-8?B?ektWQ0RVaEJTWm1kcmtPVndxQXkzK2x2SUx1RHYxZUE5OWlzWlhJcG94YmZS?=
 =?utf-8?B?emtmYmdUNnk1RUlndHpHODJFNGZ4eWpnYTVBdHpVejNxaW0wT2YyN3ZXS1N3?=
 =?utf-8?B?RGJqQ1d1OW1BY0NpNU44Mzc1UTdBVTNLdnBlZ2ViS2pJaFY1ZWQ4OEIwdWxL?=
 =?utf-8?B?bnBKbnF6RGJYOURFdEluSzdyNUxxbGQxQXlCMmF6NjdPUm9TejREdithcUho?=
 =?utf-8?Q?mhdzFLj3J5dQu+afQ3rdl0WyZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe56cd0-9769-49df-31dd-08dd46486123
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 00:51:23.7472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oqa5FgC+FiSImIPQzuK21VwAhzJfidvlX5sWVZ3qonuAALHPZuwMfSynhJ0GVS7rVKw6sq88hJ3tV5u0ttUhUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6277
X-OriginatorOrg: intel.com

PiBUaGlzIG5ldyBhcmNoIEFQSSBoYXMgc2hhcnAgY29ybmVycyBiZWNhdXNlIG9mIGFzeW1tZXRy
eSBvZiB3aGVyZSByZXNjdHJsDQo+IHJ1bnMgdGhlIGFyY2ggZnVuY3Rpb24uIEkgZG8gbm90IHRo
aW5rIGl0IGlzIHJlcXVpcmVkIHRvIGNoYW5nZSB0aGlzIHNpbmNlIHdlDQo+IGNhbiBvbmx5IHNw
ZWN1bGF0ZSBhYm91dCBob3cgdGhpcyBtYXkgYmUgdXNlZCBpbiB0aGUgZnV0dXJlIGJ1dCBJIGRv
IHRoaW5rDQo+IGl0IHdpbGwgYmUgaGVscGZ1bCB0byBhZGQgY29tbWVudHMgdGhhdCBoaWdobGln
aHQ6DQo+DQo+IHJlc2N0cmxfYXJjaF9tb25fZXZlbnRfY29uZmlnX2dldCgpIC0+ICBNYXkgcnVu
IG9uIENQVSB0aGF0IGRvZXMgbm90IGJlbG9uZyB0byBkb21haW4uDQo+IHJlc2N0cmxfYXJjaF9t
b25fZXZlbnRfY29uZmlnX3NldCgpIC0+ICBSdW5zIG9uIENQVSB0aGF0IGJlbG9uZ3MgdG8gZG9t
YWluLg0KDQpIZXJlJ3MgYSB2YWd1ZSBkYXRhIHBvaW50IGFib3V0IHRoZSBmdXR1cmUgdG8gaGVs
cCB3aXRoIHNwZWN1bGF0aW9uLg0KDQpJIGhhdmUgc29tZXRoaW5nIGNvbWluZyBhbG9uZyB0aGUg
cGlwZWxpbmUgdGhhdCBhbHNvIGNhbiBydW4gb24gYW55IENQVS4NCg0KSSBhbSBjb250ZW1wbGF0
aW5nIGEgZmxhZyBpbiB0aGUgcmR0X3Jlc291cmNlIHN0cnVjdHVyZSAoaW4gYXBwcm9wcmlhdGUg
c3Vic3RydWN0dXJlDQpyZXNjdHJsX2NhY2hlL3Jlc2N0cmxfbWVtYncpIHRvIGluZGljYXRlICJk
b21haW4iIHZzLiAiYW55IiBmb3Igb3BlcmF0aW9ucy4NCg0KV291bGQgc29tZXRoaW5nIGxpa2Ug
dGhhdCBiZSB1c2VmdWwgaGVyZT8NCg0KLVRvbnkNCg==
