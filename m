Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB75A1E6DCF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183044; cv=none; b=mMcSKVbhouyrTQHTkU2UtBJg99ZmPKhD9U7z+SYdn8Max8497BbYCjJ+TWaVCYrQnRuckyCAuCFzyR7NUQP2fJhJD/JpyC9Q+QHZtlvgVF95+FbGDRfh3InrErvCCwiYVmCUb2jJ2f0zBwOQDK8fVbj9THOsCnLrorsqd8zj+0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183044; c=relaxed/simple;
	bh=SEuHiZ39nk3R/OgrwDMMKMgLaelHjpgsvFZR3Gv2erU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWW8JE5pqyxKU/W2zuLciiswEz4YqTTLwXA84gFXhFM7pvYZJk5dKxJD+r/UWDdgH6MCxacVT1x+EVcPkiC5yER5kNCcXc3af93h3HIhyGJ+Z5cDZvst3207PgYOULE9PpuzVLqqYUDWL0wi039cK5Q106+Re8whiOsyIojnG6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LSPS7zza; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LSPS7zza"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso972518f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739183040; x=1739787840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAs2LZ2NWgql1gIfsJGw/9zwhaFBmE7zJ8vE+7MhjGA=;
        b=LSPS7zza+7KrmBbCn7pmjIINN5kt4DTvmk6ce/CYU9GxPJ0RjSODXXcLjOb0FlC1LE
         R6VzRXhR9p/YNOoxZ+5NMqkMFCzaZFCruas0fLKqG7w1qZQntrmUX18COdoDD/Gz1Y7j
         vYOSRhGQfXRDJwNwunMRTfLz5BLjvzvYJtDB6NXO05EEI95JXqEDixgan02b2GtFFsBb
         RHOyX84cpWtcnnyGa2PmsSmNJX/vrB9JUJbQ9Xn61ECH8xoNkTKkipvf+xxAR4EtzZFf
         bpTw7FzjbPD009mCkjzeyejFBfusjUi/gXdHERrKa6owlnT9tq4eo9R+GnrKDzHShAhG
         W+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739183040; x=1739787840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAs2LZ2NWgql1gIfsJGw/9zwhaFBmE7zJ8vE+7MhjGA=;
        b=k4jFM8k7U+gmM574OPyZUYazbw3uL8AC4Gz49ETLqYDHwCEtGHd65tzI7Rjp0WYMWI
         iOy1LdX4OWHy/CBUDr1vFSW2gmDgem3Nm1QNjtZjqGz/6mBfkzdOXurjchjZeh9wOroC
         fnAXI8MreOY0DJgFReu0/B0Xy4x6AN07l5h7uhUUfRvMio9e0nWO9ifkpHWsRJjxYmoR
         +Zg2VT41Bap1FoKDQJjFXrXiX7G2vxepJ/8D0PEyCcRLeXpsL90OZITIGunjfFwkaqie
         411fqlHXUYPegVGRMwO5FfwKg7HDmQBML+5ML8QNQPTvqrNNO9b6NlvHnvtvLp3bXkBk
         aG2w==
X-Forwarded-Encrypted: i=1; AJvYcCXHZsNfGpj1OoXyzmTeYBi4o8sch+1MtXhLqb+erIu0DsMLqA6ttwPlXMhXqmxGCQpifCRNZ5KTIo84iW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Mros6qSd5RzNagcL1k0RX4oDlVwQ8Rtk2HeQwGIDenAVdEQW
	bXrPukhpJhankKVn5lI3sImGbKpggxKiHdsT2iNJVIjdR4gFUmNRNKjYkNDiAAc=
X-Gm-Gg: ASbGncsrvdvAijEXUa8hmgyhgeEUxEzlXzy00jH1KmOeYMORrJ8a0ZGoZ1BHe0Ijhiz
	YrYJRtJmioYgg/DntZ57VISRX96HCMfBbZGXJ43mqoqlMadYX1rs/IlNothEhlaEfgIhere78I8
	i6j1LpdEr434WUPBFaBy4CX1XyCXVLcAYRIrjhtrMzqh6ZrYnjEMhIzXRegvyd2uzt0OMB/1Ym6
	i9kU0awy/R2jdxpk3ejKvPf7ZiqsD0pxRQLsMhPkrjn275ZOVDvZLzD0+zTrzpS1aqBfjgQsnH7
	lDHuQ+XfV04PX1Y=
X-Google-Smtp-Source: AGHT+IEvwcW7az1HIBBu0fJmkVOZLB7gEKv2EGnPMa5hQfRCyWQYPs3/QVHnYwuk7OBqTXYHsRMJkw==
X-Received: by 2002:a05:6000:144d:b0:38d:df21:a51a with SMTP id ffacd0b85a97d-38ddf21a881mr3009109f8f.16.1739183040177;
        Mon, 10 Feb 2025 02:24:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm5846535f8f.83.2025.02.10.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:23:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Mon, 10 Feb 2025 11:23:53 +0100
Message-ID: <20250210102353.83132-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210102353.83132-1-brgl@bgdev.pl>
References: <20250210102353.83132-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hardware timestamping is only used on tegra186 platforms but we include
the code and export the symbols everywhere. Shrink the binary a bit by
compiling the relevant functions conditionally.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- add patch 1/2 that fixes header issues with stubs

Changes in v2:
- reduce preprocessor ifdiffery

 drivers/gpio/gpiolib.c        |  2 ++
 include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be3351583508..0f4b31f4a995 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2908,6 +2908,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_HTE)
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
  *
@@ -2973,6 +2974,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
+#endif /* CONFIG_HTE */
 
 /**
  * gpiod_set_config - sets @config for a GPIO
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 8d467344528f..ade8a0b52373 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -114,8 +114,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -347,18 +345,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
-					       unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
-static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
-						unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -559,6 +545,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2

