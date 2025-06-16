Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013018.outbound.protection.outlook.com [40.107.44.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F14B158520;
	Mon, 16 Jun 2025 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750055134; cv=fail; b=jOnAj8RMxdSvWlEmwsVlNhrwXMYqtptHiM94Xx5xG/TmSX9rKuZEsqXgOtneTUi6FbFVfLw+cRpRuqH4NoB6ESn7WXZi4T/2BjWp5pNkIjbFBeZrHnBeD9FijAadiMCzIPL/xtMz3FtDDFjWNgXDVnMuCsGQZLdOi5tjehKsR2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750055134; c=relaxed/simple;
	bh=ZBidozpqtbkZxRpzHMXP2gNFwEBghXqMbDYmwFKQ9H0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H8aLsBjCKfkxRzNTWQMMN5qW2daf9uKwXFrmMfG+z4pxqaCtDdVPXweK/niwDm9ThBqBPLBqRk7qfJJJ+Js9E8qSw5DTAg7+q80EGYrWdNBAhFJxXkBiYAOHYhG1Fd0alcxc5wDRAyUqGQleCBRKRKDcwQLC9LvuPJuCQAiIdNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=KOF/xlWK; arc=fail smtp.client-ip=40.107.44.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="KOF/xlWK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvUJJl67Pa1XKSCTObo90ne4ojNCR9+E9OBQld7/ZJfNQZNQNUJPjwuhCv/SQwg2mIVTAC7S/2LJTRnEUEhKIV6tfaKazJvtNPMcRDz0qcp0kcewJWsHIOBgG/PwK2fPSlk+bnY9CfELkB/Ga/UixocTzX5db4dLeHaXwGd8Mb1jYKqc3HQdFENsCZ03So/UXMEazhrEpOcVEIMNKdP4oXaNYVHVUcBrbI+UCe8d2SoPgKpX8oIsaVIYeK+DJDRc1ZOK5sYiuHwSwA/Hql0KNIku9b9Cy0wogcWqUTYYe0R0p3D+kyt9Mdn+RSavZ5WFDWA6D4DN+K4kRhy+7fYh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4QeTLS3dg33I5yLZUNC6deCu8O/fBT9qjLsVzYfgro=;
 b=urEb4FKA6pmM69YniOD7jlv7pbvxnybaBzftjjbMzClKytscBSK+Tb/No8Bst/Rt1v530bFrP6jFAb5TbIGdH0VZVBwws+BwdL562FWHUaHdGTupSnfc09ELA2VRcFu5HkqnhOy0djDPHfsg/Y55pezk9/lxAEEwPKw8JLvAC8FaMv4FHmGSQALGu2ga6UG6dS2lZtPUSkiykmNSBWggWzdd5wYsA1z3AHutn5HHX/BanjFk2o9nIJPyz9VPjhYdjZRXihRyLx9Qi4VRDV6vsCDnhBnAJKMs8MznuIswLS8m3UPHt+4TWCZR7Q/K0fiZ+BElKhq2IyfS/7Y+Sb3eQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4QeTLS3dg33I5yLZUNC6deCu8O/fBT9qjLsVzYfgro=;
 b=KOF/xlWK4vOhNyEHXsQKBnIawJ7zRH7JvfvJEGWWIYog1tYsBKDvWWlEUA2WFiCn5P5XvThSsUWFGnMssqhlKtABNTWfI9NfsM2rke8WExYE8rLVZR7VAMCvHBa1Ra4SeGVtMysOYUAUx3whMl/hFRZfcI5UzGc1BH25hUgv2PE83dWS9j4VoB3eL5b4hl/rR/rsjiMEAKLiznynoyLA0HquxSnnFJx922GAZo0sDcHkwVPvBBQHgDyw/uC6reAdMiBOhAaQuNyNCqiA0jU3RLbSztF/X/HYlQ+2JizkwfUpqBeeuRX19ZHpqIFRDYZiWCSt5EiBoGfLpC7Y9QFMFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by TYZPR06MB6045.apcprd06.prod.outlook.com (2603:1096:400:33c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:25:29 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::9043:7fc:2b52:535d%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 06:25:28 +0000
From: Yuesong Li <liyuesong@vivo.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yuesong Li <liyuesong@vivo.com>
Subject: [PATCH v1] usb: storage: reltek_cr: convert to use secs_to_jiffies
Date: Mon, 16 Jun 2025 14:25:06 +0800
Message-Id: <20250616062506.1074376-1-liyuesong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|TYZPR06MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: f0265910-23ba-4cb3-0fd5-08ddac9e9661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0LryLe32IlrDEngU0lm+WyOxa5yvqjIl8uYu811/fpt4C50QFfjE0MRn1Gse?=
 =?us-ascii?Q?zvN0ACMaQjoRtDGKMA6+jVnoeVZ/Vn68eB57JZYA6syYJzXFU/SsGTnUdHp/?=
 =?us-ascii?Q?nmlxR4CbqnoKTA9dQPjqpZX3HbViqWANpiyAxNTt9H+omKuJF3RU7SXWss3h?=
 =?us-ascii?Q?fhRGMBdj3svIwgB6NUBYfETJM62B8PKGdptppP67njDcCvTTrn72Z9ZMNHLM?=
 =?us-ascii?Q?Wkopnhrl6OQvzKbg3O0IT/yS2GLkYOKxXsmqUm1cI4yTn/N4uvA6LrZDYXPH?=
 =?us-ascii?Q?XgN3xTW2iiY+LkOgdAJKYSb4yVhUTM+YeG9D+NsNod78H3tLuSedS2LDJJMa?=
 =?us-ascii?Q?mDYP2VYnKRK+4bkXTGg3XMljPSoZWNQ/qSZLR7y+Z8gTpZPIfz4OOS9klMRR?=
 =?us-ascii?Q?cHrer7qohruXbqEUdM+EJKwu4gZx3cNBXHz/Bq6hxjTG9bLukMS5lOQ3Pvjr?=
 =?us-ascii?Q?MYcCfhcPxk7qQLbcz7m7ieKtDmlscNaAfAf428HHzNQuEHVe6mqedJbrjY4+?=
 =?us-ascii?Q?q6OVLFUkI3hyiL9EfZMcqA4u/2tT20ErQALVRXpdkfCzRsIWDCIxvJ+SWCIT?=
 =?us-ascii?Q?HUNKP+czQ08hXqjP7Vr88toYk1jPLN3Cd8H7ohDlUHaAnqfPTkPztGcnpb6w?=
 =?us-ascii?Q?TIDNY1EdwHaUH/qE4gGh1spYXODIV/Od32AUY0+UvveIORDUcq/7oYTQkjt6?=
 =?us-ascii?Q?3qBFx7zorPOtJkop+rbfXtPmcoYcrEKYRj7cyG6zKRRc+opQA5BSMCgEkYTj?=
 =?us-ascii?Q?U4TZ8+dVrlFKVLOLFhTQ40NepiHVQRaW9eFBPkQcExIp9UJxSyKT5z70EAxq?=
 =?us-ascii?Q?ArKIqQrhQNwCTsc13eVp8afpovoaizWly5A55pgtoFncJ50r7f9kvzYFewXB?=
 =?us-ascii?Q?3TkWjhUyttTJDlmt54OFR2fkcNRE3XGH8G1nfKPSPTc70yr4AHEMLqR1Mg8V?=
 =?us-ascii?Q?YCjf5UmCXry69IEGiKDLotY+Tw4MHH5AsWfDl/5VM2XW+eg6bM2ZKDtosRik?=
 =?us-ascii?Q?gpU6BGBaeljhf7EpfCO9w/0ASZIkCoyt8/v5e3aDtbLTAwvahRa/YELjxIJ9?=
 =?us-ascii?Q?P89ZK6vQrHrMNSVR2To7dqYIaPc6SdFhcXtN8sqGbMjrQcUUtWVvaIMdscY6?=
 =?us-ascii?Q?aBGA8DSqIWj9Rla5TK4/3x0z05d/aUwXBNgtnrIN4h9V9JrMnF9XUNDd9XMg?=
 =?us-ascii?Q?/zrHq6FtQi+v4MZJ2wCrqEtxDYef6L8XYjS1BI2pXiUDwZU9Xw564dhCdARW?=
 =?us-ascii?Q?vn6Kv4opRgQQPVcPTZ7+Q1nNo3Vuj7vpFZ2yTUF97R9n+0gQ/90vJ/0n/mhP?=
 =?us-ascii?Q?owamLz/uD6OR892WZjgs7bYpRpJWoV1CPpViKjUNgMmpMkxO+guM9IhneJOk?=
 =?us-ascii?Q?EocfRoModShCScBFo5PRbZwOgVUyhplF762rs1aJt31vNMEDXlVXeRaXSq4T?=
 =?us-ascii?Q?Y9PPz6QHFdDGJGaCZNEZCzQBr/gApOEUam8ahGCEcksVL+6QB34+aw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5026.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dmQg6TzGaphKLK9CwmEaZUDWpXqjf94ylk8vT3efUyVI6CP7w8qxpODq1eUh?=
 =?us-ascii?Q?e7iBjAcxShyk76gycPSvt6muxuyG/bY29DZEPRAhVnB3A0FSZ+wg3HIKLElW?=
 =?us-ascii?Q?54BeQbAmPNfztgwJgvMjagmH1u4MpAFn+qJySEmKT0P54YAGjIWuCLZNx6/Y?=
 =?us-ascii?Q?bkdk2SrnpoylW0XLEhZsK2n0SbewiyvOJy7GpOBFFDr4XQOG32am6JPkRV08?=
 =?us-ascii?Q?PSSq3K/jpzgX+magOy+/5a1h1plGeFVuxC0sNo4BitqYKP7f6qOOVC0vlKrn?=
 =?us-ascii?Q?0PdiFd/I+C4Rjvz/AdVuMUneXLONWsJLH87jPc3Yyx1yxoDSmx9587Z5/bnK?=
 =?us-ascii?Q?k8bjlVA41CEVq14Fs15yF3sqhPUacYaFRbpkT3F0ppyHkcPvC9aEh91tKz0Q?=
 =?us-ascii?Q?eK47e1nYgeG1fqQxX2iLIVLGPdhZ/+ITD4HBo9xtJOX79erJEaQDyYsv5pFK?=
 =?us-ascii?Q?V2FR7wKCdqhaZvVZVNpAqPb7T4DWoi2lMAVPeE2idadT8imb/RvVwigQQKhI?=
 =?us-ascii?Q?UjdJmRZxnWRfPomNgkwtgN194BHOdEsqvx+m+zZMCs+OBJYktK7htxv+Fjb8?=
 =?us-ascii?Q?YitPym7nHDgwQjMJe22h8frArac+wq0YqV5BT9rkJjKWxHQlCi+n7TXG6CL6?=
 =?us-ascii?Q?mUlqOB8D94ha3oxrYCVM/ZqGlDqbBjFTxZu8a7/w8uDwwf5iLvBRo2Wv93rF?=
 =?us-ascii?Q?yzn4tJnIMjA8POHHXGSp2TONQQcje15FD/tbvflJAfEZmXxcClLnw58XkX7c?=
 =?us-ascii?Q?gNBTAZzcN4t1y5SmwCGvr0BHw8YdZvq0rl1B2/Ch1YfSm78Q+0uX6s6ubKJx?=
 =?us-ascii?Q?WD3pT8xy3N4OvkqrY6FMnSQPUcRy7PJHSNNvcfL9kOjaLAZcNQPbG9cS0fEN?=
 =?us-ascii?Q?+7r4iIoFUH53Kr05qnGA10dD0igS3cPVY+dOyPH/N7jWi121S03Ise0aoxKw?=
 =?us-ascii?Q?DsMvPlp+Ngm/kK+L12brNgqGr/s9hLTcnMNi2MJGum9UXMZmu4oQLquhPeha?=
 =?us-ascii?Q?1eaxgNdpS1On1Icx4tRW06Ieo4U9c/Aga2PeHzo7H/fOx1XscK2EAc/8FVjb?=
 =?us-ascii?Q?dua8/Fy/0/eDQtBDSZEZ9DuutemdxNcBKcT3LQt9SwyHcpPemOKxxWNgFqh2?=
 =?us-ascii?Q?MtTgabaqt23P7e2gDIE+P2rlz8BJFfjZzxHFf8hyu2455OS0jnm3f2K+hAOj?=
 =?us-ascii?Q?DUGlYeeUFnDd9Q7ny8k1KgSCNyZuaShhy8sXF7r0rBale1x8fEWI8shLUvvQ?=
 =?us-ascii?Q?8bi/KcSlPdHQM/IL7shHToegJlzdqzbRCxeFueeMMVXdMwWDzZtAMPnt6+j3?=
 =?us-ascii?Q?LzA2kC9mkvCTqApDBYToRdPjzMUhupPCeNB3PUnRqsU+p4UglugV+5TsPhee?=
 =?us-ascii?Q?ed88UqG0Y+uwt+X+c1G70e0Z6T7aLMt7SFseV2JM0mjSVtBdg4D8oE6LjQ9T?=
 =?us-ascii?Q?WWXQt2eh6gevhP860gKunoesCBDsqum9oVh7aAs4pBPHvf+N4WK411YHPn4s?=
 =?us-ascii?Q?/MNpX3AivcaMFGb43E/VqKZlAzxFUTy036HnUptFZg1uFVoNR/AvmxZ2OH6g?=
 =?us-ascii?Q?ZJlWc8DCfJXpmwlrY47yqxApDK+XHXy8HYuUyb+d?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0265910-23ba-4cb3-0fd5-08ddac9e9661
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:25:28.8002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoGymnUoBAlr6eF1hkeinY99fhcuN/hX30xDr2Clky/kGLef1qWhN7ZGy9FZFVN3e7j2s/JqCeRPKJXqEXKViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6045

Since commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") has 
been introduced, we can use it to avoid scaling the time to msec

Signed-off-by: Yuesong Li <liyuesong@vivo.com>
---
 drivers/usb/storage/realtek_cr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index c18dfa2ca034..7dea28c2b8ee 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -748,7 +748,7 @@ static void rts51x_modi_suspend_timer(struct rts51x_chip *chip)
 
 	usb_stor_dbg(us, "state:%d\n", rts51x_get_stat(chip));
 
-	chip->timer_expires = jiffies + msecs_to_jiffies(1000*ss_delay);
+	chip->timer_expires = jiffies + secs_to_jiffies(ss_delay);
 	mod_timer(&chip->rts51x_suspend_timer, chip->timer_expires);
 }
 
-- 
2.34.1

