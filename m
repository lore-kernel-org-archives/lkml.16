Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F4B21ADD4;
	Mon, 31 Mar 2025 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447806; cv=fail; b=pCOhhXE1MOeoQFqfEFWT6YpyckYwH4X/6ZghiJodhN0rMYqr+MamxAjte2JjOoj6ORO20aK0+K29foOfbvm8+aKVXoGfNLp0Qmul+W59XwR0x3K/d+oVkzdqXw/emayhD9nFtLRyms8AZSV6ua0M9F46o21bgm2TX74KX7DIveQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447806; c=relaxed/simple;
	bh=Lca0eWP1thUX0lrJavIW4Pve2PFsHUOe0rBJVo4fl7Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sdoAuP97vWfHSLD2D0L0ZVr/NAX3duxxNBpfD/4BxkpbXSbiYuyR7yyxd8uB6WfBLUcHxiTmUMFFifNEcKPKr/HyPSZrU6VtlayR+nawC38fGeDoCsImy5pmJF1G2hILIqjfccdVmwTF7NjdpqFdZPL+gU3F2ZLkCGU+ICUKXgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A1n8MZRY; arc=fail smtp.client-ip=40.107.105.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A1n8MZRY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OosIdn4wVtkgm6fm7cxPZFGY2CT+Z+51jOqiSOGBjIXEmUXVvkyewbCSmWHRcg5wDeCJhWKVOoyq/n1Rrk5BIOPIbz+6sLBkWcgxEb1opCx+jVsZDEmFtZLt9MiT6LF5c+ZlZRiU17QUk0k0yfDXlHh/B1m7sfKemKfWa/uoRcmBft/xPRfLiFmoytbPSzCpuEDHYDEpyb1X9afSvvluhE5vbPbxh/eRLXr0neYhRJfDX6BBg98zKX/Hq3IJocNBVhT7XwTcf0CrhFQK0DFv/LDhS/Hd4PF5bIlV1BDLGCyUDstsizfuwvf4QyYL1Cqp2zLeR/2C+w0F5Ixo9E4fVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k5RxLS7FE4cDKq0kg1vgemQ8TlXUWbKUwU78zrT7/w=;
 b=JaMQwI8Um+zpgtrpCuNG7k/lxRLdN/OrA9A3P4zhrbPk3vGgGiQAGTdc434GQiKB2IxuHnrpkbNZCCNWyeteabFkC/JMCLALUA/ku28pPli4IvEoxHMrm1AOD8Cjdff8q0W2RURiInMmsVN0xKiW3hXe6iORbcSYMorEsaTpFc9B4KdT8BbGmfkqgD9BVLsXMRdkmJnmhTG8zYn/pE1z9zjnZRtedJQxFeGsDFeaIwlmdO+q9ifraK+Pevij1+cNUyc7T/m+/sRHEUU8knwluk/G766OP03WZrIoO9IouXXoRjcW9Y/MNUei5Zu41DGsIe4CRwyOcjVBYmqJEes6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k5RxLS7FE4cDKq0kg1vgemQ8TlXUWbKUwU78zrT7/w=;
 b=A1n8MZRYgkvjTRpHt8g6eaPRnf05OdK29bN3SmWMFaznBQzEzUQfSGyQG/4VstcI63h2ZWB36vMzbW6Oluy/2bbRyKkGJZOkSNGpVb+TIUpRLx3TJ36G6JZzgUzwU90jX2S0kgOlnpA/zKMod8aW7BkBk3UwFT1m2X0o+69luhBuPJmexs30KqTPHS+GU+3HR4h5rYSl6kChXf7K7F5iPVd1vNizP1ICnQt7jLtGb3G02f8iSt/mtAtHtYWCcHzpdliM4Tv4uk0Sjc75PWppYcy5XV3H8MgCFU2aY0yCoZe1iuKPt+lymVBBdAAuuK38yV0v7CV9L4gttcAdteJF2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:03:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 19:03:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 31 Mar 2025 15:02:44 -0400
