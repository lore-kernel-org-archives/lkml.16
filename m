Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA9A2641CB;
	Wed,  9 Apr 2025 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203018; cv=fail; b=VNXr8riY9rxeumlpqQvrGkEnST+OTYaizm1OdAvG9yRhy/c4LcQhMcPB/mFd614mmhERAG+dT+aO8AFJ7bgmjfuVkGtmI2jnQstUiavD0EVt9C6m4jNbAeqtTpivq1fxLWMKgJQykDCFMwJh0X0SOOxuroBz+JwBhsVKRnmUAYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203018; c=relaxed/simple;
	bh=KISMwVKiF5FhwaN+/F7T5SOm1fiOaFSy1QE/9Xx3oy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjuGEf56UBf3G7iMJ97Ccvkre8ePGstJGYxcl1Zz7dDBQkFUf18Unm/hiWSfOYAQrQIsDM0nc1bdV05H9mzrN9aKcjT9rbXV9t2N2JxIz/m4piY/EqZFrFDdp86iS4ZF+yJi8m566yiHRIR1o5bF8Iw6iUfgzEsIksrRr6X6e2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AjV/dOy9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BSpSUJGC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AjV/dOy9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BSpSUJGC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Cn0KG028564;
	Wed, 9 Apr 2025 07:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NuUzThu8mJCj3E5bnQ8/Jcb0RuUUy0VGnVAQ4uKJJ0U=; b=
	AjV/dOy9yDhFVWEPBWCW+zEbbDlwNjr5oV7ZtUE4+iAh8qIrKQ3L4F/HbXXFtnO8
	IUmf3xOcHJfjE9B7YfCAivysDgdVXYxgOxPAu/qGUKvTM30/kOT4IHR1aSeGhuls
	xER+6eSB+YL2kfEB5T/tjI1Blf6DZlgl2ihQX4cgYRG41tlB4yzaAUUGGk7SBcop
	upayj5uL4r/XadD5TRR7h8e5+2cmLLkG7ut81/EZR8LZPj0zMjvEWUmw6xOYogYC
	FEEjNI7mZ/dt+EKYoffrhURw7J4xrYjyYrGZd2er8OEUjG9tAfnBRoNeIxwj4wnj
	ZZLZak1aAVEgsePeCizzCw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ws7tr018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 07:49:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L80r+jFv4OqV9zN7rrkeu/dqFlfvcAX9UfTus+RU/gEJfvUwEENN/hLMXDfwLf+Dbah2qkqY+46qYUyn/YmoM4evSo/DDtc3glLzkBin0XrbDkG2tdYuT2mq5QGQyFzxS7mM2U7ft+932QWtfk6ufFySolHunfvR0DRe3GqqwMXPex7Dd+1+AdYRg4E6qoVQ2jUTlk3N/E2OyhEmEQULB6lhtqQvniCKgo3HDngViVETjD7Mp/bQgqpCVKkj7juU8XE3TgUxQderWWxSKcQtxcGmmZjWZOMGP/3kpzgDldEX3YNlMBRqdx9Mu9tL6Q7cL+9UsiFjHXHdBQjzb8ubyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuUzThu8mJCj3E5bnQ8/Jcb0RuUUy0VGnVAQ4uKJJ0U=;
 b=d7SdKhTj7ygBKNbcyh/aUfHmH/T5q20YiRxv9gldXJd3Yle6xol/ReDAKM6MGRkZlNHHTDjiC2scsABRrfxf04ZvFN7SvPgfROQB3j3juF/bQwiFjLwqqcpT1/viM3Xd9wHipcsbXr3Ul9IB6yH1mmFyQ/IBH/Pkpjvq6peHr1h3GtJrbAZ47XwuZw9D5q7Sk1ta966WfdV3z3d8htJNkRhRDyB+o5L3YYYwvstQINIFoGSJUn5hZLjL8ewuqXGdjVm4bPtvu2/o7H9tCRcjBqO/zcGja0IJFhZ556/RIjPvZKONS+4kAtfPWilO4B9qvnIpzu9HkWQXIk5P3dkQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuUzThu8mJCj3E5bnQ8/Jcb0RuUUy0VGnVAQ4uKJJ0U=;
 b=BSpSUJGCs6yJJ78wndnrSyvwzI98XqcUc93C1xP+9U5X1Ldi+wI9x3iXNvO36VZHa+FH3k+0znWr4ICGO/gKNI1+znau9quTp1BPX82IMpjgg/tOMzwyaxoB+sCrCn/3YZDjV4zvQZQ8ithpbbvQGz6DI8++InNQ7ap3GdAJN2k=
