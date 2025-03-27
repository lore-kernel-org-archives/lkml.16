Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976AB13DDAA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054255; cv=fail; b=V6uYvlptsmirWQZoofueq6Nr3AmxXm/0fsXohpFIBiN83tTwQr3FEEK6oRgBGkgj5lt69/fK0tuxwOu+/Z4CYNxZ6erdznxo2rAAO4eJxe69ePfpQXg1ctXYrLcawmN/BZiL1G/i/yaRCxPJTA4NheQIs2wGmO8VU4796O8oxxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054255; c=relaxed/simple;
	bh=T0mA0y4BbMvo01MT7hJRv1hbY+gQ/e4HKR3qAiaduTE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tq4R6y5SoYXpPfUFJhRRy5REJz9DFH55nQsfW9lBaSSNPLT3kFRtcpKk6C/u+JIERBh23R1zvoFitZ66OER7Nh4a3dxPnZCiwjE5D/ikUNC2k5tkGgpbqF2MKzToPB36lJfX3X3GFFDYeOYOuG/Jtaou1Z+P4ZNTHZEXQUCSA4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=htTmQs9P; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mk7QMtU6; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="htTmQs9P";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mk7QMtU6"
X-UUID: 7fa1da0c0ace11f0aae1fd9735fae912-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=T0mA0y4BbMvo01MT7hJRv1hbY+gQ/e4HKR3qAiaduTE=;
	b=htTmQs9PVfr+X7zQL8QPjR/H/azvnGikDJTWzHroTc5sSPUn1OyWnlbrx8B/ZdWkcl40nipSqHZ6efe7MA1mdaw2JJvaRfN2vOCvt0lBoRJfwnEgqZ1SvFnGFtNjyz2L6JYjSTeeAeFwNiFGPuSa4KtjqtcfDytivvashGyuZu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ff7e8b18-980c-44b2-8e28-3aa816415262,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:96d9dac6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7fa1da0c0ace11f0aae1fd9735fae912-20250327
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1287873623; Thu, 27 Mar 2025 13:44:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 27 Mar 2025 13:44:06 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 27 Mar 2025 13:44:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsLsetm9RAC5UVDczJ1QSq9idFxeEjsWtN1l4Hz5elxyUSb4pf2/yEiCokkT0XTWQR3EFODAJsKPVfDh6fQ8D5R4r+v3csY1coO1FAMjF/VJUJ+wUz/MiVByrJQg+ev2QPiaajwta4dcRM93wLziwPKDm2DBLfvBAz5XLjIOBC48n99CZMA2JokMtoC4hp8Z8WesYmoqhxmwr/srk6Rwot8tzvU2YI5Ee4nZJU7KOt1EqVxHWOee/swMHfre0v6dDp97dNO0ELY1oxXl0L0IcgEgxamV1AVvjZzZ1ULSuv9F+te7OWk/JRPM3s9P5WXGXucLve4RtGzuyBPkrC1Q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0mA0y4BbMvo01MT7hJRv1hbY+gQ/e4HKR3qAiaduTE=;
 b=JXJB2zZ51bIatPjV00uwuMyHT62EFoXS+GVovr2C5JXW4pQGV80zw5cEufFecqPuwOO2RWbw/wN2vVkUA5MUrZzVXBD8+ea90ddedNz9nIlaSJPogM4TtlBbN/LxWmZPkW26WzZk0p/Yea+Cpo1xK2eL5n6o1l6g+S+vnbgFGNIKQSHhd5FSUO1Rj65m6KuzOc15/7c+o5rA4ALy65h/uDkTqoNxH9GbYGVL5O02UnwNuevtHdCWEpfyYy12qbhum6S6REhYcim4P/SWVXpFYTj8dFj4VP9kXsgJWFPiWJGPsQy/Kh8We/jRTYAfoxd3mM0+iSjBjhJcz2YEX7WGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0mA0y4BbMvo01MT7hJRv1hbY+gQ/e4HKR3qAiaduTE=;
 b=mk7QMtU6YRLEdIbMwcFi1wrcEvTosCVRqNT5nzzPimNtM344B9kLonlyLJGeG50NtxtVgJQQVk6A/r98gbnttjQ6EfrqzjOk0IyS4zTyl7URWvJorDoec8bZZgc7P0YAJ12q2IxkvIfkBF3s+FWswb+GOhpBu19seHjdnaR6TNs=
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com (2603:1096:405:1a::6)
 by TYZPR03MB8801.apcprd03.prod.outlook.com (2603:1096:405:a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 27 Mar
 2025 05:44:04 +0000
Received: from TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf]) by TY0PR03MB8330.apcprd03.prod.outlook.com
 ([fe80::22a4:76d2:35ad:dadf%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:44:03 +0000
From: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "treapking@chromium.org" <treapking@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
Thread-Topic: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
Thread-Index: AQHbfDBAeO4420LyzEi9EBSK2pDmXrNLC84AgACLf4CAOybPAA==
Date: Thu, 27 Mar 2025 05:44:03 +0000
Message-ID: <cfb8b2bc8249dea9676dc6493baf2cdbeb38f943.camel@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
	 <20250211025317.399534-6-sunny.shen@mediatek.com>
	 <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
	 <041ffe38-ca24-4e05-90c1-e37f9323c7cf@collabora.com>
In-Reply-To: <041ffe38-ca24-4e05-90c1-e37f9323c7cf@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB8330:EE_|TYZPR03MB8801:EE_
x-ms-office365-filtering-correlation-id: a6fd2da1-b482-4020-554f-08dd6cf261ba
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTlRdFhFZk9KNlhmZzNYOWFYOFJaRm1udmsvbXdNcHI0ei84Z0xVajc5czF4?=
 =?utf-8?B?NkxRazlVQllIUm00RWY4dWZ2VTE0ajdiSzc0Z2JobWZKWGR1MnM4dG5vRzdM?=
 =?utf-8?B?SlQ2Nm5iOEpZVlNlMVU0N0F4ZXM0L1dIZVlnNldzSFhoUlE4L1poV0lUOGJu?=
 =?utf-8?B?QXVlK2FEUDQrQmd4alZyRXhpVi95L1VETWEzK294SXVzWUpGVHg4OW04RWtG?=
 =?utf-8?B?QmtkWlBCNWJaV0RDTkROWjBqUDFCdmt4OXVWaWJMcS91MU10STk0QWJWYjBv?=
 =?utf-8?B?UXVKOGNRSW9FR2duTjhCWHB5UVpEU1FQd0FydWhqQmUvaW1CUzQzY0JVaDd2?=
 =?utf-8?B?VGNFMzhGZGRZeUlXZVl2MXVJZFpHa3NjNmZKa1lwL3VPaHZnUlBMbS93ZGF2?=
 =?utf-8?B?d1RVcXpzNGQ1ZHhxQUVET2llQjIraDBJOFFrd2pRSkZOeTFqZWpPZm5pT1FM?=
 =?utf-8?B?MmU1eUh3MmdKNTVHV2ZrMEtJM3pxMTR6cEtWbGVoWXR1SGpzdUhtb09pNWJz?=
 =?utf-8?B?UDIwUlphN2Rzd3BIQktPVlM5UmxYU0xrWVJlMnVGU2t2aHpLR1A0WklJdFIv?=
 =?utf-8?B?OWhPOUFoZzBNQjI4S0tDVmRDMDUraTNRSWJ6NWNNUG5PbWhHaDhUMVNlU2Nr?=
 =?utf-8?B?L0pGSlgrUFB0aGhmVHRCMmNnWEpwN2F6d2ZWc2JRTWdiZVZIS3VsTUZLaHpu?=
 =?utf-8?B?MUZIbUdWWWd6SE1HcktKQUFTT3M4MEhVNHFvWFRKR2dpci9uZzUvUWt4cDM4?=
 =?utf-8?B?aVV2akszZjE2cHBqZXpJWGx1dm9zb2R5Y3FXbnNHaDFxbzRya2l5a0pzNXZK?=
 =?utf-8?B?MDBoVzVPZzZMc0Y4YnZNWlJEcWEyREhBR3V6ZUYwL090RlJxemJJcXc5NkRP?=
 =?utf-8?B?d2NXay9ycmd0SkxMQTZUdXZsUTNoS0J6dHJUWmFCUGt2cG9WQnp4ak0zQXlN?=
 =?utf-8?B?QVdEVVBlYzZNdnlOMlZnK05TWjY4MHBsMGRjdUlXdXV0M1FpZ1daM1pzWFE3?=
 =?utf-8?B?bUt1Wlpwdk53emFCcE91WUowS2NZVUhqZHk3eCtvbFZZYmwxWUZGS2pTTDdI?=
 =?utf-8?B?R3lXbDBmYkxRSE9VZFZSK1JNR3lpeFBGNHJSdTl4ZWpxdXBUcStxcFllMjF4?=
 =?utf-8?B?ZlpySnVpOGZPYmY2dXFrdnBQKytldk84QmRpODlBQ3ZZTFR4TTVQNVg4NDZi?=
 =?utf-8?B?TE5sWC9ucEdqT2tnU2t1VGVBTlhYMVNCaUpXUHEzclZSMDR6NHdnVGorTE4v?=
 =?utf-8?B?OGtmK1FNMWIyL2dmMG1aaTdtZGxkYzlGaFdGL2dsL3hOaUV1b09tZEhLVTM5?=
 =?utf-8?B?M1JYd1YyeFI2ZWhqUnQ3bEFqQWMrbW13QjgzSks4ZFh4R0dock5sUkFoMXJy?=
 =?utf-8?B?bC93dGNhSU5DTGtMRmp2eHk1YUZsczM2bEg3SFU1WTFXNzFGYm96di83NE0w?=
 =?utf-8?B?MkFIN3gvZGNreDJPais0ZmduTjJXVWphTW9MOWcweGRLTXlLdm9LQitFR3kx?=
 =?utf-8?B?NVlFS0NQU1dqU3ZYaFBzbEMzZG5ucVBXdDdkamJPNktxaXdsMXp2bEsvREdQ?=
 =?utf-8?B?ZnNxbzVmVCtlSEptQzBFaU11ME51Q0srMjliempvYjAxcnVwSHJ5bVJ1RzRU?=
 =?utf-8?B?SDhIZlp3STZYU2EzSktMMUdhZWxpVVZVSTNQVHFGQXJ0Nnl3UnZsaFh1eTNh?=
 =?utf-8?B?WkREMVlPS0xrc1FBendrUjc0cEFFQVVTRzFsMUdaRmtEWWsyZ0dBdVZHbktU?=
 =?utf-8?B?TXRVeEVSSGJRS0tQbTU2OHM1TUxpcWMvY2ZVZUt0ZGkrK2ltWTJ0NGVHTzlW?=
 =?utf-8?B?WlBQcHM5R0h4dmJYZitnRXdmS01WOSswSkNUYk9ERDl1Ly9GVXlNT1dwQVZj?=
 =?utf-8?B?RTllclNHSlRlNmhDWFdJVCtmT2FNRmQ4dnd1UzdDSnp1a1VHbGdSMk1LVGha?=
 =?utf-8?B?MEhYQWEzTzgwdzdURXUzUVZ2bVJCbW0xWHp5Yk11aGRZUjhNQUhsMWZtamJC?=
 =?utf-8?Q?1+JK23kDGGF9sqa7qj1pYpLk7cJED4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB8330.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGZrNHQ5b1FRTzB1SVI3WUFqS25IZmUwbkt5VjhvRnlIeVVsWGxwc3VBTjFO?=
 =?utf-8?B?UnJ6ZXZPaWZWL2FrU1oyWS9ueTE2ditvMW9mMzN6K29oTEJEMWg3N250Yy9s?=
 =?utf-8?B?U3JlZGlXWHNiMXgrN0FvWXpIZ0xqeGNwcnBHa1R5bTJOUDA0YlVrTzRHZURG?=
 =?utf-8?B?cjFUOXlHSS96OFVnOTlQR1lsUkIwcGlYR1hieWpEUC9QWHYvNDJ2UUJQWUs1?=
 =?utf-8?B?eEIwK3VuaEpCbzV6YUVPTDRaeUlJbEN3eCtZUVNIbW5vVzliV1hVNEJNQTdH?=
 =?utf-8?B?SnBxZkwyeDE1U2Mzb01vZlorSjRtc2FraE9nNlhhZFNBaGJ3aDBWL3NqVXJl?=
 =?utf-8?B?cmFKOWNKclkxUmxIMWZLcHRkZUUvOTQ4WWU2TzB6aFdEZWtBcEVwblZqakY1?=
 =?utf-8?B?bXkwZ280dUN3Qi9wQVZHVkZlRkRXcGJla1YwM2JUSXZUekhZMS82eVd0Y3Ni?=
 =?utf-8?B?NEcxN2UvcC9SQzJ0VzdMQlNDeG0zZm1kdm9hWWZ3NVpaOThOVXZKUm1ZYzdo?=
 =?utf-8?B?aGVhV3ZmcU0vNUl5NG9YblJycmJ0a3pEYjVqcFNXY1lhYnhrWktVMFFidXhI?=
 =?utf-8?B?dHY5cDA4WEVlaTZYN05JdmhFWWJUbk1kazBmQk81TWR2c2NycE91MUJtb3ZV?=
 =?utf-8?B?VE5UZDlZbWV0T1piUmswVmxmcWdudUZyb2VhVTZ6TTdNd0VLTnh4aWM4YStx?=
 =?utf-8?B?VDkyWnhIUTNFYm5XN3NaTmJ0UUo1UTdHUW5tUk8wZDcrUVRqTUpVYW8xWlpj?=
 =?utf-8?B?ejkvRDRNTVZsSldYYy9nd1YrbE1ORGJHaENQVVZLSmlrR21LOUdPTkdYbk9M?=
 =?utf-8?B?Uk9vcDEvcjNSd2gwbXdVeXhCSnRlNlNmeGRhaWltYWRBckxqVXArMTdVV1k2?=
 =?utf-8?B?czJlNTR3UG43YlRNL3c1cklkY2NONmRJcmNzSHlMOS8vVWQ4UFhCaVhjSmtL?=
 =?utf-8?B?NW92cnlsaERmM2paV09jR2ZOZmhQSTRLU0FGdEp0NWw4Mk80S0x4Q2UzbWgy?=
 =?utf-8?B?NkhWMUYwaXhyeDBLVzE1cDVMVUs3S3NaZGJWOFdqcWlRWUJIalpIK0ZhNW5P?=
 =?utf-8?B?N1F6bWxjTkpUWjRZTnlWV1Bxb2lReEZtTkxaeVg5L2diaUc2Z1pNRElucnp3?=
 =?utf-8?B?UG1wZ1QrS3IxcVA4am9ncHY0SDVGaVZqSFdBb2dGMGtsZkk0QXpDNU9wbHRF?=
 =?utf-8?B?MDRRQzhPd0h6UHBKclVpTjZyN1FBdXNaMWlxVEowczk2RUE3N1hnK0pBN0VX?=
 =?utf-8?B?Qi9ZNkphalRMQVBTaHFvTWExMTFZWGtvMVUwYVc1YkxjVGVJZkJPelVuY3lV?=
 =?utf-8?B?eTYyTWRzSnF2L2c1QWsxeFlsUjNOWGcyZWFnU01qU2xKQ3orRVpucnNYdDdC?=
 =?utf-8?B?WTZpRUZ0cUlBdXp4QndHenB6eStzWk5PZ3pBZDQ0M2szNWdGMjdhYTB2YXlD?=
 =?utf-8?B?RWlqbU5BcDRGUnZjcWdIbGFzVkZpTDdjbCtaZG1PNXhHSmtQeXZoZ0t6bTRT?=
 =?utf-8?B?M09BTUtvbjNBTFRQaU9KUjBOOWFQWVBuVHRDSzZ0SWNtZ0pORVpjby91aWo3?=
 =?utf-8?B?MGNldlJhN1Zha0oyM3BOcXFHalpWYTZEWExYM2tudHRIMEZweUpjQ3grMnJu?=
 =?utf-8?B?OFRpS3FoWDR3QVlhVzlHMlZCMWF1cVQxNDRhYnRrK3U2OUNYL1NHMWtyRlRv?=
 =?utf-8?B?NmZ3VTBEVlNvOWFNNjRHUk9QU3ZqdWIyemMvRXZadFdYc0ZWQnhER2FpNHNj?=
 =?utf-8?B?R0x4VVN6dGhXNnF2UE04cXk3emJUYkJsM1U3UytiQzEyY05rTXJENHA0T08z?=
 =?utf-8?B?cVJiNlo0a29jOXRqNVJhZ0YvYUpnSUNSejN0ZFgwVWRqeDl5UVNieUYrYVdk?=
 =?utf-8?B?a3BWZVlrTHNWNTZIdkdKWTJrQ3lSakdJcW5OUlFKN1FFRFJkYjI1aHNMaktk?=
 =?utf-8?B?ZWFYZ3JRZkdNZmpkZzhXRW9Kcno2UVRWMnNrd1FWZmJQSVVhaW5DcCtxZ2ox?=
 =?utf-8?B?ckZESDRGTmljdmUxTDdnYU5FSEZYaTFPeVZPYUprQXFCMkpqa05RREh2V29J?=
 =?utf-8?B?cXZPRGV0aU5NR05TWm5qdWxLMEZ6RU9oaWhFRXNWZ2NUWGhjT3hVSzM3dS9S?=
 =?utf-8?B?OUNLa0RrK1N4OENzcHhiejFLbWVieGt6eTUrbmFlWXZmd2pWYU5YT1dTQ0JJ?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2ABFBA87E608D44FBD36FE02FD9A3395@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB8330.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fd2da1-b482-4020-554f-08dd6cf261ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 05:44:03.3867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MW3eLFB0emmFuNdEoX8uPn7d0vL89oE6y3rRiYmMBSAaFJELHjfmTF8tZ9ItJRGqrSeaTKC9q5FMIfVx6b0PiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8801

T24gTW9uLCAyMDI1LTAyLTE3IGF0IDE1OjI1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTcvMDIvMjUgMDc6MDYsIENLIEh1
ICjog6Hkv4rlhYkpIGhhIHNjcml0dG86DQo+ID4gT24gVHVlLCAyMDI1LTAyLTExIGF0IDEwOjUy
ICswODAwLCBTdW5ueSBTaGVuIHdyb3RlOg0KPiA+ID4gRHVlIHRvIHRoZSBwYXRoIG11eCBkZXNp
Z24gb2YgdGhlIE1UODE5NiwgdGhlIGZvbGxvd2luZw0KPiA+ID4gY29tcG9uZW50cw0KPiA+ID4g
bmVlZCB0byBiZSBhZGRlZCB0byBzdXBwb3J0IFBpY3R1cmUgUXVhbGl0eSAoUFEpIGluIHRoZSBt
YWluDQo+ID4gPiBkaXNwbGF5DQo+ID4gPiBwYXRoOiBDQ09SUjAsIENDT1JSMSwgRElUSEVSMCwg
R0FNTUEwLCBNRFBfUlNaMCwgUE9TVE1BU0swLA0KPiA+ID4gVERTSFAwLg0KPiA+IA0KPiA+IFJl
dmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBTdW5ueSBTaGVuIDxzdW5ueS5zaGVuQG1lZGlhdGVrLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gwqAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
fCA3ICsrKysrKysNCj4gPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4g
PiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+
ID4gPiBpbmRleCBiODEwYTE5N2Y1OGIuLjFjOTdkYzQ2YWU3MCAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiA+ID4gQEAgLTI0Miw2ICsyNDIs
MTMgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludA0KPiA+ID4gbXQ4MTk2X210a19kZHBfb3Zs
MF9tYWluW10gPSB7DQo+ID4gPiANCj4gPiA+IMKgIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
bXQ4MTk2X210a19kZHBfZGlzcDBfbWFpbltdID0gew0KPiANCj4gSWYgeW91IGJ1aWxkIHRoZSBk
aXNwbGF5IGNvbnRyb2xsZXIgcGF0aCB3aXRoIGFuIE9GIGdyYXBoLCB5b3UgZG9uJ3QNCj4gbmVl
ZCB0bw0KPiBpbnRyb2R1Y2UgYW55IG10ODE5Nl9tdGtfZGRwX2Rpc3AwX21haW4sIGF0IGFsbC4N
Cj4gDQo+IFNpbmNlIGFsbCB0aGlzIHdvcmsgd2FzIGRvbmUgYW5kIHVwc3RyZWFtZWQsIGFuZCB3
YXMgZG9uZSBiZWNhdXNlDQo+IGhhcmRjb2RpbmcNCj4gdGhlIGRpc3BsYXkgcGlwZWxpbmUgZm9y
IGVhY2ggYm9hcmQgaXMgb25seSBibG9hdGluZyB0aGUgZHJpdmVyIChhbmQNCj4gd3JvbmcpLA0K
PiBqdXN0IGV4cHJlc3MgdGhlIHBpcGVsaW5lIHdpdGggYSBncmFwaCBpbiB0aGUgZGV2aWNldHJl
ZS4NCj4gDQo+IFRoZSBkcml2ZXIgZG9lc24ndCBuZWVkIHRoYXQgYXJyYXksIG5vdCBhbnltb3Jl
Lg0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQoNCkhpIEFuZ2VsbywNCg0KVGhhbmsgeW91IGZv
ciB0aGUgcmV2aWV3DQogDQpXZSBhcmUgc3RpbGwgaW52ZXN0aWdhdGluZyB0aGUgbWV0aG9kIG9m
IHVzaW5nIE9GIGdyYXBoLg0KSSBjYW4gZmluZCBhIHBhdGNoIG9mIGFkZCBjb250cm9sbG9yIGdy
YXBoIGhlcmUNCihodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvcGF0Y2gvMjAyNTAyMjAxMTA5NDguNDU1OTYtMi1hbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20vDQopDQpNYXkgSSBhc2sgdGhhdCBpcyB0aGVyZSBhbnkgZXhhbXBs
ZSBvZiBkcml2ZXIgY29uZmlnIGRpc3BsYXkgcGF0aCBieSBPRg0KZ3JhcGg/DQogDQpBbmQgc2lu
Y2UgdGhlIHBhdGggY29udHJvbCBpcyBub3QgdGhlIG1haW4gdG9waWMgb2YgUFEgc3VwcG9ydC4N
ClNob3VsZCB3ZSBkaXNjYXJkIHRoZSBjaGFuZ2Ugb2YgdGhpcyBmaWxlDQphbmQgbW9kaWZ5IHRo
ZSBwYXRjaCBhZGRlZCBwYXRoIG9mIG10ODE5Nj8NCihodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyNTAzMjEwOTM0MzUuOTQ4MzUtMTYt
cGF1bC1wbC5jaGVuQG1lZGlhdGVrLmNvbS8NCikNCk9yIGFkZCBhIG5ldyBwYXRjaCBzZXJpZXM/
DQoNClJlZ2FyZHMsDQpTdW5ueQ0KDQo+IA0KPiA+ID4gwqDCoMKgwqAgRERQX0NPTVBPTkVOVF9E
TElfQVNZTkMwLA0KPiA+ID4gK8KgwqDCoCBERFBfQ09NUE9ORU5UX01EUF9SU1owLA0KPiA+ID4g
K8KgwqDCoCBERFBfQ09NUE9ORU5UX1REU0hQMCwNCj4gPiA+ICvCoMKgwqAgRERQX0NPTVBPTkVO
VF9DQ09SUjAsDQo+ID4gPiArwqDCoMKgIEREUF9DT01QT05FTlRfQ0NPUlIxLA0KPiA+ID4gK8Kg
wqDCoCBERFBfQ09NUE9ORU5UX0dBTU1BMCwNCj4gPiA+ICvCoMKgwqAgRERQX0NPTVBPTkVOVF9Q
T1NUTUFTSzAsDQo+ID4gPiArwqDCoMKgIEREUF9DT01QT05FTlRfRElUSEVSMCwNCj4gPiA+IMKg
wqDCoMKgIEREUF9DT01QT05FTlRfRExPX0FTWU5DMSwNCj4gPiA+IMKgIH07DQo+ID4gPiANCj4g
PiANCj4gDQo+IA0KPiANCg0K
