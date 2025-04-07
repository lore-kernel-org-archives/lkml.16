Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AA1F892E;
	Mon,  7 Apr 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039150; cv=fail; b=bj7IW9JcotdLGiv0tUDEbMgXFCE6L2Qau7DUBOz1GbUlPEn8/AgJHmujgNfZilgOiUQWme0p0DG7Mg1VMGqk3lpMm+Hpd6G91fpRGqIbeqjRs51r5y2es0No46PELCx/UuQY99sc4TjTPs6H5IhysxVPCPl5R7i+tqf3GOggyBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039150; c=relaxed/simple;
	bh=nCdPFwtleOLX9Im3Fz2AesZWmPZe4GNt/4GAuY4RswU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5CMYU77wW9Hvi8MV3NoQvKVj0TSyABkoPrXj2FeiZJnQuUDuBRcd55liB+9Wl6913rsvVaPCV2q15pdSB25QVFfLbRaEJCuMJsVMcGqpdiOeKcyKCtUZs2wzoY8unlBYXuvgfNoJsNB4reHCW1aLWfC6eNtGOGTgyu746gQ36k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QTI+Rgh8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GVCEe1u4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QTI+Rgh8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GVCEe1u4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374i0A0031385;
	Mon, 7 Apr 2025 10:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=; b=
	QTI+Rgh8PcUx+nO7I/BrUPRL3NQsdm/n/xT9r1ufSPY4D/aKGqTaGhom3JQAQH4Y
	VyDAVIevpfpyOW7OmSM17H/0tP9JVNVqqI6MNMGfwZz41eBLRGEzpX5rV2VCyPLa
	sAlOm26NyJ7cx6sbQpbuCoOJOK1K9x1DF0XDHPd5aSVDAiMBeYI1h7SAD4pZ5Zw1
	MiT0+kHR6aLOv1Wu+P7I+iRLWi8v4Ng/0g1AN6uSZGINyOSj4tcsbV4ebpfd4+LH
	JGJBVHy8D0KDQ1NiYowCP0Wwj4A9HxcIovS7FAQOsoOE5iUIg0RQFtD0kJGn3DUo
	PGyNqXYaXdiPZLoMYPE+dw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgje9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:19:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOZDeTbQO8oCiKQsEN68dgXGQr/xNCWVpZnlwODh5e3y2LBmE0gYX1OGJhUlZno8rs+uP+kwUj8RslsM2cn7H46hnKCA11gMU4Dvdpq9WENEoJDkp4piKNcBis9B+NqJnuiIdzIbrrVEnmptj/YN1vGg3KncUHz/DxIG0L9lDbpbuRQFZ6/5OM6gzMY+HN54ketoqu5bYgy5YVlCRm+HzBE1mfl/j86i8dv1q5dBd5J64/1A4ky0DT+3kuEBUkPNdLZVH0+6xi3w0OvRafIjKnxj0ohLC1WwU4hFgd5yTYElD3Sur7zvD1INdBsXJOPEkd0f7mvnGol2055Fte+gBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=;
 b=o+1CmNHH25NCDaRc9wfUWb1c2QfkalM4S5K/A4dibeWLcGwg8rU9E66OZLG0tHYhoRHonCpSKJWBnpddVBYbPoU/EoHPjq1rA7ARaI/fs98wuTbyuo3hAOG1PBQ+ewwGLQWNdTFdWqytBKqEkDV6zrgiOMMeSQPp3Qky0Z+fP0JZLUX3aiG0b/oThYWJy+IOv+2Q5PtOK8UrL5GFhoRcMzRXIdHx5cpSRqCouOXKTa2C8ua30th8MPnONZ0ES5XphljRkoZjTdIO7si5oH4DmjxCxJPQPx9o+HDzBwbCKAlSwro3t2IlhMt1QsRduSdIcveqQIBXi6mKnFmdamzFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/QbRk2seyUY78y+9D8RMnNeTe8MdhV3nroM1nhzdrw=;
 b=GVCEe1u4YqeV3F7tXrwrstf0cwsoqdnjGiq3MYnuUcqYqCkjRjq9NZ8IfwVTz2RTDvuowq3MVfZ0+UnpD+rfHO/iA0faOq0z2iGZQSdnb6C0GCz76NRvY2gCnfeHgKixI0AXW0dFN9GkhgAMafexR4iDOQQ21Uiojy6XWsEf9GI=
