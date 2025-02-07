Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFEE17BED0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899535; cv=fail; b=SuJfweVMW3I/L6FXMq+htbvi3RslW5xXvdWGLhud8QnnryzPnBQrcVrKZ2y14/0OArhNYb8IWb5apJnAEtfEZ33y0pN5RBzHbUVMfwNoFOE8u1wY7sWgzDq9JswLbSsZS+o30AFUoEK0oQOg9SAqUnZ5FaBFW/T9mL9TgEVCi9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899535; c=relaxed/simple;
	bh=HF9Qfo8Jvu7o3figJQxcaa0Vn+VuyctHF+HBESIs79s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mKrwWa5J23uVoYvw3I0alO30DvLkA6O+zKbMd96sZly3dX8LRNVOuZxlmjcfzn+5kKEB/w6iTp37XS0Omp1tHZSu3IeINdMRnORtb5eaDVp6RDayuWydhhjxJKQHeVNURm5eShRSarMWy8Ru0m+rYf9JXlWkLR6Db+hp4y+gauI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GNbauTyE; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dq7sMQdd; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GNbauTyE";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dq7sMQdd"
X-UUID: 098485fce50511efb8f9918b5fc74e19-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HF9Qfo8Jvu7o3figJQxcaa0Vn+VuyctHF+HBESIs79s=;
	b=GNbauTyEFt+9qUGeMjAko36b9HPe3DZ42/gCNIU1XANIWld4x2PrTLw4lB9fuALcbd9oM83BsalLAFEWqdAL/WzAu53mljqVBdf6OHVSs8JEDcwrOQkUymu3Mf49lVC/SZmpCmEPWoZXaE4NsDOyyio+cXZSAU+5HGfriN2wjKk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:7fb7a208-0cc8-4eb8-93fe-960a74440348,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:287547ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 098485fce50511efb8f9918b5fc74e19-20250207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 23542450; Fri, 07 Feb 2025 11:38:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 11:38:45 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 11:38:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGt5FjjiWJ7hwwKzDj3FKj4SHl6SUWOlToxP/9ASwSyFMAXPcHr5q3D5CpWR3rTYSymzoc3AeMJ3/y/P/c4MZAVc8hMsaDnHJRCHrcjHVjshXE4VOgxfIEMjSN5hp2YgadBi+lV8CWGkc55vFJ33u312q4R5kjNS6C9P2ocEYE6uy4fRldDfKUkU61WX9JReTKMeBtgT4utwXSAHHKR1a/ucw76eGMem7iDPmXau9rdkEK8Ibu9Zrj76wvNcw8zjUJ0wxFNhrNrEifm1jqc/6Xe/FvX7E8rRZsYAH2V0aMNRaZlg86wbpj5X3N3AVVUGZ5+MgrPvWosRxKPGfA1iAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF9Qfo8Jvu7o3figJQxcaa0Vn+VuyctHF+HBESIs79s=;
 b=QGlpycIv2J1HkYFrcpUVt0f8Fb8Lap6/G6FXbFgYvfgxjiMGjvdjbDHbgvl3082fO0/uIcmhAZeH9pivdzrgTmlLO4vrajlQ6GkMgOAZqB2QcRJHf/maPDI/tWjbj7B/fFLr3Nft4dD/UajJgAI5FgvGfr0jefXEz91VgjPzLAMsQPnmUNkS0lDzH8oaXANWhpG9hX8Pm6WHOq6YaAgxOvvi0gjsPar0xBEvA5nE9O12lzPqx63SpBFhZv8VYCzejzOAyAph9e2wkhEEeD6BdgNz/YfeH43XbNPcaSyj1AYlkZ39w+W2xFb3Y6FplkA5f+gCwVMwuXoPzMwssifbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF9Qfo8Jvu7o3figJQxcaa0Vn+VuyctHF+HBESIs79s=;
 b=dq7sMQddgV9lC2uIiY+qJhMhSg0uf2V4CM29prbKIxqxyOlQOp/HK8zJwR40nxxVeAS9w7B2ikLX59ewWyy1NN6goiClC0/nRiwmwfYSFHgJcC/Vf9jmtIjLRfsOyFpiXUELMDt4wVpwRwDh3I22U9/BiakyLJGgnRVlYl9Y1lI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8203.apcprd03.prod.outlook.com (2603:1096:101:1a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 03:38:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 03:38:43 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "dianders@chromium.org"
	<dianders@chromium.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
Subject: Re: [PATCH] drm/mediatek: dp: drm_err => dev_err in HPD path to avoid
 NULL ptr
Thread-Topic: [PATCH] drm/mediatek: dp: drm_err => dev_err in HPD path to
 avoid NULL ptr
Thread-Index: AQHbaD40GiIFQuGoy0KCDdwQn8sm7LM7UxQA
Date: Fri, 7 Feb 2025 03:38:43 +0000
Message-ID: <5f04e7bf5d9618f1a61eb77de63fc1c6731762f1.camel@mediatek.com>
References: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
In-Reply-To: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8203:EE_
x-ms-office365-filtering-correlation-id: e6c596da-ff9b-4e40-1d70-08dd4728eb7c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHl1MHpCYXo4VXNWZTl5eFlBUXNBY29lV2FPL20rcTJPLzQrdWdvSkxHMlBK?=
 =?utf-8?B?SW5XMERhM2krOTVCTithRlpPZEFRU0hqeUl2OE9mYUxkSzE1ZmhDRU4zZlFx?=
 =?utf-8?B?QW9UUWdJVHJiSlBNNzlJS2UwRzBhZzVrSWFWQlVHV3VCcmJNUmwxQ2tzbGFB?=
 =?utf-8?B?aHpYSWZZUHZtNzl0OFNTWUpLbFM3dzdabWlIeFpZWnlBNnM1bDFFNDc5Smk5?=
 =?utf-8?B?bjNrV1FiQ01UVmpudG0rUWhsRDBOMlA2dUhTZ1ByRXFidWdZajUvQTFHZElq?=
 =?utf-8?B?WmtVU0pCK0lyOHJJRkxlZ1NVbnRzUDRrVktGanZkajYwOVo5OGhJY0FiL3U4?=
 =?utf-8?B?N1M5a0xBRnd0Y3RVa2lXZSt6VWZMUVphOWpBZEYxYWtUWGVadk9xaFlPZGV0?=
 =?utf-8?B?M3lHM3dzUU1rUjBBM3dRT0t5dWVLZXZ5SnZRSVZ3ZTlzYzBlbDF3VmV6Y0Ex?=
 =?utf-8?B?RzJzUmh2WlkzOGt0ckRJMHUwUzR5TzljWVBjMU95ZWFiRnFuY01NMStyeGF0?=
 =?utf-8?B?VFpNZlc3T3A0SDQ4MDNlQkZRNE9ZaHFhSUhLZ3JUaVoxcGkyOENCclF2QXdT?=
 =?utf-8?B?dDZkRldwREVQZU1NOHNXRnQybk92R1hoWTNETkt4NDNGOWkzSlA4Q0xXOGlq?=
 =?utf-8?B?R3VRM0EyRHpmbVNtRHlYS2YxNjM2QkJOWURMNStIS1BOY2pOdDMydGg5Uzg5?=
 =?utf-8?B?RUFwUFUzalBlN1NqN0dsUFhxbTMxdUthejVKdmdZTTNrU0crbVY3RStLREhB?=
 =?utf-8?B?RHY2eUhFYWdhbHdOQ3RVU0g4Nm5QeG5nMEgzeU9aSTd1cDVBa0ZnNmtzK1N0?=
 =?utf-8?B?VFRhMm1rRGlsVXhHSUdIUkNqSHYrNVRzblFkUENYakV4NDg1ZDFZZ0g5L21T?=
 =?utf-8?B?OUxEMEIycnRhVlNnZUk0OEVRQ21IbHFKRFkyYS8vcjVOTGxQN0VwREJQOGUv?=
 =?utf-8?B?dXF6QXpoK0UySUVZN1EyOTBVR3c5WkljNjJGcG1GSkpSWkhtLzcrUERyWjJr?=
 =?utf-8?B?YkVOMjR4cjhGazN0RWFwUW5KUEM4M3dlSW9VMjFvR3k2alI3ZklSekozZzdM?=
 =?utf-8?B?S1hJY1hiNHVQemNiZDF5MU1KSlpDYVNobHdlQzRoaW9LVC9oMFQyWTBGZGRP?=
 =?utf-8?B?a3hDVVBhcVgvaVV1WVUvYyt5L3dhb1J2NTQ4MzFMTEpsZCtKNHRVV2xlM3FO?=
 =?utf-8?B?OGtXTGRPemV0L2N0Nkx2enJPL3RtbXRxZ3RpdUUzR1pkZnpPN2pXZG9uTnB3?=
 =?utf-8?B?d2FkMFFxa0FqZlp2YzNoT1c5R0ppcVc0T3kxYUFkbkIyRXJGUTFYRlFvVUEz?=
 =?utf-8?B?UWkwZXJJTGNXSFVqUFB3TE1sVEpPVUhKd1lrbHQvMldnL0FXZEFzdVRRYzJy?=
 =?utf-8?B?VnRXNHd0NGdaY3RXR1dLeEFHdkM5eGQ5TUZLUDNkYjc0VTRlK1NGWkVvbGFw?=
 =?utf-8?B?aHI0Mjcvc3lQVDV1WjlnWW8wNXN6RU45VGhJRGVBVHV3bXZ0S3JpK0M2QmJt?=
 =?utf-8?B?TXJGcElLTkZ4NnVmblhMMTJJdHBSbm0wcVRqTFltVGJXdTUwNUpueHVjK2pV?=
 =?utf-8?B?UFQvaXZCWU0rQUwveFM3R3RSbFhrM1h6VUxFd1U3RGQzMm90OGpsRkoyQXY0?=
 =?utf-8?B?ZkJGckhuUXNjTURpQktTYndsL0xxR2tJaHhmOTVnVWZ0TkpIRE1PM082WTN6?=
 =?utf-8?B?bDZpRUEvR01NMjV4SG5aY2YxVFdtQUJ2L2Z3NFNIYlM2SGpGSit2Sm5UelNs?=
 =?utf-8?B?elZHR2l6WG1YeWlvREVDSHVnc29tNHM4Q3d2MjlNTTRScGMxSGpDRUQ0SkJJ?=
 =?utf-8?B?OSt3OGVmTlZ1YlN4MTBVT1RaN2JvUitldnhuYUh0SlZWa2QvOFBkdFlHWk5J?=
 =?utf-8?Q?Me0eP4AvR7d09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpoRjlVUXgyaGxZQmtIMVYwd0lnMFNYTUlxQ3F5Sm9oaTVpQ2ZpeTRMTXZT?=
 =?utf-8?B?aXFVZzVKTm1VMWxCZnRBaDBBcEMxNWhaSFpnbkViZ2ZvekdTRnk5QThRS3Jl?=
 =?utf-8?B?U1BadUQvOVZBaGcvNWMzeTVldnlvWHJtc3JaMUlVdTE2b21vN3ozL25Wdk1P?=
 =?utf-8?B?bTZXdXVWTU9PUGdjYWVlekxtbkRvbG41LytlUVJ1YXh5eDdJdDlTSmhzM2sv?=
 =?utf-8?B?ZUNqbG5VbmZpVFhmNkl5VHRmSDloYU1VQjU2SmRWdUk0SzVjQ1hMdll1NGUy?=
 =?utf-8?B?UDhWU2NIOVg4S3FPNXNTTWVEUDU4ajgyYm1JVTJyMVV6RExzeWQrWThvZ2Nn?=
 =?utf-8?B?NUNkKzJPSGh0TzZ6c3FRdnFVUHVvZ2w3N1RTSXBmb3NBR2VMMTc5MXVxTlRy?=
 =?utf-8?B?Nm5ZUy9EQWJ4YnJSeTc5aG5Kb0RBSS9MK3dCc0RCbVFMbFQvRmRreXZVWUM5?=
 =?utf-8?B?SWV5bmZMdm1zdXhaOThmT2xsNnBwWVQzVmxOaVlWRjJZbHkrbTd3b3Q1MlVO?=
 =?utf-8?B?TlRSMDhBSElnMWpXcjN6Mk9reXZuTFM3UnV1cXNUaTZma1ZiWnlMbStHMVQ1?=
 =?utf-8?B?VERHZmlRRTdDS3JrSWYzWTZ5ZkxTQnBPRUJQOFhiRVRDV1dJZWk1dWtWTTZr?=
 =?utf-8?B?Q2FVaEFiTEpIK2JWd0cvMFIwL0gwaVBTaWNDRC9pTjRmdDhxaC9OTUppWlJs?=
 =?utf-8?B?b28vVmdlWnROMDNhT2pPMkZxMDB5NHB4Uy9XODZLdDFPK2V5OU5UWnVhaXIv?=
 =?utf-8?B?ZHJld05EMkZvMkRPVjZDeWZoaGQ5Y29xOTdLRVdpaTdnRGhDUjJQWVRmK3dQ?=
 =?utf-8?B?ZS9IZitlTVFzd081Vmc0WWFMNkIrY0Q2dmtQa0pHOVZhT1g1d0VBTVdVdVFN?=
 =?utf-8?B?L09qSFc0Smo4clByMjVNaDRqcURsbVNQU3o4V2ZpdmJ0U3dxZERZbTNWSzBF?=
 =?utf-8?B?QVpNUmZyMGVvb0U5WWZMTkF5Z2RLUlJEY3EvRy9lM3phSFUyVWpQRlgyY3h0?=
 =?utf-8?B?Nm9pQ3dqUGNOQ0JZUWlUanM1TUQrd3lTNEtlMC8rb3lpVHppS0svNWtmUTVM?=
 =?utf-8?B?TUFKaGhoMGJQbWZ6dW9meG4wLzhSQm9Gd25Xd01pK0tEQmFGeTFySnBIalA5?=
 =?utf-8?B?WjlHWEc5Unl6TS8wVVZzU2pROTY2OElIVWpkN1dYTVJReWNRa0xROVVLRVo5?=
 =?utf-8?B?aEhTYXVlNDkvNEN5ckZabmJqRTlNK1ZSK1o1dEFXeThJTXdWM0Fma0huWFVD?=
 =?utf-8?B?LzZRZ1lSbWhnd2FFalRJNmFzUlFKR3VmR1Rna2lqbDl4amJxTFVnUTVKNzAv?=
 =?utf-8?B?c0lSREV4czQwNHdNL2hIQlNCTzdvSENSRktodUI4R2ZHZWZCZE5JdFFNd3ZV?=
 =?utf-8?B?eEw0QWxMNEdMbW11OTRZLzhHSFl2a0oyREZOeFViNGxSTWlQNURvUThYYlFP?=
 =?utf-8?B?M0poYTRWSlUxenlRM25zN1FTcm5pM2FZQUxDSklaUERTUkZZZlcvTUE4Q0VH?=
 =?utf-8?B?NmpiaDVwbkdWQ0I2S3JVNzU3eTZpL1g4WkdweEVJSnNUdU43eUYvcXBVcmpu?=
 =?utf-8?B?b1ZPY3NURm5QV2xTajdlTElzU0FZdG5oRTkzVWZ1MnprNWg1Ulc4Z2JRN1lX?=
 =?utf-8?B?SXFCUDQ5SmVBZEhBcndjU1VjRkZLRVc3ZHcxMExMdkZGcXdsS0tFTkovcDF1?=
 =?utf-8?B?bklWRlhZZEcvNnVxR2FRd05FSUNKMGN6WkN1NnFTbWRXRTJ1ZCs3SFFZdWNs?=
 =?utf-8?B?UWtuNVByS3NHR0EybysxZXVrc1Zyekl0d3FpN0xyaU14eUNxMkxINnFqTHFa?=
 =?utf-8?B?Ky9YWElRSTFiWURJQjI0NkY3YzUvWGdYcmZPbnUrSDdCZ2dHelAvZ3BwY2Ux?=
 =?utf-8?B?VTRJR3U3blNjc3ZQWDk2SGRMNWdycndVL0kxT1RXQ0FoN1BlbHdDTUIzaWZy?=
 =?utf-8?B?YjVsU2wxR2xsVlJCWUxWL3lmRm43SjBTY0E5YnpyNjI2a0ZXdmo1RjF4QVpO?=
 =?utf-8?B?QXB5OVpxS1NRQjNiWTBtazBsSlRrbTAvaS9nUk5LbVFrZnh4WnE1UXF2T05B?=
 =?utf-8?B?QTVkUTlFcjIyZjJHTnVJN2RnalowelV6cTJOOUZGZEUzTnV6TVhWcDJRRVNt?=
 =?utf-8?Q?A3jKEO8cITlksp7OrIEzzvrQZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3D821A61A6E604FBC5A9E49A2176337@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c596da-ff9b-4e40-1d70-08dd4728eb7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 03:38:43.0951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QWajYT1GmC5i6IplpxvIC2S5bDnXcUgbHVYxMVLHnD9sEJl0qL7vyLB4zYJsvymA1F/Q5jLGFFc7mpTnQd4eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8203

SGksIERvdWdsYXM6DQoNCk9uIFRodSwgMjAyNS0wMS0xNiBhdCAwOTo0MiAtMDgwMCwgRG91Z2xh
cyBBbmRlcnNvbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNl
bmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgZnVuY3Rpb24gbXRrX2RwX3dhaXRf
aHBkX2Fzc2VydGVkKCkgbWF5IGJlIGNhbGxlZCBiZWZvcmUgdGhlDQo+IGBtdGtfZHAtPmRybV9k
ZXZgIHBvaW50ZXIgaXMgYXNzaWduZWQgaW4gbXRrX2RwX2JyaWRnZV9hdHRhY2goKS4NCj4gU3Bl
Y2lmaWNhbGx5IGl0IGNhbiBiZSBjYWxsZWQgdmlhIHRoaXMgY2FsbHBhdGg6DQo+ICAtIG10a19l
ZHBfd2FpdF9ocGRfYXNzZXJ0ZWQNCj4gIC0gW3BhbmVsIHByb2JlXQ0KPiAgLSBkcF9hdXhfZXBf
cHJvYmUNCj4gDQo+IFVzaW5nICJkcm0iIGxldmVsIHByaW50cyBhbnl3aGVyZSBpbiB0aGlzIGNh
bGxwYXRoIGNhdXNlcyBhIE5VTEwNCj4gcG9pbnRlciBkZXJlZmVyZW5jZS4gQ2hhbmdlIHRoZSBl
cnJvciBtZXNzYWdlIGRpcmVjdGx5IGluDQo+IG10a19kcF93YWl0X2hwZF9hc3NlcnRlZCgpIHRv
IGRldl9lcnIoKSB0byBhdm9pZCB0aGlzLiBBbHNvIGNoYW5nZSB0aGUNCj4gZXJyb3IgbWVzc2Fn
ZXMgaW4gbXRrX2RwX3BhcnNlX2NhcGFiaWxpdGllcygpLCB3aGljaCBpcyBjYWxsZWQgYnkNCj4g
bXRrX2RwX3dhaXRfaHBkX2Fzc2VydGVkKCkuDQo+IA0KPiBXaGlsZSB0b3VjaGluZyB0aGVzZSBw
cmludHMsIGFsc28gYWRkIHRoZSBlcnJvciBjb2RlIHRvIHRoZW0gdG8gbWFrZQ0KPiBmdXR1cmUg
ZGVidWdnaW5nIGVhc2llci4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IEZpeGVzOiA3ZWFjYmE5YTA4M2IgKCJkcm0vbWVkaWF0ZWs6IGRwOiBBZGQg
LndhaXRfaHBkX2Fzc2VydGVkKCkgZm9yIEFVWCBidXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEb3Vn
bGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiBVbmZvcnR1bmF0
ZWx5LCBJIGhhdmUgb25seSBiZWVuIGFibGUgdG8gY29tcGlsZS10aW1lIHRlc3QgdGhpcyBjb2Rl
LiBJDQo+IGhpdCB0aGUgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIG9uIGEgZGV2aWNlIHRoYXQn
cyBub3doZXJlIG5lYXINCj4gdXBzdHJlYW0gYW5kIGl0IHdhcyBydW5uaW5nIChzaWdoKSBhIGhl
YXZpbHkgbW9kaWZpZWQgY29weSBvZiB0aGlzDQo+IGNvZGUgd2hlcmUgdGhlIGVEUCBzdHVmZiBo
YXMgYmVlbiBmb3JrZWQgb3V0IG9mIERQLiBTcGVjaWZpY2FsbHksIHlvdQ0KPiBjYW4gc2VlIDxo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9jcnJldi5jb20vYy82MDczNzQ0X187
ISFDVFJOS0E5d01nMEFSYnchamIxUVYxVjVoVUVFZG9idkZpaHpXODhxUElUV2N1bHpza2EzeTVH
dEZCWHV4aWlPV2VhdmhxQzVHSXRQRHpiUTBKZGl6N2hFR3B2YU9kc0N4QSQgPi4gSXQncyBwcmV0
dHkgZWFzeSB0byB1bmRlcnN0YW5kDQo+IHRoYXQgdGhlIHNhbWUgcHJvYmxlbSBhZmZlY3RzIGJv
dGggY29kZWJhc2VzIHRob3VnaCwgc28gSSdtIHBvc3RpbmcNCj4gdGhpcyAiYmxpbmQiIGluIHRo
ZSBob3BlcyB0byBhdCBsZWFzdCBmaXggdXBzdHJlYW0uDQo+IA0KPiBJJ2xsIGFsc28gbm90ZSB0
aGF0IHRoZSBmYWN0IHRoYXQgbXRrX2VkcF93YWl0X2hwZF9hc3NlcnRlZCgpIGNhbGxzDQo+IG10
a19kcF9wYXJzZV9jYXBhYmlsaXRpZXMoKSBmZWVscyB3ZWlyZC93cm9uZyB0byBtZSBiYXNlZCBv
biBvdGhlciBlRFANCj4gY29kZSBJJ3ZlIHdvcmtlZCBvbiwgYnV0IEkndmUgb25seSBiYXJlbHkg
bG9va2VkIGF0IHRoZSBNZWRpYXRlaw0KPiBkcml2ZXIgYW5kIHBlcmhhcHMgb3RoZXJzIGhhdmUg
YWxyZWFkeSBkZWJhdGVkIHRoaXMuIEluIGFueSBjYXNlLA0KPiB0aGF0J3Mgbm90IGRpcmVjdGx5
IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4NCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gaW5kZXgg
MDY4NzY3MmYwZTUyLi5jY2QxMDRkODg1MWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwLmMNCj4gQEAgLTE3NjMsNyArMTc2Myw3IEBAIHN0YXRpYyBpbnQgbXRrX2RwX3BhcnNlX2Nh
cGFiaWxpdGllcyhzdHJ1Y3QgbXRrX2RwICptdGtfZHApDQo+IA0KPiAgICAgICAgIHJldCA9IGRy
bV9kcF9kcGNkX3JlYWRiKCZtdGtfZHAtPmF1eCwgRFBfTVNUTV9DQVAsICZ2YWwpOw0KPiAgICAg
ICAgIGlmIChyZXQgPCAxKSB7DQo+IC0gICAgICAgICAgICAgICBkcm1fZXJyKG10a19kcC0+ZHJt
X2RldiwgIlJlYWQgbXN0bSBjYXAgZmFpbGVkXG4iKTsNCj4gKyAgICAgICAgICAgICAgIGRldl9l
cnIobXRrX2RwLT5kZXYsICJSZWFkIG1zdG0gY2FwIGZhaWxlZDogJXpkXG4iLCByZXQpOw0KPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJldCA9PSAwID8gLUVJTyA6IHJldDsNCj4gICAgICAgICB9
DQo+IA0KPiBAQCAtMTc3Myw3ICsxNzczLDcgQEAgc3RhdGljIGludCBtdGtfZHBfcGFyc2VfY2Fw
YWJpbGl0aWVzKHN0cnVjdCBtdGtfZHAgKm10a19kcCkNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIERQX0RFVklDRV9TRVJWSUNFX0lSUV9WRUNUT1JfRVNJMCwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ2YWwpOw0KPiAgICAgICAg
ICAgICAgICAgaWYgKHJldCA8IDEpIHsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Vy
cihtdGtfZHAtPmRybV9kZXYsICJSZWFkIGlycSB2ZWN0b3IgZmFpbGVkXG4iKTsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X2VycihtdGtfZHAtPmRldiwgIlJlYWQgaXJxIHZlY3RvciBm
YWlsZWQ6ICV6ZFxuIiwgcmV0KTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dCA9PSAwID8gLUVJTyA6IHJldDsNCj4gICAgICAgICAgICAgICAgIH0NCj4gDQo+IEBAIC0yMDU2
LDcgKzIwNTYsNyBAQCBzdGF0aWMgaW50IG10a19kcF93YWl0X2hwZF9hc3NlcnRlZChzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqbXRrX2F1eCwgdW5zaWduZWQgbG9uZyB3YQ0KPiANCj4gICAgICAgICByZXQg
PSBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCk7DQo+ICAgICAgICAgaWYgKHJldCkg
ew0KPiAtICAgICAgICAgICAgICAgZHJtX2VycihtdGtfZHAtPmRybV9kZXYsICJDYW4ndCBwYXJz
ZSBjYXBhYmlsaXRpZXNcbiIpOw0KPiArICAgICAgICAgICAgICAgZGV2X2VycihtdGtfZHAtPmRl
diwgIkNhbid0IHBhcnNlIGNhcGFiaWxpdGllczogJWRcbiIsIHJldCk7DQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiAgICAgICAgIH0NCj4gDQo+IC0tDQo+IDIuNDguMC5yYzIuMjc5
LmcxZGU0MGVkYWRlLWdvb2cNCj4gDQoNCg==
