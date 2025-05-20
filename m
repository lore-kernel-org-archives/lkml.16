Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829525487D;
	Tue, 20 May 2025 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.152.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709663; cv=fail; b=D3k8ibwP4tmTVoSTVFTxLKOD32bWKJjHElB2kWrLdXZn2+XAjS4MjVV2w50+WgDupd3ChlzSi7x4Hf+aEayoDx8U7khPXos/ue8qyxFbmIW3T8Fhfzp2JJ4xoHZULsh08QiwZSjMlMAFVJi9/xDkfbgogaJ+n3mRFdJs+m2UaYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709663; c=relaxed/simple;
	bh=NwoBIBl5XQbEaBtXph9+TudOv4Qk5DXcfSkDXIFpGYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WLO5NlbNNHsAKwV6FCzWItExwtBxrt6n7v8OG3zmjBlvzGdw+CDnH1hsU6y0yVilv8rffwMuYoXghngzdGiKL1ore6I8eyXifVO7h0GY2/VIl/4fChBOCuvVbkyApFjKIuGZD/BBblE72pnFZeKSIQDNOBAEobx5swC9OJKKNto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=JHtr4itA; arc=fail smtp.client-ip=68.232.152.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="JHtr4itA"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747709662; x=1779245662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NwoBIBl5XQbEaBtXph9+TudOv4Qk5DXcfSkDXIFpGYw=;
  b=JHtr4itAUdStxiIzb6hJsLpXRVDflcKmpVc5ehovCJ1ap1DUn97BnknJ
   lj3f1zBG2vG2XZ60S4G96e8yPfHbATJo86gFxgN9OuPuDFHzkWvWUqjdD
   3QT2HHQRC0I9cm7tVSfnfep8+OLBNAgJRHQ6ZJpcWNQqBy7YG9KKxQWP7
   wHex3GJJVMNPaWtOKWT3QUUNPTrf3zXNSjlL8SlhK1ntI5dGfIMbLChnZ
   oYqOFsYQIC85JFnNROnpa2k/UgWwtqwKmOkILkbIzSklEs+Jfay29Tjwu
   k0qKEa046TqC1FWB0Uk1BnP94lljsT+0pZqEzU3PCrRDjPKSDqZ1y3nal
   Q==;
