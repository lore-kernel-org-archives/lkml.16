Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2182E62B;
	Thu,  6 Feb 2025 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738808140; cv=fail; b=Y5e7A2kLV/rzp8wlg/gqTTFJh6S9mZ7CzMoGiSu4CmPfAYXsDgP94hxaK3cMIza+lKBVi/yiwAqfogBhKGTXj56l9PGyKu2gt2VbyVo5v5oJDTvIwp0GPPXThpEkqcm/Up7E74djmBE7HqNLDAU8uSZ6v4CpcVll7v7cPuoW/F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738808140; c=relaxed/simple;
	bh=81AgaRzradB4zvU0WLoA22MeCqI4+7mS7VHOQ/qMDdk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QgSGdsXObN++wZE+jQnP6ROTEmZ8Im2NWDbDEkxWbKXPizozlxPdf/e6FDGF314XdrXnwu+s/Aiz7Ga7h8JB/GJzq4BEfYpzMioKbNAQJ/Dtbh5pnCkI6tT4FqSodsZY9vvxlNFg0OUJyM3Ycf6m/gqGr5l5cVh2GVFeRK0TVsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLX3V7QP; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLX3V7QP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738808139; x=1770344139;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=81AgaRzradB4zvU0WLoA22MeCqI4+7mS7VHOQ/qMDdk=;
  b=jLX3V7QPtg/i9Z7SxY22TDgA7xH4y0cmoKhwYSVAlJUnLxArbswv0UCm
   YQpbkkgkDW5GwsA9OlyjZabZcv7eBRTNY89hGmGnIqCbPX2gsmgZUFfJP
   X5DcITmZFpmBJityrXTFVEJos8HGKgeUCKX4sjSgtK0aaTITeY0CnF3zZ
   P8cKawK/Eo6aHDarOvHW3cu4E2sywuA84tFb8tGG5R8vqo2/BNcKmmDeK
   t7EDOeTeUMkGIJBL7B27T6zaERqoTlCnpeF/bJcDoVSsz+wpEnW91MtZl
   dJ4A3mqKpT75FuDTHu0P8Fp/2yVRFedd9hV1BSwVICXwr3pxVhTA/U7NR
   Q==;
X-CSE-ConnectionGUID: tQPv3P7NQr2oOyi0qBSWTQ==
X-CSE-MsgGUID: XaqpI2BtS2mLa5f1O4sacw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26999047"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="26999047"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:15:38 -0800
X-CSE-ConnectionGUID: f2LKkbjsSiujx5wqZEkhaQ==
X-CSE-MsgGUID: 5SxbarbFRBiImeNKBP+rBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110926932"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 18:15:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 18:15:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 18:15:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 18:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5FDVwn+n6263S4jA0M+hfswf+ZlRCYOp4Pm1aRFmhwhboMXzroxF6ZRFM4Z1Q0vnnOOwxGXLgvmmUbz9x6e7lIae8yyfSC3JQdCMnTTBfIYktY+GYuI/C1VkneTd4wihsRN/1WZ9zaMrQovCe4POEVWFCufAP3N3o3u9ykbnbQ+UEayEKAsdZLLiwTLe9AvoWaZB3QK/yslD/XLQ4QUSSCCBWNAzskRwWmplm88CFGNKda+uwa1K520msZbvkLSJg93wZAxkXyhhVN6JF0F57sUKIv8LCVlhFHGfx8WVyyQ1uEcI2jo6EfoVQwU5UjCG/d6EiRBPz3Idvi5cxPMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81AgaRzradB4zvU0WLoA22MeCqI4+7mS7VHOQ/qMDdk=;
 b=fy4Hx7aGdIzVIWTgDl+D8vCdTp580x3/iiN8ND9B0dsGNJD6T8QW9QikGGJ/FT+8oAQVwsffAYqdlX+JRzw/yEhaixV4bDYdfUF0oyfkaiECrASYIpNMVMcFPaJtVsodBfstRpwHttM2OjYzJLWAU39pjYone+bXegt8m06BEUkrrvGQ1rM8QGeEFKuN+M2SRJcM2dFJGmv3FJS6O4LmRV3l3880p1wakoV2WR/sS62Vih3/WxYRnVQa2rva41qScksEDl5Izn5Pgu7moHC755qcSLOg8Ro2Hbexl+MprR+Xk2MJSTdCeHp2ZwAnN5MWjw9zRhR0ZhE47NqUVSc6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 02:15:29 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 02:15:29 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "nirav.rabara@altera.com"
	<nirav.rabara@altera.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
