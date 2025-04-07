Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1BB23A9B4;
	Mon,  7 Apr 2025 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023457; cv=fail; b=PVB/rWoDxg6iEtv/mZQP11MVhrW1AB8/ATT9XccEp5ZTb7Hvyb6mezQturBxHHdVGOnKaRn5VZCY/0zFTZMu/8J45acEiBmQ6EqiqiBsx7YMg5tSL3Q4U6Bb2d/KY+VYgfHVGuCKJpepcXvnqwL1ncY7+vzIEUx88A18DUoJD1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023457; c=relaxed/simple;
	bh=ZKRHce+L7oNAoUpLR25PZZezk02aoi1FB2vb5kRUHWg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mlt0yUg9oNLfv07tZma9ZmKr5j3Gc/+N/u+TZF1ut29xPQn9cjB0bdb5qzNoSThYzUWWLqfBaAUQLsUgAoJxV8ILdI87TeY2FIwlbcCLL7BaCP17b1Txw642CKA4M00dyVGaDxCUvp5oM0nRpvAtL1+qd93WBfMEuwEMpFjMvEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nOnOkwe7; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nOnOkwe7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACejg2xRb3EsYLOQvhOYv2fyXEX0V4TfxMlAvIkBOsHuXjosxAUDasrxHnhuiCbKaLzoiwTm+uFGX1lkXnclBrya+e6zMh7wwJOQPn47ZZzlrYcHV9tccbuDsEjnhMis+A2Ax3M/fMJqM3WwwIJ3QcshPO8oWyTZZE565iG9YYOhfOp8mTruTbTrlM5WVfqmq8z8uP99rRzWYGH69p86KOyH9doM24c35loK2pD+PkdhO7scIxmRt+zFl1LEOqf+qTG4dIKqKVeJ6r/g5hy0Qy68lj5nZS2KpkEC7Or1A6t8kK2V0b/CBTg+30XeRKpZXhTxfTYTYdJ+RtWuaSgFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHcYKGHEz91CV6rUeMS3nBVchDx9aS1kjrY4sXv5c6E=;
 b=x88z4kMNZqCn4/v8iyvkCmjryzc4WD9DWK8daUCNBXXSBFP8IywJknmeNw8XbdJPRKKp27VcP/Nh1PzppS27MOkf8vq2T6hQw7WE/f3X5jTEry5KUwrVXFsvseBuYGN0ItKt3ldRrv1qoBJFQO/RqoAGBsHXMNme2uT3tj6/8neGLMoH5gpSmvuzeodX/duF2Q2vw0G2MrGx1mE+cdZsX7pSurH/J8170cBDhF3tL0YeLlRZzWfv9trjHXadNcMZtRi52IFAHY+7PPnb4yZrjJRCSeW0LNzvvuLVglzLQHjJz0EbgS8UKjy5fipIxSeHqQU3SSfpIXTkcRVH472X+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHcYKGHEz91CV6rUeMS3nBVchDx9aS1kjrY4sXv5c6E=;
 b=nOnOkwe777D32rUK+e/bvz6FYC9IjhP6xBYKBUWCYIr7tqmcOVFBnkD0lZbkIssbt9dI/N+wQjMlATPGlkhIxLkrkQm8EbAzBS4OnHIIr7MaQn/T8GwSD+6+68VAO4SNPr+sD9ot8aq+obadrgqcvpxxECN/kOKiUx/ik6KY4wo75jFdK0VMd8eLvHitMemwfoIkUlX7vQMsvHwO/DAE/QIynY/itbGlHH1IhkXqXfc+wX1hwTxkuCBiovtPY/i+xjZBia+LyRZjKKJqj8o9y8ktQgZ/q8G2VlWA0YCczrf3hKyWjt8xzpK6DW4iNqFDzvTGPbS9/rXitLYAp6BqEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Mon, 7 Apr
 2025 10:57:31 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 10:57:31 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 07 Apr 2025 21:50:19 +0530
