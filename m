Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E2421ABB8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171427; cv=fail; b=sW0+YyhGIfxWFHZsUVqCJaVTT0CLkaSKbhOpDbaF6LoA+CXrYwoQAml8VWRGQZbXUxkSXllC4GLFuCLBP0Abjke8sx9YCSMYKgRdrta4L12QcwDJfANfmR3YYIZc5AMYWQx2UNqjw+FxVlSxlZdl7nuRLxzMxBDPvmNtTX11Bag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171427; c=relaxed/simple;
	bh=IQuoPH2+8JK+9pgO0979f9PqOHFLl7P00G+VrvtQm/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JP425GvQ6qMPMig3s++Abkyj52Uifu8HcYTXnF9cArxz0NdNuAYQpnruAcDpqLPIqv3862M/s+TEfTS5ta11UuGUov2YlFLorkRYlKqPeko9VoJvdfFnw/Vto6OBcgressTjpJrepu1jCUemQ0CRV040UODNxtUPD06QqoL2+BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=vHtcBEHb; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=IediSaqK; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vHtcBEHb";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="IediSaqK"
X-UUID: 3895b6dc4b8911f0b910cdf5d4d8066a-20250617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IQuoPH2+8JK+9pgO0979f9PqOHFLl7P00G+VrvtQm/0=;
	b=vHtcBEHb+to5sRALHZ8bmBPUQwGIRGJIPL55RmiVClGPisOAz0EZF03vCnGy7ZdZkLenwnK3l6Q1UIa4GGa/9qqACAJL3b0n7eftwYDSz7Q76LLanaWx3It90xD0Z+5k1x0Myo5jP1+/p7x2FgLrDRzZyGRDjiukgKxZZRqm7Sg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:c390e3d6-0bb6-4764-a2a7-4f6e8d967dab,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:e6f31377-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3895b6dc4b8911f0b910cdf5d4d8066a-20250617
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 786617359; Tue, 17 Jun 2025 22:41:58 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 17 Jun 2025 22:41:54 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 17 Jun 2025 22:41:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo6kSJmx9vgHIDzKlEZWlw+prHOJxZe10pz2CL/WVnoIQTfGLLb1FL/49nvG8LOGQtx8aIcMaen6DBkQGSyJ52fi3cSVaMRkFispfeM7Aluh/zeZukP9HY9AtUlsdaw+p6nwKf+GLNN/gzAmAwPVAhIQBbNOjG/Uw1HlTUYOGOyN9jvviM/kl7RXo1nwtXdQW5R/GXwvMZQWs5X+3ej+cAl+kOq+FO0H3uxqgV1B4Mjili8gvbKePWpv0iPJ96D2PI/ttWTYrPZ/ElBmksLqljxVigF9k5vRXr8+LXpDU2TIeMvKLUVBHMXXAPov9vM9sWBJX05rYGFkNQmD3BuO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQuoPH2+8JK+9pgO0979f9PqOHFLl7P00G+VrvtQm/0=;
 b=JeXbCWx5RPOJ1cR8VTSN1iszyttSld+RAYhtMFCISScqs/01XtZt/0QK509fCizzmCKCcSaERh32yAS9Q9fHOV6is6NkVEy+aZpt6Rp8QNRggDjlD5DH3ZpRcP3dFvo7sR4CkaUH1hfJJf/ujqQUW0uVV+MSEfKLEVY7HgR/kbCjMgC1llZEU6FC3l2KSxH/+bRw+Lpx3vbb6hgov544UOLLai29HE7Sm3kT1GSJl8xqQYuESDeyDRNi3uq5W8IxbTaGSMNNY8uDZ0gs/7aKE8XYJ5OLAtqxWa29aynCVcAT2kY1Si7MBdEBi3Pp24OmcLv6HThELQSt/BZ+fNiS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQuoPH2+8JK+9pgO0979f9PqOHFLl7P00G+VrvtQm/0=;
 b=IediSaqKSGZHmOyK7P4PCAVs/yKk4+bW3JqTUWyviKEsdjA7lrSTLtKx2cRuKZ0D+UBaGHyUpw3DAodb8KNzGv4FZVrycnSpTXrI3QdvOpUMIW8nkminxD8efyE/oH1tzNNtZinbu6ElimD1Natf9Yb8gLVg+LaBDOV5o6jgxm0=
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com (2603:1096:4:12e::5) by
 TYZPR03MB7962.apcprd03.prod.outlook.com (2603:1096:400:462::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Tue, 17 Jun 2025 14:41:53 +0000
Received: from SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::e57f:afc5:49cd:45bc]) by SI2PR03MB5580.apcprd03.prod.outlook.com
 ([fe80::e57f:afc5:49cd:45bc%4]) with mapi id 15.20.8813.024; Tue, 17 Jun 2025
 14:41:53 +0000
