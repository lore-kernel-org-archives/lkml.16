Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4341F8923
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270442; cv=none; b=g+5us4Nyzv4YU1319oubboAn6jbtZVg4AyxhFL/OwJ5cyFpqtQuUW1KprOD30tfnqSBBNxx+0mr9E/vbwh27Hs8iYTQnz+lZRwZK3ZjRvfjab0IT7czeL6LAY2ijDiA6RPKhjhg1KR5uyL4QP/mhU1sBoFfElttEscN+rOEx9iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270442; c=relaxed/simple;
	bh=F8pwpibmJDVFn7ea1QGds8TMI5anvrvtAmv6O99e0Co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V/CWjHK4ZjVlQB1Jz0QwV4U7OIbfRc86Yljo4SoLjmG8QpfQM21E83XHUdufqYFRAY9X85TLb+eLyKBpEldaXjKZD0oOmqjnfOLelw/F5moJEoDGiBbKnQcPWad2XCVLxJOYOyP2Rk0Mv5ALo0WnuQSl8J52dGzQIuZT7crryGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0K5tYqG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0K5tYqG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so53523295e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270439; x=1739875239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
        b=G0K5tYqGHgy0MCeeUNfnjFOTl3yGtabOYVqpF4/S/OosDRrvAn7uH6auI2RMiIMknx
         itOZIYY3xctiWZ3nZa8GkAdT2avBaxab2qvexH5kPmCJ0BNmxOOVO254BTKg2cl5WP8f
         VV+tAVX50orqJF1WdO4itTQ/lRpRY36ffIc/JgPPFtZReCAR857wrESV+WUwaYxB7uQP
         8j8Iyrt/n+vOWaSpf7hpQ2RLIfczjLNXe23tb63veUbwBCMBCZFwyyeq6FY4O9co0baa
         V9CLLA/EIrl0w4+LfphHWCrmk9gy5gzl0WdmcB5pD5ueWxNaTO8YYmFQDmBx1EupyTGt
         pVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270439; x=1739875239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
        b=uAUmVbQ2pfcVJAgRFh1W6mVueuQz8vcsA9Ioc6r28Y7M2dFDV0ILsE842l1kXD4NEk
         ejcCZsD6AsJDwUFyXwgrX1sxDV9HJ7/UcNJ7E38dkBULA/UIagal48IhHwLThCQ88kaK
         FeEVVUKKX25clOhntTJm5A3ZsPHpIGilm47+751X3TDFuaXb4bD8UfssQq70nPROi/nV
         WfqbTZI3LWMzlsF27wrygiPGBbceCCD15s5rrIcgxArDSeB7Z5C1CW90Jw4B9Kj2C8EG
         G05enub1B1gwWybFu//uSjE9bAc5S3n4iHmHKFUXdbC7G6g+w+dr3bKW/A3MGLB0PyUZ
         Jj5A==
X-Forwarded-Encrypted: i=1; AJvYcCWpEXExVm+mKVLQfnqvlM+1phZ04TVdEJ9tzq2QcCj8tdPvTOpZSLm7CahVGWBJ11FYEZ3UZBoxpKMMI60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2IW2RjXvO8vdCHizQh4+K0iGC2sJhiUx00inYpv/eyAVMy5S
	hTWpMyIx/pmsbPi+jmvn/L1RhnSR2ES7YW+rK0CUO7CrZmDw6dSDx7xymmrwc+I=
X-Gm-Gg: ASbGncupA9atEysK3IGfumi6IPWq2sUr43knnITH5fCSUqG/OqhJkMdaObrjB7NHT71
	uvl9AAjWWEz+Ywr0TyAYdtl8IqUWf8EmfkpQnEP0KxvqKD1Aza40BDA1zxva483ihNc9XcbAJX2
	f+7xmUDtY0ePcrXZMj1BcPmHfdpo0dzPssCEYIEaCLfofCNOkFpuAeCIpq3GyZuEZmEQq1YHDbK
	LbfS09mVN9g6ADp7hiB9a/CDaAf73ybVMkggiQvDS04zHOiaCvdW/9hXAY6OySgFaUhbho2qGe5
	s2ID60k1g+Ev
X-Google-Smtp-Source: AGHT+IHoYKN0xK20CRb2BG7n5QKE/mgzwqqJVxGvuUHYmxPDnLSwWVoOeaDFYouJ/QTG+TlYqu4pkQ==
X-Received: by 2002:a7b:cb88:0:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-43924a27b05mr156406225e9.31.1739270439183;
        Tue, 11 Feb 2025 02:40:39 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/7] coresight: Add claim tag warnings and debug messages
Date: Tue, 11 Feb 2025 10:39:40 +0000
Message-Id: <20250211103945.967495-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dev_dbg() message so that external debugger conflicts are more
visible. There are multiple reasons for -EBUSY so a message for this
particular one could be helpful. Add errors for and enumerate all the
other cases that are impossible.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++--------
 drivers/hwtracing/coresight/coresight-priv.h |  5 +-
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7b53165c93af..7fe5d5d432c4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -133,16 +133,6 @@ static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
-{
-	return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(&csdev->access) != 0;
-}
-
 static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
 {
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -169,18 +159,40 @@ static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
  */
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
+	int tag;
+	struct csdev_access *csa;
+
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	if (coresight_is_claimed_any(csdev))
+	csa = &csdev->access;
+	tag = coresight_read_claim_tags(csa);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag(csa);
+		if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag(csa);
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(&csdev->access);
-	if (coresight_is_claimed_self_hosted(&csdev->access))
-		return 0;
-	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(&csdev->access);
-	return -EBUSY;
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		/*
+		 * Warn here because we clear a lingering self hosted tag
+		 * on probe, so other tag combinations are impossible.
+		 */
+		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
 
@@ -205,7 +217,7 @@ EXPORT_SYMBOL_GPL(coresight_claim_device);
  */
 void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-	if (coresight_is_claimed_self_hosted(csa))
+	if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag(csa);
 	else
 		/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index cc7ff1e36ef4..a83113225797 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
 #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
-#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
 
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
-- 
2.34.1