Thread-Topic: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
Thread-Index: AQHbd7cYzRoLaQ5yvU+3Y9XsRKXcAbM4k4yAgAAeo4CAADaGgIAAlWzw
Date: Thu, 6 Feb 2025 02:15:29 +0000
Message-ID: <BL3PR11MB6532DF4347EE2187728CB0FFA2F62@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250205101318.1778757-1-niravkumar.l.rabara@intel.com>
 <0f77480d-e93c-44e2-ae9b-615b2368a011@kernel.org>
 <BL3PR11MB6532426A08A1C84AA971E6C3A2F72@BL3PR11MB6532.namprd11.prod.outlook.com>
 <bd1ad035-685e-4684-98e8-e32b98d870f7@kernel.org>
In-Reply-To: <bd1ad035-685e-4684-98e8-e32b98d870f7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|SA0PR11MB7158:EE_
x-ms-office365-filtering-correlation-id: 0f387e95-a22b-409e-88e2-08dd46542057
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZE5FV1NZK1h5clJhN3Y2ektibk1KVWZlb1FKcHB3ZUZzb0hyMTN0QTVoZGFG?=
 =?utf-8?B?SjFBYnJYRkF6SXllSnBFOXFzZW0wQmZJc25lZ1dFekxyYlBBakFYNUdZa0py?=
 =?utf-8?B?QUlydXpIQlhhOXFMOWU5Q0tyMGZCVS94cWFtWHFCN3VBRkJRcCtZSEVvSUVB?=
 =?utf-8?B?WUxtRWl5QSsreXh4TnY3SmVGazdxK05DU05nUEJOSmZVUGJseXU4TnlkbmM5?=
 =?utf-8?B?MktuWEJtT0tsZHp0OXlhRUo4bFl3T3psY2tsRENJaWZEaDVvanUrMnExbFU4?=
 =?utf-8?B?SDlmcitKU0MvMWxGTCtrWFZtN3VCdWdraWYvOE9heE5DczVhRnBqWTBIa3Fx?=
 =?utf-8?B?Y2QrSkpPUUpaeTBaZUxRYlZiRXdBK2QxNjhueUpkMXViWmRWQktiNTZKYTNu?=
 =?utf-8?B?Z1hPMk92TC9qUjZGUzJtdE9Od2RjOEZqak5qOTd2cG9UR21UU0VVVVBaTE1s?=
 =?utf-8?B?dElxQzQ2M2VpdnV6TzA0ZTF4NTJZSkEwdVZUbEh3dWhOMk1IbWU1NE5CV0V6?=
 =?utf-8?B?c296d1pFUWJKSjVDazVrNGQ2VzJYUU1zUDBHQ0FDS1Z3TmFHRGFoM3dSdkMv?=
 =?utf-8?B?RkZXb0Zickcxbkx0WnVQMm1tL1IrSzZKRytNKy8zMjN1RXBQaWY5bTB6elRW?=
 =?utf-8?B?L0cxcFEvdmtySVYycDNsQ1BSTFd2UkM4a3cwVXNwZUUzYkpHcmNpL2hLcU56?=
 =?utf-8?B?bmlEd1JaakhuamlxY2lWYXE1MW5CTTltNSttbTlybmhieGYvSWVDbUdIYUxK?=
 =?utf-8?B?dHdVNWxQbk51TThUQnh2ZUhQZzE4NkZqUVg3QU5CaCtZaGhVLzVyVHI1SEJE?=
 =?utf-8?B?bCthSWNpUEcwd3Rqdy9LbjkrSGdiV3gvSFNMdVRLQlJLeFZNL1RYRTFRVTV3?=
 =?utf-8?B?bFVTYXlQTWJSVkhWL3RMMGlXUzlYQ2NiandaaDFVT3dqbm1pVTFqODJNNUNj?=
 =?utf-8?B?RWVvTjBzS3NPSlprK3RUTUE4dFFXcExOTGVabXhhZHNKcktJcTZDbnNQZzda?=
 =?utf-8?B?MTU2bGREd3NSTTVVaTJnUFdSQjFjNllrSHBvZ3dVSmpPdVd6M1ZmTTJZVitl?=
 =?utf-8?B?UTFHK0NpMHdvVHI2c2dPRGErbXhoOHpGTFpOZXhVNks5aGZMNS9NNkxkMExa?=
 =?utf-8?B?bFRsV0FQcGpFQ2wxT3IzQVhUUzJMUmlPaFpqbEYvd3VtYmpwR1RHZ1hDWFRI?=
 =?utf-8?B?QnEzZUpMNjJnVnhZQ3dYK2J6emdJR2JGWElKVHBSU29xbXlEOFFZN2VqRTlL?=
 =?utf-8?B?RC9OaVprS1hJTHVpS01oblpXemtXbmdKQkM2dFlxR1d3dG5uYUcwM3VDYVY2?=
 =?utf-8?B?N3BxZy9RZ0ZZKy9TeVJBaFhXRFJsaXBhMGNzamJOQnJIYnBVa0ZhM3p5NUZX?=
 =?utf-8?B?NDhxbXFTL01YUCtYeit4TVpFVFZpRnhVNlpOOFdZdXR3bk91bWszSXRmaWoz?=
 =?utf-8?B?S1pUOFd4VVRNTVVNSm9leVQ5QnhzMzhISnZvRnIzQVBRRDJ6YkRxMEhNWENS?=
 =?utf-8?B?QWZ0RUhLUDhITlMvdzlNMExMZlQ0bDFuY0N3OGJkSHhBZVFOOG40aHA1Q1pN?=
 =?utf-8?B?Ukx4SmZ1UDBCSFV6WUFhT1NYQTdndzg1OUpkOFhxbk9DQWJPdjJDS3g4aXZP?=
 =?utf-8?B?b2lWMCtkQ0tyc244U01kclh4MmdZOXBWWDg3S3R2U3Vaak1NOGlmT0F3WEVj?=
 =?utf-8?B?QmhuYllZSjFwS0Exa2lxU1hwQVFUUE1NZnpnVUc5amhWU0JBYXNldzVrTG5j?=
 =?utf-8?B?djFoVVdrUEJ4UlY1SUJ6YVlPK2pSdy9aNFJ1UWNjMm51enB5Z3FJK0ZObU93?=
 =?utf-8?B?L3hxU0V6N0ZVY3hJVVV5ZldmME9Ndkl0ZmRCb1JYRXQ1SFBtandESERwZm9V?=
 =?utf-8?B?LzJwUWpGUGhJeDJydVBFTVhUMlk0aGpZZTNXS0pIYnVSNVQ1aUwwcW4rdTFh?=
 =?utf-8?Q?YpN3EBaFQEI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDdqQVlCOHVtd0Zsei9ZU2ZOa3VYcVFiRFJFVVZhUXM5KzMzUTJUa0ZBMHJw?=
 =?utf-8?B?czZJSzJyZXdmT1ZHdHM2SXg2UjZxVTZ1dzJkUHRObG1UdGpqKzc5SzRCZitq?=
 =?utf-8?B?eWFLS2lUZ2tXUk1IUzZMOXBnQzViR0VDejJ2T2hPdncyYXpmU1Q1RzNZL2xR?=
 =?utf-8?B?bmZDNFh2a293NHMvZ0JMSWJ2TFVBRjBrMnk5RXdTVGNYLytDZG81Y3hvaGFS?=
 =?utf-8?B?OWVFeTVXUkRVS1RoTXFDajcxcHptRTZOa013cXVsTnRxbC9PWlZuVG9UYnlY?=
 =?utf-8?B?aTFyVE1sTW82N2hyWjRCVzA3Q0xIOU1abHoraUozWVUwTlRLYVVwc2FBWmx2?=
 =?utf-8?B?eG5yWGI0WnovZzhubzlOSHdoVmw5NTIxaG1nLzNKRU5Xd25ldGkzT2R4N0pV?=
 =?utf-8?B?cWhJRys2U2l5ZXFlR2orYW51NnlrRTJzYXczdTJ0L2VIMDNXVFh1eUNWZFRx?=
 =?utf-8?B?YzYyYTZ4b3V4bnhNNkErWXg1MlNES1pIRUZuaEFPMWlUcERpcTBxNkF2Zm1z?=
 =?utf-8?B?ZEtvdEpLcVpVNXM3VEt2NDRRTC9MRXZjL0c0cFV2cTlVRmJyMVp4RS92Y0cv?=
 =?utf-8?B?NGIzQy9MMDVSUnQySklMZXRhbmxSUUZFZnIrYTR4aVI3TEhaVklZbCsxcmFz?=
 =?utf-8?B?bkFFZzhVSVZUcUljamxYNlJqL0tYejdoci9xaW90eTFSWUVvbXhPNzI0VkFu?=
 =?utf-8?B?NSt6WnJQeTJWNFhXcU9wWk1DNFpDUWJyRUtJbHVEUW5SYTNpb0htSnAyWXBB?=
 =?utf-8?B?SGg2RUV2cEpWVkQ3bHNDbllTdVNMdW92MlVYWHVvRVp1Z0xjZWxTSkhodFV6?=
 =?utf-8?B?V0NtY0huNUgweHdpci9zci8vaC9zYjdHU2lyZjlDRFd6czNwTDZDR3VxQ1FX?=
 =?utf-8?B?c1J4YVF2dFFDUGtndHJNTEpEeE5yVVFGbldQV1ZTSFZWSUhKRzBxYmJqZ1NI?=
 =?utf-8?B?blVqSTNPaTNXNU1PWUdXeDZMaDl6WDlyU0ZzMmpaVlR0WC84cE1yWUUxT0h2?=
 =?utf-8?B?aGg0NTgvazBWQ012VGI2bFhvUFprZUREUFMxQ2x4VU5BYlZGM0VId0pVck5h?=
 =?utf-8?B?NE1jWVpYdGdGWkVpVjNCOFNvZ0JCc1B1SVd2Q3ovZ2g4SWl6ckZHU243YkYy?=
 =?utf-8?B?dHhaazJQbkUzUExjQS94T0NCcGduRmc4SjNSZ0JOK0h5SnVscDV4V0RXN1FV?=
 =?utf-8?B?RGxjYXQ0eXRiRzFwcTlRWUF4NnVvSVlzRCt5L1NVZzY0MW9mZ3pqSXFSYkhG?=
 =?utf-8?B?cXpnSEozOVdTalF5dWM0Z2hvK3dQd2FLZktUUzVEOXBTejgzZ0F5UWFUSXBG?=
 =?utf-8?B?S2dIR1MxR093a2kzVjNLWkVhL1M2c1REdFlVVjBwTTliVFhaRXNvYXhrSFRX?=
 =?utf-8?B?ekJibVVjYUg0dnlYUitmNllmOUtUL3lZQnJaNmZBclNyOW41YlBNbFM0MEEz?=
 =?utf-8?B?VjlPU3RVYitZalRGMXRudjJ0SUUvL3hvRkNqbUo0Vmp0THZKakxPN0VFcnlV?=
 =?utf-8?B?VlFBVkppZlNWcUplcXRnYjlqN3NJSW9DcjJ4RUpMYldCNStnNElPVUwzRXpp?=
 =?utf-8?B?aVI1REJwdEtvSlUwZ0ZCSG44QmpCQXoxL0RyKzZTV2RLWkpCbDdqcDZTZkZD?=
 =?utf-8?B?L1Rzd3ZucWhkam1hMkx6WUhaUFdXOUx5cXJQWEtDVEk0UGkzN1lOZTJMNjFm?=
 =?utf-8?B?M2Nkb3JVaURzaExKL1FZS3ovN2xhMXFDL2NVcnhac200OHZjbjNJQklwYnR0?=
 =?utf-8?B?ZVRtMm5HbG1uQmpWK1JMaUtndHVVVjhGbGE3bGQvcHd4TVZwbTByMTVUYXFC?=
 =?utf-8?B?NEo1Q0ROcm5DVThyeWtBWEJvdXM2N3hzY2VUQlNWZE9rTmlZajkwOEVCVmdq?=
 =?utf-8?B?cDEzV3lZUVo4YUVkRjBUV2JsTzIvNWhDdXJSdk13YjZ5NGQzUW10MVJHY3pB?=
 =?utf-8?B?dndYK0Q4cFJyMGUxazYwWTlCMnFBbGhlUjRmTTZWbitRYTArck05Ym10MFQv?=
 =?utf-8?B?eXRPcUdVM1RMV2JwSHFZWmxCamdUaG5EbFU5bXlhc0ZiNTI2d0Uzdy9XMVZF?=
 =?utf-8?B?ZmxkR3RiUnUwT25HNnRjRFdqcjN0aTFlTzlvWThCd1BQcDJiMjI0OERLQXA4?=
 =?utf-8?B?ZkNQUytXSElmZm1CU2ZlMHpsS205RXp3cHR0ZENSVXRqdzdENGhJL25xbERU?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f387e95-a22b-409e-88e2-08dd46542057
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 02:15:29.0213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47zzIYaPn3bpIti8cy5FjStLCMdF3GwTM0jDV1yPzLsFE7p0xQhDZve/OA1XglsZUCmdiOaQ7msH38tx2oXdE8BvOOHKmP4BmM6VHTMs8JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
X-OriginatorOrg: intel.com

