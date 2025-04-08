Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E45265CC4;
	Tue,  8 Apr 2025 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102058; cv=fail; b=o9ia5ioY2nRKvtSobzgf3Ks7qgNnvcfE+/ZM8iFldIRquRDeCKusDe3dqLtvIQivUkCU8vJyC1lJhP0VNA2mW+DtLlcL/CqFQxKtOHjr1LJ778SpfULiFNhNcVDXK/56179cnyRFfr6gLV6U2N6GWIogbaQIdEVSTwGa2IDjyYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102058; c=relaxed/simple;
	bh=YcXopkX3qiVWy7f+v/U4+OqOkGzfItqtWid7XOc4JLo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q1p2wdR3WpuhotO/0FGLCWUFKBmKiPRFpngx2tkj4B2G3Pn/fkcdjCEp88tpTpHHbHSIigFdKQf3RrsNYsTVcW5ZI/tbUeag3naoux++Bo7uX2E25900++aSIzNys2Xpg8WetTv27KYzJ64wFTIPI39/A5q5aDjsJ9/IIMGOSQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hWBQcChF; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hWBQcChF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXse5VumEj9o0nFez01ntKv1x6khF3fUS2MxZW+sC4qgGHmF4vjjYpeqCGKns23vZoRediq+SyDDBO7PAd+CDX2awAaznUCggKahinZbB737apzXwVywXu8CwWgu4PXNvgu1dv1rbU9pMKuaUT8coTwWCEuAsRp67MrNVcI5tgcAbTJQFc384qujOLV/2s5PTAkkaZCJy5bTxVpuxq2wrIZWQQBVpwwahPVby7FAy2Pni+qr58WXk1wDjGhM97/iFFU+/zgBoUJkoxCLBPKVg2I97QAeEK/xMZb997LUhEP4l4i9F2E9A+SDp3LtphuMO9DKSVMacnw4eGMxUZuXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCbS96ZWJsjZvrjwTAM4otcx9/p+SEnFPLgLPLvS614=;
 b=By6rTk8BQufMbh5bACmXutLpHEDC9uLvGOZ76xg9KVgKchcCZY18b/jLPEHMX/vRNOdAA+vw6XpePV5V21CEg2L2YxEAgkbohKMOlaGzayNvGFULPlB/EtHmPdJfSWj9kGNpnS10Usom+LSuIfGOObZApT9exwEe8+7aephWRbnGzYjmhYg4tpWKR+yOF+W179wBvTsvhewhpqfwqjfaXpRZbMqi5hRCQ8uVZq142djlGwFEYSBefyZ5j6l37oCvSn2z0+fcVfO1mjEgbHdWgfDfHxV5l6t48lximXv02QO3MFtm/l9UWMZZM2ZOZZMKOK38POQ9tLNNK7GPEuVllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCbS96ZWJsjZvrjwTAM4otcx9/p+SEnFPLgLPLvS614=;
 b=hWBQcChFpnL8vhz587hgj4wcKPRENC/TLy0FFwWaO/LbNnb4gORNI3mt/u3M3xwvuqdv/PASeYVHcCNUkp/NgmDSbnaaPBvTPsSvrbFAWN6lX2iILw8mFFja2tF19hwtZvHTRyspYWenrI8/MNVXiIVjfSQGAPJltIdU2n+yQe3k9enZXpKl1xj2QiRXUE6p3sndfttkMuR4G2zhqTZoSJmubklWLW4MjTU10ErDodeMjUH3bgM56L/R79yrQJoeLTjuVXBKMInBHmUm9ALKXgATzmQRlFy+qiYJGW3bCMifVf0XhZHbjgnBlZGmO/AYRaeld14icjUIkrColt4jXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:33 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:29 +0800
