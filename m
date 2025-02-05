Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4822A80B;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755505; cv=none; b=NZwr0pZoQQybu3if+3a0PSr/+/zRVvlrYBKSjR+qWLKqd3bCMTnYRIMoTii05BxRJr4jDXpBsNUZHZCbxV4Hsb6mkhguiSCaSkIYvcSffMs4/KRLL7jnTatBTfnC02BWudqHSysgGHk4w/wBhQciWryMzHhpT56CVNhB4QCMlOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755505; c=relaxed/simple;
	bh=nkgmvpPwfvuURX3sQNXfvzz0eRGz6dpDMomguJKoewM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qP3kVefsUInjieFwPDCIPZD9D/ocpJ4O136JvT4WKfhlQWp+8OZN1N3dT3wLIOmlQXlLoPfaWxMuiB0hLQzxHKdq/YcNAyd3C7k+Acg8zhjWHUAuNT+iKbGNc7KHUW4cxtR+cjgyXExfpeGjRoueiOayKVppokDXp5Dbip1Xv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aZV81olI; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aZV81olI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5154qIXb016309;
	Wed, 5 Feb 2025 05:38:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=j8RCNsHA886XW9YyZuFjO+svQxPy6O5woK8vAdOxnyM=; b=
	aZV81olIGXJZyUystYsfHI0rfKTW7SUcT/SE4qHFXFpiQ5XsbcbyvLtFfocc2yyi
	DwwECQzbQqHIWdOtekpLHAmngVlnuKhJ7lE6pe5He4qN0bADSr97aeFqItRFiORG
	8wPsTO5iS6PXJJ3S8sDbdonbc+PdTImezLmo2qQPqw+vTDCro/YEqpheBBmUgpeg
	QuBNehBeCRpO7udQ5hSSqUfPrB2x1KFm6bvmLgP9Pt9A42cNIcVznQ5Kpd24fZ7h
	+o88CfUek70JMc48KsSOsR8NKlG8ZaS7MI5bO5kmctmz8ycT6pXYl4s63jjjundC
	sHvV+GrP3QVw5dTpgOyk4w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4en2-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:05 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3C2A882255E;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 04/10] ASoC: SDCA: Add support for Entity 0
Date: Wed, 5 Feb 2025 11:37:55 +0000
Message-ID: <20250205113801.3699902-5-ckeepax@opensource.cirrus.com>
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
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a34d9d cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=fzJl0nIRBdt-6464aXsA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: 5CyriFDUqXPLs-qW4NZBTlWA0IiktBOx
X-Proofpoint-GUID: 5CyriFDUqXPLs-qW4NZBTlWA0IiktBOx
X-Proofpoint-Spam-Reason: safe

Within SDCA there is a special Entity called Entity 0 which is used
to hold Function level controls. Whilst Entity 0 isn't a full SDCA
Entity, it is helpful to add an sdca_entity structure for it. This
will allow it to be treated identically in the code that handles
SDCA Controls.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  4 ++++
 sound/soc/sdca/sdca_functions.c | 14 +++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 47fc1da8e4f33..a51e3a459e361 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -117,6 +117,9 @@ enum sdca_entity0_controls {
 
 /**
  * enum sdca_entity_type - SDCA Entity Type codes
+ * @SDCA_ENTITY_TYPE_ENTITY_0: Entity 0, not actually from the
+ * specification but useful internally as an Entity structure
+ * is allocated for Entity 0, to hold Entity 0 controls.
  * @SDCA_ENTITY_TYPE_IT: Input Terminal.
  * @SDCA_ENTITY_TYPE_OT: Output Terminal.
  * @SDCA_ENTITY_TYPE_MU: Mixer Unit.
@@ -141,6 +144,7 @@ enum sdca_entity0_controls {
  * all Entity Types not described are reserved.
  */
 enum sdca_entity_type {
+	SDCA_ENTITY_TYPE_ENTITY_0			= 0x00,
 	SDCA_ENTITY_TYPE_IT				= 0x02,
 	SDCA_ENTITY_TYPE_OT				= 0x03,
 	SDCA_ENTITY_TYPE_MU				= 0x05,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index f914ec3f86c9a..b0ca92f1bc57f 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -293,7 +293,8 @@ static int find_sdca_entities(struct device *dev,
 		return -EINVAL;
 	}
 
-	entities = devm_kcalloc(dev, num_entities, sizeof(*entities), GFP_KERNEL);
+	/* Add 1 to make space for Entity 0 */
+	entities = devm_kcalloc(dev, num_entities + 1, sizeof(*entities), GFP_KERNEL);
 	if (!entities)
 		return -ENOMEM;
 
@@ -331,7 +332,13 @@ static int find_sdca_entities(struct device *dev,
 			return ret;
 	}
 
-	function->num_entities = num_entities;
+	/*
+	 * Add Entity 0 at end of the array, makes it easy to skip during
+	 * all the Entity searches involved in creating connections.
+	 */
+	entities[num_entities].label = "entity0";
+
+	function->num_entities = num_entities + 1;
 	function->entities = entities;
 
 	return 0;
@@ -440,7 +447,8 @@ static int find_sdca_connections(struct device *dev,
 {
 	int i;
 
-	for (i = 0; i < function->num_entities; i++) {
+	/* Entity 0 cannot have connections */
+	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
 		char entity_property[SDCA_PROPERTY_LENGTH];
 		struct fwnode_handle *entity_node;
-- 
2.39.5

