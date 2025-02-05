Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4CE22C33C;
	Wed,  5 Feb 2025 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755508; cv=none; b=HMibzoA1Luv0cl8mWbEftsyVbnfuisPqU/8w2Vg0T2wLK9Uw9PnnrWX+pEzlfJJ6smddFn6djrOlD/jQ4+AR85ETOr/UeUZ4yKnz6SwcxNg91W2aiFUuDblfXPDOQQo9bwgojPsAv7YTtttfkxD7eIBBS9JiUN1grFFgMW823XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755508; c=relaxed/simple;
	bh=ge3s+YwRpcZNDMorzcLE/kax+UEyMK+2JQTvSfdNUfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/Ib9c41lLbOBGt3u5Jbuvg1JIMsU7N20nERing0Gbf7nbKmEvd9E26Bf5DqvE7r6pBokRTLkuGxr+rSVIbIyZfX/5SY2Ns+RJM2jWxwTDknjdTPcUy5r6IVHcg4SDuyWO0rJVnDvaHi09tBpaEo4tZI7jf5pGfX4sy/1sA75M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OiTDPBB9; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OiTDPBB9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r7006893;
	Wed, 5 Feb 2025 05:38:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PCi3uL6BLIc8n6BnhAkzOifHCa9vEJD52OlEUSCNVb8=; b=
	OiTDPBB98Ove0fPZavDxYa0TeQBwSusfYuNkx1ZtUz6B0L2Fuf7cLgiX8dGBlbnG
	kn8ZrEvqao1YurFe8/VvQ12E5aQj6+vR/6QBmI9Hu27cCK0NUBwhoeIsQcPTHtzg
	4J5rYsaFoXdz4BJQmKcunRgpSPRzvPUciIMtN+cNliQMZslWtCFmu8DdQUQ8HR/l
	1cn44l0jdNK4fFcevvUmYky2DSEyElgmxL4RX04XqlTe6gx+mAkgyt7hIKJAmlts
	suVrraxZwqOzOa+6BHfsxuv/eS5MdZsAzxfQMLl86HLOq1kS04sVRF0JCCxhDeoY
	DI80LQqNPO186LPqDbeDKw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:07 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7E33582026C;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 08/10] ASoC: SDCA: Add support for IT/OT Entity properties
Date: Wed, 5 Feb 2025 11:37:59 +0000
Message-ID: <20250205113801.3699902-9-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 4YgMseAcUoSOeV-s-nXQM1jzSZWIArc2
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34d9f cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=HcA3zNFcxTriq9nTmkwA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: 4YgMseAcUoSOeV-s-nXQM1jzSZWIArc2
X-Proofpoint-Spam-Reason: safe

Add support for parsing the Input/Output Terminal Entity properties from
DisCo/ACPI.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 117 +++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 127 ++++++++++++++++++++++++++++++++
 2 files changed, 244 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index bc6e12b2211da..6cb5ab79ee547 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 
 struct device;