Subject: [PATCH 6/8] arm64: dts: imx8mm-evk: add pcie0-ep node and apply
 pcie0-ep overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-imx8_pcie_ep_dts-v1-6-270ef0868ac9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743447781; l=1928;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Lca0eWP1thUX0lrJavIW4Pve2PFsHUOe0rBJVo4fl7Y=;
 b=OjDsOsGWiW+I6kP1qM06T7wHgRiwl/vV5DKIrtCxD2QItsK6OSUAUH14KCiHRLd3uCtOBIxVk
 kFpKLUmgNnICIJKMYMqzsSdkwqEbJfE506kzEWR19Mrg0W0Djm+hyjj
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
X-MS-Office365-Filtering-Correlation-Id: dc169a48-b0bf-4c1e-3708-08dd7086b505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVVpSll2b2E5N3hMVWN0VHZIcU5PL3M1elVRLzEyc1lTZWVib05tTStja08z?=
 =?utf-8?B?US9iZ2RtUGNqZEpXRjdxaC9iZFlCRnp6eUdMVzNXeC9WTDVFMzVCRkdLT1FV?=
 =?utf-8?B?dExMb3NoSUF2WDNtd0t3T2hrSGlaM0lWbTFubTlhcTl4TG9hak5iRWV0cmky?=
 =?utf-8?B?M0RObk11SCtVbTFNc1FqZTQ2UXFETlR3eCtkSThxNHg2dE5WN1RGZFJaVkNp?=
 =?utf-8?B?WXdXWlZlRHpiemlKSG1SdUpaME41YmlKcE5vL1R0S0Z0UVMvRVRPanRmQ1Rj?=
 =?utf-8?B?dGNuTGlFTHN0Y1hJY2JVZTZOcTJLQ3B2dEtXNVMvdjFXM2JQVzJPL1V2VzZR?=
 =?utf-8?B?SWUxWm5vTTFuZDZ0c2pkWVZFM2E4TGVWWGc4TDZtWE9LME9QL3JvOUNRNnZr?=
 =?utf-8?B?UmwzVC82N0VwKzUxa1o2SXdxeXZJZ3FQWUl4MTZhclBlQ0ZWTUs5bmJtTEhJ?=
 =?utf-8?B?SXh3ZzZSelpUQ203aWdzVnZ0RlVxcmVkRUVPbXF5aVc3SXgwWGxUK3Q2L1ov?=
 =?utf-8?B?c01XNDE2MGpyWStXWkNEL3RSSmF4ZG1BdU1INUdndmNja0pPblFlRHJDaUpE?=
 =?utf-8?B?cHVBK1FCNGVGSUQrNWZKZ1JjVy9MelJla1MrdDFrK1U1SS9zSEVlMUdjUnl2?=
 =?utf-8?B?SmxOYnIwQ3ZIRDY0d0toclZHREFiWGNXNEI3Z3phNWhYWE15RlNuZG53OU1Q?=
 =?utf-8?B?RHlvK0ZmdzFZSm10YUdEWXRpV1dOWXJhc3FrdGNiODFvL0JEZDRzMk56bC9k?=
 =?utf-8?B?SElvVHgyYkw3Tks4YXF6dERJNXpyYjF2QnQ0Rk9tNFQxemN1a0NEMTlPeUha?=
 =?utf-8?B?bHQzTnFWRTJGc0JZaXF2THVmbDYyL2pocFhqMk56cDlpTG02L3hwai9GUzJ4?=
 =?utf-8?B?UUlsVnlMNFNYVzZYUWtiampaWXNUbks2OUV0WVJYemhkUUJ2N3orTDg1M2h2?=
 =?utf-8?B?R2Y1V2JpVzlvOFRQMm1hUXlvcTUxSmYzZ3A1bFpkY2NkWnQ5cVhqL3lFSHo0?=
 =?utf-8?B?Q3doTkp6c2JLYU9DbEIvTjRuMG9ZajFueTBZakxpNG1CcEt1NmhyNnFZZEFL?=
 =?utf-8?B?RWVPajZKRlpkME82ZHR1Zk1IVFhaRGZyUThaWmhCaDdUY0pvZ2Erd2xOdWlD?=
 =?utf-8?B?MWp5R2tBL0E5QjFIbzg0UDNVc1NJckI5Qk5STjRRdDVnbEJPZ0xpNXJjV1E1?=
 =?utf-8?B?VmhrdUJOUXdySDVUemRtaWNuQVoyS3ZsNUpxR21uZlpjR3RFN2lhMDgvcGUx?=
 =?utf-8?B?NVZkbUpMQzZFc3ZtZ3lTaFF6d2xHMHJMZURiNzFEQk9abC9CL1ZJeDIwUldu?=
 =?utf-8?B?emMxWDE0ZVlvTjZUYXRmSWY4Q0RhbnZHUk81YnZBMDRSOHhkckpEUVAwUUlI?=
 =?utf-8?B?aG55VlRUTzdaRC9rKzFaUCtIaFRsdEVqMHJTcFhyS2NkVG9WVWY2V01KTFU2?=
 =?utf-8?B?eHJKM0lCZW5oMUZNWXZMdWlwWmlyYXRzbHh5WlVaOGsxRlJ0UzdiOXVHeFVn?=
 =?utf-8?B?ZS9HRGxCejVOUW5Rek12MWpLcG9oODNNNlYxVnBFSGIvd0lpWjZCNGtMT3ps?=
 =?utf-8?B?WmppMDZyaSt3MmVNQ3BRQURLWFZxUXczaUk5Y2RWcnJDNHgzTXMwTXBWSE1O?=
 =?utf-8?B?REMxYnc4dWFZNG5pS05mNnFiVTE4anprQlRMcnNuOXZTL3puYXFHVUhibHlT?=
 =?utf-8?B?SVFWeUxnR29VUFJVcU5OUUMwc0Y3enBQTzcvdEJNdTVPaXRrZmNWRjlhd2k1?=
 =?utf-8?B?ZkRqV3pqK245dFNYN0RTd1FZa1JhUU9JL09oMzc2UTdrejR1ZmpyZXRsRW9K?=
 =?utf-8?B?N3A0TTVDM2JOTy9BbEx5bHF6ZytJOFE2anpZSGR4VU1RclJxTmJIbGtKM0Nk?=
 =?utf-8?B?Q0hVSXhydVNuYks1NHFwK0FSQmtoUDByOGhwOGN3dEJQaGhoekxKdGM4L0RK?=
 =?utf-8?Q?PdtQQU8hTxBLrK3LCQduG+2zrdu3ESCQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3UvKzBUSjJEKzdReWdCSXZaalhUNjFnMlF2bzNUcnJ6d2c1b0x6cXRjSGkr?=
 =?utf-8?B?bXF1YmtVdDZMT08yVU53TXh1cVlZOE1DTXFkRmpjZmpaT29taGNhM1dkelVZ?=
 =?utf-8?B?aWNkemlORkVzRlFId2dPdzNtL2lhK1JWaml1dnJ3RVdQdDBrMzU4Y213aWFj?=
 =?utf-8?B?MTZSZVlMNGdoSEtQMFZUMHc2S283ZmpFZENUa25nM1NZWFNZRW9hdUtsazdO?=
 =?utf-8?B?NkJtcjFXOGZneXluWjdQRkVSQ3dlaDZQU20za0huaFFrc1g1WmptVHZKRUdE?=
 =?utf-8?B?aTJ6MnhrRkRCU1hEeGVxandkbSs2MURiUDVadmxsVU5Ga1diaTB1L2hvMzN2?=
 =?utf-8?B?QnM2QWI2bE0yTjVJeCs4L29zVVNtOHcxU3RKNEpBSWFiSFFQcUFONWY1eTBh?=
 =?utf-8?B?b1JVQ3VjMSt1MDU5WHJkT3ZoUG1RWDZMTjNjUHVBQUwxcGo3dHZpN0NsWnp2?=
 =?utf-8?B?RnJHNVpBWXFDWmY2M2c1YkpobUJ2WEFZV3NYRmhyeCtFZlR6eUk0VlhoUHp0?=
 =?utf-8?B?b3FCeS9BUnZwVElwY2hTWThCS0NTeUxMeFJmYmQ4Qk1aWnRBaDc2a1JRMndI?=
 =?utf-8?B?djEzTmVjRXNMdXk1L3VYeEw1TlBWd2xJcEV5dDlwUmRYNGgzTlRTZit1cDFZ?=
 =?utf-8?B?TC9sWW9ndkJ3R3hqUU9wN3QyUm9IRFcwRVJsVmRodlJJUi94ZDNBZW92WlMx?=
 =?utf-8?B?TEdDcHNkMUUyZENKUTViUlY2NzE2WWpHa0c2Q2pyWHh4Z2hVMk1PTWp5WGVZ?=
 =?utf-8?B?djdGMVYvRnhtNEFhMXJxbjIyMWpHdVYvbFZTVSs5d0JzRk44Q0VrUXdycXQ5?=
 =?utf-8?B?aGMxeXVoMUdCU2xLcWxvU001K0kwbVNSNmtqNDYxV1BXSyt1MXBTbFA0cG1Y?=
 =?utf-8?B?cUVQSWV6QTdtWVlTQWpEak91WDJOVjliQmxOSTZkbDJJOFVNN0ZDZk5qM3h2?=
 =?utf-8?B?S1ZyVWFpTVMxUlRhRmxvK09tUy9vZ0xud0JPV3hNbVhCV3NWclZpeStUcW5m?=
 =?utf-8?B?Y1BtSkphRFpVTzE5SFBRN0dvRThsUTNNczQzYjJReDVQb3BzdHMxRVVOZy9o?=
 =?utf-8?B?Y3JtNk1GVHZTYzV6bkg1eEIwd0Y1RE5SVzd1V1YyOWxpVWRySjN3TlphN3Zy?=
 =?utf-8?B?MEN1b01PY1NLZUFWTzhlWHRLdVBld0IreHNGMUg4NE9OOEg0U1NrM0VVNXhv?=
 =?utf-8?B?clhDZFN0aldXM0F6bFB5b0hQbnhRVHFseVJFMHpKeHhzWngzSHFiOWFCcmU1?=
 =?utf-8?B?d0VSMEJDT2E5YnZPbWh1a1VrMCtyNDk2cWFReXI5Mkd4ZmgxWDRWK3cvdWxR?=
 =?utf-8?B?TCtvMm9BOEs1QzUxYTBmT0UwbzVodFJlaXo1bnZmNHo3cmgyZWNMRW9aMDNz?=
 =?utf-8?B?UEtobE1aRjNkYzFiSlVhNHdoMjVkcEdSa0ltczdyQ2dVSVBhZmZHSHJWNVov?=
 =?utf-8?B?bkpwSS9oUndzMkVRUCtyZjBDQmdUUEV5emQwSzY1cW9pTi8wVGJGalc5RDVr?=
 =?utf-8?B?OExtVW9wekxrakFQNFFkZmZaUnV6dVkvQUtsTzFIeTFzQU5ZdEpZN2lSbDJx?=
 =?utf-8?B?RG5uTDF3dkRJK3l6azlybXh0ZmlyeEl2N240M3BneEwrcjVwb3BTa1FkdTFt?=
 =?utf-8?B?Um5MSzM3R1VTVnBkR01oeCtuYXpKRHp4TXlPTnpscU9XaGN2dnZDbzVLUDhE?=
 =?utf-8?B?WmQzRnhyS2RkT0RKWFNqRnM0UTRiTkc2Ti80UVVMSDE1Sk5LbHJxTm1sbCtO?=
 =?utf-8?B?YXUvcjRYQ0U0d3hEeWdOeUYzOEJybU5IRENjR1cwODh0d1Y4SnFaK244TkZE?=
 =?utf-8?B?NXNFa2VtSnBIMUQ2dFBKdk9MaHl6NG1lcWFzdzkxZDZIdFMxNEpMd1puY2g5?=
 =?utf-8?B?dlRSRnJaOWt2ZkFXSVZVbkx1Z2o4UFMva1YxVXdrbGJ0eUNlMjNVUEFTSDdN?=
 =?utf-8?B?UmVMdjVtZ3ZWL2cxSkZtZGFqdWxSd2lMVDJmNE1KK1pSbHQyYzRBOUlRdTNr?=
 =?utf-8?B?bXY0akkyRng4eXZoRTJtM2xFbEdVTDNreDJSTVZ6NndjL3lNUGxQQTlOMUk5?=
 =?utf-8?B?WXFZSCtvU3dLenFFclRMQ3B1NjZURTlDN2Nsc3RyN2kzeEw2TzZoSWs5VThN?=
 =?utf-8?Q?irfwnIdJ359I9SCm4cn9gnMmL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc169a48-b0bf-4c1e-3708-08dd7086b505
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:03:22.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdpYgO79mmIXGpO0kq5y3GKeJoeYPa5c/szjThILsJt6vJ0eY7V7BCj4tWCkBw5J64Ey4kxdAwEhtwtQ7BGeGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

Add pcie0-ep node information and apply pcie0-ep overlay file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7778a0b3abe37..4f2f50203dd86 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -116,6 +116,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-emcon-avari.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emtop-baseboard.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evkb.dtb
+
+imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
+imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 5f8336217bb88..622caaa78eaf1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -544,6 +544,19 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "disabled";
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";

-- 
2.34.1

