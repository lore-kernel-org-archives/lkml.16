Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6669298CB6;
	Thu, 12 Jun 2025 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744057; cv=fail; b=GHOxwiNAuLxaoqsX3nOImAc4u2i17TScByy6LN2EsXYgyYk7eipwEyi0NaCViVqZruq739Kybl8O9pzVSaImrdIMJyF8OIAulbZvG3y+c70PkvPWkhXWqLGkZ/mWK5tIJf4nTnaoZCutvAOQwOGUOwd/c/ujW9vf/JBO1HszPVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744057; c=relaxed/simple;
	bh=Ce7b35pCLzxtGZ9DyTfyqlCuHJkavJJmHcKg0L+hmOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m1tX9PASpszGP9MuiNePupA8L5EedsPjVtfIVRh7OL8OlvKOlt6WgeqPIZ2Jw15R1VVcUblYHiv5CEmF4j5QMLZ/M2jTuuTjUz1FuMyzdNWJ4Lw4Gf0HL8WaQQboOThFcv/WF9OCBZDq8+K39p6hOxZLQlRFerkl0Im56yo5VWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eBZY+gpq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=K4AWt8o8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eBZY+gpq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="K4AWt8o8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4Ehaf019348;
	Thu, 12 Jun 2025 11:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ri7577ZPI0UAQW3Gsxc6dmH0lN5+7xKlMhN6UiebQzg=; b=
	eBZY+gpqRIoQ4dn8n69v4ivzr3fss2l53e7cwknct/N+I+4C/7krkjIjxiYFkQFz
	dxYUzk8l9HWckDFLl+1w936gXPzpfEQFjmbIDoAe0DGUlTDdbeuU1IcyTa11uCXQ
	i9YtDIH4Wgt6AGcadYdfsljnQiqFtv0EEC1Lw1uk2j7voZNHFtoAJ4c258qKlsnF
	3BJ0/RQaoNst2aI53089492c894AV8RRXZsG2GwtpazXaRf+YWGMZUiYS5ePeNVI
	TI4SdXU3UWEk0/Ol2tZR6/5Ld2nUsOTbgmqGgIydVHNqeHuUaUNiluds31/jvjW5
	4miEDE63oLn3/HI1EQ/Tdw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2092.outbound.protection.outlook.com [40.107.244.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mwwbth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 11:00:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t10GA6StsgcXhe42COuiVZ953W5+UUdf4/hJho7K17Byf3WHG5nlFwpjJ+RXrSXIoFjAQk3U+q9fQ3yKj7kEEfsiD6ftU4c5TKsupT/059Cb9k2ojVoC1LtMzfklNtTnhwAzboi6Dzg5OFwHK8g2bqV64P2dx+LA0pMCkYPzX9nkWYyvGJfBTno9p+nLQeNRxtIV9ArkKgy8Lksp0cH766084PRytnQy6AlR/yfL+NJUi7MfVGYW/BeS0wkqfcokwRVlFNmB/Y/9TAvb/or0EOQejkDRxqeKBdXDuIweORGUPs1LLxB/p0OI1cw3AuTCMXuOm8ba8ObZJex9cD7T2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri7577ZPI0UAQW3Gsxc6dmH0lN5+7xKlMhN6UiebQzg=;
 b=Wpn9gmUVVH5YZLrA+Uby+F1w/qgGfqDlh7U4UOlF04e+kazW4FQDzILSVRKn69tZLEWlpskLJoBS3iLBTmeUze9cJhBF2/eb640dRmjW92F9K7zOl89yyVEpcNDwlu3JFIzdB5TGL630JPSELZ8b0nFXZBw1AR7QB30jzwJJBwTozBrmrsOT8rOlywEv5ymrurCifrkSfgmSoWRijGKvd7iEppB0IF4/7jpzhuQcqaeMXGGheF03cS/Lw3ON2zZ8plbuMQ0zb5s33F5GNxZd6jwXsfSME/ujxQODRusIpzkcHMlupJKnM6a0+iUV8hfDZRWmF38s4s8iyLdj+KrVzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=temperror action=none
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri7577ZPI0UAQW3Gsxc6dmH0lN5+7xKlMhN6UiebQzg=;
 b=K4AWt8o8Py5MgxZpxlZacpuPTFNgmeBzEJY75weFNMDdpTxGJaGXKAk2y+KZZh+j6DZLF16SqjjhxOtdg3x/1lUHr7WABEyijMQvFvxpBR542Ehmzc5ZetYCUGQylcbBw1k2Do235AnRzTpe1wPOgPa7Mh7EULo8XXl3o5tELiA=
Received: from SA9PR13CA0149.namprd13.prod.outlook.com (2603:10b6:806:27::34)
 by PH7PR19MB6828.namprd19.prod.outlook.com (2603:10b6:510:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 16:00:44 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::a7) by SA9PR13CA0149.outlook.office365.com
 (2603:10b6:806:27::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 16:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=opensource.cirrus.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of opensource.cirrus.com: DNS Timeout)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 16:00:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 783DB40654B;
	Thu, 12 Jun 2025 16:00:41 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 49D5682024A;
	Thu, 12 Jun 2025 16:00:41 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda/realtek: Add support for ASUS NUC using CS35L41 HDA
Date: Thu, 12 Jun 2025 17:00:23 +0100
Message-ID: <20250612160029.848104-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
References: <20250612160029.848104-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|PH7PR19MB6828:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ddb0b905-ff54-4834-a851-08dda9ca494a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x72yBWrcs4+aP5o6Y39gcV1i9xCijlDa1PZ3ndICl0mqRCrwxx8RYo6DoAWh?=
 =?us-ascii?Q?hwHKn7aX5BmtjQdqCd8mDkHKXA2uX4fNWbzol90nzoOQTz/1eyrC6XfOeAXp?=
 =?us-ascii?Q?QVkZA7MV7100NLQJBXtZpNKrUC35qDn8KXg47+a7gIivww6JWdaVT+4xVv0O?=
 =?us-ascii?Q?XplAPrcjR/AQSDqnwDFdvxHOL0inCE1VrcrNQABIYZqhY/EEoP6TvXlqZkk6?=
 =?us-ascii?Q?YWycZzlHiZ2esypdGl74iWucbGQxC7wwRfv+MrnQoIMdOhbHCxFtHvifWykm?=
 =?us-ascii?Q?fRBiDrudty5Ehu7+9vadzRja4IxChXV41YgdGBb5TbKPsEdpDnJtyJYugoAl?=
 =?us-ascii?Q?nPD9Iw3UvhTXqMKHF86JRHoXLFUbs20swmLjaYdw3UvF2PRhruWzpubPH9/o?=
 =?us-ascii?Q?fHM4XAFWa03nUz6vekKWhLa+k1jMlmIexxRwaBsFrBg4725o4az1Kw2BV5Sr?=
 =?us-ascii?Q?j19omcQKTu8d8VDwhIB3rvOS6iZQ9ZkfN4NN04MH1xxd3hRub2T7zD6nGMQT?=
 =?us-ascii?Q?ZxWvuzjR4eT74S2Co/jof+edHmwP4yfCBVZFLGney7r93YWiXQNi6qPE4/J9?=
 =?us-ascii?Q?V+K9/v3hyKcfIZH24C5SsdzytBO9cezPRi5epnHm/ja1f5NtMLGAxHIBkf03?=
 =?us-ascii?Q?KIBER8TUCNBKGnI1ijtHDdUGxczAJL/vjKQoZPzhB3IkxXiOfhzZZh0D8IwQ?=
 =?us-ascii?Q?70aPAH1yPaPVSZtDGs6/dyb3WYruXF8S3FDvRt3JyL+Xww3PpYAgHQD3OlmA?=
 =?us-ascii?Q?n5pevYiqElspsJOGXt4RTW1MeXNaVAhf/+W9sfQLzVS0+EI+GJyLJIaMZrc0?=
 =?us-ascii?Q?KCzF7rD/pGg0EyzEYhXg3XqE5TO5NR7qJm+o0sQzP5f7VjPlRbmHHx7hWk7I?=
 =?us-ascii?Q?EfD4Nz1SjokysknQdIu9ftBXMbJMUR5hizSjf93rTH3hoRMjlj8E+UGUPsKw?=
 =?us-ascii?Q?naZLVYDbdE/xacklHoS+gOMKXyuav8o//FCQ1xkgdrvjYNf0PfODGUfLYKS0?=
 =?us-ascii?Q?UBcXf9F9xcUwNGa/usBKo1QAjNWd6YkpaJyXQhWAYqqS9G5cyXzbrwCqulbi?=
 =?us-ascii?Q?LvfYfg25GE+XQpVSbFDUc9KAGEh2UxJBMATxiEA3idCYZAOUY3p8cAaS2YG+?=
 =?us-ascii?Q?Ghkun96I3uqkyUWWmznhAyJ18jc6mLQ5QITuF/szgDWeePKxntA3z7nlSKwC?=
 =?us-ascii?Q?eyL4nrRRxHOQgZkHbiggfxcggAH/vWpi2LtflNFVodMbUFzdX1sEFardgXs4?=
 =?us-ascii?Q?+V1lZ+b0C+f2iIP7JM2iRdRntLUapylQGfDEhoYn82dca5QSeGJpkPHzdQ0J?=
 =?us-ascii?Q?zIZdD4K5rZNu5CtxZx/rfl6nYAYbyufqPNt4A6HPbiU/1b0tLzpzLjgz3e2q?=
 =?us-ascii?Q?vvTg5xNGvt0WE9IkYgjklQMoGn6I2wBpowoZALK7E0BekwtDKDZA0GO1HDjp?=
 =?us-ascii?Q?4JtHDDgdgTEo81lJyP3bSaz87jSXcnZzncQC5D9ckUV8uw6mKzueeHgFoFO9?=
 =?us-ascii?Q?uj/h23+aW/X29sptJHg+USwbMxjWfvGEpsaE?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:00:43.1756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb0b905-ff54-4834-a851-08dda9ca494a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6828
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyMyBTYWx0ZWRfX+nfrL4wmKeuX uxzXXO9aLsYBoQ9MTx7623lJBXhlBUvnOYZ//DCdiJgzEAIVg2ny9dlInlWrLmI5F71rcq7xTOF aBYL4uwdFBXHlGKSUJQvEC7gpM9AckhBEMVxOy/Yk40SBNKTB71GYgkxgdVJhHKlT5vhNiEV/8h
 Ccf83de1/dmicBjT7WOduJewD+xsNz4XQx0aIYjS+GDHWBUWSdJXOaOxw1tPw9HkEkHfQZVObSO NJriwJpDlGSQ36K/d+L1E7lEcTzdV6oTrrpbCS+PSVy+oJ0sID2ODHQKJf8yvjAaFKjyIcuZHYj L9pIWe3mm6V1dTCcANz2yT3yjq43AN4yCcnPpJEwyucSUbBX77l3gimE7R2QLt0jvtQGyurigyh
 ezLMUAnw9j+Cv40wklkReADleWvq9w20bF1RVunttlKApYHxYByakv3ce6Dy5ATRzZzgHNfm
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684af9b0 cx=c_pps a=5XXQeeI6rJCMP2FdH6ENNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=5P6FOJ1nGak7WISmVrYA:9
X-Proofpoint-ORIG-GUID: rh9uX5MKXsoCg7nCRmJZlwd2VzsP8NFm
X-Proofpoint-GUID: rh9uX5MKXsoCg7nCRmJZlwd2VzsP8NFm
X-Proofpoint-Spam-Reason: safe

Add support for ASUS NUC14LNS.

This NUC uses a single CS35L41 Amp in using Internal Boost with SPI.
To support the Single Amp, a new quirk is required.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bca725bb8281..3d5db33437f2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7296,6 +7296,11 @@ static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixu
 	comp_generic_fixup(codec, action, "spi", "CSC3551", "-%s:00-cs35l41-hda.%d", 2);
 }
 
