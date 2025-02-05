Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02A22B59C;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755506; cv=none; b=CE+SZcgz6AvIMbWKk5oNe0XydDD1FxyTEz+Vx/RdLbNkuxUg7vnkAego/Lh8dLqHW1UH7V0GfoHF5UtG80c/sixMGuMeXlEJdS9ZQu6OmwIhCoZ/4seIrjIdGZe02hx/WaWwxSIX/UsBAUURfnBanbIQarPbcYbvYh0ryTc/gpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755506; c=relaxed/simple;
	bh=D9ZsqaJ/CyhqV5idzQW8jppO5/d9VW7a3ylHD3dt1A4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQ9RXj4o65wrS+n8/Drv3GadI+x/0VhIR73uelbVmDAObfqDAhDJccwhFY6jTJD9BnIItl4r1c26YmzHrJfHHbfdPryR/kt2gDlnT/4qCbLD4NTgdiQwQIhIsKEYuXuQXH21BPXJqeYchgD8I+n1uiWHZT9oUpA1h4wMRJA2Dvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AwnM/5Bf; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AwnM/5Bf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5154qIXY016309;
	Wed, 5 Feb 2025 05:38:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9BPVVWreMCHclDvPTlxbrrOUHjoh0MbXfvRdLi4EvEM=; b=
	AwnM/5BfzUgcppvvauN1PuwBttsdsIFZ59Y78DyDebnhAG1v6DM/Q/WP6+z7jKLr
	qU1CyryoLE1O5WGWiwJCgzdf2QPoexa77OEFbnQs+58qrPW5raBL6SeKClhOttMM
	buTmvpUks91NF5n5zaio2jlfIaofeRbNewDTGuYOv/8Z8Iv+70FxevpSZCDwEGaj
	L1OZ4reVk6oe5v9ID21ULp2LXXWnGLF9bLNwKIxJTOiztohP5lob6qIEYrLroyio
	dMvcOSadkanNTKWQm0d03OonKFSlHiEbLrFuEZYYwE4rjBS673Z4v+ANet2mZQnS
	Z3WcdLRQdLUzWM9qSONBgA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4en2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:03 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2A19D820270;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 02/10] ASoC: SDCA: Add code to parse Function information
