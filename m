Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AB22ACD7;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755505; cv=none; b=BxM3vBBYtLnBYe/L1qoRBbnsAHdUWyZCRV/CcdZwfMoeRFZtvW1vV0YQY5MaDOXsyYSM5CWGqtdiMS5TvZKGLo+8WYCTwB+FESLQb2NUZWyachT+3As9umqFctSPNe/reERuueSGFsWkw+j6biJH8Sft/JNQ+Y/0Ukw42su1qEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755505; c=relaxed/simple;
	bh=I0eqnVimul3vopAmG7QvdPMNwfW19Fk0GkK1NmpEyIE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYzUKzV/0QtH6pYc/RevPUFCqBFWxSEUb3E5P6AhSV8apUUmDkm+gGpy17abVlmmqjJl89KMWd3a0TfCQP9Rls+aNqYYsgQ4y2ncmeJGEmgs3vQJykwXSn3cyJgbga2V+ZIrM5z5S087fwM7LFnTzZZlEzFYjR8ZRn/cXoZW3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EL4Fj35A; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EL4Fj35A"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r6006893;
	Wed, 5 Feb 2025 05:38:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zu+7H5kV3/FR+xvRQ6oEnvV5YtcE9btFIQKJQF0TC9Y=; b=
	EL4Fj35AeS27fKxecClINdJZRB4WkQCaVHl6iHMbv/QpT9/yil9hrcSbvDp474Eq
	qvOPedWvREemybnOWGxFPJ35QG1cHHGIoYAtr/CQWJsXMPorIj1DgkBnbDFf0jJF
	wS2vyq4ehdkmTLVbaKoti/JXv+9NgKRibavF+x4CouMIG45fn+556UUbYhp6KLJN
	mgLiOWX+slb1ZPDKgpaV2vBdYMw5gW0ctHK6XwIvJtcbLYYvFztdgUzcPbefhd0G
	6qY75mix1G7YmO0R6tKlAiBlPlr9X5aimgeAwqW5eh7OCh2LAEJyednAiFtWq9gx
	bUuq8xvfgI5h1AKUowleKQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:06 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8D99A820270;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 09/10] ASoC: SDCA: Add support for clock Entity properties
Date: Wed, 5 Feb 2025 11:38:00 +0000
Message-ID: <20250205113801.3699902-10-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: Ofo2vRgNqh9KU6-_UOpTOg1RBgL9kPLx
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34d9e cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=JGqCwzymkngAl5hwJI0A:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: Ofo2vRgNqh9KU6-_UOpTOg1RBgL9kPLx
X-Proofpoint-Spam-Reason: safe

Add support for parsing the Clock Source Entity properties from
DisCo/ACPI.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 25 +++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6cb5ab79ee547..13edc976679ac 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -784,6 +784,29 @@ struct sdca_entity_iot {
 	bool is_dataport;
 };
 
+/**
+ * enum sdca_clock_type - SDCA Clock Types
+ *
+ * Indicate the synchronicity of an Clock Entity, see section 6.4.1.3
+ * of the SDCA v1.0 specification.
+ */
+enum sdca_clock_type {
+	SDCA_CLOCK_TYPE_EXTERNAL			= 0x00,
+	SDCA_CLOCK_TYPE_INTERNAL_ASYNC			= 0x01,
+	SDCA_CLOCK_TYPE_INTERNAL_SYNC			= 0x02,
+	SDCA_CLOCK_TYPE_INTERNAL_SOURCE_SYNC		= 0x03,
+};
+
+/**
+ * struct sdca_entity_cs - information specific to Clock Source Entities
+ * @type: Synchronicity of the Clock Source.
+ * @max_delay: The maximum delay in microseconds before the clock is stable.
+ */
+struct sdca_entity_cs {
+	enum sdca_clock_type type;
+	unsigned int max_delay;
+};
+
 /**
  * enum sdca_entity_type - SDCA Entity Type codes
  * @SDCA_ENTITY_TYPE_ENTITY_0: Entity 0, not actually from the
@@ -846,6 +869,7 @@ enum sdca_entity_type {
  * @num_sources: Number of sources for the Entity.
  * @num_controls: Number of Controls for the Entity.
  * @iot: Input/Output Terminal specific Entity properties.
+ * @cs: Clock Source specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -858,6 +882,7 @@ struct sdca_entity {
 	int num_controls;
 	union {
 		struct sdca_entity_iot iot;
+		struct sdca_entity_cs cs;
 	};
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 8a143048a0ab9..dd9e2dce6e658 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -881,6 +881,33 @@ static int find_sdca_entity_iot(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_entity_cs(struct device *dev,
+			       struct fwnode_handle *entity_node,
+			       struct sdca_entity *entity)
+{
+	struct sdca_entity_cs *clock = &entity->cs;
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-cs-type", &tmp);
+	if (ret) {
+		dev_err(dev, "%s: clock type missing: %d\n", entity->label, ret);
+		return ret;
+	}
+
+	clock->type = tmp;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-clock-valid-max-delay", &tmp);
+	if (!ret)
+		clock->max_delay = tmp;
+
+	dev_info(dev, "%s: clock type %#x delay %d\n", entity->label,
+		 clock->type, clock->max_delay);
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -913,6 +940,9 @@ static int find_sdca_entity(struct device *dev,
 	case SDCA_ENTITY_TYPE_OT:
 		ret = find_sdca_entity_iot(dev, entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_CS:
+		ret = find_sdca_entity_cs(dev, entity_node, entity);
+		break;
 	default:
 		break;
 	}
-- 
2.39.5

