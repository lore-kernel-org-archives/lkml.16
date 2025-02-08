Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F4183098;
	Sat,  8 Feb 2025 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989620; cv=fail; b=qM9yByS2T/yb+gi4QQW5/EseKSwIveFzqef4ywcjdYiNi9KLwyQwrm5FQ6R8wJMvnPJbv/qub1rXJev3c9KTZp4/gWn8fqLFNOXg5m+9hgR52pA2ISDlYdt1xClrqBa4m0Go1gJvWFC0TNivkBKZshDmRuWDuMAPQe0yLifegL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989620; c=relaxed/simple;
	bh=RpSyLUVW5k6lllYqQlGuGJmPG+RAMCIvwknqVDfmrEc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oJ8HVIlzZxBsbpEmGh7XpiV9bO3MNcgdesPs6nIytnhJRt/1o/MI/LWn8/mw8U+ElY2pnFNdvfw6rOzbWXizDeglEdo+Tz7PloICeVT087cuEv5plpzIMUVGUE+WXYkpeb8ATqVu08znf67ia3KQEcGc6JkI/QIKqmVObsMXioA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GqxH3GxB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cKInVoSM; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GqxH3GxB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cKInVoSM"
X-UUID: c7a8f852e5d611efb8f9918b5fc74e19-20250208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RpSyLUVW5k6lllYqQlGuGJmPG+RAMCIvwknqVDfmrEc=;
	b=GqxH3GxBZM4NTOGjq47d5HwJDClEbPHdF7ZTiUDBLojq1VByiaKir4hrjEHrEJ7zDdrU9umLYNidvKkEnVaAgeFMacGRstKOo2WZlehkPkqiZbwrBXvXucquHsUxq7KCwsfazzlea5AfAsOyok5S3y+B5086STG0La9KpFaAxuo=;
