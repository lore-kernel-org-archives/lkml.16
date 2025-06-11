Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE82367A4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629814; cv=none; b=rkjGXjV/mBiBwPt+uwdBwyavZVFeiJRlUYu6mW0+dElVZf+h5XKxPPkodm1FNIJt6ViPFaMoL4HgTB9ccydesCzvMbSvg/JtE/uP8mClXtJtUO0jtWzc9J3vx0KJ0lKbO2DD7y26peMTJLuNvnKUSeaC14qRC6WyAc8TlLipjkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629814; c=relaxed/simple;
	bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLCx0uARYEvybaiBhFrj1A23uGWadpK8xg8fMC/Rvi3y/7tOuXasq3jfs6cppFr0ern9KF82T9A1RVOMixSQQS4Iv4ks8UX4DRabIs6spEU/mEgHFBrWoL3BN4UvQnwyogKiqSmZGFuNhEzMZGnm8D/875OGFPuKCYoMYRzOnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCpW+Prg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCpW+Prg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55394ee39dfso672132e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629811; x=1750234611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
        b=NCpW+Prgxtqnj1e5/AuOx+cMiy9yVGBH6XXRWHs9fsgYAtqX4E+fWGXkDxfgT7PWGR
         rw+/s0aM8lLp21M6627wBGkGWS6PWLY4rGPXmipy1BERC0cG76SUbl5yHPPo6OLyv1qe
         edz8b+XMeNWJaoOg2Il4xx+SNXE0aRj3dKSIp4buEZiJegtT/4SQ/3RgZfbmO5lgtLHU
         w2kMUJcwDw6/vJCCe1OGoarK/Qz7/0eQYDO1vMh1zPoN65bKAoJqFh3T+ucNlQ1TB8dB
         Hb/NUvlXUSU2yNP5dw/PeY6SerzG9BMYDeCwXMD6sslh7d49ONU3IkpmUWqddeScwlg2
         nRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629811; x=1750234611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
        b=lw78bxbMltEWSRAhUvIokCSxkCon8IdB+LwJvX+YAAVDwOqlNlPK+A1V8jqS03LRl9
         kTLMqMyw/fNvwc46+G8sd7S+IF1mp/ND/KQigFFjUJxb4w9OJzoj9oZ4LBhoWH1TgiS9
         hIt6ateHI46psgkSGaEHnMKUvC/GFQA3oKnhL/9DMgAfXJEeZWxMS0+6QhYqmWT1gqT4
         h+yM1qmHZ49cMP4CY6Ik5p3iObxehLA43/2xZdJXfhLbqsmrsNoG7J77otJWvzyAFWlh
         TQY1LwdY2JzF9S+o/sazzHgM2HO3FBB/staH6rE4/p8UhmweHNZBCmW5kZ138zCHZTt7
         duHw==
X-Forwarded-Encrypted: i=1; AJvYcCUdu351kvxaCt2QlD6dfCxGW7Lurv+KFVnJTf71YYkdwHO1TXsujNejaNi/mnIPPDy5u8eWaVU1chg4BZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4de+UoJam0E15HZXZm5WC8zG8JhQB/R/fiITMFz5JJUMT87Sj
	1nkW7a0vggBNO9wEbIwgavjyYZRinyHTWwM/9VQMvXcIsJ5BY4+9rECgKwZXFkILHmqwL8Quhny
	tvUImggd6Cm7o9Cn5EdWIdzz9ptQ3eavEAw/nSMaV3A==
X-Gm-Gg: ASbGncv73iyb5/w9GyadV/N1uVavEt2jxNYbYapVgk9gzasDG5yt0jbq6VeS++x4mGn
	3193z5Sa3Sc8rP7uQHQqnVywjWdRklEqFCZrHu/TWYaNH0sSTN7/caUCgypv9yAIy7y5D6Bx4Ax
	TsgNIhnOK72XoQ2HOY9mI1tz+vHeJ7UQnooh0ssNRxJAA9gGqVXUQqmA==
X-Google-Smtp-Source: AGHT+IHNr640cJb2CBOePz/tU8TNVbkrFYUyovCTZz6rsK2wWDFZwATyEafUTJCBR1mNzrhVsyuz4bNlwkqu7hO/Eog=
X-Received: by 2002:a05:6512:39c4:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5539c5d43d6mr747274e87.16.1749629810966; Wed, 11 Jun 2025
 01:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:16:40 +0200
X-Gm-Features: AX0GCFsY-c3Tax6ExEM8lJdclAQQKPToqmkyjue72Taa9Ufzo5FT8Qipljux9j8
Message-ID: <CACRpkdaOLOgnRiVHGXtmJqLPTSBWHORK73cC5ipa5+QPCf=wxg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 04/15] gpio: sysfs: refactor the coding style
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Update the code to be more consistent with the rest of the codebase.
> Mostly correctly align line-breaks, remove unneeded tabs, stray newlines
> & spaces and tweak the comment style.
>
> No functional change.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
