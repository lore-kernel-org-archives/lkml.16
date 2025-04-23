Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C1928BA8F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421328; cv=none; b=ZTjcRcmINTGzjucetc31osKxe9aqoi7web1TCn6elobFaQRHVEcME9lE7gAxxSj0qWFfeTPiAYNIRai/kObxOCx80kbQB3ZFv9cQAu61q+95NDwn60AyBFh9iOZdKhFRpaRmO4pT9mwo7Zab5tafUCsUp0f59A2dvn1P424FPl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421328; c=relaxed/simple;
	bh=9qP8bXqNzUsGoFHt25UAqj1MVWphgl/sd3HC87H6/es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcc6MLA9AEYrTW/wHH6BX5yCilhKoGALwiyaWksanuoKgdYvsTScPJPoTUieVMLyYK30bqZ2Ft5Aa1mseRyPlH1V73gg7Gj97T0ofLLGkYfJUtj2A82HSz+/8cbtpD5jPA6iyRqdwwkIYsQHgftHLkOIhW6lkTWRfqpK+nthkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=corBk+v7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="corBk+v7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso364841fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745421325; x=1746026125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=corBk+v7lp+Nn1UPXm1gxwChgFAarMS3O1PaLhBN1llNHLHIrEQbKDqkLPIhCU1k61
         mBSmb0advBlh1YpGDKW+J2ne/5dSCGOL7IY6BAd7NRItCyWu+VQ1JGhozb1xy7v+cjCR
         jckeHJgAMOK26Plg5KTbmxDTgej0HbmccPy6U/YOwQnuHW3YoxFwtfgp4DpMUgljxniB
         0HK5AWmnXE+TGZgtjqIKUrGneL1RMI6J+YAO97KZaH5ZgliGsLz7Ak4VemkuXrsaoTjn
         FxpiNQQ5RK+MtNyr4GJ9As4fFLb+Zmw35TH80RBxGOyS0h+9uuGqdW3+hCgHUbqUNaBC
         uOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421325; x=1746026125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpCh/bKv5Ai6XWwUzIcH2XxVQsTuQk3BEgJo+HbzPHE=;
        b=v1tUhptsC30XxapsnTYbT5eq5pNJt96W1a3T4HnBKptGdif+29u59DCJ540oyPDCEr
         IznXI4YJfcWmIOTYsFWnzBkmsSacpUhSPSKIZcZ6tnf/4u37Kose4UzuWdHdxMNKaQtX
         qP6Pj5FE6612SOjuwMPRbO9+9axHcnbLIqwlhJEHY0XlKlBiXs8I7HbtouIu5zWsbGRa
         ojyUKjoQGzmtedRHuPWv/wLiq6+TCterJKR0b3UsP6XYh335cuSk+hVTqP7iY0+8wj8p
         7NWDYS1wgCGpk7Xa4dynLsQN2RvX7C6Fy63tYRP395cxyfXwSXBZxSdQzTTuQOY56Uxj
         aE4w==
X-Forwarded-Encrypted: i=1; AJvYcCXvKu83vWpSfD6VlpjpSC/4j+NvJNSXVaYmUL7GElrmK92knHQ118jj5CLzxKU9vEY2J4wsYoNh+mrIzS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfjSe3LuaB07xfS25YfIFTwxdltKxwMfftfxA7Imd0Hz6yvZK
	daTXEBlNzabup4uN3ZVc+OeuzA7C5Lz6IivW5x5MhHHY4WqcyfMp7OsHopfSmRvZkLohdfQ5grE
	znO2g2uIqyB+YvhAPxY8mOivZe4YEx+VdQKpqRQ==
X-Gm-Gg: ASbGncuH5qb/txO0yL37rx+VW4nnxbwby8YYiY+AX95JhOmEy6lcxShx6sOHJduGBP4
	qU3tPcv6SKIaTPzPUgOpCnPvVArCcV1/WW+diAoO0rkEpc1vn9y0th/xCXg3exKn6xNkD8iFCjC
	OUwhcEcSVqX447n9vxZlGa62COVUxrUOVFAyttT8jylRBt/yscGK8viw==
X-Google-Smtp-Source: AGHT+IEb1jIj14pt/URZReGGb6TRkHRFc9RO4pOYfh9JBEeg/z0nCu7x4tQD9PqcIWoruPNTpnessNuZbjek65SmGKg=
X-Received: by 2002:a05:651c:1603:b0:30b:e3d9:37e5 with SMTP id
 38308e7fff4ca-310904db169mr55235771fa.13.1745421324677; Wed, 23 Apr 2025
 08:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 17:15:13 +0200
X-Gm-Features: ATxdqUFDwggDqgtKp-q1Zc5o_6PU2EcjPow6QZCYfHjlH6VvpL_4JmV6numGqXk
Message-ID: <CAMRc=Mdp55VX543rXmLtMHF7sCxojcs-3BqyTZu7NDMzbTqVog@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (5):
>       powerpc: sysdev/gpio: use new line value setter callbacks
>       powerpc: 83xx/gpio: use new line value setter callbacks
>       powerpc: 44x/gpio: use new line value setter callbacks
>       powerpc: 52xx/gpio: use new line value setter callbacks
>       powerpc: 8xx/gpio: use new line value setter callbacks
>
>  arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
>  arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
>  arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  6 ++++--
>  arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
>  arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
>  5 files changed, 24 insertions(+), 13 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

Gentle ping.

Bart
