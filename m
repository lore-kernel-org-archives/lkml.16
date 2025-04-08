Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B3C266B53;
	Tue,  8 Apr 2025 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102064; cv=fail; b=ZTPo6EedCtjhIPRD6vtUUFMAMc6qhxXSSMkZoSpLi+2y4V0O8921Yok0CJgzMwgCKCQ3MD8hpFwDyvA+L4UzA5/NQFLAlQEYCwGsmSaxL0gIJfIkul/YoiYbZiE+oK+2jwAfRGg6ob7ClK4KdoNl4ugF7OP+m0pksIiNrMkooC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102064; c=relaxed/simple;
	bh=jWzSMbbw/V/IvQlEKNz5imWYW++iVwi3sKNU6k9Sy9k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ut9C+0zD1+Lx0IuFvlsL7nOaHcTVhfFXKq7+MSaGUWwKxpMfAPqdZeWnhuOFWWTFRkpAPPXpOlgX/sez05Lya1NQH79rXKYvS2smPZe+x6o9T2Y3CKhR5Dt8Yb+BLLhg83RBqlgJNVTEqn5fZDodt+kHn/+EUl/fe6Hlf6PgU+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DFD9qdFz; arc=fail smtp.client-ip=40.107.20.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DFD9qdFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjwCPhQjvFDOV9PpjSgRJRjkN1eWtPHrH0I67zYbMgreeviwoC16MfOrlmNvLMQKok1bHKRbJmEbeRh22B/trVanIHnl/qS+H9RdOayih+PNzYtFCtMoTUFrbzUJtn13lI10ARnNeD8t874UNFbEma6o7P4VnNf+nrdBxCmQezZ1yNm5ryf++hds0OIOH1MmNUwnv+1ezBT2GrUCacYguJmcMStGaNwS/GOxcidNL/HMDYF8dWy0gI6MetMrcAiyR3DjtEH+NsYFJJIsSksYhE04dzyojqrGiMDoKvlxH8ZueQW1NkpF/BnjlArmbet5m1MJSbd1Kirf/v1y3rOnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ac+LIaNTlRnQqO1fU67vqU8uKOx5t1BpaaxTUT0XLLs=;
 b=XtjnNBQ7VnWYvdd972sYmHEKLz4B1QcVbYa8dK/MqtX6DYFa9D+A2tb5dLAUv4aZoNtBZDrHemHxOqM2WiaZ+utGMQcEit038DmJUdRmnSOp4+9VK7IXtjqJ5bhLBVdYYKNGmvhBkiku1FanG0YHUKxehu6AeNHqi7kKqtPDbhRsIHQ6GecQzN199XDUos8JT9A3KGgrQNGAqAZaRRocLYMc4nLRNrW2sWIn8xbq5RaFTg6ikci2DrI+cD+/RqonVyHbWL2JGU/IPGN/Cpx+JlEikzYG43I/682rBoqC/ipWu0sbLbK3TDvdcssHINZkk51GAeCQujAMjmBUxZLu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ac+LIaNTlRnQqO1fU67vqU8uKOx5t1BpaaxTUT0XLLs=;
 b=DFD9qdFzBFba15l2U9EOm+9yWYEZ0WrlrhQHTI1vuTVprbvLOC9D8jkku/EVtSHyPcwejJANcEwTF8rGjJfgJQ5iwnCb/VY7iNfIHwFhICck9ifvLXnP+PNkO+IkfMhsToq5qasVz6dHYxTWO7sXztEW5lR+SnSPbiUVpopXIdvFTj5v8SqYb318RnlM+kHYZxdn1l5DpKSPhsK1SsWAaD8Egz7ClGiC/iZlW0Qt9ARXSVuLywSrHFojeKOmSuVhmg8yG6zqCGDp1Mm7gR3RXGnMk1q5upe2panR9PjuMmbKRvu6lkMSdIdoLZ2DEEQ+JABjzyhd32OnbCnoCjEQNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 08:47:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 08:47:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 08 Apr 2025 16:44:30 +0800
