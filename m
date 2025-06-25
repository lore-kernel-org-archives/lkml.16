Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D2209F38
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837204; cv=fail; b=bBiXr/kCoJikGKzGcyQ/OX05gZ6Gmpv+7bm1T84X5LoKMPXIh5l9PIWNEQRePQRMw5qqsFEQLQcLhVT04hAXoeeNNSzcV86pmLAH29CZ9XOSMMr7QkGvOA5V6+fzFJ8qpi8BZerffS+uitCs6dneFfzBbxpk0vWcfqd6C1AbE1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837204; c=relaxed/simple;
	bh=9vx2PabTIUW61dnDvOvJB0zZCSmjCcdm5CUYdmp4Xvs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lI8YoP90cSC2EM0NtQMFn7pxsMVrRU8iomHV8kTIK7/XZ9wqw9C+vt4rZiisTN71D9oaYyT3THSgDoHNoRFIX0xd5vFK9V2pwZ+keFoxCMgDXC9mddASY/5q699hT2D1RrrDqRjVqXmX7XpSEs+odDNRRCtRnoa73JAOFYi4ryo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=urZ3n378; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Y/qmPSDY; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="urZ3n378";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Y/qmPSDY"
X-UUID: 97e42f9c519711f0b910cdf5d4d8066a-20250625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9vx2PabTIUW61dnDvOvJB0zZCSmjCcdm5CUYdmp4Xvs=;
	b=urZ3n3782xsxMDi9vjTrZgJXb6+UevWn5tgpFsA0ZkQ1drp3VCMkgbppzYaye2I0E2b3o3gN4ZMzvcTUIDvbkG/N5rEJD3GABRLpv/7ze8oKXBdl77TSvENmyDmSZl/0olTGZTpHYDNoxHKMKD+o2a1R0F/nmQlHH4+4EVN7lig=;
