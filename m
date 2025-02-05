Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94422ACD4;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755505; cv=none; b=Y5R78CZoJ5x43+D3J6vOwMnyhJvMXtOa/IImvbKD5o4B5SrjOSoM2y9rSga+3cLNfsDfTgf0f84k02ee1deAXhfahxzQeGq+0vWcx28poJfwnnmbAQA3zObWCQSI+WfifsSChgBdmNZu1e8QUG1oIIdS9onFdDX0huEsbO8qwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755505; c=relaxed/simple;
	bh=x8e+HoGnat6+W/DLeXfnHglblJH0+8keaKHsTCynRfI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etNgnkyprygvNo3WqKdRUNIywUTwK/a5TRyQrEas5HtT+jyW0alIrOKjn/aNUhfjPqNUh10EVTt98fvvgPFuAK4CY2lPBl+GT4lIqccFJ6lLodGy/J4Dso7jTIE4lvcuSqPvlCbihicj9NlKhR2k0l++1h57ALeSZ5KhoBGp7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=onP6uFBR; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="onP6uFBR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r4006893;
	Wed, 5 Feb 2025 05:38:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oqfSXOVqTiTNbjsvoIRvdMQp6Ka1XmoDmoctzzn+Cbk=; b=
	onP6uFBR15YvyND6bI6jiwCY/1KDPjUck3TLqFRh+To/s+0BTOAT9DBES+/rex9P
	nJZ+kSuNZsAq5DkuMoA02NVzSPLw3OhE6pMRT+KBw/LrLOJX9UfTmf+cBmSUvgoQ
	bIdbZ4G/uLY0hM9ozlNcxv7LhsnJTDURqo8f3U6WU22dxlifdui12vvSxWu2fOvO
	Xi8dwlbwz0jbrZ4le0Ak8fEVU1G0v6NaPBd63SvHiDAvOvMIu0QpAOiECcKOzHVL
	BnqsNeBpgRVLDNXSvPgm3R2g89Mr11bo90s+fi5pnmmfdSU+zQt2dGJOiBNJRcUA
	GT8tprCrHSyuo0sfrzYmfw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E7C082255D;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 03/10] ASoC: SDCA: Parse initialization write table
Date: Wed, 5 Feb 2025 11:37:54 +0000
Message-ID: <20250205113801.3699902-4-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: vZ9XiqzRL3zNq8ESWE_UsVxY540uE9F0
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34d9c cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=iic-suj4MumLdMF320AA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: vZ9XiqzRL3zNq8ESWE_UsVxY540uE9F0
X-Proofpoint-Spam-Reason: safe

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Each SDCA Function may contain a table of register writes that should be
written out before the Function is used. Add code to parse this table
from the DisCo tables in ACPI.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 20 +++++++++++
 sound/soc/sdca/sdca_functions.c | 61 +++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 3f4031d285d63..47fc1da8e4f33 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -10,6 +10,7 @@
 #define __SDCA_FUNCTION_H__
 
 #include <linux/bits.h>
+#include <linux/types.h>
 
 struct device;
 struct sdca_function_desc;
@@ -20,6 +21,11 @@ struct sdca_function_desc;
  */
 #define SDCA_MAX_ENTITY_COUNT 128
 
+/*
+ * Sanity check on number of initialization writes, can be expanded if needed.
+ */
+#define SDCA_MAX_INIT_COUNT 2048
+
 /**
  * enum sdca_function_type - SDCA Function Type codes
  * @SDCA_FUNCTION_TYPE_SMART_AMP: Amplifier with protection features.
@@ -65,6 +71,16 @@ enum sdca_function_type {
 #define	SDCA_FUNCTION_TYPE_HID_NAME			"HID"
 #define	SDCA_FUNCTION_TYPE_IMP_DEF_NAME			"ImplementationDefined"
 
+/**
+ * struct sdca_init_write - a single initialization write
+ * @addr: Register address to be written
+ * @val: Single byte value to be written
+ */
+struct sdca_init_write {
+	u32 addr;
+	u8 val;
+};
+
 /**
  * enum sdca_entity0_controls - SDCA Controls for Entity 0
  *
@@ -167,7 +183,9 @@ struct sdca_entity {
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
+ * @init_table: Pointer to a table of initialization writes.
  * @entities: Dynamically allocated array of Entities.
+ * @num_init_table: Number of initialization writes.
  * @num_entities: Number of Entities reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
@@ -175,7 +193,9 @@ struct sdca_entity {
 struct sdca_function_data {
 	struct sdca_function_desc *desc;
 
+	struct sdca_init_write *init_table;
 	struct sdca_entity *entities;
+	int num_init_table;
 	int num_entities;
 
 	unsigned int busy_max_delay;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 72b82280918d7..f914ec3f86c9a 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -9,6 +9,7 @@
 #define dev_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/acpi.h>
+#include <linux/byteorder/generic.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/module.h>
@@ -185,6 +186,62 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
 
+static int find_sdca_init_table(struct device *dev,
+				struct fwnode_handle *function_node,
+				struct sdca_function_data *function)
+{
+	struct sdca_init_write *init_write;
+	int write_size = sizeof(init_write->addr) + sizeof(init_write->val);
+	u8 *init_list, *init_iter;
+	int num_init_writes;
+
+	num_init_writes = fwnode_property_count_u8(function_node,
+						   "mipi-sdca-function-initialization-table");
+	if (!num_init_writes || num_init_writes == -EINVAL) {
+		return 0;
+	} else if (num_init_writes < 0) {
+		dev_err(dev, "%pfwP: failed to read initialization table: %d\n",
+			function_node, num_init_writes);
+		return num_init_writes;
+	} else if (num_init_writes % write_size != 0) {
+		dev_err(dev, "%pfwP: init table size invalid\n", function_node);
+		return -EINVAL;
+	} else if (num_init_writes > SDCA_MAX_INIT_COUNT) {
+		dev_err(dev, "%pfwP: maximum init table size exceeded\n", function_node);
+		return -EINVAL;
+	}
+
+	init_write = devm_kcalloc(dev, num_init_writes / write_size,
+				  sizeof(*init_write), GFP_KERNEL);
+	if (!init_write)
+		return -ENOMEM;
+
+	init_list = kcalloc(num_init_writes, sizeof(*init_list), GFP_KERNEL);
+	if (!init_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u8_array(function_node,
+				      "mipi-sdca-function-initialization-table",
+				      init_list, num_init_writes);
+
+	function->num_init_table = num_init_writes;
+	function->init_table = init_write;
+
+	for (init_iter = init_list; init_iter < init_list + num_init_writes;) {
+		u32 *addr = (u32 *)init_iter;
+
+		init_write->addr = le32_to_cpu(*addr);
+		init_iter += sizeof(init_write->addr);
+
+		init_write->val = *init_iter;
+		init_iter += sizeof(init_write->val);
+	}
+
+	kfree(init_list);
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -435,6 +492,10 @@ int sdca_parse_function(struct device *dev,
 	dev_info(dev, "%pfwP: name %s delay %dus\n", function->desc->node,
 		 function->desc->name, function->busy_max_delay);
 
+	ret = find_sdca_init_table(dev, function_desc->node, function);
+	if (ret)
+		return ret;
+
 	ret = find_sdca_entities(dev, function_desc->node, function);
 	if (ret)
 		return ret;
-- 
2.39.5

