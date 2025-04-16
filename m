Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3631F5820
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822091; cv=fail; b=dj4jawBPf53rBFUb9yv89OZCKuIE12NPC1q613kGH10dWb0e1/PuMEn/lPvJy/mDUilVa/cDDjwmj+sppuqX8lhw7slFU4f2wef+zIflUG5pqKuFO1ggom7gGKs2UpvNXa8KDZuVKPhpCuZBnnqkHNAEJLPjeH4KCoZqZj6dvjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822091; c=relaxed/simple;
	bh=5DjEOcPWBiEmytsYIaDEtZnZcTsjRERJeIxls0VuENo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ri1D4+Jrchc26mWbBq8FEytw8ZbeGxOfKXe66gaq5d7SE4akeQtBXz5rxjpweDsi6Vs/5TrhKQTFeFnmxDU77MXLCY8+SUIsaxHlbrRyquzugoT7FVRu+FYrpfKc3gK/81koFkCwAjvgdq0TG5iiZzeymviKjRVeSlgdWDHoUHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CZxic7N7; arc=fail smtp.client-ip=40.107.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CZxic7N7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fou1ysa3kL48R+tTjMDxO4poItgrnxYhWVMAL6LG85Dw0/X7v1BXLxply5HzXruQttGWb6/Rc57CI3LXJXMp8PbHwuBENPTMRPiuq6IdtuytSNO9NL7LujTiTxUr4SWIe/pweahzg+4Uq0yKSDucJ0Ib3j89KAaUmA0Ffh2JXQk73xB7cLkAjp4LnrzrwQEZdNHv0/OXWdR415G79CBUfdLc3td28AaGKOWQLHbHYZEL2t5YeeV7qqbYnWAlhO2F49YGfhxGPfvJEdo6fyZ0R2vZofYbZDcv+gp6P9jzlYMoH2lf/bkE+MAFjh1jGxM/gxGk8uCmx5BpPu1SZftgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vvP+8bR7+Mdgd1aErju7bzg/62nSbN3Noz0AcPfYSU=;
 b=Uxi670fWiFc/aKoUX/ZfkTXZAXd9jo6qbBK6uHm5jNgOVmj5Np/bdNw7Ghdr0vdN22PoYu2JYji7/yTxDbTAA0aYmTHtYEV4AjEM9SM5Xhy80UGLJLJ7AHA67LgOlTUZNH8V8pQQI+0LBKKti4WCKCv3DT/LCpaMR4ALeQtnYfpdl7LDl1I01dvLRc/v3NALAI5RZZDJH5dsaadZ84QyHV3IyPP8ioTynUKBggjIUWaKYiYHy/bL7ueAb110a8/nw++opeFVZoOPRNrDkuzw0Ps6koAOhK0O6MPIPBf6Cf5nccFZeETPHF57owONRrRlUBw4lBQyfheGLrFArnpc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vvP+8bR7+Mdgd1aErju7bzg/62nSbN3Noz0AcPfYSU=;
 b=CZxic7N7hTX9Qvnm3UWOzw0MceGIdgxNCvnc4o1hOvIA2xTVtXJuOnUDEBKLODRWErhYmswzXaQfp9bIhfpFe2HuOQohe3nUQo+mX3Iyr3og/VIeG7VIACibkzOgrvfTP5p8C9XaBUKLSm3V39M5Awnob0RTljxlyv3KghuDTWTHmJmaaoPKcivZo3Npj5Q0c7gRrvD1oxG14Yadi0lr+cqRzGow4MjCNkqG8E1XClmizAAlxLoz9olWfsB85JFIzt8pgtcvdXQn8gfMLrdokdPtKPJZ8oa8jw2WczaFA9ao+OCvX3EATOj6BSjwghVirFVw/qBGBFxL+a3Nfedfdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10693.eurprd04.prod.outlook.com (2603:10a6:10:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 16:48:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 16:48:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] i3c: master: svc: skip address resend on repeat START
