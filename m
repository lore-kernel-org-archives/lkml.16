Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1ED26E158
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470628; cv=none; b=AkheCBtmnQ8x1VpHB9OmMGOYAgxed0yv4mJ2J3dkiDWT4cNHQTIK4s3D3h13BSbcOkr7UjTQDKZOKVknqNJiiBKSpazvVcuLxmPfsSBOPnZ9ySt2spz+JO3fibjJ9jlfdunqgGHoF97EgwHqAcoO/Qq3PrsOWkwVdI4LiS6bLRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470628; c=relaxed/simple;
	bh=ZR0smQcVBHP0L6IgFqeTioftf6YGCApCP+omIEUN/2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OL5+doKK9IAQxgwyAjuA1hyjfgbns8LgkemKkJisnci0dESPURBRktWJwMtI736mCpIOlFXwXSP21EBI5FukyUwcWeds3JiJt3NA07V4ByRtIZmOiF5scUFyYSipomskWWNAsPoIAbCfFQ5FfZ12yZtZlU1JhS6S1is187FMRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfDzp+VW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfDzp+VW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399838db7fso4990175b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746470626; x=1747075426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
        b=hfDzp+VWwcmyZYXDkindWPq7DwXIASjYCJ4aOt2xKLmXhscVaULia1KbOEuULwui8K
         eU7yaQ9ABGboCOMLbLnjviZraxRIUZwCNEjmbBBDVPSdOcNMJbD2seDGwniwDmU4PoGN
         c9Yjyr7SLOnlmlxOrEnXxf5DLTzyitM57DeLedPpp5Zh6ex0ydgwMDJWBGShwnXRwkoj
         UCWTUxOENjTiYqYZUc1ooremnu+cxFDOP1y8H3htyDimhNvS2taTGtCDg37k0tyOF2uZ
         qczeiJN5SdX6Wjv/qfSjaJObKfFePvJBXXan5GIqodKAUlvxjWpUwx3tuGvb6p5b3fej
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470626; x=1747075426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQzbmjudt+hJvG7n8NMoirGU7KRPkcRToJ0JJSw35CU=;
        b=sU4euA2b+LD60IwxHEp715xFR3JcqKqZ6UCiBXdk3KlLyTW78wDfy70Y5M6KNDAK62
         +5ZDSJKyoEc/LMYwdSUsYCPz9aoJClM307fgrVMwL8S1GPh40yEFepd4b2rlYSNcq2QX
         FhrG5SXEQQF7ohfZzXqNyf7fwFjccLtuTJSdEzRL8+HbAX7RR5iJ4xLEls4mVi+6ENqf
         AgrPeiqJcDcVzxdtCwIbGU7oxJQ3ccSXeKrhzv6+E2mqDNMbHteH7R4X1gXPdkSwFmsf
         aXpi616mNDMDJvC2MITA9WpaGaHJU6paVbrCxE39D8TYjr7bNJvQ1++N+cu/4NMAK27+
         +8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1/PptLXEpIe54/OJY9xoavoY5ms+gDweY8MwYcRi25qVRCr2E/AuK2XnECO2HfiwBy5zAzSyHtBFrKtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4b3OFHg4UpvalzlbOLMnTOryn3LNA5SLiyA2D/c9VbvWYDvK8
	3dBMgLDli5nWWVME1uroGx12H+6cLcXB9gODOpmjOslDR4m8r/6Z7sJL2H2J
X-Gm-Gg: ASbGncuVGPNLepkoFCmg+bAngY69XBewBenmCe354105AfOrknHI7KO/4vAJBUkukGv
	XglWnaf/etp6RfAd0I3Qv2ixxWLXC9G8qUHPinVCqHsE9sTjL6thgyTbTUFLLkt71KtsSrFEgJI
	VS+aPdoT9re5leJRekHrt63SUpTRgjn646k+NnYH5BFu4SPsg8Y0o4lRR78NANnsAEwVSZh92Ct
	pEskdn1INyhbLsLcXbwpnTeaPQHySuFL1JEEuO6ke68rmGImRDKXn/yJnVL5ytWLvnSxe3GwSN1
	fs5JkYCbss/kjJWAxUzHeyuPovPtPhoz+tS+VJ2f4yUaazVbZxC0frq6NZxXxbf9DJQNlQ==
X-Google-Smtp-Source: AGHT+IGMBauXSP9NfIaQaM7+UUg7ZcaSiDMXtLxYknxQzEukhYbTe1ekmAy1F/1+blL1smz9X2PsTg==
X-Received: by 2002:a05:6a00:1308:b0:73d:f9d2:9c64 with SMTP id d2e1a72fcca58-74090eb4df2mr813280b3a.10.1746470625673;
        Mon, 05 May 2025 11:43:45 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:afa:5db4:54e4:f59c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405902167csm7433788b3a.98.2025.05.05.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:43:45 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Date: Tue,  6 May 2025 02:43:38 +0800
Message-ID: <20250505184338.678540-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coverity scan reported the usage of "mode->clock * 1000" may lead to
integer overflow. Use "1000ULL" instead of "1000"
when utilizing it to avoid potential integer overflow issue.

Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Use 1000ULL instead of casting the type of "mode->clock"
	- Refine commit title and message
	- Fix the issue for the evaluation inside drm_mode_status
	  meson_encoder_hdmi_mode_valid() as well

Christophe,
Thanks for your review and your suggestion, I think I should add a tag
for you,too, but I'm not sure what should I add, if you would be so kind
please let me know how should I tag you in the patch.

Best regards,
I Hsin Cheng
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 7752d8ac85f0..c08fa93e50a3 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 	unsigned long long venc_freq;
 	unsigned long long hdmi_freq;
 
-	vclk_freq = mode->clock * 1000;
+	vclk_freq = mode->clock * 1000ULL;
 
 	/* For 420, pixel clock is half unlike venc clock */
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
@@ -123,7 +123,7 @@ static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bri
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 	struct meson_drm *priv = encoder_hdmi->priv;
 	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
-	unsigned long long clock = mode->clock * 1000;
+	unsigned long long clock = mode->clock * 1000ULL;
 	unsigned long long phy_freq;
 	unsigned long long vclk_freq;
 	unsigned long long venc_freq;
-- 
2.43.0