From: =?utf-8?B?S3V5byBDaGFuZyAo5by15bu65paHKQ==?= <Kuyo.Chang@mediatek.com>
To: "juri.lelli@redhat.com" <juri.lelli@redhat.com>, "peterz@infradead.org"
	<peterz@infradead.org>
CC: "bsegall@google.com" <bsegall@google.com>, "vschneid@redhat.com"
	<vschneid@redhat.com>, "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "mgorman@suse.de" <mgorman@suse.de>,
	"jstultz@google.com" <jstultz@google.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Thread-Topic: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation
 formula
Thread-Index: AQHb34QVq0xvnM0ywEiNoeo/K7b6zbQHZUiAgAACl4CAAAUGAA==
Date: Tue, 17 Jun 2025 14:41:53 +0000
Message-ID: <9d521010878acd1d8f1b1b1380610459a746066f.camel@mediatek.com>
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
	 <20250617085558.GN1613376@noisy.programming.kicks-ass.net>
	 <aFFgi_9yxLN-auBE@jlelli-thinkpadt14gen4.remote.csb>
	 <20250617141437.GW1613376@noisy.programming.kicks-ass.net>
	 <aFF6eYzMahzQ9sxE@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <aFF6eYzMahzQ9sxE@jlelli-thinkpadt14gen4.remote.csb>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5580:EE_|TYZPR03MB7962:EE_
