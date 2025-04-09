Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3151990CD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179575; cv=fail; b=NjLbOwAT4XecygNfrralj1QRVvczdSCoP0KIg9NvE3e77DBNqDmDXyaW1F5sO/PROXnOXJJCCVNPtsOyqatFnJ2+aZNWyH+JWzDHTmoC4Z/chSqkbCv5UcoxLXd4OmYvMhU660tWRGC//Pn9NxDlwQX6lR5FOWbBjSUkJ1X4Vok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179575; c=relaxed/simple;
	bh=PTTcro8tg7AVxhcL6arwyJsw26ZtCBgPddaRuQChm8A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bfDrqfNAUGlaG9Xqa0JlJLMKx+4rpryOhjfGR1C8kbcc9i5oweq66N2ek4bJv1IrtraHTDM5sRyYRhWPX6NKbkUJKr56nmbMWe4hS62zpG/oN0OTiCXoc+YnPDz6/EZ/3PV57KP6HpZL2nmdBTdm+51xEw1tVZGIvKRtY8ZCBJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Js0xuUo7; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Js0xuUo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0wYxdZwE/ChQtCEN5kfK384YmzuXpLmoqUfBJyNSYq0SoLh/2PtO37hUE/qIUWOuGynrYLdAO8cpswFjP2U/m4Y273V8+8KHAnW8nKNBuwkeqU5JuKCJVpXbA52mxOuDhakmUh1NVqlYBRsP3fI8NRKWEZmEAjSTC9xyHhwQihNunNKY1IPr70ha9ZJtpwGs87o7O7qSF2L3NRXbpj9IJlv1/D3IEg7HgEA332OiSqhW4zaQKTmTY7g9/htqK474p0xDiBfHb5on45vx9Oh7guPo6Tt+W86SsbHTzqdSKfwJ35lOzxX4pViXP2dLQ4HyCQL/7/JRTLuWsGZmsCAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaAZTnEwbgce5Zqkf4nQ9qmTuwY2dSvTBaAdHZ4StBQ=;
 b=hLwxrDKG2N298GH/3JU/PbglZg/e0V2eX3NOCSnt1vPMldoeUDAweFsGC2oZLEE4B52wFVGV1LvlVVX1OGm8fcPcqAf/qqPq7WfxqfYkHe7+Fjt37uTuVxqW8x9lRtZ2VRgJ/OeyucOwNJaweQqXGFoPtu0qcep/Dh8ZzsaqfqGZzkI3zZAKAwB/PnPoEnbUk3LIjs3JGOi+xmsSW26Ut33dHLkkgTjPUYwJkj9t9HWlvFOhDvgirYw29RkFOysSHM3Nk6HzjV89pEmQpSq541z6xt3lQLSani2NqNvQrIuIDXT2SDeEXUR75W0u1oexyVOX+6jS6J7HS037uTBy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaAZTnEwbgce5Zqkf4nQ9qmTuwY2dSvTBaAdHZ4StBQ=;
 b=Js0xuUo7lpTzVa7OCI63oWIWqfSp+Ir8ZG4br28sam3ZB3FKC3+mjn7k0bYeg08nnYFI0FCJJv/7HJ2nEcnMcqejohp/yf+x36Y2bUP5pw28l3upnDLGpTqjgCKdZkGKgl8yrswPoZVpWdjDaDi5ExKSpdIYzWsV2s2hGE6YH1+WyvEWoG/ZZjeBEY2AY7zrCLhdH63Dt908+ShkvsUSN/1TKadqcBmq+kJJQjsqcDhP6dTchG7LnlVirOWBiI82sU7B/jhM26w3tm7DNzQp852XjL7C09Ioh6TOSe1SKFmwltpmsoXykOeTTnw2fyv9pV7VXqcLKh4RUPBMaiLcbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6798.eurprd04.prod.outlook.com (2603:10a6:803:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 06:19:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:19:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org,
	mailbox@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] MAINTAINERS: Add mailing list for mailbox
