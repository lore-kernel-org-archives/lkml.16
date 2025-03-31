Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9321C189
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447852; cv=none; b=LuwBKW6i1Gqy84bNLU2eVOpbFagum1/6kIu5spsMC2gSZTdQ0McrDZ46YpXKF0e/cuLVI/HavbYoJebq2n4ERUEUipKl5/6Otw9HcB4mTY6WR/7LkPiPHszj0kOHPlZcdQJCwKp32beWx3cbqXhzVW7r0MazHMkZ3I1HMoSq7Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447852; c=relaxed/simple;
	bh=HhntccDJjAfudcGqflMX5mA7KN1ruQeqrt4gyclxTbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMgLuxmYh0CU0nvVm6/B9S74Wn0MKLJ269svXF6vw+zd408odhQgskCpHSMBDxpP2QXQRYQYMo1z5nYrnGDsClwlYSydpZk0/Oe7sQZz3TfbSu6ejP+wSPGEQgHwjWJYzFMQJbW7jhOoQu59MMzdVFRUYjggzWa3ufGsfD4I5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=li8daSgm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="li8daSgm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abf3d64849dso738045366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743447848; x=1744052648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oydnnGWKEEF+B555rBtJ+JTba4AdRTKZvDkfqDfc4Cc=;
        b=li8daSgmU4S6LHRoNVdt2gneLCbU4oB3KyXFPJzihPOzQBt1Aq3ua6eb8cOppQ1Yyf
         0Jb6sohYI6Z6Jak9K1dxrLw6nW4yZQuW8k6mbYaNmhX0uHN3W1QKTiMnc+h4zCL3SJJ5
         ASIGk6xLAUal7G5rmE5rP9Zs3SKvYDP6vZKRhi18VKoTMh/FFH9LbdQtQzvBuFdxaV87
         cN5n5Gw0Bx2NnVE1ZAqWqbrJBjGpIwZc54fWWQ8w2H9h0zyWW5ROaiJf37JcLTpP3Hab
         oQv8xwAe+lZPj+QV05czE7Rag9S7U0z0cuzWrIqn4105gFxIsxvBr5VN77CxhToHq5FG
         fbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447848; x=1744052648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oydnnGWKEEF+B555rBtJ+JTba4AdRTKZvDkfqDfc4Cc=;
        b=XQuka5FDuKm4OFD58LYYLhg9EqSIjo1J+sUfJBueXhgIvS/8JguXXQfJ8ANMyDkCxi
         G4CYg+1RlKtwLILzhwQivj2jrO+M9r0UoaQG3nIwPAdsxvIPAx1JfwSF194xKqvYjdFs
         30PNHuw0qCUBIv7Co77CA+TTkZZ8niQnSOXmLKAPcWYoex7ULvHkvx1VBDI7SJNTzxja
         u11mHVRGQoKXilcwYdAH8A8rXoJxtXTOE90xJ9yiW00YmunSPgHY5VLCCDJUnUJOobip
         GekE4yS+/K1LU9d43VJfJKUsucD9A3rEabmbPdxBbDvsiHuF/9zliJ2pPpzQoyN/thqr
         LYXA==
X-Forwarded-Encrypted: i=1; AJvYcCWLq6yKoYp1QvxxIJE5wC+bmi2+dv5ZH9EiEODpQ/kHnPerZ4u0BDOge32QMTUMR2XRQ0Cg88LasuWVPWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJF7KGLVJ4V5cIjqRY+LKEC3fnOWTyRKYCsoQnz25ImT5s8XTF
	yP9GKEHugi196kk2m95X9WO71R8xGDSnVhYMol7v94SSbyJAFesmqNdDqzyuzWU=
