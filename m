Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9DE1FDA62;
	Mon,  7 Apr 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039151; cv=fail; b=JcTIsBAbZVIAAi6amOtbGE0nE3jgU32P/rDk50osZrMIQjcaxentrPGuE4lthR1X/9GkpF05VQsxoQhpwDxFbKlWQLw2f/xMi8X8BRM1ZDic9QFPc+J7zTPKFUZ3EzKQJ458gJqrct0Dhe4udpjS9ryInU+M8G31by2Lh6Uau88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039151; c=relaxed/simple;
	bh=sMg+l+DwviDy/O90xXItjc+uyyFkzAI5vS3bYFfSkog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IeFlKTvk+buPBQdav9Ze0ZFXLpQ7H6MCpkwrv8Yrrwm8yI0+IkO/f40iAcYTCfhAHNLZqtJjdGVR7r2M2IkjO2D8fBadRyzkVZMNnGzUvlXJtymsHojMiGcM7ueLIFdwbyk+h0j2zmyd7LXu2cCIuNCyPFh2W+idiNS6Lcigl8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XHQlJ/Ov; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FLWuuSOC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XHQlJ/Ov";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FLWuuSOC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CLsxr003809;
	Mon, 7 Apr 2025 10:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=; b=
	XHQlJ/Ovox7xThCxbOZT8GZ5qdnSC9zPVi3aGwc9SpaKDGcQGbVa3NzrY2BvKnj4
	ZMaYSEB8qoq8t033IoKdrAb7WZUxowz2MBMow24lPXH2oPlXqNSN+9c1rfQ0sjiL
	zO9Ysj+4bo+6xascCSXJujvDIa5JYs1IaXTnoc28H26xZCYe/otYrvBFQtfTGRC4
	toxKesPwhzUxjbqV0F8VOJPOvmfc6vog1ESQvM+xva6b+G4/vHsA09QvPhgF5P0c
	peM28GYvT5fvs5gif1rQbr7/YqOJWgClVjaU4K7at2Pz3aQKSAYIpZiZItFhGWkW
	1ONYUa7AlUVXr0Gtl450uw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwg9rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNkrWKUa1dOvDzmCA2tw6+BzDetdCtTepNQ6SZwjfp9uKSI/tkV+9RueCOR0kp9J2IHp9TX+u6TMAVOtxLVoG+Ie6LmFnPYwcWXnwDTFWVTp7HOjcZ7KGO7PnG9Zu8PWZZ8qU+a9sukJJ7F8LHN1o7FW/5tR+0naZn7H4MJoQMrJbRYvrx2OvqW8gf8avBXvIvx6GwcO+7mKOE34p9w8Tc03ScDpXw3ICkw/myNuVmagsrd5ZFL/MBXvLOR4LrdE/+CY280GWNdCoNjg6i1Kwbj1iemx4tAOtk+FqxxL+89yYo1LR6y8R94yHD6OivEsdxuNn+627+lNWUazzU6GIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=;
 b=TxyX4M9vHE8lLnXkgp4S/r+3WWYdWLVSAALcPvMeAW/E2/T8ry8ycMt+pwmC1h87jAvfbxKrNAG4V0puqiQm3tKa84/l+LCiHzpOYOnOhjgaJ/lduv2injBXxGss3P6PepYe/FG9ZkWgo+3ojSPVBMlWlHSTbs0EktYf6CCI9p+kBda45ScRBdASFDE6QdSAG+a+UfZDeuk2wxnnvefmH+pMmWRISlvzLAxHs5TL0MbIAwxPOdrczOsrHp83Bk65BjSRn0fKL28FIUkeizNGoeP4qFRZz4DUanIp7if9zZQK3UYiK5P/coDBb3EUikzSfwN2HJiMi1OQPv88e9hBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0hWv08HP1GeLP//o9dhysk0Fb8tP3kqDf3PGfVekT8=;
 b=FLWuuSOC07jcQQ5dlJseQS4LU8gUBW1gmWiq/gj/Tp7ncJVQwJjF7uhvSUYHfipIQKKdbGY4uTw/XXKjHB1smNzSz+/zsxYrCd82IDAL+ldeNq/EodNdhBeve9j/BnJCp1jnd3SZXWddbcK2eFihTGumAyisju0OmXwc6mCdcZM=
