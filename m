Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2032A218AD1;
	Thu, 15 May 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323111; cv=none; b=arK6+Tj5kr19qDNX2sweyUS6XP2JB5R/ScZlEOROjL5NvPwa+04+sxiovd7GDZb2R+RbzDkdM5dNHNB8m/69Gp0YTC6SDsy3mAiebq1lv4hNBhmwUoxFU/S7NvtdLquwTKBp/y2zgpo3JtTxcAclY6YcC/UF89eQfFpTqJQS2vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323111; c=relaxed/simple;
	bh=cBcgA6HaHPPzitiZFs5MpdNT1DsZGeK49EqlZ838GW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CK4E7Ki2GgR4miJzxA7euwDCx18Eh6bnh+34ECvMFYxuVsw3UjDDmqyGbKHtpZ1o834/F9LhHyPLBFYjYxFOotMaQcg19APva0MATLNpCd01k8Mtw0exnDIupB/gtTy+8Eto4jfW/n0qTEx0+3G99ieHXX3+GyCzL/EphN7gjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht/VAvjS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht/VAvjS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so743534f8f.1;
        Thu, 15 May 2025 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323107; x=1747927907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLwt1FYr5148j46Ognfh7L/rr/DYcwJpTHHhc/HKIDE=;
        b=Ht/VAvjS+WAxE77GPqGlHovshM53IgTdR5a6Nl90QghLtl3LAw2/KKBkZVESOZdCOI
         mQbFFw/8TfYjmHGtdbYnyRaKPJbQcDiQw/Cl0nvIjhZ1YLT2vSEQUz3bQK+iHJI8r8Us
         sYShSuY8kCS+R9uQqFPK38SQDAbkDnXrKV1wHq2P2lgfefN2Ghv311f5hdplT9Mphk3T
         li/Fa8kzj1mjLXn1G1AwDI9TDUz62bp7of7VFI5ZU7r557HeqIa8k7Co1wUrCKLFceMY
         5WF7lPqMnOQdO5SyW5MZLmIYHq3GuFfqa68kMaizyO7owAEqT0JYEL+6H9/bHBWePOEe
         8BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323107; x=1747927907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLwt1FYr5148j46Ognfh7L/rr/DYcwJpTHHhc/HKIDE=;
        b=K+EZ+WqZWrd6XJrS9ieUSIMeyApLVyM8z9jp51bQYnBexbVjGHhD3fjUKeyov87AmY
         eflj4rqbXdqZsMo0jh/uhCVXa7826SJ99Th7cjRSjM0Djpli4oPYx+jh8EpPJrFvszZI
         q3MxNNVeNBSbKgEscS4FwAV9S8EpmLKmdiniADrYfj+SGoit0GRScgrqjrEDtplrPbPL
         2tP4nhKWpmfVi0OrVGMfWWJSoEPiWHAbyhA7KCeyl+2bAAYiXpn55cP6G2AeDESPBmCD
         y9Ybz2W3Jn9YWDVDjF540fpfpFszVxwHwOBEUdmviUj+MDZF2hfWlq/CsPw4d7thh2LC
         ahEA==
X-Forwarded-Encrypted: i=1; AJvYcCUsAW9KwwSWM+H25PgPsfNAz6/6R1gmZk5zxZtUp51xLPBu4qDz7cLqea6ivJxJg4IXd54/im+nuv9hHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww/Es80PHukLuASHgLs3A9oQxbXefqoibcZblMKMatoHO55oYR
	7cQ45fclALcf+y5O1iVXQAMIlfhMGznDuQXUBj3tpvwAzQo+kqboL0brLg03Jg==
X-Gm-Gg: ASbGnctRKHj0GlTjuUttwWeIiS957Aq7pZBSdS+K526ife9v1C+Ot3gfU+pP+U5da54
	i2LWsdgGsOwPFvlVvwRGyx5xRpQrjt3ldHb9keYqBwgI0nnIEGBfk+sKlavJTSrzbcmdZ+09yTF
	1V0li6CGoLRrxEVCmRM/502wEmvvYefYsgJv0aBukOi7i7zsiTBfjG4EGzDYw3k5J04QcfD1xZX
	hYOVe9WY0+jdbdmSwd7+eaUvy1Y2ix7smVFmnbAuxgi0uRFEIUEJDlHbUIZbPV6qm1jNSn3VheP
	k2cq1aENg65CdxW/FgIbSFNsoBl+FtvX9ptgxJMnrgVoVwWbwoNkkr4rwo+gaPu3ujNj+nuyMvW
	mW93n4/gGqEKV
X-Google-Smtp-Source: AGHT+IH0wGJLDv1W3mr3bnOAu3g6WQKXYCFawYw6lfyfiAOXYmec3iDNTpos/eCVj6uQMs5qojigDg==
X-Received: by 2002:a05:6000:400f:b0:3a0:bad4:1247 with SMTP id ffacd0b85a97d-3a35c8203fdmr274011f8f.15.1747323107204;
        Thu, 15 May 2025 08:31:47 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm22617986f8f.4.2025.05.15.08.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:31:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly disabled links
