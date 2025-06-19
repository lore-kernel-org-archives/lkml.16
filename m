Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011071.outbound.protection.outlook.com [40.107.130.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643B23B628;
	Thu, 19 Jun 2025 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334319; cv=fail; b=QGgeS0yfj66DR5Y+T3W/igZN1aqU64P/t06QAfmnw5jN9uqDx/61kMMEelxfCOVLylQpXxhdAylNNfuqEo309Oo2SxoEAm0AJycZvMMeD30NTpAFjwVnUwVDFPJ0MojxMZf/7AT8whUVXURelw8VUOKo4PEeGab/Zyt+7RK2i2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334319; c=relaxed/simple;
	bh=GMywwPPLpDIYWbkQcDasFGfYFbhOFlPH7z5oQohTxnI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RzsoV87QViwadjOLKX9gd47MCmfORvVe7+Dbi2Lfi2Mxk0JDo4DUFg44P/vCX4LJc7gJszdL292l3ymfZmu9tZXPXWOU5etLAznbOQd/qaQEnf/ffNisnDnfoi1B6V6LKNPMMeYSQ5YnW2w78HMTMVfj4Jgt0dymLnLMgIkw7nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K48H+d66; arc=fail smtp.client-ip=40.107.130.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K48H+d66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2Tv/wFwommedl8wdNgtOWfsJ06a1xVbKs9MHlckclyQxBo127LPUU3wFvIL3JMQ17wTFfEXhUQEs/YAoE+hdwUZY09p7/CRrUyp8GxZmfT5tzcKV4pP/VLwxMfibD64J540RyMcF1eSrY3oGYJEppSGk0qG8Vj0GE7LJE1eldkC/9UkcO7d7LbMjlLViHKQKFVzQykYSVp7fcPO1UePvUhPrrqOzmdLHv33BjLetWVMWNGA5kMt35Q6+MknoG+xoWe+bviKBKHTTOjT/LIvf1QAfZEvbILll6fleWstdS+57dq+WkrDIEb7+rAYayTg+eObABg+SQbAC1LAGksT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQkhRbKYqUMp26PfeCEazdhaCyBcnhNy3eFBR1z0/fI=;
 b=sS7uiR4lVzGq9Blt9HXO2UIhlmuvF8PgM6gmnURS3oEzuCjv+H28YpgB33TgUpayOmx6+OYORmUsYkrMXaY/XMTXv/6TRGcZ9vLHn0ox7atoFp5zXnW3TeEe4oWXFcm+3oh4RtGEH6IZ2aun/YGsP9AEt3pEMuNZhDDj/LckFIQHOkpzQQKRf3NRW+mc+kWG++XMhZqyh+3yPO84hGm5S2VVjgh7smfRwvEXe6vStlIFbq8xM9EpjaRjO7PhxEd4+qpHYIyWiEEQhU2UaQ9N1dNC/fZSPuuDiNm9NCB2W38w1UMT5inG20Dv2wEguUqmzd88RbGWbqS6IrZNSuyCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQkhRbKYqUMp26PfeCEazdhaCyBcnhNy3eFBR1z0/fI=;
 b=K48H+d66PC/xe+Vy+EmcY+eSLAxp1qNSCn6NDoE0XKupV/ZSKX0pMDbo4SlxVFSmh+wmqehf9OxMi5DGnAxO/GZ9YG42WfBgknwvOdSS8630VgFggzfuMMNgLw6/M7uleo+3Y/ve9Dh2Yz9Me4DS9ktNZrShQbtI9qyyo2t2YUfAVhE2aWNuzUNCVlJ1itvZyZm4jt/7F8TR0Gdu5IQm0fIUwcs5F+CH/vnWSnVLaE8p3rbC62RCbaIzDi7gn1hWZkggSUdcSVYhNz+SceA/sZoAOEh3H5HsG8Rw7qjGPMwmnl/DNHpkBG/s1oEtomzQDH9Su38Hup9drqL7YQC2cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PA1PR04MB10414.eurprd04.prod.outlook.com (2603:10a6:102:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 19 Jun
 2025 11:58:32 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%7]) with mapi id 15.20.8835.032; Thu, 19 Jun 2025
 11:58:32 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 19 Jun 2025 22:50:15 +0530
