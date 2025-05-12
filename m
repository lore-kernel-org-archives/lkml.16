Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E72550AE
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031923; cv=none; b=PTK1D4CoZUvAaqAipl0L2yF5bcI4utmq+Tv6oNsLiYXyPwHGR7IQd/mHhFMttC2tPsJhBB+lcxLIkWnWiOqB4tQcE/CSMEpUu6+0EItQYEKj2bvs6zj+V+YyABJ1AdBxpu30C1iqk5iw8/xQBzvxz9Xjznr9+yQLsrD1A/B0NJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031923; c=relaxed/simple;
	bh=kQOegFGMTftIm0x0f4VdJt9xKHxpuzflODW8BI7Oz2s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h8uXt8oCwC3Zkj+Sl3inpPQcY5eXzgqrxn8tZiNMNvDdT3NTBRAmerlwKSHywz/laF/T+4RitxX+G5OzyKdWJQeXTLHX4babwNKuxnT9qDrJ96bQ9b+74WoUGrhd1t3l2FGwVvxrJsd52k6IZIlNXzFfPZHRfy8HtYL1MmXPL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mxm3yj+x; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mxm3yj+x"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5faaa717cfbso563827a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031919; x=1747636719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
        b=Mxm3yj+xQEIp8mjtM4f+wY2Ojoal8H5DMI+sxPGCJVMkwy5Sp6y3f8ldOIzGXqTDfn
         ObyW61ni37PHVLmIW3oZvJmzsNTQ0Fy/AM8QQ/rpQsbfLjobtnwtr1hxvnHz1AHH0uNi
         wB25R8kWGHxdhFBnuA4aio50QkKluwj1FAiyrnpjkVMh1DVGiF505Zbjc+P+850Zwiie
         84XIQhHTd++ZxMihpX12VWKc3Vm95FwM+9W+D5XehtaWH/t47p8ePJPcmo/ieZA7LXln
         1CmRjEPd1/zVipxwwsU3WO88I0PpK3mFn3LzQpWuAfwUpvPoUFbcJ/99/GSKoDAi52RP
         e9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031919; x=1747636719;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m54qQDPPwUYYIp+I0ulLXNvjU7U+yLbsnGmwxSAZCM0=;
        b=ZGTiWjh3z98M4LczHWd9UTzpd7wON4/BTasaezQolmbxhMGnXd2eq34VFZ3ji3Gw7I
         j0l2PDZ4Qzxi6tUCSRCQObA6t5WX9OY+t254MiiO38QsJLY6kzHlDjgYNHvhEMgjhqpf
         99ythqEnX7FA6sD37AjMwwYAqkN7Yd+hC1aGGtPhQQG+P9GwdJiPsIBgXBtwSC7l4ss2
         CIkizQu5MqVFZpEpIMapQObvaOkfHoxeM93UMrCIBQ3P6Lpt83FS6rCGp2NfCkPjZOXo
         Xy97oZNWzzwNjrcVhs0gkBbKCVaSjJpHMyVJAbT7nmGUrR+Mv1q5exZ8s/dmjgNJYw1B
         M5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXXEKgwEUjHGGGIi6B3U4JhgS/0QDZWhLDGSuZLTDKudbEegZOmMtyEsGZEDabFA+BxbH2NJxO3WDq+/+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6dIa3qmwTIl8d/dKpqY31OAu2tQfuV6BSE23HeKsP5TX9bsNG
	XznPjJojHVwcX5SLGLZkEvFpTuWD44KVNZVP49fwheGNApareDw6Pn/RBjtJwl4=
X-Gm-Gg: ASbGncv+lmxQuX31YEmK1TeILoYgAl7wTOyBrZp2dKqji2Y29jaWdCZchOrHmF1OQl7
	26xA2xzmedpqsNhqRwbsUCt7E23QXjNuL9DmCzM7jKZrUgTRqBPIuXhiCpY4kLVNE6Kocu7XQ0b
	tb8f/HTFR3mb5LEWKkRQ5Y3KurDpY0QT6cVuui0dR5NPtdZDs4PJlIfVtPpIBOo2dn35c7M8MuJ
	HA1JQxkNsbMXT2Hjk2rVsr+Lv1sRy5OStbNVb5rFuYWRVTH/D5ahUqmEipbJBO9QhzpFKZwN8QR
	/fn6QhOt3oQjKx6sI+t16jbdDZ7O0fxgaUq/BCmoSys2z3VK8dU2u5hyN6E/7LFFehmr7NY=
X-Google-Smtp-Source: AGHT+IFllBd+sniRuVcx7zlk+9/gEDgyoPcBo885hliuUygqoRqkFUwovnLuRvDW0FgmF20AaaF4RA==
X-Received: by 2002:a05:6402:26d2:b0:5fc:4043:dade with SMTP id 4fb4d7f45d1cf-5fca0793fa6mr4040273a12.5.1747031919022;
        Sun, 11 May 2025 23:38:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
Subject: Re: [PATCH 0/2] memory: stm32_omm: Fix error handling bugs
Message-Id: <174703191772.30920.1274669600667314405.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 09 May 2025 14:04:19 +0300, Dan Carpenter wrote:
> These are a couple bugs which were detected using the Smatch static
> checker.
> 
> Dan Carpenter (2):
>   memory: stm32_omm: Fix error handling in stm32_omm_configure()
>   memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
> 
> [...]

Applied, thanks!

[1/2] memory: stm32_omm: Fix error handling in stm32_omm_configure()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d44eeb20d9bedce11297a09628ba5dd39db236be
[2/2] memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0169a24036848cf18205301673259bb6879eef97

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

