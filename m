Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200D1DE89B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122265; cv=none; b=pviFQFGal5UWktx2ei5FngWy0AJ1vCpLeKxXKYnbTicLqyQ0HLJ7wmhIavfJAL40EM9hQUzlHlr96bJRSL99CcO9+hB7YoQP9aLmicsZ1qrnPy53vUi1VPBZ6B7cJuyL9+O4q9HLMQ4GXoN8BgZ9H2P0E3MVfdvZXMefsN5Nlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122265; c=relaxed/simple;
	bh=1tZLJ2CwjSIjsZZZo9ScgNjqPahtUXqqJ7OB3+7aqXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ka+izFYxGYEBpqYTYlod/+E+D/8Dxmp63EAiGUqq0JzuP7P5QbgOQkKxYLH1hbV0C6Fda81Zfex2oCsb//69avCoDbRu4hUsJeg0kadE3xso6ky8I8cMQpuSJKkJR36Y3xNRta4cpL0gDZr0tEtdp0El3bEEgoBrqLmwCktg0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AdUJqJBW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AdUJqJBW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so1035306866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744122260; x=1744727060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL6lCHpA1PC90/eS7Z3y1hjBChp030Ownr36xVlgHao=;
        b=AdUJqJBWWKN7C4xPhPUhCuIyfPE/SXBV59CbBPtQPEPHKhoK7VQMvGH9CrZ6WS+yiL
         XQezbVzSwnrNDyMrLj3WScFS4Znt5y0ecJlwctox0r/KhBk8s3+dwUB/0xH/K+dvvXx0
         n3YQZB6PCluzjc02+O6UwD03tqGtX9sqWfm+GRTrxnPZqv6nlypZ9SeYEW6z/4YgruoH
         NITNgYsAc1AseVjmYXba37fZgd8sIKnSx0nDkqj0GQh8GuYY5V6Q9gP1dlzKpRezHU74
         Dv5komTKDY58vSfdBpYzsd+1NYZwKxXmBjfOL3lA5kOJLvEKCwYYl5CNimK2YtalXcFW
         wEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122260; x=1744727060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL6lCHpA1PC90/eS7Z3y1hjBChp030Ownr36xVlgHao=;
        b=kqrI/IKwBYWEzk6qMBwQqoGWXLaULkjo4BWo2JVwaK2LiGq3pCeslSvixJMn/J9kib
         a8+5WArgnJuE2CrQ6PH0M72o5T94iu3/J0uXrkVmdDHnCShscy5QSMEyWOcGrN83jOX+
         GzHDfad6pWDhdLcXT7MVeTT7185XcIaDqc04Pog+xDIcy3ghQre4ZNkY7gk0Cu1ZCu9Q
         FVWPyFllC/2B8hRMEgPkQN9S0vSg3knGDmdmYz2T6mx8DJ91SzuGx3f3mK72bVIOX7Bw
         WVCzAIbCuONSLBQYQ6tfFqNYE4+vpk6Q/Qy+v25wFIBGbmJgnu3XHC6FUhy1IRFq9Dud
         kjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHNdWUf7y6v0DBruP39Tn9HPh5he2FKEw9dkwB8d3C6K1Lcd5VKUHOmgoxelJwnQeRCyWrDgn83Tricw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCWkfIkaooUA3F9+elnzN4POGXKz7OpG1e/ZRKnH4B0y4PuGV
	yUDnIlvvoJkj3skeIxA91VAPSoX1iOkdIsoPhMeuE6ea/XllW351nWYP6BDEQfw=
X-Gm-Gg: ASbGnct0as22BHGUtxSjOpFmbe9brmqBJXcdTJR1lUrGhAGjw35jPmdn6sj4sEIW80O
	m3IkgTs7ONTeA0hBy18Y3iahqfAm9ZjA6FFIZx/RBCu/HCd8XrqQrevRoUMBIW7m81nwpLElcAG
	I1iwsy3rQytdvFNv0NN6lqijYGJpQ4LY90Gst3+bNKdMh4MDCGQG3EqITaIaeUsk9hAgRbm4wsT
	ajtpEwNoxuW4dkAURA9eGCvW4Zcyegx3wjgp9+eJDRs/odpxXC16m0Fq0GQ/lkfsyBe/RXiZZx5
	b0Dfo0UVPO3rKsr6cN/TZSlOx4VZGSBVLQHLV9BoX4UDFVicvg==