Received: from CH0P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::28)
 by DM4PR19MB6245.namprd19.prod.outlook.com (2603:10b6:8:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 15:18:57 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::37) by CH0P221CA0047.outlook.office365.com
 (2603:10b6:610:11d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 15:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 15:18:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C8A8840654E;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A10CD820244;
	Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 4/5] ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
Date: Mon,  7 Apr 2025 16:16:43 +0100
Message-ID: <20250407151842.143393-5-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|DM4PR19MB6245:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb800a98-984f-4bd4-d2b8-08dd75e78388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mpByeZmi28fPRU5hCCwqKb1BAVLiRO7kdmtSTR6BVFVcDcmGxB+73npk+02T?=
 =?us-ascii?Q?+hzDYbK0v6+rKNo86u85jp1pq1jCEm4/Y10IkRh+Ti+dOhqwT3IHBZ7oToSi?=
 =?us-ascii?Q?tpcIQZKMTo2bPepLK8UT+Gnaq2KPDEl1rTKWSRbtRKtq+e+wyzI0uX0j+8J9?=
 =?us-ascii?Q?FEJIaI0gAiWo0wG4prCuNPejsHEe440RvzzKhZW07egipXnf+3Wj0neS1Qoe?=
 =?us-ascii?Q?wJBOd3Hr4LpxoDpf41RyBydk71YfdXYKwNjsEbbcK9E4+847z1CTsOnlMtKW?=
 =?us-ascii?Q?mPnzQeT9NziuVsaxGTuqRJ8UFXzUHukoScIds63KBd3bFlU2JA7EJb6mW1k+?=
 =?us-ascii?Q?WRtybPbJZEBvtYg6sTcrswtD/E4lLkJiQq3rqrCZlowDvq0TA7zmMCRHt+lU?=
 =?us-ascii?Q?X6K0Zdbdpg4bIDBR5aAaw1w9JcfLxDAAeQjmdp62CerRgpcLDs7ZU54yUzy8?=
 =?us-ascii?Q?MveAFShHH2YpdiI42K/uj07E+6MRwWrjquRTH+XaUTqi2Pfh5WbdFMcZ6bkv?=
 =?us-ascii?Q?8G8ulhcf80uaRBaIQKllY+PuvlCL9WNWJTllqljjRpQAuvInExEiLv03hHZE?=
 =?us-ascii?Q?moTdKA5PUqoA8qgQF8HCMndS/SbrjT5z3OnhOnTdPEcxjTWPL2PF6Hg0rnDY?=
 =?us-ascii?Q?SRTPt70bWRhN052D66tIQ521mCdmb4qB/RFB5Q8g1oCf23GSAhsE64yaedQU?=
 =?us-ascii?Q?EqmHoFp3LwDHqsmmAKwBjmGKvnVXDAZCCBnhT4sSipwZm2SSlNMj2IUOtUFE?=
 =?us-ascii?Q?/e8TeFFGKQyrntGKoT8BtB1P8mLOR0MHaOj6Ejg0TZVDZL92HQIew9/ZKNY2?=
 =?us-ascii?Q?jRZ5EKnDO0Fs/Vp3pH1KMYo1S395hGLswGwLe5OP141vAWKNa13mwK2+Dbpw?=
 =?us-ascii?Q?/fBqZX2LW2ppyyCW7o7L6v139J0vIviUQ6dYu/Km/FzqEAyu9hXHYDn8Z0kt?=
 =?us-ascii?Q?VpeOHuPBUdgWBRwIMVd0lYh030H3m4nIOQW8yI7t/Bqpl06CjOH9CeU+Cw2O?=
 =?us-ascii?Q?KqmuqtzVyg4C8iLRU8BGjDsZDhjT8GBKP9e2ZQbZUfhTjvEmgeAuzDvYihiW?=
 =?us-ascii?Q?IPwIdQM6N9uKHCXtDY6NBBQn9Hg67AmHt9YWhsurb2AWsFpP359p9UqKZ1Wu?=
 =?us-ascii?Q?rTTzsiEc7fWOgxxA8jW0HhyF9KTEy4XS1/HT6WD2Mg74NMnwKiuWuhCQ4Vbf?=
 =?us-ascii?Q?xcPxTObkGHwkjIzYUgK9LlVFEmvFF8YF/R7anqIm1X8vLdPwIzUTPXqddE1u?=
 =?us-ascii?Q?Hrr9ut+PoQXiw0hLidyCtJgXIysAq0d3YFuv0/zUxJaJW83HEvgmQfsze1Rs?=
 =?us-ascii?Q?0B/CQpUZ5YI7iZK9oT+jtRZDrhIDGq8Ndil94K0NeEDHpJ1b+LepFEAfSKFn?=
 =?us-ascii?Q?gZYBvfB98xAFjKY0sC/aKNT2CIJks2WKUk0g6xOPjh6kz4rURj+hgXAN9XgI?=
 =?us-ascii?Q?8D9TC7AEMosXM2+Nj+ZRQXQ+Ak57OPMT3HjlPnAJcO5QPFcGcs0ysOaeBu1J?=
 =?us-ascii?Q?JX2zQdunBv/sAxs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:18:55.8655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb800a98-984f-4bd4-d2b8-08dd75e78388
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6245
X-Proofpoint-GUID: WA4jZ04pXiu4jEKLl7aUctMmKLk7lqbR
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f3ece6 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=_UruoEx0gL58JRCOsKwA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: WA4jZ04pXiu4jEKLl7aUctMmKLk7lqbR
X-Proofpoint-Spam-Reason: safe

