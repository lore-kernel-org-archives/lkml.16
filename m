Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360BC230D14
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579732; cv=none; b=QtLEnLy1oYeATBRs8PimxPn3RS8t0htF8DLZySPJnvPliHklyD34EvGzEX6SXJEWRWhV9DVsjcjjJeEqKoQmKDtZxlLdoDGUiRNucypGg5y/I/jr5bmLTl6Gwu88128YUrb9A6ilwVHcQILsG1/9Y47ts0gBzetpNSKAVuhyMZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579732; c=relaxed/simple;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+hYfIY1G36KpEqOnnLVKdZX3srauxK/r15OfjZSRUzQJJLs5E2AmkTp5xV15r999TK/8qbqVqYfryN6R3vhCIbTL3JMzvHTeEmQ6eestrg5SdwLh2nK5/HRL+Z+fnwW0otBXw+iI7MLxKMDrVk/20E6J9FRi63ywt2AwB5qMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DIAXaAw/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DIAXaAw/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-555163cd09aso332045e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579729; x=1752184529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=DIAXaAw/6jCpCnH9WPVnrT/smB2pxpu+nlrVZoInw5ey/7TuWTs6qBXdapRzgHkW/h
         42bhO4PjsEiejJ2YF0SNFtlrn7MsnicwNqQKZNceyyQPHszXZnf3KchjnMM/nEJ8htzI
         3lzEbB6Z05wHBLjPBpcETp8ZcGQTLsaSBRMAku1M7pHHIrR4f6E5nAmzng2srkBPLkd7
         oCzX76UChjCdTQPS6SZ91RloCyyEMAyBKT7vLYtyKIbB0ZPFpAFyKgtuDHXcRtj3ViIT
         DIu9Ol+sOfOwd53mrz1SRV4n3S92m7U75qzLaT1Rjt3jwaB4Gt7YLr68A9Z3Ywffad5v
         Y+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579729; x=1752184529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=HihXJxyFU1zQFzqUpqjdLXhDiNbRxs0lYgHPhiiEkQscUmcXGwOXu42WJQeufpKVQu
         BKfMqRzSiioVmb1y9SqtvGvRG5RZIG1BD+j0mXvXk4B+Tu0sQuH7krjfbgOn69lk1SaL
         cB3U/wifLV4exEsjgbNI6AWuc2K8VFGP/dnj/RdNAYE06xWcKtdyQISGrMJNxbnk7Vq8
         I/bdganJL0YCo1ONs0TFIHf+u7MxI+Eo+67rytpP3DYlEzkOiWmCot4HlPjYAR+ogBxW
         E/575k73hbDvRbFhxRBlmzv0KFGFgxNDv6w98ZGO4MQDZwQXl7YIKMz5zxYXwqmjnprR
         S2EA==
X-Forwarded-Encrypted: i=1; AJvYcCVRRACgEJ7rooXxAF3NW/kS7AUbSinvMPD7qHzz/cugazetwUJY3FFhBSJ/usDxCLBpAUgqRBa4NTy/tPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpoYKEu64aQAKrVscw6mM8CcXv+bH7TFseIFqU/DXDv1eQUsJ6
	ivFKZL0uejvIPkKOBWMzyx6YPsgpp4x8TbtmTMiub+HnxSZ2zJQjaU6i0J/2lRU0XSo/2OSRQ1l
	91e5un23eteHnY340Zfu/tIMCfKSQ4xrPYse26/rCGCVOstP6nfSQ5OE=
X-Gm-Gg: ASbGnctnIHOYo2yd9XYKM1pfIJtnliLEE2eS4GWBXPozCmKh65fmKazIwipOQhxEH7q
	kkgOVWfpicjC/sChFGuguTJL8nRYdlk6fvYFhb0en/OBYtxs9Csxc6n916nC9rykijQ6gYwQJau
	kh1ZlVk9zdEbBuAPiEvh/vDDrWej1CRHYqp6skIICxWsGDPZ06e4zxWg==
X-Google-Smtp-Source: AGHT+IHy+6VU1NwR5hSQKpWzK3RCXChUuB9Un+z3AYwhqdaiRedo471AkDhodxUcy7i+LlhTDM6edhCtprSC1oAz8MQ=
X-Received: by 2002:a05:6512:ac1:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556dca2b8f1mr22283e87.15.1751579729319; Thu, 03 Jul 2025
 14:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-8-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:18 +0200
X-Gm-Features: Ac12FXzOS746MKEQ8T_6q3redzT1OE7J4o6V1m0jt5q39x7cc8PQ_RL8cK-Gjdc
Message-ID: <CACRpkdYgx-XGu+yg1u421Pwb8o+7OW7xBgCkcP1KUzRUz6dUuQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] gpio: stmpe: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Shevchenko <andy@kernel.org>, 
	Thorsten Scherer <t.scherer@eckelmann.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
