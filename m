Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386D1DF251
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184733; cv=none; b=a0YP3wzUTAz0tdo8xCDZATBbtv5kTMKjTFf6VXgivcVwbPnkeyDT4NqBweq19Q7zYo0z+5WvWWLk/8r/b7U4SEput5gg/dsP1eXRLlfzM/Ra7d5u3XBbyJQ+yD22Mj7mjIoGqBLYPupjETQVGUwwm0BGqi2IGqKEZSa7HxLPfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184733; c=relaxed/simple;
	bh=Gx/ZBLRyHxi/oAJGICkvIOrL3DfPBNr8PZ8qnHSfnJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNnRoY66rd4JHL1GBh7PzdxjDXsK782N20fks5wt7VBYV3qrsJ/mRNhc6U6A1D2K+9ofT7rqo4r55mFvSA4NRQ1MeVuU82Y/Ff088Umyd7XbZwMZaKnEYaOSueKz6lukHwGNtXGdnzKZ3d3PYM4fG4btLhmrc/fIHPTHqlsXEuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z/RujvIb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z/RujvIb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so763711f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184730; x=1739789530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t38FtLAfWg90q8K8cZGqF/lNiD/EaoI3sQrqeZGRCB0=;
        b=Z/RujvIbDFJ1PskZAr83IpNHwmet1cBQ/LePQl48cyJO8jrKSRMsv5YUxWsflwoPIQ
         WVa0j8IvfJrjEZCkursjtDBbs3FnuU2m0Ku4TzyNsNolh6TGJ7xL4ufKmza38YbqJ7QN
         4QXz7bnRG3+PfEF4YR9HVdoGfKU07AssoQUCTONd8k9M2DDPIPWQTM8pZLCn3u/iNa22
         pgrurZRm2RomTE6r6nv60tl0k5MLs562WqqOk8Z25TF5WeDUOFqzzmrFyz/8lS34m9Y9
         FCeLnEJHDN1rcjP5z3BJ3789XgP8R/B18qCLF6JHW/l29xgRBHq5ei7i5FXVnOWn39kC
         lfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184730; x=1739789530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t38FtLAfWg90q8K8cZGqF/lNiD/EaoI3sQrqeZGRCB0=;
        b=nMaMqQoESR3qp5d8qWWAJKFI8RRgBVclm71Agm77UVA1pMMht9L2lxKjFF4GChUF42
         W+YdF6CbCV171zin8uDrn5L2q38zDWu0/j5t2A+0svd1wIVCkw66WN3a/Fe+QdsgY0f/
         6/3vQ758e6knOa2vj3Nor1dKCZMukinlxjyYXM22S0wXkd/F36nrezdi8NFVpSoaDyZI
         uhQS98rDCtzK2Uj6ULTdksbFKQwcNYFxm3Q4y4qT3d8IF9AzHDjwIbXluMMABrkxQ0Sy
         XTXWeKVKxP3nkVq/F5AKNolP7uzQ/KaNgqcuG70YtF7K95rEqnhBgC5rOb8jB7QVIkaE
         XDHw==
X-Forwarded-Encrypted: i=1; AJvYcCXPMn1pvysSVrQjxh01fOLFjSmZuUNqiFC46DTyekdhxQ9PVzE/vyx095AR/cGPr7t6UOXJixI7c5OQF0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjyi+7INO1CaNINa+pHgzgw7UWBpEMHfUqJ+90AVIo2ujNPadi
	QNoRpKH/dxeNK8ZIHsTIH+j/RYoLXu/WOIVpY9f1EkHERQUPdXB42V1BOqQMOjj4Gzd4qb6cGed
	xnGc=
X-Gm-Gg: ASbGnct4tnr8bSrowGxEp2lcDrQeA8cQFeekpSSYhgFgTujvHIHELdrqfkD7EbcSlb1
	O2U21IKuom0ZSBO2INf50NmJAmJVRsBBriSYEffuGD5s69QKdyQ5ZkZq+cibdf4LqR5Qy4fT1Qp
	CHT1X791AfZhy9Upld6O5xfNVw9mjhJnDTDJeP7+PtrSrzsIoyJLIfU/I+wr+HnAwo/OWXin5d4
	EyWL+bo8uI4C3W7T2J8EF+WEuobnZSIygwhTGxRk9k6gZ39SKS4GXfCIwMsLOnWJHvrZ5yb+nEG
	0rwF5jZ5
