Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2B1D5AB5
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498042; cv=none; b=U1HRJ9AJANxT0f9aZxAlOVlSpmU0K1wzNHklmsQQKfFzBPMpqf6V5WV/Y0om1ETOsYbJqrlHZPPWR1+tVbtRn5bfGa1mF84vzCr2pfPM+0A3krIURiYQLRxc7NItukr5O3AGPtOLAbiA+McPB8uRMGtucfBArj00RyaLKC3BCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498042; c=relaxed/simple;
	bh=Ap0yDjP6kDXZa+LMpowMdXjr2vFMubs2IUYLPT/y4wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6rAMHEmatenGm/FlR3TUXW0YacccTT8l5nJmF4L/+TDxTo6trbrFwLQBHA5VZJd4WKTDnNhFI6frxuBQDBfMKACICKpOoxZg1GVwaPRJaahjzIR/i+f5KjMie22pi/tuzKxbNqbCZAasVzFu4Gw+JcCrsMBmfCQeSUVOu/5eBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVJiyskK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVJiyskK"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401e6efffcso3645016e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498038; x=1739102838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhw5N6hu1mAiszBnZTb89OhX/h/jTmadLA2Ac168sA0=;
        b=UVJiyskKoh05hCo6TgrB4eqewB8oqEF2CFim1feVJ/x5BsiK47w/3ErGcyY/IUb/Xg
         ds0kyHsQtxllFI+FaAnY7uxvub/wECjz/aQUuJXOMgHCWXpB5T4qHffa86SEsqSynoyo
         R1nFr+goCOyfNukhqrxQU1gce8mgt6gnbnF6vCF2J5Af+orhxuVq06MdWhQt7n/DfjY1
         v4Zk6oh98PzjKc7y2CYAz+SIsgB0ftH4Wa0Dy2qQWS472DjSD9Lt6qEWBHnycM8JV8sP
         2cgYITQ0HMcgDRsE3CnUCniAAph6HFYtRlNjuvlKl4DXul6X5sUjqOjmzeMfHNPD0AtD
         rCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498038; x=1739102838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhw5N6hu1mAiszBnZTb89OhX/h/jTmadLA2Ac168sA0=;
        b=KTDRtqR+8LgkpBsexwLnlir0Qg+ys4xbavcg5ZqbEwxkO63kCUuuW48dF/kFvByWAz
         gwF2PsV9ytMosN+MGcjjeY/MactKc6oRMoTJns4jHe7Q7MEQju3C4+VVne5TiNX3+vtJ
         LCFfN1A7ekatvxVBCBPtYqiyklkqnuPAvmE5G3YR/keWrpLUfKgRr5WPwwp/gha1hND5
         ld7kM1JWwzToydxierNJfg5s64hV8Ep301mlrFRZ+D9yrJifM/CUizssfFgGcIKTk/FP
         fMJWxZKX0WdFBeI+Bv+8LhrnNZJ4XFs1DbnpxBL45WQqVwSt9MXZ5/Yqv1Wnl16XBi8R
         ImRw==
X-Forwarded-Encrypted: i=1; AJvYcCXsKjzLMoyf2rqHzJDEPBDJAWYDPQzO1rfH9Io285wWylFNZs54bqOXM9tOZWQCoiAwGaX4KMQXwHcIujk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw7uaopLhlJGkDFSbwpTJlsBR65hdHr288cP1Ug3MWBYzhbATH
	FFvabHHotkanYk+2wLqRUTL5gyVf5t3Te55VMxVBvfoMeW8kW9oN2I2/mE4uphU=
X-Gm-Gg: ASbGnctaI+21xk6VKOxNgiQb2s6px3nF0PM5cGb7OFIdCC6cVFnqFir121XLY8R61wZ
	5davT5n0OowoAiqmMV71l4fG0gVhV2okEqCecL9a+m5/bnZT5oLMaml6OZ1n3SZF9IddrpE2l/J
	RlVwFI4woLKP30B7q4k7XcrDpyLRpwC7Y8P7WLoQjX8R6ixiZs35Fm9ru++yvg5CWnLyZadP0By
	VmsO1RSeT3kkr+1EsycVNdUzk3ZyNNcX9jCwTal8QeGdY3Iq2Ek/yq/66UCTYYMS7LQgAbIUm38
	FowDyny5FgDe/QATqgk3ZOQ=
