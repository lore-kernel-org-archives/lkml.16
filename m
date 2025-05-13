Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B1244666
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148892; cv=none; b=B/tdjyuzPbLfxU+ksiQn2l3jej0EXXscvJA8ii2kCP1Y3s57TCexYVTPbSbxkEEY881e3iEbWxgkOg8E03JpzYw3Fxdyw6x7rAobpxoirGaajBGHuo4kCnLnVSkmN59MWWHZqtlX9CAKDbtT1DbLknYWh/huICgRGF8wgPcUHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148892; c=relaxed/simple;
	bh=cyC24FKRZ7v1DWNmkTR+FPbI5tSVDOpMoBY0cH2e8cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjFQLpzjZ5SHLuRvc9lduNiK0kT3UzKd6bL+efQ4rdc3p7vY//cgTAH7PRbGEOviHaE70XgjWJUzetNuwAH0ArKw7COwpOt7QfeXGmEuQ2sJsZgCP+i9c7CzgluOxRaWBaAz/X4xsm1+2b7X0diAQX7M+L4HNcASwWL+k+3guAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RaXJ8MdG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RaXJ8MdG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30c54b40112so2785077a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747148887; x=1747753687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=RaXJ8MdGfS8YejZwFEu7L/kXgCD6v5p70W0NECUlKt6cZ3Xvfxdj/h1rZH1pbN3vvR
         x+ApH2mf9GnnP0VRi0ENuYWqycvvxM5w1hYBwdrS3TO8ybGB64J/2lMzlL2yNrO20N1d
         9z02+PtIAoMxKD7B9TKBjveo8G5xRlZspbYQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148887; x=1747753687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=GNrjkTQrhU5mMKsJX8N0cHw5oGjb/AA6OTje1axstpL0oLpxD4LnuA7E2cBzzyd5dn
         3ZUKEof0nPF+BZJKbyAn2wo4eHqVQwvjw6o3f04usjTL9KcXzYyjqU/9MM7AZKOpvcHp
         rIJrGIFKMpE4/rq+9qWvyq7Gqct5gIFjfwGyOfDQIvDWpTWDmJZfH/F1pLFY0Qra24SU
         qkgxhpANgiou8j+o+FW9mwp420S5F6KhZLIEPL8Rvu/oGBArxvYdxXBrxzXjttrh1z5t
         46LcCN3uxoBCG+4SVez0u6ibp8I4HlAp2RCta7GxJyOqHLtzVICl0G5PVhIZGI5nHyu9
         gnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDIublMUuYqVIAPbGBesaXffYWWwb/26sj28+VpFVZauwkCjFh2UxrztMV/s1SJM99VpP9SlxE/X03kis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpF7erAtCx6bgqCZ6m2Xg/WvucFc4x7oyJ8RoImgrtiKSuAKYa
	kIXNU9YX/JtvVtR7S2Ab/OqcWspckTdcM7CB1MCrSA6tZcu3yy81dXmrFHuuLvDo0g/ZmXmmAo4
	=
X-Gm-Gg: ASbGncsw6MaXwpOkHQ2GgB7sGo8XJKymU53+X3o2WpSTbtC2Blfy2q6fW4D92BbSw1u
	P5a2mWZwhQXZYlwITGsT/Lti53lB4+CN4fKk2Wclzfdx3nkj2f/BoRboZYFIm3m1SUnbQVLjma7
	YNLjUi5j/c2xXDMFXMU3JxftcI2lLN+NiobrJqnrut9NfvRLYxqM/jdL2KFap9FR5/9fGOg06y2
	zgpDGPoqcXi8gws2JGMaHxXHjV2PAKQcBZ0To66aIfNv1vN6PHjHqzKG39+X/E8qQOsFAwU3En+
	2B8cNKVdBo4yMmm/01HkAK+06IujtdMpIawxCEv45lwiNgEn1fe2XqVj3g9CWc2tSSpkxptJcHV
	ZFSK/1+Ajf0Go0cZ9ong=
X-Google-Smtp-Source: AGHT+IHZSypCtZx2vgmJVKCm8F/Qf5B0UUAOmMCRLp1kmksnqfBnVfF4QXfzPE/L791yrjKiPIs7fg==
X-Received: by 2002:a17:90b:394a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-30c3b909ab6mr34545195a91.0.1747148886696;
        Tue, 13 May 2025 08:08:06 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b23519901f1sm7391616a12.68.2025.05.13.08.08.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:08:05 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fbbf9c01bso47439785ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlPQtsQHexywJp2WuuAipwOAS+GIw4e5h1jsjspD2E1+jarsMtHFeMcXcE3HTPivCpdRJFo9JYJM8/4aM=@vger.kernel.org
X-Received: by 2002:a17:903:2344:b0:22f:b327:a720 with SMTP id
 d9443c01a7336-22fc918fe81mr229546365ad.39.1747148884248; Tue, 13 May 2025
 08:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com> <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
In-Reply-To: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 May 2025 08:07:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
X-Gm-Features: AX0GCFs4uZMLXjCSAO0m1e3AtYaXg0I7KL7nfpg18FrQ59BKSujflfXbgJMJkH8
Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 2:27=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Dmitry,
>
> thanks for your patch!
>
> On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > +       /*
> > > +        * hog pins are requested before registering GPIO chip, don't=
 crash in
> > > +        * gpiochip_line_is_valid().
> > > +        */
> > > +       if (!chip->gpiodev)
> > > +               return 0;
> > > +
> >
> > I really dislike you dereferencing gpiodev here which is (implicitly,
> > I know...) very much a private structure for GPIOLIB. Can we move this
> > into gpiochip_line_is_valid() itself?
>
> I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
> can benefit from the extended check.

Any chance we can get a solution landed sooner rather than later?
Every time I test mainline I have to account for this bug or my device
crashes at bootup. ;-)

-Doug
