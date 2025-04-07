Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415F21D3DF;
	Mon,  7 Apr 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023468; cv=fail; b=kcYuvomxVPj/TUltrE/eUJ9WTz8XBfranj5MP6DrZXbfCh4c4JRTQBaMyOO++H2xh84QnB5f/h5SqXG5mYg6E6kyHy+llt0lux62iZORK9LbgpCNVzcobGiIRZ5coq8CcOu29Sjse5ViqHuAsPM26GMoolW5Pz4tQx/wLUaGrX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023468; c=relaxed/simple;
	bh=pS//50BHa/Q8/uV/EPH6Ev7uq9bBTKuoXm4eJqLYR9w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PHY/DUdyQz5uygQ5uOP0xb9FrhOzPsrNYKziK4hAbPa/zHVQLGvzrOPYkDeDHZkjPo4lvPbBN43o6bx6mdIqxalBG0MhBLyqBD4/2hcv3goI/jh1GYKJyVOMnRNw+8TbZt9GKX1qtFfsX2AOOgu6EOnBDhd2OBkb/CA+lQyamI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kYGp72EI; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kYGp72EI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUQlBzvaWD/BxMcn86s8iOCY05ibeEVBiUII4EcY3gr7d0sh3vLtmhuF37IHqQ4ww2dGu1F+pkJveZLM9SEYBSRHPtSsKJS/5rvRy8psX5s1YtYrpxu2ireVjr4dFENUdFYMl6fxQ0218LaxnK1gdqFHm/D2pL9oRD2vF9NfhTzxDQkzwxoEfo135epPpV1sHpfPkKmMOouGPzQVys9OWB85JCAcWtj09WBpEUyFGmtfeIzCYy2pWr3tlH/crTix1ADHsekEoUJaJdZkTcLbpzbVYMhJ3qMSsPJ+rszJawtSoon+yNGSeSW1SKr185flcpHLY/tS9ZBjeWik5IgiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCzFj4nrTzKnvMqs5VdUnDQw6FAw9hRqlswPTZi9QOY=;
 b=Lerw3JKd//eQNjuhNC9mOHZ3mH3SkdVLDgPNG5+Zcal3bUrg1L/U4SzguU2pH+m1UzF4Q01w3SFYoxcqb7P/A6Ky7Mpo9F1CBOk0xAq5hO5QmDWXxkVm6/iXkR/xe9I835Sdd8j1MUREq3PwUftOKse3S55PBJixXhblFWOQ9RqQUVibgYAFc7VLI7uLjSC82uciq1YUzRaE/PhpWdYLdZniBPvhFOaw0tx94aGTToDd6dOqtPdEtozcYu8nbPbyAnCFck46LEZEvno2vN8QK/kUNdFI2mSS+50sgURVMEqLsMi1FXLOK6EPfsLtvFCGIYXYSV3fyem+44oOoexrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCzFj4nrTzKnvMqs5VdUnDQw6FAw9hRqlswPTZi9QOY=;
 b=kYGp72EIB0fLTPxJHTPCDR/88WEp6f6HtLYVaJE9zlyTosh1va9uGTicaDa2yLFID02vrMUySrq2E/3n2HxqmBDTqzTp2txMjuhEjYXufkIheqYGZOAR1nklY9UKd9ACMQvza1O/3l5yk2UBxZt04TDl+BON1oTmu4Dt84Sg3gi4xzeQqINqPMywYaaImF6Zb2ZtCWeHErZSu+AVSAWlBbt2lWjP6UpRh9MuZazWLwDRJLk4ba9LOdTwe3xhum/nNKnUED7VFl2E1rx3veN2nuBHvpp1sFyiIc0FjAb4e+mabCpHhhGssAHfpWb+326mBy92CXWOrb0gs7FatiFfJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:44 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:44 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 07 Apr 2025 21:50:22 +0530
