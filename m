Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16D15445D;
	Fri,  7 Feb 2025 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908268; cv=fail; b=t8Ynd9jjxdEpapi/pxEfzxhyuUSSzM7ySZBax5bTJquiOmxiTvuCoKfSc8H9Ty3dLOdOJ+iXJBhmWtzfo3wYUi+eDJuYtOTQSeHYWs9u7lvM21ZNA1RiUclmirfXMJHxTv/hfpxdnaPeH7nvp7ePP74hrZ00R8+C546PscvuQ74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908268; c=relaxed/simple;
	bh=1qBvYCvwDSgqkEF0RJEgjfSwgICNXwTPLTeA7q2Ib9Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VcoEYEm0CR1LvPKi61S3uoS1y8JG93htQjtNYVWmOa61b/xJKPywKqBc/Gts7lHukq/UO00PQTwtsB7O4knsv2+HEYjedAT6wFYuetAFEW0rM8FHbgyZtBPxcfKy6d6FvMgw/BJ1GmqbGE9yCZw/JMwkcoOZE2hNXHHmhsUt3vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=uLLD9OmT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SVgx5gtK; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uLLD9OmT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SVgx5gtK"
X-UUID: 5f8f1d72e51911efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=1qBvYCvwDSgqkEF0RJEgjfSwgICNXwTPLTeA7q2Ib9Q=;
	b=uLLD9OmT3VvB/7QLqRxoX3hnjvCmD0ssgNpG7gxju/t0aHFF9BglYySbjjGB734c8DOux79JKYa3cHz+YV60xeizJsqh6bg5lO26Ws7DjvspRmYPNnYFDtRT9sFKsuzrR6mWXJ5uVWXdVSMELe/JoXjKfn/FGhvI5Ng1yRA37Ik=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8621b19f-612c-4822-accf-e95cdd7c8499,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a04649ff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f8f1d72e51911efbd192953cf12861f-20250207
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1757984327; Fri, 07 Feb 2025 14:04:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 14:04:19 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 14:04:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya3ap75BgA0CfFHr7nXj0wilcKi1ryF3p4ofMfpFMSkzPSfhb3FtXqYe8Tl6IfU/ogTLC8bMfpXZo1udP33h/QQEHYB0zB/SrHPGR86rH5NU0H1/SLjtzcgWR3F+ByGjhyl8vUFfe8BO5NEpM7bEJQqfz2lT1S0FjjNtBJMUtAv9af1SqFgvwvi2yoILFlr7n36dPBaEtz0gn7wvuA0vO4aCNu4mgasnOBhC92/Yb/Ucsq1+P0Su6XUTcOb0Byadit92+czMDLe/wv9+BQ4l+mcwEYo+zx2EcFxQzrRxOnJnwo5zhM/BQEnqeG5xsqHLbo1MyLczi2V9UjxG6LPmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qBvYCvwDSgqkEF0RJEgjfSwgICNXwTPLTeA7q2Ib9Q=;
 b=x9M1KO0jH3ViKQFsN5y3Y2zKlAbc4eebhkz2CZ/AeLHPn1pKbT72tR+vNkxo5agQZFZHtdnGyWu0MqXAzKWmjrKH4rqLS9U6zfIobwJ1IPgg6bfmWf5SmN8MQPKOehDo5nHY7yiZTAJB5O5Iebiuxz8/igrA5hAuD8uPA5uDtdQNm5S0tVhR1LLdilk9150GlkC6VmuHERD81EimZJp76IEig1uvscNvXqnbF2YJy1NztLDzpc3oyolhOvc1yd9esCIxcNgA8/f4VqMjPirRHT8plSbKZAqDmt9eL2Ruu0hEz4xv28ASEmfbS2BoA1Ih+HqlR8Fo7S4MEf3xy1uB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qBvYCvwDSgqkEF0RJEgjfSwgICNXwTPLTeA7q2Ib9Q=;
 b=SVgx5gtKyDOadkBN7o/9AoP/BGVw6t7c/qIVww0v2DWSHLJWpljjBAmaL3p5kSlODnLD52Kxfe9qX0UcoQp9TORvw3ayFfKls97V0xDl5WJRnJ/AXsIw1srwLkKmQKJDM/1cl2Xa/5U+jJK2HZQk69kJQu+O+dJFnXWcWMYXsNU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7632.apcprd03.prod.outlook.com (2603:1096:101:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 06:04:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 06:04:11 +0000
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
Subject: Re: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Topic: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
Thread-Index: AQHbZcr/gWWM2bti4UK/M/2kkSGki7M7gJoA
Date: Fri, 7 Feb 2025 06:04:11 +0000
Message-ID: <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-28-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-28-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7632:EE_
x-ms-office365-filtering-correlation-id: f94593c3-97b4-4415-904d-08dd473d3e3f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QkNmWS81bGdGMWI2NldHTHhWR0NvWm54UUpXSzNUTm91Q3BUZkhSYXlxRVZ1?=
 =?utf-8?B?RW5SL2ZCYTgxOVdqVkdPR3hFc1F6VVZzV096UUNrOHRkcEVzRjlLTkUxeis5?=
 =?utf-8?B?ajcwL3BwSWZuYXZuNjBDSUZGN1NVcjNrMnRjL2pFaENmNTRkRElCQmpYSjBV?=
 =?utf-8?B?KzFRaWRLQWE5Q2lOQmxoVXZJeWVnNHJ2MUpEem9tWm1sWnpacStKdEJFYW94?=
 =?utf-8?B?NmRLOW1jNnJuSzNkbDYrZUk1R29nYnF3TTRXSXdmU3kyai8vTFBmM0Q3WHJT?=
 =?utf-8?B?TUpVTDdjY2VDNjA4SVBZcWRISTRMNldncWpUZ1ZvMDhKWTIvTXczNDZPc2ZU?=
 =?utf-8?B?cE9CWkNCR3V2blM5b2NwVEp3anpBOG0vNWJscFhPU2JzLzVwajUrZ3NTYXVQ?=
 =?utf-8?B?ZiswcmJlUkpYSVo2ckN3RGQxd2ZJWklxSHBScm5zUGp4UjJVdU4vdFp3SmRl?=
 =?utf-8?B?bXFoOE9VRmpWMEZLLzY4S0RqMHRSMWZXYVFLZzJDTnhYcFcrR21FUUJLZytp?=
 =?utf-8?B?ZktxZW40aEdPTmZwNmRtTnFLMGh4WlVwUEZaUkd2UzRjeVg0NkJJc0lxb1ZM?=
 =?utf-8?B?RXNxVVVjeDJSNHpZdmJYbVN3bWg5elIrOUcreW5CenhmYU9TSkk3aGN4RVNk?=
 =?utf-8?B?TVE0dDd5LzhPY1hhN0d1YyszRGEwZHQydFVLUXE5SmUzN3VxTGQ3MEZLbksx?=
 =?utf-8?B?NzBsV1VnQ0xtczluTW9jU1l2aXl0QjBYOXhwQjV4dERlUDB2RXBYM2xWY2kw?=
 =?utf-8?B?djBFaC9OVGxQeDl5NXAwSkRNNHVLVmJwNWRpNTBXcTdDNHh5WUl3Q0VOUTR3?=
 =?utf-8?B?RURWR2xnUkxGbkRlczlZbDZSZ2lZVFNPWnhMR1hTQXVHTjVsRjhZWENzVWo1?=
 =?utf-8?B?VHFCWGQ1eG9oQUpNbnpnakEvTWlBVDdyV1BhNEFPd0lNbE9hamFBMUp5VzVh?=
 =?utf-8?B?V0dxWENlemVJSzVHekltd1BNeXZ0cnkybGlhdm1pQmtuNnV0WUp5ZTJnb1A2?=
 =?utf-8?B?a2RFbnFvQVRIOW1LeG9URDI3M2RKU1ZabTN6RnBFOTR1ZzFpcEVNT3E0cVFj?=
 =?utf-8?B?Uldmc013cjBQSkZOK3NYYXc4UG80NEF6VUsreGlNRkU3WUdqalc2R1RRNXNX?=
 =?utf-8?B?c2lWamQyb29DY3FOMDJtV2tIdVJ4c09sUEVpUHpXUlE4bW9zd1RNRFk2ZFl1?=
 =?utf-8?B?NmZ5czBCVUZMd1JxVkYvNHcyU1RPVDV6a3NQd1VMRlQ0OEp0dGg3NC9BeWFF?=
 =?utf-8?B?UGlxdmdDcFVBRU91T2cxN1JMMFIvYThZOEx5TTJCbnFiV042WHVxSk1aNlVa?=
 =?utf-8?B?YXAxeG5yNEMwTHp5dGhScXdUWmpCRkNKTWEwRUgza1NtVk1JZ0l4MnNDMjRJ?=
 =?utf-8?B?M205REZPNmdZYTREZU40Z1pTUmhvNnFqTjRSV2gzeElTeGt2Nm9lUkkxdWk0?=
 =?utf-8?B?anJQa1R3NUExZFlzK2dvcS9hUytPMGRiTkxIUXdiRys2MnQxQmFHWDJiM3FE?=
 =?utf-8?B?UU92WDJNYllSZTUyQSt0ajVKNkttd3hVL2NPUmx0ZkdjT0tmTzFrME8yT3Zk?=
 =?utf-8?B?QVNhVVM1c0tyOHhsdW1HcTRuWWFobjE5cnZKZG1SRkg1MlNvNUNVeHdLL2JQ?=
 =?utf-8?B?dGRDMk5PcTIyL1FkYkZDbDJXNm9wdUVJbWpRZXpNV3FDdVhKcDBPUTZpZEIr?=
 =?utf-8?B?SVZBWGg5eGFDcXB1VVFGUldObFhDbzQ3aWFXQkx1ZmtUOU5UWi9saEhsNTYz?=
 =?utf-8?B?UHlEY2M5bVFJSURycnkvNUJoRmZlRDdkSVo2c2h5dWxQcmg2TXBnSzVoOWlE?=
 =?utf-8?B?TGNhMlNqN1pnUExIbG1XZGcyMml2bzU3RTNqbFZOcWk5bFFpM1UzQWpwMHU0?=
 =?utf-8?B?OWRzeXVVZTBNL3R0WUV0MjBqUWVGMWVVNVM4U205bU1kS2YwNHdFdlViTGM5?=
 =?utf-8?Q?CF9kvOtbZ6PuhF0AV/XPbJYU6XixOYP2?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3Q1UWs2SHptNmpQM2R4K1ZpNDZJNndjb1JwdExEa3RKNXdTV0p1SUVHbndk?=
 =?utf-8?B?SmVLNXpOZEJWK0wrMFVYOTAxUHNVaDJuQ0Rjd3RqZ2wzbzZYd04zeDBzT1Nz?=
 =?utf-8?B?MVhVckRwWVEwSGliSGlnTktXQlNSYlU0ZllVV05mOE9xdWI1dWZkRDZ5M21Q?=
 =?utf-8?B?aVNFbGFiSmFRODFQemh0bS9zMEo5dE8zbUE4a0Zwc2xGRkU2c3RCN3VYVmZI?=
 =?utf-8?B?bnd5TzVycG92dnlhbVlxUDFIcDJSLytaSkx2Z0tiYWMvdWUzOUFMZzdISCtO?=
 =?utf-8?B?S1JUYmZlRHJYZ0hmWTQwb0QrOHl0T3o2MUFvcXdKNlNYK1YzWnc4YTJaUk9u?=
 =?utf-8?B?QllZQ29aamJoc2duVytVWVdtMDI4cHBTeVdkT3N3SWJhTmVCanNRa0xtQkhu?=
 =?utf-8?B?NGNFUVZiNzRkMU9INHdJUitIUGNWZk9TYXJ0bTJ6L28wNUlENzJsaXRaYnB0?=
 =?utf-8?B?ZnIwMWk2Qyt5enA1VzNITFFpSk54bElmaC9HK0lzcVhZRTc1Y0RBNTI2d2sw?=
 =?utf-8?B?V3lFazA0eElQKzJST0JKNnpMSEhxSVlQMXRRSHgzTDNvbU4xTDdmditmQVJw?=
 =?utf-8?B?K2pXRE9aaHM4bzg3Y1VXN3JkcjcyNHdhblBJK21EaEdRdElDdkJZRHUrb3JD?=
 =?utf-8?B?M2EzbnZWYjQ4QW14R1l1bGp6cHdZY3V2c2pwbGwwWU4raHNzcDRiTmYwbGVC?=
 =?utf-8?B?NzNjNmxLZEdsdVVqRmZ3Z0twVTh6aGY2cjJXS2NpcG8wWHJGcW1HKytBU0Ry?=
 =?utf-8?B?ek5NT0pNaFZPWE8veWMwRTRxamczVXp6TU9FRytkNHZudzhXUjdDRlFPclRX?=
 =?utf-8?B?S3l6Y0tiVkJlTU1XUXpKUW9tV3Z6cnZycDU1SHJ5cTEzS2t3L1RFZ3J6NFh0?=
 =?utf-8?B?YjFCWEYzQWk4ZUl3bmNOc2NVUFV2Y0cxb2RXODRKUGNEbDFUL1BIMEozTnBr?=
 =?utf-8?B?NzRQOG5wVjVyL2ZaVUlEc3BLcDg5bnd4SU5CbkpRUkJiM1BpUmJ1b3VOMDIv?=
 =?utf-8?B?KzNNWXFBdFVmMjMzaEczUGJWYzdSTjRYKzhQdHRjQlB3Mnl4Y1N3eVNhWFR3?=
 =?utf-8?B?L21HUkxsWXBxTlI2Z3ZabHBMOXlGdDRjSS9kSmMxWHppQ29PRXJ5SElYNkE5?=
 =?utf-8?B?OXpvbi9WZkhVTWJoN1p0UHB0UW1ZUHNVSHRGbUZ3RmNCc25ZL0JIS1NJc2VE?=
 =?utf-8?B?MUxBRWwwYkdkWHlrWW4yOENvQktGR1RpUEwzQklPR09KQzJmZFhtNERtMW81?=
 =?utf-8?B?bjZ3SEN0QXh4Rm9DRTZUTUFPODJzR0ViS29kTW4zV0ZBajIxbVFrZ3Arc3Av?=
 =?utf-8?B?UWxUUjN3Y2hUdS9tc0FpNStxS0pubzMweGR0d3RVcXYvSWVnbHJBZHRYMHJi?=
 =?utf-8?B?eTBTaEtkaGk4cDNWc09IVncwTGlha1cyNHZjNk1NOEMvWVB6bFRWUzBqVFhT?=
 =?utf-8?B?WitRVmtSWUwxRjlSMUY1MEFqRW8zOGpRcUtxeHRrUEVtVHdnMUxkeVhrenNV?=
 =?utf-8?B?VjQwUGxVbWpkV3piM3FxQWhKMGROOVBtQ0tEN0s2dkl6cng5aGhxQlYyUGNq?=
 =?utf-8?B?aXJMbHFBSGQyWHIrTlRFTGs3ektOVFVOVHBYL09RYTN0YzU4czlTUnhiTzNO?=
 =?utf-8?B?bmN1WGVHQWZtSDJKV3FQaXRVMjJpM0VLTWtCTnpZRFJDa3lFN25OUjNtOERw?=
 =?utf-8?B?MUsydlVPOG1LT3lrSkFoRWhjcEhQeXFWUWNtcnZ3Q0NReTVJZWJZdXN5OFVj?=
 =?utf-8?B?cGNzZlZJbjdlUXFUS2ZURE5GVzdhdGxuNkk2UnQ0QVpUTmw5UTdIUEoyUk5C?=
 =?utf-8?B?aFA2N0c1K091MlRmdzc0RDhnN2lTZHRpR2dXaVVydzNYbFREdzhZejJOc1BO?=
 =?utf-8?B?NWFjUFJUZkVjUzRVVnkyZ29LWmExVHZXNDk0YW5JakZiK0NPamRRVFhTU1ZJ?=
 =?utf-8?B?dXo3SUI5SHlvVDhZTjY5cm5lQmo0SjVhRUFubmViUEJDajRxSnMxdjI3dmFh?=
 =?utf-8?B?c3B4amZVRnJ4VUg5MWJYYyt0bExSRXNCMkVVYk5JaEwxSzhBb0VRSUFrak5F?=
 =?utf-8?B?SWxlK2paUWpCTEdvYlB5U2tLTFNCS0NYcUZSc2pkOWVMaldpMkNScGl4TFFx?=
 =?utf-8?Q?DOzCTQHI0XxwIThjrQAJ0KxHK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA1E074D74DC8043850A008013C9F40C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f94593c3-97b4-4415-904d-08dd473d3e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:04:11.8948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tOWtgdeVZxu6/BjS20IfFMb3GQuNh74pjpO7n5diPvNAgkGNoOqViLBvqgn+zzVq+WNQ87/h1urfxuCsVULGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7632

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBSZW1vdmUgdGhlIGVycm9y
IHByaW50IGluIGNhc2Ugb2YgbXRrX2hkbWlfY2xrX2VuYWJsZV9hdWRpbygpDQo+IGZhaWx1cmVz
OiBzaW5jZSB0aGUgQVBJcyB3aWxsIGFscmVhZHkgcHJpbnQgb24gdGhlaXIgb3duLCBoYXZpbmcN
Cj4gb25lIGluIHRoZXJlIGlzIHJlZHVuZGFudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vs
b0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCA5
ICstLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gaW5kZXggNDBlZWE1
YzEyNWQyLi5jNTQzMWYxNjBmZTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jDQo+IEBAIC0xNzAzLDE1ICsxNzAzLDggQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBt
dGtfaGRtaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHN0YXRpYyBfX21heWJlX3Vu
dXNlZCBpbnQgbXRrX2hkbWlfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHsNCj4gICAg
ICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWkgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLSAg
ICAgICBpbnQgcmV0ID0gMDsNCj4gDQo+IC0gICAgICAgcmV0ID0gbXRrX2hkbWlfY2xrX2VuYWJs
ZV9hdWRpbyhoZG1pKTsNCg0KSSBkbyBub3QgZmluZCB3aGVyZSB0byBwcmludCB0aGUgZXJyb3Ig
bWVzc2FnZSwgY291bGQgeW91IHByb3ZpZGUgd2hlcmUgd291bGQgcHJpbnQgdGhlIGVycm9yIG1l
c3NhZ2U/DQoNClJlZ2FyZHMsDQpDSw0KDQo+IC0gICAgICAgaWYgKHJldCkgew0KPiAtICAgICAg
ICAgICAgICAgZGV2X2VycihkZXYsICJoZG1pIHJlc3VtZSBmYWlsZWQhXG4iKTsNCj4gLSAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+IC0gICAgICAgfQ0KPiAtDQo+IC0gICAgICAgcmV0dXJu
IDA7DQo+ICsgICAgICAgcmV0dXJuIG10a19oZG1pX2Nsa19lbmFibGVfYXVkaW8oaGRtaSk7DQo+
ICB9DQo+IA0KPiAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG10a19oZG1pX3BtX29wcywgbXRr
X2hkbWlfc3VzcGVuZCwgbXRrX2hkbWlfcmVzdW1lKTsNCj4gLS0NCj4gMi40Ny4wDQo+IA0KDQo=