Received: from BL6PEPF00013E08.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:5) by CH4PR19MB8636.namprd19.prod.outlook.com
 (2603:10b6:610:222::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 9 Apr
 2025 12:49:43 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2a01:111:f403:c803::7) by BL6PEPF00013E08.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 12:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 12:49:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B986E40654A;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B784C82026C;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 3/3] ASoC: SDCA: Create DAI drivers from DisCo
Date: Wed,  9 Apr 2025 13:49:41 +0100
Message-Id: <20250409124941.1447265-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409124941.1447265-1-ckeepax@opensource.cirrus.com>
References: <20250409124941.1447265-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|CH4PR19MB8636:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 63712bb6-0ea0-4665-2c69-08dd7764fff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TrWDPVzQ9QHXxOW3ZfQXK3/spPUv5OopfEkeu63qHQTdhd6V4juL3JU06EMq?=
 =?us-ascii?Q?mEo1yPDGa0p1Z5E23xuNgsX2Dt24kQt7+OSN8bwWC03uKtzUYnnM8cGj1vuh?=
 =?us-ascii?Q?YHwYT39hwPegNFqbCxhCLHAT68y1W3yymAr2Gt3QtkX/QhZW2oSH9hHJzdlW?=
 =?us-ascii?Q?x3aCZ1o66Anh1H/mhhDxNVIF0PuZJcbkfixWqazOQPaaj3+e0tJXex9Qb/vm?=
 =?us-ascii?Q?uofDqXiTlV/sDsjB3coJk9W2uvSzuKt+8iSB0SzRJqMtWmAuhihb4DKzsJsM?=
 =?us-ascii?Q?n0a/LMtVdzD7LRkLRAMWS58/t23ryTFZQAFqZ1kzK14leRajV2yejX7vRFBD?=
 =?us-ascii?Q?qh5zOYbCkz5qzkptsOMz0ZPOjTIie9REWQI30KgTdeUtjPx9dbM0DoZIRAZl?=
 =?us-ascii?Q?OSTRu3JBjz9cJYU5AhLtNADLhNDHmM8QjBktFjgDIUDq/suEJkx5vWENb5b9?=
 =?us-ascii?Q?6cUXTH/wfQ9eX3yfmgyYP65enBwXLF0XvkXadfDFNnTaqYga12Ai+u2EkI9M?=
 =?us-ascii?Q?uTRz/H0JONJcTrswpf8n1LiwVTqQeXct/sDituVN/2oIGXZ6SN4QKm8fvZOr?=
 =?us-ascii?Q?U/zbhUrlhSovHHM4wa318CYU4OaKRZX/E2iM1meFFIkjpTC4aEW+8G1x4UNu?=
 =?us-ascii?Q?dwLtGyl8Fk3JmMr7PyrtKwwlofKSIef1ZEqoGkEzJB8GDiSSu05hSYUuCx8O?=
 =?us-ascii?Q?SkQhS39GOehlsUBqW595SpTc4qhGyv1iG8uD20TdRd/PAG4ZydvuAKhINK7/?=
 =?us-ascii?Q?vZBQfym65u3mvtZIkC9d8wZbOjAq0G7bSBDiWHvOtXW9sM4xz7u0o+ympLTX?=
 =?us-ascii?Q?uXTPmk236zbbu7rgDRjOK3r1oWoxTdOb79aBei6Il1mPpppuSVr9hSf/XS7F?=
 =?us-ascii?Q?is1ZKSoqkhG1YmWqPS93S62HUX3kfxIU+Eovbv3A8MbmCW/MMG6ic5sIKUPt?=
 =?us-ascii?Q?sl4Ejq9gwV7lY6z+N5HtWRIqHELIyyRIyg4PatFqXPioeih6X64tNlOnDGhq?=
 =?us-ascii?Q?klqkly7Y+QFwSorKf5BFih3WeHc0OPvkZvoPrbQAl/exT+xOXULyiNgc+cEW?=
 =?us-ascii?Q?JVTA458wiqyV31TkLe03E+ccfkURMDBMEFkfS/p/V4it14f9EbnA3yYOvHNW?=
 =?us-ascii?Q?hU7cMtxpMbVeoFqpbcxtPkmeKn750U+K9YvLVRs/kzS1kwmrISnEck/HBN1i?=
 =?us-ascii?Q?XaIIRBsS5mcdO49gRNZVi2ktIYLji3TqybOWPlUZjX4ewL28SMSySIzMOWoL?=
 =?us-ascii?Q?J+lqCytDWhV0fYY69s/VRbvA+bTjZ2Hy8ZTdCAF9tzBLYKyM2ib2333cs+wz?=
 =?us-ascii?Q?pfxBM6WwjnBAehfFvBht50aktvadpS+UVKuw5TpjyUmdbqzxzGtvAYD5uc1M?=
 =?us-ascii?Q?E88DJg04KcOziNGU6o3WUfaKsaemXDaLi4iWcoOgLQ/Mt5pZ827Eu/oWI1Dq?=
 =?us-ascii?Q?DislPmjZJS4Yuv3UV9tyVb6QR4v5frlMfjJgExDySTCBp23p5CymYpOKCn6h?=
 =?us-ascii?Q?nkgWf2pICQ4MLbPne13A2wsh3M9V4NzyK9oS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:49:42.8787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63712bb6-0ea0-4665-2c69-08dd7764fff2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8636
