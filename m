Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71822B584;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755505; cv=none; b=F4FumOMrZamOE35d/Ma+8lIiVZrunoSSddCblr/hOhP9NGIdLmLoj+XvGX8i84QRDLpRndgQwyyQgpHeSnaXzO/CwQ07PkXilF/HEj0fG6+Gh+kOpFTnAD3gXrjzEtebuoPQJJIqFFdyr171MR/4fLbZ9wRY1yVtDUfCeFOczwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755505; c=relaxed/simple;
	bh=Y6u3Ch+xzOYTWps+Sm+CBraf+SlaLa8RlXsSV1/aTms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVomUgZLzuYDW4bC92Bnmuy0SM/UKPj2FbegYkAPxnTWzqJK9Dp/CRmUmUQKqWAr18olLamUA7blYmFF2qWwvVGsWIwO8IM0h30Hf5F9qQ44saCqgxDtIfIL1lm1m2/cYtLKKsebGMeeUPnHGwn5NHvuV+FvcNCh7/aUNVggG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g/CXsFLr; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g/CXsFLr"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5154qIXZ016309;
	Wed, 5 Feb 2025 05:38:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PzrPi/7fJfyD0VDpvWaCjdcqlKupG1ws/zVcBAU9oHQ=; b=
	g/CXsFLrvn9y2sSo5nAVA2gJ0MBngYtoFeWWiH0jzvHsouW1JN732e4UnX2NaLIz
	/lpPcy6hOhND5iwlX+rI6LYmLBiiVPsJ5iVqohJUVEQ2/esctfrX/HMmoOiKBA/0
	hvm05eEsRYwVDkyvwoYPLwYYfmJb7/A8ulQj7qnad50m76HpuhlGBl5BQF2w6dAh
	OGOIKIXD0nQZubsUb8l6Lh6CWHTntHTzqXz0aAaXtoYHisuaA0AuVA414pNXiOca
	dpJMxWpJHlthcGqzLUibcQIXZahlsg6aZRIKWGG4GryBiaH3ulI3mQ5lXS4kVtPo
	i2jJwHQuiB2ipVyav2lP+Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4en2-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5D255822560;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 06/10] ASoC: SDCA: Add parsing for Control range structures
Date: Wed, 5 Feb 2025 11:37:57 +0000
Message-ID: <20250205113801.3699902-7-ckeepax@opensource.cirrus.com>
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
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a34d9c cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=tT6NBLIojCNG3WT5mV0A:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: bf2Tj6yiTYSq35oZZox43EH8ROgjqt2f
X-Proofpoint-GUID: bf2Tj6yiTYSq35oZZox43EH8ROgjqt2f
X-Proofpoint-Spam-Reason: safe

DisCo/SDCA contains small buffers of data that hold ranges of valid
values for the various SDCA Controls. Add support for parsing these
from ACPI.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 14 ++++++++++
 sound/soc/sdca/sdca_functions.c | 45 +++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 64043090fe76e..769ae68410647 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -612,6 +612,18 @@ enum sdca_access_layer {
 	SDCA_ACCESS_LAYER_EXTENSION			= 1 << 5,
 };
 
+/**
+ * struct sdca_control_range - SDCA Control range table
+ * @cols: Number of columns in the range table.
+ * @rows: Number of rows in the range table.
+ * @data: Array of values contained in the range table.
+ */
+struct sdca_control_range {
+	unsigned int cols;
+	unsigned int rows;
+	u32 *data;
+};
+
 /**
  * struct sdca_control - information for one SDCA Control
  * @label: Name for the Control, from SDCA Specification v1.0, section 7.1.7.
@@ -622,6 +634,7 @@ enum sdca_access_layer {
  * Control.
  * @cn_list: A bitmask showing the valid Control Numbers within this Control,
  * Control Numbers typically represent channels.
+ * @range: Buffer describing valid range of values for the Control.
  * @mode: Access mode of the Control.
  * @layers: Bitmask of access layers of the Control.
  * @deferrable: Indicates if the access to the Control can be deferred.
@@ -637,6 +650,7 @@ struct sdca_control {
 	int interrupt_position;
 	u64 cn_list;
 
+	struct sdca_control_range range;
 	enum sdca_access_mode mode;
 	u8 layers;
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index e495ccc5b4b6f..d65b413f6d2f4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -603,6 +603,44 @@ static unsigned int find_sdca_control_bits(const struct sdca_entity *entity,
 	}
 }
 
+static int find_sdca_control_range(struct device *dev,
+				   struct fwnode_handle *control_node,
+				   struct sdca_control_range *range)
+{
+	u8 *range_list;
+	int num_range;
+	u16 *limits;
+	int i;
+
+	num_range = fwnode_property_count_u8(control_node, "mipi-sdca-control-range");
+	if (!num_range || num_range == -EINVAL)
+		return 0;
+	else if (num_range < 0)
+		return num_range;
+
+	range_list = devm_kcalloc(dev, num_range, sizeof(*range_list), GFP_KERNEL);
+	if (!range_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u8_array(control_node, "mipi-sdca-control-range",
+				      range_list, num_range);
+
+	limits = (u16 *)range_list;
+
+	range->cols = le16_to_cpu(limits[0]);
+	range->rows = le16_to_cpu(limits[1]);
+	range->data = (u32 *)&limits[2];
+
+	num_range = (num_range - (2 * sizeof(*limits))) / sizeof(*range->data);
+	if (num_range != range->cols * range->rows)
+		return -EINVAL;
+
+	for (i = 0; i < num_range; i++)
+		range->data[i] = le32_to_cpu(range->data[i]);
+
+	return 0;
+}
+
 /*
  * TODO: Add support for -cn- properties, allowing different channels to have
  * different defaults etc.
@@ -678,6 +716,13 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		break;
 	}
 
+	ret = find_sdca_control_range(dev, control_node, &control->range);
+	if (ret) {
+		dev_err(dev, "%s: control %#x: range missing: %d\n",
+			entity->label, control->sel, ret);
+		return ret;
+	}
+
 	ret = fwnode_property_read_u64(control_node, "mipi-sdca-control-cn-list",
 				       &control->cn_list);
 	if (ret == -EINVAL) {
-- 
2.39.5

