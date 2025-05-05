Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D467119DF60;
	Mon,  5 May 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467445; cv=fail; b=dzd5EWkyY6gXvMYIpS+cV5PFz6M5MXUdePxOm0NcFVbRe91U7Tv+ljnOJEJSIxuOv2EDht98ogxIZhpILc8cuXWtog7JOj6dugqW4uYtnKV5jTiaDLKucI77m4TjZ+btK60k2w4tAUtYOLBn9t5XeLbjUhXRvuQ3bBjg7Nxw53s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467445; c=relaxed/simple;
	bh=1KPUDz0W+7359oOZc0xqfLZA3GLFw5QZpYif79ygXoM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mM6OEB41N20Ppxu0QEaBVehTDcRhrfxHmcPX9ydlWa2qq4XbQcz6M7pNG07Ni7MbiWaPMa4HpeiQzrowg4uI6PXnlR4+q9kEGzL5fHv4jyqrVhYf7OSw71nr3Ge3LCXB+hrOgmBWQ8XMLhgqbUBR3KkCsuj2jorRyRD+BGZXv54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLYmGvbU; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLYmGvbU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746467444; x=1778003444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1KPUDz0W+7359oOZc0xqfLZA3GLFw5QZpYif79ygXoM=;
  b=SLYmGvbUQKB3o9fYFCMP029NCOdz6d1Hz8s1JNl6ayGCYgBg4aghNH8u
   Qeo4KwtczExQtxw8fMnvurM3ebX5izCWnDx2O3pyz84EnZBWFyPutUdJl
   Q4oSJAN9WqGVtVK9rdppzS2O73bhupRFMCNnZ69PjHAHFAhj+sQ1qxzGW
   E5IbFjSSEHn/VwX7OMOWku0sM4OOfmYsor4dN+eI3kP8lKJFm6h0Kd+5i
   IRN9jPVvyLSz8B7/IV3tsc1H+8zGWEUmseeHvdpMV4HeboNC0YJzrc9Vb
   bqjRk6AteL1OG6KD8krB7zooDsYKmbO4K7bJRSSzDiNPqwrPdWieyy9Np
   A==;
X-CSE-ConnectionGUID: iAdK3XQNQr24SCNuIz9hkA==
X-CSE-MsgGUID: nHJBvWbIR/CvCPehlBuhJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="58297141"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="58297141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:50:43 -0700
X-CSE-ConnectionGUID: D0Od0rc0QzK/lyeA/xBDvA==
X-CSE-MsgGUID: 5gUqJYjnSJWB425L5ilavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="140309243"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 10:50:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 10:50:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 10:50:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 10:50:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRTMzmC5khTTrgblLokwbW11yeaFivLFfDDW3RZA+TQ011h+bcnqTU3OEGuwM0ulka7qIfh2VdqC8lLZipzEVD89uwmnDk2/30qbz3Ptmc3kvV92q6mhktrmvaVm74exm8I8v2Sg84cTKMLM48J/Cxh6IQ7aF6fkUqJQELplBqYDIixH5tMcx4A90DNl5L/ytqnMEgyEgg5hSsMQwD9jiGMXFZ4mFofcm2IcGGQNCTW+34Cl7NeknjqmLIBzaFI01LLX3/eUt2yyQS6qPaH1GWn8Aaj/Mi/x67QeJy/pDiRM9HbWRlD/RxqMNpdegyWDmzAOfofC28JHQ8EvAa8SBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KPUDz0W+7359oOZc0xqfLZA3GLFw5QZpYif79ygXoM=;
 b=vy4IH/X7FodgYnqdw5iYIeKtB0Gq9Ux6Xu1RQQALhWVB3Gzx7I1BvLN2t1u1qewmkZqyuX9+1tJWCyzR9s5pFkzhWae0XL+OrdRy95kl9KWCBQkEPEoBVRXWhTqrO7DmppIwEhBEkYpFlzW6zimqXyo2GNPDEakHJMSeLbX4V89yPxLmD7PjyoGfc91xc5siKj0H7px+Y7PJRH+fMlePaq7mE2HgEsszULOA1E3RYwoxNcMjPLzE49Hd1XHYavyg0KOvmYrE9LNHKE0mS7cRWD2ywCnK2GlZh0x0D5VDnvHIQx99bybpj24UAGzQdSXqE7ozipsHxBKrM787YQVOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 17:50:23 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 17:50:23 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, "Moger, Babu"
	<bmoger@amd.com>, Babu Moger <babu.moger@amd.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "thuth@redhat.com"
	<thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "seanjc@google.com" <seanjc@google.com>, "Huang, Kai"
	<kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "riel@surriel.com"
	<riel@surriel.com>, "Li, Xin3" <xin3.li@intel.com>, "xin@zytor.com"
	<xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>, "ak@linux.intel.com"
	<ak@linux.intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>, "Xiaojian.Du@amd.com"
	<Xiaojian.Du@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>
