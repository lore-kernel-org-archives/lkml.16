Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27981DE8B9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849981; cv=none; b=pSDrZC3elpQ4nIxpM75pgW0eek5NiQJz9f5UxYl+e/M6V/bXExSLy1nb1t1cyVpl22ZbLiByzyanD4kwWWrmNeFb6Rjc+I0vu1k1ZUpjEDRtBgEBG8I8LplGYijgriBxkAdFF+54fMPAGBIIpK+w1/+KPzdL8V4MFnPHeGvGfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849981; c=relaxed/simple;
	bh=oZv9J6EAs+La9Yoz4jWDKoBjoVKNXoiy6YS2fSQlpKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFVPT4OdwDpX0j2dO8IfyEM8/xuauq3cfBYYRf1Q95sFG8EGs6yHoWMBBPVyREsJ6EMKqx9EI1p8rhzaIiO5Mn93T9R/u9ciBF6lkKFck584KU8kW8hHllqAZpyAtSPdaSpVx5HV4pHcgZXoJdhGisovKDmm1CflUX9Lcy7MQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Bh0OLOvS; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Bh0OLOvS"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73712952e1cso139278b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849979; x=1745454779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=Bh0OLOvSEe+swoqYIA5sAa18d8j4LBRbM9fvl6WSn+Bdf4EAKHsx+5UOBLpNnOjyoI
         HoMfpnyvv/41DuN0MKvKlC6JiLREkpFXJf5ZVdFkY+XC45F1b21FJ3hzFWpXwt3MTRul
         I52qaI6kvQ16TGH4rOcSODEAn7i+yd9P5Imc/gwylZosE488LIPhdulncuLdVXMKQE9S
         w6dmVC5fqkAjAYBcDoZIAqbWeDx7FYnvM5mvAYa+gT7cCy/ydmbzCi9YfF6V+LhyiHef
         3UXa5y+WAHUOyPHMqNPU8CrsqRIh9uTen+Bxws2UBPUXEqKym73kK55JrYaSFN4tN+qZ
         LpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849979; x=1745454779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OaGk/ulT5DmrCZA9B/47jOByqfYQN8rvXLp/mrP0bU0=;
        b=cNldRPfVuYqqosueqOtxarhphgGX5wvVbovhF4Vn/LF6tVgnIrpOxRXuBqPIssDK1w
         e0NLw0j5CZmipOZp0lC21crT3FsqV2PGf0eqkcpQBNfD98hWYo/aygkvO/g2B9laE5S3
         Ye48oZVNZtGpn0tQGYHDmFckNUD/SRavtA7RxGVPdUP1MTa4UPufqh/0XmrHr5/FiNHH
         fXTl3C74re0gQ+tFsarLebovpHvl432X22jDejFWEgykqEohxB/HPSkPa6KGCXMu+rn+
         fuQU78J6jFct9q4yIzaE8gTZu/69IJoAqv+7FKXDrtgtqbHMCgzycZ0mpppe7grjmfy+
         wGTg==
X-Forwarded-Encrypted: i=1; AJvYcCXmCA54pKy9v5+jaTal4bQBbmOuBhgAjkgKywL78ekxagy38Q3sKUK4fw7hvcf7VZAwGelwFqOjRfRMpns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6b/50ub2OSeygY1bX8FAA6cPuq1ix7OqbLCqPJG8d6vG1QZ1I
	1FfQKHVxL82fcoMiwS96ry8nmWFgvJzRnr9GIP59Ebw4GhT+K/kNU7w6FrZi/w==
X-Gm-Gg: ASbGncvGV9Y3hh9O40zRdX9KUrDjUKAw+b+R4V3sZNj/DzFsOB80c5SngP9U33HHNvk
	WcU9P14K5wMYvYM9+Qsr9ZdPTIat9+ys4coc8VBVwqgP09T69GYWqhRzgg45eua/ta8XEAFbIJM
	7LlqFu/5oYUoagk397zoEZkVBBSds6eeWRv+/kpRV9RZ2auI9qT10ZW4u0FeCbksWwg7giQr0gP
	JKlTMXibxvLTC7i7NRdjt2opVh7lgoc2iD13aJ5P6ksImvjIW0+NKJNvhnlulg8xKypWXa5Yx12
	MaTj6EyIoP9YsttAdSYHEOW0yQrGA+XVHH26yfZVVzgS3jse5AMo5yo7Mpcg0nfaC9te//iYYnk
	cG7SAJQ==
X-Google-Smtp-Source: AGHT+IHZ74Gy3mFf0si5N56++CDIea8yCXo2gljGHNPnJQwNQOT0xFDB9iIxO3BakfxEu0PW/JmimA==
X-Received: by 2002:aa7:9301:0:b0:736:6ac4:d204 with SMTP id d2e1a72fcca58-73c26722b44mr5134846b3a.11.1744849979201;
        Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220fc3b3sm1580948a12.43.2025.04.16.17.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:59 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 09/18] staging: gpib: gpio: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:37 +0000
Message-ID: <20250417003246.84445-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 87622ee841c7..443d739c7edf 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1308,7 +1308,7 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0

