Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4919FA93;
	Fri, 13 Jun 2025 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826399; cv=fail; b=h+GMFEaV7OjyG68uMOgJ7yvquJbWsww/hGsaEiv1n50iH4YQ3VJaeGr0zaing7MSzKjmmrxXHm2BPBmt5V/GdzqHn784BOlFpdjuCU0X7CQSjlQHTIpeUmfbnuTUGobBGQtBjpj/pwZbB3jMZkdIxzPI4G6No5LtgQ0zGBmDLZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826399; c=relaxed/simple;
	bh=xtSccUSIKO8vabOgAJm6bwuB7wDORVPDnhkm9QdFKG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dKLsyLshIfuBhrezMW1xUlsMZPwgsMzIHho4dwIN8ZdBSIMMmmj6D0KQz+rYHV7Bi3xSKQd2jr3KXA2qpLBGHyC9/MxZzAXsSOxQDlOtyXNW07y9YHXVnMpsYXZDqpNeiPNqe0OOZ+cB/bcKmbNuOv3fbG3lWzIlj8GfMRkrOmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j2C32GJ3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nHus9rs4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j2C32GJ3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nHus9rs4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6SgDd031504;
	Fri, 13 Jun 2025 09:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VnV3z1A75Pbx8bdw
	N6JiXIZbCMeK4tWls3Dng3s9QUo=; b=j2C32GJ3ChBFU0jHmsTdul4Z/83GlPcT
	8JAOALxgbn/bH86bXGwhXBjV4+g3bBcibhSUofKDVNnqUBQkZEQU4Ys4r4YbyUB/
	raj/y8qzvhun6ln3GEiQ3Ch0Do7+pWu6aYVwtSLXNk4udhJFSTEwcmTm/gedqtfg
	3tm+1PJy9pV48cmNWOTJyLIVXjt0eemaQJWGqhIMlq4yZPKBwbBymsicDE6hcOqO
	HrUAsN2v2imP5iCmiErHwoV9IoEhmKHCH3CErGbVknAleaExtxIw9BLUdqZOkuu2
	oqFIiGJ4yN9X3RE3tGSGVsc7SskeYnAi3jtgkRJSnt95hZZj39DnGg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mwxw2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 09:53:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtHi/yLpVOgzxZ5hO7vFhhGs04b60qrgUxD14J5doCpKXs/OZ0dmDZalP00W901uCIdB20CSMprkEx6ExwhfiferEC8u1CL1jLdv6to0E9zqNDpp3RD+2lvDAjfQlUlmv6N+59IybDeTgDiC4L4VG4BVpDL88XGIIJPJfOKB/mWS0HpcerClAUpDtgMgGvkBgAQVombRr/7S8MbanQIE9oDa0e2VZSWyVtnJFUZnxz7GFezi1KMxuJRCjndZzUsZVAP1vBT9XLm+3r5/zSYXNkU5TA5EYG/fkA+Op5d1V7532UR6LD+4ik0Sw9EPx2SRdYkXPVklKfmEVQFRbMdOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnV3z1A75Pbx8bdwN6JiXIZbCMeK4tWls3Dng3s9QUo=;
 b=kJj+odCNXoDgktOvbxFKRpmd2X6aNSHzu/KtjlwT3WWzdNvBQk682VQwfCp0nVUcMSwjzXW0dabagofvATu6xooJdKbN/E34DQcA8B3GSMi8mHVE6b0dm6eaNWd2YVHZnSzfm9KlubGHwj083gNH4zreDc+lMURi9B621c1TMQFboDZ9dCJBc6HF11KumhUBz9UYJ58TriOYv+OuvuSzco599rorkefK6al/mekMbU4cabHB1WbwKizhL949FG75vFK/Kv2UZ6UmmnV6OR1+fjS0NzuuEO14EXFfeFJZ8ZpN+shdUsGAFHfjgOvGc4oHqLJR6wSk2RLdfnpEE/o9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnV3z1A75Pbx8bdwN6JiXIZbCMeK4tWls3Dng3s9QUo=;
 b=nHus9rs4C2j1/ya97OKsDo036nfa9icvVtjbCGXvvRDv4ilK4fgRHhjykFvLE6b0M1ggvNg3LhXViyxQatf06kApuDR0KM5SlD843Iec7dcQPJvhHAId0bq7TYmbndGib5+pdvd/qi0JEHWxzvXIWAzCTzwXtXC8o5DsyLCXpIs=