Received: from PH7P220CA0180.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::30)
 by SA0PR19MB4192.namprd19.prod.outlook.com (2603:10b6:806:8c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 15:18:59 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::d7) by PH7P220CA0180.outlook.office365.com
 (2603:10b6:510:33b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 15:18:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Mon, 7 Apr 2025 15:18:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 05C1140654F;
	Mon,  7 Apr 2025 15:18:55 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CF91E820244;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 5/5] ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63
Date: Mon,  7 Apr 2025 16:16:44 +0100
Message-ID: <20250407151842.143393-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA0PR19MB4192:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dc4fd33e-5343-4f29-3c14-08dd75e784b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2EaIsMvxwSuQCk1GXVp/uGSftFEmCXchVvMehg22EPIsSOXgl0EAAlwvtLUw?=
 =?us-ascii?Q?flH4hUfLCtk/kV4F4SQn6A6T7KWTvonMSIzTZYI4jmkk9Msbjx61211P8iBX?=
 =?us-ascii?Q?GRvKx1HozF4MsW1Xg3XdnH7WYGtz3G7U2LfCGj0StsQEbYGvE/rUP9qHiXnI?=
 =?us-ascii?Q?lfKbm41BsHf2Ts5Eqre+t09fy0mn1q+7NlUCsm0HhUbttcfgc8ab4CwDasOf?=
 =?us-ascii?Q?OlVAO2kick1eb34NHYu2mSQTLlU5+GInL/cW4FNwG97tO2tKpH5mvrXt+dGJ?=
 =?us-ascii?Q?PCdkpnm7seV6MwS8s3RvdUGa9KilMzu6AsRvW5YOv3cZDuMo6s7Y1vFojxmj?=
 =?us-ascii?Q?OkAnnuG00O2s3lEYyhpgu+sVfZyg8II0KbfA75ccr8TUP7A2wbTV4aWBJbZa?=
 =?us-ascii?Q?+K9JvsY4TweVP5zxu3OQy/870yn/mhGqAPtSULmamWX8yUe/kUIRIZoy667X?=
 =?us-ascii?Q?gNqrrNfZrlBoABGc6MuhRd2ZevzYYMewY3FR7fgrQma9jHhw+k0PmEriVb57?=
 =?us-ascii?Q?p0x66Ktam9aJJKUAFDBc4kN14IKsvEGNf6hibOgpzoLPS+r9hHWcHbSg1ea2?=
 =?us-ascii?Q?rScFc65pWiH76CPafuk/tqseevPec/J0O8Q8JVFier3NyOW+SEzDX3ZsMdeV?=
 =?us-ascii?Q?80K5+vYQwt8hPW4JKjgXyXobNk7y10nGrXXWyfQZBHBQtnz2XMMiY78SkeGC?=
 =?us-ascii?Q?yK53AIHsxpZRpV/hXp83A37Iyf5JZ1ajg8+ML+pBowXG3Sand5MFSIn51icT?=
 =?us-ascii?Q?YSNfprenLoMZ8mV/jXGfvgmH9O7cVQxbe+yszjoUnEtZxZr5VP84hLy9R9fI?=
 =?us-ascii?Q?G8M0tbcin9Z7lznoyihVTFRWWeb6uvNIwTH9Gv6i7CVFJTbTyqyfYEHHQdOk?=
 =?us-ascii?Q?ig/4bX55eNOc7i0onyyrXBToxue8T0yYbo0eyRIZwxvO20p0qQnlYnTqDp1w?=
 =?us-ascii?Q?mdwhjhYRAzowmxSDRsePihbQK9Nnt330sqWxG8/Xc8ILPGQ85vCung+aLFyT?=
 =?us-ascii?Q?W4QjUXPe/lbROqH0BenopMztWecGvnn0o8+JDnJQcDVnEebsmzUE+w4ixTtL?=
 =?us-ascii?Q?CXWzJMN5DhTIpiVJxTAViX7VSwke39qKcgeoKAUZvZHDzviumkMgWIIicKg9?=
 =?us-ascii?Q?p9/HWDDpfVjSB9Olv67zUOy2GPoyHORQ3ZTnubOrdrEj/F28PKYemvKQUdl/?=
 =?us-ascii?Q?v7VCkLQh9b6pOqSDOr7QiuOhCYIwAq4Da89cjrEJfXHfuVCS+ArcY0dBqmy4?=
 =?us-ascii?Q?gUUUG4DlmcOnLm++Ww2kZckULyJPsOsM0jkNIpBFg9qp5FcpndsNjz8X3Bdx?=
 =?us-ascii?Q?w3gBQY11EOils6lNqgCDDY5r0glHuqojiEkGDK83bxM/hWEm6JhgdF+F4s2W?=
 =?us-ascii?Q?RVtiPZr++tnZTLFtohcVcb6sVP4JeDD8AXIf7rBpY64jvgRPN7QIXfEMdMtX?=
 =?us-ascii?Q?hod3e+NMGOgz4O79L0kL1vmUvKfZyz3q3Th8GjjvoPj1FUMQGPy7yp7Y2WbQ?=
 =?us-ascii?Q?afD1fZDbQPKB9dM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:57.7365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4fd33e-5343-4f29-3c14-08dd75e784b2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4192