X-Authority-Analysis: v=2.4 cv=dauA3WXe c=1 sm=1 tr=0 ts=67f66cee cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=TKdQKM3kYW3HcpqIAtQA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: g2NyCyEFJuhs89ZzWPGKOXS4SHuORugb
X-Proofpoint-ORIG-GUID: g2NyCyEFJuhs89ZzWPGKOXS4SHuORugb
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the DAI
drivers required to connect an SDCA Function into an ASoC soundcard.

Create DAI driver structures and populate the supported sample rates
and sample widths into them based on the Input/Output Terminal and any
attach Clock Source entities. More complex relationships with channels
etc. will be added later as constraints as part of the DAI startup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add missing kerneldoc

 include/sound/sdca_asoc.h     |  12 +-
 include/sound/sdca_function.h |  23 ++++
 sound/soc/sdca/sdca_asoc.c    | 226 +++++++++++++++++++++++++++++++++-
 3 files changed, 255 insertions(+), 6 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d19e7e969283a..9121531f08260 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,11 +14,14 @@ struct device;
 struct sdca_function_data;
 struct snd_kcontrol_new;
 struct snd_soc_component_driver;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls);
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
@@ -26,9 +29,14 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 int sdca_asoc_populate_controls(struct device *dev,
 				struct sdca_function_data *function,
 				struct snd_kcontrol_new *kctl);
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv);
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 77ffb1f4e1ca9..be7e4a88cbed0 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -168,6 +168,20 @@ enum sdca_ot_controls {
 	SDCA_CTL_OT_NDAI_PACKETTYPE			= 0x17,
 };
 