Subject: RE: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
Thread-Topic: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
Thread-Index: AQHbsw7vvZflVvaoFkmFfWarLaR9mbO/6gOAgAA7dYCABCgpAIAACBuwgAAGjgCAAAFrsIAABZeAgAACCeA=
Date: Mon, 5 May 2025 17:50:23 +0000
Message-ID: <SJ1PR11MB60836795A3C5413EA758EF34FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
 <SJ1PR11MB6083919B4628C4957D099667FC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <d84d7299-d0d3-4027-b256-f1e24d8423c9@intel.com>
 <SJ1PR11MB60838694300279E4A0E4506EFC8E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <e0e72b1c-40bd-4079-be89-3eb2339d893d@intel.com>
In-Reply-To: <e0e72b1c-40bd-4079-be89-3eb2339d893d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB7001:EE_
x-ms-office365-filtering-correlation-id: f0933849-f8ee-44ca-1ec4-08dd8bfd4f72
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWFybGdIRUdlSWE1Z2R6VUptWkNmaXJTV3pNVXJkWmRER1NlWTV4V0NwYWlr?=
 =?utf-8?B?Q0FZNXJoNFUraTFwemQ2cTlJc1dHS2xrVUFBTU9HUVpBTHBOWDhBQWtoVWVH?=
 =?utf-8?B?bGl2WU5CRzlrM1pSMWJrMXg5bHZFV3VKMnFNNDM2T3A2b2YrOUtEOS9rUE9J?=
 =?utf-8?B?L2dkZTVVTXBZbkpUM2lTT2xkYmlFMHRIN0s1ZlZuVVlNbVRHVGs0L094RXFw?=
 =?utf-8?B?c3Z6NjhGWjlWUENKNWZsQ09KbEQ3YW1nNnAwNGlNT0FHN3czNmk2NVJGT1lB?=
 =?utf-8?B?SW0yeUZsamxZVlNzV0EwMi9CNXAxVU5OV2NsYnpyakM5VW9tZGZOem9hejRD?=
 =?utf-8?B?RmNBTVJiK1JKQ2VReDJUQTFpNXNGVG95WU9NeEw4emlrVVJjTUV5ekhTVUE2?=
 =?utf-8?B?RHNpaHZidUUvcXVSd3JLK2NpSnIyTDV3SkZ0WjB0QVZYYUgzVTB1Wjg5aEF2?=
 =?utf-8?B?R3lOQ2V1ZndYMGpidUovK1puQ29QOHNQTjNrTHR6U0Jta1RkcGdOeHJDOFU1?=
 =?utf-8?B?K2NqOW4rNmQ4blJYUElOcmp0MGRCNUZIblVBeFZuaWZnWDkxNWlyd2lTRUhJ?=
 =?utf-8?B?Rmd4cFBtR2hFeURmZC9VVFRCUTVQcTBBTHNJU01oTTU2bk5NdUxPTlVjZ3hJ?=
 =?utf-8?B?TnVwblRoTDZ0ZFYyNE02OXFSYllTTzJnSjUvOXVUNE9HbDZmSE1VaDl4U2d5?=
 =?utf-8?B?cTRwZW04ZWtXQ21KakM0WFZQVXV4cHQzNEpjbVU3WFd0YWJSMFEyUVVvNWE5?=
 =?utf-8?B?R2R1SkJHT2Y0RmZtM0JrdHZzSlkrRENsdWNRbnR5SnI5SVBmYVcyWW1FSk5X?=
 =?utf-8?B?R0RpQ2tld29PYllHQ2VVZWlFUmdqblhKcCtpTWltL1ovbk44T3JNZjdkRHNm?=
 =?utf-8?B?WlloNWtPNjhybVpFbkxuOFAyTDFTbjlwMXFrNWF1MGgxbGxwaVNyc1U5WWw3?=
 =?utf-8?B?cWZaalpwOEVBd0FtOFdhNlJ5b2JYbGhITHhCNHRyMUpMOTdlVUVETWl1bUgx?=
 =?utf-8?B?UTJzbjVPYTlIZ3NRdkdwRFQzSXZoZVp2UURpSVluVUx3NFl1eCtsTmdoQmRF?=
 =?utf-8?B?VHA4TTV6STJhd2dQS0RVZXlybElwcHFrSlpXUG5jRjh2TE1xNHR0bjByOGh5?=
 =?utf-8?B?S0VsTExUZ0orTStyZitUdVhleWJWc0VjVzNOZEo1TUJyelJ6OFpmTlprKzJR?=
 =?utf-8?B?TTBLMXpOZlhYaWhYUmVrR3NiaHVpNjFtWi9SVTRRek5hT3BiUUZGUjZWYnhL?=
 =?utf-8?B?aXZGRTZydGdvOU84eUI5REZ4QWxJdnE0ODg1UmFneGRvZDNSbGRJQk9LSTlJ?=
 =?utf-8?B?c01NR3EzeHNNYW9yaTJIVGU5Y3Q5Nm56THFRUDlCc2RrTGZLWnZxMS9JMGV5?=
 =?utf-8?B?ZnR3WUo0Y3lqZStEUnJYeTd6MlVrejhPZStLM0wvamgwN29rV3paWXE4dVJT?=
 =?utf-8?B?TUhxQzBqbVBQbTBhVllXZ3NFNjlNdjE5eXY5NnB5bDZKa3ZqTStmVHk5bEtr?=
 =?utf-8?B?WEprYjV1Q0hjaW1nR3lQTGcrK2R0eE5tMUs3Z0hoU2VwZWVaQlpPMHlFY3Rp?=
 =?utf-8?B?N05oZlBaQnpxYlU3QW42Nyt6bFZCb3RYQ2s1NTJkbVNkSTF3TktYM2g3bTFH?=
 =?utf-8?B?OVFralN4Y0NIN1NHb2NkUkVYcVQ2L24xbzdJbXUzWVVTWWVIeUQ5b0J2SFVr?=
 =?utf-8?B?cEtUcTRleWZVcmlXcU1XdnhDWWpRYkdpVjBnTnRyM3k1T3RFRU9kZkd1TUZU?=
 =?utf-8?B?Y0trWWs4WW8yZVJkcmttYitrSnZ1TDR2Ym81aHp1dXI3cWVNZDBCM0NxMlI2?=
 =?utf-8?B?N0xGL3drWlg2ZFlnaGR2RzJHWEp5cWpJY0tzYlozSnBsY0RUUnpKSXVMQVBp?=
 =?utf-8?B?clBEb3RXRVRIQ0Z5TVRaRFFaOU9EOFJnUmdLZFJIbmtKOHRWNW4rcENnZHlJ?=
 =?utf-8?B?U0hpRVlCWGdodkhrV2k3VWN5Skg3RUJHcno1NjhkbXBHM29TSDlic1FjaWdo?=
 =?utf-8?Q?n63WamvqGuXeLBMwLa6v1GrGXX71hU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmpXVG9TMk1ESFVtWHpDTDlzVEtRMlF2eXlUMWJiU2o5M0owSUhGczMrL3RG?=
 =?utf-8?B?YXdRTG1KeVpYYzQ3Q0VyeGRhSWVXVjNqMHdHcUtnUllUMmUyazUvQWVpR3hR?=
 =?utf-8?B?em5ZdFBHRnE1SS9UZHgvd2xSRmoweTRrOC9UN1B2bk9iT0xrOVF5YVl0NWZv?=
 =?utf-8?B?WDFoa3dsL3l1aG9Da2NWbHNkSzl1eU9rUFhPbCtSV0pZNU9iZGJwQlNBbkxB?=
 =?utf-8?B?RUw0UFJKZGJWam1BQlNTcHk1TlRaaTRKM3VvbUxXL1RKWDl5dXovVGxEaXNs?=
 =?utf-8?B?ZkhGd2ZQVUFwQTRmWTl5UWRXbU9laUtqalZyeHI0YnYwaGU0WlcycVBqVVBR?=
 =?utf-8?B?MEJqUXd3cGZqb3BjQk1FZndQZVFiVlZlRnVYeVRrWldYa3hQdS9tUmJTckxp?=
 =?utf-8?B?L3BOVU5JdmJFckVFTXkrOVAwMXRnUm80UXlsSzdKNVNENlJLVkl5TW9Nbmlo?=
 =?utf-8?B?eTFwcFBBL091eWdkaWgzdWlrNHBPc002K2JyKzIrblI4U3phR0YvbXl3M3Mv?=
 =?utf-8?B?MHlOeVM0UmdaVGlsUHFVZVJQTnpJYlcvZFY2Z0hONzJIblRudWNURVJnZTFR?=
 =?utf-8?B?eXNoM3YyQ2ViSkdsajFMTis2TGpkbVJacUlBOEdEb0dSKzNqb25lSFdzTDU2?=
 =?utf-8?B?L2FaUVphOWtZVjNUemtJQVY5dTl3VEhiZW5BOTFXTzFuN1pVQmNCOW8yQWtM?=
 =?utf-8?B?dDVvelF3V0Y2NDNCbGlNdjh1NWY1YktKOFVxL0RxdXVHKzVTYjJ3NXFpOTU1?=
 =?utf-8?B?NG1acTMwMVRaRjVFSjNNb1N5NU4yRFl5TUR4VzE1bS92bmlBVWNwTlByM3Mw?=
 =?utf-8?B?S3h3dHp0emRDbDZESlE0NW42MlBlUUxFdkQwbmtaNUMxc2dESnUvZktBZmM1?=
 =?utf-8?B?ZzlXV2ZucEQvUVhCUGt5SDl5Zmt6dXBPWVZGWXR6YjNvM2F5RnJsYTBZcmNU?=
 =?utf-8?B?NEkxV0JPTXdYUmFEc3R6d2orOFM2b0hQeGE4UkhRY2s5aVh0NlFzZTBDSmlH?=
 =?utf-8?B?VGMzZ1pZMWNITnNJQXQ5RHlRWTN6bk83aSttZ0FXMGxsKzVhMDRBSGxqa3ND?=
 =?utf-8?B?NWxSSllrU2sxNyt1YzBOeTlmWjdVYkk3alBhV1N0WElWQjhrNzI2MjAvdXZm?=
 =?utf-8?B?bXJZT1NDMTNCU01YY1kzVlhoeGsyYlZmVWR1clh1YW9hMFRJeEh0NnFVMnZu?=
 =?utf-8?B?cHZJMENUMEZFMVFLMUV5TUZRejdyZThRR0NjMTZmdjl0Smg2Uk5CYmYrZHhu?=
 =?utf-8?B?WGZoaVFJYXlzR1JuRHA0Zk4wT3NxUFI0MEZyRFRtblhqU2tKTmxxZFpYajJ2?=
 =?utf-8?B?MC92L0NJUjkraFFzdHhSNTJ5dFVZZ1lLSDdRM01zTDlzVFYyK3RSQVFydVdP?=
 =?utf-8?B?Z0VZVTNHRlM5Tk9EUFJiQlY0TGFiRkVtdm9uUFI4eWhRR2JlZnRZOENUS0Zl?=
 =?utf-8?B?Um1SQTVLdWt3TmpSemJZM3p2WE1DMGQ1N3dpaFR5WUtnOUNLOVV3Qk15L0w5?=
 =?utf-8?B?NmU5c3pISitvNlNTUGRLWlVYY01kNzQ5bHRzY1NQNWdmZndmdHhRZ1YvSkFX?=
 =?utf-8?B?d1haY0xVSldoZlFXbXVVQjcvOTQzL1VoazZMM0ptclRIYjlQMDFZUGJPSjFo?=
 =?utf-8?B?SEh4U1pKMENvdjZqakhkUjJXZklIL2RDSENCTmZNM0Y1Y2ticFlCWG03dTIy?=
 =?utf-8?B?RnI0WWJxSnlLbVZlUDNvSzdIZGN6ZXJyVXZjV2lwbU9LWFVXMVNnQVlwRlpE?=
 =?utf-8?B?NTFDMVQ2WGw5Q0lxUnhsSWxOa0FFRU42UHlUZVU0VklVRU43Zm5KK1lOeURz?=
 =?utf-8?B?cGtXQ3lQQk1GMHduS1I3RTZHUlNObEpLSm80VHo1M0htYzlWa0MzOGpDR1Z5?=
 =?utf-8?B?K1NwaTF0VXZ5NUhtUlNYakFvVktoZmx2aDFHM0Z5ZTJjQzZ6NVBSR0xQdytC?=
 =?utf-8?B?OEtzakhZMVp0UE9FM2hEeHZaL1lCWnlzdmpRKyt3bFc3SU45NjlSLzlPNmhl?=
 =?utf-8?B?L2hXbDJveU4vUlZxYmREbXA5UndqNVJMaVhuNnZXSVFIaXQ4ZExkQ1YwVTNP?=
 =?utf-8?B?Y2xrUUx0MkwvbTdhUXhINi95eEp6NmJmTU5CT0Y4bEFVZFQ2OWdXUWdsSTRF?=
 =?utf-8?Q?4ZbfOFlb+cE74INwVvv6OUk8+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f0933849-f8ee-44ca-1ec4-08dd8bfd4f72
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 17:50:23.1789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2BLHjIWntVMwnMktJ4gYm83xHQnE9ZwVqFjzqVjkUi61Pzl2UbSSLc11bhFn42QTvbBaXQr6nxjyMTI32hMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
X-OriginatorOrg: intel.com

