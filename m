Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735891581EE;
	Mon,  7 Jul 2025 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855200; cv=fail; b=QYcx8AHQbN1dmXunY/B4CWBJA0AOLhjqr7Ml6FepeDIpGwsoWsw2uQq7M6stQAnrF1jh697JMmRQuFaImU7Fon5JJy5mwwZY1+XOxkVJh4myNAukwge0XNzu8sO8NzkJEEMnFeVA2l/9JvAOf86HSUC3evw0Q5jAdyHpwkVqnVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855200; c=relaxed/simple;
	bh=MZU51n2apG9kgJGu2WhJZ8f6y1lOQw4bU9E9RTUdiUw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TqIrD0BcP/iU7ZAwVwnx7fEUCVJM5fGFjPsQESHmI6ZV3JcdcmgaQyyADo9d1Lg9fvemtHsM+67ld2cDqD9SUs6LNsulPZU0hCP0lJpPyxCtltxnxRW3yzGVJCPxwr9XyKZxC6JxJmK9MlDuSHEULvxhSlb9rvDWsF/b2d7+sUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lENMRjyI; arc=fail smtp.client-ip=52.101.66.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lENMRjyI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RB+Lt+fFAH7dX9WmlrCLr2e2N1sx9nnzSuY/d8RagsKFPh0dQDTfhSY8+15I6hb3j4sk0nAC7Ye5cQDZq/kG3ub/Yt8nvrqVhIkB33B2SuN1KcBaVu/XvQ1lDC0PWk1joBuK51u6XFJrZNXjhgGr+Qczrw+btP0Ij8J6FrYHZehXfFHRbN9FY0kPRNgO8XNRJ62odFP1btykn/K5ZwgFChTbve+jSv8pFGRbxnEBD0S+NQ4NpPwPGqx1ZgZottAa5xnZRaBDZ0w/LALYIduBXoeZWjBfi5Y2NrMYw7+wf+tWwee07w9DkCgNU4VSUd8hX0/z3X3FfBTXgmy8W88qBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dIChvuEPcCryssb1hdXsrDF2hBVP+vmJLBPu30KmAM=;
 b=hqQdM6bVSW8fxPDB0QmbDUHa7DYcl85qXDFT0uU5Y4irmPgEGiaQghq2GM+Mllhwox6v6rGc7d5EgUuxubSeL/nBWL4TMJpHUASOyCfQdVHGpLEWH4umYPOSSAEO2udQ43C/T85ei22maCV2+UhTZfB45gevGb0dUhGbii/OWEdq3s6VLtUKit+56JjOmiDtaLwAYEm4bzZrbZRSIewxa1UEHGtTFUpjCw4MJsPDuhXfEGUVB+eUsfge15ZmJcAQQKubUn+LHvNLDfa2YF8ZvViCboSRfxaXcbphKe5QaiQOHMy7vTuM++99Fr8tFJN5QYb+kxagVsqAE0asZ4Xnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dIChvuEPcCryssb1hdXsrDF2hBVP+vmJLBPu30KmAM=;
 b=lENMRjyIzdWoMHoRwEuLfbRV6jKSsUsH8uYTus6Pa1fneuoSS3o7HPqOWPvTNiywtmYigX2epXuvJpOyMQ/NOFNExd4sdL/2RaL1gq9nZFtYZ7K1bCS+uUORVGnd5FB4ZoEilWog6s8lfHuk9FOSIVwzBl38qjDTUUKCO1FcZ9ciSmpKw5OFVGmsS/RwbET4okI+wNaM6Dbt93fRsQMI+/alCzj0EQbP//ocGK+lsrSl1C3rz5eacoJhlb67s2J0Asjyeukxkr9X3T1afb+fdp1JvDXiwfJk8wc8mi29zNqFgpRctXXVQI4SjNV2ghgBgSwYSHXBk8GEjMiqcHpc8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:26:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:26:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 0/6] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Mon, 07 Jul 2025 10:24:36 +0800
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUva2gC/32NQQ6DIBQFr2JY9zcfiAJd9R5NFyJYSVUMGGJjv
 HvRTbtoupyXzLyVRBucjeRSrCTY5KLzYwZ+KkjT1ePDgjOZCUNWokAKblhUCbp/QjP3IICCVa1
 k2lZUSSTZm4Jt3XI0b/fMnYuzD6/jItF9/VdLFBAQjWZcGylFdR2X6dz4geytxL59/stn2ddcy
 NoIVXGOH3/btjfAM0Gn8AAAAA==
