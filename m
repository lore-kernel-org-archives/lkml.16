Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5418A1AB530
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452916; cv=none; b=Jh2mFK9wWoYSpEvcMvl4468BqLSiRDjW13OX1jKvL2yHuk12XsSFJHBjxtGOM9G4bwFS/cQUjvQsOV2Y7saTcGNq/VoN6zSncnTxQWT460UjeC2LeB5YQjprvZAVg7OuA4MIiKlGGoJBJD71AQ3tP4JdZr3iTOgCGVXKgqXbKqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452916; c=relaxed/simple;
	bh=nBOw1K56zx+FMK3TMKr5Btqqg5rXK/cv3N2NaH/vMdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtY2k3GfmR82+CRgd22y3dMFoGhnoGhcJ7cntlOyb1Rdum4CMJmCcZtNjTzKhSS9S8QmHaIv9S8dH3gWPkjKwzYpCd52aZY+eHPVClQ6RK/6OE3sxSFKrtY4KF4HIgi5FHU10tW7d20M6FEsbLKxEzW7Xodww3uIMlLyYJDdPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xBYzzEhz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xBYzzEhz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a823036so28248935e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744452912; x=1745057712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GJrIXgOBYoDItQRMyP/MgpEpQGYcUrfGmxOpH/blcs=;
        b=xBYzzEhzHFXcpcBzJmq0B9IAYznTalMzCksRN5T1D+7wOGD8Yk7zpc0JAAS6vxeEou
         XIzfSJBTuvxft7dI7QcfDjQB8OEXKjDIPhhBr25VXWUygk2/sMGnDKDlCpzX7U7i0kiD
         M2AeV6F/QkGytkaed0SAap/Qhi7cGxw8MJCstBUqzDiZ6nefxYt2UVd49VL/xhaasWFv
         UqO2IlJyU6s81bEe7x/35Yvp+SfmGpaluhM1UeLZ0idF3l4XECqglH+YgchNQ4+QlHqc
         6JheP36meuxqvx4X9NJ0fS8mahHr9UaakLVtPFVHEj8IC/n4qq9yfPlXtE2dIj1HTYnq
         erag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744452912; x=1745057712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GJrIXgOBYoDItQRMyP/MgpEpQGYcUrfGmxOpH/blcs=;
        b=aF7V3700ZH/grBvfUPSXXUUfyB7jepqmNDPbe+9czQ/31IuKJF3YDOyANVm1iGt5JK
         VlviFVysQbR5EDdv2bPNWQ1x2k6wHOQmelTaXzN9roIeNkJ0rxJVbVQWoe1KoOGs6l4N
         p+GnDm6aSMvpsKL1/wYnWNqH4kDZEIXkrozCSJuBmsuDRl8VG4xj5a1gdQX3iMeRQE8M
         YdSq9lidq8WqlxluXNN0bekIBAr7sIzwzML9Y6whiwrmCrbsXQcL7d+GRexmYkegVLvc
         VaHnhX/0CYaReixZkBmhaUWiD6liCxSr3VFBF/kG2szKuiqm/DLplqsApeD6YZvk4xsR
         n/lg==
X-Forwarded-Encrypted: i=1; AJvYcCWQWu2MJMqpdHNIs18LzmzJlBJDxGl9gNPzngY5PnYIGS3SWvJh7RQgPkmp6TH7+mACYynFnUvjkGWeF8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxESSM8Q3rchD+ql/i+QfqAWKmECDaw5Dy+TVghZyQNtwHEEiDL
	j5vUY3u95D40j6hbntvT3jYPiSnCL7glY2XqwpNLI97MZGuQ+LR9SZ38V95G6ls=
X-Gm-Gg: ASbGncu04EHQTG1dbr2gp4/ztt0KCQMh6kUrSCR6vq6yPyVrzbV+ttOfvesTOlQXtXy
	fKg0VI0S97PQEFOexFw18/SdISAaXIYfXAh2jWXDAYeQCVbVng+QTMDaJ3AL4/ollPLXxU4ofjY
	9bEDRuCN/mJWNnF6I3OyUCuD7f2UX5Rtozh+xanBzWojpRAMo+y3RBQaP1Tbu1935kIDMP7Rmgt
	3lkrJfZ4o1Vav4XMDETpin4vdN21pd/eWkMGVV+K9etgTkseQ9Dgl4skFnpmpja5SIGUi4NsshI
	fFM3nQpNUrYPy2r6Didvj+nqQkV2Q0TwabNniT0N7jfXkubFN8FrJG4S
X-Google-Smtp-Source: AGHT+IHJXNcS7Hluji03dQdPRwTs64eZnH+yKoBp7cnqjsxtXtXhSJ0iQiymmtzYr1P8d4dUS+aHoQ==
X-Received: by 2002:a05:600c:1d83:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43f3a9aed73mr63941575e9.31.1744452912570;
        Sat, 12 Apr 2025 03:15:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f235a5b08sm114474575e9.33.2025.04.12.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 03:15:12 -0700 (PDT)
Date: Sat, 12 Apr 2025 13:15:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Koichiro Den <koichiro.den@canonical.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] gpio: aggregator: Fix gpio_aggregator_line_alloc()
 checking
Message-ID: <cc71d8cf6e9bb4bb8cd9ae5050100081891d9345.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>

The gpio_aggregator_line_alloc() function returns error pointers, but
the callers check for NULL.  Update the error checking in the callers.

Fixes: 83c8e3df642f ("gpio: aggregator: expose aggregator created via legacy sysfs to configfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index b4c9e373a6ec..e1b2efc0df99 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -984,8 +984,8 @@ gpio_aggregator_device_make_group(struct config_group *group, const char *name)
 			return ERR_PTR(-EINVAL);
 
 	line = gpio_aggregator_line_alloc(aggr, idx, NULL, -1);
-	if (!line)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(line))
+		return ERR_CAST(line);
 
 	config_group_init_type_name(&line->group, name, &gpio_aggregator_line_type);
 
@@ -1074,8 +1074,8 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 			/* Named GPIO line */
 			scnprintf(name, sizeof(name), "line%u", n);
 			line = gpio_aggregator_line_alloc(aggr, n, key, -1);
-			if (!line) {
-				error = -ENOMEM;
+			if (IS_ERR(line)) {
+				error = PTR_ERR(line);
 				goto err;
 			}
 			config_group_init_type_name(&line->group, name,
@@ -1105,8 +1105,8 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
 			scnprintf(name, sizeof(name), "line%u", n);
 			line = gpio_aggregator_line_alloc(aggr, n, key, i);
-			if (!line) {
-				error = -ENOMEM;
+			if (IS_ERR(line)) {
+				error = PTR_ERR(line);
 				goto err;
 			}
 			config_group_init_type_name(&line->group, name,
-- 
2.47.2

