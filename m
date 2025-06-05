Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D421FBC92;
	Thu,  5 Jun 2025 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107396; cv=fail; b=VV3eHQvwsAnRoBLnu5oXfSsJV4cohU04WKk7adH8VcJKA0zFjcxMttikSrZSz/MkJeTN1MIaTb7MddDGDWm3q7k7GrULSc8sSztt64Ksu2AYVBHlSVLmY8KR3RcKk24WKQdYwOFrfNNTj5V9zsrEAKl43DdVEsh9QaAd6m3XsbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107396; c=relaxed/simple;
	bh=yVRu6eZoQnKO+9DNjtEwi8uOEODI7uGWKXY4D7ylvEo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=do0SoV0NLnRai1nwu8JXJmXxRGc/B1mdRPJChcwrwhHWcrQ+LQfrFDSguD+xTvtqa0VxsXlKmcowIckt2YqzRW1kA+79t7e5t/m72S4ijth9ys+MJq3qX3P+tIeNUKaAF9sDqg3QEqpbmi0SETgnpA8hmE5yaACQvaD6idudCfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=bdojQfOd; arc=fail smtp.client-ip=40.107.75.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="bdojQfOd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQCIdjJmvXbDPxKVbioTZ+zbwULrsQRpELvOyiXH1J03t0T5VsCn9LTOasHrGvTtsAhmAblJ3wUIod/dZXNy/FaHeCvIa0Tew6ZUIjotmoUurnbtjSscQFmKXh3xMQgmfBPiUD5yCaxbeUipYNp1uqU3tymdVKhkWZQFfeiBvgvqhli51c7jK575tTdg7fHgRIxKgGGgAtOMavsG8mvhSpBot/6qlllYLwLC5m0hGxsJIHpD3apVnhIrEXOJUAZLYI43P+U+1K2eBNSrT6GcIeLgrBI8br2AIvcbFsXHU4N51p6JvBIhfCHE6kBOAqb8c4QVVPP5t6QP6wPzkh88SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N8WrQFbPQsqKBCFaHFjjezt/Ts9Si42yKMoNWD5YrI=;
 b=o1SwE7uaOsEyp1PdlwD5fo8UW+9OcrsuE0FV9KFniNhC8ba+oVMAqrF1/UUUQZ7B8WrCwXntJgRyFpSEJWEWkBogUmrO2LZKqVHGFPudvjl2sEEYNbY4HiM6cQ4AnsnUF42GKHZsEEQ/KIwKBvZvYNiRcvYnZwBtCkeVBJRwlx92j1U2xaiWqw4ul0sXibCj/kQE1FVmQScVT77DX7ZIed7M1qt2tDHToKNt4fyXYvUtKEotAqXFrjSh15rEws/iZ2nHUjIOSDnojtDWkS3hB/08Iv3hroGkwpRPEUHrGqhGKV5YXaUx0jyEToI1bbBuDQ7drum/GMYGyDeV1r/Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N8WrQFbPQsqKBCFaHFjjezt/Ts9Si42yKMoNWD5YrI=;
 b=bdojQfOd280gQCmQhnLFHey9wwoFMzy0MkCZ+ID1imC0FfEN8ZHXUahfSZ0BMZ2mooav1Wa20BFF2ILPKk1LQK/MvP3/jYX8tPXY9s3AUJCIbTfwDNbxhKCYHGfy4XhfAWNO2KKoEKlkql9Db0yyndRdLBHPqXyOiVJ+60JgNHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYZPR03MB8034.apcprd03.prod.outlook.com (2603:1096:400:463::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 07:09:47 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 07:09:47 +0000
From: Richard Hu <richard.hu@technexion.com>
Date: Thu, 05 Jun 2025 15:09:42 +0800
Subject: [PATCH v2 2/2] arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS
 SOM on WB-EDM-G carrier board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-2-db5a7bbe3c84@technexion.com>
References: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
In-Reply-To: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Richard Hu <richard.hu@technexion.com>, 
 Ray Chang <ray.chang@technexion.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749107384; l=32363;
 i=richard.hu@technexion.com; s=20250604; h=from:subject:message-id;
 bh=yVRu6eZoQnKO+9DNjtEwi8uOEODI7uGWKXY4D7ylvEo=;
 b=f2ctZ4mxeZR33tSdmB00wHFmBJ+FaWtqZU0+KMlKjEj7NyxDjpMSFFOBisXr1r2Q/BjMP+V44
 J544mnJ3vuYCuiZBiioDPl7eETHzu2ZAbTK6OmPvTw29Xud7UXH1qII
X-Developer-Key: i=richard.hu@technexion.com; a=ed25519;
 pk=MKoW0/U0r4MjJdRNaq37Tb25KE1fzJUdMN0pa8XBJSA=
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYZPR03MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3e55f9-5fc7-4e86-6d3f-08dda3fff4d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGlxN3V3cXhlSXVYczhtSWlKWWxmQkdQVXBTT0xCaDR3cEVEZms4alc2WDJB?=
 =?utf-8?B?MFo0aVdWMVhISjhVZm1Wc2FkYlJJcGpCa0FJdk5VWE1aQUtlOTErZVYrMEhw?=
 =?utf-8?B?RjFVQmdwWXB0Qmt0ck9XN3IzRmZYWGtyV3VvN2xpb3RNWDRPVm04SVk1dTh5?=
 =?utf-8?B?MmRYOExDRnpTQUg3ZFp5cWZIRmlSNnpuVDBIVXZRcGc4MXFDZFIvMW53aDRi?=
 =?utf-8?B?SzZES1ZPRnR5WGl3OHNXUUtjbmF3T0h0VXdVUllYajJhaHNkd05GbEltZTM1?=
 =?utf-8?B?dndTYlVGaXlxTU5SNDRTdGsvb1lVQ2VNbEY1Nm5Zc2J5Wjl0ejdmZUVHU0RL?=
 =?utf-8?B?LzNUNkdIa2tjQjZUc3dWUVV6U3ZQeThvakxDTzFNN3lha1RHdmxLYkVJcjhV?=
 =?utf-8?B?MS9tRDNHR3VuWWo2UzBhaW5WdmxyaGEycVJBSzFVT1dHOUpFZE5DclNQZXRC?=
 =?utf-8?B?cXk0MWNONVZqbUFjam1QUlFBeDlCQTdyZ042STFhTXpvWGJoWXlCN0s4bXpX?=
 =?utf-8?B?RUVkTlBHc3RtLzZvblFOOFMwb0gxUThZc2lVckNMcG5odlUwL3lsSytWaldx?=
 =?utf-8?B?Q0NJYXV0enhhTkhHSlUrY0hyR0g4WGVoTGtJT1VEejIvcFhnMW44dkhYSk9s?=
 =?utf-8?B?MkFid3hJM3VObUhBRDNnTnNPQXByRlc5NDVUNlJWSkRwYWFyYnFycVBpN0Yv?=
 =?utf-8?B?N1NtbmU5U1VwZzBxQjlqa2lFdW5keHpZaGs1R2hDSWRZaW5leXE1cm5RMkFQ?=
 =?utf-8?B?SW10aTl1V1EzWVQ3cEpxQWFRbWxKaEdackJGWmVTM1NGaDZML2hySnNKSE0v?=
 =?utf-8?B?YVY0U2I5WmtZOUE1Tk1WaENCUzJmUVhUYTJDVU1MRlZyTm1LMHVEa0xPVG93?=
 =?utf-8?B?UVQwUWxvRnN2UTlINkFRN0FuYzNUMGZoaEtCWjJWb2dDUkk1V0hxVGZsZThj?=
 =?utf-8?B?YnpUQTFROVd0bGQxa1ZzQ3hxaGFsMU1zOVpIZTVBUHplRTEydGtOckppb1hE?=
 =?utf-8?B?U2txejVzUnA1anlWcTdOWGgyOUl2aTZaalRxalptSXBaZU5jT3M2eHJoSHd6?=
 =?utf-8?B?K290TkRDc25rRWM0NnNmK1JRM3BNNkJqYjBsKzVNV094MFVhajJEeURab0sy?=
 =?utf-8?B?VEorSWh6aVl3OURSblV1ejlic2hJV3VqaU9VelZ3TDQ2ZEZLdVF1R2hXMUdv?=
 =?utf-8?B?ajJUWUlGQmJKaDA3WVNydnozK2RFZDhTcUZrV0xZa21XeXRkcTRMdnFnQUJS?=
 =?utf-8?B?ZU41OXh0NVZmWlE5cDNqVG1BZ0RsbmVPbTJhN2l0UVZ5NnIxaERiWmV0bngy?=
 =?utf-8?B?bExOYTdTVy9veER6YTNJQWdTWjU3WEpack5jMC9zMVhRazdmZUxoOTZYU0Zq?=
 =?utf-8?B?MUo1L3BDRDdLQzhBK3ZraEV6TnVjZjZmbGdwUlFiOWRSNmQ2YVpNb2Y1dThp?=
 =?utf-8?B?bXRudDI5cFQzekVYRmZ6RGNyK01xdDBvUjdaZFRzTFRTYnZvWDdMUHZRV1pQ?=
 =?utf-8?B?Q2dVR1JWdlVJRzM2NnRnbXA2UUhMN0d3MDU2dFh4dE4vMHVJSlpMRkg5enZH?=
 =?utf-8?B?U3hWdDd3WkRheE0xVEZJNlJmaEVyKys5SHgzd3FvekJsWXlPbE04a01mUE5M?=
 =?utf-8?B?N1dFME1oRnAvWkI3M0VzQndDOXQ4ZUphMzBMRGNFKzUrUHZmQUlXd0lWVzd0?=
 =?utf-8?B?cTJITTFnNjhFWTB1VUZPTzd1dVF3SCtJaG1RbUZMQVRIRW05SHFSejZrNTNK?=
 =?utf-8?B?SDRadU4wU3hQWmVkZUg2Qjd4U1R5RVBaSy9NK2xlUE9XZ2hBOWMxb1VUS3Fs?=
 =?utf-8?B?ZG1CRmpJZWcwT0w3b3N2NUpBWjNNRnZ0ZHIrUGR1NEI4VDJTK0JhM1kxNzBY?=
 =?utf-8?B?UTdEZ2tXTVpZMDBUSE5lUWFVRksxTmJ5aFA0c1Fuc1A2MUNLbU1weFdGd2dq?=
 =?utf-8?B?M1ZleURiYnFvbWF5Q3p0K1ZtMW9FK1EzUEZYTXFmT09tSjMyVlAwb3ROZVRw?=
 =?utf-8?B?bXVRS3ZTc1p3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGl2TnFmVjFyWENLeGwweDMyQU9FbVk2OW1RNHg2TnUzSW1lZGtvYXFQY3g2?=
 =?utf-8?B?NzZ6QUFzUUw5K3UwczErcnhFdHJ3ZnE3YXk2OFlrd0RBZ3p1MlJqZXA2YVN2?=
 =?utf-8?B?MXBTOGRHSUx4L1NNWGF0eVI0ZFdrMHZHd1gzUXJRR2NhWEF3WUhXU2ViR2Zt?=
 =?utf-8?B?aXlYTC9zZ0RMcEtUdG44SG1wOHcyWW9pU3dMUHByaGlaSGd4OStqWVF5Sldo?=
 =?utf-8?B?MnZCSXBSb0lPTnNiVUkwUzh2ekptem5SbDZiS1F1K2IxUGpObEh1WU9NSnhJ?=
 =?utf-8?B?NkI5UXppanFEZnRMWFg1ZG8vVTloMkVDQzVNUzhkcE1ianp3Y0dHT2c5bEY3?=
 =?utf-8?B?ZkFqeUJiSUIrRGx1Ky9jRS8xdzI5Q3VyR1JOUFdDMHZsU2NJc3VHd3Z1a2M3?=
 =?utf-8?B?YXB0NUJaOWNGUVJseFpNQmM0dEd0cjFvT2tPeUM4Mjc5RDR5dnZkUGdTS0F1?=
 =?utf-8?B?MWtXcUR6cHFpT2IyTzgwNVVpd2EyalhFOTlnUUdMSWdMZ2h4eEVyd1MrYnQ1?=
 =?utf-8?B?bnc3WUxGbWVOQk95a1MyT3RIeEZsM25YcSsyd0dOLzZ3NGNZMjQvLy9zUzdw?=
 =?utf-8?B?aFcrUWp1QjRmRlJEdXNzNjJPK2hreU5HNTI4YWtYcU1DVkMraGdYNmpCQmtW?=
 =?utf-8?B?TTMxK2h4VXZuc0lUUFBEemlLLzBaSlpESlp2RFRVTlNlWDJZRWlVa2ZRbExH?=
 =?utf-8?B?VjdNNlZuOWZ2ZGNQRXBPREJpZVVuQ3Z4RlZUOWVTcmxJd0oxR1l3dFFKMlE1?=
 =?utf-8?B?Q1h0UnpNKzkvUW5DakVCVHBJSUJRZTVBeWpTVWNiZXVHODMxdWZGM1V2WHF3?=
 =?utf-8?B?bVpIKzA4WVBuYTB4aERYK295dDF0Rm04TXBtL2xBUmdaUlR0OUd6UkNNMGNN?=
 =?utf-8?B?OXZrUXJYZmpkZ1lnN0VoaXZFcElYek8rL2NvYldjZ21BOFVPNnNYdW5DZHNL?=
 =?utf-8?B?a25neUt5N3E3VEx2QWI3UjQ5YjVuY3E3d2Y5QjJrckNUSGZlTDNjV0M3Ky9l?=
 =?utf-8?B?OXcrcUsreU5NUFdiNWtsNWQyNU9FckpzMXBwUTZBUzZzUm9laW9pU0NscWkx?=
 =?utf-8?B?Qzc2c0NUYXhOQlkvOTdqT05HdDBHY0pWVWNhZnpIYzBWWGRtR0FjejFrakhC?=
 =?utf-8?B?bVF5UUpmcGFCSlVQQ1RGRnBtMGVjRlZkWGF1NnFTdDMrckp5dU13VksyZmd3?=
 =?utf-8?B?Mmg1S1BNREh1cG1sNHdvc0xTUndKdTcwRG92ODFkd2Mwbk9GUVFOeHBNU3Nz?=
 =?utf-8?B?dkE2VkF2NUdXK1lBU3Rrczk3ckdhZmJsNWZWaUJFbFI0dVFPbFFIeEFGNTgw?=
 =?utf-8?B?ZjRUWGRmOGNjUzh4M1BIMTZLcUg5SFZjVG9qcmNUZDI1V2FsVHhFSEtUeTRk?=
 =?utf-8?B?ZnM3Y21peVNGeDFJVHFYVFQ1eFFCamRQK3dIV29IRUFyQXBxVmorTUVNRzRT?=
 =?utf-8?B?eDRxZ0dZN2UyNVFaT1Z1R3lBM3FXMlAzTTFybDE4aW1NVlFQOFdtc3I1bWpK?=
 =?utf-8?B?bks5UHpOcThEVWx4UmlSYXczUVptNFBBdTZHSDRZY3ZpTDVTOVNQU2lNUG82?=
 =?utf-8?B?MzBUOWMydTRGdmwxOUJhbE1WUWY3RlN1VnNWbXU3dnJCY3lLVG00QnRENmZs?=
 =?utf-8?B?Zjl6T2pRUzlLWU91RWJLVGI3ZFhSais2L1BReFh6V3VwV2RzaVpKRTlBUFp3?=
 =?utf-8?B?ZVdCdlcvTVcwVG1IYmJ2QzNlMUdTV2FIQlZMM3lvaGVhcm52UW1MWUVpWlhS?=
 =?utf-8?B?VzJRaFdZbVRDWFJGdnpVSFdxRnVMTEk2dkFzSklNZ05UcDZuMURUT0dldVkv?=
 =?utf-8?B?cnN4R0wzTXpmdGpBTWxlczBzSStjYUt0a1lnRStRMWNjWFl3eWt4OXFCNFNw?=
 =?utf-8?B?Z21uY3pyRkxrYTJQc3hONDFFMEJQbktxaVlCenc2dDVWd0daYTQ4TkxjMGlB?=
 =?utf-8?B?T1I2RDdBQ3ZUbnNEUC9NRWFZT2RQNVd5dWRGVHVrRVRBWkdWdVhPQWtQNk1X?=
 =?utf-8?B?d1ZpTk9sV3lpREE2Y3pJS0c0TExMWFFIRkp0L3VoZUtWOHFRUFFVcVNyWFNv?=
 =?utf-8?B?cFg4dUZXYjBVZzRKT2xaOUpjcjl4Nm0xOGUxRjJJcVcxNVFjZ291K21mTnRZ?=
 =?utf-8?B?VkoxUlE2WHpKQ1VmbjhwaGhkZHFLcWhnK3FsczNUY1B5NlJEekllUlVpSW5m?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3e55f9-5fc7-4e86-6d3f-08dda3fff4d4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:09:47.8008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDHJG/zYqXBq7EKUH+BLv2KHdWx+ObQ3DyzHpibxIWRGq3X1lEEbSstZJ7Hq5vaq1U+ZNUyPRyZK77GTGZPKCoS94RGzEFNtN4AfADv7hds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8034

Add support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board.
Key interfaces include:
- Gigabit Ethernet
- USB 3.0
- I2S, UART, SPI, I2C, PWM, GPIO

Signed-off-by: Richard Hu <richard.hu@technexion.com>
Signed-off-by: Ray Chang <ray.chang@technexion.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 403 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi   | 839 ++++++++++++++++++++++
 3 files changed, 1243 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d621..6acd2408f936 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -191,6 +191,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
new file mode 100644
index 000000000000..5d37a21e9e4d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 TechNexion Ltd.
+ *
+ * Author: Ray Chang <ray.chang@technexion.com>
+ */
+
+/dts-v1/;
+
+#include "imx8mp-edm-g.dtsi"
+
+/ {
+	compatible = "technexion,edm-g-imx8mp-wb", "technexion,edm-g-imx8mp", "fsl,imx8mp";
+	model = "TechNexion EDM-G-IMX8MP SOM on WB-EDM-G";
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led {
+			default-state = "on";
+			gpios = <&expander2 1 GPIO_ACTIVE_HIGH>;
+			label = "gpio-led";
+		};
+	};
+
+	lvds_backlight: lvds-backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 36 72 108 144 180 216 255>;
+		default-brightness-level = <6>;
+		pwms = <&pwm2 0 50000 0>;
+		status = "disabled";
+	};
+
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_lvds_backlight_pwr: regulator-lvdsblpwr {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_lvds0_backlight_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "lvds0_bl_en";
+		gpio = <&gpio4 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_lvds_pwr: regulator-lvdspwr {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_lvds0_pwr>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "lvds0_vdden";
+		gpio = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "PCIE_CLKREQ_N";
+		gpio = <&gpio1 13 GPIO_ACTIVE_LOW>;
+	};
+
+	reg_pwr_3v3: regulator-pwr-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "pwr-3v3";
+	};
+
+	reg_pwr_5v: regulator-pwr-5v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "pwr-5v";
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		model = "audio-hdmi";
+	};
+
+	sound-wm8960 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&cpudai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&cpudai>;
+		simple-audio-card,name = "wm8960-audio";
+		simple-audio-card,routing = "Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"External Speaker", "SPK_LP",
+			"External Speaker", "SPK_LN",
+			"External Speaker", "SPK_RP",
+			"External Speaker", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"RINPUT1", "Mic Jack",
+			"Mic Jack", "MICB";
+		simple-audio-card,widgets = "Headphone", "Headphone Jack",
+			"Speaker", "External Speaker",
+			"Microphone", "Mic Jack";
+
+		simple-audio-card,codec {
+			sound-dai = <&wm8960>;
+		};
+
+		cpudai: simple-audio-card,cpu {
+			sound-dai = <&sai3>;
+		};
+	};
+
+	reg_usb_otg_vbus: usb-otg-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_otg_vbus>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "usb_otg_vbus";
+		gpio = <&gpio4 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&flexcan1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names = \
+		"", "", "", "", "", "", "DSI_RST", "",	\
+		"", "", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "";
+	pinctrl-0 = <&pinctrl_gpio1>;
+};
+
+&gpio4 {
+	gpio-line-names = \
+		"", "", "", "", "", "", "GPIO_P249", "GPIO_P251",	\
+		"", "GPIO_P255", "", "", "", "", "", "",	\
+		"DSI_BL_EN", "DSI_VDDEN", "", "", "", "", "", "",	\
+		"", "", "", "", "", "", "", "";
+	pinctrl-0 = <&pinctrl_gpio4>;
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-0 = <&pinctrl_hdmi>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c2 {
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&reg_pwr_3v3>;
+		DBVDD-supply = <&reg_pwr_3v3>;
+		DCVDD-supply = <&reg_pwr_3v3>;
+		SPKVDD1-supply = <&reg_pwr_5v>;
+		SPKVDD2-supply = <&reg_pwr_5v>;
+		wlf,hp-cfg = <2 2 3>;
+		wlf,shared-lrclk;
+	};
+
+	expander1: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "EXPOSURE_TRIG_IN1", "FLASH_OUT1",
+				  "INFO_TRIG_IN1", "CAM_SHUTTER1", "XVS1",
+				  "PWR1_TIME0", "PWR1_TIME1", "PWR1_TIME2",
+				  "EXPOSURE_TRIG_IN2", "FLASH_OUT2",
+				  "INFO_TRIG_IN2", "CAM_SHUTTER2", "XVS2",
+				  "PWR2_TIME0", "PWR2_TIME1", "PWR2_TIME2";
+	};
+
+	expander2: gpio@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "M2_DISABLE_N", "LED_EN", "", "",
+				  "", "", "", "USB_OTG_OC",
+				  "EXT_GPIO8", "EXT_GPIO9", "", "",
+				  "", "CSI1_PDB", "CSI2_PDB", "PD_FAULT";
+		pinctrl-0 = <&pinctrl_expander2_irq>;
+		pinctrl-names = "default";
+	};
+
+	usb_typec: usb-typec@67 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x67>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_hd3ss3220_irq>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&dwc3_out_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&dwc3_in_ep>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_csi0_pwn: csi0-pwn-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07	0x9
+		>;
+	};
+
+	pinctrl_csi0_rst: csi0-rst-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08	0x9
+			MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1	0x59
+		>;
+	};
+
+	pinctrl_csi1_pwn: csi1-pwn-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD3__GPIO4_IO05	0x9
+		>;
+	};
+
+	pinctrl_csi1_rst: csi1-rst-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__GPIO4_IO04	0x9
+			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x59
+		>;
+	};
+
+	pinctrl_expander2_irq: expander2-irqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXC__GPIO4_IO11		0x140 /* GPIO_P247 */
+		>;
+	};
+
+	pinctrl_gpio1: gpio1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x16 /* DSI_RST */
+		>;
+	};
+
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__GPIO4_IO06		0x16 /* GPIO_P249 */
+			MX8MP_IOMUXC_SAI1_RXD5__GPIO4_IO07		0x16 /* GPIO_P251 */
+			MX8MP_IOMUXC_SAI1_RXD7__GPIO4_IO09		0x16 /* GPIO_P255 */
+			MX8MP_IOMUXC_SAI1_TXD4__GPIO4_IO16		0x16 /* DSI_BL_EN */
+			MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
+		>;
+	};
+
+	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
+		>;
+	};
+
+	pinctrl_lvds0_backlight_pwr: lvds0-bl-pwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD2__GPIO4_IO14		0x19 /* LVDS0_BL_EN */
+		>;
+	};
+
+	pinctrl_lvds0_pwr: lvds0-pwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD0__GPIO4_IO12		0x19 /* LVDS0_VDDEN */
+		>;
+	};
+
+	pinctrl_otg_vbus: otgvbusgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00		0x19 /* USB_OTG_PWR_EN */
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&pcie {
+	vpcie-supply = <&reg_pcie0>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dwc3_out_ep: endpoint {
+				remote-endpoint = <&hd3ss3220_in_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dwc3_in_ep: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
new file mode 100644
index 000000000000..f235c6aae924
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -0,0 +1,839 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 TechNexion Ltd.
+ *
+ * Author: Ray Chang <ray.chang@technexion.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
+#include "imx8mp.dtsi"
+
+/ {
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	enet_power_en: enet-power-en {
+		compatible = "regulator-fixed";
+		pinctrl-0 = <&pinctrl_enet_pwr>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "enet_pwr";
+		gpio = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	i2c_gpio_brd_conf: i2c-gpio-brd-conf {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-frequency = <100000>;
+		pinctrl-0 = <&pinctrl_i2c_brd_conf>;
+		pinctrl-names = "default";
+		scl-gpios = <&gpio4 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		sda-gpios = <&gpio4 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <12000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VSD_3V3";
+		startup-delay-us = <100>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		name = "rfkill";
+		pinctrl-0 = <&pinctrl_bt_ctrl>;
+		pinctrl-names = "default";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	wl_reg_on: wlreg-on {
+		compatible = "regulator-fixed";
+		off-on-delay-us = <20000>;
+		pinctrl-0 = <&pinctrl_wifi_ctrl>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "WL_REG_ON";
+		startup-delay-us = <100>;
+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+		device_type = "memory";
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2>;
+};
+
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&eqos {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_eqos>;
+	pinctrl-names = "default";
+	snps,force_thresh_dma_mode;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			eee-broken-1000t;
+			reset-assert-us = <35000>;
+			reset-deassert-us = <75000>;
+			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
+			realtek,clkout-disable;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0>;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <1>;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <2>;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <3>;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <4>;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-names = "default";
+};
+
+&flexcan2 {
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pmic>;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK1";
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK2";
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK4";
+			};
+
+			buck5: BUCK5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK5";
+			};
+
+			buck6: BUCK6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3400000>;
+				regulator-min-microvolt = <600000>;
+				regulator-name = "BUCK6";
+			};
+
+			ldo1: LDO1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1600000>;
+				regulator-name = "LDO1";
+			};
+
+			ldo2: LDO2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <1150000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO2";
+			};
+
+			ldo3: LDO3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO3";
+			};
+
+			ldo4: LDO4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <800000>;
+				regulator-name = "LDO4";
+			};
+
+			ldo5: LDO5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-max-microvolt = <3300000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-name = "LDO5";
+			};
+		};
+	};
+};
+
+&i2c2 {
+	/* I2C_B on EDMG */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c4 {
+	/* I2C_A on EDMG */
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c5 {
+	/* I2C_C on EDMG */
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_bt_ctrl: bt-ctrlgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05	0x41 /* BT_REG_ON */
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x41 /* BT_WAKE_HOST */
+		>;
+	};
+
+	pinctrl_ecspi1_cs: ecspi1csgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09	0x40000
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK	0x82
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI	0x82
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO	0x82
+		>;
+	};
+
+	pinctrl_enet_pwr: enetpwrgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO11__GPIO1_IO11	0x11
+		>;
+	};
+
+	pinctrl_eqos: eqosgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC			0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO			0x23
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0		0x91
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1		0x91
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2		0x91
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3		0x91
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x91
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0		0x1f
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1		0x1f
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2		0x1f
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3		0x1f
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x1f
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
+			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09			0x19
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12			0x19
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD2__CAN1_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD1__CAN1_TX		0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD	0x40000019
+		>;
+	};
+
+	pinctrl_i2c1: i2c1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001a3
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001a3
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL		0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL		0x400001a3
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001a3
+		>;
+	};
+
+	pinctrl_i2c_brd_conf: i2cbrdconfgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x1c3 /* BRD_CONF_SCL, bitbang */
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x1c3 /* BRD_CONF_SDA, bitbang */
+		>;
+	};
+
+	pinctrl_pcie: pciegrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x41 /* PCIE CLKREQ */
+			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x41 /* PCIE WAKE */
+			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x41 /* PCIE RST */
+		>;
+	};
+
+	pinctrl_pmic: pmicirqgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x41
+		>;
+	};
+
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT	0x116
+		>;
+	};
+
+	pinctrl_pwm3: pwm3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXC__PWM3_OUT		0x116
+		>;
+	};
+
+	pinctrl_pwm4: pwm4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXFS__PWM4_OUT	0x116
+		>;
+	};
+
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI2_MCLK	0xd6
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
+			MX8MP_IOMUXC_UART4_RXD__UART2_DCE_CTS	0x140
+			MX8MP_IOMUXC_UART4_TXD__UART2_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA7__UART3_DCE_RX	0x140
+			MX8MP_IOMUXC_SD1_DATA6__UART3_DCE_TX	0x140
+			MX8MP_IOMUXC_SD1_STROBE__UART3_DCE_CTS	0x140
+			MX8MP_IOMUXC_SD1_RESET_B__UART3_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__UART4_DCE_RX	0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__UART4_DCE_TX	0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__UART4_DCE_CTS	0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__UART4_DCE_RTS	0x140
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x41
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xc6
+		>;
+	};
+
+	pinctrl_wifi_ctrl: wifi-ctrlgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00	0x41 /* WL_REG_ON */
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x41 /* WL_WAKE_HOST */
+		>;
+	};
+};
+
+&pcie {
+	pinctrl-0 = <&pinctrl_pcie>;
+	pinctrl-names = "default";
+	reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
+};
+
+&pwm1 {
+	pinctrl-0 = <&pinctrl_pwm1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-0 = <&pinctrl_pwm3>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm4 {
+	pinctrl-0 = <&pinctrl_pwm4>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sai2 {
+	/* AUD_B on EDMG */
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	pinctrl-0 = <&pinctrl_sai2>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sai3 {
+	/* AUD_A on EDMG */
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-names = "default";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&uart1 {
+	/* BT */
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart2 {
+	/* UART_A on EDMG, console */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&uart3 {
+	/* UART_C on EDMG */
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	pinctrl-0 = <&pinctrl_uart3>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&uart4 {
+	/* UART_B on EDMG */
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	pinctrl-0 = <&pinctrl_uart4>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usdhc1 {
+	/* WIFI SDIO */
+	assigned-clock-rates = <200000000>;
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&wl_reg_on>;
+	status = "okay";
+};
+
+&usdhc2 {
+	/* SD card on baseboard */
+	assigned-clock-rates = <400000000>;
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	bus-width = <4>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	status = "okay";
+};
+
+&usdhc3 {
+	/* eMMC on SOM */
+	assigned-clock-rates = <400000000>;
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
+	bus-width = <8>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-0 = <&pinctrl_wdog>;
+	pinctrl-names = "default";
+	fsl,ext-reset-output;
+	status = "okay";
+};

-- 
2.43.0

