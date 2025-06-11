Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03021B9D6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629758; cv=none; b=EkPn2XWp7Fy8ka/p8HyjAJTG0YLPOKeX8LzgdnZd3v/XMGqVaa4Pw3TgzNshyevjN1Ao7Gm2IHxNqMZJjqtw1vD+kKHc/GDEavvPBj9nEHuIA+UK/8uZumJLKkGsr15BIlO2Z7SvwoZ1q8AtR/uTfSVYRFJyaQpEcRKSDP0nir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629758; c=relaxed/simple;
	bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ks3ab0eAxgQexdA1Y9/HUCyWvZPYAyIYm4ZMJMsl1smY4xBjfJohaYc79ljCANyFeqhNhUKahEUXKpE5O7IaND42xqOIwzaPvcpP+XN3LuXMhtw684ZDM3zJEYEvK9E+3O6OR006y8vBOg/WOLSCf27elRS0rT308PybQ0C7mNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPjLoMp1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPjLoMp1"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3292aad800aso6750881fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629754; x=1750234554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
        b=FPjLoMp1W/nh1rW4DRwHlATgEVH+KGfzIeKWdc+qsVhPG0VWOApx/8I2ShQnjDQnHJ
         AVCnlGWMiVAdgdRxaSRgBuoCj9rvqdr41Sqqsoi4EBiBhsQqyvh/WsZyk+EvzO5Vh8IP
         QuMhxDRCWHcsoUOpMFyyuFG0fIrgU8X0rz94dz6QGSQEr9FrlyK/poklzBcwviYDp+be
         dAXTr2daLfvXvjrzAVY0JeCMohwEm2qd79otT8/qPU1xI0m5kL8UzgY6Njp9xBBQV7TZ
         zYcqRfidd8YpdllyUhgsxc9/LZJff6WvjOehNF8rw0beHKrEo0VXK20HegGO+hAaz60/
         vvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629754; x=1750234554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVNr7xZAzK/PnbgzhDGn+m+RXROTveoQqihrLk0Jqss=;
        b=svc0NpDvC51xJ0aVOI6iA01rXhOmGBNm3EA1hJ5Zj3BqhZZIx6Tv78grlfkFiYeM0+
         ETjDssLEQIWdpG0R8ryduHrQZoSztAd1AYHxUotacYnlxIAUdT9T0vPQDownprN6+JBZ
         HmyMINeVnSkhoqz1axSOkp633zAFoAt/sYl5ERXeKGBcMcEvSugOHt/+TVDfbm4Q5Bwn
         WrkVL3gdG0DJMDSgNDkBHasJ2OZi88qh5Wapuj+y465xkWyiAjVlvSLohagGEF5higDw
         H/d1CF0e/7bNKnJZlctfj3/czs3XgA9Mu8yTO1SbNPlf30+3v/6ptS+rhgtPPtqdpXPU
         U6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVdT4NnyifI2tYf9JTHZCtkBLLtww/FgDwdVbPlMijzak4xwyN173TvTgg4pTewRsEuwWeMJugAjVKGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzedcg9Z1iqE2Vs0W6EzEw42hDIF4eNahBuJZRQ6g/o6vDUZDOL
	q6sM+z97gJgv9Hp/11MxYjpHQo2vwXI94Px0b6JUQkbXg9Ay32Oe++pdydaCG846v3AjathhNeE
	UM11OhhbAfp25IKOt0ZICHtElpd1UN5PUTUtgByR5zQ==
X-Gm-Gg: ASbGncv6qxXrQsoOBTOGZBhEFbxA+fWiiY4PFpuuqc/5JjBJGa2+mm7M/JMsxY56pwi
	XfvR5mP7OJ/JCdC24A9AjiA0kDR/Dj0UdyrNkRHKtD5IKy080o00Nfb1c8EJmqJBx4Gt4w+srtx
	7oTauYPuggsAOqo66QRE/0A/8nqfHgREpb9njupneHYMo=
X-Google-Smtp-Source: AGHT+IEOGj/5GYt5c6RSKGv5q1FAx2Bj5ENiKuN45MXsdWwb9WWpzxpGFuhXfg6nzKXbCoUweT0FPKr/eI1SSRkA9Vw=
X-Received: by 2002:a05:651c:198d:b0:32a:e715:7512 with SMTP id
 38308e7fff4ca-32b210c5c90mr8161261fa.4.1749629754501; Wed, 11 Jun 2025
 01:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-2-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-2-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:15:43 +0200
X-Gm-Features: AX0GCFtQrt0tSOmXAtPeVC51VOncRYuyVTgatPuv43T2TwceDlXfbTzne2_RNq0
Message-ID: <CACRpkdZWrUezJpm-RFJ9A-P0SLmOBHVuBXn97gnvjBBnWh5TCA@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 02/15] Documentation: gpio: document the
 active_low field in the sysfs ABI
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
> Exported GPIO lines also have the active_low attribute which is not
> documented. Add a short mention for it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
