Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA52BCF66
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848924; cv=fail; b=bWLan+Sxq+SmacyF6OEdM2VGYQzn+kTOqw1Kg/2QRCs1xURSBKf49fWA+2QTbSrVJa4M6SCbCXHd0AVw8yXbBIs5GQZUoZ4VGT8NGN9C6o7ZeEnh0AyS2K+fCLqIqWyc56JEVnS5rVgbr5tTvtCYdbHepOOW5aN1yrTSE1f/ruU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848924; c=relaxed/simple;
	bh=4UxzlW0ofVMQMV22fannln6t+8w8ORIq+qKoyi/cP4E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VY7gN0pMTb+JNC1+b7yVxxmNgmHhADSFqno/uShuPnYTIO1HMWM5KEMZsHiMjelLf5GEnlRNaErI0qJH1fQC7yEmSbIqKcDxTjQKmwRmr3SlF6833fZbZ2iLbVILoTXPbuqYoWSBFyiHsX6aeat0OUiWk16Iinp2+wkPni49ccE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdjgN68A; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdjgN68A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750848923; x=1782384923;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4UxzlW0ofVMQMV22fannln6t+8w8ORIq+qKoyi/cP4E=;
  b=JdjgN68ADx0v2bc2ULuHQYlekB1h9rbjtMt5dXkJKXKMRD8oNfntUa7N
   Lth73QRbt/9wzNCV2AjhqN9q11vR8dCoeHMg6uu8W9WJfdsuktXd1YfNA
   pBRV6eXhAkZZyfaP9aeQzOzJLSVfwqyQTf9x9kxZ9HUfUUEuN3xhEwojl
   cE18IkGelwjcfMt/SO99fnlkT4+WBHtFz+xKGDzs8/qyc3FWW8exo777c
   QBPADYNT2tJEk8VZxFsISiQp+0NbmMCiIFg8hYO12qvHty7hiVmuP+JND
   bbRFPNxA60ad2QeQ8kO5P4TfVJDP7mDbJtzLveqxEBMi95e2BxtyCU7Ag
   w==;
X-CSE-ConnectionGUID: JJiqtC2YTlGfiF2U9OLIvA==
X-CSE-MsgGUID: 5oH6A2u/QhSZXYoAEml9JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64172608"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64172608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:55:22 -0700
X-CSE-ConnectionGUID: ecuLlX0kQ1WrPhtGc9KTRQ==
X-CSE-MsgGUID: zMZYhP56TDmOpSTY7KlEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175843408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:55:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:55:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:55:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZK7xt9FgRJTFCdIdgpnBqCRolkatsV68NS09IRXIKcKer43pD4KH8JBfZqH/0fPF6WlYvTdXyuaA/IUSvc/gHeRSUkU3IchQUHwBOMSDHTZL9JIjckTEkmbi1jpR2bsiqa3gMSkL68mm+iRiuUVtALdJRhjlrKWnTK2651w4aERX/QX3gY1IFlFBybYlrclJlQ0lhd6CSqcM4z3RQpPqoyumTXdsSgyRUxNdOwDZZF42wm2gY78SWKw+tm8qUXEBnjK6k0p8mXRhr1gaYd1Og5jlLPt0ENmO5ygIGv6Jn3/GaaZD/zu58EtJ/7S8NV1wnwgX1mQW2iR1EerNy8Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UxzlW0ofVMQMV22fannln6t+8w8ORIq+qKoyi/cP4E=;
 b=qXx/a6Db0mTsv9JtaoaYCmCM6cwMmzoTQLl+W7sYMaATZ0lMhKzgrhrnsnabVGmfQY/3cNpJBLie8PWL91+278V8RKicTLfbgke6lyqxZEFtgTq2DFMk6iA+2y6P2PuwCgPOqlINcTuS+67F+IHC4QUO0YsSLWH7ysN5nmyHKUg39WuroaiytmAmDgZdpwhiGYpdJzJ4Ebc7t2fL9r0IqnlAQ0aP1uqm9wO5E7dwbKUJStIUhc24VdhDtlixDooKrk8g/j397in8IGZOROuSXBK3Rr3wGpmQdJGz9Yt2Tl3lGqo0gdrKt9wEYZ+Ia65Dy0Q20bw7Yh6ZvQS/pi+GdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by CH2PR11MB8865.namprd11.prod.outlook.com (2603:10b6:610:282::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 10:55:17 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:55:17 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "x86@kernel.org"
	<x86@kernel.org>, "khaliidcaliy@gmail.com" <khaliidcaliy@gmail.com>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] x86/boot: Don't return encryption mask from
 __startup_64()
