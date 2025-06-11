Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B1F238D3A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629994; cv=none; b=GEpb+tabRoPRphnmNb+G3/jlM0URhKfg2z0Jg4Ep8NGaFy/zOZcnLOsq1TmzI+LqufMptx2yPj1MzV+XXMfMmR8BMgKSElWaI5ksa1agB/8JEyPR1ek1Uva3GJZUxzEVNbg2v+g4nG3d29f3+IYOx2og/S80RwqYHnaNHI6F1Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629994; c=relaxed/simple;
	bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuKgregyXmUQCl9eLjfBBQ86WJuQamptOTq6GHeRn4wjRqeAiFkkDkPLr9yRYYt45RGdITwcBXW60ch8v+lQURP2/AHpLuH2AgsLN0cT6o1NBhlMJjdASRlq09j2mjW/YPXGEP9cYwyLZHMX3P685zbXKdPh2mitt9KH5GAid8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYVNdO+i; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYVNdO+i"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a61af11ffso6936791fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629991; x=1750234791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
        b=cYVNdO+iBdl7lFMYlxtfN3cSTEVVMVaI4VXuurg1wbafBjDKKbhAOadS921d7tg8gQ
         DD2vxM8qy82aVZmh9wSumw63PIm7F7B18WKOWzc3xv0ta9ojIM8JWZ5F+j9/Rp+plNPu
         /cUGrv3JoaXbmMnMuBCxQjZN1v65VeKPbdHnaVrWhQbhRscCpR0ITa1KEwrfWKfPUcfT
         uOwXpxS5i49I5MeOVMY/7J54JakACT/+ikgbo5PCNMzDa60mH2awotXbL3SCvJ6OjoyT
         45wr++dXJOd1gI6NSaTF+NofC/NdZi94zcgrJHs/Pq8xdkpHevhcXSOu+XFUc8emp+zr
         qPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629991; x=1750234791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfEUwgfs8vRpgtFT6DpPGWVWSexunSrndMuCTODb5B0=;
        b=QG3doy4yf+/4l1OO3NEVM8yXI5DC1sPyVcuwYqUxi2m/Baj0Tv1K/4O70SuZVitouV
         h9KNRW7MoibW6E7q/seLiJNQazYVxBDV1ZFOVia058GWj3amK7lIZRqw/mc0r7M9XsMk
         Y+GXYqJWQmV5N9vOa/nd/VaxwtnaWHjdVsy7yHll6dkMuPdEbxXoONLPlLAtnMaqnu6Z
         c3lDIxxLuF1nPWpKeNz7FFiOdamerprbriisWlsBI3L2GXAPoktp+iUWYuMOSAiDTqNc
         ftPxN2Kvf7Cq4XzLWQ2vRZxpRilG1CiCQZN1d1avyz2t6q233gOwH8UZ3lBt8OloAWLp
         S2/g==
X-Forwarded-Encrypted: i=1; AJvYcCVKKMPd2r9N9hcuah4SaApDxpGPNUMVJoC7/UfpR1u0RXYEP+6ginQk2uYWNkgkj1QhkKM2sIh2A7Ke7LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAFcNa1k0vrm4ontpWUUU9/ZXExF9P0y87PZxkG6cOL3yqw8U
	q3lSX0lG6MQ7ohyH3WOlXV/5ulPlmXD2JTbPc0QBY2BhkGfTXQSdWyq4MiY9gzeqSaZQY1apJbC
	R2H3PUjX8uNlgwSS9V3CB8ffYDc2m+5gktB/OeukkkQ==
X-Gm-Gg: ASbGnctZlpkO/7JsbXvOpTrwva0zwriovCwCi7I76xD3tBoJu+8igswG0+4dEyfaQcn
	+M9fvKJeP5jrBVnGLE4nXHuQivI5tRlWI1ltGjhkxsK/Bas83ADCH6dsJTWv2PihOkRI07e4BC0
	y+F2J/qCNLCSgKzAOHsUW9BgCSIVoLxvtT1zGXpv9mseI=
X-Google-Smtp-Source: AGHT+IHMZdJely4795VVqLoqRl1qPfYOegXZSf4UrsBrU8j8RAFr7w66QnA5RzWCaH6Axcj2yuZ77PCteBpaqPt4wsg=
X-Received: by 2002:a2e:bc1b:0:b0:329:1712:c38d with SMTP id
 38308e7fff4ca-32b210d2a46mr7710411fa.5.1749629990615; Wed, 11 Jun 2025
 01:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-6-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-6-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:19:39 +0200
X-Gm-Features: AX0GCFvuCs6DGvWhnNuDcjCtZslMdeUGWlm892-ZR1vsS36yJHrr9-BCVMHj3P4
Message-ID: <CACRpkdZOT+SCqMvEv6QsUAPxQ8ZrFv8-ho-NLjmjSC3s_Cw3AQ@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 06/15] gpio: sysfs: remove the mockdev pointer
 from struct gpio_device
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
> The usage of the mockdev pointer in struct gpio_device is limited to the
> GPIO sysfs code. There's no reason to keep it in this top-level
> structure. Create a separate structure containing the reference to the
> GPIO device and the dummy class device that will be passed to
> device_create_with_groups(). The !gdev->mockdev checks can be removed as
> long as we make sure that all operations on the GPIO class are protected
> with the sysfs lock.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Much better like this!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