x-ms-office365-filtering-correlation-id: 866df23a-67cc-4008-c3e1-08ddadad19d5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RC92ODk1SHNTSzFpWnFNcHBSZnliM0EvcDBzVFh2RzA0SnVQUnlUMEtiTVpx?=
 =?utf-8?B?eXQvZjBxUEZwb0NDd0xPbGVjWmYrVlB4Q0JaWnd3OERnZzZXOElZVTlqcFFn?=
 =?utf-8?B?UTk0Tm1Ndk5KOFdubEFaY0k2dGswZm45QmpYZk9JRms1ZWE0b3F0eGd1anVS?=
 =?utf-8?B?MWNZWjhrR1d2R3dnNnFKR1pYSUdEUWJNejZrNy81QXlOT01Xb09RZE5YR0Vh?=
 =?utf-8?B?bGRrQ1Nya0kyelhyR0hrZW84K3J4TkVYRVg2eDRuc1Z0bDRXdzIrQ1FTOXl2?=
 =?utf-8?B?TlgxcTRxc2RpaURmK0xBYmpTZEI1UlJIUGtia1RvSHdWMGRnN3VEb2hMdkw1?=
 =?utf-8?B?UC94WXU4WStyMFcvd2UrbFM1RUJHQTB6MFprVnlYUFlpdW5VcTkzS05ZNXRE?=
 =?utf-8?B?NG1LMTZJYUh2Y1IzeW80aWExdzdHQWdab1pIa1IrL2JqelpZbXhrY2YrajlH?=
 =?utf-8?B?am9DY2E5QmFkaURNL05HbWplb08ybnVpQVRMVW9aTzl4T21vb0IzaWNuOUtB?=
 =?utf-8?B?b3hEbzM3eUtnd3ZORThJZHl1MUNMZTlqcmRoWHNyUllJeno0dUp4OW1BR3Nq?=
 =?utf-8?B?WWk3TFFrYitaTDYwUXlNS1ZYTzQ5Z3c2MXdPMkU2cktqcGVkMEgyZjcydHpV?=
 =?utf-8?B?eXdZY2FML2dpMnNKQ3ZMcHNSbnlIbU40a3BqT3Z3KzhnVGgvRkl0aWJwUHk4?=
 =?utf-8?B?VXN4V1hvaGJtS25GaDVCaGs4Y3ArUUl2dTRaK3lXYnZhZkptWUFnVDZLdTEv?=
 =?utf-8?B?bjFCM0pWek8vc2o0TEkwRlAwdGMzZmpDaDZsVlhlM1BvSHBSQ0FrblhOb09O?=
 =?utf-8?B?RnlxUW9xbXNOc0xMaUVyU29ncHFhcjBqdUN3UU5UbnNWUG5ucHNYV1JheFR6?=
 =?utf-8?B?aVlmcUJjZzFadUJXOGZHTlE1aEhZcWJxWDM3c1VoSDlidWhkUmZ6NFcrSmJG?=
 =?utf-8?B?aTJVS3VvR3NBbmNvVXJqZWZIV2JSZXRGR1VIL3ZMZ0dTc0c2bGhNQnprRk13?=
 =?utf-8?B?dEVzcTNuSzhydit0MFZjVGxKa1p0S28rTDUyK1orNFpydmtxRXNoZ3FYNHdh?=
 =?utf-8?B?Q01kM3htQ2h3VndGdWFERDhlODBhL1hMTTNWRWJwUkJwTXFXcm40VThJaytr?=
 =?utf-8?B?UlZrcFdpRGNqVFI4VDkrOHFacEtsaDh0eTRuZm5hT2krRU5kMXdhVlpySlNT?=
 =?utf-8?B?d1IwN3A3YytscVlFODF6Yy9RcHp1aE1wbllqejNHS3BpK3h5d1RGZGNJUjJZ?=
 =?utf-8?B?TjJjamgwVWZIc2NidVV2T1p0K0drdDg0MGc3ZUZVVzFCMWZKdXZ5dGEwRTZv?=
 =?utf-8?B?WmpxTzZ0MDc3RDVNT2JrYVRSUkNyRTllQ1lxVlovR2VlaUo5VlBsMEovN1NZ?=
 =?utf-8?B?Y3lTZGNOMWExUmJ4Y1R4MjFaSm0yOTVoZk5iUU5JTEV3NWxHdVpIWkdrUW8y?=
 =?utf-8?B?U2tRWHBIY3lXek5UdVNsVW8zQUl5cEpvdTJ2S1JDUXVXYXFsTjVDaW9tNzB1?=
 =?utf-8?B?em5lK1ZOb2VBNjIzUW5US20yMXk0SG1NVksvVGdxY2FCdDMvdVZzSCtqeFg3?=
 =?utf-8?B?OUwrZy9BNFZnTUxpZmVHQjVFQ0pQTnIwRXZKcmhyYy91MzE2d3VKUUcxcWhD?=
 =?utf-8?B?YXRXa2RyWmlKTGJJRFR2azNONThnSE1SdHB4S1lhdU5UZmJEKzVMRnVDVEh5?=
 =?utf-8?B?SGxvMzgrNTFyVkZFemowU1pieksralFjakRMbjlmZU82RjZnTDVUWTJUSHc2?=
 =?utf-8?B?TDVLNHFuUlYrV3ZBNFJhZ0NIV1VNc010T1hJM1NKNnBSSWV6LzlhWC96NzAz?=
 =?utf-8?B?SjVjUERRbTRxOUliQzc2ZjVNMndMRzhIdC9CZDFaL2pXL0owUURoZTZ1ckxD?=
 =?utf-8?B?dFh6TzRJZDlsM3IwNHVRWG40OXNxWVJrOTlyQzF6ZDVsTW1oN0lHUFNNNmg0?=
 =?utf-8?B?eUhIZ1RrL3ltN2Y5aWt2VjBYMXo2NTQyay9RcEhmek9jaXN2VW1DNmFPWkVK?=
 =?utf-8?B?RGxwek5GOHZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5580.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlljMW9WVnZCWFdzajQwelZGT3pXRnl6TjF5ZjU2MkU4ZkZZRk5qMUhRcXo1?=
 =?utf-8?B?WWtCaEFPekV2VC8wclRFU0x0NUF3ZFdrVzVxaTdKNERXWHByT0w0WjRqSXda?=
 =?utf-8?B?b2ZxVk8rR0lkelpmQUFTVjRoeDMrVVNlamtmejI0UFhYNERaUTFwZWxzYU1q?=
 =?utf-8?B?UVJGeVJkYzZpMXRGVlhRdVF4ZjcvOWRZVzZPYlZqRDU1MGNsdkgwekpIRUox?=
 =?utf-8?B?S2hYcmxqRks3VDhmR0V5R0drZm9JYTA3TnR5VXluci9OelhBbXBQcVpDUjla?=
 =?utf-8?B?RWpMRTM5YXVSdUdncGNEa1Q2d1pLbDd4VE9GdEg3cEE2WjQxVzVBZm1qbXR6?=
 =?utf-8?B?NHFnOHFlaTBDS2wrOEhSZTZCVGxuV2JHRWVGZld1Z3RQSHhSZDl2K3BYZ2Fh?=
 =?utf-8?B?SVZxS09KMXNFZENsSlU2Mlh5WTNRUTZhcFNodGpYWkhnY1RiMjRwSVp4aHlY?=
 =?utf-8?B?WDF5aVZrbXFYaCtOL0gzUXlYb05TSlNNSW44eUdxUFNjWW9BSkhHYW5YTHRq?=
 =?utf-8?B?UVR2T2dwQm11blFRWEpwV0swanFuZ1NPNnI4RHlxSmNkdVkrK0Z2RHhyMUJG?=
 =?utf-8?B?cXprU20yV09heElaTkVydnkwSG4yTllRVzFXczZIWE1NOWV6QitBYXdSQW5z?=
 =?utf-8?B?eFJYbTkzL1ZaREhoK2lqRGdGVW4xN1FwbThPYTZQeGpoUTg3bnlWbE1qWVA2?=
 =?utf-8?B?SHV2ZmowSWxYeHBkSCsrMEEwelBseDRnZ3djMXVoMUlQajk5RmdZQ2pvWURx?=
 =?utf-8?B?cU4wR2JkZmhHblFiOTkyNUpBek85ME5iSVE5aHlwL0h1YXNjV0p3Y1hUSW8z?=
 =?utf-8?B?TmIxczVzVVhxZ3Qxd2xqbnczWVkvOGZHeE1aTmJkOVNpUU80b1FYdEJVTVJN?=
 =?utf-8?B?SS9FQWRHK1BCU1ZzWTdZLzVPbjJZTE5sNnloOC9YRjhhTFB3S2JQck5PWGlq?=
 =?utf-8?B?dktwTzVmbC9hYTIxelFCdzNQNjN4aVM0OHhEa2liK045MjNGZGNSSUZkYmEv?=
 =?utf-8?B?cjFFTXEzSEMwU05GMjZ3OTZxZDBaV1B3bWNaTVp1VmRLcEtSNXlKTHFLWkNZ?=
 =?utf-8?B?M25PQm1YZHpNMGhka1pIVW54d05ES21BZkdZVWFNN21HODJWQmQrSkFZbVk2?=
 =?utf-8?B?TTFjMFZIK3VRdEk4SXhrR1YzbHc2a3p3WS9wRDR2UHplWkpCelpTcDdJMDFI?=
 =?utf-8?B?cGRyS0dLdnJvV1c0NmNhQzhmZ21oU1czNENaaFk5cXN3MkpwMWRJSnU0Z05k?=
 =?utf-8?B?TWlscFVNSlZDSkNjR3pZd0l0Z1pkaHdvU0VaL25jZUZ0OC9GN0FtN3NqUVY0?=
 =?utf-8?B?TGs4WU1nRnN3bGYraXBrVVVKWHVQVERLNGIyeDkwNEgyRFQvd1FhRitUSE9n?=
 =?utf-8?B?UktIK25XSVhRM01iUEo1U3pibzJMaFozYVBpMHMrUTh6Z3lSR0JMUFpDR2Fw?=
 =?utf-8?B?VVE1M3ZRM0Yvdm5DcnIyVDV5MExDM0hEV1YvbTBxdVgyQXZ4WHJYT0hZL0pI?=
 =?utf-8?B?TG9uMGtSSXR5T3Q5eUM2bEluUjJCRFh5clExOVZ4MWdzUXdBaExXc2MvQUNl?=
 =?utf-8?B?QWp3NFQ1NitYempxQk80YnNpRzFEZ1UyRTBmTCttNFdkK2Q4YUd5UDlSVHNm?=
 =?utf-8?B?bFBHWS9yQ1pzRnNQbS82d0VCT3FwWHlnbHl6NWlGb3NDK1NEdkRoa09JZmxn?=
 =?utf-8?B?cGcwKzVwa1hMRHRydkI4R0doejRMaXUxMi9YUGsyS0drd25OYktYWTVDMHZ2?=
 =?utf-8?B?NFRIQ2d5NmJGLzVkNjJlTjVZVUl1aEMyazdmenhkMjVVcEpQTTNZRWdjamhE?=
 =?utf-8?B?dDVMNlAyenBlWWdDMi9xQU4rMmYwaHYwWktraFUwMXQwN0xIUVJmV1FKS051?=
 =?utf-8?B?eE1VMkU5bjBvSHpYd2VBMTA0NWVwbWlMZVNYUTZDdXZ1UGxQMEsreXVsZjd1?=
 =?utf-8?B?ektnN2pTUFBEbXM4anQ0eUMzVGZsYzB0WHo5WFQwMk9ObUxLaW1DUnlLc2NM?=
 =?utf-8?B?YURyYmxRQzY5R3VQaEwvYXpUcFRlVzM5RzdHOGFMUFV6NzZ0T2FheCtYdTJQ?=
 =?utf-8?B?OGh6WTNJZ3BhS1p1T0N0UFBJNnJITnVJQzA3ZzU4elRuYzJWOFhzYVFsc1Nw?=
 =?utf-8?B?bFIwTFYwbld0M0ZhUjNRRElCd1NRbEdUY1RkTmptc01nN2dwRjRRUndzUzBD?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3605F692EF8DB47B6F027A6D00386C8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866df23a-67cc-4008-c3e1-08ddadad19d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 14:41:53.0739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1BD3oKVIxcRh5WXlJZmKBoVmbMiusHJEuxJ+Yt8xKh7WNc6lcZxWb1sIAlMAMzdO3kseuJypAZ2mOxTnTEaKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7962

