Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4852641C3;
	Mon, 16 Jun 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070051; cv=fail; b=Zeg6lZesUjhqv3GgQmwJo7GoPDkFQKT/KxhrKQB6tc5LMbfPh+zhRYUZFpHuXWKs1tgVaYU8/z7HxSRfSO7VDx1GA3txlTsnWjqwFqjpekdYE5gZMIwGe/cvOoi2HUjQ8qgtZB1Ywls1SxVz3ZpOQzxn9c/YbHOKmKyrGEgFbX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070051; c=relaxed/simple;
	bh=qB0pBXwLu1dpKOAIxQrCCshipGKxtXbotCHA0L4jBno=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZjhVRKbNnvtbxwqdW4cCLJs/APQAIfYnlxejlcMi0Z0QcL+/8MeMXTdrKlbdJ7pLG53HBSYPfaZybX/Rv3ARz8FOwQGdfMqcumXatQTEAuOt513iu7vdbe03Ay5rcRt6GQFXPWW6nrL2W9fPhJZaPDL/luNu2pxRHv2KnSb2KRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=jWbdcgzY; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="jWbdcgzY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9KCF05adCLKcpW2OyLC7pxO0h0ObXfHQB1txAvczVo6s5mfV0vBcSa9OXe1gTnphOpV4dJcO1yAfxENGpYhkFeu/xX6O+KdfqtgB84TosLCiwJSCI20s0S1e3E4yI9TyX6hwEKy0yJmncsNSRrHKukW98v7bmiKOR5zwiI4dlOVGN47qlk+sZHnXuUS5pCsAFDzDmp6uEjjumuOtyKeSAYx2pDshgRIjytQcThII/9osXuBCyMMUHH4gzD4ZToRGaFBmG/Fk7xBXlDxQXRco705FBgSgND1cV0Fb9yev79TQ/tCd5kLX/EyHb+qmU19MbPbEgl7BwXAgMXosZgmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB0pBXwLu1dpKOAIxQrCCshipGKxtXbotCHA0L4jBno=;
 b=xgyyraq0mplS0Rw+NYzBjIyVuWi35bM44EnqkCYxw6ufZNyx61OXvvzOwHaDkrWA7L97kcE3LhkGR49GL7txKb+Q1NHuDN2wxB2oHtreMfhF8oUTVCuWLbCpIyu6+LR8cMlDmHS9fT2osmKm+Sj7M2imh5+UsPPICEhbimjADyItCTtO8GuoETCR+dbHdF0nTUPozHZo6tue95osYnlc9EbJrmVe0rqQDiEeLK7Rvti/TuccLMdNkEJBalWEzZqrKTVhExdMnt0CgelP8RNnGuPVGBWgxfU6ANj08gz/+hc/3ctlJK84S+fzdH781N79DO8G4WM7ISbfuRKZ3OFJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB0pBXwLu1dpKOAIxQrCCshipGKxtXbotCHA0L4jBno=;
 b=jWbdcgzYPa2Y2OyxFN4IzXQl1NnuDaz7nStTGqHIBMcZ12Qbq7bnzUkReprugA5kKatMgzNrKUbW0Oz/xXjwAIVmK/J9ZLgBPoAYlTB4fRkC4qTlntMLjcOrH4kViJNT3t4LC3vavF7RxJZrBxnNSQdXfqXNCtS6mfRSWMSCL31jKL/oO9yVgq59N6yo+9fiLUWDkkjq9QxwR6d62VoelZjePMLFhEjzXoGXC7VWNjApO7ip3XaZuMRTfOb7BGzO6IUZXYY1Jxv2lfwH5kIa69oRgK9l3wA5KeUavOGqu0Ab92MEeLzvCH7YX4DrSqYEdwslpSBzUolHBZdDsv3lhg==
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:23e::20)
 by AS1PR10MB5506.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:471::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 10:34:05 +0000
Received: from PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7615:5a22:34bf:f079]) by PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7615:5a22:34bf:f079%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 10:34:05 +0000
From: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
To: "zev@bewilderbeest.net" <zev@bewilderbeest.net>, "jdelvare@suse.com"
	<jdelvare@suse.com>, "linux@roeck-us.net" <linux@roeck-us.net>
CC: "Lopes Ivo, Diogo Miguel" <diogo.ivo@siemens.com>, "Kiszka, Jan"
	<jan.kiszka@siemens.com>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Question about nct6775 regarding MFD
