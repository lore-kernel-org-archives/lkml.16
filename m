Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813E25A620;
	Wed,  9 Apr 2025 08:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185816; cv=fail; b=D8N37gcU70HuyuJewIazLsUmVdi7wQ5coxYR1lQL67zEwvsb1U5qE89sgAHM8rwCneTAbwIGmhc1ylC3F2ZYSw9B9HjKB0KMDqBT5u1F4VIWXxw40EkriCubUbk3Kdxj9Aqe3cVpcYYj3CVCgfCrhpCYk/V+9o2V9FXR9MzgvGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185816; c=relaxed/simple;
	bh=1dXWSMYdtJZPkwanv0aC+QxS4smP0GYnSlAMGimFqsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LyV0mdNml7VjgrX5u8hFWS2qC8YMsMQ1ZJ1W4of2+JItrSIbE3cdSz8dx2GqeQPm+Kt9vmSzTdxeP3Mo/sNQSExmXbSICfr1wAYDAL8hqLHUE1baialufHynCU9WdkrHSaBUhlXvm1wsYa0JtNmJhqRpV6kCcXhSo5bTynwvBtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c1PNL7/b; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=GZacKU3M; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c1PNL7/b";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="GZacKU3M"
X-UUID: 2056aef6151911f0aae1fd9735fae912-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1dXWSMYdtJZPkwanv0aC+QxS4smP0GYnSlAMGimFqsg=;
	b=c1PNL7/bwfm8+U6aOdFnIhs7R6h495NKqAk9+bZMWJ4hhtIe/5UcVWfCA8PVuZUsPnIMTu9nCINLaf6J8CkzzmWHG0jC3AUmS6jOZmYuWYoTbxruYjXUkuAmyhcXvGG1rQUiqc93cixO+385iO7tn+HOm+EAHyxhxiPigle13RI=;
