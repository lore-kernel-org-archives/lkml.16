Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA725E80F;
	Wed,  9 Apr 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203006; cv=fail; b=CwkD51zdJk1nlVeg1tkA8ySC+U+aWq8tfm7hGeebHa/mFNFw1nu79aGG7j3FHNA1Hw8cOhn2LHSprO/MrMpTWCp2zB3+E/olBptSgGnfsX93uxLGJlRjt3IHkmlbefiaJU9vVArI26Dd26osoADcK94XB/WQplYxcSXgnG+mC3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203006; c=relaxed/simple;
	bh=0JSc0EbKWp/AOC4EBkOSpeSU0qcpBZatB2o41Zif1I8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5G1jsBrC6X9xRHdNiiS1tvqPkfD3L6A/jrLIsc+ho+Ej1No9hmv6fGXTzVypLHL2JENeKKig5GUouMsMbZ0LyS/rWyZNUONhakUIxpIf8cbPFMKLz06CVoQZW4tTUK1AlnQeCOX+8TpGpIpA/iYfnwPiZRiQwFwjs5Vp2v++u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HU/G9F33; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PfP6/rf9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HU/G9F33";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PfP6/rf9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5396ssj3032489;
	Wed, 9 Apr 2025 07:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=VwO/AP+oQW9Bp96NMA0kczKGoB0aomE2Yj0lmpwLYb4=; b=
	HU/G9F33k6peW4O0FYTRmFRLZT6YCV3sJuBYqgLR8fp8w+cV8aIZTnt6h7avaG53
	BR1RbrvCazg4cS4du+Z8TmnnXEPtqr92kgrom7LSaEkz6ZBgsvAhOF4Z7yfpOTPN
	4RISW3xHUQhXYmPDvPQvFOPmoI+kUr1yiOR8VKHD72RIBNnDVGY2CZK5pPqjDx6y
	0TX34IDGPIbAV2NPbXK+vD8u2HjIGmrAg3XyETMh18xiXp9df8mEMJ3EG8HKxNuf
	pxG/s07elzY7C1DUknN1TZXerwjPXcZXWDcWjcY2XBoehETEED/8DuxbfsRUd7+h
	zeo22wdyAJL7ohYr43BKGw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45wf0grmr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 07:49:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUg1FEapwD0NCt4LR09AUu/o1TiQ15NCb07VMlgTHhzwv4A1JbdG+UaWknnL56BnBT+ncs9i+rZ+WE1khjW4Gma2LllKxE0mTvtYNz7mqT9IArDq3pwKWnQvO96Y1oJ3bqIxhk22FcfD9pttuKwPuJGLs4e9jO9s4dIGTJkEo/Yc8AxWfHD/Z++MBfsBzjtn549Hwc4SYj9HwCbs11QwdTwiRBU4cfOYseRVXAv0F/y5etAawu45OKj922gFEERSTQF7EUYBEHaHFL5aABMVGvC3BW9I7t4Peih4bzZx7qzaZ2TZ763CknWUdLHIr9GoiG1lU5hC+1qfMqMZuOQH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwO/AP+oQW9Bp96NMA0kczKGoB0aomE2Yj0lmpwLYb4=;
 b=qPO4JfgvmbIhSIdU0VXpSrd1Pj3zVm5Cj4Azp8pFDSXrSLwBokS5xSB7meTlOQftD8O1b4p4zWh7rMMtJkGIyuHjcGFVbOcL7RTO1O+DMs+8wj4zKN2JNzfr1k7/B0gykS8phuo//SXw7W5Fh1ktcPWlUjEidUadiLnuCaD/60hopEona3L0MESHYB6iREybREIA20KGHASG5LeqKlFBx6QYiM6448J8UJFQMJSAZHj4kKZ9xIXZPT/hIxOCX+E99y3PN/h7qx7rOtNBkMrDvDn0RczS/Gmn1E3ZW8hhER/whZ6bM77Lpmm+rFMH/fk07FKuqBvd1aXMigwgkRg2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwO/AP+oQW9Bp96NMA0kczKGoB0aomE2Yj0lmpwLYb4=;
 b=PfP6/rf9WVMRrGeXrylnUd/oTqW980hMmH0L6iaOyrD6y8Urj4SafbvN+N0VReQgcCwR69geazWMyvSyCJnfI0yl81oJbpfQ0+hl5Rck950g5GsIud762jTQz6Qx7D1ehcKSDxUDWGV9klO2jG4rfYl/ttLPB4eBaGQal5mArAE=