X-Proofpoint-GUID: 8xBSOTTHNMV0B_FGfIexF0h9FwZS35DD
X-Proofpoint-ORIG-GUID: 8xBSOTTHNMV0B_FGfIexF0h9FwZS35DD
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f3ece9 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=CWbckqrqqy4M3qBwpBwA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On CS35L63 the DIE_STS registers are populated by the Firmware from
OTP, so the driver can read these registers directly, rather than
obtaining them from OTP.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  2 ++
 sound/soc/codecs/cs35l56-shared.c | 39 ++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index e16e1a94c8a1..63f2c63f7c59 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -71,6 +71,8 @@
 #define CS35L56_DSP_VIRTUAL1_MBOX_6			0x0011034
 #define CS35L56_DSP_VIRTUAL1_MBOX_7			0x0011038
 #define CS35L56_DSP_VIRTUAL1_MBOX_8			0x001103C
+#define CS35L56_DIE_STS1				0x0017040
+#define CS35L56_DIE_STS2				0x0017044
 #define CS35L56_DSP_RESTRICT_STS1			0x00190F0
 #define CS35L56_DSP1_XMEM_PACKED_0			0x2000000
 #define CS35L56_DSP1_XMEM_PACKED_6143			0x2005FFC
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 76ddb1cf6889..7f768718b69b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -214,6 +214,8 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_DSP_VIRTUAL1_MBOX_6:
 	case CS35L56_DSP_VIRTUAL1_MBOX_7:
 	case CS35L56_DSP_VIRTUAL1_MBOX_8:
+	case CS35L56_DIE_STS1:
+	case CS35L56_DIE_STS2:
 	case CS35L56_DSP_RESTRICT_STS1:
 	case CS35L56_DSP1_SYS_INFO_ID ... CS35L56_DSP1_SYS_INFO_END:
 	case CS35L56_DSP1_AHBM_WINDOW_DEBUG_0:
@@ -802,13 +804,29 @@ static int cs35l56_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
 	unique_id |= (u32)pte.x | ((u32)pte.y << 8) | ((u32)pte.wafer_id << 16) |
 		     ((u32)pte.dvs << 24);
 
-	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", unique_id);
-
 	*uid = unique_id;
 
 	return 0;
 }
 
+static int cs35l63_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
+{
+	u32 tmp[2];
+	int ret;
+
+	ret = regmap_bulk_read(cs35l56_base->regmap, CS35L56_DIE_STS1, tmp, ARRAY_SIZE(tmp));
+	if (ret) {
+		dev_err(cs35l56_base->dev, "Cannot obtain CS35L56_DIE_STS: %d\n", ret);
+		return ret;
+	}
+
+	*uid = tmp[1];
+	*uid <<= 32;
+	*uid |= tmp[0];
+
+	return 0;
+}
+
 /* Firmware calibration controls */
 const struct cirrus_amp_cal_controls cs35l56_calibration_controls = {
 	.alg_id =	0x9f210,
@@ -829,10 +847,25 @@ int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
 	if (cs35l56_base->secured)
 		return 0;
 
-	ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
+		break;
+	case 0x63:
+		ret = cs35l63_read_silicon_uid(cs35l56_base, &silicon_uid);
+		break;
+	default:
+		ret = -ENODEV;
+		break;
+	}
+
 	if (ret < 0)
 		return ret;
 
+	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", silicon_uid);
+
 	ret = cs_amp_get_efi_calibration_data(cs35l56_base->dev, silicon_uid,
 					      cs35l56_base->cal_index,
 					      &cs35l56_base->cal_data);
-- 
2.43.0

