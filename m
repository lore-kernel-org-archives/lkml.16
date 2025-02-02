Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E71DB922
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498066; cv=none; b=nncgWb0nK5M286ewFSuHOQ6rCfedOY6S5qV+v2BWLxnBgPl/MwSl5voRP7KoD497CGu/YH9AMKskr9NSOxxqYPGxUTuLLgANxRxIQepIvxpJ2k5juwvKsanlRbcfr6u1r4v1QWXQgtMvH24KS//cZOni0wogSZfF5nLDh3oHpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498066; c=relaxed/simple;
	bh=XuOnNZyKMEJb21dZJ9EH3JWXRxLeBXLJ2lTgW8+4Ysg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6twV6Ni/lX86e51G27G4uXsIh7dzC0+3khIMqbwrBFDxR1mN20+9V0U5idJfO+OLgMU+huZI65oNVXARk424K3HUGp+ZMwO+tIn07kpDuDMJlof4HeA7lCLHfHAhca4jtNndd3PVa1wAM8z4vkGZx0NcuYDJ2ACzx6ZAsJeo6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y/Utwt9W; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y/Utwt9W"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so3557169e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498062; x=1739102862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MoLTLfgvVTsssQwkzTJYb/dVBWcoZtvFgCsxLGAPgE=;
        b=Y/Utwt9WgIpcnI+eGoPL7t1x6AU0QKX67H1oJQPGaseFiYS8yCEqfzvpSlpS4z2Mm4
         6DRDXDKQiboKWwZZTvb5XEp0qVYn4Cl277E5qCqSh5yvJfXoI8K2DSOWYLU0CtHxm9y5
         myaaYPNCP7OdmzVcuWHKGfa4O6YO4veoG4lr3LPuMvJcm43B3DugUsFSL4/JvL+Y/VD7
         DpI9ReS4m47NMepYxO2iCCryWFEII6uzH3fepEUyB+vTT0DHXYcHggXjL0A3b3r7UlA4
         xhMALPAA152SH7bLODp+V5JqVLTOD9MRQOt/Ufk21C0f40c+e/HvhMHq/hkpZj4Qaf4O
         bWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498062; x=1739102862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MoLTLfgvVTsssQwkzTJYb/dVBWcoZtvFgCsxLGAPgE=;
        b=vAFYWZ8SjZjGZJL8ArNLF8rAM+D1GuelvowN/k+DVNeWdtdDDWTNBtCz4yQ+BeEj+0
         uDGzBQgfh5zLRuWQM8JxFrgTWft38IkhEWtOeIMhDV4hOzuLkTVWENruhUMj7y2hyg6F
         44NbOGp9zZe7Ap1vGvJdkuH5dV2AsIo4Z+6yBDCDftP69H5VIMV3fuENZJKPKWg34jBI
         t/vhU90/34FnaFmkRzs0a2N3mUMzVgj/i2QstPx1X1nYYfoh3BmANSOipfToR0m1WjJ5
         SeGbTbrKpHdftgw1lNy0g5tIw+V1Jm0GzZiITKPRRu6rnp80ya16hRAuaTfh4wdWfuOF
         EmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjP7/1iaGZA3VvnEl5k1MsdfxOSWVGGSd+xw2bGq2+Z489bgHpoWv3ELmpaP0o45nMByelSRCgGGqb2J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0f8/ft+g3cPBBPXvH0oqVHt/rU7YgpMZBQTN+4BUSgJ1NSQR
	qBP21EW3Hy0d5uUN8PmjachxRt9nyMe4KmfyXqceBNO6VfYPNkH5BXdk6HnnMlo=
X-Gm-Gg: ASbGncsiBsWxJpWs2JfSx7ala35Acn8qHroeicgLJ9IxUEfTsGjRkTSWvjNUDH0deA/
	SvSU/N/PDbNcHqpVbpVg3H62JpOsgXDKVKkQo0r2bHWDJAs+hpgo55r4wmGFi0q66hwm4BHjh1s
	TuhjZYEwZdx9JSFe8ymMM7y5DcrsdGhqt5lkdUhA49axA7iw7hvLB1cQTeUcok24o/uhSUWLabD
	m9svKlcvUARt7c0Kz2iFBTLq2sHRmbLbfOUzt1VyCsOact5OfP26UqufB11zOyBQLtxRSA69w9i
	QCWpAbtimzuioqtf2iJh1Us=
