Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C823A58B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771906; cv=none; b=oeWSelNjgDmxOOh2GKAJleloxN1wahHj1engIgFZhzn0CcbsBozxDt0xLbVGOwCWYV6vvBxLFtp2OxPJ6PFmcB+78JqCGjngeOUfGUR4TAKsNa4MdJQBQZJjt5LAwHbccH0rV1QAsu4TYGLDPMjXaeZP0LPS4hruD9dJvjvltsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771906; c=relaxed/simple;
	bh=QCDACEFOUaF604iAGP/oQCm/CHH1pFCcbJT2P6T7eFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gl7VrakdxaOIL8Uz29dZ0LqV2JBwOSH+Q/VZ0zwLPJ4+ik2h8cMNH968ConbPlsFnBYepFeHtComHbvwfEUNj45VhuW496L2BILWT4DzKUitBpdV8KySpdexwyOuRoBP40OCW0fJ4RwDIAZToZjeOFhiDwN4golKZfBV6Fwvw9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BOJHigaw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BOJHigaw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a365a6804eso312346f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771903; x=1751376703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Du0WyQ1wf685TcUlV0nws22+DQO6O5SNDzfjdK144=;
        b=BOJHigawaP6pLWvchKx+LJY9Wc5rfKDO/3ViNqD+vxCd4BZmXdbLDNe8kEJEKSOdQi
         Wgp0g1bwzGPOm5SoediGAVLyd9srDSKdWyN4TS74b64n5Q4FZ4+OciLmHDD7hjMIIgL8
         64IubUb1w8NwmHRHg5lv0sJo42caTFY+kYTU3eQUIlWRWyFqFmVT3WqGG0YYL2F7SOn6
         i67udnuRqAwOE1goiSPhW45Kav5w6+B0w50P6aRonOYBsCnRozn0Mng+PdV0mhImT5D4
         +DgYuh7bneLU8YMQSdGuOP1FcatifPYFFJuGILW0s+nuA6fgXd2RVhpSfLA9KSiPJb8B
         0diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771903; x=1751376703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Du0WyQ1wf685TcUlV0nws22+DQO6O5SNDzfjdK144=;
        b=XtaZDh8AWYyTMg/kQ4a9+i4Y6Ays1z9pjI3Soj6VMSiYzttBVxRPfo8SxtBVgaJScE
         SG1RuUrd2Id0gQjZy1uPQ7YkNVfGoNayDxuwbXqkEL32m0QLvW3HZBZFcfhGQb3L7fLj
         OOO9BI/QH5IkE7KM/68OxczLK5dTmkIBHq3/SSvvLRd7lPPCMcXITYpkHEx4ZACssLDJ
         m6uVqD2blwfOgwWmiCp9HzbHkiiBOiSxu8gY9jSolzbeHT8WzzPm6LS4pJJP66toG2B3
         hhnwZ5cRija3xd2KTbDJQg+qlBMTSBFE4WIrEMkxtrIwHJCELN7kAhd3tfmb5EkuT3qQ
         gT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfc9+oV8yLqmF/nhfD5FbeuTBUXeLLTlFjXuoflloF+FzlU1Uo/vQ3WRB1UOBeefdCy7dQywWLzBHZSRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/bWHFnMIWZkPEiI6Gw3i8qiEmDtE+U3hQ0NEFfV8hDPy3+TS
	Xo7Tb9MyC+WHyoBnthlI+tDBRkL6iRkKEuiWp8rxLnlFq+tTu1EmKkxX+g6BR3HH4jk=
X-Gm-Gg: ASbGnctgeJ0psLY8sjHXB3uA6gR/SdbRKrCv/+EjPAhQYlImJFqi4pzr0akvbWxVs6x
	6rIq9M/Qx4wjdN7O0bRszCaMGGTszVxTebC6Yx5OsZtz9gscF5TMkCfGEXejvuAfhZVv2uZvlNo
	+WJv74DLFcRE7j8NiBFGW46gn4s1clOrbV8FIxPvBunxUHntwOga9GfWAw9ZjPtS01Obyl/s2C3
	31SC/5d23vZdXimOiq/7i/zEp/W+O4FZiRp+EVONQLFkfuFpg1HpRjK/VaRCYT607GyT8bBooqP
	Fdj+X0JL0E+YJ1EoA2y8sCm6mngBvWfFAxMdK9AmE7DP8ys2ETjtD/GT+YQ2yIX7N+g/gMS8Dw=
	=
X-Google-Smtp-Source: AGHT+IGAIE3Cb9saVkrbR0BA+3/0q3Lc+wPWBWW2QFFrws0xeoQg8CrHtwnyEaxIARx3hSsKbDBnIA==
X-Received: by 2002:a05:6000:4812:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3a6d12fb438mr13704051f8f.12.1750771902977;
        Tue, 24 Jun 2025 06:31:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm1921749f8f.44.2025.06.24.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:31:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ayush Singh <ayushdevel1325@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] greybus: gb-beagleplay: remove unneeded calls to devm_gpiod_put()
Date: Tue, 24 Jun 2025 15:31:40 +0200
Message-ID: <20250624133140.77980-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gb_fw_init() is only called in this driver's probe() and we abort the
probing if it fails. This means that calling devm_gpiod_put() in error
path is not required as devres will already manage the releasing of the
resources when the device is detached.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- add a comment to gb_fw_init() saying it must only be called from
  probe()

 drivers/greybus/gb-beagleplay.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index da31f1131afc..9610f878da1b 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -1039,9 +1039,12 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
 	.cleanup = cc1352_cleanup
 };
 
+/*
+ * Must only be called from probe() as the devres resources allocated here
+ * will only be released on driver detach.
+ */
 static int gb_fw_init(struct gb_beagleplay *bg)
 {
-	int ret;
 	struct fw_upload *fwl;
 	struct gpio_desc *desc;
 
@@ -1060,29 +1063,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
 	bg->bootloader_backdoor_gpio = desc;
 
 	desc = devm_gpiod_get(&bg->sd->dev, "reset", GPIOD_IN);
-	if (IS_ERR(desc)) {
-		ret = PTR_ERR(desc);
-		goto free_boot;
-	}
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 	bg->rst_gpio = desc;
 
 	fwl = firmware_upload_register(THIS_MODULE, &bg->sd->dev, "cc1352p7",
 				       &cc1352_bootloader_ops, bg);
-	if (IS_ERR(fwl)) {
-		ret = PTR_ERR(fwl);
-		goto free_reset;
-	}
+	if (IS_ERR(fwl))
+		return PTR_ERR(fwl);
 	bg->fwl = fwl;
 
 	return 0;
-
-free_reset:
-	devm_gpiod_put(&bg->sd->dev, bg->rst_gpio);
-	bg->rst_gpio = NULL;
-free_boot:
-	devm_gpiod_put(&bg->sd->dev, bg->bootloader_backdoor_gpio);
-	bg->bootloader_backdoor_gpio = NULL;
-	return ret;
 }
 
 static void gb_fw_deinit(struct gb_beagleplay *bg)
-- 
2.48.1

