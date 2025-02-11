Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1236213240;
	Tue, 11 Feb 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278630; cv=fail; b=pP8u4MQ/q03h8F2buWNfyAMe5CTn0pFxlA0aHMFECk+jvP3w6v1beCxIlRrdi19JSxzLLkBlWHrXyAboPFhQ/cGt6FrHJ9nv7//l5Dfso7vaQRmtOCUen91Rpvi3iWISWbLChd+w/iEsw9YpliAIeETONsJ5wyRanj8EcvvIYJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278630; c=relaxed/simple;
	bh=mCfkHJhs0nnra8KAK2RGSILVOWiOCNRwyjVzaNEOi4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TibaySNYag/w/rigS5kYL5ruBPr3PgMFSynsmkeFPeDXwqPL+lVtaLdiLQdvZal73nyvOVsjnO7TJiuPdyksCieP/zWnVqfPgyw5AElV/hP2Uelq0w6ehcDZlUIfem0wnei1RRXypJJdbtfirVrHmjloHw8NvsG5gvfBopkWCGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TYVtMxtX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=wdxWQ+jo; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TYVtMxtX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="wdxWQ+jo"
X-UUID: ae4bb0fee87711efb8f9918b5fc74e19-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mCfkHJhs0nnra8KAK2RGSILVOWiOCNRwyjVzaNEOi4w=;
	b=TYVtMxtXXFh+K7cTLdWI2yQj90rsEG66QrsZwFByMchM1YkCbTpRbOLQxvt4AfeVNeHA9eLl0vnUgsmwhtz6+beMeyYHenjYsoSnzyBdYeyLjeGAmUruuEfPUbiJc4vIeZs3bg6Vks5zhXl7Al1c++pRerLlnH9O3Q9P/UClJY0=;
