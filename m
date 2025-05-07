Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2134.outbound.protection.outlook.com [40.107.241.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F0426B2BB;
	Wed,  7 May 2025 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623526; cv=fail; b=XjLqNsl8DD+2bFw2rDzBz4zgj1uZWlRWskxc4rY6DnZHGYvO0hvjConYj8oBPkKGwHaYVBzU7urY6XKMb5Et17s/vAHOrhLciYUx0eFjOtE/qa2Pm1Nl2KMybYuPtSi5nAv/BQ5SuIrSnqGIF0y6GBrrRFU4WbFIOe12dCj6DSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623526; c=relaxed/simple;
	bh=Qw17PfYhu/UhYf/yLiM3BatcYS2grcbMzlQwt0x+16w=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 References; b=uzfjYUaCP/ot2PUuIVvuxODZYXFl4iv4kag7TYHW0y1ITFr9AuMv3TSSuFerhHfHsFvrvck7soriJInzoOl5b3LXK8R1GkN0OFbGd5LuGGQKO30Cyz9AmPRlOpaTYVfiQ7NCURik9QFCMHoSral8yi/VmeCZAnoZtJeLlKQa6I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=PvPLr1YS; arc=fail smtp.client-ip=40.107.241.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="PvPLr1YS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmRPY3oqUH2qON0/1jlOcUw8MnmZ7ozaxqLzXYSpyuCALssSr+BlHMeUe4TH7+8TdtaH0oH00VS8o792VB6a0eDBCg/fdHkSl7+u/u9dDzRVhw8gjm8mNUnRBhp+sfMkqTmWhiuB5sSH6Lsh2gjG39lkycyEFcpiIVeQf9gPqeDpg4793BrC6TgdyyhwMK76MON8dHw4VOAVA/vnvohRfzXX72jgqA1nrNeyrRq/ZZYXIC7fq77NEuS+D+stOsOvQefYAPnH0k8nqch0FvZMKQNxhVEcjYXsPU25+b4eCVlbzA67HO6dHpWXeAah8Fo8XFfOT/6aSU805K+ScjzTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q+fhxFvMhUBQgyUH0iGVF+FOFc9Rlk5H7+QCg2MQak=;
 b=bucRhh3yXEMaaW28bvs9J8Rsa6mfsEK9dVO5+r0lrw38iHtvtGm6KxV2iUhsTtyHTmKYn44wps6bAT7sOcN9NmMDvxd4v/WcXc2ETN6cWUhkZ0jFTn+e7h7aTbWOTs9HWg+OApvI8RzD/gLSPeL2nbByUSVpXGNkkX2uW4b/jXPaaf42qm852LfESx5q1rXFVWf8l/5DuxL59lTgqvOn1Fhi+tU9S7PyrxHB4StQOXMuzq9A/AKRy/sde+paiF59R9hMhOosCyKVQTvhONgS00CltY5vcgctznk2AWrEUqtkAGzkdQlwraOy3VjudjA6LAwk8NiNCzkdm3xtQAS+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q+fhxFvMhUBQgyUH0iGVF+FOFc9Rlk5H7+QCg2MQak=;
 b=PvPLr1YSCrlY0PcQnQ4s6upzApvi6KZ3KthOCLlIhuj8vXUyJtf9ScNSSDldHn89PdW09pCuCW6GDv8VSKE/K14vIt3ZPbE7yQNm1Bq189ZD2/8M4gthD+o9NUv36KTlUYJ48q5XIWjV1wCSFAp/pj0VmTvo5YaeBdOWEuzjlJ4LFvdpeXLwyy/fqG8XmmsRdKmjPO6zC4l/S6PHcZ4R+3ZwJGuAPGAdDGTVt2SbkHJF3mteKv9PBB21Ne/Jk+GgIFLxS+xFC80Zy89qhqh1HX1rN+p2WrBHm70w0ACXwIWtpI6K5kN5//+xfbuo15HIDVkbPbsJI+tM+w5UEuIMxA==
Received: from AS8PR04CA0086.eurprd04.prod.outlook.com (2603:10a6:20b:313::31)
 by VI2PR04MB10860.eurprd04.prod.outlook.com (2603:10a6:800:27f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 13:11:57 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:313:cafe::7f) by AS8PR04CA0086.outlook.office365.com
 (2603:10a6:20b:313::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 13:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 13:11:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.171) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 07 May 2025 13:11:56 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 13:11:53 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:11:53 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-usb@vger.kernel.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: misc: onboard_usb_dev: Add support for TI TUSB8044 hub
Date: Wed, 7 May 2025 15:11:42 +0200
Message-ID: <20250507131143.2243079-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|DB9PR04MB9283:EE_|AM4PEPF00027A63:EE_|VI2PR04MB10860:EE_
X-MS-Office365-Filtering-Correlation-Id: f49d5573-cd86-4660-b201-08dd8d68be9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?f8LYQGZII5fZmBxPnJwkU2o96yHb2Dd3ohWrcS/JsrL9qtYm/+OA/NQWYuW6?=
 =?us-ascii?Q?unI6Pxn16bQZO01BbTq6MJxoQqBTIYPIC+dZx3g5aZR+Y24Junnh9qTtpxA6?=
 =?us-ascii?Q?BmTFRNCdkmYHe8yG2ucMP9som/aot13npPc2gbQ7v9W3yRetdDK0nGT37sAn?=
 =?us-ascii?Q?R8IblxdSht1w4xcOG2fo9Wf7he7mYsJr2qZ2UhapLChCKk4eZBhDPDYpE9r9?=
 =?us-ascii?Q?FjvkPkkYn5L36Kigo4uMdWmlwR5jI8cc/x56NNPmbP6OMoB3Oyt/fwFLNjmA?=
 =?us-ascii?Q?aCoZ51xcrR8lrxIhtM7GnOtV8ODigV0r1BAfHBLs4p4gK9/KL+Zc0XjPpobx?=
 =?us-ascii?Q?9Rcr2j5VEBVSv88i49Xh2vBcNqcRo453XK/LhI0S0BBYp+MAULOKN/tgqMsK?=
 =?us-ascii?Q?rHnzkrSFlDRouqXp1AUAz7X93nauJRGK7WhKMGkD6D//kW/6NOKCEOZ+sGGl?=
 =?us-ascii?Q?KIh6RWe5svfbxgSp7KqmS+Yxl7YxeWnBOHsM17EvMaGhlyKSkmh3bNyzjs0D?=
 =?us-ascii?Q?VV5MZuNNDYrYGwyLV96+fN2qvzxwJRXkPVVBeetyQxB7P0ZKq6mOESqcxFFA?=
 =?us-ascii?Q?vBdpume7P4WF5eVbgpk3VZYVs0pQccZ9bA5tdVNOL5ViVO9ZHX/2Hv3JoNEG?=
 =?us-ascii?Q?UY/fbo05Ku1H37sr2YRHy7eNH5dB4/9mu9jzAOz87BQPUlai9vVvjjjyD8GY?=
 =?us-ascii?Q?OIP7rU4eZgpwEn03zWDwI+SFnhhe22SwlQ31VpItQ19MnkcevO9OjHnim47C?=
 =?us-ascii?Q?aCLeZ55ykteMx8AX9plexd+JqIRBETtTK1nI941jvsngP0AIZWNIpsk6Iis+?=
 =?us-ascii?Q?2D5K1pDWckB+LqbNhqOMmbXqLQiSzi1gp01XqeDhsb5ARCd7nTJ5Pab/RbiU?=
 =?us-ascii?Q?8Ho2uBKB7PW4CSJIMd+R/OBhjpAHU1Df3HNKeLN3aPSmVPzo3OXrJwuU97y3?=
 =?us-ascii?Q?o+DPIOLQodeZkAMBefTrSyyeCrAzG1W/FrJKtHptUySczkqZ4qmQpWJfguAz?=
 =?us-ascii?Q?n5RA8UnDLuuTB1ZunCSe8Ep/ZuzlxJRuQZy19hYjRXaSBR5ZlYrM1vclWJe3?=
 =?us-ascii?Q?Zb+2a0dRas8CAPpo10YBJPcy9/X6iTIEopepJJegQt9tBie6d0JwgHBXGjYO?=
 =?us-ascii?Q?BGP8TTBWhlbrESz3J7Bpv77Dt5mnGZudnvD3WQrUTEY3r67bOL6E2NVsaOny?=
 =?us-ascii?Q?PimwGYhW3yF0ybPXOCP+lv85XqLkUnC4PkIlm+v8i6sr/IEXvlqLEn3Kaxcd?=
 =?us-ascii?Q?QwYDyPZfuO28fWgN5Qknn5KENlFwDVQW/ZA89QG8v9I2AT/Kyv/f9SdK6qOh?=
 =?us-ascii?Q?XRbpCsylPnJscunJxb+R2QJOBOrj8iYgMX9lk9+pAGo5+WzMWki8giRtuMv3?=
 =?us-ascii?Q?Wj2FXUN9KdCZca2bCt6X8+AJS26nR95qyBB6nQM/bK2Z79ny459hN/Y9+Fpo?=
 =?us-ascii?Q?jhzmaLgynPPKygLBuj0WCbXl26LXbt4ZwBfuOgUS8q0K7BbuEdbDSA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283
X-CodeTwo-MessageID: d9d8d14e-e9dd-462f-a681-6685ef3f7cd4.20250507131156@westeu12-emailsignatures-cloud.codetwo.com
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.88a2c5b0-4a7a-480c-94d2-acc50e27e923@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c794ea1d-6247-495e-b609-08dd8d68bc58
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|35042699022|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j4Tjnb+mhm5YmN5ptr2Z6vHReYjBaIsB511ocbCusRH6gC1HhPSajYdac1FL?=
 =?us-ascii?Q?472bmurkawkNOa+cpBqHTNnwNqIsKRcPU2+k6GmrZyzBsx5TAYshZXJN3Jkm?=
 =?us-ascii?Q?oKHW1+/WhYZnvxey0rYE3zacIOfrAYpvie5R8lbAXf8nSiqdQLz0kxYdoTYr?=
 =?us-ascii?Q?N7Z2QyZ91vDhSfema4txSe43QaHerlKufvj3E6kCEvwlKrjiYXHso71DKY0T?=
 =?us-ascii?Q?XnFpBrEKpijWlpkG7u9SvC1To7R+b9W+NxiFQes9ea45mzmNxC+92LduMVYc?=
 =?us-ascii?Q?7dRLXywWY/FOYBP0PCB5/CTQbTXzuGp/a0TKysEci74O9VybJP57HxcOu4Su?=
 =?us-ascii?Q?dVPdyDztLMX1hVavRJSA1SSvFAOhM5lV1F4WcQU3H/qZEiIxJ6CmaT/FZC8w?=
 =?us-ascii?Q?OGSjxLpem/jBLhXddfXy5t1MlQOp/wN+nZYOMwYPwTCiZn+3//WzXCeJyJr3?=
 =?us-ascii?Q?3wG4feTUJFWzKdt0UR4Pvi1eQCRjipNrWsrwRDcPwqx1BWdkLv523aOxjIw0?=
 =?us-ascii?Q?HmZePiLrkT6jg+NcGYWkyUrjW4cIGg3ZsmHCS1815HtrOoN1eBZn0FLrfvee?=
 =?us-ascii?Q?kkexF9+NGpsajwcx2QoObLrLme74LxA192u+yaAVv52/ClhsAO+rDblXcw/3?=
 =?us-ascii?Q?Em4/9SGwwfwpkkKKcF9KChXJ5puIwnAePW8Nl4860EuSASbwqcGIkyWCrV9E?=
 =?us-ascii?Q?IjIaGlI440ytkG+M4j09pxbFhtmbJ3IHThQ8F9ztcyPMjmX1HhF92crqH1X3?=
 =?us-ascii?Q?9vJpAGXUkpyEr1geXe0Pm2REO9mK2EE5axS53BXACHO8O1W4ZdqEBLa18ytH?=
 =?us-ascii?Q?HD9o4BGButaqCDB3ZDgoKSUj6L+EFY6ieI3jcQauI9P04fa82xp7cgaskgKd?=
 =?us-ascii?Q?+qL0g+14zWvTctYeV24iI+Sm7Y2CO6PQy6HhsNC0J4FFlzuO9NBknkTBXpNy?=
 =?us-ascii?Q?c1O4c6uCdmoki0CA0HD2UM82t+YSkyAj5L8Y0Rz/rvknov+CdYcNpFdpk+nI?=
 =?us-ascii?Q?TXfEH1ok8hl2NrYPHVRCvQjD9cekV4Zi6e7PbWRviEDcyVVbhak7aNJ/O6uu?=
 =?us-ascii?Q?MOx/sMB1Le0gSKt0ewcIyou+CmReF6oRfgqtnKdw4/6kdmlVvcJV9rbcHWZj?=
 =?us-ascii?Q?Ei/uzq9KYTgJsxKww79yHrw0kgzCOKgzXnsaSp3nijUveR1hJJZbV1LOIZsj?=
 =?us-ascii?Q?h9DiIhFcr7sYaYEHpusnmtj6wQXbe/T6F81bHliMWAJCdg91usjKpfVS9dqQ?=
 =?us-ascii?Q?CQlsf/lFh/tH4c8UoBzAIprFZbUbCrsFXXGZsEUzRSsSWRc2LdVgFUju2wux?=
 =?us-ascii?Q?HE4WYG6VsW66Ic2MgygeP6+snBAjYJ/QLruQVqhYxCQ+Ra5oaGq4ThcGVHf7?=
 =?us-ascii?Q?QsU8QwwjKlNWdnf7WL5dt+1LTr6F6AB5FDsHO+HieVjtYwx85Nun3tBqbQ8L?=
 =?us-ascii?Q?IjndK870c1HauDsy1uK4DhPeODz9cwIE?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:11:57.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f49d5573-cd86-4660-b201-08dd8d68be9d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10860

The TUSB8044 is similar to the TUSB8041. This adds the PID/VID values
and allows to specify the reset GPIO signal on the board.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_=
usb_dev.c
index 9660b7fe8ee3..c4252186621b 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -556,6 +556,8 @@ static const struct usb_device_id onboard_dev_id_table[=
] =3D {
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8440) }, /* TI USB8044 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8442) }, /* TI USB8044 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
 	{}
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_=
usb_dev.h
index 367c5c418ae6..b0bc53f781e6 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -86,6 +86,8 @@ static const struct of_device_id onboard_dev_match[] =3D =
{
 	{ .compatible =3D "usb451,8027", .data =3D &ti_tusb8020b_data, },
 	{ .compatible =3D "usb451,8140", .data =3D &ti_tusb8041_data, },
 	{ .compatible =3D "usb451,8142", .data =3D &ti_tusb8041_data, },
+	{ .compatible =3D "usb451,8440", .data =3D &ti_tusb8041_data, },
+	{ .compatible =3D "usb451,8442", .data =3D &ti_tusb8041_data, },
 	{ .compatible =3D "usb4b4,6504", .data =3D &cypress_hx3_data, },
 	{ .compatible =3D "usb4b4,6506", .data =3D &cypress_hx3_data, },
 	{ .compatible =3D "usb4b4,6570", .data =3D &cypress_hx2vl_data, },
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