Subject: [PATCH v4 6/7] firmware: imx: Add i.MX95 SCMI CPU driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-imx-lmm-cpu-v4-6-4c5f4a456e49@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744101964; l=5763;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=RAeXl59ykXx6Jn2tPWjZDrCKA+vTZRM1MrRBDtexg3o=;
 b=s747Eb+wJbble6RmKedYQ+Pz3gxHO3PesCJaspYxdnoyNW3qX6zj2Ag0KhU2jipI8Z7HgX7Ca
 CpofjeD/1IWAekQUydAJ2gmC411G+P2NOmiekvlFrc8ws65M29VPKvH
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
X-MS-Office365-Filtering-Correlation-Id: 67646095-270a-4632-c48b-08dd767a0401
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3BPOURjd0FwWGxVY0d0bGxmM1djaEtwRW9PWTBmNWF6NWVvd0VqdnBDdUx0?=
 =?utf-8?B?U2tJVVc0L3NuYzNpbEtSVUhKSEN3Q2U2dWoyU1FUWXJuakZCMmFJRW9tNlNT?=
 =?utf-8?B?YXUzRE5Bakc4d1YyMTQyVVk5T2FaRnlvdE9QKy9tOWZOcW81cXRtRmh2aDVu?=
 =?utf-8?B?b1MzaWFFOXdUU0xzdVh2cWdQTS9uZlVXdmd0eGNWbHhaSUpiT05IajRRc2hO?=
 =?utf-8?B?WjZTWFBDRHlaTnhQRWNRWWdUZk45ZEZlbjg4UWo4MGs4Q2RRcTlTVmdQSGw5?=
 =?utf-8?B?a1lQUFNvTlY5RXFubVZJamgycVhKMWVFU2FlTzAyd0dpQzlDMU1aM0V1STRN?=
 =?utf-8?B?NmphSXkvZFYxQkVQaGg0SjQzMVY5RzFpeHBkcEtLOWQzZndXcjBTcjM0V0Rs?=
 =?utf-8?B?MkVSNEtNZXFYQVREOUxsUSs2VFhuY1pMeTNDeFl6MlVvSUtaSEFOQjR5WVZC?=
 =?utf-8?B?Q005T05MQW9mYnlYZGc1TnA4MVltZklzTnFwbVZCcjFIS3J4MXpBVHc3M25x?=
 =?utf-8?B?eUYyVkJFUG5mZUY0d21lZnV4cUxvREJkY1NPY05vWmkxV3Q0U0VrZkVlREJM?=
 =?utf-8?B?WVVwNGxQV0F1V3BzRStQOVM3b2tKWjVUbWY4K2krdDNMbC9OeHAvWFJqZHBY?=
 =?utf-8?B?UzhaTUhrZC9ybUlTUFF3NDZIZmZ6bHhNR290QkRWYS9wNWZGRnhvMHFQc2dq?=
 =?utf-8?B?cDdTdCtmQm9QTVV3ZkJXRjc3aVJkQVdEaGh1ZFBEdytTNEdzRTN2TXBXVDB0?=
 =?utf-8?B?dzY4NGxqY25KbnhjNHNpTkJmMnI1VGZObzBSbE5tWmNua3VLUVB2Z1IwemJV?=
 =?utf-8?B?ZXJuL0xLMURjVDVuSnpPZmhVZFI0d0VzQWtmL3lHTldFbERKZUUxSlg5Z0d0?=
 =?utf-8?B?Y29seGZnMlZZbmJsbmQ4NVBmUnl3dWNYYzlpTzRPYjloeGFEWE5paFM0VktH?=
 =?utf-8?B?bFZ5ZllKRjRja3dWUytTTExYME9IeTZneWVoMUxESmZkaUtvcG1XK2xWaEw3?=
 =?utf-8?B?ODdaUlhwUW5nM3h5ckZWMFRqOGZKVHdXWVo4YWV2YXh5TkxOR2VWT1BWdGRL?=
 =?utf-8?B?Mk8wcWtwZFB5cEJpaUdvQ25vUWFZMVA0Mnl2N1VNbG1DeTIvdnpiYThUSk5P?=
 =?utf-8?B?R25ZcnArZ3F4VWpLckdoL0RJVVBJTDZJY2prSFhaNWFHdjM3N1ltWDI4dTNk?=
 =?utf-8?B?bjlTOWtOU21uem4xRU9IdVhLUmpRWnA1L2JBRjVRWmZrdmNycWpEOEIxd0RU?=
 =?utf-8?B?TVJqV3lCWStHa3ZTN1l6QUhXVUxsZkNFMTdLZElSWVpWdUtHSlZNcC9PZk5p?=
 =?utf-8?B?UzUvT2taNHNnd3g0MWErTVRHT3VaMUZoVExxcmRvbnBsY3RQYWN5NlA0eHZs?=
 =?utf-8?B?bk1LcFBmNmU3R2tMTmJjK2lYS0lYV3EzMjY4aTdVYTB2bW1WUTM4S3h1ZG5j?=
 =?utf-8?B?V3VUUHBLY3NRaWhKWHlhV1ZXV1h5cVZ5NHBRL20vcUs2amprN2N4VG91UFRW?=
 =?utf-8?B?YjZvVHhxNG1EaElmUC84UXozSHdmaWFPcjFrTEdIcFpsYytTc0o3Z0tYMnkv?=
 =?utf-8?B?ZE1Ta0FZMjJwTG12QTNJS1Y2SCs0blhWU2xUbEhNOWcvM21yZXZjdlF6Ullt?=
 =?utf-8?B?Yk0xNWxxK2JtM0pFNVF2WlhZVkIzMUs4OUQ0aEVPcms5ZzVESDhIVDZTUlJ0?=
 =?utf-8?B?WjhPS3dqUWhzMzhkZHFydXhQVUVDK0lqcWs5V3VBNFJmbWlsZmord0ppbFFx?=
 =?utf-8?B?NG1GUmZ2OW9oWHl5NmhLc2FNR2YzVXVZVmlXUFk4YVV2S0NXV2lHZEFOWGJo?=
 =?utf-8?B?bjJUc3BwMyt3NFk1K3NvMDhJSmNLZzl5NFB5WHB5RGxuQktidHVxR0RUZWtI?=
 =?utf-8?B?L0RGbW1ia2hEcWNFa2JYVFUvV3NUaVF3K3FGMlVQR2hIdE1OakZ4VitUODE2?=
 =?utf-8?Q?1LYHzEWmRi3M+kZihXmPfjbOM+IISVFn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VExBeDRjWk1wL3Nuc09SMzdUU0dFVXRSdmJMQlMwalNkYVlNZ1ROa1YyQVhK?=
 =?utf-8?B?aThJdkNoN0lmdHdXWkMycHViTEFnb1FuNXA2QnI1UXBOVVpBNGx0WUlXRjR6?=
 =?utf-8?B?U0ZIdStMbU5RWHE1R2tFdHU3czdlNnNqNTZOUXFjVXpSbVJNd1NHdzEvKzNI?=
 =?utf-8?B?R2FMZGJCdmNpZHZrSDl1TzU2MUdFTGZOUmt4Uys3T3h4RnlVajVhWHlxRDhj?=
 =?utf-8?B?ZWRzSjdvUm9lYXYyM3pQcXZsdW55ZUV1aFRNSVV5OW5GZjBkR0FiVmFGMjhy?=
 =?utf-8?B?ZzZwYzVlYUYzVWsvWThhcHkwMFhJelVERFc1MytZdFhNcjBUQ0FlaTY2MWgz?=
 =?utf-8?B?azZHc0NnR2huZXo3eTBZNlpaVFFHUEVocHhWSDUyYnVtcUNua3o2VzlRa3Rt?=
 =?utf-8?B?d3BCeHNqMTVzb2RONHpUbjQ1Q0hKNWNoakk2ZWg2enMrY3l5QVc0L2gyTXU3?=
 =?utf-8?B?YllxbzVGcmlQTVpmVlZ1dlJNcE1TNDdaNmFTUWVHYjdPN2lLNjdaUDU3ak1w?=
 =?utf-8?B?cFE1YmJNejU4cjd2SitKVFl6TkZRL2RBMXJYSXBRYXdVa0wrcER1R2Rybkxs?=
 =?utf-8?B?TU9UVXUzb21SOWpWb3dvTlNPWmxlMDhXb2FHbU5TRWRqeFhUZDk2bzRVOXRt?=
 =?utf-8?B?Q3F6azFib2FaZytIZG1tMHRtYU1VQ2JaNWVseTk3Y3pSZmh5eTBzSWNWeDdM?=
 =?utf-8?B?YnRqQlZiUXZiSlVtWitRYlVCRUR3QUlsbEkrOFE1MzVmbFpkYmRDTHFFTlhl?=
 =?utf-8?B?L01URGJwSGNVeXFuRmtKV0RsZXRFcElvQXF0Y0ZiZ0FVZGxHa0pjR0hKK1F2?=
 =?utf-8?B?R2Z1U3h0cTRoOTg3RFIzUTVlYVB2QkkzVkg0Uk1Gem1MRlhaK1FOTjRvR1NJ?=
 =?utf-8?B?UVZqNmIrUjhFMG5pMTRaV1gxajNUeDJ4NHZSNlpBM0hwTHYwbEtJTXpvMnF5?=
 =?utf-8?B?Z0lyY2xRWWVkV1Z0algrN3FCRm1QOVlGaTZkUlRUdXRDQXF6cEZwaGR3VGJD?=
 =?utf-8?B?TEZqQkRndXprTzViRCtCc1hmOU9pUjNSY2ZDZlUwNDlKcTRYN0VxazZvMHlJ?=
 =?utf-8?B?MGlwSG5EcHFNamNORWdhQXliQ2tUQVMwb1R4S3k2V3hHTlE0YS9GZVJrdlIy?=
 =?utf-8?B?Nk9INnVnR09nM1M4TE9BdkdQTHllbkZQUklxR1pqTXUvVVpWY0J2c3R6b3M4?=
 =?utf-8?B?Sm9xQmtuajFrR1FPZlZPMnY0MnpzUnpFWkErbnNadGprVHMxKzNlcFNwbzBl?=
 =?utf-8?B?WGRqK29za2JNNUdKWGdGZzc5OG0rNEgvMFgzTUJmWDBwQUc5TGxGRFV1VzM1?=
 =?utf-8?B?dm5ObzVRRFNTUGV3cDVJSkZGa3hJZ0ZoK2N2UmJBYjU2dFlEL1M3a1diUk93?=
 =?utf-8?B?aVovQlg2OElyUWtYYm1Edk0yUGVKcDh1Ym55cnVCVUt5UENiTFZDN1Z1eW5m?=
 =?utf-8?B?RWgxeUVHMk5vNVQ1MkJ4K0MyVk5MOXZkQWRWQmtLYXhTUzRMWnh5UlRwN0xD?=
 =?utf-8?B?b09BbURDSVo5MXk3OEV0eWtmbjNZd1BWdUFjMFIxYXE3UktQQmsvS29YQ0dJ?=
 =?utf-8?B?RnpDRzZwTU1UL25MNERkM25QZ2FmeHQ0VWdwTFY5SC9WdTIyeTJRVi8zS1Jy?=
 =?utf-8?B?Z1ByaVVmTFFzMVFWMjg2ZUtmMTRhdHlSR3ZSZVNxQ3czQjdnYkFveGI5VWw0?=
 =?utf-8?B?ekYwdEhwVG5wTXdQbGlhZzc3YjR3Snlub3FTTTlaUDE3cGhPbmR5OEZyaUQ1?=
 =?utf-8?B?WU5VQTlFNThKZVZFWWdaY0todHhMNGN6K3M4MWRCNHlqbEJIS1hMUWVzeTlu?=
 =?utf-8?B?bTA5eEthNDZTVVUvZ2V3RFFPYUdxVjB3NktiWmZIZlczdmdDSGxCSDk3amU3?=
 =?utf-8?B?b0w1bzRreTFXdXBKbHhLZVFNRkdMSVpueUNUNmJMT0Y2a0JJZkNjcFVlRkcz?=
 =?utf-8?B?akNReDZXbjE0bitycnNEcG03dGlMMGRMN0JjNVg4bzlzSWlONTBETGtqSnpy?=
 =?utf-8?B?R0RDZTB1SWhBN1RvcW1VaVhYN21Hak4rVnl3YUJadlptWm5hWVROMnhjWEpk?=
 =?utf-8?B?MEllZzJyVVYrOEJTcXBLY0JrL3VteDNtanRDQTJNZzFVdkV1RUZKUzEraHIz?=
 =?utf-8?Q?1JlaTTyAFNKUuCQT64hdLbs8h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67646095-270a-4632-c48b-08dd767a0401
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:47:38.2888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2O9Ykyy8I5weTk8ir5QSLUYVx7c0wOZz8j19wQ39+0j1SJRN5kCPQgBXsSDw03mO3rfD0JhJVOuF3wVsgNLkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063

