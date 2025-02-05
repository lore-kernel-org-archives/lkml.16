Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA0322ACF3;
	Wed,  5 Feb 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755506; cv=none; b=ei1I3sknR5v8yxOzKTgmqBWJKsfCPZ6jrbPc05gswA0NrSltQg8LRPBL42w4O1tAL83Elgaawgo14m2mm/TFRUnebMVOQJyiAB3NzGFC2jgmqcY4JkjzoXpgBD9j3gsOOJT2tlEPWRxElpQHLU27HcSg9Q9gxlIoGKDoDGcbK9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755506; c=relaxed/simple;
	bh=X3pVUQbpQfXX05g2GT84IXondMc0Scf03aYiOy3ZHIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+j5At8ikNmy0k4jcvcByhJ35Mh2Pz8L/0YGRVw+j1w3NkD/XS01B0DjaJbqJVWCUA9k9Lfcjrb+Jk+9vax7wuvaqdyRR96NM0c2B3uYFmr+leGGSdGXkAzkLMi9Ws/MEpa6+U/+rC0xYBHq8ctDpvtp6s0n/72aKw8+cIYSBBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FtowH5Sw; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FtowH5Sw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5155M0r5006893;
	Wed, 5 Feb 2025 05:38:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+MbrJU8nhcimlgCr0p58E7lcLLBlbTtR/ofyNKQmQnA=; b=
	FtowH5SwYqJfdesDrZovb5LoeNAOE6tW8JjLVU6OZJb2YBFmoGSwxyteJi718/VD
	nLOeJZNohPbAu6mAcCR89jJnYRSOeYIyypNZV0MajMhExz3Teesz6w1YtwU7QVdx
	hZ/GicVs1amcow7wjsR2vagwrpksCrBDKFDjuchycIQZUf2yNjcUIknZLVbEYrB5
	n0Gx2FWnBSesm3lN68yvBLrx2y7dzv2FtCFoYaLzHdzOLsnRqlPlW6iWno5WuZHa
	P3QlVEo3net0Cq1U58N9XYU8TD/mL/bU5c2EDOdTS2inIdf4e9QaMOmdkL/U+f0N
	xg6VsVaFLfj32bH+5/aBiA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54bv5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 05:38:05 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 11:38:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 11:38:01 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6EB37820248;
	Wed,  5 Feb 2025 11:38:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <peter.ujfalusi@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 07/10] ASoC: SDCA: Add Channel Cluster parsing
Date: Wed, 5 Feb 2025 11:37:58 +0000
Message-ID: <20250205113801.3699902-8-ckeepax@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: qC5GXd4dzIVXDZc9ozLBnpcUZ_a5wxG6
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a34d9d cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=g9ajY7hIkMii_CKe7ScA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: qC5GXd4dzIVXDZc9ozLBnpcUZ_a5wxG6
X-Proofpoint-Spam-Reason: safe

Within SDCA collections of Channels are referred to as Clusters, each
Channel within a Cluster can have various properties attached to it.
For example a stereo audio stream, would have a Cluster with 2 Channels
one marked as left and the other as right. Various Clusters are
specified in DisCo/ACPI and controls then allow the class driver to
select between these channel configurations. Add support for parsing
these Cluster definitions.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 170 ++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 165 +++++++++++++++++++++++++++++++
 2 files changed, 335 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 769ae68410647..bc6e12b2211da 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -26,6 +26,18 @@ struct sdca_function_desc;
  */
 #define SDCA_MAX_INIT_COUNT 2048
 