SGkgS3J5c3p0b2YsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgNiBG
ZWJydWFyeSwgMjAyNSAxMjozNiBBTQ0KPiBUbzogUmFiYXJhLCBOaXJhdmt1bWFyIEwgPG5pcmF2
a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPjsgRGluaCBOZ3V5ZW4NCj4gPGRpbmd1eWVuQGtlcm5l
bC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwu
b3JnPjsNCj4gbmlyYXYucmFiYXJhQGFsdGVyYS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSBhcm02NDogZHRzOiBzb2NmcGdhOiBhZ2lsZXg1OiBhZGQgTkFORCBib2FyZCBmaWxl
DQo+IA0KPiA+Pj4gKwltb2RlbCA9ICJTb0NGUEdBIEFnaWxleDUgU29DREsiOw0KPiA+Pj4gKwlj
b21wYXRpYmxlID0gImludGVsLHNvY2ZwZ2EtYWdpbGV4NS1zb2NkayIsDQo+ID4+PiArImludGVs
LHNvY2ZwZ2EtYWdpbGV4NSI7DQo+ID4+DQo+ID4+DQo+ID4+IFlvdSBjYW5ub3QgdXNlIG90aGVy
IGJvYXJkcyBjb21wYXRpYmxlcy4gRGlmZmVyZW50IGRldmljZSwgZGlmZmVyZW50DQo+ID4+IGNv
bXBhdGlibGUuDQo+ID4+DQo+ID4NCj4gPiBTYW1lIEFnaWxleDUgZGV2ZWxvcG1lbnQga2l0IGJv
YXJkIHN1cHBvcnRzIGEgc2VwYXJhdGUgTkFORCBkYXVnaHRlcg0KPiA+IGNhcmQuDQo+ID4gRGVm
YXVsdCBkYXVnaHRlciBjYXJkIHdpdGggU0RNTUMgb24gQWdpbGV4NSBkZXZraXQgcmVxdWlyZWQg
dG8NCj4gPiByZXBsYWNlZCB3aXRoIHRoaXMgTkFORCBkYXVnaHRlciBjYXJkIHRvIHVzZSBOQU5E
IGZsYXNoIHdpdGgNCj4gPiBBZ2lsZXg1IGRldmtpdC4NCj4gDQo+IA0KPiBTbyBkaWZmZXJlbnQg
Ym9hcmRzPw0KPiANCj4gPg0KPiA+IE1heWJlIEkgc2hvdWxkIHJlcGxhY2UgdGhlICJOQU5EIGJv
YXJkIiB0byAiTkFORCBkYXVnaHRlciBib2FyZCINCj4gPiBmb3IgdGhlIHBhdGNoIHRpdGxlLg0K
PiA+DQo+ID4gSXMgdGhpcyByZWFzb25hYmxlPw0KPiANCj4gDQo+IFllYWgsIHdvdWxkIGJlIGJl
dHRlciwgYnV0IEkgd2FzIG5vdCBjb21tZW50aW5nIGFib3V0IHRoYXQuIERlZmluZSB3aGF0IGlz
IHRoZQ0KPiBoYXJkd2FyZSBoZXJlIGFuZCB1c2UgcHJvcGVyIGNvbXBhdGlibGVzLg0KPiANCg0K
R290IGl0Lg0KSSB3YXMgdW5kZXIgdGhlIHdyb25nIGltcHJlc3Npb24gdGhhdCBkYXVnaHRlciBi
b2FyZCBjYW4gdXNlIHRoZSBiYXNlIGJvYXJkDQpjb21wYXRpYmxlcy4gIA0KDQpJIHdpbGwgYWRk
IHRoZSBOQU5EIGJvYXJkJ3MgY29tcGF0aWJsZSB0byB0aGUgYmluZGluZ3MgYW5kIHVzZSBpdCBo
ZXJlDQppbiB2My4NCg0KVGhhbmtzLA0KTmlyYXYNCg0K
