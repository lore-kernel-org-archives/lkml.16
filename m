Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCA1F4E25
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270434; cv=none; b=JW5HXR6IskAvIxrq+JMcrLYhbglcf8zOz8IZ/K3PpItbVUR/wtgV+37/OMU56kuiWrwSS39HLVadXcpy/T+lP3zPf4kyTiNQnvPGlZ1alAONHAZ+qUXrdo92gUTMLekutJqnLlqoyBG0N3vzgMxFDF3FRZK6TOmzseuuPZIf/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270434; c=relaxed/simple;
	bh=wTtb3gvVym/KrK0iuQPt9BSSH1qXh7/Twv3dNo7pM4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vx9dDhyupJGlA9GcG7KdAlv4QIJumAXktQU0oVW3AHtu5/W8NAMQ40n8xbHyZ+dulajry30reR54GHV/6QOzvryOwmsxIps9FEnH4nyEpezZqAiDFy+c5fNbkPnlN2Azp6Dr4aScQgJtE4HtRzuX3r4aMSNclrqz6YEoRL3ocvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/IsozlN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/IsozlN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4395560cc13so3123795e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270430; x=1739875230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
        b=c/IsozlNPXYtopBLevre8DBi95ksSc41izvkONauK1UDSVIlLkWCLX9jBqdFItoMp1
         qUatIJ7x9Ug/82l4xswgE9EYAOjxyT3nJ6oyrCd1M+vVbA+/wblEx/JGwrSwhrd1dnCZ
         zjvC9hl5uKhzqkCQ+Rf1qdxQM5DuGBE85IPj6Vf/Fr4/gaV1wcjwrb0On3gvTU5DOAiA
         WrcVU/cbqmr+ztRmh6kAbtrCUxekgxRc0Km8T0sWvAK5Q56Cq5/fL6pfLqmcFqiWFOsa
         DYAsWdFFwKYdnU7vvCks0NJLhtjqT5j+BzWoUR0N+B+G11NbTRi3szRknjQhbyAZd+C0
         nLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270430; x=1739875230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A8RVRjBK7H8bCZinYcme/5PJTGf7uIF6oMOSyxCJUQ=;
        b=MlcoSHOvGsCLKzzg7l9XZBikyVwnUCVIBr8c3pwLzLpXa33E/D0oCi26r6B3hxj8jU
         DtSikB4kiu+0QQtCkCHPmHhjnuy4PK2lo2vDIljr/+XOEIZS1Dr5NNvqEVQ1BIREMm/K
         x5ONHCQJ6Fly3Le3Ij5kMkQZ42xi11PhR98VlWZ/C/B9chGgqV5Oh9VVqZEemXcDLHm3
         6f6DdT1yacitJo8KCsaur+WcChdTEQTD3tl6Apb/HLagcShtvcJaWKzze0sIcKvQtk0d
         LzYMp3AYZmwsMjK/l4ALPksKWZ8X6VJCkWNYD0Qme7u07goJw/U+z3LVE9H2UJwLI3oM
         Sybg==
X-Forwarded-Encrypted: i=1; AJvYcCWD8HUwy5jAwBzG7htfYpMEylttmasiImmSZMRnr1stADp+lt5+iaX0X7shhImOTMzK3GcU90GYojIIpaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQILq0DWP5PehaLxDZGxV70GRynrcHoLCUayJigPAYLekGgvrr
	otQMfctmMoXYuDatIU9jmp7A/g6lmXoEQf3bNx103oEdmqrdzcc63OMu7dt80Ik=
X-Gm-Gg: ASbGncuTUot9cUo5AeDLVSiaOXyiSYtiLxy2hzxnTYrcUe6iqXWROQ5TqvKuxodX4xS
	79Zc37uWPzfIhc/qjj9qaGlOW9c8uw9VqNTUv2djyr+HUUU/epD0MItnOqV5CjJHLPqHAHGTIw/
	RCcdmUyAEhgl3yqi9sMy6eKb8VaUaYVE1BewgNUaNbtZ2oxWVTVNMj6851RgmExojZs8I3yppai
	UKFdNDgIufM+7biFd1VEQmHurUPQhVjcvRIhMqhrUIp+pOo/DtomyT4kN82vchYZix4B7nip/yP
	SDZS8nVFS8r0
X-Google-Smtp-Source: AGHT+IHsAnh1dHvEt+uOlGshWjb+DFPLFBYIUXSAhkCj/7Y+istcriVGonzZp0irFU33oYSY1ss5Eg==
X-Received: by 2002:a05:600c:5128:b0:439:473d:a3dc with SMTP id 5b1f17b1804b1-439473da569mr60088295e9.31.1739270430353;
        Tue, 11 Feb 2025 02:40:30 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:30 -0800 (PST)
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
Subject: [PATCH 1/7] coresight: Rename coresight_{set,clear}_claim_tags()
Date: Tue, 11 Feb 2025 10:39:37 +0000
Message-Id: <20250211103945.967495-2-james.clark@linaro.org>
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

These look like they set the whole tags register as one value, but they
only set and clear the self hosted bit using a SET/CLR bits mechanism.
Rename the functions to reflect this better.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..523dbb381f90 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -142,14 +142,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 	return coresight_read_claim_tags(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
+static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
@@ -174,11 +174,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag(csdev);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -199,7 +199,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -209,7 +209,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag(csdev);
 	else
 		/*
 		 * The external agent may have not honoured our claim
-- 
2.34.1