Received: from DM6PR07CA0110.namprd07.prod.outlook.com (2603:10b6:5:330::26)
 by DM8PR19MB5304.namprd19.prod.outlook.com (2603:10b6:8:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.37; Wed, 9 Apr 2025 12:49:43 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::22) by DM6PR07CA0110.outlook.office365.com
 (2603:10b6:5:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 12:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 12:49:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C112140654D;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A993782026B;
	Wed,  9 Apr 2025 12:49:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 2/3] ASoC: SDCA: Create ALSA controls from DisCo
Date: Wed,  9 Apr 2025 13:49:40 +0100
Message-Id: <20250409124941.1447265-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM8PR19MB5304:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4df9a37d-baa6-4896-54a4-08dd77650006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?39yjPw3d1kLhfRS8FZFNCMt+2WbODgAJBOg2PVEXoJZg/z+ZRW/eCL2vji8C?=
 =?us-ascii?Q?mDF2TCP5FcNgsma5nYCBKHyPmroeyJ9dMfoLG5lN4IpINHXdwU8SGtL2h3z2?=
 =?us-ascii?Q?KO4kaRBRwTuxac9aIbtlIp8ORfRPFKsHUJxB9eVqUy05rp+9Pxr9tzXmVjvo?=
 =?us-ascii?Q?opl7n86N+BcGUyKuz8kiRT1BCQgUsrP0EmL43zuAjqWDtFSga2ufyiZQfBEX?=
 =?us-ascii?Q?HZiCNNoWLq5DQFwQXCsO46Qae0vwQKkUrxHpKY/cZq8yqagkbTSwC2F8T+vB?=
 =?us-ascii?Q?I5MGqOYry1QXJFOMYWDXW5qahhsb/d5Ik/qMXR8btHR0Ublen6RTKxgnUGpX?=
 =?us-ascii?Q?N0QYtMr4axZcCFzRmwpUdE1JxGDOGO4AMYcoqoXeGrbFULpI3Efa0rw+ZrSP?=
 =?us-ascii?Q?oAMXN0QV5NUN+ke0R4FlQkIKL6AHPzni05p/+F9c4ySlTLjeUeTybqknllKL?=
 =?us-ascii?Q?upL1G/0HFQIcTMgjrdSbsr3EA6uULwZNlOqFCdMZkvMT/hZbIPjQV2ecWKVn?=
 =?us-ascii?Q?tyyoGLaeKip44ZWt0N/ft64mHdBA2TIS2qU6wiTOJJjSZlaSmSuMXRBsW55w?=
 =?us-ascii?Q?FzknNJaA3OjqFAZaBmpjv44lCvFZ0dqPVZSvq+GylPBGEJluh1FmuvPZi62X?=
 =?us-ascii?Q?zwxcNXnzPbnjbOSPXfVCxXft+X+Bd6WJuopX2TVtF+0AmrtnvvGSYiF4WrIw?=
 =?us-ascii?Q?8/GSFbDcEDMjHhnR02dAGTxqCZ0ZP7si4UWWtkNAsa23uSreLBXE3IT2kf1G?=
 =?us-ascii?Q?13+NOzD31JQHntSaEIZabe/3CXZkY1fSH2Zu3TKQz2Sb4Gkk1EKTxCZdUUPI?=
 =?us-ascii?Q?ddzxmSd0oXQX0AKXZlugyaYCAjwz3lifzv6d0pvgHxxt5UUbd7h5U+Ohtknb?=
 =?us-ascii?Q?hIuEBGATz5mnj2cIwZgsaCUvL+hvFmECCOgQsY/vBTzIw7+UFkbAFAHq4tBi?=
 =?us-ascii?Q?bVhEf1nPvZ7AN/6YCAFpuzc+NDTUipxTuZxUlQY0c20j3A2BCrHXDtptvOyG?=
 =?us-ascii?Q?jKkN3BAlksAmMyracOaC89HAE/2s/gEN+nS4tmZNGjltr2DZH4Wm45slzwFC?=
 =?us-ascii?Q?dgP7Dm2X9uQCBtgT/Q0Rw9t9G0rN6f7E1EOQNN55bXXLjUmf9mm8bhckwvi4?=
 =?us-ascii?Q?npnBtaWYNsQtr0618QhHnVMG2GeaZzIwyS7S9rOk5jvGiUBcojRfgL9EYFEe?=
 =?us-ascii?Q?zDSp7mombIhRB82WtY7+mpASbKLUaSEF8YVeHJOSMP6NFFtt8s1HGob4yVbp?=
 =?us-ascii?Q?7429ZyJE0YdUH35BXYAQf95d6SGoDLD10Jdm02VFSWYrWr4Gk6B97hWRu9sh?=
 =?us-ascii?Q?QOH4zrAu1kZIiPOGpClzlhdkvBWTQeiiodW+wmcXtpLAQRkAc1qU/WGRZmhb?=
 =?us-ascii?Q?EPqYxQ+5Bg8lVg5Zm7nIC7FG1YDhUzYCnqgRcZB54XhGGR5DvhI8DYzKtMQn?=
 =?us-ascii?Q?8hZ3nZkGq3YXd75XyUNnaxojv/SYI6D0nnzUS4fuzYU9voshCxR4jFmOVJYo?=
 =?us-ascii?Q?50DTd1veT62h8n+70qSya9avdBQT9hU0PLXK?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:49:42.9639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df9a37d-baa6-4896-54a4-08dd77650006
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5304
X-Proofpoint-ORIG-GUID: BbG8aeRVmJaGN80lS9F68lVYR1Hnkuff
X-Proofpoint-GUID: BbG8aeRVmJaGN80lS9F68lVYR1Hnkuff
X-Authority-Analysis: v=2.4 cv=A71sP7WG c=1 sm=1 tr=0 ts=67f66cee cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=G0nibu_cQ754lsj7aiUA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the
ALSA controls required by an SDCA Function. This maps all User and
Application level SDCA Controls to ALSA controls. Typically controls
marked with those access levels are just volumes and mutes.

