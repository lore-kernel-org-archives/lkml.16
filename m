Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F11519BB;
	Wed,  5 Feb 2025 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755505; cv=none; b=mN4MfbrqQRltqoBf6Zvkmo59JmzG2ctTmHVBye/wdQb8BRfLNDQGIUMX8WgWuUGCBlbh+n8F+xq4ufZUZqO5kGLsGAaufe7de1upZDjeaGcg7ExqR4ZY2uEqOJasxiYcF+i1ru8luntWeRASDRkWclIiVtcAtTb8iIhHKDwOisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755505; c=relaxed/simple;
	bh=XuF/7X8/I+0rADXhvx1D8rhWij0sgCrEtLFAduPizLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5eh68+Y/f2M1+oo+GZj9poEX/Ql/t2f+UjfCM90gaQDPB8UhnHa9lJKRw4C+gMAWqO8yHhoDgH6PktEjSCfcTCqmIKUoCb36aSdjwT0XFksPiek1PHYlxI4HiYhKDw5KhIBNvwYDVDPI1RpzIOOQrfENY0+uCO8rlDJ3Pqdf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PmdJsPjo; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PmdJsPjo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r3006893;
	Wed, 5 Feb 2025 05:38:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yjLnCpwm7uj+3BUizCL5I7HA8+8e8ZnxSc10Qinm9ZA=; b=
	PmdJsPjodUJsR8zJAkrhGiMm4zVL+l19+n2ouyIqE4DwqkgL/qK0AH3pKewfGX0n
	9v21MsYITu0YCvDgOCfXICW7UeuH3Jb3okxsuCsf4Xuv1O1QNVQZBS+7Ri1ViG53
	VWT85pXCZyJgpLolw8RcMSnvNoixeFeHbPtuSVCiRxkvuWmVPK2YvYiPCJHy9GvF
	a/aphJ9QLyES1llwp9P3fyvDpDRbjMomDdOweJg+PBtH0nw4y+U4Su0c8TSUW3Bm
	jsRIEBQ7fcTqa7AaBpYSNnr8DQXII9168rZXS16o54ko+Ehr1xXJxP2ZwgiYzG4X
	aIoVBe8YMwvbG+6ctHRj0A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 24CEB82026C;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 01/10] ASoC: SDCA: Minor formatting and naming tweaks
Date: Wed, 5 Feb 2025 11:37:52 +0000
Message-ID: <20250205113801.3699902-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
References: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3hXKbRvYmKV6Tp33bx3i7_GQvJbCNQVx
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34d9b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=trZCPc3GJbR5aSaUwYQA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: 3hXKbRvYmKV6Tp33bx3i7_GQvJbCNQVx
X-Proofpoint-Spam-Reason: safe