Date: Thu, 15 May 2025 11:31:27 -0400
Message-Id: <20250515153128.147457-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

An explicitly disabled link is a DAI link in which one of its device
endpoints (e.g: codec or CPU) has been disabled in the DTS via the
"status" property. Formally speaking:

	OF_LINK_IS_DISABLED(lnk) = OF_NODE_IS_DISABLED(dev0) ||
	                           OF_NODE_IS_DISABLED(dev1);

where dev0 and dev1 are the two devices (CPU/codec) that make up the
link.

If at least one link was explicitly disabled that means DAPM routes
passed through the OF property "routing" can fail as some widgets might
not exist. Consider the following example:

	CODEC A has widgets A0, A1.
	CODEC B has widgets B0, B1.

	my-card {
		compatible = "audio-graph-card2":
		label = "my-label";
		links = <&cpu0_port>, <&cpu1_port>;
		routing = "A0", "A1",
		          "B0", "B1";
	};

	CODEC A's DT node was disabled.
	CODEC B's DT node is enabled.
	CPU0's DT node is enabled.
	CPU1's DT node is enabled.

If CODEC A's DT node is disabled via the 'status = "disabled"' property
that means the A0 -> A1 route cannot be created. This doesn't affect the
B0 -> B1 route though as CODEC B was never disabled in the DT.

This is why, if any explicitly disabled link is discovered, the
"disable_of_route_checks" flag is turned on.