Date: Wed, 16 Apr 2025 12:47:50 -0400
Message-Id: <20250416164751.3437085-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0017.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10693:EE_
X-MS-Office365-Filtering-Correlation-Id: e28b2bb7-83e4-42eb-e18b-08dd7d067596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Bncn/go9aEUWMe9Q/uyL8U1fGYUCrPnuj0MlCWrfnJQOE7yU9AWbL0KqMYB?=
 =?us-ascii?Q?0zVyyPlV4Io1FONrbs6U99+SEskl93F73tqzrDsJk11WGCZdySjraeHCjyNI?=
 =?us-ascii?Q?+yzu7OqZODNa1HH4wl7IgZrmY0NrVnmF4oB9R6YFeLg9F6B6j9zM0Lkovdrp?=
 =?us-ascii?Q?baqvk678L3ezcNxGZYpvjGpb0jMGRxQ0EWD4xIB3KjvA1zmcJYbguxQwUXrI?=
 =?us-ascii?Q?ibT9kift6PIm8tDnFzkZSGiaSq43v7ThhXvQm+aZ2XQ637znAF1GDSr3NZVf?=
 =?us-ascii?Q?MYlBCRVleba7Ha/Yscb7SvPdPG+NUjvx4t3Sc5gHfTCwhPtWjaptzxx0WSbE?=
 =?us-ascii?Q?Z4+nwo7lDn757mVFwQApzFTmNJQdcCD+wISSPwAAh2bsMKU2Vx9QXs/hBmqg?=
 =?us-ascii?Q?WYLTcGKzvQJmqqEvhXBU/G8DjMl7RhfNLBI3FAYe8wiOn+FCcs+ZzCL9/OAg?=
 =?us-ascii?Q?w+BVWu35chsLD6yalrh4SdT63q52LC2lVUsaNEx+piVc/P8pTK2RpJk4VelX?=
 =?us-ascii?Q?30rzKKP/5BPIruV7Gtlg8Y2kLV2ewy11h6fLVK8o6o0PWd8WXQ4hVVyiNmoe?=
 =?us-ascii?Q?v0pjB8GxV+xRCVvICM2WBAPnAdd3+WAupD3qb+vVggYAyzKMqBnN1W8Et8Ww?=
 =?us-ascii?Q?K0zCUHGRAXg6OKBUW+EWZZ0Gy8uO/oC5559hnv8CbpcgdBbfrFxbpLTJLPaj?=
 =?us-ascii?Q?btrJ1lmwWXiz3AkjAcPXmYz1z0fa+LV1PSNbgzFLLMOGv6OdfMNywKxK+6pB?=
 =?us-ascii?Q?wIETEEcBu/8O7GusSd61EHs5uvIl+gUNvGP6jA3byuolEPMSfKyd7z5roThl?=
 =?us-ascii?Q?1qBG6TfMdDiqjQ/quWXFV08NjdA23/xvNqiClG3ElOXfMIxANsCR1kXkG7M3?=
 =?us-ascii?Q?wH6hcry2wPbChCpLw3hPifgyPG0eQB8mbb1R4nZuJjSfUwhjRw6hoOeprGf9?=
 =?us-ascii?Q?KL3xIJaV9vJgC7IkJO1Pp9TsYUuyoOb7CARrzlIPxJzIhMOy6r+ms//nU3uY?=
 =?us-ascii?Q?tSxGh2agriXn0nQco/OUhdzOpDV8wVDU0w99+MlWbZPZLK69jNmeFylu+MkX?=
 =?us-ascii?Q?ubwvaBIpZBi7WPT2Jvgf8AI2zCEBOyz+BjklVQ4MLxVvVcMHzIJFH+5N1Il/?=
 =?us-ascii?Q?Ma/xBHc1K5jw5poMCczUBUqRNpaw/6fGZxU7D07NETUGFoW0J6Kdy2srs/cW?=
 =?us-ascii?Q?wgZsUXj5tdulP1Pj0pQRJFP50l+Fi2TL+Y4q6DD9GzxAHFg5312oBWh2B8F7?=
 =?us-ascii?Q?UyD3OghekNSV7qi5XhDlgHB/tBB+G7sMX0/0IVFwaui7Kq/uqfqRHOi5WjaI?=
 =?us-ascii?Q?kOu3DkX8EvQOcIPFh0Yv3tTXp8sBF0TuufwRI2uGy6Ex2sxH5eDnbk4gBVim?=
 =?us-ascii?Q?PCpQzH7l2PBryYi7LTGJ/N3R+p9bvxlPR0nFC6aCm6WKu3If6i2hCp0emyNY?=
 =?us-ascii?Q?zs4NmwoyB2nHJ1bUitWUj4x6+AG/5rpfFJ7WDsttrAvmfqBrjrtb3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FhOqRfGSAneHKU5ShIvq+URYGDS7ePzs18DWOEsFU6K8Tq3E7519OXJZm5qD?=
 =?us-ascii?Q?n2dnCiwxqB+2EModg+d4UTf2o4McmVYUiWoKsOksGnh/r3I/IcMMeTmDBggY?=
 =?us-ascii?Q?KJ/qPX/a+mbhL64BECASjMVdrxTP0ZiL3KkZhLJ0v8i7UzyDgGmC47nNk3Kh?=
 =?us-ascii?Q?33H/uFYibgsDU/XKfQHcLXIJ3QWWPv3AOCksCigbrs/GDmnFWX+Oc86mr1EI?=
 =?us-ascii?Q?70hw2llhVK8OXITnb6Neg8DnP2QLT/8LlmCPjmT4jUH+cRJEbNbb9t9bl4zf?=
 =?us-ascii?Q?PeAlu0zYovgu3j6vfz4ngiLOdZitw55Hu7KhIFUOUYq1+L0zqsyC7peKH0/T?=
 =?us-ascii?Q?+I8fJILa0uoHOUMxRCh7MoIkeotrtz7dKhKtXZN8bp5eDllVYGyBXisIqIhJ?=
 =?us-ascii?Q?BpVUWnYzrAiuGmmQR50vhIE0zx30s7MVauq7CdexNdgd+/7a5N9X4OYwKWy0?=
 =?us-ascii?Q?ijJX2kUVLaErgtN1h74M5f+eb0ywA8Wx56Q/NTOJYiobxWVsleNpO0ggBtdD?=
 =?us-ascii?Q?n46zHA/Q87Xp72yy5eZlpXFcRijRmHqiZBZ7j63uyNK9V29bg11OIQPMwklr?=
 =?us-ascii?Q?+S/VaBqM158ToXfHfjEi0t8/cpJh3MTlDA9Pn5eV/SYTyU6ognXZqDSIxDw2?=
 =?us-ascii?Q?R9GJxcY8AfaezY/QG3z8t1/VJMH/5jCGkAwHZF4ppYo6QgnsMu3YMXUO6gnf?=
 =?us-ascii?Q?HVxyHrIXYil6g0i6xji8T/+o8qc9aClCh3Tbz5RXCkxKdeBR3i1MjwYcRMpS?=
 =?us-ascii?Q?H8UHwp+nzxjtFdfX6LmbMLLyszK6n8yOlc8QxS8KAHoiQsbQVrfRfY3RMlWi?=
 =?us-ascii?Q?X0HhSF0piMXFZu0EyRG2c8IGv8FTJbWeiUCtjan+fEuaSAErd58BFotok0b6?=
 =?us-ascii?Q?sXs4kDYB/aJeqFbY43pmLWx7MYH89lRgog/5jKTmqmRYQW2kOUDTRo4ZsF/o?=
 =?us-ascii?Q?BnZCGiMJZVbcO2XkBd80/RxOugPrkBWv9R9VeveFlmb6CH83IGRrTnATSKfa?=
 =?us-ascii?Q?zOTOO9zKdKjIHjUOf1EfdZGIlBpiaAICaaW0tq7gDy3qfxOQMsS2ur4sv7h8?=
 =?us-ascii?Q?04Qm8G1tGOEE6g4O1/rOiOmsp4eLzw7ggXBDN+6VAnz4wkvV8x0b8fQ/1FXU?=
 =?us-ascii?Q?t12yk9kvqSS4LtqTBRbRyE56hgCxikErqfDuvgIU2+qUe3nVKu6eqeJOM6OT?=
 =?us-ascii?Q?8e+FZm8lBXwb3f0NaKUap6pIgqAaj8AABnzI12Ik76k6r1+wz9O02NA+hXji?=
 =?us-ascii?Q?H4GzkEwpyDYqIXw1CLtWM962EMJQOgjPGKCKntyXoRU4yt5tGR6V/gAsLXYp?=
 =?us-ascii?Q?4y4XK+RU2/OVWGGIWuPYXz/bpSC7LzUzXuYnQvCrQZOkT7qaOU6LO56xr8gZ?=
 =?us-ascii?Q?6LlA9TOoKgQMYgoHuuZCWVjOZcO9UXK+0dXX5FKV3zXdjef+XQjnNgzWdyaZ?=
 =?us-ascii?Q?cE/QeyfFqt9bwH2PwgPhBSeHamHtZr92EUfD4hPUbFFCFUHunHql/3U8NPs1?=
 =?us-ascii?Q?wsuLs/N9VAvYZc8oHMGm3uRZ+4ECSdrpkYOTtQDX5wkKBugPvAiYJJQ0HuT8?=
 =?us-ascii?Q?cURxxAWFSNsB9qyLYejcZTb7w2jfkY8RrO6jGT7y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28b2bb7-83e4-42eb-e18b-08dd7d067596
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:48:05.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjcU13HvGLz05NdosOWQYsVqIr0qmB6LhzgUWlS1CW6Qk5/b1qIbRtQVHxewteQsVSn1jaUJ3OcqCfJJah2mIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10693

According to the I3C specification, address arbitration only happens during
the START. Repeated START do not initiate arbitration, and In-Band
Interrupts (IBIs) cannot occur at this stage.

Resending the address upon a NACK in a repeat START is therefore redundant
and unnecessary. Avoid redundant retries, improving efficiency and ensuring
protocol compliance.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 85e16de208d3b..5212c2cc6855f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1281,9 +1281,9 @@ static int svc_i3c_master_write(struct svc_i3c_master *master,
 static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       bool rnw, unsigned int xfer_type, u8 addr,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
-			       unsigned int *actual_len, bool continued)
+			       unsigned int *actual_len, bool continued, bool repeat_start)
 {
-	int retry = 2;
+	int retry = repeat_start ? 1 : 2;
 	u32 reg;
 	int ret;
 
@@ -1468,7 +1468,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
 					  cmd->addr, cmd->in, cmd->out,
 					  cmd->len, &cmd->actual_len,
-					  cmd->continued);
+					  cmd->continued, !!i);
 		/* cmd->xfer is NULL if I2C or CCC transfer */
 		if (cmd->xfer)
 			cmd->xfer->actual_len = cmd->actual_len;
-- 
2.34.1