X-CID-CACHE: Type:Local,Time:202502081233+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:bc6da71b-5c33-43ef-b5b5-e0ad7668dec2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:2c65417f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c7a8f852e5d611efb8f9918b5fc74e19-20250208
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 234753954; Sat, 08 Feb 2025 12:40:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Feb 2025 12:40:09 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Feb 2025 12:40:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4PcN/iXtGauORjsgnhCthsjYdZTOKx5oD0FmR6HMYEbTYyu8yPbeA3LY03zXJMnVsa1vpiW0lhc5FKsPnQiIFMtMIkWCo8t5sb/rAuY8OwZDFbBLES2545ixsCF/3kVEpb9zd/12sF1YE6ooLcs7+b3Y2zUqazngbklqLfMLJqnibcPJrNHECN3FidMmjHlE5E2pt9VqFFgzsGrgnmMAD5539VMJijmylMT6oqlafEQkKQc8dQ3S6sk1oPACtbPYv0mtlwD1WvLG2QkohTbxgU+EuOsBNnZypg9I0LtjzDK4XHlpCb12CUhAALpzfmZzz9z8WLpibajomgVGeH1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpSyLUVW5k6lllYqQlGuGJmPG+RAMCIvwknqVDfmrEc=;
 b=Dc4Ji3BM5Mdoa1Q9Rj1PyukI1D7njeVrX7Lo2Vrv+DVKIqgu/T9YQ9p3Ojtf3rpkpiSwRup5GJKizN5iR8Gs6xB1TsQbTVqnIYvm1x2dmQEgjrutqXd0f2WPzg2fz0b//SnR+SYRTWk+7c+3iK9fjpMF469U2Sal6zuzKLqKCXvOcBb1oTWL8glWgzT9k0o4X3ft44aj1VEEUl1rvmOloG6lVaPBKNnOLJpMkRTD5U788+7lQ6uq/1VHDBWY4p9BE4JZr+7DOdbTD06EtXlAk+kY4u9G0OI7bkoLAi6Q/ejasPxZAW37zGFx4gFW2GcPyUIzVreEiQ/Z0u42GLHEbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpSyLUVW5k6lllYqQlGuGJmPG+RAMCIvwknqVDfmrEc=;
 b=cKInVoSMOFNvMQEBf1UNo4SwB+gpuwCAEsnBCo5e+M1f8ADmKrTbKRcbR3pvHYZT+KL046DeLCFYPQA7yeJwThG5f9o++DSEz3VdOzB1vKi8qxG/Rh1n+k/pmLsfX3zbSHpw2NIWPedoMV93TsFAh32tNHGYrayujWOkj1jopq4=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 JH0PR03MB8844.apcprd03.prod.outlook.com (2603:1096:990:a2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.25; Sat, 8 Feb 2025 04:40:06 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 04:40:06 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLicIEAgFq9ooA=
Date: Sat, 8 Feb 2025 04:40:06 +0000
Message-ID: <82cf93733dd14abfbcd17b100d1b3c40c6aed916.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
In-Reply-To: <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|JH0PR03MB8844:EE_
x-ms-office365-filtering-correlation-id: 90144bdb-03f4-4f43-ca20-08dd47faa919
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWNvcUZPTk1HejZZNnhOZDl4OVk5ZlJ2cTM0TzVBNGFyVit6SVBBL1JNb3RY?=
 =?utf-8?B?TjJwUVRIWmVVVHZKcVRVdEdmb09vaStUQzJ4RkhqbzdobjJ3eFZGYUFLNG5j?=
 =?utf-8?B?NHQrTDQ1MFg5THY0R0RESWZlNDZ2cVdrQkF5RHNiV2lQTUpmcTFhRkRrM25x?=
 =?utf-8?B?QUdNSFZQVnpCYlFoV2dsTEFzb0ZVSFZ2ekdUd0F4RGN1cWFGd042V0RZY0pm?=
 =?utf-8?B?dzB0Y0x4WnZBMDZoUlNhUDc1YVdPalBrNWdKdXdNcmhQNWh2am40QjhOS2V4?=
 =?utf-8?B?dzVBQ2ZoRnNGSzB3aVlrbDAxTW1wNFBUWUdldFU3OWU1TmU3Vlh6L2dWbWVo?=
 =?utf-8?B?M0h2a21DVFR0alZlenYrZXoxUEhUalJwMmh2ZnJDcjU1OStTRVg5eUhsWHdR?=
 =?utf-8?B?WnkxNHAyb1AvVThua2Jnb09Fa3dnOWxwcGZJcW5OY2xDckFXekFhL0EzUDhB?=
 =?utf-8?B?SEJFSjRUbDdvWVNBbmp6ekJxNG9nMm44dkd6MGxLNEFnaXlLU2lQVkxBNG9y?=
 =?utf-8?B?NDdKTEs2VXdjSGh2bmFIVHNqRHY2NDE5ZEJsL3lleTQxNFFFbGZnc2Jvd2s2?=
 =?utf-8?B?UTJpNjFlTGtnb2hIU0FTYktHVk5RSlRiTG1YSmxxbUZUc3ZiMFVWTitZYmVT?=
 =?utf-8?B?azFyeXI0VEVvbHhWM05CNjlvU1ZFSGJML2phUjF2dDhuTGc0a0NrbHhhdCtE?=
 =?utf-8?B?dHdhVzlndG8ydFJldzNWak5XWWg4RTQ4WnR5L1pZVjNnMGlpaHZlMktwdnlF?=
 =?utf-8?B?UzY1dTZGMUNxeTFWbllRQ1hXOUh3UW55VVpaYTdDZkpJMkJaS2dyL0tBWU04?=
 =?utf-8?B?THJYSStvWVlUSHpvMDJoZkRCeE9tVFhrMmgvenZ1Unk2RXQvZmhqSm1Objl0?=
 =?utf-8?B?MFBjSDNwSURjckg1dE5XanEzZVJwVCtCaThiYzRzaWIxTlFhc3dVdkhYdlNP?=
 =?utf-8?B?bmdXMlNKdVdRM2lxblFYWDdNK0dpcGVQMlhObkx2VFhxWXZyOU5VT1pRaG9X?=
 =?utf-8?B?eHdkemNJdWhITmFLcVdvUXJyNktmdUkveEZqUmlQTmliNXEwSmhtcFRJNjVS?=
 =?utf-8?B?YXk0RVJsdHlSV3RJS1pLaTZVK3RFRlg1NWFJYTNWOEpQakRBd1hPT3pKb0hw?=
 =?utf-8?B?b05BY2oyanZSczNNNGt0cllkamNMSEV3UEVDU3BuajIzVUhNTUF0TkpkOU5V?=
 =?utf-8?B?Y01LMWtWU0RLL0VFRkxDeWlvZ2F3NndFVDdPRGdWb2M0US9nU0ptRHlIR0Fk?=
 =?utf-8?B?K1YwRjBqME1YR0YvRGo4MjFLN1JyWUR2TXk2eWdKQzc2Z3pEOURLWWxIVFZG?=
 =?utf-8?B?ODF0cUtQTkZsTHYwQjhMdzNuVmhRcXlGcjRXWTNZZ01Vajhwd2xuVk9qNW03?=
 =?utf-8?B?OFNnM3JQRmVmUytCMnVyb0E0bG5RUjBVcnkyV3kzdXc3RjRUajI3bnhDcVlQ?=
 =?utf-8?B?bTUzYzFVWnVhS3EzOFk5TFd2d1NhTFg3Q0JldWFnVmV1anB1VHlWVnJEVmlw?=
 =?utf-8?B?SzJNa1d1Z2k3NVZ4NFNHSnd2RmVrTmZRM3Q3cE9aeXBLbHpuNUIxR3l0Q3VP?=
 =?utf-8?B?U2dqdEhDNkVjOGNhL0E0NVFUS1YrWjZiRjNYaWxEa2FSbXZ0MUFNdUl3VnB2?=
 =?utf-8?B?NmV2TnpERGc3OUxYOGhOL0ZINGMxeUUwS2FoMzdyUzlQRXZkY1llYmFrUHV5?=
 =?utf-8?B?eHFrTWVBc3pOWm5ld20rT1REZWk3K3BOV3RFczdXUm5iaE95eEZmZUo5V0w1?=
 =?utf-8?B?TWs3SzdhSTlxOUU0T1M0N3JRaXBqU2FaNWFZczhhTVFHNFZoWndvQTI5UUVk?=
 =?utf-8?B?VzIzZWI5NDRIYzFxd2kxVjFvaDl2b3ZybUVCMmtuczF1ZWEwb3FnRThuaHM1?=
 =?utf-8?B?dUt5dGRzN2tzUDdPdHh4VDBDMy9mM3JFVEQ3T1RPR2Q2REE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXNGdE9rWGRjbjNyMTV1N3R2UUplMzgvRUI2aW9sSEp2KzFqQ1hYZWRmWFNJ?=
 =?utf-8?B?UEtDbEpnQUVlcG9CdGluaVFHK1l6RThhaXM1Nnp4SHFtdnBVVmtDSHg3d1J0?=
 =?utf-8?B?U2RvaW5rZ3hVVFAvajdhc1ljZkduK0lKS3JwNlhDckFUeHlRZ2xkSGlOMW9r?=
 =?utf-8?B?YmJ3ODk4Zjl4Zlo3YU5ibmNQT0tMalluQnhHM1BEdHFwbkd6TnlJRjJvZXFz?=
 =?utf-8?B?TDRvcWtIcURXaW1oMk5SYVZXMEpFYnNBOTh0QmEyd2xVRW96ZVcyQ0RlVHVC?=
 =?utf-8?B?QmhlL2taK1ZzV2JvdHFXQVlnY3hKQ24vY3cxQXZ2YU1Qb0E2bmkrUmwrL1Ay?=
 =?utf-8?B?SVNnRkdndng0dUFQQXF3cG9mSHVvZTI1aysrN1lKQ3pqTVBpYUdWTWFtUlFp?=
 =?utf-8?B?L3dVQXdtNzFjR1VOd24wczhyWU5RZzY4bGdZWmROME1WcDNnNGZKVGpWb0sz?=
 =?utf-8?B?ODhlZUNHbU0zRzl4QWxIMHB3bHdUVFVuTEFvMVl3VXhkbTdhYitEM2NFVnhz?=
 =?utf-8?B?ZmxwTmZTTGJCdUNndkJXMGUzMVRqYVlSTElkTGhWUG5pa09HZVR0VHpTQXJh?=
 =?utf-8?B?UUJQZlNkanRpOFhBVXNCUXo0WUptZDJ0dDdPMFZIYlZ4Q0VLeVlhV0dnbDA2?=
 =?utf-8?B?dlN5SElrdGlkMmFMUU9XUWlNZzVDUlFBMnFxNDEvUDhvYndCSjlocXFEV3Q3?=
 =?utf-8?B?WlVpaWdvUVZ0dmoxaE5UdFFRbWpnNXR1UmNMenByRVpUckJBR0svYWVKZklI?=
 =?utf-8?B?N3p5TWNtK3hiMW9WNXFEblRNcWpSLzBEUDUzMEd6MUtaUGltSnorK1JVMFdJ?=
 =?utf-8?B?am5ReUtRdE1CYUx6dVh1dWJjN0ZWUzVnZjlXbkFXcURRaG1xL0JHZDBCVDMv?=
 =?utf-8?B?ZlhFOC9kYmZNY2V3VnQ5Q1ZYbEYrMnc2WnlCT2NuZ1orbUg1NWx5SnRuY3Yv?=
 =?utf-8?B?d1N3QmhzdVBEaC9BdjZwekg5S3QvQlpjdkszakJudzFKbmJEUkhXM0JKbm5R?=
 =?utf-8?B?MzBkTHZwcnNlQmd4eitKQW1CbTlCaXg0d2o3MTFYUXBmdlBZVmdXM3NiVk9y?=
 =?utf-8?B?MHVIZy9nUE9XK0g4bk1GYUdiZjVaa3dXS04rcFg0ZjZHMkl4SDJGTlRmSHJF?=
 =?utf-8?B?WFo1VjFSNVYvU2svRHJ4NW4zeFpmUVF1c1NkdWp4OW1MR1dIOHJjRjlIQ0J2?=
 =?utf-8?B?VGxLSmljOUhmaDhEeXdFcEthZ3d1UUR6cDJhNDFuYkdNZUl5MzlaQ1RRWTJB?=
 =?utf-8?B?UnhjTlFzSDlMMThDTlN5MmVxbzIyUFJyTnczRHBKU0d4Qit6OWwwWGQyaWI3?=
 =?utf-8?B?cDJuNGxPZ2Q4cmxNamRQZTNpVzdaRlZXS0pjUzNJUkd1ZW9uL1ZHbkxNby9x?=
 =?utf-8?B?YlR4djYxMkRkYkRVVndhMWc5SENnNE1rS3VvUE1sL0ZIeEdETUFMZXpXSmpu?=
 =?utf-8?B?MzlzTExYYnJpcEJDdUdyOHAyTjlYakRkT1lMcTdtQW8vcFphZjVIWU9DWkdl?=
 =?utf-8?B?b2xodVpMR1lnV2RmL2FzQm52OStHREQ3US9XTzE0am9VOGF0Y1RVRmtabllK?=
 =?utf-8?B?RjhnMTBQM1NKQ3JFNU0rMGhMQ2ZtNkNOZ0dLY01hMDZrZDAveDUzMFhzaS8r?=
 =?utf-8?B?ZDJHZGRnWHM5a2VVcTcwSkFzbU9pb3p2a3hPWlM5RDFNZEZmQjlabnVyS0xJ?=
 =?utf-8?B?ZE5zNUpSdDRVK2pxdWFWTmV6RUp5NG5BWVNkY3lyUnNETk5FRnhGS29Tem5S?=
 =?utf-8?B?WVVJTFdsNmdNc2lrZ0FkUmw1aDE5THF4djJ6eFBlK2hZZ1FXdXpVYWpValZM?=
 =?utf-8?B?VkEyTVBNcksxcWhnTHNSZVV3L3VOa1J3SStGSmVTVkN4dXJPZWRKaUZQTERz?=
 =?utf-8?B?YXpYTnI3d3V2WHBIZ2hSaDRwdFVtcElZcVFlNmRYbkMrdHRUcEJvTy9lcEFx?=
 =?utf-8?B?Ry9Td200elFUUUlXekdkYWpBYjdMUi9oRkZQSjVETGVZYVNNQ3VET3R3VC9U?=
 =?utf-8?B?ZHRyWWUreVk4SFBGM3lPeHNTdWU0NTd0eXpuQTVpbWF6U2s2WFNmZCtlRlB1?=
 =?utf-8?B?RUlEQnFEYlpSTFR1SUR5VXNNU0lKbkJrUWN0bytUZHFZNk42MGpjWkJUZmdq?=
 =?utf-8?B?VFFqOXVpUlZsTUM5aWxzM1NaTCtEOFZFSGtHSUhOVjQyZEJKVmtYYkFiVklU?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E65BB24A36C37F4F987C0FAA3AC60477@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90144bdb-03f4-4f43-ca20-08dd47faa919
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 04:40:06.0869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqsCMsNlYvutT2AfKLuDiLqU8fewbMaJBrvAQEJcBnspRqFLA/cMP2H8Xcxi94gNOXBRRlY0SiEz35b0G+vMDPIK/SV0TWMD6cJBObJnu5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8844

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDExOjU4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEyLzEyLzIwMjQgMDk6NTksIENyeXN0YWwgR3VvIHdy
b3RlOg0KPiA+IEFkZCBkZXZpY2V0cmVlIGJpbmRpbmcgZm9yIG1lZGlhdGVrIGNvbW1vbi1kcmFt
YyBkcml2ZXIuDQo+ID4gDQo+ID4gVGhlIERSQU0gY29udHJvbGxlciBvZiBNZWRpYVRlayBTb0Mg
cHJvdmlkZXMgYW4gaW50ZXJmYWNlIHRvDQo+ID4gZ2V0IHRoZSBjdXJyZW50IGRhdGEgcmF0ZSBv
ZiBEUkFNLg0KPiANCj4gQmluZGluZ3MgYXJlIGJlZm9yZSB1c2Vycy4NCj4gDQo+IA0KPiANCj4g
QSBuaXQsIHN1YmplY3Q6IGRyb3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiZHQtYmluZGluZ3Mi
LiBUaGUNCj4gImR0LWJpbmRpbmdzIiBwcmVmaXggaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhl
c2UgYXJlIGJpbmRpbmdzLg0KPiBTZWUgYWxzbzoNCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy1yYzgvc291cmNlL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0Kkwx
OF9fO0l3ISFDVFJOS0E5d01nMEFSYnchbXp0WWZOM242X0lBeDc4UzQ0UEZPZXRRUzUxLWg2b2Jt
MkhIcmpFVlJJLUhKWXl6SjJWV2JiaWsycm4zcHlic3NVQk9UNGdwNURNN01XRHgkDQo+IA0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IENyeXN0YWwgR3VvIDxjcnlzdGFsLmd1b0BtZWRpYXRlay5j
b20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbCAgICAgICAg
ICAgICAgICB8IDEyOQ0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTI5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktDQo+ID4gY29udHJvbGxlcnMvbWVkaWF0ZWss
Y29tbW9uLWRyYW1jLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21t
b24tZHJhbWMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
bW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbA0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jOWU2MDhjN2YxODMN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFt
bA0KPiA+IEBAIC0wLDAgKzEsMTI5IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UNCj4gPiArIyBDb3B5cmlnaHQgKGMpIDIwMjQg
TWVkaWFUZWsgSW5jLg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogDQo+ID4g
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L21lbW9yeS1jb250cm9sbGVycy9tZWRpYXRlayxjb21tb24tZHJhbWMueWFtbCpfXztJdyEhQ1RS
TktBOXdNZzBBUmJ3IW16dFlmTjNuNl9JQXg3OFM0NFBGT2V0UVM1MS1oNm9ibTJISHJqRVZSSS1I
Sll5ekoyVldiYmlrMnJuM3B5YnNzVUJPVDRncDVHRDUtTWdrJA0KPiA+ICskc2NoZW1hOiANCj4g
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFtenRZZk4zbjZfSUF4NzhT
NDRQRk9ldFFTNTEtaDZvYm0ySEhyakVWUkktSEpZeXpKMlZXYmJpazJybjNweWJzc1VCT1Q0Z3A1
QUdFNUVjaSQNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYVRlayBDb21tb24gRFJBTUMgKERSQU0g
Q29udHJvbGxlcikNCj4gDQo+IENvbW1vbj8gSXMgdGhpcyBhIHJlYWwgdGhpbmc/IFBsZWFzZSBk
ZXNjcmliZSB0aGUgaGFyZHdhcmUuDQo+IA0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4g
KyAgLSBDcnlzdGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiAr
ZGVzY3JpcHRpb246IHwNCj4gDQo+IERvIG5vdCBuZWVkICd8JyB1bmxlc3MgeW91IG5lZWQgdG8g
cHJlc2VydmUgZm9ybWF0dGluZy4NCj4gDQo+ID4gKyAgVGhlIERSQU0gY29udHJvbGxlciBvZiBN
ZWRpYVRlayBTb0MgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIHRvDQo+ID4gKyAgZ2V0IHRoZSBjdXJy
ZW50IGRhdGEgcmF0ZSBvZiBEUkFNLg0KPiANCj4gU28gbm90IGNvbW1vbiBoZXJlPw0KPiANCj4g
PiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0
OiBtZWRpYXRlayxjb21tb24tZHJhbWMNCj4gDQo+IFRoaXMgaGFzIHRvIGJlIFNvQy4NCj4gDQo+
ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1pbkl0ZW1zOiA5DQo+IA0KPiBXaHkgdGhpcyBp
cyBmbGV4aWJsZT8NCj4gDQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogRFJBTUNfQU9fQ0hBX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9f
Q0hCX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hDX0JBU0UNCj4g
PiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfQU9fQ0hEX0JBU0UNCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogRFJBTUNfTkFPX0NIQV9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246
IERSQU1DX05BT19DSEJfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkFNQ19OQU9f
Q0hDX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFJBTUNfTkFPX0NIRF9CQVNFDQo+
ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9BT19DSEFfQkFTRQ0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBERFJQSFlfQU9fQ0hCX0JBU0UNCj4gPiArICAgICAgLSBkZXNjcmlwdGlv
bjogRERSUEhZX0FPX0NIQ19CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9B
T19DSERfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBERFJQSFlfTkFPX0NIQV9CQVNF
DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEREUlBIWV9OQU9fQ0hCX0JBU0UNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogRERSUEhZX05BT19DSENfQkFTRQ0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBERFJQSFlfTkFPX0NIRF9CQVNFDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFNM
RUVQX0JBU0UNCj4gDQo+IERvbid0IHVzZSBzb21lIGRlZmluZXMuIExvb2sgYXQgb3RoZXIgYmlu
ZGluZ3MgaG93IHRoZXkgZGVzY3JpYmUNCj4gaXRlbXMuDQo+IA0KPiA+ICsNCj4gPiArICBzdXBw
b3J0LWNoLWNudDoNCj4gDQo+IE5vcGUNCj4gDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsN
Cj4gPiArICBmbWV0ZXItdmVyc2lvbjoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gPiArICAgICAgRm1ldGVyIHZlcnNpb24gZm9yIGNhbGN1bGF0aW5nIGRy
YW0gZGF0YSByYXRlDQo+ID4gKw0KPiA+ICsgIGNyeXN0YWwtZnJlcToNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgUmVmZXJlbmNlIGNsb2Nr
IHJhdGUgaW4gTUh6DQo+ID4gKw0KPiA+ICsgIHNodS1vZjoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIHBsbC1pZDogdHJ1ZQ0KPiA+ICsgIHNodS1sdjogdHJ1ZQ0KPiA+ICsg
IHNkbXBjdzogdHJ1ZQ0KPiA+ICsgIHBvc2RpdjogdHJ1ZQ0KPiA+ICsgIGZia3NlbDogdHJ1ZQ0K
PiA+ICsgIGRxc29wZW46IHRydWUNCj4gPiArICBhc3luYy1jYTogdHJ1ZQ0KPiA+ICsgIGRxLXNl
ci1tb2RlOiB0cnVlDQo+IA0KPiANCj4gVGhpcyBiaW5kaW5nIGlzIHRlcnJpYmxlLiBXYXMgbm90
IHRlc3RlZCBhbmQgZG9lcyBub3QgZm9sbG93IGFueQ0KPiBndWlkZWxpbmVzLiBQbGVhc2UgcmVh
ZCBleGFtcGxlIHNjaGVtYSBhbmQgd3JpdGluZyBiaW5kaW5ncyBkb2N1bWVudC4NCj4gWW91IGNh
biBhbHNvIHJlYWQgc2xpZGVzIGZyb20gbXkgdGFsa3MuLi4NCj4gDQo+IA0KPiA+ICsNCj4gPiAr
cmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIHN1
cHBvcnQtY2gtY250DQo+ID4gKyAgLSBmbWV0ZXItdmVyc2lvbg0KPiA+ICsgIC0gY3J5c3RhbC1m
cmVxDQo+ID4gKyAgLSBwbGwtaWQNCj4gPiArICAtIHNodS1sdg0KPiA+ICsgIC0gc2h1LW9mDQo+
ID4gKyAgLSBzZG1wY3cNCj4gPiArICAtIHBvc2Rpdg0KPiA+ICsgIC0gZmJrc2VsDQo+ID4gKyAg
LSBkcXNvcGVuDQo+ID4gKyAgLSBhc3luYy1jYQ0KPiA+ICsgIC0gZHEtc2VyLW1vZGUNCj4gPiAr
DQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6
DQo+ID4gKyAgLSB8DQo+ID4gKyAgICBzb2Mgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDI+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0KPiA+ICsNCj4gPiArICAg
ICAgICBkcmFtYzogZHJhbWNAMTAyMzAwMDAgew0KPiANCj4gbWVtb3J5LWNvbnRyb2xsZXJADQo+
IGFuZCBkcm9wIHVudXNlZCBsYWJlbC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQpGb2xsb3dpbmcgeW91ciBzdWdnZXN0aW9uLCB0
aGUgdjIgcGF0Y2ggaGFzIGJlZW4gcHVzaGVkOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMzk2NDIwOQ0KLSBSZW1vdmUgcmVkdW5kYW50ICJkdC1iaW5kaW5ncyIgaW4gc3Vi
amVjdA0KLSBSZWZpbmUgdGhlIHlhbWwgZm9ybWF0DQotIENoYW5nZSBjb21wYXRpYmxlIHRvICJt
ZWRpYXRlayxtdDgxOTYtZHJhbWMiDQotIERyb3AgdW51c2VkIGxhYmVsDQotIE1vdmUgZm1ldGVy
LXZlcnNpb24gdG8gcGxhdGZvcm0gZGF0YQ0KDQpUaGFua3MNCkNyeXN0YWwNCg0KDQo=