+/*
+ * The Cluster IDs are 16-bit, so a maximum of 65535 Clusters per
+ * function can be represented, however limit this to a slightly
+ * more reasonable value. Can be expanded if needed.
+ */
+#define SDCA_MAX_CLUSTER_COUNT 256
+
+/*
+ * Sanity check on number of channels per Cluster, can be expanded if needed.
+ */
+#define SDCA_MAX_CHANNEL_COUNT 32
+
 /**
  * enum sdca_function_type - SDCA Function Type codes
  * @SDCA_FUNCTION_TYPE_SMART_AMP: Amplifier with protection features.
@@ -732,13 +744,169 @@ struct sdca_entity {
 	int num_controls;
 };
 
+/**
+ * enum sdca_channel_purpose - SDCA Channel Purpose code
+ *
+ * Channel Purpose codes as described in the SDCA specification v1.0
+ * section 11.4.3.
+ */
+enum sdca_channel_purpose {
+	/* Table 210 - Purpose */
+	SDCA_CHAN_PURPOSE_GENERIC_AUDIO			= 0x01,
+	SDCA_CHAN_PURPOSE_VOICE				= 0x02,
+	SDCA_CHAN_PURPOSE_SPEECH			= 0x03,
+	SDCA_CHAN_PURPOSE_AMBIENT			= 0x04,
+	SDCA_CHAN_PURPOSE_REFERENCE			= 0x05,
+	SDCA_CHAN_PURPOSE_ULTRASOUND			= 0x06,
+	SDCA_CHAN_PURPOSE_SENSE				= 0x08,
+	SDCA_CHAN_PURPOSE_SILENCE			= 0xFE,
+	SDCA_CHAN_PURPOSE_NON_AUDIO			= 0xFF,
+	/* Table 211 - Amp Sense */
+	SDCA_CHAN_PURPOSE_SENSE_V1			= 0x09,
+	SDCA_CHAN_PURPOSE_SENSE_V2			= 0x0A,
+	SDCA_CHAN_PURPOSE_SENSE_V12_INTERLEAVED		= 0x10,
+	SDCA_CHAN_PURPOSE_SENSE_V21_INTERLEAVED		= 0x11,
+	SDCA_CHAN_PURPOSE_SENSE_V12_PACKED		= 0x12,
+	SDCA_CHAN_PURPOSE_SENSE_V21_PACKED		= 0x13,
+	SDCA_CHAN_PURPOSE_SENSE_V1212_INTERLEAVED	= 0x14,
+	SDCA_CHAN_PURPOSE_SENSE_V2121_INTERLEAVED	= 0x15,
+	SDCA_CHAN_PURPOSE_SENSE_V1122_INTERLEAVED	= 0x16,
+	SDCA_CHAN_PURPOSE_SENSE_V2211_INTERLEAVED	= 0x17,
+	SDCA_CHAN_PURPOSE_SENSE_V1212_PACKED		= 0x18,
+	SDCA_CHAN_PURPOSE_SENSE_V2121_PACKED		= 0x19,
+	SDCA_CHAN_PURPOSE_SENSE_V1122_PACKED		= 0x1A,
+	SDCA_CHAN_PURPOSE_SENSE_V2211_PACKED		= 0x1B,
+};
+
+/**
+ * enum sdca_channel_relationship - SDCA Channel Relationship code
+ *
+ * Channel Relationship codes as described in the SDCA specification
+ * v1.0 section 11.4.2.
+ */
+enum sdca_channel_relationship {
+	/* Table 206 - Streaming */
+	SDCA_CHAN_REL_UNDEFINED				= 0x00,
+	SDCA_CHAN_REL_GENERIC_MONO			= 0x01,
+	SDCA_CHAN_REL_GENERIC_LEFT			= 0x02,
+	SDCA_CHAN_REL_GENERIC_RIGHT			= 0x03,
+	SDCA_CHAN_REL_GENERIC_TOP			= 0x48,
+	SDCA_CHAN_REL_GENERIC_BOTTOM			= 0x49,
+	SDCA_CHAN_REL_CAPTURE_DIRECT			= 0x4E,
+	SDCA_CHAN_REL_RENDER_DIRECT			= 0x4F,
+	SDCA_CHAN_REL_FRONT_LEFT			= 0x0B,
+	SDCA_CHAN_REL_FRONT_RIGHT			= 0x0C,
+	SDCA_CHAN_REL_FRONT_CENTER			= 0x0D,
+	SDCA_CHAN_REL_SIDE_LEFT				= 0x12,
+	SDCA_CHAN_REL_SIDE_RIGHT			= 0x13,
+	SDCA_CHAN_REL_BACK_LEFT				= 0x16,
+	SDCA_CHAN_REL_BACK_RIGHT			= 0x17,
+	SDCA_CHAN_REL_LOW_FREQUENCY_EFFECTS		= 0x43,
+	SDCA_CHAN_REL_SOUNDWIRE_MIC			= 0x55,
+	SDCA_CHAN_REL_SENSE_TRANSDUCER_1		= 0x58,
+	SDCA_CHAN_REL_SENSE_TRANSDUCER_2		= 0x59,
+	SDCA_CHAN_REL_SENSE_TRANSDUCER_12		= 0x5A,
+	SDCA_CHAN_REL_SENSE_TRANSDUCER_21		= 0x5B,
+	SDCA_CHAN_REL_ECHOREF_NONE			= 0x70,
+	SDCA_CHAN_REL_ECHOREF_1				= 0x71,
+	SDCA_CHAN_REL_ECHOREF_2				= 0x72,
+	SDCA_CHAN_REL_ECHOREF_3				= 0x73,
+	SDCA_CHAN_REL_ECHOREF_4				= 0x74,
+	SDCA_CHAN_REL_ECHOREF_ALL			= 0x75,
+	SDCA_CHAN_REL_ECHOREF_LFE_ALL			= 0x76,
+	/* Table 207 - Speaker */
+	SDCA_CHAN_REL_PRIMARY_TRANSDUCER		= 0x50,
+	SDCA_CHAN_REL_SECONDARY_TRANSDUCER		= 0x51,
+	SDCA_CHAN_REL_TERTIARY_TRANSDUCER		= 0x52,
+	SDCA_CHAN_REL_LOWER_LEFT_ALLTRANSDUCER		= 0x60,
+	SDCA_CHAN_REL_LOWER_RIGHT_ALLTRANSDUCER		= 0x61,
+	SDCA_CHAN_REL_UPPER_LEFT_ALLTRANSDUCER		= 0x62,
+	SDCA_CHAN_REL_UPPER_RIGHT_ALLTRANSDUCER		= 0x63,
+	SDCA_CHAN_REL_LOWER_LEFT_PRIMARY		= 0x64,
+	SDCA_CHAN_REL_LOWER_RIGHT_PRIMARY		= 0x65,
+	SDCA_CHAN_REL_UPPER_LEFT_PRIMARY		= 0x66,
+	SDCA_CHAN_REL_UPPER_RIGHT_PRIMARY		= 0x67,
+	SDCA_CHAN_REL_LOWER_LEFT_SECONDARY		= 0x68,
+	SDCA_CHAN_REL_LOWER_RIGHT_SECONDARY		= 0x69,
+	SDCA_CHAN_REL_UPPER_LEFT_SECONDARY		= 0x6A,
+	SDCA_CHAN_REL_UPPER_RIGHT_SECONDARY		= 0x6B,
+	SDCA_CHAN_REL_LOWER_LEFT_TERTIARY		= 0x6C,
+	SDCA_CHAN_REL_LOWER_RIGHT_TERTIARY		= 0x6D,
+	SDCA_CHAN_REL_UPPER_LEFT_TERTIARY		= 0x6E,
+	SDCA_CHAN_REL_UPPER_RIGHT_TERTIARY		= 0x6F,
+	SDCA_CHAN_REL_DERIVED_LOWER_LEFT_PRIMARY	= 0x94,
+	SDCA_CHAN_REL_DERIVED_LOWER_RIGHT_PRIMARY	= 0x95,
+	SDCA_CHAN_REL_DERIVED_UPPER_LEFT_PRIMARY	= 0x96,
+	SDCA_CHAN_REL_DERIVED_UPPER_RIGHT_PRIMARY	= 0x97,
+	SDCA_CHAN_REL_DERIVED_LOWER_LEFT_SECONDARY	= 0x98,
+	SDCA_CHAN_REL_DERIVED_LOWER_RIGHT_SECONDARY	= 0x99,
+	SDCA_CHAN_REL_DERIVED_UPPER_LEFT_SECONDARY	= 0x9A,
+	SDCA_CHAN_REL_DERIVED_UPPER_RIGHT_SECONDARY	= 0x9B,
+	SDCA_CHAN_REL_DERIVED_LOWER_LEFT_TERTIARY	= 0x9C,
+	SDCA_CHAN_REL_DERIVED_LOWER_RIGHT_TERTIARY	= 0x9D,
+	SDCA_CHAN_REL_DERIVED_UPPER_LEFT_TERTIARY	= 0x9E,
+	SDCA_CHAN_REL_DERIVED_UPPER_RIGHT_TERTIARY	= 0x9F,
+	SDCA_CHAN_REL_DERIVED_MONO_PRIMARY		= 0xA0,
+	SDCA_CHAN_REL_DERIVED_MONO_SECONDARY		= 0xAB,
+	SDCA_CHAN_REL_DERIVED_MONO_TERTIARY		= 0xAC,
+	/* Table 208 - Equipment */
+	SDCA_CHAN_REL_EQUIPMENT_LEFT			= 0x02,
+	SDCA_CHAN_REL_EQUIPMENT_RIGHT			= 0x03,
+	SDCA_CHAN_REL_EQUIPMENT_COMBINED		= 0x47,
+	SDCA_CHAN_REL_EQUIPMENT_TOP			= 0x48,
+	SDCA_CHAN_REL_EQUIPMENT_BOTTOM			= 0x49,
+	SDCA_CHAN_REL_EQUIPMENT_TOP_LEFT		= 0x4A,
+	SDCA_CHAN_REL_EQUIPMENT_BOTTOM_LEFT		= 0x4B,
+	SDCA_CHAN_REL_EQUIPMENT_TOP_RIGHT		= 0x4C,
+	SDCA_CHAN_REL_EQUIPMENT_BOTTOM_RIGHT		= 0x4D,
+	SDCA_CHAN_REL_EQUIPMENT_SILENCED_OUTPUT		= 0x57,
+	/* Table 209 - Other */
+	SDCA_CHAN_REL_ARRAY				= 0x04,
+	SDCA_CHAN_REL_MIC				= 0x53,
+	SDCA_CHAN_REL_RAW				= 0x54,
+	SDCA_CHAN_REL_SILENCED_MIC			= 0x56,
+	SDCA_CHAN_REL_MULTI_SOURCE_1			= 0x78,
+	SDCA_CHAN_REL_MULTI_SOURCE_2			= 0x79,
+	SDCA_CHAN_REL_MULTI_SOURCE_3			= 0x7A,
+	SDCA_CHAN_REL_MULTI_SOURCE_4			= 0x7B,
+};
+
+/**
+ * struct sdca_channel - a single Channel with a Cluster
+ * @id: Identifier used for addressing.
+ * @purpose: Indicates the purpose of the Channel, usually to give
+ * semantic meaning to the audio, eg. voice, ultrasound.
+ * @relationship: Indicates the relationship of this Channel to others
+ * in the Cluster, often used to identify the physical position of the
+ * Channel eg. left.
+ */
+struct sdca_channel {
+	int id;
+	enum sdca_channel_purpose purpose;
+	enum sdca_channel_relationship relationship;
+};
+
+/**
+ * struct sdca_cluster - information about an SDCA Channel Cluster
+ * @id: Identifier used for addressing.
+ * @num_channels: Number of Channels within this Cluster.
+ * @channels: Dynamically allocated array of Channels.
+ */
+struct sdca_cluster {
+	int id;
+	int num_channels;
+	struct sdca_channel *channels;
+};
+
 /**
  * struct sdca_function_data - top-level information for one SDCA function
  * @desc: Pointer to short descriptor from initial parsing.
  * @init_table: Pointer to a table of initialization writes.
  * @entities: Dynamically allocated array of Entities.
+ * @clusters: Dynamically allocated array of Channel Clusters.
  * @num_init_table: Number of initialization writes.
  * @num_entities: Number of Entities reported in this Function.
+ * @num_clusters: Number of Channel Clusters reported in this Function.
  * @busy_max_delay: Maximum Function busy delay in microseconds, before an
  * error should be reported.
  */