From: Peng Fan <peng.fan@nxp.com>

The i.MX95 System manager exports SCMI CPU protocol for linux to manage
cpu cores. The driver is to use the cpu Protocol interface to
start, stop a cpu cores (eg, M7).

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
 drivers/firmware/imx/Kconfig                  | 11 ++++
 drivers/firmware/imx/Makefile                 |  1 +
 drivers/firmware/imx/sm-cpu.c                 | 85 +++++++++++++++++++++++++++
 include/linux/firmware/imx/sm.h               |  5 ++
 5 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index 4c24e17425f830810f8ba376ece9db93c8cded6d..9b4339b93826804599371f2e3a2e79f27449582b 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -15,7 +15,8 @@ config IMX_SCMI_BBM_EXT
 config IMX_SCMI_CPU_EXT
 	tristate "i.MX SCMI CPU EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y if ARCH_MXC
+	depends on IMX_SCMI_CPU_DRV
+	default y if ARCH_MXC && ARM64
 	help
 	  This enables i.MX System CPU Protocol to manage cpu
 	  start, stop and etc.
diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 70c092424328067ea6b946cee59f072661e27e47..8236f81e054ff43c5fbc660a67c53ea9324ab402 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -23,6 +23,17 @@ config IMX_SCU
 	  This driver manages the IPC interface between host CPU and the
 	  SCU firmware running on M4.
 
