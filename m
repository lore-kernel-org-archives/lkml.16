Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91F19F487
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566311; cv=none; b=nZsIy6wXHjY+4CbdCv3iR/rCJcg0Ez6o+9JZyHgIzZ2JXPn3qoHoMWhb8yREqrV8+PuSBmAIRG+vGiTTYP0L4y5Wdoi3GQcLxCuXrUlTbSqHZX+Wf1bukM+RjvbwF34788k5aiXGGl7qKDF92L31H5sAOkNWcyry9+O5rkQex8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566311; c=relaxed/simple;
	bh=K0a4sQIijNrwuXNNNxuWxoMUfCBVUYiHrw1VRd7Sx9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrpoIUN3AQm2sIqDnhdjYWn+4e3TB7MZYTpjTL6BQS2jDpa8tVxes85ez7qCvjt0Ons+wrL4vC175dSX8ieiY5M2ScnR6P6bphsPR97IZoe+fWKefVpePqp54PT0Et9Q7XhgsLCjXN+dzqxPFOW9ej8o2Z1K0XhuKnpjrjc/VLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2v2+jGi7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2v2+jGi7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso10501635e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566308; x=1750171108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npwAzi3ntbFCWvxDilBFPXXBoRhcu7pjhvuvWorGBsI=;
        b=2v2+jGi7jo+PCnSQxUI2yYW3khw+nPZ+FiH2jPvBxDLtdpmPGTf7mLsXKaehTZNDGd
         oyPAoiJ4IJb3tc/AjlRxPXpLNNWnyQQpV8vidSSBhOtCMTgxAhRocH+d1SQtWKbzip7q
         AXvl2YTFwFx+rGgBGE8p+CDHhyuQ5yqonSSh+rA+P9ACJSQ9jv3H91i4+UF9eub5tBHg
         uEBIzLoA25ZNzXdUnlqcwhxTgC9MLE7L4ILZf/51CqgGVN1DRkOt+5nw2axEcbEp7z4t
         1mQyJ05L206ZxDe1jaNIjzsipIIGRwx2DPCkmAzZLpJmF3j6//kRmrbi7yXX8wHz3gJ7
         gRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566308; x=1750171108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npwAzi3ntbFCWvxDilBFPXXBoRhcu7pjhvuvWorGBsI=;
        b=o8icr9piLibXDlSNfyHPrB4JaCDewPbuPrXLc8GKUAJgoWJy4rgJ8mhMfkw6Tve03L
         mV/Lyvkkr1NC1vNhE7CdFG/y79yfcIlNdEZqh+PqcdAMVtw84tuuwEwuvmPeguspFXtD
         GEDr/XGE/R/VM7VZ0zk5/GFHmw3PrUydDRGF4I0MQi1zG4irsQ+z8qaJXYIr121uKBW1
         4ytCaYajtN/2lkvfnefHmpwfNp6wT/zGb/hdbUWdnGdaaH9mYm4ytLxY1MzmjAJR3CoT
         iBJfas1JCp2Rxv5hO94YySnzgYQDcTiN9uwyo1yaGTx/o7uRqOlCSvBG7UVKmyOMbh/l
         eo5w==
X-Forwarded-Encrypted: i=1; AJvYcCVqP32YAAarm0tnxZBUSXdQb8kKHMUIFB3Jf8Tf/4kItROlUtXxJwgv837Z0XgqA34ale0zTZYlCRy3/v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmE0p19wW3iI6g9200wRs9M20n5jpsU7+lnyYfoaMokS5iqW1s
	i0AHrASP7Ww6AeOqPRaUMBsqjl8w5+UV9WxcC1y/YKOpu57/tL/rhVZ5qCrQl/Kem+c=
