Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCF220F45
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463752; cv=none; b=DCjB1x8EV0yeW3MT87LqkjMP+/FIGpRCHwAIdVILiXaYJFT4lhIA9JmW6AIlFTO9W/XKAKEhB4QVA/9hVphofMS21dTT/PfYuCZuB3YGnzhDg/JQPofv5vOj2KltxpPmK63DtqT5w1R2ieRCSJ/mGSngPjR3MHiN4QAsuhdGwU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463752; c=relaxed/simple;
	bh=yjstY6rXEpYFD0+RmP7Mw5VcbzLqQWKymqkM+58/TWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFMh0NVhOcOmiHcBQYSjfRbt9Aqv4Pew6haop6QikNS4emNJMNHW75hWf76Kl53r7YpDU8AkLQPJIMPu2RS19/ENFvnNN4t2Vt1Qw3FP9yXMkbHyGRcnM1Bk1kL6B/+/xXlf2TYs7lZvBFYWAjfRGhLgSHkoAjCYN9oLROCz7XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wu70i/MV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wu70i/MV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so2747345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463749; x=1749068549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N+GSbJtN0YTSTL+bpD4kJB+1zO1bOLCqaQRg1wG/P7Q=;
        b=wu70i/MVMRvUlp1kAQV4dB16ZynTNbiqaKs+SrB4FIJsyX9gr0+8RgxGvWRnK5tX4R
         K3SWFLFvDZ1T/PDHXN6AIK5wJOIzZ0/yEyqgqjUWmoQkljVEfT9kL4xtfyo+4oW3Bnpy
         ysxUnC4U/ubHqdChoOLKteUKz13I6dwXKgthtrlTB7G1jpOxw59e1AEAOTQOaSTusBkl
         TcAVfz349mcTjgam82+zlGOjWAAdBu3JeX7ojjCrbwVCrRgNqOjrYPVCO8K/hm2QwbuG
         rlXMwwOzk7eb9MI+hVYftsGz9tCGofbWnigJZ/fUdXnyvXoaPLunGDV/m2V7tUfbtk0y
         6d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463749; x=1749068549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+GSbJtN0YTSTL+bpD4kJB+1zO1bOLCqaQRg1wG/P7Q=;
        b=uvr3/Jx0BxmC9jZ+suVKqiJr1PQVgD8NWlOMOr8Vct6D3Zqmrm8Uj6R/nIR4Et9lWq
         8HRWvcTR7aT7KTZ5ydnNasFQkQ2Plp4elDkXLCJeOe0t69DhNZ10dZhxefH7zpZ+pa97
         PUrrLguSzy3MXqpMVqCdpGy0fLRoPQzlKZyUzzAXSSwWeTPsTw4TJn6gjpkVW3sqENYo
         F2dr7GSzr5J6FvoFxaHwjFl5ZqjIxeJrDhF/BDQyeKGZUS2gRIQiAa7+gR0Z9hjhtLOs
         qqJXrSBPUEv+O1T9OQV2+9vqzrBYMjzxigyo1AjtuYXb6nXrTnP72wr0yjIA9Vi7bzUB
         iP+w==
X-Forwarded-Encrypted: i=1; AJvYcCUkbPax8dcF/bFj1mxADYv4GOg8b/hoeHGGrk0AFOKTm2BzHlcJX7wDbhnaG09vCbXWqNrdZUc1WxQIhuw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1oMDG+dscOkxq73Ths+nOzxpmqvqj3aioAo6+Gtx0PJUJhKwn
	AmZaNhy7N4RSDqie+p1V+a5GAfBFXvKj4gqMrjCGeV/qj2s5aKRqMQaiKB7UxqP1OdM=
X-Gm-Gg: ASbGncsarb1wohoqTq5bP1c/xWroGqAmkZA87CZNxm9ziCTSfDc/5x2KWhBC5hw+WSz
	01ZuaN7Bk6LKcIYaGBgmKcAovXCmq8nHfv95YruE0g418qVR5ULOnkrejodpbU5cBYQaMBmAxJU
	PKFxjPPH17P6V5m7QGyhA72x/IJueMJboJb7CWM+7VRH2/IyDimrHepdZkYw7bCnEYHEmN1itNk
	Ca/cE7WzxhUZN2YFcM0A/Hj42B2gN5k0ZcmibE0xSuqhP6vuR7UcdEues4PGKznZIOa+G4NrvrK
	cuLTtOMS7FPSdPSeU8Bkb94QHLuzQZE5XjEll/u146d1UkQl68nZjMo=
X-Google-Smtp-Source: AGHT+IHvy1r6OZs5sU4LLXUI0yWkVLTSuuPl8W2UXljyyd/AXSg0+qU0wKujDqcSxYJO0fbZol0FVQ==
X-Received: by 2002:a05:6000:26c9:b0:3a4:de01:f8dd with SMTP id ffacd0b85a97d-3a4de01fa09mr8765641f8f.2.1748463749231;
        Wed, 28 May 2025 13:22:29 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace367asm2409656f8f.95.2025.05.28.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:27 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] watchdog: ziirave_wdt: check record length in
 ziirave_firm_verify()
Message-ID: <3b58b453f0faa8b968c90523f52c11908b56c346.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

The "rec->len" value comes from the firmware.  We generally do
trust firmware, but it's always better to double check.  If
the length value is too large it would lead to memory corruption
when we set "data[i] = ret;"

Fixes: 217209db0204 ("watchdog: ziirave_wdt: Add support to upload the firmware.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/watchdog/ziirave_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index fcc1ba02e75b..5c6e3fa001d8 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -302,6 +302,9 @@ static int ziirave_firm_verify(struct watchdog_device *wdd,
 		const u16 len = be16_to_cpu(rec->len);
 		const u32 addr = be32_to_cpu(rec->addr);
 
+		if (len > sizeof(data))
+			return -EINVAL;
+
 		if (ziirave_firm_addr_readonly(addr))
 			continue;
 
-- 
2.47.2