X-CSE-ConnectionGUID: 7liNoaGjQf2/SFUwd/Jgbw==
X-CSE-MsgGUID: uBtWatBHT+GgS9l0cbu+mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="67019262"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="67019262"
Received: from mail-japaneastazlp17010005.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:54:11 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tg9hdP2GeNFAu7bliw32w5GFAhJpfRkh/N9btSR3MmfMoHxIXeQar/vI8hC4trZ7J4+S9pcQizojpviRwPLolePYCot0rJE3/p4HujGoAmFDT25axH/GnCyTtsWuixn/QLJnJ0qFeXQD92PRvWX047kL1zBbFib4SUxqMJPSiEx3lI7WMEVNOLCQzHAcBz8nWlnAEW+O9R3UP6PPibB+XxHmYHddN6XGl2w22D74D/pvibbH67w0t5z4pV8YJhlNEbzcreXJ5Tm/lp5OdlSKdHYUVyJzyPzKjgOYswpGhKOKlC3g790+NMVa5sTQEb4Eq8DGrRghm9D55mHGZ9gfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwoBIBl5XQbEaBtXph9+TudOv4Qk5DXcfSkDXIFpGYw=;
 b=R7/mvxbo4+xq8AAOA4jzcOW1Rkr/lOghsTebEg+GpHG+Cw1z9aYLD4qUt2iw5bxMNKHchMohyTf4Xi6upPK52uHdiryu9oH0Zr2OnqNf6a+8wCgYMnXtzsm8PFVnXSjGfaGeY1jdDyw98/YmdsBLMkdXVYB4w3PL2QavAdQu0OAA8+Yri2NAYxlgn/whKACPj1EfMgoVK2ii594uORvmto10x5mub9OkYIIbRnYiq7ODgfRukkU07KFIiRNqY2Wa/Raf6Wo4O7xIXLLmIXg+29QcciAZQgv0Hz63HIHgVPC5ZzuQhgwGlelnjUh4STe481TIw1ADjK0DLsvHZFXubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6)
 by TYWPR01MB8429.jpnprd01.prod.outlook.com (2603:1096:400:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 02:54:04 +0000
Received: from OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a]) by OS3PR01MB9382.jpnprd01.prod.outlook.com
 ([fe80::948a:2ed9:c684:905a%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 02:54:03 +0000
From: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
To: 'Guenter Roeck' <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>
Subject: RE: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
Thread-Topic: [PATCH] doc: hwmon: acpi_power_meter: Add information about
 enabling the power capping feature.
Thread-Index: AQHbyI+Sus8zrfmpRUiAL/7jGhowP7PZ74aAgADhu0A=
Date: Tue, 20 May 2025 02:54:03 +0000
Message-ID:
 <OS3PR01MB938276CD2B8841B7E76C8B8FD99FA@OS3PR01MB9382.jpnprd01.prod.outlook.com>
References: <20250519072756.1512244-1-fj5851bi@fujitsu.com>
 <a82015f1-0a19-451e-9087-060a1d2c6c4d@roeck-us.net>
In-Reply-To: <a82015f1-0a19-451e-9087-060a1d2c6c4d@roeck-us.net>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NWUwZjVhNjYtZmI1Ny00NTBlLThhZTUtNTY0ZWQ2YjFh?=
 =?utf-8?B?ZGY1O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDUtMjBUMDI6NDU6MDRaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9382:EE_|TYWPR01MB8429:EE_
x-ms-office365-filtering-correlation-id: 5c225a15-b69a-4ef4-bf86-08dd9749947f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?RG5LZ2I1MzJUZDMzcXRBTkp6RUZqaUtDWCtTVzJmZlZBUDlUbTR6ZzZCY3Bt?=
 =?utf-8?B?M3BLd0FSMW5wZm12bTdoMUU4SUpBZ1BYOFA5VDZITXA4dHFleStCSXdZVEFD?=
 =?utf-8?B?QjVwYStQTVpRYTU0NlJ6aHpHYUdURTJYNUo1YTZzZENyUHFab0JuSkNmVnlE?=
 =?utf-8?B?OFVJUEVrTmJiZlE1WDc4SzNtLzFxbHVYeC9rN1A5VVBkZmxiTHNPanM1Lytn?=
 =?utf-8?B?ZzFhZ2tXdGhReFp3b2xqcE5majVoQ3BacTRlUmRaNGZlL3B4VUFaRWZhSXpo?=
 =?utf-8?B?aE5oWG5KM096bnZCVll3UjV0K1F3RStQa2orYWlLZzRVcVZmQXppU1RIeWt5?=
 =?utf-8?B?S2ZlclJlWk9pZVNXMGljZktld3VFazk0MXRZbldOOWZIOFhXMzVZSXpxemY3?=
 =?utf-8?B?MDNEOFVZNjMrdUhILzc5TEh6Nm1JRERoOE1vbkVKZWorbFR4ektkc2dKa1Ev?=
 =?utf-8?B?KytMNzB1RzVwRktiQXdWaGhwK3U1N1hJUytYTnBzVHJZamhWZWM3V3pML1RX?=
 =?utf-8?B?aUtvUUltMVg1WWM4YVFlWVo0SjdPdjlDVDRNWkViSWpPblJadjdNWDVQZ1Vx?=
 =?utf-8?B?QThHTU1SVEJ6Wi9Mam5IMDkrRnpTMWhoYjg3OFg5RzdNRHg5TGpqOWdDc2x4?=
 =?utf-8?B?Zjh4ZTlPcFlmVzY0cHhPR1FyNTBUd3UzbjdLRExGckhuaE1iWWtzSGxJSXdI?=
 =?utf-8?B?NW9qZitHalY5MFBseXkva1ZOaC9ka3VJdzMvbDNPRy84N3Z3SXVGbE5wbFFF?=
 =?utf-8?B?R0htZTZ2RUZEQ2t6VFd4dFRiRG03djd4bDVtMnQwdUFsMncwb3VJU2diYmtw?=
 =?utf-8?B?UTVTeS9GOS81SEx1R2JzVGNMRVRzc2hVQjl4WnUvWlVHemlzZGRoUVk0SHZG?=
 =?utf-8?B?d0JtVUxRNVdIQzNodjlLaTVlZktwVnJNZ0RlRi83UE4wcThJeHlHbXpJOFpD?=
 =?utf-8?B?YmZ6QWhLYy82bmJiUFlXb3NzdGpQUGNRTHMxT2VwM29vTnU4SU5lVW92WGp2?=
 =?utf-8?B?R2ZrNVBONTYya0tXN2ZIWmFVdTg4eUdINkY4Z253Vjh0aENvZCtLYWE5dzln?=
 =?utf-8?B?SFRJUUdBMUxyaER5M0NRa1dtSjlRUW03c0VZN0d5NTlPeHlQVXZ2eFBDQXhq?=
 =?utf-8?B?Nld3a1M1MkZBb3g1UE5BNTBxMTVSbmEyaWZ2YU52cEdiQjRTaUJUTzNLU2Jj?=
 =?utf-8?B?NDMrRS9KLzZ6Q2x0VWM0c09QY1VaOEVHL2U2NVE5MGY3amJIUnpKQXNuQmV4?=
 =?utf-8?B?QnlQZXFvMFl5amx4UVJvamgvZE9rZlA1V1VvbDdNamM4YmlvOFhYaWlFQlUx?=
 =?utf-8?B?Z3hSQzhtbDB0OFlMS1U5MHVYQVpYdVg3N3FJWnFOR3VCeVdLTnZma21UOFNa?=
 =?utf-8?B?T2YvMG1TSEg5bS9CKzZHZFJNNkJZQzF2UEQzQjN2S0Q5ajZDcXRBZWx5Zk1q?=
 =?utf-8?B?dXhXOTJ2R1BzSGRBTmN2WHQ5WWhnRzdMWWtObXNWdDk1VjJrc21BSmRZRCtk?=
 =?utf-8?B?Zkc3QlNWR0VTcFZ0b1NUazJFSStwZno4YUI5QnVUSXMrRGpmREZDN3JBcG5C?=
 =?utf-8?B?MXRnandldzBjS2hWUjJEc1p4elNQeGFubUVTMWdDcVpEVGJmeXd2UnZWMzBz?=
 =?utf-8?B?OWNqdm1VN1ZlVzlNY3NET0JiZmJybWtta3RvMWpNVEVEWTFkVTFxb3dHeDBE?=
 =?utf-8?B?TnFsTWVYWkdQSlFvTmZnTUlYck5ZUWp4UlJoQ1NEcHpHZDcraUQrSmhpYWk1?=
 =?utf-8?B?cTBRWjdxc0tCakdJRVNDZmd6aldrOG9uZ1ZFaGVjeUZjOWpYQUEzYXU5RHR0?=
 =?utf-8?B?SUdzdS9kZ0Y1d1JaWUZjYzNFVmZVNEZ4c3FqNWxFWXNZcjlMeTFCbUlPQUI3?=
 =?utf-8?B?cVRtcHIzYTBPMXVjWDE0QkRwWXZ1bUM1UTZkTEl1ekZCM29ZWktGRFNIcThq?=
 =?utf-8?B?UWdXYVJYT01IVVZiVU1jdWV4VkpOTno5UzhrZEh3MkdVZTA1SXR0Y016ZS81?=
 =?utf-8?B?eTdzcUFFZ2gzLzdHVVRMdjJ4SHhWUjd3cUxLZzZaRTBGNWNEL3ltR2lOaDUr?=
 =?utf-8?Q?SQ/kOX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9382.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enN2cjJyY1RsN2hHUEpxcUJRU1FKNDFITHFQaVpzaEFOT0ZhMWhTS2hsZXVl?=
 =?utf-8?B?dUh3SDVGOWJFR1hyOWhZTnNXVllsdVdaNDZ3R1lCVTZCVDdqSnBwZm5kQzM0?=
 =?utf-8?B?clplWGtJcGdGeGFqVm9qSGF3dlVIdlRrMTUwZXdoakxXLyszWGVTMnJUZDFu?=
 =?utf-8?B?aS9SQlhPaiszemc2NFVLVjhiWStqSGtnc2pVdVVHTVBkazhOZU5nWVZTQk01?=
 =?utf-8?B?bkhUaHRmdUxGV0s4SUVSRnNCWHJxczNBVEd1RFYrK1p5WUdjaDFrRmlmL2Jo?=
 =?utf-8?B?UDljVzJNMCt3bk9KRks4S3VKYU42WVBNZk9PdUhGK3JySkFncXc4NzYxWFc4?=
 =?utf-8?B?UTAzRGR3a3NRTVdVREoyckZMK3VWTkM4TzIrQk0yLzgzNitaWEtXbHZiUWMr?=
 =?utf-8?B?c0x6WERBWWM1TkVLWElOaFhoeHc5R2Y2SCtzNGVhRFZjSVVUK2pGd2cxQmp6?=
 =?utf-8?B?angrSk1PZ3AveFp4Y1dVUk5KdzhxZ1ZLajR0TXRIM1pjSE9TNWlPWjZYanpO?=
 =?utf-8?B?MnFwYlM1Qlo5dlJaSm11R3N1SjMzd01DTGtLT25oR3ZYd2U3SHpJd2YwRG52?=
 =?utf-8?B?Q095OVdkdmlvcWJhTlhXekRjVS9ScjZWQ0ZjaVJaUjZBdlNDWm1kem9MZGs3?=
 =?utf-8?B?Z2M3UldPeWhOZ3JwL2RGUUxjWjFBeHRpUndHSHB1NXpUcnpLakFEaDg0M1gz?=
 =?utf-8?B?NFQrN3o1RTAxeTE3NE1hOVBYUnFKbmZ6Wk9MMjRSbFY2U2RROXQybGRHRlh6?=
 =?utf-8?B?TXR1UXBvdXF4cVVOMTFHa0p1S1BPbm5rRWZ5MFVvMGk3UDgzaStpTTArTWhw?=
 =?utf-8?B?b3ZvbGNleXNtUjJPYVNyZnRyQjhwTEIzNjNKNm14Q0NOcHZPaXlVL21DMEhK?=
 =?utf-8?B?MWdRampBWVNwK2lGelhjK204WVRyNUhFWE9ZcTAyakR0QU5vL3VRNURSN3Iz?=
 =?utf-8?B?V0IzWUhVUDR1UzlHQVZRN0tCTmZ5TWV4aTZpN2p0YzVSaGY0QVdjMitLc2VG?=
 =?utf-8?B?OERJcXcwTUlPcG0rL0U4T0R0NWh0WFc0MG5wM3FvbFg0SjRWZjAwb1YvaFBC?=
 =?utf-8?B?MUdQMytOWVM5QlJodndvSEdIeGFyNWRLVXl4cXMwMmNSVUlQK0pHb2dyT08v?=
 =?utf-8?B?UHNvR0NQWlU4TnFkYkNhQ3pwT3Rid1FVZlVCOVoxQUdjV2duc3ZmVU1OTnhz?=
 =?utf-8?B?cnYyV1NCWmtldENjWm1Lbm9aN0hTWlRSVGF1YkE5ajFGOTdRTU9NSENqZXJK?=
 =?utf-8?B?cnJRWU9uQmJKNW15WVNQWk1yQkpXTmt2ckNmOEdYQXhpVnYwUjF4R0N6SnlP?=
 =?utf-8?B?cllKT25FT1ZIeVZhdkxGdjNQL25xVzJ0L054aGR0TTlieGFxZnBiTUpySG5U?=
 =?utf-8?B?OUVjdi9HUHZkTjFvRDE0d0JpZG9ObWI3eXk2NVdzbEVoRkxqR2tyZHgwQVVL?=
 =?utf-8?B?NDg4K3ZqcDJsMTk2eEJON2ZsdXVaYnF2U1lPemVVSWo0eWxWaHhMN2VsNzlS?=
 =?utf-8?B?VGFRajBlMG9sdGlDWVBCanFlZFNXNFFmRFMzck5wZUdzcFJRakNLYk5RQUQ5?=
 =?utf-8?B?TTJabk16UnJJYTQyc0JpY2xTa09mNDBqWWZUMFFuUDRVTEVMSjBvSktlMHZ3?=
 =?utf-8?B?ZTJ5K2c1TGI0Q3JxR3JacFg5WW1FOVVUNWNzYkJUaUZ1ajdSYjdjaC9IUUl6?=
 =?utf-8?B?QkpJbXdMc0M5aTkxb3loWGpJZVJqbzlYR2hNejBnYzdJbjZFMlZSSVNzUTZX?=
 =?utf-8?B?M2NhaE41bEZ2bUlIOHNjdElXbUxPaEJhaUNsUklWTHd3Q0pWNXBqYUFab0t4?=
 =?utf-8?B?Q0xmZmtFT3JYNEhNMXdNVU5DTDZGV1VmTC9xaDVzd2RtclZSZUZqcVFZYzFj?=
 =?utf-8?B?NTA5Ky9mVUFqNzdFQ1FscHpMclcvL3RlQmRFc3hLclpxYjRMQ0gvdGlmcXpW?=
 =?utf-8?B?SDZzQUIzYkkvdUVldTEwcDcxeUZMWkN5YlFGaUIzK0luano0aDJ0Q1hSY2lx?=
 =?utf-8?B?QXovdHpvYWlvdlpZMGFFRlRNZTBtcTkwdkFPbDBQTmZ5d3JuTXFhWDVtNCtq?=
 =?utf-8?B?TFNZR1J5YmpBYXVNbXFBWGk0ZFFmWnU0U01lUUdrWHFwSGpmVkt3ZS9vTWt4?=
 =?utf-8?B?cG5XQkVQaTBsd1d1bDM3ZUNWM05hUmxtbzBnVFk0RWp6c29ZT3VVU2dmeGtj?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PI5vR2ZQCbtOawWql/QWjzQOnsgLuBtERh0mOrOh3pHDgTh7Ojy1nD0dFhD7bD2ak5QpmGU1Fa6QEF+sMKqF/p6BUBMSHHo6LUbmXUwbRIJUusm3pIdx0T+kokRUCQw+9dkHzZ8SQlGu78X3ChDQeMvYq0dlOyGruHECiHPY8vr4Ids9aRUeUoGF0rl0OiyWua8bNLIfZjadfR/3d0B6utcYIoGB5T73lDIZwdS5muT2uRzovGjObX/zjhK4WVtOloBjqb3OE0DBPYwmZFLZatAuHjngydZAw2cK7v9ZIzlaok4SggpVx+vmI4ee95to0NvUAjzMzdf0gbBcxzt/2n4P24QzgoEXZXArlqfm7fykGHbUd2SKHoc36f08wXpuvFKNFzL8r1fLKZj6yCsPjPZMTGjh/11ToHq3jTJuT7Q5k8qku1LWeAL3mssqDRNWfZNi+WsrAZdNOvzaDrqzbe/oj/VMchMfXdkYvkGsl9WAHI2UccwWwH2HNA0YfmN9AY7lP05qA6dbUnrBiDNPxMts/g9sppmBHk9yOKIsGxVTTPC0T95mgRskWFuNVFbzsPYt8clhTY4aVFwLSYpK3XMoa+m56N5tSmlJ/LXn/x7QOcI+u6A3AEOSc5gutyh5
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9382.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c225a15-b69a-4ef4-bf86-08dd9749947f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 02:54:03.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTtM/era5CUJp42eS9VA45LQ0rf5QORu343Qigg7wjleaC5GHz+j3mg8UO+d9sIya1ZIlVLKdL/MsjU/LMIASphWn1zzE8c85qOBjJosGhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8429

R3VlbnRlciB3cm90ZToNCj4gVGhpcyBpcyBwb3RlbnRpYWxseSB1bnNhZmUgaWYgbm90IHJlYWxs
eSBzdXBwb3J0ZWQsIHdoaWNoIG5lZWRzIHRvIGJlIG1lbnRpb25lZC4NCg0KVGhhbmsgeW91IGZv
ciB5b3VyIGNvbW1lbnQuDQoNCkkgd2lsbCBhZGQgYSBub3RlIG9mICJwb3RlbnRpYWxseSB1bnNh
ZmUiIGluIHYyLg0KV2UgYXJlIGNvbnNpZGVyaW5nIGluc3RhbGxpbmcgQUNQSSBwb3dlciBtZXRl
ciBvbiBhIG1hY2hpbmUgdW5kZXIgZGV2ZWxvcG1lbnQsIGJ1dCBJIGJlbGlldmUgdGhhdCB0aGUg
RE1JIChTWVNfVkVORE9SKSBjaGVjayBpbmNsdWRlZCBpbiB0aGUgZHJpdmVyIGhhcyB0b28gYnJv
YWQgYSBzY29wZS4NCkkgd2lsbCB1cGRhdGUgdGhlIGNvZGUgaWYgdGhlIGFwcHJvcHJpYXRlIGNv
bmRpdGlub24gaXMgZGV0ZXJtaW5lZCwgYnV0IEkgd291bGQgbGlrZSB0byBjb3JyZWN0IHRoZSBk
b2N1bWVudCBmaXJzdC4NCg0KU2hpbmppDQoNCg==
