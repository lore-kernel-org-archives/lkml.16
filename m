Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B35256C71;
	Fri, 25 Apr 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588346; cv=fail; b=W17/x2/bqlFdrEfUGbg/AG/KpRZG4U9pWLFIBfZpPV8V3h9ZQs4mb4QU89qaRMw/LjPh1bDVUgIvblSdZGe7Hhlbuu4dbCno2PIPuW8X1banoua+DAqa7GZfyvju5kzvNtMkWIP6yOnnw59UxEjY4Uz/0Q7lwOMhvpySwqU5mRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588346; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eIF+X2uqGRBhVOjxRVlTdRk34BNlr+8hT6zCKaTbTAOJFs3HfKOWreZTGLSY+GgjUGDIiAq3QGrqjd3ftvEW9lKCRhBya/4w5o/oWJl6JuXw2FCiONbEGyRwdZaEuwv9sOU5f9UBfmA5eJlDALhrJKCPEly2eJMLduUep4WFCVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TCtBYX9E; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TCtBYX9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Shlf9DWnvZct8Yq/8JaqPFJIafIw3b/Br4+m6vgUzXlBEJnhgibYOXbDA45AvwitRHjxU9m8FiZyjo7b0GzKHNMjO9oUqAnl0a9T2mvHEmRglDAtFIpkkNmq3uF4mlzhEJcnj+m6GHDOzCt5k5PtFTe5myjBpiF44+cei30m+O3vILHa5V6epXIbpCVvHI5L3H1TipoLRa5czLicJca3zJG/741S0jI+Ba3mE79Mznewfe+uDCdtKHnRQjEsUG+YURzLtEfpEf7sKyoAJc66RLG/o8YzcggsR/yHs2pqkrUsf2sv5ej8swcd2rSPQ40ELWrLotecw69pZzNmz0Tj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=QzdpB6p0+UNZFI3oYtaEPJtx+mY+L6iq2yd/Ci8m1Jy5o1/TWLtL9niBXWVnH4apzGMf5Ofsm0q0KBgb4FyWk7hvD4ozuYTb2x7DgTKNnMYzb5Y8kqarhkqQqK/8rHol/iK7ulvz83qGneQQN9ygoqK9lJKBgFjTXSx0gtLh4O1CFQr3i9NmC7ezL6z3nIJWWL6L2FN1gwRMNNzaak/LqC/G3X0eWX9oBYHsv28Mc2YW1vlyAFqTP6fDqkSwk4hVkOmQiQJta4T6lrIfDddOgeRkYAv2dccxyCNfoKuLYoV2cszoK8jIqNrhQLLc5KrbRac3Ym0ng1e2cDFBBhJe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=TCtBYX9EuJaYBU2pqS6kdq3+MnKVGhIGi3g5pJFmynneDzTCr9QtPXvtW6kYbRYV8cZRy/L6sETF35uciBWywTb86kIyd12rUrBJFZjKdhkj4kkR5TPqR6BmjmJcqHJ8uGQE1HBnxiQ0e/DTuj/qeyurp4gGhRhmWv7R/qJY3NhMTAUudkV0diUkNk7LEOJLv1RYvKP9jPzfWgMjtJ3bGxkIcYq4KLe29znwZ7F0QJu2MBW7tyUDJqaemRAFH8eOoRpCBFCjhLtdp+GjOnO1YYUk4C39nN/4u4zpKYxAAmaR4ErYB/u5Xfdo9NOhB2SadlgT4KCuoNrU0xCp/lnm9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 13:39:02 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 13:39:02 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Sat, 26 Apr 2025 00:31:38 +0530