X-Google-Smtp-Source: AGHT+IEUfKalUUWmsX+oOc7nb71WmMl6KQYlZpeoQhbwmbgJuGfKMeIWAK+je0Hh3gf7oZept1ESmQ==
X-Received: by 2002:ac2:4359:0:b0:542:63a8:3939 with SMTP id 2adb3069b0e04-543e4bda7f7mr4400941e87.8.1738498062162;
        Sun, 02 Feb 2025 04:07:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:18 +0200
Subject: [PATCH v4 11/12] drm/bridge: allow limiting I2S formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-11-a71620a54d50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4155;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XuOnNZyKMEJb21dZJ9EH3JWXRxLeBXLJ2lTgW8+4Ysg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/wiHzrUFyZRkzXg+ByNNejNZcYn/ntJumxS
 9JD2ckY6uiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f8AAKCRCLPIo+Aiko
 1ZaIB/9P498XbecyJ6BY6TpSBwrlCvRt4rxa7PvPWrV13TLDTs+X1LjJ24rZz+Qq0rjMnUDtBo8
 mMhyqMNGSjmGwz+xgpf2EiyXPJoDTUWv4RlWpevFe2FKXE7ZDI01M4ZedO/z/TBCaiORE+ky/bB
 LiMQQqU6JEM0WTatd3WuZTu7H//dzRLiHJhZwBaoFXaneIXnow+wJTpOv3GrXJ4NKWrOB0gEQwk
 QFn+Y/bhJ2xP4ALG4435t1OUdPWNWt0cC+vkGYwvn25Yjb44B2CqWA+xbd8Wo2ZeMCpI/pIQUM6
 WsPTDzmTmKtOdZiN68MGZaUqLtMdUKfjc9aLYmZrttcawjmU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

By default HDMI codec registers all formats supported on the I2S bus.
Allow bridges (and connectors) to limit the list of the PCM formats
supported by the HDMI codec.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 include/drm/display/drm_hdmi_audio_helper.h     | 1 +
 include/drm/drm_bridge.h                        | 7 +++++++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5b77fd59d79abddd419e611a7868b001857ccb37..28055bc2e7069d738bbe76b16c3bbde06f2d6e4e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -698,6 +698,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 							    bridge->hdmi_dev,
 							    &drm_bridge_connector_hdmi_audio_funcs,
 							    bridge->hdmi_audio_max_i2s_playback_channels,
+							    bridge->hdmi_audio_i2s_formats,
 							    bridge->hdmi_audio_spdif_playback,
 							    bridge->hdmi_audio_dai_port);
 			if (ret)
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..589b0bd6c21366b83bd4d1131e89c71644ebc401 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -154,6 +154,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int dai_port)
 {
@@ -161,6 +162,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 		.ops = &drm_connector_hdmi_audio_ops,
 		.max_i2s_channels = max_i2s_playback_channels,
 		.i2s = !!max_i2s_playback_channels,
+		.i2s_formats = i2s_formats,
 		.spdif = spdif_playback,
 		.no_i2s_capture = true,
 		.no_spdif_capture = true,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1108983c44858382cb9f09b686956903645ebe0a..fcaba4a64a33b2267b22960772c2977b4109c67f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -582,7 +582,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
 					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
+					    8, 0, false, -1);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/display/drm_hdmi_audio_helper.h b/include/drm/display/drm_hdmi_audio_helper.h
index c9a6faef4109f20ba79b610a9d5e8d5980efe2d1..44d910bdc72dd2fdbbe7ada65b67080d4a41e88b 100644
--- a/include/drm/display/drm_hdmi_audio_helper.h
+++ b/include/drm/display/drm_hdmi_audio_helper.h
@@ -14,6 +14,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int sound_dai_port);
 void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b55e80a57758e8b652eac0cd01cb245a04e221f5..3fcefe8c6720e193beefd7019fa456231181cddb 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -920,6 +920,13 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
+	/**
+	 * @hdmi_audio_i2s_formats: supported I2S formats, optional. The
+	 * default is to allow all formats supported by the corresponding I2S
+	 * bus driver.
+	 */
+	u64 hdmi_audio_i2s_formats;
+
 	/**
 	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
 	 */

-- 
2.39.5

