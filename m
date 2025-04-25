Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF40242D94
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581190; cv=none; b=liHUCkwPRvO1ZQYaq8GdSon48cHiEvdgv3Hsb9lem3IvF1Vx5zJxlnNpf6BW5PDJ3qnQiYDOREBfBlQnOv5VJqHsWsdn6NuqVhGqHcbvTI5S269mW5YD+BKRybwfXPVOwP95I2WPXEh1YS9gqRN0dxAO/8x/eW3CWFdrW8C8u6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581190; c=relaxed/simple;
	bh=Ekvbxj8ie3aP3p+Ppy4BmvqkqgZEJ4eDgTuXpv3T8ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7A8eKS2Sh6H+TF5XlVZO0L5GBB/wn47Y8EPO4EsSA5lCzNewswQD5g5RUaa3Tyeuxy39soKqXrYAmBfjjsTfSgMFJhvC/qqaDzPcWODr1bvKlXFCuNSOIwBOcAuSG3DMM/gM3RnYMYiruDAsB75FX6hHinM8jZkxEkGJuX2lZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PK8iqMFg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PK8iqMFg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d6f93316dso2287049e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745581186; x=1746185986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2m2Aoo1Yj9SjRuX3tvCRBORIOzSUjs0HNbHFmUyy+E=;
        b=PK8iqMFgquHnI7+mOFm05KvBYjXQwKgdZIRcfalKKXcP+Cuk7rliO8U5TjWSkPrA8n
         xp70rcR7aEUFebzM18B9CwtIw1faU+cQ+kyaqQV4CyZt/R4nk5jtIa0jy5mGi8caUJQR
         Ahg4p1O/zWcTMwzgFcsbFplqK0hzjCx5Ib0RBpvNx10CFsvXLTVZXBWaEYiC0UyEGtR7
         0+/v3VMNxD397qdwXhlMbgGXmV+jSKLvfV45DA7cPnEFy24615c4SWhFkHck3GfbzDXo
         taMvREqpT0BFrWcReeHMQiIBaU6SKWN4opBGHd8sLoi6zyGDWjhvScm87fXZ9/uw+q4T
         YH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581186; x=1746185986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2m2Aoo1Yj9SjRuX3tvCRBORIOzSUjs0HNbHFmUyy+E=;
        b=ctlwtSG5tdN3civgoY6OlAKn2YaPpOX7w2a6sDOEg+7MugJu3Cv5IX1dS9Ecdtx2m4
         QNytJhozXXfBEgdzTgDpED/ycLdOwfFN7rGrQ1sDw/PGgfvbgpLMkzFGVY35/gpxxIRS
         Qn3Il0UwJLSZG9OFZak4eBZ5kYqJTEUJWf9v5Q1P+Ajui45qesDzg4ynip0yPudaae8t
         DAOb4tUnmgOlGyCpB6mZs9kiBggYXlwHlQIOZL3rP/GD/pFAkdZJNnimjolHdlxMHOiN
         XMJLlGyWUJS2f75nHnz33qnRQXmjZg0k1xze6DqeYtQNq3r5LnskdwljoQbzAtxZeJTq
         hzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWvCyJVIweUXv+NMc9ZOkfYtc8Gtagi4VnkvZERdUR78+F1QC1VQbxTjpJOw7fRxXg6JozxE+hcmBXBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9xArwhgsLSfY/xXl1tzDlb/2DRwTmsk7SqlIqYrgv9WajZtnp
	YXf9hF58JBVmifTttEL0F/ZnHF2cuyuRJ00FaNEuAXn5lkVQ9qq9GP/XFE3fsq8=
X-Gm-Gg: ASbGncs2jcCPz1yzl1VQUYDQHCr6bSqVRlBYDujwRQqRq1Jr5pzAqTzT7zTnFbuBFuk
	8T/hYQDLyHm06ZcWaQfGZ26dDVJZ5vXnW4EzQjk5snLnxVAnBSgc3UK26XDcRYXPFLDpp0tuYFx
	IlhTyjp/2Xgf554HMn7FQJgA3GfW9/BIEhsKaNrS8IvYUMUZpvm6mRU+kMcEEqhtEjGurGs6eXA
	E6Qj/RMmu5IERNOMii0eHdAfcdijtsJIN2TTX72M3DYstvSuCXOo9HbOW3S87BImwRlI+zi3xF/
	dF3waih07mxuExOxNfttc5isydgoTLgsh3TeNVW1WHJQPBkMyGE1Va69/imtRv4Wan/9KCQION1
	b6x8wkRmvzhHqMY0=
X-Google-Smtp-Source: AGHT+IEy1Ze2Inm4YbRPTrLQmT+mPyOVbA8yhIPraVyHblYKgU+yLXCJwHaMdnfN0LS3s7iYdWCcBw==
X-Received: by 2002:a05:6512:3b95:b0:545:e2e:843a with SMTP id 2adb3069b0e04-54e8cc0b338mr599451e87.38.1745581186050;
        Fri, 25 Apr 2025 04:39:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca83c6sm560581e87.113.2025.04.25.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:39:45 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: core: Convert to device_awake_path()
Date: Fri, 25 Apr 2025 13:39:42 +0200
Message-ID: <20250425113942.134458-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As device_wakeup_path() is intended to be removed, let's switch to use the
device_awake_path() instead. No functional change.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3523d0331cec..a16105b34201 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1508,7 +1508,7 @@ static int genpd_finish_suspend(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
 		return 0;
 
 	if (genpd->dev_ops.stop && genpd->dev_ops.start &&
@@ -1563,7 +1563,7 @@ static int genpd_finish_resume(struct device *dev,
 	if (IS_ERR(genpd))
 		return -EINVAL;
 
-	if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
 		return resume_noirq(dev);
 
 	genpd_lock(genpd);
-- 
2.43.0