X-CID-CACHE: Type:Local,Time:202504091516+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:65de34f1-787d-441e-ad65-d276d15684c5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3c4b648d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2056aef6151911f0aae1fd9735fae912-20250409
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2136386594; Wed, 09 Apr 2025 16:03:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 16:03:29 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 16:03:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht9NYEgSuA8GXNvyH4XrOFrKqe0i0+JDS/LFpGEjKlENEufxhDfyNsFsnj8l09WUsXObPu/ENpEH15vFATVcEqH+JVw1LKhCb3d6avWn6XGQFXR/PaJaPeINFimhZQWun9cF//NBSde8uI6mnsqX2Rx0rtvo7RxhcMmc4dPCOgyTnqnrDBjx8KQDcaKbZjpqVOEkCEXLKr+dVCwdFy5KTA1viK+LDwvqyiZAbE++KhrLcWsOltKkN7yiSNokskndrPEcTvDLaCUdiCbN7d6iBoBzI2ZY4UxHe8qYAbMUfHOqTiBJ09OnMdIak1TiJuX9+ri3Q93X3cCCylT9DhY7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dXWSMYdtJZPkwanv0aC+QxS4smP0GYnSlAMGimFqsg=;
 b=eeSlxVwZL2FWbISUpILhtbWm04bgV2n8ePZn4mGERuEkdkLjOzgSpg8X7BKJygXWRifU+xfLDx11lVIjtgDl2sA/5d6KaIYOerGJfltz0IIM8eSQcqi0d89EhJsje2rILPvoksaJC+IyXam6+bph8Dl7KtXy1KeuslGDUP+oyxm0MtUhT8TONao0AOvL6UCGL66XmimP5SatXqyoySNQXytks3WP+TXHe80wlcqWxfGFMkeLJVMnwosnOnuRCJAroIF/IZN7XRfCrGlV1tsODvF6lDUKcZFAREGOcbIMkOQ0+qd8wklSQkiXyjDgz+IzrDupSQSmEtzadrz5xafdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dXWSMYdtJZPkwanv0aC+QxS4smP0GYnSlAMGimFqsg=;
 b=GZacKU3MVdSgvrPuXWp5BUbdDbB4m9w9oMGfsog0fL1Q9wnBuWoYkuKiEYbXgRGwlWdyZ4s26teTnmdROZKCMbgnmY51MlcGnd310rEJ7YJeI2ZO8nFESGCoRpfDFKDp7ceB8QM1J2quUIYRLmiVLAZJeoAwx39F4U5e6TlcckQ=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 KL1PR03MB8401.apcprd03.prod.outlook.com (2603:1096:820:130::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Wed, 9 Apr 2025 08:03:27 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 08:03:26 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Topic: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek
 DRAM controller interface
Thread-Index: AQHbpGS5A49KSjUl2EqLUA5Bd0u2JbOWl/GAgARdzwCAAATigIAACFGA
Date: Wed, 9 Apr 2025 08:03:26 +0000
Message-ID: <44997c3300ee215f05e05443a32c5ba85cbec972.camel@mediatek.com>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
	 <20250403065030.22761-2-crystal.guo@mediatek.com>
	 <20250406-hasty-saffron-flamingo-5c1dae@shite>
	 <bf1f44c34097d090894303cf6e3a9f017f4d5b38.camel@mediatek.com>
	 <f26c71f4-3a17-4335-943c-90e3671c9266@kernel.org>
In-Reply-To: <f26c71f4-3a17-4335-943c-90e3671c9266@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|KL1PR03MB8401:EE_
x-ms-office365-filtering-correlation-id: 18ba6d75-ffc8-4a52-0d26-08dd773d01ca
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MHlTaE5Hb0oxY0l4U0w0RkV0cXRQK0pOZ1UvSTliMm1LWTlocWltMlArVklt?=
 =?utf-8?B?Vjk4VG9JblZEbG9hdDYxekRlN1V0dWlrdXpWYkhLdElWcGNNVnlWZEN0aU1J?=
 =?utf-8?B?SkRub2RUeDZPalQ1blQrMDFLNHB3OHVweTJ2aVJhYVA3dFczc0ROeVhvWEhJ?=
 =?utf-8?B?dk9TazVFY1dnelE0eDNlcnhUWkxEeUlicHJMQXkya0NzZXdDby9yRnJUOENC?=
 =?utf-8?B?REtGTmFzaG9GcnIralZwS0JoMDdCcFFJaENod2FZVXhCRFUxaTFNajNqVmpJ?=
 =?utf-8?B?SXA2Z1djQnkzTFNyQTc2anRna2diRWZ1aEczOFdidDg3K0FXeVlYK2RRRVZn?=
 =?utf-8?B?S3dzb2NUWEEwalJFeHV2TE8xRlNycnZxL1h2VHR6NjIxL0pyaFpFbys3ZHNO?=
 =?utf-8?B?WTZLUjMrUUgwVXlIaXNtUHRWZUp1L1FUVVJoek80VkVHbkpIVGliVW91eVhx?=
 =?utf-8?B?WFdWdmM3U2dvNGJjSmVPdnM0N1lXNUVERjZVR0wvUXJTZ1JOWmtQS0lkK2Ix?=
 =?utf-8?B?dk9IQzZCSndhdHc3ZEd3R0xmUFJCZ25kT1B4dmRvdW9vN1RCRHhSTkJjOEg2?=
 =?utf-8?B?SDNsMVRSblQ0dFY5VWk1TnU4YkhBWFg4NVJUMUZxN3YrSVZNa0dMWklnQU5U?=
 =?utf-8?B?dFJxUG1KZ2N4cHJmYldNMjRsOHRRWDZhdklPV3drNEQvQ081RTQ1UVVxZldw?=
 =?utf-8?B?VDk1emtZSmhhckVaU2VDQVkwd2srbUtwL0JTQ3d3bTU0KzdlbXJrdlJjK2Y5?=
 =?utf-8?B?cEp5L01jNFU0UVozbTZDb203NmYvaWlYSVhPaG04NXo0MlRad3BMdmw1ZFVj?=
 =?utf-8?B?UUNBbVVxajdiMmh3NXMxaTVFRWNuNGxibEc1cUt5YWRkQ1FPbWRFTi9SQkFF?=
 =?utf-8?B?UDNvU2VoQTNhbEtzaFJOL3ZIUnhsc1laZ1djcGVXVnFBZ3FaTEJxcVJ4ZkU2?=
 =?utf-8?B?TnlLQ0U1Wm9NbXUrcnRMNmMvdHFSekJGYnVrakc3RU8wZEM5TmZ1NFRMTmho?=
 =?utf-8?B?QlhaVlFpK0wvc1crQkdYaGwzOE1ZUTBxOFYxVWRQN09qbThiV09vVEI1Z0NN?=
 =?utf-8?B?RWd6TnRROHN0ZHd0Z3ZvRGdGVE90bWt5RURIeFJKZTBFcWFldEt1cDR2N1Zh?=
 =?utf-8?B?Z2NESmRRcTFzRkpWaVh5TDBUaW5RWXJJL1lvR2tPc1FmamhGTkVKZFY2MEM1?=
 =?utf-8?B?Ti9vMHQwcm9XUkNVZk8xUnBmNjBmbEtCVkhXbVVGN3UxNDdyVm9RNVZrSzJP?=
 =?utf-8?B?SCtObFhjSWE1QzBVUHM3NS9YSGMwUzQyazUvNUxPTE9USHZJT080RzRGR1J5?=
 =?utf-8?B?NVZ1S0JtQUY0NXM0b21MU2hQYzRIb3dHYUZrQUZReXFBWUhMZjk5U1B6b1hK?=
 =?utf-8?B?bVZMT09MRFIzTEpTZVFKcDRmcVo1WmZtNU1VbWZqckRkMFA0RnNzSE4wZktQ?=
 =?utf-8?B?K0lyTUNoazU0aGJ6RjduNVM5M3ozcU5Bem95cFRLdzJhVEI4aGI3anEzS3Jv?=
 =?utf-8?B?dXp1SVZZUDZYNGU5Zkt2ODB0S1E1YkQ4YWxBbEtLVytybmgxVTNXTko5RnlS?=
 =?utf-8?B?cUFpUWt0VTAxeEFPdGxmOXdLUXFsQW5nVnVaZzBvMndzcWpXVjJiUERLa2F6?=
 =?utf-8?B?M3NXZjMwZGo4N0VwM3JuZkIvNENSVVJDYWgzZlNHc05Id2JEWUx5S0tmSFBF?=
 =?utf-8?B?WGNaYll6TkxXZzA4ai9nRG93cXdCN0lzUnM0ZnZqbnljSmdqa0tYQ01jOXg3?=
 =?utf-8?B?T1pGdm9tZjlKc0U3d1JENVphMG5uZU91ZC9TbFVQRVlucnNDLzFUTGZVZkJM?=
 =?utf-8?B?UG1jYUsza0pTU1grM2VuOTdlSDFjREFIT1ZSQjhKU1BpVkMrOVIzUWd6UDBN?=
 =?utf-8?B?UGQzWktXTE9ORFppZjFaMHJkTC9vaHcyWjNPZi9Pcko2dlVqWGJKRmFXU1I1?=
 =?utf-8?B?WnBTQUNGcXFLZklNQi9Ma3prdzVyK251b2JmQ2dPZDhVSCtNMXhrQnVzRHgx?=
 =?utf-8?B?a05YMWFROUV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clhJOHRVbGg2dGI1UFFSQmdESjFzY3BEQVJDTG5mcE9IM2RNQnQxY0hzYjN5?=
 =?utf-8?B?elZoSFBxc2JuK2E1M2dMYlc3MC80ZUVHR1N5bnFKRHA4NE1yV0dLN2t5Qk5Y?=
 =?utf-8?B?VWQzdk9WRlREbW1nMmhUTXdnWnZDb1BQbldveGxFWnB0SXBmQ21ZYml1MHN5?=
 =?utf-8?B?dFhaRml3Wmt0a2tCYTQzeGc1a2NsY3hISlVqcnNXajJMdXZvVFBxVkp5RnNB?=
 =?utf-8?B?YW4wUzh5VExiY2cvQzcxSC9HQnc2dmFHTDBnQ293NE8zZzE3RzEreWJtSWM0?=
 =?utf-8?B?MlVWNVd2dW9nSmpyMWdrQWU3eGVidkVoanZWMUJJUWpCMGtUbWhtL0VmZ282?=
 =?utf-8?B?OGhXejFyVi9ZWlVwbllQRnpabU5uNGNYaTh4dDI3RnBibDJoVS9BTEYrQ0xP?=
 =?utf-8?B?YXU0eHVKM3gzOVQ3d05EUDVTUm1oTHdpRHAxSm5CLzlBU2J4Q2JNQTFXaStw?=
 =?utf-8?B?VTdvZVVUOTRjaytaLzZrU1J0NUFJS0ZMSVRZL3Iya0Rmd09rRDJCR00xNDFM?=
 =?utf-8?B?MDZYMmdSRng4UllZUUtlUEk1RFFjdXZiZ1dYMWpEUDdKZUR3anVPTTFiak1v?=
 =?utf-8?B?bXpreTNjRHEybnNqQ2Nlejdpcjhua3VrY3hJOVdNZGRNRFRNNGYvSGJjcmdP?=
 =?utf-8?B?UEpZejdqZy91WThFa21ORG11em5JYUZRSmZvK0h2VzV6RjhhNktrME9Cbk9H?=
 =?utf-8?B?aWJFOHFFNVNHRGJpQlFHMG55Zlo4bkZWWkhoenVKQU41NjdSWXNFQmYrY2dq?=
 =?utf-8?B?WUFna2QwQ2c3QnRrajF5bzlvdzViQXNZenF2MTI0MWRjMDV6aC9rVVE2QmZU?=
 =?utf-8?B?a2pMdDJhNkZ0L3g0TTYrdklZN0R5UFBSZjhyeWlINWVxYy82N055YnplNGxt?=
 =?utf-8?B?emxROXRiWWp1S2hMTEk5djRKMVpjbXNaQWwxVDh6ZVhIcTJ0YzZ0M2dJSkxN?=
 =?utf-8?B?WEdwOERuemczRWJmZHdYQTN0NUY2L2V2WG81d0xRUHk1KzVQVUl4cWVzbktY?=
 =?utf-8?B?eml3cmdCbnMyMzdBWHlXOEtrMFRLVGxWcm96N0o2MWRSc2xRaXhZcE5KUDYz?=
 =?utf-8?B?enQwV05oemJlY2lldEcvNDl1dHY5eUUyeUl2WGtCZ094TVlMYVdJc2RuQUc1?=
 =?utf-8?B?eWROUWgvbHZOenRQZzdvOWpUeDU3dkRIOW9VNUJmaWpPOTN1Vk8zbzdzMWI1?=
 =?utf-8?B?VTR3OW5jR0JkcnR2M0JwSkM0VnBsblBVYlhVb28yN3RXUU0zLytGVjZlYjNU?=
 =?utf-8?B?Q3pIWGd5UnFmMWJsbGdKVitBU3RJWHdCOUVVZjYyMU5qVE5LcWoyZzd4UHE2?=
 =?utf-8?B?Skk0cWhJMUxmK3BMQUdlK3Yxd2I3Vk43Ujk3SGs4elJWSk9mekRIeEFQR3lI?=
 =?utf-8?B?YkxxbGhuM0dWRWM0aFpXTzRDWHZ1aG1laXFFclUxaytBN2taVmd0eW42cTFT?=
 =?utf-8?B?WXZVa3cyaDVBZEw2VnNhYS95UFJpQ1RwdUg0WmE3OUN2RUhOREgzSUM2Wm84?=
 =?utf-8?B?dDh4dGhDSlZCUEpVK2h3dk5lb2JPWTBhQ0pJSzlPcmlzRXkzN0RISSsvSVBa?=
 =?utf-8?B?aEl5VXpJU0kzKytXU2VQRDRHN1JKZXFOMEtDdy9qMEcxd2QxbEt6UWpRMFVz?=
 =?utf-8?B?QlRsdWZ0dWh6T3RzcWNDNHozUE0zLzhwc0lNcWFrdkpSRW0wc1lhSTN0MFF6?=
 =?utf-8?B?aEpqVE5NekI1QW9VL2ZQZXhkLzJQSkVFT2FTWVlzRFB6ZitUUW9Rc0VvZkpM?=
 =?utf-8?B?bE56SzZsaUVFYzJPeDhaVXRRc1pjYWgwbXRNSkN3MDZOT1lPeEFqclBSTU11?=
 =?utf-8?B?QTQydFc1T25JNGF4Y0FQOTZEbG5LWlh6VnhaNGhhRmhqZjhrY2lDcmhvNHIx?=
 =?utf-8?B?QTAvZm9vNStQbVNGNGdSWGNEc3Rvd1hBb2xTQ3Zock1uRlBHcms5ZUd0OHJl?=
 =?utf-8?B?Q1p1OHFlcFFKRjViSnlaSFB6am0ydVptRUtMUWgvZTVOUVE5b1VRcjNQZERB?=
 =?utf-8?B?UU9vZHVOQUpha0VDQy9sU3FLWmZtQUF3R3BOU1hjczRtK1dSbjVHM2pYNVRL?=
 =?utf-8?B?RE1EWkpLRHliUG9kcWtLVENHN2FubUNVQlNaTXhHRXU1K0lvMnZldkFUOGk4?=
 =?utf-8?B?THNNTGQxZDJDclpWdk85R2QvQzYrWDk2SjdNa1ZPRTF4NzRRak9QemlhZnRa?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACB713A0CED4F341ABE225F3AA6F98CF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ba6d75-ffc8-4a52-0d26-08dd773d01ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 08:03:26.2765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: griCoR8xCn1rgifjSPjEr1OWIut1wjW18JPmIkOpidDbXHf5XusQ3F89DJlMT5/SGzrH3TmDX9959XjYuEEvz/wbKNEc7ESi0hwTKD8/csY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8401

T24gV2VkLCAyMDI1LTA0LTA5IGF0IDA5OjMzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA5LzA0LzIwMjUgMDk6MTYsIENyeXN0YWwgR3VvICjp
g63mmbYpIHdyb3RlOg0KPiA+IE9uIFN1biwgMjAyNS0wNC0wNiBhdCAxNDozNSArMDIwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4g
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+
ID4gDQo+ID4gPiBPbiBUaHUsIEFwciAwMywgMjAyNSBhdCAwMjo0ODo0N1BNIEdNVCwgQ3J5c3Rh
bCBHdW8gd3JvdGU6DQo+ID4gPiA+ICttYWludGFpbmVyczoNCj4gPiA+ID4gKyAgLSBDcnlzdGFs
IEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiArDQo+ID4gPiA+ICtkZXNj
cmlwdGlvbjoNCj4gPiA+ID4gKyAgQSBNZWRpYVRlayBEUkFNIGNvbnRyb2xsZXIgaW50ZXJmYWNl
IHRvIHByb3ZpZGUgdGhlIGN1cnJlbnQNCj4gPiA+ID4gZGF0YQ0KPiA+ID4gPiByYXRlIG9mIERS
QU0uDQo+ID4gPiANCj4gPiA+IERSQU0gY29udHJvbGxlciBkb2VzIG5vdCBvZmZlciBzY2FsaW5n
PyBPciBQSFkvdGltaW5nDQo+ID4gPiBjb25maWd1cmF0aW9uPw0KPiA+ID4gVGhpcyBiaW5kaW5n
IGxvb2tzIHByZXR0eSBpbmNvbXBsZXRlLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIFBIWS90aW1p
bmcgY29uZmlndXJhdGlvbiBpcyBjb21wbGV0ZWQgZHVyaW5nIHRoZSBib290bG9hZGVyDQo+ID4g
c3RhZ2UuDQo+ID4gSW4gdGhlIGtlcm5lbCwgd2UgY3VycmVudGx5IG9ubHkgbmVlZCB0byBwcm92
aWRlIGFuIGludGVyZmFjZSB0bw0KPiA+IHJldHJpZXZlIHRoZSBjdXJyZW50IEREUiBkYXRhIHJh
dGUuDQo+IA0KPiBOb3QgcmVhbGx5LCB0aGF0J3Mgd2hhdCB5b3UgY3VycmVudGx5IHdhbnQgdG8g
ZG8gaW4ga2VybmVsLCBidXQgbm90DQo+IHdoYXQNCj4geW91IGZvciBleGFtcGxlIHdpbGwgd2Fu
dCBuZXh0IGRheXMuIEJpbmRpbmcgaXMgc3VwcG9zZWQgdG8gYmUNCj4gY29tcGxldGUsDQo+IHNv
IGlmIHlvdSBkbyBub3QgaGF2ZSBhbnkgc2NhbGluZy9pbnRlcmNvbm5lY3QgdGhlbiBleHRlbmQg
dGhlDQo+IGRlc2NyaXB0aW9uIG9mIGhhcmR3YXJlIGFuZCBleHBsYWluIHRoYXQgbWVtb3J5IGNv
bnRyb2xsZXIgaXMgbm9uDQo+IGNvbmZpZ3VyYWJsZSwgY2Fubm90IHNjYWxlIGFuZCBpdCBleHBv
c2VzIG9ubHkgcmVhZCBpbnRlcmZhY2UuIE9yDQo+IHNvbWV0aGluZyBzaW1pbGFyLg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KT2theSwgdGhlIGZvbGxvd2luZyBpbnN0cnVj
dGlvbnMgd2lsbCBiZSBhZGRlZCBpbiB0aGUgbmV4dCB2ZXJzaW9uOg0KJ0EgTWVkaWFUZWsgRFJB
TSBjb250cm9sbGVyIGludGVyZmFjZSB0aGF0IHByb3ZpZGVzIHRoZSBjdXJyZW50IGRhdGENCnJh
dGUgb2YgRFJBTS4NCg0KVGhpcyBjb250cm9sbGVyIGlzIGRlc2lnbmVkIHNvbGVseSB0byBwcm92
aWRlIGEgcmVhZCBpbnRlcmZhY2UgZm9yDQpyZXRyaWV2aW5nIHRoZSBERFIgZGF0YSByYXRlLiBJ
dCBkb2VzIG5vdCBzdXBwb3J0IHNjYWxpbmcgb3IgUEhZL3RpbWluZw0KY29uZmlndXJhdGlvbiBk
dXJpbmcgdGhlIGtlcm5lbCBzdGFnZSwgYXMgdGhlc2UgY29uZmlndXJhdGlvbnMgYXJlDQphbHJl
YWR5IGNvbXBsZXRlZCBkdXJpbmcgdGhlIGJvb3Rsb2FkZXIgc3RhZ2UuJw0KDQpCZXN0IHJlZ2Fy
ZHMsDQpDcnlzdGFsIEd1bw0KDQoNCg==