X-Gm-Gg: ASbGncvjMxmvz7wGLHcnFhp6/mxM8DcT6QjBNaSz9Psd1buWCNmS768x6teWYQbv/Uw
	teUaODsfMKdpb+U6kn9+BBJYFx6+kIbRkpXjIcQArLMAJQEpMkxj2Ggw3c39wo/KamONXoHW7+N
	b9nQyrAVt5pUYCuK5HgzIbByesxDD/EXgOEexVxkv8zuK1PzG+R+7oojvtDCP7DMKy5gKggoKqq
	HqWiF/vTLrlK8o5G/eyBH/RRH1Jswz36gtCF6GhQ4FGa9vxk6i/FdYfaAXhGQiGRRiyr+QNNIBS
	EN0WDpZSHjVLYVK6z1X1+XYRrJoXefWTfd62VRIWKQLHaT+SGng/
X-Google-Smtp-Source: AGHT+IHADwDUiowP1VqDn6bHTYazy1fJaU3+WvOB375z0PSS7WCTUy/V3eQbQBUDjfOKEmlrRO24Mw==
X-Received: by 2002:a05:600c:46ca:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-45201426873mr133231485e9.32.1749566308472;
        Tue, 10 Jun 2025 07:38:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:16 +0200
Subject: [PATCH RFC/RFT 01/15] Documentation: gpio: undocument removed
 behavior
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-1-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=THG/Fz9qHVr/JyTG5u6I/vfSnnEbM8AweVBXQl5IyE8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENfkjw1VZTrSh4NbqOsxZmL9+q/ZIF6oWn4O
 g43+cfrquOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDXwAKCRARpy6gFHHX
 ctNYEACf6nlZ8E6yIMGUwH4HSRiL+mQ6qLM4ech26E65ZPzzO6TcQSFgPesQjtKX80XnB/ZPaq8
 VC7BrxymFJQaf8XjCx5UNDuM+m/KWJaoHleNY7ZlgrIgAkxRT8UVFXv6gBgyp0BK+7rVAowS92X
 L39gKBaeZQOVA5vLzsITNEYwEFLIigzjayfyIEec3FcNRTlW/1TkNHdt94P0cU2rT9tREhUSwNu
 z49YUYQr8LYrp2C+zlhARIMfDtE9yzcL5Ty9HpacAguopewUkc5pE31QlpMAE90x7kTJJrUExib
 4DTiUZk49ymupXD/9dcf5BefJNgLckOJlD7HUh7V13xbhbJVuuQNbqfh5HVaMz+XhmHM1TBsy3l
 rJ2Tsb/8+DjHitGqKtCkG2uZLgY/A4kltzcdp5bBAqfTJ/f8u8Ub9alnnsgj+U6ibdENWGyRaG1
 3qLg9WrXSy1Z/kdc/+QQqcsMJl5paszD+bEkH7IeggotB7iyI41s48JZyNvn4SfaQ9891JPOzqQ
 frF2ElHMomPSVIHFx7CkxgcdcKiA6eiDfBijisVXzXy42+AAGSL0iB7Azd8Gpxj62z83oHLM5Um
 qUFxBb4zEPACFKgnVx6atHw+zI4EePC5lKdx6KO6VjRI1nd8cIuwtcXtm9Xm4HMXfcwoZ+dxrKb
 nWUmrEVoy6yjbZQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Since commit 700cdf7ed00f ("gpio: sysfs: make the sysfs export behavior
consistent"), named GPIO lines are no longer exported in sysfs as links
named after the them. Drop the misleading bit from the ABI docs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/ABI/obsolete/sysfs-gpio | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-gpio b/Documentation/ABI/obsolete/sysfs-gpio
index da1345d854b4ad40ddd99af090597574fbc07565..8203bc2128db7eb9ea6724884e680ed4b669853c 100644
--- a/Documentation/ABI/obsolete/sysfs-gpio
+++ b/Documentation/ABI/obsolete/sysfs-gpio
@@ -19,7 +19,6 @@ Description:
 	/export ... asks the kernel to export a GPIO to userspace
 	/unexport ... to return a GPIO to the kernel
 	/gpioN ... for each exported GPIO #N OR
-	/<LINE-NAME> ... for a properly named GPIO line
 	    /value ... always readable, writes fail for input GPIOs
 	    /direction ... r/w as: in, out (default low); write: high, low
 	    /edge ... r/w as: none, falling, rising, both

-- 
2.48.1