Subject: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=6279;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rd3I+t2nFc7Iz0+EcatlHc+yizA13sGbbHgtoWjJqf4=;
 b=YptcjQsD+M5dODJpAYgJ4vChb+NChKWdx1kxD9PPVxlhSLybc9iu6SwJQ76TPaWOOYM4XJ2b2
 x+eR1ZXlwcnAkI1NKIpY+k8VJcNmJEdiqUlhg4o77uv3zrt2Eyq1MCI
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f6f329-c706-460b-da9a-08dd767a0124
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHpOWTVrYUlLbWpZVklIbkFYLytLMEc4NDV3RGhSaTVSY2FwRXoxeFdkQ1Zh?=
 =?utf-8?B?ODVzTEk4b2tOOGZlYVJKU3l0Vmk1NjFYSlV2eHNRZjhMdHBNYm1YWVBIK2k3?=
 =?utf-8?B?Q1FVL3B5RmlaM1RSaVRnUHNtUlRLVlZETHlLaXd2UmQvSG52SU1SeHBNMGwx?=
 =?utf-8?B?WWwrRDg2TTE0ZmNscmMwcVRBME51R3kzK2xOK0VvZ3lDYnpjV0pvY1ZGRGRt?=
 =?utf-8?B?RU14YkxjU29SYnhBSWFKT1VMcHNYUjd2VXVTWFZNclQzMjFLamtSWFdpU3Uz?=
 =?utf-8?B?L2lzbG9lMHpHaGV4V3lScXZOdys0eDk5UDhwRlZCRlI5MytySG04OTcxS0J3?=
 =?utf-8?B?NlR6bXZkdkhYTVVqTUZzbTduUkxnb3IyZitIdXZQZzU3REswYzVCQVlJaXhk?=
 =?utf-8?B?RHJaOWdnYjlDcGtaUkYweG1iVXlDSnl0SjJCMTFWM2w4V2dWSTgveHFjais0?=
 =?utf-8?B?RTBHSVdIelhKVkFtaUppZjJMMVdTdTc0L1NxYkhwZzVzTEw5ay9WQzFuQXFM?=
 =?utf-8?B?b2NPWU0xUHBMYk15dWZpMkEyYVFXOFdNeWFKTXdyYVI3LytrUTAydFM0NGk5?=
 =?utf-8?B?ZlN1Y2hIc29XdUNKRUJIQjhwQU9LWWc0NVZJMDF0ZVZEZEwrM3hSeFd1WVFC?=
 =?utf-8?B?d0ZXZTdkbGc0SWE4WDhvZC9QVGJjajJRbDIxZ0RacXNGY205Ly8wU25TaEhN?=
 =?utf-8?B?V3RPUW1OZjJHM2Zib0lpVllqT2NZOTZ3Z1duU3ZCQThQZHV4SHh6L3B3Ym9v?=
 =?utf-8?B?bTB6NXp4VnFoVjk1bjFIdzBrRGpQUjFrb0RjUDJBaTBUR3RXT3puZEd1UUtH?=
 =?utf-8?B?WlZRWVlneUhScWV1WW1IbmxlT2llMyt0eVBsaThiM04veGY1eDY1Z2I4Y1hk?=
 =?utf-8?B?TVFoRTQxNEpEYTNKcEJMRUhHL1IxOUFPZ01pQXN4dFJ1emhoZ08vYytoQzMx?=
 =?utf-8?B?elRjNzdzRkZNRERVNjhFVHFpMURwcHBSR3ROYjRLam42UWRUUjVxUW1hWWE2?=
 =?utf-8?B?ODlreCtZY1U3cVlhaWVROVl5WUxSZmdKVk1vNlNja1FaZ2Z1YitGbDdEdm5w?=
 =?utf-8?B?VkFNaWZqN3hRbEx0K2VZbkMzTEpkRkhCM0hEeHRCMlIwZlhheXVGSWdENlBN?=
 =?utf-8?B?ZGtDUVcweEpkUkx6SjlyWHBwQXhSL0xVOGhSbmx0emNRemhQSkdCaGVKVHRp?=
 =?utf-8?B?d05keEZsNWhNVTlDcmpkWmpsWUZOcmNWdVNHYm91RWhaRk9ZaktQTkt3Wmgv?=
 =?utf-8?B?bFNTTEZjV25OOC9tRUNkOGxRT0lLNG9BMXNHbVh5NjNhR2g2aUlFMVI0OHZ3?=
 =?utf-8?B?VnVrMExWVlpTOTBBVmswLzZSUmd3dkVaRFA2YWFpN3Zob1VwWXZpdFgvc3o2?=
 =?utf-8?B?ckJoVFNzS09mKy9WZGxqMWxXWmN2bXhUMGM5M1Q0T1Z5Qmp0QjREd2srL2kv?=
 =?utf-8?B?UGxlcnA1VVNZSGxEOXMwcWkrdDBONEdBa0NFUnA0LytHQ2lmNnNCNzZ2WTl6?=
 =?utf-8?B?SGxoMTB0U2o5OVFYRVczWWJZM2h2YUxmZUhoZ3kraFJ2WldmYU5pWnNmQUhZ?=
 =?utf-8?B?bi9LYWMvbXZ0K3o2RDRkQi9OWUEwNXc2b1dpSnJ6ekRlSUF4QmhmMmYrUzE0?=
 =?utf-8?B?Mjl5dmJVT0RlU0tmeEFhVitia1VzK0JSUm42Tm1jWC90Q2NqOWRWdjV2UVRJ?=
 =?utf-8?B?WU9PZ3ZHcDRJeTNPSDYwRVBkZ0RiQ3VsVm9FUkc5NnpUMkpFZGs4dlIvbnRX?=
 =?utf-8?B?dkNCMWZmRjB3NVZtUVl4MDExeHYwc09wSGpVaWhDRysrWTVWN210c2prOXBC?=
 =?utf-8?B?SGE4aFdDVkFORlhSSmxoQjVQM3RnUDcrU3FZUjUvbFk3cmxHdjFNSkE2NDU3?=
 =?utf-8?B?MTlWZkxWNmxiSWljOFRSRStoWjcwc1ZjS3BMSWwvRmhWcTBFWlluWTZQM3ZE?=
 =?utf-8?Q?h/IbtJqAyyzBnPI+y1nHZgtIBQH8ieQg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3hRdTJFVE5vVm9rWG5zcnZYNVl5S0dLWFpJMklaVVhDNDlFV2IzSnFFb1JV?=
 =?utf-8?B?U3FjeWRLVVpvWjBCQUE0dWxRcjJjTloyWDVOeGlUN1VmeGJmaVlROHJrdU4v?=
 =?utf-8?B?QlgzNm5BL3g0eWV3VWxrWTQ0Z29hMFBueFBqMHN3ZFRDMU5TVnZJeW15WnFT?=
 =?utf-8?B?VzZxMm9BMmV6TzJrZUhwaHlLRlhpSmhFU3A0VWwyUUgwWFlUeVc4RTZWVWpr?=
 =?utf-8?B?Q2tPQmd3d3BBUktQaFBNMVNTOHNkZUxYK0hMc0FscGpzOXF0eUVhZ1htVG41?=
 =?utf-8?B?SDVCZTRYbGhET1NhcnZvYm1PUnRIS0FpSURKZDQ1MnpUbWQxSlYxQXRUZURJ?=
 =?utf-8?B?TlpMdTZ3bVpDZnk4OGd4SDE3UE5ONDVYRVNUNTNhRjN5ZThReThacnhCanRD?=
 =?utf-8?B?ajFuNmNhd3VKNnhuMFRDa0VGenJ0dGFFQzFBWWxQSUlFbzUwSGp0V1JjeFhp?=
 =?utf-8?B?SHVBTWdHRElvWkgvc05WYWFXQnVocjkwUFdBdU1ISS9vZlNuaFpubTAwcDBM?=
 =?utf-8?B?VzRMRjhwSE0waXhYTGhCelQ4NjRxaS9URDgrbG5hSzd3Ykg5Tkhobk9lQzhj?=
 =?utf-8?B?VHNhV2FWMFN6Z1FZNXUyek5JTi8remR3RFdTSTl4MCs0ajdtYVhwOFZhUWF2?=
 =?utf-8?B?N2I3RitOM3htWllRclAzdkdPMkhQTUlwKzVwV2VUMnNsdTlRNWlEL1JYR3Jn?=
 =?utf-8?B?VXIrbEhuL0RtNk9rMHVoRE8rQ1NBRFc4ekNXTEo2MzZ3WlY0bm5xYy9xekNz?=
 =?utf-8?B?dzdMZUhQTFl1UUN0emFpYk1TYUF3TmRHZE1YWCsxVzNMZjhGZ1haWjBjVHJ5?=
 =?utf-8?B?TXZ5cTdMNVV4WGJUMVh4VlhBMnBIYUZRTzlnb1kxdHR1Sk9IcGVkemIvemxU?=
 =?utf-8?B?V2Y4NGVwMiszNUIzVnVTRGptS0Q4SXpaZ2FhT0tCRjFBZjNTOHU5YTE2OFBB?=
 =?utf-8?B?M0tRT1kvS29rSzlEM0RWTnpQekh5VjZsTXc4TkdJaEltK1N6VVJRZmFzNDFy?=
 =?utf-8?B?VTFGVzRnSUk4Wnhoc2UxMUduVTFmTFZMOENRR1l2bGh5K1NkbmZQaVVaOHVI?=
 =?utf-8?B?Z21FcFRxaGtCY09haXBSdGU2UWtiOEVwMTlFWS9WOWtPUFU1SEdhNmpmcVhk?=
 =?utf-8?B?clY0amxWRCtYUjB5U0ErL09uOHRod2ZhTFg2d1p1YTY3RmJDZkhWaFU3SWVh?=
 =?utf-8?B?eCt6VWs1a1BZc3d5RUI3SkNIVUV6cGV6aVhDWGd5TkFWbmNra0szQ3R5aWZq?=
 =?utf-8?B?L0JrbVdZajduMkR6VC94VUhHSzBBVEdwRVg1Z3B5aExFTm0vRVlkNyt5R3JI?=
 =?utf-8?B?N0NxenVKMWxHUmZoL2ZuRzAwS2FQMEVKNTA2R2t5OTRTV1ZaRFBuMW9iUHMy?=
 =?utf-8?B?WnJqYm9obUNkMkRaeFpWMUhFbGVFRk54UXo0Y1ZqSUFST1VCYTlSTHFqaDU1?=
 =?utf-8?B?cVNaRWRWTVY0S3FkTGVyNW5uYTNiVHNlckNNWVhJMjZCSUtiRXVTcWFXdVBQ?=
 =?utf-8?B?OVlVSkVNK1NyUmtJbFRnanpEcmRLa29EeUt5MU5GckFVdkYvZVVrUE9XN21H?=
 =?utf-8?B?clQ0aVphbjEvUVBJL2ZoVXdsM3c0a2VMVkhjcHJxbzFEK2krQVRvb052VjI1?=
 =?utf-8?B?ZzRmb1RSYnVINVZCR2p2elhQRWFXRHQ5K0svWlJOMDFyL1RMY24vMW5mT3pa?=
 =?utf-8?B?K2xxNGNLTWllcUNZRVRVSlNqaHZSS050RERGTEdMamx0bldmYVYra2ZkL2VC?=
 =?utf-8?B?blB2N0J1em9tU2lGZ3FmWUhkWVlvTjZiTFlwc1poMCtreDg3Y1E0cm53b0tN?=
 =?utf-8?B?QXFOME1aa1pBcFVIcC9aSGhtci9ucGIxblZ6UklINm5rUFZjYldzaFNvbmhH?=
 =?utf-8?B?MWxxWHViNU5CemI1d3cxSnpHdi9IeDhRTExXd3dpUHdaWTZHRTIyUGxFaTBW?=
 =?utf-8?B?QUJnQWlBYUcrOXVKMWlhSGZieUpJZmg3TmU5K1JhaERnQTl0OGt5cG9xYWd4?=
 =?utf-8?B?OERyYlBFaFY0UXR0SXNHQU8yUFE4MVo5VS9CUGx3Qlc0M055dTM3L3JBRDJy?=
 =?utf-8?B?eGsybjhJSzBkZUYvUmFrSURCMWh0RXVUaWlUOGpESWxjWWN0dEZITjR3MXgz?=
 =?utf-8?Q?UsiWCncYAc8pM0c1mpcG0y00O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f6f329-c706-460b-da9a-08dd767a0124
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:33.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFn16LnYlIbFQlIBMLWPpWnsFx4N1Fa9J0WjYpOLwM1iupkkWBNSwBvhCeU2UcEd5rwcySoeDtnqUT/Q1/T59Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI LMM protocol for linux to manage
Logical Machines. The driver is to use the LMM Protocol interface to
boot, shutdown a LM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
 drivers/firmware/imx/Kconfig                  | 11 ++++
 drivers/firmware/imx/Makefile                 |  1 +
 drivers/firmware/imx/sm-lmm.c                 | 91 +++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h               | 14 +++++
 5 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f830810f8ba376ece9db93c8cded6d 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT
 config IMX_SCMI_LMM_EXT
 	tristate "i.MX SCMI LMM EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y if ARCH_MXC