+static void cs35l41_fixup_spi_one(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(codec, action, "spi", "CSC3551", "-%s:00-cs35l41-hda.%d", 1);
+}
+
 static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
 	comp_generic_fixup(codec, action, "spi", "CSC3551", "-%s:00-cs35l41-hda.%d", 4);
@@ -7986,6 +7991,7 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2,
 	ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED,
 	ALC287_FIXUP_CS35L41_I2C_4,
+	ALC245_FIXUP_CS35L41_SPI_1,
 	ALC245_FIXUP_CS35L41_SPI_2,
 	ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_4,
@@ -10112,6 +10118,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_two,
 	},
+	[ALC245_FIXUP_CS35L41_SPI_1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_spi_one,
+	},
 	[ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_two,
@@ -11053,6 +11063,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x83ce, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x8516, "ASUS X101CH", ALC269_FIXUP_ASUS_X101),
+	SND_PCI_QUIRK(0x1043, 0x88f4, "ASUS NUC14LNS", ALC245_FIXUP_CS35L41_SPI_1),
 	SND_PCI_QUIRK(0x104d, 0x9073, "Sony VAIO", ALC275_FIXUP_SONY_VAIO_GPIO2),
 	SND_PCI_QUIRK(0x104d, 0x907b, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
 	SND_PCI_QUIRK(0x104d, 0x9084, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
-- 
2.43.0

