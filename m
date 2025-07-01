Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F7C274659
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370592; cv=none; b=epz04pyfq2vhTqgeLFjz2ThDNk56wOZsfWojKbTzyLXPV+9e+PGvEcul0sToXUDaiIQehPIx8/Pz8lutfKVYfwfKtDOZsEhIXK6Mf5+iSagFHPI74iST9RkUV1At/LV0ibajgulHRnNvW/8tZHK8p66pjF0iwWFZnsAsDtAcOfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370592; c=relaxed/simple;
	bh=/liGg8Z1FTCCY6VxUUiyw/vjJxQXpm//lBqgX9kP3dI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYWNbF/fupl7xwC+z7nhcYJP7ARev8Vg89pqp+Ys4fIZBV6mCSrXwQsNJzT2c40p6qjg8IOxXm/Sa/upZx4isrGifljiVTB/VwDk7hjRxNbpdPjDV4VX/YXCdRSvA6WdI8urhC/Z/ZdwnMS+k8wJ3Q5JKgr19jQHjoSwxLaE+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FAt+xAG5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FAt+xAG5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4011845f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370588; x=1751975388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=FAt+xAG52I+Eb40vF5gUQ9IEb2I0TMRUr7ORsEUTC4j0wZsyE0ki46Ve4fICZ7qraz
         UsT2GV+B/3Cr7C2NIhUhY5Fs7rrpi4seHAey6dD+j7sOkUxPDJT6xZXByf3a9UHsEdJe
         YicK5t4C9fIv/hnw5dsWRYi5Pguqmm6JYKuDnGVfbdDkV9/tg24/jZ+jh2/dye0ly/LM
         rdyVmyxfSW1w2CaUY4xbvjhsZDXNIFe/wHEtwYi1wOYesomk41am7uTJrITH7LUEla7i
         FY58qamCS0ABA2Iucmt0i3sI11my0Wr+WrVcbv/O5EyE+aralJJVWqh3fmXoLnBGBDMk
         o8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370588; x=1751975388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnET98UW3q4Lh5roGHBULYTY/QH8nhGQbEQwpvTzKlQ=;
        b=dRsZoDafGLqm+/Hyoy1Vo73e5Ga0+mc8oYr75sgDi0B49Flb1r615ixsUHT7xgRMEv
         26boKSXWshvHqp8bD1E6X3PTzspGghBYqXefoHmrj5E2UHSODa9bsl2QKP59F4wrVfcJ
         1fw+ETpKFnDedegbYScCFHAgJhRJyVgJSLGb24dQ+E5cjsQgSeE8ZpJCz/FdxdDekpmp
         wcBd2nXwHrDhxj5sLE4HHBg6P2g8ScwM1JaG6iSjJlerklsIMCQfLMOsK0i5H7QB/flG
         Alubrr4z+ixrCnFlrgK05+/ra62hLF2bZWsKJcLzDOJExOPqUIe9cfE/2SIDLEhytVjb
         njdA==
X-Forwarded-Encrypted: i=1; AJvYcCVgbLbxPjxJUt7Y/FRhqaUwp4ObaTMVV1zFo9rQAMCazKvJ+U0nTzHsW4cFHiTN3+0Z25vcii5cEmOfKB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0hPQjhYfqG/EQ52SV++TZDLOPuPC3Himx7dyioIv/OMWeao/
	EfWcNZ4CMFYrQpX4DkdX5DWepnKbZr8QsHruSLPnn/KP/cbhZ2oBqQ9sfvw8GEA6mT8=
