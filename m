Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE91246BC1;
	Thu,  3 Jul 2025 03:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514167; cv=fail; b=t6uQfgy09gWLATdkCaKAalEeOch5eh0hYwYwr2c7B5mDADEeH764jVSX2QKWPfkwK5QHlLP3UXpomlaLXqtDU5ObtxALmc1pkT+sv7PmjT2iB29fcALaCjoc8uBG3fjNscH8CR/OHWGQSzeUus33QxKV+djsqNbLONNU9Z3URoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514167; c=relaxed/simple;
	bh=I5LBfqNamcmOwVOt6TES/SAe+bKQTzH95ZPnCjcPRzU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sHl1wAAIv5CWMBRBxBZFRvAEyO9HJx7igErq5tldQPKzQzjIW1kHcLaa3HJ2k+utP1Fvlflc94AznYp0Dvhwp8KslRSdskR1UfOLouwNODgW2F6gu5OxKIGz1FIGmfFVcp3ak9ISRu/L9Ns8CviY13jr3J5P57IdfQEc3zoo0pM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GBnfz1TC; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GBnfz1TC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fg/v20ZRmfJBksb/wyeisDysSNjLYQRCJJaXBT9sqfx4Gdq0e/Fi9UhQWRYHcX/7fQ43cGNJ0op0SSfADqQqe7Dl6I1L3oJwsxqJ9JFxS7GZrin6VM4iXX0zPo+XgAH4MsrYo+oy5tLTiciDbszYhOdYbr9vJ+y0KUJsOEyYBUg0d43NsB6sY3K+/VgYwrS1gejA8wp4IYUrl0YSkTI6dwWhAfDX5fS6luNGvdUxTu47NNXC2xvBsptkN/nEEEymw4lUEkTRtLxg25XGfpMqvfy3yeZuwSFYbedkpib8Xd10GCNBbp+6j2R/2OhJx64FGtV+3Ou2vTLMa5yRv8iQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opm3/5JGXtiRAfswtwcZ1lpEFy6HVusYE8a4nzYUp+k=;
 b=ro0bIN+BwzQwDN5qa/iruUdCOxoqNibuXnLAtjHNBG45kkExdFRW0uwuSZFjw+T2s8x52RDAIuFhH9M07OLzpcdS4HcUsf+/IH7KZTFLMpJrX8gCJFPcwDhkNxEDfHYR5mq8hceZf8W+smSVwYvck80XgS+3mPY7L55009QHkpdqIhz6iGoJaDJbHkqz7HYWdGtrbyIzOtfL6ziZtoxk/7wXSWSynMGCcfAfB0QDEXaHvSL6oe+u5H4gF+v9QMqC0aKE9/BNnMQuwNwg3V+fVwHtnRX7sQMBGyuL9kXLRfaofjxvyCREacX4QVkxTO0i8G3pOPz0Yf7zZpx7FtTzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opm3/5JGXtiRAfswtwcZ1lpEFy6HVusYE8a4nzYUp+k=;
 b=GBnfz1TChmzdHyUX3ZGCbDj/La/uoxN6N97ruHQVCc9TzMyfCJc9sTxvw7UbfCm/imiRvQuG3nAB/PkjMjPyQwD/anypxBlVCzW8OiIIcL5NgFjBU93D1Rd9BWFL+IQtrJdYFmbFP6S0tWbOKNvtLUYxDTw0+5CTdv1V6g63FbnnX5q1JH7ci6PL/nsnDXTaU5Tpoa5QOtf0v5afddlTOAIWnhktm6yYGTweITE4wV6tpD05DaGTNT7z6Rb93bYPn0Lrv95LQ77r+R/GBoHm8iNk3lDA0LJWu0ZdmBXhF451MgH852xSVa5BD12VpHZyTBEwkzL1cxBkUZgvrborlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:43 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 03 Jul 2025 11:40:23 +0800
