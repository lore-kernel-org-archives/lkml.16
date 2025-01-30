Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010005.outbound.protection.outlook.com [52.103.68.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B9B641;
	Thu, 30 Jan 2025 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236711; cv=fail; b=LEFP/onLyIbDKcsPKy5VgSpFQTsWyfu9jRDoK49nrA1Hy6yuk4C9TfiEv5tLMgX1IUoMlGizrKIm4SI3pPxsh++mn0pL3EMeqV3WZ+6BEnsdymT9oT2LEWo+TJw27y1j+SjIpqJKeecsu6/6GpFkYvzvDzXk4CgNCzW6JqYQ+10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236711; c=relaxed/simple;
	bh=EAzVhy5Kmv5zjzCDqtIDQOs3w3cR2ly/K9HCUF61IUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mROpMVGiep48dJCo1Y718uqy2LCXUVQB5/HCL9BQj2xDFqJapLMyF12A7lq9N3bgMzVxkDNM62BnLgPLvWJgpSb1w7v09+ql31WSGERj2pljcw09el1SFh43lDzuNzqK8W2HOP8CcNxPVGRkJWuK7DkhHa2tKwNHo40NleVFjBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=OYVsm98T; arc=fail smtp.client-ip=52.103.68.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="OYVsm98T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdgrZFqsJ2ygBHwtB1nrCRSODAkPAeKzs8fjTRisvuuYRdX1N4qDo7OUCVzEYdDbxlLeubjir22xlDobeggb6dUTBWZ0wxE2NDmrTzpQLpfOfhYq6WmcN6vMhChV/ZGuTAIqPP3HDqvEOuaBPu6dvzspydxeIHZpBQ+8mhR2hHOUQ/fRtpbmFachCeuXZkKEnhJZTLYdmqR7Y1Znnip2IfhfviTqFwUX9szgvm0a22oeusMAD8m02BaNVHHxUmfKQ5GfS1ppiXAYGKWdgDmzzOpaR+Ix6QBiqlGwM5sIZU8SHYcaF0hJ+WqWKrGg6Y702yhBtFg7TaP9qAdIK8aEig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAzVhy5Kmv5zjzCDqtIDQOs3w3cR2ly/K9HCUF61IUQ=;
 b=KPm0ybwGBbP+vwgWgAoXdcPIHMf14bWOAL37y+pbQv2E8PtKgM9f54NLium+yIzeCSLf9s4hcumDDpVnDeh7YnmLpx2Sfto2SWY7SlMHChgXLWs/76zw7n5RQIGHuwmiG5klp0zPdp9xnzKbp1QzxPHoegNp5vjBBCuncsX2CjcMmwx8VKGf5XBv4GYoVMBm4Mn172GPJ1cQF6CPi5nHK1bV0KuwkmVOxVFAHVmwTmtfoKN2WVnkdE7nW8NWRfx/Rwt7132AibS78ESVt6civ8BgvDe7espc7U0fpX82Cdkb1prSWxrCP/CyEIW/GnQykzJjME/0K2AkATMbuxIEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAzVhy5Kmv5zjzCDqtIDQOs3w3cR2ly/K9HCUF61IUQ=;
 b=OYVsm98TOvxc+MOhh9r2DIa3nNamKRxF/5odv6VDh2GZ0cI2qE59FqxMGXn2dDyPieZ+KmkhVFgb7boDRlVwlIeFAOZZsHx+gzlOsgCUtxLEcNPDgjo4qzAh44xhwDt4gLs+P4wl27yaJBqdOPlLsDmBHg60hnvHaHW1JMi2IVkkyDJGFL957U3gfFkeDbq5VfzZ7WP7j9kwmIv75HhV4OGXUnU5qeYbMDmaBVfDSstGhh4TuPVjr9VlhWQidA3RPN4xGvniMWBgGoCHMVrl4dmP2EPXAwf2OPGtzqZCSj+RN246czm/y+SeEZCqIQiw0UPGH6R/j7LmVmpAMKBpkw==
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a7::7)
 by MA0PR01MB9530.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 11:31:44 +0000
Received: from MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b]) by MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::21af:2873:67f3:302b%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 11:31:44 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Atharva Tiwari <evepolonium@gmail.com>, Henrik Rydberg
	<rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Topic: [PATCH v2] hwmom/applesmc: add imacpro
