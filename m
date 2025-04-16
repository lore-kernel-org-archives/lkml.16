Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF80221272;
	Wed, 16 Apr 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806299; cv=fail; b=l6+bsA1FxunvYWFoOVyh7y8RpagfczOG5QFd94AcU17Rmc3QF2aDNcq/7MucIJFMs4YB+6nAcYubyGsV3vFQwUlDiwItEHmDTd3pgkFC1sA4btXCeIhn8wdKBQXCN0KT6w9011kdPGSO7mmO6AFGqA6YPDVJ85o02cZ6i2m2DpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806299; c=relaxed/simple;
	bh=dMUngFzB+XBj9iDjLqw1CGJbWioS1poSEJe9w7oaSQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qp+egkHJ2uPUEx5z6e2lFL6r3ha+nVV97p8prgd3x1VMjNFU5sTn/Soc9XkuAZVn6D8d2uMNdlpbogtLcipl1NDo0z6FIF7PjEfI9PR2mOXoJjXil/EaDsDU5a3uWZfPDH32LuwVEfqYV1qf0Id72spMn7UIhMtMindHFZaitbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FB9Q6eu6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=g4XfpHJ2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FB9Q6eu6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="g4XfpHJ2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G6KChH004493;
	Wed, 16 Apr 2025 07:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=k0UDAe7OqmOtBg0W
	3tQkHg+Y6lU/WtQqvG+PqyAXkH0=; b=FB9Q6eu6yI7ftKajonGnmGnjwK4Y43mk
	jQ2h0A34mfKqPMuS86eGDFpbToAW3Nhw24MirZgwU/2p5AhtQIkKgm0KJDQAtknt
	1ShTSfSjkTKAe643geFqxy3+Qo41qpKpRuWb4a6xQ8LozrtGcSzJ6q8wR8KEIpbB
	3Bf71kEGagGayyyRVMhi7kw2LcQHAfgkyfh5ymYtmbd02xqJBB3A8rvdaaJby3o7
	Aoxs84IH/CMd5irXSulLUGrWgifwjAa9wcqbMRPOc3ia7pvF65CzwYh4ZAa3/R3M
	o3D1dUrkPpBsZKvesqNoip0V84cfwrC3yn+bKCGlqS6uwsBQ7xz01w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt2k4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 07:24:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifjYqr/tOH5rWCVM/BBenSqm77gDRzDYwWcG66xPTYJjNyF67A7JO7lgSr/ceyL3yvH3qzKc/HsaLt4Ziy5p5Q2ot+Wj1EI2lQyKTCNKaNgsCWbHqSaLMagOXSQEtIDddoqnwBxIG7PgugJ7t95ZMVypIgLPj5SOoUWnpsa2CoaRovjWn3ZkwZwYTl6Jf/xbwQJabSLnqwqEJKEaMOIHrVyFoetdd3wwHV9jqhsZilq5WS9pSBleEHooqKqeRMBpwjnyxBXWN+a/nFtCblcoOvaLvlY6p5z5Ly+zufyj6xVy1xwj7cK3DKS/VAIuWWwAjd8qMH2tyGy/mwBt8uM46w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0UDAe7OqmOtBg0W3tQkHg+Y6lU/WtQqvG+PqyAXkH0=;
 b=RR0wNfFnRn55PVUJiMAnQ0aIJ2j8WLEWSkMMFpfwsGm/aGJsDlq3WliadOkOhOeEVKSmY4zy8nH52CCiP8F76VPeBSSGBDA386EH0Bgi8Mc/HiDybVRuBiUzL+0lJSfcjeV+D0hFoH+Dx3FSpTDkFK/TwE/8QNjy6JPR6EgiOQL2K78NKkzr53+mgl/CRtjtvx39y37z6KrvIZc2UMTJ0ND7GAKPNbOmH4UItwfXVyGA6ZziSXokLFzGWayCUj0ZB3jWSfqB89e9nXjFEXCsPpfVn/fctZ58r2NVpScDD/jeL3m+oMaELhlPPVN9YBkPtO40aLy57KOfzhMgwRmGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0UDAe7OqmOtBg0W3tQkHg+Y6lU/WtQqvG+PqyAXkH0=;
 b=g4XfpHJ250asphcdIuIxBmRz+JJwVo0Apwe5qTNzsuHkKhEeLRRKPEjUdMU8Z3ZimcxYDxVcZB1Ib7K06+5DunN4GBepHetimSUYVLKlefmgrEhgX8Fgil08oOPEVVnZWnt/ErawxsbEGOGwI0DivjKpKxZIxwGdz3moxAa5JJk=
