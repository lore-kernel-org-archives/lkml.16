Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408719B586;
	Wed,  5 Feb 2025 16:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772786; cv=fail; b=Ijz/GObyhxXd2S0NKhrdFd7inWSc5m7JbBpMkKceipbnRR1sfdcuODB4w/0RyuPUiZ2Efn9P91K5v8nT9MS3S8g28XHNJP3AL2ddn5sRGvkf1OPTsuDf0kj5sq+VjJsVrQULwsREawGlaDSKTcyuex/ih2bh4GuPW0SM2Gh9hjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772786; c=relaxed/simple;
	bh=IRGGxMdoaSHgMuSdZeByptgT+W1bQlJRYAdmBaMwA/A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DvCtYYhpdB3lcxkW9Bi6EprXSB8GMUEaMIVbur/b/8O/BdTxYa+n20OFy7rNy3hbM/2L/J5HHIaPDOBVLwwx6gELmHlJjbnLn2tmchbnAJeLK2U0RGnCTDR5wCzZ6UmLKMPLqJlR19DHKC5UPuEdAmhJS9YT3Kf9fYMSqjoJuOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7WwbEYn; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7WwbEYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738772785; x=1770308785;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IRGGxMdoaSHgMuSdZeByptgT+W1bQlJRYAdmBaMwA/A=;
  b=T7WwbEYn1wwyv6Y5tTRG/TDPdEMhZnj3d5uED/8yE80N+O5VEdKqJif6
   9qjw2bj5DGU5KRhPNimwexzOxvbelrCldJL1tQf8KMHF4iDcDXCngwVQL
   gg2tCx8wjwQ2i9r2U/F4n6xAWVmLfxobK9J+l/6l9eLRMdGY1duivNsoJ
   GROdq9+z+SmtKssQtvyHvxPs7F0rAaokzuIOcG2wffwnHttlMjJBTEeDj
   dxw6RikeAKEUiDxbPGOxgAljy3MKr+9+Ge0yQwcXS9T5QeLorB4xgBkZZ
   3Fx/Fk2XJeBZ930xSX+Ihq3skk0qESzXRYSr44q6ukdZkorYTvJVpxNrm
   Q==;
X-CSE-ConnectionGUID: uSX9u3+8RfyGs4+KuGgR/g==
X-CSE-MsgGUID: j9Y8hKy8STS4NbqcDth3Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50335666"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="50335666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 08:26:22 -0800
X-CSE-ConnectionGUID: R8kzR1rZRgSI/36htnITeg==
X-CSE-MsgGUID: jrGdKzb2QzupXx/PgVwrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="141822577"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 08:26:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 08:26:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 08:26:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 08:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tE4ezVkM7cNE6onmmrGmgx0jatQe4E/1fH4fmP6RauTaNmrx8sq6GTlkVpBVLP+3lcROgfCpnkwiqhq+UeQTN2ygFFXYRWKNmqX1Asx49NTWn4npan0piqCTkYV8uuNoXzuRJpiisDI9YzGkzvVTH1geuI9BVRfBIGL9zPc9fRlkusadkVQ7hEQSlkqcHvMbcVOKVCWroehQj7ZnZR5HvdHVbmlNHPAe3+fgiVJhuItf04yNabqafmrGTVtkwLmPLRqX0f7q9PBlTdKhUh7ixtlxqXNdP0XKcXimnTlXpEVaLFjOFMMT+EyHKI0sjwcyaCtdC1Y82cMRxvZpotUx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRGGxMdoaSHgMuSdZeByptgT+W1bQlJRYAdmBaMwA/A=;
 b=rFH9KDedqf0o73YoPVkBrVBH9heIC2XbjRepO+Zl8atMREH/k1HAmbNZ2l8k7VISo1CUPyPzE1/SVxJg2W6g+1Ji8PwyorkpsoOdI6OocY2hSUAUJDVh0016hrqZM5uJLRiW8Hro35qbh0pvr+TH3PglGezhdMM6JqzGiW1fbyqBDnLnKZqOFMpE0bBjha1v3/31AnU5USvu8rejOrpg/MCcCW8JUT2hyHq8EeweV5ZDJgJDxe4v8XJFt/sfhhQvLigHUZjiDcoWmpZ9PzvBsQKZEvMUwJeho/uHIcVVRI6Q4EaCym4h9bbfqqj+n6G0RPqj0dVNqLubAkBrze//9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH7PR11MB8124.namprd11.prod.outlook.com (2603:10b6:510:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 16:26:18 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.8422.011; Wed, 5 Feb 2025
 16:26:18 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Anisse Astier <anisse@astier.eu>, "Joseph, Jithu"
	<jithu.joseph@intel.com>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"ashok.raj.linux@gmail.com" <ashok.raj.linux@gmail.com>