X-Google-Smtp-Source: AGHT+IH5Rhibf3E3uxzTZWfX7RO+PEqmhUY0puqkPIIP7ewOpGsoukLXUFO0yKBYGPg/grVMQABQNg==
X-Received: by 2002:a17:906:f587:b0:ac1:e881:8997 with SMTP id a640c23a62f3a-ac7d6c9f74fmr1706730066b.3.1744122259735;
        Tue, 08 Apr 2025 07:24:19 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe9adfdsm938605466b.62.2025.04.08.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:24:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] pwm: Add support for pwmchip devices for faster and easier userspace access
Date: Tue,  8 Apr 2025 16:23:55 +0200
Message-ID:  <f31fea4002d62ba5c1f9f95ca58a182ecc5bc3a6.1744120697.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1744120697.git.ukleinek@kernel.org>
References: <cover.1744120697.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11522; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1tZLJ2CwjSIjsZZZo9ScgNjqPahtUXqqJ7OB3+7aqXQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn9TGAKtinznG9dr6F8W9rqsr1iyY5K1FvznQ+o ZzJVzk824aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/UxgAAKCRCPgPtYfRL+ TuZwB/9R0BYXnPLKk/4cq//3MNwGiyKmNfxiAZ4hfbW3vYduaCZp1TcxMA/jI8byyJVpdAWGlk1 cDahJd6lByyKdAPGX1nNaoHHQiSeppKzO7HWrGWRG4sMFB4ZUhmI2hRCM3PNIV6AXj/yY1zvfPa jAnkRoeqSrbczBTlA8rV4UeOyDw9TEtXViYT2VvfEtO4MIeAcWT5Nw5aq45MNn42xdOqh7Jw7P2 5g1zR9M3C85LoP3v2DC+IccnZyymaKABMZrXZQ1YOhpmarr2EGpaz1wzmNBn0nFNIE/PQCQSsAj O44qStYYZdxFc/XO38MJvWtGZOI6H4HnF6aCGiKat+6EuWCT
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With this change each pwmchip defining the new-style waveform callbacks
can be accessed from userspace via a character device. Compared to the
sysfs-API this is faster (on a stm32mp157 applying a new configuration
takes approx 25% only) and allows to pass the whole configuration in a
single ioctl allowing atomic application.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c       | 304 +++++++++++++++++++++++++++++++++++++--
 include/linux/pwm.h      |   3 +
 include/uapi/linux/pwm.h |  51 +++++++
 3 files changed, 343 insertions(+), 15 deletions(-)
 create mode 100644 include/uapi/linux/pwm.h

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index cec325bdffa5..eed5ba16703d 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -23,6 +23,8 @@
 
 #include <dt-bindings/pwm/pwm.h>
 
+#include <uapi/linux/pwm.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/pwm.h>
 
@@ -1960,20 +1962,9 @@ struct pwm_device *pwm_get(struct device *dev, const char *con_id)
 }
 EXPORT_SYMBOL_GPL(pwm_get);
 
-/**
- * pwm_put() - release a PWM device
- * @pwm: PWM device
- */
-void pwm_put(struct pwm_device *pwm)
+static void __pwm_put(struct pwm_device *pwm)
 {
-	struct pwm_chip *chip;
-
-	if (!pwm)
-		return;
-
-	chip = pwm->chip;
-
-	guard(mutex)(&pwm_lock);
+	struct pwm_chip *chip = pwm->chip;
 
 	/*
 	 * Trigger a warning if a consumer called pwm_put() twice.
@@ -1994,6 +1985,20 @@ void pwm_put(struct pwm_device *pwm)
 
 	module_put(chip->owner);
 }
+
+/**
+ * pwm_put() - release a PWM device
+ * @pwm: PWM device
+ */
+void pwm_put(struct pwm_device *pwm)
+{
+	if (!pwm)
+		return;
+
+	guard(mutex)(&pwm_lock);
+
+	__pwm_put(pwm);
+}
 EXPORT_SYMBOL_GPL(pwm_put);
 
 static void devm_pwm_release(void *pwm)
@@ -2063,6 +2068,262 @@ struct pwm_device *devm_fwnode_pwm_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_fwnode_pwm_get);
 
