Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5D2E6115
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547817; cv=none; b=WZOWPSykhz2rdLrNPOyhkpshGuor/wzZnm02hkA23Xrl+kTQXI4JUss0yBXKOpIVHoPgYaXnpBV8LQkUIe6XYRyGTJoHFR/P4SUaTkBFpYxrnM475YKiO1LJBT4uPHVtQ5VWCSKb0jiw9+rzZMRm76wyCl61f9S3goBx08deZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547817; c=relaxed/simple;
	bh=gh8sRN3FjYoa+bmvakuR9vCpPT3biJ6nBYXCkWZzTAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSD4t7cvxZ/mIZPd5Qy4b2Wj8oE5EHWa6yxLH6JF/wE3yMBLKyzZDTZnzg0CPFvtS3C0yautKqf3yIdr91DZACPwSO00+cjBsh7rG5NGB0WMAV2QmMMuM913C+njytsaYccV2BBVOJciYYhpIbQH0IUasnMRjI0JBrBS6RTULnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBJmOkQC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBJmOkQC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537deebb01so29701765e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751547813; x=1752152613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZSfe8ScDLyAPCu7SJnNpKYFUKNjfHqJRnI+l8UvWvY=;
        b=RBJmOkQCJgFCMoaFa2SrBC0gZJc5dXKrE1yfLOeSyiv68xjYWtMFYVeE0l+3FSxrpi
         zXohqFlbq69lILSez8CvunL9yjUxtsEIH9RtkoqG3weEofYc1Sx1W28qjWHK024/jHql
         kR4L/YGqyw+69tyIXqGaBkAgIkoGjA0BOrwUZNYtzhnrU4LyLr4ewfNnfQAHY4ofX22A
         14NOs6cSFgQzy3DU6qndgIifF66CzQeQj9uujG4P7DzgQP/53d6yGVQqgeWX+DYutQSE
         L1LT19m3W/vvVvVVNXVvoFQFZFF/gxhdz/D83TOcIHp5qdkzv0K8t8MjcsebNRfL4oio
         P1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547813; x=1752152613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZSfe8ScDLyAPCu7SJnNpKYFUKNjfHqJRnI+l8UvWvY=;
        b=bKdarVYabW+liucl/5mJbvMPmfop7WJB4b4jZ94WpjxJVh1rNdsIwlfT5GYTAoxwGW
         YkLpMr5dWG9WQzak/PZCajitQL3eRyT5eVyVl4DvtMB8NzkwZ8KnUlsa5YEH6l5Fxq8B
         zKU3q5VlS6uedLQIK3nqyWFLChefLuIAPq1rrtAOvfQo/yLr9NNQzlGO99D7fDZs12uB
         AE/w2Fpe5ws3bFVLRJf0vexy8WjIrrjCmzNqmXBVHfM2iLfEYG4Yi66TbbGxnbFPSg3N
         xhr2BSKMNOl455v80Z9hQwVw5QLoEXQNH+hYurdTDRiTQXNvtuVHc7Rwr5Re4ffMPsLC
         uoiA==
X-Forwarded-Encrypted: i=1; AJvYcCXgjFVYpXv8FCKzltGbRrGpICDm0nXyfd8lVE6GRGojacloScpQ9YMB3P/0U8hoWHrTdBLsrB308c3F3mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3hFxFlHrX+VRufj977Bb3sO2PGLD+xfz5Y8GD69ZwUeWXbzt
	6KDj+8mufBV2/ylAWqfTMi11s+fvcgnA5U46G3BIFtCHCdgLh9+VVkS8y4ajNxUDPW8=
X-Gm-Gg: ASbGnct4ZvFfCkENDuBbsDE4EFOezarUqED+PeTkRjAu88vhDLSflBjNEHYcPmwq8Rt
	Vbh1Bo3W2PsetjdRCBDGDzU+qiwkpR9fgF1z4G/F56xCKr/zTPxGs1K92XcdFJ75fHwmiec0raH
	mIAaCAfZRkfFUODDEV9Q609SwC2okV/7D4JLbuzABjHPOox9hufyBnLpLboGPKZ95RS+qSw+Dvs
	zwfAcgZwwImpB/6Zeqeewn6UqhcL6mra2p5RcffDCq7YbtEfnjqQYhR5DMeW1Ra0WlbUOUfl53b
	q8nSqtTRvK9I5qgM2MphwRZZeh3eTSRIBdEnxmhcFAoE1zdQUMRKR409RoRiMKCLH6cU0QspExm
	3rD88xUt5vLCfBZTP
X-Google-Smtp-Source: AGHT+IG51/E9XKuoMXFy9BhdHeNgH/aYH2hcbTIn3vEBmVB6n8QJXhO968aA9OUqfZGicNn0MhgUew==
X-Received: by 2002:a05:6000:42c8:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3b20110d6eemr4137588f8f.44.1751547812391;
        Thu, 03 Jul 2025 06:03:32 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693fesm26170005e9.7.2025.07.03.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:03:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 03 Jul 2025 14:03:22 +0100
