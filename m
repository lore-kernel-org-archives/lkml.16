Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3C280307
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543127; cv=none; b=jxdhbnEp4wvojcVq2KhSTyIKUJcbR81rtiClRP+xrqkGlsWvj1/AHxUd3s/XyNalZmvWd2TaIPMEk82W3kneX199WL9jhbiZ6Hu9y/9Wg8+Bbv9YLL/Be9dXWzNkH25F8UhmcZk+SjfVWXrBwRUYJWenzRVo5bpr0J714cXzFfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543127; c=relaxed/simple;
	bh=yvgWF5tnQNZRDjc0fGYDrUE1mlV0Lq+VUCZV1FeRugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTLo2Az/g5P+Ao2AJ+7bnmOJ2me+er4ZHsugPvOE+0gPgGxk087ELRKeZDuXZoOTRF9xoHOH8JKxqge3bZu2b28XhDFdrEQhcqmlDGeYl685YeSM0G1cuN9t9Mq05i+8MUFi9eip+diSq0iT53ZCvhtVtiVGjUAZKrx5SU0O6H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2L/6sPv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2L/6sPv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so66920535e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543124; x=1750147924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=B2L/6sPv4hjzgzss/Y2f2WHnLWyp9sYdo19Olow9g9PDb/yXFShZzQ9piKhvc3trpC
         yhpDpBgGwdy4UBxUB4IIMIT1BvF3EH9qXOXUtw9GC0O3cksdqHKlfUdBfYam2iflpPy2
         Nojx5YbuXh99Ge7RUW1Ji8+RVNtM2M6QAzk+k6/TVIhCBKiUtUaItqAhEnaS0bYBpA4A
         h0cDAYljIHXTGUlYwoEcq3slWgVXIJ0639p0/ock22bLDGPqWtsBVep71qxQq6dxNkAn
         F06T/r3zmozbUbLo+39aYxRjckIWk7/Z1qYrRbifIYTtwjj2D9iRnsXa4NlTn2pBHIHa
         Irrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543124; x=1750147924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=VcI/Dcoev4SIJO8stcV7pcHHDl1DNmemlV1ilIE2FU/gPmFfnX/7kzmByMUyp0E1eC
         RxsTEIxRdY0IdRFEw1CeJFmvzeartQeuat5AFmCDHVuTOstwMg3+4OHCODYz29xAvXGt
         wo/fnkamuRuVm6yd1pueD4cWZ/dLkdQHT8/jtXLmXVN89FxOMjPB734ZAeB69a6G31k+
         ZJxTgp17DrD+JNPNoJrR6tDy4QmRnMxfF7XWTAbhR7peHIwGiH7SCJMyCMUhW3Aas8+B
         JMIDMfIQ59pOB3gcDMULlKj3SjTnQ9xj12IUqBPhCYvnEdSs2bUzmArFb6Kl1/jeh6/0
         WXNw==
X-Forwarded-Encrypted: i=1; AJvYcCVlgaZYDXvoVB0nLy5k+nlsVNyM5ZJqvnUPIcHNt1cqpQsWVCr3fe9C2mfs3RqpdNhBpcB/2w/6+LDOfBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0oqqFz+t5UAcTpDUdLu9GvIn2gH1w0oSHj0zKI51zQdYCFMjF
	3dWOiYZn1AkJjyOi/XuYhCSX+ry6+zyksFd+Y4CG5oT+wJ1J5a93JS0X/a9IcqGvsuk=
X-Gm-Gg: ASbGncvboGPNai5EM2fBdwbGKHslABcOejJ5TzDYCnbzAxBbZnojg3KSgOCoyMVp4js
	Kua18Ud21PFiMeRIl+q007dORwMRfg6vkjX9H33NTdXMLeDBYmqemcpagCabRWzCCSXL2gJh3Mc
	9sMNZuJBsHOq1/CxcCwLNRDpLs2lkZrV1dUWxjfpT26IeANGXnI4rrNpCPLBKglk8sRasjF5Pn1
	W2+9VLMjePXHMCmbVXaFkPZEeuH5jPJiDMvZEEB5l1FeQxHuLA1v4vbku+tnTx7ZXG7MH5JEG/D
	o18sBF3MyDhPvKhD/pDADA2P/YBV3Sbrp17af9JxmgtALBA9zvxcKVmXosru
X-Google-Smtp-Source: AGHT+IHw7/V7r+W55JJPgOoMHWnb03kXm/kQE97NwVLeZNevpDtk4rbU8g1Mkp4wQwowMYR4Dz0aYg==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr70110725e9.12.1749543123640;
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Tue, 10 Jun 2025 10:11:51 +0200
Message-ID: <174954311123.28634.1499230964159731709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 01 Jun 2025 00:21:37 +0300, Andy Shevchenko wrote:
> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.
> 
> Andy Shevchenko (2):
>   usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
>   gpiolib: Remove unused devm_gpio_request()
> 
> [...]

Applied, thanks!

[1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      https://git.kernel.org/brgl/linux/c/32f6d31dc0401e6af7c48e5e2381997b6d957d85
[2/2] gpiolib: Remove unused devm_gpio_request()
      https://git.kernel.org/brgl/linux/c/a5589313383074c48a1b3751d592a6e084ae0573

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
