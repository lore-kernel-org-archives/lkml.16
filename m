Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28117E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599910; cv=none; b=YWHkeHUcnXYUQ93BtheABdY3W3ERp8av7p+Lko/odPEpV9N2RreqlnSWr94exL2013ARK3L3Sa8ftoRox0UQNYhu4fFkqk0LxdworuROvHAnrIdWvfUlcLqdcSK7Qk7KLH+LnPAbdHdQz+nKQ163yfusgjXOeLpp5MtKOOOTCbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599910; c=relaxed/simple;
	bh=bhko6GOxCptXIIXgfK+LYXNuUXADz1xeT/14BALVMlo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=d7Wm+kSRM51Gb860NpEG5MMC2J+yTP/inMT0HILgnOUb4YOg/SgcBSicub6jcPMjbkZfpXhmTHYr1yC+KiUOKKVa7GLskY2qDfRVtJgIWxwSotA7QET9kwe/Z79a5u7qP/H0MMnHqtGJDKsbiJGtt6Yk3XjKQhkvCApGGDcJsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGu/90e4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGu/90e4"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5373452b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749599908; x=1750204708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cXko/sdujaNHPqqtbo6n7ThRGJuEz6vJP9Co7yw2sQ=;
        b=DGu/90e4I1w9uh0sIuPoN4iIyR3rNEmKgIb+Bwr/8jOsd+fDpess00zqYSVY/5D+Dj
         FSknXJcJZBXmZsOc/HQOuqeCxBjdZPgowUpsIhpNivyPFKFKoAUJVMP7Bba00KGHFLGE
         FLSlFvaAIj6WoHtpUd0LE2lywcC9YmSxFItRMvFX+HigNLXX/IOP46OiqwAh7jnbf1NS
         EkyKz5lqckvc9Q5mmjCwNH43Nz0fZQB1D0ZQE6Y+h23coARQH6IJzZdwrdUl/CnI7oax
         ikf5dJx34gFnWTa1Y8ZdGxcBkUkZBb04lMAsCwWqJ1m1gcpIGs7DHVZkRmK9WAPlbP/0
         5B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749599908; x=1750204708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cXko/sdujaNHPqqtbo6n7ThRGJuEz6vJP9Co7yw2sQ=;
        b=LNB4V/qSsnqoChA/m1c715R4/3ZSpE+efaDCKFa6TYQPsEilD9oI7vxgXwz90Fvxj8
         neE80i+zuILsHmlWO/vagcExJQMk3ybMwiDr7sqka6ZuXiEYy4+Z9jySmbn344azrdPe
         gRvN8VRFKOVYm20VdWE6jEjcFjAiFnEAczSA4OUVM/LSAS4MZInihzdbdzVbhcilBqcx
         IjRZ864LZNcaeQQdEZeFpYRadjK+wloM2KvCXSJykv9lS0cttcgKzO6mdRAQ27YFX+So
         jL5S1j+wMqhXQrUrPcOeJ/4SPnmYdQ6bzDoMQQ175kc7g2ZqkEtd0Sw2BrkxCTocl6UK
         ZMvw==
X-Forwarded-Encrypted: i=1; AJvYcCWgdi2dJiupE+mGLyxj6ziJCFgS3X2NCfIAfQf42BAw8+qbFjV2gg0n1uLVm82rf70OBmhow13dMX+J5xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YycrMDcYgoX4MckFLPZT/z7lL8JLnVIlLuYuB6gdCU7+SuEdBkD
	6rMjsZmEhG9KSXIfVjdlMPlIW3SnM4pSCyEv5LwKZ31Cn3T8sphv1DO+
X-Gm-Gg: ASbGncthTLq1+a+KOKMrMpd4TsnID1Xyddzsct4klqXtHSUOTFMfFMVqxHOSxSR3cC2
	79AaftXbhYHxAzEKTA8RSZgXfl3AXry/jQ9NSOAxW4rKrfOAl6uwZB/KCUeGSqjhAidVk2SpE3E
	ugZKz4gYVafre9KHvczF2JkZlDmOyIgRlZo3h3/mInxAXZyVOC/ycXu8FNayYJpEpwqZTZ7ROFl
	ImLjub+L6sKIWKrWuXeMKS3zf/kuZNSfXnMxI92jPjuvkkD5MPOr/24JVTieJMnOgauqTBw//mf
	h52NFMg9FkGSI+WBhcieDF/3/OfbIvZqyEQPo6MLHI2bgR1/rgBv4TticPzNfA5LSixTuHkRysy
	IpcAu0Yb3CYimjRfnEwzo
X-Google-Smtp-Source: AGHT+IGYM5Kl6WKqhIqALVLprCyTEopQXxMxhhdVBrARzMbQ5DfzetECYmMWcG2U9HrikhyHctmf/w==
X-Received: by 2002:a05:6a00:a95:b0:740:afda:a742 with SMTP id d2e1a72fcca58-7486ca6d606mr1734842b3a.0.1749599908382;
        Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
Received: from localhost (21.203.125.34.bc.googleusercontent.com. [34.125.203.21])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482af38569sm7939263b3a.5.2025.06.10.16.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 16:58:28 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: select REGMAP_I2C
Date: Tue, 10 Jun 2025 16:58:25 -0700
Message-ID: <20250610235825.3113075-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix

  aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_i2c_probe':
  ite-it6505.c:(.text+0x754): undefined reference to `__devm_regmap_init_i2c'

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a6..a6d6e62071a0e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -122,6 +122,7 @@ config DRM_ITE_IT6505
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
+	select REGMAP_I2C
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

