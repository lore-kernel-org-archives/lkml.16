Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1837279DC8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760367; cv=fail; b=I8pYB+CF7MuK81jAIBjP3yIEXAGxzhUCS90z6IIQt1pr6ny30fA31bRQgfLac4Zy/lv3T6q/kvXEunCJUb2X3es9NUNGXItVjqcrdX6TxlWLrbu8uVplclgikcoR6a3CNLHYD9t1tPXhEYMlCHwycEGLbW3ya0evRFY9++Qg7pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760367; c=relaxed/simple;
	bh=ooDnANsOOtrNl75LUgFFabXT2lCEphnQtEOkrRAgdLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C5LRmrib1zxnX6VHcf5V49b6Q8kmeGTSVa3dC/KFMgohFZj0KcgLkgbCidT5nEvYNouKpB1K6daHitOvUfmNz9tFqmEeefZgSVExyHvNG2mD8nJ+6sJOR8esxwcHl+kyhl7ihheP7u+mNjXtTmTIR4i/0y2FQKaA6IxDTePoloo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AHCqJiKu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cHu7EGde; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AHCqJiKu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cHu7EGde"
X-UUID: b0e0640650e411f0b33aeb1e7f16c2b6-20250624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ooDnANsOOtrNl75LUgFFabXT2lCEphnQtEOkrRAgdLs=;
	b=AHCqJiKuW8Hi84PPKce4kGhLeqnvl6gwYi6oKt+nJ7xDQa8Bimm2HwPJYYBXrwl438cZaVVjh1CmhTEILuVso1L1N0veUztzDR0PDF0iaqzOlcxPp1chSyxYw07zB2e1Y7kRDM7SRi4PE+ChsllGx3Uae/48NAWpKGno97Wu89g=;
