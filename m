Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23820E315
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070007; cv=none; b=ZTRbEHy8tNJSp2Ci1j+sSWC/D+TrTgEKTk+ytqYxtVyxIMo6KIXpVxf1gukTjwxx0HiqekfCrnYPo/h+hB3Urt599xLgOsY/kOANrn9HUIUJV5GQ8hikHufl+sPxBopKW1urpjCYZF0giD2oFk6AP2Ho+ECT24IF7qKVrv8sj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070007; c=relaxed/simple;
	bh=5X1aPO2z0jUPOmAmxxbRnG88+AZ4I5yT718/OM1HQtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cyx3LJovjZLoaHaXdzcuhbBPRKS5ZvBkdvfcV0VlcIs9YTu+Az30oeiXVwnwXPtrWzPw0DxexdEuLGmk4EhjYepULnoNYbFDUPOc+M+ouPNe0vwRgsUyEV+h5J5mcew2XRuodsaoyYTqsEKs42e7XK8WI7z5aFCo30ejrVqfM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERcgIXfu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERcgIXfu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso5765265e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070003; x=1743674803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=ERcgIXfuYJBP+Fu00nEvbZ/9/C/qhLfcTVYbc9VFyt8flpltttQDuDMYksDAIfcphF
         ZDh2VrKzgSwXwcfJ96c17J6ThD7iED7TwG+SBLU4C0khefx3uXuZbqtx0N8OFjBzG2HL
         HTI4yoGcbNCU2IkX3QqfII9sGyj/iXr14uQm0fBOKw4UNhj9Q8NQNZRNkpdcOUNuGnWQ
         2+eTC/vuv9yg6Xr9z6oRX/ECdaYX8Y19a8Ha4I/clSUDiuPqrqmsAcdPKo8Ey0cGr7qe
         543kR2A+Ou9ziVMC3wZfYK2g3wnZ3iQ5XmPKhN2/1mjJCk8P6nQ+5VHsWni9VkdiBNBl
         9OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070003; x=1743674803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPfdok1uXbCV3fbB68Oh0kuMKD9EmCqvBmSN9d5b64A=;
        b=KoXYYHLP+7wj6GMVHUUwxQNjtx/BSC0A9OaU+YHzSP8JNUaTXRFTGEv8PhQegDFtY8
         reLd8TsY78o/5MGSo+aKnjEr0kMyKmTDhvh94vKmY+1sjq9eAB94ANXaE+lxYYUKLbcy
         0VY0/t0Ku43nz7exfuWnx9c7AuOEPTHj9lhFBNSXKDvtQ1VjnGCHX4MN4ck+vwY45cXE
         G1FtPUy44vy1GhDHPbs9oIyu3Quds4c9rIrnjw9B3j/yDmgQ515+zoT76IX8m9c8IP3Z
         EevO9oqOuq/LWdvdgHsmMwhlo9vRQNrzB5ysO+EK0uNi29GXtXst0pQcJZbPhRNT8YO8
         Yudg==
X-Forwarded-Encrypted: i=1; AJvYcCWIrim2IP+8doygZmGRwP5ibjL9C3DCK7Eyw4MV4D0U2Dcv3R+74CtBvYsKnuDAVkfw9CDQzX1muV5VsmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLAl668OHnNASZWzixXO4Qu/rQzJy2DTUK24NCEnEwK6eZMRL
	yPVcXwIjueq9GgrrU0r5P4v+UU0d2UgCVW/Tj0GhE8wtW2Ef7Kyxk8Y158HuA7Y=
X-Gm-Gg: ASbGncvjqaaS8qye06HxNH1VxWJM7g6wGnsmECiC80r83pFtYoO1Fis7ouzCjwRB3VD
	MzPWIaYtML7wxU+6GVZzyAGPQVCEc1HvXs+B0BRqXcZeHFWsyXzDygqEo1QFvqvQS9u0khasVb6
	VEgyIuBdPuW+n51G/ksjboOcR6IEdNAiVdBQ7z+Pc6V4U4SzFoBeQxtpGDFjfn964ppE6Xhfyll
	6f6TP7q98cd0rlLCxeSACzeXkpC8fKhOBYPiNaq7Y32iJObrukGLzgu81rtoAZjmx/MfmgX7JPh
	HMIm6z6neL4XwPt0/NiI4UfIPCkm64ceJB3iv9od5sfkxoW1PkCs2rnC3kRljh30sQre3ObQucX
	mdtT+
X-Google-Smtp-Source: AGHT+IGvhejD0NIOJT8VU6o6/lTjL7NGCr3dmcDkjmpV3rceQSS3SZ9h5CMW7LsJMAed7F1uaAVW1w==
X-Received: by 2002:a05:6000:40e0:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-39ad1785e98mr2439933f8f.49.1743070003510;
        Thu, 27 Mar 2025 03:06:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:42 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 2/6] mux: gpio: add optional regulator support
Date: Thu, 27 Mar 2025 10:06:29 +0000
Message-Id: <20250327100633.11530-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Some of the external muxes needs powering up using a regulator.
This is the case with Lenovo T14s laptop which has a external audio mux
to handle US/EURO headsets.

Add support to the driver to handle this optional regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/mux/gpio.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4..d1607f287755 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -15,6 +15,7 @@
 #include <linux/mux/driver.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
@@ -82,6 +83,10 @@ static int mux_gpio_probe(struct platform_device *pdev)
 		mux_chip->mux->idle_state = idle_state;
 	}
 
+	ret = devm_regulator_get_enable_optional(dev, "mux");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "Couldn't retrieve/enable gpio mux supply\n");
+
 	ret = devm_mux_chip_register(dev, mux_chip);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