SDCA defines volume controls as an integer in 1/256ths of a dB and
then provides a mechanism to specify what values are valid (range
templates). Currently only a simple case of a single linear volume
range with a power of 2 step size is supported. This allows the code
to expose the volume control using a simple shift. This will need
expanded in the future, to support more complex ranges and probably
also some additional control types but this should be sufficient to
for a first pass.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add missing kerneldoc

 include/sound/sdca_asoc.h     |   6 +-
 include/sound/sdca_function.h |  10 ++
 sound/soc/sdca/sdca_asoc.c    | 206 +++++++++++++++++++++++++++++++++-
 3 files changed, 217 insertions(+), 5 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 414d461b6fc4a..d19e7e969283a 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,16 +12,20 @@
 
 struct device;
 struct sdca_function_data;
+struct snd_kcontrol_new;
 struct snd_soc_component_driver;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes);
+			      int *num_widgets, int *num_routes, int *num_controls);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
 			    struct snd_soc_dapm_route *routes);
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 83fedc39cf714..77ffb1f4e1ca9 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -206,6 +206,16 @@ enum sdca_fu_controls {
 	SDCA_CTL_FU_LATENCY				= 0x10,
 };
 
+/**
+ * enum sdca_volume_range - Column definitions for Q7.8dB volumes/gains
+ */
+enum sdca_volume_range {
+	SDCA_VOLUME_LINEAR_MIN				= 0,
+	SDCA_VOLUME_LINEAR_MAX				= 1,
+	SDCA_VOLUME_LINEAR_STEP				= 2,
+	SDCA_VOLUME_LINEAR_NCOLS			= 3,
+};
+
 /**
  * enum sdca_xu_controls - SDCA Controls for Extension Unit
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 1abd51cb4a803..a54275e2c8449 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -21,6 +21,7 @@
 #include <sound/soc.h>
 #include <sound/soc-component.h>
 #include <sound/soc-dapm.h>
+#include <sound/tlv.h>
 
 static struct sdca_control *selector_find_control(struct sdca_entity *entity,
 						  const int sel)
@@ -69,6 +70,16 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
 	return control_find_range(dev, entity, control, cols, rows);
 }
 
+static bool exported_control(struct sdca_control *control)
+{
+	/* No need to export control for something that only has one value */
+	if (control->has_fixed)
+		return false;
+
+	return control->layers & (SDCA_ACCESS_LAYER_USER |
+				  SDCA_ACCESS_LAYER_APPLICATION);
+}
+
 /**
  * sdca_asoc_count_component - count the various component parts
  * @function: Pointer to the Function information.
@@ -76,6 +87,8 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * required number of DAPM widgets for the Function.
  * @num_routes: Output integer pointer, will be filled with the
  * required number of DAPM routes for the Function.
+ * @num_controls: Output integer pointer, will be filled with the
+ * required number of ALSA controls for the Function.
  *
  * This function counts various things within the SDCA Function such
  * that the calling driver can allocate appropriate space before
@@ -84,12 +97,13 @@ static struct sdca_control_range *selector_find_range(struct device *dev,
  * Return: Returns zero on success, and a negative error code on failure.
  */
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes)
+			      int *num_widgets, int *num_routes, int *num_controls)
 {
-	int i;
+	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
+	*num_controls = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -111,6 +125,11 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 
 		if (entity->group)
 			(*num_routes)++;
+
+		for (j = 0; j < entity->num_controls; j++) {
+			if (exported_control(&entity->controls[j]))
+				(*num_controls)++;
+		}
 	}
 
 	return 0;