X-CID-CACHE: Type:Local,Time:202502112046+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1dcb3849-a843-48e7-892d-0a76f144a4d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d5da6a7f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: ae4bb0fee87711efb8f9918b5fc74e19-20250211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 982211490; Tue, 11 Feb 2025 20:56:59 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 20:56:58 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 20:56:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXwpzavH7Xe21g9+JOZDrVZGZ2y518Y2Fz2yxo1+f6McCzQBDb5u1c462EJs5F4vcIve/fUN0soH1ib57EqQLX0GotMAPAWeYtD0lAFiuA0lmD4M66jB2LAxIi72PRICdxIe32cFembL2y8q8MZjX1HDp/QS7QvQc6rjX7/XEmBkcnT9JCvDB2a0uVfTsVtFcL9p94cC+W5GiJRtjglf/HQ1uiaWQRR1GpTOu7Hi40ibaGd8KEDGiV/7uwnkYnlvlHEHj96Hfv6UCz223Xwf95FDxKDwg7cERT+IzlPtqHLGcAfNzapXf8JCprwy6EDKdyjtZKqABZecO6VkKZ/zmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCfkHJhs0nnra8KAK2RGSILVOWiOCNRwyjVzaNEOi4w=;
 b=PFMClai0zRO8sWyIz4ulPOHCMMyHL2pfv+EZJLd83d7bz5GC8yMGRuAC55r6W6ZjzweBUECpkdrLSuoTNf0/FnxTnMLnoKbdqf+eP4468u3ElmMeC4MTt1GeW/jqgathrFRtWRHnUmuX5NAm6npMuhCE5lmqhpQzWcGM1LL4C3WY+6kK+z5D38AvZ76JrQcQKjn+dGW8RzxnrdorTamJePL2qiak9VLHcdn1sC1AjD1EGnNt6Rc8ZTl/jr1YiKwWL/uO+ew3EhkjQA+CPzgqAGUJD0/WHP+GCQAdBw3ZR2x/9yRjP+EFGJQvWWOZ46BnhVGiO9+DybDFt0fbuP7V+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCfkHJhs0nnra8KAK2RGSILVOWiOCNRwyjVzaNEOi4w=;
 b=wdxWQ+joEGoEdsFB3/0PWgpNOQY2wexIrvoX/AYpAgV0m+5jUZf9H58VdfRrQCcMmhB+IqKDlYLPdcoxCKRz1ZZx6olWxAihZaM/3FnzIRpmUpMqV+GJ/HsQztS/xeOaakQJRthxrgylbnzcW1+wdECzKp33OlS7rjjvhnDTzEA=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 SEZPR03MB8268.apcprd03.prod.outlook.com (2603:1096:101:191::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Tue, 11 Feb 2025 12:56:55 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:56:55 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLicIEAgF//bwA=
Date: Tue, 11 Feb 2025 12:56:55 +0000
Message-ID: <8746bc17ef28da632e9ca765d2c3ce6bdc56c6f4.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
In-Reply-To: <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|SEZPR03MB8268:EE_
x-ms-office365-filtering-correlation-id: cb59e84e-d801-428f-fbb3-08dd4a9b901d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmpOU2JHamtJQlN5MmRKenNoeHRTL240QUtIS28rK1BvSWo1eTE4dGlCb2Zw?=
 =?utf-8?B?UmY0elFSYmc1MTVBeGlnQzY4MlgwTlBSaUFESTJ0NkFnRnBQSTRINlduTGM2?=
 =?utf-8?B?c2ZJUDZmMTd3RmJPUUdTU3ZialpnNkhSYy9ibGJCK2xWL2N6cDZ4a1ZlUzBS?=
 =?utf-8?B?QXBNVjhTVU5way8vYlpxNm1oa3JXdU1QRXNpZzh4elFhUFJSVHlQUDVoQ0tR?=
 =?utf-8?B?VEZrS0JFZnUvV01hU2c1eEVONCs4d3JZTFh3VG9JRi9ueThsOWRyQ2NCMm01?=
 =?utf-8?B?cldqTzdiTjNpRmwwYUlYT3VQZldkZEZ4dk1tOFNTVDNPRFQ3VE9nZlBVUkVL?=
 =?utf-8?B?dk1EUUsrOEkxOURRRW1oS1RzNmlMYTFKVHllenhpa1hUMUZnRXk0OEhHUTI5?=
 =?utf-8?B?dWdBdWZXd2pnZUlGWjdlNSsxN1dTRDkrQTF4V2xDUDZjR1I4ck1NVEY5QS93?=
 =?utf-8?B?ZkJIYTRsVUhuVFJnOGhHdFM2UFNyQjhSeGVhUnNHVXQwR2wzeGROaGtRZXdB?=
 =?utf-8?B?VWdlbWszdFJlRStRbE9XbWZiVGtTTU15aWxmeVphSWNuU3RKMGVYRFlmbktn?=
 =?utf-8?B?Z0xLSThTTVp2bjMyUEZBeko2OTYyaGJ6MFNOSEhCK1ROamV3NC9FWS84WE8y?=
 =?utf-8?B?bFdXUDkvdHA4YmpEUHVPYkpRLzNqRDlORlBYbmQ1WHMvbklzSjhwbmE0ZlJO?=
 =?utf-8?B?ejVKTmE3Z2FVVm5XcEJxQUJlTDRzREdFMzNIdVJTZk51cnF3NW53UkhuMFF5?=
 =?utf-8?B?WkM1RSsva0Q2ZXJTRktjREZDNVp1SUdxdHdFMVdvTCtHRFhvckl5NStqaEgy?=
 =?utf-8?B?aHdDYU5UYjNEN1RtK3pHQVlCclpKRk5scGlRTEY1VGRhQ0hZcUVCSFZwS0dv?=
 =?utf-8?B?MlI3NjFaN2JJZmw1QnJSR09BRjdhTkJrcDRudURIOXB0ajZza28xZkxlRXFN?=
 =?utf-8?B?S2tlZ0ZESjRCU21PWU50aGdPOXpZL2tRM09CUnYyZzFmZ25kOGZHVkZRMTFT?=
 =?utf-8?B?ckNLYkV2bFVsZjJmTkxXem55NFpreUpxVnRJNlczd0IrTW1jckNnQ1dUbEla?=
 =?utf-8?B?VzBJKy9aQURaNzQwbnltN09sUnp4WkFsYjVYbXd2Wi9nVGxRS0YyUlpuQnlH?=
 =?utf-8?B?OGpIWVpjN1dXU2lHTUVqd1FoN3NjR0ZYOWdsT2VIT2FicklPTzNTT2JXODJJ?=
 =?utf-8?B?aEFnUmRoeXBBejRaRjVDWThCbE9iM1AwamZBNG43OFNJMFNZRlZ0N2hCcW4z?=
 =?utf-8?B?cmZraU1kb3pNSHhDd0hUZmIxVmJMK1FXa3FldXNqdnVRNWw4YW1Nd0txVVJp?=
 =?utf-8?B?MmhaWHVuLzQrQ2c5V1dHcXlCbmFZSytwcVR4OGhuRTVJL0ZtT3FKOGpWSnNT?=
 =?utf-8?B?UGVad09iMmNBYllkVXNLWHZLbnFSNk1wYzVDNktQdVd4cCtHVTkzQklrcWdC?=
 =?utf-8?B?R3JpQysvSStCWkVPZEZTSHBBQTZJWU1VOHFteU8vNDlkVmtOOS9UaHd1M2VE?=
 =?utf-8?B?MlJ5Mi9RZnZsSWxrOWZza3E2emYwTWV2aHNTdFBXUFRkaGF1R2srM1J5Kzhy?=
 =?utf-8?B?dHhPQ3RlMnBTN25yanM2UE9SUFVMUVBTb1BaSWtWOHBoMlJ2MWFRZTBrTkN3?=
 =?utf-8?B?b0tzaXV1eE9QQTErbGhIblNvL00zODhTbUhqREtBcjhLL2NMWHVGNzlkV2tO?=
 =?utf-8?B?eUNTaHlnelhpeXFVTEx5am9EeGcydElwampyM25ySGtXQTc0eUh5a2M5aHpL?=
 =?utf-8?B?ZGhHVlFidllaYWhJYkFvV0plTVVWOUg3aWNIMzRBVkRYSEE3aUpEbytycWI0?=
 =?utf-8?B?Z3BydDFlQU5tUHdRSHNuQ2VvMkhYK2pkYlZkREt2ekFIM2NiVW9FemhSUkk5?=
 =?utf-8?B?bkJoYitmV1kwKzNxN1VYSTQyWHlRL3JWMkZldDIzOENNMkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHEraE1nN1NvMFQyclhNQmlaSTFpUXlaWGFsRTRqN1RqWUtBZnNrUzZVTUpl?=
 =?utf-8?B?Z3owZ2JxVkMxZFVoT21qMHE2ZElDRm0xNlQ1NHVLdzBiK0RING1DTDk3Ym5L?=
 =?utf-8?B?Z2oydGhRTFBkMjY4dWdCZDhBR2NsVUpnZ2ZqUkdxU1JEeTJSMFhNUmk3ayti?=
 =?utf-8?B?K1dobzljTlQ5ZW1DMUgwOG1tRk5vQVpVM21qVWt1K2tWNThJYXR3VysxSEI2?=
 =?utf-8?B?aCtQaFl0aTh6aEpPNnZRVEVwaFpSRVM0VFcxa1NYbFFHZ2NWeUQ1VW9Wa2E4?=
 =?utf-8?B?Mkx5MWhsTzJ3eDNXSWZkbWczbFR1bDRmZFI1dDI4a1Z0UDZmZWRxT1UwQ2J5?=
 =?utf-8?B?dVlGZFU2NnB3bU5vRnRFUE92OC9KVFdzREk0Zm9wbVBDQzc1SERZU2ZDYkNV?=
 =?utf-8?B?dm5uR3gwdnR5QUpJWk5SUjRDRzRvYkI0a2hLYU9RVUxtaWlzd0dIWkFuRkw5?=
 =?utf-8?B?anJueE1JU1l2cmprbTNBemRwUysrVC9zekpOSWhCUDVLZjRhdUNnQmJXS2FK?=
 =?utf-8?B?ZW53aGJWanNpVGVEczMzVllvckI5MTVFR05OWjJ1UmF5VzcyQkYxdVYzalRh?=
 =?utf-8?B?ckYxeGs2d1o4UytoZnBzNk9sWEd0K1gvLzRiS2tvUDRUbTg5SmRQdUZaOXYv?=
 =?utf-8?B?UHNsZkRGVE9SY01ZeEtmTmIrSUgrRGdLSEh2VzhBc0pFUFBvWHhJN1p0ZS8w?=
 =?utf-8?B?TFRWU1g4a3VXL2lyQ1hDWjNabVNMdng1UkVpZTQ4b3BnSDdHWEN0U2ppS2NY?=
 =?utf-8?B?QUNzZTltMEVKUFNiS3hVR1d1cTZXM1JYVm5HL0ZEbnI1WXorUDFESjhWaGgv?=
 =?utf-8?B?TFhVbWZ5aXFFUUo5WXdvSklqMitSWDJ3YkphR1ZuOUhITERVby96cFFkdUln?=
 =?utf-8?B?Z2JqRkV6WWd5UjJ2d2U1T3EybzdwR1E0V3dOV29uVTVvV0FhQU5yOVNBUlg1?=
 =?utf-8?B?NFlta0VMTlhmTTRYYnhHdi9DbUZsTkwxcUVHNjByS0Q1N0VQWmpRWTE5eFRx?=
 =?utf-8?B?UWtaWkZrcnhkVXNZTFFnMFdHWmFTSjg5Rk00ZGZ4QnhqWnQ2cDBCOTBjQWEx?=
 =?utf-8?B?RHRYSFdEa1l6ZVYya2xvcHViZnNGMVFURnBRV1RTTHN0aHNzbEZtdkN0MFZs?=
 =?utf-8?B?aUltQmVLcHdRSTZZK210RjRyVEl4QnE2L3cyeUcwZzlKVkl1dU5lSnFhS0N0?=
 =?utf-8?B?NVhtN1lKK0hodnZQVlRxTTNwQ0ZKNjEzOXMya0ZyZU1STm1qNld2RHR3UkVD?=
 =?utf-8?B?RHhLMXkxTURyRkRUT3RITmY0ZG9OeTFBdnV4MC91WGFQOHJTNjlncEF2NDYz?=
 =?utf-8?B?WC9RODZrd3FSWWVMa1YvS3RBcTBGL0VsTVN4MWxHL21ETlJvL1E0UGN0ZWd6?=
 =?utf-8?B?MG9LbmhXSlphYzhKOE10Mnh2VHEzZFREV1hiSzF4citZbm41eXphREtRa2Ra?=
 =?utf-8?B?aGtTTGozK2t3ZElXdzErSkFWbkJFSXZmYTBFV1dvc0ZuMTY5enFOa3RRbHlk?=
 =?utf-8?B?UTlMaThQQXhMQ0V6bDhsaDYxamVVR1dGWnNVOC9HbVg0UXNWSG1HY2E4MlVQ?=
 =?utf-8?B?NEVyTzArTVIrTWJFaUhuZElVMUhEelZxQzNSOCtZTFJKeUtKUWhQVWN1cVF4?=
 =?utf-8?B?UnBLekoyd3dvdkMrdTBwaEthS2JhZzJHWnBJYmJHM3ZLaDV0bkRYVnNHQXRk?=
 =?utf-8?B?T05VbVVsK05vaXk3aWhRTmxteWtkbEs4cUFydHQ3aytwQzZNMyt4M3pwQU53?=
 =?utf-8?B?YWtkaWtqUDFKUDdxdERlTjVEYUpFYXFiQ0w4Z2k2eDErZExRNVlJWXRzYUJa?=
 =?utf-8?B?ME00T1JjWEcxRWpReDZ2Ty9iMlRseElpbXc0cTJQWXZ0a1FBcTZzY255MEo5?=
 =?utf-8?B?b0w2VEgyeDRsVDBKUmhRa25QT3FjcEVIVXkwVDVYMHliNEdaaVBhZ2ZJZ0FE?=
 =?utf-8?B?cWY1bVJtaUFPenpRajVFdmxiQktkTkJuWkFJUFRleWdXbnVLTUlVcUJUL3Nq?=
 =?utf-8?B?RFFRblIxZzg1L1BRTEQ0blNDQm91N1VmSEI3Z3J5QW5zaWpVQWl3YWsxQXBn?=
 =?utf-8?B?M3JISVd2YUNGclNOcVBXeUw1ZUoyWjVKQU0vYW9OdnNUUXI2cXd6NXpFUlo0?=
 =?utf-8?B?NzFXMjA0WHErV3VXSGJHemc4VDZPS2MzNTFhbW80dzllRDBjckJrN1F0VnJ0?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84BF4B0FBB572C4CA2FEDDEF09782831@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb59e84e-d801-428f-fbb3-08dd4a9b901d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 12:56:55.4202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zt+WwVwOO3qSMLOlfc9mDRNJTJtbW3maGoE2jf8XXhbG+qr1JdDRC/xmqUk6Q7EyB8J2cqQ5ekfM1Rn/ZQGz1FAr49D738+B2XT9NWsSq0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8268

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDExOjU4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiA+IA0KDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gT24gMTIvMTIvMjAyNCAwOTo1OSwgQ3J5c3Rh
bCBHdW8gd3JvdGU6DQo+ID4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3IgbWVkaWF0ZWsgY29t
bW9uLWRyYW1jIGRyaXZlci4NCj4gPiANCj4gPiBUaGUgRFJBTSBjb250cm9sbGVyIG9mIE1lZGlh
VGVrIFNvQyBwcm92aWRlcyBhbiBpbnRlcmZhY2UgdG8NCj4gPiBnZXQgdGhlIGN1cnJlbnQgZGF0
YSByYXRlIG9mIERSQU0uDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gQSBuaXQsIHN1YmplY3Q6IGRy
b3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiZHQtYmluZGluZ3MiLiBUaGUNCj4gImR0LWJpbmRp
bmdzIiBwcmVmaXggaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLg0K
PiBTZWUgYWxzbzoNCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0KkwxOF9fO0l3ISFDVFJOS0E5d01n
MEFSYnchbXp0WWZOM242X0lBeDc4UzQ0UEZPZXRRUzUxLWg2b2JtMkhIcmpFVlJJLUhKWXl6SjJW
V2JiaWsycm4zcHlic3NVQk9UNGdwNURNN01XRHgkDQo+IA0KDQpPa2F5LCByZW1vdmUgdGhlIHJl
ZHVuZGFudCAiZHQtYmluZGluZ3MiLCBjaGFuZ2UgdGhlIHN1YmplY3QgdG8gImR0LQ0KYmluZGlu
Z3M6IG1lbW9yeS1jb250cm9sbGVyczogQWRkIE1lZGlhVGVrIERSQU0gY29udHJvbGxlciBpbnRl
cmZhY2UiDQoNCg0KPiA+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0Bt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tZWRpYXRlayxjb21tb24tZHJhbWMueWFt
bCAgICAgICAgICAgICAgICB8IDEyOQ0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMv
bWVkaWF0ZWssY29tbW9uLWRyYW1jLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRp
YXRlayxjb21tb24tZHJhbWMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFt
bA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jOWU2
MDhjN2YxODMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24t
ZHJhbWMueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTI5IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UNCj4gPiArIyBDb3B5cmlnaHQg
KGMpIDIwMjQgTWVkaWFUZWsgSW5jLg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRp
ZDogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbCpf
XztJdyEhQ1RSTktBOXdNZzBBUmJ3IW16dFlmTjNuNl9JQXg3OFM0NFBGT2V0UVM1MS1oNm9ibTJI
SHJqRVZSSS1ISll5ekoyVldiYmlrMnJuM3B5YnNzVUJPVDRncDVHRDUtTWdrJA0KPiA+ICskc2No
ZW1hOiANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFtenRZZk4z
bjZfSUF4NzhTNDRQRk9ldFFTNTEtaDZvYm0ySEhyakVWUkktSEpZeXpKMlZXYmJpazJybjNweWJz
c1VCT1Q0Z3A1QUdFNUVjaSQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBDb21tb24gRFJB
TUMgKERSQU0gQ29udHJvbGxlcikNCj4gDQo+IENvbW1vbj8gSXMgdGhpcyBhIHJlYWwgdGhpbmc/
IFBsZWFzZSBkZXNjcmliZSB0aGUgaGFyZHdhcmUuDQo+IA0KDQpTb3JyeSwgbXkgb3JpZ2luYWwg
ZGVzY3JpcHRpb24gd2FzIG5vdCBhY2N1cmF0ZS4gSXQgaGFzIGJlZW4gY2hhbmdlZA0KdG86DQoN
ClRpdGxlOiBNZWRpYVRlayBEUkFNIENvbnRyb2xsZXIgKERSQU1DKQ0KDQo+ID4gKw0KPiA+ICtt
YWludGFpbmVyczoNCj4gPiArICAtIENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5j
b20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiANCj4gRG8gbm90IG5lZWQgJ3wnIHVu
bGVzcyB5b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3JtYXR0aW5nLg0KPiANCg0KT2theSwgcmVtb3Zl
IGl0IGluIHYyLg0KDQo+ID4gKyAgVGhlIERSQU0gY29udHJvbGxlciBvZiBNZWRpYVRlayBTb0Mg
cHJvdmlkZXMgYW4gaW50ZXJmYWNlIHRvDQo+ID4gKyAgZ2V0IHRoZSBjdXJyZW50IGRhdGEgcmF0
ZSBvZiBEUkFNLg0KPiANCj4gU28gbm90IGNvbW1vbiBoZXJlPw0KDQpTb3JyeSwgbXkgb3JpZ2lu
YWwgdGl0bGUgZGVzY3JpcHRpb24gd2FzIG5vdCBhY2N1cmF0ZS4NCg0KPiANCj4gPiArDQo+ID4g
K3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBtZWRpYXRl
ayxjb21tb24tZHJhbWMNCj4gDQo+IFRoaXMgaGFzIHRvIGJlIFNvQy4NCj4gDQoNCkNoYW5nZSB0
byAibWVkaWF0ZWssbXQ4MTk2LWRyYW1jIg0KDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAg
IG1pbkl0ZW1zOiA5DQo+IA0KPiBXaHkgdGhpcyBpcyBmbGV4aWJsZT8NCj4gDQpUaGUgb3JpZ2lu
YWwgaW1wbGVtZW50YXRpb24gd2FzIGluY29ycmVjdCBhbmQgaGFzIGJlZW4gY29ycmVjdGVkIGlu
IHYyDQp0bzoNCg0KICByZWc6DQogICAgaXRlbXM6DQogICAgICAtIGRlc2NyaXB0aW9uOiBhbmFw
aHkgcmVnaXN0ZXJzDQogICAgICAtIGRlc2NyaXB0aW9uOiBkZHJwaHkgcmVnaXN0ZXJzDQoNCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19BT19DSEFfQkFT
RQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19BT19DSEJfQkFTRQ0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19BT19DSENfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBEUkFNQ19BT19DSERfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19O
QU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfTkFPX0NIQl9CQVNF
DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IERSQU1DX05BT19DSENfQkFTRQ0KPiA+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19OQU9fQ0hEX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogRERSUEhZX0FPX0NIQV9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBI
WV9BT19DSEJfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBERFJQSFlfQU9fQ0hDX0JB
U0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX0FPX0NIRF9CQVNFDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9OQU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogRERSUEhZX05BT19DSEJfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBE
RFJQSFlfTkFPX0NIQ19CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9OQU9f
Q0hEX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogU0xFRVBfQkFTRQ0KPiANCj4gRG9u
J3QgdXNlIHNvbWUgZGVmaW5lcy4gTG9vayBhdCBvdGhlciBiaW5kaW5ncyBob3cgdGhleSBkZXNj
cmliZQ0KPiBpdGVtcy4NCj4gDQoNClRoaXMgcGFydCBoYXMgYmVlbiB1cGRhdGVkIGluIHYyIHRv
Og0KDQogIHJlZzoNCiAgICBpdGVtczoNCiAgICAgIC0gZGVzY3JpcHRpb246IGFuYXBoeSByZWdp
c3RlcnMNCiAgICAgIC0gZGVzY3JpcHRpb246IGRkcnBoeSByZWdpc3RlcnMNCg0KPiA+ICsNCj4g
PiArICBzdXBwb3J0LWNoLWNudDoNCj4gDQo+IE5vcGUNCg0KT2theSwgcmVtb3ZlIHRoaXMgcHJv
cGVydHkuDQoNCj4gDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBmbWV0ZXIt
dmVyc2lvbjoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4g
PiArICAgICAgRm1ldGVyIHZlcnNpb24gZm9yIGNhbGN1bGF0aW5nIGRyYW0gZGF0YSByYXRlDQo+
ID4gKw0KPiA+ICsgIGNyeXN0YWwtZnJlcToNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAg
ICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgUmVmZXJlbmNlIGNsb2NrIHJhdGUgaW4gTUh6DQo+
ID4gKw0KPiA+ICsgIHNodS1vZjoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsg
IHBsbC1pZDogdHJ1ZQ0KPiA+ICsgIHNodS1sdjogdHJ1ZQ0KPiA+ICsgIHNkbXBjdzogdHJ1ZQ0K
PiA+ICsgIHBvc2RpdjogdHJ1ZQ0KPiA+ICsgIGZia3NlbDogdHJ1ZQ0KPiA+ICsgIGRxc29wZW46
IHRydWUNCj4gPiArICBhc3luYy1jYTogdHJ1ZQ0KPiA+ICsgIGRxLXNlci1tb2RlOiB0cnVlDQo+
IA0KPiANCj4gVGhpcyBiaW5kaW5nIGlzIHRlcnJpYmxlLiBXYXMgbm90IHRlc3RlZCBhbmQgZG9l
cyBub3QgZm9sbG93IGFueQ0KPiBndWlkZWxpbmVzLiBQbGVhc2UgcmVhZCBleGFtcGxlIHNjaGVt
YSBhbmQgd3JpdGluZyBiaW5kaW5ncyBkb2N1bWVudC4NCj4gWW91IGNhbiBhbHNvIHJlYWQgc2xp
ZGVzIGZyb20gbXkgdGFsa3MuLi4NCj4gDQo+IA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4g
KyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIHN1cHBvcnQtY2gtY250DQo+
ID4gKyAgLSBmbWV0ZXItdmVyc2lvbg0KPiA+ICsgIC0gY3J5c3RhbC1mcmVxDQo+ID4gKyAgLSBw
bGwtaWQNCj4gPiArICAtIHNodS1sdg0KPiA+ICsgIC0gc2h1LW9mDQo+ID4gKyAgLSBzZG1wY3cN
Cj4gPiArICAtIHBvc2Rpdg0KPiA+ICsgIC0gZmJrc2VsDQo+ID4gKyAgLSBkcXNvcGVuDQo+ID4g
KyAgLSBhc3luYy1jYQ0KPiA+ICsgIC0gZHEtc2VyLW1vZGUNCj4gPiArDQo+ID4gK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+
ID4gKyAgICBzb2Mgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsg
ICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ICsNCj4gPiArICAgICAgICBkcmFtYzogZHJh
bWNAMTAyMzAwMDAgew0KPiANCj4gbWVtb3J5LWNvbnRyb2xsZXJADQo+IGFuZCBkcm9wIHVudXNl
ZCBsYWJlbC4NCg0KT2theSwgdGhhbmtzLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0
b2YNCg==