+	depends on IMX_SCMI_LMM_DRV
+	default y if ARCH_MXC && ARM64
 	help
 	  This enables i.MX System Logical Machine Protocol to
 	  manage Logical Machines boot, shutdown and etc.
diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index c964f4924359fcd375560ee8263021b0fe65db1b..70c092424328067ea6b946cee59f072661e27e47 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -23,6 +23,17 @@ config IMX_SCU
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
 
+config IMX_SCMI_LMM_DRV
+	tristate "IMX SCMI LMM Protocol driver"
+	depends on ARCH_MXC && ARM64 || COMPILE_TEST
+	default y if ARCH_MXC && ARM64
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide Logical Machine management features.
+
+	  This driver can also be built as a module.
+
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be878bb6dd1e6277992ff66ae90e292..7762855d2a771169d4f1867d27e0d51be7c9ad03 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
+obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
diff --git a/drivers/firmware/imx/sm-lmm.c b/drivers/firmware/imx/sm-lmm.c
new file mode 100644
index 0000000000000000000000000000000000000000..6807bf563c03d21a68022ecf3469c38bee4fc2f5
--- /dev/null
+++ b/drivers/firmware/imx/sm-lmm.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/firmware/imx/sm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+static const struct scmi_imx_lmm_proto_ops *imx_lmm_ops;
+static struct scmi_protocol_handle *ph;
+
+int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	if (!info)
+		return -EINVAL;
+
+	return imx_lmm_ops->lmm_info(ph, lmid, info);
+};
+EXPORT_SYMBOL(scmi_imx_lmm_info);
+
+int scmi_imx_lmm_reset_vector_set(u32 lmid, u32 cpuid, u32 flags, u64 vector)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_lmm_ops->lmm_reset_vector_set(ph, lmid, cpuid, flags, vector);
+}
+EXPORT_SYMBOL(scmi_imx_lmm_reset_vector_set);
+
+int scmi_imx_lmm_operation(u32 lmid, enum scmi_imx_lmm_op op, u32 flags)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	switch (op) {
+	case SCMI_IMX_LMM_BOOT:
+		return imx_lmm_ops->lmm_power_boot(ph, lmid, true);
+	case SCMI_IMX_LMM_POWER_ON:
+		return imx_lmm_ops->lmm_power_boot(ph, lmid, false);
+	case SCMI_IMX_LMM_SHUTDOWN:
+		return imx_lmm_ops->lmm_shutdown(ph, lmid, flags);
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(scmi_imx_lmm_operation);
+
+static int scmi_imx_lmm_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_lmm_ops) {
+		dev_err(&sdev->dev, "lmm already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_lmm_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_LMM, &ph);
+	if (IS_ERR(imx_lmm_ops))
+		return PTR_ERR(imx_lmm_ops);
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_LMM, "imx-lmm" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_lmm_driver = {
+	.name = "scmi-imx-lmm",
+	.probe = scmi_imx_lmm_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_lmm_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM LMM driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index 9b85a3f028d1b0a5287b453eb3ad8412a363fe6c..bc27b04afb2f68b048955f51c07a106f4c7e5852 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/errno.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/types.h>
 
 #define SCMI_IMX_CTRL_PDM_CLK_SEL	0	/* AON PDM clock sel */
@@ -20,4 +21,17 @@
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 
+enum scmi_imx_lmm_op {
+	SCMI_IMX_LMM_BOOT,
+	SCMI_IMX_LMM_POWER_ON,
+	SCMI_IMX_LMM_SHUTDOWN,
+};
+
+/* For shutdown pperation */
+#define SCMI_IMX_LMM_OP_FORCEFUL	0
+#define SCMI_IMX_LMM_OP_GRACEFUL	BIT(0)
+
+int scmi_imx_lmm_operation(u32 lmid, enum scmi_imx_lmm_op op, u32 flags);
+int scmi_imx_lmm_info(u32 lmid, struct scmi_imx_lmm_info *info);
+int scmi_imx_lmm_reset_vector_set(u32 lmid, u32 cpuid, u32 flags, u64 vector);
 #endif

-- 
2.37.1