X-CID-CACHE: Type:Local,Time:202506251454+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:073db095-c9db-48f8-9116-d957addc0a3a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3b6d8b73-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97e42f9c519711f0b910cdf5d4d8066a-20250625
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1961139267; Wed, 25 Jun 2025 15:39:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 25 Jun 2025 15:39:45 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 25 Jun 2025 15:39:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncGb6zV3X44ho9SRCSx+bJPqTrm/YotbDEoW0nfRtsdyimRwR2ZZ1tbtyIhHsQAh7KHm90PChl7hatKsXbDYfvpTLySQCqecSJKuJGqa5m7sduOGHrNED+5SWCpZuktx4AiuPKYT7aTfKU3GP2srdxbSDHWT1E2Vkjs6KKPGgGTYpfgd6FSGjQHxUuEf4wYX0CuPGqsoiJzjc5iLCJWapewnZ1kwDYLWpwLI/shPxZ63Y2ZZDyz9JidnDR+SvLiRB9QtFpvfhLQS716s0PhIoHq76HshG+o0TfVQhcgyErEeAdKehYSh8JURRHxAwfVIkzNsLKDStPiEgqXzvdYZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vx2PabTIUW61dnDvOvJB0zZCSmjCcdm5CUYdmp4Xvs=;
 b=ql6GuCJFJzYsvV0hikHnaamQqseTv6sUkuvusn/qQeIaxq8405CoYXNi7d5wsfnvi8v/ky4bXHZc7fxLmV4X0LG0Aqv/2M0cUI37s/sbnKRTqufu/9+ED7DwtTVA/0mF5yK2TGzKP5V8mxGwJfKhZNOXUspGkL2WskVDBlFycCIMM1HO6aqCQ/JxI+XzsLAJMJ+q5xznoAA8naGhWxPRRBJE3dI4ZEOws9ZnwL8fwA7D2WhbAP0jgMtPT91LdUrCuYtLhdfBnpt/W2z2BYkNDrg8clR9cpfYw4o9nZeJECIBMMQSxfgGtgpo78Ub3V8niruNvYFYtDlGP7ReoY8auQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vx2PabTIUW61dnDvOvJB0zZCSmjCcdm5CUYdmp4Xvs=;
 b=Y/qmPSDYPVbKCjxOq5nyC6aS/HLiJzPGNwZB7YVfAxFaJEcTaK83VyAiyYwePaRdkEdUu+WcyMslvRV1D4U69GvNWtaHlXxswkY46Ax6RXjUOvxuhKAzfGkD2lsPNK+X08EsLaZp3EW4/o/EfzBPVgNpkvFT4u+lVr6Vy0pVF84=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8128.apcprd03.prod.outlook.com (2603:1096:101:16d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 07:39:55 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:39:54 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>
CC: =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Topic: [PATCH v2] drm/mediatek: Add wait_event_timeout when disabling
 plane
Thread-Index: AQHb5Pu3Dr4mFGbPxkCzfV6UGCguybQTchgAgAAMnwA=
Date: Wed, 25 Jun 2025 07:39:54 +0000
Message-ID: <6e7ab8ab603ed8ac06c7a6b639f339c1d87f9ad0.camel@mediatek.com>
References: <20250624113223.443274-1-jason-jh.lin@mediatek.com>
	 <669aae01778b4dbd49420fff053a6fa59078a9b1.camel@mediatek.com>
In-Reply-To: <669aae01778b4dbd49420fff053a6fa59078a9b1.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8128:EE_
x-ms-office365-filtering-correlation-id: e202478d-31c1-47ae-f716-08ddb3bb7a28
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NUlYMW1rMHZEajVvRW5GbzV1WC8xK01jZGlkaEJiWmpOMTJUaGFkUHBFTGw2?=
 =?utf-8?B?ZnJSWFdaSWZmZ0I5ckY1RDJnamZtWUh4Y3NWdTFXL1JoUkRGYlVBYWdCNnB0?=
 =?utf-8?B?dHloLzRjNW9VUitrak9oZEpKL1AyVDMwbitSSUZ6eWVGY3hZMHU1a00vV3RB?=
 =?utf-8?B?NHpIK3VBWHRWNzFJaHBtSjNTZ1VnQUhib2U0REw1Rk5Mc3Vvai9WajFDNjUz?=
 =?utf-8?B?RDZsRjlMTlEzV0VYQXhhV1hvb2J1RS9xY010Mzdpa3dGTWxsRjVGa3o2SXpJ?=
 =?utf-8?B?VnRFNHdOZk5WdTF2M3dMTW5KeGFvUEJqbTdTaEQ2djlxQUhMa2hXNm45czEv?=
 =?utf-8?B?Ymo0UWlPb0x1UHZmcEN2Q05MNEUzTGlMUi9sSnBoanVzSWM4bWdraVFiSmZi?=
 =?utf-8?B?OFBscjRORVdGcEc5YnhIWnFRekhCUkxKTC9UMEc4aFhOdFh5S0lWMGxMcUxk?=
 =?utf-8?B?ZVBrQmM3RjRyQ0h2YjBFNS9zaUoyVGpIeVhRc0ZSWElaSGc2ZVUrWE5oUGh5?=
 =?utf-8?B?NkZGQlhkQkcxMllaMnJsQjE5RlV5K0FzU290aWw5Z01XWThSSFBtMDIyZVV5?=
 =?utf-8?B?eGFHVVFqdkVpUzl4SXFQbkxBbk1lQXNjZCtoejRnNld0UEM2WDhTZENsWm02?=
 =?utf-8?B?MHBhSE1sdWZVcmZIUmM3Rlh3S2VFb01LdVNtY3UwYnRSOHd4OXRuUUpFdzlU?=
 =?utf-8?B?UWs5ek9VZXNqV2gxMkt1NVdhOStWN2M4bTZoTHR4bnhZVlpsNXJzdEZ6bFF5?=
 =?utf-8?B?Q3RUeWdKQ0ZxWW9xMTd3VlpEZ2psYUljbjhvb2o0NktNbHBoaWd1WjJwK1px?=
 =?utf-8?B?RDdtNUwzQjJTS05tbUJzOGRzYW1hT00ySWNqaVpCVkp6OHRqSG0vcUFsaXln?=
 =?utf-8?B?MnRJR0UzanBmcmRwbE10MUZEcEVjMll5U2VaZUl1ODdTWU1uc2gyYzVZbUdQ?=
 =?utf-8?B?SHdtTGFKQ3dCcWh2bUZmYW9YZHdkN2gwZGFkRlJPUHYxQ3lMM1VjVllleUt3?=
 =?utf-8?B?a3FCZkY1YVYzNVppZ2pqODFoeTZpY3NicStxa3dsZ3dpMk8zU1VEQk1acUc4?=
 =?utf-8?B?N1lqTWJqN3pIdXdLNytDVEsyM3BUamIwWERsNzBnRVVDQVhmZENmSDkzS3Bx?=
 =?utf-8?B?MWxyNlM2c29GQTZnKzVaTkU4NXZWMG9TVm4zNklGakZ2aTgwMDRnaGF1VFly?=
 =?utf-8?B?RzVYcUYwM2hwODgrd1phRVNzUytGaHBmT3oyV2NHMzdkM2pXdzhZVVZXbFRz?=
 =?utf-8?B?d1hsUUJuWS9kWDFCd3hJL1NwS3doMmY3N0pDZHdLdWx5ZWRKSGdFWDRBdVhq?=
 =?utf-8?B?U1luWVQ1MDIzaUJGbHNpYXlDcTRqTXp3T3hGcFBkZktqNXlkVUxZZ0VsTjZz?=
 =?utf-8?B?NVpzVzlVcVVEcEV4K05oN3NrN2VUZDhBank5QnhSdnQxMTJDd3FkbUtCNENV?=
 =?utf-8?B?Y290d2FvYW45ZE1Zbnp0ckFYK09DbU1jZGdJWk5mbWVlaXo0cWdKWlNyOE1E?=
 =?utf-8?B?QWxDQTV1eTViM2lsbkQ1MTJzaklabXRxUTgyVEg1VTZNOU1XZU1lTE4wUXlG?=
 =?utf-8?B?aUg5Q3NqaGs2WGVyRVFFSjI5L0JLaE1MbjBMV1k3S3BDNEhpL1VsSXF4VHp6?=
 =?utf-8?B?TFM0YmlHWUZqbk4zR0NvUHVRK2Z2N2t2ZjJ6MUtaSHFFb1d6a215dERoQ3Rh?=
 =?utf-8?B?RlJDZnk5cW5DcHZkSjNaODllajlIa2F3Qk8yeWtuMWc5algrSXo0dko1N2JW?=
 =?utf-8?B?MldsMnpPYVJseVByVVdaaUZrSXR4OTlHK05yV1BGRzdzclAyb25lNXBpVm9q?=
 =?utf-8?B?RkpqaVhSb3l5VjQydlJzUzdZT1Z5KzNTS0hlamRGNDNqUlJTTmZwSDNnOG5o?=
 =?utf-8?B?cWN2SVBHOWRQRW1kOTNzbmMxMWxqSXExWVJxUjAxdmlmVGpOaU9XS3Y1VFJp?=
 =?utf-8?B?UnhVNHI0d2JBNkhiRVlXbkdKUlg1c1NYZ2NFYkd4dGFyWXJVYUpTeHRXZ2t5?=
 =?utf-8?B?dmFvMXVySWNRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1UxclR0N2laWnl0WW1EOGhXdXF5eFZTc2hRcTlMazRCWDNLY0kxWnZoV2Uy?=
 =?utf-8?B?aEViRTVmdDlOZ0YzSHZrS0FkcXVVeEJ1UzIrb3Y3M0NBZlE4R1dmbVVpZ2gz?=
 =?utf-8?B?SU9pTFZFdmdjNENRaDRyNmFHV0xQZ1pDcS9vTE1WMWlnZHJndlFlTURvcUll?=
 =?utf-8?B?b1BLSHV0a25aOTNTbDlmYXVWbWFzcGtINnhwbFZDNjluVlZpa0NvZ2NFRE13?=
 =?utf-8?B?SWdzQ2h1czdNY0h0S28xZ0N4Y0QwQXl6dlJzUmNWYWlrZkhqbHNkK0YwQzBK?=
 =?utf-8?B?My9zdjZQQlRTdlJkWlZHTFhoVTZocGR1d1dSazJodUlDUnBTR0ttdWlrNWRr?=
 =?utf-8?B?QWRvVWtIU0xvaGxPS2J4aTE4ZFZSZWh3NjdpNEtGS3ZVYSt2UzJpdGRzU01O?=
 =?utf-8?B?eXd6ZnhXa1lKeDJnMDVRWC94amg4LzVmalEyUU1lZ2VRdW5HcFhyQ1VBSVFE?=
 =?utf-8?B?YlBmb3k1Rk1qYmEzV2pCMnVnTUV1aWhqcnBIclNpMW9oZmYvK2QzV0xqTEVz?=
 =?utf-8?B?VGRwUGZ3SXpxNnZSWXB5U01NYU1tKzQ4NDI1TXdsU2JYV2VhMVJ0cFlUU2d1?=
 =?utf-8?B?cGE5dHFEWnBCcExmVVR2Umh6YTdXZTFCbno5Z1pQWW4wYXN5c1NYZERpejhM?=
 =?utf-8?B?NzZNZlRVL3Y1OXNEZDZSZERzVXF1bHRpb2xieWFjVEYyQU1uZ0toUTdXWFlw?=
 =?utf-8?B?THZGMkZmQnh1OUh5aGVzbWZHODNkV01RWUE0akhJdENoOGdmQ3VnRmMxcUlu?=
 =?utf-8?B?VWg2UkVVYTFLZ240SGU5K2t4VEwwdlZtKzFoUmV4bkQ5MXA4Q0dBWThCOHFZ?=
 =?utf-8?B?Q2pqMEJNNXFIWTZmNXFJSEIzRm9Ka1JXakpQcTNIWjZma2ZPOThJa1lnUnhJ?=
 =?utf-8?B?KzRGaytFdmIrQjFpdWp3eHpGcHlVSjMvbU03bm9nMkY2VUZ1RXBKdm9HMDFm?=
 =?utf-8?B?cGY5ejNBUHVPcGpQaEFFSE9FaU9kdEJkbXB3cDA2bDhxZU9sbHMyamJiYTJ5?=
 =?utf-8?B?Mk9xa0x6WEt2WDRYOG53TTZwTTMwRDZwekxwNHB0N2xSMDI1WnN3Z0hiYkQz?=
 =?utf-8?B?c3ZmZmdWdG1HYzFwYnVZWUYzNmgxQnFKNDEzTlFPcUpaVG9TRzBsZVlBL3RD?=
 =?utf-8?B?cUMxWnBBNXpzZXhXY0tSZXJ6Y1dJYms2VFoybFhxVzB1YUg0SnZwN2p2ckVn?=
 =?utf-8?B?MmN5ejBCclA0ZTQzQkhKUUJoSFZsRWFvMXhLWkhNVUtSZlZiSHBQZTNRNjFR?=
 =?utf-8?B?QlJGVURQczBYTU5Id3BuejJ6cWl0MElieFM1TUt0b0Q4N3oyVGdidzQ4SHVJ?=
 =?utf-8?B?ZktZQ1hQT1JKbVRBNXI0bTRsckNwaEFXQS8zY1RMN1BUenhZRCtQdUxheEk0?=
 =?utf-8?B?U2JhMkZPS3NGSDVwNG9FNU5hcUhGTTIxTVRKaGpkSm44TWVnQUQ0OTA5RUxv?=
 =?utf-8?B?TVZVYVN5eU9iWUFRRVhJVVo4aDliNDdzZWZVZ2RDUVNsazNXMjM3Y1ZQdm5E?=
 =?utf-8?B?Zzh3S2VHZFR1VGxvYlNYZmZwVGZMZWRNZml5M3pkZUNxZnRwUVRZRVBNSjB6?=
 =?utf-8?B?MG8vVW1SM1ZBaFlhNTRza2hDcXJDb2xiVFQ0M0cyNnNLK1NMSisxd0VRTVJZ?=
 =?utf-8?B?SkpHZFQ4K2ZieXNQUzZSVit4OHEzeTZDUlJmSHZucEVMSzhpT0F4M3lHOGQ0?=
 =?utf-8?B?dkN0NkNMQ3NlUUtDUW9vZXZKMERxM1lyRHg5RFRrN3p6YXdpZ3RxSGVZQmh1?=
 =?utf-8?B?Umo1TGtROHFXK2w3ekloT0UvNnA3bHk1WENKU0txNnQvejVnaEFhVjQyUGxI?=
 =?utf-8?B?VC9lYUhRTmtGV1g1MWZnZkVncUZDbDQ2S2RwVWhuZ29xcU9IdHZzMWpwMTRX?=
 =?utf-8?B?QjFSWWxsRHNpZVViem12VXpXVVhoRjZKRW4xcWhqbGNuU1V1OU9Fc09KVVQ3?=
 =?utf-8?B?RFdUVkhZcDFqZHgzRlpTQ0JiZFc3a2EzYlE2VkNnZUg1Z0RpRkNhaUN4Uity?=
 =?utf-8?B?anBzcEhnWTRtSTBiY245YjlMSyszdjBmdlUyRVlzTUQrTU1oRGlYcmpHYmdt?=
 =?utf-8?B?ZzV1cURmMDlBei8yTzdmWkNlWXVTU1dsM1l3KyszZ3ZrbXUwcENscDVvRHZK?=
 =?utf-8?B?RVVXdk1KakZVaTNKWGFqQW94ZTZWQ0YyelQ3ekttYSthK0VrWmF6eGdlZUdS?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D2BE40C6F4F404E8851926BD4E890C8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e202478d-31c1-47ae-f716-08ddb3bb7a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:39:54.6154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InPm4XT/4XsUDQWIdEZ5rhA5Lxyozu1D9khBGM4VmYGD925N6pZjVDykLM04ffbdq0LADJEl98UDz1qPRyrrJKZXFY+5PEYEgJ1rfHPg7lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8128

T24gV2VkLCAyMDI1LTA2LTI1IGF0IDA2OjU0ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVHVlLCAyMDI1LTA2LTI0IGF0IDE5OjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3Jv
dGU6DQo+ID4gT3VyIGhhcmR3YXJlIHJlZ2lzdGVycyBhcmUgc2V0IHRocm91Z2ggR0NFLCBub3Qg
YnkgdGhlIENQVS4NCj4gPiBEUk0gbWlnaHQgYXNzdW1lIHRoZSBoYXJkd2FyZSBpcyBkaXNhYmxl
ZCBpbW1lZGlhdGVseSBhZnRlciBjYWxsaW5nDQo+ID4gYXRvbWljX2Rpc2FibGUoKSBvZiBkcm1f
cGxhbmUsIGJ1dCBpdCBpcyBvbmx5IHRydWx5IGRpc2FibGVkIGFmdGVyDQo+ID4gdGhlDQo+ID4g
R0NFIElSUSBpcyB0cmlnZ2VyZWQuDQo+ID4gDQo+ID4gQWRkaXRpb25hbGx5LCB0aGUgY3Vyc29y
IHBsYW5lIGluIERSTSB1c2VzIGFzeW5jX2NvbW1pdCwgc28gRFJNDQo+ID4gd2lsbA0KPiA+IG5v
dCB3YWl0IGZvciB2YmxhbmsgYW5kIHdpbGwgZnJlZSB0aGUgYnVmZmVyIGltbWVkaWF0ZWx5IGFm
dGVyDQo+ID4gY2FsbGluZw0KPiA+IGF0b21pY19kaXNhYmxlKCkuDQo+ID4gDQo+ID4gVG8gcHJl
dmVudCB0aGUgZnJhbWVidWZmZXIgZnJvbSBiZWluZyBmcmVlZCBiZWZvcmUgdGhlIGxheWVyDQo+
ID4gZGlzYWJsZQ0KPiA+IHNldHRpbmdzIGFyZSBjb25maWd1cmVkIGludG8gdGhlIGhhcmR3YXJl
LCB3aGljaCBjYW4gY2F1c2UgYW4gSU9NTVUNCj4gPiBmYXVsdCBlcnJvciwgYSB3YWl0X2V2ZW50
X3RpbWVvdXQgaGFzIGJlZW4gYWRkZWQgdG8gd2FpdCBmb3IgdGhlDQo+ID4gZGRwX2NtZHFfY2Io
KSBjYWxsYmFjayxpbmRpY2F0aW5nIHRoYXQgdGhlIEdDRSBJUlEgaGFzIGJlZW4NCj4gPiB0cmln
Z2VyZWQuDQo+ID4gDQo+ID4gRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRk
IERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQw0KPiA+IE1UODE3My4iKQ0KPiANCj4gVGhpcyBw
YXRjaCBsb29rcyBnb29kIHRvIG1lLCBzbw0KPiANCj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+DQo+IA0KPiBCdXQgZml4ZXMgcGF0Y2ggaXMgbm90IGNvcnJlY3QuDQo+
IEluICJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0MgTVQ4MTcz
LiIsIGl0IGRvZXMNCj4gbm90IHN1cHBvcnQgY21kcS4NCj4gVGhlIGZpcnN0IHBhdGNoIHRvIHN1
cHBvcnQgY21kcSBpcyAyZjk2NWJlN2Y5MDAgImRybS9tZWRpYXRlazogYXBwbHkNCj4gQ01EUSBj
b250cm9sIGZsb3ciDQo+IEkgd291bGQgY2hhbmdlIGZpeGVzIHRhZyB3aGVuIEkgYXBwbHkgdGhp
cyBwYXRjaC4NCj4gDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQoNClJlZ2FyZHMsDQpKYXNvbi1K
SCBMaW4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8N
Cj4gPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KDQo=
