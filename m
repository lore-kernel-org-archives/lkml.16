Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38F27C864;
	Tue,  6 May 2025 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504639; cv=fail; b=jdmwBhtlQHMGQC6KTHrMDtpf1RZFkUE3YumqPW+0RLSkjvpXEhhvaPJwiq6I8Yn8u5axGQllVV0ByYJzMsmn8idgiRKsuMw1lxDD+kMeHMqWMifuRabpC57N/HJsKqS+BSCIoFG7q6i3FaeqXsAAqyxDq6iRI9CRSvps7bxwfbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504639; c=relaxed/simple;
	bh=N/FxIZA4dducx2/HkYGr+VOdDvguCI4UeQ13CLyC0EU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RdAHCJ6qaJkQkis3qKjkPxVQefmyT4ZzTvAgz5VJ8n5OkvR2xtJ33CgXZU0R7pHdiTs1QtXGHiFdOuIm69mPZXRwrBfQH1rgE+Q4zF+RjiE2ttX8IqfsHNat/oLwNQSpcwdrwYspmL7q2dpmQk9bUAIdQsp20KX0NhcoME3KnNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BPTLFCpW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=DwEKdGxS; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BPTLFCpW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DwEKdGxS"
X-UUID: 0b1963b82a3011f082f7f7ac98dee637-20250506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=N/FxIZA4dducx2/HkYGr+VOdDvguCI4UeQ13CLyC0EU=;
	b=BPTLFCpWoY9l2IO+7bEutMz5+nVMdyNaj+7TvLq/jzcSIrShsbydA9cM+kZ0LSMr2Zu9omXZ1Vf2g9KPXVYsbfKRuzgHiI1kEVfxBYDfbwwJD7EXi2w/bSL6FFhEOuSKrT1+90G8wa7LqgMmIMA7nn94LyyBsP+Ci4B415ocst8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e7960991-3aa8-445e-8025-c25543e3ee46,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0a556407-829c-41bc-b3dd-83387f72f90e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b1963b82a3011f082f7f7ac98dee637-20250506
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 787820976; Tue, 06 May 2025 12:10:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 6 May 2025 12:10:27 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 6 May 2025 12:10:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrFMicCnzRCIP5tdFpmXOAkwdSA3lId6gY+PbF3XEq4K2zUhfylxQuLnj5a3wFnToK/T58SVeey+QEcKoD2AJHA1q72hjk1MvAK62rjLmcBsUCV/O2cuWgOr0NE+Zhgm0g1SCHreUSJgHGgS7W50iEbGPuP9KnXOv0Lvp/S1YdSmAStldr5ZrGLj7bT9gf6uHqovboO4GVlKMTalbHENCyu9dc2jIPxGYzxHWSJl7SWgSXzzCxJ80vCb6BIGjzLEE0pYC5Z913U3rAqQMwMoASKMvCDScie9vHGqbCpsjaakoG876UVCx3C4AWthMwbX5j9FT7lMTctaNJTKEB++UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/FxIZA4dducx2/HkYGr+VOdDvguCI4UeQ13CLyC0EU=;
 b=DhMKGNWtkZKV+5ySwVdhXgl4iSUBBr/875pJ8HgAeY4Yyu7Z5+csuD6LbtRwk42KeUdAvVzZKPNR1WNCBJqHOx5+ZD7zIbn7pkzwVpAMKJP8CNWSf4mtf3TrjtflxbKbsEvVj/JV6czk9uofe5hNYE/3a3e0vz7QUaEjfjtk2WI320378izkOP8b3ovXCkjmXX6teA6payFXPpvc4TL7WBnv4JbErOrniGMeXNtPMeYPl8cIx2pu3+a7nzRB1Z+ZVrSqi2vq9haxP5oFjTGFCLI9E6A0QY4FKSdAKMVXxaM4K7BjZZmlDlrJ9a7LrIS2J+jV/astAc/uau5M39UkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/FxIZA4dducx2/HkYGr+VOdDvguCI4UeQ13CLyC0EU=;
 b=DwEKdGxSJOCV/NFOtIhgu0VbYs9w1LxKfZPWHxyN4VSv9X4MrJtW2OAuMweKGDMqn0DYPT5+LhBDSN8mqgf2LAft8tiMl+k3QDVUCTm3VSm1fSVmzIaPnveUzJHWh4fUA8z1Z1c5Kmwxjn8WpltXHnkTtx/R6vXdsRVAuD+h2OA=
