Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AF26463E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322152; cv=none; b=iqmQIlrUUCQkS/PTgm24aTr/ItVhWXuUMEqkzYbAKfo832MJ9F0DNSbPjZBbRckWDt/K6Hypo0gLzQAu4IfeGoMjGKnDWib8w3d3Pu3D+anyOh7Z3qAM+8fjvkYU2pqERgxFgB4RBjoEUtyUpUPGCZsjNf4N7zGBCjyhrZVwwa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322152; c=relaxed/simple;
	bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTI0h5xAsVfgePZqZpZEw6t70P4YhOUVN8l03rXdzeRKL8lv53EkhbS4umGfstPC8deR8yCwg2TWNVnoUoO+YNF9AMRrKL5s3ACmtDcpI7ccT1GdQn34GxBP4nOah8yDw93QGH+tbn3qgbP78VEMYigraPkJrIHo7JnfNwmIiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VkD45JGv; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VkD45JGv"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5533a86a134so330914e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322149; x=1750926949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=VkD45JGvAqDyWbqEvJ6FaDP0DutDwPdlrfgSKMJhdJzPlV21PQC8Mle0P8SV5kzXFj
         7i36b4GN8hLxFxANkXZBm6MLHWJCebxIji7q9i3LKF6iI0ZWeORr+o2cOnQkutpckFsC
         wplFzfXd/cXBxOg7w/vcl8eiKfT8HUxgitXqo9ElN+jjbkukjVoo5988tcgg1o/r0yUT
         8hz3bU8ICpGVTq9jAyOK67BySzpE6PTV+/9LxvJTbhv/XQkfk9C56vBSvTXJyTSA7+KF
         R1SlWdGaiTDhqnuVUdIR0j07kdZQs7n4zFhvRlWNHazrzvsCQQ0FGONbYQtpoLwObOVk
         U0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322149; x=1750926949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUz46dv/HPNmmRvM6Il6GhBzQK5zF9Q9c+15wuOarxk=;
        b=D5DL3JszggyrW+AeuANX5HyIbiZU05eT20NEt1xT/ZbKGm1dDbCIpeyAxaMbLANgA7
         TNvpFs/vhlKMLVs7SgASVAW9TQE6+9HF+cLgPRPK6LV+FeZJQsvFwVee5DAP5tpjWcgg
         Ryl99nASYm4ICGflidMZZrjm6b7z7+JlpUn4xDcywX3qfbeQFv589T6hNyi0lkAOPRaS
         kLnvUB64VUQpk9RPuByOkvShjvhm5lq3zaYr7j8jOeA5xkD6c6Nk10ZxN5WBrT0PTUKZ
         AEMH/JqfkWSsg9KgDzXvv8HeZ1Q5RUkx3DcLhhyaEKKPk1Q3o9VN/3FYQ3pZ6esZwoUy
         2UpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX1ZlR/QXk+9KOWH9gvglr8G4XNw8q5IOQVnJvHyTNXWpDLBKOawu8Ujx9Ob1O2/GSS034egDZNMR1ghI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGfOh3vqPQwmrPOCRZnepsVh+KLyrKjAM05Rhh8gMP4glq7yIc
	pp8wGVOT3sdE0SzKN1B8JCpOhHYXkYjkCbBoA6tPORZBTnVzEmmkftDlUVv81ICShe8VcSZmI79
	J9unSjI7m+Bm5r4ahxgMcUPFdE2PCGdAQrYaLxpNHiw==
X-Gm-Gg: ASbGnctpt3KyFB6ELeqo4e8WbLDgpLTa/HzuGjY8pShQHMeo6BeYVAgxg/x0v98mAzs
	+i+Flt84eavuIkEBLCCg5KnBHhcRJBmFzT3W/KlJCg+kINVNXW2UhxVoN9OA5GbZePv7wD9ysgD
	wY+E7PdN6ILVnNwb9qkZSca14t1O+gUEiM4I5KdIFON8mPChslR2zU0ekURpTGUg0+ouFVoq42u
	nQ=
X-Google-Smtp-Source: AGHT+IH8gdDhvgqHv68xYgng8lKIS2cL5/HDET6GaBoi/sUwyPhdyhtejDnh77c/sFHn8pTtyC9K0nsXpo0/Zf7DZT0=
X-Received: by 2002:a05:6512:3e24:b0:553:291f:92d with SMTP id
 2adb3069b0e04-553b6f74d65mr6198225e87.57.1750322148760; Thu, 19 Jun 2025
 01:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-4-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:35:37 +0200
X-Gm-Features: AX0GCFsIiQS81dI7axg97KmA9gzmGEG_3kUmqhJIMLm18HQZTbPd7_8gMWe8jkc
Message-ID: <CAMRc=MdhuQJvTwQRoXxCVa+AOt3ryYrXG1ECsqYwDKqFfAnWEw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] gpio: pl061: use new GPIO line value setter callbacks
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