Subject: RE: [PATCH] platform/x86/intel/ifs: Update documentation with image
 download path
Thread-Topic: [PATCH] platform/x86/intel/ifs: Update documentation with image
 download path
Thread-Index: AQHbdCIttJd3RUiw+0SQJGSyghdYnrM2z2aAgADapwCAAJFmAIAAC3IAgAAByYCAAKQXEA==
Date: Wed, 5 Feb 2025 16:26:18 +0000
Message-ID: <SJ1PR11MB6083B185B539CE35776F43A7FCF72@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
 <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
 <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
 <f33148f4-f9f2-4b7c-81df-346b750eb2dc@app.fastmail.com>
 <b6157185-9c9e-49f2-9e4d-03ad6e26f898@intel.com>
 <6b2479c7-e82a-4239-a329-10082c4e7e80@app.fastmail.com>
In-Reply-To: <6b2479c7-e82a-4239-a329-10082c4e7e80@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH7PR11MB8124:EE_
x-ms-office365-filtering-correlation-id: a244511a-f73b-446c-80db-08dd4601d1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TEJkUDJJZHpYNjFhRFNYZU5XYW9wZGs2VjE0YnkwVlIva3BwVE94aUVwRWND?=
 =?utf-8?B?elpXMEdrM3l6NkhVRkZLcHZyUThnR1ZGai9kendEYlNsdklWc0tsa2RJdkww?=
 =?utf-8?B?VWF5WnlxUVFxZmw2dkxuLzZmSzd2SkZtaXFVdzMwUDlsSlVuWXNYRzAyRHJY?=
 =?utf-8?B?Sm13VVF6STRFYWlqRTFPWTQ1Y2Rrcmd6UUFieUt6VFBDSEJMclFIaVBtQXlw?=
 =?utf-8?B?bnhhSnhydlRSMkMyMGEvQ2tsQmJiNFc0bm41WmJXM2E2NFY2QkI2SDMwRHFm?=
 =?utf-8?B?bVBnVmdBNHdXQzBXVno0UUlFUFBIVFlMRktVQ0NDUVpOMjhJTFZVWHhuOG5r?=
 =?utf-8?B?Z0l6aThDei9HNG1qdjg0bVVNRG1TMGY2cldxakVxbGoxWkxHbnJsLzN6RUM1?=
 =?utf-8?B?UjlDenZaazRoOE0xOE1NcXRyaVdRYmgrNXlLMnlqNzUzVzk0c1QvVk0yU1NZ?=
 =?utf-8?B?Sk1iZXkvK2JmbEJzYXJBTTM3Qk5KakFVTjNnTjUvQUp4aktOeSthRGxvV3dv?=
 =?utf-8?B?b0o2dzd2VGMrRzMrUmUwZi9GRG9acGxDUXJVM1ZMWEdnZUNxM2dCNFVuSmJh?=
 =?utf-8?B?UjdIY1dsQWh3YTdscEtLMjQ3RVhqdFpYNjY4d3k1NEZDUWNqMll5THFNeVJP?=
 =?utf-8?B?Y3h6WFhPeit4SUJNcjU1RVFKSUhZVGdyaDdBeHZXNDgzSE1UeGFlTlVXdStF?=
 =?utf-8?B?bHNnemZxdE9kYnJTcXpXdGJPenhlS3dtSzZ5K2FVQnZ5eGYrcVZlbk5MUXIw?=
 =?utf-8?B?Ym1tSkNwU25neTlMU1N2SWhFM3lyYUZjK2JtOXJFTDRQRm5uVzNwNFRtOGcz?=
 =?utf-8?B?SHFUMGxBRnpwL1FVZkQzTUo4NC9QS1NYSm5hMGdGWjRQcG8yb1QyMUw2Zk1P?=
 =?utf-8?B?bmZCUkd3TURxcTE1SkM1UVZ1aURteFhmRW1jK0JhVEozQlBMNk5vazBUcmox?=
 =?utf-8?B?czZtWWF3d25Cc1J0WS9KOG9FS1pFZFdDYzRoOTFNeWIzVXRpRmNLa1RlM2lU?=
 =?utf-8?B?WkZHQ1YxV1g3RlFPQ25GVVdDTzVZUlhPRzI0RmF0NmM5emN3bjF4bStoejNK?=
 =?utf-8?B?emR6OG8rT1R1TWkrSGZrdEd1UUczUFFQTXpmOFNrazk1cVo5NThJaEwxOWNR?=
 =?utf-8?B?QmxhN0FrYndoNU1xOFFTMWhYeHIvQS8vTkVTNzdYcnp1bVFnOStQUHVsRTF3?=
 =?utf-8?B?ZGd5NHdNaFk5M1c3K0NnRXVaKzhMRGl5eGxqMFVVTEYzSDFkVHROYWd5cmlQ?=
 =?utf-8?B?aXRiajk4STYrMDlvT1dMZWs3MGtlcmdYd1lSVjZIOVNzYXJhejZ6S25zR2RB?=
 =?utf-8?B?UnJheE1ZZHc4dkgwY3poVEE0RFJIMTNuWGNQTXcrUXdPR0wyT3RUWXZqRVlV?=
 =?utf-8?B?QTZTeGliSnkzV3A2bkxPWkFOay9WejRpTjFnMUpUMlV3SDRaNWdibXR2MFRv?=
 =?utf-8?B?a3QrRmEydjNsZTdaSDhEd2c3UDVGSFFRTnhJMUxoMWtrNnN1R3RTY1pncVJM?=
 =?utf-8?B?dEp2ZEd2Z1FSMjBSVjR2S3VWWkNsUlpVUzByUDZIZkJvNi93SE9aV3ZCMzQr?=
 =?utf-8?B?cGhaalBGQm9FUmY4TGh2WjlqK3diVmJQTkNyREU3cXB5alRaaXNncWJpalls?=
 =?utf-8?B?REtNYVd2SkZtd3ZOQUZNbVRHSk40ZWd6RDA5NG5YYVhjNTdNMVpSR1JrWTFD?=
 =?utf-8?B?M29PN0g1MUJxR0hNWitySzgyQW1IbW1SWXRYL3RpL3hlYlo2Sm4xYVFSWHpn?=
 =?utf-8?B?TUVDRkRXcENSS21BaVJqTVE4a0dxQ0dLd2hrWW5RcVFZL0ovZVVNdTdYUHdX?=
 =?utf-8?B?a08zMmh4bGtVY1RKbVoySTZ6Ti9qR2tJREJvNUVwWUlIOTZRSG9GTWZNK2JF?=
 =?utf-8?B?OXdKdlN0RTdpcEs3TjhXanQ1VDVrUm5NSndHOUV6cU0za1JsTUtHNjBlMFI0?=
 =?utf-8?Q?ZxD2QXuIOw9UaaX1wm9cyDJRW/StZOCS?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cS91VmRhS2FPS1gzazRNeW1pd1E3bjJJRWZKbWVPWjNBNDNMSXVGWWsvVW5R?=
 =?utf-8?B?NklBNXNUQ2FlOHYrQitmQkNjaEFNbllnaXF4bGxGWVJOV2c4Z21mbEs2TVVU?=
 =?utf-8?B?cmRkbEFkeTB3NzNuNDJ6em8vemdnNUgxa29MN2orTmVUZkhtK3AvN1hJalpZ?=
 =?utf-8?B?bkVkbEpVSEN1RHRHb3p0bjMybEliU0hNUmYzNGdNNXRxbmFvTjZBbm92TjM0?=
 =?utf-8?B?WWwvVFdPd3Z6UnhNVzczbnVTclVGWGp4ZzlPZ2lhM2plV1MvcTcwRHhmSGh4?=
 =?utf-8?B?cmlGWlZFWTlJbkZMM2xBUVpQUUJUMmNqY2s5ZUZ4R0tnVG1yMUlFb3ZvK0tp?=
 =?utf-8?B?cWwydDlhTkFjZlMva0NYTGxZb0l4VWVXODgzSy9pWnQyQWRuZ0dqTXBJWFlV?=
 =?utf-8?B?eVdjRFZ2bFFVV0JOcTR4WHlEZWtMMGRtczdUcDI5SlYvVmhKTXRWVU4zN0ZW?=
 =?utf-8?B?UUVPdGppNEsvK3pxZ2pRSk9mRWxwRW9odjZvRkYrQTlDa0w3K1pqOTlObTcz?=
 =?utf-8?B?ZC9EbzFKWnNoQ2xzUFU4TlVYSmp6RmhadXUzWVoxSUpacUFHYWdGMjArL0ZD?=
 =?utf-8?B?WUluZElLZmdsbFhkT0pOUngyNlBQRjN3UDJsdzhSc2xhaG1kbzBpK1liNEw3?=
 =?utf-8?B?SzFvM3dNWVhGRmgvclpobElBbEdsYWE0Q0Z1N3lSeGh5Mi9uTGdBLzI1T2pN?=
 =?utf-8?B?elRUOFYyanpUMXBhaVVMaCtWQk5mbkd3WnZhYlRORUlPRUpLNXF3OHppZjR0?=
 =?utf-8?B?MnUzbG5xS3RjTThRc2l3TlM0UEhiT1VvQjM2QndCOG5qSm82NklpcHZMc3hV?=
 =?utf-8?B?aW9FR0JWYnhXOHp1bUZ1THhWcjlLdEV1M1BOOHJJZ1BkWkhZZ1dWampnaVRj?=
 =?utf-8?B?Q3JIZ08xWE5kVTVDSmlvSm5RSnZWNHhCT25MSkRWZ1lmWi9ZclhlN3FicTJt?=
 =?utf-8?B?dVlHSGtYVXRNOHhZSjc5WGY5M1Q1bEZZNklCYU9GZ2tGQis0bjVjbFVoclhR?=
 =?utf-8?B?RnBWZDJ2ZStMZkVRZTQ5c1FHMFc3ZlkvL0l3NHBSU0xvcFo4dUZQUGxjQ09H?=
 =?utf-8?B?VE54MitKdm5oTmlUclpWUmpNWWpKcjlncFhpNU90R2VLZkVjUTdtSmpMWmNI?=
 =?utf-8?B?c09XY3NTb3FVWXlOMnpxd01WNlM0akMybmpmdnRUM0Z1MS9yS0czaHVSK3Mv?=
 =?utf-8?B?V1ZCS3VFQzQzNUpIZlNMWUxsNC9mOGZvOU1yNDErT3VSQ0NpSFpFOFgyc0t1?=
 =?utf-8?B?cFR6VnFpTmtwcHgrZEh1R3EvWUZrKzNPTnJ6Y0hRWWVJRGNJMlI2T3dPRTVa?=
 =?utf-8?B?V0pLdmVNL1pEZGZRL0I2ZUp4aEJ5YzRDNkRvSndxakgvWFhJakJnY2RpSVVv?=
 =?utf-8?B?US9ZdVhrM2E5dHA5WEdoZG5NTmpUdlVncEVlL0ZIWU5HeVdhOGlGVTdXV1lq?=
 =?utf-8?B?V3ZZcDlVbk9zbVNFeGxlNC9pYnVsbHd0dVR6dEs4OE5RU0JyUGhEVWtVdEt6?=
 =?utf-8?B?UzZreThCSm0vRHlJRHBWNzJMN1hsT3lHZFU3Q3ArdTEvOFB0dUlMVkIzbVlP?=
 =?utf-8?B?ZjdMS3B2eW16M3lBYndJU29MU3J5d09HN2FnSy91NnNHc0hNR0ZhRFNKUkVS?=
 =?utf-8?B?RmNkd0pDRytRUk5IRDVNS0lnYkx6eHlyZEpsV2E0Zlk1U3o3WHRWOEpXalhX?=
 =?utf-8?B?bU8vM3hDdWFTSWhsZllwVUdsSWlJcTF3ZTlnQ0pmQ3ErYWJ6SXgzWDVCQ1Er?=
 =?utf-8?B?cnBEeVlwUzVEL3NLNGJ5UWdMdTA5amxkSGptNWZYaU5oVlU1eXZMVDhvUzFl?=
 =?utf-8?B?MGZoS2pJamNRQUNrUE9CT3NuVzI3WXlTMFNHdlpCRlRsRjdrVllGL0gyUlFS?=
 =?utf-8?B?UDkwUWxrM0t0Zy9UdG93MEgyS3JOc2VWeWVmNWNIUjdSNWlaZHdUR0NCZ0JF?=
 =?utf-8?B?eG5DdTlBek9leHo3ZDNBYnlDazhMVndGcU1wNlFSTlJZYXA5bVFwdFhJZTBF?=
 =?utf-8?B?RktqWnJTWktCZkZJT3dkWkRjZVRwbFh5UVFjVDZVZXJ0MUNXNnlrQzREc1ZX?=
 =?utf-8?B?S1l0TFl0UjJwcVFDbWFONWhrVzRCQTF1ajE5NnZnN0Z0OUs0dnZuU3FlYzdz?=
 =?utf-8?Q?tM4vSKKEF2nApTfZ8necOQ7UG?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a244511a-f73b-446c-80db-08dd4601d1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 16:26:18.5331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: veJuTmaoin2nGAxpPZsQdawkS/kfzCCjN9aYvke0NpGiT5uPcb7mitCrYGch2E/AGbwlU9KLo4Yveczi/BSdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8124
X-OriginatorOrg: intel.com

PiBJIHNlZSB0aGUgZG93bmxvYWQgbGluayBmb3IgRU1SLCBkb2VzIGl0IG1lYW4gU1JGIGFuZCBH
TlIgYXJlIHVwY29taW5nPyBXaGF0IGFib3V0IFNQUj8NCg0KWWVzLCBTUkYgYW5kIEdOUiB3aWxs
IGJlIGFkZGVkLg0KDQpUaGVyZSBhcmUgbm8gcGxhbnMgdG8gbWFrZSB0aGUgU1BSIGZpbGVzIHB1
YmxpYy4NCg0KLVRvbnkNCiANCg==