X-CID-CACHE: Type:Local,Time:202506241740+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:de652602-4da2-472e-88c5-bf875d2bb798,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:50092582-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0e0640650e411f0b33aeb1e7f16c2b6-20250624
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1686917305; Tue, 24 Jun 2025 18:19:19 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 24 Jun 2025 18:19:18 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 24 Jun 2025 18:19:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE0aIKeqnSQ9vApO9CukPVhLmuBip1FekrlB+F3VXV59H3lPNoMYn2KTL2TeQj5T/JSw7Wzcuh+fe+NfyJRffFrC33ouBvaOSJupVAb2e0oVb6lsa4/Yc5h6oR240WwsNjRM1ypamNIkJVbKz+/HZR9MQpdfjgnnmJmR43H6PPZhjp59Jt1c3aQcsN+JNiT77Ic7+wjMpsbtnRRzfrRHayX4Glugxd+LRR9Gi4n6xJlUtKNLyYU8DrwojTic6YPv8KyffXFxsLpOo2eXlsuZlGIrlAmOHgyYEJJeWyQQ89FqQYTUmb0roktxGPazcbqNdt754Dx8s6kkYNSwPhHgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooDnANsOOtrNl75LUgFFabXT2lCEphnQtEOkrRAgdLs=;
 b=gTCYWZc26yTZ8qCI1yrH57BARlhr4aMw4BPUcQaa/gV/NYCwWaahVZst/mdUuon4tO4hbNn3III42kfc+VIL1EX1TIQErgrLdmqi4z1SJgPGLez803TGc63/vxVZuv7lzIS66aAylqwkzlMd71QwgHHye7HZQLBjXMcbONOO4jtjHoJKjyxSWaiuScWUfAllh9dIR9aCDLGW0bcdz9CsGUE/G7jBbthd4D9OeanBcnAM+/LEFpHJYI/lXEM0sMRry0aW4lGgxeXrtJwHKZ8MgCSm6DnMLoyqfr8a383HPC+i8ZZ7NO36bWex6jkcUGAKqnZrp7Pz3tSjBt4om9zimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooDnANsOOtrNl75LUgFFabXT2lCEphnQtEOkrRAgdLs=;
 b=cHu7EGdeERvrjFaDPTa4Q0G9rYE1Nwy9pNfSDf7I9gV3oxMXKqm/8stmFJFDxKDYbXoNxnnu1eARgrvhjVqUWjZF+KbkzkTfVoK8T8mnqHN6SFVb6R1ik0MHeblrelM5dKEkio/32H+p5kadAkonq9v75UL+nCPlMnkYhQjuBDY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7621.apcprd03.prod.outlook.com (2603:1096:820:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Tue, 24 Jun
 2025 10:19:16 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:19:16 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "wenst@chromium.org"
	<wenst@chromium.org>, "fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
Thread-Topic: [PATCH] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Index: AQHbyvbu01ohrC5ahkmCgXDRK5gv6LQSQfcAgAAK+oA=
Date: Tue, 24 Jun 2025 10:19:15 +0000
Message-ID: <c4c97f7d81a7b2b76bd43665e409a972000be8a4.camel@mediatek.com>
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
	 <d46b431600ad2e5e2b3639b8bea784dd6c151bfd.camel@mediatek.com>
In-Reply-To: <d46b431600ad2e5e2b3639b8bea784dd6c151bfd.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7621:EE_
x-ms-office365-filtering-correlation-id: f533d42c-37b8-4f39-81a0-08ddb30892b6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUJoVmhSSXk5TkZIT2VNZjgvWmdXbmZtVUwvYWc1anlQT1V3aXdGVE5CZnpG?=
 =?utf-8?B?N3FhdmlpSXNERGU0VXdacjRaY2daZXRkMXd5NVkzZ2RJWFVxQjIrYmlzdEwz?=
 =?utf-8?B?MzJyUE9JSFJwNmkzMVdzczlFT2VvUU9HUGZxZElZWG1XU2pjUWFydmcvdzFE?=
 =?utf-8?B?ZzlCak5qQ0ljemxVMlBVc3BwSXgySEk0aVNXNysrTzdWVkVIbEMvRXJjck8z?=
 =?utf-8?B?K1lPS0hDdEc4aEtvbmZrZVh5TWdtaEFKOTFReVRmRWdvNnd3M0U5dWV6UVFT?=
 =?utf-8?B?dXZZMmlDMEtBeXR6SDBMZVBVU1ZIeDE3TWxRM1R2VzIydU1iK3dEQkwvM1o0?=
 =?utf-8?B?RXRTd2dBemZpMjV1M0ZnZHJvNkRJZnRFTUVwcEZlRGpHamxGdnRsOHB1Tkx1?=
 =?utf-8?B?ME0rVUhtdCtiR2JnSmFUR2RpZzJHdFcwellkcFZLOWZaMnJOOWxxaVA4Z3pa?=
 =?utf-8?B?TytsRWdjSlkwVThZQnFiakhUcW9wWmc0VFQvMXliWnVqMTVLTDhPcXVLNk9j?=
 =?utf-8?B?d3BycDFxTGFvcUp5WU0vLzNFNUI4ZFdkQjdrdGZiZ1dNRUVsQUl6SlQ2eGJM?=
 =?utf-8?B?dmhUOGpOZEw4dUhua2ZDc2R5MWtiZHB2NDZDeHFzM08wZHFzK1lhbHRXWm9x?=
 =?utf-8?B?UmFnYWJiSXE0Mm1YbXJzVG5mb2k4cW9RaHZ3dGFaSzJRbFVmcmV0WUxLS2J6?=
 =?utf-8?B?QlBzTW1tcXY4WFl2TU9NTnFJbWVnallEUDJGb2pJeWtiQStISWFnVWtydUlY?=
 =?utf-8?B?VFBPZGN6bkVSM0lNaWJyZ1Y3MFpFeTZHMFJyeG1NZTFoQzRsN3hLdzY4cjNK?=
 =?utf-8?B?dzVQWjNoZXhmQzJLWG4rUHdtMU44NjBabkp3YjEvMDBBYWJ2Zjg4QmtsLzRr?=
 =?utf-8?B?ekY4SHNyQXM1QmdGajd5N2RyVXM1c1U3QUVxMFdUUXNNZ041MWdMSDVSZktu?=
 =?utf-8?B?Sk1kRzFNWTJQb3JuUGJlZWtQNFRuU1M2K21RQWhxZGZtYlBLUUZaR1ErNkNG?=
 =?utf-8?B?ZGJybk1Cd3p1WnpKblh5OEw5M2k0Y05BbmtmOUd3cWRMN2YvQ0drL1NFclFj?=
 =?utf-8?B?ekxiaVFnd1NmdmVmUGNhY0ticS9kSzlrb0tQM1YvOUxjYVAzajB1WXVmbG0y?=
 =?utf-8?B?MUw3UjR2M1doQXlPVUFBVU4wQTN6SzV4VXQzdGtMNHlURXkvejhCY2JZWGNu?=
 =?utf-8?B?WkRxVlZGNmU1SVpkVXkrTkoxSUVrbXJwRll4MnkyVkdLaU03SFptYUFSTjZt?=
 =?utf-8?B?RFovc056RDNLdnpzVkxKcFVLSTQ4OGxjWGNNRTV0YzRWSWxURlYwRUI5ZDVv?=
 =?utf-8?B?L203WmN4eDJJQlZHK252dC9XRWNpYXZTWVlwOFV5U2RpYVFMYXczdkpaZXQx?=
 =?utf-8?B?c3Q0eUY0ZmdSMTBBVDFSQ3RuSTdMWHcwMTdzK243djNZVnNzaVJtYVhlWndl?=
 =?utf-8?B?MGlnTzF2czQxVnpISkhWYVc5OTdvNFdjeWM0MXdXWHNCMTJOeVh4aGlLQy9V?=
 =?utf-8?B?QSsvcC8rb1FObGFQRE9WVU9qbnRJZHFJVlY4ZkJXQ3VmTGhZaHBlbVNzS1A5?=
 =?utf-8?B?QjNVb24yejYyUThkbnBrZ01rUEh0bWcvUDlHQXQ3R1JEYzQ5RmhrNWc4NXhl?=
 =?utf-8?B?OFRTeFZkWkxhblFpenkwWnVFSDhRbzUyUEhrQlY0bVVKTDFFZVN6R3NqRjFE?=
 =?utf-8?B?YmxQUjF5bnBlQmtkcUJMM1E5MlVoWmRWcy9wSjFuUW05cWcxazI5eU9zd1FG?=
 =?utf-8?B?Qzl6d2YvczVwNEVIMWwyV0lyM2ZWU3NEb0F2YU9zb1QzTHNvbk9GR3R3cXNt?=
 =?utf-8?B?aFpBNG9tNE94d25hK1NTdWk2b1F1eDNJdVFxMUR3aGY1UVhPc0lzMU92eGx4?=
 =?utf-8?B?eTY3Nld3Rm1NaUtzMFkrWEpQQWZYaW4zTWZpWEgwMDNvSEcweDBLRXBGcGI4?=
 =?utf-8?B?WGdxajAxeWc1UUtXMWRrVFJPQWh3YVBiZWxVdW12SXpqVEJ5M200N0RJQjJO?=
 =?utf-8?Q?JitbDKFQFcWq8iwQ9VyNTBhy1YoxXI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzIrU0ZSRG9jQkwxWG9DQzN1NDFSV2o4WDVkVytsd3RwTGVSNDdiazdENmEr?=
 =?utf-8?B?Nm9mc1hsSlBTSFZTRXVmZkJSNys0L0F1c1hOeWFTQitlTkl0cnZGbXJOd2Yz?=
 =?utf-8?B?UFE2SWNXM0pVa0pjMFZxcDJ3UGZ6WVdyazBDUzBlbU1lMDhIZ1V4Z01mN3JC?=
 =?utf-8?B?L1E5WlpyR1FrczBjelZuemgxUW51UXN5THI3V1M5RGtxV0kxS0Y5WlRyTzRG?=
 =?utf-8?B?QTlONE9kMGNjR3dvOTVCc1FMNDZRQ2NEQURPQUxIaDZnVDVTNlJaeU1JMy9M?=
 =?utf-8?B?bHF2emN3TWRwTEw5QUtoU0JtMXZIRkY3QkhrektkL1F0eENBOTB5RDhSUGFa?=
 =?utf-8?B?cUFhYWd2dVVUNlZsaHJGMHpvcXdKalgrNmhoVUtwbklUa25ZZkdvenhwM0ht?=
 =?utf-8?B?OG1oWGU4Y2tDYlZUSjhmQ3lTMjAySzZXTk5OK0FuYWdBejdmMXhBRFRMZGMx?=
 =?utf-8?B?ZmozSk93RlNKWGIxbm1kQ1BGTXozcmJ0ZWtnUTdsN0xrWUhpWGVJSnBNSzdL?=
 =?utf-8?B?elZFWTQ1SWlUbXRpdHRYcmhYRTF2dDJ1aGVRVWtpRjRya2lFbXFEZVhiaTVk?=
 =?utf-8?B?dHVvZ3Bkbm4wcWh2bEQ4aE5QTjkrczZUZmc0N2RtN09xSG9nWkk5d1hmd0xk?=
 =?utf-8?B?UnNTcHRQRFhtWmR6UkRRY3JuWGN0SFV5Zmtjdng0bk80M2ovaG9qME5kYzhT?=
 =?utf-8?B?UWN4eTMwQWFwZ0dvMVlHVENybHFlbWR0eHR3N3NGc3pzMlo5N3IyNHhIeE9N?=
 =?utf-8?B?ditWUzBMTU9FS1BsUlBQRndVYWRQb3JFQVVyRkVZUEhxVjZ6cG9WQmY4ZGxq?=
 =?utf-8?B?RTFaa1FwUGRBMzVheGxKWkhwbmxmTFZDZUlabkErM1ZEcmliV21uM1pZNVZl?=
 =?utf-8?B?VEp3MnV0VkhRU0F2c2hSQmJQVGczbXFVWlR5Nlc2RjNHclVkQ1ROVExNbUF2?=
 =?utf-8?B?ekFSOXMyYThLVXpvYUNlRkZsckVvaFFmTE8vdENINFZ0ZDcyR29wMzc4UkZi?=
 =?utf-8?B?WGVTUncwRzB6dURHVWllWUZ4YVVQOThVOVlBYU9oaFYwM0RhNUlTQmhTL1Zk?=
 =?utf-8?B?YXYzMzV0VmFmbmhNMi9MdTV3VWx2TFFRYStlYW1IdHBMTWtEbEh5dmhBdERh?=
 =?utf-8?B?TEFHUGJWRW1tUktvbm9XdWxiR1pEMkxIejVkazdaN0NtK2xlMHI5ZFl0bUhM?=
 =?utf-8?B?TGZ1N242UW1NbzV2Q0diZm9icjdkbHlKZXVyK212NnNzM3hWTG5PMHlsUjJy?=
 =?utf-8?B?aFFONHlORGoremMyKytVY2tzcnFYbU9pa0x1RGRVM21GRjlhRnRnbHBCNG9D?=
 =?utf-8?B?cStrQTU5cnd6YTN3Ti9weC9Od3F2SWRWUHcvVU9QOTI0YXMyRm9WQmY2eXQw?=
 =?utf-8?B?bElHbkN5Z2EwYng1RjUvR1NLMG10eklORGs2NDlIUi84cStMQkR1eG9ZbDZW?=
 =?utf-8?B?RjNTUjFmS3dmeUZTRkhORy9JMEtXaVM1a3NicDQvcU1lbk9CS0gwZHJiVDA2?=
 =?utf-8?B?RXh1Nm9jOS9tNFI3MmpiR1R2L1F2RjdaRWVpZEFVb0s3dXpuWnZ2TnZlQUhp?=
 =?utf-8?B?V0w3ejI4eFdSOUs4YjNHdEIzbUwyQWtKcm0vcUhEak43N0tTb0RHK3A1SEVN?=
 =?utf-8?B?WThKRTBsMDd6a2k1UUlPSVFBMHh4ZFp3MU1MdUlmdU5mQk5lY09TS1dZS3Fp?=
 =?utf-8?B?YlFNWkRiZVJ3eXo2UlFwaTJITUwvMXVncG1zbTQ4QWU4amZHdk53RDE4cUE0?=
 =?utf-8?B?ZTdKS2djcFZLbWdPSWlsRGhRbEJmblhwY2Y2cmE0RHZvazFidFFJOFc1bnFI?=
 =?utf-8?B?b0ZXR0Z2c1hESlFRT2FQTXo3V0dqYm83N1lVNEYydURuMlVLWWQ5ZDJ1N1Fr?=
 =?utf-8?B?UVNnM3FSeVdjQTlWZ0gvZzFwMmxjSWYwZ1doQk5nNG9CZXJ1RFVud1lQblJR?=
 =?utf-8?B?MWV6SzlDN3pKeFpCenZ3bG16V2Ztc0FLY1NydVk0aDkvOXZCSWY0aWlsVmlh?=
 =?utf-8?B?YXVVVmdCcTR1REtIcVJoZDlLQXJhZDNBZGUwU0t2OXZLQmtrZXRYbHJ2eTd4?=
 =?utf-8?B?VnFWakZFNHZWbWhJWTNDTW5SYVVDcWpsdmNJdVpPbG9GcXRTaS96THJVNVdH?=
 =?utf-8?B?WmxYbnpOZDNqdXUwZG4vVG1NTlAzbjJ3ajNPdHBwdDVZK0NhZzU3T0I1YVhl?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <465DF7BB9BA80E49A948FDE665FB5A3C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f533d42c-37b8-4f39-81a0-08ddb30892b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 10:19:15.8923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KtBL/V32x6HqigXN//xgfJ8gdbSM3poJd/XylObcMPpSsbpodso7NABpj4fk5r9bTNhDIxuvotVX8ReB/FNCRZAMg8i09oI+jcDtmYPCKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7621

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQoNCk9uIFR1ZSwgMjAyNS0wNi0yNCBh
dCAwOTozOSArMDAwMCwgQ0sgSHUgKOiDoeS/iuWFiSkgd3JvdGU6DQo+IE9uIFRodSwgMjAyNS0w
NS0yMiBhdCAxNjozNCArMDgwMCwgSmFzb24tSkggTGluIHdyb3RlOg0KPiA+IE91ciBoYXJkd2Fy
ZSByZWdpc3RlcnMgYXJlIHNldCB0aHJvdWdoIEdDRSwgbm90IGJ5IHRoZSBDUFUuDQo+ID4gRFJN
IG1pZ2h0IGFzc3VtZSB0aGUgaGFyZHdhcmUgaXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYWZ0ZXIg
Y2FsbGluZw0KPiA+IGF0b21pY19kaXNhYmxlKCkgb2YgZHJtX3BsYW5lLCBidXQgaXQgaXMgb25s
eSB0cnVseSBkaXNhYmxlZCBhZnRlcg0KPiA+IHRoZQ0KPiA+IEdDRSBJUlEgaXMgdHJpZ2dlcmVk
Lg0KPiA+IA0KPiA+IEFkZGl0aW9uYWxseSwgdGhlIGN1cnNvciBwbGFuZSBpbiBEUk0gdXNlcyBh
c3luY19jb21taXQsIHNvIERSTQ0KPiA+IHdpbGwNCj4gPiBub3Qgd2FpdCBmb3IgdmJsYW5rIGFu
ZCB3aWxsIGZyZWUgdGhlIGJ1ZmZlciBpbW1lZGlhdGVseSBhZnRlcg0KPiA+IGNhbGxpbmcNCj4g
PiBhdG9taWNfZGlzYWJsZSgpLg0KPiA+IA0KPiA+IFRvIHByZXZlbnQgdGhlIGZyYW1lYnVmZmVy
IGZyb20gYmVpbmcgZnJlZWQgYmVmb3JlIHRoZSBsYXllcg0KPiA+IGRpc2FibGUNCj4gPiBzZXR0
aW5ncyBhcmUgY29uZmlndXJlZCBpbnRvIHRoZSBoYXJkd2FyZSwgd2hpY2ggY2FuIGNhdXNlIGFu
IElPTU1VDQo+ID4gZmF1bHQgZXJyb3IsIGEgd2FpdF9ldmVudF90aW1lb3V0IGhhcyBiZWVuIGFk
ZGVkIHRvIHdhaXQgZm9yIHRoZQ0KPiA+IGRkcF9jbWRxX2NiKCkgY2FsbGJhY2ssaW5kaWNhdGlu
ZyB0aGF0IHRoZSBHQ0UgSVJRIGhhcyBiZWVuDQo+ID4gdHJpZ2dlcmVkLg0KPiA+IA0KPiA+IEZp
eGVzOiAxMTlmNTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRp
YXRlayBTb0MNCj4gPiBNVDgxNzMuIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4g
PGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2NydGMuY8KgIHwgMzANCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuaMKgIHzCoCAx
ICsNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuYyB8wqAgNSArKysr
Kw0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5jDQo+ID4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiA+IGluZGV4IDhmNmZiYTQyMTdlYy4u
OTQ0YTNkMWU1ZWM5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfY3J0Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMN
Cj4gPiBAQCAtNzE5LDYgKzcxOSwzNiBAQCBpbnQgbXRrX2NydGNfcGxhbmVfY2hlY2soc3RydWN0
IGRybV9jcnRjDQo+ID4gKmNydGMsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiA+IMKgCXJl
dHVybiAwOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gK3ZvaWQgbXRrX2NydGNfcGxhbmVfZGlzYWJs
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIHN0cnVjdA0KPiA+IGRybV9wbGFuZSAqcGxhbmUpDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfY3J0YyAqbXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRj
KTsNCj4gPiArCXN0cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0NCj4gPiB0b19t
dGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsNCj4gPiArCWludCBpOw0KPiA+ICsNCj4gPiAr
CWlmICghbXRrX2NydGMtPmVuYWJsZWQpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCS8q
IHNldCBwZW5kaW5nIHBsYW5lIHN0YXRlIHRvIGRpc2FibGVkICovDQo+ID4gKwlmb3IgKGkgPSAw
OyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsNCj4gPiArCQlzdHJ1Y3QgZHJtX3BsYW5l
ICptdGtfcGxhbmUgPSAmbXRrX2NydGMtDQo+ID4gPnBsYW5lc1tpXTsNCj4gPiArCQlzdHJ1Y3Qg
bXRrX3BsYW5lX3N0YXRlICptdGtfcGxhbmVfc3RhdGUgPQ0KPiA+IHRvX210a19wbGFuZV9zdGF0
ZShtdGtfcGxhbmUtPnN0YXRlKTsNCj4gPiArDQo+ID4gKwkJaWYgKG10a19wbGFuZS0+aW5kZXgg
PT0gcGxhbmUtPmluZGV4KSB7DQo+ID4gKwkJCW1lbWNweShtdGtfcGxhbmVfc3RhdGUsIHBsYW5l
X3N0YXRlLA0KPiA+IHNpemVvZigqcGxhbmVfc3RhdGUpKTsNCj4gDQo+IEluIGNvbW1pdCBtZXNz
YWdlLCB5b3UgbWVudGlvbiBHQ0UgZmxvdyBoYXMgcHJvYmxlbS4NCj4gVGhpcyBhbHNvIG1vZGlm
eSBub24tR0NFIGZsb3cuDQo+IElmIG5vbi1HQ0UgZmxvdyBkb2VzIG5vdCBuZWVkIHRoaXMsIG1v
dmUgdGhpcyB0byBHQ0UgZmxvdy4NCj4gDQoNClllcywgdGhpcyBBUEkgaXMgb25seSB1c2VkIGZv
ciBHQ0UgZmxvdy4NCg0KSSdsbCBhZGQgdGhlIGNvbmRpdGlvbiBpbiB0aGUgYmVnaW5uaW5nIG9m
IHRoaXMgQVBJIHRvIGF2b2lkIGJyZWFraW5nDQp0aGUgbm9uLUdDRSBmbG93Lg0KDQo+ID4gKwkJ
CWJyZWFrOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArCW10a19jcnRjX3VwZGF0ZV9jb25maWco
bXRrX2NydGMsIGZhbHNlKTsNCj4gPiArDQo+ID4gKyNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01U
S19DTURRKQ0KPiA+ICsJLyogd2FpdCBmb3IgcGxhbmVzIHRvIGJlIGRpc2FibGVkIGJ5IGNtZHEg
Ki8NCj4gPiArCWlmIChtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbikNCj4gPiArCQl3YWl0X2V2
ZW50X3RpbWVvdXQobXRrX2NydGMtPmNiX2Jsb2NraW5nX3F1ZXVlLA0KPiA+ICsJCQkJwqDCoCBt
dGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDAsDQo+IA0KPiBDaGVjayAnbXRrX2NydGMtPmNt
ZHFfdmJsYW5rX2NudCA9PSAwJyBtYXkgYmUgbm90IGdvb2QuDQo+IElmIGEgdmlkZW8gaXMgcGxh
eWluZyBhbmQgbXRrX2NydGNfdXBkYXRlX2NvbmZpZygpIHdvdWxkIGJlIGNhbGwNCj4gZXZlcnkg
ZnJhbWUsDQo+IG10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgbWF5IG5vdCBiZSB6ZXJvIGFuZCBj
dXJzb3Igd291bGQgYmUgYmxvY2sNCj4gdW50aWwgdGltZW91dC4NCj4gDQoNCkkgdGhpbmsgdGhl
IGN1cnNvciB3b24ndCBiZSBibG9ja2VkIHVudGlsIHRpbWVvdXQgaGVyZS4NCg0KbXRrX2NydGMt
PmNtZHFfdmJsYW5rX2NudCB3aWxsIGJlIHJlc2V0IHRvIDAgaW4gZGRwX2NtZHFfY2IoKSwgc28g
dGhhdA0Kd2UgY2FuIG1ha2Ugc3VyZSBHQ0UgaGFzIGNvbmZpZ3VyZWQgYWxsIHRoZSBIVyBzZXR0
aW5ncy4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0K
PiANCg==
