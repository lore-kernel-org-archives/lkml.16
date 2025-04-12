Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E30645;
	Sat, 12 Apr 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744442004; cv=fail; b=pjh1U3pcFxJuDuqOiQSEsHBY8RW4Rsy58DHL+1FwT0rVIHIpMVUFssjh102RIRQWH1td+2wijKO3WByLZjCDiO8e0awFwlT7sb4LkgLMmgDzdko7vHHJy1xH0Ib0NYuVvSv+Pu0Te5kFE7OtNqgTESZI+ZxjOSYKnscD/79AeAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744442004; c=relaxed/simple;
	bh=3rr5Lqw0kXIi1DRMerq04PvQfGD2jxK2zQX/ra3WJr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F7zcbHt9mXuOzTPOMi8HgsmYWWRhH350xGK6C1sk5bJxBTei6MJs5qQi/0wzIawmx7dgGH6bmVakQ+T+N4JZk/dPKHG/r3kFfwrynbsHzM+n7Zo2xuK+8eXVpyQDH8YhlT8L6J2YAcJEc+XIek8wCZSjssw4+y5tvJAopwEIH04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ke0o2kPU; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=NkbOX2Uh; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ke0o2kPU";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NkbOX2Uh"
X-UUID: 97a20432176d11f0aae1fd9735fae912-20250412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3rr5Lqw0kXIi1DRMerq04PvQfGD2jxK2zQX/ra3WJr4=;
	b=Ke0o2kPUXUpqDNE0hIY2oW7TRoh3Ln8SSq9cK2mnqPdU93khzJOkzaV8s5d9b+eOX9EmahO7LO8JjBq+DU9tqpg1eFz0w2DSO3CYLJxoD3TDXEoHais54Gkrs8+kferxg7+7Nfnk1Y0/dUlBNZbSqCN5XnwUidfkh3rMuBQmGvk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a2b84c1c-fa8f-4d8a-9bea-9bfc43eb573b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c10bfda5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 97a20432176d11f0aae1fd9735fae912-20250412
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 749484028; Sat, 12 Apr 2025 15:13:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 12 Apr 2025 15:13:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 12 Apr 2025 15:13:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jF5cieQym4Rig90wAqeqwxv48PkOOn1BLN7riRTvoy3hmUIATqEiJcSZ3nhBQQaaD+BMDgrrdY2WNkGM1D+3u0WRmlJ2vMKa5tjQ5ADBqOBGI4gPhGUcaMtqqMA14pZnCinRwdtDYCkNzwyu+gZ7T7D8MlZFNyG1wrGCnjasd14fzGWurUcUfRaWvpy9F3SpmYylbXlkSYuZT6KYcFO252pi7r0CcEniQYR4Nm2v64KEmtEPpX9Uklg3ZWHCOWwJKYcH9PAmT3k+eQM2+809LShmgLZ/4LIhbICxfjLJc1Z108Ybtz0wQz3aDUTF6+kRvjZ78rL2Ss/wgOS1f0njGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rr5Lqw0kXIi1DRMerq04PvQfGD2jxK2zQX/ra3WJr4=;
 b=r/9SBLGv+/wNKDPQBrQfATOHsbsJuyYii/NgvzJkzi4Bk/BFFOLhbjgty4aeuyBNV4GQeOCIRprnIt78fHbyfAEzyCEcokAOHBz7EgvvZD2OPAu+9Wdy4l6OGGD/oLblaMOq5d5cIVs3LcOJWEEZr8H+oZEBcX76FAR6OptkoCtJXKWLgEToa/vezXFpjRZD/BAtbcXQ5/iC+neNZX8L3SBRC9/5NREYld+WgyJLhKDniQTRIOf3skhVrPar2Bz4mP/BGNjewewsLw9xwQ34GDQQdPpp5Zl8i+Q7mIhgRxwW63jdovWAEB1STLxN9Ak5aiJ9XPOE/thLSjG31kJk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rr5Lqw0kXIi1DRMerq04PvQfGD2jxK2zQX/ra3WJr4=;
 b=NkbOX2UhuzCv/8BxXkRe/VUqhV8a7drWolPvLtfO+7HOLvrmNCiq9Gu2Q5sKNcEYWjm6fcVeDDdFGhHNFQYIo9bXeGvnlrKTFlntCZpJgAFNZNecBrpTHEGS5yDW7lpX9MjN8/m1Ekyhg+e09x17zmsHPMoF/TDwo3nu5J5AEeg=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SEZPR03MB6596.apcprd03.prod.outlook.com (2603:1096:101:78::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.23; Sat, 12 Apr 2025 07:13:07 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::683a:246a:d31f:1c0%5]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 07:13:06 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 2/2] memory: mtk-smi: Add support for Dimensity 1200
 MT6893 SMI