X-Gm-Gg: ASbGncs8tTXZ93nglMIHKv+Ri+q7X+JawczQMX3O83pmy9+5mAf2hOsM8NpSHA43bxN
	YyfevIw5rUpZxZ15t0YH9qg7SxP5kORcVdjhB898ZBdjImt1VxDghRdLSBr8wXtKPVfVPHO+Iaf
	xtfNhr12yq8Hfxm2U/XuM7qfF+VKYwFpv2ybm4te3iVITqUKwUTePGTXkJupg7X0tcfegBsI1Wh
	1dNCpYIXQezPzWDRgMvUyV0jLyTiWG6W5bUvqS79+0g9vJ7Lc6Jpvz2J9VI8bMyYwWUhODzQtsN
	NM+Fq1TFFF50DA/6GSzclTSYoUFqvBJhimMf2R/i+4hbZBgqGzRmCg==
X-Google-Smtp-Source: AGHT+IGzD4Mf8syZLNv6toYxZEcYHBpzR51yBNAd8gDbc5ThQS0t22Hcfo27kXGUE7z0H6MDx9Amyg==
X-Received: by 2002:a05:6000:104e:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a917bc827cmr12012983f8f.44.1751370588497;
        Tue, 01 Jul 2025 04:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:36 +0200
Subject: [PATCH RFT v2 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-2-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1825;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GroFk8Q5FkhtN365brFZHyh2tlzBuOR036y6JYVpJP8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXgR8SvDBadENlz3jrMIRT1uq7RXKh2WvYk
 h5qNXOpDVqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 coMTEADCnHYB6sIGGMnETNsvZvTMFWuIKl4hmd/MJvNwxPLxGSAQMY8Iv5AMkfa5y+vpFI1CCqY
 ItUhoMYuoZhgWZbuPp2Mp5n0k8rbZuR8xvlNRmRl1okJF5UfkBUZXNU++yE1OnFkKqdIqdjvCLe
 GjiCZ6d7Rlyj1eAiztikmz0X+a3otxj88gBbJ4Xce8xldqreAt9psxwTt5Csso2Ed7CBifFCkdF
 jggoFS43tmUKiEgQDX7QrMdUz2ZzWcEnScXzxXCybwChAwBm89CNC8nwDIdpkwv8SVpTXLjoDBI
 KMUo59dDIDM5JlVQG+hOvEGn0KwXwdOdUdIrxjC4jmOy9P1SZBQDpuQjGQ0KrkgWHodvsobzWsH
 gDboc9/lF+vhA6cb8JqlW8b7efovKfPdgzryvGHU1fDAuA67fx0uaP1uk03sMdjsfcXU4j1+6Q7
 4H5UPNqnJhXS2ZtONHUnMHHoFdOdp4IAIYgS/FnZ5pgZ6uCrwPYP8TizLs+7MfaBP+Nd9x1R97L
 oOZT8GX4x5AVOWvC0Ja4EZ1AhFD/ohEiCc3qE6lmHkvCWSrbW+5CJ0l34b9FpQ98tneqIecRGmp
 QaIdfjYq1PniianL9wOyXpiG1asjjQzvnapg1liCMla4LDxUDlrFW7xii6z+3tA1lg5iASR+GqA
 dHRw54sQZ++x2MA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
module, let's add support for getting the relevant values from generic
device properties. "label" is a semi-standardized property in some GPIO
drivers so let's go with it. There's no standard "base" property, so
let's use the name "gpio-mmio,base" to tie it to this driver
specifically. The number of GPIOs will be retrieved using
gpiochip_get_ngpios() so there's no need to look it up in the software
node.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3..f66137caa245b14e6e8dbd043243224bc47c9609 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -737,6 +737,9 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	const char *label;
+	unsigned int base;
+	int ret;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -753,6 +756,18 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 	if (device_property_read_bool(dev, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
+	ret = device_property_read_string(dev, "label", &label);
+	if (!ret)
+		pdata->label = label;
+
+	/*
+	 * This property *must not* be used in device-tree sources, it's only
+	 * meant to be passed to the driver from board files and MFD core.
+	 */
+	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!ret && base <= INT_MAX)
+		pdata->base = base;
+
 	return pdata;
 }
 

-- 
2.48.1