Thread-Topic: [PATCH v4] x86/boot: Don't return encryption mask from
 __startup_64()
Thread-Index: AQHb4O0iNDlRPtaf1kqawGy7DXFv3LQTvWUA
Date: Wed, 25 Jun 2025 10:55:17 +0000
Message-ID: <487c2747bb4c02d643324292489243fdc82e1c6a.camel@intel.com>
References: <20250619073652.719-1-khaliidcaliy@gmail.com>
In-Reply-To: <20250619073652.719-1-khaliidcaliy@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|CH2PR11MB8865:EE_
x-ms-office365-filtering-correlation-id: a9fa8621-25d8-49a8-e1a8-08ddb3d6c59a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVpkRWJDNWZXMW5qN2Q4RkorM0pDNEp6VldRRWRhMFZLUWpPMGxQZGIxUE5z?=
 =?utf-8?B?VWpuS1ZUL0djbEwzSklFc0c2dzFkTWM0RERPSWFlVndWVUtBcEZkbWJBeEV2?=
 =?utf-8?B?QVZpTWVJY1k2ZWpHRmsyd1ViVUpkVUxob0FpeUFtZUpwWDh4Y2o5Q00xQi9N?=
 =?utf-8?B?TmZtMFhkcWFDZWl1UE9ObkJTQlpHSnlqL1poenpsWnVjK1d2eEFMZWlFNWZv?=
 =?utf-8?B?UGVURStNS3VyUVd3bi9uSUVwZDNxdDlPbGRwdjBWWno4Sk8rUGVaRXR0Y0cv?=
 =?utf-8?B?T1c3YUJjQSs0S1lMTmVKNTE0bHd6K2pwbWFsR2xUUzFmTmhvSHZ5b1BOWGZM?=
 =?utf-8?B?c0VpMUdLTC9uYTlpczVZRit2R0NzNXZjU2tpUXUwcDhBTFNNWkRkdHNNVkMr?=
 =?utf-8?B?VXZ3RVJzMGFjQUkzSmlUZWdoUVNaK3pmUi9PbDFQV2dwd25XdGIwSVFnMm12?=
 =?utf-8?B?MkJiUk4zQzlXV3o3bktZQzZ0SldGV25iRXY0V3VROHhQWU5sUFNocmxSeGFM?=
 =?utf-8?B?aDZEbHBwRi9qVW5pWTNsNnlqbVcwVm5ZajFWTnhaVjBoUEFnOS8rWjlGVU1C?=
 =?utf-8?B?VWpiVlBLTDdWUlFzNTdrM0ZjQmtTd2NZSWtqMlo2WTNmVDhic0lmT0tENTFj?=
 =?utf-8?B?ajhzUVIzNmh1ditFQUI4dyszYU90cmQxa0UrYlNDWXpJaVFwZ2ZsaGNQTTZ1?=
 =?utf-8?B?enFaaDd4SUNoNFNLQVVTa09sdHRNYTZidWM1eUtmT3ByME1LT3NRUXp4NXVR?=
 =?utf-8?B?OXdLYkF5bmlTbVpleVVVZzNCd3V5Q3g5V21IdkIvaWgvcDhHa0pqdUxnYmZk?=
 =?utf-8?B?V3BDMjRxajNNRzZ6aC9GQ0ZqUDNNK3crb3R0N3VwdHNWclVIK3Nvc1dVQm9h?=
 =?utf-8?B?YnhTaEhjY0JQa2lzZ0tPNFhwTjZZVjcrRitIMWVDaXdlN1lrdkRxeTFTaU90?=
 =?utf-8?B?WlU3VFpCTmVaL2hiZXAxaEFZYjc1UWpON0d5Ni9Cck52eFpudWh0L1VadlFo?=
 =?utf-8?B?M0htWThieGt4Z0lzT2ErYmtWcUhZK1dlQ1E0ak1kdFN0c1pHMm03YVl5anhw?=
 =?utf-8?B?UHl0R3JaOGtPbTVvalBkcjhrSFFIcW8xLy92amVSOFA3dEtrY09rVUsyNS9x?=
 =?utf-8?B?bFBzMU4xWC9OMUJ1MjBnSmM4bDBlMHkwUVdUazFxeVlQUnFZeE5EdVA0MVIw?=
 =?utf-8?B?cklUL1FRVmp6MG4xVHJoZDFCUWhQbmJSUk91Q2Y0eXo5K3ZXZkdOY0o0d2R4?=
 =?utf-8?B?OHNlVVczNWJtREJxVys1QllUMW1ES0wzNGhQdUxQbno0Rm03Vk5uYVl0Nytr?=
 =?utf-8?B?TU41ZUptOW9VZ1Z0UThiUm1WSUR4cDdNY2ZDVEJaL3pEM2pwMHlpbEUwSWZX?=
 =?utf-8?B?cUgzNTJlRXdoM05wYVBhTzRpNUg2ZS9QRlVlZHp5T2RuUlJML0pqNk5kdjNu?=
 =?utf-8?B?em80dlNROUllV0xpcURvZi9QMm5tRGUzMVVER2FKYWZmbXJHelRCRmtqMFR6?=
 =?utf-8?B?RkxZWjFNRGtvU2FrRWh6SjhzYjhlVjNuK0RjaGEvcnptVWR3TEwyS2NTNFJB?=
 =?utf-8?B?REE1UG43SUxjL1RVbHNWTElSSnU0UUlHVWpIUWFFUDZSWUpRWFFqSGtJVjYy?=
 =?utf-8?B?SUVUWmdEd28vNzlYdlFDeWM1aWNCV01uV3FrRkVuWEt2Sm9yMjdnU09ta0N3?=
 =?utf-8?B?VEZuRVRZSHh0N1FJS2ZOZkVLT0JpSG41SVM3TmlhUU9ZbU5TVXk5Y0FUUllB?=
 =?utf-8?B?VkhlZkxqYjV0Ty81eFkvMGZYZlk2UEcxdG11eklCUFQxNHpQL1pFa1NwbTd0?=
 =?utf-8?B?UEhCbEZhZTlCY2Zob0F1a2p6VGVkbm9VOFhmZkhFTXVOTFBBcEtOd1I3YVRy?=
 =?utf-8?B?T0VIM2g4bzhoRFhONmxBKzBiWU1nYUtrTWgxUStFMXVkeCt4eUZRNTdEaFBr?=
 =?utf-8?B?dUZhUnRkR2pOM1RDQU5pdUJPYWNic3ozaWhmMVlISVlVZlBRcUN4YUc5VVp0?=
 =?utf-8?Q?TJ3ayZ482dOcEEmdVTFexN2isukvnM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnY4N0tZYVlXeXZQRnhJMEIwK08xS2xuUGpyUTFkMFhJcjQ0V2JyZTJFUVVL?=
 =?utf-8?B?K3VBNDV2aG9rNzQ5YmNlNFNDZzNpZ3duWGlvN1AraS9jVmlyR2wvSTdYMFpi?=
 =?utf-8?B?MzhOVkFNOXgzL3YvWVNrMlJmM2pmRGZtcjlSUVZSdVRMQ1VMWW1xblJIWlJr?=
 =?utf-8?B?YnVzVGZqdGliYWV5VDBnY0pUNWtzSlQrNGVYdG1jc21lNU1hWkFVYURXUjhL?=
 =?utf-8?B?R1ppZXBDK2NoUFpDc2dzRGY0Nm5Gck5BanJvYUJGQ1NJaG1kZDdidS8xWE5v?=
 =?utf-8?B?dlZ5TVRJTVovQkpCRUNmU2JEY0cxZFh4WC9WRmo4VGlOR0pMd1lTV2hlSlJD?=
 =?utf-8?B?SU05cnJLMkdDNkwwSWJFcCtyYkxZZkFUTVAwYTllRkxKdVBvTXNHbCtBektS?=
 =?utf-8?B?T1BLL3g1bkZnZ3RGc21pNElrK1o5RFZ0dDhsM2xZN2dtcVIyZSt2N0lKVlEw?=
 =?utf-8?B?WVhReDAyVllVejNPdW5naVBWeXA5Q2FDQS8yanlWdDZLbnd2VnlvQUtONHd5?=
 =?utf-8?B?eFp0YmplcVhLOUNsZXhDMldvNUk4aHZ1d1ZuRk5SNlRKUVNDSHJSM29FekVU?=
 =?utf-8?B?TnpmdmVRRDNRWWdGMmpnSWtzNnFWbmxpR2tqaUx1RzYwdDR0dk1OMUlleWtE?=
 =?utf-8?B?aHVBRXp4ZzBPNERHcmlRQmRvOVBwZldBL0xaWlN3NDhPNXNIdnNxa1lWcDk5?=
 =?utf-8?B?S0lNQ3gzbXoraHJCU1VTMTM1ZTlaQjZmM2R5VmFLSkd4UDhvdTduUUhaWHQy?=
 =?utf-8?B?TTdXbEQwbUtuVXcrVmMwNXR0OFBuWndFN0pEREllamRuVjZGNW1ZTHN6UmNB?=
 =?utf-8?B?UzJ2NGhvVXBEbUNnaEFMeG9Eb0U0TUgrckpCUjNUb3JvM3Nod1FieDA0MlFq?=
 =?utf-8?B?L1lrUHFrNlFGNmlQWVVLVmIza3Yxc2p3U1hEVUowSHNtbXJiSzJQT1ZTNzVS?=
 =?utf-8?B?YSsyMG53S3FIWUt5WHc0SUEwKzkwUnNwdlhMMkFDSllpeEhST3Y2SUJMclAz?=
 =?utf-8?B?dUxZY0wzWHcxNGh2Y1N4UDZsTHJWWDRXdE5URUxBQW8rZEh6YitZUjBqU3ZW?=
 =?utf-8?B?eDdNc3FkUXd0YTdoUXFleWVHTis0SUVUUWZpWWFxVDhacEdxVitkZmtkeVph?=
 =?utf-8?B?WXA0ZVVQbysyOENYYlM5RzB0S0xLWkhQRkc2QWtEazN4Y0Znci82dUwxUnc0?=
 =?utf-8?B?dThyOTZoSFBjQWUveHF3aWJ5dG5tbXZKRU42ZktPZVdybitjZkN4ODc1a3dF?=
 =?utf-8?B?ZnlnQUZVMEdrZW96YzdHaldzd1d2VHlPVkNhb1NmU3hIZ1hmdWdta0xNVFVU?=
 =?utf-8?B?c3dUU0p6Qmc5MGJOTWl0M1RJQzRzM2xpbE42SW9GdythaUZGU2FRc3ozcENm?=
 =?utf-8?B?ZnZvVEhSTUFhdktrRy8vTUU5NXJKaDVXalBpUHVITFF2VFhieE8vdGxDOFIr?=
 =?utf-8?B?N0srdHF3OHl6emUwOS9xd0dNRXFzY29WYzhKUFVnbi84SmJhckM4TU1yRFhB?=
 =?utf-8?B?ZlI3dnBicmdPcDFlemQ2cFJtOUUyZGQzMm4xWGNYaFZIcXJKWldkRGsxaVdF?=
 =?utf-8?B?bG8vRVUvdHBDOXhoZTl2azlka1lzM1dCWjBzUUVRam9LRVkwTmRJRUlkTklr?=
 =?utf-8?B?cElRMEVlL1FUVFFUcTZ5L0Vhei9GUW9teWRUOC83bTdEMmNrMEtNWG1xZlBY?=
 =?utf-8?B?UVVWdFc2d3FSQ2tScS84YnlrMXo2WmVvQzRFUEUwM3BFVCtXd2xPbmpUSWUr?=
 =?utf-8?B?U1VHK1JPMFFFTmxsVUdPRFZFS3hTRUFNZnBSVGZleGE1YUx6NTViZFhTRm5s?=
 =?utf-8?B?V1BjMmFob1oraGR1MVJ2VmVSVy96eVFHSXdhZitldEJMc0w1TnN1MkoycVpL?=
 =?utf-8?B?ZVJ6MlVudnRvaEF6RTlOYXRyQzJTRU1XbGRzOW9BWS9lZnI2MEZxcDc5TWhN?=
 =?utf-8?B?L0VIcFBpaFZPbW14VjdmMHpMeFF5MWNHRnB1ODZ0VWx3NExWMlJPUUJKY3dm?=
 =?utf-8?B?dzdiNUYya1Z2VzZyMGcxTDdVVTZtZTJIOFYrcVA5REtUR0FSN0JhR0pvNUxD?=
 =?utf-8?B?L3AwdDN5NXpZNEJweGU5KzU1U1FFaWd5VVMzNEt5K1k3ajBBOW1kUmNOTnUw?=
 =?utf-8?Q?CSd7hKDFyT/nuxIRiemNYNiHl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A0E2FC35FBFF143AE9F6B43F73BEB38@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fa8621-25d8-49a8-e1a8-08ddb3d6c59a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:55:17.5839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztnVeM5jr+GphM41uMZXBOIe/v2gDvn/hIfXENWi3QxTjF7I2J2jPU2XL/wdNRdA4Dpt/gvZtxNmnEmDy/lZSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8865
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA2LTE5IGF0IDA3OjM2ICswMDAwLCBLaGFsaWQgQWxpIHdyb3RlOg0KPiAt
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvaGVhZF82NC5TDQo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9o
ZWFkXzY0LlMNCj4gQEAgLTEwNiwxOCArMTA2LDE2IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJR04o
c3RhcnR1cF82NCkNCj4gwqANCj4gwqAJLyoNCj4gwqAJICogUGVyZm9ybSBwYWdldGFibGUgZml4
dXBzLiBBZGRpdGlvbmFsbHksIGlmIFNNRSBpcyBhY3RpdmUsIGVuY3J5cHQNCj4gLQkgKiB0aGUg
a2VybmVsIGFuZCByZXRyaWV2ZSB0aGUgbW9kaWZpZXIgKFNNRSBlbmNyeXB0aW9uIG1hc2sgaWYg
U01FDQo+IC0JICogaXMgYWN0aXZlKSB0byBiZSBhZGRlZCB0byB0aGUgaW5pdGlhbCBwZ2RpciBl
bnRyeSB0aGF0IHdpbGwgYmUNCj4gLQkgKiBwcm9ncmFtbWVkIGludG8gQ1IzLg0KPiAtCSAqLw0K
PiArCSAqIHRoZSBrZXJuZWwuDQo+ICsJIC8NCg0KU2lnaC4uLiB0aGlzIGNvbW1lbnQgaXMgYnJv
a2VuLCBzaW5jZSB0aGVyZSdzIG5vICcqJyBiZWZvcmUgdGhlIGxhc3QgJy8nLg0KDQo+IMKgCW1v
dnEJJXIxNSwgJXJzaQ0KPiDCoAljYWxsCV9fc3RhcnR1cF82NA0KDQpIZXJlJ3MgaG93IEkgZmlu
ZCBpdDoNCg0KU28gSSB3ZW50IHRvIHNlZSB3aHkgdGhpcyBwYXRjaCBjYXVzZWQgZWFybHkgYm9v
dCBmYWlsdXJlLCBzaW5jZSB0aGUgY29kZQ0KY2hhbmdlIGRvZXNuJ3Qgc2VlbSB3cm9uZyB0byBt
ZS4NCg0KQWZ0ZXIgc3RhcmluZyBhdCB0aGUgY29kZSBmb3IgaGFsZiBob3VyIGFuZCB5ZXQgdW5h
YmxlIHRvIHNlZSBhbnkgaXNzdWUsIEkNCndlbnQgdG8gZGlzYXNzZW1ibGUgdGhlIGtlcm5lbCBp
bWFnZSwgdGhlbiBJIGZvdW5kIHRoZSBhYm92ZSB0d28gbGluZXMgb2YNCmNvZGUgd2Fzbid0IHRo
ZXJlIGF0IGFsbC4NCg0KVGhlbiBsb29raW5nIGF0IHRoaXMgYWdhaW4sIGl0J3Mgb2J2aW91cyB0
aGF0IHRoZSByZWFzb24gaXMgdGhlIGNoYW5nZSB0bw0KdGhlIGNvbW1lbnQgaXMgYnJva2VuLCBs
ZWFkaW5nIHRoZSBhYm92ZSB0d28gbGluZXMgb2YgY29kZSBiZWluZyBjb21tZW50ZWQNCm91dC4N
Cg0KV2l0aCB0aGlzIGZpeGVkLCBJIGNhbiBib290IHRoZSBrZXJuZWwgaW4gYSBub3JtYWwgVk0g
KGJvdGggdy8gYW5kIHcvbw0KQ09ORklHX0FNRF9NRU1fRU5DUllQVCkuDQoNCkFuZCB0aGlzIHBh
dGNoIGhhcyBvdGhlciBzdHlsZSBpc3N1ZXMgdG9vIGxpa2UgdGhlIGJyb2tlbiBpbmRlbnQgb2Yg
ZnVuY3Rpb24NCnBhcmFtZXRlcnMgYWZ0ZXIgY2hhbmdpbmcgcmV0dXJuaW5nIHZhbHVlIGZyb20g
J3Vuc2lnbmVkIGludCcgdG8gJ3ZvaWQnLCBhbmQNCi4uLg0KCQ0KPiDCoA0KPiDCoAkvKiBGb3Jt
IHRoZSBDUjMgdmFsdWUgYmVpbmcgc3VyZSB0byBpbmNsdWRlIHRoZSBDUjMgbW9kaWZpZXIgKi8N
Cj4gLQlsZWFxCWVhcmx5X3RvcF9wZ3QoJXJpcCksICVyY3gNCj4gLQlhZGRxCSVyY3gsICVyYXgN
Cj4gLQ0KPiArCWxlYXEJZWFybHlfdG9wX3BndCglcmlwKSwgJXJheA0KPiArCQ0KLi4uIGEgdGFp
bGluZyB3aGl0ZXNwYWNlIGhlcmUuDQoNClNvLCBwbGVhc2UsIGJlZm9yZSBwb3N0aW5nIHBhdGNo
ZXMsIHRlc3QgdGhlbSwgYW5kIHJ1bg0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgYWdhaW5zdCB0
aGVtLg0KDQpBbmQgSSB3b3VsZCBzdWdnZXN0IEFNRCBndXlzIHRvIGF2b2lkIGxvb2tpbmcgaW50
byB0aGlzIHVudGlsIHRob3NlIGlzc3Vlcw0KYXJlIGZpeGVkLg0K
