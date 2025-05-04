Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFF8F6E;
	Sun,  4 May 2025 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746392650; cv=none; b=ImVe62w/Bkt9CW1DUf35rFHpn+2uVNqSz17iHwnL6F5RMDMMcHLikElKX0eZz/2Ardy/0fXxHJh27s9jkP6NKz90PAex4xzoSzbTNdPvDNYV8AIuexXSpioTRrFX7sKL4YKYD4yAE1n6NMcMlQT3qU8K6KP4h5xOSbW7bLkrCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746392650; c=relaxed/simple;
	bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arS1b+54P7u5bcS0nyKMprYiy4r50vHCeUa5MM+iU8+nmRcPq1Mub2KnTOvmj9r/k3QzY1Ba88DntshtLXPXXlOMBJftzxv6dy1WoK81/A7g9cyo2gSGR/i3QXRG9wlzvOoLmWLKGLod5fsFeQcmJ6/y6wTRDDlB/xg6EG+krGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ihRahOv6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ihRahOv6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so55072175ad.3;
        Sun, 04 May 2025 14:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392648; x=1746997448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=ihRahOv6uvpl35Ofni8Ik4GvswRnuMEIcosdsb9Re7csFYboqbGu/DzU9hWmzQ+Bn4
         FFZMvclxeEVC6uXUy6tfzUXGX5EELbx8R6zRaw9zGwwFXg3ptlA2COzywaJMQcuY0RKm
         6VEAneR6KZxoG1YbIQX8oUmhyySlk18BQSqTW3eGIldOZ8HlXM6jOWZN23izUgkkuVQx
         Lfe0rRUATjdfEdZxl7lOM4Fvhd23Oj9azI5ytMrZ53nnNqk7Zws7+t8QCTeTFdZ0nVdw
         BWVmKQfOyMY934Q+LAZZKqOMXKyDv1aMSllI0hEnd4KIYXRkUfm0FveCpOmfUyrOP/e0
         TLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392648; x=1746997448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o7+bYMOsXfcZBnpC2w64bwfJxJV6GwRFk1jFm33gOo=;
        b=QbZKdOYr/tQLUmO8abSeItdY9Nbw+YSj86Famxgyw1WClfECvaVcKCtXdwiShof4iJ
         BEbJ3V9jeyYL5Aea+3rlXteWkhcpip/Tc6QswM6liIKlXlgTIFA+tFD20cagWVuRdI5T
         RHN9544hAugz7d/in/epBASdWd0PtayaJs2tk93QkNi5x/QND40zCJ9iyBY9KjNySVTa
         g5PLWA0gjN6S4+G6LhHPHVnWraD5xqsEesp5TzlanB4ZKpw4YRJpc8AjYMnOw28MziMK
         +E80FDKqEfpQtH0ekurvbHK+Tu7HWGWwx5nx+h3PH/lldXu31ACc7MZJc6zV+YvhmK4o
         rHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHdIU7VWwj0/A6CUtIfEXm+l+rVyj9/5Mw9KGfKfqN+KPkzP1gvdzoyZ6s3BDNLmcCXXjEcdJdWJS2@vger.kernel.org, AJvYcCWJm20TzJqnTeueVE/2ptlDNiLb5zEBBKSmCNMOp9Yk5dZEnlHAOiPQSdzz3lURBiivFLbZVyeoqm7R44IG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzszg0hOEkgvN7Aulr17mULtNPWxeiaqfil6E9xEyLcB8HXZ9hF
	iKWAWygIqeIUk5Q3oShRrsASDeXQHWUH0RBoyKBFLo8DoA0N+x1eKov23AcEoAq5iafuQ570NOY
	O6MBJcNzJAlAjyLQkZrIFYgjJTJM=
X-Gm-Gg: ASbGncsPWeuoma7J06foGCtX2NXwZTZKC8X7+rzAe7XDcQOQUZo+6mIbcXG68JwpOIJ
	NbqZVPT/hn7HHvnrFbbFKFRfuU4pLoV/EyFoewDJf0WAAHJ3443V//D+j5lF7zNud2UWSuERT+k
	wyGviiywq63FmNFMqktsUpi8Cl648wlTukAghJp2Z+VtrzvFYwYTN6fi4=
X-Google-Smtp-Source: AGHT+IHyW0Ndt2dWKLCX5IHkW1ixcqtSrXB9YBoKdwGtqxefF3YX3XxIJcSkkisV04VzYQvQjJESqa/5NELP+RsPwUA=
X-Received: by 2002:a17:903:1107:b0:224:5a8:ba29 with SMTP id
 d9443c01a7336-22e1eaa1038mr72613585ad.43.1746392647862; Sun, 04 May 2025
 14:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer> <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
In-Reply-To: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:03:56 +0200
X-Gm-Features: ATxdqUEuPW-rw5wD2OzNxnpoTVETgPI-7rkDkzV6eL_44Q5_KgcaUYRwZKj6F_M
Message-ID: <CAFBinCBiVQqeYTmR3sj++E8CqQXSMsOzhafAV0JNgDVR9OU7ZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: neil.armstrong@linaro.org
Cc: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 9:32=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 25/04/2025 22:31, Da Xue wrote:
> > GXL I2C pins need internal pull-up enabled to operate if there
> > is no external resistor. The pull-up is 60kohms per the datasheet.
> >
> > We should set the bias when i2c pinmux is enabled.
>
> So, yes in some cases when the on-board pull-up is missing, the on-pad
> pull-up is required, but the whole idea was to only add the pull-up prope=
rty
> when needed.
>
> So I know the real motivation is again about the 40pin headers, where
> some applications don't add a pull-up and still want to have i2c working.
For SD/eMMC, SPI and UART we have pull up/down enabled in meson-gxl.dtsi.
I can't recall if I have asked this before: what's the rule (of thumb)
for having bias-pull-up/down vs. bias-disable in .dtsi files?

In the past I had to track down incorrect bias.
It gets especially tricky when we don't have schematics and there's no
u-boot sources available from the vendor (I know, the latter shouldn't
be possible - but that's the world we live in unfortunately).
It means that we can end up with one of four cases for the bias settings:
- there's an actual resistor on the PCB (pulling the pin up/down)
- hardware (SoC) default for the pin
- vendor u-boot configures bias for the pin (but we don't know because
we don't have the sources)
- vendor Linux configures bias for the pin (at least we can dump the
.dtb and hope that the bias setting is in there)

That's why I lean towards having sane defaults in the SoC.dtsi (it
seems that rockchip does the same?).


Best regards,
Martin
