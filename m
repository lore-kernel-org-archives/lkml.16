Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011027.outbound.protection.outlook.com [52.103.68.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D91494B2;
	Thu, 30 Jan 2025 03:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738209258; cv=fail; b=Q38NMZPRe5ru0RUfW24drwvULl8eLgg6I73B3irizrb09mQXin3QPlov6QGaHfRuM8O3yTgNTPPgLp7dwIUVFb6bNSlLSfgX8DMMV09ZHqv20aBJVo92FbYiob2VYUalhACI5is5a7bdUJtkHKxekbU6gvD0S7aqg9Ddm5R4Iv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738209258; c=relaxed/simple;
	bh=m9z3hGhoI98P4B3/Fe2ebHWF2Imgy7pz+SQaiSRN1Hs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rmS4VYKqAaMOiMCon8yZ9Np+3Y463bHbf6cx6Y5POiGEb7VhIDB1dcAqCv6M30pC9ZjNdaL6ScuRIXiYBAK6/6VkvaxR9P1meeQmYKFeELk07YR0HEpqaciARgxdSCasauxoytVkWPhUo04YGWKJrYXoiGxFp8jmkBomJq18Glo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kC2VBUB1; arc=fail smtp.client-ip=52.103.68.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kC2VBUB1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fevezYmE2YjX2rRT31doscjhBhLmdnmp0OemyAlCPSWukT66hTggjotnP+/uz34Ir7ItKNEIA85o/nsaE8i8j0rfvt8lGZBLKVthq47Z6QN8oIX94CzWsppaGPrBnqDxopYxLkkSIfea4rsfGryj0wh09iSCnRY23JsEQvUetARmpQxliFn3kxZYiXcOBZZ8nUhslF23zy/zhoSk3RI3iFbLtCaTCFzX30mHJQxpPoQltNA0mZ1DyVcrJyomU/bwAJpAqQb84LlEPWoRRtfkwbGSe7EvnYG2Y+11AiocfBeaymCydQHsX2ml0JrSIj0N4n9JE29jGCCGp3crBEYZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9z3hGhoI98P4B3/Fe2ebHWF2Imgy7pz+SQaiSRN1Hs=;
 b=fW10xzi87MAspf8dIQiS/7ZBrRInkHywvA97K3kEBP3+h2QwvR07fJJEjdrHFN00UXcGbbTyRpFNAgUMamXuoo65e2GhwikAQcWCSCdIlKzVWaACMRjm9OoSRU22V3uvzeIncyg51YkNHtrPzwPNIHTrMwYcbMtSXZ9raFAifnbXdmvUXmGPaxuw5Q3kngOgSYt+porrDN2YyQ47P2uh5j0YzvuDikq0PsJEmX83QrrZ/0af3SGXmwRxiItQuKyraomLVO2m9Y8OCFrSkPWbG06p05jXkNp8aWm9qIznL2AkaixQqfOBS52KAa5BYmcR2IpO9FJyAvqMX80votoAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9z3hGhoI98P4B3/Fe2ebHWF2Imgy7pz+SQaiSRN1Hs=;
 b=kC2VBUB1onmVPUarq5EazWDpGSnbgqaZumQALC/6wY6fGxaCzM4iosnTY4nBvmkCBqD62RiIUgv3g1GR2wpJe58RpswPoAxHkDeRcMEFmCap7m8CcuXjhL3X7MPdqlh38Udtpj/G1D4NRm8+zUSj4sov+C6zyYsYi6P7I5lSBAqCvRg09CxKsXis24PS1Kffj94n67p15atPzsE/uRBT9KxzPOTAPA8ibcNIOAxOgIFkmEoRu0LRdoTU9bKkdoHPdevgDdwguaVjEiiPgyZMhPzDXNw4NdzSRNRmDAxae9B3YyuP+/1Xpp+T7Tyr1LKhRJxrlBtlM64szw9HV5ZPdQ==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by PN2PR01MB4394.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Thu, 30 Jan
 2025 03:54:10 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 03:54:10 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Atharva Tiwari <evepolonium@gmail.com>, Henrik Rydberg
	<rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Topic: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Index: AQHbcnp1FqceRmhJl0yj0+n5oqKJlLMuJVKAgACK8b0=
Date: Thu, 30 Jan 2025 03:54:09 +0000
Message-ID:
 <MAZPR01MB828051F6B356FC4BDA029D1AB8E92@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
References: <20250123121728.1383-1-evepolonium@gmail.com>
 <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
 <7D2F2DB0-E94C-4372-9285-A91C4C856934@live.com>
 <74114528-3c5c-47fd-bcbb-3e8b9bcb6669@roeck-us.net>
In-Reply-To: <74114528-3c5c-47fd-bcbb-3e8b9bcb6669@roeck-us.net>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|PN2PR01MB4394:EE_
x-ms-office365-filtering-correlation-id: cc838413-9a3c-48ff-8c77-08dd40e1c09b
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|7092599003|8022599003|461199028|6072599003|8062599003|12121999004|15080799006|440099028|3412199025|10035399004|4302099013|102099032|56899033|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?WGhpSkFXRzRFYTUreUlMRTA2Wis3eTI0d0lKYU1SaEdDVkdSK1RGdnZ1TUpY?=
 =?utf-8?B?RUQwOFNJYUhnb2drZG9OY3d0ZUFoMVhFdjI1WGtQajJLeXEvVVI5bVE4RHlj?=
 =?utf-8?B?RUZaMFA2RlNSTDNNVnd4Nk5MMmM4VkNWbEZtRmJnZmJDc3RlYXlkTGNUL2pQ?=
 =?utf-8?B?ck4xbDBweU5KTmhhd21jZmZNbW0rejRmZUJQWld4RXZicEZZS3pXOWJRTWI4?=
 =?utf-8?B?aGQ5TVlLeVRBUHlVVG9iY3lndzZFU1ArdmdmS3ZRNlVhbkxRa0lYWHAzZkJL?=
 =?utf-8?B?Um5uWFEvU2xKQmdWQm5UdEU1WHY4T1JHalJRcW9mNDNhRDNPODVCZXM3UkRZ?=
 =?utf-8?B?ejFpYlc2enZYVXNLcHBqV1ZIWTNaQ1JNaW9ENGJHcjM3Vm9BcjJIbjNFT2h5?=
 =?utf-8?B?RTdqNzR2UlRXcjlDNzVZak9Qa2VpeVN1MEVQUno1cDh3anZyWjQzRjJmVlFE?=
 =?utf-8?B?Y2pCWUNOV2xWQUpZWTVyQ3RDdkU5TmsrV0JlcWJMZEorV09NNk5ObjhGVkcy?=
 =?utf-8?B?T3FGYjZmNHJ6eVd4Z2QvTFltWUszMURKRTNOYlQ2OGlCdjg4UzIrQUV2WHdr?=
 =?utf-8?B?NlorM3NPekEzc1JOeGd0SEZZTFhNbm1LUXhOb2lkd0JjNUR4Zm54TDloSHZL?=
 =?utf-8?B?Mmw0Z2d2Q0dEaUg1QmtTeUtwbm9EZXI3M1RmdkZYMXIrMGZ5ZnFFbHVmWkRn?=
 =?utf-8?B?WklDblFrK3cxRFRiQldZVjVBTExCN2pVZklEMGhOMmYweTVCMnNCOVRFL01R?=
 =?utf-8?B?Y0g0bytDVmxjb2wrQnJjUzJIeFd6N1BPR3ZNbEFYWXZVdGtRdUtJMWtkN2Zi?=
 =?utf-8?B?QllEYVRHQ0x3anlveG1PSDE2M2JCU0pRN2lBR01oZEttZUgwbW9mTEFEaEd5?=
 =?utf-8?B?dk0xTzdFSysrRUQvb2lMRU5zRFBhZGxQYW0rS3dmMk8wWnE3ZDg2U1l5S2tG?=
 =?utf-8?B?ZmVqdC8yd2diNVVYWFJkWi85NWx0SWFpM043OWduODMzbGVCY2o5TDlSaWNI?=
 =?utf-8?B?OC9uUGhMaDdWNzVmVWRULzIwcFZUN1dYcFZ5YktGai9qMUxRZGJwY1FXZmtj?=
 =?utf-8?B?TG9tMjYwSDJmNjhWOFhBNW04Z3g3VlBoL2dFT2I2emtLQ3VVM2wxaGZyNU9I?=
 =?utf-8?B?MVk4TFRyS3R5S04zLzZiQzF6cU42SndrWFRmcmNMaWFtcm0wemJJbFVNbjZO?=
 =?utf-8?B?dDJhWitVU0pUMHdtK3hiYXpJSDJjUURDKzU5V3lIdG9JZW15clQrd2N5eXBY?=
 =?utf-8?B?NFVlT3JHaHlvNmRhQWgrNDg3R0JFTk0zSXpadStWZlhhT21KK3Z6NEE5TVZU?=
 =?utf-8?B?cFNrRFV2c1RWblNjeUM3ZDlDSys4eEkrN3hSZkZ1Uy9tMEIvbU1IWWpQQ0h2?=
 =?utf-8?B?OERkNGJnRGNZRkxOc1pZdTJFM3pNSnhEZ20yTTkzRjhXcjE5OWlIQ0hUVFBK?=
 =?utf-8?B?TjdyZElqSzBITGpYeHQyMUM4andFVlZsajNJc29uS2F3WXZqaUh6dzB4dFhx?=
 =?utf-8?B?d21xMlh6NERmdk0zQkZ3OGVWMTVRcXR6bnVqUlNKR2FKRDVPSDVBck9uUWZ3?=
 =?utf-8?B?emZWRnRQWmhPdVQxbjFCdXF1Y05mNEVaeXU2L1JLRnRVREhBbGxROXRLV3NP?=
 =?utf-8?B?Z0FIc0lLNUh6YWtjN0cya1J0SGx2TFJjMzRrS3dmZElWNHA5NU5qalpVNE15?=
 =?utf-8?B?WkZZRXh2OUJYNEpGb1ZqQjljSFNVWFpkOTcwVWxrT245L0RjYkticmRBPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEJPa211NnkwU0wvNjh4MmFiTEtVdUR4RUh4YncvdUZQWndkVVA1NlpMdy9s?=
 =?utf-8?B?S3RDTE4veE5XOGV4NzBLKzVCVm9RcGNhYXNWbThZeHpBVlY4cmN5bHAxMVF3?=
 =?utf-8?B?ZVZkM1hZajdicDJkMC9NeDNpUFlHNmhaTytjTnJmb25pYU5uTDlWNkNLL1Y1?=
 =?utf-8?B?UVV5ZE40UGJLTFlNZklaaUN0SGJieVRhMWdpVWdtYmtVZjdMNlpGQVRtMUhz?=
 =?utf-8?B?MnlrZ0xzU1ZnWGE5NWdHU1dFQUV2UzJmTnBuMnAxeWx1bGFzdmlpNkUySUVL?=
 =?utf-8?B?MWRnN0NDKzQ3T3R2WTRVOHk4OW96eTBRUnlKaHpzSXRCdTdWVjZIRWRtZFQ4?=
 =?utf-8?B?bnQraUllV1BxUENrRUR4R0I2L3NGL3hWZEFZYVhRMWN3bkQvODhVeHc0ZG5u?=
 =?utf-8?B?ZzZYSFRPQnU4UExOUUlJSGxOaVFSdi9WNTJ0Zkx0RitZTVZkamFrZXZXMTVu?=
 =?utf-8?B?eUR6eStUNUN2MHBrZG1MVnEzVTFwQ2J6NnM5YTY0R0Eyb0gwSGJSWU4wR2RS?=
 =?utf-8?B?Y0U1elR6VzYyYzJvRTJjUy8wRHBXTlJnRzljZmN6RWhHNmZYS0k3QUVEN3NE?=
 =?utf-8?B?aG5xd0pnbzd3M3NxcXFKalc5U0ZDR1I3Y3A2bUdLY2s2ZXlEaTRPcFFCUkdk?=
 =?utf-8?B?Rm1xS0VrQmFNVEkwaVV3QWlLeDYyVHZtdDc5UjBxSXdIanEzeGFQU0JoaUhS?=
 =?utf-8?B?T0N4ZU44WlVoMEpUUFJGVHR2QlMwYzM4NGpjNUFDcE1SYU9iQnhydEhud1pT?=
 =?utf-8?B?dkJSZ214TWhxUXhIb3Brem5UVXdoTnhjbGloN1RaNlNsWktlbURlOGxGd0Vu?=
 =?utf-8?B?WndyRjhwNnA3YkRQU2pDRmxGbVB1eE54WFNNeHJ6M3ZwRUFhd2JGTmFrczNv?=
 =?utf-8?B?d1RNK0ZpY3dMVFhoYkwwRzFjd3dMeGZKZkorY0dYYS9EcExFTVVLN1BOZ1dF?=
 =?utf-8?B?cGlMTlFzNGpVNHltbHNBT2phSkRGTm1sS3poUlhkcFVyVHlUZ2lzd1J2T2dW?=
 =?utf-8?B?Y0crTGljZVBqLy83WUU1cGkzOVA4aCtWNFZtbGJUSW11MU1HeGFrdDZadXRF?=
 =?utf-8?B?NE1BeGViaU52bVl3Q2NPZ0dSNDV6QWN1L1hCdHNVd3pvMjl6TjgrZi9KRnNM?=
 =?utf-8?B?MlNkMUNaQ2FPZlBidHcrLzRFdDJoQzlmUTV1WHNtZit2SWlrM2ZBTzNRUnds?=
 =?utf-8?B?anVpdnV1OXhGcG1uZUZMTldkR1R0QlhLVVFXeFZ4Y2F0MXRTeGZOaXFReHRm?=
 =?utf-8?B?ZHgrSTdMcnNsS2NkRWprMUFmZlZaOXJhTktQU3BPZE8vU3NLcjBUMC9CTllR?=
 =?utf-8?B?UEk3TVhUTnkzSWlTdWlyd3lpeENTNnQ4ZTgya1dQZ0VPNTBsa1Z6K2RQZW1h?=
 =?utf-8?B?VzBZSDM3VHJTYzFmRDlXb3FmTW90emVqNmp5M0RiY0tzTXpCa0ZWQlY1dTkx?=
 =?utf-8?B?V1lqakhsbFBTTWgxaWRxR0xpSlluRmVRRFpYclJWdmR1VFVIVnJacHowQnFN?=
 =?utf-8?B?VXR0cWs1SFZmVElwOXlIdmNZK0xEYVd3bmI5UWhDYVFONldMYjlzcGpHWERt?=
 =?utf-8?B?MXRFQmp4REUvb3k0b0s1UVVFa0RtMDFzQUhPeWVkdUJSY1lZeXhzMVpxYWtO?=
 =?utf-8?Q?3aQ5xVUQuHFtvkooHBNkUDThzMnBqy/rdag1YgkSwtQM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cc838413-9a3c-48ff-8c77-08dd40e1c09b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 03:54:09.9698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4394

SGkNCg0KPiBPbiAzMCBKYW4gMjAyNSwgYXQgMTowNuKAr0FNLCBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KPiANCj4g77u/SGkgQWRpdHlhLA0KPiANCj4+IE9uIDEv
MjkvMjUgMTA6MjIsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4gSGkgR3VlbnRlcg0KPj4gU29ycnkg
dG8gYmFyZ2UgaW4gbGlrZSB0aGF0IGJ1dCBJIGhhdmUgc29tZSBpc3N1ZXMgd2l0aCB0aGlzIGhl
cmUuDQo+IA0KPiBObyB3b3JyaWVzLiBUaGFua3MgZm9yIHN0ZXBwaW5nIGluLg0KPiANCj4+IDEu
IFRoZSBpTWFjUHJvMSwxIGlzIGEgVDIgTWFjIGFuZCB0aGUgYXBwbGVzbWMgZHJpdmVyIGRvZXMg
bm90IHN1cHBvcnQgVDIgTWFjcyB1cHN0cmVhbSwgdGh1cyBtYWtpbmcgbm8gcG9pbnQgb2YgYWRk
aW5nIHRoaXMuIFdlIGF0IHQybGludXggaGF2ZSBkb3duc3RyZWFtIHBhdGNoZXMgdG8gc3VwcG9y
dCBUMiBNYWNzLCBidXQgd2UgZG8gbm90IGFpbSB0byB1cHN0cmVhbSB0aGVtIHNpbmNlIHdlIHdp
c2ggdG8gdXNlIGEgc2VwYXJhdGUsIGFuZCBiZXR0ZXIgZHJpdmVyIGZvciB0aGUgU01DIG9uIFQy
IE1hY3MuDQo+PiAyLiBUaGUgcGVyc29uIHdobyBzdWJtaXR0ZWQgdGhlIHBhdGNoIHRvb2sgaXQg
ZnJvbSB0aGUgdDJsaW51eCBwcm9qZWN0LCBvZiB3aGljaCBJIGFtIGEgcGFydCBvZiwgYnV0IGRp
ZG4ndCBjYXJlIHRvIGV2ZW4gY3JlZGl0IHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhlIHBhdGNo
LiBJ4oCZbSBub3Qgc3VyZSBob3cgbGVnYWwgaXQgaXMgdG8gcmVkaXN0cmlidXRlIHRoZSBjb2Rl
IGluIGhpcyBvd24gbmFtZSBhbmQgcmVtb3ZpbmcgdGhlIG9yaWdpbmFsIGF1dGhvcuKAmXMgbmFt
ZSB3aXRob3V0IHRha2luZyBwZXJtaXNzaW9uIGZyb20gdGhlIGF1dGhvciBhcyBwZXIgdGhlIEdQ
TDIgbGljZW5zZSwgYnV0IEkgdGhpbmsgdGhlIGF1dGhvciBzaG91bGQgYmUgY3JlZGl0ZWQuIElu
IGZhY3QgdGhlIG9yaWdpbmFsIHBhdGNoIHdhcyBTaWduZWQtb2ZmLWJ5IHRoZSBvcmlnaW5hbCBh
dXRob3IuDQo+PiBGb3IgcmVmZXJlbmNlLCB0aGUgb3JpZ2luYWwgcGF0Y2gsIHdoaWNoIHdlIG5l
dmVyIGludGVuZGVkIHRvIGJlIHNlbnQgdXBzdHJlYW0sIGlzIGdpdmVuIG92ZXIgaGVyZToNCj4+
IGh0dHBzOi8vZ2l0aHViLmNvbS90MmxpbnV4L2xpbnV4LXQyLXBhdGNoZXMvYmxvYi9tYWluLzMw
MDctYXBwbGVzbWMtQWRkLWlNYWNQcm8tdG8tYXBwbGVzbWNfd2hpdGVsaXN0LnBhdGNoDQo+IA0K
PiBGV0lXLCB0aGF0IHBhdGNoIGxvb2tzIG11Y2ggYmV0dGVyIHRoYW4gdGhpcyBwYXRjaC4NCj4g
DQo+IEkgYW0gYSBiaXQgY29uZnVzZWQsIHRob3VnaDogWW91IGFyZSBzYXlpbmcgYWJvdmUgdGhh
dCB0aGUgcGF0Y2ggaXMgcG9pbnRsZXNzLg0KPiBJcyB0aGF0IGJlY2F1c2UgY29udGV4dCBwYXRj
aGVzIGFkZGluZyBzdXBwb3J0IGZvciBUMiBhcmUgbWlzc2luZyA/DQo+IA0KPiBBbHNvLCB3aGF0
IGFib3V0IHRoZSBwYXRjaCBhdCBbMV0gPyBJdCBhbHNvIGFkZHMgdDIgc3BlY2lmaWMgZnVuY3Rp
b25hbGl0eSwNCj4gYW5kIGl0IHNlZW1zIHRvIG1hdGNoIGFub3RoZXIgcGF0Y2ggZnJvbSB0aGUg
dDJsaW51eCBwcm9qZWN0Lg0KPiBJcyB0aGF0IGFsc28gbWlzc2luZyBzb21lIGNvbnRleHQgPw0K
PiANCg0KQXMgZmFyIGFzIHBhdGNoIGluIFsxXSBpbiBjb25zaWRlcmVkOg0KDQoxLiBUaGUgcGF0
Y2ggYWxvbmUgY2Fubm90IG1ha2UgZmFuIHdvcmsgb24gVDIgTWFjcy4gQXMgeW91IHNhdyB0aGUg
b3RoZXIgVDIgcGF0Y2hlcywgdGhlIDMwMHggcGF0Y2ggc2VyaWVzIGluIHRvdGFsIGlzIG5lZWRl
ZCBmb3IgVDIgc3VwcG9ydCwgdGhlIHJlYXNvbiBpcyBtZW50aW9uZWQgaW4gdGhlIHBhdGNoIGRl
c2NyaXB0aW9uIG9mIGluZGl2aWR1YWwgcGF0Y2gsIHdoaWNoIHlvdSBtYXkgcmVhZCBpZiBpbnRl
cmVzdGVkLg0KDQoyLiBUaGUgcGF0Y2ggYmVjb21lcyBwb2ludGxlc3MgYWdhaW4sIHNpbmNlIHRo
ZSBkcml2ZXIgc3RpbGwgZG9lc24ndCBzdXBwb3J0IFQyIE1hY3MuIElkZWFsbHkgdGhlIHdob2xl
IHBhdGNoIHNlcmllcyBzaG91bGQgYmUgc3VibWl0dGVkLg0KDQozLiBXZSBkbyBub3QgcGxhbiB0
byBzZW5kIHRoZSB3aG9sZSBwYXRjaCBzZXJpZXMgdG8gYWRkIFQyIHN1cHBvcnQgaW4gYXBwbGVz
bWMsIHNpbmNlIEFzYWhpIExpbnV4IGhhcyBhIGJldHRlciBTTUMgZHJpdmVyIGFuZCB3ZSBhaW0g
dG8gdXNlIHRoYXQuIEp1c3QgaW4gY2FzZSB3ZSBjaGFuZ2Ugb3VyIGRlY2lzaW9uIHRvIHVzZSBh
cHBsZXNtYywgdGhlIHdob2xlIHNlcmllcyB3aXRoIHByb3BlciBjcmVkaXRzIHNoYWxsIGJlIHNl
bnQgdXBzdHJlYW0sIGFuZCBub3QgcmFuZG9tIHBhdGNoZXMgd2l0aG91dCBjcmVkaXRpbmcgdGhl
IG9yaWdpbmFsIHBlb3BsZSB3aG8gd3JvdGUgdGhlIGNvZGUuDQoNCjQuIFRoaXMgcGF0Y2ggd2Fz
IG9yaWdpbmFsbHkgYXV0aG9yZWQgYnkgUGF1bCBQYXdsb3dza2ksIGFuZCBub3QgdGhlIHN1Ym1p
dHRlciwgd2hpY2ggeW91IG1pZ2h0IGhhdmUgbm90aWNlZCB3aGVuIHlvdSBzYXcgdGhlIHQybGlu
dXggcGF0Y2ggcmVwbyAoaXQncyB0aGUgc2FtZSByZXBvIHdoaWNoIEkgc2VudCBpbiB0aGUgcHJl
dmlvdXMgZW1haWwpLiBUaGUgYXV0aG9yIGhhZCBub3QgeWV0IHNpZ25lZC1vZmYgdGhlIHBhdGNo
LCB0aHVzIHJlcXVpcmluZyBwZXJtaXNzaW9uIGZyb20gdGhlIGF1dGhvciBhcyB3ZWxsLg0KDQpJ
J3ZlIGFsc28gbm90aWNlZCB0aGUgQXVuLUFsaSBaYWlkaSwgdGhlIHdobyB0aGUgc3VibWl0dGVy
IGhhcyBhZGRlZCBpbiB0aGUgc2lnbmVkLW9mZi1ieSB3YXMgbm90IENjZWQsIHdoaWNoIGlzIGtp
bmRhIHN0cmFuZ2UuDQoNCkFnYWluLCBsaWtlIHByZXZpb3VzIHBhdGNoLCB0aGUgZmluYWwgY2Fs
bCBzdGF5cyB3aXRoIHlvdSBiZWluZyBhIG1haW50YWluZXIuDQoNClRoYW5rcw0KQWRpdHlhDQoN
Cj4+IEkgbGVhdmUgdGhlIGZhdGUgb2YgdGhpcyB0byB5b3Ugbm93Lg0KPiANCj4gVGhhbmtzIGZv
ciBsZXR0aW5nIG1lIGtub3cuIEkgZHJvcHBlZCB0aGUgcGF0Y2guIEknbGwgYWxzbyB3YWl0IGZv
ciB5b3VyIGZlZWRiYWNrDQo+IGFib3V0IHRoZSBwYXRjaCBhdCBbMV0gYmVmb3JlIGxvb2tpbmcg
aW50byBpdCBmdXJ0aGVyLg0KPiANCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo+IA0KPiAtLS0NCj4g
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1od21vbi9wYXRj
aC8yMDI1MDEyMDE4MzM0My4zNDk0LTEtZXZlcG9sb25pdW1AZ21haWwuY29tLw0KPiANCg==
