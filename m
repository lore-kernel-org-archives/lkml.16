Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468C01CEEBE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731302; cv=none; b=XGJEW5sN2xbLaE1f6OfO0iXCvHRTFzuadEcssSKr7zEN5hhgZ3qhQlxuwVm/gsRQov7qawSDFDRkQYiHZWM8I0YFbT6gx7+0t1U6/S5Z33xXOZyaKf6bxFNFIFxy1XdC2pBG6ZPeYw1pIIyYtGB6TQMZQ9cutofa6cBIpHXUsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731302; c=relaxed/simple;
	bh=jK9R1dnUwKGI3zGLQm75/1AN+GpBkqgb//hlItvir0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGGSfJ6umAU4u9QZUenGUXBYjTfCbnMssnRiOt5zWUrBNVDcwmYwam7FYCZhVMOP0fgvWOFmGuL0/jduugEjnUP3cQDcnYiqRQW5a9QWig2id2fef64irTZeyZHNUUxJmquEPAq4xA7LmJFDJ4213aOe3pIsoPp5/aKS3gjq1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdJTYlgw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdJTYlgw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso12866575e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731298; x=1752336098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Bx6PIe+EYTqF7HuIJczhS/0SNZn3oEqyjSCB05qzyk=;
        b=XdJTYlgw5+RA3M6uyjUFFWkLn/pJotBq5vREbEswcXn26PdD5nQSQ/3k9TAltCAzss
         ZdhDkreoVQV+lUXZmPfkAqqym6/XgRAGhQS3bcGSwk4MeBXgau5qYvAg5HFtTYHPhCq5
         5KE99MQF9Q6npQ4YjNaaYHBuUrfv8YWWJVYf1DY+nyfKksXUZ+kv8ShtGvI+bT3iP5VA
         vDss75gPAvZU0xofzxxG1vWP7eQOUOZkxnQDK/AFdvztsv8wyGHSUVfp1P/FLSPLacpG
         fC2Z7kgORkHVCeWQ6WummbQB4wjbhQB+KyAmlOGj9rOMZiBfwspQ45+kbN+23dzGEc98
         yrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731298; x=1752336098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Bx6PIe+EYTqF7HuIJczhS/0SNZn3oEqyjSCB05qzyk=;
        b=m47H7DrO9ZRk1tmByUqf2Eh3sIxIJifBc6jc1M/kBJHHPy25Ye7nESE+fDh6S/lZaY
         m5XTd0SgXLf67NVGM19rnFCGV92dzDoVAzTsliKdFDR4zD+SH2VYZr/oag9+Qc71I0fZ
         pwmE3qZuvbnt2atv4JnpfxW4H7yFC1b5TOUcPuJyPNfUZSeEPSWd1fPooU8aRvaDoP47
         GR7XsJfvO7tjCGxu20oy7Dv6Nk8u8yvLfdcpts0gtguu4vmqFkR9wf+D68A6wPx7Ck6I
         y0q+M1Xxcr+PAn4kXOjT8ooJcVoPuep9yWkxGUt8nYi6+RNKp85SbvxWXEvf2uGfAvFe
         BB9A==
X-Forwarded-Encrypted: i=1; AJvYcCXBStUyOuloQPby9Gv9H48ArrPHmWI0s6LuQBhI9uai4GWp38jvMyttHTzQhE2uhSvoatmeOHruopmc3EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRj2xK7VAAoLoo5MIeTTW13YHw714RIdQhr1UmcnIE0xc2VJqz
	q4dVtWZAPXazNHWVv4PVvn/trXXtJKp8AcT4Hc3vG58IJppAOzIXbu7MOxhNq7YC9r3gDvgzy3H
	YAOyU
X-Gm-Gg: ASbGncuTZHCuaZUAlOWo7kH7FUQAHpZ/J/kikra/t445FZ0aG203HbFe7hMHYL4bdbM
	Iyq2ivwQ6xgAStu6VRXsFN4nuTDMcLs6ynaIwP3kSfFFhw2XhW8S88yI+1y09+PaEHVj2ohCnb0
	P2UawZJeIo3+St7X1Jlovq5rwYKu8PXDBPoM5XtdzU1BrlAfAXhhQAeaES7ig3upUWl+s6n0Br8
	dP61lHlhEYjfiscwHZyMNjcRprGf1xKJRZftuZFXcL6PLq6wTHuusWCQpfJn4+zUpkStGeQz8c1
	xwo8sxkdv1h/oIa/EV6jdsUblmegb1YvL0ZHHGYJ94tRDPlSzwyQQhAoJG8Fm+mNPV/BjYPLsE8
	mlKFDKKOvdCyZ
X-Google-Smtp-Source: AGHT+IGj4vNXEFw6RbHkK11fSX0mVW6L0kSYuoH4aY4JyjPPpf3/EVObgn4BIvbF+KcCM4F7wUFuUQ==
X-Received: by 2002:a05:600c:a06:b0:442:dc6f:7a21 with SMTP id 5b1f17b1804b1-454bb7f9b56mr26254875e9.3.1751731298203;
        Sat, 05 Jul 2025 09:01:38 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:37 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/20] clocksource/drivers/vf_pit: Add COMPILE_TEST option
Date: Sat,  5 Jul 2025 18:01:08 +0200
Message-ID: <20250705160129.3688026-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VF PIT driver is a silent koption. In order to allow a better
compilation test coverage, let's add the COMPILE_TEST option so it can
be selected on other platforms than the Vybrid Family.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 645f517a1ac2..6f7d371904df 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -475,7 +475,7 @@ config FSL_FTM_TIMER
 	  Support for Freescale FlexTimer Module (FTM) timer.
 
 config VF_PIT_TIMER
-	bool
+	bool "Vybrid Family Programmable timer" if COMPILE_TEST
 	select CLKSRC_MMIO
 	help
 	  Support for Periodic Interrupt Timer on Freescale Vybrid Family SoCs.
-- 
2.43.0