Subject: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=3716;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=I5LBfqNamcmOwVOt6TES/SAe+bKQTzH95ZPnCjcPRzU=;
 b=0tYhSQbr2rqXDH8uxyz4nJWavKOhHrViw+B2zTRHUcizAeNK3Cju1GzT9zcp5knjoEM/iW8tC
 Fb9ZMFgQRq+AOhXWmgAA/o79+89j1GyQQtQJ+BTbXzGyC/8ru4URqsM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2daf5a17-51a6-4a45-c10e-08ddb9e3aae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjZWamVQVCs1VUZrOCtCSnJaTEFtNnNXbTRBbDk4cjZtdHowSXoxMGxBVUNL?=
 =?utf-8?B?VEp6MHQxRi9abWd5d0tWOU8xUFZ2MmhSaUErMHdwUkxzL3cvOXo3dE5HU2hB?=
 =?utf-8?B?SVhSaS8vWTZHRDRvNHd5UzMwZUpndVI3WXVNdklYUlk2cjFSMmFYeFJxN1FP?=
 =?utf-8?B?cy9QUXNkQXJkOWRxdTg2c3N5bUdmRXI2VDdRR2lKU3N2K3RQS3gzcVRjQklm?=
 =?utf-8?B?RGd1ZTFuaU96a2JkVFRCYjZzUG9zZ0NqZmV0cDNrZ1lrT3pNTmc5NGxScXhy?=
 =?utf-8?B?VTFML3B5TWhOZnhzRW42TnNRWHBUa0REVm1mTlpwQmZYSmZxKzIxWXQxdmUw?=
 =?utf-8?B?Y05oUVFjdE5qaWpMNjVHNmliSFF1WHdZQXNHRXlMcGNGaStiQmpBcDk1dEQx?=
 =?utf-8?B?R2hEVWFyYnluaW5aVDlNaEVERSttU0VTZEJ1bXk5bmFYRVlLTDlKVzV0LzVU?=
 =?utf-8?B?QjVGOFgxSVdrWjIxZnQ4cXRUOUMzRGpoMC9jYytBRnNLRGt5MHJwMWxQVHNm?=
 =?utf-8?B?bGY3cHdoa21ZZHJxUTJOUzNHS1JaR0RyODQxckNrd3M5OTZDcXZvbTFJWXFw?=
 =?utf-8?B?YUZVeHpiU3E0WGI0TWpaSzJLMnBCL3lSdnZ1ejNJSmFJN2UwaWpLTmNxNWNI?=
 =?utf-8?B?RFN5Z3lVc1kwVklvSXVpUHhQVlJYZFhPUERKUHU2bUYzY1JKWms1SzhxeGpS?=
 =?utf-8?B?S3N4WjZja044dlc4L1RxYkhqZHhwTWdlRzJXelg2QlA3R0FIVHRkQUpoQzc0?=
 =?utf-8?B?ZW1SLzNpSmwrKyt0WjBtZ3FLY0NiU1BpdTVRV0xFMUk4K3dEQkxyMmVBUkJL?=
 =?utf-8?B?NFAvMFA3VkJ6TmZhaTF6S1B1WUk1RW1nZkowWDExQ3N1WGQ5R3lhRmVITXQr?=
 =?utf-8?B?YXplNC9mREw4R2JTcHI0T2ltMXBqOVJZVGREeWhtekhFY3Z3YWFsYWw5L3Yw?=
 =?utf-8?B?bnluK2Z6TGhjYytuaWM3ckpaN1doaUU4eHk2MWUvYkk4THJnWDZ5d1VtVWxB?=
 =?utf-8?B?YVpsejlnUmVmbGphcXpkdERveVJVMHpXc1Ztd0RmbVhqbit0Nm1aaG9RdVd6?=
 =?utf-8?B?SGtOcEFXOFdjcnhoL0JEU1AyUXVZWkNNT296WVl1U3FVZlN0VExpR0FSa1FZ?=
 =?utf-8?B?cGxLTXRXQkR3amovbUV5QXV2Y3JwNnlqUFRaNytzVGd2QjdCSFUyTFFNdUdE?=
 =?utf-8?B?cEdrSUsrOUpFSGZteXFPZGp6UWthdnlnSktBUlZoOHlBdDNTWU9JUkRBVGhr?=
 =?utf-8?B?Y0IxTVQrdS8wRHFRNFM1ZXZsalpISjZCQng0RHB5Y1lYSWZncndteVhjdWUx?=
 =?utf-8?B?ckxFTDJ1ZDdHWTNWRXZaUGcvWUNyZEJGR2swNTY4MkVQTUJDL0t6QTF3MHQv?=
 =?utf-8?B?Q2lMenFWSFBMS2hOWU1qclROUkFMOHoyUkUrOUEzSlRNTC9tWFRzYmpRVXhr?=
 =?utf-8?B?ZVpzSnNmSjhMZGlObEROTnR6WkVDWXFqeFZvRXZjaS91VUExZzhKcXpVSzJL?=
 =?utf-8?B?UHZ2SEdvVFpJcks0THlCN21OdjdITnkwY3I4b0I5Y0hYbFVhV2ltaXNaQWVx?=
 =?utf-8?B?ZVp4Ymc4VWZIeERWckNDeElYNTFTcVY2Nk12ZVBmZlNUdmF1cHovY2N0TExK?=
 =?utf-8?B?MU5xK2w5V2lZQTRTZFU5VDdoRVJ6cmxnbVVOVFBLazZNUVZFVS9SRmtWeThZ?=
 =?utf-8?B?d0VuWHdiTDNXajhIMkQ1R2pnaGJCbElweXJpNWZYK3JUMkdkQjFqQldmdlQ1?=
 =?utf-8?B?RjVpMVloQ3V4U2xxVDdRYWtuMVlUcUgyV0hHZlBKM3p4ZjRQbWc4eU82MVll?=
 =?utf-8?B?dzE1anRwaHAyekM2NmY1d1RiRnQrc245WWZTMEtHUmRYUmVPTXprUEJmTTNP?=
 =?utf-8?B?SERiYmlLL1hSNkxOUVBWVklUVUlocG0zTWN4NXlwcFFjc0QwL3hMeG1sKyty?=
 =?utf-8?B?UEJ5M29EUWhUSnduYjJMTXNaS3RsaWVOWjZUMEtRVTZLb1oxQm5qeGFBN25J?=
 =?utf-8?Q?+jhlPSXgJA4qFINRhlD9Zec4GVqvqk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clovL3draUVJd0lnVWhGT2FEeXpkclpKZ09DQy8vTmE5U2ZJKzN4eGlLVUd2?=
 =?utf-8?B?QkhtRldkNTF0dk1Fa2ZVamJOL1RrVDJuOVEvTWRjUUlmdTFjRmtJNDc2N3da?=
 =?utf-8?B?MEU1S0p5QkpyK25FVHozZ3RQVThidEdMdHhERnhyd09VYTU4UEllK1UwWjZ0?=
 =?utf-8?B?UVIwUGxIVGxiT2hXSVpITjgzT2tqeGNKbEM4VWU4ZmdYTGIxMzdzNkhYRitM?=
 =?utf-8?B?VzlOTzZIbFdGcUNwbDhtc2Y5V2xDSXVWRmMrWGV1K3R4MERtY1hwY3E2MDRm?=
 =?utf-8?B?ang4VFljUGV3Yzh5ZFY1SEY5dEpiSEFvV1ZDOFBMTk1rYjhJMGlXRzN0eDls?=
 =?utf-8?B?MFlmM09mYUdTTzQ3VVFoQ2FKUHA3ZjYvOXdzbWd1ZzZYRFd1M1o4dThCVHJp?=
 =?utf-8?B?cWJIdVZmazdrYlNDUTBQZWlGZitFWGZnTUdaVmg1eVRNczlic3doWThOUTFu?=
 =?utf-8?B?VUtVV1FxdVlIbENCQzJMUW5Od2V1S3l2VHpWNkJmdXNoa1RVNEd6UGErVWdn?=
 =?utf-8?B?VVFKcjVVZ2dsNzdlK21zOXVraDRTVWQxRkNzaFpTd2IrbTBZajE2UTU3L1Bp?=
 =?utf-8?B?SHNXSzBVT1hLVGRvQk1tY1BHd2xjODRjejhSZ0gxZU1hVWJaSzNRdkl3UVlG?=
 =?utf-8?B?b29uYnhLRVN0K1pqdVEyWDFURkp0K3BBbUtpWE15QUJBRWN2ejdLSVI3a1I3?=
 =?utf-8?B?bGhudHRNVVN1eHY3T1IyZVVyMmNIZUJOTzVWNC9aUnN1M0FqbGZFdEQ2R24x?=
 =?utf-8?B?cWQzUFRRQzZNbUR1azR1K2hFQ2g5bmJPNTMvYlhYeXFnL3VEZHVIdU03SXBa?=
 =?utf-8?B?RGNxNTZvalVIM2VML29tNHEzMy8vVnBTTGZXdHJYZGc4VmtFaFNmcFlnYS9r?=
 =?utf-8?B?ZUdDUk1iUzN1WGE3WThxSUNJZHJLbHlMMjZ0bjJaTzFnNk4xcG5hMEFPaUNl?=
 =?utf-8?B?aXZpNk1SRmExbUxFd1lKeHo1cW1YODQxMmhWTzRuQU1VUXUrV0NxZW5nRUFK?=
 =?utf-8?B?bXRXd0hEeE9lRzhxczVvUDMyMHZ2MzFMVVdvRW5XcVVGbVhYRWFVUnpUbEIv?=
 =?utf-8?B?a2kwYUN2Y2NoemdaaHZsenF6eE40bU9xbTNWMWxEdFVSNWN6Z0FCOUxUVEpk?=
 =?utf-8?B?TnRxSTFocHZ0SE1Kbnk2S2JEVHg5blQ2cjIwcTZUWmhLR1VUQnROTmVydk5D?=
 =?utf-8?B?UmN6L2V0OEVJOWlCUDhhbWRJbGdESFI2RGJhcEp2ay9nL3dZYllXVm1DVXhs?=
 =?utf-8?B?QUFoNi9nU2ZkU09SRTZQallZMW9aWndKZnNxakZHRkllODNiSVVWVm5CQmxQ?=
 =?utf-8?B?UHUxby9sczBrNnc3dmJQbDZKcWtUd3U2Nkh6cWJ2QkFaVGFtZitDQWpjN2l4?=
 =?utf-8?B?OXpYMXl2eTIzNmZHazJnSjNxUlZUbndkbmd6c1pYQnVoVk9uNW41a1lSWFls?=
 =?utf-8?B?SEtJcGRsYndhRWtrNTA0TUNDUUE0RGN0SkcyS2V5WWJRUGRCVjlCTjdTOXRF?=
 =?utf-8?B?YzFrVnlIWmhDV3hOYjRKNHdNYWtmUm55QUpFbHIrTnJNWDYrRi9DQ0x0MWpq?=
 =?utf-8?B?QXp1VklGMWVCS2VZWThOZWo4eHZkTEw1L25qU2Izbi9RTFh5MUViWWhlbEM0?=
 =?utf-8?B?TEF3dnBXUG9YUjgxVlJOdE5Bdnp0VWNBUXA4M0lqdS82ZGNOMDdZK2ordUVr?=
 =?utf-8?B?Njd6bnN1YXpqR2tUeWlybmpkV0NNS09tdngxK2tSQkdYYkJxRTJxVmpPV0pT?=
 =?utf-8?B?Y2x0U00rS2ZFUCs2bHdrTFg5a0sxOE83UTAxVUtpL3hoOVI3NmlURHpPVkFQ?=
 =?utf-8?B?Y0xVOWdvR1ZqaXZOM1hmWWFaeXdTeXpSZ2FyRkZlWVp5L2p4WThRbW1FUnFQ?=
 =?utf-8?B?TC9wN0w1QlREV2JHekhWZUtmenRXT0l6T0dsVkRENGFzZHpSeldmUDgxWG53?=
 =?utf-8?B?cmpxOEtoMW9PYXp3dlpyTzg2L05uVEJWM2Z0TXg3WE9kTzdseXVORnJBOFlO?=
 =?utf-8?B?TmhJdDNuVWpUc1ZUY1hhbXdqQ0Z5SEk3M0ViTERkblVyc1ExdzZrN2psZWs3?=
 =?utf-8?B?RUVZcmxRTWo5WXZKZ1ZobVhQZFJoa3RzZVdvYmgvMy9WOXE3eXdDMkRUZWF4?=
 =?utf-8?Q?Cg0FKV/mcZEZ3pg73mLQp1lDq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2daf5a17-51a6-4a45-c10e-08ddb9e3aae6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:43.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQw2/igv5dL/ETRqcYTg3W09dHV05mKHsiUyviOHNVMBS6OTeDj3ovSoOI3PTU6oVHcEl5GmW7999QNzsg549g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
