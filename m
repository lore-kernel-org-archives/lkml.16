Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023074.outbound.protection.outlook.com [40.107.44.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AE1494C2;
	Mon, 16 Jun 2025 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056886; cv=fail; b=JKDZVeiJ4I2MYG4r1MnAfsgnv54lKCGru1BYvrnE2dqKSFJQdjXJDg2UcIF66nyHjwWT/0IZEUDy/JOmfhQeMuQH2l4O6rMeAfgb5WQ7N2oidHOLkZ3gMBBao8Q1YQIPk5xXYMVNdEp+thFures2FxdUNbe+pPAl1s4zHHd1t3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056886; c=relaxed/simple;
	bh=huq9g/UsLcX2VBQ0IAlUwnWGG3WYgqBGJNBPTE2FKBA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SqarOwDWwcu7YvQxjfVog0XwD9MJLKaSY6bBi/g4v4ETjNxg4adV8nGwBelt8xCOfFOn1WrDcdhiCBpzoXsGLwjRKm/2oBHWUKvQEojR52MDDOnasv8DfVR9bf1jxXMKRUHVgylKG/UbeIy4/KRQ+HR+ABGxohExlAhLW1b9aWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=dmXUrVLW; arc=fail smtp.client-ip=40.107.44.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="dmXUrVLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPnL52XBbJvPcAyY6CVoq6ohnIL95HLmXGJk0tbwuNDgs4qtvhynIBKMXtoCrE6WNHNBG8w8T4WqPbuNChAsjBFP2B46it27N3cMBfh03z+wXmsesGEGPz78DO5zJtqLBiew6pDuazuo6LTkaFtow20SorQ/8y2W/QlHknxV0BKR2s8EycXjBKpf4HKjeQ2X4mAg9M+JgCgue0XHJkKj54E+Bb+FObgjWLTJh/PYfghJHpS/mdQxKFN+17UkSwatV6CONuLPHyLn8Cc1sZG1adVrzvWVR2PkcVWEM3WbmoTiapiMiqG2E7O98sSSLdqkIegO+2GRvmJGZOtmFkdqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huq9g/UsLcX2VBQ0IAlUwnWGG3WYgqBGJNBPTE2FKBA=;
 b=Xy6DbaBR7SLl0/vQyxWLDP3XRM46/A/HkpRHqAdMV4245spvbIxcBcpZFusZ/kuc4pm/zIlgDPFJXE0OJwztK7qo+z50AspHKTvsgoY7r8baEWwP3ztNDhpMxxJH2LhbSdp8q0Po3q+oT/k0pX9EXe5p5uc1o4klyLjuHs0a5vQq9pAoMxhmCgkFv4Mv8kIH1rJEgAc1hn89PJP6NlE1LyPu2OXgs3wb9+Ny6bvujIrehIo6O/Oianzl64lGbJK2VdHCpTeZSZFd7kaiTxckWewl1p5zXQ1SWhzFM4Ya1hP4Xvt+e70U6yjlUoCwrAKF26zg1jFsqvirWoG+ExJ+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huq9g/UsLcX2VBQ0IAlUwnWGG3WYgqBGJNBPTE2FKBA=;
 b=dmXUrVLWL/DykUNSJguJpirCQ6R4LLXUU5QpzqexICbx9uuie6DmwM5fbj2KDTsWDag/LFM22e73g5ojhHhQEy8pyHNvzz46IE/YLEkDa5SUb8ghQg5aOYthLR7iObBD0IQuogKPSQGDDu3Za2Xmc69NeV0mqu7zRyG/hFFcVKeGeYm3xLFADOCyXdtg866SRSiMXH0Dnav7OQ3B4Ta+C/sHrVJibaEwFgUMxdyjFJO2KaqnaNAswUznfSdXfbQg+ErFlTQCcH1Ke8XxiX4BILvzRzqTA7UHjQsIQZvrLUt1HEXb4nmmsL4EZTEBLnIRw/Sa4Q6D/xxg/3SA8VCnjA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by PUZPR06MB5796.apcprd06.prod.outlook.com (2603:1096:301:f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:54:41 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%3]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:54:41 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	Mo Elbadry <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, William
 Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>,
	"wthai@nvidia.com" <wthai@nvidia.com>, "leohu@nvidia.com" <leohu@nvidia.com>,
	"dkodihalli@nvidia.com" <dkodihalli@nvidia.com>, "spuranik@nvidia.com"
	<spuranik@nvidia.com>
Subject: RE: [PATCH v0 3/5] arm64: dts: aspeed: Add initial AST2700 SoC device
 tree
Thread-Topic: [PATCH v0 3/5] arm64: dts: aspeed: Add initial AST2700 SoC
 device tree
Thread-Index:
 AQHb24IeM0HrrMksj0qjPEmThyghWrP/T4SAgAEHZPCAAEdfgIAEbCrggABKjgCAAAPQYIAAA/oAgAAAqeA=
Date: Mon, 16 Jun 2025 06:54:41 +0000
Message-ID:
 <OS8PR06MB75412D391E7D10958E70C100F270A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
 <20250612100933.3007673-4-ryan_chen@aspeedtech.com>
 <485749d4-b3c4-4965-9714-ad534d37e8c9@kernel.org>
 <OS8PR06MB7541A100B918AAA84D1ABDCAF277A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <749c581e-cc00-428f-8eb9-222f9d574486@kernel.org>
 <OS8PR06MB7541FFCA9E28E5767791D869F270A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <e39b5259-db92-4269-84c9-d51e8e4f327e@kernel.org>
 <OS8PR06MB7541645F6A0638FC250B1272F270A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <a2ca2f58-f648-43f9-8d23-4111e4eb1f1d@kernel.org>
In-Reply-To: <a2ca2f58-f648-43f9-8d23-4111e4eb1f1d@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|PUZPR06MB5796:EE_
x-ms-office365-filtering-correlation-id: 76b19ec4-7550-4aaf-286c-08ddaca2ab39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXpuUlNQeElBQStvY2x2M1Y1R2tCM2JNRHJJUXZJL2tiNlVTem03TE95US85?=
 =?utf-8?B?MGluODNCV2JMK3drY1F3d1VrakQ5R2NZRXA3cHd5YWVSdVFOeWpYWnVpZnRR?=
 =?utf-8?B?V3ZYakg1MjJmTUlseVV5Y2FGemZJdnYvanNPNlRlVElJTUpXNXlPUSttbDli?=
 =?utf-8?B?VHAyZExoSUVTSlIvMDdzNUxUN3MxQ0tIWE94cS9WRjBkRkppVDlJRkJreitV?=
 =?utf-8?B?L0VHRXlqaU9RR1VQSTZmdSt0Um5KeUpGL0RYVDRqSFlqTld4RTFIa3R3MEcv?=
 =?utf-8?B?RFdwY1ptV2RTcDZ3SUJjLzdoSE50dFYzc2d2aEJDL1FieEwvTHk0WnRIU2l6?=
 =?utf-8?B?T1dISWQveXBxMzhVS3NNWEFndWVsZU90TzVpZWQ4MjE3YklnaXlvZ2pPbC9O?=
 =?utf-8?B?N1N2SnFZWlRkWFlzdDhuYnhWN1puR3V4VnFwTkdtVUZiNjN1MUdBSlFKRkI5?=
 =?utf-8?B?RW10T3Qwck5pYlVyYnZHaktrenhvYXoxK2VxVk5XNE5ic3h3MmxNdGU0bU5B?=
 =?utf-8?B?UDBKcVYyRnNMWkp3aXl2QWYzTU41WUg2WS9qU3FvZTV5VlJtSXowemhCcndj?=
 =?utf-8?B?Nk9HNmlvRzVrR3VETjN3SVpBUE5WUUdBZ2pIMHc3UXdHNHFBNy92MFhGZzN1?=
 =?utf-8?B?d1VNMjZTSkF6b2J5NUdYSGlKaFBhV0JxQ0xVdHpVUlk5WXhkNERJRjRSVjdz?=
 =?utf-8?B?bjBrM1g5TW1BYUtKZG9wb3YrOWE5VzkxTFVIZGorN05QdUZraWRMRlVrWTcv?=
 =?utf-8?B?b2RvL0QrSDFkcW9uSDdLeHlYaFJnM2VESXJPUm54cmpwWnVBaTQ1R3BCMExH?=
 =?utf-8?B?dWRSYVVsWjZnUEJNMWFZd1VzZEJvbEhhRjdQMEJ6VUtHNzJvQzdoajRjaHox?=
 =?utf-8?B?R3hYYXF5blZEeUoyWmdCOUUzR01HWlJtYzJxeVFid2VIY0RRUGZGTU55eE1z?=
 =?utf-8?B?UUs5YXd5RXA2VHoyRUlBbU5wRitITTlRWGlKeGYrR256cW15UFROODI1OEg5?=
 =?utf-8?B?YnJIM1hsaXdFZDV6dVBBWmJwMmtqSEhnSmM1cHluZkpTcE1VSU5IRXRCN01o?=
 =?utf-8?B?VXVVSXdqa29vTWRXWmgyM09JdU9nSGZMcDM2QWlodFgwWUpLWFhIalVYemdM?=
 =?utf-8?B?bjR5andDZGtka2xCZzN6bVFydy9sRSt0dmRMTzBNaTJCREF5aTNzbFZhTHNa?=
 =?utf-8?B?WWJhb1dFbDVlT2VHbTNpdXpTdzNPekthVWRHaTZJNU14Tm8wWVZ6eXhtdWFE?=
 =?utf-8?B?UDViYU5iNXpxeksyajd6RHI1MFo3RzhxdWpoUWVFdjM3MFZodGowRDJYR2pF?=
 =?utf-8?B?bXdaZWxuaTFlSzhHaWxQR2wzQ3duc1UxbmhKNmMwenpabEtiY2NSWGdWUHVu?=
 =?utf-8?B?OHZuN1JjK1Vqa2lZUCtBL2ZjQ21BY0lHNEFmejd0azdKdWNuMlIwQzNtdjNV?=
 =?utf-8?B?ZGc1UHBQRUVLTWdSSXRYRncwVU9sUTBHeStuV0lkN0pDdWFpaHIySVQxYWs0?=
 =?utf-8?B?YlZGR1ZUVFROejYzVDZoT2h0N0Z0bUlDSG5JU0ZCZXlPaWh6K01nN0l3c2da?=
 =?utf-8?B?UGt0UnhSenhBYVJuSE4rcTAveTE5WGp4NG90eTMxWCtWeFMyT1pGdXRURGdX?=
 =?utf-8?B?Ly9ueEhpUlFYbFU3d213MEwrNHNHbm54bzBZc3RtbXZDbC84U2JzeXMvcm5v?=
 =?utf-8?B?WDI1ZnRyemlVR1dmdm8yT0RPbmFtVFNsYS9JNEVoRzVRelZsOWxHT3haTTJq?=
 =?utf-8?B?QlFyZ0lUUmxVRzNkemRSNFBOMlFuQU5DZUhINXVTNGhGbWhJQWRmZTZkUVUv?=
 =?utf-8?B?OVZpRTBhT1IzQi9wYzNVa2MwNmJVYlArSllpY21YbmFNSG4zUVZ6cWVkWUNW?=
 =?utf-8?B?TzZ2Y2xDdllobVVHVTU1VDQrZVlSa0Ywc3ZldlJyeE5WbnhSWXM0MWoyZG9R?=
 =?utf-8?B?OG9hMS9CYXU2OXJsSDdySitpdFplN3FCc1VjM0dXbFphTTQ3VklLUHlJQVk5?=
 =?utf-8?Q?xDqoHwzHS8r7QJmbhtUPdy5AuqcDhA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2lsT1BrbjJrN3ZZSENEZUw4NUQ3UlIrMkxYckh3eUFtckNTNVEwVHgwYUx4?=
 =?utf-8?B?M3l1Nm5RZnQ3U1NkSFNyMk5JUVp2WGMwbUc3N2oraWhkNzZiUUEvNlNxcWsr?=
 =?utf-8?B?c0VKSTArNnZkVDNsRjF3QS9LQkdxemZJa2RjajZ3Q0QxSU5ndGh4VGV0UGhr?=
 =?utf-8?B?N3BaWDc1VWE4Z1BYY0N2eHQydzR3VmRQTVFEN3dHbEtTeFllZmxVTU5USUZF?=
 =?utf-8?B?RXNEMU95QUdTcGFNQVI2TEExN3JvdENEeGRYQmlUVTZQZk8rK3lRWEk3S0tL?=
 =?utf-8?B?SXRDK0I1MmtrS25OSU13MjJSRmJTdGNzaWFub01OZHhZNEVIMDNnaWkyWXBt?=
 =?utf-8?B?TEhNejVXamhSQ3QvTWNEVWZiL0F3NWtobUYyWUFYdFI4ZHhYUE16YVZmVml1?=
 =?utf-8?B?MllKeWxUSGNZL2tqL295QWpQRnVyYmwzN1QybjdrN21HeThyV0hiYXBzTDFo?=
 =?utf-8?B?c213USsvaW9tYmtEU1ptMTJHVmdDN0FwcVpKdE9UWHFFZkFXQ3E5cGVxVDVu?=
 =?utf-8?B?NDEzZG1FMFRnakdQUFJ4bXd2MEJVOU5CcEEwZEVrbGhJSmR3SEtSaFRmbmVl?=
 =?utf-8?B?TlBuRTFIRzRpaFZIMjlSQXB5ZTVNcUpLZ1lIb1BUaWRlNkpjbmVPWXFXb2hJ?=
 =?utf-8?B?VnNjdmtFWTVRUEhEZGszTlJBNnNLbFJSQVlYQXBOTzVCQUJwbWMyWkFVbExt?=
 =?utf-8?B?akVnMnFLME5yN0RiNk45MThWOFEzNzJ3UlpTSE9ZN09HNGJUbGwvVUxkUUVQ?=
 =?utf-8?B?VkhDa01HK0ZybVkyREZuSk92Q1Y3RzJiQmUxQ2lDUjdmV0tVcUQ5b3d6L1dh?=
 =?utf-8?B?VjIzdkF4dVlLRzhVWVo4MDQ1SmdXM0k3OGlpczhNNVRNY0Urc1cvek5ja2dz?=
 =?utf-8?B?VW5VSHN4SXZseUFZV0lRZ3pXVVpGTUp6V1o3MVFMMzR2WWhaS1BRT0lobVd6?=
 =?utf-8?B?U0FGTkhOcU1qdHZpR3FBR2hjcTljNXlUdkx3d2RJZ3dibi95THQzOXVSODRE?=
 =?utf-8?B?eVJkSGVKZ0lRRGorcVhCem9IOHFBQ00vSmdmQjVoWGRMUkU5MlNjMjZKQlBQ?=
 =?utf-8?B?blU1bHd4L0R4UGlaZ1Jwanh0SFRpTGNkeUtQSFF1Z2JEbEV6dVJpWDR1RDBI?=
 =?utf-8?B?aTJ1bCtmNkQ3VlZNUnFUWVIzNlFobmFvOEs0MTZlS2ZNdjc2L293TGwzbFpB?=
 =?utf-8?B?NHdtWkQrSVRpSWtVbnFPLzYvWEphY2dQTGpEcnRPaE1JZzhTYjF5aEc5YmU3?=
 =?utf-8?B?THkrQlByclRrS3YyVjlkYWRadmpaVTFuZUdwa2I1UEdoQW9zUHNucVFNWk1k?=
 =?utf-8?B?cGhORTdCdGJ2aXdZRDM2Rno0OG9ZaEZwOFBlNllETUE0ZHFxekFrSXJoL2lO?=
 =?utf-8?B?WVl5UytRbXJ5L3pORHloVjJmb1VhSFpJVkRyUXBxZVpJZTd2SmpzN1Q3L08x?=
 =?utf-8?B?RHF2K3RkdWRoWUpVN3M0QVlib09qMXI5MWhQYzJKRlFEd05WZEZjWkRwWGNt?=
 =?utf-8?B?WTJ3MDRZS2NrTXVIT2RWZldUVkRlWURzQ0IrbFIyODI5QzJBemp4K3hxMUI0?=
 =?utf-8?B?Q2g5MEtDWUNEVTRYeGlDNmJSUzFMU1c1NTJqc3FCQ1F4c04vU084c1pyMFpn?=
 =?utf-8?B?QlhHbnMwbTN4di9ib0xyeEoxa2huL2dlVC9KOGxzS3UwSTZMTTc2VWN4TFcv?=
 =?utf-8?B?dm1idG9qTXVBdVZWMjFiajRvaHRiNEVaZDNCbkVVQkNlaG1sODdwTWtsMWg2?=
 =?utf-8?B?ZG9PVHk5RWFGT2k2dTk5N2hXamxwVUxkL3ZxTjVCcjNENmpjTWFvQWMrajhk?=
 =?utf-8?B?SExRblR6UHkzTHU3OG5GbHZiQUJMQVlXUjJ4S0pXeW0xcWJzMFhwZ0VtdnBo?=
 =?utf-8?B?YkhKeHloeTRJN3hJcFpJOTBJTmRnanA2bHU4Q2daeWFxT2FFbEtQZFU0VVZw?=
 =?utf-8?B?TXJ1SVdPNTJnd0s1S0xiTjRVSVZzV0lXRlNQbUtmVllZWkwxbzZPNHhCdW9O?=
 =?utf-8?B?UG1WaHl1ZTFFZFhTZDNUOEI1NXBGWC9YdHJCWGRMbUovQzM1SEJ5MGEzbS9T?=
 =?utf-8?B?aWgzd0VjTWc3SXNjMUhZQkZBbzlnSXBQWG5aSStxNFZtMG1oZmFnbTQwbHBJ?=
 =?utf-8?Q?jhanbuLieS1iDd5zjFTO+G0DO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b19ec4-7550-4aaf-286c-08ddaca2ab39
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 06:54:41.3352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSIi572O2xn4/pSEFmbs8o42I4h9xpsLlWtY8RMAXxVF7g7DDTZbtE+LFa3usfS5B1X7PxINumwNiOmjDsMSuZr47b8qmElqBg4pRk685t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5796

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYwIDMvNV0gYXJtNjQ6IGR0czogYXNwZWVkOiBBZGQgaW5p
dGlhbCBBU1QyNzAwIFNvQyBkZXZpY2UNCj4gdHJlZQ0KPiANCj4gT24gMTYvMDYvMjAyNSAwODoz
MiwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4NCj4gPj4+IEJ1dCBJIGRvbid0IGtub3cgeW91ciBw
cmV2aW91cyAiTkFLLCBuZXZlciB0ZXN0ZWQiIG1lYW4uDQo+ID4+PiBJIGRpZCBtYWtlIENIRUNL
X0RUQlM9eSBhcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC8gZG9uJ3Qgc2VlIHRoZQ0KPiA+Pj4g
ZmFpbCB3aXRoDQo+ID4+PiBpbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTIxMDAwMDAgew0K
PiA+Pj4gCWNvbXBhdGlibGUgPSAic2ltcGxlLW1mZCI7DQo+ID4+Pg0KPiA+Pj4gU28sIGNvdWxk
IHlvdSBwb2ludCBtZSBtb3JlIHRlc3QgaW5zdHJ1Y3Rpb24gZm9yIHRoaXM/DQo+ID4+IFNlZSBz
eXNjb24ueWFtbC4gQW5kIHdyaXRpbmcgYmluZGluZ3Mgb3IgdGFsa3Mgb24gY29uZmVyZW5jZXM6
DQo+ID4+IHNpbXBsZS1tZmQgY2Fubm90IGJlIGFsb25lLg0KPiA+Pg0KPiA+DQo+ID4gICAgICAg
ICBpbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTIxMDAwMDAgeyBTb3JyeSwgZG8geW91IG1l
YW4gYWRkDQo+ID4gYnkgZm9sbG93aW5nPw0KPiA+IAkJCQkgY29tcGF0aWJsZSA9ICJhc3BlZWQs
aW50Yy1jb250cm9sbGVyIiwgInNpbXBsZS1tZmQiOw0KPiA+ICAJCQkJCS4uLi4uDQo+ID4gICAg
ICAgICAgICAgICAgICBpbnRjMF8xMTogaW50ZXJydXB0LWNvbnRyb2xsZXJAMWIwMCB7DQo+ID4g
CQkJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNzAwLWludGMtaWMiOw0KPiA+ICAJCQkJCS4u
Li4uLg0KPiA+ICAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgICB9Ow0KPiANCj4gTWF5
YmUsIGJ1dCB5b3Ugc2FpZCB0aGlzIGlzIGJhc2UgYWRkcmVzcywgc28gaG93IGNhbiBpdCBiZSBz
b21lIHNlcGFyYXRlDQo+IGRldmljZT8NCj4gDQo+IEkgbWVhbiByZWFsbHksIGRvbid0IGFkZCBm
YWtlIG5vZGVzIGp1c3QgdG8gc2F0aXNmeSBzb21lIGRldmljZSBpbnN0YW50aWF0aW9uLg0KPiBE
ZXNjcmliZSB3aGF0IHRoaXMgcmVhbGx5IGlzLiBUaGF0IGlzIHRoZSBqb2Igb2YgRFRTLiBOb3Qg
c29tZSBmYWtlIG5vZGVzLg0KDQoNClVuZGVyc3Rvb2QuIExldCBtZSBleHBsYWluIG1vcmUgYWJv
dXQgdGhlIGhhcmR3YXJlIGxheW91dC4NClRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBzcGFjZSBp
cyBkZWNvZGVkIHN0YXJ0aW5nIGZyb20gMHgxMjEwMDAwMCwgDQp3aGljaCBpbmNsdWRlcyBib3Ro
IGEgc2V0IG9mIGdsb2JhbCBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBhbmQNCmluZGl2aWR1YWwg
aW50ZXJydXB0IGNvbnRyb2xsZXIgaW5zdGFuY2VzLg0KDQpUaGUgcmVnaW9uIGF0IDB4MTIxMDAw
MDAgY29udGFpbnMgZ2xvYmFsIGludGVycnVwdCBjb250cm9sIHJlZ2lzdGVycw0KKGUuZy4sIHBy
b3RlY3QgY29uZmlnLCBpbnRlcnJ1cHQgcm91dGluZyBldGMuKS4NCg0KVGhlIGFjdHVhbCBpbnRl
cnJ1cHQgY29udHJvbGxlciBsb2dpYyBzdGFydHMgYXQgMHgxMjEwMWIwMCwgd2hlcmUgZWFjaCBz
dWItY29udHJvbGxlciBpbnN0YW5jZQ0KKGUuZy4sIGludGMwXzExLCBpbnRjMF8xMiwgZXRjLikg
aGFzIGl0cyBvd24gc2V0IG9mIHJlZ2lzdGVycy4NCg0KDQoNCg0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg==
