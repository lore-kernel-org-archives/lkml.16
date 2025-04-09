Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEBA158553
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 03:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744168262; cv=fail; b=qlZaEHAw+UcdgZzWLNa34ZV3pgqzZ6h/tyclasXr3Aoep0hDSicBlXt5OsxfcmYeXuf+93had/Z9Y/5Sn1swrCuLMsxZfQQWSju7uAl3OEmbn/357O2Ky/tsK+/ihY+bnbh+bZoJ/P7uzZw7JAvnDPbf1Gc7Njil3Cs1kTE/iNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744168262; c=relaxed/simple;
	bh=6nOc23xxUqhbI8I9g1Cn1zd0j+fnk9cC7sdF2V7MVzs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DiixmuKNF7iSYfeWp+wWjnmUnogXVmXtd3RY0fJD44t460ySbRJGqNGBjw4MFv3qpTLq4kPziEuqodQHVblQ5ebcsvENjS+J47IAaK9TGzqy5x5nRRtOh5hGSOyOGdDSq+FCYnXnwG1/xPZk8OQkATKUVkmsLHq5cje13q6iuKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=MB9haU/y; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=pMReBsAe; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MB9haU/y";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="pMReBsAe"
X-UUID: 3fdc7d7414f011f0aae1fd9735fae912-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6nOc23xxUqhbI8I9g1Cn1zd0j+fnk9cC7sdF2V7MVzs=;
	b=MB9haU/yk2e6yHgN4hKTImxwwPks/OEnZamw6CfzXPdRNcBJMPuDN/6CL5jKwl8UUudEGlYa56tJqbHA6LK4FbiWWBoGQVOrpwi7QfoRjT6FXQHUD4uAuMECZNFVAPKtjVtpluVVFghwkwmIjeC9aXqDO3YCSOO2uiaLudiJ05w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c5645ba8-da2f-421f-9e08-b2553bda44a2,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-4
X-CID-META: VersionHash:0ef645f,CLOUDID:8dde58c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3fdc7d7414f011f0aae1fd9735fae912-20250409
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 784560511; Wed, 09 Apr 2025 11:10:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 11:10:53 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 11:10:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+CSET8TtjfxWK0nATeF+SrKZANbE/8Nv9PxAhm1Wc0al/61lzYAXHe/KaOFe4oNFQvKbZv3NT5+IOXaPbBG+MRSRjuYXDTR5imCIdtoV3K+diHt5rHLqzV3odxi1vAxxQYnymu9pFc7/8RUEyTT8iF/+Yq66fGrLcu3uN8JGHnSYJixZEZitICaQ7FAdAmELRXzznUOHV2JvNI4oUuH65wzjCy7t6Ks73aITwDwgwfBUywsI+g3fFByqd5ChdpK25pNqpz0wlJmrSlwH4ZM13iruzSol9z/L90rB7cCIEZVcx88h9IGxFNURHWnLLBKV/yEyVHArKlOoPNQiU8Zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nOc23xxUqhbI8I9g1Cn1zd0j+fnk9cC7sdF2V7MVzs=;
 b=J0Q/48j8/57UH48+VymH27S3Da3z1F7R3IumCptNuLGZLjYvauG4Bh8apiDkwE7ZpVlVbjhzJEPcPZrJdkB83+YToyBi11gaFWMpSrelzb1fYgzfnLJoiSIb9BTOcibOtAlaDoKbsdfd1VHFBzrCQjjpqFim1IQB7O7JQiolyxZpIW02F+pehZ5RR4Y4pUhVB22fJw4K7ZBUCNU6ZFI8JPsW7bG0Sufm4eMR9esTgLo/5cjc58SAvZ0n4s80vYB/oQm1dqpcvZ3plXTkQo4ThwQ6qqIXF6+YmMMVgPCjaYM5GylwSK6mIIBNW01CxS5v1wk0gIUEs0dALDkOH+28HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nOc23xxUqhbI8I9g1Cn1zd0j+fnk9cC7sdF2V7MVzs=;
 b=pMReBsAe+dptO2s5B+S7EkvYqtC4bT5wcSyrdUiO96rz7x0OCw+e4pvibR1VYsMzizpc4+NCE6/YeSjybFv4U5yeFZsKXQfOR//x3awvFR7tQvtFRbFLxZjDr3bBK9UPstEjVX5yY68NB5a6Di+yh0QMCWgvT2/YWwCF9hpA9CA=
