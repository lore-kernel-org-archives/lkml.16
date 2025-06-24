Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC2291C37
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775552; cv=none; b=tNGJ0oa1oE5tfKTMY/TlNbUJUlTr0QyqEgsJgdR+/CdDWVPCoOVL+F1Fd7+bQvDZBBDjb2SPRMcYDmtKAmaCl32jWPTW5WeP7fk17hH1OH+P+3fiemsO377T1Ke0M8AA4F4Tw0IwHlHawP0+ALp+wtreoc8c+peLDo+FOms1Grw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775552; c=relaxed/simple;
	bh=ETdCBVd9dlKlAmlrVMybF4vKOHUekbdvIvNdfOPZpVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqJbWkxHsxe8GTGIF8FyzNbRK4Oa8a6YuDdSL2PCE5OzfMNQW0Kv15mg7ybekMzgTX8jVppFCGmMEzZ2qIWZK4qNPQWJU3gJbBpY2/4Iuox06nX6FnCvzBAvDsUFMSGzac2U9nfzfhwuHXUaHOPrUcX3TmqXO0Ejq1f6pW4QXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LMMPD4nf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LMMPD4nf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453608ed113so48017735e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775549; x=1751380349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFxv+CSVT1JduUoBwXVfn9STkVHcaXwFmqXMPaWFmWg=;
        b=LMMPD4nfWmfdt3oxavht3kP9icuM4VZ/jIaW4KZA6XWc1bvgtK1b2P07rsc+zoF7ld
         pwc3Mph3yYPdAEVlzDzaWA6U+Jre07n2zfPdLlPrav9nJQwSd/VvCpzGwo7dnjAlK5VZ
         QdUHO5lZdnEi6gU6evxcrZET7MEpwCjE05BHwCOrObyf7wp8Fmdy/F1fKFUVyQa1TIt0
         H8vp756+bFX5/fkLz7RsR7YTBBgtxHMDBwDjLnq083xyukgD0GUE6ob2ntRCrgWJZHS/
         bTMaKmbF5IuOuaty+HzI155cUX6KP4iJXuyuYk/JhAC9xb2janfZv18LKuC8HiHrKExj
         Ts4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775549; x=1751380349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFxv+CSVT1JduUoBwXVfn9STkVHcaXwFmqXMPaWFmWg=;
        b=t+4G8i7rz09HSF2IUuMjIjFaRdiHYnidAEBU73mNHt21toNbzhdBpYo7AyaY0JyUtl
         vF229CLZrty8pgs3+Hw7yx0SdsRWwZJTn0Hb64sJlibY1jdIa1Xw+8Zu6gN+mIfAApzt
         ccezKDBDZ/x5RxBFld34kDl63IK3/WIMdxzsdIPD1STiKPFwmDSHPAed04JjjVOA4oy3
         2xWWTIfU+t0EzZyQ+5R1CYfILR9qfNFR//VQjyo6S0ujLAFXUH9SepCB7UrlQMIFR7Ih
         jap9QZPUGi76Pa5qFrsryEnjzkm/O2Q5q9q4Z8c2sOI7HuPm0LA5KumyXT9PJrokQQZ/
         vsHA==
X-Forwarded-Encrypted: i=1; AJvYcCX2SK0OzdNb29gcubOY+dDax61M1BeU5ryOPb24i8jEV4exJxRkW8B/yG6JIh4WPZKox9WVNatu8xCro3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2xYDf3h3aYK/ji7RT6pMCItZTZll7R85/Rbv6gYj7t1WwBRD
	6uuH9DiP3oifRf4z9GxKwoNEOO9baXAdsgtw6F+IBRVFtETwu/n0Q4996gtDL+d/nDE=
