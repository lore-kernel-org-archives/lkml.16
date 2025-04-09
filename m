Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F382899;
	Wed,  9 Apr 2025 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182981; cv=fail; b=B3gLs0vjSq44fi5rXdaQbydb+56C1A59t9/xrBkq4vbrDl41qGtlhKGnhrrTZpRnGPt5VPdzOXfdflXvcfzBJqlc6+nCe+f7W5qvseLIKKRQW7FECTZWvppuUTAJnnxVSJcbKmOo8AlZQrlyOVkZ/zukgd6f9kx6enbrzNx9AJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182981; c=relaxed/simple;
	bh=p61m06kYbyV2IJxtkd08VhtLR57pXg5OAq4w+L0VYQ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B2KWjQ5tGbTig5Oi2WP8DonbI+gY/3v5L7mDE75HIaw+X8oJRTFHwJnhWrtKdATacOz2CnfLbgyiSvNgMat6Fg6efqwQWQRVXtPJBx8agGPO+iQPlwUKhr7hkptOQ7o+IM/pEscH4mV1vUNyYg1Kh4l7AjKxzqeq40H7M0k6bag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GCpbOjw+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OrxEwe0c; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GCpbOjw+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OrxEwe0c"
X-UUID: 85f4d14a151211f08eb9c36241bbb6fb-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=p61m06kYbyV2IJxtkd08VhtLR57pXg5OAq4w+L0VYQ4=;
	b=GCpbOjw+hqJVlSJQlKemT8+gQDvCoaMsU5vPKd510hygBr3LfUwJjfWdrRpbaCutbX6aN6/DzGKOcBGuUj3dMeei8fELz6PHRtiQeG5ICPCbtvXr26CXzrbIq7ibLdI9jifD1ghctPd1yCRd63zqcrCGXEgDckwXfLmZ6p3xgvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a43e5fdc-1400-4cd8-bba5-dd6bd869af5d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:621e088b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 85f4d14a151211f08eb9c36241bbb6fb-20250409
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 396619312; Wed, 09 Apr 2025 15:16:14 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 15:16:14 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 15:16:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsbyd4u3TMizE8M6yjzlT31BB2QNqrTRKuryBtUiB/TW3Akk58WmC5XCQ//U00Bgfqi130+jsPdIugNXqT3j0+1m7EqDIfPMP9CXXYIemaXlvMiEl1flOW6xiO2ZAuMPO8sM25Fx5imxcw1GCySfLn4uLHLn998/E+dobKAQqquLz02zMwI2soSINT0lwXaQ36GD1ZRFWZF4a6Ru2l3VYHKMAv5tlbYKqZK+7UydAvqTKXsc9QIfW3F/Gyg+Yqh3eJgeDMdYE3N0ySSNZXb7/MOS3RR/GdmJwgj47No3Wk3bjD6SMnle93bhRWhr6pAkBTSZ9pI8NszCiszJvWUOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p61m06kYbyV2IJxtkd08VhtLR57pXg5OAq4w+L0VYQ4=;
 b=I1Mau2dFhmTFx22VG/NgOIqVbqVKTaR5Gu2FVAEBwJK/ujkt068tTCkbE4CptM61NH/MTPMjq5jbZz5WgN59NQnGQORuh9v4HqEn5YqC7PmIm4ephl5aLzJ2XKXnU/Bj1rzAFIpHOtAJ9ylwREPV1/hUdjjmHos8ftflsMR5fViRfy4Lfj/ltMS1rwdFbNopkfMLmr2oKBEicm4bLUxQV8LTDdFdUqWkieMa+LDXP9fPm6Thy8bvEotnO65w4WfkbaGsD1l4lyJ1L0eapgK+tw6Af94PRR6Ea61ZJRcYrEnzMVmcfL72CnZ1yx2T4nEYNsmxqqfpTg4LpvgEKMxKgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p61m06kYbyV2IJxtkd08VhtLR57pXg5OAq4w+L0VYQ4=;
 b=OrxEwe0cCIr/E4rBqCP8OlKum13ys1qQDJCrgtWhlovdUi7xj9629v8ipN6kvOG7E6I3jPX6eVAZqGwE/8L7tJ32GlV2azQ2k9Xgc+Dla0gjT3jjMvUVXfD83Lsw5BroyG6UdNfBKHPuGpKLWGcQilIL0jxLSTjX0R5acErIic4=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 JH0PR03MB8842.apcprd03.prod.outlook.com (2603:1096:990:a9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.43; Wed, 9 Apr 2025 07:16:12 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:16:11 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
Thread-Topic: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek
 DRAM controller interface
Thread-Index: AQHbpGS5A49KSjUl2EqLUA5Bd0u2JbOWl/GAgARdzwA=
Date: Wed, 9 Apr 2025 07:16:11 +0000
Message-ID: <bf1f44c34097d090894303cf6e3a9f017f4d5b38.camel@mediatek.com>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
	 <20250403065030.22761-2-crystal.guo@mediatek.com>
	 <20250406-hasty-saffron-flamingo-5c1dae@shite>
In-Reply-To: <20250406-hasty-saffron-flamingo-5c1dae@shite>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|JH0PR03MB8842:EE_
x-ms-office365-filtering-correlation-id: a4714001-c93d-4b33-a656-08dd77366858
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S3dwUC82cXRyVm1sOXY1b1R2WmJnZFd4NmI3YnJNUHF2ZUF3S1VHOU5SYkZO?=
 =?utf-8?B?U1dVYWIzSWRmdzZlK3pwblhZUzBVRGNtaDhDUkF5RU9kckVIcTh0cGlUaHA3?=
 =?utf-8?B?RDhrZ3ZPWG8zSlZlTTVaVzBFcjg4MzFhM2NPUWJZdkhBWWVWb3N3WmJoMFQr?=
 =?utf-8?B?dVJONEVqTXhVRUp3U01HZXgrYzlsMTIramRFdWcwV2VGbHlKQ3NKd0JCMWhD?=
 =?utf-8?B?bUhWWTVqdWVQTVptelo4KzFqbklDYjVkQ1BjNnZRaHBrZTBQRHpFSU5Jb04x?=
 =?utf-8?B?U0xjMHF5K2pGaklqdE9aVkIxZTZYK21GWVg1bDBMR3FTQU9aT1VxUFJaYU1G?=
 =?utf-8?B?MzFKOTJUbVZJaWhCbDV6ZUFJMTlCRjlqazEvbFFUbWtwbGh2MVMvUHVYOWF1?=
 =?utf-8?B?UGFKd2VpQWlWaWhHZkZNMDlQMkNiU21DYnVxY3RhRFFyM08vZXE3M1FJc1Ji?=
 =?utf-8?B?Y1ZNUnBHQkk1TUlRUE45cmdWSlJOMXFmSlV2Vy9DbFZpanZKc0JFc0lZZm44?=
 =?utf-8?B?V2RlMWNDa3ljZkJmVVZyWUovbVppamdkdW5mbGVKUjJvL0RDbDRIT2ErUTlI?=
 =?utf-8?B?ZXh4MkVKN2hOajV0VWtadmlyVG4yd0ROL2trc1V4Z3NRV2xWRVJ6MEc5Smtt?=
 =?utf-8?B?Y3BXY3FMVlFoUllYYVRXS0Erc0xJR2FRTWxtNS9mSExsdVQreGRKZXVBbnBM?=
 =?utf-8?B?b05LUUJVeUhtY1l6d2hWZzNtYTZYM0FLRXIySzR5RlNwN0luTXJtQVRsQnV3?=
 =?utf-8?B?Tlh1V1B3dTg5ZVNMcEtQVUhGN3VZVExJenBqbjk3d2x4bUxkTlVTZFk0OU5X?=
 =?utf-8?B?cU0rd2NLNjBHODVURGY2Z0V6dGpueklkNWN1SnlSbjNHUkphemNvdGNOZ0lL?=
 =?utf-8?B?Z1BXMVMxU3lzVVlVSTN1c2FnakFWSFFBaDVRQW1WaGttMFVseVVKWkIzNkhL?=
 =?utf-8?B?a1FpYnh3dFQvaE1NWFFDY0hhNlFreWdHTXUzQi9hK2JFK1V6aUJsQlV6cmhJ?=
 =?utf-8?B?dy92VDlMVnl6Vmw2QjRtcHhQSElRd000YzRjRmdHbDFvMFNNM1l1UUlZL3RP?=
 =?utf-8?B?cmtqNzhZSlZraUNzNjNGakRnaDI3VlRZb0pFQ21sZ0I4Y2VSVndtMXBpTnN5?=
 =?utf-8?B?MER3d1V5MXMvS0E0TlIzM2s1aGdHR28yTkpQMk5zZzNTUk15MkRDYXYwMGE1?=
 =?utf-8?B?Y1FuditHSFJtZWtwTXQyTDZaL0M3MCs2NXEwL2x6bVVucXV1YlNyWjV6QTZW?=
 =?utf-8?B?Ri9kUmNVNFEzMmp1TWU1SXFWc1R5ZnpMUUdrV0tWU1lwOHJ1UjBpaFJCTnZv?=
 =?utf-8?B?MVYvdC9FZXR4TWlZT29FMXZKVlp3RkZxZ1RZWFgwZncxN1RTWUo5NmNsblAw?=
 =?utf-8?B?MkxMZm9HaEl1UGxyem82bmFCSFZxSVVzdWNmeWg1RnB5L3h3L29tVDIrZzVK?=
 =?utf-8?B?eXhNcUJJUjZRL0doTnB1UnBFT2JZNDVlWVVlVUJGRExkbzAzYUNaSE1VZjF2?=
 =?utf-8?B?cm5kc2lzMkIyKzZDcm5YSTd0UnFDYXVaNTZyODNXTlBvOXRENEcxUmRMazZV?=
 =?utf-8?B?dUJBZ2tvS1BWRS8xQWJPNjljV2gwTy9aTW1mQ1pBZWxXTU9sZGtHUUdUS3pQ?=
 =?utf-8?B?SzdZMG5Kd1B3RnpMYmxYeVZ5b01hK1BxNG5aZzhxUFhGTThSL1FNK2ZpcXdJ?=
 =?utf-8?B?SVViR0xMSHFEY0U3ODNDUFNTMmRkM0VNVXJVNzNoVFhwcTFaeW5wdlBLOGY4?=
 =?utf-8?B?OGxMRmQxeWFMSmkzV09qRnp6NUZWZG1HdWdBYjhsSzVRb0FJTVpscVRUWTRX?=
 =?utf-8?B?ekx1SGVpakQveHdrelgxZ2d2M0JKQUxWS0RObDY1ZUd1MktTTVpYNHB2K3dx?=
 =?utf-8?B?dVFZdXRiZXloaEkrZU9DdE1vbXIzWnIrbkRTU1JuUm1tNnZDQncrbmw1NzlF?=
 =?utf-8?B?MW1paS93RktSQm1GNkE3ZllzV0ZpTkIrUzZvTXBheGJPazZyN0JyalFEeGJv?=
 =?utf-8?Q?YDoReTJ+00soHzv/lUlSQXyGwcrTzo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZwS2dPWkI4S2JyMlJMNlBSZnBZNCszZjFVMm9BcXJvWDVob0MwWmorY1VH?=
 =?utf-8?B?bUVzTzkvbFBnUkluQVcwamd1RmV2eVlvSlQ2akZBakVQdVRUYVRJVEg1RUI0?=
 =?utf-8?B?WWhjRkpCOHR0ZkIwd0ZTblNlbk9IMXN6M3ExSEZsMFlxVUU0OTBkREZFVEtt?=
 =?utf-8?B?RE1Pb295TEFsWWc3Q2xuelFJeGk3QkVDMGpleDkxNnNpQmFGWnBDTzV1bDE5?=
 =?utf-8?B?dUhSSHcxMHJYT3Z6UzJzYVlQMkE5a2t6N0ZiOW9jZFl5OFR4L0M5aU53VHIz?=
 =?utf-8?B?RVh0V1ROMWNkaVhNNFljYm0yMW1tRHRrV0VXL0prRWJxWlpqL2sxQ2hNZkJS?=
 =?utf-8?B?MkdHaEtDd2RwRGxKVFYzamFNNHF4eWlzNEdIZmZmVUI1MS9xUlZHNjloZ05O?=
 =?utf-8?B?Y2w1RnBYVmdTakNqZjlvbU1Wdkt2OVVReVpPL3hPTW9QaVVIUXN6QTJybCti?=
 =?utf-8?B?ZXdHeHFhc2dpSjN1cjdtaXJKOFBXTk5hTS9nRWlCTXNKay96SGNCT0ZRNVpL?=
 =?utf-8?B?cmxSYndlWkZ1MzlhbXk0Yk1Ua1B0NmhhL2plNXVqdnE1SmtNTUs1UTM0UzN5?=
 =?utf-8?B?dG5XWTY4TTNpa2M1U0g1ZWJnNkw1V2lSVkZmWGxLeDBEQUNrUEJLMXhNU0R0?=
 =?utf-8?B?RTFWRWZVdnBoSjRPOWNiakNoSzVoSjYzbjJLOExYOWp4WmpiRXZidGpIZXVJ?=
 =?utf-8?B?L3lpTVdaeGhPOUVDYjU5SU9mdkZRWHVVekQyQTZLZmUrc29oT3g1K2lPMG55?=
 =?utf-8?B?RlF6RlM5ZTE0K3pIenFpTFk4R29pbWtJWjcyUzFPRE5qaUN6ZUszNTRybU14?=
 =?utf-8?B?Ymk4bHUxZmNUOUZsSTZFelVtVXFpVGZMRmhHKzB2L1BjS3hSRkxTcmF3MDFo?=
 =?utf-8?B?VUZTVStXWndkWktGZUQ3Zk93Mm9rcUkvUkJRenVteE5wQ2xNOCtXOUdHa0Uy?=
 =?utf-8?B?eGxjaW1oZzB1V0djZGkvWEQ2R0o5eUtTazR5Nk4xS0RLRlJkZU5zZnNOSHFv?=
 =?utf-8?B?Sm0yWHMwWlY2RHR2VEM0K29uR3lmcUFUMHpFK3VMUWRvcE1Ob3UzZkFpcnhi?=
 =?utf-8?B?Qysza3hRYVJKZFlFTWx5SUpoRGViK1lKYXBCaDFkN3V6ZUxNTVJxbHZlNVB6?=
 =?utf-8?B?cmp6aXdmWGhXcTZENUNVMkRXRVVTeC94MmpMZzJhZkQ4SGtnUFE1dXUrOHNY?=
 =?utf-8?B?R1Y3RlVFT2JsUFZrK0dUUzZWbmx0eDZtcnpKV1RmQUMwOHU1aG5XelpHVytB?=
 =?utf-8?B?L3FsVEQ5MFhGczlEM2xQQlZjd0tLUmtQSnk2WG5UVkM0Qm5ET0w5am1yWndW?=
 =?utf-8?B?VlNWNFFGMkwvVHVoSlpSRlA0NUNCQUQyNlAyVTVicytYSzBhNjhWNDhmOVZu?=
 =?utf-8?B?enNPMnpvZ3FScGsyeWVDNThTNjRqdkcyMnN1Zkl1TGlhcEs2a3M1TTkyMG94?=
 =?utf-8?B?dEw1eVZpWE0zeHlYakswK0ZmUWUrTlpjVXdMcW9tZ2E3RkQ3M3FUbDc4VzFs?=
 =?utf-8?B?U2F3NFRGY0I4UUFUOG4zWUZTL0lpd2RRbTkzQXZ1a040SHNvdllEYUxHN2J1?=
 =?utf-8?B?aERoS0FWTXNKdWFaU1MrSmFiMmc0d0prSTVhd283a05VT25UbHhONjNGV29h?=
 =?utf-8?B?YWlqL3FwNUpJUVBIMnlwRkZsRXlUdnNlS3RkSUZwN0ZxQ29CMkdEOVB1UHNJ?=
 =?utf-8?B?UmZRaThkY1ZUT2Y0R2ZQVFdSakVBZUNLMlVCNTRaNHQ4ZXR6WWNnNE5ibE5S?=
 =?utf-8?B?ZXJKVWFYL1FYR2VQTkdJb1pSVkpWVnV0bG5tSWo2RXVwaDluWDBsS29IS1By?=
 =?utf-8?B?ckdEZEFWM0N5c2FPcEhudjJxbnczMG5RQS9hTDk3SHplYnhocWtsTUJraGc2?=
 =?utf-8?B?ZHUvUDV0R3BJdy9WeGVlbG1BOFJXVktMS0hPc3hTSU5ZVlplSGZ0d0EzTWhr?=
 =?utf-8?B?NlVWNUJ2aTNWU2RaYlYxcVJLYWV2RWk0MWpaWXhhV0hMeTN2blJNVUlteG5E?=
 =?utf-8?B?SWFxVHp0RjJWM3U4a0xnR0xMVXQybHRWVk9EMmlEUGlzZjgyN2JZdUQ0UFpl?=
 =?utf-8?B?S0ZlMHlPTit4UElrcTB4NEVsNTVhdnZmU09OQlNPTTh0RGN0MmhsMHpzRmgr?=
 =?utf-8?B?cnkwVVoyTm83VnROd0VlR2g5cjQrRkpBc05pMmhLTjVBMG9EVmoxb0Jaa3Fm?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B48F2D6D1DF0A34BB47B0DEAA08BF2BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4714001-c93d-4b33-a656-08dd77366858
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 07:16:11.8772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ivm6Dk8qljslUvrLBUCOqxWiDr8P+maYmZr7q3s5qO+pI+JEoivSoZ+c7n6xRxYEaZBF0z2BYl8A7Kh/r4Eocjumc8zrG64ayQ9Vn0YAs/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8842

T24gU3VuLCAyMDI1LTA0LTA2IGF0IDE0OjM1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFRodSwgQXByIDAzLCAyMDI1IGF0IDAyOjQ4OjQ3UE0g
R01ULCBDcnlzdGFsIEd1byB3cm90ZToNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBDcnlz
dGFsIEd1byA8Y3J5c3RhbC5ndW9AbWVkaWF0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRp
b246DQo+ID4gKyAgQSBNZWRpYVRlayBEUkFNIGNvbnRyb2xsZXIgaW50ZXJmYWNlIHRvIHByb3Zp
ZGUgdGhlIGN1cnJlbnQgZGF0YQ0KPiA+IHJhdGUgb2YgRFJBTS4NCj4gDQo+IERSQU0gY29udHJv
bGxlciBkb2VzIG5vdCBvZmZlciBzY2FsaW5nPyBPciBQSFkvdGltaW5nIGNvbmZpZ3VyYXRpb24/
DQo+IFRoaXMgYmluZGluZyBsb29rcyBwcmV0dHkgaW5jb21wbGV0ZS4NCj4gDQoNClRoZSBQSFkv
dGltaW5nIGNvbmZpZ3VyYXRpb24gaXMgY29tcGxldGVkIGR1cmluZyB0aGUgYm9vdGxvYWRlciBz
dGFnZS4NCkluIHRoZSBrZXJuZWwsIHdlIGN1cnJlbnRseSBvbmx5IG5lZWQgdG8gcHJvdmlkZSBh
biBpbnRlcmZhY2UgdG8NCnJldHJpZXZlIHRoZSBjdXJyZW50IEREUiBkYXRhIHJhdGUuDQoNCj4g
PiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGl0ZW1z
Og0KPiA+ICsgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni1k
cmFtYw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogYW5hcGh5IHJlZ2lzdGVycw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBk
ZHJwaHkgcmVnaXN0ZXJzDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4gDQo+IElmIHRoZXJlIGlzIGdvaW5nIHRvIGJlIGFueSByZXNlbmQgdGhlbiB0aGlzIGdvZXMg
YWZ0ZXIgcmVxdWlyZWQ6DQo+IGJsb2NrLg0KPiANCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+
ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEty
enlzenRvZg0KPiANCg0KT2theSwgdGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4NCkkgd2lsbCBh
ZGp1c3QgdGhlIG9yZGVyIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcywNCkNy
eXN0YWwgR3VvDQo=
