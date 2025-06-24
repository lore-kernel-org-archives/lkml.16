Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99412ECD09
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794099; cv=none; b=gp9p8rPuck62SeVURvwM3+3IQECDO71Hp2esxX1JKyegwR85P7D2sexcEE23IoI49Y/RRlKhs/mHC/4poDQJqhRzGssg7xvs3IVIzQTeI+gjxMNJBoAr9/kD66GQnSB0lqS+qQNnVbsO8b/UPenLys83Y0FUsP4uPmf8ut6v5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794099; c=relaxed/simple;
	bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzdiWwpxKWdJX33xSgWwzLy8OQY1RjbB9Rvt2QnN2cvxe2MkzN+uUHrHgEU20oYx6J5HQA9tpsnqfdwHTYkm7xRhqBhMvPAxSyTph2VdOVH04C09t7+wAZbofpssn7rq+zn9LkoYcIs2YRNjeiy4uadQF6Di4gBXEvenXi21bJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TYt+v66u; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TYt+v66u"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-310447fe59aso72184001fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794095; x=1751398895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=TYt+v66uVRtdBCH9H4QW6IdRV6c/mtAgiEKCU2v/jOAZP1gJ1A/c5/GLBlLxt7rdiO
         AutgSujhqabyUhE2uifVgFIZ9/6zpUAsIgUXgUYKRh/sB90YlempQGeq00/4ERqNCBWr
         enb9QwoEC4r8SDamuq3aZh5kZJnzN3Vu3SnDdg//2EOu55sw/6ZzlBXOq6L34r0/CzQt
         Lv9Q5KSzOLsg8gqwiXQEFcdOKmo8oMNjAsZGm7FaPRXrCBFtm8dnTvqkyIbaemVY1wlQ
         Gr/7OuTfpPuCldYQIYA7fCZuXCHbgWuHfTXem+gfFHKDcvoGCqQgjMOnonWNsxP6epzB
         oaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794095; x=1751398895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=rKGeAG0y0kdabrSxtuQDrBU9eImprvqTTEDfuO+/Cxw+doWkyPGy3tl6+xMrPLdKrz
         IioEp3pfraiM3VfkKo9ZYppKAUUBo4Kvlxr2+UuFtKWyIWZonOO9W8kiQ/F+1vg/EAMW
         HDMFXLMwOQHXJKzys1ob2CbOOqvQQoGRkLDWS5o5KJDh3435eUOJNjj0wrxPCkPe7g03
         pBtf2vR8o/LuFFYpQzMDsFaR2rL/+tnHWYxnQp4XdB4h/s6wkTsv29HlnvP73z9DXa55
         opv3XeYZsU6MjSlyIXBQAuUyocIt8DnbkXpb3CX6Zw5GtPpqDCcc1xJtiqVSVQwKTWjj
         Layg==
X-Forwarded-Encrypted: i=1; AJvYcCXVO9m7bQSU8W3uQw3Mad6+ZpWaAwKJ0qSZv4Ye7XP+sCHTp/w5dPI8spaEkhafMrkbJu+ChkYdErEvSpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKt8WXYKh5pjxAuOWi5NPx80fzIFZI7yNhU361i5wPLQWQx/4
	8utH4UWgSbQOvSm8pLSpKcmdTFg2pGqmPo3JwDMR+TPIQCVA9rVZHsGGurwQKZGEjusq/VxIXQJ
	x/Sl6W5DWy9vrsLDX9spiFyxKs+40X6k3ZvJEj15Y5g==
X-Gm-Gg: ASbGnct/RqyzpPH8TbeN7EC2x/w1Q/3CEy3YibJDMFETJPAL5+UkSOBRe3xOQB5KrVM
	341A8GosnNKLyh7kZtoj60ja1G7nElvW9IFf6E078n9KBBKjKzmdDwiQKCm7mA08rshcmr+yTTG
	Fgf6/rAKKwi5kKMbFYDX8xdnlDglF23EdyCdubOCnKsf8=
X-Google-Smtp-Source: AGHT+IGgAuc3iJtRYb+OK2rDM3TlkSrDgGEbgeVIFtkTDVdAbZ8WB/KP/SQ/rIDTOfAZi97Vwex02jPn22o+QO9h4sI=
X-Received: by 2002:a2e:a4b6:0:b0:32b:8778:6f06 with SMTP id
 38308e7fff4ca-32cc64fe7edmr63161fa.18.1750794094847; Tue, 24 Jun 2025
 12:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:41:23 +0200
X-Gm-Features: AX0GCFu-CBprmbPmDb8uoIG_yV6pNxQGi2vFucZMy5qL34U2BG3ecQIKj4_p--o
Message-ID: <CACRpkdbG9WSuErEvcNGnt6bSqMVk31PuLGykaLw8XToVFnAc-Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device variant
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no more users of the "basic-mmio-gpio-be" platform device ID
> in the kernel. We can safely drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