CS35L63 uses a similar control interface to CS35L56 so support for
it can be added into the CS35L56 driver.
New regmap configs have been added to support CS35L63.
CS35L63 only has SoundWire and I2C control interfaces.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  12 +++
 sound/soc/codecs/cs35l56-i2c.c    |   6 ++
 sound/soc/codecs/cs35l56-sdw.c    |  74 ++++++++++++++++++
 sound/soc/codecs/cs35l56-shared.c | 123 +++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l56.c        |  23 ++++++
 sound/soc/codecs/cs35l56.h        |   1 +
 6 files changed, 237 insertions(+), 2 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 3abe4fbd2085..e16e1a94c8a1 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -104,6 +104,15 @@
 #define CS35L56_DSP1_PMEM_0				0x3800000
 #define CS35L56_DSP1_PMEM_5114				0x3804FE8
 
+#define CS35L63_DSP1_FW_VER				CS35L56_DSP1_FW_VER
+#define CS35L63_DSP1_HALO_STATE				0x280396C
+#define CS35L63_DSP1_PM_CUR_STATE			0x28042C8
+#define CS35L63_PROTECTION_STATUS			0x340009C
+#define CS35L63_TRANSDUCER_ACTUAL_PS			0x34000F4
+#define CS35L63_MAIN_RENDER_USER_MUTE			0x3400020
+#define CS35L63_MAIN_RENDER_USER_VOLUME			0x3400028
+#define CS35L63_MAIN_POSTURE_NUMBER			0x3400068
+
 /* DEVID */
 #define CS35L56_DEVID_MASK				0x00FFFFFF
 
@@ -322,8 +331,11 @@ static inline bool cs35l56_is_spi(struct cs35l56_base *cs35l56)
 extern const struct regmap_config cs35l56_regmap_i2c;
 extern const struct regmap_config cs35l56_regmap_spi;
 extern const struct regmap_config cs35l56_regmap_sdw;
+extern const struct regmap_config cs35l63_regmap_i2c;
+extern const struct regmap_config cs35l63_regmap_sdw;
 
 extern const struct cs35l56_fw_reg cs35l56_fw_reg;
+extern const struct cs35l56_fw_reg cs35l63_fw_reg;
 
 extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
 
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 38c391d11c78..073f1796ae29 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -37,6 +37,10 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		regmap_config = &cs35l56_regmap_i2c;
 		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
