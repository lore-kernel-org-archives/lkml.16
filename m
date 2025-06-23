Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BE1EF394
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663077; cv=none; b=t5/8dBcairSBXc0vm09ct8QuNPo3ph/mw4DX7dMMIEmB2HyHXHSzQI8w5cOtcCfNss+f6ozFG6+QEh8HGNcjJn9SE/dCdGiwRJEBM/9nVzNwnyqBye6VMiqdiFBRcP4rfFCh3leiBuo4v4BXeymJseglxSVvu/PD7LKN7usPp2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663077; c=relaxed/simple;
	bh=JiH7hRPLOgVujgb301wm9++iFil/jT+c/aMlUu8BpxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ff04yvLssH+Z+TZQzC5v8Yczwpe0n5UK+cY31sYqGQn0nCuwg79PTPwckr4U/aseBlbKOauDsHIGZ0XPJFkZ4FJDgzQ7T0xSAUShPaL07cUP9qAwHpIJzJ6Do46LYLoNvlvmvJPDO5ame2lWInMtWwuCwYMYsmVfsCa8Gr1XJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Yr+p19OW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Yr+p19OW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso29634455e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750663074; x=1751267874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAse4kZ6s+b8Vpx9RBnwscqcpgPOHjNp8pAKbBAsk2E=;
        b=Yr+p19OWbC3avYf6BqcZC2tZlSVpHGeXjNeA2L+LV257djvOSjaMJXDRhZTl1aKduW
         PhGUh86ogwehXHSC8QjKm093BOqomfTrUJep1x7BSmEbqTxANG/3llXGYWDuRbBAELQ5
         RyI5dUlwq8QUBERazt8T0YoYVMLiywF3P7tl9PldAQU2SrsyVcqeB0FN+p50SXxNmitA
         ie0AGGO5MaiahX4YwYGV0nxe/rmWIYZ521qij3KX80oQfWiAmwIfQylnESbzKlec2EtA
         1HCinW2m7PXJgwyYBAO1QG0J6oIgQ8wI6O/XHVoE+Q9427DDyLpgWUxlY8ZbiBZPzigx
         4j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663074; x=1751267874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAse4kZ6s+b8Vpx9RBnwscqcpgPOHjNp8pAKbBAsk2E=;
        b=id8K9DB9cpSnWhPp4c0JdqZMfAUamdNP3E6ROgiyMpFkZrICMcfk+kXKozXopnACzI
         3meNELq8IoNKb1JaB+nxjtjyRwuvPBQUpi8y9CnB/THjvx/g5fU/wpBPCa7x/a8nvBqK
         IHjtJcDBMn01xFv7elO5RCRS/3HSj3GsPooumPXUJQE4ZKl5z4x1ZSA0OZrtqNFDdTX7
         RCq9ITAOzGagFf5qOXjZhZfvev6uJzDGpTaALiE4+LwwWdUKdBosmjOC4K/zZyvf1Lla
         Pv4WnVgeg8xnyl4m18H0T/6LlKa8HbZoUEJ7E1dKWjD2c6N3DOBCNxoTs0XxVaqT4KXp
         cX1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2XcwR4Fh3vPqfAebCMpy6ZaQUg7GoiP+RC83bsCocm8bYrl5MhfNnnmMG/83vldboBPK1FRzBpwZa3v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWy6xyJzfF4ko4bwJLPtltYRNZ0dJbsfEjlS17SuNV7aopJxD
	l3RgEQ77hhT9AJ/9haVjbi4nfXkBq6bQdoysIoJDyTxF9udsbqUJyzuF4H0I+uJ/gGg=
X-Gm-Gg: ASbGncsDJtVcfJZiiMfIJ07GB0Tq+iaMcJYeqBFieDieZ6mVMY5bgl0kpkTQfXYJvvE
	wtZmrpDIpz3GYoeuivV/HoqKvpRuRw2/5Spn+CIXAVF89dHaq/lgZjHfwZLaqyal7X2zcIoomOb
	NP52fFwD6p0TNWwrUROQrfGa1ZnB6bgMocFtFMQzIUhbK+Gf2/IcJRJ2FHnULewm244yfCf6lVE
	U//qPDVtrVCs8kJII6B79KukXSmLQdLproiYaszRsIUrdCQVFIKyBP76Wtuq9FgLDDtr8Fv9AnP
	OXEJykF8OY873Hwg2SCFcW0m0ZtLA5IbUZZeDBxMKOygH1i2XqF3KhWPrVlC6Q==
X-Google-Smtp-Source: AGHT+IFCpjuidO5QLU/oYBmEBHw1uYf5VwCY/oc7uHhwxQ+CnQNt37ziidV9uUnxD2ZN0RFDtoSG3w==
X-Received: by 2002:a05:600c:3e19:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-45369e5f397mr78398085e9.18.1750663074589;
        Mon, 23 Jun 2025 00:17:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c5f2sm8896926f8f.55.2025.06.23.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:17:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Daniel Sullivan <danieljsullivan7@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ts5500: use new GPIO line value setter callbacks
Date: Mon, 23 Jun 2025 09:17:52 +0200
Message-ID: <175066307043.10786.8480717489128765308.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aFdKce3Go9iF4A6m@danv-Standard-PC-Q35-ICH9-2009>
References: <aFdKce3Go9iF4A6m@danv-Standard-PC-Q35-ICH9-2009>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 21 Jun 2025 17:12:33 -0700, Daniel Sullivan wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[1/1] gpio: ts5500: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/a0cfbc67d71c763357a8847305e3d5254028c0da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