Received: from SEZPR03MB6490.apcprd03.prod.outlook.com (2603:1096:101:46::13)
 by SEYPR03MB8454.apcprd03.prod.outlook.com (2603:1096:101:203::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 03:10:51 +0000
Received: from SEZPR03MB6490.apcprd03.prod.outlook.com
 ([fe80::9adb:f124:f19c:41d0]) by SEZPR03MB6490.apcprd03.prod.outlook.com
 ([fe80::9adb:f124:f19c:41d0%6]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 03:10:50 +0000
From: =?utf-8?B?WWlydSBaaGFuZyAo5byg54ag5YSSKQ==?= <Yiru.Zhang@mediatek.com>
To: "james.clark@linaro.org" <james.clark@linaro.org>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>
Subject: Re: [PATCH] [Patch v1]Add ETE devarch condition in
 etm4_init_iomem_access
Thread-Topic: [PATCH] [Patch v1]Add ETE devarch condition in
 etm4_init_iomem_access
Thread-Index: AQHbqFkF/hNSoLdvYUG/CHgVRCj4arOZeiOAgAEvJ4A=
Date: Wed, 9 Apr 2025 03:10:50 +0000
Message-ID: <5099052b6ba2bdd431c06349d81ef3acfb4d9b5d.camel@mediatek.com>
References: <20250408073651.17140-1-yiru.zhang@mediatek.com>
	 <98f6fa74-f14e-48f1-b550-c1ff962df53d@arm.com>
In-Reply-To: <98f6fa74-f14e-48f1-b550-c1ff962df53d@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6490:EE_|SEYPR03MB8454:EE_
x-ms-office365-filtering-correlation-id: 377d8969-3d96-4f1c-5434-08dd771421f5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N0YvU0ljd0hkRUVtVUtMdEZiMDBURUtOVkszUkc1R0RNQ0xLS3FHN1dabUNO?=
 =?utf-8?B?VE5sWjUwZG9WT29TWW1BcmhKZzJ3amxHMSsyVkFUZ1FOaHZtQWM2L01VU1Rs?=
 =?utf-8?B?WG5GTW9VU2tIYnFNNEx0ajEvQ3BQQnQ2Z3VkSlZ0QTVPUk9pMXRTaUdWM00z?=
 =?utf-8?B?OEpSVFROOFFlRzBOcDZmeWU5MVViOEFsQjExK2hUcEc5SEdkTnhobVdaSTJG?=
 =?utf-8?B?UmliRGdzM3d4N1JkTTJZNkI2eitmZ0twS0RaS2xRODdyZFlOMnMrYU9NbGVj?=
 =?utf-8?B?RmttWVd6UEVoVlp1bmhnVGJmZ2s0UnFDbHlRb0E2YjVZSUhBNHA0elVPcXBV?=
 =?utf-8?B?TE1LWUFUZkdjSHlvaXk5d1E1SmZhRlVsd1k2ODIwK3dCUWxaWER5Q0t3ajcx?=
 =?utf-8?B?c0RYQlNITFlUcXhJMVJJVFRzRFVGbWp0WVhKRThKUDVkYklJQmNBeEI2aTA5?=
 =?utf-8?B?SVV0U2EzWEV4aE44OG9KRUt6NDlRbHd0amx0VlZ4WUplOXZkSzhJTC96a1Y0?=
 =?utf-8?B?c25aR0dNTTREckt2R2gveW40dGxmZlkralJCOVhzS0lFWTVaajVWTzBHYTBR?=
 =?utf-8?B?ZWRTYjZmMEdJNFh2TmhmLzNnR0hHUHptTEsxYmhoL1VxOWZlbG1pVnFQZ3No?=
 =?utf-8?B?Sld4enZjWWVZbExDZ2ptV3lNNDE2U3JjUkl1MDBkYkJKODlnd1d1SG93Ykdv?=
 =?utf-8?B?RGE1M3J4OUJsZGR4cXliWHVkdEYveW9BVnFvMmJud3o2L0VpZU9wVE5jZHBH?=
 =?utf-8?B?emlBU3hoamx1bkQzMWcva1I0OE04c05PZExvUFlvT2pTdDhNUTBpRlEwODVQ?=
 =?utf-8?B?VGlXUXVGdE1QOVl5dWVBT0xYYW5YNUE1U21adUE4a0ZJZ3JJTWlOYXY5WTR0?=
 =?utf-8?B?QVhzOHNMMEgzckF1aWUvbk5jbXNiYWpYOWswdGZNVjdSaDhPdnVIdExkeEE3?=
 =?utf-8?B?Yll5ZnNpaHkzTW5KQ284YTlPb3B4d0pSaUl6dzBWa0FzRHVQd1lHVG9oRUlU?=
 =?utf-8?B?U1BURGx1NG00MkNSWTBUMEdpRGpoVFVLaFZEM2U2Sk5sclFabFhvUjFOTXdI?=
 =?utf-8?B?bGtnT1BBa2FDMFFCV25IR1k0aW10MkZvZXhzaUZIRXdPUHdIRzVIMTZObURS?=
 =?utf-8?B?dVJydmV2TEs4MHpBZGhmcHdJenQ3SHhuOGRRRkpleFBNOU1USktteEpvaVJC?=
 =?utf-8?B?NHBLaDdqb2dVL2hSQWhWNEFXWXYxbHFTRHZPM2p4VEVtbHA0L2hFSEpUUFNT?=
 =?utf-8?B?ZG5kVnY0ZzJEZHVBaGlRc0x0SS84dUMrdGhyN2NzbDA5bnhTd3J5NkVFTTlN?=
 =?utf-8?B?M1poSFZ3R0krYUt4OFBwdE1rWkl2TWVLRTdja0kxYkNlbkk2cFdzN0xFYzBO?=
 =?utf-8?B?S045VkdqWDFyc2xGZXBZL2R4Q21PWE1NUjJtS2xLUUtoTHBBa1I1TFhDWG9E?=
 =?utf-8?B?SEZTRWg4R1Y2ajYvL08yL1hUUXdma3RoNlhuZ2lycEdGNnk2YTlLNVZjakx2?=
 =?utf-8?B?VlRCRWo0SXZEN1Z0Mi9yMjBuRnJEUkY2T1VsTE10cHc4aEh1Q0cybW1BWnZi?=
 =?utf-8?B?elg1M2hLbWlkMU5qS1hxZERKV0YvaTJoRnRBWG8rRTNTSDk4ajhnWTZyYWtt?=
 =?utf-8?B?MEZ4UFRzUjFrNFo3WnFMbVBqSWoySVkweTlkd0RDSTBtQWZuazJwYzNFV0hK?=
 =?utf-8?B?ekhQM3hrclg2RnorSXJjbkVxbXNtMW1WRmVZNUt3SlpkZS9sQ0JqemZuYXBG?=
 =?utf-8?B?RVdiWHg2Z2l2VXdYY01Ha3BTQTFHL3A5Y3ZDSklhZmkrQzVXNEUyeVdIdUJx?=
 =?utf-8?B?MmtaSWRrZ0hpQ1VpRHlySFA2YisrOEg4L21RbFdOZXM0cUlsOU1TWk1wNEk5?=
 =?utf-8?B?NHVTUFdKdHM3R1pXNENKY3Q2cG05dnpVYXB1NllqbUVUYklWVVViaGZCbmxk?=
 =?utf-8?B?RWlvUzdXRlYzVnhRcDVpR2Fzc3NXMStic3dNaHc4OFExcUNWZ0dlYzU0WUN5?=
 =?utf-8?B?OWZsSEtZREZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6490.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlhBT083b2F0aTZTa1ZSUzJ0MC92Z1I3YVlWazF0MFVzLzhPeUx0OVRtcS9y?=
 =?utf-8?B?dVE1N2g1NkRTVEpQdlUxSnlvWmdIeHppSkdRNGc3aVpjcGpQdloxKzNvTkNx?=
 =?utf-8?B?R0xPY0xqcGlOS2NzNm9zRHdPeFdJV2ZIZlAzdmVZK0orTFlucUNwRHEyOFVw?=
 =?utf-8?B?OFhMNjI0WnlOMWpXUTNEZ0ljZVRSdzVXcUdGTXk4OHd3Rk5YK3N2MDJyRm5P?=
 =?utf-8?B?R25MZWl4bUJ4OUxaMFZtWjJCK0I5SEZyRHFrOHd3bmoxNXRSeW5TazBUMUc3?=
 =?utf-8?B?SERHYUNHUVowUHVxT0czWXpFZ3J5UVEwZXNZSDh5V1VJNFZFN0xnTXBlT3o2?=
 =?utf-8?B?aHFQYkF4K3lyOURzK1E2VHRlMU9wMDJGcWIyQWhMNHRyRWZmM3BpVTdwcDNz?=
 =?utf-8?B?dEYzWktWYjZHT3BnOVNQcWpUckUvMmJxQ3RUL3FpNlpxcGsrdU5HOUhuaEs0?=
 =?utf-8?B?MkhXcUU4K08vbUQ2Z1daUFhVa0JJWDFPUXNHYnhhUkwxbzNlalJUV1RWQStH?=
 =?utf-8?B?QSt6bG93TGF6MGk5amxNYVp2bmZEY3FoOStPMVJDTjMwbldOK2tBNzFUTWN2?=
 =?utf-8?B?QmlEbEZFR082bTNkMmFYVVFWaHN0TUswYWdoZWdNUnU2bnZ1VjR3RHFGaURy?=
 =?utf-8?B?THBtVWIxb3hnbFlNMVQ4Z3NpQUVDL0FIcmJtcTFSZFJ3dzlnMFNwM0NBaDZl?=
 =?utf-8?B?M0d6Z3VWTjhvZWE5OHJVKyttMU9WRHZaenc4V3Q3dTd5TjdXVERhNUE1YWNU?=
 =?utf-8?B?cFA1ZVhKM096QnBwazliaTdzZC85bVJuaWZaYXBMaGVMazFmQ3h6bGxBOUdl?=
 =?utf-8?B?d3VWWXcrbFh4UlFXY2dCWURqOGRyY05kazVjNERHeXNqMWRMS0JPNWYxMHQ0?=
 =?utf-8?B?MGdCRGVrM1dFZUZvWTloTVMxNlBkRlFUNnFpVjNuLzBaZ1pIT21xaFBrMHhy?=
 =?utf-8?B?Y29kUjVobmFpcUlIQll2Yy9GVnNVYTMrTHdsdXRBMjB6NEJiVmZIZTlKWndJ?=
 =?utf-8?B?TEt5MDFtSEhESHY5NEdMV3IyNUp2V1lZaDlvaDV1bjF4Q3BGZm9qdmhkK0pp?=
 =?utf-8?B?QmhxUUVhRDFwSEdkSmViUXZHUWNjbUxsSUFQOFlnWksxK0dlNms5QXA4Qy9F?=
 =?utf-8?B?bDJxMmNJU2dBTWdkYVJMaXVEUmFmZ1RDaTY1Q0pwWklYaXpHZlB0STVkclFI?=
 =?utf-8?B?MDIxMXdXZEpPWFVOTlhPem5NSHlMSlBkcjAxWC9LUzZpK2pGT1JGZjFHWU9X?=
 =?utf-8?B?NHAyc1N0bHRWTnlWUVplVmZLNXJONnhWa3c2K0FrMVJRQUlGWktCNEIzaFZR?=
 =?utf-8?B?MkZOWWRTZ2syVVVwOU54YWJVNmwrNHBGQWNBYlJBUlViWi9JLy9UOEhzSGly?=
 =?utf-8?B?MncxcGhTV09mb0NLRzRKWHBUZEVTb0VnTkxBdnJWQmhyZDRCVXNvRnVWb1Fw?=
 =?utf-8?B?UzBIUE1PcHVDaTd2bVhweWVyMUg2Um1nUW9VaC9BekwySGJBRWJHcTFiaU03?=
 =?utf-8?B?TXp6R2tjdC9Ob2liakhHcW9GcFphNnFnMzN1QStPUjYvbUt2QXkxZkJoOGJO?=
 =?utf-8?B?UnZjNFdUVnY5MzYyc0h0UnJjYTlMd1ZwbG42V2VCekVkRFVOU3ZSbnNpVjZF?=
 =?utf-8?B?YlRPdWtranczMDZFd0RUZW9MYzlDZVd6YnIzd1VRTkVzLzNLZjhiOXI0UHJB?=
 =?utf-8?B?SnBHdHd1S2UzZnBXZjlyTFJBZUpnbi9rc05WVDRPZmd5Mm1wOHFhUWxDN1lL?=
 =?utf-8?B?NlRnajRXVjYrbTZ5WmR1Wi9maFBRK1A1NXVFci9zNHZPL29WVnNPQjMrVy9l?=
 =?utf-8?B?SlF3RUNxTXBna0xtYjZCL2JmSU9tTVpLYjVqa1VIUGdYYThVMlBhQ2grZWFi?=
 =?utf-8?B?eHVYV0VwZ0xXTEdPV3FBVFNob0theXpqSUFxS01paWV5SlFqMXhXQUtBcmMx?=
 =?utf-8?B?MDdhZHFCK3ROWkF6a3ZzWENTblFRcFoyZmJ3OFZPeTJXREJBNjg5eDBwYjZu?=
 =?utf-8?B?ekFBdXhLYjFrSnZHN3h5V01PU20wUjRpS0tEcGlhZk5zNUFDWWxCSWZ2VmRT?=
 =?utf-8?B?ZHVnc3FOckxheWhqbmRESFlKN09HZW1Hb1BLT05iRG5hTURBbGZTLzlZekxV?=
 =?utf-8?B?TmZEZ3N2YU16Q1VzSjJlUTQxV3NXSFYwc2t1K25rUTMxcFo2NktnUVk1VXlE?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E3DD3305EE28A4A9893550C361BAEA1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6490.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377d8969-3d96-4f1c-5434-08dd771421f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 03:10:50.8822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDKKsNZE0CmARAnL9eerwnWeO1bVQ04LNfwzca/+USe+04DJ4YqNT/ZxJlG5pw/t4R3wWvH3GlB641XcC4H/8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8454

aGkgU3V6dWtpLCB0aGFua3MgZm9yIHlvdXIgcmVwbHkuDQpJZiBubyBFVEUgY29uZGl0aW9uIGlu
IGV0bTRfaW5pdF9pb21lbV9hY2Nlc3MsIHRoZSBmdW5jdGlvbiB3aWxsIHJldHVybg0KZmFsc2Ug
YW5kIGluZmx1ZW5jZSBmb2xsb3dpbmcgcHJvY2Vzcy4NCkkgd2lsbCBzZW5kIHYyIHBhdGNoIHVz
aW5nIGEgc3dpdGNoIGNhc2UuDQoNClRoYW5rcywNCllpcnUNCg0KT24gVHVlLCAyMDI1LTA0LTA4
IGF0IDEwOjA1ICswMTAwLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFp
bCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0K
PiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+
IEhpIFlpcnUNCj4gDQo+IA0KPiANCj4gT24gMDgvMDQvMjAyNSAwODozNiwgeWlydSB6aGFuZyB3
cm90ZToNCj4gPiBEdWUgdG8gRVRFIHN1cHBvcnRlZCwgc28gYWRkIEVURSBkZXZhcmNoIGNvbmRp
dGlvbiBpbg0KPiA+IGV0bTRfaW5pdF9pb21lbV9hY2Nlc3MuDQo+IA0KPiBJcyB0aGVyZSBhIHJl
YXNvbiB3aHkgeW91IGNhbm5vdCB1c2UgdGhlICJzeXN0ZW0gaW5zdHJ1Y3Rpb25zIHRvDQo+IGFj
Y2Vzcw0KPiB0aGUgRVRFIiA/DQo+IA0KPiBUaGUgcGF0Y2ggYXMgc3VjaCBpcyBmaW5lIGJ5IG1l
ICh3aXRoZSBzb21lIG1pbm9yIHN0eWxpbmcgbml0cykuIEJ1dCwNCj4gd2UNCj4gZG8gbm90IHJl
Y29tbWVuZCB1c2luZyB0aGUgTU1JTyBmb3IgRVRFLCB3aGVuIGl0IGNhbiBiZSBhY2Nlc3NlZA0K
PiBkaXJlY3RseSBieSBzeXNyZWcuDQo+IA0KPiBGV0lXLCBpZiB5b3UgcmVtb3ZlIHRoZSAibW1p
byBiYXNlIiBhZGRyZXNzIGZyb20gdGhlIERUL0FDUEksIGl0DQo+IHNob3VsZCBhdXRvbWF0aWNh
bGx5IHVzZSB0aGUgc3lzdGVtIGluc3RydWN0aW9ucyBmb3IgRVRFLg0KPiANCj4gDQo+IA0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiB5aXJ1IHpoYW5nIDx5aXJ1LnpoYW5nQG1lZGlhdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRt
NHgtY29yZS5jIHwgNSArKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG00eC1jb3JlLmMNCj4gPiBiL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jDQo+ID4gaW5kZXggMmI4ZjEwNDYz
ODQwLi45NzFiOWYwZmU1ZTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1ldG00eC1jb3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL2h3dHJhY2lu
Zy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bTR4LWNvcmUuYw0KPiA+IEBAIC0xMTM1LDggKzExMzUs
OSBAQCBzdGF0aWMgYm9vbCBldG00X2luaXRfaW9tZW1fYWNjZXNzKHN0cnVjdA0KPiA+IGV0bXY0
X2RydmRhdGEgKmRydmRhdGEsDQo+ID4gICAgICAgICogd2l0aCBNTUlPLiBCdXQgd2UgY2Fubm90
IHRvdWNoIHRoZSBPU0xLIHVudGlsIHdlIGFyZQ0KPiA+ICAgICAgICAqIHN1cmUgdGhpcyBpcyBh
biBFVE0uIFNvIHJlbHkgb25seSBvbiB0aGUgVFJDREVWQVJDSC4NCj4gPiAgICAgICAgKi8NCj4g
PiAtICAgICBpZiAoKGRldmFyY2ggJiBFVE1fREVWQVJDSF9JRF9NQVNLKSAhPQ0KPiA+IEVUTV9E
RVZBUkNIX0VUTXY0eF9BUkNIKSB7DQo+ID4gLSAgICAgICAgICAgICBwcl93YXJuX29uY2UoIlRS
Q0RFVkFSQ0ggZG9lc24ndCBtYXRjaCBFVE12NA0KPiA+IGFyY2hpdGVjdHVyZVxuIik7DQo+ID4g
KyAgICAgaWYgKChkZXZhcmNoICYgRVRNX0RFVkFSQ0hfSURfTUFTSykgIT0NCj4gPiBFVE1fREVW
QVJDSF9FVE12NHhfQVJDSCBcDQo+ID4gKyAgICAgJiYgKGRldmFyY2ggJiBFVE1fREVWQVJDSF9J
RF9NQVNLKSAhPSBFVE1fREVWQVJDSF9FVEVfQVJDSCkgew0KPiANCj4gV2UgY291bGQgdXNlIGEg
c3dpdGNoIGNhc2UgPw0KPiANCj4gICAgICAgICBzd2l0Y2ggKGRldmFyY2ggJiBFVE1fREVWQVJD
SF9JRF9NQVNLKSB7DQo+ICAgICAgICAgY2FzZSBFVE1fREVWQVJDSF9FVE12NHhfQVJDSDoNCj4g
ICAgICAgICBjYXNlIEVUTV9ERVZBUkNIX0VURV9BUkNIOg0KPiAgICAgICAgICAgICAgICAgYnJl
YWs7DQo+ICAgICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgICAgICAgIHByX3dhcm5fb25jZSgi
VW5rbm93biBFVE0gYXJjaGl0ZWN0dXJlOiAleFxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkZXZhcmNoICYgRVRNX0RFVkFSQ0hfSURfTUFTSyk7DQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7DQo+ICAgICAgICAgfQ0KPiANCj4gU3V6dWtpDQo+IA0KPiA+ICsg
ICAgICAgICAgICAgcHJfd2Fybl9vbmNlKCJUUkNERVZBUkNIIGRvZXNuJ3QgbWF0Y2ggRVRNdjQm
RVRFDQo+ID4gYXJjaGl0ZWN0dXJlXG4iKTsNCj4gPiAgICAgICAgICAgICAgIHJldHVybiBmYWxz
ZTsNCj4gPiAgICAgICB9DQo+ID4gDQo+IA0KPiANCg==