+	case 0x3563:
+		regmap_config = &cs35l63_regmap_i2c;
+		cs35l56->base.fw_reg = &cs35l63_fw_reg;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -69,6 +73,7 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
 
 static const struct i2c_device_id cs35l56_id_i2c[] = {
 	{ "cs35l56", 0x3556 },
+	{ "cs35l63", 0x3563 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
@@ -76,6 +81,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
 	{ "CSC355C", 0x3556 },
+	{ "CSC356C", 0x3563 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 2e0422b41385..13f602f51bf3 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -393,6 +393,74 @@ static int cs35l56_sdw_update_status(struct sdw_slave *peripheral,
 	return 0;
 }
 
+static int cs35l63_sdw_kick_divider(struct cs35l56_private *cs35l56,
+				    struct sdw_slave *peripheral)
+{
+	unsigned int curr_scale_reg, next_scale_reg;
+	int curr_scale, next_scale, ret;
+
+	if (!cs35l56->base.init_done)
+		return 0;
+
+	if (peripheral->bus->params.curr_bank) {
+		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
+		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
+	} else {
+		curr_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B0;
+		next_scale_reg = SDW_SCP_BUSCLOCK_SCALE_B1;
+	}
+
+	/*
+	 * Current clock scale value must be different to new value.
+	 * Modify current to guarantee this. If next still has the dummy
+	 * value we wrote when it was current, the core code has not set
+	 * a new scale so restore its original good value
+	 */
+	curr_scale = sdw_read_no_pm(peripheral, curr_scale_reg);
+	if (curr_scale < 0) {
+		dev_err(cs35l56->base.dev, "Failed to read current clock scale: %d\n", curr_scale);
+		return curr_scale;
+	}
+
+	next_scale = sdw_read_no_pm(peripheral, next_scale_reg);
+	if (next_scale < 0) {
+		dev_err(cs35l56->base.dev, "Failed to read next clock scale: %d\n", next_scale);
+		return next_scale;
+	}
+
+	if (next_scale == CS35L56_SDW_INVALID_BUS_SCALE) {
+		next_scale = cs35l56->old_sdw_clock_scale;
+		ret = sdw_write_no_pm(peripheral, next_scale_reg, next_scale);
+		if (ret < 0) {
+			dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	cs35l56->old_sdw_clock_scale = curr_scale;
+	ret = sdw_write_no_pm(peripheral, curr_scale_reg, CS35L56_SDW_INVALID_BUS_SCALE);
+	if (ret < 0) {
+		dev_err(cs35l56->base.dev, "Failed to modify current clock scale: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(cs35l56->base.dev, "Next bus scale: %#x\n", next_scale);
+
+	return 0;
+}
+
+static int cs35l56_sdw_bus_config(struct sdw_slave *peripheral,
+				  struct sdw_bus_params *params)
+{
+	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
+
+	if ((cs35l56->base.type == 0x63) && (cs35l56->base.rev < 0xa1))
+		return cs35l63_sdw_kick_divider(cs35l56, peripheral);
+
+	return 0;
+}
+
 static int __maybe_unused cs35l56_sdw_clk_stop(struct sdw_slave *peripheral,
 					       enum sdw_clk_stop_mode mode,
 					       enum sdw_clk_stop_type type)
@@ -408,6 +476,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
 	.read_prop = cs35l56_sdw_read_prop,
 	.interrupt_callback = cs35l56_sdw_interrupt,
 	.update_status = cs35l56_sdw_update_status,
+	.bus_config = cs35l56_sdw_bus_config,
 #ifdef DEBUG
 	.clk_stop = cs35l56_sdw_clk_stop,
 #endif
@@ -528,6 +597,10 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 		regmap_config = &cs35l56_regmap_sdw;
 		cs35l56->base.fw_reg = &cs35l56_fw_reg;
 		break;
+	case 0x3563:
+		regmap_config = &cs35l63_regmap_sdw;
+		cs35l56->base.fw_reg = &cs35l63_fw_reg;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -575,6 +648,7 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
 static const struct sdw_device_id cs35l56_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
 	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3563, 0x3563),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index da982774bb4d..76ddb1cf6889 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -47,6 +47,13 @@ static const struct reg_sequence cs35l56_patch_fw[] = {
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
+static const struct reg_sequence cs35l63_patch_fw[] = {
+	/* These are not reset by a soft-reset, so patch to defaults. */
+	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
+};
+
 int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 {
 	int ret;
@@ -64,6 +71,10 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
 					    ARRAY_SIZE(cs35l56_patch_fw));
 		break;
+	case 0x63:
+		ret = regmap_register_patch(cs35l56_base->regmap, cs35l63_patch_fw,
+					    ARRAY_SIZE(cs35l63_patch_fw));
+		break;
 	default:
 		break;
 	}
@@ -102,6 +113,36 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_MAIN_POSTURE_NUMBER,		0x00000000 },
 };
 
+static const struct reg_default cs35l63_reg_defaults[] = {
+	/* no defaults for OTP_MEM - first read populates cache */
+
+	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
+	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
+	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
+	{ CS35L56_ASP1_CONTROL3,		0x00000002 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,		0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,		0x00020100 },
+	{ CS35L56_ASP1_DATA_CONTROL1,		0x00000018 },
+	{ CS35L56_ASP1_DATA_CONTROL5,		0x00000018 },
+	{ CS35L56_ASP1TX1_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX2_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX3_INPUT,		0x00000000 },
+	{ CS35L56_ASP1TX4_INPUT,		0x00000000 },
+	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
+	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
+	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
+	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
+	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
+	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
+	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
+	{ CS35L56_IRQ1_MASK_8,			0x8c000fff },
+	{ CS35L56_IRQ1_MASK_18,			0x0760f000 },
+	{ CS35L56_IRQ1_MASK_20,			0x15c00000 },
+	{ CS35L63_MAIN_RENDER_USER_MUTE,	0x00000000 },
+	{ CS35L63_MAIN_RENDER_USER_VOLUME,	0x00000000 },
+	{ CS35L63_MAIN_POSTURE_NUMBER,		0x00000000 },
+};
+
 static bool cs35l56_is_dsp_memory(unsigned int reg)
 {
 	switch (reg) {
@@ -199,7 +240,7 @@ static bool cs35l56_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
+static bool cs35l56_common_volatile_reg(unsigned int reg)
 {
 	switch (reg) {
 	case CS35L56_DEVID:
@@ -237,12 +278,32 @@ static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L56_DSP1_SCRATCH3:
 	case CS35L56_DSP1_SCRATCH4:
 		return true;
+	default:
+		return cs35l56_is_dsp_memory(reg);
+	}
+}
+
+static bool cs35l56_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
 	case CS35L56_MAIN_RENDER_USER_MUTE:
 	case CS35L56_MAIN_RENDER_USER_VOLUME:
 	case CS35L56_MAIN_POSTURE_NUMBER:
 		return false;
 	default:
-		return cs35l56_is_dsp_memory(reg);
+		return cs35l56_common_volatile_reg(reg);
+	}
+}
+
+static bool cs35l63_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CS35L63_MAIN_RENDER_USER_MUTE:
+	case CS35L63_MAIN_RENDER_USER_VOLUME:
+	case CS35L63_MAIN_POSTURE_NUMBER:
+		return false;
+	default:
+		return cs35l56_common_volatile_reg(reg);
 	}
 }
 
@@ -405,6 +466,11 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
+static const struct reg_sequence cs35l63_system_reset_seq[] = {
+	REG_SEQ0(CS35L63_DSP1_HALO_STATE, 0),
+	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
+};
+
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 {
 	/*
@@ -426,6 +492,11 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 						cs35l56_system_reset_seq,
 						ARRAY_SIZE(cs35l56_system_reset_seq));
 		break;
+	case 0x63:
+		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+						cs35l63_system_reset_seq,
+						ARRAY_SIZE(cs35l63_system_reset_seq));
+		break;
 	default:
 		break;
 	}
@@ -844,6 +915,9 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	case 0x35A56:
 	case 0x35A57:
 		break;
+	case 0x35A630:
+		devid = devid >> 4;
+		break;
 	default:
 		dev_err(cs35l56_base->dev, "Unknown device %x\n", devid);
 		return ret;
@@ -1080,6 +1154,39 @@ const struct regmap_config cs35l56_regmap_sdw = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
 
+const struct regmap_config cs35l63_regmap_i2c = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_base = 0x8000,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.reg_defaults = cs35l63_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
+	.volatile_reg = cs35l63_volatile_reg,
+	.readable_reg = cs35l56_readable_reg,
+	.precious_reg = cs35l56_precious_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_i2c, "SND_SOC_CS35L56_SHARED");
+
+const struct regmap_config cs35l63_regmap_sdw = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = CS35L56_DSP1_PMEM_5114,
+	.reg_defaults = cs35l63_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cs35l63_reg_defaults),
+	.volatile_reg = cs35l63_volatile_reg,
+	.readable_reg = cs35l56_readable_reg,
+	.precious_reg = cs35l56_precious_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_regmap_sdw, "SND_SOC_CS35L56_SHARED");
+
 const struct cs35l56_fw_reg cs35l56_fw_reg = {
 	.fw_ver = CS35L56_DSP1_FW_VER,
 	.halo_state = CS35L56_DSP1_HALO_STATE,
@@ -1092,6 +1199,18 @@ const struct cs35l56_fw_reg cs35l56_fw_reg = {
 };
 EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
 
+const struct cs35l56_fw_reg cs35l63_fw_reg = {
+	.fw_ver = CS35L63_DSP1_FW_VER,
+	.halo_state = CS35L63_DSP1_HALO_STATE,
+	.pm_cur_stat = CS35L63_DSP1_PM_CUR_STATE,
+	.prot_sts = CS35L63_PROTECTION_STATUS,
+	.transducer_actual_ps = CS35L63_TRANSDUCER_ACTUAL_PS,
+	.user_mute = CS35L63_MAIN_RENDER_USER_MUTE,
+	.user_volume = CS35L63_MAIN_RENDER_USER_VOLUME,
+	.posture_number = CS35L63_MAIN_POSTURE_NUMBER,
+};
+EXPORT_SYMBOL_NS_GPL(cs35l63_fw_reg, "SND_SOC_CS35L56_SHARED");
+
 MODULE_DESCRIPTION("ASoC CS35L56 Shared");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index a4a1d09097fc..cdb283ed938c 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -84,6 +84,25 @@ static const struct snd_kcontrol_new cs35l56_controls[] = {
 		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
 };
 
+static const struct snd_kcontrol_new cs35l63_controls[] = {
+	SOC_SINGLE_EXT("Speaker Switch",
+		       CS35L63_MAIN_RENDER_USER_MUTE, 0, 1, 1,
+		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+	SOC_SINGLE_S_EXT_TLV("Speaker Volume",
+			     CS35L63_MAIN_RENDER_USER_VOLUME,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SHIFT,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MIN,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_MAX,
+			     CS35L56_MAIN_RENDER_USER_VOLUME_SIGNBIT,
+			     0,
+			     cs35l56_dspwait_get_volsw,
+			     cs35l56_dspwait_put_volsw,
+			     vol_tlv),
+	SOC_SINGLE_EXT("Posture Number", CS35L63_MAIN_POSTURE_NUMBER,
+		       0, 255, 0,
+		       cs35l56_dspwait_get_volsw, cs35l56_dspwait_put_volsw),
+};
+
 static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_asp1tx1_enum,
 				  CS35L56_ASP1TX1_INPUT,
 				  0, CS35L56_ASP_TXn_SRC_MASK,
@@ -886,6 +905,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 		ret = snd_soc_add_component_controls(component, cs35l56_controls,
 						     ARRAY_SIZE(cs35l56_controls));
 		break;
+	case 0x63:
+		ret = snd_soc_add_component_controls(component, cs35l63_controls,
+						     ARRAY_SIZE(cs35l63_controls));
+		break;
 	default:
 		ret = -ENODEV;
 		break;
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 8a987ec01507..200f695efca3 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -51,6 +51,7 @@ struct cs35l56_private {
 	u8 asp_slot_count;
 	bool tdm_mode;
 	bool sysclk_set;
+	u8 old_sdw_clock_scale;
 };
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
-- 
2.43.0

