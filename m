Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304021504F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191503; cv=none; b=OENHLAKyTPiMmxYrLZC9QlDhe2kMGN7T7pOAZE+YAiePT+X3t5gNFUQcZb90ybxQUlToisS5hwwGJD6ZzCTG+x+dRcjwLRO7tm61ZTZoUrGeztuGuotpqnrofc+7J2jIf7vecZNlra4lIitOWg0V7x47ulayu83GNYYXfisi+eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191503; c=relaxed/simple;
	bh=GHtJ9BIeI0EWZOOSkSxCgeqMbgFB4Nfdtv3BVXZRGGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SN+nCC458+o32ISnj/umAQcfGbtZLdybwrxn34cRBlAhAPEHBdFnzXNqPV0uj3Z/sjLPtrsiCu4zzXoSEGzEOZs7NTA1ZNWaaj5Ji5ZIZpIhcd3Js5iqk/3W2k49UzCf7w0FHaxKka4URhD9nDxHHaRrEznrwF0PFq0wDBrXAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m5nMjjQx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m5nMjjQx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3014ae35534so5386604a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744191501; x=1744796301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SgTC8w9iL276TFi8uSLwBxbq6oM19eQgvWXN0fTHj+M=;
        b=m5nMjjQxPGIUadikPJOpmF1u7r7xxszfa0RzpEBQr87FV/H/M/w34zZo2S4SEOmFaN
         5hduoB9C/kSKVPkxepuVM6XWJokJZe7E0iEk8OJRly1MuT9281C3Yct+Qk6uQRieE1+d
         hkw2TwKHTUHtG3RtXXtFmNUCWXoZ3M44fOvNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191501; x=1744796301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgTC8w9iL276TFi8uSLwBxbq6oM19eQgvWXN0fTHj+M=;
        b=OmI4wSvxYWI+pI25Sk3C3XcanXaSvy4jkzLCukbvH1L+M7bWuNQACMB9ZnbOotl9OH
         cfB711/klk0SmOOXFximqDnFAIekzwLwIYzu20S3P0LKQemXWRaoUEmwFtrdcmi1lhCK
         +ubnU5E3D+fIm9EJjyLELZEoTnaV8yDcE/yVh9rwJwDBbxSn4yPUIgc704yRMO0tU8Uk
         YXbQ/gNttYfahq5bvyWEIONQJCcWIV6Z2yHNadt3ZDcjPHFz9veT/IORaRX9qH3g0naD
         djhATk0Eb2UCDkSWOXiuqXg4cUjsnmlZz2t6qMCykzC36knpZ/DlRoKEstBF+a4ZBugT
         Qmjw==
X-Forwarded-Encrypted: i=1; AJvYcCWivTY2V+3Konj455v8gh2Hg1n9CgFiQhAEgEpzy7B/z6eP4MWvirxaPmyM9hnEcTNfnNlJfsp8VmhD/RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdfSpuwJFRZe3zPJDDSQgxpqfEn08hwCqYYrT62/3beLBMCCr
	wqRKdd+YCy9X6bshlN2QAs2ZspaQykSLR7SmJJYY1I5R41Zf0p9YX4969fkn4Dosheu5MOMPPxU
	=
X-Gm-Gg: ASbGncvpFzDX+2zYu1WG300+8iO2dyR32SfpCS5kpHNB2S8gXjCgtLQvFw0GY9WJ9q2
	YJ0Axq7xGNwaAsfv2/eos0EHJ7Aj3eEilJFyUHGqng5LrMELb/Ifn81BLSmwkP8bSNJY5RpkTqP
	GB60ZkHT9OMTl+yezUfaFk55IgFq/ivK3MCr9KqRMvMuexzRkzUcfiHKB6wqrer25JrMgicE8lY
	ttjfFFfvMA4XeU6cp1Tq5ji4iXRrlU/ibx/sXvFPZl26n/2JzJYS8BpniDSeAmhfOwLTlgrjReM
	kHJmB6MD/9AQFzLGMYSpdv05vKfnCj7hCBfz3Olu3/WOPIU/zYbR5jzn1gc=
X-Google-Smtp-Source: AGHT+IEFN4eKM3khV+a3oSUDISWcchGGNrkzq2zapiCD0nKURmKZ+1EdmsOfjDcNWMOTQ70G90l/XA==
X-Received: by 2002:a17:90b:5750:b0:2ff:7331:18bc with SMTP id 98e67ed59e1d1-306dd56b1cemr2114604a91.26.1744191500989;
        Wed, 09 Apr 2025 02:38:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:9ddd:3b40:5dbf:9350])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm940713a91.34.2025.04.09.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:38:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: anx7625: Use devm_pm_runtime_enable()
Date: Wed,  9 Apr 2025 17:38:13 +0800
Message-ID: <20250409093814.3977025-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The anx7625 driver is open coding what devm_pm_runtime_enable() does.

Switch to the common helper instead.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 866806e908cd..8bfe477c476c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2569,12 +2569,6 @@ static const struct dev_pm_ops anx7625_pm_ops = {
 			   anx7625_runtime_pm_resume, NULL)
 };
 
-static void anx7625_runtime_disable(void *data)
-{
-	pm_runtime_dont_use_autosuspend(data);
-	pm_runtime_disable(data);
-}
-
 static int anx7625_link_bridge(struct drm_dp_aux *aux)
 {
 	struct anx7625_data *platform = container_of(aux, struct anx7625_data, aux);
@@ -2708,11 +2702,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 		goto free_wq;
 	}
 
-	pm_runtime_enable(dev);
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
 	pm_suspend_ignore_children(dev, true);
-	ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		goto free_wq;
 
-- 
2.49.0.504.g3bcea36a83-goog