Subject: [PATCH v18 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-imx-se-if-v18-6-c98391ba446d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750353651; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=GMywwPPLpDIYWbkQcDasFGfYFbhOFlPH7z5oQohTxnI=;
 b=3+IHJRgM7m1IMEP7/x7GGtZ4c5TBgXgrN+R3qfIhRC07+o9qfhrwmRJ1ZaJCp869mv5MTfrEV
 K9+8zE3YLh1DveUIyLo16Hj07c/J6i5ahLJ5Y+HIuEHWcTkP/bKXqs7
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PA1PR04MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: ea99fcab-4ccd-4f53-e8d7-08ddaf289cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXFvMk9KUWFVRDhML3JJaGIzUk9UMEdhUDYzcTQzYXF3ajcrZ1JXeldrWVNv?=
 =?utf-8?B?OVphNDVJRG9HS2xSTUFpSHBPaVFoV2oyZlFkajlXRUozd0luZTVReElsVUdH?=
 =?utf-8?B?RzdoT2dIdGFjVHpNK283WkFoK3ZLRHlEb3VRQ2lWVXNKVUxaRzdhMmY2ak1L?=
 =?utf-8?B?OTN2QkVVTjNUd1RodHV1Y3hrQVNXSlZQZE1yYzhEa2RBaUd5R1lnUDJxY3p3?=
 =?utf-8?B?ZmF3bVJFR1JPZVVTVWFnaUR6OHFwTUcwVXBmeHRRSzhjcGNKOGk3TkxLWXlO?=
 =?utf-8?B?bDArbFg4eGNqMy9tSm15Szc1Y29nbnd0SDBKNjdwUDVLN21EZEo1dmEyN3pK?=
 =?utf-8?B?S0ZiQWR2RjZ5VEl6NnB1eGNoZVg4K2lORXpuQ3pLZkJ4QUVvQ09QOGd6Y3Ix?=
 =?utf-8?B?cFZqY2VrL3BUR0l5eE5YZ1dVamp0QnVkd1BVZzlDSys4dzNZRUxpNzJGeklW?=
 =?utf-8?B?UXZPUGxKSzdtTjlOMlVhZGwzWm1EdjcwSExJUWd4Ri9nSXNIQ3FENjlkaW92?=
 =?utf-8?B?VEJ6bm4zTWNBbW9CWmpBdDJuSmF4RzJXVmVuYStmeU0zNjlrcEs5dlJ2bEo1?=
 =?utf-8?B?KytGZDJyVmFVUFgvY2RseURyNzFiUm9IeEh4MXc3OUpvQmQ1Ym1vK1JsVWRr?=
 =?utf-8?B?VnFXZ2hFNTFMOTY5RHBWVUV1ZUxTTkZnODNTWVdqRTNzZjl0SWFONk9KSXYv?=
 =?utf-8?B?Y0hEWU11VExRSmd2VWFGSldLZXhTZmVmcFJ6TURoTGxteFl5cmFWYU95ZXl2?=
 =?utf-8?B?OEtGTFBjV0J2V1RqUlEvWTBrSU01UENaNnRwM1JCY29wUVJIckN0MkJTVFA4?=
 =?utf-8?B?dGlMZTVkNmNjTWdocGtxOHZ2dmQ2WUFYak4veWRjSzVIWlJqSndHUEVRTlpT?=
 =?utf-8?B?RUI4c2UxWFNNUkVMTVErYkpDTnNnT2c0M25CczlpaUdITk5Ydy8vL1d3RGlI?=
 =?utf-8?B?aWxvVUNkNmZqK1ViUmhXelJpRy9lTWlnS09uejNPbVBUTjQreHdKZ01YcFJB?=
 =?utf-8?B?eVhZa3d0cHFTOUY0c0FvK2lpclRFTFR2RXZMckNzLzNmOGRoZmFienNCbDhS?=
 =?utf-8?B?amNDdHJHb1JNaUJ3Z2p5SWtjRGRSSmxxa1o3cG0waWs3SUN5ejcvVWN1T0tn?=
 =?utf-8?B?NDh1MmkrdVNxR3hnYTFSSDMxb3VPa2VhcHV2dkRWdUEzNkpyY21pNWkxWEpU?=
 =?utf-8?B?bWF1akgrdUl6UTJ2KzNRK0k4K3EwcG00YTBYRG9MQ1hLa3RHb0YwZm1leEts?=
 =?utf-8?B?U3YwZjRDQUVQYTlkTmxreXZuZFJIWlEvYlFvZlR6UGFnUzlsdndDanNBTUt4?=
 =?utf-8?B?b2xvYSswSEdkOE9GNFNPYXJIVVFaZVQvR25LU3VmQ1ZSUXVnZUs1bCtIOVRP?=
 =?utf-8?B?bDdPd0dkUUIxVUtxMk9WaStjZ0gveDBtTEpXbXFLd3ZHSVpNRUEyYUlaVDht?=
 =?utf-8?B?ZHBYLytLeThscEFFSTVkT1VjSUlJbjMrZG45eVV5bTFORE9HQnhJczhlUmNS?=
 =?utf-8?B?OFR2MWZha2RjMGdLbWZsNUtIYjFZeXoxeGNZcyszOWlXNHE2Z1M2U3VjbUpF?=
 =?utf-8?B?UEpFV0xPTHJhc0hudFJvTk8zSVZJV0NBRFBac1hHcjRFTVY2bGY5NkhWUXdk?=
 =?utf-8?B?WDBUWGphc1VSdVNhcXZJQXp1VHhZZWNtR0lnTGZtT1hDZGRzK2dUQTk5N21n?=
 =?utf-8?B?RGIzSUxoZGNqa3BnNGlLWXJzTC9YWWFvTSsweUdXWm1EYzF1OEZpUE9VTDVz?=
 =?utf-8?B?dmhPOG9aVk4xaDY5NWJGaWc3NHRwZjU3Qk1RbEEwbTNTVU91emt6Y3puZXd6?=
 =?utf-8?B?K1JBaTRETDJTVUwvQmJiVTloVTBETWZWb09JRnlmZ0RDbmNRL1J2ekJCS2E1?=
 =?utf-8?B?c0lLaEpUTCtlYWtCWVE2eWo5Vk90cHhJSWIyTEZ3SURkNWhSdXNrQkovQmlB?=
 =?utf-8?B?azQvRCs0NlVSSzkzRTRiZ0RLaWFFaWxMMWNZdEtYTmc0eGhLMkZCSlFlODhB?=
 =?utf-8?B?VkFHdlRvL09RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGdLWFViclZ5OFhiY29XNGhDZU5LcVB5TVE3Y3lWYy9tVjRCeERtYWJxTXJL?=
 =?utf-8?B?ZG1RUmIvaWtWTmxsYWpuRVNNUUx1OS9sZ2cwV2Y4bXplcG9XbmJLQ1Jmc1JU?=
 =?utf-8?B?a2NUN1FtaFdQbFArWlV3Z3AzdHRiS0Y4MUdkZUxsektmWGQzSEtTZWdBWTE3?=
 =?utf-8?B?bHpCK2YrUUxhTDF6WGEwMHpsR0VMM05kR1ArQXovb1ZBRktNdDVwSTdhbTFq?=
 =?utf-8?B?WVBGOVVTY0hucEptMzV2Q0ZyL1lydmhuZkl4YjFWUUY1K3N4YTNsU3lWMzhJ?=
 =?utf-8?B?Tk1LcnB5VTVVY2w1VnB0UWo3MVZjUWgyeEtHcDZYOS9LcmFwSktackVMQmhw?=
 =?utf-8?B?M1E4UHNjNVZ1Z2lWTExzbFhQTnY2aTduUjUwVXI2K0Zic2psZXZYaXhTZ3Zu?=
 =?utf-8?B?QUlnQ3ZUYzNnN09QSnB2aGNYNUFWUmc1dEorVXpEdXc1OGtYMTFvWGlrZzR5?=
 =?utf-8?B?b3U3c2ovbGd6SEdkekxIb0MxdWJEdWF4T1l2dmxJOWYvLzNXKzlwdEtjVGRq?=
 =?utf-8?B?WE5KOHJ1RzZZRUpDdnBBckdoUUphcnZyNVVZTGIxSEpMTnJJTkJBNUx4TEJk?=
 =?utf-8?B?M2tveFlvZUMzalBMdFUrUDNrMmFVZEphMnQ3NkJ0WlZRRTA2amtCV3JGZTR4?=
 =?utf-8?B?bytRT1ZBU0lEeXZweVUyQzRxdDV4Z3dJT1JMTmtDbFkwTGtIWDhVWDdiOHpO?=
 =?utf-8?B?ZWt4RWJxTjgrZEp1Y3hDcDY1eEhQdXVPRzhHaUNFdTR4M0FJdURyM1VyS3h2?=
 =?utf-8?B?cTUvbEFNZFQ3Ukt4ZjJBNk9hVFplSlpjZms3enlYck9rOU4yanR2MlR3emNB?=
 =?utf-8?B?U2JERVYwZDRZTzNRSUhzdXV3WE1QUlpka3docERwa2w5OUkyM0FPNmRNbDhE?=
 =?utf-8?B?c3hDNjlqOXJwWmFjcGVzM1ZVcmpyWGNqV2dZNWthbDdMWmJST2hMSEVwcVB2?=
 =?utf-8?B?Y2N6aU1QUkZGc0o3d0VRUGxpbHlxbzk1QzNEWndibU8rSEI1SnhTYzhVSldy?=
 =?utf-8?B?LzFzaC85QTkwaDJhWklMME1yT2FKWERFS2RVc2lxZjRtM1h0bGhKcVg4ZHkw?=
 =?utf-8?B?UXFZc3liVzJVRFZERUI5Z2tkaEZCYVNqRklRZDlrTFNSdVZIV3ZGbVkwVytt?=
 =?utf-8?B?Vzk1aEd4dXRVMWkvSW1GeGZGSGhiVDZlc2hCTlNYU0N3aE5JNDRnNy9GZFhq?=
 =?utf-8?B?dE4wRmN0cmVUTUVXakV4bWEraUhiSjFNOGplQUxJeTE3TlQxOGo2MWRGdGJV?=
 =?utf-8?B?dmVCbVEzSEsvaTNlUEMwczhENTFwZDhGcFY5R2Qxc1R1ZnhwRTR0bENlWm9x?=
 =?utf-8?B?NkgwcklTOTFUTDF2K0VQekNpQ0VJU291TVJPOUlLaEkwMnZiaW5LSmVLL2R5?=
 =?utf-8?B?a1haelNsOGdOcHZPcnJQVDM4eVJKbVQzdEhnK0ZTVmVSZzVQd20wSVFSU0xV?=
 =?utf-8?B?c3ZsWWdVV3pWeGFhQTBXWWdiQ3VhcWZRM0NSYWE3N1VNQUR1aE5DS3Fla3Z4?=
 =?utf-8?B?LzZKcDNaRWpkcUUrN1MrUnJiK2ZQeGFZMTlCN1dhdzhIcmV2RXZsNUdIQ25J?=
 =?utf-8?B?bTVIWmlCZWY4dzh5T2FSTXA3T2RCRHRLYjAzZUdVS2gvQk40bGJXZVk0M29Q?=
 =?utf-8?B?K1JUbTFlbitYaFo0SzhLb3MvOUJPcE05S1d3ZXVNb3RjckdHbGlnTFgxTVF0?=
 =?utf-8?B?RENLdDhPMk5PZHBDTGhBVUNVWDVOZ3hRcmlIck00eSs3NEZTdTZyVi9iV3FS?=
 =?utf-8?B?WGdTYXdWZTJYZ2o5VWVoOVlmMWNGRllyVlhXYlBSbTRtVGtZN3drdnUzWGNa?=
 =?utf-8?B?TlRKY0dzMkdSdGEyQk5pNlVsZXlFMllHZXZoaUg3alRYNzIwNG5zTFA3Z3RB?=
 =?utf-8?B?eTd2RW5RNXpJc2VvSzl0djFOcU1Edm1Sdlhud3NRamViU2UwZ00wN1V4MlMr?=
 =?utf-8?B?ck9vMm1XMElUdEdScHl0VUlzR3RDeCs0aVpTVUtjaTViOEVSTVpkOTZFdGpt?=
 =?utf-8?B?bWlORkJSUWVUaXVRZnhCdXV5V3M3Yy81OGl6bzVXalQ1Q1V4T1lGcFgwNW9k?=
 =?utf-8?B?Y2VJZDZldTRuZFJxQWRuZ2JhbmhaNjBqS0VjTnRBem9xd2tqL0kzekc0Tm84?=
 =?utf-8?Q?QhYHW9mCXqXhgH6f7WwV7XOeD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea99fcab-4ccd-4f53-e8d7-08ddaf289cbd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:58:32.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dsKt0uyis/TRNmnldydFqxnlC1w38rlMICPKKHmeqbSNvzBTzLxQuxy3njV7IJqTUNCoBXTDUKGYK7rYvAZI5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10414

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