Date: Wed, 5 Feb 2025 11:37:53 +0000
Message-ID: <20250205113801.3699902-3-ckeepax@opensource.cirrus.com>
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
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a34d9b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=BHhINldGtinOWOdQH2AA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: fEggh_DvK7a-WwThkpU8z--NzuDSx4Mb
X-Proofpoint-GUID: fEggh_DvK7a-WwThkpU8z--NzuDSx4Mb
X-Proofpoint-Spam-Reason: safe

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Add a helper function to parse all the Function and Entity
information from ACPI. In SDCA each device may have several Functions
and each corresponds to a specific audio capability such as say
amplifier playback or microphone capture. Each Function then contains
a number of Entities that represent individual parts of the audio
signal chain and are linked together in a graph similar to DAPM.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca.h            |   2 +
 include/sound/sdca_function.h   |  95 +++++++++++
 sound/soc/sdca/sdca_functions.c | 268 ++++++++++++++++++++++++++++++++
 3 files changed, 365 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 31b39f2297b9c..5a5d6de78d728 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -18,11 +18,13 @@ struct sdw_slave;
 
 /**
  * struct sdca_function_desc - short descriptor for an SDCA Function
+ * @node: firmware node for the Function.
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
  */
 struct sdca_function_desc {
+	struct fwnode_handle *node;
 	const char *name;
 	u32 type;
 	u8 adr;
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 1d1d3a1da52dd..3f4031d285d63 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -11,6 +11,15 @@
 
 #include <linux/bits.h>
 
+struct device;
+struct sdca_function_desc;
+
+/*
+ * The addressing space for SDCA relies on 7 bits for Entities, so a
+ * maximum of 128 Entities per function can be represented.
+ */
+#define SDCA_MAX_ENTITY_COUNT 128
+
 /**
  * enum sdca_function_type - SDCA Function Type codes
  * @SDCA_FUNCTION_TYPE_SMART_AMP: Amplifier with protection features.
@@ -90,4 +99,90 @@ enum sdca_entity0_controls {
 	SDCA_CTL_ENTITY_0_FUNCTION_BUSY			= BIT(7),
 };
 
+/**
+ * enum sdca_entity_type - SDCA Entity Type codes
+ * @SDCA_ENTITY_TYPE_IT: Input Terminal.
+ * @SDCA_ENTITY_TYPE_OT: Output Terminal.
+ * @SDCA_ENTITY_TYPE_MU: Mixer Unit.
+ * @SDCA_ENTITY_TYPE_SU: Selector Unit.
+ * @SDCA_ENTITY_TYPE_FU: Feature Unit.
+ * @SDCA_ENTITY_TYPE_XU: Extension Unit.
+ * @SDCA_ENTITY_TYPE_CS: Clock Source.
+ * @SDCA_ENTITY_TYPE_CX: Clock selector.
+ * @SDCA_ENTITY_TYPE_PDE: Power-Domain Entity.
+ * @SDCA_ENTITY_TYPE_GE: Group Entity.
+ * @SDCA_ENTITY_TYPE_SPE: Security & Privacy Entity.
+ * @SDCA_ENTITY_TYPE_CRU: Channel Remapping Unit.
+ * @SDCA_ENTITY_TYPE_UDMPU: Up-Down Mixer Processing Unit.
+ * @SDCA_ENTITY_TYPE_MFPU: Multi-Function Processing Unit.
+ * @SDCA_ENTITY_TYPE_SMPU: Smart Microphone Processing Unit.
+ * @SDCA_ENTITY_TYPE_SAPU: Smart Amp Processing Unit.
+ * @SDCA_ENTITY_TYPE_PPU: Posture Processing Unit.
+ * @SDCA_ENTITY_TYPE_TG: Tone Generator.
+ * @SDCA_ENTITY_TYPE_HIDE: Human Interface Device Entity.
+ *
+ * SDCA Entity Types from SDCA specification v1.0 Section 6.1.2
+ * all Entity Types not described are reserved.
+ */
+enum sdca_entity_type {
+	SDCA_ENTITY_TYPE_IT				= 0x02,
+	SDCA_ENTITY_TYPE_OT				= 0x03,
+	SDCA_ENTITY_TYPE_MU				= 0x05,
+	SDCA_ENTITY_TYPE_SU				= 0x06,
+	SDCA_ENTITY_TYPE_FU				= 0x07,
+	SDCA_ENTITY_TYPE_XU				= 0x0A,
+	SDCA_ENTITY_TYPE_CS				= 0x0B,
+	SDCA_ENTITY_TYPE_CX				= 0x0C,
+	SDCA_ENTITY_TYPE_PDE				= 0x11,
+	SDCA_ENTITY_TYPE_GE				= 0x12,
+	SDCA_ENTITY_TYPE_SPE				= 0x13,
+	SDCA_ENTITY_TYPE_CRU				= 0x20,
+	SDCA_ENTITY_TYPE_UDMPU				= 0x21,
+	SDCA_ENTITY_TYPE_MFPU				= 0x22,
+	SDCA_ENTITY_TYPE_SMPU				= 0x23,
+	SDCA_ENTITY_TYPE_SAPU				= 0x24,
+	SDCA_ENTITY_TYPE_PPU				= 0x25,
+	SDCA_ENTITY_TYPE_TG				= 0x30,
+	SDCA_ENTITY_TYPE_HIDE				= 0x31,
+};
+
+/**
+ * struct sdca_entity - information for one SDCA Entity
+ * @label: String such as "OT 12".
+ * @id: Identifier used for addressing.
+ * @type: Type code for the Entity.
+ * @sources: Dynamically allocated array pointing to each input Entity
+ * connected to this Entity.
+ * @num_sources: Number of sources for the Entity.
+ */
+struct sdca_entity {
+	const char *label;
+	int id;
+	enum sdca_entity_type type;
+
+	struct sdca_entity **sources;
+	int num_sources;
+};
+
+/**
+ * struct sdca_function_data - top-level information for one SDCA function
+ * @desc: Pointer to short descriptor from initial parsing.
+ * @entities: Dynamically allocated array of Entities.
+ * @num_entities: Number of Entities reported in this Function.
+ * @busy_max_delay: Maximum Function busy delay in microseconds, before an
+ * error should be reported.
+ */
+struct sdca_function_data {
+	struct sdca_function_desc *desc;
+
+	struct sdca_entity *entities;
+	int num_entities;
+
+	unsigned int busy_max_delay;
+};
+
+int sdca_parse_function(struct device *dev,
+			struct sdca_function_desc *desc,
+			struct sdca_function_data *function);
+
 #endif
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 00d6d044c816b..72b82280918d7 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -18,6 +18,11 @@
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
+/*
+ * Should be long enough to encompass all the MIPI DisCo properties.
+ */
+#define SDCA_PROPERTY_LENGTH 64
+
 static int patch_sdca_function_type(u32 interface_revision, u32 *function_type)
 {
 	/*
@@ -150,6 +155,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	sdca_data->function[function_index].adr = addr;
 	sdca_data->function[function_index].type = function_type;
 	sdca_data->function[function_index].name = function_name;
+	sdca_data->function[function_index].node = function_node;
 	sdca_data->num_functions++;
 
 	return 0;
@@ -179,5 +185,267 @@ void sdca_lookup_functions(struct sdw_slave *slave)
 }
 EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
 
+static int find_sdca_entity(struct device *dev,
+			    struct fwnode_handle *function_node,
+			    struct fwnode_handle *entity_node,
+			    struct sdca_entity *entity)
+{
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_string(entity_node, "mipi-sdca-entity-label",
+					  &entity->label);
+	if (ret) {
+		dev_err(dev, "%pfwP: entity %#x: label missing: %d\n",
+			function_node, entity->id, ret);
+		return ret;
+	}
+
+	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-entity-type", &tmp);
+	if (ret) {
+		dev_err(dev, "%s: type missing: %d\n", entity->label, ret);
+		return ret;
+	}
+
+	entity->type = tmp;
+
+	dev_info(dev, "%s: entity %#x type %#x\n",
+		 entity->label, entity->id, entity->type);
+
+	return 0;
+}
+
+static int find_sdca_entities(struct device *dev,
+			      struct fwnode_handle *function_node,
+			      struct sdca_function_data *function)
+{
+	struct sdca_entity *entities;
+	u32 *entity_list;
+	int num_entities;
+	int i, ret;
+
+	num_entities = fwnode_property_count_u32(function_node,
+						 "mipi-sdca-entity-id-list");
+	if (num_entities <= 0) {
+		dev_err(dev, "%pfwP: entity id list missing: %d\n",
+			function_node, num_entities);
+		return -EINVAL;
+	} else if (num_entities > SDCA_MAX_ENTITY_COUNT) {
+		dev_err(dev, "%pfwP: maximum number of entities exceeded\n",
+			function_node);
+		return -EINVAL;
+	}
+
+	entities = devm_kcalloc(dev, num_entities, sizeof(*entities), GFP_KERNEL);
+	if (!entities)
+		return -ENOMEM;
+
+	entity_list = kcalloc(num_entities, sizeof(*entity_list), GFP_KERNEL);
+	if (!entity_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(function_node, "mipi-sdca-entity-id-list",
+				       entity_list, num_entities);
+
+	for (i = 0; i < num_entities; i++)
+		entities[i].id = entity_list[i];
+
+	kfree(entity_list);
+
+	/* now read subproperties */
+	for (i = 0; i < num_entities; i++) {
+		char entity_property[SDCA_PROPERTY_LENGTH];
+		struct fwnode_handle *entity_node;
+
+		/* DisCo uses upper-case for hex numbers */
+		snprintf(entity_property, sizeof(entity_property),
+			 "mipi-sdca-entity-id-0x%X-subproperties", entities[i].id);
+
+		entity_node = fwnode_get_named_child_node(function_node, entity_property);
+		if (!entity_node) {
+			dev_err(dev, "%pfwP: entity node %s not found\n",
+				function_node, entity_property);
+			return -EINVAL;
+		}
+
+		ret = find_sdca_entity(dev, function_node, entity_node, &entities[i]);
+		fwnode_handle_put(entity_node);
+		if (ret)
+			return ret;
+	}
+
+	function->num_entities = num_entities;
+	function->entities = entities;
+
+	return 0;
+}
+
+static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *function,
+						     const char *entity_label)
+{
+	int i;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		if (!strcmp(entity->label, entity_label))
+			return entity;
+	}
+
+	return NULL;
+}
+
+static int find_sdca_entity_connection(struct device *dev,
+				       struct sdca_function_data *function,
+				       struct fwnode_handle *entity_node,
+				       struct sdca_entity *entity)
+{
+	struct sdca_entity **pins;
+	int num_pins, pin;
+	u64 pin_list;
+	int i, ret;
+
+	ret = fwnode_property_read_u64(entity_node, "mipi-sdca-input-pin-list", &pin_list);
+	if (ret == -EINVAL) {
+		/* Allow missing pin lists, assume no pins. */
+		dev_warn(dev, "%s: missing pin list\n", entity->label);
+		return 0;
+	} else if (ret) {
+		dev_err(dev, "%s: failed to read pin list: %d\n", entity->label, ret);
+		return ret;
+	} else if (pin_list & BIT(0)) {
+		/*
+		 * Each bit set in the pin-list refers to an entity_id in this
+		 * Function. Entity 0 is an illegal connection since it is used
+		 * for Function-level configurations.
+		 */
+		dev_err(dev, "%s: pin 0 used as input\n", entity->label);
+		return -EINVAL;
+	} else if (!pin_list) {
+		return 0;
+	}
+
+	num_pins = hweight64(pin_list);
+	pins = devm_kcalloc(dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_set_bit(pin, (unsigned long *)&pin_list, BITS_PER_TYPE(pin_list)) {
+		char pin_property[SDCA_PROPERTY_LENGTH];
+		struct fwnode_handle *connected_node;
+		struct sdca_entity *connected_entity;
+		const char *connected_label;
+
+		snprintf(pin_property, sizeof(pin_property), "mipi-sdca-input-pin-%d", pin);
+
+		connected_node = fwnode_get_named_child_node(entity_node, pin_property);
+		if (!connected_node) {
+			dev_err(dev, "%s: pin node %s not found\n",
+				entity->label, pin_property);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_string(connected_node, "mipi-sdca-entity-label",
+						  &connected_label);
+		if (ret) {
+			dev_err(dev, "%s: pin %d label missing: %d\n",
+				entity->label, pin, ret);
+			fwnode_handle_put(connected_node);
+			return ret;
+		}
+
+		connected_entity = find_sdca_entity_by_label(function, connected_label);
+		if (!connected_entity) {
+			dev_err(dev, "%s: failed to find entity with label %s\n",
+				entity->label, connected_label);
+			fwnode_handle_put(connected_node);
+			return -EINVAL;
+		}
+
+		pins[i] = connected_entity;
+
+		dev_info(dev, "%s -> %s\n", connected_entity->label, entity->label);
+
+		i++;
+		fwnode_handle_put(connected_node);
+	}
+
+	entity->num_sources = num_pins;
+	entity->sources = pins;
+
+	return 0;
+}
+
+static int find_sdca_connections(struct device *dev,
+				 struct fwnode_handle *function_node,
+				 struct sdca_function_data *function)
+{
+	int i;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		char entity_property[SDCA_PROPERTY_LENGTH];
+		struct fwnode_handle *entity_node;
+		int ret;
+
+		/* DisCo uses upper-case for hex numbers */
+		snprintf(entity_property, sizeof(entity_property),
+			 "mipi-sdca-entity-id-0x%X-subproperties",
+			 entity->id);
+
+		entity_node = fwnode_get_named_child_node(function_node, entity_property);
+		if (!entity_node) {
+			dev_err(dev, "%pfwP: entity node %s not found\n",
+				function_node, entity_property);
+			return -EINVAL;
+		}
+
+		ret = find_sdca_entity_connection(dev, function, entity_node, entity);
+		fwnode_handle_put(entity_node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * sdca_parse_function - parse ACPI DisCo for a Function
+ * @dev: Pointer to device against which function data will be allocated.
+ * @function_desc: Pointer to the Function short descriptor.
+ * @function: Pointer to the Function information, to be populated.
+ *
+ * Return: Returns 0 for success.
+ */
+int sdca_parse_function(struct device *dev,
+			struct sdca_function_desc *function_desc,
+			struct sdca_function_data *function)
+{
+	u32 tmp;
+	int ret;
+
+	function->desc = function_desc;
+
+	ret = fwnode_property_read_u32(function_desc->node,
+				       "mipi-sdca-function-busy-max-delay", &tmp);
+	if (!ret)
+		function->busy_max_delay = tmp;
+
+	dev_info(dev, "%pfwP: name %s delay %dus\n", function->desc->node,
+		 function->desc->name, function->busy_max_delay);
+
+	ret = find_sdca_entities(dev, function_desc->node, function);
+	if (ret)
+		return ret;
+
+	ret = find_sdca_connections(dev, function_desc->node, function);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SDCA library");
-- 
2.39.5

