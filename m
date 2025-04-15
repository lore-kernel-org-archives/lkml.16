Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FCD288CB3;
	Tue, 15 Apr 2025 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723132; cv=fail; b=XY2nMdAFVJQ01hMgI8qVwLU518UCDsd1lSrcuikOLiMfgFN5ePyo1ME8W6ipPKqBv9qXz0v80aHl5nI/VJJznOiF1AItz+Y66XjrV1gelqKWATBfj7PLnRiZrMbQP9Pi/Ayre5Lia7cpoy+elAH9i6r//PkXxWiaEIJWLcVNPnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723132; c=relaxed/simple;
	bh=gMSRruDlH7yrZtdsqdkravvqz1moiX9YKJU7whkjkdM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uEKEP1M4NomjPD4BIn/FSYuG/wj/1pjFoUve9QD+7zdoWAh/kvutHhhVUA9rJCo3+cNltDSPAqi5h6j/dzIfaqyHFd/rvS/rV7OmJHRFMvuVKZ5pwhu+NSmuLMxFfe7SQS4W58UMNaIYaQhXKCjTwLtWusY3/SLl3TRNMtD2+7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=muYYLxTD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AA5uyFlg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="muYYLxTD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AA5uyFlg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5AGYn001361;
	Tue, 15 Apr 2025 08:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=V1vZd7CgwXZ0ImV6
	GTb6Jfmby8mt4KM/NSceGox+PjY=; b=muYYLxTDI1QBW1tIeuFP5rZUeVGFE1l1
	sVuN8SphHhFAAIUL/5w5tZa9L1HvIiaenXomokcvkwplBCJIMPeJeIQh7i6Ob2WA
	p45OJg2F7k4v90aZfdBCeqOKHKGPYSIWVfzrOBbjOHRv3P8QrWKCiv6iYNYeuYeQ
	ycC5KznMtAg6IjWIT/8feBfsK+VM2wwx+Nf1u6wUVezGGatOzKc6pCr2kmkvRSw/
	f3L9eLwiNwDEXLBdAifut2aM8cjCv+HeLzC0814sZlxLu7b4in1Wz5w4okGc6EcH
	4OXK7Aaxm5ziRsF6GsiG3T1BAn5xiHqgnMQTB1rWv0Pjj1vFI43O/w==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt14w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 08:18:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V96BRukQeq5MBrGi9OTYfccEh1oPSsNtLcpEUFdwO0BN7huQ1Tv0PkK7iIUSXmSpw6NSHK3Xxhf3UjzNLMvmQJ+XprFZgw4zJT6O5SID1QOjOF20u3DaFLrrWu1ZIPLzH2yuTuzrsbulwP/DA/7hzJm10MMX0ZKvVgtSuYIZolYLT4LCCvVYi2SAeGWq/XxyZk4LBSjnavr1vZx+llElUyW5mVZ+yKeV8IXHlTxlO9sCkLZhu5iIBrgnhkCWfQ+IBZh6BH9tnMHe0x53Bs2AxTnl5dYZenvT+oSMvcERDLOKOz2qX9nI6GFOEYTjlykIni/loPMsDY62s59yWjiHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1vZd7CgwXZ0ImV6GTb6Jfmby8mt4KM/NSceGox+PjY=;
 b=DokPPl/wKOQQuKqtgGx+RJbcks9syYPruYesFUDCfHiNcYbbmkSQeSj0huuv5zv3KgPWWrWjVGIVYClX1KS+CQj6xTFJNeWDL7LykHT0TQoeLh3URTdSKV3/ClOi39erq01tkrVr/j78fzR21fMlIDCnxiKNrGcdMv9Bcn8Icbee98Umby+YxBrmHvirYkV3n/rhwkagGgiwW/C75tleLmhJ6NcQAtCegtKQQC9eMlLBQd5XyD4qDaxbKnqQ8Su94lW/O1JLkqzm95gV/ntOWBNA677TlObg3z0zSAox3H45G/sxeZJwYFQsk6aCwH+N1WBqV5eyXDekPmh27UuvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1vZd7CgwXZ0ImV6GTb6Jfmby8mt4KM/NSceGox+PjY=;
 b=AA5uyFlgYVHZ9CZ3U+GT9gV9y3wdEy2Tpl7P5EDkKFyiPUVNuaiLqRTcAiWxvN6iRYCD8uJN2LuntxbzWR70YIb9s/sj/3X32y/awiN2XH7lICzCNurbeTQV0ycweP/c+5ag3iKH2JpMN4cHpHeZfT8nKiqM1EcfKeVdmwfw1yI=
