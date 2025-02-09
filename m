Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967681B95B;
	Sun,  9 Feb 2025 03:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071912; cv=fail; b=X9dTHwF7Fazv1QpZiSeCzYaXXfnVRS4mXrfaGcvni+/SGdqCZYuyJ0g0zITXCI2cCGq1EVJZpipI3q0lFUdjQ+M72EDEEBt7utwF23m0BFhV2Wo1wH2gBrvR3wkjrF9Q7Uzjwtu7Wf4RagrHOTSpqql64Vux/Q5IYinLa+BLtJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071912; c=relaxed/simple;
	bh=/bJbVJvw3qTkZtbex1eo/+dDXnRiQtLWQXzkVkW09RM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AbyDKvE3XRiCzObMhkd3rnjMPZJ9c4XwECU6MJdNDuRtSgSYD/moYuLRTkQ8H0Fglexi/L9mwZK8eZjQEz1FrncM8QB01LtqUkdbZLa6+ZeR2ttV3kCbiBVRvBkirkOmCF4j0zn6m4zhttsYM634s43oN+IcBozo0WD5DHJGYoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a6GUs97Q; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=U4SujXX4; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a6GUs97Q";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="U4SujXX4"
X-UUID: 627f5ed8e69611efbd192953cf12861f-20250209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/bJbVJvw3qTkZtbex1eo/+dDXnRiQtLWQXzkVkW09RM=;
	b=a6GUs97Q8iiR28uEKVqSJJnuuBmtQA51WY/t/NWEbCMWkDXjoyeZNT72oIBkzHkR/AqxjKGwCnCYIPubdE3vcP3f8aClWLveJf8MnpsGz4SFbRZsCvNFEwgbOK//U9vsxHQGlTi1u7ZGFv1DOxFnU2y4Vt52AkQiFoVZdWGixYc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e72f9d2c-1c14-4d3d-81da-d38633efab2a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:907e433e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 627f5ed8e69611efbd192953cf12861f-20250209
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1277436862; Sun, 09 Feb 2025 11:31:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sun, 9 Feb 2025 11:31:43 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sun, 9 Feb 2025 11:31:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm9HLvM8iQoV3FNiUq+/ZzpEA9uIx/qiAVzKv+PGzkgKr4l911rz+dsZOdLZOwPM48mwCF6n1gyi9oW239oFJEku6m+RA4+05jMTTxjr5JWL1ZE3FTjVD4l0JmF78z7AI24QL0DH3f0LHFj1VdVrjkjMkNb5Hl8+zDSdqm/gk+miyNJX1/IrT5kfbVS9nez0i27VnDhbk+BqWb3HDQMyN/qTKZkiq3sg44TWhhFkzOfegZVNF59yNo2p3XcgSjdWO2qM9SBWzv26h5368y7a2fmo7U0SsiMYfYMQcbY9vnzuoE/ZBh4QM8m/bdOB7UZczzAuy4BLkknDZPxrXwxk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bJbVJvw3qTkZtbex1eo/+dDXnRiQtLWQXzkVkW09RM=;
 b=Ad0Y6asDVhC7zOexDNdU4jlWcfuX53xGXGzhMEF/UeAa1LUAVNoCny0YmlkUhAml851pnZfpgvgnQ/4vXbQOUKv1HSmenBiE242qzLxbAoJhK8wg38/ep8k7+MExsf2E1E3+uLgTEzGekfNCATPuWibmF38Fu2sokqJhxlaKmVuFH4wrIZDt1ZjUrrt5HmnN/R+4IyG2aeF5WyY1oEGbYg5Gh6XKODAQqnIQy4YcNqSus0NcyLYlzsDglh5ENOt7kAUKWQ/io5lZY22ESa0jEAle6FBqbQXyPiNVMYn+peb+6grkELMCFtDCXINEQ3EsVisx5+g2G4axhj6EkuQx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bJbVJvw3qTkZtbex1eo/+dDXnRiQtLWQXzkVkW09RM=;
 b=U4SujXX4cSjaNpSDZRDZPh5FbnsE9eGa2axXNEXcN+eVrbxtxgKaGFmcCM6PduTgEGPgNhJZ9WIaNRmFBxAgMx75WMWUPnQLLXidnYQgztJg1sZb876OxyQgY31FrGs+hw6EqjO0Sk6MnZvJmDPwUUDlW+fQHedsB682aRmBEUA=
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com (2603:1096:301:9d::13)
 by TYZPR03MB6647.apcprd03.prod.outlook.com (2603:1096:400:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sun, 9 Feb
 2025 03:31:42 +0000
Received: from PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6]) by PSAPR03MB6236.apcprd03.prod.outlook.com
 ([fe80::2b28:30c4:61a8:20f6%7]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 03:31:41 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 4/4] usb: mtu3: add support remote wakeup of mt8196
