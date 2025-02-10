Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70B243374;
	Mon, 10 Feb 2025 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172587; cv=fail; b=D3IwyK3GPovJRMTJD4tJ/RM/9RMj4bG9bImPL/n+tQ5NZBv62sWOmFCZEC+NJ+m3t2gXPkmQxffchyi4b9b6STdDxUjknmDswfJdYa2CZRoYfyhOjyjrrPOWIwqSkaqNnGFGPygR3YCqnZ4D1627kZ8UpqEQwPXgOVqNuusRQaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172587; c=relaxed/simple;
	bh=VvVFjMxXyabxtpB2LxoZ5wseR9KQ5Ri/24WV67ihpkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dKoWwbjifD7hMhAwKNeHR26kCYLZlzCQAFV3pTqZGbo9WBznVEKcz8XWW/o1+t2Ob6dhdn7N2tLcPEgca9SPZJnOjGjcufQDc3vI2QNvjy7gX2E/g+P0cKQg9+2RAwuTgVoUkb3KBEjX8fhzaEofO9mrJ13aeicgzzNqbpqKdGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=G9rPepqE; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UUXkoSTn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G9rPepqE";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UUXkoSTn"
X-UUID: c9a83478e78011efbd192953cf12861f-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VvVFjMxXyabxtpB2LxoZ5wseR9KQ5Ri/24WV67ihpkU=;
	b=G9rPepqEJR3rOhqWrLlnTh7lbQ+7s7qaETZf3uKCaxIhnljR4+fP2jAmItoyDrUA+59QG8WjpZNysEAJvrO0Hb548TkJlgEgeph5h6tVHtiR2aj65n+OPWtSif9N4tuq2+Um4R5jjn9D95F2GVf4M1jWjwd0PgCAw0SF+103RLc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:811e44b5-489f-4bec-a27a-34b035922497,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:966d6bff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c9a83478e78011efbd192953cf12861f-20250210
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1937371238; Mon, 10 Feb 2025 15:29:39 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 15:29:38 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 15:29:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtUMd0cDvnKeGAurDoKhz8viCBgs3jNnel4XWb/km0jWe7c6A94bLfs9GLoHhbPD8nfdRDx9mGsRRXO/4k94TYMY86Hgtv9sVvx9NmJXNDBO4bY34yeYtVZHHWVXi4tfjntP721PV3/nokP94DfQbluGTf/db436ZJ76j+/2uhykkiTB6FSmB0DeBuu2hxabwgg6VwkyuiwWQsVBTedxlW4Njk5ZjI5+1YUUxBuD36Ol6nItns/fb8jB1Ia1T1BN3o95BrjZYZVjkdCZ52pt5Ozk8CtJOtVUTAtKPj1gqi4TVpzHbULcL/1coyAVUjLmtPVP35xtwhIZoyfI0ty3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvVFjMxXyabxtpB2LxoZ5wseR9KQ5Ri/24WV67ihpkU=;
 b=ZDQDtpcg6xbfi6qjHR+yfp0R2o486bsCcoRgcbcKXaBWrfsK0xQy4IQU6hwXfACI3uDuaGnfRj/5RxoVRsW9Sn3xGO+YKIsrZp0VLO6I60uzVQxyYhklh/2an9Ww7vB15hroU4uPN58bjdHoeR8gMbDQJAvTzZdph164Czpf4YUdkmjYpDLG7OUOul+NHoOOgEWs3p0DIVSfX6nQ/9H0sy9f4kheUjkV/tsSoar7YzJNkGqcWf7jQa9n6850OiInwSqqfO8iBAmTfCzIkFlWPccdWhX4K4sGBS7IKdnvdi35XZbRWFOZkOs40ra+9jD8gQ1W/lkepBaE8B8oqnhdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvVFjMxXyabxtpB2LxoZ5wseR9KQ5Ri/24WV67ihpkU=;
 b=UUXkoSTnTlEDKhjYmD3xQEg2Ps/C6FjDPkOVFyKIl3DzNv5VCEqTP8VPm9RK/An/nhk7NIajqBNwPD9F5He/9rzfZ8Xwyr45wJ6FxCFVG39pdv8e1BdTCbWoFQDpvZacqWUbIphj0QHM7dv8XQ6ET/UYbdSdT2SzT7x3XVzqcWo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7059.apcprd03.prod.outlook.com (2603:1096:400:334::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:29:34 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 07:29:34 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, =?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?=
	<Ives.Chenjh@mediatek.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 08/34] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Topic: [PATCH v5 08/34] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Thread-Index: AQHbZcr16XV74s4A902inkIfgb3AZbNAT3iA
