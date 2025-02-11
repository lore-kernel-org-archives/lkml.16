Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE31F63D6;
	Tue, 11 Feb 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273606; cv=fail; b=AL4YXH1V18s9lIxogjnuQ2TtP2iSwnqiRKvTqBXjJfUjz6aK8MvRnaCdcy8dIlBxcucrrLc5ledvaOg6IWhmMxjT4H/h+NvQxbkZzWqTDyLXozsIyqv8pjrEN9Lu7Ix6BthOmXRGOqdpGo1+6xy69jJ5Sdml9kshQUfhIvjtxKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273606; c=relaxed/simple;
	bh=FFZX7RJPH7VsgE2FIKxxy887HXrQfitLB1+kAFzclns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnva9fPENb+mas5SgiDHrStghQFdHGhiOWwmboU0j214luCdx+bPfTJm4MqVp7i+2VnniFNsC+rDdI1KZLpH9CA1XPX+vx8YEItFAjFVGUSwGDjigBlv7sNBH87ktnqaf37Hh0R6LD3BpVvpbATi1eVqJV0gyOkM1tOk5Tbf3pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nvcZ2z3F; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=swgiN++x; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nvcZ2z3F";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="swgiN++x"
X-UUID: fea85f90e86b11efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=FFZX7RJPH7VsgE2FIKxxy887HXrQfitLB1+kAFzclns=;
	b=nvcZ2z3FwFtXJUY7ju0KiMQ0lNRjP0nyEO0WDZXRPahaYEGdze2Q7+i/uvlkg+1rlWFqn5Vhxo63JKn9pHPDYJmqY2nftjZpWJDfuTNgaePIj9igkCiV8aEoEl1F5/o5mv6MW+Zcx+2VYg4Mv1n8/GvC9IxAS/8SXzUrRqL0llU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:109e1fa2-0e1f-4994-bd2e-e5b332d07153,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:60aa074,CLOUDID:6bcb2c9c-f55b-41e7-a712-ffbe7a973280,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: fea85f90e86b11efb8f9918b5fc74e19-20250211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 72766458; Tue, 11 Feb 2025 19:33:20 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 19:33:19 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 19:33:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EamwaUCZzQWv0s8GHwaeMGyk86LTdMtNfhrfNNDRWw53wRYv03bDOjaJGRO2bBDn75GhrXaphQ8cM7gRxMZrzAtMbV/fTkGUK9X8G0klzODb336uqOb8TPy6q9MTGQZG9Pb9elFXdyZ82mWab/ZNWt5eW+z1kBBFNmWH6dkXQ0ZtK3BDLZYtTgwNfhidZmGN+ULRyNU2oh1wBaa0TFrluwtFK80woTi4Y9TgFQxhwANH5stbd42XGRkQCaw+ahMXascDfqU27AHm9Lcypp+iIb8wBoq9Vr3z+JbPwBgyBe0GkbWP+PLp8Zy5jhHkEsSo6EemH1ccv+9UxKzZrCTUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFZX7RJPH7VsgE2FIKxxy887HXrQfitLB1+kAFzclns=;
 b=h/nJUoIaIStqjXszIaqSExpn6hfZOR4QWk+X/AP9TUhObHmMGwZOHSKhB/MWQszNCUY2g1xqqgyRI/UzDJFxgHj4FYTKPOe08RiK/qqfn1e1szaYe7Ih+ZCX4Ay9kNJ2z/VYlRZTQkiajzKU2c7jgPwUMWWFnBXq/PcWLLG70fA6g/XDUCzqqIhVDK2gvjP0D+9rSeL/bW6xWCpr2COiTWv4QgygNVkmpVs5bsJxCtSAyFHVhRrYzjnaYvmdjiYJycKtLRII0zF6wPjoMg5Fp2p807g1a34luUbZgmv1+p0hK2EaihhdByEJ/RZPjWlw0NHWbxuChrY2r+RhNtF9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFZX7RJPH7VsgE2FIKxxy887HXrQfitLB1+kAFzclns=;
 b=swgiN++x0HMJ+UZJvcKtW/97cSyb9Bt+GbWruz4x9v6OwuwLPpZ+iouUooC9X7iMH1drIFk6WOeQHgrR9cRditrWcShgLAktq5CUeq+0lNfcdUXwja7z1FMRXltAiQTROEkQlBCUbz1DXGbhCVE5DxYFZEX3TuwPxkyYzovcssY=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 TYSPR03MB7306.apcprd03.prod.outlook.com (2603:1096:400:414::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 11:33:15 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 11:33:14 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "lkp@intel.com" <lkp@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [v2,1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Thread-Topic: [v2,1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Thread-Index: AQHbeQHgPb1OXH/810+k24jhMnbMdbM+zsUAgAMwsAA=
Date: Tue, 11 Feb 2025 11:33:14 +0000
Message-ID: <f9b4b783d0c6334518a1d35738a3c6653e05d438.camel@mediatek.com>
References: <20250207014437.17920-1-crystal.guo@mediatek.com>
	 <20250207014437.17920-2-crystal.guo@mediatek.com>
	 <eac3c588-0c9a-4bd6-8ef2-e05eec6c377a@kernel.org>
In-Reply-To: <eac3c588-0c9a-4bd6-8ef2-e05eec6c377a@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|TYSPR03MB7306:EE_
x-ms-office365-filtering-correlation-id: 976dd660-5569-4359-dcb6-08dd4a8fdfa1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZTZhcHVwdm5KUWZZT2ZaanlVamQ1TEpuK3E1UC9uWll2YjFqeGxESzd0U205?=
 =?utf-8?B?cUFmaU9WQUZoK0VIZXZ1VEwwYmJoSTlUZ2xLcW1GcElwbERsSnc2UVk3UDFV?=
 =?utf-8?B?RW9Oc2N2SG5HV0ZXNDBlRVRjZUdrYjhZN2dKWEdKTjk3WS9CM3UwOVhBN0lX?=
 =?utf-8?B?eVdNcTVFV2d2WjQ0OHFTVmNXVklCVHlzQlV3N294cndYMjQvcGhCMHNlNjlk?=
 =?utf-8?B?SHhFS1lRZEhrZzV3L0J5U3gyTXk4VENsLzh6dklYOVhHWEd1VnJFUWRXckNR?=
 =?utf-8?B?aVJFSTdvaWhRaXhzcDFhOXFUZGNhTGtSclFmc1pGc25vRTJML0ROaCt3VVk3?=
 =?utf-8?B?enAxdElBT0xaU2RlWkZmSjFxZ0c1Rmt2MnB4cWlYNm5IclRxdzFDY25PajFo?=
 =?utf-8?B?SitTcC9SQ251WnNUZGR2dFFacTNITVZJdWVDUE5pRmFobmdseXE2WW1Oa3R6?=
 =?utf-8?B?V3hNU0tPaVBPdGNvMndZN3E2dnRldnd0L2lvWkQwNW5nUDA4aHJuTCtSdVFv?=
 =?utf-8?B?Tjd1emlwTFJGdzJIOGlxbnN6blV6dTRyazRlYm9PM2VIZDh3TFBGT0VUYmZT?=
 =?utf-8?B?OWk1SmxiYm5GVmttRGlkSW5qaFVBZWM0KzAwUEdtckEvVGZpZllkWjNxK09K?=
 =?utf-8?B?NlI2RFk1eE9mbFhNbjZWdEk5L0RxeFZHMllWdGF1TTNEVDViUGVrRHlDVnht?=
 =?utf-8?B?Ny9MQVdrVmdUYk9ES21pRHdPVERwYVRMMXhCSk1jTi80WUM5V1pzam1RUGZ1?=
 =?utf-8?B?WVNpUTE4akwyTGxMbGpNYXpwNjVRNmpPYllCeWowK3o5RjlFL2pOVjNEdkg5?=
 =?utf-8?B?QjlGcm9TcVFIYU80aHBzNUdtcGtIdkNiQ1RYM2J1QmRTTW5TZU5LUzd3Ymdn?=
 =?utf-8?B?Z245U1liU2w3UTI5V0J5RDl6ZE9scUkrSDZOVnhLdDlhVVh0NGtnaW1yYmFL?=
 =?utf-8?B?dklxTHk4SEdrS0RYMklYZTY3bFRRNW83MGlDc0c3MkpEOTQvUDVCK2dYdzND?=
 =?utf-8?B?Zk0xcjVqSVNqTXNuNm4vWFFKbjk3TkNTU0dhOVdyZHA2NlNLWVBVVDNnZHRX?=
 =?utf-8?B?MDNKbVhJL2JSemREWE1ldWZDK3Npa09meWhjRkdnTVc2MzdTN2h5L3NZeHRn?=
 =?utf-8?B?anBkZm4vdXQzRlN6RjRQbUF3anQ3NFJLbS9tV2M5YjVFd0dMWllYK1Z6MGNl?=
 =?utf-8?B?R3p3OVByeTRYcnVhSlJFNTdYdEpPS0pjRmhTMkk0Q3dHNE1SMHdVT0t6elJu?=
 =?utf-8?B?aTlZclh4UVpMVGp2Q0U3OHVqeGw3MnUwakZpWE5yWG9nN0dnKzhhRTNOQXFQ?=
 =?utf-8?B?ek5TeFFWZVBMVTFzYktRQ3dQY0ZwWDJhcUdOVmlpWk4xaU4xYzUxb0Z3NFEy?=
 =?utf-8?B?ZWZmNlNPUkFaSlk3SkxGTEszcGZxUU9GcXQ1NnVBa3NqZEMzamdPU3g2RFZW?=
 =?utf-8?B?YkJGVFhXVE9UMHpHOFFsTGVVcHl1VVFBMHBZQkRWU2F3bUFTZVZKTnZ1cDNS?=
 =?utf-8?B?UUoweWtRWmxDM09OQkFnUWNtK2xXYjE4MHBNMGZaSGlINmRuMXdnZkdFMkc5?=
 =?utf-8?B?QWRhWVFaRURNakpndytkaEZQWFVuSENjalRoQkN0ZVpnNXpjcDlOY3Y2Sm5I?=
 =?utf-8?B?dUtmcVIrMnRmckQ3M2M0ZE1nSHQ5OS9aQS95akcrVlNhaGVRVEhBVGlva0pE?=
 =?utf-8?B?dlNSNkl3aVA1Rm1kSzA1UHNqS2l5eWtUZFNvMVJwUm1jWkNIZnJ4WEVlRFZF?=
 =?utf-8?B?TnMvOEFuNE1GSzliZno5bmJMa0JmeTdOQ3l1Uko5YjZaMTdZK0pwVVpPUkwv?=
 =?utf-8?B?UHZDNC96bXNUVTB4VFpMQlVqQjc5LzZWUlNwelc0bjF5SkFZUTFPa29oNWxZ?=
 =?utf-8?B?UVpyVXJFT0lVdnEyWW5rL3hnOEV3eE50bFl5MytjVTNBRWZCdTBwc0pyeTBp?=
 =?utf-8?Q?uyeI2KAlaOMt1UThA0o5ib8WMB+UJr9T?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGJrNVppd2NxL0dYR1hEL2lGLzZmR3VZTzkvdGtFQjdGaDQwZTV0VG9xTjhK?=
 =?utf-8?B?bnZRc3pBRGJBWXJBUTFhN0RRK2FDQTFIb3lLTjg4YmIxYyt5UXIzVTd4REhP?=
 =?utf-8?B?dURpR0Q0V0cxelJuK1h5dFA2UTJRSmxYMVA5ZUZUOXR3SFQwMC9zKzBuK1lp?=
 =?utf-8?B?Um1nYTAvNExsN2VZZ1JBTmc5UmUxQ1dQTDl2aHUwV1YxbmpmcUVrWisvaVhw?=
 =?utf-8?B?cThZRWNUbEZpV2JjbklLYlh1dGpOTlZGUytoZlR1elU0T1RTOWE0Si9hZ0Vr?=
 =?utf-8?B?WUhFL2NGZFUrMVYydGx4U1Frb0tSd29nV1F5Z3h1OXNjL3Q2OU91ZU5mRHAx?=
 =?utf-8?B?M2MxWEMzREJVeC9ZNFprS3VpdkNYVXFYN1hjbWR6amlRdC9oYkFhL2xqb1V4?=
 =?utf-8?B?cVFUT2trNFk1S2c4eE1vZk9SN1BUZ3gzVFR6a2Q4d2hYODIrbU5GSU1rS0tE?=
 =?utf-8?B?RUdIbkR0dzcxN2hBSGVEOHVWcGEwckNuMzdqVGtmMzEyOTBuczFTU0JldURT?=
 =?utf-8?B?eDZWRmJuUnFkTEI2VWhFSG42TWx5NC9aTytweFhLWk8zZ2JKQjJ4ZGJkaCs1?=
 =?utf-8?B?NEM3azdVS3NmMU11L2ZEdGl0cDVxd25aYUxuU1loKzhxdmE2NkZqelpoVEla?=
 =?utf-8?B?SXRLckpBQldZdXpXQjU5UHcyWC9aK1ZOT3pDc1F0aUNSTDk1R3FhTmVSZVFu?=
 =?utf-8?B?bDVxbWpKcGFjQVVEYXg5MEdDVE0zRUFIWTlLZ2ZBYWJ1WDQ5ZXFvQVlzUzB6?=
 =?utf-8?B?ZVJRaDl0dCtxQm5XRHEzbElhYkRDMC8yTllpbVV3YVRlVDY3MmkrOXpxckNS?=
 =?utf-8?B?NHdjdDJ4NXJFdmNYek5UbU42K080L3RBZlY0QWt1clFDYWprMGhDS1dlTWZp?=
 =?utf-8?B?LzJ5OExQWTVyMkY5MmJPSU5Ed3VoT0kwWmdUZHp5ZzFVdWY3VXZxM0cxeFIz?=
 =?utf-8?B?SnBNNTZPMU9Ya2Vodkt2TzVUb29MY2puZDZLeVUraFdCRU52MFpYc2RHK1ls?=
 =?utf-8?B?ODdWNkRvR3FYNkpEa1Yxd04xWjRqVmFwa3ZJNzNOMXpiWS9KWjM1RFdnYVMz?=
 =?utf-8?B?azlWeUs2T2tVQ2NxSmh0akoyVjVxYllnb1VZY3lnTDJOdFMxRWVWdWs1d1lu?=
 =?utf-8?B?d0xEZWQ5MnpmMXZXSXlDWndnSlJwZWZzVEtjY3dSQjZuT0c3Mlo4QmNnK1R0?=
 =?utf-8?B?ajRsY0pHcENVNGt1eVVXUHJ2d0FQNHdmUDVYak1HT1RuNmpOV1dicEtPWG5D?=
 =?utf-8?B?L1hxanIvT0cvQzQ1WnZPOGl5SC8rYVVFakluc1VCNHJKVWRYMTRTdzdlb3U3?=
 =?utf-8?B?THFPU3RTbFNSWlpMS0hzcnI1bmRQMjB4bnloRnJVNFhBMXlaWnkzUVg3SHJJ?=
 =?utf-8?B?ODkwdW01SE0vcTY2Rk05K1V6UlRKWjZ1cVkrVTZ6MDNENVJadWxRN1lEVWx0?=
 =?utf-8?B?ejU2dHpXbElNN1B2L1NEekFUR3hiK2RSV2trSnNVb3RMUkJhdG1XREpnSlRj?=
 =?utf-8?B?cEh3bkVVVWFnOEhQd25wRUh4MW9iSGU0UEVBOENobnZjdDcvempvUGpnbEhp?=
 =?utf-8?B?WnppelF3bjR5YkZxdm1TWUdwZWJ3d05jc3VUdGhhdVo3RGIvMkhsb1NmVCtI?=
 =?utf-8?B?bGdsaEVINk5kdGdaWGtjMHZsNkxUR0paUmE2cElESDlYNFp0MG81empMWTRM?=
 =?utf-8?B?YTdGbFllREJsQW9ZaFZkSTBMRzlFUUZjWXhXQVQ4elRxQWxFQk9nd2RWSERB?=
 =?utf-8?B?eWxadytoTkVUVHNBSXBHRWhmY05xZkhodFBwRWhubGMxdGRNc1BjWSt0OWhM?=
 =?utf-8?B?Q2wyenZ6ZTNNNnd5dDJTbUZFckxPK0Uxa0hneDB1M05yUXhrOVREQjVhaVRw?=
 =?utf-8?B?SVplYnh3SmNHQ3IvRmN0d1A2bzZHNk5PMngwekNzek1MQjBlTVBHYVBTdGtn?=
 =?utf-8?B?TXNaWWtBM1BxYW1WTnVwSFFtMGZ6bTRPU2llMVl5WStwTWJmVjVmVU4vTENh?=
 =?utf-8?B?VjZPRlJ0b1JHaXg0bGxwMjhDWWxQclE5NzRTTUoyRTNKWWpsZ09uS3JsUW5h?=
 =?utf-8?B?ZmlZRXhMdTh2YXg3QTZ3TnVKVHlvU2tjNE1aZk5VK3JtWTBRYzI3ZW9WUVNG?=
 =?utf-8?B?MkVHNk9BMUJiYnl1NzY3VEI5cGNwY0YybHkwRFBMOFBtaVZFeTE5WVBUUGJG?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F66D11EFBBD694E89C395EB76DD1C28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976dd660-5569-4359-dcb6-08dd4a8fdfa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 11:33:14.9040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4Hm8pAZVgDmVE1lnyVi2kewKXE0kiWrw4ZJqSMPJmu+YElugx+6QeokVfYV45hqAAMtj7/KPU+lFk6i8VcbvdQHx40kfNte7lmQvG//jCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7306

T24gU3VuLCAyMDI1LTAyLTA5IGF0IDExOjUwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA3LzAyLzIwMjUgMDI6NDIsIENyeXN0YWwgR3VvIHdy
b3RlOg0KPiA+IEFkZCBNZWRpYVRlayBEUkFNQyBkcml2ZXIgdG8gcHJvdmlkZSBhbiBpbnRlcmZh
Y2UgdGhhdCBjYW4NCj4gPiBvYnRhaW4gY3VycmVudCBERFIgZGF0YSByYXRlLg0KPiA+IA0KPiA+
IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gDQo+IEti
dWlsZCBkaWQgbm90IHJlcG9ydCBoZXJlIGFueXRoaW5nLg0KDQpPa2F5LCBJIHdpbGwgcmVtb3Zl
IHRoaXMgdGFnIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gQ2xvc2VzOiANCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQxMjIxMDk1NS5Gdk8wUGVl
My1sa3BAaW50ZWwNCj4gPiAuDQo+ID4gY29tLw0KPiA+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwg
R3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVt
b3J5L0tjb25maWcgICAgICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9tZW1vcnkvTWFr
ZWZpbGUgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL21lbW9yeS9tZWRpYXRlay9L
Y29uZmlnICAgICB8ICAyMSArKysNCj4gPiAgZHJpdmVycy9tZW1vcnkvbWVkaWF0ZWsvTWFrZWZp
bGUgICAgfCAgIDIgKw0KPiA+ICBkcml2ZXJzL21lbW9yeS9tZWRpYXRlay9tdGstZHJhbWMuYyB8
IDE5Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCAyMjEgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZW1vcnkvbWVkaWF0ZWsvS2NvbmZpZw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZW1vcnkvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
bWVtb3J5L21lZGlhdGVrL210ay1kcmFtYy5jDQo+IA0KPiANCj4gWW91IHNlbnQgc2FtZSBwYXRj
aHNldHMgbXVsdGlwbGUgdGltZXMuDQo+IA0KPiBCZWZvcmUgbmV4dCBwb3N0aW5nLCBwbGVhc2Ug
cmVhbGx5IGNhcmVmdWxseSBnbyB0aHJvdWdoIHRoZSBndWlkZXMNCj4gYW5kDQo+IHByb2Nlc3Mu
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpPa2F5LCBzb3JyeSBmb3IgdGhl
IGluY29udmVuaWVuY2UgY2F1c2VkLg0KDQpCZXN0IHJlZ2FyZHMsDQpDcnlzdGFsDQoNCg==