Received: from MN2PR05CA0048.namprd05.prod.outlook.com (2603:10b6:208:236::17)
 by DM4PR19MB6390.namprd19.prod.outlook.com (2603:10b6:8:a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 13:18:40 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:236:cafe::74) by MN2PR05CA0048.outlook.office365.com
 (2603:10b6:208:236::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.13 via Frontend Transport; Tue,
 15 Apr 2025 13:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.4
 via Frontend Transport; Tue, 15 Apr 2025 13:18:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C36E7406541;
	Tue, 15 Apr 2025 13:18:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A598F820259;
	Tue, 15 Apr 2025 13:18:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib-test: Use flex_array_size()
Date: Tue, 15 Apr 2025 14:18:37 +0100
Message-Id: <20250415131837.568750-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|DM4PR19MB6390:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5e11638c-fe44-416c-93a4-08dd7c20094f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GEQn4agCSyha4XNYKQtAHRLI+CytoOHdj8y4K//LfvEqmSFvkFSqY9P6k2k+?=
 =?us-ascii?Q?yRrumVeNYCMPZbz/LnKBiLecHPAxj9kkUPALcWq51JhiiuMh3wb+ubswKWj8?=
 =?us-ascii?Q?C4yvBw+EFwFk9MdK2BQXakGmY0HoSqjQyUbZe8p6UThIl+aGIc/sZY/LmkO7?=
 =?us-ascii?Q?kK2B/fUs/2qql6hlsGjn96ZnwbLzvjTe8+GXt8COfEkp7ruX0sWvlwiP90CJ?=
 =?us-ascii?Q?gtv3FaCUu3SgtPepoOCHVdfDgeByCmUZwHgPKdlopJlgKrlRZGIe/c0zuNSp?=
 =?us-ascii?Q?ewrtZfJTiikq1aIZcGbAi5awGdRyXSeIpZMdzNy9j7Men5jz9Wzid7VHI8Kd?=
 =?us-ascii?Q?X9JEnmPdc0obMNi0GfdeWG24fzLBYubErg//20pCkGkOz3zhpTelvAILPxXT?=
 =?us-ascii?Q?DQt5aMBn13zjPyoVfeigF0o0jIbR9fW99Z6JWaCQUmN/OJ7zCZYKc5XM5uCR?=
 =?us-ascii?Q?1h0/zbL7ME/vCtDOdeOiIi5JdOtHARBW44WVA5RXXWCLpLKKu2dIF5hxtIBj?=
 =?us-ascii?Q?+uxXhdiWOsuueIuPS4YcXZvoEmZdFQFPJm5KY8icJDKf2UnvJm0GP1V6h+tP?=
 =?us-ascii?Q?saeCdyzm3ieSHU0pf1YHBSxZstv1GHakeMdmF8atX0pY4uwTKciRja/UD6OS?=
 =?us-ascii?Q?f+Zhaehaei+5AS4qG+Uspt03VD5zOORa5gECGxawwVKvKp5oZLCFbZ/xCJY3?=
 =?us-ascii?Q?dqTRa79TpoZSc9f8UOi35WZBglw7v3t3e3V6DiewKOySLMBZY79aidJM2s7/?=
 =?us-ascii?Q?JktwuMFV7b+pev+C4yJsTjmrcCefSIHjNHvy6BpazA2dbfAYtEd4Thkczu4w?=
 =?us-ascii?Q?Zg5FlV98hzBx3tl8wV2WNcBHs2FS5dyXuwXBiBqQr9+SXaRmWtkUTzLFqCnH?=
 =?us-ascii?Q?ajrU5hU5/BdsT+xKZXTkiq+Pn91FRXQPjnibfrlDYODE1FvDknS/OpoC8UDW?=
 =?us-ascii?Q?H+tHXfOmpfZMNVotVR7WdQvmTbbef9dxkuoJVwbswT5EatHFMEKhvUI5e6EU?=
 =?us-ascii?Q?dMg2zyUbLnb1aKQfjL9hMy3kVSPOkcUPQk38KWZlP7fb6IErlCj5FZOSBFUV?=
 =?us-ascii?Q?d3aFUenIlEATWHlFQLvZjxm8xp7KEFkOPQdLHX3Iq2ZQdoVQ6TUr7T7DVvKr?=
 =?us-ascii?Q?vu6lBKAKBR5PXem4rbLkQDBRrGjh6ED/Y4bMP+w8a0UObAiEx7DiMwejBq+c?=
 =?us-ascii?Q?IxIdjW3mPGfwNc9nLXeZhEI5VwJBkCzc8n5vNCwsoa9aIp0+2cNQ3Pw237JQ?=
 =?us-ascii?Q?8bEOEgIKUiqpqwoAmivex4vDU05noSDT2acYzIFuyroVdVieTWcb5g6DjK/k?=
 =?us-ascii?Q?ZmZ9yXyyAJx3sjW/xwpLWMG/U821DU/NMJxRaRpinEVX3IdndhTrhSt9VULa?=
 =?us-ascii?Q?RGoKsvI/Ff+Im06LguUXkIbEruvcePwvJfoeeJF4K0u4iFPW6DmjTGWhMXrM?=
 =?us-ascii?Q?HvNmHqcoFcrN2RzLrDjkGUrmNkcNvINqkji4L4wSRKBd2/xWW0JUOW3QWblg?=
 =?us-ascii?Q?o+apRN+j1rWq3mdDZ+6RguWVBgVs8VdTlGUq?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:18:39.1337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e11638c-fe44-416c-93a4-08dd7c20094f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6390
X-Proofpoint-GUID: aRUQiGatMxiOshx6OafSMVJks8DXyoj-
X-Proofpoint-ORIG-GUID: aRUQiGatMxiOshx6OafSMVJks8DXyoj-
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67fe5cb7 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=AraTSBJ97Mn3u8F7H8gA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Use flex_array_size() when calculating the number of bytes argument to
get_random_bytes(). This replaces a calculation based on passing sizeof()
the expected type of the destination.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index 906a28bccad1..f53650128fc3 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -54,7 +54,7 @@ static void cs_amp_lib_test_init_dummy_cal_blob(struct kunit *test, int num_amps
 	priv->cal_blob->size = blob_size;
 	priv->cal_blob->count = num_amps;
 
-	get_random_bytes(priv->cal_blob->data, sizeof(struct cirrus_amp_cal_data) * num_amps);
+	get_random_bytes(priv->cal_blob->data, flex_array_size(priv->cal_blob, data, num_amps));
 
 	/* Ensure all timestamps are non-zero to mark the entry valid. */
 	for (i = 0; i < num_amps; i++)
-- 
2.39.5