Subject: [PATCH v17 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-imx-se-if-v17-7-0c85155a50d1@nxp.com>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
In-Reply-To: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745607704; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=euYkG3TPj6trXO8CllL0jzbNjGjY+FsmpyAVFB6UKse8Wpn+NzwkTNu6Pz8khQ2gPlFJfuYk5
 tOuvDf9Z4ZYCS5S6pRVDfyLHfiZucaPEYHL/QyOpeRCSEdc4a02/zma
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ee853d-884f-442b-7197-08dd83fe8a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWNZRlRDb0NTMUx6QWVYN1ZMT0VUU3ZGOUEremZ3bTN1LzhZOHpRNHRUU005?=
 =?utf-8?B?SmZHZjJodmxIWXFBZkl4eTNlNHJyM0NlRWxjazlLamd3SDBzZ211V2VQUndv?=
 =?utf-8?B?NXdKMjhIQ1NMSnpEL0VTYUREcTgzQ2xIQzNjNDFQTDB5eENxanNwUW5uTU1P?=
 =?utf-8?B?eVMwQS8wQTh4cGVtY21rRzIxRG1XbGN3RHVJbDZpSWhWRkhyS2hCRkJtVWlI?=
 =?utf-8?B?QllIK01sVy9qOEZ1YWlORnhyWXJFR3BVMjNJdy83VDRQOWlLTVBKTmI0R3Y3?=
 =?utf-8?B?bXdRUTVpMlJiUmZaMEMzYnJ6eVBXaUtOZzR3THAyd09xNU1oWG1KaG1iK3B0?=
 =?utf-8?B?REtVNWFPSEkvdHozWmNjK1JoYVdqdmxrc21OaGtOM0k0YmtZa2hkN0FzTFNs?=
 =?utf-8?B?UnZ0aWt6SDIxYk5oVmJtaCs3V0dpVkNYcEI2YUlwSzd1alFRRlNRd1RWcUo3?=
 =?utf-8?B?UGw3MXdlb25yOGh0eHN4bGhVRWh1NkM5Nk9aS1pQUHNZUy9MWnVzVmM1SGhT?=
 =?utf-8?B?bnZ0NmswbFZVY3Z6U0k2YlVGaVc2TVVST25WRVhXZDkvQVZ6eUhaQU9YQWVH?=
 =?utf-8?B?cnJiaEZTaVcrTzVKanlITTlvazlXUlVTdjNVYzgwZC9OWmJBTm44bExTMlZH?=
 =?utf-8?B?emdmNitzV2RtZ0s3RlBhcXJyZFBlZkZNZEVTZnhGNXI5VkJydVkvRkhWbVlk?=
 =?utf-8?B?TTYxaU5JUWtmUFBlZWk5T2ZheTlxN0JSeEFWNldDT3BNa3YzVzdVM3ZoTk1Z?=
 =?utf-8?B?Q3BHaFpRWmZtUVEzYjd4SVF5bExnZWJOeDM4RmIyZmRNUHRLQjMyeTA1UHNL?=
 =?utf-8?B?aTVHZ21iZkZFeW52SXIxNTNMaHlNazRyREQrQmZmeFNpSmlEeUpYdTdKR2RW?=
 =?utf-8?B?eGdnbHhmNWRhY2VOeUVBczY2QzBpQWxRblo2dUo1cWZaeXE4MiswOTJnbEx2?=
 =?utf-8?B?U0srdkh1bHkwUitXdzFjVXJPeTNCZm82Ry8zSjUyOTJCeGphZXBlcGliY0RV?=
 =?utf-8?B?N3Q5U2czajJJa0EydlpNZmVwN0tQU0Jqd3piQnZmMk5sSHo1T3pEWllPMjUv?=
 =?utf-8?B?a2ZsakRkdEJKWUVwcFcrTzhHa3JmMnU1Z0x2Z2cyRGZmc294YWR2SG1UOXZx?=
 =?utf-8?B?NDlyMW0yQ3BMYUh1MlRxV0QzS3ZldER2R1Yzc1FseitBNnhiSkthRGllN3ND?=
 =?utf-8?B?UmhuWURrL2tMMUZhTGsyN21VSXgwcFVDbFNnUWhueXZ2Q0lnNHhWenBOMHpF?=
 =?utf-8?B?MVIzYm5iY1lOSUY1eTE3SWMwVmJQRkhMd2g3MGlwalkzSTdjQ3NlWjRnSnNV?=
 =?utf-8?B?VUxXU0NLamVrRGhJNDJualNvSERxaEM3NGNIdmxjK1NXRjJ1ZEtKQjB0cVh0?=
 =?utf-8?B?a1I0ZTR0ckhXbURGL05Eb2RNY2pMQ0F2MEdpaG9DM2Y2eEhhZXh4VENuT2tv?=
 =?utf-8?B?QUlXVjNqWlZsNnFGNUI0RGx5NnYxbmhzR1Y1SzRzb2M4Z0ZPUCtrUjdGR2hW?=
 =?utf-8?B?SHRSLzhDRU1rSnpubkJFb3hxdVlLSCsvSmVtaldPNjM0N3J6U05CYjhwQnlu?=
 =?utf-8?B?VXNtL1ExVHlsZWVUTUtXR2R6c3l3dEo1NVhJOGVUQ0J5TEVRNEEzMVdKcGl4?=
 =?utf-8?B?dDRzTWFCOUtuWS8zOG84eWtreGxFbkNWcXJtTFV5a292aWdqMktTbU1mMnY5?=
 =?utf-8?B?aHdUdTVtWGZhM1J0NUpvWU00RlgrYjhyZllQK1lWRENCZkVXSVFRSXNjaDA4?=
 =?utf-8?B?TG00NDc5OUlPM0VTWjZuZm5BMVU4ZEdKNWJMRS9tcVBUbGxzajE3L0paTFJG?=
 =?utf-8?B?U1VIRVNGWUVvai8wbHB1bGs0RHpiRk5OUFovODNJa3g4QzZtN2JKRXJhYi81?=
 =?utf-8?B?VU5oWDBvcWt6a0tZVWJmRExLWE9LNjZRWU5PN0I4TXpoczhzYzFBcHUrdTJV?=
 =?utf-8?B?eE5uMlRTVE0wZEhnOEx5YkZlSm4wZEVtZ0gvYUZjTWwwaEJGbGV4MjJHSEo2?=
 =?utf-8?B?Si9CR0NQd2t3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9XS2FQd0FWMTJyR005ZnlsbUNIVEVVR1MyQk4wVEtUOUFQZVpiL1ByS3BG?=
 =?utf-8?B?WkdUTGNQa09XT2pmVzExc1pUSmJhTUpJYnp0cUV6SEZ0Vk44NGRTU2FJUU5M?=
 =?utf-8?B?bGRibXRvMVBoektuamhyRDNzelJaWWlqYzBOWEhoVFhocHk1R2UvSHNzMm5i?=
 =?utf-8?B?VkR2OWlSODJYK1h3Sm5TVDBWTm15MVk0ZUlSeWx1Mjc5RmdQR3dSYXRMdzFQ?=
 =?utf-8?B?Und2alI2N29WemtNVFdvS3ZsUHFENkJlbDBnMkVqbGNYcGYwUGZWQXFjcjlU?=
 =?utf-8?B?NDN5VFRnNlp0Wk5ycDQ2SHRkN1U1c1dmN0xPZGVDb01KLzFydzFlUlJiSWJr?=
 =?utf-8?B?YlFDNS96eG9QMnlsdlFyWEJ6WmE4QStyL0RNY2hIbGN0eUlhQXZoM3h1ZHpF?=
 =?utf-8?B?T3FmWmM5bzZVWmhCbjFWVEJtc3AvaDFwNzBKM01hOWlMOGg1aTNuZWg1MEZT?=
 =?utf-8?B?eGJZWm5kbU9kUGVjZkFZV2o0MnRBcW9JVjFJcTN1T0V1SE80ZGoyazhneHN1?=
 =?utf-8?B?anBVbHFEL09IUlJTRnYwdWZNZGwzRWpMM2RuWjFtdUxOaHFBc2RJY3ZVem02?=
 =?utf-8?B?TVI0VjgwbVZab2FLTUVaYmZNMlFoNEFMRHNiTmY0S2JtV05MY08rSGRJVnRT?=
 =?utf-8?B?ZnZtZ0N1aEczNjBWNlpMVC8xU3Q0alhHSWJlS3Jpb1E5M3FuZk5WcWZtV21Z?=
 =?utf-8?B?VHVPaHpaMHYxcjJxVzZ4Q0xiNElWSXNqaW1sRlV3V04rNnY4K3dSSHdJWndP?=
 =?utf-8?B?TEF5SFNDa0RhVFdiZ1FScUVwc3E1eVNST0ExY2pqbTB4b3NpZUVxNHRSQWly?=
 =?utf-8?B?MzRFQ2dlWS9WQ041U2pyR01teUl5UW94TElrbDlOTmZMRDdocmNSY0lrK2FO?=
 =?utf-8?B?RXpnS2ZSOC9IUmlQcmEyK0J5WTRLaDAydC8xUmx1UVNJcGh2ZEduNXBIUCtS?=
 =?utf-8?B?bllEK0xqUG1QN2xWeXM5cjA3dTdIVThoZ2xSdmU2ejFPbmJKSWFlWmJnM1Fm?=
 =?utf-8?B?cjQwT05FeHpibjdrMkdQajJiS2tqU3dyVDRXcnl4OTV6Sm1McFN3dUl6ejdz?=
 =?utf-8?B?bVEydkN4N0NrZDgwQnVMUWhkMDBUdXN4RlVQVXBFNjVGcEMzVnlYems4VVFL?=
 =?utf-8?B?MGRNdjA3WHJHeXJwaCthaWRTODlSVHVoMy9qNXdxSHVDU0FmMHBQaUFhVkFp?=
 =?utf-8?B?a3ZSZDE1K0hWaVo2QURvOFFuZXlhQUZyRE9HdzJqb2J5OVdyWHZmalNHb1VB?=
 =?utf-8?B?YllhSnhwNmwvK3ltUUtzRFZlbHU5SWFwZUpJa0J4UUIxbWFFK3lxWGJSRDgy?=
 =?utf-8?B?ZkxNeVJ4SGh0Y2xFQVF6cm1tRTh5cWVWSlBaSE0zeW1Pc1UzWktCaE5BY3FM?=
 =?utf-8?B?cUh2OW5VZWxxM3U3M1B0c0l6eUlsV1JKUnZ2Q2hVL010L0JOQXh5Y2RCQ0xp?=
 =?utf-8?B?OU1wcVpZWVlkZ3BlekFpWkhEbkxYUGE3VG9sbXA1c2xZWGFJbWhsdzM1dVdx?=
 =?utf-8?B?S2M2dFNscXEwdTg5QXFlK0xKNExnbkRDV25LOFR3L1dBUGtUcWM4czRqN3I4?=
 =?utf-8?B?V1I4czJ5eVBPZ1pnMU1QV3dsY3J0UUdRNVl5d1cvaHo4UUxoMkt4RUpNdjE4?=
 =?utf-8?B?eVE0cm9lREpPSWhUc2pUOHdYMGZ1TVg2a2RtT1Nud0NLYjFZR2VINy82QWFk?=
 =?utf-8?B?UmFUdXIxNjBiak5jQWNlZUhkQmxBTjVMT3ZDbWE4aDV1K2R4SXg3LzFMYTRE?=
 =?utf-8?B?ZndyQ1I3RHN4U2g1eXVZZDFLYUpCazJTVCtuSmtoVUxHZWdpNi9DeW9wWjhG?=
 =?utf-8?B?TVNLTVBqVDQycndoeWxNNjRLZy8xMlcrekVLL2t4dGwxTjJzbE16MDA2YlZZ?=
 =?utf-8?B?VmRWUkNFb2pEdm9jdVA4WllJUXpXL3BtZ3Joa2dGK2hxQ1NiMnhub25jTk94?=
 =?utf-8?B?S29vT3dLRUpkalZiMFdLS2YxV2pISGNwLzNpWnJWVitpb3RQTWtKQTRzZGR2?=
 =?utf-8?B?UGluUjdVNFJ1NUtBa0xsZnFldU9zUjRwT0pmMXNrSE51M1BiSkpxUTg5TzFq?=
 =?utf-8?B?bDVmQWxVL3phaHNISmU0c1VUQldMYU8wSlBaSU1GWW0xUjdZMGUyU1VtWkl2?=
 =?utf-8?Q?u3yysvTPCEN5vk3gBMuTikw7R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ee853d-884f-442b-7197-08dd83fe8a3a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 13:39:02.2558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YDCsW3ukNjARmSuKgHLZ5Ck5eEoJ4mgNbV2fTJUkBg6QYDoWSDO7VsvVS1OzAFAPzigEuCY+ohSIOwoSgn8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

