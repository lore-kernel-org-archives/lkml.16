Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73BC22B8C3;
	Wed,  5 Feb 2025 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755508; cv=none; b=s2a88gwasgCvuzmeYWdt5LDlUXXBP5yDdL5xiL6BItuZVcoEEU9QvaYqzedpO4SB4bjGAJ0tDdRfeQBPDv+4L3Vg/dtRx7znR1PtzANPdBCsHmUFThS4y2pBEAJb/PbCCcTSWgldGmtT05b8XCUqEMN1/tJjgd0yY/Cy+BvxUpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755508; c=relaxed/simple;
	bh=ZOPCs02b3mZhzLkapPVgSReXoKQwlq5/nAbJ3IEyXaM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KM+noLCTF1hxZ3Or1o0EGDg9KHmGbSUcNWbzAQ9pSpSnoC+FcelEBRCbRji+bUeES9k4E59xr8djyBBI+8ZzU5OxXWw2sjlRU0rCWRkrPvLS7l1jFRFhnLlFG59xB3156ueGXxjTf7oM4d0lPSaHUF6M3qf3HdNhjL9X+xs5jtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ai3ZnlZj; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ai3ZnlZj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r8006893;
	Wed, 5 Feb 2025 05:38:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zKp4rTscQXZLsL7nyZw+5VYz9SY6657UAiBHlydAyc4=; b=
	Ai3ZnlZjBybify+2aMJn3sj6g6aCLMF9l6+OUB8qd0FzZwU3b9BdFCHAzApuaK9U
	H/2lH/ora5czs3bGiwtfWlwOmvUYTj5/QBvUJ13UJIoyqrM9RYFsX0BizldAhkYd
	hTm3J22SLCOMXI8i+0Stw7izfMKN+8XCrsqG9HSByBVZSCaE0Z1r7W+uSq0ANej9
	n4xxhLD8yEdXb9/LQ7GtFgBI1iPe/AM94lA2v/0+rIJ5T8DEQWqDIF/nIgd7pBEi
	RFvkMqAeeyBV+wOTQ3++7T76WuP3N9a+y9nl+bZxqymFJ33pP065j6YujZBpzEQY
	T8GGKF8YygBzZQXF1c/a8A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:08 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9D1BA820248;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 10/10] ASoC: SDCA: Add support for PDE Entity properties
Date: Wed, 5 Feb 2025 11:38:01 +0000
Message-ID: <20250205113801.3699902-11-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: eGiJyRPqJ5WSuVSuU7PgLiADsmG80Qla
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34da0 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=InURWwoI9BARLRZVlTMA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: eGiJyRPqJ5WSuVSuU7PgLiADsmG80Qla
X-Proofpoint-Spam-Reason: safe

Add support for parsing the Power Domain Entity properties from
DisCo/ACPI.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  48 +++++++++++
 sound/soc/sdca/sdca_functions.c | 138 ++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 13edc976679ac..f001ab643fed4 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -39,6 +39,11 @@ struct sdca_function_desc;
  */
 #define SDCA_MAX_CHANNEL_COUNT 32
 