Thread-Topic: Question about nct6775 regarding MFD
Thread-Index: AQHb3qouiPSBS4m86USQpw7MphY4Rw==
Date: Mon, 16 Jun 2025 10:34:04 +0000
Message-ID: <a0164db0-e234-44ac-8584-a14f0b625181@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5520:EE_|AS1PR10MB5506:EE_
x-ms-office365-filtering-correlation-id: 542265db-51a4-488b-c1c8-08ddacc15157
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDRERXFZL0Q0bTl6Q3gzK1FkWlhLalU4Q0I0OEJHcVdRZTdRT2d6YldwRllF?=
 =?utf-8?B?TE5OWjRLRDlsdTdOQU80Ui9zdTFhYVFsREhLd1lka1d3ekxTQXVLc2w3NVBt?=
 =?utf-8?B?Vnp4eVVCWEFiN0NSaWNrT1NzRXByV1lzYXlwSjFxenB1bFVRTE5mYThkQzRv?=
 =?utf-8?B?dnFSSUd4anJzM09Xcm9DZy9hT2loSy9yQVA1bTJuU0oyQ09hdFpzcVRxcUhD?=
 =?utf-8?B?YW1PbzBjcHZsNFI3emVTTzhLUzRhNTlWR21ReFh3RGt5T1RlNGo0WkhlS2pw?=
 =?utf-8?B?MGt0Z1hOQmtZMWQ4ejQrOGdiMFkyZkpDZzFsTjBoQWRXL3BBK20yV1JQMGZI?=
 =?utf-8?B?Q2VRdkdGa2lNaVE4YkZzYmFPZ2hSMzF0c2xocVhKUzhlU3B5NnhrbklaVXhv?=
 =?utf-8?B?dXl4MTFRQnAxd3hCdGtOcFV1RlRiSi90dFplU2xTMTU3cVRsdnlpR0s0b2FJ?=
 =?utf-8?B?eDNibDN2QWFFUjN0aVdJOUpmcVE5UHp5UHNNc0RObmo0ZVJ6UTNTUjVjakZk?=
 =?utf-8?B?NlFpbVNNRDVhQVo4WmJTbHFsd0JtTnNGM1ZYeWdGS09tNUdiUXRVcW9JZzdG?=
 =?utf-8?B?ZW5FTXNjcVFWT0xENlp2N2t6TnFGWFdFRmdhaTNoNUtZVUwxWlc3cXpaTWZQ?=
 =?utf-8?B?QnZubmNvWFBwNXdDWmY4MUg3NzJjOVpxVHZUeTI1QjRSaWRiRFd1VzArcVNa?=
 =?utf-8?B?RjE1QjNKU05DWWxSSzJTcW5vb0RDQjM0ZTdzTmFrQ0JvYzlUQVVSSGlIR1ZR?=
 =?utf-8?B?T3RqNGJQVWx6M3ZLMWx0VlRvRHY1TnlZNEZ0Uk1ObDFSaTEwemMra0RJclFR?=
 =?utf-8?B?blVHVEkySjkvbUZXQ216U2FTQUkwQWNXTDlvQzBwbHNDMDNjbkdXR0VJaWhP?=
 =?utf-8?B?aTRrcDR5OHA4M2svaEI4eHN4b3FBdnpZY3I1bFFORVgzaFZLQXYyWlFocVpI?=
 =?utf-8?B?YzlKK2pQQUdwZ0tGeGlBaWk0Yk1DOEZOYVZsVE05MEt3VGZ6a1o4VWh0YXNn?=
 =?utf-8?B?Y0YrcCsvbUk4VnpWU1FoczZhYlRyM243ZkRCMFFoYk9TUVRNS01keVVpbGlj?=
 =?utf-8?B?RnBKR2RaSldPR1pSbUdTMjJ1MDl5SnIzdUFLYlorS0lFelBzeWpUN0dUdGhX?=
 =?utf-8?B?a3JRQVhhd2pwRkZxNk83T2R2Y0FtM3BQRmRDejVSZHVkeUxxakdrbjM0amhK?=
 =?utf-8?B?UmtTMEZRN3pMaWxVNmNtaU5naDlkc0oyT2FzSzhnZEhwa1p2Y28vT0I1ZEpU?=
 =?utf-8?B?VTlsMnFFcHN5VUJ0R202dkdxcFFUL1NzZ3FmSWVabHR1NW1uMDV4TjZNMEpJ?=
 =?utf-8?B?VDZqbkxTM1FwZlB6dkF3bkovSTNPbUtvS2VDVndjcjd0enI1UjVoV2EvTjBU?=
 =?utf-8?B?U3VBTW1FZVF1eStuVFYyaVR3VWxJQXhHWlYrYlRySm93Qmp6UDlmM0lyQmR3?=
 =?utf-8?B?eE9BeTlKaTFlbnMyWW5uZzJXRnRmUDdveTAvS0o5VlhhQUtxWGtvNWlKZ1ZT?=
 =?utf-8?B?RFFVSWNxTGN4Ui9XUkJGYkFOd3pOK3VXQ3VuT3VnTkFRWG4yN3NlSjFKSHZT?=
 =?utf-8?B?U3g1dk5kYkZYMlJjbzErbzYrZXZqdUZpRlVCd09oUnI5RzAycFl0VGVna29S?=
 =?utf-8?B?UURoOFU3eUJMOE9pdU0vWENTSWJIdTBZOGQ5TjNxSlpnMDlCdkFLc0k0UnVF?=
 =?utf-8?B?bVppWjc5RGpMRDBTVlBkVnNjaFJFcE5PRnFTMEJsRVdQcit1dUdNVlZWc2s4?=
 =?utf-8?B?RXhCR0NiYTdlbkJ3UGdQeHNydDhwMWRkbndLaEpwMTV5WHoza1BiZUdvOGdy?=
 =?utf-8?B?OG8vQndqd3M5Tm1HSkZkZldRL3hzL0p4VDVoQ1VGZ0RGM2MzTXM3ODN2cFlP?=
 =?utf-8?B?TjBRTkRmNUZSQlZEV01TQU1RblZSZVBLT2xDSi9MT29uSjZWVHd2L3dNemhY?=
 =?utf-8?B?Nmp4ZUYvOEdaSkNVOUYwM3N4SkwzUEpoUU5VQ0VIQjkrL3g5Q2k1cnQzM3Rm?=
 =?utf-8?B?OW1xZWtUZXRBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVRUazFDWUtDb0dtYzhEd1hMSGxhK3RLVHF2UnhSc0JwUnFUbVBwWGNNaWxX?=
 =?utf-8?B?U2xraXBkSUc0c3F1ODBqc3BldjNhR0JKRWFLL3hnOGRWVVpnS3UvNEdEbWpt?=
 =?utf-8?B?U1BSbWM4T2o2Y3ZVa004aFBNRkRFOXNyZ0dJZURhdDVEUjd1cENBZUNLVmc0?=
 =?utf-8?B?RmF3S0QvZjRqOEVTT3pPRHRld1FMdkUwalRzZGxWYWFtcWkzU2Q1SUZpa2JC?=
 =?utf-8?B?TzB2am93VVhGQWZzTEtucTRSb3Fna2JvTW5jeVROMUlqTTRDMHMrbk9xV252?=
 =?utf-8?B?Uit6YXZCRE1iKzhTbXd0WCtNSzl0bjBGZXdpUkdyVVJDNDZYQklSdllPMGx4?=
 =?utf-8?B?cHFISFViWkxVSU9MUVUvci9yeW1uMmp3V0lWSmwvTXBja2dySlBBaHluOGpM?=
 =?utf-8?B?SE9ESzhtdFlqYzdEWDVTc1VOWTZoVEdsaE1ra3laNVozSUYrMU5JRjZiNGpY?=
 =?utf-8?B?bFl3UWdvU3lkNEkzT1BaYnlPdW1pSWF3bGxhZXhnY1NXUi9ESktrSFJ6blpV?=
 =?utf-8?B?OXd0SFBqZTNSQzNHQjFsbW14RjNEQzB1QUFZOWlhaEpvVG1FTWc2bUdIVi95?=
 =?utf-8?B?Q3A0d1EvU3dHQ0FGWUlVb28ydVFMaW1UL0FPdE5MZjcrY2Vlc2ZGZ0JpNmFW?=
 =?utf-8?B?UnM3QnRwbS8zb2RHTWtuMEtKa29OaDlhcTlBcmNtOGdXeGQrQzZaQlR2NFZk?=
 =?utf-8?B?L1hKZnorYWZhZ2xOYVhvNXMvUW5MNi9INEJTb1FtQlJmb0FPUjZoVVRFU25p?=
 =?utf-8?B?eWxjRTM5TG15b0x6clpWMUpaaXRSYlVQRXd0ZGxaSkVoV3duOHFxY1dsaG1w?=
 =?utf-8?B?QlFGWlN4ekVSVDd0TmRoSm5YUGU3bHVpNTNIRWl5NXFibCtrTW5pL2lSTm5S?=
 =?utf-8?B?bks0NDhkV0d2SEoyTFU5ZlRPcWovbVRBdkhyaUprZjh1L2FNMTI0SUsrRWo0?=
 =?utf-8?B?VHFBWm84UVUrVHQ4TkVyNTZiOWZiUytGL2xkL1VtbFNBbzRlclltSXNDd2ov?=
 =?utf-8?B?YTVBT0x0RytiUDZxT1Q2VWI3anI4S3owNEVaa0oySVlKYXdxVmYrOEk0Q2py?=
 =?utf-8?B?a0ovNEh1Umd5MWphUUJQdzFENDF2REl2ZWtKV1JONVZzeDluc0Q2UDZ1aThV?=
 =?utf-8?B?TDVmMDdYNUxlQ3kzTy9haUQvaXBReU54U3RTM2RRcy9FS0lLbUlPMExFVitL?=
 =?utf-8?B?U3ZBcFlKVVpndmxZTWR6UjRmOVNuOWhDU0d5RWJuNGZGUzl3alRvTFZ4YVNU?=
 =?utf-8?B?Y29ZRFB0eGJOaVU3VzliTThhRHRXYk1vSzFHTFNGSkxPaGdDVkMwQ0hEY20v?=
 =?utf-8?B?UWhZWFNXenIzOW8zemhDemwxM0hWMWI5UzFTVkZnQzFQak9OUGZKY1ppRDBW?=
 =?utf-8?B?UHB4Q2RSRlZ2ZGpYakhCelkrVDVzbVQ5NSthZkl5NDVLVUJlclc1bWxOb05T?=
 =?utf-8?B?YkMwOXFkN21zYVZxUWYxSWdpOTZiRGVFL2duSDdQTWJZdnNPNFpINWVrM0VV?=
 =?utf-8?B?VEJtSEEvbmdZU0dtRnkzRDZDKysya2VXOWFzeVVmZU1LbWVKeXFWTlU1ejBj?=
 =?utf-8?B?TThYZ05kQnZCRThlbGdKVnlvdE5qUy9lOTUwMkRDVDBWVWcwaHJFM1ZsZFJu?=
 =?utf-8?B?UGprZEhHMCtTY2FKVkNrZ1lPRFBXTFNLMzFyZ3o2YnhyUk5QNnF5MDV6czRv?=
 =?utf-8?B?MERBTjg2MGFqMnFGN0hnTDFaUGNVMi9UYkRCQkhWK2xmU1ZyeVFaWDQxZXhm?=
 =?utf-8?B?anlkMXUyTzY3MXpQM25TM2hkOXRSK2RMZkJnVHk1KzhvVWFiT1E4WSsxM1ZY?=
 =?utf-8?B?eEtxNVdJamlMREpVNnI0LzBYSCt2bkRpYkJHbkxYeVdvWllVZVhUZnNSNHAr?=
 =?utf-8?B?QjJKOHB6enNTVjh6OEtScXRibFlzeHYrWEVnMS9scE1BTXU4SEQ0aEZxaXB5?=
 =?utf-8?B?SjRBRXpoM1hJMUJiY3hFa2wzWmVYKzZoNGoyYkpUMUx1NEUra2krazk2K0ox?=
 =?utf-8?B?UGZXMkUzTEg0b2FKSlZZRktzaVFNWkluS1VQVzc2d2FGdWVhbkhiRks3cEQ3?=
 =?utf-8?B?ZUEvMk9YVmRxZEw4aUsyaURPQmFDajNoeTEwWURiMWtsWWJ6ZFlUL0JWK0p1?=
 =?utf-8?B?TGpSd044VGhrQldRUjRsenpPWVZobUpITjRaajQ2cUZUbTdjZ0FJT1l0OG5O?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BD7B1D491494F44A6D917A9C4E43DD2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5520.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 542265db-51a4-488b-c1c8-08ddacc15157
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 10:34:04.9610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMG8RcDa0XfvrsyUBK7LAlfM7GvhgTa3yPpMqJenQV/xy7Lheqzx49EJqKZtYbACVGSgD9fO5xSwH4QJpANprerjfipW1PCdNO/C51hU8YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5506

