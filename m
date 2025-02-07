Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BE53A7;
	Fri,  7 Feb 2025 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738905872; cv=fail; b=uYadYeZ9xJYWxfNwX1CZH30KfywK4/gPmHRwd1uBlbELT466YE85sWJULgywBD9x9/frFua57GVatPF5tO3TFN5rilab4N919emXUXhmQtfgcYRmm6+IF8vWqvZvGGjOGowP1siUQZqY1EFwSxRk5IK2d5aNZD5qTd2l1GOwWGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738905872; c=relaxed/simple;
	bh=jkPuey8bBRIW+dZkyFrLAXs0cFRkbxDHghYWS7UfNZg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ysm63iDOnyRfRPf7Wv5Bg2BYeodRuFlvvBLUaPXpD8xcqyWPi28i61cjf5PmkWRMn0EfCyXIFgMW9VbGEBdfOPVN5T2M2wb/IRveKW2gXNBMUYV2wE8IuPYciGfDduqIKZ6N8Bab8y9lRVZbYAVwIBRlsY53AddWu9LHi31J/Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VGo0iNh8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bz+m7Bcd; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VGo0iNh8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bz+m7Bcd"
X-UUID: ca84edece51311efbd192953cf12861f-20250207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jkPuey8bBRIW+dZkyFrLAXs0cFRkbxDHghYWS7UfNZg=;
	b=VGo0iNh8SjV1CdTWEeI6CGMMu99G1BL3X/+ZSxZXq+0puzTUTYDfOeGnbXmmL8w9YzMUmpDQh8iDC2Y85vOZYqH/Yjof7tQK+mSaCz0/0BGyBwfHgQ2KC0Vy+4vgyVXwSP/lsOfmbTbQmdey1YBu0dX2rDkFwaVi64QS09pfnXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:53477fc9-a773-411f-8497-7a2f2229695b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:811e2e3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca84edece51311efbd192953cf12861f-20250207
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 769265718; Fri, 07 Feb 2025 13:24:23 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Feb 2025 13:24:22 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Feb 2025 13:24:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMYiXD8eq9DT3T97Z04nu28ipEDfx7+TRyu0YZSrM02rGa2zMgoVn7W9fwj3RtU1jy7VdLLbkGGGC44pZYiz0i1no9rZt5FuyZWlQLjL5Ps+SXQUMchK9NT9ayOJOv/ezNUnDSLqyvM9LG4uin7tSuTaCD0uq18i7WES6c100SklOgPwO8Y8K87lBoWlYXioZYC1EhZNaaJRoWJSTXnTb6HcM6eP5TmKc04MfTvma+5c6ddeWNW7sRQ88Jns0S1BVWKbZnqXBWnqIf2XQVXZx+FD1IJDw0CAzKeJUPI3IWozOQ3s7+Ct2V4qBc0AZmTXWyfrhvCzg9em6T4furzgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkPuey8bBRIW+dZkyFrLAXs0cFRkbxDHghYWS7UfNZg=;
 b=RdTky5XJQSPF2evOpIPsf26zGE3iURncPGWoyBZZszKNTDtpH781dUMsIQMESay9tHXopyM42IUVbyoW7V+6rW+VqfexyQkE3c8vlg9jz366kGk8OGABKqg9Af9gN8HacvF6e8my2XuG3UQ0MH1R4row1VeABgMIolokPiAFOnPzLyNn3OgJgBJE0obDIEmYrNsB6Tu8zagnO9RuHEXlCt2klnJL5fCkkjHGhxwpwB15Xu60OMim5IzX1Vqfphj9pAECXtTyiI+6OFun9ZeitYDUJLYdfrQSdY4azBYFmuWGuaADXXjIlwnHTJGV4t1kcpoPyZN21cSYtDE0Kbre1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkPuey8bBRIW+dZkyFrLAXs0cFRkbxDHghYWS7UfNZg=;
 b=bz+m7BcduhsatpJ2yb2ar2O7zYCp0A39Wz8qRaLwGE8Jo7+doi+VQ8maj7e1cJ6JKCzmSpcIwjT38LkyS1Jr168pDS+ecq8sXnj7bN3TTNav0knwXk9iHNC6RNhc7FLvEFkc0bS7s5S9P3Qi2RiSmqHXCY8CRbSP0o322YkHmOw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8631.apcprd03.prod.outlook.com (2603:1096:405:89::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 05:24:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 05:24:19 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "kernel@collabora.com" <kernel@collabora.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	=?utf-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, =?utf-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?=
	<TommyYL.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	=?utf-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v5 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in
 mtk_hdmi_dt_parse_pdata()
Thread-Topic: [PATCH v5 20/34] drm/mediatek: mtk_hdmi: Use dev_err_probe() in
 mtk_hdmi_dt_parse_pdata()
Thread-Index: AQHbZcr78IIgVvCqO02oR4xrP7ymW7Mlp0yAgATuTwCAEN/gAA==
Date: Fri, 7 Feb 2025 05:24:19 +0000
Message-ID: <b24ed09b5db136161b601e23bb1454e3b22ca43f.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-21-angelogioacchino.delregno@collabora.com>
	 <cbbdc53ea47f0e7ea02fc7d197664819958ea2cd.camel@mediatek.com>
	 <cf030cb3-81c1-4ff8-9ad6-c82f743241da@collabora.com>
In-Reply-To: <cf030cb3-81c1-4ff8-9ad6-c82f743241da@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8631:EE_
x-ms-office365-filtering-correlation-id: c6a3bd6b-78f1-4727-3f42-08dd4737ac3a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXZkS1kwWE1pZ1ZTRHkraEh4b0ZkT3djMEwxd3pyZGZSZ2o5eGd3Q1c3SVE1?=
 =?utf-8?B?REJBREhCRWlvVHBKMzM3SFRwcy9Ma1BWUlJsc28vUG9DM1JuYzdBTUpieS9r?=
 =?utf-8?B?TTRUMVhWMHp6emZWbXl5bW1xdVRPZFVpb0x6cjJvU0x4MGl0UGxVVVg4UFVs?=
 =?utf-8?B?cUVnMG1sOVdzUjFuVEhDcFA2K2tCZWxxV3AwekdNb0JRZE9iMHlYL294OWlG?=
 =?utf-8?B?U0RVUUg1NWRqeERWVlF4RVVFalpySG9kMWxENGRYdG55aTZDWnhpeE5aVFh1?=
 =?utf-8?B?NTdmRmViQ09KTkVTQlhyZUNRRTZEd2FsS1c4UE80MGhibGRTTW8valZnMHhO?=
 =?utf-8?B?aGx4cm5uNlVNWFZNR2lJVmpiVzhmTjFVK1g5T2s3R1BzcE9zTkRBUlpDbFFx?=
 =?utf-8?B?V000cXpwV3JEcmNaa3Y4QmdDYkVnWkw2RmlXZzNUTWk2TDdubUNROGhNbmVO?=
 =?utf-8?B?N2N2cEMwUTVXMFlTUDc0UVNlSUJWajJ6MzdWa2Vlekw0V2FELzAySFFIdVps?=
 =?utf-8?B?K1lYT0tIYVZlTHEwbVRxdXd4QW9CRjNnSkNpVVAxZEJwVisrczlTbENHbmtY?=
 =?utf-8?B?NlBsMkZ5Zk9la1lMYm1ndklvMWozcEtvZHlTUDlhSXkxa0J4MVYweThXWGZP?=
 =?utf-8?B?S0VwVTVXT1BWeEpCUWlOL2NLTkJsdi9Gd3pZeU4yQmp0Slo1TDIvVHhQT1FF?=
 =?utf-8?B?aUgrYVpXR0R6TTgzanErb1dUbWJ4UXZKdkhpelFjd0R0aDFlQWV6Yi9tR0xn?=
 =?utf-8?B?dnhrNmJWaWtjRGdKQlNKNHRIeWR1RE41NkVLZXprUXF4SVBaNGJaeUIrR1h3?=
 =?utf-8?B?VEdHUFNnVHU1RGlEc1VBV2JYazh0Z1VyVDFPWG81MEZ0S1lHSnlUYnJjbnRN?=
 =?utf-8?B?dXUxSVNITGs3aXpnakFDakc3WlhRU3FUcEpRV1ZKaThTVDRkeGRTUU9tbE8z?=
 =?utf-8?B?S0xXdnZaS28xQjJzZU1SOG1UQ2FjZXl0NUo1S1BSUHd0b2d0aUl4Z0dJRm5V?=
 =?utf-8?B?bDJVQ0p3ZUVCc0xYalhVVFhwbUZ4ZUZTWTBuQTE2MytLcW9mbWcyTDJyYTBs?=
 =?utf-8?B?RGh1R2xZWVhWZVVOd2IzblZ5NnozOEh3cmZReEdWalNyZnJzeFhIVFB1TjNZ?=
 =?utf-8?B?QzdCVTBMa0RFV1cyY0tLdEF2OWM0RTJsTWo1aW10Nk00MHVHc25MZ3doT05H?=
 =?utf-8?B?SUEwSmpjUWtaclBSWHFNQ2tOK1pCZTNZaGlPeW1EWkF1Rm9aVXZUaGtUVTVw?=
 =?utf-8?B?ZkltUUtzR0tMWFVadE1wZXdHcFh5WVZjTjhwQ0E2NitlcXJFdVI3cjFUSEZ2?=
 =?utf-8?B?YUJ5MXdWWnorUzJWc2tWRVVyQUVHNkIrVGZFL0Rzc0hKWjU0VzhIUFgra1ZC?=
 =?utf-8?B?VmhadURuQjlKR250bUEvV1RyOHEvTGdIZzVLRWNjSm83SEpFeFplWFFGMlM5?=
 =?utf-8?B?bjFub3dYRnFZRWlySU83ZXVURE44YTJOaDlLQmUyQnJ6aWxROGIxN01CT2Rh?=
 =?utf-8?B?TkJNdGY2dEVFRlQvRTZnLytwYXJWajhBcWhsSzc2elhxMmpidkEwYUNCRG1P?=
 =?utf-8?B?TXUzakZZZnp1eExwbjJHd1NpMmxKWkJyRUcyUldKZy94aHFxaFNWME1aUU1Q?=
 =?utf-8?B?bHVONlF1YUkwNkp4QkJBYVVQbzNnQ1BLMVFrRFFoV1FrUy9Yd2NjV0JKQmZK?=
 =?utf-8?B?NFVmd0xCRGRoY1c3QkxPaEs4bHBOWHpBLzU4Qk1rNWM2VHRHdEsvMDBsdlhE?=
 =?utf-8?B?bSsxdGZTQ0c5cHRxak5hQUFPYWF5bFh0eG8vWVRvamRBbFQwb3R5eWx4eG9B?=
 =?utf-8?B?eGtpdU5IcXNwTEdCNTZTOHBJeU5KVTlGejNGU05ncjErQ1o0aVdwWEtQSTR3?=
 =?utf-8?B?M0piVEFxd3VkZytiQTJSa2hjUEowSFlsS0xFSnFnNmY0Y2x6aG91Zmkzellv?=
 =?utf-8?Q?UK5FO0QsCMTdPwh2wpHYl8mvfw8EI9F8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N01YdkxjaVpwVE1Hc3RPRjQ1TFgrUi92T0YyWUFSRERnanhVM2YvTVl5dEds?=
 =?utf-8?B?OXFnVlhiT2FLNzF1bzRWNThZSXRuYVlKcG5hdVNZYXBsTGpjb3RTNXRONDYr?=
 =?utf-8?B?VC9NUVdPU2FPYVZYcEpuYzZOb0dGaGthZ25sS3p5SjFFbWdzVFN0dzRiSEZF?=
 =?utf-8?B?NndtcVNkTUMyRkZRQW1UcmIvaGpqUDc3bjluM2ttN3YxbWtqdjdycFZDS3J5?=
 =?utf-8?B?SGlXODdYbmkvWmZtTjhJbklPZ3NpekdoMlNVQ3RYdWFSZDFadjVhdGMvb0Fx?=
 =?utf-8?B?d0xOV2Z5NDJrSE0wL0kzZmlMNWRYSTNhREZUMzNrK1JKKzlKSXZvQnh0RnpK?=
 =?utf-8?B?K0ZrWFNWc3I1ZTFKSzlvbHVqbnEzKy9lYW1XT09qNlQwcHcxeGVEYUtTbnlC?=
 =?utf-8?B?OWdIZCswVXJIMFNlNk5BU2VYT2lUWkxVRmYwWjlPeFBFRUlEV0R0V1czbG00?=
 =?utf-8?B?OG82dW1keTBqb0tsd3NlZnVETnR5eGZQZWJ1SUc3ZFBTOFdHb3ZLQTN3aHox?=
 =?utf-8?B?dFl4c091TUNabS9WOHpoaHZQOGtycFByVVRNbGFza2FUZ0NtdGJCdSt3VEFa?=
 =?utf-8?B?elJndEYwZjI5ZDZiNjVkenlSVzd2RmI1MmN2b2RmTWtrWUl5MHprWk1WN1l3?=
 =?utf-8?B?VkNEWld2dHdWa0lqODFHNm0rRXZ1bXZwNEtvM0drWG44am15Tk4rd0FSTm9L?=
 =?utf-8?B?TWFmOVVlczVCd3AxVzBjRys3WklKTC9kWmQ5MThYcjgyVWRzWE8yV3drWjVU?=
 =?utf-8?B?R0ozSEYvNjkzbXExMThEVE4wdjhlYjdDUklJakRFYmhteTFTNkYvZ1ZOMEFl?=
 =?utf-8?B?RUlzOUdCVWJaM0JSVEx3ZEhSWG9MMGM0QVRXbnhKTFpjMTIzV3FDOUx6SjB4?=
 =?utf-8?B?c1QzZVliQUgwQ2w0d1p5a2xSNnlyR3FuMkxmTmlIRFZndUsyeUNyRVgranRE?=
 =?utf-8?B?SUhoMExVUldUR3F2MHNMeHJFQ0g1eE4rRDFtV2FuQUlaWklLaDFrOFFibGlw?=
 =?utf-8?B?ZXRBcHFZeUVMN2pobitkZnQ5UnliM1hEOXpuc1I0TVBNVHFBKzlHZGZsTkxx?=
 =?utf-8?B?ZnVjMVhXRnp3ZGFDVGlIWWU4N3MyeVIvN1dKY2tCclpVRmt1OGsvY1B6eXpJ?=
 =?utf-8?B?MmZ5T1ZSdzBVYW1BMkJ0a05iUnhadTU1MHU0Rm1ZWXBURmR2WVpzK2FhUWZX?=
 =?utf-8?B?NEVETTdTK3U2UjVXak9QWmt4L2JIZDdFS2xhNitLSlhIOENmY2Yycldpa0xE?=
 =?utf-8?B?cTMydTdFd1ZLcVNQRU9ZaGtwaHJFN2tVZHNuZW5jc2dmUGwyREdMZDUvajlo?=
 =?utf-8?B?dDhJUVhkais1dWYvRnp1eHY4eVh0RjlaQk50MmRYMjMyS1N2d2sva2J0RjYr?=
 =?utf-8?B?UnYvdTlNODRXa0dLSXZJUmVxMFBPSGhiRUF3dVRWNzNFTldoeHZpNUpTRTZZ?=
 =?utf-8?B?MitGcGxuVEF6YTQvcUExVG5QbDlaV2tEa0hnNDNPaFRud2hiRTdGRTBBVUM2?=
 =?utf-8?B?MXVaSTBUdENuaGdLTUl5MVdoMERvQ0RTNzFrOXdyL21tZjZkcm1kL0JxNHJk?=
 =?utf-8?B?SmhYc1pPNEdXVDNwQUtpdVpKOWUrbHpOVTRxZkNaNDJ0OFRGVjUvWUVWL1Y3?=
 =?utf-8?B?dGV6TGl6MUk3TndIandwbER2bTBDSE0xQkRwYkhDSWdOQ2pJZW93N25jZDhY?=
 =?utf-8?B?Kzk4cHM3SjdsUmtNYlNJbjI3KzJYQzZZSzhxNjdjUlg3Q1hBVnptL2pMazNn?=
 =?utf-8?B?aVFuK1l3MG10V3QwOHNUL3JrNkhlNDlFQ2VwRkNwVWVCUWQ3WEllVnR6VUZ0?=
 =?utf-8?B?QXkwcU9KUjJxL1d0TDluaEVHV1B5bWFFMTlvVGE4aGp0YVp3Mk5HRjB1djAw?=
 =?utf-8?B?OFJhZlRUOWlXMkJlMDdUMDdKZExmUFBreTVFdUJueERaTWlIeWw5aWE5NWo2?=
 =?utf-8?B?cmhLYjVaZjBHZzJrRE9wR0RuZUFORCt0WjNqWTlDbytEYjRIRjRIRnpYV211?=
 =?utf-8?B?N1g2RVRmOWZleTFUbmhrS1BaYXdtVlpFNGwwcWI0TytGUStyMldNbkZvRXZB?=
 =?utf-8?B?SkpJREZOVm9KeUltZEpTcDVyQmQvN0FEdlJjaVU2a2s5eWhZSzVOOFVTY1hR?=
 =?utf-8?Q?oO3CDEUcsK96tGc3dRrLPcQk6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <426367640473EF45837AE3D913378808@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a3bd6b-78f1-4727-3f42-08dd4737ac3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 05:24:19.4561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mj0SJci5WJbjFQlb11LivjxOeiYik4YJtJRmHzHabUdvplue5NI+/8WT571XQ/inlRB8oUD3WqI+1X1Rzb40pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8631

T24gTW9uLCAyMDI1LTAxLTI3IGF0IDEyOjQyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNC8wMS8yNSAwOToyNCwgQ0sgSHUgKOiDoeS/
iuWFiSkgaGEgc2NyaXR0bzoNCj4gPiBIaSwgQW5nZWxvOg0KPiA+IA0KPiA+IE9uIE1vbiwgMjAy
NS0wMS0xMyBhdCAxNTo1MiArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IENoYW5nZSBlcnJvciBwcmludHMgdG8gdXNl
IGRldl9lcnJfcHJvYmUoKSBpbnN0ZWFkIG9mIGRldl9lcnIoKQ0KPiA+ID4gd2hlcmUgcG9zc2li
bGUgaW4gZnVuY3Rpb24gbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoKSwgdXNlZCBvbmx5DQo+ID4g
PiBkdXJpbmcgZGV2aWNlIHByb2JlLg0KPiA+ID4gV2hpbGUgYXQgaXQsIGFsc28gYmVhdXRpZnkg
c29tZSBwcmludHMuDQo+ID4gDQo+ID4gSSB0aGluayB5b3UgaGF2ZSBkbyB0d28gdGhpbmdzLg0K
PiA+IFRoZSBmaXJzdCBvbmUgaXMgIlVzZSBkZXZfZXJyX3Byb2JlKCkgaW4gbXRrX2hkbWlfZHRf
cGFyc2VfcGRhdGEoKSIgYXMgdGhlIHRpdGxlIHNheXMuDQo+ID4gVGhlIHNlY29uZCBvbmUgaXMg
ImJlYXV0aWZ5IHNvbWUgcHJpbnRzIi4NCj4gPiANCj4gPiBUaGUgdGl0bGUgZG9lcyBub3QgbWVu
dGlvbiB0aGUgc2Vjb25kIG9uZSwgc28gSSB0aGluayB0aGUgc2Vjb25kIG9uZSBpcyBub3QgcmVs
YXRlZCB0byB0aGlzIHBhdGNoLg0KPiANCj4gVGhlIGJlYXV0aWZpY2F0aW9uIGlzIGEgY29uc2Vx
dWVuY2Ugb2YgY2hhbmdpbmcgdG8gZGV2X2Vycl9wcm9iZSgpIC0gYW5kIHRoaXMgaXMNCj4gYmVj
YXVzZSBkZXZfZXJyX3Byb2JlIGF1dG8tZm9ybWF0cyB0aGUgZXJyb3IgY29kZSBpbnRvIHRoZSBw
cmludCwgc28gYWxsIG9mIHRoZQ0KPiAiOiAlZCIgd2FzIHJlbW92ZWQgKmJlY2F1c2UqIG9mIHRo
ZSBtaWdyYXRpb24gdG8gdGhhdC4NCj4gDQo+IFRoZSBvbmx5IHN0cmluZyB0aGF0IGhhZCBjaGFu
Z2VzIHRoYXQgYXJlIG5vdCBjb25zZXF1ZW5jZSBvZiB0aGF0IGlzDQo+ICJGYWlsZWQgdG8gZmlu
ZCBkZGMtaTJjLWJ1cyBub2RlIGluICVwT0YgLT4gTm8gZGRjLWkyYy1idXMgaW4gY29ubmVjdG9y
Ig0KPiANCj4gQmVzaWRlcywgOTkuOTklIG9mIHRoZSBjaGFuZ2UgaGVyZSBpcyB1c2luZyBkZXZf
ZXJyX3Byb2JlKCkgaW5zdGVhZCBvZiBkZXZfZXJyKCksDQo+IEknbSBub3Qgc3VyZSB0aGF0IG1l
bnRpb25pbmcgdGhhdCBvbmUgc3RyaW5nIG91dCBvZiBmaXZlIGNoYW5nZWQgaW4gdGhlIGNvbW1p
dA0KPiBkZXNjcmlwdGlvbiBpcyBhY3R1YWxseSB3b3J0aCBpdC4NCj4gDQo+IEkndmUgbWVudGlv
bmVkIHRoYXQgaW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiB0aG91Z2gsIGFuZCBsb29rcyBlbm91
Z2ggdG8gbWUsIHNvDQo+IEknbSBub3Qgc3VyZSB3aHkgeW91IHRoaW5rIHRoYXQgdGhlIG9uZSBz
dHJpbmcgY2hhbmdlIHNob3VsZCBnbyB0byB0aGUgdGl0bGUuDQo+IFRoYXQgaXMgYWxzbyBiZWNh
dXNlIGRkYy1pMmMtYnVzIGNhbiBvbmx5IGJlIGRlZmluZWQgaW4gb25lIG5vZGUsIHNvIHRoZSBw
cmludA0KPiB3YXMgYWN0dWFsbHkgc3RhdGluZyB0aGUgb2J2aW91cy4NCj4gDQo+ID4gWW91IHRo
aW5rIHNvbWUgcmVmaW5lbWVudCBpcyBub3Qgd29ydGggdG8gYmUgYSBwYXRjaC4NCj4gDQo+IENv
cnJlY3QsIGFuZCB0aGF0J3MgYmVjYXVzZSBpdCdzIG9uZSBzaW5nbGUgc3RyaW5nIG91dCBvZiBm
aXZlLg0KPiBPbmUgY29tbWl0IHRvIGNoYW5nZSBvbmUgc3RyaW5nIHNpbXBseSBjbHV0dGVycyB0
aGUgbG9nIHdpdGhvdXQgYnJpbmdpbmcgYW55DQo+IGNvbW1pdCByZWFkYWJpbGl0eSBiZW5lZml0
cyBhdCBhbGwuDQo+IA0KPiA+IElmIGl0J3Mgbm90IHdvcnRoLCBtYXliZSB3ZSBzaG91bGQga2Vl
cCB0aGVtIGFzIHRoZXkgYXJlLg0KPiA+IE9yIHlvdSBjb3VsZCBjb2xsZWN0IGFsbCByZWZpbmVt
ZW50IGludG8gb25lIHJlZmluZW1lbnQgcGF0Y2gsIGFuZCB0aGlzIHdvdWxkIGxvb2tzIHdvcnRo
Lg0KPiANCj4gVGhhdCdzIHdoYXQgSSd2ZSBkb25lIGluIG9uZSBvZiB0aGUgcHJldmlvdXMgdmVy
c2lvbnMuDQo+IA0KPiBZb3UgcmlnaHRmdWxseSB3YW50ZWQgbWUgdG8gc3BsaXQgKGFuZCB5ZWFo
IEkgYWdyZWUgaXQncyBiZXR0ZXIpLCBzbyB0aGF0J3MgdGhlDQo+IHNwbGl0IHBhdGNoZXMuIEkg
cmVhbGx5IGRvbid0IHRoaW5rIHRoYXQgc3BsaXR0aW5nIG1vcmUgaXMgYW55IGJlbmVmaWNpYWws
IGFzDQo+IG11Y2ggYXMgSSBkb24ndCB0aGluayB0aGF0IHJldmVydGluZyBiYWNrIHRvIHRoZSBu
b24tc3BsaXQgdmVyc2lvbiBpcy4NCj4gDQo+IFRoYXQgLi4uIHVubGVzcyBJJ3ZlIG1pc3VuZGVy
c3Rvb2Qgd2hhdCB5b3UncmUgc2F5aW5nIGhlcmU/IDotKQ0KPiANCj4gQ2hlZXJzLA0KPiBBbmdl
bG8NCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBDSw0KPiA+IA0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMzQgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiA+ID4g
aW5kZXggNjVlOTYyOWI2Yjc3Li40OGMzNzI5NGRjYmIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19oZG1pLmMNCj4gPiA+IEBAIC0xMzcyLDMwICsxMzcyLDIzIEBAIHN0
YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLA0K
PiA+ID4gICB7DQo+ID4gPiAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+ID4gICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsN
Cj4gPiA+IC0gICAgICAgc3RydWN0IGRldmljZV9ub2RlICpjZWNfbnAsICpyZW1vdGUsICppMmNf
bnA7DQo+ID4gPiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcmVtb3RlLCAqaTJjX25wOw0K
PiA+ID4gICAgICAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqY2VjX3BkZXY7DQo+ID4gPiAg
ICAgICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gPiAgICAgICAgICBpbnQgcmV0Ow0K
PiA+ID4gDQo+ID4gPiAgICAgICAgICByZXQgPSBtdGtfaGRtaV9nZXRfYWxsX2NsayhoZG1pLCBu
cCk7DQo+ID4gPiAtICAgICAgIGlmIChyZXQpIHsNCj4gPiA+IC0gICAgICAgICAgICAgICBpZiAo
cmV0ICE9IC1FUFJPQkVfREVGRVIpDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgY2xvY2tzOiAlZFxuIiwgcmV0KTsNCj4gPiA+IC0NCj4g
PiA+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gLSAgICAgICB9DQo+ID4gPiAr
ICAgICAgIGlmIChyZXQpDQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJGYWlsZWQgdG8gZ2V0IGNsb2Nrc1xuIik7DQo+ID4gPiANCj4gPiA+ICAg
ICAgICAgIC8qIFRoZSBDRUMgbW9kdWxlIGhhbmRsZXMgSERNSSBob3RwbHVnIGRldGVjdGlvbiAq
Lw0KPiA+ID4gICAgICAgICAgY2VjX25wID0gb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQobnAtPnBh
cmVudCwgIm1lZGlhdGVrLG10ODE3My1jZWMiKTsNCj4gPiA+IC0gICAgICAgaWYgKCFjZWNfbnAp
IHsNCj4gPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBmaW5kIENF
QyBub2RlXG4iKTsNCj4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+
IC0gICAgICAgfQ0KPiA+ID4gKyAgICAgICBpZiAoIWNlY19ucCkNCj4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJGYWlsZWQgdG8gZmluZCBD
RUMgbm9kZVxuIik7DQo+ID4gPiANCj4gPiA+ICAgICAgICAgIGNlY19wZGV2ID0gb2ZfZmluZF9k
ZXZpY2VfYnlfbm9kZShjZWNfbnApOw0KPiA+ID4gICAgICAgICAgaWYgKCFjZWNfcGRldikgew0K
PiA+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoaGRtaS0+ZGV2LCAiV2FpdGluZyBmb3IgQ0VD
IGRldmljZSAlcE9GXG4iLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgY2VjX25wKTsN
Cj4gPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKGhkbWktPmRldiwgIldhaXRpbmcgZm9yIENF
QyBkZXZpY2UgJXBPRlxuIiwgY2VjX25wKTsNCg0KVGhpcyBtb2RpZmljYXRpb24gZG9lcyBub3Qg
dXNlIGRldl9lcnJfcHJvYmUoKSBhbmQganVzdCBiZWF1dGlmeSBjb2RlLCBzbyBJIHRoaW5rIHRo
aXMgaXMgbm90IHJlbGF0ZWQgdG8gdGhlIHRpdGxlLg0KDQo+ID4gPiAgICAgICAgICAgICAgICAg
IG9mX25vZGVfcHV0KGNlY19ucCk7DQo+ID4gPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBS
T0JFX0RFRkVSOw0KPiA+ID4gICAgICAgICAgfQ0KPiA+ID4gQEAgLTE0MTMsOSArMTQwNiw4IEBA
IHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1p
LA0KPiA+ID4gICAgICAgICAgaWYgKElTX0VSUihyZWdtYXApKQ0KPiA+ID4gICAgICAgICAgICAg
ICAgICByZXQgPSBQVFJfRVJSKHJlZ21hcCk7DQo+ID4gPiAgICAgICAgICBpZiAocmV0KSB7DQo+
ID4gPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsDQo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAiRmFpbGVkIHRvIGdldCBzeXN0ZW0gY29uZmlndXJhdGlvbiByZWdpc3RlcnM6ICVk
XG4iLA0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0KTsNCj4gPiA+ICsgICAgICAg
ICAgICAgICBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIkZhaWxlZCB0byBnZXQgc3lzdGVtIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJz
XG4iKTsNCj4gPiA+ICAgICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNlOw0KPiA+ID4gICAg
ICAgICAgfQ0KPiA+ID4gICAgICAgICAgaGRtaS0+c3lzX3JlZ21hcCA9IHJlZ21hcDsNCj4gPiA+
IEBAIC0xNDQzLDIwICsxNDM1LDE2IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRh
dGEoc3RydWN0IG10a19oZG1pICpoZG1pLA0KPiA+ID4gICAgICAgICAgfQ0KPiA+ID4gDQo+ID4g
PiAgICAgICAgICBpMmNfbnAgPSBvZl9wYXJzZV9waGFuZGxlKHJlbW90ZSwgImRkYy1pMmMtYnVz
IiwgMCk7DQo+ID4gPiArICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7DQo+ID4gPiAgICAgICAg
ICBpZiAoIWkyY19ucCkgew0KPiA+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFp
bGVkIHRvIGZpbmQgZGRjLWkyYy1idXMgbm9kZSBpbiAlcE9GXG4iLA0KPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgcmVtb3RlKTsNCj4gPiA+IC0gICAgICAgICAgICAgICBvZl9ub2RlX3B1
dChyZW1vdGUpOw0KPiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0ID0gZGV2X2Vycl9wcm9iZShkZXYsIC1FSU5WQUwsICJObyBkZGMt
aTJjLWJ1cyBpbiBjb25uZWN0b3JcbiIpOw0KDQpUaGlzIHByaW50IG1vZGlmaWNhdGlvbiBpcyBP
SyBmb3IgbWUgYmVjYXVzZSBpdCdzIHJlbGF0ZWQgdG8gdXNpbmcgZGV2X2Vycl9wcm9iZSgpLg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiA+ID4gICAgICAgICAgICAgICAgICBnb3RvIHB1dF9kZXZpY2U7
DQo+ID4gPiAgICAgICAgICB9DQo+ID4gPiAtICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7DQo+
ID4gPiANCj4gPiA+ICAgICAgICAgIGhkbWktPmRkY19hZHB0ID0gb2ZfZmluZF9pMmNfYWRhcHRl
cl9ieV9ub2RlKGkyY19ucCk7DQo+ID4gPiAgICAgICAgICBvZl9ub2RlX3B1dChpMmNfbnApOw0K
PiA+ID4gICAgICAgICAgaWYgKCFoZG1pLT5kZGNfYWRwdCkgew0KPiA+ID4gLSAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBkZGMgaTJjIGFkYXB0ZXIgYnkgbm9kZVxu
Iik7DQo+ID4gPiAtICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiA+ICsgICAgICAg
ICAgICAgICByZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkZhaWxlZCB0byBnZXQg
ZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVcbiIpOw0KPiA+ID4gICAgICAgICAgICAgICAgICBnb3Rv
IHB1dF9kZXZpY2U7DQo+ID4gPiAgICAgICAgICB9DQo+ID4gPiANCj4gPiA+IC0tDQo+ID4gPiAy
LjQ3LjANCj4gPiA+IA0KPiA+IA0KPiANCj4gDQo+IC0tDQo+IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vDQo+IFNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcg0KPiANCj4gQ29sbGFib3JhIEx0ZC4N
Cj4gUGxhdGludW0gQnVpbGRpbmcsIFN0IEpvaG4ncyBJbm5vdmF0aW9uIFBhcmssIENhbWJyaWRn
ZSBDQjQgMERTLCBVSw0KPiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcywgbm8uIDU1MTM3
MTgNCg0K