+/*
+ * Sanity check on number of PDE delays, can be expanded if needed.
+ */
+#define SDCA_MAX_DELAY_COUNT 256
+
 /**
  * enum sdca_function_type - SDCA Function Type codes
  * @SDCA_FUNCTION_TYPE_SMART_AMP: Amplifier with protection features.
@@ -807,6 +812,47 @@ struct sdca_entity_cs {
 	unsigned int max_delay;
 };
 
+/**
+ * enum sdca_pde_power_state - SDCA Power States
+ *
+ * SDCA Power State values from SDCA specification v1.0 Section 7.12.4.
+ */
+enum sdca_pde_power_state {
+	SDCA_PDE_PS0					= 0x0,
+	SDCA_PDE_PS1					= 0x1,
+	SDCA_PDE_PS2					= 0x2,
+	SDCA_PDE_PS3					= 0x3,
+	SDCA_PDE_PS4					= 0x4,
+};
+
+/**
+ * struct sdca_pde_delay - describes the delay changing between 2 power states
+ * @from_ps: The power state being exited.
+ * @to_ps: The power state being entered.
+ * @us: The delay in microseconds switching between the two states.
+ */
+struct sdca_pde_delay {
+	int from_ps;
+	int to_ps;
+	unsigned int us;
+};
+
+/**
+ * struct sdca_entity_pde - information specific to Power Domain Entities
+ * @managed: Dynamically allocated array pointing to each Entity
+ * controlled by this PDE.
+ * @max_delay: Dynamically allocated array of delays for switching
+ * between power states.
+ * @num_managed: Number of Entities controlled by this PDE.
+ * @num_max_delay: Number of delays specified for state changes.
+ */
+struct sdca_entity_pde {
+	struct sdca_entity **managed;
+	struct sdca_pde_delay *max_delay;
+	int num_managed;
+	int num_max_delay;
+};
+
 /**
  * enum sdca_entity_type - SDCA Entity Type codes
  * @SDCA_ENTITY_TYPE_ENTITY_0: Entity 0, not actually from the
@@ -870,6 +916,7 @@ enum sdca_entity_type {
  * @num_controls: Number of Controls for the Entity.
  * @iot: Input/Output Terminal specific Entity properties.
  * @cs: Clock Source specific Entity properties.
+ * @pde: Power Domain Entity specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -883,6 +930,7 @@ struct sdca_entity {
 	union {
 		struct sdca_entity_iot iot;
 		struct sdca_entity_cs cs;
+		struct sdca_entity_pde pde;
 	};
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index dd9e2dce6e658..091d55abe1091 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -908,6 +908,66 @@ static int find_sdca_entity_cs(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_entity_pde(struct device *dev,
+				struct fwnode_handle *entity_node,
+				struct sdca_entity *entity)
+{
+	static const int mult_delay = 3;
+	struct sdca_entity_pde *power = &entity->pde;
+	struct sdca_pde_delay *delays;
+	int num_delays;
+	u32 *delay_list;
+	int i, j;
+
+	num_delays = fwnode_property_count_u32(entity_node,
+					       "mipi-sdca-powerdomain-transition-max-delay");
+	if (num_delays <= 0) {
+		dev_err(dev, "%s: max delay list missing: %d\n",
+			entity->label, num_delays);
+		return -EINVAL;
+	} else if (num_delays % mult_delay != 0) {
+		dev_err(dev, "%s: delays not multiple of %d\n",
+			entity->label, mult_delay);
+		return -EINVAL;
+	} else if (num_delays > SDCA_MAX_DELAY_COUNT) {
+		dev_err(dev, "%s: maximum number of transition delays exceeded\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	/* There are 3 values per delay */
+	delays = devm_kcalloc(dev, num_delays / mult_delay,
+			      sizeof(*delays), GFP_KERNEL);
+	if (!delays)
+		return -ENOMEM;
+
+	delay_list = kcalloc(num_delays, sizeof(*delay_list), GFP_KERNEL);
+	if (!delay_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(entity_node,
+				       "mipi-sdca-powerdomain-transition-max-delay",
+				       delay_list, num_delays);
+
+	num_delays /= mult_delay;
+
+	for (i = 0, j = 0; i < num_delays; i++) {
+		delays[i].from_ps = delay_list[j++];
+		delays[i].to_ps = delay_list[j++];
+		delays[i].us = delay_list[j++];
+
+		dev_info(dev, "%s: from %#x to %#x delay %dus\n", entity->label,
+			 delays[i].from_ps, delays[i].to_ps, delays[i].us);
+	}
+
+	power->num_max_delay = num_delays;
+	power->max_delay = delays;
+
+	kfree(delay_list);
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -943,6 +1003,9 @@ static int find_sdca_entity(struct device *dev,
 	case SDCA_ENTITY_TYPE_CS:
 		ret = find_sdca_entity_cs(dev, entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_PDE:
+		ret = find_sdca_entity_pde(dev, entity_node, entity);
+		break;
 	default:
 		break;
 	}
@@ -1047,6 +1110,21 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 	return NULL;
 }
 
+static struct sdca_entity *find_sdca_entity_by_id(struct sdca_function_data *function,
+						  const int id)
+{
+	int i;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		if (entity->id == id)
+			return entity;
+	}
+
+	return NULL;
+}
+
 static int find_sdca_entity_connection_iot(struct device *dev,
 					   struct sdca_function_data *function,
 					   struct fwnode_handle *entity_node,
@@ -1087,6 +1165,62 @@ static int find_sdca_entity_connection_iot(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_entity_connection_pde(struct device *dev,
+					   struct sdca_function_data *function,
+					   struct fwnode_handle *entity_node,
+					   struct sdca_entity *entity)
+{
+	struct sdca_entity_pde *power = &entity->pde;
+	struct sdca_entity **managed;
+	u32 *managed_list;
+	int num_managed;
+	int i;
+
+	num_managed = fwnode_property_count_u32(entity_node,
+						"mipi-sdca-powerdomain-managed-list");
+	if (!num_managed) {
+		return 0;
+	} else if (num_managed < 0) {
+		dev_err(dev, "%s: managed list missing: %d\n", entity->label, num_managed);
+		return num_managed;
+	} else if (num_managed > SDCA_MAX_ENTITY_COUNT) {
+		dev_err(dev, "%s: maximum number of managed entities exceeded\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	managed = devm_kcalloc(dev, num_managed, sizeof(*managed), GFP_KERNEL);
+	if (!managed)
+		return -ENOMEM;
+
+	managed_list = kcalloc(num_managed, sizeof(*managed_list), GFP_KERNEL);
+	if (!managed_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(entity_node,
+				       "mipi-sdca-powerdomain-managed-list",
+				       managed_list, num_managed);
+
+	for (i = 0; i < num_managed; i++) {
+		managed[i] = find_sdca_entity_by_id(function, managed_list[i]);
+		if (!managed[i]) {
+			dev_err(dev, "%s: failed to find entity with id %#x\n",
+				entity->label, managed_list[i]);
+			kfree(managed_list);
+			return -EINVAL;
+		}
+
+		dev_info(dev, "%s -> %s\n", managed[i]->label, entity->label);
+	}
+
+	kfree(managed_list);
+
+	power->num_managed = num_managed;
+	power->managed = managed;
+
+	return 0;
+}
+
 static int find_sdca_entity_connection(struct device *dev,
 				       struct sdca_function_data *function,
 				       struct fwnode_handle *entity_node,
@@ -1103,6 +1237,10 @@ static int find_sdca_entity_connection(struct device *dev,
 		ret = find_sdca_entity_connection_iot(dev, function,
 						      entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_PDE:
+		ret = find_sdca_entity_connection_pde(dev, function,
+						      entity_node, entity);
+		break;
 	default:
 		ret = 0;
 		break;
-- 
2.39.5

