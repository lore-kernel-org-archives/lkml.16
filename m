Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE82253BB
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723203; cv=none; b=AUt1MEfTO47c9zBg9QkeuxxCne/vlGFBRvj3/fr5/VpXWQMvCmILdmTHZtBO8gSWRbj+OuoyReKATZnW+MIyhcaXTbSA9xa+Cp6tOmK13aPtetH1v8m+YpZykhYoEp8X1t1yMmcst2UpUuMN9G1nvmuOUf1YVS5Kx+LsrRJd2AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723203; c=relaxed/simple;
	bh=A3HqkW7aDDTHOzi2+D49zHOXmOdStXA0YniMLxFenjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgR8MaFRZCYxw9WolbqSdDqQCwgDzgE/fVa1lwphVM1fOgyjavk+BqgEHaSaId0/CwuR+z1vpv7wp6dhjxZ6k/yDbzVf2UsPLPdTDOtjF0jkdDMJ9cJm602MK3hRRM+l6KInYi4/dvajAsrbqF2/RxysPh3zw4Xpgb6CLakgrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x91ysBp3; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x91ysBp3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1908670a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746723199; x=1747327999; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj8+B8E9Q3QVQEn0PNEcuTgtl8cWzr1M4iPPxBLdmdc=;
        b=x91ysBp3eTczUZsOGhvekx0FtHdooYHC3OEDVk+MyQu2eiXdPi0nmUGSiE3E64oy1l
         D8lJf/qYVsn4uwWvpUtcOD20NNs/kYIsRlQDNc4LFWvNzxJPMXEw5pST09rsnBxXymz8
         fhlztJuKxt3MN8ZQ6m18dJp3ynDQliK2s9sjg5flaPIT08bFVy+q9TGIvz2eoL8tcUoX
         EiwvHiLGhKDMsn6Ep/HpyjRStcYVtq3mGmSrQ1fdMIivNsmUwlh5CGvLft2KPkhKt3We
         Bo97qJcSMTX4jOP93hFJZlr0dd+EChQX+FOBSGJ0Ax4OcrjnnY55FKGMYkCotDaAJKhS
         HHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746723199; x=1747327999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj8+B8E9Q3QVQEn0PNEcuTgtl8cWzr1M4iPPxBLdmdc=;
        b=Hta60UJtjZNbYl1yamv+tOlC6HsKqL08ygPr6ikRJp9pgbaReWknuCkq3bIosmeXzD
         e/8O5TEpYeNXZrjJG0txmpjhPH2b+rBZ1X5K6MdOdrZY5oQTv4s3rSx2OfqkFaOpsJYg
         wQklMXL1/2yy9gHmTOgEW2GkrRMK9rXZUjgpoENRHnHZEiZviDlcMi83S1VFzDlx/NUm
         U05PRGIMxhRlARRGUpetLtgDdE0OhbyZpwafQOma1WwAku5H8ijjaP9Mf0L1E/qDcdrV
         msz9I7FzfShh1AnR04iKm4FH8joIDNDN1wMjqOyxw4jDgDJVs0mT7e3I3k4NBjYA4VXW
         FGRA==
X-Forwarded-Encrypted: i=1; AJvYcCWcmszCD5puMNAMspjLvxpFXisiuzWzC9rnFXXLacpcsXEsEC7iTbQwco3kJW7EwTNd8TymrNkTNMr7y1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYY47uvkkM/M17lwoHBCrwUe3z5o5cb+bEFxzv/IB74ULkYNT0
	3CFPxYRU9jBMb3CL57zBLfbm8Q+sydbniphahaCTFojnMUloKSrObOdFWKtuPSmmf+snKW2YDZe
	GDFPK+Pru4E+81OWW3OkmB88A4VkV/iuPKr+6kQ==
X-Gm-Gg: ASbGnctWDgyF2NPjifR2gG2ZQXJf9ivMd3JUrCrtx6j0M4IYM0sU800uFmCFynDkmSI
	35K8dJAdTnOyfRghBFhbZI33e2zDENDjxVqObk0fGQTqpIudvDMuz1oaG1ouaz+S5bs3mMkwXd0
	I/WLmq1NrkyrU6saU0H8hasDVGXa76/FzqupuoQG5Ywyw/3pJGm61Qlg==
X-Google-Smtp-Source: AGHT+IFIW8hDR5O7TC1wEUAbE0Vso3v7lGrXdmwwMrkD4n+cAV/8DvW1Au0lXsn/gzG4q+JJ+RRglNyRgDqKujWZr0s=
X-Received: by 2002:a17:907:86a0:b0:ac8:1798:c2e7 with SMTP id
 a640c23a62f3a-ad21927d5e4mr43816466b.41.1746723199496; Thu, 08 May 2025
 09:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507172858.5b7d087c@canb.auug.org.au> <dd75d8e7-5d28-4d4f-890e-a61afec75858@infradead.org>
In-Reply-To: <dd75d8e7-5d28-4d4f-890e-a61afec75858@infradead.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 8 May 2025 18:53:08 +0200
X-Gm-Features: ATxdqUFJ8YOAQD9NpygdNcyuUrgQFx9We3w2ZSBc2F6FNDlujAaiMvQxhH91UyY
Message-ID: <CACMJSesSAgQWYfZ0X2wJhzHPv15o0AfBYxXVi79dcZZTqhpCrg@mail.gmail.com>
Subject: Re: linux-next: Tree for May 7 (drivers/pinctrl/: PINCTRL_AT91)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:21, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 5/7/25 12:28 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250506:
> >
>
> on x86_64:
> # CONFIG_OF is not set
> CONFIG_COMPILE_TEST=y
>
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - PINCTRL_AT91 [=y] && PINCTRL [=y] && (OF [=n] && ARCH_AT91 || COMPILE_TEST [=y])
>
> --
> ~Randy
>

Patch[1] is on the list, Linus just needs to pick it up.

Bart

[1] https://lore.kernel.org/all/20250502100841.113091-1-brgl@bgdev.pl/
