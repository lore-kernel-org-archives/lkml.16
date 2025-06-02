Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBAF13AA31
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854905; cv=none; b=uwlR6cjfaWkRiBs2rZWAlKNnV/shFIRk69adAR+LxOlOvJ7AW6/aRxhGdPyzEUu0Qf7o2xVu+AqYRweohxXzwZ9TOcK/yvETOva6LO3xYZX1geFm9F5KsFuJedSrj/iZJHrjuI6gewPnDe3d6wormqMojOT7c7uCNJ+tt2B8+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854905; c=relaxed/simple;
	bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDV6FTIWHEE8iP+aVk5M0U+Ds5IYZO4zbLOux5WdlVJ9FFSiSAl83yGYmtTYgdHKxY14lVgVUKuO2jDqcJU1CtLTWqSfM92d7DA0jejLgAgVoUMKb9gWjrt2sRfRVMJCYdFczGGFpmIImzusircaV32gSxYCLtGN54oc23oqO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=odW6szYp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="odW6szYp"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5069681e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748854899; x=1749459699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
        b=odW6szYpRI3EmFensdcwnVCYi3yEt8zG78135qjRh+kWAeOxi+PI9fcLDXoUgLHh9/
         sn2xpJ69JWEH2caRUD9kBJBpD+2dRXElfYtJKYZSBU9HqA1es1/vKR+EeMJ0s2zdMmWe
         yxUnHjEhlWpurBd7Eh2iqcZPiLac5jzSXrocSRGzTzLj49h2Q4VbTDswE2MZ+38XsZ1Z
         xUqfRfbVFnIgBr//N1HgTmwiAzTLWMGRah77WftglTRCBbsxQc9YZzs1MqSjG5A8xwjR
         XRHtJH2kQOxsGYtwrsVbFprGW0u69kaFLQ1iuyv/YdiNOy0sBYSCeb6XTAM/YSC/WK3r
         SaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854899; x=1749459699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L/HO89i91CBOEvIwOi6CpU0lXjQdG3dUBRaVby2iuA=;
        b=Z0CzgxDM1MIeWhe+4wl1Q+rdoqMUoQiTB9eK4/IpcWUqlSOuGuIoBtRaDlOtExKswY
         T3Z5/OHcqmR4MhbG9WpHiDZ/WJkBR4tXGx5vBF23wKut2PSaC/u33NGhHppi8GHM+7o4
         p+Hy0pOTXsI+lv8gVMsCEq4YTYtCYOTGY8jZbXAklKd8UwjBG7YeZDo1/So9eyPTazTl
         U25Es2PPu7YxnL/4JCSBQZgCw3PlvN4pJH74LSdzi3FwT8O6kIAXC4ueAsdhpklvLO8+
         KzPMlHvSnv86ps4B6r4KU56YDoGC9H3GtqzGFtf1pbaJnLNWpcEypwXt79yI4IXciplI
         Q+5w==
X-Forwarded-Encrypted: i=1; AJvYcCVtFJhHDNAAer+OZLXFmMUxbsD2KE/21YmbrZ8Oh9bSRlyoU4o7T29CfDp7l1L9GjRESZF5UTGJSZvySR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyP5sqc8Q2/X0v+X7Zttae7+Dqy3LrL057uq4RNOCkng/OsEfF
	2Z5hhqyUQWJBcNMzrKgcZ714Cwab+5CPW3JAXKySd746n8UdLs//X/555QQK7NeLsnkwLIZC0/4
	d2fJSjXZxHt4oex3aEZko8VsYmzn8hc7AMCF81xI/1Q==
X-Gm-Gg: ASbGncvVaQlRQNphFLE8aiQlhgrL5I89cZ1Nh+w7q+LPaGfWp5ngyMfZxFhGj3hATnA
	nOJgNGNlvFvPGwMULY5kXBGZrgp/a94ecU2xHdbBf/lyuHXkUAqZX3Lgrr0jrZnPm7CXSD92+jw
	/c4Lz2YNzzj42RPpPFc0YLBUfMSISUYwZphgIr2NvGq3Ia4SBEBEY0t76vSp+Y9rxP
X-Google-Smtp-Source: AGHT+IF7JzftWwBtbdxn3eRdY2g5R0ABLfyCCe/FWeTYczv7PUkyVOJRx3e2k3Y8Pc2+u0CtYYyLp681MfBoTrjlx1c=
X-Received: by 2002:a05:6512:350e:b0:553:2bc1:e26d with SMTP id
 2adb3069b0e04-55343183e70mr1314549e87.46.1748854899308; Mon, 02 Jun 2025
 02:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522-gpio-palmas-gpio-v2-1-89f209d4a949@gmail.com> <CALHNRZ-z4+a-h4GZepODbqcmcPKkvGXvX4wpJSinr_gcZptjrQ@mail.gmail.com>
In-Reply-To: <CALHNRZ-z4+a-h4GZepODbqcmcPKkvGXvX4wpJSinr_gcZptjrQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 11:01:28 +0200
X-Gm-Features: AX0GCFvQfCgbCs500n43zWgfaAQRPWyohpTKwcUG4tS-dFrmVzQQCaFyT1e44NQ
Message-ID: <CAMRc=MdJ91n1TU7gaiwtQiKFZXKEFwqyNHzhZcw+qXH4KXBdKg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: palmas: Allow building as a module
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:44=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, May 22, 2025 at 5:22=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The driver works fine as a module, so allowing building as such. This
> > drops the driver specific init in favor of the module macro which does
> > the same, plus handling exit.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> Friendly reminder about this patch.

Hi Aaron,

We're in the middle of the merge window and you sent this patch at rc7
(too late to make the next release). I will not be picking it up
before v6.16-rc1 is tagged. Please don't ping me for at least 2 weeks
after you send a patch nor during the merge window.

Thanks,
Bartosz