+struct sdca_entity;
 struct sdca_function_desc;
 
 /*
@@ -671,6 +672,118 @@ struct sdca_control {
 	bool has_fixed;
 };
 
+/**
+ * enum sdca_terminal_type - SDCA Terminal Types
+ *
+ * Indicate what a Terminal Entity is used for, see in section 6.2.3
+ * of the SDCA v1.0 specification.
+ */
+enum sdca_terminal_type {
+	/* Table 77 - Data Port*/
+	SDCA_TERM_TYPE_GENERIC				= 0x101,
+	SDCA_TERM_TYPE_ULTRASOUND			= 0x180,
+	SDCA_TERM_TYPE_CAPTURE_DIRECT_PCM_MIC		= 0x181,
+	SDCA_TERM_TYPE_RAW_PDM_MIC			= 0x182,
+	SDCA_TERM_TYPE_SPEECH				= 0x183,
+	SDCA_TERM_TYPE_VOICE				= 0x184,
+	SDCA_TERM_TYPE_SECONDARY_PCM_MIC		= 0x185,
+	SDCA_TERM_TYPE_ACOUSTIC_CONTEXT_AWARENESS	= 0x186,
+	SDCA_TERM_TYPE_DTOD_STREAM			= 0x187,
+	SDCA_TERM_TYPE_REFERENCE_STREAM			= 0x188,
+	SDCA_TERM_TYPE_SENSE_CAPTURE			= 0x189,
+	SDCA_TERM_TYPE_STREAMING_MIC			= 0x18A,
+	SDCA_TERM_TYPE_OPTIMIZATION_STREAM		= 0x190,
+	SDCA_TERM_TYPE_PDM_RENDER_STREAM		= 0x191,
+	SDCA_TERM_TYPE_COMPANION_DATA			= 0x192,
+	/* Table 78 - Transducer */
+	SDCA_TERM_TYPE_MICROPHONE_TRANSDUCER		= 0x201,
+	SDCA_TERM_TYPE_MICROPHONE_ARRAY_TRANSDUCER	= 0x205,
+	SDCA_TERM_TYPE_PRIMARY_FULL_RANGE_SPEAKER	= 0x380,
+	SDCA_TERM_TYPE_PRIMARY_LFE_SPEAKER		= 0x381,
+	SDCA_TERM_TYPE_PRIMARY_TWEETER_SPEAKER		= 0x382,
+	SDCA_TERM_TYPE_PRIMARY_ULTRASOUND_SPEAKER	= 0x383,
+	SDCA_TERM_TYPE_SECONDARY_FULL_RANGE_SPEAKER	= 0x390,
+	SDCA_TERM_TYPE_SECONDARY_LFE_SPEAKER		= 0x391,
+	SDCA_TERM_TYPE_SECONDARY_TWEETER_SPEAKER	= 0x392,
+	SDCA_TERM_TYPE_SECONDARY_ULTRASOUND_SPEAKER	= 0x393,
+	SDCA_TERM_TYPE_TERTIARY_FULL_RANGE_SPEAKER	= 0x3A0,
+	SDCA_TERM_TYPE_TERTIARY_LFE_SPEAKER		= 0x3A1,
+	SDCA_TERM_TYPE_TERTIARY_TWEETER_SPEAKER		= 0x3A2,
+	SDCA_TERM_TYPE_TERTIARY_ULTRASOUND_SPEAKER	= 0x3A3,
+	SDCA_TERM_TYPE_SPDIF				= 0x605,
+	SDCA_TERM_TYPE_NDAI_DISPLAY_AUDIO		= 0x610,
+	SDCA_TERM_TYPE_NDAI_USB				= 0x612,
+	SDCA_TERM_TYPE_NDAI_BLUETOOTH_MAIN		= 0x614,
+	SDCA_TERM_TYPE_NDAI_BLUETOOTH_ALTERNATE		= 0x615,
+	SDCA_TERM_TYPE_NDAI_BLUETOOTH_BOTH		= 0x616,
+	SDCA_TERM_TYPE_LINEIN_STEREO			= 0x680,
+	SDCA_TERM_TYPE_LINEIN_FRONT_LR			= 0x681,
+	SDCA_TERM_TYPE_LINEIN_CENTER_LFE		= 0x682,
+	SDCA_TERM_TYPE_LINEIN_SURROUND_LR		= 0x683,
+	SDCA_TERM_TYPE_LINEIN_REAR_LR			= 0x684,
+	SDCA_TERM_TYPE_LINEOUT_STEREO			= 0x690,
+	SDCA_TERM_TYPE_LINEOUT_FRONT_LR			= 0x691,
+	SDCA_TERM_TYPE_LINEOUT_CENTER_LFE		= 0x692,
+	SDCA_TERM_TYPE_LINEOUT_SURROUND_LR		= 0x693,
+	SDCA_TERM_TYPE_LINEOUT_REAR_LR			= 0x694,
+	SDCA_TERM_TYPE_MIC_JACK				= 0x6A0,
+	SDCA_TERM_TYPE_STEREO_JACK			= 0x6B0,
+	SDCA_TERM_TYPE_FRONT_LR_JACK			= 0x6B1,
+	SDCA_TERM_TYPE_CENTER_LFE_JACK			= 0x6B2,
+	SDCA_TERM_TYPE_SURROUND_LR_JACK			= 0x6B3,
+	SDCA_TERM_TYPE_REAR_LR_JACK			= 0x6B4,
+	SDCA_TERM_TYPE_HEADPHONE_JACK			= 0x6C0,
+	SDCA_TERM_TYPE_HEADSET_JACK			= 0x6D0,
+	/* Table 79 - System */
+	SDCA_TERM_TYPE_SENSE_DATA			= 0x280,
+	SDCA_TERM_TYPE_PRIVACY_SIGNALING		= 0x741,
+	SDCA_TERM_TYPE_PRIVACY_INDICATORS		= 0x747,
+};
+
+/**
+ * enum sdca_connector_type - SDCA Connector Types
+ *
+ * Indicate the type of Connector that a Terminal Entity represents,
+ * see section 6.2.4 of the SDCA v1.0 specification.
+ */
+enum sdca_connector_type {
+	SDCA_CONN_TYPE_UNKNOWN				= 0x00,
+	SDCA_CONN_TYPE_2P5MM_JACK			= 0x01,
+	SDCA_CONN_TYPE_3P5MM_JACK			= 0x02,
+	SDCA_CONN_TYPE_QUARTER_INCH_JACK		= 0x03,
+	SDCA_CONN_TYPE_XLR				= 0x05,
+	SDCA_CONN_TYPE_SPDIF_OPTICAL			= 0x06,
+	SDCA_CONN_TYPE_RCA				= 0x07,
+	SDCA_CONN_TYPE_DIN				= 0x0E,
+	SDCA_CONN_TYPE_MINI_DIN				= 0x0F,
+	SDCA_CONN_TYPE_EIAJ_OPTICAL			= 0x13,
+	SDCA_CONN_TYPE_HDMI				= 0x14,
+	SDCA_CONN_TYPE_DISPLAYPORT			= 0x17,
+	SDCA_CONN_TYPE_LIGHTNING			= 0x1B,
+	SDCA_CONN_TYPE_USB_C				= 0x1E,
+	SDCA_CONN_TYPE_OTHER				= 0xFF,
+};
+
+/**
+ * struct sdca_entity_iot - information specific to Input/Output Entities
+ * @clock: Pointer to the Entity providing this Terminal's clock.
+ * @type: Usage of the Terminal Entity.
+ * @connector: Physical Connector of the Terminal Entity.
+ * @reference: Physical Jack number of the Terminal Entity.
+ * @num_transducer: Number of transducers attached to the Terminal Entity.
+ * @is_dataport: Boolean indicating if this Terminal represents a Dataport.
+ */
+struct sdca_entity_iot {
+	struct sdca_entity *clock;
+
+	enum sdca_terminal_type type;
+	enum sdca_connector_type connector;
+	int reference;
+	int num_transducer;
+
+	bool is_dataport;
+};
+
 /**
  * enum sdca_entity_type - SDCA Entity Type codes
  * @SDCA_ENTITY_TYPE_ENTITY_0: Entity 0, not actually from the
@@ -732,6 +845,7 @@ enum sdca_entity_type {
  * @controls: Dynamically allocated array of Controls.
  * @num_sources: Number of sources for the Entity.
  * @num_controls: Number of Controls for the Entity.
+ * @iot: Input/Output Terminal specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -742,6 +856,9 @@ struct sdca_entity {
 	struct sdca_control *controls;
 	int num_sources;
 	int num_controls;
+	union {
+		struct sdca_entity_iot iot;
+	};
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 4de25f4857550..8a143048a0ab9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -818,6 +818,69 @@ static int find_sdca_entity_controls(struct device *dev,
 	return 0;
 }
 
+static bool find_sdca_iot_dataport(struct sdca_entity_iot *terminal)
+{
+	switch (terminal->type) {
+	case SDCA_TERM_TYPE_GENERIC:
+	case SDCA_TERM_TYPE_ULTRASOUND:
+	case SDCA_TERM_TYPE_CAPTURE_DIRECT_PCM_MIC:
+	case SDCA_TERM_TYPE_RAW_PDM_MIC:
+	case SDCA_TERM_TYPE_SPEECH:
+	case SDCA_TERM_TYPE_VOICE:
+	case SDCA_TERM_TYPE_SECONDARY_PCM_MIC:
+	case SDCA_TERM_TYPE_ACOUSTIC_CONTEXT_AWARENESS:
+	case SDCA_TERM_TYPE_DTOD_STREAM:
+	case SDCA_TERM_TYPE_REFERENCE_STREAM:
+	case SDCA_TERM_TYPE_SENSE_CAPTURE:
+	case SDCA_TERM_TYPE_STREAMING_MIC:
+	case SDCA_TERM_TYPE_OPTIMIZATION_STREAM:
+	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
+	case SDCA_TERM_TYPE_COMPANION_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int find_sdca_entity_iot(struct device *dev,
+				struct fwnode_handle *entity_node,
+				struct sdca_entity *entity)
+{
+	struct sdca_entity_iot *terminal = &entity->iot;
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-terminal-type", &tmp);
+	if (ret) {
+		dev_err(dev, "%s: terminal type missing: %d\n", entity->label, ret);
+		return ret;
+	}
+
+	terminal->type = tmp;
+	terminal->is_dataport = find_sdca_iot_dataport(terminal);
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-terminal-reference-number", &tmp);
+	if (!ret)
+		terminal->reference = tmp;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-terminal-connector-type", &tmp);
+	if (!ret)
+		terminal->connector = tmp;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-terminal-transducer-count", &tmp);
+	if (!ret)
+		terminal->num_transducer = tmp;
+
+	dev_info(dev, "%s: terminal type %#x ref %#x conn %#x count %d\n",
+		 entity->label, terminal->type, terminal->reference,
+		 terminal->connector, terminal->num_transducer);
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -845,6 +908,17 @@ static int find_sdca_entity(struct device *dev,
 	dev_info(dev, "%s: entity %#x type %#x\n",
 		 entity->label, entity->id, entity->type);
 
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+	case SDCA_ENTITY_TYPE_OT:
+		ret = find_sdca_entity_iot(dev, entity_node, entity);
+		break;
+	default:
+		break;
+	}
+	if (ret)
+		return ret;
+
 	ret = find_sdca_entity_controls(dev, entity_node, entity);
 	if (ret)
 		return ret;
@@ -943,6 +1017,46 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 	return NULL;
 }
 
+static int find_sdca_entity_connection_iot(struct device *dev,
+					   struct sdca_function_data *function,
+					   struct fwnode_handle *entity_node,
+					   struct sdca_entity *entity)
+{
+	struct sdca_entity_iot *terminal = &entity->iot;
+	struct fwnode_handle *clock_node;
+	struct sdca_entity *clock_entity;
+	const char *clock_label;
+	int ret;
+
+	clock_node = fwnode_get_named_child_node(entity_node,
+						 "mipi-sdca-terminal-clock-connection");
+	if (!clock_node)
+		return 0;
+
+	ret = fwnode_property_read_string(clock_node, "mipi-sdca-entity-label",
+					  &clock_label);
+	if (ret) {
+		dev_err(dev, "%s: clock label missing: %d\n", entity->label, ret);
+		fwnode_handle_put(clock_node);
+		return ret;
+	}
+
+	clock_entity = find_sdca_entity_by_label(function, clock_label);
+	if (!clock_entity) {
+		dev_err(dev, "%s: failed to find clock with label %s\n",
+			entity->label, clock_label);
+		fwnode_handle_put(clock_node);
+		return -EINVAL;
+	}
+
+	terminal->clock = clock_entity;
+
+	dev_info(dev, "%s -> %s\n", clock_entity->label, entity->label);
+
+	fwnode_handle_put(clock_node);
+	return 0;
+}
+
 static int find_sdca_entity_connection(struct device *dev,
 				       struct sdca_function_data *function,
 				       struct fwnode_handle *entity_node,
@@ -953,6 +1067,19 @@ static int find_sdca_entity_connection(struct device *dev,
 	u64 pin_list;
 	int i, ret;
 
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+	case SDCA_ENTITY_TYPE_OT:
+		ret = find_sdca_entity_connection_iot(dev, function,
+						      entity_node, entity);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+	if (ret)
+		return ret;
+
 	ret = fwnode_property_read_u64(entity_node, "mipi-sdca-input-pin-list", &pin_list);
 	if (ret == -EINVAL) {
 		/* Allow missing pin lists, assume no pins. */
-- 
2.39.5

