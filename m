Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2A18DB0A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862522; cv=none; b=JjydoQTLuJWTzValdFZZQjhsaa/crnlBMRHv7hZ5FXSNkdpgHsm/zocyBvVFxY4UZbSRyEZuwsepvG5XyBhlZBJubbzcxlJScuR7hVgYqNJn6O8tlVKGvRT2Wluxf7K1U0mURtPhLXsEzoqMdqbptVaBlJx8PYdQZLfoPyIkEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862522; c=relaxed/simple;
	bh=LAPyuo4qTGLqNiq7tRoSZMooG2Sce1BAP3WQqZkKRxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPSmTd0MS1vgkrYqPZOKGtN45O8AKma0LleYeB/2i4MYHIY/NPsQHrdolvhnUv8S29HHwxwBBh+j4UWaB7quZ6Hz1LMyg4ru6a3mpJ34N0Dueux9osVdJnzauVz/pjxRhSBKNtoI40NB3nO7Gt9hytTKX5rkNlVFwJYaZ8N4XFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WRGnydAK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WRGnydAK"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so3607515a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745862520; x=1746467320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkQi3qYu1F8pnFJIyEPr/pJR3vsWi3szKANU55XaSrU=;
        b=WRGnydAKSferMfPwY+YiF8+d6Nz89kJaYQ7ITFJY096awln67nb7NDo8kIRgHwcoWS
         YZ7iaT5Qqo7emIwluTOphp7lPBCrfgahj55sOI6VsrY5UuAk9H7u8Z9MbdCFe6p3G82A
         oPI7FS9SUuwQTfKzTzZ2uWH8ObwcIk4st52Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862520; x=1746467320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkQi3qYu1F8pnFJIyEPr/pJR3vsWi3szKANU55XaSrU=;
        b=uqm1lVGUMzANjIpoLzpZimSmeSsPfXukbvVrdfiwEBYaX/xmMGFWCnvfptoolh5fto
         ff8VN8Q5TmfAAw1oza2UgR62nA8Qn/KlIndDGVlaNJoKUMh+Q0S+ixgbQiCHEfvQOngW
         hTdP7nlXiMX0UEkKYn+KKxxmI4O1NzPy/DFIKBMMs5EesA2kvo83brlc90J+9lUh8fPl
         vh27kduMO0K9BUYFxIrUXYpa/DfZXGxleFJcBbexXv/K0ydcfl02vboDQIdYNtX6EcE7
         LzK2M/1pLrjf21MQzPmk39ObYf5UkbLSCyHY6T2rRZo8u1QkofeDNAmYE3Gpfx4ZidMS
         RSgA==
X-Forwarded-Encrypted: i=1; AJvYcCVbtrlJffuSMw7YNsVWlWBEkA4Ux4EVA0u395R58tKxlhAslBAr73TDn2sREfcNxggZFPVeIzshAxvXXmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxubSn+EirhLMV3mKNC61YVRm1cD6Z5ey9RLBfMmX67qe99iRgW
	XtmHnjVXUn4vOEld5qwOyiyvXWQ1fKrgj5EtkcRSL3xHsJnKplwwax27LtJviw==
X-Gm-Gg: ASbGncuQBent0nK7LfWDLLn2ZVKZustmaJQBzu9phKq8UH/ZGhXWlQu6sjedmWjbZ95
	YMnKuCRhEP4inFToBwX7ZqjTftPPoLQM+PlXve5NpZX/GaMovy6i2xtj0PnphSK8hYscRl7nwzE
	9iNF2gdbJN1+wQ5wlwvbV9w6LRUvkloXct1v2yVPxSPeHo77DRI+XwhDhAjLYa251/1MXAF8kdn
	d12A2a5AEYd6Uy/amf3wGf3T3X4hxJdk9rX4rCLmMCtw289IJOe5r0Rw2y/Pn4XEnzhRNWBBV2n
	7Tep34Nm5Nv+JsFXSNEr65uNWr4ZLt4BrbEC3kxmiU8Fg0uI//B50uU1Ee/MGE0ic9kN92Conmv
	jRassTUTyB7QbLv7zZKXwPtYwk/d2gw==
X-Google-Smtp-Source: AGHT+IHo79Xwon0l3qUnRl+ZO2KJhCGKB28PjUYLLf+CEUhzlw2T5PW/6v6fBq/mxNwFTJI3f94TpQ==
X-Received: by 2002:a05:6a20:e68b:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-2045b99ba90mr16427916637.33.1745862520239;
        Mon, 28 Apr 2025 10:48:40 -0700 (PDT)
Received: from bleungmegatop.c.googlers.com.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a14asm8513987b3a.131.2025.04.28.10.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:48:39 -0700 (PDT)
From: Benson Leung <bleung@chromium.org>
To: abhishekpandit@chromium.org,
	jthies@google.com,
	akuchynski@chromium.org,
	tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: sukoo@google.com,
	bleung@google.com,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: Set Pin Assignment E in DP PORT VDO
Date: Mon, 28 Apr 2025 17:48:28 +0000
Message-ID: <20250428174828.13939-1-bleung@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
References: <20250426024810.3876884-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pin C and D are used on C-to-C cable applications including docks,
and for USB-C adapters that convert from DP over USB-C to other
video standards.

Pin Assignment E is intended to be used with adapter from USB-C to DP
plugs or receptacles.

All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
Source with support for all 3 pin assignments. Pin Assignment E is required
in order to support if the user attaches a Pin E C-to-DP cable.

Without this, the displayport.c alt mode driver will error out of
dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
pin assignment between the DFP_D and UFP_D.

Fixes: dbb3fc0ffa95 ("platform/chrome: cros_ec_typec: Displayport support")

Signed-off-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Jameson Thies <jthies@google.com>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Notes:
    v2 - Add Fixes to commit message.

 drivers/platform/chrome/cros_ec_typec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index d2228720991f..7678e3d05fd3 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -22,8 +22,10 @@
 
 #define DRV_NAME "cros-ec-typec"
 
-#define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
-				DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
+#define DP_PORT_VDO	(DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
+			 DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
+						BIT(DP_PIN_ASSIGN_D) | \
+						BIT(DP_PIN_ASSIGN_E)))
 
 static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 {
-- 
2.49.0.901.g37484f566f-goog