+struct pwm_cdev_data {
+	struct pwm_chip *chip;
+	struct pwm_device *pwm[];
+};
+
+static int pwm_cdev_open(struct inode *inode, struct file *file)
+{
+	struct pwm_chip *chip = container_of(inode->i_cdev, struct pwm_chip, cdev);
+	struct pwm_cdev_data *cdata;
+
+	guard(mutex)(&pwm_lock);
+
+	if (!chip->operational)
+		return -ENXIO;
+
+	cdata = kzalloc(struct_size(cdata, pwm, chip->npwm), GFP_KERNEL);
+	if (!cdata)
+		return -ENOMEM;
+
+	cdata->chip = chip;
+
+	file->private_data = cdata;
+
+	return nonseekable_open(inode, file);
+}
+
+static int pwm_cdev_release(struct inode *inode, struct file *file)
+{
+	struct pwm_cdev_data *cdata = file->private_data;
+	unsigned int i;
+
+	for (i = 0; i < cdata->chip->npwm; ++i) {
+		struct pwm_device *pwm = cdata->pwm[i];
+
+		if (pwm) {
+			const char *label = pwm->label;
+
+			pwm_put(cdata->pwm[i]);
+			kfree(label);
+		}
+	}
+	kfree(cdata);
+
+	return 0;
+}
+
+static int pwm_cdev_request(struct pwm_cdev_data *cdata, unsigned int hwpwm)
+{
+	struct pwm_chip *chip = cdata->chip;
+
+	if (hwpwm >= chip->npwm)
+		return -EINVAL;
+
+	if (!cdata->pwm[hwpwm]) {
+		struct pwm_device *pwm = &chip->pwms[hwpwm];
+		const char *label;
+		int ret;
+
+		label = kasprintf(GFP_KERNEL, "pwm-cdev (pid=%d)", current->pid);
+		if (!label)
+			return -ENOMEM;
+
+		ret = pwm_device_request(pwm, label);
+		if (ret < 0)
+			return ret;
+
+		cdata->pwm[hwpwm] = pwm;
+	}
+
+	return 0;
+}
+
+static int pwm_cdev_free(struct pwm_cdev_data *cdata, unsigned int hwpwm)
+{
+	struct pwm_chip *chip = cdata->chip;
+
+	if (hwpwm >= chip->npwm)
+		return -EINVAL;
+
+	if (cdata->pwm[hwpwm]) {
+		struct pwm_device *pwm = cdata->pwm[hwpwm];
+		const char *label = pwm->label;
+
+		__pwm_put(pwm);
+
+		kfree(label);
+
+		cdata->pwm[hwpwm] = NULL;
+	}
+
+	return 0;
+}
+
+static struct pwm_device *pwm_cdev_get_requested_pwm(struct pwm_cdev_data *cdata,
+						     u32 hwpwm)
+{
+	struct pwm_chip *chip = cdata->chip;
+
+	if (hwpwm >= chip->npwm)
+		return ERR_PTR(-EINVAL);
+
+	if (cdata->pwm[hwpwm])
+		return cdata->pwm[hwpwm];
+
+	return ERR_PTR(-EINVAL);
+}
+
+static long pwm_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int ret = 0;
+	struct pwm_cdev_data *cdata = file->private_data;
+	struct pwm_chip *chip = cdata->chip;
+
+	guard(mutex)(&pwm_lock);
+
+	if (!chip->operational)
+		return -ENODEV;
+
+	switch (cmd) {
+	case PWM_IOCTL_REQUEST:
+		{
+			unsigned int hwpwm = arg;
+
+			return pwm_cdev_request(cdata, hwpwm);
+		}
+		break;
+
+	case PWM_IOCTL_FREE:
+		{
+			unsigned int hwpwm = arg;
+
+			return pwm_cdev_free(cdata, hwpwm);
+		}
+		break;
+
+	case PWM_IOCTL_ROUNDWF:
+		{
+			struct pwmchip_waveform cwf;
+			struct pwm_waveform wf;
+			struct pwm_device *pwm;
+
+			ret = copy_from_user(&cwf,
+					     (struct pwmchip_waveform __user *)arg,
+					     sizeof(cwf));
+			if (ret)
+				return -EFAULT;
+
+			if (cwf.__pad != 0)
+				return -EINVAL;
+
+			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
+			if (IS_ERR(pwm))
+				return PTR_ERR(pwm);
+
+			wf = (struct pwm_waveform) {
+				.period_length_ns = cwf.period_length_ns,
+				.duty_length_ns = cwf.duty_length_ns,
+				.duty_offset_ns = cwf.duty_offset_ns,
+			};
+
+			ret = pwm_round_waveform_might_sleep(pwm, &wf);
+			if (ret < 0)
+				return ret;
+
+			cwf = (struct pwmchip_waveform) {
+				.hwpwm = cwf.hwpwm,
+				.period_length_ns = wf.period_length_ns,
+				.duty_length_ns = wf.duty_length_ns,
+				.duty_offset_ns = wf.duty_offset_ns,
+			};
+
+			return copy_to_user((struct pwmchip_waveform __user *)arg,
+					    &cwf, sizeof(cwf));
+		}
+		break;
+
+	case PWM_IOCTL_GETWF:
+		{
+			struct pwmchip_waveform cwf;
+			struct pwm_waveform wf;
+			struct pwm_device *pwm;
+
+			ret = copy_from_user(&cwf,
+					     (struct pwmchip_waveform __user *)arg,
+					     sizeof(cwf));
+			if (ret)
+				return -EFAULT;
+
+			if (cwf.__pad != 0)
+				return -EINVAL;
+
+			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
+			if (IS_ERR(pwm))
+				return PTR_ERR(pwm);
+
+			ret = pwm_get_waveform_might_sleep(pwm, &wf);
+			if (ret)
+				return ret;
+
+			cwf.period_length_ns = wf.period_length_ns;
+			cwf.duty_length_ns = wf.duty_length_ns;
+			cwf.duty_offset_ns = wf.duty_offset_ns;
+
+			return copy_to_user((struct pwmchip_waveform __user *)arg,
+					    &cwf, sizeof(cwf));
+		}
+		break;
+
+	case PWM_IOCTL_SETROUNDEDWF:
+	case PWM_IOCTL_SETEXACTWF:
+		{
+			struct pwmchip_waveform cwf;
+			struct pwm_waveform wf;
+			struct pwm_device *pwm;
+
+			ret = copy_from_user(&cwf,
+					     (struct pwmchip_waveform __user *)arg,
+					     sizeof(cwf));
+			if (ret)
+				return -EFAULT;
+
+			if (cwf.__pad != 0)
+				return -EINVAL;
+
+			wf = (struct pwm_waveform){
+				.period_length_ns = cwf.period_length_ns,
+				.duty_length_ns = cwf.duty_length_ns,
+				.duty_offset_ns = cwf.duty_offset_ns,
+			};
+
+			if (!pwm_wf_valid(&wf))
+				return -EINVAL;
+
+			pwm = pwm_cdev_get_requested_pwm(cdata, cwf.hwpwm);
+			if (IS_ERR(pwm))
+				return PTR_ERR(pwm);
+
+			return pwm_set_waveform_might_sleep(pwm, &wf,
+							    cmd == PWM_IOCTL_SETEXACTWF);
+		}
+		break;
+
+	default:
+		return -ENOTTY;
+	}
+}
+
+static const struct file_operations pwm_cdev_fileops = {
+	.open = pwm_cdev_open,
+	.release = pwm_cdev_release,
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = pwm_cdev_ioctl,
+};
+
+static dev_t pwm_devt;
+
 /**
  * __pwmchip_add() - register a new PWM chip
  * @chip: the PWM chip to add
@@ -2115,7 +2376,13 @@ int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
 	scoped_guard(pwmchip, chip)
 		chip->operational = true;
 
-	ret = device_add(&chip->dev);
+	if (chip->id < 256 && chip->ops->write_waveform)
+		chip->dev.devt = MKDEV(MAJOR(pwm_devt), chip->id);
+
+	cdev_init(&chip->cdev, &pwm_cdev_fileops);
+	chip->cdev.owner = owner;
+
+	ret = cdev_device_add(&chip->cdev, &chip->dev);
 	if (ret)
 		goto err_device_add;
 
@@ -2166,7 +2433,7 @@ void pwmchip_remove(struct pwm_chip *chip)
 		idr_remove(&pwm_chips, chip->id);
 	}
 
-	device_del(&chip->dev);
+	cdev_device_del(&chip->cdev, &chip->dev);
 }
 EXPORT_SYMBOL_GPL(pwmchip_remove);
 
@@ -2310,9 +2577,16 @@ static int __init pwm_init(void)
 {
 	int ret;
 
+	ret = alloc_chrdev_region(&pwm_devt, 0, 256, "pwm");
+	if (ret) {
+		pr_warn("Failed to initialize chrdev region for PWM usage\n");
+		return ret;
+	}
+
 	ret = class_register(&pwm_class);
 	if (ret) {
 		pr_err("Failed to initialize PWM class (%pe)\n", ERR_PTR(ret));
+		unregister_chrdev_region(pwm_devt, 256);
 		return ret;
 	}
 
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index bf0469b2201d..d8817afe95dc 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -2,6 +2,7 @@
 #ifndef __LINUX_PWM_H
 #define __LINUX_PWM_H
 
+#include <linux/cdev.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -309,6 +310,7 @@ struct pwm_ops {
 /**
  * struct pwm_chip - abstract a PWM controller
  * @dev: device providing the PWMs
+ * @cdev: &struct cdev for this device
  * @ops: callbacks for this PWM controller
  * @owner: module providing this chip
  * @id: unique number of this PWM chip
@@ -323,6 +325,7 @@ struct pwm_ops {
  */
 struct pwm_chip {
 	struct device dev;
+	struct cdev cdev;
 	const struct pwm_ops *ops;
 	struct module *owner;
 	unsigned int id;
diff --git a/include/uapi/linux/pwm.h b/include/uapi/linux/pwm.h
new file mode 100644
index 000000000000..3d2c3cefc090
--- /dev/null
+++ b/include/uapi/linux/pwm.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+
+#ifndef _UAPI_PWM_H_
+#define _UAPI_PWM_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * struct pwmchip_waveform - Describe a PWM waveform for a pwm_chip's PWM channel
+ * @hwpwm: per-chip relative index of the PWM device
+ * @__pad: padding, must be zero
+ * @period_length_ns: duration of the repeating period.
+ *    A value of 0 represents a disabled PWM.
+ * @duty_length_ns: duration of the active part in each period
+ * @duty_offset_ns: offset of the rising edge from a period's start
+ */
+struct pwmchip_waveform {
+	__u32 hwpwm;
+	__u32 __pad;
+	__u64 period_length_ns;
+	__u64 duty_length_ns;
+	__u64 duty_offset_ns;
+};
+
+/* Reserves the passed hwpwm for exclusive control. */
+#define PWM_IOCTL_REQUEST	_IO(0x75, 1)
+
+/* counter part to PWM_IOCTL_REQUEST */
+#define PWM_IOCTL_FREE		_IO(0x75, 2)
+
+/*
+ * Modifies the passed wf according to hardware constraints. All parameters are
+ * rounded down to the next possible value, unless there is no such value, then
+ * values are rounded up.
+ */
+#define PWM_IOCTL_ROUNDWF	_IOWR(0x75, 3, struct pwmchip_waveform)
+
+/* Get the currently implemented waveform */
+#define PWM_IOCTL_GETWF		_IOWR(0x75, 4, struct pwmchip_waveform)
+
+/* Like PWM_IOCTL_GETWF + PWM_IOCTL_SETROUNDEDWF in one go. */
+#define PWM_IOCTL_SETROUNDEDWF	_IOW(0x75, 5, struct pwmchip_waveform)
+
+/*
+ * Program the PWM to emit exactly the passed waveform, subject only to rounding
+ * down each value less than 1 ns.
+ */
+#define PWM_IOCTL_SETEXACTWF	_IOW(0x75, 6, struct pwmchip_waveform)
+
+#endif /* _UAPI_PWM_H_ */
-- 
2.47.2

