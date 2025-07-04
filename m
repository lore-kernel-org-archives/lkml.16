Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD217302045
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616370; cv=none; b=tLCwwNUbvVATot9GguYewXiHolHc+vHM7qw/DMfmBfzH/ZTfZ6ETPAv6gLzAvRUUJAqIFV0dW5HS9H+Zsn7smiL/LtWzHHLaYj7vrWDT97C/fyGxZ8TVugBveCsOIh9KVCc+HBelRXKJC0bMHlzXh9NGBFpOJ6VuGVEgIQY0l6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616370; c=relaxed/simple;
	bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaNQCNTYQMHTX4osdTx4fLR1voYkX9l6mHPHHnlsBy8xQhvHzprkslpT1kGH+pW69EqGldAHmQNJO1DDXw8/Sc4dTqBTMoshXVzlvYIUPQNbTMjglOwIM2B7Hqjmc1I3F6NZffcIoNcOl8LBy1rAgrTj0NgY0hwqCpUE0dKYnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m7Dxg61r; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m7Dxg61r"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553dceb342fso704408e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616367; x=1752221167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
        b=m7Dxg61real4fJueBgaPfG2/AADLuxUCOuhnDiusCVpU17bM0s/Jdh2zpU1MbTEKva
         J03l81O71o9+e+t1DP2Nf3n4GN+QFJ42jhkwxl3L8Py4XyxorjD7MdpmzUh+OMadllou
         N+MWsBZcRqNYZTNckUyuk0EVEGaI5dR9nytOb9R8l5vobGymJ7RoV0E3qCpaCsQpOb8N
         FrZS1cE3mK6Q2v6x1a/sHoH8HwdxtakE+9pu8FkDyqxjCjayV+X2zZ9AbcL4qeSJgmdr
         ck01HYfxE17uMrrIWQOHAAVlKuXLoLwEAplA2KVo9Z/L6rQIF7Qyn8ClhqWvjJFR/sJv
         NZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616367; x=1752221167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYjHFLywNzV7OEwa4CTvdElL7MT4P4TG7dHCmKKDGj0=;
        b=wmH//UQHfo2ARqMol8C6IrzdtG3bWlmVViVnkNVEMiI52FUKyGrD2khtTTN9qwU4Zc
         6H4e4AayGixUUWP7KQDwtjhDCAUkfmIfIqE/hTu25u0bwTSV1nsWteTm/E79Liy/Mx2s
         JKg6WjAM0juKQR7oOcjNneGRqBHqRSOzQXCgFHd5uaJvKYY5L1h8BMKr4n+YwG73dl14
         nP++pcvlQZhR5WwvHwvHxaccOwsXe/r6rfDq5eBRP0SJ1Zpd7N3gmAoa8tSONmqOymXc
         a6E1MJa3pEj2rW/GbmNIaijnTQgcVWnEU7Ocrx9G5ybtlqkkYzDmvkOspIkrrPu3HouU
         0SWg==
X-Forwarded-Encrypted: i=1; AJvYcCXPAyDiRQwySFJSpzlZo9uevMSd1V261bB5cImCKyzIKB2fUhc3PPVtW6+ZKt7sCwlFd+58p/JyQCtqRwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nijrHK9MAGwi89+tKlpnLJ/jUM4dmK1ke+aCbapT6yRbZgf1
	gSSFiHUhB8UwyQBH2BMiFnalpQVAIRqPIUr8XM1Sgzjzk0gBdzgNskVOCnY4liZaUs99UbSDWZ5
	UZdNMrWiaFFyI3770C3+6gC0AWQnGn4ojejqlZY5dShBBqx23neVj2gklBA==
X-Gm-Gg: ASbGncsG87dX/VqRGNxff9PS2nb8ErcYnp0lFWWsxnxddqmSPNNryF5Ph9xvyDu5QdJ
	7YCME8pGO5VkWk5NZ26RAmRJzw4yAZEXymApPjSkYrxL5hioIeOUadkuAfwUAjGdKv8e4arV8LW
	WzqFnHenS/iiJEKbJw+7zlNeIMYcQ8lu6MF/DjAMLlt4Y=
X-Google-Smtp-Source: AGHT+IHIdKRqrobIs7JkcY2DmFJK+DrHWeLwNL32NlyqRbJB9YUEeji6aqqcPI/LdM/czsecMqh3fHpNhbAd4cnlP08=
X-Received: by 2002:a05:6512:1589:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-556e73fd335mr433200e87.55.1751616366867; Fri, 04 Jul 2025
 01:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-3-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-3-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:05:55 +0200
X-Gm-Features: Ac12FXx4FWu-wxT4lMUgSqCnMbYqNhJBpHAH0TrYnyEPKzhBOIXHuwpVv46xut0
Message-ID: <CACRpkdb26XOnUyNm8-8=iz4YDynkGp__jQi_kvnX6KgVNoAyZw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpio: sysfs: only get the dirent reference for
 the value attr once
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no reason to retrieve the reference to the sysfs dirent every
> time we request an interrupt, we can as well only do it once when
> exporting the GPIO. While at it: change the name of the kernfs node
> field to value_class_node ahead of adding a second one for the
> chip-local GPIO line value attribute.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
