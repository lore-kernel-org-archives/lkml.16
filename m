Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475F221F1A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010000; cv=none; b=KVNiAyUmcmys9yQjpqhwVPCjZi5k9P0/fcfCF8L3O53QSypPXr6TmkUHG8FN956AXeoHpOsIBGHGRamGCHbCAOoPQ2Psq/jfTCAJiuSjuafb4ssM3KFPL7z3ZexRbCjJBLrU3Q0xuCjBaNkxOIK4T0AfjrI9mHoEIouHXws0xB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010000; c=relaxed/simple;
	bh=v+UnjFHMxAqwy94M3qJUXymRSNqizlBnKqSV3yUkTwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImJuPqTCFkO7E3wC5Q5Y7NVSaNQB8F7InVj6Y3ipVV+2YktXnqFmUFrjUHBM6xpGgFBN6tk3X8dKQ5ImjQXW21wpu8ON6Eb96MtMtaiR3+nZwmFaMzKwAzZ6SUiGYr4LZE/3TrMLjTWm8d//6Oa2yahBtkiZSy3jbROM+OvU9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JOCJVjk2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JOCJVjk2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so26659995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009997; x=1744614797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zQjLtm40iNq8UW8XbxtAHLJFCmbbdZctSQ9irwpSVM=;
        b=JOCJVjk2s3bpMHY/J3TvNY8lBqVbFDDvtxoKs8TEsGQLup924DDGkcnv9YAdUwGSOy
         zfT/y3vFuTozqYlfCG0sEcSpUXFt9QghRsLqUPEHr9m1kIclXpARuvLruSE8V/7H93tH
         LrhKBjDBWuvFMwzKPh4nshJP/3+z0Lv+1cBMHDymWmU2QWd1d27YC7ZeXeGFRMjG0X67
         hacjxhZ36Kd29ns41Otvxdnt7mB1LHdRG2rWa9ekDv7PnorJ/NZsQKn7Ds9PNVRoqLI5
         iq4W0V9diMvsTyK6LOTIRsUbz6f3A6SQhQcL3DzxT4e2pgLdgtzzLN89knlX/iEWK2JX
         M3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009997; x=1744614797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zQjLtm40iNq8UW8XbxtAHLJFCmbbdZctSQ9irwpSVM=;
        b=KGDXhRgBMH+YUwc37NmEQxkUKNaCfiqveDPiqUXppKaarGDeiiN3KjHfkkhowp6NeW
         s08SzOy4UtSnMLlpYLZH3acY0fSzNgJZX340cFU4jaPHdLwDud4vAJx2OulWdIELPNJA
         zU+1II+KPjP1lEKUcGgt5UKrtk9THBR7IKp9SPNyX2nmClSJ7okyuVjgzHRH9+IodgK5
         f58WQINuY80CjcgFO7UfltKfhPKn3k+N+ZD0dEizfWA/o63XTmv/JVYzjCic0xD2XL/n
         0BMXPMr2Z+cv1XH4zFUSFFMgRD8HtCmU361L2680Fme81ZcXGYCjJIf0/tHS4cqCkVK7
         bRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR+oCZheB3galpej8SU2jTad2rpe4h7sCE/A0qZ+i/b4dOgfAgq/ceCqJePKTjbN1dSqcttKSdiHCRMy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOxZPKqydFcQZJ6qeFhrWkgVZiaUUW0zWZmtcDmB+Uk3Zpc88
	ggoFcshOcSv/gcnmsioqUjfxzg9Na8App+m+KVsQ40HqFRaWj8iRuW+OaQRoH20=