X-Gm-Gg: ASbGnctab1IKmFEvxJ/UuXHsIqpQmAqBFXVoWWKy0Nn73XEu5pn9b+bmGHz43UW7iL/
	hqJTTolb9Wqrifz7Ahpz0XbKWNH/Zh6EnnvCKhyEqSZYXBEVcInjAdp4U9pY8BBoRHQv6Itynr0
	PMBs70DX0blMOeg0762kLWyw6FbvdVYXNkuDebFR9J6UNUvSOvL0G6gTnLWAa2k8Z1LsMyQRz+V
	m7NVClULLqDz1iSlJYQU0Tl1v9CI8gH/zXGnv+hWjiM6G3/7fKJuUwB3FhyLPhjfsKxmxUay16/
	0dVrdZ9F6ZAvhPQZcCbMKucI9EKbXNdDuEL63a7L7eqq7BSnlUQpTKk+
X-Google-Smtp-Source: AGHT+IHD4d2ak9CVpp5Gb3Vl//bTvUG78qxypokPSA3JfLjuNCjdx/+p/2yyT5p37+Ky+IXsejzn0Q==
X-Received: by 2002:a05:600c:3489:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4537dfbbd31mr26524705e9.13.1750775548638;
        Tue, 24 Jun 2025 07:32:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:18 +0200
Subject: [PATCH 1/5] pwrseq: thead-gpu: add missing header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250624-pwrseq-match-defines-v1-1-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kuQ4uO8LOxmEAAqs0l/C6pNUD/i2/y1K+eYCkH9r2oE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb5hTVaHLse7YY4Z8fJIQZKJ3AQgAUmHNQv0
 VwZwM91+1SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cujsEADPF8KCWrxiSt3p+cb4oVKfu3+XmlPa8P9/B3GoYcQRJeLWaTiMykmZYCWqLqquF996s5Z
 wmdFKfXPHda6dYr0UrL6AjoMDT3E2vi7vhx8XCENm0S3SU2IPnmUC6ZoSrRxq4j+pVYbchBLpi6
 usUAgi/RwAJ+oG36mYWYewQdGX7+2dpMjje5y1awCGwzcscsyg6IxSJDp0puslMfIYTfsh/cfRA
 fBJIzMW/dlVZW0QZVjXoZHWG6dlQbkAmUEiVURqPeKnia6SAvivPg8D+vyYv4etq5Clv18wCJRI
 lonF0OYTo0XxK3SAtUTgyuyYbiZr2uUAJDyOvzVgTjaJ+kbz2q7s+ykgusXxpBrhfsx0hxTOsh+
 Gznzh9pKDozRA9R8QOBdLmHbzqoVvWojoURYiul1T/q/06+CbC7rXfj8z6rH8kaRSBzPE37AIf6
 V8CKI/Uqz0B7JZCC1rtmFnWW7fFIkZGLD5DPG+rxIJ7y9IZnAtj3sk1vCRM1rHgnX4+1KajRx0H
 OXe6HlBsNJCmMzP446DYdvuj+DWhCghrCxIRQLl2EQm5vjiYzGhM27jt2ofnYPFw2G+hob+VbSa
 LmG1m17inHqLh1uVc/ypB5241VTSoK05UHHf8YR9GurlLl5qGyloHhTHqZdiO9zDc/llKFs77po
 z9GnVX4voR6m3Jw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When using kcalloc(), kfree() etc., we need to include linux/slab.h.
While on some architectures it may work fine because the header is
pulled in implicitly, on others it triggers the following errors:

drivers/power/sequencing/pwrseq-thead-gpu.c: In function ‘pwrseq_thead_gpu_match’:
drivers/power/sequencing/pwrseq-thead-gpu.c:147:21: error: implicit declaration of function ‘kcalloc’ [-Wimplicit-function-declaration]
  147 |         ctx->clks = kcalloc(ctx->num_clks, sizeof(*ctx->clks), GFP_KERNEL);

Fixes: d4c2d9b5b7ce ("power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/pwrseq-thead-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/sequencing/pwrseq-thead-gpu.c b/drivers/power/sequencing/pwrseq-thead-gpu.c
index 3dd27c32020a6d3b551eeaff2859456fed679814..855c6cc4f3b5bd1aa6e93305af0417d5791b092d 100644
--- a/drivers/power/sequencing/pwrseq-thead-gpu.c
+++ b/drivers/power/sequencing/pwrseq-thead-gpu.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/pwrseq/provider.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/power/thead,th1520-power.h>
 

-- 
2.48.1

