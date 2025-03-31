Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2081.outbound.protection.outlook.com [40.107.103.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79372192F9;
	Mon, 31 Mar 2025 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447794; cv=fail; b=pFqUuKSk5TtIVi39/U3IiPNbubGcCHNaStowvXXgCA4158bfCvZDOQ0DDBW4d4F5SqEoYvf6yUYthDvl4TeFvrAIR8tcJsojATJCN9pUdvLOdTNIwB7AWf6WI8fSoK4wFwYF2aqh3KH60lCtdn2DDDWsqwNv1Qe/SrHaqvnTwS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447794; c=relaxed/simple;
	bh=d/+ShhaMRRTryu1vEy7CE0B/GiXoEoH/LwY/JcWFJLw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J5HckQjdaY54g2u21SF8sWVtJU/VbUBv+ZMfblA6w+MKVI16+V73XUkV2/7lc2ubQotWiX0FkANewtAsbmZ06jSlnGNfock/5dVbtrRXdEkACDcDEtGyLokL3W4vKxDwrMvbgJ12qyJlCEv6PREkvmtlWmp9AleoSSSywfbkoc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yyk5C0Zi; arc=fail smtp.client-ip=40.107.103.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yyk5C0Zi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW6hwae6d3tLnXKiO8ETcdtCPUWnLiJiji7tamlTc5rRSWHVW/KFlv74SAdzwcf3yFOBZ9uEblTbRj4kXyIsZ1Mll146w92Ha8+Lg14buUJckz44SF0V8VURwtZRcLmQYn2/j/9Or+XBGgxG0jZUqum7KV3h6d0sWcBJOe2ESOZoyq4ZAxfP8zrhZNPhuyWOvHiC57NlBv3NC1cG6kBzjYQX3Rn0tHy1udlTWwaNmdtw0b/ZmaQxXQ47EXNfJsaexCfzY7+cBb8QYmqAIKbqKJQDAL/fh/1N+FgiPL2HMnCYD7jWjm0hESJQzvFrtt1eAxmwKiNX5tEoHOSeTsdLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwt0KJzJlqQPdWZUTh1ZmqoXFWYGbRRKlHuOBYV69s0=;
 b=bFIybCe+RWSRBC5Ir2tiy866/Y7IRisaTqcp0iKR4CGtQZ6NbbbnA8N4VGZ2KwWk1I6mfAK3+wF4qwmZhADlSl0B0bZevZiOYfPckdR26QzgIG2ZdpuvLgggOyAo3LtHDVb0P+a/d6kenllw/rifWs1vq4+qVoEbvwE5D/niJfWxt7rhzJcqRBYCObIU97zfpSkZ07SzjKmN7y4KHogDUXq0D6Uqv+J4w8/ofMf7JZTfPn7Fnzh4bMuEDZn6+iAFHf5gIB4bBH1eonnF/YRWoTbS9abvNo0LW0sJCuFQAsNJyBsFLl6igh5RuBAw4ELlQG9iw/4Tky4ysjrpE8CILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwt0KJzJlqQPdWZUTh1ZmqoXFWYGbRRKlHuOBYV69s0=;
 b=Yyk5C0ZiUZKnR/r99g1hGiGpNhmGmYIGitEA8J++ACFihMzNVE70ZatURTr1Fiy7cQRU/0FB+VrevvaqWarZtwPvaPkPsstDMdIbZDuaQcG4mVCHL5ndx7GC8u7xfXzpYAH+KR2tsZGHji0mZlHbjNp+eE7VXSObkk7k0VFolSDwEXqYehegLFUkQaRVSUu5+/+E+Bu+SRB84uOXoqamXijab18H57B1ZA5cB3EL6Mjw0ed8N6BmUZqpwkpR1qO0r3pv/9pqfQrCHKdSPQoIN4JIAWDjc+BUEhw+EgBQVKYWIWpfHauNVCBuPlkJS6zy3T5yc1UFvqXTWnpzYzAydw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:10 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:40 -0400
Subject: [PATCH 2/8] arm64: dts: imx8dxl-ss-hsio: correct irq number for
 imx8dxl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-2-270ef0868ac9@nxp.com>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=666;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=d/+ShhaMRRTryu1vEy7CE0B/GiXoEoH/LwY/JcWFJLw=;
 b=cs3zfy5axcZ6zNNHNxUbMsSBOByOSwrS53irnqbbrqcBxORHaaD/zCEtc7zhHUkeC5/F4D2Bn
 2/uMpiqgKcEDO5oKjqS4jASChC/by9zQTTUO1C18HsFzwZVB12MjPRy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF000132E4.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d439bf-2987-4175-9c59-08dd7086adf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFc1YWhwOUxjenRwdWdWYUJ2ZzZ4K0hPdTQ0TGVxOEJqTjdiMDJpY2diRU9G?=
 =?utf-8?B?TUoraGZnQnJkK0RIdElBemZUM21RcUFKaEJ1RzAxUXFLU1QwUk1La2JSSVM5?=
 =?utf-8?B?ZndkY1pReDRwV202dHZYeWtUcDR3RFlyS2xESEVadU93V0FYMmh5b3lzUDdF?=
 =?utf-8?B?eUpDT0xKdXdzdFBmd0swT3ZqMXNWRVlCTU1qdHRXMHAzMTZ0SG4wcnM5b3pB?=
 =?utf-8?B?alVCQkFQRlFLSDZWMGNNVERqUWhXaEFTUGpsVld4RitNMkEvWG8wa3JMd28r?=
 =?utf-8?B?aDlWNklQNmlNK3lIdlRGcVJZY2VXV1JFRDRGcStVeGtrZUxibzkyUlkzbW9z?=
 =?utf-8?B?RXF4b21ZVWtkQkFkaVZtWmtEVlh1VGFoUVpHamZoTWVFd0FPK0tkSnlJOCtQ?=
 =?utf-8?B?dU50WWZ1UXpFeldEZzIrbkZFWEsxb3R2YWZUcVRxNlY3amxlcWY3Q2xQdHY0?=
 =?utf-8?B?alZKSWQySmEyaG82Z0hPdGhHemRUVDcycjdCaCs0bTN3aUc4ay9xR3o4eHdi?=
 =?utf-8?B?NlI0L3V6RUdzdXdsb1dBalQvMmZ0NDREVW1wcDc0UTF2R3NaK2xSdS9hM1Bq?=
 =?utf-8?B?UFNON2R1c0s3NEwzS2tTNHpuV1dHMHdRTmdnbUxSekc4WFIwZUoweUVuUVBC?=
 =?utf-8?B?SzVFWnJRbWVsdmQydzBKUUFERWVJVkhqYnlKS3VkMXlqVzBjSmZ2czd0ZnBQ?=
 =?utf-8?B?MCtxRXlRZnF5TzVsaUg3RGZDUG55cnptdkZzdWwrVmxvRTV3NzVWL040SHdW?=
 =?utf-8?B?N084NnlyaHZWeHBVc0dEU3NFeWxWS0hEWWdXMThhUVE4UnU4VkxFb2dGeUo2?=
 =?utf-8?B?eDN5RE5QUXhrSWhrQnlsOUZTcmhBQjVKdkNza0dOMjFBOXMzWnc2MER2Mlhz?=
 =?utf-8?B?L2Qwai9CZFpMNUh0Wm5vdTBQS0VGQVh1bTY1NFpIelZRQXhyOFhkQmQ1d3JD?=
 =?utf-8?B?aXZ0K0hvRGNraDV2cEtuSFVMNW5IcWs0NmFZaXZwMHZ1T1V6MTVrU3BTdUZs?=
 =?utf-8?B?ZGtvaWdJeW1RUU56dTAxS1YvY3VWSDdiS0lPdjNoOGlWQTdmallLeFl2OFdp?=
 =?utf-8?B?cW1KR1VWUDY5d01JejBHOWxWTERIckM1VkN0N3owOHp4bUcrZzBtbmRsZjdQ?=
 =?utf-8?B?VkRMd3k1bjZZZnhVSVlxVjFWNGNvSUdBKzRiekpMSWlBOEQrdGhlSWZGQy9U?=
 =?utf-8?B?YkJHTyswSTl4dVl5MXpEdWRnL3I1ZktSUTlVUEd4d0tzS2l5ancyckY3MFlL?=
 =?utf-8?B?bEc2Zk9DRFhzUTZkRmxXOHdMQU9UMTB3YVRLeE9oUG9zekkxWWlhN00ydEh6?=
 =?utf-8?B?aXVGTG5ndm1CMUtraG4wMzFMYktwb1dXdHB3dEpQYWVQYnFHVkVsUU9PZnRD?=
 =?utf-8?B?MmdSbC8rRU9NTWpTckRVKzVjeVp2UWI5SEdxd3Z5Ky91RGprQTVTdFZNclhz?=
 =?utf-8?B?ZXIrSzNxZUMzOWFiYktUa0xwbFVNalp1ZFc5MCtSY1RCSUtQNU5VWEEzVU9Q?=
 =?utf-8?B?dWphcGsyeDRIR3IyY0dwU2pibi9UN003ZGJIQWloUStEM2tFRUZrbkJGSjJy?=
 =?utf-8?B?V2F3QWo4NW84NUROSkFBYXJ4aWFJS2EzQW85UXh3Wnd4bkNOdEI0c2lUTmRL?=
 =?utf-8?B?eHdFN1lGaDNZK0o5U3ozMVBtcEFMeHUrT0xySSt1cWdjbXhUZkNwTTd0bEsz?=
 =?utf-8?B?Mnh1TXpLOFRtT1RxSytJeS85ZVhvc1NxaU5KOWdkS1NYcnVHVUI3clcvbEVX?=
 =?utf-8?B?bTk5anhzTnBudklpczREa0VZYXpWUFJXYXBqdW5OV1dLTUFKcENDTVhJU0pO?=
 =?utf-8?B?ZlNBbTc3NDBGeEdvUFRTZGJVS1Y2VGN0L20rU2h2RmNzdGxpUUpJdWp1cTBt?=
 =?utf-8?B?Y1VleWIzb0pkMlhyeklqSjFxRGN4ZjE5a1NxMmhHdkp0NTFIakNMOENkaGZp?=
 =?utf-8?Q?7/FfinyOnTA/WCUt01VsXiJ2cP1HP5Ai?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFNROGRXdTZWS1N4UXhSdUxoNDBVMStDS0RpSmhaT3ZsWS9PTksrb2c5eFJr?=
 =?utf-8?B?RVZsVVQya3l2VG9DRW9iOGxLTnNrdld5YmI3R3NiSXdiL3RYL1JwME9NV3FZ?=
 =?utf-8?B?QmRVNkpPNng4QXNZbnhadHNZOVdBMldHQnVvSVFBU0QxVi9tMy9KdUEwUkVm?=
 =?utf-8?B?MEJ0Wk1iRThtTzl3akxDNVBkZzcwNm56ai9WQnY0eVdoVktGZ1l2bk9OdmJU?=
 =?utf-8?B?SnV5MFRyRFZCMXpMM2RYTzgrVVBpYlluYlo0ek9sYVBDOVBKY0ZKMVB0T09J?=
 =?utf-8?B?RVpZVk43OGE3dWNhVjN1a1FSZGdrWDRpMVNjOFZSNXI4RjZWSFI1V2tRRFVz?=
 =?utf-8?B?cm92TExQd1RNZ2xycEFPeEdYMkR4bm9Fazc2TEIrblY5YlRiTWREd3JBTmxT?=
 =?utf-8?B?OGpXZytNOVdSaW9NNy9nTjZ3bURaVGo0aHZrNXpOb1FXUkdOYXEzRXdxWUxK?=
 =?utf-8?B?aE5VYU5rUEQ2REt3UXlMeXdsaEYwM2x4ZjFoZzBNV2R1TVNvZFZQT1JyTU0v?=
 =?utf-8?B?emtwWXI3NXI2UGdobFB3Z3MwN0hpVGFxS2lJQXQ3MDUxbkVTQUhETUVSVVRF?=
 =?utf-8?B?THowVS9PU1pLK0RGbWppU0V1eVRrc21reGpJRnJEcG1NaGpqZVdBNC9uL2Zj?=
 =?utf-8?B?K2RWQWdyQkw1aUVORTR2MzVUWnFzaUhRbzhKT1FZc3hYMTZpU3dGK1NaeDgx?=
 =?utf-8?B?SkpYWno3VGZ2dHlseVh0WERvZHdhbUZuYXlRWVlQQ3VvRElXQ3BrNzBVMnhG?=
 =?utf-8?B?aDA5WEtxM2k4Vkwyby9QbUw4VzJXZW55Z090RnRGOGNTMktjRVZmQ1FTdWV2?=
 =?utf-8?B?WWtaWGowVHRkRjJWYXkwTnVFcmYyNS90YXk3b20zb3NVcGhDWDBkSkZRU3J1?=
 =?utf-8?B?aGQ4UFh2OTFKMlZNdkpvOGhxT2JSWUZYT1NtNHllYktKOGhrdW1ZMG55alFm?=
 =?utf-8?B?T0FKVG8wYjFEZEQyYlpNdlliSkJTR296eU1WZWdGY2dxaDZ3UFpLWlE2RWRP?=
 =?utf-8?B?alh5NWRiWkxBZG1mOUg1R1hMTUIrMFlHZTlKYVgzRnlJdkVkTHpaTjNhcURu?=
 =?utf-8?B?VkFxeFg4a2lZTExHTXVoaWNLek5iYk96ZFA4WWIzUXZiaTNYWlRrNnNXVHpM?=
 =?utf-8?B?Zk5iejVXUUpIdUUyQkp2dU5GK2dyQndGdHdQVDhqTVlROU5ONFhYcnQ3d2lI?=
 =?utf-8?B?ZmVmYzdMbm5Fb05BSWhJaFlaNVdsN3NzUit3VERKajkwSk9tN1RremRqMVN4?=
 =?utf-8?B?ODJ6SjArSHB6djcxYzlmY3RlcGZQbWV1TEZ1OGxUZmtPTDB1U2E5Ry9naUMx?=
 =?utf-8?B?Z29JamhoelNCQk5NNGlOZ2d5OGZ2VkR6SkxUTWhWcXFOTFd4dHlSRXRkM0Nx?=
 =?utf-8?B?SGZmUXRmUE56MERTbjIyN1I5ODNGbkx5R2szR0tkc3ZKWXRtL25qUkJ6UUZE?=
 =?utf-8?B?UU83S0RnNWhzU0d4c0p1Qkx1cit6c3g4UmRsMGY2MElpTWFCUk53c0FyT3hw?=
 =?utf-8?B?azdkSWhpUWRiN3BOTDhWa3p2Qmc3NXZSSVJvUHFOQVRjSWg5ZDVxcU9xSFgz?=
 =?utf-8?B?UjNhdWF5U0Fsbnc4YjYwdVJFRHNIYTlvamhuS2VWWU5pcjhpNVk5ZnRnS1lQ?=
 =?utf-8?B?MnFOOTF3YlhwNnF5QzlzMDIzdkVjNHZmc1haVk9yeEdwMWRwcFdJKzA4bFhG?=
 =?utf-8?B?d0ZBVUJwa3QzbTRqdTM1K0M2cU9XLzZjUmFvWWhsb0dwdFczUGV4U05zY2VZ?=
 =?utf-8?B?S0hzV0NieUMxNG4rV1pTdjRsMENTUzBuSEhXUzlnSnc1VzFkRmk0cmo0cS9P?=
 =?utf-8?B?WndKMzNzekZKT3JhVnpOK0xKWDB0S0poQ2VDaWR1YWErZXlDdVVpMzdpTGcy?=
 =?utf-8?B?aUVZN29RcGNkeERnTnQxYlVOdkpreXk0YUhCdmFRR2JDM2RYNlhiUG9RTFU1?=
 =?utf-8?B?am1uazlwQ1JjSE5RSHFsMUI0MDJVamE4TjZISG4wUHZKRWx4dFdVVFVqWFRT?=
 =?utf-8?B?L1BYMTI4UEV0Tnc5VjhVSWxQQllGT1NUZlp5WkpocFVjOE11Q2tkaUVsL1pt?=
 =?utf-8?B?ZEZzOEVmMnZoTFJEdUtObEdhZzZHd1oybTdtbnMxZVY5clQrT3Bxb2tzMkNq?=
 =?utf-8?Q?5CCt160RzDrUfk7uKbqFieFLI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d439bf-2987-4175-9c59-08dd7086adf4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:10.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Br9EJevTOhnQCTAy9jRb7d5GBJUqmCwGyX/oFoKuNDV03ilBtz1XUMcAnQOe3m0owJ2KSs+EoUCGwi0gGHAkwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

i.MX8DXL use difference irq number for PCIe EP DMA.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index 67c5c6029cd9b..bbc6abb0fdf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -50,5 +50,7 @@ pcie0: pcie@5f010000 {
 	};
 
 	pcie0_ep: pcie-ep@5f010000 {
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "dma";
 	};
 };

-- 
2.34.1