X-Change-ID: 20250701-imx95-blk-ctl-7-1-e9f82be61980
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
 Peng Fan <peng.fan@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=2361;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=MZU51n2apG9kgJGu2WhJZ8f6y1lOQw4bU9E9RTUdiUw=;
 b=pBtwQj2OmpuxBwCgMkSrSA+p7v8V7ybg9fUI82nk1Jz3QHIC8lJeJxbAbOd4B2OoVAb+NzyQE
 DisBsgpMNzqBPtUlHXykPizK/vMqp5fCGiBT29FwiiVI7PEE7QVoN5Z
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b24c155-8ce0-4dea-693d-08ddbcfdb179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUNkMjEzQ09LL2hZdUh5amQya3I1Tjg4a3dldzk4NlFIdER4c29zRnBPa0Ri?=
 =?utf-8?B?OUUzcTl4YjJIVDNmZHh1a3lKVnBlSWFBbWphUHQzTENVWHQwdlVvM00rWS9h?=
 =?utf-8?B?RXdNdkRFeUVBOHE3MHBkakp4ZHlnZ3lqSjJUZ0l4OUF0MnhwVjd3ZnI5T25X?=
 =?utf-8?B?Mno5RHJkOVVJMDUrTkxnWXRWUVN4ekpuRGxkbnh5OVhFSGw4czhGOUl3aU43?=
 =?utf-8?B?enpqamZKSTJYQk1kREhEdlJ1T0RjdmVOd3pmVUFyc1hXWVNHd0w1SHhFbTFj?=
 =?utf-8?B?RStyTm8rMi9KdmRpZ2VKRWlVYkNvUmFtVE4yYjdXcWxiSFRyeFJxSkxBQktR?=
 =?utf-8?B?Q0NMUFZiQml2ZGdCVnZCVFQ3U3g4bzlKQWFlNlE5aGVqYUQxS3E4NVllOWln?=
 =?utf-8?B?VmtsWVEweDF3YUtUZzZ2Wi9OV3hGUnpTWlZtaUJ6a2Rldnd6UDltQlVIL2ph?=
 =?utf-8?B?Z1pQQlUzUTVGeXBzK2xCaWhVTDIzMmFXVmlNTjhHdWZzaHNReDZWR2VhVjYx?=
 =?utf-8?B?V3ZKK1FsZnpueU5PbVplQUtiRE9PSTFSVnVUdDRXL1QwU1IrcnRNenlDZzJt?=
 =?utf-8?B?SVpSV2RuWVorMmx6RVFIRElFNWZVZkhzdTRqZnZSN0ZtdFRZc2w5U2tsa1NM?=
 =?utf-8?B?NVVCV0ozcmtGekwvOU5ldUFWSy9mUG84eEU0dG1pZ2R4Y3IvU3hQb1k3NWhR?=
 =?utf-8?B?N0s4UU5EZ1kzTTczTGhlRTk3WWhaUFVFc2NlK1hsaGZyRVlSc2RESVBEWE5n?=
 =?utf-8?B?UnpMaHJHMkNtTmJFSFMzQmtkRFEvUW1IVFUvMEhmbk9HdWJlUklKa1A5ejFz?=
 =?utf-8?B?NWFaVHhYVTJNcStjNTZpcUVLZUZTM0x1NmF4dFVQTDV6OTJmYURjM0oxUWox?=
 =?utf-8?B?SmlXeVBmeFFVWCt4Umt2V3VkYkZUOWFQd3hNZXRPSkJkQzRPTFFiSjRtUnFu?=
 =?utf-8?B?MXZzK0g5cGNnMlFoamgzdi9nRWFta0U0UzBYOU54TFBPWEVxQUYrOHJpcFlt?=
 =?utf-8?B?YWhUQWkwTFZPNkpJK3pYaHd1RHJXYVVsVVJnRlRTeGdwWk5RS3pIbEdxWVNj?=
 =?utf-8?B?UXJpWSsySVJmRnVFdjNnOElFRGxRQTNPSE5hbEJqWTdyMFNvVHJTRlRWWWNt?=
 =?utf-8?B?ZDg5UEV5Um1UcGdJeW5IeUVnM2Zpc25HMmlMOW1lSGlWMU83WC8wNGxJS1pG?=
 =?utf-8?B?REw3cWpXY2dCRE5OOGZoOGhMMUtKSzBlb3d5RlF2QThZNlFlYlprTFBrRDB1?=
 =?utf-8?B?cktRRy9SaVhhNzljOGc5QlRYaDV5ZjhsMktpNTNveXFjN0RnWlFMUVgyZlZW?=
 =?utf-8?B?aXoxbmMzVnU3bWlsWWZkK0RzRmxaMUZzUTlwRFlmK3VlVmlPWVhQYm02emlh?=
 =?utf-8?B?WUNlLy81bDhEUDdXY2FFU29wTVlBTEg1c0VNNDRMU3YwZ3NtWEg2MU8ydVpU?=
 =?utf-8?B?azZtS3RFSjZtZG1hdWYwR2RtQ0tlVUpNQ3Jsd3RDdHVRam8vS0JsR0JnRFJl?=
 =?utf-8?B?U0Q0Nk1LeG55TXQra0hyanJ6VUdTbzJIbWROVlNqNzR1ZUJKQWY0bHlDNEdk?=
 =?utf-8?B?cjdDeHVacUdMWENRUXN2REhDRHVYd3BFdko3dWJhQzRzWVRIT0Jrd3VYSHFy?=
 =?utf-8?B?Zldra3RXeHQ1VXI0ck41SzBuUzFYNzF6eSs5VFZVZ3B0Z1VpVVJ2b0xVb2xL?=
 =?utf-8?B?TEFicTllQnNZSjQzM0t2ZlJNblNTaEcrV2x3U3BIRVhJS1NxNGo0VUE4WjND?=
 =?utf-8?B?dVVXTWgwVG90YlVpTWJTNTNFTXU0U3BUSE9jOGt2NmxRTnNxN3FEdFh0WjRK?=
 =?utf-8?B?a2lGOGVycTMxdUVIQmRqdlNQZmdlY01LbXRVVWtWSnhIVEEzZ2plQW41d1BV?=
 =?utf-8?B?a1JnY3psTUZaV1gvZXovZmFVb2xzdWl5SDJWVFVFeVI2RDROSThlT3N3cDNn?=
 =?utf-8?B?ZmpZUzM2TVJ5QXlBeTBWeCtxdlB2elQ5bXZBT0o5WGdwaG9JbHFWVmo0a051?=
 =?utf-8?B?bGRRemd4eXpRRGVieUV3UnR0QWh3OW9BUWhqUXNMaTFyOHB1WDJlcXAyc0kw?=
 =?utf-8?Q?NHNn+8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1p5TTF5RG5hajdBNmhpSXZQU2RXRm05ckFIaTNaQUpsMGxxQVR6UkwyTWV5?=
 =?utf-8?B?aFE5SzNOYVcxQXRKTWxDU1k4QWk0eE50Q2dTSG5nUTMzanpvNGJtRDNHMU1G?=
 =?utf-8?B?V2N2UGgwZnZQeEt2MDBjci9yS3dYSWY3b1NqUFgwRm90NUJ0cElPYUc0Ym9x?=
 =?utf-8?B?Tkg5QU13cis4em9jU2RTL0Frc00rUFBUUkxOWm1QTitXdzI5d0JVaGpWSUlj?=
 =?utf-8?B?SFFiQkRPYVVVU21lRXc3c0VzbXUzenhUd0V1bnlKc3lWS2JoN3h4QjIvUms1?=
 =?utf-8?B?Y2RuNVZSS01vMFZOK2RHNlJKQmZOQWJTZFd2bkkvTCtPUytwKzJtQmFrbDNN?=
 =?utf-8?B?ZGl1OFhKcW9Pam1jQkR3UEZ2aUYzcUFPaFlqNmpxR0F2Nit5SjJzbUJyZ0xU?=
 =?utf-8?B?a3RSSEp2REtYNDNLZWl3cUo4OXlLMGRKSzVBSlNrS3d6UGgvdkg5UHhiTEV3?=
 =?utf-8?B?UUFUQTRpTzZodnM3TWhqbTlYTGJxS0lSZ21EQm5wKzNtcjFXeTIyRWlXRmFs?=
 =?utf-8?B?N0I5b2lsOXBSc3RpS3IxMEJXYW9yQWV4VFF5RnJ4Y1pRcHZCalFXQ0MrQU1S?=
 =?utf-8?B?NUtpc3RiSittQ2tCelZZdjU0Vjl5NnB0SWNSQUdvOW5SbGlGd0MveUkwREI0?=
 =?utf-8?B?Tlp0YVNIOURrMVFFQVRiVys4VXp6K01NclFhOEVKRzQ0a2czUmVIRXY1dEtp?=
 =?utf-8?B?NHJZZ3pxcnJ2MGlkeG5KNzhybEMzb0NiT3d0Y2RweGdqdk1xUERBRlYrTkRF?=
 =?utf-8?B?R1dYWXN3ZUlCUWcxc0hEQnBRUXM5c015d3J1QTJGYzZUTmNaTDZQQmR6NkJW?=
 =?utf-8?B?V2hvblV2bHl0Zm9LYUhrQTcyU0lzalJHSlJaUHhCOGIvZytlMlZ5ZXdOd2Ur?=
 =?utf-8?B?WFcrK28rbHgxV2JvWEFJcmZHVW16VFZCRVlFNERaSUEzNDc5UFoxcllEV3Rr?=
 =?utf-8?B?M1VCSFpBTVV2anhnaG9QYUhYSVYxNCtmcFlQNDNoU2tQeE1nelZtTGNhZkp3?=
 =?utf-8?B?cDBrb1M0dXZNSkk0R29aMWxtb0J3UXBvejN4VWE1YnhsTGhyRlVVUG9laitj?=
 =?utf-8?B?N2NKOGdsMEU3REZvRDZOVUVSVGdQU1VQRUwrc3NiMG5MTk44MnBNRE1oNnhu?=
 =?utf-8?B?UitIdFFkSEg5cWJxR1U0SE1NNWNtRXIzYlVlcVpCQy8wVER1bGxoM202d1pj?=
 =?utf-8?B?UzJFSS9nNERCWlloU2hJNWdBakk1TjJvcm1MeXJkdDZLdlZmU0c2MzRLMElV?=
 =?utf-8?B?MEJ2NzFBV1kxOXJxQ0hoOEcxZlNVeTI3eC81djJYYld1amhwYXlyU0d0N1Bj?=
 =?utf-8?B?S3p3NDdTTFZxV0NNa2phZWZKL2g4RWl1a1pXY2ZGT2FHLzk0YUF2NUsrL05z?=
 =?utf-8?B?WDZLYThGWTZJbzZVZmZxelRheUxBTXBoM0ZYZkQxQnBKNENTNCt1SmRkL3Nv?=
 =?utf-8?B?VUhGbzdFdjJVZmZDSHB4eXB6cmhWSlVVL2swWS9OSUFuTU1paWVZRUgvditu?=
 =?utf-8?B?QXR2VElNd1l1R2xPdU9JL3FPTEJvOFBtaUFaWnNlL09saElaSExOMnNIcFhB?=
 =?utf-8?B?T1h5cjdEUEx6dDdIenNSWFBqTTlVVWdkRzl6eCthbUczRU5FVys0OTM1OGFk?=
 =?utf-8?B?QjRRa1ZXT24vVGtaUm5MQ1VaTnRtcDVrckFDNFRVTmxaZDRGTWZmYzcrL2NO?=
 =?utf-8?B?Wm1RYzJaeVpLMXU2elJWaXFuZ1F5c3lCbEFVSzBUVzA2c2VwV1NhVlJsejk5?=
 =?utf-8?B?TUczZkVJUURFTURQWHVKendacVhuVWttM1h5bGYwS1lBLzdUVnRaN3VUK0pr?=
 =?utf-8?B?clNpYTQ4RVJtVktoS1BmTXBJOEtJRFM4RHhuQ21tRXBaYXFydlZlMUVXQTF1?=
 =?utf-8?B?bnRLeTIxbHprMDFtajN6a3crMjBMdXhOQU92V2NhNm1pbERaQXlRNTk1S1E1?=
 =?utf-8?B?cWxYa25OdDFDMlpPeUZTQ0VKM1pFT1NheVBmeUJRbHhadTRTMGpHVWt0UDc3?=
 =?utf-8?B?aHUrS3JSSDN5M3VoS3A1WldBbmFHUW4rMWZreEgya3VrRWIwWDFTRDBjNmdp?=
 =?utf-8?B?akFGb3dDU3NkOE9NcE1CN05aQ1dXeHk1S0U3ZndoQ1BLUjRBL253RU0zZkxU?=
 =?utf-8?Q?0n0Qy1HIFQ2TYaSP8U0/c+K9t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b24c155-8ce0-4dea-693d-08ddbcfdb179
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:26:34.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkzLuThvvZQd64LR3stjFtOwIArZg57ue+WjDgwkNb5n8ApvR6lcflrue2nrHyAFAzwV4DaIG9iwKygY8IjD8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
clock gate for LVDS and DISPLAY Controller. So following same approach
to add the support, as what have been done for i.MX95.