@@ -747,8 +915,10 @@ struct sdca_function_data {
 
 	struct sdca_init_write *init_table;
 	struct sdca_entity *entities;
+	struct sdca_cluster *clusters;
 	int num_init_table;
 	int num_entities;
+	int num_clusters;
 
 	unsigned int busy_max_delay;
 };
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index d65b413f6d2f4..4de25f4857550 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1059,6 +1059,167 @@ static int find_sdca_connections(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_cluster_channel(struct device *dev,
+				     struct sdca_cluster *cluster,
+				     struct fwnode_handle *channel_node,
+				     struct sdca_channel *channel)
+{
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_u32(channel_node, "mipi-sdca-cluster-channel-id", &tmp);
+	if (ret) {
+		dev_err(dev, "cluster %#x: missing channel id: %d\n",
+			cluster->id, ret);
+		return ret;
+	}
+
+	channel->id = tmp;
+
+	ret = fwnode_property_read_u32(channel_node,
+				       "mipi-sdca-cluster-channel-purpose",
+				       &tmp);
+	if (ret) {
+		dev_err(dev, "cluster %#x: channel %#x: missing purpose: %d\n",
+			cluster->id, channel->id, ret);
+		return ret;
+	}
+
+	channel->purpose = tmp;
+
+	ret = fwnode_property_read_u32(channel_node,
+				       "mipi-sdca-cluster-channel-relationship",
+				       &tmp);
+	if (ret) {
+		dev_err(dev, "cluster %#x: channel %#x: missing relationship: %d\n",
+			cluster->id, channel->id, ret);
+		return ret;
+	}
+
+	channel->relationship = tmp;
+
+	dev_info(dev, "cluster %#x: channel id %#x purpose %#x relationship %#x\n",
+		 cluster->id, channel->id, channel->purpose, channel->relationship);
+
+	return 0;
+}
+
+static int find_sdca_cluster_channels(struct device *dev,
+				      struct fwnode_handle *cluster_node,
+				      struct sdca_cluster *cluster)
+{
+	struct sdca_channel *channels;
+	u32 num_channels;
+	int i, ret;
+
+	ret = fwnode_property_read_u32(cluster_node, "mipi-sdca-channel-count",
+				       &num_channels);
+	if (ret < 0) {
+		dev_err(dev, "cluster %#x: failed to read channel list: %d\n",
+			cluster->id, ret);
+		return ret;
+	} else if (num_channels > SDCA_MAX_CHANNEL_COUNT) {
+		dev_err(dev, "cluster %#x: maximum number of channels exceeded\n",
+			cluster->id);
+		return -EINVAL;
+	}
+
+	channels = devm_kcalloc(dev, num_channels, sizeof(*channels), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	for (i = 0; i < num_channels; i++) {
+		char channel_property[SDCA_PROPERTY_LENGTH];
+		struct fwnode_handle *channel_node;
+
+		/* DisCo uses upper-case for hex numbers */
+		snprintf(channel_property, sizeof(channel_property),
+			 "mipi-sdca-channel-%d-subproperties", i + 1);
+
+		channel_node = fwnode_get_named_child_node(cluster_node, channel_property);
+		if (!channel_node) {
+			dev_err(dev, "cluster %#x: channel node %s not found\n",
+				cluster->id, channel_property);
+			return -EINVAL;
+		}
+
+		ret = find_sdca_cluster_channel(dev, cluster, channel_node, &channels[i]);
+		fwnode_handle_put(channel_node);
+		if (ret)
+			return ret;
+	}
+
+	cluster->num_channels = num_channels;
+	cluster->channels = channels;
+
+	return 0;
+}
+
+static int find_sdca_clusters(struct device *dev,
+			      struct fwnode_handle *function_node,
+			      struct sdca_function_data *function)
+{
+	struct sdca_cluster *clusters;
+	int num_clusters;
+	u32 *cluster_list;
+	int i, ret;
+
+	num_clusters = fwnode_property_count_u32(function_node, "mipi-sdca-cluster-id-list");
+	if (!num_clusters || num_clusters == -EINVAL) {
+		return 0;
+	} else if (num_clusters < 0) {
+		dev_err(dev, "%pfwP: failed to read cluster id list: %d\n",
+			function_node, num_clusters);
+		return num_clusters;
+	} else if (num_clusters > SDCA_MAX_CLUSTER_COUNT) {
+		dev_err(dev, "%pfwP: maximum number of clusters exceeded\n", function_node);
+		return -EINVAL;
+	}
+
+	clusters = devm_kcalloc(dev, num_clusters, sizeof(*clusters), GFP_KERNEL);
+	if (!clusters)
+		return -ENOMEM;
+
+	cluster_list = kcalloc(num_clusters, sizeof(*cluster_list), GFP_KERNEL);
+	if (!cluster_list)
+		return -ENOMEM;
+
+	fwnode_property_read_u32_array(function_node, "mipi-sdca-cluster-id-list",
+				       cluster_list, num_clusters);
+
+	for (i = 0; i < num_clusters; i++)
+		clusters[i].id = cluster_list[i];
+
+	kfree(cluster_list);
+
+	/* now read subproperties */
+	for (i = 0; i < num_clusters; i++) {
+		char cluster_property[SDCA_PROPERTY_LENGTH];
+		struct fwnode_handle *cluster_node;
+
+		/* DisCo uses upper-case for hex numbers */
+		snprintf(cluster_property, sizeof(cluster_property),
+			 "mipi-sdca-cluster-id-0x%X-subproperties", clusters[i].id);
+
+		cluster_node = fwnode_get_named_child_node(function_node, cluster_property);
+		if (!cluster_node) {
+			dev_err(dev, "%pfwP: cluster node %s not found\n",
+				function_node, cluster_property);
+			return -EINVAL;
+		}
+
+		ret = find_sdca_cluster_channels(dev, cluster_node, &clusters[i]);
+		fwnode_handle_put(cluster_node);
+		if (ret)
+			return ret;
+	}
+
+	function->num_clusters = num_clusters;
+	function->clusters = clusters;
+
+	return 0;
+}
+
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
@@ -1096,6 +1257,10 @@ int sdca_parse_function(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = find_sdca_clusters(dev, function_desc->node, function);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
-- 
2.39.5

