Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012007.outbound.protection.outlook.com [52.101.71.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72BF233702;
	Sun, 27 Apr 2025 05:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745733114; cv=fail; b=mogWuP4f8EfAz5QYhTCzFGbBxHfeyXFCKUw9+Y1MOKz/kPcEXwgF68IIDVksjZWWnvj42qNqbzeK7V++AqgezR1ZtWX9+ZjTFQiKnZJ75Cd91/2jWlqapqHI+wiiEBfNaYN3A3IAjScDxVDfWCqkWbez0VZhOxz5lwZAPtEeHTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745733114; c=relaxed/simple;
	bh=enXGnNIOHmCU6xDXaeHEn5ZfZCd4p5OVc9XUJMypb1M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uLXGrpraOx7zH6z7zwUU36nrPOf9JQKeNzBViuoJE1U8Icc6cSaQer1PkfAlcOUdPjKmG7ntC/VCzpg+va3vFSBRXDrsZ/K+BMUd1R8CvzdlOzsJ3Kmb9I9lutQA+DPuS167fiSJ0Hwz5AJhyNlYs275AMbL+0F3CSmY6BmIeqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hGR8Jz+o; arc=fail smtp.client-ip=52.101.71.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hGR8Jz+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Er6DjK1WqnZd8eXXIA2V5zDFoG6NyCm9ewsFBh/X/XEqZXROooD944NDYefeIJOqA3BmSO99qinpghGq5TGb2EqQu7TEIQDxmwxRrLxppIK+YF8wpRAc8LrpDZKdfV3TZJRs3cuvtR/zgUgNl0a5M+/zgBlOHdnDLPf7EZ7qfi5S2nkPp/qxLRvGQA/8x92gMtUk/mIGxI9MvqHqcPmH3rp5E9GyiNY3H41q4bs7xtRsjkYqIKc3B8IswiVSS6zEkB+WPh19IwhcXqLwXBLHpsFLg1/+tIf7JCFgO/vh5juaKT6l1BZo3ZcFpUjjMR4P1EJJ/VbQRWvPBCApiTYA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVDfSJ+lnrq/YZxQryR9XcUtPR7e5mr2fl4pODw0oRI=;
 b=jB8eOjZ1Z2fMpNzj4YIqn9uLWBxavZt5rJpBLqjXjNtvCWlzr1uaBheCdzzcNWBMi0ok0T2Vjkp1oONafecrhIsJShUSbenp20IPzdha6D0j53KgbZOE9IlJ6tHE2Pt7h371Nd29oLmVCaPsHFCDQVaMAC5fI6c0SqWsUSyI24jz+OPYgUgYbvU7h8/TprvCNnbLNstery2smaWA1AIAO/HD2wGJL0DRwZWp+GYBdiubH8NCr13dCiPGMKz65oqOL76HioAL/PEEAkpblpKT+RTyrvQFRc5P2JkCfovH4DQ8wG9qN/MWYSEHJDwOOgqry7HTm1t9XyLsYIX/g6ZfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVDfSJ+lnrq/YZxQryR9XcUtPR7e5mr2fl4pODw0oRI=;
 b=hGR8Jz+olX6JQBCdaGzk8PqIv4lQTkxRn5O92wf0TtQ2V0SVQPQqZUVEmORRDKhuoRCKk655dZK7yWR/En/uaK+PUoxEK7YfEJK8R0bSjF4KR1VaXxyl397EwS5C7QAIr1PCujoBTxvqkqeewG/fzv8ApNXuO3Xm72Gw9D5Y/iCc0RMSWHs1nUKyE3QMAEs+jdb1/jiW5D8xIrVBZs9xCRinDgg7/iw7pMVGmYM8e1GdLOwPg2a5UrQ6liH1b329eeP5HYg4eSFv34PavAQcuHbYEvQC/WvGW2TrFZ0XuefqpraxtAw+fOfOupoigyPSyiqauj/xA8ET6q3ScIKKYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Sun, 27 Apr
 2025 05:51:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 05:51:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: kiseok.jo@irondevice.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH RESEND] ASoC: codec: sma1307: Remove including of_gpio.h