Fix up some variable/struct member naming, add some missing kerneldoc
and fix some minor formatting/whitespace issues.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca.h            | 20 +++++------
 include/sound/sdca_function.h   | 64 +++++++++++++++++++++------------
 sound/soc/sdca/sdca_device.c    |  3 +-
 sound/soc/sdca/sdca_functions.c | 26 ++++++++++----
 4 files changed, 71 insertions(+), 42 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 973252d0adac1..31b39f2297b9c 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -17,10 +17,10 @@ struct sdw_slave;
 #define SDCA_MAX_FUNCTION_COUNT 8
 
 /**
- * sdca_device_desc - short descriptor for an SDCA Function
- * @adr: ACPI address (used for SDCA register access)
- * @type: Function topology type
- * @name: human-readable string
+ * struct sdca_function_desc - short descriptor for an SDCA Function
+ * @name: Human-readable string.
+ * @type: Function topology type.
+ * @adr: ACPI address (used for SDCA register access).
  */
 struct sdca_function_desc {
 	const char *name;
@@ -29,17 +29,17 @@ struct sdca_function_desc {
 };
 
 /**
- * sdca_device_data - structure containing all SDCA related information
- * @sdca_interface_revision: value read from _DSD property, mainly to check
- * for changes between silicon versions
- * @num_functions: total number of supported SDCA functions. Invalid/unsupported
+ * struct sdca_device_data - structure containing all SDCA related information
+ * @interface_revision: Value read from _DSD property, mainly to check
+ * for changes between silicon versions.
+ * @num_functions: Total number of supported SDCA functions. Invalid/unsupported
  * functions will be skipped.
- * @sdca_func: array of function descriptors
+ * @function: Array of function descriptors.
  */
 struct sdca_device_data {
 	u32 interface_revision;
 	int num_functions;
-	struct sdca_function_desc sdca_func[SDCA_MAX_FUNCTION_COUNT];
+	struct sdca_function_desc function[SDCA_MAX_FUNCTION_COUNT];
 };
 
 enum sdca_quirk {
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index c051c17903e83..1d1d3a1da52dd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -11,39 +11,57 @@
 
 #include <linux/bits.h>
 
-/*
+/**
+ * enum sdca_function_type - SDCA Function Type codes
+ * @SDCA_FUNCTION_TYPE_SMART_AMP: Amplifier with protection features.
+ * @SDCA_FUNCTION_TYPE_SIMPLE_AMP: Subset of SmartAmp.
+ * @SDCA_FUNCTION_TYPE_SMART_MIC: Smart microphone with acoustic triggers.
+ * @SDCA_FUNCTION_TYPE_SIMPLE_MIC: Subset of SmartMic.
+ * @SDCA_FUNCTION_TYPE_SPEAKER_MIC: Combination of SmartMic and SmartAmp.
+ * @SDCA_FUNCTION_TYPE_UAJ: 3.5mm Universal Audio jack.
+ * @SDCA_FUNCTION_TYPE_RJ: Retaskable jack.
+ * @SDCA_FUNCTION_TYPE_SIMPLE_JACK: Subset of UAJ.
+ * @SDCA_FUNCTION_TYPE_HID: Human Interface Device, for e.g. buttons.
+ * @SDCA_FUNCTION_TYPE_IMP_DEF: Implementation-defined function.
+ *
  * SDCA Function Types from SDCA specification v1.0a Section 5.1.2
- * all Function types not described are reserved
+ * all Function types not described are reserved.
+ *
  * Note that SIMPLE_AMP, SIMPLE_MIC and SIMPLE_JACK Function Types
  * are NOT defined in SDCA 1.0a, but they were defined in earlier
  * drafts and are planned for 1.1.
  */
-
 enum sdca_function_type {
-	SDCA_FUNCTION_TYPE_SMART_AMP	= 0x01,	/* Amplifier with protection features */
-	SDCA_FUNCTION_TYPE_SIMPLE_AMP	= 0x02,	/* subset of SmartAmp */
-	SDCA_FUNCTION_TYPE_SMART_MIC	= 0x03,	/* Smart microphone with acoustic triggers */
-	SDCA_FUNCTION_TYPE_SIMPLE_MIC	= 0x04,	/* subset of SmartMic */
-	SDCA_FUNCTION_TYPE_SPEAKER_MIC	= 0x05,	/* Combination of SmartMic and SmartAmp */
-	SDCA_FUNCTION_TYPE_UAJ		= 0x06,	/* 3.5mm Universal Audio jack */
-	SDCA_FUNCTION_TYPE_RJ		= 0x07,	/* Retaskable jack */
-	SDCA_FUNCTION_TYPE_SIMPLE_JACK	= 0x08,	/* Subset of UAJ */
-	SDCA_FUNCTION_TYPE_HID		= 0x0A,	/* Human Interface Device, for e.g. buttons */
-	SDCA_FUNCTION_TYPE_IMP_DEF	= 0x1F,	/* Implementation-defined function */
+	SDCA_FUNCTION_TYPE_SMART_AMP			= 0x01,
+	SDCA_FUNCTION_TYPE_SIMPLE_AMP			= 0x02,
+	SDCA_FUNCTION_TYPE_SMART_MIC			= 0x03,
+	SDCA_FUNCTION_TYPE_SIMPLE_MIC			= 0x04,
+	SDCA_FUNCTION_TYPE_SPEAKER_MIC			= 0x05,
+	SDCA_FUNCTION_TYPE_UAJ				= 0x06,
+	SDCA_FUNCTION_TYPE_RJ				= 0x07,
+	SDCA_FUNCTION_TYPE_SIMPLE_JACK			= 0x08,
+	SDCA_FUNCTION_TYPE_HID				= 0x0A,
+	SDCA_FUNCTION_TYPE_IMP_DEF			= 0x1F,
 };
 
 /* Human-readable names used for kernel logs and Function device registration/bind */
-#define	SDCA_FUNCTION_TYPE_SMART_AMP_NAME	"SmartAmp"
-#define	SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME	"SimpleAmp"
-#define	SDCA_FUNCTION_TYPE_SMART_MIC_NAME	"SmartMic"
-#define	SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME	"SimpleMic"
-#define	SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME	"SpeakerMic"
-#define	SDCA_FUNCTION_TYPE_UAJ_NAME		"UAJ"
-#define	SDCA_FUNCTION_TYPE_RJ_NAME		"RJ"
-#define	SDCA_FUNCTION_TYPE_SIMPLE_NAME		"SimpleJack"
-#define	SDCA_FUNCTION_TYPE_HID_NAME		"HID"
-#define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME		"ImplementationDefined"
+#define	SDCA_FUNCTION_TYPE_SMART_AMP_NAME		"SmartAmp"
+#define	SDCA_FUNCTION_TYPE_SIMPLE_AMP_NAME		"SimpleAmp"
+#define	SDCA_FUNCTION_TYPE_SMART_MIC_NAME		"SmartMic"
+#define	SDCA_FUNCTION_TYPE_SIMPLE_MIC_NAME		"SimpleMic"
+#define	SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME		"SpeakerMic"
+#define	SDCA_FUNCTION_TYPE_UAJ_NAME			"UAJ"
+#define	SDCA_FUNCTION_TYPE_RJ_NAME			"RJ"
+#define	SDCA_FUNCTION_TYPE_SIMPLE_NAME			"SimpleJack"
+#define	SDCA_FUNCTION_TYPE_HID_NAME			"HID"
+#define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME			"ImplementationDefined"
 
+/**
+ * enum sdca_entity0_controls - SDCA Controls for Entity 0
+ *
+ * Control Selectors for Entity 0 from SDCA specification v1.0 Section
+ * 6.7.1.1.
+ */
 enum sdca_entity0_controls {
 	SDCA_CTL_ENTITY_0_COMMIT_GROUP_MASK		= 0x01,
 	SDCA_CTL_ENTITY_0_FUNCTION_SDCA_VERSION		= 0x04,
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index b6399b773986c..0244cdcdd109a 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -48,8 +48,7 @@ static bool sdca_device_quirk_rt712_vb(struct sdw_slave *slave)
 		return false;
 
 	for (i = 0; i < slave->sdca_data.num_functions; i++) {
-		if (slave->sdca_data.sdca_func[i].type ==
-		    SDCA_FUNCTION_TYPE_SMART_MIC)
+		if (slave->sdca_data.function[i].type == SDCA_FUNCTION_TYPE_SMART_MIC)
 			return true;
 	}
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 38071bc838b95..00d6d044c816b 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/module.h>
 #include <linux/property.h>
 #include <linux/soundwire/sdw.h>
@@ -21,7 +22,7 @@ static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
 	 * Unfortunately early SDCA specifications used different indices for Functions,
-	 * for backwards compatibility we have to reorder the values found
+	 * for backwards compatibility we have to reorder the values found.
 	 */
 	if (interface_revision < 0x0801) {
 		switch (*function_type) {
@@ -85,7 +86,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	struct fwnode_handle *control5; /* used to identify function type */
 	const char *function_name;
 	u32 function_type;
-	int func_index;
+	int function_index;
 	u64 addr;
 	int ret;
 
@@ -145,24 +146,35 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 		 function_name, function_type, addr);
 
 	/* store results */
-	func_index = sdca_data->num_functions;
-	sdca_data->sdca_func[func_index].adr = addr;
-	sdca_data->sdca_func[func_index].type = function_type;
-	sdca_data->sdca_func[func_index].name = function_name;
+	function_index = sdca_data->num_functions;
+	sdca_data->function[function_index].adr = addr;
+	sdca_data->function[function_index].type = function_type;
+	sdca_data->function[function_index].name = function_name;
 	sdca_data->num_functions++;
 
 	return 0;
 }
 
+/**
+ * sdca_lookup_functions - Parse sdca_device_desc for each Function
+ * @slave: SoundWire slave device to be processed.
+ *
+ * Iterate through the available SDCA Functions and fill in a short
+ * descriptor (struct sdca_function_desc) for each function, this
+ * information is stored along with the SoundWire slave device and
+ * used for adding drivers and quirks before the devices have fully
+ * probed.
+ */
 void sdca_lookup_functions(struct sdw_slave *slave)
 {
 	struct device *dev = &slave->dev;
 	struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
 
 	if (!adev) {
-		dev_info(dev, "No matching ACPI device found, ignoring peripheral\n");
+		dev_info(dev, "no matching ACPI device found, ignoring peripheral\n");
 		return;
 	}
+
 	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
-- 
2.39.5