Pj4gTm8uIEludGVsIGRvZXNuJ3QgcmVzZXJ2ZSBhIHNpbmdsZSBDTE9TLiBJdCBhbGxvd3MgdG8g
YXNzaWduIFJNSURzIGFuZCBDTE9TaWRzDQo+PiBmb3IgSS9PIG1vbml0b3JpbmcgYW5kIGNvbnRy
b2wuIERpZmZlcmVudCBJRHMgY2FuIGJlIGFzc2lnbmVkIHRvIGRpZmZlcmVudCBncm91cHMNCj4+
IG9mIGRldmljZXMgKHRoZSAiZ3JvdXBpbmciIGlzIGRlcGVuZGVudCBvbiBoL3cgcm91dGluZyB0
byBkZXZpY2VzLCBub3QNCj4+IGFzc2lnbmFibGUgYnkgdGhlIE9TKS4NCj4NCj4gSG93IGRvZXMg
dGhpcyB3b3JrIHdpdGggQ0RQIG9uIEludGVsPyBDYW4gQ0RQIGJlIGVuYWJsZWQgZm9yIENQVSBh
Z2VudHMgd2hpbGUgdGhlDQo+ICJjb2RlIiBhbmQgImRhdGEiIENMT1NpZHMgYmUgdXNlZCBmb3Ig
SS9PIGNvbnRyb2w/DQoNClJlaW5ldHRlLA0KDQpHb29kIHF1ZXN0aW9uLiBJJ2xsIGhhdmUgdG8g
Y2hlY2sgd2l0aCBoL3cgZm9sa3MuDQoNCi1Ub255DQo=