Date: Sun, 27 Apr 2025 13:50:20 +0800
Message-Id: <20250427055020.176099-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:820:d::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: dd76a45d-63d9-41e8-1453-08dd854f986c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6C3p0MoORYBpHJ6Nk0bz+K+U9ZE0hhEuOjUC29PpRzCtC7G8SHJSvuaifQyu?=
 =?us-ascii?Q?mG+GKVloJSlijornLQbUUI49yST83Y+ysDLC/qPCzTiQWUkbf/yPSHJ29kG+?=
 =?us-ascii?Q?w4YT4vwkKfFxnLqlVYw0hhILc+drDoGFnJzOh564zRsj5foNVqtuvxVRYltr?=
 =?us-ascii?Q?e8LsOFtP17z4Z9dgcfnN87FketQaeXeCA1IJH2iJ79IrZv/ExSnWq2+1X2pi?=
 =?us-ascii?Q?LZ8h4flnnSDoPwuwZa70FdhSyGM5WAx8xOTdLsMwTIOi89Tbh9H+MpnBWWiY?=
 =?us-ascii?Q?E0aeBf2v51yy/52CGZHUH0GQRLk6i9mzdo0T3Gn7la+diXZQrQP8vrDtXqzy?=
 =?us-ascii?Q?nWlz4ANRIMN46qKM3S4SUXptPnbRPO9IQoNDj89TWSy+N96wQNkviX54q8zB?=
 =?us-ascii?Q?mJ6UDjPpzrfhjLuNg+X/QIplI0GgSRUbhZW674Y27pCvf1Bxj3R2hCo1nM+A?=
 =?us-ascii?Q?2ZM6PNi9jFZ/9A6mFpez60NST6c4zQV4SA1qK1BOuqQJBVGjEGGL7ADYmVF2?=
 =?us-ascii?Q?d8Uo0Cl8sFQHsLdr9TuQzm0l/7R4T5wqxd+vje35BoGESp2WjrdiIJPfdiao?=
 =?us-ascii?Q?HSSdv+DVG8iRreWuNEVJZyPZEiOOftjrxzSbDP1CVO/72QH9FE1wJrdureX+?=
 =?us-ascii?Q?6NHcpsu/hidP1J/oVLuo1WUcQoLQRPhbeJMngahLD8KKUWRAt8CJVoiLCNKe?=
 =?us-ascii?Q?CvtG/EBXI092tzglcHmH9YR3R4EzwtPF4Fe+KLNqbkrBJyVRAgLvDWl+v5Kb?=
 =?us-ascii?Q?45iot6kZeYAp9HMDoJpLLzRKscY18+nOiol/jU+JFKwgwCJFCFXhsLz8OMfx?=
 =?us-ascii?Q?Optz/G7YsUDVR/Yvte6qg5447E4IwD4ohYbriAW5RDbOHNBHQuJMmBZqIph6?=
 =?us-ascii?Q?aa1GbngJ4lrf8XtrDtRhfO4x3kuz7/X+zW7UuwlWTvQl4fpQhXVxXUwQH21K?=
 =?us-ascii?Q?4aITrWAcPDrq3JfVkJQ5Djerfm05+sBtrdUVUIvW1gCpSwJQNbc1rWlWsFtK?=
 =?us-ascii?Q?ToM++B5ROTVkp5USuFoUyxDCP47VYUj9gFgtJJaVTriCZG+6uFYK5ynLYX1u?=
 =?us-ascii?Q?fnj848SrajX6ghCHQK1gkM2cDLkLXirj9jaYjH4HjvbhetXgFtrFKa1GzEq/?=
 =?us-ascii?Q?eRn7j4++dgRFcHToUsdBwWgnWx6ZikSg8WCYE/YKHZ0RX/K00EPvbT/PsZeL?=
 =?us-ascii?Q?HKun5H6O0Y1w7KHsWFGS25KRhs0qU8JbrSanrJhXkbjJaQUhEZaEA35WPwKg?=
 =?us-ascii?Q?jSD7nmGAhAEq3rsd/WvHSpckzuRI+7LQdOmjPwX46XFe+aK+r2JscpOm6sSY?=
 =?us-ascii?Q?8oGCkJRjNlh/otaQDl/iMHONb7TT9jyhFkDl5BKHO13vbJVlsNg83GA9g49E?=
 =?us-ascii?Q?ewSwafLqV9Adtc+/rLO4xQ7x7KTJVg3wHmwQAuuROk5WNVs9E1fUglBAvzZo?=
 =?us-ascii?Q?Zc5e/gX4pNYwjatpvGzfymE+2ujmwEJqViCuBAr8guSPcNyHYmjZe0KPP8mf?=
 =?us-ascii?Q?piXZw91TtwQkTi0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FFk+3/ZraZ0EhuD2eOfghcu22lonLP4IdsgQZPJpACgHX5ic2wUWQAvllQBe?=
 =?us-ascii?Q?83JgDupF+9xaUz6nqXSyROSkiypAvQ3WFPvgXj7pUt1zvBa/Iwzo8/a5fLkp?=
 =?us-ascii?Q?oFR2KP3d9AGTgn7fMkCZeGoF26s/BkYbU7UjZlGltBrdT+KW2WbgJ9kLeGMI?=
 =?us-ascii?Q?ERepqoi0yXVQ0BFCOvop7avsJz93YYqhtmYIkw98n6ArOsMoMGqRX7uK2B/2?=
 =?us-ascii?Q?ilcbZAmnTQDUVJZ0C40Bsu5grzCPM5BznLe6grzYB3755DIL+3ICejek4mlS?=
 =?us-ascii?Q?UHgZojrPGnkARkU/iZEv3kH1T7lv8QTX1uGRSUakYJzHXsSdd0FeNKcR0q4g?=
 =?us-ascii?Q?CZU4cSkUp6PGmhId1MZDMqBgD5VWSiiesHSe55ZdNhJDnvIN6uxcnPpIR7Cd?=
 =?us-ascii?Q?wr7OABSE5HCIgHiTkgLki9a1Z/ObloIKVCTUnAQaG7G/qxCw3vzPBKmAq7J6?=
 =?us-ascii?Q?XkwD1cvtNsZKK5XNx4nvqMItgWIuYhk9wld4CsIGXKI2WUtiw3fkXRCZLqY8?=
 =?us-ascii?Q?0UgSMgOZu2BPR9mTz5JKxLzZitgJfilekyIpL6UEOmK2EFgTI8Q8Je2+soXD?=
 =?us-ascii?Q?V7enFoML2qfCRvuL6hMcZlwlH1plOGXnVkcbnSP8WU9tXAuLJI1vHJ0LK/2P?=
 =?us-ascii?Q?2BXsNeqY2nLfQnXrB9v53VFQWfOzRh8OrXWvNJlaxk2Q4R8K1R9VXIWHKGEg?=
 =?us-ascii?Q?CHbXX6vDjuyYB9soON0dCBXLEq+qRJ5fBVDlS8n6UQfFzF5H2Nhdn5TSytDx?=
 =?us-ascii?Q?EH9XTDGpCdYP0y4ke4hcZwrvoZLuV2nO0V9d/vda1uKb139R1vI0jwOGK5Bo?=
 =?us-ascii?Q?54ngGhaYx3ADWBTX7cGUSoJ599xvXaBKy8ydaUIDHJk32TNHN0iWiv+mB77T?=
 =?us-ascii?Q?2sTCsrbfPSg4vxZpbHzqtWHoCIiAD2QMf9VVADIJdI2Wu/w7PKUlWng9kV4k?=
 =?us-ascii?Q?pj46JRf3T/wVmFxUc0UCAqbEuqwRL+xK7Iw3c3bgymXgHRiYqgeQtAKYkFGI?=
 =?us-ascii?Q?L23A8Qt5tUaTdKD9xbLoY3sCE0PcrTwigPkKC+YLL9rXKFPXtcV1nTMv5vWp?=
 =?us-ascii?Q?RUNBMRrzLElokYaCHTx/IkScDcoJLYNNT/ZQpg+yo89Jdwc6h4h9U/R4rTlp?=
 =?us-ascii?Q?6ci9V7i21E1zOZwfPXl0V/Cd7bLRlXbfd5X50cNR/6Mx2OQikPEfVnFFPY0u?=
 =?us-ascii?Q?ZDPlGlVHmN2kocSciFseRKQmbIKEfJ7CFaPiHIIly4O+ygGFhKU03Op24JTp?=
 =?us-ascii?Q?qtlBAN7vihcKWfu1si+mJ24IIc1hHu7XkIWVQZm1rZzit5J9pIBUoexF03Pi?=
 =?us-ascii?Q?ItGKN8wIgNv6+2bur1KEEllyRe/MkB1YG0MELhMD5T3lJDzMVHX+utXiE0o5?=
 =?us-ascii?Q?priqYcR1RCSJMMmGC9iB2h71tZ4Qw001XFdWOmcyK3ZpkpGQZtID71u2m9ox?=
 =?us-ascii?Q?42ONe3+7/FDsuCoXcrGSGDXuntMcZKpmNfoAryH1hFMiBtOf3GaF2rtwTAm+?=
 =?us-ascii?Q?xfX5SIxPdeLym9Dcl+uDWjdn/GHWZLCH86oVtjUe4yefIc2AUIAJRRtLEGll?=
 =?us-ascii?Q?6tPO8JyazFnuCX4byHjkwGlGSJP7bjC4roomf5r8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd76a45d-63d9-41e8-1453-08dd854f986c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 05:51:46.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33EzRBILZkOT9MyuXVC2Q4asQy4YQel7NqPRVpYEgGqTOmiJ1PZQ48O7kt8UdtWGRqRkRh7JiQcAJNvHz154ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246

From: Peng Fan <peng.fan@nxp.com>

of_gpio.h is deprecated. And there is no user in this driver
using API in of_gpio.h, so remove it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/codecs/sma1307.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 498189ab691c..b3d401ada176 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -8,7 +8,6 @@
 
 #include <linux/firmware.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/tlv.h>
-- 
2.37.1