Thread-Index: AQHbcnp1FqceRmhJl0yj0+n5oqKJlLMuJVKAgACK8b2AABSIAIAAa1MW
Date: Thu, 30 Jan 2025 11:31:43 +0000
Message-ID:
 <MAZPR01MB828075D2F0549611E63BFE35B8E92@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
References: <20250123121728.1383-1-evepolonium@gmail.com>
 <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
 <7D2F2DB0-E94C-4372-9285-A91C4C856934@live.com>
 <74114528-3c5c-47fd-bcbb-3e8b9bcb6669@roeck-us.net>
 <MAZPR01MB828051F6B356FC4BDA029D1AB8E92@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
 <657230af-2675-4746-b2a0-060aad7026da@roeck-us.net>
In-Reply-To: <657230af-2675-4746-b2a0-060aad7026da@roeck-us.net>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8280:EE_|MA0PR01MB9530:EE_
x-ms-office365-filtering-correlation-id: 83598714-6499-4270-e620-08dd4121ac7d
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|12121999004|6072599003|461199028|7092599003|8062599003|15080799006|3412199025|440099028|10035399004|102099032|56899033;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFZFY0pJN1AvSjNmSk9KQmdJQ3FtM2VnaUZWYmpzTnF1bzBQcmttaGJKUkVo?=
 =?utf-8?B?T1dKeXR2bk1RYnNNbVVYNm0rdnUra2dtNnJXbFlLMVRNVC92QVFRQ0xpU2FI?=
 =?utf-8?B?VTJQYlk0dUlrMXNoWVNDVTFPekcyL1BlTmIzMldXOWk5bTFuYnNoYk9NTVI2?=
 =?utf-8?B?c0RWRk9UOUVjSHJOTzBsaHlvdVRuVktQc3dNN3hqL1BPRkxGOTFReE9BcE5s?=
 =?utf-8?B?b3hFVWFsaVJiOGllMDEzei90UU5HT3BSUUo2bWR4L3NWbTNnUnhWc0ozUjha?=
 =?utf-8?B?WnpYSER0dCtsZ2swVDJZYXE1ZWtlNnNRM1pxUlNpcmJrakgyRE9ZdHhCd1F2?=
 =?utf-8?B?Qm92MXhCSHFVOW9hZjNoS0Q2bmVyeitoRy8zdkROMTZHQUIzR0JJUUF3U3F1?=
 =?utf-8?B?TVNvejVnSm55a0NacTdXT2I3bEhOMXBpakJDZGhFdzJ2N3p4cFFUTktVM0R2?=
 =?utf-8?B?V3JNN3RFclVkcTJ1VUtjMkJDME5ObDB6N2RjQzRKbXJHSWhkVEtycmVpaFNx?=
 =?utf-8?B?cWFmTjFzWXJQbW9yUGpyQmw5bHljZGE3NUY2ZXQzc01xT0lRR0ROQUNrbHR0?=
 =?utf-8?B?bXNYSFpjZDVhNU54SVA2Sy9JakJyc1BnL3ZIcnNRN1oxcGZYZnVSY3NsSVhh?=
 =?utf-8?B?V3kvY0Q4SlhsdzAxYXZQMnZLeXllaitnWGVBUmVaOEswZnZJeXlkRWxXVzRN?=
 =?utf-8?B?VjkwcWxUam1Pbm1mTVVrUFpoeWtvSzNYcHJlMzdnaEh5cmNCQTNQbmpNSjZ3?=
 =?utf-8?B?c3V0TGorRkxteXJMT1RWZ0FiZ1N1blFjbEJNR0NtOUljY3VFd2h6RHAyQUNS?=
 =?utf-8?B?S2tXNDUyUVJoUXJ3TFpHOTE1SUlGTGt4UWJ4d3ZZME5LcGdwL21RSmRnQUx6?=
 =?utf-8?B?LysrTWR3SjVkTXI1KzFoVnMwMlJjdk80ZGVWT0pSSmlYY2lkd20vWFQwaEVY?=
 =?utf-8?B?SmJFREU3MFZreHF6R3c2SDRYTDQxNGdEc1lHc3pEa3lSbys0YTNFWGFUSld5?=
 =?utf-8?B?NkdUcjkydjVBTUZLd0ttdnNKQWpiMUpDbmdVUlpwVU1NUzYyOGpsUGpGR2hR?=
 =?utf-8?B?bnJGQ2ViWXhhTTc4cXJQTkpuR25FaWxtbmdhb3ZFN0QvWjhRSUpOQ1h5ZVpD?=
 =?utf-8?B?ZjlnRGxHb1FXUzNsMFExUmp4M3lPUCtPd2RydFE1SG5aN1ZHZ2Q3dlRiTU5r?=
 =?utf-8?B?dVZRdnlveG5EbmtYMXgwV0FCRGs4LzJoMDgvSDZab3JBb3JjS1ZZRURKUldp?=
 =?utf-8?B?Rm8wWVhRSWQ4WGdndHVqTFJxbWxya1ZjMWIrT1VKd2dIckRrZytZZDdPM0F3?=
 =?utf-8?B?S3VpNXVsVk9iWTVaYTlub0dEZW8xblNTZUpLY01HWjhMaXR5aUxnM2hzemtC?=
 =?utf-8?B?VkFGVzBkazVqcGdIaVY4T2lDNERxbk1MWEZUaU9oQWFJNVY0OGtKSWI4d2dn?=
 =?utf-8?B?djZhK1k4SHlCRGtNdW92SkVVYjFvUWJ4NTlST21EMEFqSXRMNDBsYU5wSzhN?=
 =?utf-8?B?b0RxM25tSTgweWgyNDUySmM2aHZMWVBwVWhMNkU5eHJmVXVWa3o2SjRxMi9x?=
 =?utf-8?B?R2wxUUgzMlljYzZOSU1qYm84eDc4UVRHOElQTjNoRXFSVmZpS2xhM040RmxU?=
 =?utf-8?B?ZityZVJiUHRxYXdoT005QXV6a0xGdTN4dVpOU0FEcThHVDdyQXRnVmZKWlEv?=
 =?utf-8?Q?X/SfQcwirAhNV2n3r4tH?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUR1dTVLRXBVQU9qS1dZZFJhbk8xVWRPWGFvM2UyWDhjK1ZWWGJzQUxOMi9o?=
 =?utf-8?B?UTlQVGdPc05aRE95UTZaWU43SFM4Mm1FQ2RyWXVHQThnVnlLRDQ5Y3A2ZjU2?=
 =?utf-8?B?WEpBYVZxVGxNMDdqQkU3T0N6VnFYQnJMUFZtd3Z4SDNJZFRqYVNkbkpsMVRh?=
 =?utf-8?B?RkgxRXdPaWlUSTZNNCtJeFRzQWpBLytGTStvWGdyazl3bWhoNzJoVjFxQTFP?=
 =?utf-8?B?RUE1RnFHUXFBZkNic2hPOHBNTS9vbHpKRms2MXQ3M0RSdU81ZW54S3pERjd5?=
 =?utf-8?B?NUFwNUhQOGRJMmsvemc5K1BueXZnaitzdTM0b1c2TkxpK0tucTlqMXRZckNP?=
 =?utf-8?B?QTh5UlNpVHkzbktkOUlLUi9sbGVCS01WSjFacmVYMDBxdlhlaEcvanVhQlRv?=
 =?utf-8?B?T2kxbis2NVBaOHBiVWU3c2REVEdJTm02WmFWVWFVYTZ4V1dDdGErVm9ZN0tx?=
 =?utf-8?B?eXo5YzNoT1VUL2o4K0ROT2Z6ZlJrN2Yvb1I1Si8zc3poVExZNlFTeDVENDFR?=
 =?utf-8?B?OGF0aGtmVmEyOFNUbGU2R2lCOWJTNiswVGpXbE41M0g1UUZrMmZRdUk5N09S?=
 =?utf-8?B?MWxDSjJ5QVRQU1dDa1hmTnVGRVZKZVZxZ3dkY2VORHg0VGEyd1FrWDRYaGxZ?=
 =?utf-8?B?VnF1TjlsWko3dWlnKzJJQ3FYbG1zdEFTbUh6Y2JWTUVhREpNV3VPWEd1Smlx?=
 =?utf-8?B?L1RLWnJnbmJEUmZFY1B5c3puUlRIbXprd1l6blZmL2dyQU5wOUhkNWxGTGQ3?=
 =?utf-8?B?cFM5cVk4MTNnL1FwejBNczh4VjVlaE1tQWxMSTI5a1EyV20vdlVhQ0pnbk50?=
 =?utf-8?B?Y2dISUd0ODgrUnhGendTNmZLVEJITkFPenc0R0tocU1NeFlJTy9QTUVRQkpQ?=
 =?utf-8?B?YngzTGtEOWN1UEszYmIzcEtJQWphWXYvNDFBaWFGN3ArelhnM1duL2pqN3FS?=
 =?utf-8?B?anRnd0d4enJIZTBJR3hWZFIyRkZxdThDTXZwdkxDcktHcTEzOWZLR1NxUWl0?=
 =?utf-8?B?azkxSGcreGFSSXFkTER2VzhYM0N4alB2SXJleHNxU2U5Nkh4bGRYRUxxdzV4?=
 =?utf-8?B?QjVRVmJyeTh4dlc1UVQ1WC9BVkt5L0JHWGJCTC9jWlNxaFVGc0o2UzlpaWF6?=
 =?utf-8?B?SWZMUy9iWmd3UERQSVJycUZFRUpVOGJQTlFLcjNhdzcrVHVTVmE0OEtQcTcy?=
 =?utf-8?B?eFZUSkozVmZyL0w1K0UrT1ZjMFNEa1pUeGN3dG1lb01NTHFmc2M1SjV6OSs5?=
 =?utf-8?B?NjlHVW11dUNPckFubUtZTXFNNGFRcHdhV1hyajh2QTIwSHFaM2FmczVWMzU1?=
 =?utf-8?B?UWRBRmFBRUZzSjFLK1lFeTNnZlJOZ2c2RVFuVVBMTmRpUGtnZTNiL0xYRHRX?=
 =?utf-8?B?S29DenRoWHpMTnd5elNHb0VXL0hacFdIVmZmcDFubTZNZ0VEaHlnMFFGZjd1?=
 =?utf-8?B?ZkdqWE9HdnE4cDFPYm1jeWV4STNFWE14dWl0QVh4Y2M4djJGQVV6VFpkMEIx?=
 =?utf-8?B?amdZRmYwL1phR1FvUFV6OVlUQk1tbWFsUkpqOG5qWW5tZ3M2cjd2NWZQWlpX?=
 =?utf-8?B?UUhkQTdrdGNvekFDdEZVeVJxZlZ5V3RrRVNXUEg0aC9SbldkMkVSamQrUXJS?=
 =?utf-8?B?NWMzbkFpSzVFNEE3cVdDbmhzeTV4NWJwVnl6b3JJSUg0Yk91dktUZlNjc3hW?=
 =?utf-8?B?WXEzekNLTy9UQ0VZOHYwZE9EcWM0N0F3djk0b2lJTi9BV1FvaDBTSGMrT05Z?=
 =?utf-8?Q?CGhMEo/PyY5zlSlSmM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83598714-6499-4270-e620-08dd4121ac7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 11:31:43.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9530