Subject: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
In-Reply-To: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=gh8sRN3FjYoa+bmvakuR9vCpPT3biJ6nBYXCkWZzTAk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZn+hs37WK3zdKnMGFDCdBNBhQAm6Eg0k/40e/
 UpGOA4k/ziJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGZ/oQAKCRDO6LjWAjRy
 uhS8D/0dV+h18Proy+jNLR+vH9JW1GGTp2w7YPINmYeWADF1+jyAobsEyZqgxqzPD0a0uZfKtyy
 48IewtZjaQYOUCyeA/mFFzuPMMuIH6Q7LsvZE+f4MCVmVxppjirduh/iQUDRmjHGMC13cTjzLfP
 +TaKGnrbbWIoUrvVSl1FVGXQTna4jWdlKyXjfa7VYNt7nbUw8ii/3Gf3VZrXXaZrhCvwLflYqU1
 v8JcLzVTf2FF0PBnEdAEcbuXqXXxEaLjJ33euGcG3zAZ+Uhd1hEsigs1WiFUU4qHzL5iQ88hKiV
 9RP4w/6GXiJmwLIrPmfjjl+0aD/2ta/FKHIAo5OzyXGMQa6Ul3e/Ntc6gsjZCjG4ohRzOcids2q
 gXkCLKCaAXm6zBxp5IZbBvgAOUz2pL0wLxLY2pzFEKQDj1nQjhNE/Ayr+9ndt8LM/8QFyETh5Fb
 hdptmJ0hTJdd7LK5XiPPhdEI1W2C9cHT7Gup/0pOKBUNAKzMzNq03YjhMNp33Csiu1mHmqHpzfr
 QX/CUR4u3HpMbxQb/GiQzbhg49ajkiHHID3leKk7rvSrJoYas24zpIPyPamvUC9/o7Bu/15uYGK
 CtswbRE6B3wUOB1wdCxpDVuKxedz438IHSUynvyTAKBaKLA5Nhq7PQjhHh6l5856MgvVASAyx7Y
 wSu9KXcO0sIct4Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add a new phy_notify_pmstate() api that notifies and configures a phy for a
given PM link state transition.

This is intended to be by phy drivers which need to do some runtime
configuration of parameters during the transition that can't be handled by
phy_calibrate() or phy_power_{on|off}().

The first usage of this API is in the Samsung UFS phy that needs to issue
some register writes when entering and exiting the hibernate link state.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
 include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
 }
 EXPORT_SYMBOL_GPL(phy_notify_disconnect);
 
+/**
+ * phy_notify_pmstate() - phy link state notification
+ * @phy: the phy returned by phy_get()
+ * @state: the link state
+ *
+ * Notify the phy of some PM link state transition. Used to notify and
+ * configure the phy accordingly.
+ *
+ * Returns: %0 if successful, a negative error code otherwise
+ */
+int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
+{
+	int ret;
+
+	if (!phy || !phy->ops->notify_pmstate)
+		return 0;
+
+	mutex_lock(&phy->mutex);
+	ret = phy->ops->notify_pmstate(phy, state);
+	mutex_unlock(&phy->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phy_notify_pmstate);
+
 /**
  * phy_configure() - Changes the phy parameters
  * @phy: the phy returned by phy_get()
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 13add0c2c40721fe9ca3f0350d13c035cd25af45..d904ec4edb7e2be41fcf6ab780d3148c2ee8a950 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -53,6 +53,11 @@ enum phy_media {
 	PHY_MEDIA_DAC,
 };
 
+enum phy_linkstate {
+	PHY_UFS_HIBERN8_ENTER,
+	PHY_UFS_HIBERN8_EXIT,
+};
+
 /**
  * union phy_configure_opts - Opaque generic phy configuration
  *
@@ -132,6 +137,18 @@ struct phy_ops {
 	int	(*connect)(struct phy *phy, int port);
 	int	(*disconnect)(struct phy *phy, int port);
 
+	/**
+	 * @notify_pmstate:
+	 *
+	 * Optional.
+	 *
+	 * Used to notify and configure the phy for a PM link state
+	 * transition.
+	 *
+	 * Returns: 0 if successful, an negative error code otherwise
+	 */
+	int	(*notify_pmstate)(struct phy *phy, enum phy_linkstate state);
+
 	void	(*release)(struct phy *phy);
 	struct module *owner;
 };
@@ -255,6 +272,7 @@ int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
 int phy_notify_disconnect(struct phy *phy, int port);
+int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state);
 static inline int phy_get_bus_width(struct phy *phy)
 {
 	return phy->attrs.bus_width;
@@ -412,6 +430,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
 	return -ENOSYS;
 }
 
+static inline int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
+{
+	if (!phy)
+		return 0;
+	return -ENOSYS;
+}
+
 static inline int phy_configure(struct phy *phy,
 				union phy_configure_opts *opts)
 {

-- 
2.50.0.727.gbf7dc18ff4-goog