Subject: [PATCH v15 6/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx-se-if-v15-6-e3382cecda01@nxp.com>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
In-Reply-To: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=10297;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=pS//50BHa/Q8/uV/EPH6Ev7uq9bBTKuoXm4eJqLYR9w=;
 b=IaG8r3Gd47ZR+Xjj2g4xo4uolUr3dqPUvBz9ryXaZQoZ3rmuOUbdn5BFz2+EkgVoOlRSvYDL8
 HcAm/Su6giyD1xdchTc7AbARGenicMZ8mPuZ1vzOuqL9SfreNbsyIgt
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf06a97-3894-4a7b-ffb5-08dd75c30678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0ZTUHNoU1JVMHVRWW1DZnNuUm1Nc3VsVmtEdzA0clVpTk1OczZTcmZ2V1cv?=
 =?utf-8?B?aGNvMHlnQzlLZUdUSjFqdXRXaGdjZ0diMmtMMDVtU0JmR2ZlaGprSS9kdmRv?=
 =?utf-8?B?eWdyRkJLWGZXR1JyM2Y0MHRZcXpUakhsTnhNaXFmYW5iOGN4akV0d3E5TUFu?=
 =?utf-8?B?dXpFZTVBZ1lWdVQrZ0ZSMFI0R1M2MnVqR2pmYmRjVjRsbktIK2hldGFDQWVM?=
 =?utf-8?B?Ky82VEkwVjBMUVZsbVcvM2FIL2ZNeU1RUFZ2V2loU1BhM3VCSFBESFFtTWVL?=
 =?utf-8?B?YkkzUmswMzl0MGtteWR4allyV3FmaVVKeU8xMzk2SEhlWU9aMkNtZHpRdTA4?=
 =?utf-8?B?REVXWTBkTzFjYlkzc1BXTDY3YUFZR0RLUVFxeG5rdFFOL1FIdkVwSUswT1pK?=
 =?utf-8?B?NHhvVU1YV0s1OXo0UkVVUjlZdUQ3dVV1ODJuK2xRankyWFNaRXpNWmNDaUpU?=
 =?utf-8?B?L3RHMzVmNGI5WDF6RFFzSmZiSy94RXpVTWFoelVISWV5QWljUk5xY0crY1NP?=
 =?utf-8?B?bkMzU1BRODE4WnJUMXAvd2x5QXFaaERoY1Z4c3BsZEd1ZU1yeXRlRmxvSlZ4?=
 =?utf-8?B?SGVHTy9EWlJJYnVJZU1uamorQzR0VFhtdnIrRjF3VVBDTGc2SXlUVmpmZzlH?=
 =?utf-8?B?SHd2clhjYk11dC9tNkhMM0xmb1VUZkR5cXhlTXhOL05OdlRVN0t4RWpwckMz?=
 =?utf-8?B?YS9vc2tHblVqYTF6ZHFtQkI0d0dLa3ExL2VoNnpIc1h6eXZ2dng4WFVLWlVv?=
 =?utf-8?B?YlRaOXBjRmt3QlVqZDU1cUJwRTZtMHRGYlZRazh2WnpabzhJc0F5ZVNDcTZH?=
 =?utf-8?B?MDlBZ2wxKzIydGZaQWd6aFNqSjMyVjZwVzcvZW9xMWlLZ1hoNHQ5VjJpNUY4?=
 =?utf-8?B?TE1mZTZjbzlGbElNUUhCbXpwbjNDY2xPZHBoYW1EZXhVQmpTU0VBMGZpWkJ0?=
 =?utf-8?B?a1ZFclNWN2pGTVV0TEZkZ1BiWmRTQ002enFmajVlMDBKM20vTTQ4akpxb3V6?=
 =?utf-8?B?eEJpN0p3eHpzeml5ZStVL1NEVG83RGc4YkJMRjg1RjQrVEZyZzcxV2JkUmV5?=
 =?utf-8?B?dzFTRHpheHBCUzZ1ZnNObE8ra29taXZhTUcvK2h4bEE5OWo0a0dqQ2JGWmVx?=
 =?utf-8?B?V3FlN1AwNUdlaVFrcEgwa0ZPNS9VNlFTUjhyd2N6TGd4Z01CaWU3Z2Rha1Fv?=
 =?utf-8?B?b0tVTm1CdVJBczlMaWRRVUo2N1Yxd2pWRTVzbUJxNTkyeDVGRitidEZrRVZ6?=
 =?utf-8?B?OUxuUjZjeEpIb3JsNGRWRnl1MEdPekoxN3VBSnJLT1JjOElRUHIvWjN6bkRu?=
 =?utf-8?B?bGxZZHZEUDFnMXVkbXJLbXBJN1RKZ3N2dWNsN1ZZMkJaQWRjVUtiTUwrMmk2?=
 =?utf-8?B?UlVlZFRaTXg2ZjdweDhsS0daaDMwb1JJTjNxeWpBY2ErMlh6bVlBWGtvUDhW?=
 =?utf-8?B?SGU1MWVZVDlnS2ZxR05SWGRIeXFiemlkSTBVS01xNStJOWdGSHVON0c3NEpr?=
 =?utf-8?B?RUQ4WjhqS0Nwci96YnNrTUpIc0ltU2JyaFRMWEpPRGZ4UStTV1RsaS8rWDlX?=
 =?utf-8?B?THlNQi9TTittYWwrTGZxdm9XQWxyUHJiSE1zZmhHUjBjenBLOHkzZ3ZZN2I4?=
 =?utf-8?B?R1JKYmY0SzBIMVJMK0tnb0V0MFAyRkFDaWJZdnlsZ2paZXk3SnZkMkE4MC9o?=
 =?utf-8?B?WndJQXg0SitkeUY1T2NpM2VacVQ5TkFNR25jS3JsZTVsMTZCdkNudEFqSGtM?=
 =?utf-8?B?YlJSQnc3RzNFdVZXclFKWWtTMUZkanVpdUZSa091VlRQT2MwYkg3dWZqTG1X?=
 =?utf-8?B?RTFPTEd3UW9QeTd4MGpOeE56TmoyN3VubmhsZUVFTDlreXhFcnpvVlg4THVS?=
 =?utf-8?B?R3RrRUxCdnR4ck1zN0NOZ3VWRzYvcCszM1ZZcWVaNDhiblhUbzVNbUlGbnE4?=
 =?utf-8?B?ZzlFaEgxZ0RBQjI1Wk05K1MrVFFockxMTjdNUCtTRE4zNWpSTDdMRWxNRTdD?=
 =?utf-8?B?YkU2bko2bkJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0hmNktReC9pMkVPeUtRNGlvSHdRcERBd3JyeFlrb1hNblBzcFZQOTVaNkR5?=
 =?utf-8?B?eXBreGdESCtEajdsSXdHVTZRMk1neFlsVUdJYUx4MVBicm95TUlXOHVmSFdr?=
 =?utf-8?B?ZEpSSDJQNHB5M1RpV2Qrc2pjejBHa292MUhLdUl0NlRHQ3loOTMvZnc4L2RS?=
 =?utf-8?B?aHRuQkNNMEdrdlVBZkJoamdaVDAvMkllVHNMOHU5MFZPTUZJOUxQMU5hRHJK?=
 =?utf-8?B?dUhlSWZ3QXVTZ1MwODFRTG5YZ3lta0JNbDZnbis2VkRucldCaytFTEZLMHE0?=
 =?utf-8?B?KzFPUlhFSmxKQndrTVc5Q2ZQMzczaEhGblZOUjlNajBWaks4MVcwY3RLQXFs?=
 =?utf-8?B?ZUpsSnA2RlVkbHZpSE1KV3FuRm9wVXdzaDZkMFYvb3AxVlM1bUxIR0RGS0FG?=
 =?utf-8?B?N0Vla2ljNjRPSFdYbzBmRkhTYkVSVFF3cE1sR01KMTd4VGQwU2NiakFkdjdS?=
 =?utf-8?B?T2NZWWZNN25pNEtyblZhRUsvNkF2R2VJNGh0U1M3RzJ5dTVIYkthcTJQOTlF?=
 =?utf-8?B?emp3L2s4MGZxZDRtaURNeDF6eDBRV0liRCs4OHRza1N6ZmxCTWtPWjRGRnFk?=
 =?utf-8?B?UUsrU2xJM1MzUkNzaEFkZUFVZ3FzK0xVdk5LeXl2Ry81UkJocmVHUjRLV1Yy?=
 =?utf-8?B?aktFak5SRlhJRW1QaThpT2szYi82UXJWK1dzTGdpUW4vcXY1azBDMTgwem1Y?=
 =?utf-8?B?V0RJSlBtVjBjeFBha0hrNVZHUW15bDJNZ1NqbXNVQTJPQlpOcFpDdlRmdVZB?=
 =?utf-8?B?SjhYcllEa3NvNjhxenVQMFBJd1oyWjJ1TzNUS2hZU0ppNGxlKzh1SS80Zlcz?=
 =?utf-8?B?SmZlaGk3aW92bjJ4ZnpQWGVvWW1TYkVFcXpreWFubGI2b1JwbmRuWWdTTGh0?=
 =?utf-8?B?STVRbmpqaUMrdUhiOXVmZWQxTGl3cHNiQnIwOEtyUDQzVlNMZ1ZGWWFCelFD?=
 =?utf-8?B?b1pCMEEreGoySGl1Y2NOaWpKSHoyMGZNbThBZjJHU2hyRFVOeEkyOXY0bFRH?=
 =?utf-8?B?Yks3ZXBiL0IrdUpuU0VYeFhYUE1xUGY3Z1RGZ2lTQ3BDOWUzVlBpTmhHSUpz?=
 =?utf-8?B?Yk9oMmUxbGNmTVZtQzBaZG9kNXhicE0rUUFVay9SN0hnOCttL3ZhNUxHeXo1?=
 =?utf-8?B?Ulc3SkZjSUtKMTBhZnBoSWljbjR2OGtXQU9XVWcvc3VjQkFUZGVZVitsc0J2?=
 =?utf-8?B?RG1iaDBnM2lwQUJTWnkwWmxzczVlWVFHT0VyZndJZ2M5UkJtSDhUczNCM3Br?=
 =?utf-8?B?VUF5cWRVb1ZIKzJNOHpDRWRTczVqU1FkRWNWMEliS1gyd25Jd0p4cmY2OWtQ?=
 =?utf-8?B?cHZEM0d3dllFZVd2cGI4K3FQSWJQZ2hLR1dCRDRITGFlVVFRNStqL3FhNmNS?=
 =?utf-8?B?TW0zbmVZNWg4Q3lpdDBVcUtKWEpxT1N2NjFxcG0wT0hkcE1uWHdNRGxjRS9j?=
 =?utf-8?B?ckUzYldVQkxqS3A3a0lWTTkvRXJJKytoVnhNM05rMzdKT1htNUtNU3pwMkZi?=
 =?utf-8?B?S2lCbGExcldzd0oramFjZHFlYlJLZlF2SXBmenhReHgzUlZ3dGF2TU44WHBT?=
 =?utf-8?B?LysvdTlwM0tTSm5VSWx2UU1Xa0JyTjdka3dZdDYxejFHa1MvRFIzZUZjUzNn?=
 =?utf-8?B?SUZGakV2aGZUcDBMRTZKQXhhS3l1STJlU1VuTFdhc3ZSSEZtWldaZ1VVUVY0?=
 =?utf-8?B?ODR2NnVHZWNQeFVGNHAxUzlFRzRnRE8xZVBkQVBJSHJ5bmhSeTJ3SWQvd1o0?=
 =?utf-8?B?dXcxMTBJUlM0dVg0S0FMOFlWUTJTTUkwOEkrWk5NS3oyMDVJaWpoMEllNEVN?=
 =?utf-8?B?RVpFaDMzSDVSc2I1TERJNHBKOEtJYjVSZm5sUW5oang5R1N6UXI0S3g1eUhy?=
 =?utf-8?B?UUZDUEsvYm8xWmxpOVAzM0JvM0NLUFA3dGFWSHgzVjNJU1lUS2xXSlpwdmEz?=
 =?utf-8?B?aFI3bFYrNkRQTDR2MjNiNXFqN3RxY2hjU2VHVlZpU2ttYzZXTXJHdkxJZ1N4?=
 =?utf-8?B?N1pnWVgrdnRaUGtRUUYydTQvMXEzZm5SRmlBUEhDNGZmUHd1aCtmaEQzeVRZ?=
 =?utf-8?B?NVEvNUU5N2NrY0lHUDBaczB0OXkrb1h1Zm9zSnR0TXhpWVJpVHllMDM5SUxG?=
 =?utf-8?Q?WeN+7o7yoMBCsNfRsFX0B0Anv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf06a97-3894-4a7b-ffb5-08dd75c30678
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:44.6672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+jsQj9dN5QsPArl7Ahqhm1P8iLjuKhAasKyxEVn7XN2Y0+6r3F7EyLliBD3W0FaAu9obZIoMq7HKtPZlU+GnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

Add priv_dev_ctx to prepare enabling misc-device context
based send-receive path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes from v14 to v15:
- removed the se_intance_id structure member variable.
- Added dev_ctx to the structure se_clbk_handle, too.
- Collected Frank's R-b tag.

Note: copied the change logs for v13 to v14, to cover letter.
---
 drivers/firmware/imx/ele_base_msg.c | 10 ++++-----
 drivers/firmware/imx/ele_common.c   | 43 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  6 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++++
 5 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index c843a5508a9e..9227d083abbb 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -62,7 +62,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_GET_INFO_REQ_MSG_SZ,
 			       rx_msg,
@@ -122,7 +122,7 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_PING_REQ_SZ,
 			       rx_msg,
@@ -174,7 +174,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg,
@@ -227,7 +227,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr)
 	tx_msg->data[0] = lower_32_bits(addr);
 	tx_msg->data[2] = addr;
 