Date: Mon, 10 Feb 2025 07:29:33 +0000
Message-ID: <8fb18b66093d28d4dc0a124d4a60eb1811eeadd3.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-9-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7059:EE_
x-ms-office365-filtering-correlation-id: 42c0c98d-24c4-42d2-ddee-08dd49a4aa79
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDBaSCtyRXZnek1TUHBrWmlPc2lxdHRLQ241cGxSemtnZEk2Ly9zRTgzV0pV?=
 =?utf-8?B?eng4M04zelRrci95QWZlZ1liNkJzdjR3eGdyMktqMkxsdkxqaTBoVXNzVUZG?=
 =?utf-8?B?emZvcjFkTjZrb2swOEFSM3ZCZnFCNk9IZ002OEdUZFRoaUNVdHhtVy9jdEFj?=
 =?utf-8?B?dXFyT3ZCR2M1bk1zRDBFdUk3bEloTU44d2FlMzJxV08yMGpHbXM5RGF0M1N3?=
 =?utf-8?B?T1RKblE1ZVY0L0xPYUFzM2U0MVlZVC9JSGMrS20vaGpQa2cvU2xDUldrOTdu?=
 =?utf-8?B?a1UzTUlta2IvVTBMNjM4VG5rYUlkeitISmFQbjNLTmR0V2JWb2dwRWRUbXE5?=
 =?utf-8?B?NmMwVFhxYWdHKzVpSmZFTVZZR1RjTkNVQ3pJZVdFMDlNN0cxbnFLcCtQSCtx?=
 =?utf-8?B?cjBGSnRrK2d1cDlnZytacHFHU3AxTFh5Vk4yNjV2WlZ4L3Y1elY5aGoveUox?=
 =?utf-8?B?WmhTRFRKdEVIRmRER0pmbWMxbDBzWmpLVDA0cURQaVZWMCs5YllJT0RZT1FJ?=
 =?utf-8?B?MEFVSEN2RU1DVGNDc1c5Qm1yaVE4MktUM1d1S0pncGVYWkRPREtwd1N6ZkVB?=
 =?utf-8?B?YnRlNnliMjAvUVA0RWxZNnNnd084b3hCVTc0U0c5YTl0cW5IUjFLZXdCelZF?=
 =?utf-8?B?YmNUdUZTMDVvaldXMmdJTWR6VDRzSVFSY0U1N0t2Y2VOUTlVQUVKSjJQRENM?=
 =?utf-8?B?YVJHMmN0MmFjRm4wZjJOZW1rd2RHRlR3UEEzZTlIM1ZvTDB4OERZS0RPeS9J?=
 =?utf-8?B?cHpSYkZuWWVzQm8wdDBvdUx6S2h3U3ovcDdTdWViRnI5ZFpQZmZlSWdlUFp1?=
 =?utf-8?B?SE96ZVhIcWlEbURqcDZqa2JVM1g4UkcyM1BzZkZoZWUzcjh5SUtjNWpMZlk2?=
 =?utf-8?B?U0NLNHRBQWNaaEp1QXRVYlhJZFhIelJMbU40VW44bmtkazg3WDdzQnZic0gz?=
 =?utf-8?B?bll2cE5XSDhvbGNVOGpXb0VoRWd2WHQ2YmgwMm1Rd0cvQkpzVjlWR3h4U3Ry?=
 =?utf-8?B?eTVOY0g3eEVwZ3NhUC9KR0I3VkRlWGl4UkpYWFJVcG1sY3UvR3BmMGgvTTVO?=
 =?utf-8?B?STVWU1psbmU4T3FOTFVseTl1SmpZZGo1WkVGZVU3eHJyckUxUDdBQmtHZ0lQ?=
 =?utf-8?B?T3ZMMmY1cjNxa0tEa25SbUtNcHZkV3N0QVFnYmpaVVpTazByYmpXWXlURXEw?=
 =?utf-8?B?Qm1abFB0NVd5MSt0TTAwS21ycjl3U0FXNG9MSXlsYWVRYjRncG1HTEVvN0l3?=
 =?utf-8?B?dWZ6R2UxbnZqOWo5VnFtMDhDQitRaUxMZ0lKOEFlUlBTL3F5cnFMbWY4K3Zu?=
 =?utf-8?B?VDM1SXBPRmdLRzRFZWNtTjNHQzRET2prcXpvVWpsSWo1NUlRalU5Q3JFZ3ZE?=
 =?utf-8?B?c0lyNUd0T3VaUHY5V1VUT3RmaG01TzZBRS92djJNYWxySGNpYnA0SUJSbWdC?=
 =?utf-8?B?b1ZkTlcxSmxFcmI4dTRGdVA4TmpwRGF6STludmNOUlFscHNlb0dSZ0ZkM3ZC?=
 =?utf-8?B?YThYUHdoQUM0NU1ibm42eVI4WHFHaDBBbkZCd0RHQXM0ZlpobkNrYVdrcWw1?=
 =?utf-8?B?d1RUUWpHYVUyRFRjSWhWaUovRWdEUjJRb0d1T1lWVzZTei9aSm9qVlVwVmlo?=
 =?utf-8?B?VVcwVi9TOGxNWE91U3NVZk5EUjFuVDF4c2xVVFVJODl6VVhXclNuaktnNit3?=
 =?utf-8?B?dDd5bFk4bzRsQ05pZFhtaGQ0aTJ6TVFWZDc0M3hUNE9yUTFFSVluYk0vekFo?=
 =?utf-8?B?VEtrdTlna3FkSkV4RVJERlFNeUhPSFJUNE9VTlVvdUtBU204MHJxM09rVklW?=
 =?utf-8?B?RFlVK3dsVU92c1B4dHJsYUFWMWwzNTNjMFZNWW44WE1Pd2h0WHR5Uk0xdlI4?=
 =?utf-8?B?REk4ZThEQTRQUkl4a2V3bmM5ODFrRittMDFJV0tkc1c4UXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2pFVGszQWZDbDIzN0J6bDk1UW1HazREMTcvVVVOS3U1RVkzMTJrRHhiRk1U?=
 =?utf-8?B?UUkzRnhwV1VaL203dkpJSUVqbEg5Y2ZhYzdPUzZmMU15Vm9XSVFqRWtpYUdn?=
 =?utf-8?B?VHpacytOQ3hlanBuVFBqcnVSZyt6d29SWk9Jd2lSTWk1TkNNMGRHczdIaERI?=
 =?utf-8?B?N2s3VlFWa0FITUMzR2lMSnlwTjRveDZUblZXdHRodWorWEh1WXoyODcxT2hC?=
 =?utf-8?B?cWhSN2NvZ2U5K1BlOSs0OFNZSnltazlQeGdlZ3lHUHdzQzVIR3J5WEVHRDZP?=
 =?utf-8?B?cllnemZ1L0RndDMwSGd0NWM2OXRROGgvY20vRm8xclhnakVXbHFEVDRBNFha?=
 =?utf-8?B?R2x2RjI0RmJxbk9qK1VHK3pralg2SGNmc0NrdWZWRDdTWGg3N3VHc2gvOXh4?=
 =?utf-8?B?YlFDbjNWTURWckh2Wi9zekdzWTRveGk0SWpOOS9SZ0p2UDBUM2kxZmpqTEdT?=
 =?utf-8?B?ZmFZSUI1UUlvdlVDWlNsU1pZQ0xnNVB5L1Y0V0E0VXR6ZDJueUVpNVBMWHc1?=
 =?utf-8?B?WW1HTlN5MTNEdFc4ajRlRHVCTkovY0ZrZ2lLcnQ5ZW1RYUF6N01GcW5wVytD?=
 =?utf-8?B?TWlwc3FpaDBQMkk5cFFFTVE2R1hreXFzdkNOa3lNeHo4MmhLRUQ2ZHJkZStK?=
 =?utf-8?B?ZVJWTTF0TzF2MjJ3QXZXRHNIaWVXNjlQNjZDanZJN1VDZXlBdDFCbXhCZjNJ?=
 =?utf-8?B?Z3NkVmhuNThMM21LVzhiYTBxdVJSSHNQVFFON2kyMmdlNW1QWVRoUlZOeVc1?=
 =?utf-8?B?RTIxVSs3cTJxaGxOQWVEZEM0NHV0Zm9vclFCUjR3ajB3Nlg5NzQrVitzaGRM?=
 =?utf-8?B?dFVRSjVkWEZsQUo3MkQ3SlpBWExBbmRlMklqV3pGUGVmMk9jVy9MekVCelB4?=
 =?utf-8?B?Z01hZkIxV3pRaGozMDRwMU9nbERuWmxHdnlSSHdMTDJQRDd4R3RXbzNDdCtx?=
 =?utf-8?B?bTBXbW92akhVUGFWZm5HTnpvVWVQeis0aHBIOXNHT0lXZW5SOWl0d2dpK28r?=
 =?utf-8?B?cEFUODNIVDJ3Q29rMG9ITnI5cm52SHZKMnlzeW9McWN6TXZLaEU5OUNNVVVw?=
 =?utf-8?B?RnRvVFNZUEY5N1hNdkNvUFpaL3NDenlmUlRDbVVlWlNFZ2RMY2R4cTV5Qmxl?=
 =?utf-8?B?eE11ZE40TGlETzRPUmE1Wk0wczVJQjJ1VE1OTWV3dVdQaGNxV0VORmgzK0dm?=
 =?utf-8?B?TTloTFBKYlN3eE1nVlgzTG9tS3BWaVdEN2ZBdkh1YTJJVVg5NzJGeW1ZNGE4?=
 =?utf-8?B?dzVTaGh1R0V6QzNhb1dOZER0UlVQcE5KVTJ5WWJ5dklCeUR0cENzaUE2RFA0?=
 =?utf-8?B?RGtEZlVvbmI3Ny9hK3FXc2RWcGVjYjJLendoZjhCRlpNSGF5dDF6Q0V3SFJG?=
 =?utf-8?B?azV4bTkzMHVpOE1hMk5kRThocUZSSk5aZ1lERFpEdzBRRWFKWHA2OVgwc3ly?=
 =?utf-8?B?MTRlOWp4K0tuOVBmMmMxMExHZW84eE5IT3g2Y2JhanNLTWtqZ0JTNkgxYnBm?=
 =?utf-8?B?V0JnclRWR1JNZVVOM25hSjJ4aXBZdlFnNStacWVIT3kvUUhGM2VKTUtFcUt6?=
 =?utf-8?B?UFZnZ09jSVVxT29WQ0R5akw0WEl5WU0yOWdmcDVOc2NuZTNIdklxRk5RL2V2?=
 =?utf-8?B?ZkNyaHhta2x3WW9rNnF5QmhPdWVGdEhZN0VUSnlEeFBSZmFQbE5mZk4yVlJZ?=
 =?utf-8?B?OVBsS2svTXRUM21WVGV3eHhEaFoveUdBVitCRUR4b0tZU244c1dEV2xlR1VX?=
 =?utf-8?B?Vm12alBaWU80SGMwY0oxaVJuS1RRY1R5YnFCSFBXKzFLRmVnVWNXR05KaDJK?=
 =?utf-8?B?eFlwL2NPdUR1ZExTUXVKZ09rUFlRMVZOcis3QllQY2plc2x0WGxQM25UTWVS?=
 =?utf-8?B?bURvYlVhK3RGZDdjc2djQ3lqQ3NiNnRSRjR3bE5lQWwzYldhSXpaM2xVUkFz?=
 =?utf-8?B?VFJqSXZNaWs1aUNCRDhZMVdDK3BKc0ZlVkl3TFZJQTJWQmd4SHJNL1lveWl0?=
 =?utf-8?B?dFJvdXNHcnhMSEN3RkZFdWo2MUNpcVprbUEwd2hTWHdPVUpWYkx1TXFSSHlZ?=
 =?utf-8?B?WHp5cUhVZE14RHgzekpsU2ROTTdOdHovck5DWVNtL051d1E3YzdtbWZRMnVs?=
 =?utf-8?Q?eetENAsbfWeN7wLGOtDayW1j4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04882582D5847143A3D8B9AA341C3688@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c0c98d-24c4-42d2-ddee-08dd49a4aa79
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:29:33.9730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+rH/M5a5Qjs35o3SJsQynEZOqAiNgQGN5CnQyJfSJQ5q3kCKxvR28InuVlAH8YW2t+2xkWXtxjJopft2UtHJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7059

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYSBiaW5kaW5nIGZv
ciB0aGUgSERNSSBUWCB2MiBFbmNvZGVyIGZvdW5kIGluIE1lZGlhVGVrIE1UODE5NQ0KPiBhbmQg
TVQ4MTg4IFNvQ3MuDQo+IA0KPiBUaGlzIGZ1bGx5IHN1cHBvcnRzIHRoZSBIRE1JIFNwZWNpZmlj
YXRpb24gMi4wYiwgaGVuY2UgaXQgcHJvdmlkZXMNCj4gc3VwcG9ydCBmb3IgM0QtSERNSSwgUG9s
YXJpdHkgaW52ZXJzaW9uLCB1cCB0byAxNiBiaXRzIERlZXAgQ29sb3IsDQo+IGNvbG9yIHNwYWNl
cyBpbmNsdWRpbmcgUkdCNDQ0LCBZQ0JDUjQyMC80MjIvNDQ0IChJVFU2MDEvSVRVNzA5KSBhbmQN
Cj4geHZZQ0MsIHdpdGggb3V0cHV0IHJlc29sdXRpb25zIHVwIHRvIDM4NDB4MjE2MHBANjBIei4N
Cj4gDQo+IE1vcmVvdmVyLCBpdCBhbHNvIHN1cHBvcnRzIEhEQ1AgMS40IGFuZCAyLjMsIFZhcmlh
YmxlIFJlZnJlc2ggUmF0ZQ0KPiAoVlJSKSBhbmQgQ29uc3VtZXIgRWxlY3Ryb25pY3MgQ29udHJv
bCAoQ0VDKS4NCj4gDQo+IFRoaXMgSVAgYWxzbyBpbmNsdWRlcyBzdXBwb3J0IGZvciBIRE1JIEF1
ZGlvLCBpbmNsdWRpbmcgSUVDNjA5NTgNCj4gYW5kIElFQzYxOTM3IFNQRElGLCA4LWNoYW5uZWwg
UENNLCBEU0QsIGFuZCBvdGhlciBsb3NzbGVzcyBhdWRpbw0KPiBhY2NvcmRpbmcgdG8gSERNSSAy
LjAuDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9y
Zz4NCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICAuLi4vbWVkaWF0ZWsv
bWVkaWF0ZWssbXQ4MTk1LWhkbWkueWFtbCAgICAgICAgfCAxNTEgKysrKysrKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxtdDgxOTUtaGRtaS55YW1sDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhk
bWkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwMDAwLi4wMDUyOGZkODc1NWINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtdDgxOTUtaGRtaS55YW1sDQo+IEBAIC0wLDAgKzEsMTUxIEBADQo+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1M
IDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1o
ZG1pLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFrMGFyVTFQN1dZRTZMc1dWZHRwZ00xZ1ht
QW9pZnkybU9CZWlwSWY5TnZEMFI0SEU0d1lEZFZGZzEwbGh6SmJoQm9KbjBWVExzOXFXM19OdHdD
S0dxaFVuX0pWViQNCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IWswYXJVMVA3V1lFNkxzV1ZkdHBnTTFnWG1Bb2lmeTJtT0JlaXBJZjlOdkQwUjRIRTR3
WURkVkZnMTBsaHpKYmhCb0puMFZUTHM5cVczX050d0NLR3FudmVNaGhRJA0KPiArDQo+ICt0aXRs
ZTogTWVkaWFUZWsgSERNSS1UWCB2MiBFbmNvZGVyDQoNClRoZSBmaWxlIG5hbWUgaXMgbXQ4MTk1
LWhkbWkueWFtbCwgc28gSSB3b3VsZCBsaWtlIHRvIHVzZQ0KDQpNZWRpYVRlayBNVDgxOTUgc2Vy
aWVzIEhETUktVFggRW5jb2Rlcg0KDQondjInIHNlZW1zIGEgc29mdHdhcmUgdGVybS4NCldlIGRv
bid0IGtub3cgaG93IG1hbnkgdmVyc2lvbiBvZiBNZWRpYVRlayBIRE1JIFR4IHdoaWNoIGhhcyBu
b3QgdXBzdHJlYW0sDQphbmQgdGhpcyBpcyB0aGUgc2Vjb25kIG9uZSB0byB1cHN0cmVhbS4NCg0K
PiArDQo+ICttYWludGFpbmVyczoNCj4gKyAgLSBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiArICAtIENLIEh1IDxj
ay5odUBtZWRpYXRlay5jb20+DQo+ICsNCj4gK2Rlc2NyaXB0aW9uOg0KPiArICBUaGUgTWVkaWFU
ZWsgSERNSS1UWCB2MiBlbmNvZGVyIGNhbiBnZW5lcmF0ZSBIRE1JIGZvcm1hdCBkYXRhIGJhc2Vk
IG9uDQo+ICsgIHRoZSBIRE1JIFNwZWNpZmljYXRpb24gMi4wYi4NCj4gKw0KPiArcHJvcGVydGll
czoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBlbnVtOg0KPiArICAgICAgLSBtZWRpYXRlayxt
dDgxODgtaGRtaS10eA0KPiArICAgICAgLSBtZWRpYXRlayxtdDgxOTUtaGRtaS10eA0KPiArDQo+
ICsgIHJlZzoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIGludGVycnVwdHM6DQo+ICsg
ICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBjbG9ja3M6DQo+ICsgICAgaXRlbXM6DQo+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBIRE1JIFBlcmlwaGVyYWwgQnVzIChBUEIpIGNsb2NrDQo+ICsgICAg
ICAtIGRlc2NyaXB0aW9uOiBIRENQIGFuZCBIRE1JX1RPUCBjbG9jaw0KPiArICAgICAgLSBkZXNj
cmlwdGlvbjogSERDUCBhbmQgSERNSV9UT1AgcmVmZXJlbmNlIGNsb2NrDQoNCllvdSBoYXZlIHNh
eSBhdWRpbyBjbG9jayBpcyBjbG9ja2VkIGJ5IEhEQ1AgQ0dTLg0KTWF5YmUgaGVyZSBzaG91bGQg
aGF2ZSBzb21lIGF1ZGlvIGNsb2NrIGluZm9ybWF0aW9uLg0KDQo+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBWUFAgSERNSSBTcGxpdCBjbG9jaw0KDQpUaGVzZSBmb3VyIGNsb2NrIGlzIG5vdCB1c2Vk
IGluIHYxLg0KSSB0aGluayB3ZSBuZWVkIG1vcmUgaW5mb3JtYXRpb24gdG8gdW5kZXJzdGFuZCB3
aHkgdjIgbmVlZCB0aGVtLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICsgIGNsb2NrLW5hbWVz
Og0KPiArICAgIGl0ZW1zOg0KPiArICAgICAgLSBjb25zdDogYnVzDQo+ICsgICAgICAtIGNvbnN0
OiBoZGNwDQo+ICsgICAgICAtIGNvbnN0OiBoZGNwMjRtDQo+ICsgICAgICAtIGNvbnN0OiBoZG1p
LXNwbGl0DQo+ICsNCj4gKyAgaTJjOg0KPiArICAgIHR5cGU6IG9iamVjdA0KPiArICAgICRyZWY6
IC9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRjLnlhbWwN
Cj4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ICsgICAgZGVzY3JpcHRpb246
IEhETUkgRERDIEkyQyBjb250cm9sbGVyDQo+ICsNCj4gKyAgcGh5czoNCj4gKyAgICBtYXhJdGVt
czogMQ0KPiArICAgIGRlc2NyaXB0aW9uOiBQSFkgcHJvdmlkaW5nIGNsb2NraW5nIFRNRFMgYW5k
IHBpeGVsIHRvIGNvbnRyb2xsZXINCj4gKw0KPiArICBwaHktbmFtZXM6DQo+ICsgICAgaXRlbXM6
DQo+ICsgICAgICAtIGNvbnN0OiBoZG1pDQo+ICsNCj4gKyAgcG93ZXItZG9tYWluczoNCj4gKyAg
ICBtYXhJdGVtczogMQ0KPiArDQo+ICsgICcjc291bmQtZGFpLWNlbGxzJzoNCj4gKyAgICBjb25z
dDogMQ0KPiArDQo+ICsgIHBvcnRzOg0KPiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwj
L3Byb3BlcnRpZXMvcG9ydHMNCj4gKw0KPiArICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICBwb3J0
QDA6DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9y
dA0KPiArICAgICAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgICAgICBJbnB1dCBwb3J0LCB1c3Vh
bGx5IGNvbm5lY3RlZCB0byB0aGUgb3V0cHV0IHBvcnQgb2YgYSBEUEkNCj4gKw0KPiArICAgICAg
cG9ydEAxOg0KPiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVz
L3BvcnQNCj4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICAgICAgT3V0cHV0IHBvcnQg
dGhhdCBtdXN0IGJlIGNvbm5lY3RlZCBlaXRoZXIgdG8gdGhlIGlucHV0IHBvcnQgb2YNCj4gKyAg
ICAgICAgICBhIEhETUkgY29ubmVjdG9yIG5vZGUgY29udGFpbmluZyBhIGRkYy1pMmMtYnVzLCBv
ciB0byB0aGUgaW5wdXQNCj4gKyAgICAgICAgICBwb3J0IG9mIGFuIGF0dGFjaGVkIGJyaWRnZSBj
aGlwLCBzdWNoIGFzIGEgU2xpbVBvcnQgdHJhbnNtaXR0ZXIuDQo+ICsNCj4gKyAgICByZXF1aXJl
ZDoNCj4gKyAgICAgIC0gcG9ydEAwDQo+ICsgICAgICAtIHBvcnRAMQ0KPiArDQo+ICtyZXF1aXJl
ZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0gaW50ZXJydXB0cw0KPiAr
ICAtIGNsb2Nrcw0KPiArICAtIGNsb2NrLW5hbWVzDQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiAr
ICAtIHBoeXMNCj4gKyAgLSBwaHktbmFtZXMNCj4gKyAgLSBwb3J0cw0KPiArDQo+ICthbGxPZjoN
Cj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zb3VuZC9kYWktY29tbW9uLnlhbWwjDQo+ICsNCj4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+
ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5NS1jbGsuaD4NCj4gKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPg0KPiAr
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgxOTUtcG93ZXIuaD4NCj4gKw0KPiAr
ICAgIHNvYyB7DQo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiArICAgICAgICAj
c2l6ZS1jZWxscyA9IDwyPjsNCj4gKw0KPiArICAgICAgICBoZG1pQDFjMzAwMDAwIHsNCj4gKyAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWhkbWktdHgiOw0KPiArICAg
ICAgICAgICAgcmVnID0gPDAgMHgxYzMwMDAwMCAwIDB4MTAwMD47DQo+ICsgICAgICAgICAgICBj
bG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfSERNSV9BUEI+LA0KPiArICAgICAgICAgICAgICAg
ICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9QX0hEQ1A+LA0KPiArICAgICAgICAgICAgICAgICAgICAg
PCZ0b3Bja2dlbiBDTEtfVE9QX0hEQ1BfMjRNPiwNCj4gKyAgICAgICAgICAgICAgICAgICAgIDwm
dnBwc3lzMSBDTEtfVlBQMV9WUFBfU1BMSVRfSERNST47DQo+ICsgICAgICAgICAgICBjbG9jay1u
YW1lcyA9ICJidXMiLCAiaGRjcCIsICJoZGNwMjRtIiwgImhkbWktc3BsaXQiOw0KPiArICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY3NyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0K
PiArICAgICAgICAgICAgcGh5cyA9IDwmaGRtaV9waHk+Ow0KPiArICAgICAgICAgICAgcGh5LW5h
bWVzID0gImhkbWkiOw0KPiArICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5
NV9QT1dFUl9ET01BSU5fSERNSV9UWD47DQo+ICsgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOw0KPiArICAgICAgICAgICAgcGluY3RybC0wID0gPCZoZG1pX3BpbnM+Ow0KPiAr
ICAgICAgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwxPjsNCj4gKw0KPiArICAgICAgICAgICAg
aGRtaXR4X2RkYzogaTJjIHsNCj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5NS1oZG1pLWRkYyI7DQo+ICsgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGsy
Nm0+Ow0KPiArICAgICAgICAgICAgfTsNCj4gKw0KPiArICAgICAgICAgICAgcG9ydHMgew0KPiAr
ICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArICAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPiArDQo+ICsgICAgICAgICAgICAgICAgcG9ydEAwIHsNCj4g
KyAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiArDQo+ICsgICAgICAgICAgICAgICAg
ICAgIGhkbWlfaW46IGVuZHBvaW50IHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmZHBpMV9vdXQ+Ow0KPiArICAgICAgICAgICAgICAgICAgICB9Ow0KPiAr
ICAgICAgICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgICAgICAgICBwb3J0QDEgew0KPiAr
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47DQo+ICsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgaGRtaV9vdXQ6IGVuZHBvaW50IHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90
ZS1lbmRwb2ludCA9IDwmaGRtaV9jb25uZWN0b3JfaW4+Ow0KPiArICAgICAgICAgICAgICAgICAg
ICB9Ow0KPiArICAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAgICAgICB9Ow0KPiArICAgICAg
ICB9Ow0KPiArICAgIH07DQo+IC0tDQo+IDIuNDcuMA0KPiANCg0K