Thread-Topic: [PATCH v2 4/4] usb: mtu3: add support remote wakeup of mt8196
Thread-Index: AQHbbBPPPDZzX/JviUGkRts1859fH7MiiHkAgBvloYA=
Date: Sun, 9 Feb 2025 03:31:41 +0000
Message-ID: <a689f7d25fb05ba83ac2de6ba879998fe2e21bcb.camel@mediatek.com>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
	 <20250121145008.22936-4-chunfeng.yun@mediatek.com>
	 <e63fdeba-04dd-4b88-a6d6-ca8a64e28e36@collabora.com>
In-Reply-To: <e63fdeba-04dd-4b88-a6d6-ca8a64e28e36@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6236:EE_|TYZPR03MB6647:EE_
x-ms-office365-filtering-correlation-id: 66a52137-7ceb-47d8-1b2e-08dd48ba44ed
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?REpwalVkdEdjQmFFM0Zpc2VQbG5qZWJhTlQrMlg1YU03STVaSFF1bjBGTGYy?=
 =?utf-8?B?aWJjTkJ4eEhLaS9MdmVINjdUT0Q0clBXN0dJMkl3ZHZWcEt0UDB5dXkzTTRm?=
 =?utf-8?B?OG1iUWd1UEtLUGRuVXdTL1NIRmNXRjg2WFZITTVuR1VjSDdTVVFFWE5qNU51?=
 =?utf-8?B?czlaRWRad0lxSElSV1ZwYmtlMTVsckVsVGtMVktjQjkwTXBhaUVzYWhHMFVW?=
 =?utf-8?B?bmdVT2dxUm9KQVVLOFZtSkdnWGRkejB0ejhhOW5YUERxMUo1ZlE0bTdFRERH?=
 =?utf-8?B?Zi92cVNMYWtZYXREK1Q5SUcvby9LV0Fjbm1KUUlPcnZtM04zcjNiQjR0Z1lw?=
 =?utf-8?B?bm0zcUNMYkwwZ0xNczJhakVBMDhvSzA3M0N2M3RybnV1TEpxclFrOXlKdzdH?=
 =?utf-8?B?UTIvTW82TXVaVVpMOFlLT3JuVTVSdjNqQ2UvbkNYT0I5WXZ0SUpqejB5UDFu?=
 =?utf-8?B?T3kwaUh5OWlhWlFKN3gzdFZHMkZnb3ROYWsxU0RBdVI2MUVsSkJyQ0NPbkNa?=
 =?utf-8?B?Z1U2RzU3Q2crM2hyZzJxOGEwV0UrTEo4VjNPOVRFZlh3RDBtQWNIUWVPcTZE?=
 =?utf-8?B?QW1RR3lNUGw3WTN1QURyK1VxSURMbXNvcGg0TDNKWXhodXpBOSt5eldJdDNX?=
 =?utf-8?B?cmVVajlhaGZIRXVJQ1lCbTdGK01KVmJNTVlPSHM5UGtlTW9RMnNHdFdseUZX?=
 =?utf-8?B?QVUyOXhWejR4VXYvcGF3LzlZcDVlMGtEampmblF1UFdwWEtiUm5FTzNDZ29P?=
 =?utf-8?B?YVk1YytweTdRa1NuRWVXN0hMUFlNL1lRdFQ1MjYwVUIrbmVjNEE1dTJ1U0RW?=
 =?utf-8?B?SUVmSmRUTHVGL09kdVFaVTNWUlFyTzhhamdKc3A0d0owNy9xT2lhZGU5QmJL?=
 =?utf-8?B?aVh6aXV1bGlvOHF2TW5lYTVyTmRIOHltbE5nM25vZUUzNEg5QXNTMHN2Q3pM?=
 =?utf-8?B?a1lYdkwvaCtlRHZEZW9Dc1FVeWVxNWM0TnZNYUxDUTFWdVNOcDRWNWlsVCt5?=
 =?utf-8?B?MVJXR2hWR0Uzb1h0U2lrenpmTkgxcVlGVkR0a3FDMHJuQnlvSDA4UlROaWZM?=
 =?utf-8?B?Tys1VEFONHEvdHdsVzdGUi9FenFGZlBXOHRmZ2w1c1NwSFFhelBDRmFWUXJ4?=
 =?utf-8?B?dVJNczVtbzhyZ1hpanBQVjdtcHdNZTdUQkZESmIxM0p1a1IvOEYvSjZYaEQ0?=
 =?utf-8?B?TXpDdlViQk4xMVhzcGNKTHE3S21ZOHNjd3FSaUZaWFRIaVAvY29hcXRIYzJU?=
 =?utf-8?B?amNSeXFZOEcvYU1OSm00Zko2MW5PbGZ0aWdwNHd2TDhiUFA0bHR1ekpQY0Ey?=
 =?utf-8?B?L0d0U2pBazJPQU5jT0tnZUlXK1NBL2JVR2JjOHNLWDFLd3V1RDNoQ3AwM3lq?=
 =?utf-8?B?a0ZscUx5OWxzcE9idXRSNm5RSkh2TytDYnM3cnNwREpnLzBoN2tYMWFhUWhJ?=
 =?utf-8?B?UXJYVnN3b2Y4NDlNaGJzTTd0bzlEN3Y0L2MyUmIzcnJtM3JNRkFXTTJlYmRu?=
 =?utf-8?B?a2xkNzRtVUI4Q3cza0ZtWCs2V0JpT2VBZHpUbWlzcHdmWTRublg1OFVFUVRt?=
 =?utf-8?B?SS8rZ0N4MEx2a2VhZHBFWkpzUUcrbWxiQXRuc0VxYiswRndOWGJmL0xQallZ?=
 =?utf-8?B?a3ZXL2xRWkZqRllIMFloaXl4U3cyNFJnd1VJN2hiMEZoTXpLUXZrNkJrdDBx?=
 =?utf-8?B?VFZvUm42U2padFRCWk5QSEttRDlnMUpaOFFmOFpPUFBTcU53T2NHaUp4Q2hN?=
 =?utf-8?B?NHc5SjJzQjBjZ3Bjd3pvVEtNT3B3OFR6aGpzd2YybjdBSWtlQWJ2bmlKRW1l?=
 =?utf-8?B?Zm1maU1pTTNLTHMwU0Jxbk9vTEQ5RTFVbEJuUHBNcnBNbVRuODBnSjdCMG9u?=
 =?utf-8?B?b242VXJyZ0wwZ2gvQktycll4UmYrRmJkandUZVBST0F2TWtSS0FJWi9KL2Vp?=
 =?utf-8?Q?czajrzruHIcb/j1vm67xviVOsL3wVg6s?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6236.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U21xVW9wejRSUFptQ1ZmdHdobHRHL3JhcEpRcUU0SndTQk8wS3FRL0RmUldv?=
 =?utf-8?B?VWF6aW1vK0UyY1NFTElhOEd3ZDA0OFdUM1hoaGtMMEExRVU1RmJKbnlLcE9K?=
 =?utf-8?B?aU5VUmswR3ZzdytvN2E2MW1NSEVCcitQdG8zWi9MTUJodHM3SXdKQ2c5K1RV?=
 =?utf-8?B?WlVtVXF4ZVUvc2dKN04yS1lpVUtDOFFxMmRpSEY3ekVLUjhTaXhwQWxLZlF2?=
 =?utf-8?B?aTBzUUpVelJSc0pwaEh1d1RrYW5EcVBaMnhFM3JCSTRDZ0U4MkpJdm5oT3F4?=
 =?utf-8?B?dGtNUGhvemJvcWh0RCtSZG5iRDhwUVBPSkhOS1haVHYyWFBrMFhBR09ZRVJa?=
 =?utf-8?B?NmlHUFQvQ2NCRjRJQXBjSUx5Y0ZnbFVFdk40Q1BGZFBpakhXcWMzZjBmM1I3?=
 =?utf-8?B?MG1jcllJV0htYXdNb3FxVTBrdCtuZ0JTOWY3T2JjQXdlWTRrNnZ6YzIwM0hT?=
 =?utf-8?B?MndyYjk1d0lITXZGZGV5NG83c2RwSXpCK2lUNVBNMDVyN0dKalRJOXhtSXhm?=
 =?utf-8?B?RDBCT3VmcGNUMzE3QU1qdG5VU1FaWFRkNm9HSjBXM2xwdlNLV2RDV09WVnRu?=
 =?utf-8?B?SjBFTHp5ckRPR1dKZmR2ckh6eXRkUnpyM1RjdlN5Nkp0Y3VQcndDbWpLcDcv?=
 =?utf-8?B?NlpFL3dGdWx2M3JtVkNTZ0p2TFRXVnpXZzcyTUZrNEJrM0l1bkhKWEtOVW5P?=
 =?utf-8?B?bmdFcXpYVVV1cUFBZ3dKRHFXdjhUSWM4ZEJCbTNvTWR3TWhSZ1hjL3VOTHRp?=
 =?utf-8?B?SkxyR2N2R253a0g4TStkTDF3UllGaFdyUVBmM0xSak1SS3d4cllQbUNSSmZo?=
 =?utf-8?B?NkhjcVhZYUFxRURxS0U1OTRyNDN1Nm1DQVlFWEE2aWVKVjgyZ1hJV3dJVkt2?=
 =?utf-8?B?MjNvMFlQZ2VMci9aazUrUkpQU24zQkFZOGNKL3Z2WGkvZXNMdnA0cXp2WG13?=
 =?utf-8?B?cElhOXo5bE5BK2llY1dScXRqSWRvek42RUtQbndLVnJWRnlrVTEvL0M0V1F6?=
 =?utf-8?B?VzVrVTFuZzZZeGdhVCtEOWxVRENKa3J4c2xyZlBvRkhzSDdsUEpSTUR1VGp0?=
 =?utf-8?B?WmNkeVhKMnIrNEZubUlkdmFraEhERkIzUTVOd1Y5REdWM0pVZmQwSHBQVHBJ?=
 =?utf-8?B?eFczRXNTWU5keTNPc05BMGg1SVBiODAwT3dhaXRsTWJGTThLNUFMZ3R1Z3o5?=
 =?utf-8?B?VnNtSjBqa0FHcnprdkxocXVTQTBVRkFiVG9DSFNiUzNjM1BjWEw0a2lSdlI5?=
 =?utf-8?B?Q1VTcmVmczUzWUI4QWVyTExiMjN1UzFuVGxhajZpTDFwUFhBOTQ4VjJ1RWhG?=
 =?utf-8?B?QWVDVDdhZ2VRSzhvaVNXbFdsdzNpbkFST2ZPTnh2VjJ0dzRjMjFQbTRiQmRt?=
 =?utf-8?B?Q01DRnZoUXltQmhFcFVTajNUbE43TzkzU3ViMXV0dG9NVVp1ZkJ1Y01aWXAv?=
 =?utf-8?B?TkFEb1daczZmdkFZRG94VE13UFROaCtUWFpoMnFpM05wL0taU0RSWHVhbGxx?=
 =?utf-8?B?WitKcVFxODByVGw2WXF4Z1J1STE2aGo1cTZlTmlLTjBBQmg1Tlg2RFhueTJJ?=
 =?utf-8?B?MU5lc04rNk5YWjdHSjlBRzZFeW15MStCVHhaVGx1WWtDNXpHOXJHam5DY0dw?=
 =?utf-8?B?RlRuYjhjcnB3aFRNQUQzaHdsTUN5b04yeWFZYjRHRHJCVDg1Q21keVpoRnF0?=
 =?utf-8?B?UHNCQWpCWTZKMXRWZ0hwM2gyeUJreFhLRkEvZTBuZWZmNlcvb1prSm95Mk5j?=
 =?utf-8?B?T2h4SnI1VzFuaVpHeWMydTUxUWRmSktrbkY3UUVBR21HZE00UnZyNnF5am50?=
 =?utf-8?B?NmU2SStLRWcrM200dm5UdjBxbHBKaG0xNGoyVGR3eERjb2J1a3RGcHhaZFha?=
 =?utf-8?B?Z0hkc0xEZ1JnRkhRbFYySCtuYXMvNXE3QmIxU0tLY1dneTZKSEFKN3RrSGxH?=
 =?utf-8?B?QjJiVUZNbkdlNkdlTlhCWE1IY2dOZlU0SWZaVE1YeklDK1IzeE92OUpDbGJ5?=
 =?utf-8?B?cHZLM1d0dndEUTZGajVHQ1llR0NjU21pc3AwUW5BZVRybStHb1JxUldBWmVF?=
 =?utf-8?B?MUoxWlRMUkVwODVUSGRwTVVxYUFpR2ZzN1U4UWc1cHNuRE13Q0N1RVg2RERR?=
 =?utf-8?B?NGwrWkVDazAwdDZrRlNWZU1WUFUyUVZ0MlZJa0FEZ1lxc21tZGlONlYyVzUw?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61384EDFD7497742902532EAC8569507@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6236.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a52137-7ceb-47d8-1b2e-08dd48ba44ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 03:31:41.3383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6WO2plUbb4EIDCEN7oJ9l1Xz1sCB+v0MaYCTlRWqHAB/K8G6vYlm3oh53NnjrSmYrbCGeC41iULV7nGY1dBgyHiBsn8CNhbUByBX/zHxoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6647
