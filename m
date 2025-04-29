Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0825228D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950194; cv=none; b=GeK7DeaFp8JHI9kcoLLIp+cnEXOs0HSLdeduM0HYZNg64bEv1Or7fM4kCd/hpxTm6nkeCgs/kUujKj5i2IDccH66C/5cUjfm9vu2bjOE2gvT5vKuej6XGCEvTlTA7lVKnr8yEtuQHv/ZPG4oaWiHHm3SUgds1XrIPCucEtKq9ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950194; c=relaxed/simple;
	bh=c3u864skK3RTvzcqx6hyTcY3YY2TbZxu831jV74hKtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXXnCDZXHVc6OWzN/JrKhFYqxo5y8cy8sU2ZJHfLf6AymDOOGj2JiQG6xBQ+b0hOFveaUTUEev8rWVWlaTWsFmwUNXU8ddRMcFYCyT6q6AVTiaIHFO4t3r7m1jTEUMvzGz1iEtn4UKs9awYI71dVybV4lB0JJseokcJ8sr+KHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pITG+UBt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pITG+UBt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf861f936so11169765e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745950189; x=1746554989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm1ufso7PEd/mzFpTpkcoocj3PhWS0h+LC0FP9sR0Gs=;
        b=pITG+UBtGrHGBx6LpvceW8jAaF41rIhBKCGLXAZK2o3emyrDDNDWQYvrT9ORzoU9H3
         n1uC09R3GGaxFwz6bPCoXoTzc88ihimm1eStehntcOBJQNlPCwVGVL5ESnIoHQypnbZ9
         h+L0P4gJzmzPZk2+P/v0ACde3dOzI6yCS9XmTVirLrGxxv8NeewFltylpyrVlTsTA7Tm
         NaxEg+mTAW0H9cJtTRfZJQAl+pv7eebatOiqw/3nDUKnKhgEd9gLbgRFdGfPteIMtBWY
         Xa8BUkpTQuqC5ITz6F8gGJ/wo9pisWQ+4UKZLUS1Ht46/nM9c5faE13BIeIxS6CB+W3d
         kE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950189; x=1746554989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jm1ufso7PEd/mzFpTpkcoocj3PhWS0h+LC0FP9sR0Gs=;
        b=ews8DstDvuyBwkacmJDXNhjLB6Ry9VxfaDSsVGcSigJe5OpmJnvGMYt5CzFC6QRWcY
         CGioN5WLJ1jdjDAaNa49rV5GLv/b/tLdA/FGgWTlTsVEpXSJPobis+1lviXX7Q+0+FhR
         xdDlH1XTyxeu7ybWiFG0F1etkSmZyZMKuQ0rlhlZ29bF21BIcXMTNxa8ioUEXZ8kuhhL
         /+3rnK5Agr4oWc4/5jUuo3qf7QEzZjuN6sry3FvTjdYnVNJGrCU+fRsK3uwwNkdOfpZx
         c8agS1Yu6mVXKzuLiLBzmVvDCTyEMhZ63Th6gDCTFs7gFgvCIlJnarJ8jC1AhMcPEVXh
         mP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsIHy83WwYxPlupwY+/sRovvn5v3uv3ifk5wC0ZR3praZ2fRzfy1opdRnSml4DC5fNzRznWw+KMnuZLCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIyjCvGm+cuk+P8bWWVO4zMuD4KDaquKBhR70VZFV+8CrDp7q
	yke/JfJGxuyafIUH1h0rByHs3gYmNFv546dt0E2/UhvJ3qsae7Hun1Ycv7wk9rI=
X-Gm-Gg: ASbGncud5LElfFR2ktcCNfboj+NOvcFXNvB6unPhthiImBILYgjToJgyrbvILbQc4jg
	Jm/eToAyG+U+w4qG0KLETAvToAepA9vusCI54AjY8ybb6faf6422nZeOKx4V4VmCBkJeMOJRaBG
	nMAvpEj5s1DXrokPphL3dbT/HII41wTMJbZ7kf04F1xmvE8a1StQeTnZgizQH/EuVCunEfUGULl
	yCOJqsKhPHOZkZ+dqZtKaWzDl8TWhcRkQQSp6ZRi06a6Uh7dr71aHDfIRENG70+FIsq5UFlBZhy
	sjbvOQEBlF3xz/uaagWjZ71MGhYCiCok8VvNzAj0eVf82UAAInTI2a5F3iQD
X-Google-Smtp-Source: AGHT+IGzbI0xVa6Owa4r81FnDByp6u3DLOYoyScttfgoKJmtA7M14Gq4uCIzzqLYKP6ncMoWCYVdpQ==
X-Received: by 2002:a05:600c:1c88:b0:440:58d1:7ec3 with SMTP id 5b1f17b1804b1-441b1f6b93amr972365e9.6.1745950189598;
        Tue, 29 Apr 2025 11:09:49 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d52bsm15028818f8f.90.2025.04.29.11.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:09:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] media: qcom: camss: csid: Stop spamming logs with version