Received: from BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40) by
 DS7PR19MB4552.namprd19.prod.outlook.com (2603:10b6:5:2c4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Fri, 13 Jun 2025 14:53:04 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:a02:80:cafe::27) by BYAPR01CA0027.outlook.office365.com
 (2603:10b6:a02:80::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 14:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 14:53:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 65602406541;
	Fri, 13 Jun 2025 14:53:01 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 23BB182024A;
	Fri, 13 Jun 2025 14:53:01 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, nefelim4ag@gmail.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Asus GA605K
Date: Fri, 13 Jun 2025 14:52:51 +0000
Message-ID: <20250613145251.397500-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|DS7PR19MB4552:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56881f84-e119-4af1-2829-08ddaa89ffbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?anmQdNmBelOaks8XOrTryw9+qmRPY3Tt3GxnsZ3V2ewsMpr8FuDeakEGObee?=
 =?us-ascii?Q?8Cty5HlpVYtq761WBfcC2WeJlFrWVuOCBXk2YecEKsoF6Kd/WkXlBen5g+k2?=
 =?us-ascii?Q?mzGdwSCv+HdJecwFPUNaxIB0ESOLyE2CWsCwxjlucolFkKKeQ8D/fCYaTJXU?=
 =?us-ascii?Q?tj7vYeEmRC/BAqB8gmkESvNpEGaWqnJmUjuAW4nA2O6SyLJ9r0TnOBothzUV?=
 =?us-ascii?Q?RVhS0yonk7KZa8Fwm8aoo3EefbTcWy+mUu+A0spINWa/sgLoDs6SumKAb3dd?=
 =?us-ascii?Q?ct/7gjybCS+nBADoTx5qf4rIoQG/BQE3r23Z0J/XUZrW1I4h0zyy1u/h37pr?=
 =?us-ascii?Q?qHQzBJBkF2YTY3SrVp33GsmZ/NdHf8sSDwnSd/8bEoPsiIjIMjro1REf4R1o?=
 =?us-ascii?Q?k3yEzC1qRP6Q50+DCjLauSSPcaGbp8yb1gVoEZmINshp02+tE1U7991gZH5o?=
 =?us-ascii?Q?ECTWf0n0V6qmGQKTQUQM2OhYmKbiSLgCOiQzLRHzjGAffbyC7JmzS5AnA5ap?=
 =?us-ascii?Q?CCjskL5DIX2fks2zmhT+gBnKKo78EjIHu5O8EYDbFo872xyK8ogD80ut/j1T?=
 =?us-ascii?Q?3dfaYZcM8hpi/dL1CDTtJHHkQXlcb2JAdZhgI7jTZsvnOWj1GbFVq9OVj9kz?=
 =?us-ascii?Q?gPhsMzfOvBxPI3Nbyi/2r5YwSk+IyRlQQ4VOLK2zCeW+nu8oLBr2wBS3Tcfm?=
 =?us-ascii?Q?aQFjeDrS5u87FAG54xFHJDPTyKJICNaiLY3ek7sXcHI+p+Jx3jxeE2P4Ecim?=
 =?us-ascii?Q?+s15kcmYWeiUyPpAt6gbUxiWl3hQwYGak11j9M4c1PHX2hZYpcOs6OW89aBh?=
 =?us-ascii?Q?7hirIJr0GNIOmTF6KSuv2h2mi9rf4IwS4KQrmKPx6A5YGW5vTQnZzknoJvp1?=
 =?us-ascii?Q?AaeI3W0tOGVsuc96Uya07FP0KEirc1on2DSnuGiUyYLA43urCGeE/c4YLS07?=
 =?us-ascii?Q?3+Z/Rl7Boe3XfV1V6BYXlx6xB378nNCOirojZVxISXgCYBQ3lMU8Vd1NySeo?=
 =?us-ascii?Q?nHsFVhLzT6MyLkKrmgAyBESVCCu4u0vU7bhLRotGOAYT/0iBEhIxwCnB999K?=
 =?us-ascii?Q?WkWMDUQ1t53c/pqADiipdYlrHDSCR2G1K6gOFXqMj/PknGySIxXaENN6AWuv?=
 =?us-ascii?Q?bplTCnv1YQ32gie0EHeL18YERMznztaIpgnrRkExYgBj6Cb+kPH7mzebI34Z?=
 =?us-ascii?Q?tFO+Y5/OVQuqYkFEqnCWSYwkkwsg3j8J/kZi3FUCtej1AfVFtAyeTdGn2QX7?=
 =?us-ascii?Q?P+6r+SaKfqgA6oTgbOanxJ+L3cYvoA6F1zplktPocdFGn0lRgx6DQ21hLPtB?=
 =?us-ascii?Q?qi8vnN2TuVnllKVUdDJEo5eJWVeisajhle2RX0xuMEe3sl5dqpSi+3Hoq4aS?=
 =?us-ascii?Q?3XBXZDZmIJU/FGgE3D/zh/ZQlR8vng8UJLHdTPMXL1PAtHPuCFcn5/gnbzaL?=
 =?us-ascii?Q?C/sIKdpOYXA588oCikv8Y18R8krnV3BLEXqMZLmx+xLBSrJ6+67fWoUUTRzl?=
 =?us-ascii?Q?0EtOYwA478XNYNi8073lNBkRFETyDvQxvctnsBXpo3uf7z3esfrjC3YgWA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:53:03.1094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56881f84-e119-4af1-2829-08ddaa89ffbf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4552
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfX4iwQPArefw3V 8mi7dQ2SA8nhwMvzNeE2bAXipWSk2/33lDUeCVHoNYtgWZiBtjUpTSUQHLynnL7AlkehBWkSng1 BzThJJHHIj6rOaXhBgZqpbm94zpzP+v0C23WMQew14ORYmStSPO7Ion6is5mC9rQKYRHvPL0bNX
 a0JHAncKIUWbLZDZ8EVVePp6zgguAAyi3mAX9+gSvHyNv3YaCiOhhljanJHW/iMFeCKkCWl+v/y LsCuhMawfwSDcssVJH1tiDiF5jRYyFd1EldjEg7H8imfZXbUSmHFP1OXcvSWWlrR9oHAICsmvDo fb2ERMeM58bTbUAzdhbumD2lYVHVE0n/vy0pMMqlq40joYXUSqTxwBe3OBX0ZqxCC4iIPw1vkVG
 Qh97ewjWzOGtEfdko9y73Uhl9hfS9hdurbVVnxESiC2bikLkf0NDt5twM6c1fNMkVUnwm9cv
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684c3b54 cx=c_pps a=V1iWK7uDBm2tx9d+rKTUiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=qQBMiwKV7t5ryLTBdsoA:9
X-Proofpoint-ORIG-GUID: 3yzoX3ZTherJoddyyJjSRCQPGC-lDhMU
X-Proofpoint-GUID: 3yzoX3ZTherJoddyyJjSRCQPGC-lDhMU
X-Proofpoint-Spam-Reason: safe

The GA605K has similar audio hardware to the GA403U so apply the
same quirk.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Tested-by: Timofey Titovets <nefelim4ag@gmail.com>
Link: https://github.com/alsa-project/alsa-ucm-conf/issues/578
---
 sound/pci/hda/patch_realtek.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7db62477b785..3df6f4ecc203 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8036,6 +8036,8 @@ enum {
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
 	ALC274_FIXUP_HP_AIO_BIND_DACS,
 	ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2,
+	ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC,
+	ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10424,6 +10426,20 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc274_fixup_hp_aio_bind_dacs,
 	},
+	[ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1
+	},
+	[ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10942,6 +10958,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x12e0, "ASUS X541SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1313, "Asus K42JZ", ALC269VB_FIXUP_ASUS_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1043, 0x1314, "ASUS GA605K", ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
-- 
2.43.0