Subject: [PATCH v15 3/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-imx-se-if-v15-3-e3382cecda01@nxp.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744042844; l=1493;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZKRHce+L7oNAoUpLR25PZZezk02aoi1FB2vb5kRUHWg=;
 b=wcTf6Xq5QHP5n18hzJuius9q+lWD269WUL0IbzhkkbKyaLTCTKgTzFZT/8oxzST4+oHx8ZCIx
 ixp48CWSD+1Dgw2gdpa4gLjb5JToEA/HE4AphPdrhKViP6DRQ/nkxwA
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
X-MS-Office365-Filtering-Correlation-Id: 9f29c99c-12cc-4706-6d2a-08dd75c2fe55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEdaRENDaUJnMkNuVHNEVkh3RExLNS9oWVgwOVNqZElUbDVsSVRldkFyeU8y?=
 =?utf-8?B?aWVMSzBGQms3SkR5dFFCTXMxcVUwQm1LbW1oNzdMSldNV2RHM20zaXRlamhF?=
 =?utf-8?B?TUY2WURXRUx4dm5lRkJldUI3MWlFc01SeldRMDZ0UVgwWnpVa3pLK3gyVUtk?=
 =?utf-8?B?L3RqaWsrK0hiRzhIeXBoWjZpZ1V2dzZibjhLNDF1RzgzNVR0NGJyaHNWQTdD?=
 =?utf-8?B?V3F0ZTBzUTVDR285OEkvSC9xK0ZrRmNBdE9xQUVxVWpKL1cxb0J2dUNWeFAx?=
 =?utf-8?B?WnRsbjhHcHV3dUd5YTVXQXg5c2paczZ4NlAvcU5pcHhFazZWbnlEclFLdFFG?=
 =?utf-8?B?Y2V5V2hxUjIzeTRwck9kRllyWWhUemxxTXdyYlZ4NGpXdEdabndweU5IZkdK?=
 =?utf-8?B?OWVqRDhWTDhNMVRETnN4a2lRMXlISkx6cFo4QXlpWXFmQXdLK2JnN2xkZnNs?=
 =?utf-8?B?VklkRisxZTJxYnhDdUdwOU9BQVNScVJNT3NTQXBjeDFTbDZJT0tDVS9xNlZJ?=
 =?utf-8?B?cGRNMVFXY1QrT1NicjlrQndlR1Mrb2Q2U0FxMXRPVWcyMXlUTlVlRXNNM2xk?=
 =?utf-8?B?TlpiVmNTQmI3NFpheVRnSWlRb24vZDhzUjJYaytrUzJyenFQYzFCWDhrdEhE?=
 =?utf-8?B?VVg5MVZDYUxUU3lSS1Nsamt0bTFLTGMzNmZLNkhIYy9nc1lkdmdzb2R6eXV3?=
 =?utf-8?B?azlGWElEdEtJWWpVZ3YvRDg2VGtUc3ptdSttTnNrT0ZJeThVY3NjN2RQV2ZC?=
 =?utf-8?B?a0NXQ2FYZEFtSnQ1WDBFc2VJSkRmcTBJV1J5Y25PZVRaN1lpTUJCaVdMNzNV?=
 =?utf-8?B?VWtMQ3YyTXNxS1JQTGxVOUhIL1ZROGRpRGFMWmN2RnQrcWM2d1QyWEN0a0cw?=
 =?utf-8?B?RFFRa004MVp2RGJHVWsyMlZQZVdmSXJHRGtJTm90SWhNK1hicXhGN1dhU0hN?=
 =?utf-8?B?c2gxOHZDTFlJdHBVWWZiM2c1L1N4VThtQmtkM3FYc0JPRWV0eW02RDdkRm1s?=
 =?utf-8?B?cVZhb0VSNWdlWFR2eHlNbWhkeGlzQUw5RFc0VUY3MDlNTTVLQ3pKcndRS0NF?=
 =?utf-8?B?eHFVQ1pIa3ZnbzA2aThyUVA0b3hrRWx3Uy9FSjRONC9tQ0FjdnJ2dmVFMEN2?=
 =?utf-8?B?K25OSzJjOGFEZjhRL2l1YUJNYzhrZitwQXZCbk9UUytWUTAzdzB1UHBVanZN?=
 =?utf-8?B?UUl6N0J2YUtVRmcrOGpXMmJvM1ZGRjJEdkxDV2VFSitJZFNjMFd6ZGNYT0sx?=
 =?utf-8?B?WTFUT0RLaE5WZkpnVFNWTm93ZngrQjBoZW95M0JicnpSNHo2VXlMSWdxY2pU?=
 =?utf-8?B?b0Vrbkd1MktVS0VhTTFlcVBIRkNBWUpxbE8xTjZ0YVVsTjFQYk40cXdlUDl6?=
 =?utf-8?B?cnE1SGRqdFRPeFZKMmJESkc3TlFKNDgzUkp4SkRLcHorNUxVWUQ0WVVUV1Jk?=
 =?utf-8?B?eENrMnA2NXNhdnB6cUpjckZCRFMyVk5RM0pieVNnUy9QRHJZc0c2ckh2cGNP?=
 =?utf-8?B?VHlOVTdXM09NTExUS294cE5zbUFUTldKOUw0OEhtZDY0YUdUam80ckJDUFpz?=
 =?utf-8?B?bHVsRFFubkVaejdKRGJOZFRNOW5rQ1lEUmE5WHpwaFBzM2F4dHpmRzYzUDNj?=
 =?utf-8?B?NUpvMGpqcDAyMXZxS3JvbFBkNnRGQXdieStEdWtaZHY5aENCNU9ZQ21ibWFw?=
 =?utf-8?B?dlNpdFV4MmFUSDh4ZG9zTGFZdklQVHhmc1orSkgvMlJLR0djaEczWHhIODB0?=
 =?utf-8?B?ckpMRXBpV2dFVDBXQlFoYzdqRGVXa014N0JOQVhwS2pBK3NPSFIwRnZxbUli?=
 =?utf-8?B?ajNKUnJWY1BZbnJVb0pLMkdSOEFDSzFkU0dJelpiaHZGZGdVVXRPSk5WMWk1?=
 =?utf-8?B?bDk2endRK0s5RjJic1FleXBISm9RUjQxdnRzSFZzekVsdDFXTmZEREVEd05V?=
 =?utf-8?B?ejlMdU5FVkIwdEZXVjl3YTR1aTRCOGsxVWQ3b09LWkVzRTE3bTRrQzFIY25X?=
 =?utf-8?B?d0dXZmxDcUFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdRZHZ4dFhEWFpvR09vdXhpbjkwaHhKUTVKQ29hKy9UNWRLTy9PNCt6Q0dZ?=
 =?utf-8?B?S2MxVWQvdGw0RUx6SmF5NzlqT3hWR3ZMQ1JwTkpPT015K09HRjV4RFlXdDBz?=
 =?utf-8?B?VzE3bVVmOTFUcFJHYXBLd3BlRThBU0p2TExrVFpYN2MzZ2JVbWd4SldMa0tw?=
 =?utf-8?B?Q3FRNFk0ZHlQR0wxSHhjN1BPRkdidzNLL2J1YURCeU9MZXpkWkpIMG50Zmt1?=
 =?utf-8?B?bmtNbTY2c0o1eFA5SG9GM1Q2VFlpdHBRNmlON3RnZW5icStVb0syNjRyUllI?=
 =?utf-8?B?VS9oWE9OTW81SC9Qa0x6dG9wU1hJM2h3QlNJSURKUElwakluRXQ4UDBsSkl4?=
 =?utf-8?B?eUlMOEROeHBvS2xWMDBIYTRoRUFIeEthUlJsU09pNzlqYmFtdTBxSlpybXZK?=
 =?utf-8?B?NEtOeXlKQjBJeVB0Y2JiSmxvcDVyNDhkVkdveFVlODVpRkY1emtybGFzcy9D?=
 =?utf-8?B?Q2dKYm52TzQyT01ZbXZ5SVM1amptbWR6blVvRmlQV2hoVWVsaldWemhFQjJh?=
 =?utf-8?B?UjMwUXk0SkVDNDk4N1hpejhsdzZQbTN6TW9tWFZnMWEyZTdQd0o5Q3lRSUgr?=
 =?utf-8?B?SjJ5aE9QQUltUnpjRE9aQnh4MEl6TzdMSU40S0RTeGRSTTZoRXlxT0V5L0NP?=
 =?utf-8?B?eEFuN3NaclhGalFDNTB3djB4eDFlazdQNDVPTmZMeXdIMzVpME1OWUZMU0ZK?=
 =?utf-8?B?aXh2NUluRThNVXBQTnlEYjFBU2JnZ2VJY2Iwb3FxTG4wNVhhTWJxd1NaZmhv?=
 =?utf-8?B?UnZadnRKSk9wblVuN1BuRzFjR2YvMnFPV0x4S2diVmlaT1FhZkMxa1RwZ1Q4?=
 =?utf-8?B?U0oyMnJyMXl1K3pwRlEwTWIxVzhJZDlxczBTMXBwZS9CcU9GMzBvZk5TU3Ji?=
 =?utf-8?B?M0lDa0hRYm8vRVVOcWIvUTlYZFRQMTk1YXEwamM0NnpPcGh0OElHNnlIU3Vu?=
 =?utf-8?B?UHNhZmgzQ0JwWUlQQUhBYXZ6QldXMFh5MHhEQm9UdXFaYytPU3pqdHpid20w?=
 =?utf-8?B?ekRMU0JLc2FueHVjSHlFQTlrODNDUGd2WDhUYUJBZktKSVJCMmVFNjFIZWdT?=
 =?utf-8?B?ZDg3K0syWFBxYUx6SUt1RVBhbk4vdksyK3pnU3FONkNacTFBdVlmdzlFRmVU?=
 =?utf-8?B?enExdmt5dkcyQk5WTHc2R3AxdzNhUTdPWm5PQUpsbVNaeGg2TE1jS3lIWmZG?=
 =?utf-8?B?N0trVksvS2ZPK3M0UkpiZGpjSk5rK2x5aHh3WFFUN1ZXMDZpSUtNLzJ2Snc2?=
 =?utf-8?B?anpoay9GUks5cmRzWnN4WjRsT0d4UXlWKzh2Q2lrR2JZL29lQ2FZekVOTE1q?=
 =?utf-8?B?enhqMGdYeXRoL3Fzb3JMQmRtQVdzR0plZG5VeW4rNVpvRVlSVDZrdExMSmlN?=
 =?utf-8?B?aStHYjNZWVZHVkhKMGJkZURtUG5MdkZKdG5NUm13bEQwSjJ1aEpyR2hyKzhW?=
 =?utf-8?B?QnFyaTdsenlBNmZKT0lRZGR2NkRJbFhNczBKUFpYWUNkNlRCRHJHUm1iUUpJ?=
 =?utf-8?B?SHo3eEJkK0Z1WDQ4cW9ucHVEUXdCYkF5R1B3TGRhSHBMMWpKR3dmdUNpRHBX?=
 =?utf-8?B?U3BhL3JZNnhHQlluVXJqTWUxS2x3MzY3SVZzMHFXM2hBNjQ5eHpaWmplQk5U?=
 =?utf-8?B?L1A1YzN4blUwNWN1V1J1VDZzV2RIWWs5ejVTa3V6VlpSU3d3SzNNTm4wVUEv?=
 =?utf-8?B?anVRUTBhajJxSVdhMVlZNjhad0gwSWtOdWZnTGdBdVFleTdHamVraXZwZmVK?=
 =?utf-8?B?VTdIN2J4bGJ2UW1xZ3pIeXJSWjV2YitWUmZSdGY2ZHhEcE02eDc4ZlorV1Vw?=
 =?utf-8?B?aVRCOHowT1oybDNqR1M3M3lyZVc3R2NvSUNkbUdLZ3JEYnBhcTdpWkN4TmVn?=
 =?utf-8?B?bVNhcDYyS3cxdWVpam9kVnJUMWI0cXoyYVY2cWdQRUc0UVdGaWJqQnd3aTgz?=
 =?utf-8?B?ck5kL25BRjBZNUVYZ21zdG85elJKQmtuSm04QmE3MDZWcWM3UlViUUZMYmRN?=
 =?utf-8?B?WlN1QjBYdFJWNXd4RnVKOXMxMFBRb2VhaFNzTUtuVUh1K1UrTDhZR2tGUnY5?=
 =?utf-8?B?Qlo3OVJLd0dTamJDd01LVnNzSTI1NVJKUEZpME5WRzZ3VHBBU3hlUlFLUlkw?=
 =?utf-8?Q?JMAh8oxfi4iHLTkjkWO6ZczAT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f29c99c-12cc-4706-6d2a-08dd75c2fe55
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:57:30.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neCnrLm/aMYExE3/z85gn15KHFc5Cp8hG12blxj178AlfeSg1UCp/4p9ZWAQIKEUb4QTFRotAbUFFfz6xlKoow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

Add support for NXP secure enclave called EdgeLock Enclave
firmware (se-fw) for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
changes from v14 to v15
- Updated the commit message.
- split the current patch into two:
  -- 3/7 for board dts, and
  -- 4/7 for chip dts

Note: copied the change logs for v13 to v14, to cover letter.
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c2..05db47668b7e 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