X-Gm-Gg: ASbGncvFaxX+J7IZHLtlsfS1nCJUQtIGAXF4Kx+FqG+6SBC21GMk8lxMHGGDLBtIKXl
	ES0bIDoB0eQIl8LAbUFqagpK313MTkJoHSE6wpooyxyKHySX76HOPFelHwfS9XVQmRSLSCy1dfU
	jJ3lLpzzDMRvMnVPJ2HvaNhUmSI4H9x2kTBLWh8r/CN6dxxyxVk/k9gO4Uth6cnBv7S8cV4uihZ
	RTlDfJdvdzZ9iY9/n88C0pmNlBkzEeE86NuMDpiRoj73EZZ2bZfWoxTdiwZ4/lYS6KFihCkLfJO
	A6uuQgG3nSE5NQ9tzoayPnxL2FbGeYY24pChc2qlCPpKM5k9JGJqaH4VA0bPczRb0g88BJrOV3k
	wLUdcGWl/vFKu4oM5DuOp8DnAb1DW
X-Google-Smtp-Source: AGHT+IGZgaTxx+7ZjL/FlP/L9Ag5GKaaT4V+DkX9m8JecEYrquECoAyEIK4ePYCjY3znN2c1xUclZw==
X-Received: by 2002:a17:906:1382:b0:ac3:eb29:2aef with SMTP id a640c23a62f3a-ac738b4fa52mr785422966b.41.1743447848417;
        Mon, 31 Mar 2025 12:04:08 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9cfsm652288566b.122.2025.03.31.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:04:07 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 31 Mar 2025 21:02:48 +0200
Subject: [PATCH v2 5/5] iio: dac: ad3552r-hs: add support for internal ramp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-wip-bl-ad3552r-fixes-v2-5-cdedb430497e@baylibre.com>
References: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
In-Reply-To: <20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5442;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=QKeZ0jQPU0IE/bOj+jLk3e21UXPcLFSKvsofD9UQzCU=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkh/9ezWvWOP/qknWHxtWxJwfcqf77Yuxv22uzU+l/C0Z
 LgWSlZndpSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZhI3k1Ghnaj5IOCegVHfM6y
 WklvXsZd6K88J7NJZGZElFdasLeALyPDUXbWCqE/K54vFxTa5TLLwZ6JwfnKnGOuL2dUXG5pFkn
 gAQA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

The ad3552r can be feeded from the HDL controller by an internally
generated 16bit ramp, useful for debug pourposes. Add debugfs a file
to enable or disable it.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/ad3552r-hs.c | 122 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/dac/ad3552r-hs.c b/drivers/iio/dac/ad3552r-hs.c
index 37397e188f225a8099745ec03f7c604da76960b1..d4f50b33565f99b90859e30571dc59038d01361c 100644
--- a/drivers/iio/dac/ad3552r-hs.c
+++ b/drivers/iio/dac/ad3552r-hs.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iio/backend.h>
@@ -54,8 +55,12 @@ struct ad3552r_hs_state {
 	struct ad3552r_hs_platform_data *data;
 	/* INTERFACE_CONFIG_D register cache, in DDR we cannot read values. */
 	u32 config_d;
+	struct mutex lock;
 };
 
