Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9DA6A8D2;
	Thu,  3 Jul 2025 03:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514148; cv=fail; b=dbDTP06d7z78rlUgVuTElVmQB9wmXlUHY+5SCtJ3qKfr6XA6AvvFbOK1xKNXx9cOuHZ2AbWaQkQoqfDOdYDe7W/P4gwTmaRJQypaAYx83W18ncql/8Jc1UXR7SUdK/FbY9fg90dRmo5DddlnyC9h37M092/TcFuKAZI6ktrnE5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514148; c=relaxed/simple;
	bh=FdjMd0wbKZ/xTmWlK69XA/lJMkvDcbq3QLdwtiny9ZQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=RpOyPjRRIO8aru7+VG4h0DXA/eSXKIQHmJzU7MuMuT50+gZ7E2NU4zsZW2tACymIe2Hv/YV0AqXOfKi59d7yhKkPAj8Ia5KrHTfygWNNLtUk14omn4G9uM6Uy4QTLDpOyk8CqilKBmK1TG2JjyP9nD4okEolSvIEOk2mZUJUQuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YIWRA4Z2; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YIWRA4Z2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yso+aPYLtcKLJorOWy/TSv1x8lP9GqwY9a5DmngO2uJ8NFSfGKKLN9SqYzbAyxc1fUHfDl4yGpdQSWmjYrJGlyrVgzu7JH7f5sdCmdeB5rk/QyhMDsP4cJgWmRDuLbq/9kpzat/+dDaIcbMsuMed9ALtYb8ptyqcuRKQKA1SA7WAHgz7HvktpL77uQnkuaA/UvDO4eCXDot1+uBQIUPa7XYHs0j+zBXMKmdphyhHhCZiaz538GmuKDm66DNLJfW2B6vgYL3klJGgGE3LICGtjPaoTyMCNjo+Up5Ir8PaaXW7b1jja3KHQ3YsJnVq6QV7BmC7CL/bnnVCAvUrCFgSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SwBSeP7SXIVaDVwTSXZm9MY1nEx0jiZAWQls2qs4mY=;
 b=jNz0rRVIHYIk1WCtm8HI+Zltp09LP1foCT+cGpfHtB+LpPFuSdD/vTNuXblFrewMe9qL28keoldlGhfCR0YYlpzGZeDFabKQniA+tUoP+ZsCscz2qsDOLSVO7HWmQPxj6xrzoFD/IqCAByxcg72GnSH/L4T+AF+fWZ+dTstWoDmQcVgJZ2fCwJmYL/s5kuoNqgFZOk2HqnqfsCQT5h8TJlq3TBsdrY8MKe3i1SquJkYYlJMQXhg8UKRG9ala4dMBlfBZWEVJMj51IsZWhwK5+mlbmLJ7aj58nJqGL2deGmcUDiBzbT72e3TKMXt72LmoZAJuAOp+EibiWTfrCZezwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SwBSeP7SXIVaDVwTSXZm9MY1nEx0jiZAWQls2qs4mY=;
 b=YIWRA4Z2BWGv/fjDKOMAMO7ZR0FmBKd9PUspocIzovBmSFQ+7TwEvQ26EN4icfijuKtm6Bw5FCdjnrWH0b/adcKrHp7Gam58V5rkT5nPZCXiCEOoHq3qDJetKQ/UVMlIuAoWXsq86DGCkhUQITTpXhq242Rg5alkuz7VgfNzQ+ZzrGgVQJkMa2Cs7FSmDPulK/L0nIi14BpCcCrcisNafT12CfjXhDZpH9DzI01CfiX2BAOjwLbAzk/MxMtz3dAYrguZYutKV1hbdN3+b0RTNizMLMlkdaLVn7IaVbQh93FZK2E7Sj8G+jlNTnR5gvJLGrBTR08iOGVRY+D2TPplDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:22 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 0/5] clock: imx95: Add LVDS/DISPLAY CSR for i.MX94
