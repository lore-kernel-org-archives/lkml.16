Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0856253F0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031728; cv=none; b=EWk9jhDNQyjHFFr6zYEN+Ketdx9uKMZXdcWWAWLQDCGnf/4C/OgkQqSF8oHe2FB+lA9GZpzmq+PAofQ+k2XvDjwNqYgU52P2E09pQHx3ssm8Bg3G0LNZ1GbDoBqmZ9ssg/v3aERzJ+j6KbyMgB8QEqI8fv2glWUah3V7XmJg2QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031728; c=relaxed/simple;
	bh=HgYlzcnLJ9b9/mpCUEd5T6pQNP655u5D2bo0QC6XM4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGPLdHMY8EFu+O9irQ0BdRq8JIZVkT87t+856bOHeAsoctQ1dKFOiauV6rdWRwaoxz1TFltLJIx8kRty2W9lSwb0InUdcoLq1/IVvjHCWdhOKGRfVKn1HjBz1eHj8CwLduHA1b0uu+ox+9ln42uUqspilG8Qd+4DM4EWGEY8Dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OREqnu70; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OREqnu70"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b1095625dso5259796e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744031725; x=1744636525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjOh7XzZGVY4R8MmVTia4KQX1z2/N3OeHsPkBIQsJrs=;
        b=OREqnu70ZL8CBgn3ojRabwvpHhTUQoobpg+ra+hOcP6rCtuzOtOgBj+MD66xoVJgrX
         SB7x2THEIobkS4MmoljEPnZwqjm1t1YQOZnqUAYeWS/AegPLKVxEJzdhtu8XQVz3lhQg
         k9cfNu6gBAToeutnDR7wfZbC4mdr3SFPMHt7tUQDdnPC48BGQ0qQDZh5XoVDgdhP3kyz
         2MROhLX4hw9C7aKDIMDh8RshN8P+O78QWkklSNEpe95ocLruzDS/R9GzM65K4G5Cv3Di
         GT4JxgY5Ft+LORhg1/IeV0jpdGK0ov83HruyNXNrMlBgyLZ9mBnApCFtKySQUhY4Mfwi
         O7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031725; x=1744636525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjOh7XzZGVY4R8MmVTia4KQX1z2/N3OeHsPkBIQsJrs=;
        b=JjXMWIM+OFs2DiadLOWmELlkkW+7dCcl1FA1kzjKZPCisHYC18TkCg5ImjE7R+DuQT
         NZX5DD1Fin/HjtrSJTIMqUBofXDfO2uCkGTRJcJnvRSMoe2UGWdbmS1OE80RhCEMAAr/
         2qrV830zd+L/nWjiq1CEzhVdDu3jZB+N/Gzprqd8QEymq6C4zIu38Uv5kapv1vHplkmV
         q8ais3NR64ydgbj8FTGpJb4qIQHS6GjRhuEM/thi4Id397joiq8lu4+x1TdqY1HzwZzc
         0Lq7UmjpSzqXcMZSsZ7HpfsoQEYtq29iwHD/TZITTg5XyYZ0qUy38hH0GQ41C5Megb8n
         jEXA==
X-Forwarded-Encrypted: i=1; AJvYcCWzTuwjN36nO0uGZkgMrdh7r1/L8kaPbROzKsCwzN61UJIT7+vREF0HzXjH3gKBV3nzq1q1ixX4LIl36PY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqF2S5XkImaR4M+nMgMtpwzCm4ojqAEgRHC4Ckl9oLauUSmENL
	2jW0CyWDe20qdDmAPh0/i/024Wvo7TzTG2oG1n6o33reicw2/xs1RiPUfwuGoSm0n+xyoI5sq7n
	RWcWjwnZedkefwFkAnKuC/OVTv9eeMCKuATcLRg==
X-Gm-Gg: ASbGncsETbFpv34Xvvp+R8naljtXyg+lQGk45xGyBbQAtR0WRqgex9tLQjFERb8+Xcx
	HgqjHVxE286h3dkjF3rhhJGsPRoS+1jibG8g+eCpZrJkxR9+o74N4pXOC6xxEMEQEMSi/GNtVW7
	YdFZWplghDcF87INlEkSQ1hZmOtXZwLqzm0ctLhG5WE1nZ+sj0xUIa3U9CgQ==
X-Google-Smtp-Source: AGHT+IHGh/udpIDf412kVmxk8cC6uRbVuJQNw0qJ5UZ+KPEK/XSf1l3aNBgq+8C7/E7v0WR/Tz7A5hPNiTW4JagzLhA=
X-Received: by 2002:a05:6512:250e:b0:549:8f10:ec25 with SMTP id
 2adb3069b0e04-54c227936a6mr4385760e87.31.1744031724736; Mon, 07 Apr 2025
 06:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
In-Reply-To: <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 15:15:13 +0200
X-Gm-Features: ATxdqUGTMDclH5TnKhaYhwXEVKf8DzhgQCWQOa-7tBSTsQlS14Edzh1z_6W0Qgc
Message-ID: <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> > I believe pwrseq could actually be used to hide the enable counting
> > for GPIOs behind a faux GPIO chip and the consumer would never see a
> > pwrseq handle - they would instead use GPIO consumer interfaces and
> > we'd have to agree on what logic would we put behind gpiod_set_value()
> > (should it effectively work as gpiod_enable() meaning: value is 1 as
> > long as at least one user sets it to 1?) and
> > gpiod_direction_input()/output() (same thing: highest priority is
> > gpiod_direction_output(HIGH) and as long as at least one user sets it
> > as such, we keep it).
>
> Like I say that doesn't do the right thing since other users need to be
> able to see when something changes on the GPIO.  If that just happens on
> normal gpiolib then that complicates usage for the default case since
> they now have to worry about things not actually happening when
> requested which doesn't seem ideal.

If I understand correctly, regulator_ena_gpio_ctrl()[1] changes the
GPIO value (even if it's shared) and then notifies regulator consumers
about a DISABLE event. Now if we'd be implicitly sharing the GPIO with
an enable-counter, we could possibly emit an event that's a
false-positive?

In any case: I'll allow myself to apply this series, as the
description does not define a specific approach to take and instead
just allows us to track the rework.

Bartosz

[1] https://elixir.bootlin.com/linux/v6.13/source/drivers/regulator/core.c#=
L2607