Patch 1 is to add the binding doc.
Patch 2 is fixes when supporting i.MX94, but the issues are
also exposed to i.MX95 even not triggered. No need to rush the
two patches for 6.16.
Patch 3 and 4 is to add the clk driver. Patch 3 is almost picked from
NXP downstream with a minor update. Patch 4 is modified from NXP
downstream with a few minor patches merged and updated.
Patch 5 is the dts part to give reviewer a whole view on how it is used.

Thanks for Frank Li helping do NXP internal review for the patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Add R-b from Abel and Frank
- Correct License in patch 1 to add dt-binding
- Address Frank's comments in patch 3, 4 for compatible strings order.
- Add a patch to update MAINTAINERS entry for i.MX clock entry
- Link to v2: https://lore.kernel.org/r/20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com

Changes in v2:
- Correct compatible string order in patch 1 which add dt-binding
- Sort the order of of_device_id in patch 4 which add i.MX94 driver
- Update ldb pll div7 node name in patch 5 which add dts nodes
- Link to v1: https://lore.kernel.org/r/20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com

---
Laurentiu Palcu (1):
      clk: imx95-blk-ctl: Fix synchronous abort

Peng Fan (4):
      dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      MAINTAINERS: Update i.MX Clock Entry
      arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes

Sandor Yu (1):
      clk: imx95-blk-ctl: Rename lvds and displaymix csr blk

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  2 +
 MAINTAINERS                                        |  4 +-
 arch/arm64/boot/dts/freescale/imx943.dtsi          | 34 ++++++++
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 93 +++++++++++++++++-----
 include/dt-bindings/clock/nxp,imx94-clock.h        | 13 +++
 5 files changed, 122 insertions(+), 24 deletions(-)
---
base-commit: fa643a3813b6df6356b86e1c8061e2dfd0c99746
change-id: 20250701-imx95-blk-ctl-7-1-e9f82be61980

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