VGhhbmtzIGEgbG90IEd1ZW50ZXIgZm9yIHRoZSB0aW1lbHkgYWN0aW9uIQ0KDQo+IE9uIDMwIEph
biAyMDI1LCBhdCAxMDozN+KAr0FNLCBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+
IHdyb3RlOg0KPiANCj4g77u/T24gMS8yOS8yNSAxOTo1NCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+
PiBIaQ0KPj4+PiBPbiAzMCBKYW4gMjAyNSwgYXQgMTowNuKAr0FNLCBHdWVudGVyIFJvZWNrIDxs
aW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KPj4+IA0KPj4+IO+7v0hpIEFkaXR5YSwNCj4+PiAN
Cj4+Pj4gT24gMS8yOS8yNSAxMDoyMiwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IEhpIEd1ZW50
ZXINCj4+Pj4gU29ycnkgdG8gYmFyZ2UgaW4gbGlrZSB0aGF0IGJ1dCBJIGhhdmUgc29tZSBpc3N1
ZXMgd2l0aCB0aGlzIGhlcmUuDQo+Pj4gDQo+Pj4gTm8gd29ycmllcy4gVGhhbmtzIGZvciBzdGVw
cGluZyBpbi4NCj4+PiANCj4+Pj4gMS4gVGhlIGlNYWNQcm8xLDEgaXMgYSBUMiBNYWMgYW5kIHRo
ZSBhcHBsZXNtYyBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBUMiBNYWNzIHVwc3RyZWFtLCB0aHVz
IG1ha2luZyBubyBwb2ludCBvZiBhZGRpbmcgdGhpcy4gV2UgYXQgdDJsaW51eCBoYXZlIGRvd25z
dHJlYW0gcGF0Y2hlcyB0byBzdXBwb3J0IFQyIE1hY3MsIGJ1dCB3ZSBkbyBub3QgYWltIHRvIHVw
c3RyZWFtIHRoZW0gc2luY2Ugd2Ugd2lzaCB0byB1c2UgYSBzZXBhcmF0ZSwgYW5kIGJldHRlciBk
cml2ZXIgZm9yIHRoZSBTTUMgb24gVDIgTWFjcy4NCj4+Pj4gMi4gVGhlIHBlcnNvbiB3aG8gc3Vi
bWl0dGVkIHRoZSBwYXRjaCB0b29rIGl0IGZyb20gdGhlIHQybGludXggcHJvamVjdCwgb2Ygd2hp
Y2ggSSBhbSBhIHBhcnQgb2YsIGJ1dCBkaWRuJ3QgY2FyZSB0byBldmVuIGNyZWRpdCB0aGUgb3Jp
Z2luYWwgYXV0aG9yIG9mIHRoZSBwYXRjaC4gSeKAmW0gbm90IHN1cmUgaG93IGxlZ2FsIGl0IGlz
IHRvIHJlZGlzdHJpYnV0ZSB0aGUgY29kZSBpbiBoaXMgb3duIG5hbWUgYW5kIHJlbW92aW5nIHRo
ZSBvcmlnaW5hbCBhdXRob3LigJlzIG5hbWUgd2l0aG91dCB0YWtpbmcgcGVybWlzc2lvbiBmcm9t
IHRoZSBhdXRob3IgYXMgcGVyIHRoZSBHUEwyIGxpY2Vuc2UsIGJ1dCBJIHRoaW5rIHRoZSBhdXRo
b3Igc2hvdWxkIGJlIGNyZWRpdGVkLiBJbiBmYWN0IHRoZSBvcmlnaW5hbCBwYXRjaCB3YXMgU2ln
bmVkLW9mZi1ieSB0aGUgb3JpZ2luYWwgYXV0aG9yLg0KPj4+PiBGb3IgcmVmZXJlbmNlLCB0aGUg
b3JpZ2luYWwgcGF0Y2gsIHdoaWNoIHdlIG5ldmVyIGludGVuZGVkIHRvIGJlIHNlbnQgdXBzdHJl
YW0sIGlzIGdpdmVuIG92ZXIgaGVyZToNCj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3QybGludXgv
bGludXgtdDItcGF0Y2hlcy9ibG9iL21haW4vMzAwNy1hcHBsZXNtYy1BZGQtaU1hY1Byby10by1h
cHBsZXNtY193aGl0ZWxpc3QucGF0Y2gNCj4+PiANCj4+PiBGV0lXLCB0aGF0IHBhdGNoIGxvb2tz
IG11Y2ggYmV0dGVyIHRoYW4gdGhpcyBwYXRjaC4NCj4+PiANCj4+PiBJIGFtIGEgYml0IGNvbmZ1
c2VkLCB0aG91Z2g6IFlvdSBhcmUgc2F5aW5nIGFib3ZlIHRoYXQgdGhlIHBhdGNoIGlzIHBvaW50
bGVzcy4NCj4+PiBJcyB0aGF0IGJlY2F1c2UgY29udGV4dCBwYXRjaGVzIGFkZGluZyBzdXBwb3J0
IGZvciBUMiBhcmUgbWlzc2luZyA/DQo+Pj4gDQo+Pj4gQWxzbywgd2hhdCBhYm91dCB0aGUgcGF0
Y2ggYXQgWzFdID8gSXQgYWxzbyBhZGRzIHQyIHNwZWNpZmljIGZ1bmN0aW9uYWxpdHksDQo+Pj4g
YW5kIGl0IHNlZW1zIHRvIG1hdGNoIGFub3RoZXIgcGF0Y2ggZnJvbSB0aGUgdDJsaW51eCBwcm9q
ZWN0Lg0KPj4+IElzIHRoYXQgYWxzbyBtaXNzaW5nIHNvbWUgY29udGV4dCA/DQo+Pj4gDQo+PiBB
cyBmYXIgYXMgcGF0Y2ggaW4gWzFdIGluIGNvbnNpZGVyZWQ6DQo+PiAxLiBUaGUgcGF0Y2ggYWxv
bmUgY2Fubm90IG1ha2UgZmFuIHdvcmsgb24gVDIgTWFjcy4gQXMgeW91IHNhdyB0aGUgb3RoZXIg
VDIgcGF0Y2hlcywgdGhlIDMwMHggcGF0Y2ggc2VyaWVzIGluIHRvdGFsIGlzIG5lZWRlZCBmb3Ig
VDIgc3VwcG9ydCwgdGhlIHJlYXNvbiBpcyBtZW50aW9uZWQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0
aW9uIG9mIGluZGl2aWR1YWwgcGF0Y2gsIHdoaWNoIHlvdSBtYXkgcmVhZCBpZiBpbnRlcmVzdGVk
Lg0KPj4gMi4gVGhlIHBhdGNoIGJlY29tZXMgcG9pbnRsZXNzIGFnYWluLCBzaW5jZSB0aGUgZHJp
dmVyIHN0aWxsIGRvZXNuJ3Qgc3VwcG9ydCBUMiBNYWNzLiBJZGVhbGx5IHRoZSB3aG9sZSBwYXRj
aCBzZXJpZXMgc2hvdWxkIGJlIHN1Ym1pdHRlZC4NCj4+IDMuIFdlIGRvIG5vdCBwbGFuIHRvIHNl
bmQgdGhlIHdob2xlIHBhdGNoIHNlcmllcyB0byBhZGQgVDIgc3VwcG9ydCBpbiBhcHBsZXNtYywg
c2luY2UgQXNhaGkgTGludXggaGFzIGEgYmV0dGVyIFNNQyBkcml2ZXIgYW5kIHdlIGFpbSB0byB1
c2UgdGhhdC4gSnVzdCBpbiBjYXNlIHdlIGNoYW5nZSBvdXIgZGVjaXNpb24gdG8gdXNlIGFwcGxl
c21jLCB0aGUgd2hvbGUgc2VyaWVzIHdpdGggcHJvcGVyIGNyZWRpdHMgc2hhbGwgYmUgc2VudCB1
cHN0cmVhbSwgYW5kIG5vdCByYW5kb20gcGF0Y2hlcyB3aXRob3V0IGNyZWRpdGluZyB0aGUgb3Jp
Z2luYWwgcGVvcGxlIHdobyB3cm90ZSB0aGUgY29kZS4NCj4+IDQuIFRoaXMgcGF0Y2ggd2FzIG9y
aWdpbmFsbHkgYXV0aG9yZWQgYnkgUGF1bCBQYXdsb3dza2ksIGFuZCBub3QgdGhlIHN1Ym1pdHRl
ciwgd2hpY2ggeW91IG1pZ2h0IGhhdmUgbm90aWNlZCB3aGVuIHlvdSBzYXcgdGhlIHQybGludXgg
cGF0Y2ggcmVwbyAoaXQncyB0aGUgc2FtZSByZXBvIHdoaWNoIEkgc2VudCBpbiB0aGUgcHJldmlv
dXMgZW1haWwpLiBUaGUgYXV0aG9yIGhhZCBub3QgeWV0IHNpZ25lZC1vZmYgdGhlIHBhdGNoLCB0
aHVzIHJlcXVpcmluZyBwZXJtaXNzaW9uIGZyb20gdGhlIGF1dGhvciBhcyB3ZWxsLg0KPj4gSSd2
ZSBhbHNvIG5vdGljZWQgdGhlIEF1bi1BbGkgWmFpZGksIHRoZSB3aG8gdGhlIHN1Ym1pdHRlciBo
YXMgYWRkZWQgaW4gdGhlIHNpZ25lZC1vZmYtYnkgd2FzIG5vdCBDY2VkLCB3aGljaCBpcyBraW5k
YSBzdHJhbmdlLg0KPj4gQWdhaW4sIGxpa2UgcHJldmlvdXMgcGF0Y2gsIHRoZSBmaW5hbCBjYWxs
IHN0YXlzIHdpdGggeW91IGJlaW5nIGEgbWFpbnRhaW5lci4NCj4gDQo+IFRoYXQgaXMgYSBzaW1w
bGUgY2FsbDogSSdsbCByZWplY3QgdGhhdCBwYXRjaC4gVGhhbmtzIGZvciBsZXR0aW5nIG1lIGtu
b3cuDQo+IA0KPiBHdWVudGVyDQo+IA0K
