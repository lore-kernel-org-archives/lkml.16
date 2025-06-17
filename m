Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AA3208;
	Tue, 17 Jun 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146341; cv=fail; b=FmUoMpSb7M+EBpDHfpYVi4Py2/uRaUy/CWUZwmy0NgFZM50MVNm3zz4nIox9UCU3VHSHz9z9stqrZQzM2zgKNMVhqUnt7VAHBrPTJ0A/clCBaS36GO3M0JO16ZETWuRQZcKZXSxyt0v+d+7jj02ceRKu+OpNX/K7hSkGoBU/NXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146341; c=relaxed/simple;
	bh=DdSIqeOPC5rNnU40i6RerunTatpfmANOG/r0yAINXPc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Nmwch45OSL5aNRY91upoFDzpxLxf+ou6xzbytuS1yeP+deUhL6Gsy1oxRRFejFyRjXTl7rRE5KVywcC2Ez0QHdFuwvrnjaZTfd3AUzwnSLR2afcvUneQwNfpAO36gHWtZHMl6dq9V83APeFntOS/uAKx/gE6MuJzVVtYIakLqpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JZtRfw0g; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JZtRfw0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dfpaki68oF0fGet3zwt8abyZ3Dw045XnTl+e9qnW6SkDk8vI1xpeY2BNRtNa8cBp4iLNbIYbeR1ulUNc97UFBkKfi7TPCIeL0aeH4oajHt5bdg71qbMZAF4WTEeoADNh8wC8rUWg/SJTpnEPmYPp7zK5Kh3VozH7SHfLY5SwjPEmeMrX0ei4DPm/zJ4ycpLHAiV+iS4rjqc4yukDbeL0zvaIrSDXo+g2QTyVXOGzy0C1/S0PMiVFVFeiEGfnl2987R6nZSA88tJ9UULs8KwMiiu1Co1uWZ3vKoZK3fm2UG9+I7lQcFyLzNZMrfSBnPcPPyifm7uCxPzGUY/tV3oRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fTLUsZHJZP+/3O9umRySe14AIlzu1APj7CPNszBmZU=;
 b=yKhL3QdvERHdp17wbnIPrdfrxH8hEVbUsgs7uXuYZ0bKs6WyzmL/glZjzLtXLd8S16k8yVWhZds6b75ienLeMDAjW7dYs5c7Z+/Dn+xW9ip4Q8sg/kv71TsmDdtBrWkHRD0JXD/Ly4fHqWwlQ97I+3/bPvDX5k/VXKDQaZQ74C/HD2cfBKPNpNDN8bRQnX5Qz8N8KMB4s+CD/Q8T4j2vsFaZY+gzhO9KCLGjJ+k3Zl+3e8JBTaNbLwRjzj6/RtV64MpfrQpNVP7MGOI61LIPyJQu+O+AYuqMdzSq1ixSjGNxBKE87nJ4ODQd52UwM9d38DTR87+JYDR89N8ig1gAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fTLUsZHJZP+/3O9umRySe14AIlzu1APj7CPNszBmZU=;
 b=JZtRfw0ghhxSFU+/u/hgi60YOR2d3+X8r3M4vyQY4yyzJxrdJr9IyLr3HvqzpdRuUmhpS+xP9DvVE00vg3MO7kFRLpoUqB/AjKVlL41aku/0TlLI1CxhqQ0XFP4XAaO5m6kfwrWXjMtkKrMwaPiCKtgs6XtT2mR3jVgi90CeSDxi0KoErCRfSaBGCJWKR3j/rtcdd1HgpZfI2hT96AREaNxXchemTtbowsHaZlmD2SJbD8QLvUv8cTUIUs3kWxaaP4RW2vqJNBxPOeXMY21TDafaJTy6Uf+YjBRNFhMSpkXomdjhad2uCLoDyhKpmU1jrLQ6Q1pwYCioIDo756W5yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PA1PR04MB10916.eurprd04.prod.outlook.com (2603:10a6:102:483::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:45:37 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:45:36 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: cs42xx8: Move reset operation to runtime resume
Date: Tue, 17 Jun 2025 15:43:34 +0800
Message-Id: <20250617074334.3229001-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OSBPR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:604:71::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PA1PR04MB10916:EE_
X-MS-Office365-Filtering-Correlation-Id: 421d4f2f-8a2f-4df4-ce22-08ddad72f29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PqH7mMoZ+ntq9JUWu9Ua6r04vNvSahiHpLMHivX3b79FG0egODhB1DjrCpiP?=
 =?us-ascii?Q?KAD8ERmuwbsC2dX9xKrhZt/XStI9I1oe6nxPCqhvdifTn5cideznMtYSGqeJ?=
 =?us-ascii?Q?E3W5GBrLVKpgsLw4jNaXX2yOSWjMdCM5ioaAAMSamalJC8KgNG1w1TmvX3ks?=
 =?us-ascii?Q?rIQxP2axSi/AI6lSLIbAdB8pMeCq9KscZgcYBXqwPp9d6Jt8Wg/O3pvNIn/n?=
 =?us-ascii?Q?vAMa3Zl5+pId2y0RlqHj8TnpD5z1I3y+FGeMD0QP210xj9RgeLV+R0fp0a8y?=
 =?us-ascii?Q?jJjAlqXi32d1Nn24gL15INR1o+hrMrrFg0oVfEYBReeu98xGV4QoSxS33slh?=
 =?us-ascii?Q?7BVP0uw50sMWKo/ppcwVk66E7+cMH8Y173Npvpgi8nwYCaHlivsIycgF06Py?=
 =?us-ascii?Q?sUiydY7ronbchovkXPm5Nv/9k+7k7eb9JPIahPI/ETjPMPbYjwB4Fomf3NZ9?=
 =?us-ascii?Q?q8GmRPcH8e1V9rxVHqA4gErwWmv/dUhBtlWxGOgmyT8Ijd9aVDYeCKlEfUYS?=
 =?us-ascii?Q?vThKleI9oEcoabCXVDmJM292cEWqKRm6LR2TzA8n7/O15TwwxxNvXiTCPHMj?=
 =?us-ascii?Q?GWrwHAI4mt5cq+pwii2AFERKC254lT0kSF08jRZ0OaPKY4D+oCioVg+0jhAm?=
 =?us-ascii?Q?x7SfpxgT0rVZiZ/lxlmt+AQeBe2/S8uwUCwimQmzYdXgrIylYH8ZHZrtbPCZ?=
 =?us-ascii?Q?jfkVN4l0Gf988ThuoMNCeVJyMbmeiNIkyCJAvgZZFD0Kyj6t+ZrUUlBsuYNn?=
 =?us-ascii?Q?B+feDKaLzpTfix9FJ7BwSU1v1ie2AUniFegfj1aYHI4LPw1zuf1pzXlN7oGQ?=
 =?us-ascii?Q?esaHBWkUVqE9fEtSqO3FhE1e9/qXfPPoSaO1cyR2C+WdprOFFMpivy4kq47a?=
 =?us-ascii?Q?iEoDeNwT2xKPTj8QYF0tnegdZX08sXWRnUgNyUCSM0Q/jkHK+q7WUEpZuesO?=
 =?us-ascii?Q?ZB2SCt+pWHUrg/kBNY+/slpAQLevAy4TxCIbe20pFHvab94CjLgfrr4wqPum?=
 =?us-ascii?Q?cYb2r3dF3FNqCuwpuvViwC7l2/3D7kqJ5XDranJiGwvgjqgdyTCkuMAZ5eYJ?=
 =?us-ascii?Q?GKOglBYgSInwfMfMFjaKEA/h2DJRBpC6ChUL8PD/tGoP8qBji3XQNLnBmgqd?=
 =?us-ascii?Q?h3BPRp4TAXJ/k3m1wSpV0mj5O+21Kjt1J5Jg6oLwTz8ILLtL1Y3tWSGTkrWG?=
 =?us-ascii?Q?Wby0TxcVow2n72QQJQ/R1rTpxNZ0p/V+v+ogSLYnkCoqWUi23yituKIxi2CR?=
 =?us-ascii?Q?C2AAvp0pYZfoCOeifctlWiKRDINpWZcgvVPG1Hf9DuEMJo9mNI1EJd9W+FGg?=
 =?us-ascii?Q?j/9PdYBNPUu/dF8/qV7ZUi4BsVYDQbCi8WXcOjBt++y5WL0HnLNGpXH2rXHZ?=
 =?us-ascii?Q?5FYGIqEaESNK4V9Nb47Ejsd+2N7jj54vVUhO/VHS5Bid/bNUS4SClHwekD6t?=
 =?us-ascii?Q?YnH/NzRXS06ndXXk39GPzuzoyILV83JkOSt+/DO1BEuZYWlVZie5yzpyuwgW?=
 =?us-ascii?Q?DprjNJcvYO5m+hE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UGSX31NtkRZMAtgzr5hWqOHnwy3bza+oNe/yAddeoLa5hGU0gJy99kYe7ch0?=
 =?us-ascii?Q?Czhx4uq6mK9WJeOPNjyJ3oPsPni+b5WGxVfXFouWpwsSvqKIaeV6oEDjfau1?=
 =?us-ascii?Q?FiUBf9eyVE7pGYIovmeJotHCN33a6eXK6cibcViZ1tBjyYxkv3xOvbOMyzi0?=
 =?us-ascii?Q?5q8AHkUu1ZS4CIHxRK6mgBMt4MtdWExFuz9ma4kSAQQ82hilYhZm0orD4hH3?=
 =?us-ascii?Q?/eC0ZbmFGfsf8OUG6xMQerjmL+0wSgSL4lISUGOuZVvnDLTvEmy8lPHXVrZi?=
 =?us-ascii?Q?WEeajAoCIi7K9PR3Cpkus3Np8NbY/kpte140WfhHj1DLe6pLmeAm5cSFRio8?=
 =?us-ascii?Q?yaJmZgTuiJhS8cMVVK9w8mrSY+cHAbWabUPdTOTAMuQ+BshuXNLSH4ALRWal?=
 =?us-ascii?Q?iuXdv6JNcg2EXO1zesQKYQJkm2zgtLp3SgBQx9XbL/KRdK8qzMbo6YhNLDnh?=
 =?us-ascii?Q?q2E9Px0LMsz/8omCCyy7QMc85TJtJns1c67FKWsuHf+YtbcLZcWUtUotqzp+?=
 =?us-ascii?Q?kBpCZX8HZXyadzQxuuynSLTN3RYlZ9VTgh4hNjolYnP0fd0sWwxWHxMivZ1W?=
 =?us-ascii?Q?Tye3ykrQQ+eTf0QVUEzMXbEf/gepq2ieiSENlthKCL5E4KGy+/MFeQwpNWkj?=
 =?us-ascii?Q?N6r2kTv2gwZg65KGXbAUPBpeXN+BJ6zluuaYriJ+7T8mu6t88AUAZUcjlLRn?=
 =?us-ascii?Q?hO9rdj8hTj4WkfDVMsinvPc1SsM8eDfkwA4ojCrUKJLTlrHP8s+vf0DJn7rs?=
 =?us-ascii?Q?GdIQp+eZI2M3S40lm6TROlqwEoek3RstJsT/LYd54NNX84xekpVwNGgbVWhx?=
 =?us-ascii?Q?LodPWXJWLKxp5UzA/UjPOJnjAMb437mfv++PykuNXB4ONsrXUYz3QN4i667f?=
 =?us-ascii?Q?USPod39LqVTyrMEi5+oEhK7z4fN5P3gtShAE32nCMmwx+NLy2PyjPPjcrBUy?=
 =?us-ascii?Q?6R6dJPPR0JunX0xRLIB8UABPGhiZTcKvBj/daWmMIGlES7ZH5zQ6hcbYNJEb?=
 =?us-ascii?Q?fBlES/QiOM3q4TVqenHRBn15FnDu9jC54fpf+upJWv5shm9DAcUCjJ8Cg12L?=
 =?us-ascii?Q?ZyWGicWMXxg6rZA+uOJP8JGMm2+C9GvZ6q4zuJG7MVAyVSbNdlTEodGXI6GI?=
 =?us-ascii?Q?T5RXEMPDTW6t4Bx+Edxst4x69cjgCWo8mFKg6mq/jnTikEX0Ne3FTO44WC1p?=
 =?us-ascii?Q?43D7+V6h4QeeOkPFOQX9Qbfd7W85Yd5Nr33Vf0zMjI4vTDQDF2M81Pj9/VHv?=
 =?us-ascii?Q?/PAmGPbB0PrDUpJdxUVCRAWjM3Au5mISeNzNJo5vaZUmBNRYoQmlHUg5E1IR?=
 =?us-ascii?Q?MiVfaCxQzgdvaljCSqdZSFTKmJox2ef6IewqUyePkpcE5WNfHvpkBmyJzRzy?=
 =?us-ascii?Q?crI3SdX0cVjKJiIIgLy1lRLdmGuwCfIu23qVhX+ouObiT9hSf3gpfsd4HJyw?=
 =?us-ascii?Q?RxY4TN17N41oeoIGgSWProqJiafrQ8pLM+cL7GrnwUKS/8dPIOBQs0u0ap9N?=
 =?us-ascii?Q?l+woQa2sS+HuluQGCAwOU0cil9qksVcpKqHbtZTVz1hsNi83nsTyx6Y51u9l?=
 =?us-ascii?Q?2tQjC2MG53qvtJaTvmZPopy1mDSKdjcgE0CSQlZh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421d4f2f-8a2f-4df4-ce22-08ddad72f29a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:45:36.8760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDFMbU2qQHN7PBY6haDAI0KZgq9VmyrquGXBngE17x5HtmvS2CYx9+j0xFDFZTXTNtfOrtz+LbTnnUnn9rbrww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10916

When codec is in idle state, the runtime suspend is executed, if codec
has been reset and user wants to use i2ctransfer command to get the
codec registers, i2c access will fail.

Move reset operation to the runtime resume stage to avoid such issues.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/cs42xx8.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 6a925f3f7137..be215cd2a714 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -617,6 +617,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
 	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs42xx8->supplies),
@@ -658,8 +659,6 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 	regulator_bulk_disable(ARRAY_SIZE(cs42xx8->supplies),
 			       cs42xx8->supplies);
 
-	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
-
 	clk_disable_unprepare(cs42xx8->clk);
 
 	return 0;
-- 
2.34.1

