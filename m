Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C13AA53;
	Mon, 10 Feb 2025 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172782; cv=fail; b=hUgCE0d3yUuMAMQNIL0y4V/nl2J/el21ujqiJovId7tZwA52ArN622tetnBj6GSyUYb5HJostnKokEwGSkxXFmED1EoIfU68qW3C/tC3i1pYJOvnqIE52ywCy3oOVYFB2cNVGoBIUCYJFKY7iGImSkKlYsWQcBT2zooglclgBdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172782; c=relaxed/simple;
	bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gj4JNuixaOkWhZOiflWpETYqJWgBscPoduDA4qxshvJQ+rVxwAx7nu99pfeWTGqNlfna/JU7G1+T71AN00odZc01EjupKT99C6+g9tnAd7YrHY69vKfOoFewmgdWAVmYenqPKbahvxCxV1I9n1z8elxJ2r0TFWtAENpsH69K6+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VskqlkvV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HcxjTOug; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VskqlkvV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HcxjTOug"
X-UUID: 3d785ba8e78111efbd192953cf12861f-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
	b=VskqlkvVawtzG1qkm4IGZNfzhFZzG3jQymHmuLRhl+lCbso3QStp4r8s2V/4F0o8W6+7yxqgasLrqRGn30sAg8wvf2PQDpxmjb0OKYLv0CasBJ/MbQMB5VNNIoa92qg3dRb704tFRgydrBMlZiV+c1d+IBGM+kwcNxWIqr+WJus=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:42b1be43-694d-46f3-95c2-15a4c85fe36b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:987d6bff-c190-4cfe-938d-595d7f10e0dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3d785ba8e78111efbd192953cf12861f-20250210
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 290670745; Mon, 10 Feb 2025 15:32:53 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 10 Feb 2025 15:32:52 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 10 Feb 2025 15:32:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgPueqv41ZoJz7b0iwELNDTewGksLkPrCA9ufr4nB+AtJFe9vBZsi/1bl2CoWNxZnV8JIyvpI2F7BoLW9CHoTMHo5XRTOp0s5AyVxYxN/JVJ56KsH04LShCTWOJXRj5gtH8Vukzo0qBN3HgLRX5tvqvYZz1x5p0ScaoxlX/OyccOqbxVPHa1R0xyCupIx6+TrqhQm9/Dd9zWWGBsIkRSm+ip89nar7tRgQmR4SmePPYwbLDqBtM5iNXtOyMSviZ+lIO/kt4vMg0NgNLnex6kAb9xhpzvwZQI5K+9j2P9tczbsx1ZZbPXAPOIxe7Ya6eMiOc4k33wNl4B1Op6eJ+3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
 b=lCUL7PsCmnhDS5q/OeYLxuwgZuI0VP9YHTWiR8Sv1xrX52SmbJbeDiiKI/Gs93BWnBKSUT32kLhh+vzxUeFMKK7WMPoFFkL7R/8ZiJ+BR4nAkfL10lSzukrl8uwIoo5u+0zFgM2jH63A2xO2WjuxaegpLr8eJYONzPOrRs1QNWU64ovkpoG6ChK+MMqyLc8tqSJR+lccNKiAaUF4tOcYkHXvK8KugslruZiFDlguY/G3Nkf2guys923WXdZFxYF3C7WipgmFiBNFPDhAEM4/3KyK+sgbXG2sbThqSxsfSNHZKLrvqzdHlerufNDmyoXYDXFi2Lh4LJZP/r6Ka8CrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZcSaVaj16xGK/LA06vk09gLZjza4D0hDG62fv8NAA4=;
 b=HcxjTOugOhEcyIhZsMZWRhkPMUUAObUG2CZpb/LhYAy6z162e6Hg5mLDUyfh6E04F/Fo4/8LFMzrEcjo1nDhNJHHKnsDSeWsgaozPNoK2nEg3DlQfJDvnw1njGAgK9sBcozJcCIj368zSGFUdaeHGnoJUbgzYWdwVIiSuETTeNM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8195.apcprd03.prod.outlook.com (2603:1096:820:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 07:32:50 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 07:32:49 +0000
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
Subject: Re: [PATCH v5 07/34] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Thread-Topic: [PATCH v5 07/34] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Thread-Index: AQHbZcrvQTgXNtzUrkOtKKNLxAYFYrNAUGKA
Date: Mon, 10 Feb 2025 07:32:49 +0000
Message-ID: <d99bd876b0deda66ea12705c7db0b846a2ad214b.camel@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
	 <20250113145232.227674-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250113145232.227674-8-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8195:EE_
x-ms-office365-filtering-correlation-id: 565fb436-89ef-4d34-7bcb-08dd49a51f2e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVA5bXd4R2MzU3M3UVBIVmJVK0xVbExXRk5lb1FURmFmUFE1VlJRS3VFQ2xr?=
 =?utf-8?B?ODk1Z0RkeDZTdlI3UVQ1djZwTk5WM21wYndSM0p4aVpuKzJSSXVNeVJzM1pS?=
 =?utf-8?B?WG9nY002d21rMnVZWnZPZEovNUJVWjJ3Ny9lM3F6VEFIYTk3UDU0bzMrcFlI?=
 =?utf-8?B?aGVLNi9tWnZBRU5kRlZIbWRDZVJ3cUJFdXM2ZW9RK0pXNUI3TEJuSjczL1Qx?=
 =?utf-8?B?cDVMeUlTSzUwVEZxaHFYdWdPVHgvZlg2dURKcWtmeUtrYjRsSjNLV3Zlb2Fq?=
 =?utf-8?B?b2hDQ0hqZHRWTDVBYUNSejNrSVlESFMrMUQ4QUIvRHg5Y2VTTU9OQ1FMbjI1?=
 =?utf-8?B?K3ROdGNzV3JOeTFlOUJ2Rjl6Zm8vRGNVUzV6VlhDM1BQVkVyS3hFTDRjZXpX?=
 =?utf-8?B?YlZPcFV5SFlmUHBYZjcrQmZJUXJZYjZLaGJKanFxSktPcTRxY0FVL0dMRFdT?=
 =?utf-8?B?K1IvS0NvOUY1WVZpMVREY2o3b0F3UmFWUERSWkJMQ0hGSzBYWUhvVzVqSUV4?=
 =?utf-8?B?VnEzWkVQSHpFOHV5RE1hb0JweWZrNXlRQmNGc3pnaFhLUHhucGVIOGJyb1RU?=
 =?utf-8?B?bldvMXpBZ0tEV3VCdlV4d0orZGdLT3JleGZhNjM2RWt6QitPd0o5TVJmWlR3?=
 =?utf-8?B?V0tXNEJiQkZ0ZjJTVmdLNjdnZFNNSUVJcFhlRkhYdjZnQnFjZHpYb3F5cENy?=
 =?utf-8?B?bk5vSHhnV2czdTZrQndBU2R4SFVsbnRFRWZKQ0NsUWJ5KzdFcHNpQTRSN2o4?=
 =?utf-8?B?L004YzdPYXZ5NFhUYUkwRk5USnFIeGRXS1I3TFpyUmdIMzlScTBQQmhndTZH?=
 =?utf-8?B?aGJEUU1vWnBhcjlmbytMYlo3Q0tTTkE3Rmd6Wm8rZjRuMVdCUVk3SERWdUN5?=
 =?utf-8?B?V29CQnJaUkdxMzJ3ZXk3WW1tTHRCVGJGZS9tc212SXlsSFRrdUZQRGt6V0pq?=
 =?utf-8?B?MkxNUG90emZEZ2sxdCtxb29zUnFPNFVURzhjSU5hOXUyRCtzaFArMENIWndj?=
 =?utf-8?B?M1BVd2JXNFNsaWtZL0VPdTlBYjBrOHYxMXpzVnhBVmhKTGFDU0FiRTIrb0tq?=
 =?utf-8?B?MGltK05uWHhHYlU2NE9XTXVaZHAvOWhJbFdpYWFGaTUwOFR2M0RaWmVjb2pI?=
 =?utf-8?B?Q3pXSGJjeG9IZjBIMGVaNHJTY1B0Y3ZZLzVmczdyOXk2Tno3SmppVE5lTGVy?=
 =?utf-8?B?bU5Vc2psTmdEZ21SUFBWcXBZMVZRS3ExWjlBZFEzRWpITUthSC9aU08rWTd0?=
 =?utf-8?B?VTFmR09GZW5sR3BsV3FpN3FUNGhMblBleSs1aXg1OUIrUVJDRjBWbmM1Tnhv?=
 =?utf-8?B?MFlEZzBtOTBwVlRsOVhFTVMzZC9BdHVrM051NXpCek5Ta0ZkTjZQczB2WmYr?=
 =?utf-8?B?YUUzT0ozRk9YSGNNMTduaDZnMDlSNzJFWEkvY3VoUTZrRGwxdzlDQkYvM21Z?=
 =?utf-8?B?aktTRFMyako4UDR3aldoMld2T3loQmtwT3lndzZLaHpOZXVubS9RTituSEpK?=
 =?utf-8?B?N3NTWmVwek9rbERSZDlrR1lYS3hXY0ZLSy9JcEhoaTExYlNoM3VFbGs0R29L?=
 =?utf-8?B?VlVGRG40dFA5bGhKczJzSzQzWDFMZVEwaGNzTXdmTEphSEVqNzM1MEcycVNo?=
 =?utf-8?B?S21Fck1lK2xST3Z0OHB2U0loTklUK0tXT3BXeko0UHd5clBBWnhUcEZIV3A0?=
 =?utf-8?B?MmZ0R3VlTTBoanJ3TU4yem9mQm13REMxVkMzeHJqMXJTcDlFTXRnQ21OSHA3?=
 =?utf-8?B?c1NvT3dOckNrK0kxTVhTbU1ETi9DQVdSdlRzL0QyWXhjSWhFOGJyN0JPSWVu?=
 =?utf-8?B?aDFtcC9lSTVhb200MHkwN251a3VqVkp1OGM3NmFBU29BL0lrckFZQTNDWEZP?=
 =?utf-8?B?djcyV3JVZUxpeW5US09HOEliREtQdWJEa0lTUWNRQU5XMEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkdIRU8yakFDczRtTXNyeDlMV0Vvc2NKQmZoMmYwSlI2YlY1S0RmUndQeklK?=
 =?utf-8?B?R3lEa2FxTjRYSmpRK2ZMbG5oZ0VIYjQwR1VjWmYxT1B6ZDhYWVN0dUZyU2c2?=
 =?utf-8?B?VHpGWEpuZnhad0VPUEQrQXpYUkhWUFZja01yYTA2SldRY1F0K2ZJeGNEU1ly?=
 =?utf-8?B?dzJQRVU3emF4WXNjQU55cEJSblpOc0hEWnJ6cTNrM25Xbk00dHBvYk5DaEJH?=
 =?utf-8?B?TDRLQ2UrYkVNUlZMWHlUVEJoNitCeGVFelBtdTZsNzlmd3NvOURacDhoemds?=
 =?utf-8?B?N3VnVUVHdmcyUTBBcVdMdSt6OXV4bjFIWkpkc01aWFQ0NXovd3hIeUJRZW1N?=
 =?utf-8?B?UFRPcS8yRCtOazZHdEpWZVF6bmlNVjVLU1lxRnJlRFR2U0F0UW90RVA2Wk14?=
 =?utf-8?B?a2VQT1V6aloweERpT0hoeFR3c09qNTRLeUZ5QWRWczVJSXdxbXRFRStWajQ3?=
 =?utf-8?B?TUtxZitIVm5veHJtYm9mUkx5Vnd3cW1tRnJyV0VSNDR4YmxZeEtxMVA2aUU2?=
 =?utf-8?B?Rk5vWXFUTURoSkwxQjBvaE95MTZJR2VmQVgzaFVKR1NDckdGdnRYcnh2cEEz?=
 =?utf-8?B?eEtqdmdyS1g4K0RScXoxaGppYWM5K0luNUZ1d0w4Si9CVEdXYitsbS81TGtU?=
 =?utf-8?B?NEZFQzJ3bU9sbnFadEZJYkdtWXNTTVR3S2lYYVNkbGlNRUd1Vmc2dVNNSzVi?=
 =?utf-8?B?aWdXdS9uNk9QcEt4anFRZmkzdGJYTVN1c1VpUWhMR0NPZDJ4U3lHZWRvSndU?=
 =?utf-8?B?U1pCdmJmRWgxU28ra3BvVE56NXVqRWlLQlhaWUdjRjhVYm5MeFU0K1pHa0lP?=
 =?utf-8?B?R2ZpZEd6bjBBcmxtOEFpSURNR20vSlFsYkVNakZWTXZVU010V3F2R0hqTHBN?=
 =?utf-8?B?MGw3Q1FLV2N3V1crRDVQbnFCRHg5WWxnclhZdHROR3NKblpmZnVKNTBiTVFL?=
 =?utf-8?B?SVF0cDJlaGI0UjJZQ1V1YlBHL1ZhRER4RzlZUWxTRTJ1QUVrSk1NU3lyZDk0?=
 =?utf-8?B?QzJuaEZPb282eTJyTUFBaWNMYkNkQUJBNUZlT0lKd2lYeWNoWlc0M0RjR1dq?=
 =?utf-8?B?YXg2ajRBaXFXN1JuRXVJcjdybE0zSno0ZUQ4dW1DTjFsUVNDNnR0TUJKR2tO?=
 =?utf-8?B?dTlTd2JvRys2R0pVTDROYk9DVzRheTZlRzMxS24xWFpwaDFwNFVZTTkweVR3?=
 =?utf-8?B?YWhrcEdxQ0w5ZFBjZnlZNWlxbVExcFF1QTdMY1R4OEtSSWRmaXFTanMrNjlT?=
 =?utf-8?B?MHk4dVo1b3ZvQkNPRk1hdWlIaHk5SmNOZEMxSERyZUp3YlFydnZJWTRRKzNK?=
 =?utf-8?B?NE9CRE9kM1IyQWtFaGpaSEVmbU1nVXhPZzVFS2ZYM3ZYMmwvVHdqK0pMaXZU?=
 =?utf-8?B?bTk0ak96WEZOTzZjbWZoSk53cU1ZWVJiYUxKUlFUTXhrQWdVcVEzc2l1NWE3?=
 =?utf-8?B?eDZLSjBZamgyZUtVTUNwK0pYbUZMNXZRamVKeEZLL1pFcG1SS0l4cHJRK3hR?=
 =?utf-8?B?WDU0bUxnSnZQSDUwZHlVSmJZWklpNjFQTWRWZjUwaHpUTzZ6TmtPem51Mzc4?=
 =?utf-8?B?dHdLOEFuYnhPRDVqOXFWYUJBZ011U2I1MmFXangxbmtQK0h4YlhadDRrOUZX?=
 =?utf-8?B?K0RhQWZxRVZ4dFc4cVZqUzUvSWFlOWp1cVp2Z1BCbm56cEdnZGx4RXhGNCtB?=
 =?utf-8?B?STloajJCNW5FU05CRXo0N2Exay9RM0RkbFVvcDRpNWk4UkswR2d6MGVERmlr?=
 =?utf-8?B?YnI2UXZnRzdhRzlQKzB6VVJCQVV6MWxLSnBpVkt5bVJKYVJ3MDRaQWFCaDVr?=
 =?utf-8?B?ZDhJeFJMY0MvNTlua3lFOGFwYUZZZ050WUlFNVNwT2tCakIrK2dHYXlMekh6?=
 =?utf-8?B?UHl5SmgxRGZOSmtkQS9KWVN6eTZDQ21nU0ZDMDlLdGZ3TVh0M2NsOVNLSTRO?=
 =?utf-8?B?MloxVUwxODRJc29FWVE0QzFLYWw1NSt3YktEa05NQ0JVU2hKRlU5anN5b2xT?=
 =?utf-8?B?VHhnRmRRQmk1RldFdStZQVFvR3lWU0ZJT1dVcjhRaG9sbjZFZ3VCTlVYeTk0?=
 =?utf-8?B?NzMwV3NibUszbGgvT3MrcjZyRytnT1Y3UHloRXRYTXkrQWJtanYxVXBtYk91?=
 =?utf-8?Q?/C2pV0UeXPVYwM1VP0XU0XKqm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E63599832BF95E488D6BE8FBDD83B531@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565fb436-89ef-4d34-7bcb-08dd49a51f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:32:49.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHJ4ptG/08d0JCCscikImwW4f83PNOGrJOdgKsLtGuLhinkTz298szGJj4uQK0UH04IjXebtcEP1zIbQJKGyZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8195

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDI1LTAxLTEzIGF0IDE1OjUyICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYSBiaW5kaW5nIGZv
ciB0aGUgRGlzcGxheSBEYXRhIENoYW5uZWwgKEREQykgSVAgaW4gTWVkaWFUZWsNCj4gU29DcyB3
aXRoIHZlcnNpb24gMiBIRE1JIFRYIElQLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hp
bm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+
IC0tLQ0KPiAgLi4uL21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sICAgIHwg
NDEgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFtbA0KPiANCj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk1LWhkbWktZGRj
LnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kODVl
OGVkMmZmYTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdDgxOTUtaGRtaS1kZGMueWFt
bA0KPiBAQCAtMCwwICsxLDQxIEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG10ODE5NS1oZG1pLWRkYy55YW1sKl9fO0l3ISFD
VFJOS0E5d01nMEFSYnchbUZDYkp0eUl1TzVzUVNYSWlGRGlBMWxkdlQ0WEVzSDFFZ29wU3NJWVhK
S2tnWTRpX0xHZktJeTZUWldjMmlsdXN4NEFnS2NrWXNpRnFYSjF1UWdlblFac1k5dGkkDQo+ICsk
c2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFtRkNiSnR5SXVP
NXNRU1hJaUZEaUExbGR2VDRYRXNIMUVnb3BTc0lZWEpLa2dZNGlfTEdmS0l5NlRaV2MyaWx1c3g0
QWdLY2tZc2lGcVhKMXVRZ2VuZURNS1R4YyQNCj4gKw0KPiArdGl0bGU6IE1lZGlhVGVrIEhETUkg
RGlzcGxheSBEYXRhIENoYW5uZWwgKEREQykgdjINCg0KdGl0bGU6IE1lZGlhVGVrIEhETUkgTVQ4
MTk1IHNlcmllcyBIRE1JIERpc3BsYXkgRGF0YSBDaGFubmVsIChEREMpDQoNCldpdGggdGhpcyBt
b2RpZmljYXRpb24sDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0K
DQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ICsgIC0gQ0sgSHUg
PGNrLmh1QG1lZGlhdGVrLmNvbT4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29tcGF0aWJs
ZToNCj4gKyAgICBvbmVPZjoNCj4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1oZG1p
LWRkYw0KPiArICAgICAgLSBpdGVtczoNCj4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxt
dDgxODgtaGRtaS1kZGMNCj4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtaGRt
aS1kZGMNCj4gKw0KPiArICBjbG9ja3M6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBw
b3dlci1kb21haW5zOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gK3JlcXVpcmVkOg0KPiAr
ICAtIGNvbXBhdGlibGUNCj4gKyAgLSBjbG9ja3MNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVzOg0KPiArICAtIHwNCj4gKyAgICBoZG1pIHsNCj4g
KyAgICAgICAgaGRtaV9kZGM6IGkyYyB7DQo+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5NS1oZG1pLWRkYyI7DQo+ICsgICAgICAgICAgICBjbG9ja3MgPSA8JmNsazI2
bT47DQo+ICsgICAgICAgIH07DQo+ICsgICAgfTsNCj4gKy4uLg0KPiAtLQ0KPiAyLjQ3LjANCj4g
DQoNCg==
