Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82B220F59;
	Thu, 15 May 2025 16:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326555; cv=fail; b=oBSmI0HgNOVi+ERcmHdUwicOfx+E5PWCFN8NTShaBLafsc+BadFPFNX7yOOIVSyhrvUb+YuJMwi73JdFlsNI7gErYT5JpapL8SK2wWDOqUhGBle/Jqqvx8ls5kKn48YoTwYW5PlYgJIpVXGFGO5lN15gHR/keKEZFuik5QNDO64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326555; c=relaxed/simple;
	bh=aN51ElTgZi+0D4okxg/S1aFJg5Rd08d43te6ilj7Iw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMWZsPetyjhhno5xdsFBUxsZEmO/R22wzWvgeGZen5oQQnX1scaXThmeyt/p3TSgE7uXfxxA67hN+wGoYYdPB+xUyytDlvgMn5gmRUyxlYt1Qwq8JZetty2e5TY2hU+HaQcW+c9ksAbSk9g2cf44i3mZefVPw4XMKFoIwFJ5hgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=juFcHvd0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=htfTLg+7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="juFcHvd0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="htfTLg+7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEr2lH028350;
	Thu, 15 May 2025 11:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ofjPOsVEOmP8eBNQAQ+uyFGgd6BV2mmSLrjcyD0yAv8=; b=
	juFcHvd0Jl/djuIunfQ32/G+gB8OlQrKbpl0NP6GNxe1bKpRWnfehDN4Yu5IwVsR
	kS6MqLVSAvUfxe1YXJlrlYoqAKUuJS1HfUhG4xxy6GN1fwmD+rGEO+5emhqxxrlI
	KGDu7gb31HLHh+HFhkKVPB5qA04HLOkT0VkJvp+3TaPX8k8ZWNWg0xG8XeFhbyK2
	AoXJi0h/9N5oSRpcwbSGIRRVtOggOMWgOYXcaO1O8nGhCTp0mG9DppBErcjFPj64
	0LtuhVK6V8CMeuHZQrnf3aTe5YhbefhixZOoc74GRdtd2oZ62dlHcoPktymIN/e2
	OJ8VFTYUjitYysltMxHPuw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46mbe5bbj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:28:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhQPXBvR1is/2x7U0RKJugqX0n+6HHSJh2gdnz2L1sHGkVASUy1TDitFs+slnnSbTjSmO0iNsuZffdTTh/ZMFBhxmLNxLE6rPMKRMvRHFgymt093BoLDy1SQJTurr69WBCMAKhsZkiHFLfq6ykQaMq8uByS43jBagNBESHA/JPYzNjMdlCWvgBDslikxvxuDS9fNGOu9ijQoqHojT38mBg3d8oy3tvDaDD+u3cIjtC2LuAhZ3ZOXsjiEq1j7LSfMb/GjNWhbOJfogFVnb5XFmf+V9S5lluYzE/kXg9uJYbzWSuJajzdnyK9aQxgBzgM7zHsGxyJkfybzLtjvXNc3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofjPOsVEOmP8eBNQAQ+uyFGgd6BV2mmSLrjcyD0yAv8=;
 b=TigZGEpX7+O8IIOYgwYRx7CVDr5xS/WuFqfJnM1B+ldOirAsmzoAWBcyDNq9lS4uxP2DnfgjX1hDN0PyYOd4cgbtMP5q9w77GbmLv2UdTa1LczCdJUfgqwYMC1wTAR9MBaqLTBKa/jQpnRaN7TPAlSqEwR0yEz4kSeroLrUFlxdgj68EJdO4WGPIUhYdyF9tqTZlQLs/ZaC/ymWtYSNBqbbubsONqAEkzMtmIRp+s++giOZEmG/IYCCmGQc4VcH5Z6sgpwfsdfBZcp/iLS42G2+jOfLvd1MTnRI7hfvDhJiG60O/pJ8u9WmccuxAmIT0AOBYGp3epSIFRVNjtCMRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofjPOsVEOmP8eBNQAQ+uyFGgd6BV2mmSLrjcyD0yAv8=;
 b=htfTLg+7wKVIBWhCqw4eh7KwFK5eq/dxvcrfMvVMokcCKGMFWvxvHEJKRyGJq06HZCL5+NGNZ2KqjBoPg8Q1NkGMKn1qdN2vMUIuEkg5CISU+OyR5QbMDE0EMWj+WaOe3Nvk9gssSeAGkenLmHo2gGQ2beo4t84bfTSufu7ml8w=
