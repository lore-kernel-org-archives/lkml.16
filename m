Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116D28A3E1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897417; cv=none; b=WQZ9wg+vlsWVgotWg4dp0RZL7MJC3E3pB7sLt98be7ZwVDeYwGQh7jBPdAlFFLk5neep086RumcybIQYoOlPKAFJqRjt2BpyYfxd2fqOsAk1Cw4N77cJzSXkkrn3Fm/gNn7dyISI5PQudHTUrxbOUH5NDpr++LjlEA8w/ncMaFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897417; c=relaxed/simple;
	bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxB73KFyRROGE9o0Nlfx1BQxIp3uan5psXsDfDb28FIWkJA70HFAzibHnrYi9tMJ3qYXTrDMNYm16BMCvS24s8CeBf07h/IaWs573gYszyz5X+7F3L+5TOnxskT+bHvrLF02I99rDXdPc7FvQe6sncjsaP2xxXSN+Q+ncfD/jXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CcVHe1eB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CcVHe1eB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3439967e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751897413; x=1752502213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
        b=CcVHe1eBW5Il8shyKuCnU53TYwm6HDy6ZCTzRUEqtqPm8/twsFfpMHOyq1zJkghian
         IfmVkwShz4vXJIzw5qc0ApSdTJ7mfAK3Om+00d5/l+vFGUDcoEeERXOFfvUjSUMU/Wje
         8ubSCeM4YYOI+VtBUG2eN6o9BKWhq7C7hpkjLAyABbbIqG3EL5SR88fJg4d+IStNCjtL
         s03o9TZIpZkMgXlM+Vc7H697uPvP7X4GNXoL1klbPW6uydL3hEbEsP2AW51/F3anNgrg
         ms7dFUjHu6fvjkEsMOdzLFvqI3r/Rv6zfVJfvqcU58mLTBKL0I//5wpLGcWD1Gf9ilW+
         Qg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897413; x=1752502213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EKy8OWDu/kk+IOdCEHz6JvP1bsl9DXmz3k8KmwtSUM=;
        b=GvUtDwFYnLnUDye8AAX5e2eo+q16WXTzqmdmkuBDS93qlRe9LOlCBQHHiSSfyZKpLl
         GQj8lUipBx3va3UeEd7d1M5MxZcKZHGbb1K4BK40VbQt6uA9DrkCS6VtMYOJFQRTqr+0
         jNu9qg0tfe48ufoV3etoIKaHW/rMeEPlSB4+GIXcs4Fxj9UZMVt2fJe36TyMY5YOS/QY
         K6BhRmCdbtJ0TW2BDDJc+P1IcGACVBJmp+oSzjan3DBK9zCRd1qTHwG69fj6QI2wQAZ3
         Fhj74o48A09iPQ2EzSb5Rq67QkGiD9h6N4XKyCuxCR51iKH5HJFKx1pJ3Qd9ATysMK6+
         sHOg==
X-Gm-Message-State: AOJu0YzheZvsWrvn56ufNRnM1IBVO+vSyvyh6Cigg36FBwQ/a1T/nZ3p
	AHqIZjoJ1/ITqgVefvsnb8dpO6IkOHNTJBpsp/bx2q0smlqstBcfbkgYdfj4m4S6hFwz85Htmsv
	gsrpz/w3QrY0Na2EwmHygHCGiVSzp9vlS7Bm1k50vbw==
X-Gm-Gg: ASbGncvUPGPY7d2+imvh0JQ/E2kImkTr1CIjTiRCgF0XSKI6yyB3KB8TNWPjCDd1OjR
	UgP8rreu2z8Wu/sgcUGEGpFJ4gANOF0Qt0WLHbF65yFhFbp4Q+IoM6AKfL+IZT1Z3lqd5hvkWHd
	E1umzbv9VpU4zO6B6dgLx8V4v5tbMhbbfJjzc+h4IDNjycm/fk2MzwGpVkDx9Wc9VHt5m9aRYzN
	9g=
X-Google-Smtp-Source: AGHT+IEudkGxYOWe2+f4vh68RbqDeQkBlljYbLjupYNIzGdcIQYbR/jo96k/DRi2F+evajGdeiOeNW2un8mzxkixgxE=
X-Received: by 2002:a05:6512:2528:b0:552:20e1:5b97 with SMTP id
 2adb3069b0e04-5565baa766bmr4193592e87.18.1751897411791; Mon, 07 Jul 2025
 07:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707132154.771758-1-marcos@orca.pet>
In-Reply-To: <20250707132154.771758-1-marcos@orca.pet>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 16:10:00 +0200
X-Gm-Features: Ac12FXzeP8dFecAIWuU6N_w7j5kVAxaP-9W4N40Z12Ew1XkhPS-e-xEDK7nwJhE
Message-ID: <CAMRc=Me5dfNFLS1qF0AWgg8sb_vk9J=d-JV3-C5xWv7pZM+sFg@mail.gmail.com>
Subject: Re: [PATCH] gpio: vortex86: add new GPIO device driver
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:22=E2=80=AFPM Marcos Del Sol Vives <marcos@orca.pe=
t> wrote:
>
> Add a new simple GPIO device driver for Vortex86 lines of SoCs,
> implemented according to their programming reference manual [1].
>
> This is required for detecting the status of the poweroff button and
> performing the poweroff sequence on ICOP eBox computers.
>
> IRQs are not implemented as they are available for less than half the
> GPIO pins, and they are not the ones required for the poweroff stuff, so
> polling will be required anyway.
>
> [1]: http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_=
Reference_091216.pdf
>
> Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>
> ---

Hi!

This patch immediately rings alarm bells in my head because the chip
is not registered with the driver model. It's not 2005 anymore so I'd
need some more explanation. IMO there's nothing that makes it
impossible to implement this as a platform device. Could you elaborate
more on why you chose to implement it this way?

Bart