Received: from TYZPR03MB6493.apcprd03.prod.outlook.com (2603:1096:400:1ca::11)
 by TYZPR03MB7963.apcprd03.prod.outlook.com (2603:1096:400:451::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 04:10:25 +0000
Received: from TYZPR03MB6493.apcprd03.prod.outlook.com
 ([fe80::a3e2:fc8c:cc7b:4e12]) by TYZPR03MB6493.apcprd03.prod.outlook.com
 ([fe80::a3e2:fc8c:cc7b:4e12%5]) with mapi id 15.20.8699.021; Tue, 6 May 2025
 04:10:24 +0000
From: =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Sean Wang
	<Sean.Wang@mediatek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "wenst@chromium.org" <wenst@chromium.org>
Subject: Re: [PATCH 0/2] Add mt8189 dts evaluation board and Mafefile
Thread-Topic: [PATCH 0/2] Add mt8189 dts evaluation board and Mafefile
Thread-Index: AQHbvbeR9K5PTVGS4EuYPadxkaDdR7PE/iSA
Date: Tue, 6 May 2025 04:10:24 +0000
Message-ID: <231555a744a78096ed3f8247b5536fb58024e205.camel@mediatek.com>
References: <20250505121627.3944728-1-sirius.wang@mediatek.com>
In-Reply-To: <20250505121627.3944728-1-sirius.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6493:EE_|TYZPR03MB7963:EE_
x-ms-office365-filtering-correlation-id: 67d98c2c-448c-43df-f1f2-08dd8c53ecfe
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NTBWQTlVcFhNNHIrT0xOcEpnZ2cwdzNRdWRrY0NGSXY2RGJ6RGEwRy9UK2Er?=
 =?utf-8?B?a1g5NExydzBtbm5MMy9jR2pOM0R3enRaK3lwdGczZEZNRmVHOXZKWmJCUTgx?=
 =?utf-8?B?a05md3RWVDVNY1l3eWxzemVKczlVRi9zV09IUHp6ckVaUWlYZW84S3pVdVRm?=
 =?utf-8?B?Y0V1WXBqc0NYb3dlYUpnVkhMejJIc3RRYWhWaEl3cEk4ZVRFSTNTRENxYTVC?=
 =?utf-8?B?dFQ4a2dDZy9VWTZlUk9VZ2szeExvcmhmanRla2NHSkRDbUNQamp5MktsQVVr?=
 =?utf-8?B?NE1KV1ZQY0F1OElYeFc2NmI4M3RPcEZjYnZ0WnBlYWtkNFVhc3hCbUVOaHRP?=
 =?utf-8?B?Wk5ydVFNOHpGaVRIRnFJdEdleVpaZ011alRDNjljalFBd21sbTRYeERaK2Mx?=
 =?utf-8?B?V3Fkc21KeXNobW5ZbmEzRFhLVm9nci9LbDFORXF6RUNWTnZIYnN0dEV3Z0xr?=
 =?utf-8?B?bkRSdGxUdlRPVzdFcWNXc3pnRDRzWGJ4aG1ZYjRhMGJEYzNPbnMzRmtnaVFZ?=
 =?utf-8?B?cVZiUi9GUXJ4bXJ1a3dkZVNBSWg4TEV2bzRHNk55QTVTSW1aZk9QQTNnYUNn?=
 =?utf-8?B?ZGg0NWVyL0RvczJ3MldYY2NNMTh6L2o4T3ppRlBQRmFmRUJRSmFtd2NudW1z?=
 =?utf-8?B?Y29EalNsT2xNc2JmVTR0a09UVlRrN3pWYTZBeWVOQ1FQb0hua3VMOTJDL3Fk?=
 =?utf-8?B?WkpIVUIxRFNIeHpQMnVES3ZYcjRnL2N0NW1SRGV6VHNZazZmSFZwL1RESDAv?=
 =?utf-8?B?d0Q5UVF6RDFodmVSTHJOYzF4ZC9DOWdBWTUzbjJFU0piQTFkTkJUbXNtc0dC?=
 =?utf-8?B?L0tRMXpmeFc3dHVxN3l2MSs0NERyS1pHQ2RBdVVYY3VoWklVZEpFYzRERXJq?=
 =?utf-8?B?U0JRZDJkMmJPYmJvaTg5S09IWVBtWXAzb2FLRTBGNEhqUVFYTmtWanF3UjBF?=
 =?utf-8?B?Z0pUenhDc1Jwak1wanVqaWMvMXh4bHR0Qys2RXM5bEllcXV5dEVReGhvRFU5?=
 =?utf-8?B?eklhS3AvQ0FyZVBjMEN1eVZoRmN3bW95L0ZaM1VlcThHclkvMjN4YldSTEdX?=
 =?utf-8?B?UW9neUJCdjVwMG9qZzJhNmlieWNKemJaYnlMZlh0ejZRY2FhQmhFbjZKQ2R2?=
 =?utf-8?B?YXcwbzliNmRkOWtvK1c2Z1kycWJ4UWViQU03L2tqRHYyNnJoTW9zQ3NzVEFX?=
 =?utf-8?B?NVo4d2ExSFpGazRWS25wR3dROXBSR1dvU09MS20vckZHWStuMjIyODlDZ1dP?=
 =?utf-8?B?YWRsWlRTSmwzZVdocTZVRnZiUHdYSEkrRnZCRzJ6OStsRHZNWjlLenNSQXdN?=
 =?utf-8?B?dkVDdUZMUC9UZFBhUHhxUTQ4dE8vb2d6ZkUzeGJBWUdEcWwzWWJKZE0vWlJ3?=
 =?utf-8?B?NXRycnpRNlFIN0JrMDRqVmhPUmRlcmxmQ0tIejc3RTZzc1dTQnlCclJ4NWtW?=
 =?utf-8?B?TjF0V0pyV001aCs1aDNaKzVKZHJ1eE1jbHJtYzY5bjZRVFl6QVowdnpkSGxV?=
 =?utf-8?B?WUZ0UUdaZ2c2dzdCQXNybEhTUnhtNDJpS3FIN2pBcXkrbldBNWhvd3lxWkY4?=
 =?utf-8?B?eWcrWEk5aHN4d2lldmFpVEoyMVVuN1NCc1BVVDRJelQ5L0V4Wms5WVlUQzdL?=
 =?utf-8?B?b3NlYUJzRzd1b09EZW9NNldaUS8vS1Y3QXA0ZHRCci90MmRiUmFZMktLRnNS?=
 =?utf-8?B?MDUycnZrbExOM1o0YVFNaUJibmdyM1pNcHV6eENJdVBoalowbHNFeTlNRURn?=
 =?utf-8?B?ZFAvRFVBbUUybVZhaHhrNW1BU2JrUGh6NVRESHFxOXppVWxGbDUzQWtiNTlX?=
 =?utf-8?B?djRKVjdNbndwY1N5NGROQytjUUl3NUFpMEtQRmFqaDErRXhibHhyY1lHc3J6?=
 =?utf-8?B?Q3dhWGhRNnFYdVU1cUFJZXIwTGJZZTFtR2RhU0hjd1N2VmVvT1JVOTRadjhS?=
 =?utf-8?B?OEdZZ2QxZXJ2QWtVcEpFMk53TmdjWXUxNGhPcEc3NFJQTTUyckpSWlhRd3Nx?=
 =?utf-8?B?M2dOZk54eDRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6493.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OG80RTFRVWJRZmlXWnQvNGd5Zkh2VFZsVzdTNnRVcnBpWHRjdmhpMjlLTnc5?=
 =?utf-8?B?K0U4eFZvQlZHRzJvM1Vqa293RXBXWWgwellmRkdWbC9wb2pONkN3Smd6UkMx?=
 =?utf-8?B?QmllWXBtNUtLSGZ2MVFZNkxPT1ZTOGEvOFBmaDRGbkMweVdxUGRjN0laR2hK?=
 =?utf-8?B?Y05lSzl1UDFabitabE1RbSs3TlVvWWtCcjd0MGd3VTc0NHExeXdaSFR1Q1BT?=
 =?utf-8?B?SkNpcTkwTWhTWkVESEp3dFBvSnhvekZWM1QxSjAvS3ZQWkhOSm1TeGdPS2V6?=
 =?utf-8?B?UWxtNEw3WG5OQTlHNFR1dUswRHEzdzRmeEVLRGFpWHBnOXhQa2VwNFNEZGxz?=
 =?utf-8?B?ZGtMWnVFUHRmTTlZcE9QcHAzZjVsUHNjQmVISy9LVm1sVk9ad0NleDhEQ0c5?=
 =?utf-8?B?L2M3SDZORVZXd3BWSWEyd2h5NVRRc3NhY3BtcEYzbkdJUjFhbVE4UnpTdkFp?=
 =?utf-8?B?aUxVdWtuQVU4WXZQZENSdkRESUIzY1RIVDJFejNiV2RvNzBQTG90VG9TREg0?=
 =?utf-8?B?enNZa2NuRkZDTjVJNW8xUVFRSWh5MnNzcis0UWZ0aU5VZW1peHJxdFIyVTFo?=
 =?utf-8?B?dSs0OXp3YVczN1dzMURnQ0piUTVIQWNvLzdjSW1yYWIzYUlGTmxUUk1PaDJa?=
 =?utf-8?B?ZHhsRTcwVE9nQ0d2ZVBmSmFBci9adEswYnVlNmd3ays2RGlnMS9wVVJtRng1?=
 =?utf-8?B?T0k4KzZlSjdNY3h4MkM5V1J2NldpQ0h4YzVicXlGb0FMRFU5M2FFb3ZXZlBG?=
 =?utf-8?B?ak1Ma3Z4UkFHcnJTdVYxTWRQTSt2VktMTGxsWjlBV2ZFQ0M3MTh5YzBaM09T?=
 =?utf-8?B?RWxLbzA4NGNFMmpLd1BUNjZIdERFdWd5WkJQVitWTlhxNitvd2pmSEl2NVRi?=
 =?utf-8?B?d3JzYzZNZzNzVXZMNnd0bHB6K3J0VWc5Wmw3dEU2YXBIU2lPTUtXU2RuVVo0?=
 =?utf-8?B?dTh2S3krV3lMckV4SFlvdmxvYktvQ3dJRjROcVZGZ0tNZmM3ZVJQZVNiTE5t?=
 =?utf-8?B?ZkExc2dOM0E1ZlJRRHoxeXhOYUxhTzcxQkw2RFMySUpFMkpDQ0Y4aERFR0I1?=
 =?utf-8?B?Rko5WGIySlJHUDRDUWxDbkw3a1l0OVFwMmRNS25uaEZXamc2S0hoYmpTUGRT?=
 =?utf-8?B?NkFnL1M5bmxzZ3RNYS91cG51VzZURVhlaVozancwVjc3SENyV2N4SElaSXhz?=
 =?utf-8?B?NU5ZMUZBdENOL2tNbncya0taREJUQ1Z0ZkdGOUhoQWlvaEVzdEhFcFlMTEQy?=
 =?utf-8?B?RHlXZnpSd0Nlc2gycGZhODFMZEJLSVRCaTk5SzVIY2Q3STQ4V2IremkzVmFN?=
 =?utf-8?B?YXZoZ2pMUlV4M0VEMC9mNUN0WmtJb05xWk1KOTg0WWtXN3l2VjNwaGVqMmJK?=
 =?utf-8?B?NkY2RzRRWUhZbUViOWdqQW4xZzY4SHVmbTlPcE1rbUNRS2VIaDYvTCtlSjhB?=
 =?utf-8?B?UENsZy9TYlJhS2QxYnk2NUFGa2MyVnlTMWN2emlYS000NVgwcWFkM1g4S0Z1?=
 =?utf-8?B?ZEE2cXlOVnJ4U0xHSUF2ZlBkSDZFaTlKOEl0M1pxVlJDS0NmdWJuazhDNXhU?=
 =?utf-8?B?VWE2cVhwKzM0RlJVbmdHM1UzblloREp1V1JSSUo2VFVQbFhrYlN0N05RQWwv?=
 =?utf-8?B?VmZzZURUMlNzYitINzdRRnZIQXRhN3dHWkJMSlBoOW8xRnQ4MktvSWdWVXMz?=
 =?utf-8?B?Y1RrU0ZlZjR4UFU1Yk92OWk5dmxJQW1UMTgyYndaTU1vL2YycXhMT0ZJTEpP?=
 =?utf-8?B?LzF5TThDVFJvc3I1clpZK2h6SXpseUdkdXFibDNWTGRRUkxWdGd0aXFtRndz?=
 =?utf-8?B?N3BjNGZ5Z2tOT3dTRDBJbEZiOHdNSGM3UmpGeWpWRWRoTzJ2OGRLZ2lHZ0xR?=
 =?utf-8?B?VHhKdlRjTTRmT3FOYW9sZFZ5eE5ianR5enV3a2ZIbDdtdDVPSy9TQXlrUzFX?=
 =?utf-8?B?VmNJRU5QSGJNZmc5Vk9GcDdXdG03bSswQjdVQ1BLQThXTGR4UkhWeHVpUXlL?=
 =?utf-8?B?ZVdjTzYrUTg3VFZtbjVuMkFkcWNLZEoyVk1nallxODFQZTNyN045aXBpanY5?=
 =?utf-8?B?MThISGtvWHl3dGNTdEhISEZyd2J4Ti9OczlyQUxzT3RSazFDNFc0Z1VGRjFl?=
 =?utf-8?B?RXdGd3N0UzFISHBtV2U4dU1JNWdNZGtZUWkwZVRVM1U5dFhDQVRhc2FxcFFx?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA3E47DBB3E1E14EAB44E56160BDF123@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6493.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d98c2c-448c-43df-f1f2-08dd8c53ecfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 04:10:24.2409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1HF22nkrSdcFsjztxnsrUjEaLvqz70ttWsv381t+qGANNlBI+NLXnyLPgOyy91tWMdKuRWlKsVa4FlhzbAOdPxSFqOp8vpl9wslav3HGiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7963

T24gTW9uLCAyMDI1LTA1LTA1IGF0IDIwOjE1ICswODAwLCBTaXJpdXMgV2FuZyB3cm90ZToNCj4g
TVQ4MTg5IGlzIGEgU29DIGJhc2VkIG9uIDY0Yml0IEFSTXY4IGFyY2hpdGVjdHVyZS4gSXQgY29u
dGFpbnMgNiBDQTU1DQo+IGFuZCAyIENBNzggY29yZXMuIE1UODE4OSBzaGFyZSBtYW55IEhXIElQ
IHdpdGggTVQ4MTg4IHNlcmllcy4NCj4gDQo+IFdlIGFkZCBiYXNpYyBjaGlwIHN1cHBvcnQgZm9y
IE1lZGlhVGVrIE1UODE4OSBvbiBldmFsdWF0aW9uIGJvYXJkLg0KPiANCj4gSW4gdGhpcyBzZXJp
ZXMsIHdlIGFsc28gYWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50IGRlZmluaXRpb24gZm9yDQo+IE1U
ODE4OS4NCj4gDQo+IFNpcml1cyBXYW5nICgyKToNCj4gwqAgV0lQOiBkdC1iaW5kaW5nczogYXJt
OiBBZGQgY29tcGF0aWJsZSBmb3IgTWVkaWFUZWsgTVQ4MTg5DQo+IMKgIFdJUDogYXJtNjQ6IGR0
czogbXQ4MTg5OiBBZGQgbXQ4MTg5IGR0cyBldmFsdWF0aW9uIGJvYXJkIGFuZA0KPiBNYWZlZmls
ZQ0KPiANCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsueWFtbMKgwqDC
oMKgIHzCoMKgIDQgKw0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTg5LWV2Yi5kdHPCoMKgIHzCoCAyMCArDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxODkuZHRzacKgwqDCoMKgwqAgfCA0NDENCj4gKysrKysrKysrKysrKysrKysr
DQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA0NjYgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4OS1ldmIuZHRzDQo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTg5LmR0
c2kNCj4gDQpEZWFyIG1haW50YWluZXJzIGFuZCByZXZpZXdlcnM6DQoNCkkgYXBvbG9naXplIGZv
ciBpbmNvbnZlbmllbmNlIGZvciBzZW5kaW5nIHRoZSBpbmNvcnJlY3QgdmVyc2lvbiBvZiB0aGlz
DQpwYXRjaC4NCg0KSSB3aWxsIGNvcnJlY3QgdGhlIGlzc3VlIGFuZCBzdWJtaXQgdGhlIGNvcnJl
Y3QgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggYXMNCnNvb24gYXMgcG9zc2libGUuDQoNClRoYW5rIHlv
dSBmb3IgeW91ciB1bmRlcnN0YW5kaW5nIGFuZCBwYXRpZW5jZS4NCg0KQmVzdCByZWdhcmRzLA0K
DQpTaXJpdXMNCg==