SGkgZm9sa3MsDQoNCndlIGFyZSBjdXJyZW50bHkgcmVmYWN0b3Jpbmcgc29tZSBwYXJ0cyBvZiB0
aGUgDQoiZHJpdmVycy9wbGF0Zm9ybS94ODYvc2llbWVucy8qIiB3aGljaCBoYXMgcmVmZXJlbmNl
cyB0byBzb21lDQoNCk51dm90b24gU3VwZXItSS9PIGNoaXBzLiBPbmUgb2YgdGhlbSBpcyB0aGUg
bmN0Njc3NS4NCg0KVGhlIGRyaXZlciBpbiBxdWVzdGlvbiBpcyBub3QgaW1wbGVtZW50ZWQgYXMg
TUZELCBldmVuIHRob3VnaCBNRkQgd291bGQgDQpoYXZlIGZpdCBwZXJmZWN0bHkgZm9yIGl0IChv
ciBhbSBJIHdyb25nPykuDQoNCg0KTXkgcXVlc3Rpb24gbm93Og0KDQpXaHkgd2Fzbid0IHRoZSBk
cml2ZXIgaW1wbGVtZW50ZWQgYXMgYW4gTUZEPyBXYXMgTUZEIGRpc2N1c3NlZCBkdXJpbmcgDQp5
b3VyIHVwc3RyZWFtaW5nLXJlbGF0ZWQgY29udmVyc2F0aW9ucz8NCg0KDQpLaW5kIHJlZ2FyZHMs
DQoNCkJlbmVkaWt0DQoNCg==
