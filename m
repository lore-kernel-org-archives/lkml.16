Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5FB24E4B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688612; cv=none; b=TuZr9ijiWGgrGSLl31iwQ7+6frH7RZOeIWvz6cgT6elAACSmu+APwimaN+l8rm849iT2pMck1i4wVX5eUkIXXgO6qLOucryzQx61sadsZ4KJQnPS2DbEjELjX2xm3jZiibUkvzanGGdk8ZLspZPj8gmmrDHSQKCCZDkolGvBq5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688612; c=relaxed/simple;
	bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU6VQHIICgOLRukgRMKRfLTdhc0oWpbGYYiF/v/VFbxeWuzwXURMN7wSfcq2gmLtg9o5pgqsnM3hMog92nVFtXU/JmS9kOOg3yQO7PiJfqsIUxSo+c6fPlpM7uGNfnnvUrWDNXahYoQm+5xvBEXA1LcRuRiE1XiF93+WiV25DKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gnLvg6sS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gnLvg6sS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db2c2c609so8936211fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743688609; x=1744293409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
        b=gnLvg6sS/676/EWEUTXuLojLRftFFoGXwlZsb4uMzhR8XYCPUXE1kNfzGx4+sfcQyg
         72QEWNvUc83iXaOwVuDlHiWXmjepK9NKhMoU+cK0AB8C0kANVBLOBgZ3EBUizzK3EHaU
         0WUsgR2XozY3eGZMyvVU6b9+TIR7OENrsWyV5ScgoQ18UNjJ6OH/FCatZIG7Z6xR2cXa
         s3JYlHFfGfWi+2szzC7du3PrJLz0WInrsfDh/k8XnMfs0wtq+wQi6rQLPOe5CCZRA7cA
         NamEVCDilZUfzQeir90wLEbTErKRTroIvOTguFoLY9YpxtAtQx/iRjdeR6kRHGrOELER
         JPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688609; x=1744293409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL1Fbgp526X3IYUv3jqvaisXbeRKQFXoMWoQUDtRM58=;
        b=QndFNOY99IKt+t5XbabbKGWSTFV5VVbaNK9Hpdr0Mm4RA5eQ/rPTk+3rJeUzoIAh/e
         ttpL6+hiKk1iuRINCdnmoyvq9E03ur25oAJ7BhIYuIaO6g9vkbdIqBUHjKE1j2dCpP2K
         C1ndjTvrKuTJjNLMUfl2VcHBXaP1OQYCAnx2DONsEpLoVD3AqMy9LIGDcFVy5Oh0XiwQ
         0EpIfLmohfG/iYBbg8NmnT2jLjvJLwa7e2sDysb1uwPNvp0AIkPXz79TT9hmgbkKVDbo
         mkKpqNmAkfS5RvuWeg3smOEudXKJg4KDH+DpyGj+AFGNqsIQU5ZB/ux9Cq7KfH2B5DL6
         w0TA==
X-Forwarded-Encrypted: i=1; AJvYcCWU9F2m1NoYIgP/V8FPL9kzAsknl4dvJuxTA4WGjHEPxQyUd7RFf37bNUdCBLBbZ4C/4aRRtgUgNbSm+Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHn2LSI+1N8UkOgxJMfj+IpoivkcVgXj/7vTHfbvy9PS/UJz/
	3+Inamd+7T6R9hblqwy0HdCKYBMyNsN/AMEcV1Kkaj/dcEUE6zu59s3z2Y/cz4F2KEukRzREqkv
	p5XsONSyuplDLNu2q1NXBekSIM4tbgicrEcuYZw==
X-Gm-Gg: ASbGnctgi6d9gPu6g2ur53VAS/7CG/Gp+Nz7RkQxiHOqOe1xQFEcA7nZUN+GpqD3Ftt
	fZUC4vCY9uFUeJxi7wvmdgqfT44xb3ubznx1oby91xVq/eyDnAeRNIDWEnOgPD3LQomHkcnEBvT
	yt8PQvvq2YtzuNOpN3vdQwbWi7oHEE8Co10zz4EBmqdXq1vVGgE5Au03MA
X-Google-Smtp-Source: AGHT+IEZq8E9hUMdI8woaEMXoL4h1fGDLU3IWtKUPdoaZP6pLIF3F/ze7rrIOIyIeiS4I9dFtpAdyL29xHsoa9HtLBw=
X-Received: by 2002:a2e:a106:0:b0:30b:d474:12d1 with SMTP id
 38308e7fff4ca-30f02c0049bmr10396971fa.30.1743688608736; Thu, 03 Apr 2025
 06:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326173838.4617-1-francesco@dolcini.it> <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
 <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
In-Reply-To: <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 15:56:37 +0200
X-Gm-Features: AQ5f1JoNS8eoE-Q6tSfDVMvkGBz_l6XQrBcrR5WM1qQ5o9XFEN8_s2-duQ2N2l0
Message-ID: <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Francesco Dolcini <francesco@dolcini.it>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, 
	stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> +Cc: Geert
>
> On Thu, Apr 03, 2025 at 02:07:05PM +0200, Bartosz Golaszewski wrote:
> > On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:
>
> > > If an input changes state during wake-up and is used as an interrupt
> > > source, the IRQ handler reads the volatile input register to clear th=
e
> > > interrupt mask and deassert the IRQ line. However, the IRQ handler is
> > > triggered before access to the register is granted, causing the read
> > > operation to fail.
> > >
> > > As a result, the IRQ handler enters a loop, repeatedly printing the
> > > "failed reading register" message, until `pca953x_resume` is eventual=
ly
> > > called, which restores the driver context and enables access to
> > > registers.
>
> [...]
>
> > Applied, thanks!
>
> Won't this regress as it happens the last time [1]?
>
> [1]: https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM=
+cdgSSTNjpn1OnC2xw@mail.gmail.com/
>

Ah, good catch. I'm wondering what the right fix here is but don't
really have any ideas at the moment. Any hints are appreciated.

For now, I'm dropping it.

Bart