@@ -800,6 +819,173 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_dapm, "SND_SOC_SDCA");
 
+static int control_limit_kctl(struct device *dev,
+			      struct sdca_entity *entity,
+			      struct sdca_control *control,
+			      struct snd_kcontrol_new *kctl)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+	struct sdca_control_range *range;
+	int min, max, step;
+	unsigned int *tlv;
+	int shift;
+
+	if (control->type != SDCA_CTL_DATATYPE_Q7P8DB)
+		return 0;
+
+	/*
+	 * FIXME: For now only handle the simple case of a single linear range
+	 */
+	range = control_find_range(dev, entity, control, SDCA_VOLUME_LINEAR_NCOLS, 1);
+	if (!range)
+		return -EINVAL;
+
+	min = sdca_range(range, SDCA_VOLUME_LINEAR_MIN, 0);
+	max = sdca_range(range, SDCA_VOLUME_LINEAR_MAX, 0);
+	step = sdca_range(range, SDCA_VOLUME_LINEAR_STEP, 0);
+
+	min = sign_extend32(min, control->nbits - 1);
+	max = sign_extend32(max, control->nbits - 1);
+
+	/*
+	 * FIXME: Only support power of 2 step sizes as this can be supported
+	 * by a simple shift.
+	 */
+	if (hweight32(step) != 1) {
+		dev_err(dev, "%s: %s: currently unsupported step size\n",
+			entity->label, control->label);
+		return -EINVAL;
+	}
+
+	/*
+	 * The SDCA volumes are in steps of 1/256th of a dB, a step down of
+	 * 64 (shift of 6) gives 1/4dB. 1/4dB is the smallest unit that is also
+	 * representable in the ALSA TLVs which are in 1/100ths of a dB.
+	 */
+	shift = max(ffs(step) - 1, 6);
+
+	tlv = devm_kcalloc(dev, 4, sizeof(*tlv), GFP_KERNEL);
+	if (!tlv)
+		return -ENOMEM;
+
+	tlv[0] = SNDRV_CTL_TLVT_DB_SCALE;
+	tlv[1] = 2 * sizeof(*tlv);
+	tlv[2] = (min * 100) >> 8;
+	tlv[3] = ((1 << shift) * 100) >> 8;
+
+	mc->min = min >> shift;
+	mc->max = max >> shift;
+	mc->shift = shift;
+	mc->rshift = shift;
+	mc->sign_bit = 15 - shift;
+
+	kctl->access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE;
+	kctl->tlv.p = tlv;
+
+	return 0;
+}
+
+static int populate_control(struct device *dev,
+			    struct sdca_function_data *function,
+			    struct sdca_entity *entity,
+			    struct sdca_control *control,
+			    struct snd_kcontrol_new **kctl)
+{
+	const char *control_suffix = "";
+	const char *control_name;
+	struct soc_mixer_control *mc;
+	int index = 0;
+	int ret;
+	int cn;
+
+	if (!exported_control(control))
+		return 0;
+
+	if (control->type == SDCA_CTL_DATATYPE_ONEBIT)
+		control_suffix = " Switch";
+
+	control_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s%s", entity->label,
+				      control->label, control_suffix);
+	if (!control_name)
+		return -ENOMEM;
+
+	mc = devm_kmalloc(dev, sizeof(*mc), GFP_KERNEL);
+	if (!mc)
+		return -ENOMEM;
+
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		switch (index++) {
+		case 0:
+			mc->reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+					       control->sel, cn);
+			mc->rreg = mc->reg;
+			break;
+		case 1:
+			mc->rreg = SDW_SDCA_CTL(function->desc->adr, entity->id,
+						control->sel, cn);
+			break;
+		default:
+			dev_err(dev, "%s: %s: only mono/stereo controls supported\n",
+				entity->label, control->label);
+			return -EINVAL;
+		}
+	}
+
+	mc->min = 0;
+	mc->max = (0x1ull << control->nbits) - 1;
+
+	(*kctl)->name = control_name;
+	(*kctl)->private_value = (unsigned long)mc;
+	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	(*kctl)->info = snd_soc_info_volsw;
+	(*kctl)->get = snd_soc_get_volsw;
+	(*kctl)->put = snd_soc_put_volsw;
+
+	ret = control_limit_kctl(dev, entity, control, *kctl);
+	if (ret)
+		return ret;
+
+	(*kctl)++;
+
+	return 0;
+}
+
+/**
+ * sdca_asoc_populate_controls - fill in an array of ALSA controls for a Function
+ * @dev: Pointer to the device against which allocations will be done.
+ * @function: Pointer to the Function information.
+ * @route: Array of ALSA controls to be populated.
+ *
+ * This function populates an array of ALSA controls from the DisCo
+ * information for a particular SDCA Function. Typically,
+ * snd_soc_asoc_count_component will be used to allocate an
+ * appropriately sized array before calling this function.
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_populate_controls(struct device *dev,
+				struct sdca_function_data *function,
+				struct snd_kcontrol_new *kctl)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			ret = populate_control(dev, function, entity,
+					       &entity->controls[j], &kctl);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_populate_component - fill in a component driver for a Function
  * @dev: Pointer to the device against which allocations will be done.
@@ -818,10 +1004,12 @@ int sdca_asoc_populate_component(struct device *dev,
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
-	int num_widgets, num_routes;
+	struct snd_kcontrol_new *controls;
+	int num_widgets, num_routes, num_controls;
 	int ret;
 
-	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes);
+	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
+					&num_controls);
 	if (ret)
 		return ret;
 
@@ -833,14 +1021,24 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!routes)
 		return -ENOMEM;
 
+	controls = devm_kcalloc(dev, num_controls, sizeof(*controls), GFP_KERNEL);
+	if (!controls)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_controls(dev, function, controls);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
 	component_drv->num_dapm_routes = num_routes;
+	component_drv->controls = controls;
+	component_drv->num_controls = num_controls;
 
 	return 0;
 }
-- 
2.39.5