X-Gm-Gg: ASbGncuxxu9XN+jkeh5trwRS9DJkQDUDU50XbJhZJV2fGjtyORMXwSDLq/OUqWq+GxK
	0/rM0s3mFHIpn7MQPlRpO/tKiqU6eqsJEfXmsdtXUF3psTdRMqSzgUfzFtITR44C+r1EmSNt6cY
	EpLu+7BrNtCDJ2F8hfQSjvMdQc7jJtmqkUcqnUg5L9mmrd7JKsiJCgBEhGrugyo8TmkKHrLcQBE
	UDJhKsYlyQAl2HgXlaobwMHyJrc0pi67+zBKe5AAvMtcqcLAdsymMstVEyZExyorkCZMOsEV5Mp
	NVRYOeVbFRTpuCkVbvon9pFNBy7FY6uodwMh7Q==
X-Google-Smtp-Source: AGHT+IEW7+lJhkewxGW5VJOMPuyU/iBjF8bH7O39UlC3ofjb4Ms5uuG30X+9kSf0GSUz28JKAf67NQ==
X-Received: by 2002:a05:600c:a013:b0:43c:f8fc:f686 with SMTP id 5b1f17b1804b1-43ee0616fedmr85967385e9.3.1744009997193;
        Mon, 07 Apr 2025 00:13:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:11 +0200
Subject: [PATCH 02/12] gpio: eic-sprd: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-2-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5A6zzhsqbuFQhR5Hofol1LNkPbnT0JcOJ+YNZXE98OE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sI2V8zg5FJxMUMaRkfC07sJYiSRsypxrJAp
 fMycLk+/4CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 ctb2EACByYklX5SCC5JSBbz7+I0EJoIpsFeBpLsSw9cMfwVJR6/NjsCfNRLBlVKR2r0zQk8BeaV
 aJzHRRiU/+YR9Ll5nnZ8EzUY61sez3gq4+gS0pmbWUgD5WTXG0iPIji4hc2Zig1ykKotvAPmiOb
 dLfBqcCq4lKcaJnD4/c9VMa8Xr/JdoQJH13Fj9D8cNFEfVSwkAOEk3E7FOkpKfkm1aPiC+GflqP
 aZVFO27Rr+HVoZGz5FaWR0is9cEl+bVpfwcMygi+LgBSZTSw/hMj2jFOsRDGePVWZQTbfgTJpIG
 KpEk3X+2vJXV6BGiL7qlMCdcy5b/yT+zNVUar41GWAYN/XztovlRC0uW0cSF7gc77lY0YxdEYJ9
 fUZ4pewLtTQ2lvZYxj0vW+8JePeC8d0te7Yc0GM/Y3try6KhZ/6juUrfIqPzvjLoMHASSJjvzzB
 DnpUPDEJ5MqMjf2rPZGrombA7n5maN5iGxAelCl4cgJBhjI10bnmUYEY5zTUx+4Xvy45I+Eyly1
 d4aEigjzYbpRNlbQ2UxzgqEL7COF/b1BO0h8Gomvvjng2IcPtiomsOOd7dEuwousy/8a5pX/K4y
 5Y3Dpb2LRc7TPRSWGnP1ngergD005KqkQdLYkY99nYhVuc/D1crz7tcN/XbcJ/IzFK4APqtbZIs
 zPRljQkkWVYv2zA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index d4bf8d187e16..f2973d0b7138 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -203,9 +203,10 @@ static int sprd_eic_direction_input(struct gpio_chip *chip, unsigned int offset)
 	return 0;
 }
 
-static void sprd_eic_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int sprd_eic_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	/* EICs are always input, nothing need to do here. */
+	return 0;
 }
 
 static int sprd_eic_set_debounce(struct gpio_chip *chip, unsigned int offset,
@@ -662,7 +663,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		sprd_eic->chip.request = sprd_eic_request;
 		sprd_eic->chip.free = sprd_eic_free;
 		sprd_eic->chip.set_config = sprd_eic_set_config;
-		sprd_eic->chip.set = sprd_eic_set;
+		sprd_eic->chip.set_rv = sprd_eic_set;
 		fallthrough;
 	case SPRD_EIC_ASYNC:
 	case SPRD_EIC_SYNC:

-- 
2.45.2