Received: from SJ0PR13CA0085.namprd13.prod.outlook.com (2603:10b6:a03:2c4::30)
 by MN0PR19MB6114.namprd19.prod.outlook.com (2603:10b6:208:381::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:24:25 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b3) by SJ0PR13CA0085.outlook.office365.com
 (2603:10b6:a03:2c4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Wed,
 16 Apr 2025 12:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 12:24:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98E1B406541;
	Wed, 16 Apr 2025 12:24:22 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 83AAB822563;
	Wed, 16 Apr 2025 12:24:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Add some sanity-checking to test harness
Date: Wed, 16 Apr 2025 13:24:22 +0100
Message-Id: <20250416122422.783215-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|MN0PR19MB6114:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: febffd6d-7423-4aa2-f944-08dd7ce19fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4p4aZKSL+F+ez+4CBNJFc0bUKXBaNuGXl7d1hLCe4h5/zUlcKkoGHJ2eEi9r?=
 =?us-ascii?Q?pDvvJtFbJglvYnXyu+1vThvQKgpbXBpnNMP/0aH7L2Gc7Q7iYI7VtLm3DRAu?=
 =?us-ascii?Q?r4EUNixgTyZ3E3LOACzJ0tm6Fo4Hnos53IMV/gX59l0U8/Jy3hsTg865WZ+N?=
 =?us-ascii?Q?ghsDd8uoTNtFG421VUUGCqkkJ+h5v+kEzomyeOrOJ6VOaafxhnzZNTY0o6ES?=
 =?us-ascii?Q?jZh32sQ135o1x2EIt3VlZk9MrmANoqlQ20seu8GYzSiXcLBqfl7VgO2Nv6f6?=
 =?us-ascii?Q?usWTvAJ8iMbufCBeBKxYKtjBCuw9NZjNRdS8ZswVRaIAzeIkns/MofbmL9HA?=
 =?us-ascii?Q?a1PcZH+HO3d3538gfmcKb/4XAvRQw2sbyTaA3Uh5SslMtbuQbxAOYft0anvz?=
 =?us-ascii?Q?UZrWUI7IlBFDaYdjNPISFnt8LrKM3lxZTsD1AKCtiFi8ySREQCupttZAUiq2?=
 =?us-ascii?Q?mZUhIoVx2sh2zCnbwyPb7/ekvpoLaJPt50QVM5lLY8dr+uRGoUsWk3owXtxg?=
 =?us-ascii?Q?xuMNgt/3MhiufmDNXvtjPLGrc+D+BoewuQSylLyRoqtyjgijpvP/MYN892n5?=
 =?us-ascii?Q?J3ZiPxUgyXV0hsyyMky9C5lrvYIx8DGnMddbpAKD41GRXEaRMjeNt4n8Dl2a?=
 =?us-ascii?Q?v7AtrSMz5u4Pttqud+h3P3V/gkRjjVlPIcBxwckMseLFBpU+WO4gzYGUtqqp?=
 =?us-ascii?Q?z0MeOs8Ayion8PLo625vs/ChVes73ISJ+YleYDGEcCznHtkH0oxYb8Z7x3yc?=
 =?us-ascii?Q?a1MYADV3R4GkYcW9D0ah9Xp72ZDZc5qhHBdk8dISUF+PqGCaPQJmeUIUfUry?=
 =?us-ascii?Q?+rWT2VB+O3Jhis7Xfvt+YCgTxjkMI6aE3XCIS7G+AzxhgjgKTxGUZHrNsUO7?=
 =?us-ascii?Q?UQEhwm7FIh4jlFGZzdw4nVzQZbUqpsbpCgc7pkeba2MnqLsKRj55Jt+AO9TB?=
 =?us-ascii?Q?qFI8eH7376m7+QFdFz0frk28lj4ztoRyd0tgKwYpmDGWPx1pmkXmynGfjYkX?=
 =?us-ascii?Q?ZCJh1EG2fKJ2IROY/7j3nCGI5i1tmkBn6xu9gtkfQQBNtTsN1OvyUdRJKxNa?=
 =?us-ascii?Q?vgmuq/aMq9MaRes8ghSmNzquPxZELHPgKlpzcRlklj8IkXXBKM83IOBBW6/N?=
 =?us-ascii?Q?Zq67/LHXmdCYJa4yhhUVGHee0I2U50UHWnDo1zVTyhCwAr5gp97K20D7NUxk?=
 =?us-ascii?Q?qc+iUw10D/ytGFQikpLwHkplNBU1E3p3PFPZHy/6YJiYVpqWc+HgwPbzIiRK?=
 =?us-ascii?Q?i85b+/ORYdPtTy0q551ZuanVRcYxFiH7rJ/xmEQBpz7DDjLuWS63/JV9BiRJ?=
 =?us-ascii?Q?+HAZx5ckdUt5MQco5CnDQv7TgdPKlV0oR9BlvxK6IyXO9TQbLtJ7suyV4PmW?=
 =?us-ascii?Q?HOtflz9iy7sm+Exj9s6n9cnXO5BLJ2xLiQPsbVDguGCZlDmWYLwGN9sYx23L?=
 =?us-ascii?Q?1HlpanNNpfUxM3s3Uj27iTyC2vJ9PeGWmOsbsQWZT/0FNi9LtsLH5kXQgDzn?=
 =?us-ascii?Q?QmoZskJ85eb33AVJa2X9iA8h4vTdSAEGjPyk?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:24:24.2120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: febffd6d-7423-4aa2-f944-08dd7ce19fb4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6114
X-Proofpoint-GUID: Mv7NdgIXx42qK28BgXnswDwGg1hqfZgL
X-Proofpoint-ORIG-GUID: Mv7NdgIXx42qK28BgXnswDwGg1hqfZgL
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67ffa18a cx=c_pps a=PZJ0/dUMjH0jBWORzn298Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=LNUvpt7aB6RN6NtqCYAA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Add sanity checking to some test harness functions to help catch bugs
in the test code. This consists of checking the range of some arguments
and checking that reads from the dummy regmap succeed.

Most of the harness code already had sanity-checking but there were a
few places where it was missing or was assumed that the test could be
trusted to pass valid values.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c    |  3 +++
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c   | 15 +++++++++------
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c   |  4 ++++
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
index 49d84f7e59e6..80e67474ddb8 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
@@ -176,6 +176,9 @@ struct cs_dsp_mock_bin_builder *cs_dsp_mock_bin_init(struct cs_dsp_test *priv,
 	struct cs_dsp_mock_bin_builder *builder;
 	struct wmfw_coeff_hdr *hdr;
 
+	KUNIT_ASSERT_LE(priv->test, format_version, 0xff);
+	KUNIT_ASSERT_LE(priv->test, fw_version, 0xffffff);
+
 	builder = kunit_kzalloc(priv->test, sizeof(*builder), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(priv->test, builder);
 	builder->test_priv = priv;
diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
index 73412bcef50c..95946fac5563 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
@@ -505,9 +505,11 @@ void cs_dsp_mock_xm_header_drop_from_regmap_cache(struct cs_dsp_test *priv)
 		 * Could be one 32-bit register or two 16-bit registers.
 		 * A raw read will read the requested number of bytes.
 		 */
-		regmap_raw_read(priv->dsp->regmap,
-				xm + (offsetof(struct wmfw_adsp2_id_hdr, n_algs) / 2),
-				&num_algs_be32, sizeof(num_algs_be32));
+		KUNIT_ASSERT_GE(priv->test, 0,
+				regmap_raw_read(priv->dsp->regmap,
+						xm +
+						(offsetof(struct wmfw_adsp2_id_hdr, n_algs) / 2),
+						&num_algs_be32, sizeof(num_algs_be32)));
 		num_algs = be32_to_cpu(num_algs_be32);
 		bytes = sizeof(struct wmfw_adsp2_id_hdr) +
 			(num_algs * sizeof(struct wmfw_adsp2_alg_hdr)) +
@@ -516,9 +518,10 @@ void cs_dsp_mock_xm_header_drop_from_regmap_cache(struct cs_dsp_test *priv)
 		regcache_drop_region(priv->dsp->regmap, xm, xm + (bytes / 2) - 1);
 		break;
 	case WMFW_HALO:
-		regmap_read(priv->dsp->regmap,
-			    xm + offsetof(struct wmfw_halo_id_hdr, n_algs),
-			    &num_algs);
+		KUNIT_ASSERT_GE(priv->test, 0,
+				regmap_read(priv->dsp->regmap,
+					    xm + offsetof(struct wmfw_halo_id_hdr, n_algs),
+					    &num_algs));
 		bytes = sizeof(struct wmfw_halo_id_hdr) +
 			(num_algs * sizeof(struct wmfw_halo_alg_hdr)) +
 			4 /* terminator word */;
diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c b/drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c
index 5a3ac03ac37f..934d40a4d709 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c
@@ -178,6 +178,8 @@ void cs_dsp_mock_wmfw_start_alg_info_block(struct cs_dsp_mock_wmfw_builder *buil
 	size_t bytes_needed, name_len, description_len;
 	int offset;
 
+	KUNIT_ASSERT_LE(builder->test_priv->test, alg_id, 0xffffff);
+
 	/* Bytes needed for region header */
 	bytes_needed = offsetof(struct wmfw_region, data);
 
@@ -435,6 +437,8 @@ struct cs_dsp_mock_wmfw_builder *cs_dsp_mock_wmfw_init(struct cs_dsp_test *priv,
 {
 	struct cs_dsp_mock_wmfw_builder *builder;
 
+	KUNIT_ASSERT_LE(priv->test, format_version, 0xff);
+
 	/* If format version isn't given use the default for the target core */
 	if (format_version < 0) {
 		switch (priv->dsp->type) {
-- 
2.39.5