-	ret = ele_msg_send_rcv(priv,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 			       tx_msg,
 			       ELE_FW_AUTH_REQ_SZ,
 			       rx_msg,
@@ -275,7 +275,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx,
 				       tx_msg,
 				       ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg,
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 7573603cdbec..baf83f03c1a0 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,16 +78,19 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname,
 			*(u32 *)header,
 			header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.",
+			dev_ctx->devname);
 		return err;
 	}
 
@@ -95,31 +98,35 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
 		     int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
 		dev_err(priv->dev,
-			"Err[0x%x]:Interrupted by signal.\n", err);
+			"%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -166,7 +173,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting cmd receiver for mesg header:0x%x.",
+			"Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *)header);
 
 		/*
@@ -176,7 +184,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *)header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
@@ -187,13 +196,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
 		dev_dbg(dev,
-			"Selecting resp waiter for mesg header:0x%x.",
+			"Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,
 			*(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname,
 				*(u32 *)header,
 				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index cba2c7854455..62c75e149d95 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -13,12 +13,12 @@
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
-int ele_msg_rcv(struct se_if_priv *priv,
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
 		struct se_clbk_handle *se_clbk_hdl);
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz);
-int ele_msg_send_rcv(struct se_if_priv *priv,
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
 		     void *tx_msg,
 		     int tx_msg_sz,
 		     void *rx_msg,
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 2d885c03a450..a326e07ae547 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -204,6 +204,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -333,6 +356,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

