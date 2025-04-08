Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E42219E99
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103054; cv=none; b=CC3ISohcvgp9Nq3JYkL7eDY3XQPOWUWuxqjPxrVIJlN91WkPgsT+FLKw8yPdZJG9wI9kI8saGaIbdhdxvB77qpUkcVfKuL1zzLHo2P5Blj8o4dJ4jwedSPzAKepshJGzRqwaWoySGBf4+xoMlE7arXvyOBhzGP9Kci9tyUEAC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103054; c=relaxed/simple;
	bh=n3yPhKBmkrZrKNmGGkYKVNWI2VnNkodGMszFRz7nRK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtqN4DEZ6D8aBycOx3Mk2gNB6BS8k9mai6R9xNiTVSBUYCvgdGj9iJSXoHaTeXa6A+YGOQK3RKKn7go4OCsihjZw3OMkWAaZeDh6F04PXaCPSi9EcWKeI17ZhoJFWb51UhemIQsLOMrZRlL7jJsP8X8cAnLHkKePvhWcCaDbawU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QD72MVim; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QD72MVim"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-549b116321aso6082653e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744103051; x=1744707851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=QD72MVimVL18kNyZqWYZ65q0JLA0IAAJx4h25n3YGjruMeQ579ZnBItiigguRReXR/
         LbzwEJoFvqmVkV2BC2lbfHFimpKoUTPOQc0/9Ktu83X5OhRSR88JuFQtVBJyncFvel6M
         8nsHoJiLX3J+/BKMHA4E6lfo3SnJ4bOB92s28tAUUZndQrVGv4ocewJ3Uh18b1VO1TQU
         qug8G13AhM5vI+zFz5moQvPUKZZNVdI5p+sp9O0cuNTWYDMzf1ga2Vgg9ym0BqSrd+PJ
         UNIe7/8D5kIq3zd0ZTWtcp9Jfz8WnSSS8SEiKwcY/su5VTUNhCmChsKnVdU9opF0cIfi
         Qkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103051; x=1744707851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKT5PB+I8jgGburlz5n6UrHfPzs2dxAk/yRT6NP0dQ=;
        b=ahAE/gtzt2cZpNFFtfjf4iHOIYuu+ZhY6JmiViLVQWkLk7lJxFvXInxf+hTkXxVbBb
         wBG+lKqsli3jicNNwQZBeaWKKeI0vj1VFz/RCJLKO4iqZVPMcft9HoswP8ObG0K2V2Ok
         vwCTmdLTn1JJ+PWFjm3bQ95nIZN37gkVuG3iSQYDlOnx3FJkfrcwP15gK3BwhInIeK+p
         UteoSL/Fhah3g3JdaYcg0OeWI2tPgmX7Na4HDq8QpDUorRkx4J10q2zsibjePswjW9WR
         IuXC2RgUg0yIYCfZe4cksq/HlTOB+faApJvqm1L6KirezUtnLI2pQ8zXfCJrxA0Klk4W
         xNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5m2H7iMXHej+InDMehS7PYGwbqBJA+3lVB9CmSorEM1y7bJtz+MU6pe6uy1E0hg04ecTsDaFvNSbQcGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFePdwIghG4JbyI89MBOKRbyiZ4ywZP2nwj5nPHr/dbfSlGvV
	EKv47bk8agHkuoto4sqzQE+zStHe5z04JU3BAacBPRCfNfqzVLhMmKoIm058j286dTY3IjuH7DQ
	pyRe2py+lJF7ixSNgBox70uCg5FB6UM/bNnQvdA==
X-Gm-Gg: ASbGnctjXiTVwR4/ue0o0bVrJJ9HBX+HfsCWCdp+ODthk1vlHxd7J4r6+DQBlR1p5hx
	4d0ZwghEYh1CMlJ39h+Y9P89o3iiZTE7cyrMWnkQESbgzNujxGmZHglCklGD73/VsCczPXCH/pJ
	dZdjZMO2rbEjiz4Ek+KZTV91Q49RgXHj9fS+UYBp54p9o3kancO52HvwqYXw==
X-Google-Smtp-Source: AGHT+IF2WUkxm68ddIms01ocssUC4e0WNcZHFUed8nlsJd3SMfdqBt0sV6DP/H5TRFqdUI/lrkaIskfxxDirqwxdZyw=
X-Received: by 2002:a05:6512:3f16:b0:549:8c86:9bf6 with SMTP id
 2adb3069b0e04-54c227dc869mr4261598e87.39.1744103050753; Tue, 08 Apr 2025
 02:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org> <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 11:03:59 +0200
X-Gm-Features: ATxdqUGccJrFjcEWKyhVa646awyIsRz2HGjGAguvah1n6zT984GzRInZSF_52-w
Message-ID: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:08=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
>
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

This doesn't apply on top of my gpio/for-next branch. Please rebase
your patch and resend. Patch 1/2 is already on that branch.

Bartosz