Date: Thu, 03 Jul 2025 11:40:19 +0800
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKP7ZWgC/32NTQ6CMBBGr0Jm7ZhpDVBccQ/DwtJBJvKXljQYw
 t2tHMDle8n3vh0Ce+EA92wHz1GCzFMCfcmg7Z/Ti1FcYtCkcypJoYxblaMd3tiuA5aokKvOaMu
 FqgxB2i2eO9nO5qNJ3EtYZ/85L6L62X+1qJCQyFl9s86Ysqinbbm28wjNcRxfaSEIDrAAAAA=
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
 Sandor Yu <Sandor.yu@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=1936;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=FdjMd0wbKZ/xTmWlK69XA/lJMkvDcbq3QLdwtiny9ZQ=;
 b=gjc0sANwse79zkAziosRClgzadQQnPiUc9UIpWAxZbvEaGVmq8ZU8ZSNU9RBXGItF/MV39vRD
 c+7+N+LuN4OCDUym8JxkwqFPkzvrG0rqaqTDVzbkFquSvfjE+7ZDYBB
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
X-MS-Office365-Filtering-Correlation-Id: 93e8f620-bcec-4113-4463-08ddb9e39e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFpzYmVzR3hLdG82S1lMTkxuRDJxVzl4OENGampWL1hzbTVSQ0ZBRXMzZ01J?=
 =?utf-8?B?eEtrVUdDUHJ3VGRiVm43RnoycGpSSlNFa1Y5YitBR1YrRnVRUVhjVDRmclhu?=
 =?utf-8?B?bzZQRU1ITUpzVUtNWnlpVGFaNlVlZXQ3L2lkazAvWmxmT0VTKytYbEZqRkN1?=
 =?utf-8?B?aHAzdU1EYWxiSmhRMVpkNStQN0FNL0kzMUg2NFlmb1RxOWxQNXk4SzhPSnNu?=
 =?utf-8?B?a2tNaXplbTdaT2JWNWFmaGRKejNoQlloTDFpRFlzbTRyUDZ1a0dEK0w4cnlD?=
 =?utf-8?B?KzF0QzFTN3owWDlVbERIS0ZDR1JXbVZraUR0aHJoL3c1NGxKWFJJeXdzcTdD?=
 =?utf-8?B?THVTSFJNZExhUk9CNm4yNzZLa042VXNPK1FNQ0xMUUhJZENKVFRYbVFqK0Iw?=
 =?utf-8?B?bUc5bzJKWWoxZlNVYVVzMm9rSldJWWliUkNXck5HUEdOUURJVThRbHNiQlBY?=
 =?utf-8?B?RmNKT0Z0aEg3TFAxd1ZPeXdta3F3MnQ0Q2xjUTkyQjEvaGh5bldjbnJtV3JR?=
 =?utf-8?B?ZUdobjhoL0hER0V3eUJGNnl2WlMvaFZXcE8zS01kTkVJSzBMaWNtMU1wMTRm?=
 =?utf-8?B?VjRlVk53S0Q5VnNhZFoyU00xd1BVMThLVGlVL1lSVXArRnJZeE5MeWkwOE1r?=
 =?utf-8?B?M0daWXNwR2gyNFptNjJ0U1Z2dyt6OXNPMk16bDIzdnhQcHp4OUtTYVh1bjho?=
 =?utf-8?B?SGV4eFo4ZnorQ3NhTnp5b0FSUSt6QVhHbHlzQXlPWUN3M2xuTFJpQS9BN1c1?=
 =?utf-8?B?dFdxZDYwdHVjd0t4VEdCVGdudEM2dmhXL0N2bmJ2MFVlVXdnVGZkbmNKa0My?=
 =?utf-8?B?YXlTd0VKclM4RlZYaWpXcUprUXJkNUo5S3lmckdXNFd5bkRnRS9kSWRLQUph?=
 =?utf-8?B?b241QlphYTdWejlxbjMwVFk1d2Y2UGdLVHZELzV4UWJEb0Q5Nk84NkMrREdm?=
 =?utf-8?B?M0Y3d1VQTFluVmdBUU9WRVI5TXhNeGVGTHVpemV6RUU3VUtyWDl6Uy9aZ1gx?=
 =?utf-8?B?Zlp2ZFd6aGt3UXdaTDFYRjNRbFpXa3g3ZDAzU3U4RmtWQWFvOUhwRDZyVHV0?=
 =?utf-8?B?RGZTUWR3UGpTZmZEeFZlb1lZcFhhVFNtd0t5L0pmUWRwalMzQUQ3U3JTdlhC?=
 =?utf-8?B?aTY0dXZKQ2N3UzBBekVGdzk2WDZNcWF1UGZMeUkwa1Zaa1Flb3lITFM3WVJy?=
 =?utf-8?B?Z2RlMi80Y2J0bjA3TVNnaXQxSFNkcHRHbUNYWksxVW5vdmk4WXdnUnhzRWxr?=
 =?utf-8?B?T2JpV1hPb3RUeDlWc1hvYVhMblFNMWZYdXg5emxVaVVZYy9tWVF6UkxJR1lW?=
 =?utf-8?B?QzV6UUwyVnV0TkdGUmZramFsZ3pmZ2hQdGs1SU5KbEROcnViU29GYTdIVTBt?=
 =?utf-8?B?WjU4aEVCZnZURit6YndXZjZOM2hLWFQyaFd5WW13UFBaT0tLOFBCTXlmM2pl?=
 =?utf-8?B?U1NnYmJTbmVyOTNBZGkrSjI4RjVZTUdHNjhUUk00S1JuYjRFQS9ORUV3cGVh?=
 =?utf-8?B?T1Y3cmYzZWRudE81VGxSbXhhWUN4RWFNeWpod3VnN1dBcm9JcnFzVjBNN3RV?=
 =?utf-8?B?ZzBJWkhkNHQyNFBpaXFKeHhvaGJMK3hOaThYb1Z0YnY4R0piZ0EvWGRiTWZr?=
 =?utf-8?B?dVQ4anUvLzVIVUh5d0lrUysrdTkzU2RocE1HWHJUT2VWMnM2WkNLNWZKRGFG?=
 =?utf-8?B?Z21oNS9KM25lbkQ2QlNOOFAxV1ZUZy9nYlc3M1VFeUdWNnN4MG9ndkUzUFUy?=
 =?utf-8?B?eVZSdnRxLzFoa1JodHZGc1l3UTB1MVErMG8vRzRjT0t6cjNwWHVkbkVuY2ZL?=
 =?utf-8?B?UUJIYWJXRm8yajNDalkrNFZoWW5NSjBHSkpHeE8xcVE5QUpwNzVpUXROYTN1?=
 =?utf-8?B?WjE2QnhBYjFGTHpJRml3YWNPbDZxcmhJcnN4RS81bVZveVQyUi9pZi9Ob2hN?=
 =?utf-8?B?MnJyNmxFcW4wcVY4RlJoZkxKSmc3MVhJdFdGakZjSW8rM1QzTGM2ditpbVFu?=
 =?utf-8?B?TXJub3lnQ0RFb281T3A1TlQ2aFNMVXpUN1l0YjFzZ0NGT0x4MGN2RDZrSlpO?=
 =?utf-8?Q?Ribk2j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUFmVS80RjdIRDRWWVBQaGJZYWtlY1JpcG1VMjlkdmRqSU9xcHFmSnpSNENT?=
 =?utf-8?B?L2E2dGx1ZHVDd3VpOWZEZ29SYzVMR0RqUUNyajJSVUZoVGxQS255ZGpFN3Qy?=
 =?utf-8?B?QWc0ZUlHTFpHbFdrZWpxb0lHc0s1aGQ5WVI1L2Ezd2dVZmY0UVJuZ3RaNmNj?=
 =?utf-8?B?Um81NGpKdXNxQURTbFRhWUpRbXJOeWpZQThraGhIcDg0RUpHbXBUdGdQVFFz?=
 =?utf-8?B?UzIxSzU5L2JkQlA0SDdzK3FaenV4MlVKR1NXUjY0OGdpWVBXMlhabnVUeFA3?=
 =?utf-8?B?aUtnd25WZWwwMUZPZDVPcmxNWXZ5ekk1WlFZU2plMDdsekZoYUxmMklqejhl?=
 =?utf-8?B?MjVsakVTMEhTYnVHN0F3cnlXcDRueDcrSHpDTHcxWE5DS0xLdlpWK0YzN2xF?=
 =?utf-8?B?QjlhM2RvaFEvMFo4b1g2SEtkbTJyak5zdEVOanRlQTE4L1JPZEpoZ0hNcE1t?=
 =?utf-8?B?MmFkUXQvckp6aTU5U3M0bzRrS2VZYlErV2Vta3crbk5PMzVTUVM1UVc5Ujdl?=
 =?utf-8?B?c2RrcHkyZWl3Z3VOUGx3clhjOXZzRWtsc05lMnpBNmpOQSt2U3VMdjdUNDhM?=
 =?utf-8?B?VE5xajhqaW9mZ0dXNFIzUWtXTFRqaW42TTVVbEFwR08xSlZ3WCtySWViYkdl?=
 =?utf-8?B?clFpcUk0NGg3QVZBTUtCeXhGU1ZqMG11eGpOL0VuV0JtVzY0RXJmV1Q2cjFz?=
 =?utf-8?B?UGVyb3pRV3o5UVYyTHdJRWVKVWlwQnVpd1cxNFZWaVVFREw0V1hZak42OWJM?=
 =?utf-8?B?eUpjQWtud0xyVEJhL0kvZlM0VTh1VkN4Qmd1VFpXU245L0JLQ0lzTXlRcTh6?=
 =?utf-8?B?czN0blRVYytFamI2eFR6RmR3dGdHNVNiYjJqV2p4cENkMXJqU0dMQ1d5aDl4?=
 =?utf-8?B?NFIyV2c5aGFpNk9zcUNPRHU5Q080cDNvRE9XZloyb1Z6cmZQNlZFSEEwZUgz?=
 =?utf-8?B?d0cxK0xwZ2YwR3Y1UitMc1J5Qy80MFVZRi9YdWdzL0VVa1lTTVdrN1R2ckFB?=
 =?utf-8?B?eGRVOGhiVWE5T0ZYNnFjQ29YUHE3U3ZIVE1hN2hMZXI5UFFpQnV2cXN4NjBD?=
 =?utf-8?B?cWtUVjR4ZjJxRmZONUZSRXFKekxPWmJwTmdhVEpBREtIZlh0Yk1HSHY2R3Q4?=
 =?utf-8?B?aUJ3UjF2TWtZSEsxMDR5NVc5L2pvOHBhelR2MzV5NmR1SCtHeFVNK0lIUTFO?=
 =?utf-8?B?Mlh5QXQvLzUyUTB4MUFqejVRU29BSTFRZmtXdU82cVIvb25vOWttNytvVlNG?=
 =?utf-8?B?clU4cGJ4TWtiQ3lUQkU4Wk1JN3BSVURjd3N0cXk0Rmt6dk9Ba2ViS2RJdkNK?=
 =?utf-8?B?YnN2T05tdWo0UCt4NDVnbkRDeG1jdmZBNmZFaEV0MzkvRERMQUFaZEdvM0s4?=
 =?utf-8?B?L09xTS9xRXVLcUdXbStQWm1pMFJiU3hSNGMzL2lIZkpZa1gwRm1Xc0VsMXFQ?=
 =?utf-8?B?Vm9RdlNKeDYzMmQxOWZiWmtNQk9PUjFkSlQ4MldpYWdwTmNvN1FLYk91Y1hz?=
 =?utf-8?B?Q0d3QmVZdXdaSk1aWUMzSkFtblE0VGwrNjF4Wlc4K2VsS3VYSW0vMHZTYzVC?=
 =?utf-8?B?Q1hRam84eGVxVGRLVjNpdmZkYnJuWXpqd1h4VG0za2RaOFF5STI5a2tCV0ZF?=
 =?utf-8?B?U2syVEVkSlNwZHdEZGQ3WUx0YWl0V2FTQy9TZ09kdFlnWVFodlczVmRZSkFw?=
 =?utf-8?B?SG13RHYwcXRacEZUV2REUVdtazFkTFJKenNXZFRTL0x1SHN4djdOcjdEa0Ew?=
 =?utf-8?B?c0FzR0YxVGs0K0V2cmo3ME4renV4aGtQUmpNSjgvczBjeUdXaXB3K0lYTHRp?=
 =?utf-8?B?UEVDWFJJUVFrbGRLZWRnc1ppVGZsSmVDc1lwYlk5SHBQTXh2dG4wWFExdGN2?=
 =?utf-8?B?WmJyc2hVUkNCenB5akp4bm5mZ2JFQVlXSk51bW1DR2VtR3B1azYwN0hLeFhP?=
 =?utf-8?B?T3RyRE9IZjNyNjJCMXJmVEdIZGowZ2dUd2dOVTRVOW5FZkpVNzlmOHpSNkMx?=
 =?utf-8?B?dlRvNTBmN0hpQ1dFeFVGOGRXdE14b3VNN2dGUkl3Ly9FRlM3STB4dUFPRTJj?=
 =?utf-8?B?ZkgwNCtZVEV2YzM0S1B1Z1A0S0R2eTF4WDBxYy9jWWZJVDUvRXdIeGQ0WU9x?=
 =?utf-8?Q?iQJLJaF2yDtt1m2Lerg/4z+Z6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e8f620-bcec-4113-4463-08ddb9e39e51
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:22.2581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3D7fxVp3JxzA5dxIcYiQv25vYaYizKjWHRGeB/NsueqKb0nHKw8i1Z/MTQo8aBoeN2dfa5yJtDTVIVA2GXjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

