Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D5622068F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876339; cv=none; b=Sf4Jw19ZJz/bwTnbaxiPM/3foaZ9vtLuh7tiE/gN2z8jvXqxAQW79SNwXg1qzdUrU91JcQ/z/w/fheixJ4uhNPQ4IpKyC7DX5/fyTKZ1+gjvR82TvOgWlr24VkTLzeaTbVauzi59pFi3dDQFHnlaad64nFY7E3iYv8loMsvEnxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876339; c=relaxed/simple;
	bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otPJdOw17cicZMLdIlIsYtyjO3iKH2+s2nfXarfeO+zKCVdiDBbmBT0qBqMmIRrr8+pfdMp1CU1ggJlLCmrPWf/RqHtn7gZmGhR15lVVM6e1CcD0jGWFD+YsiqPwec10RIlyGFe/nqvMfCevXmBI8VM6O+U7Uym2ZhmCZEYvMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2bwkqlp; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2bwkqlp"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so4504111fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876335; x=1745481135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
        b=C2bwkqlpq1LXBQFWZcVLMP1vheGoGAhIwCt68k05aHMLxKoEYWem24ysdjCARGkvtt
         zZ7ZAuC1NpfqN3DRa3n8UfLK3mZxUKsPgxeRFAckxaDmnyc/mSPfWkjyo9NPYyFe3Iwe
         Iafy0RwDYRyNLKYLAoV1bsnUYejO7bT0voBrFUWXi35qFsuxgdRi1Yf48iCd3Mr5Xgsv
         DWML2/d2xpcM8SYj1Nz/49ALHFYYwFSP/Uzs2XE+eM/JYzD6Ot7YyqTJtXO1EyLqYbd+
         JlBejyKVQND7yEDR+2ckwApNmfO5RpNJW2WjPfY7MhFBKP+9k7qW/fHbXdAgpCuZ2spt
         d0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876335; x=1745481135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXMciIpogizc4tBQaQQyNO7iWTL7anFQVWebf4a2WWM=;
        b=qQ8EGhM/3h/h9DD8hLDgdH1B5D3oao5IQgmzdk1DGCfaVBXg6fw31U9WMdz9N6P1h6
         s39VVTve0lyTa7XaGozM8gHmgIXiDP7nCr5YoHDVAZ3026HCAg7ql85xIVpepDF6lmUn
         eLB2R9CjCDupjSfo9dD//JlL7Uw9Y9Iaks43VD+LXgW1FqMuaHrpgW4ZENCAapnuHYIC
         2si+lJOITUfSnX75w7YlseOXjTGy7P6F0XCcyFlD0W/YlFFUH40fJc1vPkLMaa5AYHzd
         R+bHVjsG3J+8dGam9ATiguBpQH47NgzNrgggy9hDA8WpCY1NQwwvQ4EmXqDYyk1ub/+j
         S3qw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oveBYUgB43iqyjcK+VU9TVWsRv3M6xMnkbMBUWmIO6i+YzQBxNJA7+Idl1moa8RHPJLhVbSfp02C+aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBmDcJxRenwlMjWLFydoKOrib38QHGqeBDDeY7hI9F/3XIGADc
	qtIFCWvRpvcBYvY1FvxdUJz/fniSp8x8op8b6yUNTcMRIcNUaefB9LhHQNfCu9SREQJ02i5c5qO
	MOSTZxqenfa4HF5Uk/i49OaZctsTJy1DV3mC5Tg==
X-Gm-Gg: ASbGncvo3gR9vEqoyXRpjicqBkpn0ZtHfcBWQvd8IkSl6FQPPgy63rp3GzK1Mj9cSYb
	eSedqpGvvIxDi4ufua2NPFYZqeXtiWTg5QHejVJxgOV6kc05Sze//lXNvHAjLTEB8D23+IYid4P
	+UsTwwR8W7K8vyI1iqyesZjA==
X-Google-Smtp-Source: AGHT+IHJ9+FIBb1TWyrAVx2oUDniSfeXB/Oq3HnfMthWO0+aKUi8sMZxOnwo3TSSS1hKDknErn0vN0cWBKLzO/nllow=
X-Received: by 2002:a2e:bea5:0:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-3107f719dcamr21044461fa.32.1744876335142; Thu, 17 Apr 2025
 00:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-9ca13aa57312@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-2-9ca13aa57312@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-9ca13aa57312@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:52:04 +0200
X-Gm-Features: ATxdqUHuW6BLizFBmvxGJmtIAMW4yS0uo1YYLPFOyB_Zbz8jQMgx6GMVm8Zfpi0
Message-ID: <CACRpkda5om6Uik+YnN4i1ePJr_NLGskdBe5GmYkrzU9bzN3+XA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Using devm_pinctrl_register_mappings(), the core can automatically
> unregister pinctrl mappings.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

This is useful and good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