X-Google-Smtp-Source: AGHT+IF41u1Rc0MGEu0xC4rMreQdWbirY1mfHhVjlzZ3Y6T+bbpkH6lVhcVk1GsNexhAZl9QPKcjmw==
X-Received: by 2002:a05:6000:402c:b0:385:d852:29ed with SMTP id ffacd0b85a97d-38dc9138a84mr8096702f8f.36.1739184729776;
        Mon, 10 Feb 2025 02:52:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:51:58 +0100
Subject: [PATCH 4/8] gpiolib: sanitize the return value of gpio_chip::get()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-4-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9oAnPodPjMQXAB4r9yjDBYdm9AiwJTye+nOcbjeQucw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpT8Lz34Hyog+MximLfUUtQo58kNHUFpAlFi
 cLetkdMhFWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 cgUUEADCbShVCj0j1jH40nTMWKvrHuWMRwYEHR6WZi3MS6Q2v3k0bUFWz5+mLd1BQGJkldVarlu
 DcWAwfRb/iPEqVbG77GtNpwP7h5KD+mWjJg72KbB3TDT1WCG4o0rnP714j8bhliH+iAfNGrrrJp
 HXh/7axNvTZf0jQaZOXG8wMH5hS4tlP7yN3jXYz0z+mvjMJ+BuE2AAN7TRgX+y7N3EI+x3heI5w
 8dSdvzTzD/KHqVyLcRH6Thrd6ozuLJ0kJCKQxNtauD+o99DXgmPvVSnfx4cMNejJu3n2Oiv06Wf
 GA9AZN2QO3g5LCzwXuYOEsgjfOGu/VFnMV7Xze90BaSnE9trpP2DcqrXQIzKn/Wn2Hf0/N2A+Mt
 H3XWCcH+PfeD3VG6LsE5KoluIp33RijuRp2OpLl65sXgj6MH6vCQopatps2ccugG218hgyGCV3Q
 ByPFFUjQYydPs3OBY+6Dqy/1t3j9ZGQbqD7NS1o/t8o75j6gK2P1MmHAUnf0Kb/BXoOziQhJhcM
 Y2C9EW3XRIq7CNRm/TsE4gMIIXX7TfczdJTeU+7UQF7MUv6zOhCI0vx+3bxP+jZIL4rQLletX6I
 d/djzKW9qhOTt1jhkEM1TXtE9l67kOhCNyYvF9IhkHA0bGg2Lc05F2DEoYDrwcyTRXStnmwOcvu
 J2GLd7vjEhj1olw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As per the API contract, the get() callback is only allowed to return 0,
1 or a negative error number. Add a wrapper around the callback calls
that filters out anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 95ea300da109..7bc316154fdc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3097,9 +3097,25 @@ void gpiod_toggle_active_low(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_toggle_active_low);
 
+static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
+{
+	int ret;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (!gc->get)
+		return -EIO;
+
+	ret = gc->get(gc, offset);
+	if (ret > 1)
+		ret = -EBADE;
+
+	return ret;
+}
+
 static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *desc)
 {
-	return gc->get ? gc->get(gc, gpio_chip_hwgpio(desc)) : -EIO;
+	return gpiochip_get(gc, gpio_chip_hwgpio(desc));
 }
 
 /* I/O calls are only valid after configuration completed; the relevant
@@ -3154,7 +3170,7 @@ static int gpio_chip_get_multiple(struct gpio_chip *gc,
 		int i, value;
 
 		for_each_set_bit(i, mask, gc->ngpio) {
-			value = gc->get(gc, i);
+			value = gpiochip_get(gc, i);
 			if (value < 0)
 				return value;
 			__assign_bit(i, bits, value);

-- 
2.45.2

