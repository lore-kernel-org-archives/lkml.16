Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF41E0DE8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745635702; cv=none; b=mZh0Yy7YYYYoSsHDlJDWhnt0SZOgELW8VsYybElmCm6jL6pA3tIWCynTnOrAFk93OmfTmy439qLrztcaI3oFOeayOlrSmyPy2lEkfSitmJSy9s1BrUAPQ7Y+NoIDmpFbLcjh4jlPtx4dQ7diSQsj+rEVct0ysh57H50yIIeSUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745635702; c=relaxed/simple;
	bh=EMvMM+Lp6ZSUyF9Ng1oKtex7ibkM53UrOtVhDe2MqUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BaAvo64QUJDzoz/CHlXUebh2u7yG7c0oBDqh24GlpEl5ZCsFTN/X7EEbrWIN4H2b6K6rW2OYpFqxKBVzXgrukz8xj9LvCIuu8Xd9IG5mXnhD6nYGJsplA/zPWsx5EYvEQOCxgF7g62G3rDV/S1MG//+WUz5R1lIVQIAgO07KCfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZnLck5ks; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZnLck5ks"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7398d65476eso2455304b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745635700; x=1746240500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClyhMFjoYUbJg9OMH9NTv9ViEJNVf/P1++kB07q8nRo=;
        b=ZnLck5ksD1WKXEv9GETqzLslZhVtmaXKMSvUgBwF9600+5aT3pVbBDtNP/m7avEqir
         Bs3SxDKtqAHDEbYQBZQttPgdLBG1/hIoAH6Sem6cIEk/WMvY3no1v/qmq3folXbMI3Lq
         YQfEFYKWK64WxB6ZyyTVnOWEH4fUo1jsw5WbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745635700; x=1746240500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClyhMFjoYUbJg9OMH9NTv9ViEJNVf/P1++kB07q8nRo=;
        b=oKL5Oa2wYeB6wAXp0egRPXfll9nydr4iPAo/Pj5ASCPMwmzhCzsw1BV/ym8li/+gZA
         xiOQeVYjnMapIzDEBm0s7hSdsaJK01J+I510GJ+f73gFPjvvwafV264QLkB5l8wUi6fg
         O1SYbrVbheyqXRsSfLJy3oJLNVTT3nOrR9kop3wPG27qByZcdWKvBSdFj/yLmugZslAa
         sH/dMonIxyKfHLYUiQYfwJ4FfuyBENXNvscR+3oeMBrbEIaVKplwstfMGjFkfl1HQM8S
         yL7zGTGD5P8Q3H1ypDcq2VroxoJVJ08H93w07h3R9wWJGeqtzg5TpCSxj1g2VR81Oeut
         MAnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+j/DgSfd82WpkhaRYM+v4x+c/LzG39ksf1skrZmMZ6is6xIGuOY+4v12KGsoqLwEbiYKwyk9rzeL2zL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydn47k+wfhf3HWLRldYt+9fqRGsZx1ntj6cvuy5nnn86ITWQ8m
	mEoh5sYMJGKBQ0PDEEquZBa3eb08qzxxgLFfaM9HfLp0DruAassDASOI2JCfZw==
X-Gm-Gg: ASbGncsZbavqXTOvYCdO9q6GBHD3BWlegGEPoFEaFLnwnm2Q17nr3HfCgonWTtc7J5d
	zGN46I3RMPf023jtQO32BuJf9HyfN10N/bd8zlC4X6Zwt76WgmvOPMLxRGMQmSUDfxGvVOaNVmJ
	zQ1k/1ARAXfQmQnGQG+BMeLaM4IMWKrkzFLeE+pD8DPX88m+NuoZJzMZoLBPMrziCZh/5hlajxM
	IDQzYhoh4D9G4TfXFK9Hh8jdZ4bKFGQdjJKVYZfiPNumW2BpH0RAYvR95UAEH20tG367rtKsMad
	SZxQGQVacKiTYuTYnEd2G+01lNfSG09HKnxCLpvZRlsSveZTx6pFd5vD6WbDgPZwv3H9YAlF0DK
	9/kgt0v7Ms3N8UCJuHP4xoaqR3REw9ZEC
X-Google-Smtp-Source: AGHT+IG7QujE+QurTzz4S9vIj4SYcTnWkBOklhQ6nZ+0WBCMj6+VZ1oiPWchGl7oePibCwldroGjqg==
X-Received: by 2002:a05:6a00:1947:b0:736:b400:b58f with SMTP id d2e1a72fcca58-73e2660902fmr14418002b3a.0.1745635700116;
        Fri, 25 Apr 2025 19:48:20 -0700 (PDT)
Received: from bleungmegatop.c.googlers.com.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25accfc9sm4047535b3a.176.2025.04.25.19.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:48:19 -0700 (PDT)
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
Subject: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in DP PORT VDO
Date: Sat, 26 Apr 2025 02:48:10 +0000
Message-ID: <20250426024810.3876884-1-bleung@chromium.org>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
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

Signed-off-by: Benson Leung <bleung@chromium.org>
---
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
2.49.0.850.g28803427d3-goog