T24gVHVlLCAyMDI1LTA2LTE3IGF0IDE2OjIzICswMjAwLCBKdXJpIExlbGxpIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBPbiAxNy8wNi8yNSAxNjoxNCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6
DQo+ID4gT24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgMDI6MzM6MTVQTSArMDIwMCwgSnVyaSBMZWxs
aSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiA+IFRvIG1lIGl0IGxvb2tzIGxpa2Ugd2Ugd2Fu
dCB0aGlzIChubyBzY2FsaW5nKSBmb3IgZmFpcl9zZXJ2ZXINCj4gPiA+IChhbmQNCj4gPiA+IHBv
c3NpYmx5IHNjeF9zZXJ2ZXI/KSBhcyBmb3IgdGhlbSB3ZSBhcmUgb25seSBsb29raW5nIGludG8g
YQ0KPiA+ID4gJ2ZpeGVkDQo+ID4gPiB0aW1lJyB0eXBlIG9mIGlzb2xhdGlvbi4gRnVsbCBmbGVk
Z2VkIHNlcnZlcnMgKGhpZXJhcmNoaWNhbA0KPiA+ID4gc2NoZWR1bGluZykNCj4gPiA+IG1heWJl
IGhhdmUgaXQgY29uZmlndXJhYmxlLCBvciBlbmFibGVkIGJ5IGRlZmF1bHQgYXMgYSBzdGFydCAo
YXMNCj4gPiA+IHdlIGhhdmUNCj4gPiA+IGl0IHRvZGF5KS4NCj4gPiANCj4gPiBSaWdodC4gVGhl
biB3ZSBzaG91bGQgd3JpdGUgdGhlIGFib3ZlIGxpa2U6DQo+ID4gDQo+ID4gwqDCoMKgwqDCoCBz
Y2FsZWRfZGVsdGFfZXhlYyA9IGRlbHRhX2V4ZWM7DQo+ID4gwqDCoMKgwqDCoCBpZiAoIWRsX3Nl
LT5kbF9zZXJ2ZXIpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2NhbGVkX2RlbHRh
X2V4ZWMgPSBkbF9zY2FsZWRfZGVsdGFfZXhlYyhycSwgZGxfc2UsDQo+ID4gZGVsdGFfZXhlYyk7
DQo+ID4gDQo+ID4gYW5kIGxldCBhbnkgbGF0ZXIgc2VydmVyIHVzZXJzIGFkZCBiaXRzIG9uIGlm
IHRoZXkgd2FudCBtb3JlDQo+ID4gb3B0aW9ucy4NCj4gDQo+IFdvcmtzIGZvciBtZS4gTG9va3Mg
Y2xlYW5lciBhbHNvLg0KPiANCj4gS3V5bywgY2FuIHlvdSBwbGVhc2UgdXBkYXRlIHlvdXIgcGF0
Y2ggdGhlbj8NCj4gDQpvaywgbGV0IG1lIHVwZGF0ZSBteSBwYXRjaCBBU0FQLg0KDQo+IFRoYW5r
cywNCj4gSnVyaQ0KPiANCg0K