Similar to i.MX95, i.MX94 also has LVDS/DISPLAY CSR to provide
clock gate for LVDS and DISPLAY Controller. So following same approach
to add the support, as what have been done for i.MX95.

Patch 1 is to add the binding doc.
Patch 2 and 3 are fixes when supporting i.MX94, but the issues are
also exposed to i.MX95 even not triggered. No need to rush the
two patches for 6.16.
Patch 4 and 5 is to add the clk driver. Patch 4 is almost picked from
NXP downstream with a minor update. Patch 5 is modified from NXP
downstream with a few minor patches merged and updated.
Patch 6 is the dts part to give reviewer a whole view on how it is used.

Thanks for Frank Li helping do NXP internal review for the patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Correct compatible string order in patch 1 which add dt-binding
- Sort the order of of_device_id in patch 4 which add i.MX94 driver
- Update ldb pll div7 node name in patch 5 which add dts nodes
- Link to v1: https://lore.kernel.org/r/20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com

---
Laurentiu Palcu (1):
      clk: imx95-blk-ctl: Fix synchronous abort

Peng Fan (3):
      dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes

Sandor Yu (1):
      clk: imx95-blk-ctl: Rename lvds and displaymix csr blk

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  2 +
 arch/arm64/boot/dts/freescale/imx943.dtsi          | 34 ++++++++
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 95 ++++++++++++++++------
 include/dt-bindings/clock/nxp,imx94-clock.h        | 13 +++
 4 files changed, 121 insertions(+), 23 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250701-imx95-blk-ctl-7-1-e9f82be61980

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