X-Google-Smtp-Source: AGHT+IFKxqh5RzRr7EynRmlZdOMQxYF98ueum1lpXp6uhGzXBycMfXIfxbOZE8sRaPbWGVtxWKLsLA==
X-Received: by 2002:a05:6512:2311:b0:540:1d0a:581e with SMTP id 2adb3069b0e04-543e4c01840mr6466809e87.28.1738498038133;
        Sun, 02 Feb 2025 04:07:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:08 +0200
Subject: [PATCH v4 01/12] drm/connector: add CEC-related fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-1-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3396;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ap0yDjP6kDXZa+LMpowMdXjr2vFMubs2IUYLPT/y4wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/uPICuG7Dl1z2vtRP2DAhfWXYDYzZ5xvAZi
 FLVShdhsCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7gAKCRCLPIo+Aiko
 1aZNB/9viZ7oSe7tqC3ymZ+zjbPI3JmDZgQBp4KG8RcUmjqA0ZvQ7YrVp+6dH7BFj0GA0akBZ2F
 xRF0L58sJQuRUPFlyhsOgjhhRkNg+doYDS4jHJwplm8p9JrHyEKbJAC16824VBrzYxiVnzRRhA2
 kP4AO8fD2FCl/q/ip1E8AlbEalkvzgpe238+aIX8nt2BKTOzFdk/eB2dNT1DOP3fYtSF4CE+skb
 cNDeygAkt+DmFPfPAWhTohRjuL/uSAU2qqgcOI5wdwaD9D4K8yTGXPz/sqvOPTsIjaConmYo3Vp
 JQdB89sqJ501S8eBDQLpUMN0hV9U+P7+CWRjqm5nhqig9dPA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As a preparation to adding HDMI CEC helper code, add CEC-related fields
to the struct drm_connector. Include both cec_adapter and cec_notifier,
allowing drivers to select which one to use. The unregister callback
is provided to let drivers unregister CEC-related data in a generic way
without polluting drm_connector.c with dependencies on the CEC
functions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c |  1 +
 include/drm/drm_connector.h     | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1383fa9fff9bcf31488453e209a36c6fe97be2f1..9890b00e8f9be856f67cc2835733a056ddb98efb 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->probed_modes);
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
+	mutex_init(&connector->cec.mutex);
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index f13d597370a30dc1b14c630ee00145256052ba56..790a4d6266436b1853ba458456529403e5597a3b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,7 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct drm_edid;
+struct cec_adapter;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1191,6 +1192,21 @@ struct drm_connector_hdmi_audio_funcs {
 			   bool enable, int direction);
 };
 
+/**
+ * struct drm_connector_cec_funcs - drm_hdmi_connector control functions
+ */
+struct drm_connector_cec_funcs {
+	/**
+	 * @adap_unregister: unregister CEC adapter / notifier.
+	 *
+	 * The callback to unregister CEC adapter or notifier, so that the core
+	 * DRM layer doesn't depend on the CEC_CORE. The callback should also
+	 * clean all data in the @drm_connector_cec struct, including the
+	 * 'funcs' field.
+	 */
+	void (*unregister)(struct drm_connector *connector);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1832,6 +1848,31 @@ struct drm_connector_hdmi {
 	} infoframes;
 };
 
+/**
+ * struct drm_connector_cec - DRM Connector CEC-related structure
+ */
+struct drm_connector_cec {
+	/**
+	 * @mutex: protects all fields in this structure.
+	 */
+	struct mutex mutex;
+
+	/**
+	 * @adap: CEC adapter corresponding to the DRM connector.
+	 */
+	struct cec_adapter *adapter;
+
+	/**
+	 * @notifier: CEC notifier corresponding to the DRM connector.
+	 */
+	struct cec_notifier *notifier;
+
+	/**
+	 * @funcs: CEC Control Functions
+	 */
+	const struct drm_connector_cec_funcs *funcs;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2253,6 +2294,11 @@ struct drm_connector {
 	 * @hdmi_audio: HDMI codec properties and non-DRM state.
 	 */
 	struct drm_connector_hdmi_audio hdmi_audio;
+
+	/**
+	 * @cec: CEC-related data.
+	 */
+	struct drm_connector_cec cec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5