Date: Tue, 29 Apr 2025 20:08:30 +0200
Message-ID: <20250429180828.950219-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6542; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=c3u864skK3RTvzcqx6hyTcY3YY2TbZxu831jV74hKtg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoERWgSpZjzk164XQaIAyiHPxsuNjN6YqYw4lcg
 /FpaTWAhoSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBEVoAAKCRDBN2bmhouD
 106nD/0dWy9+Z6UR3TCIjBeKmEuJM9ID3lHfa1nQOERNa0RWbk+CNTiOhcpwN4H7i7ORcP21Rmw
 EaeIaYGmb6LAKwMPMDP6LXfIHmENzQUrTRWGOd0eNnlpmApBNnLuwX2d2xDba7QEIa9rdWxsdtI
 UEAbbxy5IiNFJF857PapDEZUfe3OGHzbClmhOX6u4ZtsaN0J8gRKiL2T16VsPCMtFr5ewqNGVvm
 v/Aurx+gRcZQPQAGFTvB90aG5Yg7wejkBPyu5qJthrZt5f9Q5RPKrH3LLx0UuQImvrOgFfR1/5J
 dgqIdWXwOPjEHU9zADKpJ2PzlKgxz9tIXDzYkw8AY7Gz1JqikslOW2ay3GJrRs3DUpKk7jAsm5O
 FE6zstsf/noIz77aahXGdA/LdRMGrbW9yXpipCK4coVtqyYqGTBWzLsLvgz21TUlDEAo60HGROB
 n5iHoM6av+lpKETZEoJkq87q/L9PrQkrTvCnYfy+kTKvg/vPgPHP2ZsjN/flqLSdjefaJBtkaJX
 P6io965WGsYQ9kOLJb0V43HH9RiB0jrS0OF9pAcDzyF0Ervqhx17K9/3I7PkDxW+6P6sm35FbmQ
 fsOX4rHc00sI1hk/6kClJoYqAI1fnF1tgenkxUu2+iPbVgK1VVuCdZPJD1i7Pmgr0JjKOh+76uj LJq50p4Buf3prQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Camss drivers spam kernel dmesg with 64 useless messages during boot:

  qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
  qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0

All of these messages are the same, so it makes no sense to print same
information 32 times.

The driver does not use read version at all, so if it was needed for any
real debugging purpose it would be provided via debugfs interface.
However even then printing this is pointless, because version of
hardware block is deducible from the compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../platform/qcom/camss/camss-csid-4-1.c      |  1 -
 .../platform/qcom/camss/camss-csid-4-7.c      |  1 -
 .../platform/qcom/camss/camss-csid-680.c      |  1 -
 .../platform/qcom/camss/camss-csid-780.c      |  1 -
 .../platform/qcom/camss/camss-csid-gen2.c     |  1 -
 .../media/platform/qcom/camss/camss-csid.c    | 25 -------------------
 .../media/platform/qcom/camss/camss-csid.h    | 14 -----------
 7 files changed, 44 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index 6998e1c52895..8771e20d2a44 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -179,7 +179,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_4_1 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 66054d4872e6..80135e63c595 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -204,7 +204,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_4_7 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb..6eb9a5efa96a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -413,7 +413,6 @@ static void csid_subdev_init(struct csid_device *csid) {}
 const struct csid_hw_ops csid_ops_680 = {
 	.configure_testgen_pattern = NULL,
 	.configure_stream = csid_configure_stream,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-780.c b/drivers/media/platform/qcom/camss/camss-csid-780.c
index 4c720d177731..8a8999747905 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-780.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-780.c
@@ -328,7 +328,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_780 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5..9607ebd7fa3c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -424,7 +424,6 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_gen2 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
-	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
 	.src_pad_code = csid_src_pad_code,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368..2f5058b681dc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -596,29 +596,6 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	return 0;
 }
 
-/*
- * csid_hw_version - CSID hardware version query
- * @csid: CSID device
- *
- * Return HW version or error
- */
-u32 csid_hw_version(struct csid_device *csid)
-{
-	u32 hw_version;
-	u32 hw_gen;
-	u32 hw_rev;
-	u32 hw_step;
-
-	hw_version = readl_relaxed(csid->base + CSID_HW_VERSION);
-	hw_gen = (hw_version >> HW_VERSION_GENERATION) & 0xF;
-	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
-	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
-	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
-		csid->id, hw_gen, hw_rev, hw_step);
-
-	return hw_version;
-}
-
 /*
  * csid_src_pad_code - Pick an output/src format based on the input/sink format
  * @csid: CSID device
@@ -732,8 +709,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			pm_runtime_put_sync(dev);
 			return ret;
 		}
-
-		csid->res->hw_ops->hw_version(csid);
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 9dc826d8c8f6..4b003ec1519c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -88,12 +88,6 @@ struct csid_hw_ops {
 	 */
 	int (*configure_testgen_pattern)(struct csid_device *csid, s32 val);
 
-	/*
-	 * hw_version - Read hardware version register from hardware
-	 * @csid: CSID device
-	 */
-	u32 (*hw_version)(struct csid_device *csid);
-
 	/*
 	 * isr - CSID module interrupt service routine
 	 * @irq: Interrupt line
@@ -225,14 +219,6 @@ extern const struct csid_hw_ops csid_ops_780;
  */
 bool csid_is_lite(struct csid_device *csid);
 
-/*
- * csid_hw_version - CSID hardware version query
- * @csid: CSID device
- *
- * Return HW version or error
- */
-u32 csid_hw_version(struct csid_device *csid);
-
 /*
  * csid_src_pad_code - Pick an output/src format based on the input/sink format
  * @csid: CSID device
-- 
2.45.2