X-MTK: N

T24gV2VkLCAyMDI1LTAxLTIyIGF0IDEwOjMwICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyMS8wMS8yNSAxNTo1MCwgQ2h1bmZlbmcg
WXVuIGhhIHNjcml0dG86DQo+ID4gVGhlcmUgYXJlIHRocmVlIFVTQiBjb250cm9sbGVycyBvbiBt
dDgxOTYsIGVhY2ggY29udHJvbGxlcidzIHdha2V1cA0KPiA+IGNvbnRyb2wgaXMgZGlmZmVyZW50
LCBhZGQgc29tZSBzcGVjaWZpYyB2ZXJzaW9ucyBmb3IgdGhlbS4NCj4gPiBIZXJlIGFkZCBvbmx5
IGZvciBkdWFsLXJvbGUgY29udHJvbGxlcnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1
bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiANCj4gIEZyb20gdGhlIGRh
dGFzaGVldHMsIEkgY2FuIHJlYWQgdGhlIGZvbGxvd2luZzoNCj4gDQo+IElQMDogaG9zdCAtPiAw
eDE2NzBfMDAwMCAgZGV2aWNlKG10dTMpIC0+IDB4MTY3MF8xMDAwDQo+IElQMTogaG9zdCAtPiAw
eDE2NzFfMDAwMCAgZGV2aWNlKG10dTMpIC0+IDB4MTY3MV8xMDAwDQo+IElQMjogaG9zdCAtPiAw
eDE2NzJfMDAwMCAgZGV2aWNlKG10dTMpIC0+IDB4MTY3Ml8xMDAwDQo+IA0KSSdsbCBjaGVjayBp
dC4NCg0KPiAuLi50aGlzIG1lYW5zIHRoYXQgeW91J3JlIG1pc3NpbmcgdGhlIElQMiBoZXJlLCB3
aGljaCB5b3UgZGlkIG5vdA0KPiBtaXNzIGluIHRoZQ0KPiBjb21taXQgYWRkaW5nIHRoZSB3YWtl
dXAgY29udHJvbCBpbiBtdGsteGhjaSBpbnN0ZWFkLg0KPiANCj4gU28sIHNpbmNlIEkgc2VlIHRo
YXQgYWxsIG9mIHRoZSBVU0IgSVBzIGFyZSBiZWhpbmQgTVRVMywgYW5kIHRoYXQNCj4gdGhlcmUg
aXMgbm8NCj4gVVNCIElQIHRoYXQgZG9lcyAqbm90KiBzdXBwb3J0IGdhZGdldCBtb2RlIChzbywg
dGhlcmUncyBubyBVU0IgSVANCj4gdGhhdCBkb2VzIE5PVA0KPiBzdXBwb3J0IE1UVTMpLCB5b3Ug
c2hhbGwgYWRkIGFsbCB0aHJlZSBoZXJlLCBhbmQgeW91IHNoYWxsIGRyb3AgdGhlDQo+IGNvbW1p
dCB0aGF0DQo+IGFkZHMgdGhlIHdha2V1cCBjb250cm9sIGluIG10ay14aGNpIGVudGlyZWx5Lg0K
Tm8sIEknbGwgc3RpbGwgYWRkIHRoZW0gaW4gbXRrLXhoY2kgZHJpdmVyIGFzIGJlZm9yZSBmb3Ig
dGhlIGNhc2VzIHRoYXQNCm9ubHkgdXNlIHhoY2kgb25seSwgbm8gbmVlZCB1c2UgbXR1MyBkcml2
ZXIuDQoNCkFzIEkgc2FpZCBiZWZvcmUsIGV2ZW50IHRoZSBjb250cm9sbGVyIHN1cHBvcnRzIGR1
YWwtcm9sZSBtb2RlLCB3aGljaA0KZG9uJ3QgbWVhbiB0aGF0IGl0IGNhbiB1c2UgdGhpcyB1cHN0
cmVhbSBtdHUzIGRyaXZlciwgc29tZSBTb0MgaGF2ZQ0KbGltaXRhdGlvbiBhbmQgY2FuJ3Qgc3Vw
cG9ydCB0aGUgZHVhbC1yb2xlIG1vZGUgc3dpdGNoIHVzZWQgaW4gdXBzdHJlYW0NCmRyaXZlci4g
YnV0IGFsbCBTb0MgY2FuIHVzZSB1cHN0cmVhbSB4aGNpLW10ayBkcml2ZXIuIHRoYXQgd2h5IEkg
YWRkDQpzb21lIFNvQydzIHdha2V1cCBjb250cm9sIGluIHhoY2ktbXRrLCBidXQgbm90IGluIG10
dTMgZHJpdmVyLg0KDQo+IA0KPiBUaGlzIGlzIGJlY2F1c2UgdGhlcmUgd2lsbCBiZSBubyBEVCBu
b2RlIGRlY2xhcmluZyBvbmx5IFhIQ0kuDQo+IA0KPiBTaW5jZSBhZnRlciB0aGUgcHJvcG9zZWQg
Y2hhbmdlIGFsbCBjb250cm9sbGVycyB3aWxsIGJlIE1UVTMgLT4gWEhDSSwNCj4gdGhlcmUncw0K
PiBubyBuZWVkIHRvIGFkZCB0aGUgc2FtZSBpbiB0aGUgbXRrLXhoY2kgZHJpdmVyLg0KSSB0aGlu
ayBpdCdzIGJldHRlciB0byBsZWF2ZSB0aGUgc2VsZWN0aW9uIHRvIHRoZSBjdXN0b21lciwgZm9y
DQpleGFtcGxlLCBvbiBjaHJvbWVib29rLCB3ZSBvbmx5IHVzZSB4aGNpIGRyaXZlciBhbmQgZG8g
bm90IGVuYWJsZSBtdHUzLg0KDQpUaGFua3MNCg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4g
DQo+ID4gLS0tDQo+ID4gdjI6IGFkZCB3YWtldXAgZm9yIGR1YWwtcm9sZSBjb250cm9sbGVycw0K
PiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2IvbXR1My9tdHUzX2hvc3QuYyB8IDE3ICsrKysrKysr
KysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfaG9zdC5jDQo+ID4gYi9kcml2
ZXJzL3VzYi9tdHUzL210dTNfaG9zdC5jDQo+ID4gaW5kZXggN2M2NTdlYTJkYWJkLi5kNjViMGYz
MTg0MzYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX2hvc3QuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19ob3N0LmMNCj4gPiBAQCAtNDYsNiArNDYsMTEg
QEANCj4gPiAgICNkZWZpbmUgV0MxX0lTX1BfOTUgICAgICAgICBCSVQoMTIpDQo+ID4gICAjZGVm
aW5lIFdDMV9JU19FTl9QMF85NSAgICAgICAgICAgICBCSVQoNikNCj4gPiANCj4gPiArLyogbXQ4
MTk2ICovDQo+ID4gKyNkZWZpbmUgUEVSSV9XS19DVFJMMF84MTk2ICAgMHgwOA0KPiA+ICsjZGVm
aW5lIFdDMF9JU19FTl9QMF85NiAgICAgICAgICAgICAgQklUKDApDQo+ID4gKyNkZWZpbmUgV0Mw
X0lTX0VOX1AxXzk2ICAgICAgICAgICAgICBCSVQoNykNCj4gPiArDQo+ID4gICAvKiBtdDI3MTIg
ZXRjICovDQo+ID4gICAjZGVmaW5lIFBFUklfU1NVU0JfU1BNX0NUUkwgMHgwDQo+ID4gICAjZGVm
aW5lIFNTQ19JUF9TTEVFUF9FTiAgICAgQklUKDQpDQo+ID4gQEAgLTU5LDYgKzY0LDggQEAgZW51
bSBzc3VzYl91d2tfdmVycyB7DQo+ID4gICAgICAgU1NVU0JfVVdLX1YxXzMsICAgICAgICAgLyog
bXQ4MTk1IElQMCAqLw0KPiA+ICAgICAgIFNTVVNCX1VXS19WMV81ID0gMTA1LCAgIC8qIG10ODE5
NSBJUDIgKi8NCj4gPiAgICAgICBTU1VTQl9VV0tfVjFfNiwgICAgICAgICAvKiBtdDgxOTUgSVAz
ICovDQo+ID4gKyAgICAgU1NVU0JfVVdLX1YxXzcsICAgICAgICAgLyogbXQ4MTk2IElQMCAqLw0K
PiA+ICsgICAgIFNTVVNCX1VXS19WMV84LCAgICAgICAgIC8qIG10ODE5NiBJUDEgKi8NCj4gPiAg
IH07DQo+ID4gDQo+ID4gICAvKg0KPiA+IEBAIC0xMDAsNiArMTA3LDE2IEBAIHN0YXRpYyB2b2lk
IHNzdXNiX3dha2V1cF9pcF9zbGVlcF9zZXQoc3RydWN0DQo+ID4gc3N1c2JfbXRrICpzc3VzYiwg
Ym9vbCBlbmFibGUpDQo+ID4gICAgICAgICAgICAgICBtc2sgPSBXQzBfSVNfRU5fUDNfOTUgfCBX
QzBfSVNfQ185NSgweDcpIHwNCj4gPiBXQzBfSVNfUF85NTsNCj4gPiAgICAgICAgICAgICAgIHZh
bCA9IGVuYWJsZSA/IChXQzBfSVNfRU5fUDNfOTUgfCBXQzBfSVNfQ185NSgweDEpKSA6DQo+ID4g
MDsNCj4gPiAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgIGNhc2UgU1NVU0JfVVdLX1Yx
Xzc6DQo+ID4gKyAgICAgICAgICAgICByZWcgPSBzc3VzYi0+dXdrX3JlZ19iYXNlICsgUEVSSV9X
S19DVFJMMF84MTk2Ow0KPiA+ICsgICAgICAgICAgICAgbXNrID0gV0MwX0lTX0VOX1AwXzk2Ow0K
PiA+ICsgICAgICAgICAgICAgdmFsID0gZW5hYmxlID8gbXNrIDogMDsNCj4gPiArICAgICAgICAg
ICAgIGJyZWFrOw0KPiA+ICsgICAgIGNhc2UgU1NVU0JfVVdLX1YxXzg6DQo+ID4gKyAgICAgICAg
ICAgICByZWcgPSBzc3VzYi0+dXdrX3JlZ19iYXNlICsgUEVSSV9XS19DVFJMMF84MTk2Ow0KPiA+
ICsgICAgICAgICAgICAgbXNrID0gV0MwX0lTX0VOX1AxXzk2Ow0KPiA+ICsgICAgICAgICAgICAg
dmFsID0gZW5hYmxlID8gbXNrIDogMDsNCj4gPiArICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAg
ICAgIGNhc2UgU1NVU0JfVVdLX1YyOg0KPiA+ICAgICAgICAgICAgICAgcmVnID0gc3N1c2ItPnV3
a19yZWdfYmFzZSArIFBFUklfU1NVU0JfU1BNX0NUUkw7DQo+ID4gICAgICAgICAgICAgICBtc2sg
PSBTU0NfSVBfU0xFRVBfRU4gfCBTU0NfU1BNX0lOVF9FTjsNCj4gDQo+IA0KPiANCg==
