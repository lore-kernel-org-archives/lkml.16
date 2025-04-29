Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D2D1E25EF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952206; cv=none; b=g/00U6n0D0eceMHBPN2hocihtETuvixmB4cAemE8RL2z+pivGa3nSOhFsqKL4dXRMymF/I29cp7W1yXMiUN3fFZXEk3nugxrjDLWBdiAHYJ+VuZHxZUyTKPfdreimi6nWYUyzL+ZiBIGqL2x6K6bv4xB+oWvRCbqP9az7JUgoxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952206; c=relaxed/simple;
	bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6B3GjbHbwY/C5Di7J0ZIv0ZXgbY0NICYvLHujjT7T/4S4eymffKNe+CCnWxE58QCZCbWttviCuEOHt1lkjwLcuRD8cMNBI6myK/UcIGrPsxLa36ffRPEAdzzGVAMFSV+L+AqmERqvWBaO+jwCqr9zzfNZJgdN2gEMA91LsFifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KOqFom8e; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KOqFom8e"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30db3f3c907so61120681fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745952203; x=1746557003; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
        b=KOqFom8eHb+vQj2eGFSmi+wDJmBDCm/4QWc2IQ4ZXLxzvS88gnMSAZ1y1ZdGNPUB01
         lU+Iu7OG+cl2vvDw72+gWT2wubM2pxq8LLhDlF3pcTWYRTCw6vDtXFLFTHhgy9UXiEfz
         hXY06mUnmQUQJo2Xe4LxRXuGqTtedNipVQhtqQOh7UDi+Z3e7tfZU1ntTsC4b6R/ZfSu
         vFBt1IDvGyz/0bUVzcxRvXydzkUkKKAoHzj6KFzNtOZ+X81nUYUHceINOCj9PpvZVxoN
         d+1APMhCJRsH0e2ewsa95iKPfxAYVNb6K3qo8cOPMTGI6Osa0spoEF/htfBcrcCMXF4Y
         rofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745952203; x=1746557003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeSc/5BZh1t4ldehBk5tJa7zSp0X0x4lRUAaopaKMhw=;
        b=vX+AJD8EO2a3ZFVBgYeIp1RIf1+jNqeveaNuUgaBo7qe2Y9jux7nx21kahZS9QyWd9
         DV3YuKk6lWug+P7A50m+0/cGdsf4MnbzR+SbGw5P49Z8NvlY2EaIk7shQ0dWCdS+deyA
         T3cL/oCCMGYnQHPrxHDfUShoFvUNTklqCx33mCPnCZULBnXrNIcLUtyii5cLcw3+N2h3
         55T4pyLQGQN6wgyv/dZpPwl51HpunVyx9iytpy1+iMS9pV7PVbsyuiHdqEprzUBvq/3l
         Tg1cW1PkUim/rYxwerdO87BKwO2mGIlIadcBck/atnYasjzorn6Cvh0lwvOh9gHPLbBy
         wIzA==
X-Forwarded-Encrypted: i=1; AJvYcCVrgqmoebAmQwe4YRuDB8FX8vaj8oQcZF5qTd1IV/ilSAcD4NctG8MW1jVYzPv9hiC8+enILnvspl362Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHrYPlwxjJYhYkDfJ2dafp721I8QYZjficxGursgO2ioypISH
	sG65Fo029eSZgD/z0B0ugYo3vFEtD0SQQg1yzTjWCalSgLG/FyjcKwt4g9tkBFqiBxuHH71cd0G
	fKdGCEXTGpt+h1emgYv9/Y3V1mUvKa2q3q0AldQ==
X-Gm-Gg: ASbGncvY3rTNGvMhV967W7DWcDJy4R5H4M5ysat1xBzJo1rRi36XGM8i9lJCO7yw/tt
	oNNXjPb04Iws6uCMt2/QniUBHEgzaK2WpuesoI8l5QRe/jYvzBgw21iRfm0MxUx2rIbSXJLInKl
	N/wNuQ8+AHn680Kk16uTdxaiSvX07zSnvcFgVQPR/opdm9VPrflMQcxY9Ae+CxqiZB
X-Google-Smtp-Source: AGHT+IFW/CX408gyWrfHMdOwoequNQf7BFXdXPyHUXK7j2OMhS6KT7GwMmG2rSXP+wTND/kT7QfmLTIIBSLCzPUbzV0=
X-Received: by 2002:a2e:be9e:0:b0:309:23ea:5919 with SMTP id
 38308e7fff4ca-31e6b2c6f0fmr842631fa.31.1745952202951; Tue, 29 Apr 2025
 11:43:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Apr 2025 20:43:11 +0200
X-Gm-Features: ATxdqUHJnz3Fduuh7qnUTYN-WgL5KpZt6syl8lZWPYRMAPtml8GzwrHvYI-U59M
Message-ID: <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the fourth version of this series.
>
> The main change is the way the forwarder type is exported, now gpiochip_f=
wd
> is an opaque structure.
> In the forwarder, a valid_mask was added to track registered GPIO
> descriptors, and it is now possible to remove a GPIO at runtime using the=
 new
> gpio_fwd_gpio_free() helper.
>
> Two new patches were added, the first one to remove extern specifier in
> machine.h, the second one to define new helpers str_input_output() and
> str_output_input().
>
> Other minor changes address Andy's comments, see below for more details i=
n the
> changelog.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---

This looks pretty good now. Who should take it - Linus or I?

Bartosz