Received: from SA9PR13CA0169.namprd13.prod.outlook.com (2603:10b6:806:28::24)
 by BLAPR19MB4227.namprd19.prod.outlook.com (2603:10b6:208:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.22; Thu, 15 May
 2025 16:28:55 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:28:cafe::f) by SA9PR13CA0169.outlook.office365.com
 (2603:10b6:806:28::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Thu,
 15 May 2025 16:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 16:28:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F736406547;
	Thu, 15 May 2025 16:28:52 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 20933820270;
	Thu, 15 May 2025 16:28:52 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda/realtek: Add support for Acer Helios Laptops using CS35L41 HDA
Date: Thu, 15 May 2025 17:28:32 +0100
Message-ID: <20250515162848.405055-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
References: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|BLAPR19MB4227:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5d6c42d1-bb2a-453d-4803-08dd93cd9565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tTngLsD+1wzagbz8Nh8O3NmixR5k/qtTaPkVcPCCL39qXZ/NUXGbtEuSqPYR?=
 =?us-ascii?Q?6TBy0CwDu366JrSK0T3IcHk3MZO7VUkX3KZnNsUyE5MuONgFX6hDeL0yjm+e?=
 =?us-ascii?Q?xYe9mj9rr77GmESF8lDMbGI1OXK+dLe7p+n1lRf4wDv9RX5660Ij/rxLuFxd?=
 =?us-ascii?Q?pVNhJPSeiYyHNEKM28RxPLlJjnJt8lFpI8Kprz0OGmUJYByT/ojjOpll8/Qs?=
 =?us-ascii?Q?y7k9Dr+VeON+6Zz0yqY0rzVseSWHS1HuttSA/jCgpf8+dDRS0q7VhkikljnY?=
 =?us-ascii?Q?YZJFi5BqTBtLzv8TsA5HarJvXTwhLdvQrGIDLuuDjWWwD54lL5Kw2uH+WsVO?=
 =?us-ascii?Q?fRlAoSsCV+MMlXdIcAulY1UbXj0aDf9fHZoWFNmV3NwHu9FRVlt8wK/3uL5h?=
 =?us-ascii?Q?jp3tv0QyUk2D9Pf1eNuZMJdYFaz0W28xyi9A9X8TFn2T1i2Edj9n60yBijop?=
 =?us-ascii?Q?LtL4fR7yn5N8BWTb5woT2h+tjqgyEL4EbFkbfkGW1AzdWbOMacD4uz2y43Ox?=
 =?us-ascii?Q?3b7wCy/tip14LeghUALVFBhsLYCIu5I/Ar6QSTOFWrkWhJkwbE5lBbL2fmCh?=
 =?us-ascii?Q?SpMoJOh4RrdiCUJMsQTZehB/9yh8F2Cws3IPsyh/DbmSYelvDbdXwvPtytOw?=
 =?us-ascii?Q?r3L3NneOlAlgOSUDb2tOdaUQvglScY3DEqgumf2cPTFVr1M8URNB7gB6IW9l?=
 =?us-ascii?Q?RuQQ6QiZsMQk1L1bvdq0bDrX1Zs5ATjvtrPYI44KO8Qtmz6YCEUoMUEuUMs5?=
 =?us-ascii?Q?jVd70U4suJVKCF13q0HfBOrvk3vvEsRouqKyA4FVjNoYAik3tfl19G81O6XY?=
 =?us-ascii?Q?1cyKjSBaTFkJKSP42DI2n+a0/wc5HPW3HwVx2rXlNiguqJpH7d3WdQMoRNXN?=
 =?us-ascii?Q?hon5k3QnJgBUur0K4gjGqykjW+62fUbBZCf38MQbyntWZNJTz4B8AyjKnkgP?=
 =?us-ascii?Q?PGQRZ9croVxkBJMTYkxfIrff5WMyLBQykNz4ZC1OoM1tSLN0ClnZx09tnYn7?=
 =?us-ascii?Q?NfwqwCuNUT3Gbq7gHk10FswGwOA2Z5BQPyPRhVDjm2GvZCOsiX5PG3/J7vE1?=
 =?us-ascii?Q?IV7ARw83syKStv0j/oAG5QbJDhazqSpMSeKv5a5gKM4gkD2wA6U8hvJWTPm5?=
 =?us-ascii?Q?nGL0d98kDQj3EQVaGRDUrEk7MZ5X1XRJKr90O57L1LPxfULn5f36AMmyLDHN?=
 =?us-ascii?Q?toNKZsNhE+khcVXkYGNaTRJHjuPvcC+BCVI1DLzkqz3qB5DLzYOx4TRW+gPH?=
 =?us-ascii?Q?tsB3TMlyNYR8GOKfUq1X58ay7AB42xK9LdT5cjS7SFjaqWh69IL+rlKpxn+6?=
 =?us-ascii?Q?VVka17uuD0WOdJTSUBR06xXEZ4OvLqOa2uI5jcZgQhGQvXmdA/ojlg+Ojh6Q?=
 =?us-ascii?Q?dJXFo0dD/f++EWjrSFX5/3qeE24ciRF0Y3++EaT9rBFaonw9P9Sn8N6mcPBm?=
 =?us-ascii?Q?soigI1Rw7Xnez/etzLveQgkCm7UxTHXSQOBYO3NRfVfK9ErA21dmM0PFBAIh?=
 =?us-ascii?Q?nVK8NPqJvsLDhg27q6YrXmTP/sMkBLgpTU8j?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:28:53.7770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6c42d1-bb2a-453d-4803-08dd93cd9565
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4227
X-Proofpoint-ORIG-GUID: oRKk9QSUrR_2ivlogigQ43ntKA5dmxcz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX4Isz3aJ86BEN c2FibzpSjV+jr6NZpC5rqGlkOztXM2syGpf/CiPaw13nCp3kMMtG72DBcGIKpTZ2k/vNPY5Umnv /hbf9q+JhHsqOBxG9wT1sQVPMkny7JV/fLCvLyMl+MI+80+yRlbeB24ePuRMe6YRhTamCsSuafN
 QirPz0aowh0Go1bRPlTVQzTn7OQSa1DdsdrfwogUypm09JICEG9goiIXHdMJdRWugfLXc++KWry TszJaYja8hO1Xq8jmvrnazRgKR1Vi8G/QKeTEpN8u5zuySD4WCk5/LWghnJW0SpNSib2IF+1FbJ 3nBT/oFetUk5i9f5tjhHHbsCvXUO44oA7V61ySLkBdGbtQnZedoxKKMySnx+Vt+9RM0dIaQItOL
 7iy0aX8fXJI+Y5G1R/cs1UfPXuf4qu8SSDOnzZmO23E4kOJ1eQokOr6Yip9ib1SVjuBCZKSA
X-Authority-Analysis: v=2.4 cv=eqLfzppX c=1 sm=1 tr=0 ts=6826164b cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=99hGgKukhzmXacOU6P4A:9
X-Proofpoint-GUID: oRKk9QSUrR_2ivlogigQ43ntKA5dmxcz
X-Proofpoint-Spam-Reason: safe

Laptops use 2 CS35L41 Amps with HDA, using External boost with I2C.
Similar to previous Acer laptops, these laptops also need the
ALC255_FIXUP_PREDATOR_SUBWOOFER quirk to function properly.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a2b09e4a7d5..ba06b067cf4d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8026,6 +8026,7 @@ enum {
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
 	ALC274_FIXUP_HP_AIO_BIND_DACS,
+	ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9298,6 +9299,12 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
+	[ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+		.chained = true,
+		.chain_id = ALC255_FIXUP_PREDATOR_SUBWOOFER
+	},
 	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10453,6 +10460,9 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1025, 0x182c, "Acer Helios ZPD", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1025, 0x1844, "Acer Helios ZPS", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
 	SND_PCI_QUIRK(0x1028, 0x053c, "Dell Latitude E5430", ALC292_FIXUP_DELL_E7X),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
-- 
2.43.0