If all links were explicitly disabled the sound card creation will fail.
Otherwise, if there's at least one link which wasn't explicitly disabled
then the sound card creation will succeed.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 include/sound/simple_card_utils.h     |   3 +-
 sound/soc/generic/audio-graph-card2.c | 231 ++++++++++++++++++++++++++
 2 files changed, 233 insertions(+), 1 deletion(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 69a9c9c4d0e9..3fde0314dbb2 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -132,9 +132,10 @@ struct simple_util_priv {
 #define SNDRV_MAX_LINKS 512
 
 struct link_info {
-	int link; /* number of link */
+	int link; /* number of available links */
 	int cpu;  /* turn for CPU / Codec */
 	struct prop_nums num[SNDRV_MAX_LINKS];
+	bool disabled_link; /* true if there's at least one explicitly disabled link */
 };
 
 int simple_util_parse_daifmt(struct device *dev,
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5dcc78c551a2..92774361a688 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1269,6 +1269,226 @@ static int graph_count(struct simple_util_priv *priv,
 	return graph_ret(priv, ret);
 }
 
+static bool single_port_device_is_disabled(struct device_node *port)
+{
+	struct device_node *port_device __free(device_node) = NULL;
+	struct device_node *ports __free(device_node) = port_to_ports(port);
+
+	if (!ports)
+		port_device = of_get_parent(port);
+	else
+		port_device = of_get_parent(ports);
+
+	return !of_device_is_available(port_device);
+}
+
+static bool multi_nm_port_device_is_disabled(struct device_node *port)
+{
+	struct device_node *ep, *prev = NULL;
+	struct device_node *remote_ep __free(device_node) = NULL;
+	struct device_node *remote_port __free(device_node) = NULL;
+	struct device_node *remote_device __free(device_node) = NULL;
+
+	while (1) {
+		ep = of_graph_get_next_port_endpoint(port, prev);
+		if (!ep)
+			break;
+
+		/* first endpoint is special because it points to the remote device */
+		if (!prev) {
+			remote_device = of_graph_get_remote_port(ep);
+
+			if (single_port_device_is_disabled(remote_device))
+				return true;
+
+			prev = ep;
+
+			continue;
+		}
+
+		/* first get the remote port associated with the current endpoint */
+		remote_port = of_graph_get_remote_port(ep);
+		if (!remote_port)
+			break;
+
+		/* ... then get the first endpoint in remote port */
+		remote_ep = of_graph_get_next_port_endpoint(remote_port, NULL);
+		if (!remote_ep)
+			break;
+
+		/* ... and finally get the remote device node */
+		remote_device = of_graph_get_remote_port(remote_ep);
+		if (!remote_device)
+			break;
+
+		if (single_port_device_is_disabled(remote_device))
+			return true;
+
+		prev = ep;
+	}
+
+	return false;
+}
+
+static int graph_get_port_endpoint_count(struct device_node *port)
+{
+	int num = 0;
+
+	for_each_of_graph_port_endpoint(port, it)
+		num++;
+
+	return num;
+}
+
+static bool multi_port_device_is_disabled(struct device_node *lnk)
+{
+	int i, ep_count;
+	struct device_node *port __free(device_node) = NULL;
+	struct device_node *port_ep __free(device_node) = NULL;
+	struct device_node *remote_port __free(device_node) = NULL;
+	struct device_node *ports __free(device_node) = port_to_ports(lnk);
+
+	if (!ports)
+		return false;
+
+	for (i = 0;; i++) {
+		port = of_graph_get_port_by_id(ports, i + 1);
+		if (!port)
+			break;
+
+		/* N CPUs to M CODECs will have the endpoint count > 1 */
+		ep_count = graph_get_port_endpoint_count(port);
+		if (!ep_count)
+			break;
+
+		if (ep_count > 1) {
+			if (multi_nm_port_device_is_disabled(port))
+				return true;
+
+			continue;
+		}
+
+		port_ep = of_graph_get_next_port_endpoint(port, NULL);
+		if (!port_ep)
+			break;
+
+		remote_port = of_graph_get_remote_port(port_ep);
+		if (!remote_port)
+			break;
+
+		/*
+		 * if one port device is disabled then the whole link will
+		 * be disabled, thus we can stop at the first disabled device.
+		 */
+		if (single_port_device_is_disabled(remote_port))
+			return true;
+	}
+
+	return false;
+}
+
+static bool normal_port_device_is_disabled(struct device_node *port)
+{
+	if (graph_lnk_is_multi(port))
+		return multi_port_device_is_disabled(port);
+	else
+		return single_port_device_is_disabled(port);
+}
+
+static bool _dpcm_c2c_link_is_disabled(struct snd_soc_card *card,
+				       struct device_node *lnk)
+{
+	struct device_node *ep __free(device_node) = NULL;
+	struct device_node *remote_port __free(device_node) = NULL;
+
+	ep = of_graph_get_next_port_endpoint(lnk, NULL);
+	if (!ep) {
+		dev_err(card->dev, "port has no endpoint\n");
+		return false;
+	}
+
+	remote_port = of_graph_get_remote_port(ep);
+	if (!remote_port) {
+		dev_err(card->dev, "failed to fetch remote port\n");
+		return false;
+	}
+
+	if (__graph_get_type(remote_port) == GRAPH_MULTI)
+		return multi_port_device_is_disabled(remote_port);
+	else
+		return single_port_device_is_disabled(remote_port);
+}
+
+static bool c2c_link_is_disabled(struct snd_soc_card *card,
+				 struct device_node *lnk)
+{
+	struct device_node *ports __free(device_node) = NULL;
+
+	ports = port_to_ports(lnk);
+
+	if (!ports) {
+		dev_err(card->dev, "C2C port should be child of 'ports'\n");
+		return false;
+	}
+
+	for_each_of_graph_port(ports, it) {
+		if (_dpcm_c2c_link_is_disabled(card, it))
+			return true;
+	};
+
+	return false;
+}
+
+static bool normal_link_is_disabled(struct snd_soc_card *card,
+				    struct device_node *lnk)
+{
+	struct device_node *cpu_port;
+	struct device_node *cpu_ep __free(device_node) = NULL;
+	struct device_node *codec_port  __free(device_node) = NULL;
+
+	cpu_port = lnk;
+
+	cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
+	if (!cpu_ep) {
+		dev_err(card->dev, "CPU port has no endpoint\n");
+		return false;
+	}
+
+	codec_port = of_graph_get_remote_port(cpu_ep);
+	if (!codec_port) {
+		dev_err(card->dev, "unable to find remote codec port\n");
+		return false;
+	}
+
+	return normal_port_device_is_disabled(codec_port) ||
+		normal_port_device_is_disabled(cpu_port);
+}
+
+static bool graph_link_is_disabled(struct simple_util_priv *priv,
+				   enum graph_type gtype,
+				   struct device_node *lnk,
+				   struct link_info *li)
+{
+	bool link_disabled = false;
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+
+	switch (gtype) {
+	case GRAPH_NORMAL:
+		link_disabled = normal_link_is_disabled(card, lnk);
+		break;
+	case GRAPH_DPCM:
+		link_disabled = _dpcm_c2c_link_is_disabled(card, lnk);
+		break;
+	case GRAPH_C2C:
+		link_disabled = c2c_link_is_disabled(card, lnk);
+		break;
+	default:
+		break;
+	}
+
+	return link_disabled;
+}
+
 static int graph_for_each_link(struct simple_util_priv *priv,
 			       struct graph2_custom_hooks *hooks,
 			       struct link_info *li,
@@ -1291,6 +1511,12 @@ static int graph_for_each_link(struct simple_util_priv *priv,
 
 		gtype = graph_get_type(priv, lnk);
 
+		if (graph_link_is_disabled(priv, gtype, lnk, li)) {
+			if (!li->disabled_link)
+				li->disabled_link = true;
+			continue;
+		}
+
 		ret = func(priv, hooks, gtype, lnk, li);
 		if (ret < 0)
 			break;
@@ -1325,6 +1551,11 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
+	if (li->disabled_link) {
+		dev_info(dev, "detected disabled link(s) - route creation may fail\n");
+		card->disable_of_route_checks = 1;
+	}
+
 	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
 		goto err;
-- 
2.34.1

