Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D124DCF3;
	Thu, 19 Jun 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334308; cv=fail; b=tHRHsoyybWGCYel11Rs5M1mwaObx4HSGZLgLH4ydCPmme7kCGqUe7tZP5M34zz4qSnDrLCVU+N7FIjFrz4aiqX5nFbBA209EvdzcicbCQOsKOJKk5xld4WJYu/4yFq1KmjrXRh2ZsLSyMKreHxH9o5YdAriqTJ4E0ho1pvSaT+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334308; c=relaxed/simple;
	bh=4w5tTIYti7iA3GrGZlldgwVR5QrapQ+PywNOE5b9rOc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=THKg2Eo8CT8nh4Q4YxlKR7yMTYWX/8hREEYozL7hkt9Wyvu2xo4whc9nPxQ2yEGRyfqJ51I82Lc4IFJTEZPkLKxfuhI8kBTUyuWRr6FQvlqvI+0lZtxB/xVclOIv4tlibpqO3nhujXf1aUCboEUbp3m+6+OFyAywYiR6DM51XMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kqy5qDDp; arc=fail smtp.client-ip=52.101.65.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kqy5qDDp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXZeV8D3TTfkqbOZ1wHpBI9ctB5chbQXhdp07c2dLisV5j+rWUUK8/oNqzV2bjpLvwAOr06EdcEnqlhjovfgUOR3s97xRnoO6vhTHbnQYh1yInaV4HgKViW229Y9A1Yf+ZQ6cuy102yD6G9SS90XkuHeQQ84POS8nHN3yC+NagrCnPdlqLg6vyTfhzoJ3wAeoCXweggr2ljdiJ3PDtJiPcH7Q3YYAuh9FuV8GFxf4eO+48XcWkLMQk6l0sDuwFuIDxTfflEzYZFUv1aW2uWzbzzrXk4grW9FPKfRg5zm5NXtaSD5qHUlpXE+MvcWGQvk+CSCl4dPuOa9sFH5sCI+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQHp2yZsK+e2ioy8wswR6PSZqIAIAMOeejkSV5M/CS8=;
 b=CXe2eAXtz7n19cpJX7EaLBh0986i0/Sn6CRdk91iJjetHZwsUbPdDttJhKaEsWqqZnHzPcZmFf9QiS1AgT5+P+TkK2OxsOZLlTWiZ1Qf5lzAH12hWakyPca90/SPzHjxDUrrlroIBUl2IiWToSYoxdyrFrOKhru3Ya5Vws2Us2IeyK2+Hx0/jXYJGFs6unBnY+Tx+YZt5/E7u5rj3BF/YFk7uXgMlXzahkw41NnscAwf6NmC4b42tb2d+vD2Gg/gJezRn2QUMYjF49plsgTIgtzO16FDB8pyTQP6zvOkcn13RTBmOuawFR5rcH9SKCpNtVVU4zbsIR1Iu+Jm5ZHbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQHp2yZsK+e2ioy8wswR6PSZqIAIAMOeejkSV5M/CS8=;
 b=Kqy5qDDpTaBwyEl7fq5771dGb69sDAtRO45TdM9/rfxHD5CyTSp53lAfrHsAwUMvCpZ+amtlmUhJ9mGmOVOwtUUIiImomu2BnbY00DIuutiW90FhdV58f0pZrqrlEBzc0StbJ2fhkBUuDQLtU2CCJx/coN+ABfoYWAWisKphG0Lskwb6g4F2Xz9j05x1i2oEq/V9RH1oPudNmMftlBf6q4DBb4RzIMJdPFkmHEKQmS8Zz+X1/JuHzDNN8JmWEHS50fJMMUVZor3pB1qNBxBT1lN7zsOenaukyixuCcKKHPcw0E8waBTrAfQLqCkjgTbc9msLUoOBd6zeGUdPDSQeWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA4PR04MB7855.eurprd04.prod.outlook.com (2603:10a6:102:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:23 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:23 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:13 +0530
Subject: [PATCH v18 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-4-c98391ba446d@nxp.com>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=4w5tTIYti7iA3GrGZlldgwVR5QrapQ+PywNOE5b9rOc=;
 b=U+NOdzI/WgKPNaFztcklzOHcavCC8z3lE7XDm/mZwUt4np2FM1elxa61+w9ASzQ43yA51A7gq
 ECXlq7XDM2eB06Fli29mfplrklz+tR1Ul3+dMQrofWSMQ5j3Yr2cPJm
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PA4PR04MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 6247e7b2-0944-4af0-4610-08ddaf28976c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUE2dzFWMk9OZjY5b0ZSNko0djBOUHNaL0l4d1ZMU1NPYStwS0MxOTdKRlRW?=
 =?utf-8?B?R0doNzZ5SVJ0a1RncC9EMWRCMk43cW1RZytNR2VWVGxQTEpBR0t4SlFSSTcr?=
 =?utf-8?B?dk93NjRBUkpsZUd6R0dNc3AxcElsMFRFOGp1RDJ1dkhxU2Fwc0czeGdtUnB1?=
 =?utf-8?B?VWQrOXl1cWtKNzVxbWRyR3Q5RnVpZnU5UmlKcmFFeWE1b2ZXQSszS2gzZlVr?=
 =?utf-8?B?b2VvMEdxOEM2Zy9CNkhNOEcyQ1RNL2gwQjhIaEQyNXdsREJONlZIYUxLQXVx?=
 =?utf-8?B?VXRsenVudGhwM0hZNGM1Q2dLOGhCeXZJRkdiN0JieXFwSFR3N1UySUVvcnpE?=
 =?utf-8?B?eTEvaG4yOEZnNWtkN1AvVHZZQ0pVcGNWeXZFYzBheWFuWk85QWRndlV3aFUv?=
 =?utf-8?B?STIwQlcrdFJmUHlFMml5RFp1Y3dlNlRaTWtQTDk4WVIvTnM5TFQrRmErR0M3?=
 =?utf-8?B?TE5qR1pRMytXa0ttUE5Qa1VIbnVJLzd2MTI4b3FiZE9uTE02Qy8yeG9UbmY1?=
 =?utf-8?B?RFpGQ1M4ZWl3TmNBY1pBUDhoSDVsNXRDVzBNanBrZ2pUcjEzaGlTdGlVRk1N?=
 =?utf-8?B?WkdPNnZnQkVVSWM0dmQveGJkNERSK09HNUxFRHpVTXord1ZsQ0xucHQrdU9M?=
 =?utf-8?B?LzRsdjU3anJTQ1pCZ3U2eDduOExTUFdrcEFmQUFYQVMwaStreWFqcmtRd3VF?=
 =?utf-8?B?UC92RXZMYktOWFR4ckoxQjBVUUNsY015UExXY042cm55ODZHdkprUDgwSzJu?=
 =?utf-8?B?aUk1WHhpMzA3YjlJckVnblpST0UvWllFcHVETUVHODI4c1ZnSkM4ZTgwZ1c1?=
 =?utf-8?B?Q2JoSldmSDdNNzRvZVZhdlpsUVVxVWpHOVZaNmJBREVVL1hOVXMxaWhrL0lx?=
 =?utf-8?B?S2ttM2tBTzVTY0svQUtGcWF3MkZqWEw3eHNMVWtyYWxSN1ZoclB6eURrSHMw?=
 =?utf-8?B?bUdjZ2NodTMxNFNTeE5oRnQ0cmtGQmJKbndaZXlnd3lrbkEzUUFOSlpXTUJK?=
 =?utf-8?B?UDdFWjJpbVFuRU0wQW5GNENSVHRsTkx4R1c4cTNOd2VkM2kzVFZmS1JOTmlO?=
 =?utf-8?B?Yk55Y2FBeU90MDFnRm1NZ3djR3kyako3d1Y3Uk9rQTZCV0lLRG5JTG1pQjJt?=
 =?utf-8?B?bVBRMlFxYXBWbnIrS3cwTzBweVNjSnhaRUxVTnIvR2kwU2V0UXZKZkp0S2la?=
 =?utf-8?B?QmhxVitIeGJsa3Z2OXo1ZW5Hc0tMUkpPTVJxTjJ3Mm9YWVBQSXVVVDdJRUtV?=
 =?utf-8?B?MXlsVFRiYUJHQkVpUi8wVGdRUzMyS2hTdXRZQWQ5bThqaUJOaFdDRTdjeGta?=
 =?utf-8?B?NDJMdE1YUnhWcWg3ZFkxTkprVk1MRVkxT1NVVThWNHBNUlM1R3h5amJXbHNo?=
 =?utf-8?B?UG1WYTVvQzhOT0ZKaFhsN2tBSnpZZC9GWU9GRzQ2M1ZQSnViZ21KRWNaek9K?=
 =?utf-8?B?Q0pLbDNOM2RBNVZaRVZ2bmtLUjdSUE1uZitnek1hRng2UVRBT2JZMFJodzlV?=
 =?utf-8?B?YUp5MzFiaHhJaFhkbGJZWEZmb2RFZ2FqNklId2FrVE41OGYzZ0ZDdFBjQzJH?=
 =?utf-8?B?RTZlaDFaRnplRUloMWw1Uk9JVTROeC9sT1hqWkUrRE9kUnFldWdvWGNtT2lv?=
 =?utf-8?B?K3QxSnlmWkdQaXdHNFJTWDhDNW1mbGNFVk5qVEVjYnY4RkxxejdvQjlUa2Jl?=
 =?utf-8?B?bVdDYkwvR0FvOEdtT1VUblBTQ1l3VlNJQ3h4elVJN2I2cGFXQXZwaFZJbFl2?=
 =?utf-8?B?NHBLMGRHS3QzcmhyWWxBU2x2QVVMSGduRnBka0wxYkNaTk5SVnBxYks5dkJF?=
 =?utf-8?B?QTV5cmQyc0JQNDdVMHQ5djBsSUE2UE9WYVF3VEVMNzk4Y1ZyL1JoT2Iyd1VS?=
 =?utf-8?B?RndNSnpYcjR6MFhmS3FxeEJCMWdaUUVRZ2FJTy90eDFObGkreklHMncwZFFj?=
 =?utf-8?B?cnZYMzBWMEQ0Rkl5eThDZzkzdTczMmNOZitDcHlqeGVET0x6ZUNCckZTRXhs?=
 =?utf-8?B?YUlHNVM5VkZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFY0VXpSYnNlTFNaS2trVWN1QVNNNFdFN1hQQlE4RkI1VHZ2V0dCVUJRRFVS?=
 =?utf-8?B?eThxUUtjNjR1LzJ6ZkdvdWNGekNsVHRYZnZHdWVHaUh5dVlTR29tNkk4M3Mx?=
 =?utf-8?B?ZkxaWE1ES3dZb1lnSVEwUHBZT0lrbVdZdjdPU0ZYdzVGZ0tBR1BteHZLdUho?=
 =?utf-8?B?ZzZuYjR4TjZGODExQ3FHMVBWZW5nWVdjVzhZUTc3QjJMYjhhNUNDUWliZkRm?=
 =?utf-8?B?Z2FKNlFVbWZVeUJ6Vm8wSmpabVlvYnlPamZKTklSNGpBcmFXY2paZllEQ1l2?=
 =?utf-8?B?YnVIaWVjbzdIaVdaYVFuQnMyZkw1THdWaE1kcXYrc2JjTmhCUU5IVVNFQWF1?=
 =?utf-8?B?VnVBS2ZTUVNydnozVUEvWkhhNyt4ODFmdDlJZk9OM3RxN2lpY1BLM3JlWTlL?=
 =?utf-8?B?cHdwTXhkcy9iY1Y1UVpnQi9OUmc3U0tZUFozUWU3MHlYWU55dDJKUkFPMHl1?=
 =?utf-8?B?VWhFTmRkQ3h6YWFzVmtza1BGcU93a1pmRS9IZ3NOSjIwTEZzSjcxK2ZjQWQx?=
 =?utf-8?B?S1pWdE9vcFFqL0VNUUVxdDB3anRHaVdVZFF1Sytsb0l0Um8wTCtqblJBbFVS?=
 =?utf-8?B?cllxdE1aUE5xa2s3Zk5TU3hFb0s0QlB5bVpFZnZGL3NRYXJqMVlMNzZ3elI5?=
 =?utf-8?B?Wm1QeDZ3MXlNTnZDZGJNS0RETEliVnpxdkJyNU9NeUpIR1Q5V3pOeVlHMG5Y?=
 =?utf-8?B?SUZEd1BKaHJkanZpRVc4MEZFTEltRGlndmlGUXBRUWpnRUwwU1NkalNsbHJz?=
 =?utf-8?B?Tk9QdGhqVHFoUUtVVVhPMkFVSmtIdDRLTWxDQ3FNZGZFUmhtZ3R6NUNEenAr?=
 =?utf-8?B?S3JCaUxWOUhqKytvcXI5WnJLc0VoMDcyYmo1bFU0c1JZdUt3S09UcGhBV05a?=
 =?utf-8?B?emtSTE9mYmxzOXFoQytVUzhkT1JrbGpPL3Z2WkFRTWFhVGsvU0pYWU1kMVh6?=
 =?utf-8?B?ck5pbFUyajgyOXlabFA0QzNEZFV6MDBHN0xRSFp4bVNYcFFkTk0vMWhSVlNn?=
 =?utf-8?B?UHc0WTZZeTlwMFltM2NzRzY5WE80YnlKQjBRa3dVSHA4cmpoVmxvajJIUDl3?=
 =?utf-8?B?T1N3SlRSOUhFL2dFRmpuc3lhT2R6VHJGbU1CelB6bGRXcWE0L2pLZHZLNStT?=
 =?utf-8?B?THlPeWkxT3dHaDQyT1E4eWZ6c2NoUENVa3M5Z1NZUGZUTWxHbDNQYTZWcjhV?=
 =?utf-8?B?L3A1MlV1ZzRtQkpJUUpFNk9ZQXJvbTgxVEJicldrN0dHVHQvL1Z1RzgzeVpi?=
 =?utf-8?B?VFN5NHRhcmF3SDNtZU1OL0YyaFlpTGxZaFZKMmFwOTk0U0VnN1Z3cTdhb3Uw?=
 =?utf-8?B?MkIvWlloZjZCV1hzRjJTN1NsSDVFalZHT3pkTDlrVjRtMzJXSnpBWTZjakdL?=
 =?utf-8?B?MTBPOCtYbkFMQ3RiK0t4L1BET2ZPUDJqZVFUNVJ6eXF0ZlFocDIyZ3BWaUxl?=
 =?utf-8?B?WmZZRDdNZUgzYnhHT1BoL3M1dmc4ajNacVZmWnBKdW1OVFQ3TytDZi9BN0Z2?=
 =?utf-8?B?aW9Dc0tLUStpczRHL1E3dUd3WHYxMDlGMS95SDRpck04RzJKSVlDNTdMZE44?=
 =?utf-8?B?cEw1bkc0Wjl5RlMwZXlyM0JuK2FBNHUwQXdtakFaZmxpcXc0RWVpLy82WXNx?=
 =?utf-8?B?eUwzVmJyL2NXUmhYTlg1eDYxMDhESGZuUmhDVHB4KzZJSElTaGYrWk1CMnlY?=
 =?utf-8?B?cTBUalg1YWI1MXNxekVYK1Q2czh1TCtBOHdHV3NHUWpNN0RHMnhBb2E3S1Fr?=
 =?utf-8?B?VlBTUnA1SlJZZVhlUjl3MGIraFp6dnh6N0NRZVE0amFqM3VMN1hMUTRMVzhI?=
 =?utf-8?B?Mm5LOUhJQXBGMUNQS3VNL1BYWmJQZGl6aUNmSlRUV0lJbUpkU3VBZlFHY0hl?=
 =?utf-8?B?d2MyUnNjRVRnc0lUdWI2dEhIdDRFazBkendyVktWNmkyaFRXODNUclkycWxv?=
 =?utf-8?B?bTJhNjlodHk5Z2Z4L3Y2S0RFcGptYVN4cHpoR2p4TW13UWkzNFAvM0FBNFd6?=
 =?utf-8?B?ejFlWFg1Y2YwQnVBUUVob05HMXhvQ3ZrSHBQVkJjTUFlZEhrckNrMjlGdTRW?=
 =?utf-8?B?S0o4L3pQNDhJRFVDcU9CK3l1TWRFMXVkbVd5UExiZVpPZklkbDdWSmEzQXgr?=
 =?utf-8?Q?CD+AzVuOMe8JhTyQ64JUhDMXP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6247e7b2-0944-4af0-4610-08ddaf28976c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:23.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9IY+BKqk00bflktG7c3lEtwI4S2cHjMvvN6CSOCys2OihnWOAUGabX9LnEM0n5+S9NnYVVAwqDE9NAYFh84lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7855

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a070acbd895c..b233729dd13d 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -59,8 +59,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -238,7 +238,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 748eb09474d7..f26fb4d55a9a 100644
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
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
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
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 5f978c97da4a..40544cbc70ca 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
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
@@ -325,6 +348,12 @@ static int se_if_probe(struct platform_device *pdev)
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