+static const char dbgfs_src_iio_buffer[] = "iio-buffer";
+static const char dbgfs_src_backend_ramp_gen[] = "backend-ramp-generator";
+
 static int ad3552r_hs_reg_read(struct ad3552r_hs_state *st, u32 reg, u32 *val,
 			       size_t xfer_size)
 {
@@ -65,6 +70,18 @@ static int ad3552r_hs_reg_read(struct ad3552r_hs_state *st, u32 reg, u32 *val,
 	return st->data->bus_reg_read(st->back, reg, val, xfer_size);
 }
 
+static int ad3552r_hs_set_data_source(struct ad3552r_hs_state *st,
+				      enum iio_backend_data_source type)
+{
+	int ret;
+
+	ret = iio_backend_data_source_set(st->back, 0, type);
+	if (ret)
+		return ret;
+
+	return iio_backend_data_source_set(st->back, 1, type);
+}
+
 static int ad3552r_hs_update_reg_bits(struct ad3552r_hs_state *st, u32 reg,
 				      u32 mask, u32 val, size_t xfer_size)
 {
@@ -483,6 +500,76 @@ static int ad3552r_hs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
 	return st->data->bus_reg_write(st->back, reg, writeval, 1);
 }
 
+static ssize_t ad3552r_hs_show_data_source(struct file *f, char __user *userbuf,
+					   size_t count, loff_t *ppos)
+{
+	struct ad3552r_hs_state *st = file_inode(f)->i_private;
+	enum iio_backend_data_source type;
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = iio_backend_data_source_get(st->back, 0, &type);
+	if (ret)
+		return ret;
+
+	switch (type) {
+	case IIO_BACKEND_INTERNAL_RAMP_16BIT:
+		return simple_read_from_buffer(userbuf, count, ppos,
+			dbgfs_src_backend_ramp_gen,
+			strlen(dbgfs_src_backend_ramp_gen));
+	case IIO_BACKEND_EXTERNAL:
+		return simple_read_from_buffer(userbuf, count, ppos,
+			dbgfs_src_iio_buffer, strlen(dbgfs_src_iio_buffer));
+	default:
+		return -EINVAL;
+	}
+}
+
+static ssize_t ad3552r_hs_write_data_source(struct file *f,
+					    const char __user *userbuf,
+					    size_t count, loff_t *ppos)
+{
+	struct ad3552r_hs_state *st = file_inode(f)->i_private;
+	char buf[64];
+	int ret, len;
+
+	guard(mutex)(&st->lock);
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
+				     count);
+	if (ret < 0)
+		return ret;
+
+	len = strlen(dbgfs_src_iio_buffer);
+	if (count == len && !strncmp(buf, dbgfs_src_iio_buffer, len)) {
+		ret = ad3552r_hs_set_data_source(st, IIO_BACKEND_EXTERNAL);
+		if (ret)
+			return ret;
+		goto exit_ok;
+	}
+
+	len = strlen(dbgfs_src_backend_ramp_gen);
+	if (count == len && !strncmp(buf, dbgfs_src_backend_ramp_gen, len)) {
+		ret = ad3552r_hs_set_data_source(st,
+			IIO_BACKEND_INTERNAL_RAMP_16BIT);
+		if (ret)
+			return ret;
+		goto exit_ok;
+	}
+
+	return -EINVAL;
+
+exit_ok:
+	return count;
+}
+
+static const struct file_operations ad3552r_hs_data_source_fops = {
+	.owner = THIS_MODULE,
+	.write = ad3552r_hs_write_data_source,
+	.read = ad3552r_hs_show_data_source,
+};
+
 static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
 {
 	u16 id;
@@ -550,11 +637,7 @@ static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
 	if (ret)
 		return ret;
 
-	ret = iio_backend_data_source_set(st->back, 0, IIO_BACKEND_EXTERNAL);
-	if (ret)
-		return ret;
-
-	ret = iio_backend_data_source_set(st->back, 1, IIO_BACKEND_EXTERNAL);
+	ret = ad3552r_hs_set_data_source(st, IIO_BACKEND_EXTERNAL);
 	if (ret)
 		return ret;
 
@@ -661,6 +744,24 @@ static const struct iio_info ad3552r_hs_info = {
 	.debugfs_reg_access = &ad3552r_hs_reg_access,
 };
 
+static void ad3552r_hs_debugfs_init(struct iio_dev *indio_dev)
+{
+	struct ad3552r_hs_state *st = iio_priv(indio_dev);
+	struct dentry *d = iio_get_debugfs_dentry(indio_dev);
+
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
+		return;
+
+	d = iio_get_debugfs_dentry(indio_dev);
+	if (!d) {
+		dev_warn(st->dev, "can't set debugfs in driver dir\n");
+		return;
+	}
+
+	debugfs_create_file("data_source", 0600, d, st,
+			    &ad3552r_hs_data_source_fops);
+}
+
 static int ad3552r_hs_probe(struct platform_device *pdev)
 {
 	struct ad3552r_hs_state *st;
@@ -705,7 +806,16 @@ static int ad3552r_hs_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_iio_device_register(&pdev->dev, indio_dev);
+	ret = devm_iio_device_register(&pdev->dev, indio_dev);
+	if (ret)
+		return ret;
+
+	mutex_init(&st->lock);
+
+	ad3552r_hs_debugfs_init(indio_dev);
+
+	return ret;
+
 }
 
 static const struct of_device_id ad3552r_hs_of_id[] = {

-- 
2.49.0