+config IMX_SCMI_CPU_DRV
+	tristate "IMX SCMI CPU Protocol driver"
+	depends on ARCH_MXC && ARM64 || COMPILE_TEST
+	default y if ARCH_MXC && ARM64
+	help
+	  The System Controller Management Interface firmware (SCMI FW) is
+	  a low-level system function which runs on a dedicated Cortex-M
+	  core that could provide cpu management features.
+
+	  This driver can also be built as a module.
+
 config IMX_SCMI_LMM_DRV
 	tristate "IMX SCMI LMM Protocol driver"
 	depends on ARCH_MXC && ARM64 || COMPILE_TEST
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 7762855d2a771169d4f1867d27e0d51be7c9ad03..3bbaffa6e3478112638ed031375602389f18ef09 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
 obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
diff --git a/drivers/firmware/imx/sm-cpu.c b/drivers/firmware/imx/sm-cpu.c
new file mode 100644
index 0000000000000000000000000000000000000000..091b014f739f68d815d71f9b53a2a7eaf0bd607b
--- /dev/null
+++ b/drivers/firmware/imx/sm-cpu.c
@@ -0,0 +1,85 @@
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
+static const struct scmi_imx_cpu_proto_ops *imx_cpu_ops;
+static struct scmi_protocol_handle *ph;
+
+int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
+				  bool resume)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	return imx_cpu_ops->cpu_reset_vector_set(ph, cpuid, vector, start,
+						 boot, resume);
+}
+EXPORT_SYMBOL(scmi_imx_cpu_reset_vector_set);
+
+int scmi_imx_cpu_start(u32 cpuid, bool start)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	if (start)
+		return imx_cpu_ops->cpu_start(ph, cpuid, true);
+
+	return imx_cpu_ops->cpu_start(ph, cpuid, false);
+};
+EXPORT_SYMBOL(scmi_imx_cpu_start);
+
+int scmi_imx_cpu_started(u32 cpuid, bool *started)
+{
+	if (!ph)
+		return -EPROBE_DEFER;
+
+	if (!started)
+		return -EINVAL;
+
+	return imx_cpu_ops->cpu_started(ph, cpuid, started);
+};
+EXPORT_SYMBOL(scmi_imx_cpu_started);
+
+static int scmi_imx_cpu_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+
+	if (!handle)
+		return -ENODEV;
+
+	if (imx_cpu_ops) {
+		dev_err(&sdev->dev, "sm cpu already initialized\n");
+		return -EEXIST;
+	}
+
+	imx_cpu_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_CPU, &ph);
+	if (IS_ERR(imx_cpu_ops))
+		return PTR_ERR(imx_cpu_ops);
+
+	return 0;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_CPU, "imx-cpu" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_cpu_driver = {
+	.name = "scmi-imx-cpu",
+	.probe = scmi_imx_cpu_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_cpu_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM CPU driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index bc27b04afb2f68b048955f51c07a106f4c7e5852..a8a17eeb7d907ef8ac074c4ed1d3ac83f1104627 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -21,6 +21,11 @@
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 
+int scmi_imx_cpu_start(u32 cpuid, bool start);
+int scmi_imx_cpu_started(u32 cpuid, bool *started);
+int scmi_imx_cpu_reset_vector_set(u32 cpuid, u64 vector, bool start, bool boot,
+				  bool resume);
+
 enum scmi_imx_lmm_op {
 	SCMI_IMX_LMM_BOOT,
 	SCMI_IMX_LMM_POWER_ON,

-- 
2.37.1