+/**
+ * enum sdca_usage_range - Column definitions for Usage
+ */
+enum sdca_usage_range {
+	SDCA_USAGE_NUMBER				= 0,
+	SDCA_USAGE_CBN					= 1,
+	SDCA_USAGE_SAMPLE_RATE				= 2,
+	SDCA_USAGE_SAMPLE_WIDTH				= 3,
+	SDCA_USAGE_FULL_SCALE				= 4,
+	SDCA_USAGE_NOISE_FLOOR				= 5,
+	SDCA_USAGE_TAG					= 6,
+	SDCA_USAGE_NCOLS				= 7,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
@@ -246,6 +260,15 @@ enum sdca_cs_controls {
 	SDCA_CTL_CS_SAMPLERATEINDEX			= 0x10,
 };
 
+/**
+ * enum sdca_samplerateindex_range - Column definitions for SampleRateIndex
+ */
+enum sdca_samplerateindex_range {
+	SDCA_SAMPLERATEINDEX_INDEX			= 0,
+	SDCA_SAMPLERATEINDEX_RATE			= 1,
+	SDCA_SAMPLERATEINDEX_NCOLS			= 2,
+};
+
 /**
  * enum sdca_cx_controls - SDCA Controls for Clock Selector
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a54275e2c8449..ccbe58d73ef5e 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -89,6 +89,8 @@ static bool exported_control(struct sdca_control *control)
  * required number of DAPM routes for the Function.
  * @num_controls: Output integer pointer, will be filled with the
  * required number of ALSA controls for the Function.
+ * @num_dais: Output integer pointer, will be filled with the
+ * required number of ASoC DAIs for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -97,13 +99,15 @@ static bool exported_control(struct sdca_control *control)
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls)
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais)
 {
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
 	*num_controls = 0;
+	*num_dais = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -113,6 +117,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_OT:
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
+			*num_dais += !!entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -986,6 +991,205 @@ int sdca_asoc_populate_controls(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
 
+static unsigned int rate_find_mask(unsigned int rate)
+{
+	switch (rate) {
+	case 0:
+		return SNDRV_PCM_RATE_8000_768000;
+	case 5512:
+		return SNDRV_PCM_RATE_5512;
+	case 8000:
+		return SNDRV_PCM_RATE_8000;
+	case 11025:
+		return SNDRV_PCM_RATE_11025;
+	case 16000:
+		return SNDRV_PCM_RATE_16000;
+	case 22050:
+		return SNDRV_PCM_RATE_22050;
+	case 32000:
+		return SNDRV_PCM_RATE_32000;
+	case 44100:
+		return SNDRV_PCM_RATE_44100;
+	case 48000:
+		return SNDRV_PCM_RATE_48000;
+	case 64000:
+		return SNDRV_PCM_RATE_64000;
+	case 88200:
+		return SNDRV_PCM_RATE_88200;
+	case 96000:
+		return SNDRV_PCM_RATE_96000;
+	case 176400:
+		return SNDRV_PCM_RATE_176400;
+	case 192000:
+		return SNDRV_PCM_RATE_192000;
+	case 352800:
+		return SNDRV_PCM_RATE_352800;
+	case 384000:
+		return SNDRV_PCM_RATE_384000;
+	case 705600:
+		return SNDRV_PCM_RATE_705600;
+	case 768000:
+		return SNDRV_PCM_RATE_768000;
+	case 12000:
+		return SNDRV_PCM_RATE_12000;
+	case 24000:
+		return SNDRV_PCM_RATE_24000;
+	case 128000:
+		return SNDRV_PCM_RATE_128000;
+	default:
+		return 0;
+	}
+}
+
+static u64 width_find_mask(unsigned int bits)
+{
+	switch (bits) {
+	case 0:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		       SNDRV_PCM_FMTBIT_S32_LE;
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE;
+	default:
+		return 0;
+	}
+}
+
+static int populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream)
+{
+	struct sdca_control_range *range;
+	unsigned int sample_rate, sample_width;
+	unsigned int clock_rates = 0;
+	unsigned int rates = 0;
+	u64 formats = 0;
+	int sel, i;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: entity type has no usage control\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		range = selector_find_range(dev, entity->iot.clock,
+					    SDCA_CTL_CS_SAMPLERATEINDEX,
+					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		if (!range)
+			return -EINVAL;
+
+		for (i = 0; i < range->rows; i++) {
+			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+			clock_rates |= rate_find_mask(sample_rate);
+		}
+	} else {
+		clock_rates = UINT_MAX;
+	}
+
+	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		sample_rate = rate_find_mask(sample_rate);
+
+		if (sample_rate & clock_rates) {
+			rates |= sample_rate;
+
+			sample_width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+			formats |= width_find_mask(sample_width);
+		}
+	}
+
+	stream->formats = formats;
+	stream->rates = rates;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_dais - fill in an array of DAI drivers for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @dais: Array of DAI drivers to be populated.
+ * @ops: DAI ops to be attached to each of the created DAI drivers.
+ *
+ * This function populates an array of ASoC DAI drivers from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		struct snd_soc_pcm_stream *stream;
+		const char *stream_suffix;
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			stream = &dais[j].playback;
+			stream_suffix = "Playback";
+			break;
+		case SDCA_ENTITY_TYPE_OT:
+			stream = &dais[j].capture;
+			stream_suffix = "Capture";
+			break;
+		default:
+			continue;
+		}
+
+		if (!entity->iot.is_dataport)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						     entity->label, stream_suffix);
+		if (!stream->stream_name)
+			return -ENOMEM;
+		/* Channels will be further limited by constraints */
+		stream->channels_min = 1;
+		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
+
+		ret = populate_rate_format(dev, function, entity, stream);
+		if (ret)
+			return ret;
+
+		dais[j].id = i;
+		dais[j].name = entity->label;
+		dais[j].ops = ops;
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -1000,16 +1204,19 @@ EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
  */
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv)
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
 	struct snd_kcontrol_new *controls;
-	int num_widgets, num_routes, num_controls;
+	struct snd_soc_dai_driver *dais;
+	int num_widgets, num_routes, num_controls, num_dais;
 	int ret;
 
 	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
-					&num_controls);
+					&num_controls, &num_dais);
 	if (ret)
 		return ret;
 
@@ -1025,6 +1232,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!controls)
 		return -ENOMEM;
 
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
@@ -1033,6 +1244,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_dais(dev, function, dais, ops);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
@@ -1040,6 +1255,9 @@ int sdca_asoc_populate_component(struct device *dev,
 	component_drv->controls = controls;
 	component_drv->num_controls = num_controls;
 
+	*dai_drv = dais;
+	*num_dai_drv = num_dais;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
-- 
2.39.5