register controls the selection of the clock feeding the display engine.

Add clock gate support for the two CSRs.

While at here, reorder imx95_bc_of_match.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 56 ++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 828ee0a81ff62c6e4f61eef350b9073f19f5351f..4fd101502e5881c78193c7e443123c8047f216de 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright 2024 NXP
+ * Copyright 2024-2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
 #include <dt-bindings/clock/nxp,imx95-clock.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
 	.clk_reg_offset = 0,
 };
 
+static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] = {
+		.name = "lvds_clk_gate",
+		.parent_names = (const char *[]){ "ldbpll", },
+		.num_parents = 1,
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_GATE,
+		.flags = CLK_SET_RATE_PARENT,
+		.flags2 = CLK_GATE_SET_TO_DISABLE,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_lvds_clk_dev_data),
+	.clk_dev_data = imx94_lvds_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
+static const char * const imx94_disp_engine_parents[] = {
+	"disppix", "ldb_pll_div7"
+};
+
+static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev_data[] = {
+	[IMX94_CLK_DISPMIX_CLK_SEL] = {
+		.name = "disp_clk_sel",
+		.parent_names = imx94_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx94_disp_engine_parents),
+		.reg = 0,
+		.bit_idx = 1,
+		.bit_width = 1,
+		.type = CLK_MUX,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
+	.clk_dev_data = imx94_dispmix_csr_clk_dev_data,
+	.clk_reg_offset = 0,
+	.rpm_enabled = true,
+};
+
 static int imx95_bc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -467,13 +513,15 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
 };
 
 static const struct of_device_id imx95_bc_of_match[] = {
+	{ .compatible = "nxp,imx94-display-csr", .data = &imx94_dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx94-lvds-csr", .data = &imx94_lvds_csr_dev_data },
 	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
-	{ .compatible = "nxp,imx95-display-master-csr", },
-	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
 	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx95-display-master-csr", },
 	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
-	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
+	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
 	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},
+	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx95_bc_of_match);

-- 
2.37.1