Date: Wed,  9 Apr 2025 14:18:13 +0800
Message-Id: <20250409061813.3209600-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0111.apcprd02.prod.outlook.com
 (2603:1096:4:92::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7dc87e-af34-4722-8dd7-08dd772e7bce
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qp8z26Ov9pyQQb55pX64fqeMvsv+sZaOHUdAxoGDdo8LKcSlMdRtmUaCdwZI?=
 =?us-ascii?Q?HxT+42HOQNkc9eZoKbC3cYP5cjRAylnQFHaiCTXosn6zy705KtcCmFY61s3E?=
 =?us-ascii?Q?fjMeS/1FSiu4rySCJi88aDRIfKsTHvFg5cmVOfCNw8PYexiczO+24uDsdUpI?=
 =?us-ascii?Q?aRrMBIF7v87AFr293nioT76N+BXQI1lsL2W9hp0F1+DZOvCR0MNgsiNEM8Dq?=
 =?us-ascii?Q?y9KYr7eLs/+nbGcPtzDBO+EPb9RqYspjCK+kkVhxc8ds8Yx397pJfGwKGyXy?=
 =?us-ascii?Q?Y+5/LTIZJ43LQpQaRQGRAxuRjz6Zhh3aD3kMBta4ov3GMZDcHDnsngp0FMXw?=
 =?us-ascii?Q?NLoVvxTf7Rq6/cYfYfOT/LnEoAXPXKYgWHSXr9ZdikDPZIXegQ/hbBKHKwQX?=
 =?us-ascii?Q?H+AQAuSDZhX4jHze+qHuOu98Aw7EVzDZbFEJf/3rOCgRjbU2IfILYDEXPZ17?=
 =?us-ascii?Q?DYq0eKgV4VqONdjZSzzn9c5LEVwCyrwqMh6BinZM1FS42LXGYcCaQU9onrEJ?=
 =?us-ascii?Q?mt3P9oRYPT6kUglLQdJEypQUOTmj5U5Ylbtc/e3+7Ml0x0FV+S1+xu4bSD79?=
 =?us-ascii?Q?OqtgzO1PijXVp4RZB2Qtx3/wfddLIzG0Q1wf0y73Bap2swee7rRT7AgDJebz?=
 =?us-ascii?Q?HN//hulBbcnxGvzE5lQ7JNhq3+spCkkJQ0pUZVMufm//8G02s6PE7Zzj1bmy?=
 =?us-ascii?Q?N/APLOcrpqlas0suUg2QcEUKSJyprNKapGSw9OIE78hFB0TkYujTYPZG6YV5?=
 =?us-ascii?Q?pJ8K0cBpth2xbcPyxu4ZGnwR5RCbDF9VQa7t2+tBNQ2cKgjNYlQruAmtXVW6?=
 =?us-ascii?Q?ipyPisdTizYlmxxEHeNtWA6MoehH8C48pmM06byXexCzw9mMID/3I6abF2Bg?=
 =?us-ascii?Q?7Cw5AhwKycmJcx4Lf1y9iWdbrPUC/7BGB+G0BGEhybmbzrWzpOsQqmiBYkOg?=
 =?us-ascii?Q?VsO6HnnOGJMhiTMWymSSwjEbRw8bYmJoy9mD+57l5+xfGXJGzIOWlf2Cqe8G?=
 =?us-ascii?Q?kCmD+ChdvmotW79br1set8xRiwFpAXV3jBocVEZxglcp7clcQCzXbCRM4gNl?=
 =?us-ascii?Q?N8vDUvI2b2S2drrBeJP5goXtEb9e+oSCsSjwzhXjWgSMxruiR1y6RQM7q64m?=
 =?us-ascii?Q?F/0rT3bsDRGmokP/bDmmvlfYNwEfMQgIqq6T5ccAj5eFTJ4EoUxssMZzsycZ?=
 =?us-ascii?Q?D3QXXfM/MNzZ3jfC7Aw2HJ+rdd4nvukhporzNeNW36JM35R0hcLxfYfGtkhF?=
 =?us-ascii?Q?9NqDh9kHeFuTsprawo/SZWsa5lEPYMEFuWAV70bTRtqNzILdrdYmVgbYPI6C?=
 =?us-ascii?Q?udr7FK9X1nhJEbaeikNqQtrLE5/Jagt5QNYr31aXt/nm9pJXzhoFBIDprRzl?=
 =?us-ascii?Q?Sp0OKRBf9QD9oovSO1BNqagGTA/pwyaRvbwK5gta8pE/S7/TLf9oN+e/+kpx?=
 =?us-ascii?Q?EZz64ny1pY7pO4z8ms8y684nH9TGUkIUAqRZCC8KmpUX/EKvLnHNzW1RT0IX?=
 =?us-ascii?Q?3j2hrnFaxredCE8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TBuemwll4WHfGYS2QHyK/NeZx1dJBppL7LaNnulgWdm9rw33FPEPp+rp8W5s?=
 =?us-ascii?Q?KqgD/iDajVu1MFUbGEocDg4U1sh5ur9FuuXNmn8NN+pl0bP8ktOlro4Q9Zvi?=
 =?us-ascii?Q?yjxVX/7D/qZEmr6RthhKZCdfd0n7Gv8rThOpGO3maAWO68Pqb3dC2r5VYXNi?=
 =?us-ascii?Q?aLmQOrgnsqMaw4jD5fBZpp4ctMgd4Xm04YxwOHYm+zHKTsefds7W0U/J1T7v?=
 =?us-ascii?Q?FtANuC2mNtf/hk1bFyrbLtdDzuujjxBBw55GcoS/AiEDXIxQ6t9OO1mWSDs9?=
 =?us-ascii?Q?Q5Nd4EAdvvQp7Ibz5KvfFWFToRAQWvTFnff0m5McwCtoBC1pvt4HvpyiGt8J?=
 =?us-ascii?Q?SwvRMnXh8cwY3hKmeWTOjCavUFKAofjOcb/NnPVlev4kHlb7TpGSuAynz70R?=
 =?us-ascii?Q?tZVP1XtWtD9l3zhuZ5KefgBffaY8zwMzc7/KubIkptvXBN1gIoJLZk8+8Uqp?=
 =?us-ascii?Q?1U/uwAPH9vqSc2S0Kxoqo+oINqd3wNk/5Ca7GE6s19CKFayuiK6SBJJ6Au0C?=
 =?us-ascii?Q?CgZiXlR/eVEZliAL+RB26W3LehV4jWo0l4rmeV6TrZS2XPMmqTPfx+ctAyLM?=
 =?us-ascii?Q?UV5zpNOfiubui6g4eCdMZYdlTs4OQFQVcda+TIychghjCo+5JjMYkhhfVLAO?=
 =?us-ascii?Q?4/gLrwTSH9UDBxbjoyu90wiKNlgeXMjfJJ0M3/Mw7j7sbodxCiMmf6BwVIaI?=
 =?us-ascii?Q?8bfHgbkjuMw/pcNHqrtiuIlFW8bkf48sLMnLiKpeMg1I2PHwB2aGQKVWTu60?=
 =?us-ascii?Q?EVlAZ+yzBUMyZx5FrSj/ye4KKC7iNwyb/IHMdqfD3FQxnqVHSmuYIb+68YfS?=
 =?us-ascii?Q?XFcwvQ7DdS3G6xy+odQa3EPLgd0HDsQNOSiUA/qHXneZ+amC+l3Fh5CI+Td4?=
 =?us-ascii?Q?Uj1EOSM5eEbWlY3+JRUAjFrVWoYEYcG4Fk337b5P4LtXkgLowBCSXzqTnEMX?=
 =?us-ascii?Q?QUE+tosRCsxrA6xY/vy6L15q6HDQSqyzfB/J9+bWl4Hu2VRdNA8AZ1uEshA9?=
 =?us-ascii?Q?S6E729DzB141GOJk2FfE5m2S18njlHBAwpkQdlSWRf+NL2V8VqFSuXah+QVU?=
 =?us-ascii?Q?dhlKXflKrC3qmnB3/YZxH3gxytlYZI0SFyYXNAmdSnvoeS7uxud5HpwrCOO6?=
 =?us-ascii?Q?NdnxWHlaXH9WmiHjvT8wkuRrApgkCRv/Frwfw6J/o9s10SFRilioGB21izvN?=
 =?us-ascii?Q?5s+qX9w7NLNGTZGe8BP3lPCe65PfcdHAGfjGun/ymyxCrR6IVqe7DuToJzIj?=
 =?us-ascii?Q?GPiqeV87gxvyY2qIdPVQe+YBQndhEGGRu8f+kgvAniGIMeuoJGvl7cyfwB+x?=
 =?us-ascii?Q?psK/ovX3zTD+RJIj+Q8WWFybk5Fi4dJHrDjhlgPwswnPkVh9V1GuJ0YXMbUk?=
 =?us-ascii?Q?vYMvsxOTodrt8SxnwLlLqAMldXWUzJJYYVcLHS7hg4/Pc3AOfKgFGGhlWvoz?=
 =?us-ascii?Q?+dA5R2X9AroPYkl3vXZsYsGCDcVsttODfRygFgrpuh27JHElmZHRLygz53ag?=
 =?us-ascii?Q?fFwWKeiA+dcCsLXIo1mRMRYsWL6+/AfPDXI320fV4INAUY/TGdZsBR5pOROI?=
 =?us-ascii?Q?i6Hq7wgkkqf91CTw4ojcoWzHpo7RV7fEnBLJMINY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7dc87e-af34-4722-8dd7-08dd772e7bce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:19:28.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3cTThj3t/fnVUHJLYpGRKPzQX2WV/+WteCYHRryP8A4EXotYobc4uNX0HUarYPtxri4XUI7snTIUVWPpSr0+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6798

From: Peng Fan <peng.fan@nxp.com>

Add list for collecting mailbox related patches.

The mailbox list was approved, and shown in
https://subspace.kernel.org/lists.linux.dev.html

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e406de86df9b..063381bd7735 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14155,6 +14155,7 @@ F:	net/mac80211/
 MAILBOX API
 M:	Jassi Brar <jassisinghbrar@gmail.com>
 L:	linux-kernel@vger.kernel.org
+L:	mailbox@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
 F:	Documentation/devicetree/bindings/mailbox/
-- 
2.37.1

