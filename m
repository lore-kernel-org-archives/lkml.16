Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1B28E564
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142031; cv=none; b=EyvLbkdnhqHE8ISkZWQfN5Zjab0wQ8U3OkSUwY2dAJ7vzbv6YziWJVxySU/zfxN+nWBs/PP9aCk5t10Y3HnOLoBYtpVHfFyOkqymCv3/8+SapEHVrNKj1gRwdJ9aDwbnowjkCUzQRrMsX9ljwmN5Uf5YCY67JuIlSpa7ynQDnKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142031; c=relaxed/simple;
	bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+ncEkC/AE7qs1NuZh1n4ZRusjyP8FGfyGdnUj7VvdSXcWtliYjP5Yo3uIGY/Knl1Q7EXPL7xvs/kYZ5PnXvCV1fgLz1FT5ocq32WtNrp+dT5jF4C0Nv3rwOEOmIQ9RKOU/l6L6f9ZsQcav0JAomE2TBN034Gs+5VXgIUe0fqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QLDzxz92; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLDzxz92"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b1095625dso6688720e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142027; x=1747746827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=QLDzxz924SVUm0i5grfkNxKCa4GOuzB++lKlQnn2y0A7NDARziTCf3cjsl0QvBPp1z
         POl0WMA2Pt8z7TkRroAaFfRmCSHgzm++WY/mWDC1K/M0YlM6+MQMGf/H5Kob6VLcoVAz
         3SdQlKw7Ww6V94ZjnudJ/VQd/zXU8r/e3p8x+SAVK/uRiQpSeTkuXBMOxLFOX4l9mgU+
         MexX4fzgmWOq1b2GCeOWH8Gop71uXTpKcOSVSNkQvB97zE2+Tci8CB/2JBX5do8afgPU
         YIxYihcBMApkiTydTF8/FQ0uPkaFXdmLHOTAcIoApNJfyVIvRYKvCmtAW1v9MepDAsQp
         /9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142027; x=1747746827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=rakC8otTSBDkVo9v5W6InMUzS4hSwIja5VkGcSDMAj6eYu16YBKkpsm0Vq8b3kw0sY
         p6G0Jdbe92+zT7nycRsl7IIghn7fkuLFWq4cqcEwOlT32+lkLCiYAercZx3aUbka03aX
         hZiAbluw+QBTujcin3o4owkmkmNgnEQJKMFcy832be49BNv9ehvmGBSiGgU/cGfTXHMZ
         ROdjHqV5gP8uYkuySlOsDvEeFEHUcQWgON2qV0G/GWM2WtJQF+TvK2LyXkLlNf6HHWL8
         T9oOH5byfblI1jONwldwuY2l2PVZtoaKnUsqKvsnPo65BYmK65zhFp93kYGmvPHhnmQ2
         xOyw==
X-Forwarded-Encrypted: i=1; AJvYcCVXzdk21UiW74mTdri5iLEGjFofti6ElBweOcehKdHKURxZrxFOezkme0QnDuKNpWMKOMkA+TNOdVla0ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMKKAkg4zwe+NSXkpw+37BAG6m63YyZVgJvc6GfcBFERBwLWh
	kY9U+BRnwyhOA5kHxKuwedSDaYuDUHmjcjItlz97FHpCNoaNN/KgNrIDHKWjDCyNAFb1iinENsI
	aWvJgQ5KzbwzoQa/vrio5lua9sxsZ+GUwtFzGlg==
X-Gm-Gg: ASbGnctqVotzMOOUJFEAn6TEipyX7spJdhGZE7fbDdBy28e0Wh6yGZY2j7iB9bfzQbw
	uekrOow4kTEoX8RjCIZ6dEtnJ1oVu9WCC7O4Ci6evOQeY2HRfAFgl/XE1+Fu8H3HiTzSncdarn9
	ibeuu4UF0wZAXVn+bv07pGfJg4z6ftwru5
X-Google-Smtp-Source: AGHT+IErd1zECtSWmiueqkwD4t5q1dDN1qHnbcMn1cncmM9gOi/5w9TSouYOqYoqxFwgSSQ9wh2aWvhxApgZaMeuOic=
X-Received: by 2002:a05:6512:640b:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-54fc6764426mr5389978e87.0.1747142027286; Tue, 13 May 2025
 06:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:13:36 +0200
X-Gm-Features: AX0GCFtipyG-m8FrUnzYpmqYR7dxFkSgGJS5zK3dL1i48JJGkPJ7bD5UcE0Rkes
Message-ID: <CACRpkdaDiJDoyW18cAsb1JcJvFvrweWKtUbO0=pUtGKbz1GtCw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 6:47=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I agree with Andy, why not just apply this, these drivers have
had long time to adopt to immutable GPIO chip and your
patches are generously helping them to migrate. If things
break for these users they can fix it in the rc:s, and if there
are no users testing these, well that's a community problem.

But there can be some fallout, so it's your pick!

Yours,
Linus Walleij
