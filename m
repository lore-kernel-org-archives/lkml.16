Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42931C1AAA;
	Sun, 27 Apr 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745746578; cv=none; b=mZLEcYXsBjxLK+CIhVFNGJbgLC+l2LjpfzzpI0VXPc8D9nF0FHw/aPSAM7qh3gm1D6OmttsC/enYXzA4fFeGhhC6ySP6xQD1DHZ1lwM1D8gVO7ppHj2bCwU+qjsZfiBCvdh1IEC2qFlkTSk59rN10LxtI/tJRZ1Q/XSpYNMYb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745746578; c=relaxed/simple;
	bh=MdAzOBzJ96CVTG/k+zrYOIKxEWgopRH+Nsp2O2nItI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjqnbqTbkOSVL2o2Tj0sJnwQWT97DHyjMZ7nvJyex/wzlgvnNad4s+5A8wUzNgR9fuEu3KBhBKDY/xcjck5o3MW3NmkYmXX3Q3FClW7Lpo3R+TKJ7PDPqJH1EYYfukTIMX8THAHTt8igTxaXtSBaEYASrSNvlN/CxrZMGLatpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpSA12oI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpSA12oI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so720184066b.2;
        Sun, 27 Apr 2025 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746573; x=1746351373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGzuohvyvvCrwS5zOnEccgXhaNKdly9XzL/s3vD+/6M=;
        b=IpSA12oIbKaIbfvlgQesrzjvqb6HCbgmEMc4n2ef7WR5sajeYLEdInwuiHpjrg6dF3
         ++a19gEHMhyaSuCln/rY59lUBPGibnyw/8epCXmRn4hBRl5SYM7Cjs7mcqTeQt+Ke8CB
         LaJW1FwIYT6JZulq+DZHEGkQC3C+ikaYqaW/d8lnTO2Amoqoptfcbbf9bR1Yw819W2mq
         Vwb3xX0cWEL6pKB1U1ilXaF3bZGUKY634vNisU1oN9U+ZJnKnXOuJiDk1dBHGs+Z0QTH
         LVF9O0gUPDgiitA+Bpp+wOaCUnVFSpF3Q1bUdbC4bMgKxxASXh7+kpg/BEhoqSPmVqYj
         JXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746573; x=1746351373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGzuohvyvvCrwS5zOnEccgXhaNKdly9XzL/s3vD+/6M=;
        b=Y7n6/UDTcbLUQN7+tqiG1OUJOaXMwm//OsrmOzMhdADqmlocA3ghHGhjGajVj2+ATz
         Xn1ImQDKPKm7nmdKDHq+YSKLgiQ7xfrTq1HzF2J5tMr6rGP6Cl4SFvMDSD7RAsSIob6F
         r5WCOXr1UBvYH9Rw+en/5CDpxtqr+5MyQtTPlAOi6T8co56XpaCb3jtNxMFnjbEjsrC1
         Q7TaUFHat2NQtFNHgEGlX4GA/2YnLHQJKu6OSMiChrFZRx3QOFrZw3mXunq6nAZZIH0E
         ahXgAAIW6GUmRZ7TvcAS5Fs71A6WPK/Ee+ADQmCyJ4LyJU73XG+pJpy4TbvCDfFkFXPg
         XdqA==
X-Forwarded-Encrypted: i=1; AJvYcCVT0tk+wbKhVrwWjqUSa4z1+lQYGUYjK5/jhK/G+nQvqtMvJo5ybXuFYdsGbUeXS1p/oLJbv5LoyHBnvzkd@vger.kernel.org, AJvYcCW5rBOGBHQxSJPSc1f2Qwnhfv0+Yg0J8IovhOAg2wK8jr0X6+o1+ypqKl8Bbx1tkxs/6GC88WXsZb3N@vger.kernel.org, AJvYcCWA7Es0fNeiAAjJdkvpCWG/SkinCwb8gwaxddEfsqNZr+xcKL/ONepT1bsbhw/aWYvWaqzB4oSrDfLr@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOkAu1JM2cScW2bvIhwFgL/i//O1JJvoSB6PFF8d5jmyKR09H
	DPbwrzzHCS4qXhcBKcioCsHafBm8rQ1IyZN8sjyEECpZDF38KV3nOUrm2V/BmDoXq3R01+Nw/5g
	I9tImmr9yBz6cZyYsyEc5jGsBvZM=
X-Gm-Gg: ASbGncsFnELAmOQ+9ek5XRBjcV7GXa1L3F/vgJNzIozpZArXePEHEh+RONH/WZU2ZBa
	QFBouEsw2foJ7VM7o5/DTNVbvHGqLTfYpwbBItZefxvg4Mq5HlRbkHg9tz3+MJndv2CbagP6PVr
	/bg3LSSD0jjKnh1bfaGM/IUw==
X-Google-Smtp-Source: AGHT+IGoMZeNr5qp9wE08uyFjEL0FL5TyWGe8HMPsjjHQFeYThqcDC1gvwy6V+CCzAKFcw66C1iNantjGyqQ4J9Y5fw=
X-Received: by 2002:a17:906:478b:b0:acb:aea9:5ab0 with SMTP id
 a640c23a62f3a-ace73b1cd63mr635799166b.39.1745746572690; Sun, 27 Apr 2025
 02:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427082447.138359-1-trannamatk@gmail.com>
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Apr 2025 12:35:36 +0300
X-Gm-Features: ATxdqUHZ_-HZyhqiJ9dWL2SAXfBdPhoDJFCF5q7xMB2DoNABvHtVkjCzw97WyVA
Message-ID: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 11:25=E2=80=AFAM Nam Tran <trannamatk@gmail.com> wr=
ote:
>
> This patch series adds support for the TI/National Semiconductor LP5812
> 4x3 matrix RGB LED driver. The driver supports features such as autonomou=
s
> animation and time-cross-multiplexing (TCM) for dynamic LED effects.
>
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
> Changes in v8:
> - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> - Move ti,lp5812.yaml binding to auxdisplay/ directory,
>   and update the title and $id to match new path.
> - No functional changes to the binding itself (keep Reviewed-by).
> - Update commit messages and patch titles to reflect the move.
> - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-t=
rannamatk@gmail.com/

Out of sudden without discussing with auxdisplay maintainers/reviewers?
Thanks, no.
Please, put into the cover letter the meaningful summary of what's
going on and why this becomes an auxdisplay issue. Brief review of the
bindings sounds more likely like LEDS or PWM subsystems.


--=20
With Best Regards,
Andy Shevchenko
