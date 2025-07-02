Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096621EDA12
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447458; cv=none; b=S4ficoEquWE9LWv07+OxEsqhN7/NXnPLx2cbuQ4NKaVQQwr509mqzeRIVW785bZ41GyAzmHxXoy4u3jyOkwSW5H1HlBcWRk8E1TQoeFpZaATSHQQxhgUdXmmSapxoJJjU326LYTdM7XO6s8xDxGZcVCVRwI2kHMdgU7DSsG8UpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447458; c=relaxed/simple;
	bh=5iifZ9sddF7JT6wHEMvPompZQJFFM10A+DVZoJvVWOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DljO2E4heMgu//pieF5hlJ6m85KibNIDL0Mq/NBvz7SCZnzVRkG40acY3X8wkcvvoAGetKGW+uPxQiYV8n84lE21SmmSFmqe9ZEX3eL0Vowqyt/ajcGIFYcvhtBWx35hqB8Is2kfypQNqg2gnDWToyh6rHgbCBZZfWDH8zCyJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dgOQOown; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dgOQOown"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso42052775e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447455; x=1752052255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
        b=dgOQOown2LE0Nj0FdtjIIodqKmLWJohefZzU2aHuuQS4djRrw1toSFxZ8vY6yOvmdR
         2Vq+mnfFn9qDy7RWzXpgqze2YmzrcofkYH/gkHJBCV97DDhUgKfL7yj9QfyMmkdoLKvY
         OhjDDfHfwgEBQvyIGZTe4NlGoyD8NQXYO2F3BLtHTxixa8P03x6WDKvOJzNNstIq31Mg
         TZg10ej5QKiP+F+eGUbl1TR4rV+INrI3ZMr0lDTU2q/mSsZePHbN66XaHEI44yiOyv2S
         1AcA61flLV4nxmlITwR0Qtb9wZDXaakoiP7EWoBwn4a5eEU8ysMEK6QIe71fiOQ9QOqN
         K+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447455; x=1752052255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCvgBdrIzmyxvo92jPpKMB/LyPu8S/mztJbd6iPipx0=;
        b=azeb7OeGOQ6zrktuSYCmjl+JynYV+wiFPxiWuo4DC4Glg2TfZmNUyux0igMcBVNomd
         pKkV8A4VYGhxd4mZau5lPZTQLso4avCwflA66gCRnPIuCqhXyai6bw1VtH9pRP1Saygt
         N95IesMTR6ZwtjbjkMvyKSW3chlkxfdR2GlZkBLChhSVkR0KVKKSoN61ovcH+ohuKyZG
         2IDWjYnJ8BOttJwH4mRHrsemDwJCp3QzMWgssRFaD3DpsZMONsFSybua3aNuppSzE6RP
         IdAZl1S3bEFdUnWHkAe2O0jgPN/eg2aPyT8USh1wzt/BabXI9+YZY7lg0hYBAWEreidK
         M14g==
X-Forwarded-Encrypted: i=1; AJvYcCWpXi0rlet1i61Nx/nUdtZ2kALxStNcYUo0z1oHfcHdLd31sDvjj+MkHirOoScX783a3O8Cr/jFspGrIzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6TuAM+YRafzARu5Qwy5R2SRZHaRmiasImpwBASNiybYEmpb4
	1qZpjo0F2e33O8OYAZhZxrLg5gdRy3VkY81N4wX8lWlWaV76n32Jl4Yw1yKTMmYVdmk=
X-Gm-Gg: ASbGncuDP1IHvab9jGOWEoki1Iz5TlwsUzvQlaU5JjtxWc094aFnke67ImCmHHGZ8e2
	Jrula5zg7T42Ns2t4guiuO6gzIhIG9Ld3wLSkbSEYpOq46Xx5fmzP1Zy8L6URBfCoe9D9GWBGdC
	SKA1d6FF2AjTuAGp74wKiKTZYj9W0bA2CoAplC3v+jFZxjvDDsar0TiNT1DJQqexfrmKnoTJClh
	qXWGNuwbGyqCoH8+s0Q/QYMwL1rx+Z4FVXG4s03QQmcshZ83gy93sS5tKDVBVN1WS+dd5o1hyde
	WhAwsLH5vrTGdRqM7Cj/jwygRSR9YjvHYMUGEoFTjTLPtY0EP/e+EPJIpT21
X-Google-Smtp-Source: AGHT+IE2uNkHx82MMiG8CGeHGUvRcCCh7iICIVjsq7NBy92UZNfJfN/G6zonzIOaQuM2K57woKCLRg==
X-Received: by 2002:a05:600c:6818:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-454a36e3ec8mr22278755e9.13.1751447455288;
        Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm192866295e9.20.2025.07.02.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:10:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed,  2 Jul 2025 11:10:51 +0200
Message-ID: <175144745011.23577.5985560691841779187.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 12:33:23 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: sama5d2-piobu: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/df213abe6913cae8d1d69efa66b725831f63e663
[02/12] gpio: sch311x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e932e894aec6ee22d7314f74e0a27db244a14fdb
[03/12] gpio: sch: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/883c7eb2c4a9e143b2662ba754f9c16fb31adced
[04/12] gpio: siox: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d5297b0f861a124efe7965619212a632d5138281
[05/12] gpio: spear-spics: remove unneeded callbacks
        https://git.kernel.org/brgl/linux/c/e9a5f9ac245fd58b8477f1d2fe5a077803631460
[06/12] gpio: spear-spics: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/70c8f51ff68147176a41d549587a67ea377ed2e2
[07/12] gpio: sprd: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ae35dd91ad2ea4ae446e74364edd6428a26f5080
[08/12] gpio: stmpe: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c9148553ac13565ad06d83d7baebef133245ebe6
[09/12] gpio: stp-xway: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e87dff29ff6b919f64ca25b066c44bbacdc08ac3
[10/12] gpio: syscon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/c203705c9b46ad0b66ef3bdc93ec9073b00efed1
[11/12] gpio: tangier: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3c9b6a51cb31a8816feb801c8c8a2265432143e
[12/12] gpio: tc3589x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b033bc5a9a7d95b8dc206dd7455a033b0670d8e7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
