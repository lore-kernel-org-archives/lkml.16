Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1633230D14
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579760; cv=none; b=FbT1BBqzmUzuLH0UClF7RENo14CcxOM4OaZtRrsdXunofSZ+sK0KRuV/pJILU6gZu3Hjww7044OXja8fugMdxgH2L4BqAfPeidmmejSnhhKBy1z0mVslLu95kdfQ9ool9e9BaeceT5dmJG3VZJJ2A0TxtJatm8J3HN9z8cXSV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579760; c=relaxed/simple;
	bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgMNXe5uKa+aL7ZDh6k6z/LJ/1pBmaQjZjS6TDRl/aWHY584yHdwjz15wERyJgNXyJyCekq78KAGWycCmi1NxqcpzSlDSq7e2YibvlzV3MeDmb77xoiM0CZtORS3NtoRkm4T4Pbg5Y4BVe0OXU6leUIGLGh110gki1NkTIu4nE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWyqy1IB; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWyqy1IB"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so3093301fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751579757; x=1752184557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=bWyqy1IBCzRXd2OHO7XovA2Oxu+XZE2bCT5SzIaPA2UEjDiZal6gMhXBU5cVNLIyzK
         R96ovz7e5B41iyeJ6fwBMfRg3FKWGvor1RkZe5DLD3Ky0UfJe2ZZxdREYlSh9Mk6kSb+
         41Lx0zrFd9hZmiT5mxZ79rKQB4Tm7lixfmEGO375L2pKK5ZuTBxauQ7coFhrytSi2568
         UX58opaRHQPy+Zx0i18uVjXh0vThBXv+qcGbV6+kethHeRgUY4/QR2BuMqNFFkZr08cq
         WCSGAK7Gf3bYdS6VjhlzG9AP4hJt6eYYUJ4MisKBbNZ+OEU+/uN1thDuhF7Mty4O5XB1
         uavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579757; x=1752184557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
        b=ffwiiWCNRnbVN8cneQ7qh2TgyCA/6kK60L8UIQkcNZIQuhPS6NiPgq7oxAHMqzHri7
         Qxm79YMRrgzhtceTEuER05HQE7ndI0ennAPCjE2rZBANLI9iAUd4QfW7kV+XR1ZFgsXl
         N63wsSldhALmjQFmAIE3jEzApBxwv21HVDr5sLFFWFzmcYx32szdaCxBQLkA+qiWjluu
         2quz+9UJnD9xHTaGfJmZ68Ig+hY2YvFv6CDXzWbWCrOtRLBoZF/VumvDQTEDCDwDGVsQ
         J8B2QaJ0mUkSbr393V42+CHJrORZc793fd7KfLXyjeH4fAapj6qO/vZHlR+7jhRR+Y6t
         B80A==
X-Forwarded-Encrypted: i=1; AJvYcCXkFmvNO95j0UgBJGPSDaPN+kZJvhhyWOiKy3ZG3JhNzg8E3UMT5mimzpitvF4VbBmXd3ctvLdb/On3+n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzunKCXggh1Cxv8z+zk88ZTCo9MD5q8ajeI4icanLk+TZWwKnia
	gn3hZUp7bmshw5ZDavJlSCXiQI+R0vUP3s3yFb6Ysa7jl4ezkKIqjL4P85xnMwlO7rbyVvBVicZ
	oizj+cXSwdl/zMpEVx6p7WPoXypAinGjOkAbOQ1Knvw==
X-Gm-Gg: ASbGncvMACfg32SDtZBCbWWi0Sb9zy5rapfxzLq+IGtCXIgKOkwx7rS2lqfwu/u/sBJ
	31YTnrqC8SOzseLhfsoOjrGltOOBsLgeL7UUzbibCxnJj/h9TBFdWFwKL9gaUxAsrdsVzyi2wJj
	g73hJVNjeMr9L1Rq7FSUIzS6m0SeYMdPhaJI6dcGpRBb4=
X-Google-Smtp-Source: AGHT+IHaNTjaTi4rRrNiknGoZhKdAy0nR6vSTWwutP5sj+WgtzM1iPq+I6faszK16by8wPiLXBJSSCeRTyl3tRP9WBs=
X-Received: by 2002:a2e:a9a0:0:b0:32a:8153:6934 with SMTP id
 38308e7fff4ca-32e5a4b393bmr565651fa.1.1751579756933; Thu, 03 Jul 2025
 14:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:46 +0200
X-Gm-Features: Ac12FXyJ5knyp1mOJyZQmth8ooUCQJdl18NRhMK4RYZjhZxWH_hhFCTHLqF6V_M
Message-ID: <CACRpkdZ7B7FZtU6a+n8qcvNhhuqhzeZ=jfs+xQPqAWLa5n2LAw@mail.gmail.com>
Subject: Re: [PATCH 12/12] gpio: tc3589x: use new GPIO line value setter callbacks
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