Thread-Topic: [PATCH v1 2/2] memory: mtk-smi: Add support for Dimensity 1200
 MT6893 SMI
Thread-Index: AQHbqia9NKx1hIhH5E65Ryt3BLXVx7OfoF2A
Date: Sat, 12 Apr 2025 07:13:05 +0000
Message-ID: <c877ce75ca2a1b6176eaa72a9270035301e57aa7.camel@mediatek.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
	 <20250410143958.475846-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410143958.475846-3-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SEZPR03MB6596:EE_
x-ms-office365-filtering-correlation-id: 7fdbac8a-2647-409d-50b7-08dd799178c0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmpWUjlPWi9iaWI4cDR4c2huMkdNb0VDK2pZRWgyY3hsVFQvNVJtMktXS2dC?=
 =?utf-8?B?aGt3bCtiaTNjSkVmMzdqeVRldFl2QVhjTzdQSnV3RHdFaWNHdVBlTlVuSGNu?=
 =?utf-8?B?RXIyalBDaXdjbW9oZUphdGRmYVJ1b3pvS1phaFY4ZStnWkRCd25kSzFvL29P?=
 =?utf-8?B?UHd2MVhsM3AwT1Z0YU95SVhMYmsrYnIzN1lHVnNzRTZWbVZGMWordGRvVDIz?=
 =?utf-8?B?ZzZ2Q2JiZDVKTVUvcGpsQklDeFhyQ0RySlh4NlNPUnhwWkE0ZW9oelJhbEx1?=
 =?utf-8?B?YmZHc256WTQyMEovN1dIMVB5ZjNubld1aThBZTlBQ1Bqd2dIdk96VUo2b0Ev?=
 =?utf-8?B?dHlTUk5acCtCSkp4THVXYS90OXRKU1kxYnk1YnVLVlJzSWlzN1NleXFvOHZm?=
 =?utf-8?B?enNDV05LSVBpNnZLcUJMUXV0OFFhMVhwRnEzWFowNWF3bCswSnMySmZyellG?=
 =?utf-8?B?cFJxa0RLSndCWUV2Y3RGQkxDeFY4a2g2ZlNka0ppUml5dEN6d1lKeG03VjB5?=
 =?utf-8?B?KzZKTm1nOFlNeDBvMGxXWExtRy9lMnhEQXJjUkg4WnBzWm5zbGJXcHlGZ1ZN?=
 =?utf-8?B?M01YNmREVUt4VE5mNUNCSGovMkt4ZHl5TFVKcHBia0U5dUYzVnZCYlFTK1Ev?=
 =?utf-8?B?UkY4SGhJS3liODlKS2srWGVMdmJYR2V6VEE0RG1vQ1UzVEVUMVc1bnd2WlFm?=
 =?utf-8?B?YzNJVkpyNEVmdDN3ZHZzMHZ0WFNmNGFRYW5FaDI4M24rMUx2cnhKaHZwRElI?=
 =?utf-8?B?bHpkZHJER1NFMFFkSU9ldzFqKy9kcHkybXJIcUFYYnV4VkZ1M0JyOERuVU1r?=
 =?utf-8?B?ZVgyL3A2eUh6T1JzSVR1K1YxalJNaFROa0U4dldtaFV5REtybUVYZ1R1MGxw?=
 =?utf-8?B?VmtHV0FoZUlDY3Zpb3VmQ1JlUjFYNzR5UTBYMytmM1laTzhZTWdWbUZUOGtM?=
 =?utf-8?B?RktGL1lFREVPdEhQcWZaV3MwMkpYanJqcDNFbW9UTGU2c085TGRWcXRRc1Bt?=
 =?utf-8?B?NjVsTnBHNE94eE5OMmlib2dGbTdMQ3F3VDA3anA3MG90VllVUWc4eGFZY05Z?=
 =?utf-8?B?N3Z0bEIvU2I2KzdkaXVjc2lQZ1VveHlyWlVGWlRKOG9nRDdOZXd1QmVYYUVt?=
 =?utf-8?B?Uk5IdVBrbmd5alVzVTB6Ym45TTRuMURvelkwTHhrODZXT1RBK2taZDROK1pq?=
 =?utf-8?B?WTFxajZ4UzlKUmxCQUVMTmNoTUltcDhVaEVwS2l5bmltTDVvMC85VXZCcGF0?=
 =?utf-8?B?QVh3S1ZtMU1yeW9CR211NHhuaGtxMzVWa0RCdktkZE1Jdm5uL3hBb2lSK01Q?=
 =?utf-8?B?QXZIYkdJdndqNGc0K0F1U0VZcjNOSjZpRFlYVWhkdlUyWHc0bndBb1FoUkxw?=
 =?utf-8?B?aTc1eWpmV0lNTDR4Wk1kZittbm1LQXJ2VzFsSm5KSU1wdjRCMUZza09vb0Yz?=
 =?utf-8?B?N2drM1ZKeEJOSktzQUFUcWdiL04vQzBpeGlDeHZIdjBiVmw0VWNzWFpVbkVJ?=
 =?utf-8?B?VzQxUEVrYVluY29YNlJXTXBMbjRZMHFiNHM1VmxsSXZTSzErUXBkQXhBMGVi?=
 =?utf-8?B?M2E5eUZ1bVdWNHplc3NnTXl2cmVFVTVUZ1NSTkpGVTMyUWNybGJrTHJBMG83?=
 =?utf-8?B?ZkJKcTVzcVA3WnltZEkwQitSS05HamV0S0JrV3YrY0NUMWVsK2xVU3hCanoz?=
 =?utf-8?B?TGRhVXRWVVR5TFRTUFEvSnZOT1oyWHdJRWpJY01YK1pySWZzV1ZVTkRWYjln?=
 =?utf-8?B?Rkw0cHBWSTBxN0h0WGZ6K2JUeWR4NUxVMDczbjZpamJ3UGdYVHRvcER2cS9B?=
 =?utf-8?B?eGhtN09ndVdVdnc1WkI4OW51akJHVWFXRDY4WmZWR1Q3WjVRLzJKR3R6TFRj?=
 =?utf-8?B?T0hwU0ZaY28zaU9zSXVpMjZmNE9iOHk3ZGtKdGwvTFkrbGtsbThjaFZvOWZE?=
 =?utf-8?B?Z2ZOUVVDM3ZVaGdDbUF5Umc2MFhzSk9QY2pnUWVvRUpuN3Y4c1dYN3pyTHVM?=
 =?utf-8?Q?y8U0HHNBUvmIec6HTdy82jou2wZzuQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEw4MHljaXN4NWJGcnpNQ1BscnpQYldJVTdsY2ZNRFFsSFV3WFpLcFp1TFpW?=
 =?utf-8?B?TDQ2K3M2TU96bHZ2cXFCK1YzaC9zakozMUZzQk42emR4cG5xODZSbXl3YVQ1?=
 =?utf-8?B?dENDaTNsQkhqeTdpODVKbGtDdnp3clFPaDRhd1U1KzFtNkkvVVJ5NWFEWktL?=
 =?utf-8?B?OFVwU0I2QlMyUlVaYnZxYWRKbHZRSUNDQkkyOXdOQVdFRVhzTE9WbUQ4NFl3?=
 =?utf-8?B?bGs0RzRSakxiNEN2TWZzV0hZaGlQZDh5L0poTEx1anJwV3ZkL0F1SnZjYW9r?=
 =?utf-8?B?N3duYmdzb0Z2MitwQjBJNHR3Q2hqOVFxcytpRnBsb1pxa1NJY3NLMkpXNExG?=
 =?utf-8?B?S0d0Ujc3ZWxwN1Z2cS9oOUhwMFFGTGV2SDBaMWRaUFlJekxzYUtDU2RrSmpl?=
 =?utf-8?B?NUFDZkNJRnVXTU1JZE1PMGpoRUJpc00wc0VPOXdGKzJ5ZC9pMWp2N1FkSkQy?=
 =?utf-8?B?aUVFVUJlVmx0VjZVUDJ4cHQrK0g3dDdBMHF4cXMyYjhRNDVvUnIxdXZuUDNS?=
 =?utf-8?B?TEtiNFoxM2Zpa2dIRGNpUEUvVmR6dmQxWUFSekNka1EyeUE0VTJLeDFFQ29o?=
 =?utf-8?B?dXVUOHlTbDJJbzF6MlhNMzAyL0lYbTFWK1I2dzcxU1FpdmgzMnVkTVY0YzRu?=
 =?utf-8?B?clNzWEFwaWdGVzg3SmNTb2lVemhNdFlNNWhZN2FTVTFNWS91Yk5DMzB6Tkcr?=
 =?utf-8?B?eXQ1T3Faa3I1cHJsWk4zYjZsZGY2UlJaZ1FVTFdBcnJiT2UzelJYZ3loZitt?=
 =?utf-8?B?WTNsbm5BTHdZMDZWSGRIVnFpV3lLbmt1S3VhT0RwT2FxWVNaVzArWXVUdE5k?=
 =?utf-8?B?MW5EVkI2SUREc2tzK09GZTIxcEVReGpXR1hDVmdBZDhkTHdiMDNRam9mSGpt?=
 =?utf-8?B?SGRNRGpPdW1oMDI1T2o5ZU5nV1dQazlhUEFMOHhLd2djVEJCK3JrRmZYMzhs?=
 =?utf-8?B?dGFKWThnUjRVUklqYWtRRDZLZDBMWVY3bEF1dEVNVGZjMHNqSitQTis0czRS?=
 =?utf-8?B?dW1Qa2JWdzVPTmx4aUE2V0JlaTlxUnNETHpSclFuWHlkRXdzbEVOUnZRNG5h?=
 =?utf-8?B?MEQraDFMdHdUVWUwRU5JOW90N3hGOTlVcGVKTlpYZU13R1B6cWVoNTl3OGh2?=
 =?utf-8?B?aWs4ZHRpRHlLZ0Z5SWpyOTJtMHRUUWM1QTJSSHBhSEtJcklpODFZeGhHa2c1?=
 =?utf-8?B?b0JybjB4N3JJMDRGTlFzZS9JeTZRQk45Nk5CcEhqbXFuN3ozd1E5bXBuQXc5?=
 =?utf-8?B?SXV5S3JZUzlqUTMrZzdyZHdhS29qc1JCVXpqLzZudXFBeS9LSlY4M1dnT2R0?=
 =?utf-8?B?ZGh2YmVBMFQ0STljZnFGQ1ZoTkRrNnIzdmp4dVNvMERxNlNFRitqRzFqdFVO?=
 =?utf-8?B?N0gzdWFnSlhOWEhEa05RTUFqM3kxV3ZsQkhTTTVmYXhXdzh4UXo5MjZEQ2xa?=
 =?utf-8?B?b2liTUVWem5wRGhheU91dlR2S21yb010eG1DbDB1dlErTEpPVjQrMzZwZkRS?=
 =?utf-8?B?UTJuRDAxb3MxVE14Ym9nOUl6TzhxcVFFckZ6Y2F2RHUzYTlLcEJvRGZFamFG?=
 =?utf-8?B?bXNocUdMSWp5eEh4S3ZqdnJvdlh5TGlDTStUS3VjVG5XMDh1cm1CRUFJZ1FO?=
 =?utf-8?B?RDB2TWhEbjJLVk4vV0tPWUptaThhYitjdWFPZGZ0RVFxUGs3WjlOUXUvb0tQ?=
 =?utf-8?B?S1p4RHJYOURnT2c5bEI0aUk3QVlFSitMUmx6cndOeEo5RGhKN1lQcjRZbHFB?=
 =?utf-8?B?eVNzeENQRkZlZ0xLUjFhYWtLVG9yK3BiV2JRY0MyeklQV2Q4QUsyUHRJYjJz?=
 =?utf-8?B?eDBMNlNrekVYanZHN0pxbEtHSjdkdlVtN2tXMGxnZitSYkY1aXVCM08xaCtn?=
 =?utf-8?B?MUFJeVYwaGhJOFplbitUQ2JEM3ZybjB2MWdjNjFwRUJlTnNJZ1FNN29IMGtP?=
 =?utf-8?B?bVhxVWs5aGIwV0JvSGxGdnRadmttTE1aeXJJc2FsWDJFVGdQMUNFenpQWFQz?=
 =?utf-8?B?QnBDSmRkSFRWY3VsZEJSNWxJRFUyRUlVVGdVMGgrYk5kdG0rRjN2RmV1UStM?=
 =?utf-8?B?bkV3UGVYMGpxUDgwblhuRi9pNFVoT293WXM1UDNUNjZneCtBRlNvd0gzNlli?=
 =?utf-8?Q?YzgQIsXm2IVymJMVmFsSko1ok?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AACB5CADC0DA944BBC7BD264F5C684B5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fdbac8a-2647-409d-50b7-08dd799178c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2025 07:13:05.9083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7NNOmmUf3O/bpwodpTNmEa4++DnBraQqhN4TluvxVlZu+ujxTd1DmGi+J7E+cC0Hiyd8j6wqqJptXA6/c9qxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6596
X-MTK: N

T24gVGh1LCAyMDI1LTA0LTEwIGF0IDE2OjM5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEFkZCB0aGUgbmVjZXNzYXJ5IHBsYXRmb3JtIGRhdGEgdG8gZW5h
YmxlIHN1cHBvcnQgZm9yIHRoZSBTTUkNCj4gZm91bmQgb24gdGhlIE1lZGlhVGVrIERpbWVuc2l0
eSAxMjAwIChNVDY4OTMpIFNvQw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPA0KPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
DQoNCg0KUmV2aWV3ZWQtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0K
