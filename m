Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852519CCEC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743657567; cv=none; b=iaHQd8MZwpVLKyXXQFGEUf4cYmJOAe/M0FtTA42lRLULgGC++bEDpzOTQy9kwIymRtY26VG+/XA+uWRA6t6xJFbERST2CKIwnJlqGFC7WnGzZU9VKqdb2KUL0qqVplZW2YikA4ahonkoigtBRV2VF/a18+8ViQRWGfASDKX6v5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743657567; c=relaxed/simple;
	bh=LBDXDYPwVBltf6WpjfM/sVy0wUZu9uYUl4MhDaGqzfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei5r5IzzAhRGCpYFKJ/fGmCcuXZZj8CzfxPOmBkfVZT/0QU4144htHMx8CoDdNaAioDToQIX2eaTcFZpHZhLiPMrqJLi/Fs/waEiZorDEn4yFQwB7kpQ+FkRTsSSVlT3xG/Ein5SIGLcaOC0io05Ufy6cOy4qDEK4lAHyXzrXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghAljArU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghAljArU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so991410a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743657564; x=1744262364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E+iZYcCPNYOvmbdSSEK90MoKd4i8WPkQ7UDbg2N7Zw=;
        b=ghAljArUUHmSELreDfX3tn7tx3zHeoog4HEriQipHK4Ugjg9OUFW3NwD9h6sVErTil
         Y61oL2P9n7Jl7oqaW0oZ7Ljg9oZZw5nV8dqSeYmsrHBoPNrWleBEX4678PHsxVzEZOY6
         OKTkgJOmZsmEB9ehOe0Fq6l+WXDtruSz3TFFJlU9q859STGisG6mzl/hZTxuJhrGgBwG
         zWhKexbQi2Qw1SJg8+2KTqJusNEsAV4iqEtero4FSl9mRClkCbKx9QwMdocVziQaMmbO
         n0pY2cqJmMfcJ3kkPAnKD0U9deVtnaH2T3yCmT05xzPW0tgWU6GYCPJ5ZiMiCiVdl5AS
         VpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743657564; x=1744262364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E+iZYcCPNYOvmbdSSEK90MoKd4i8WPkQ7UDbg2N7Zw=;
        b=KFXcKr83LYAVQ9q7QfTxkwPByPtwSW8xmY7HcG+Xzhh3nz2wVmhRnDuZWPNlvAGXsl
         cZ7j5C5lk4s2LXuQVir6V4fDpsl/vSvzOfUXUUIqAakq/8mGi8jmvD9WoqXnltfoOhZN
         cxBVHb0rLU5p6e9/dx9ejn9+G1YeBbWJBa9wLSTtI0aOXzt06DuhPqWWA0cxFVOE5D2u
         s5nPxzzcP3jJjjTurys5XYTyCpcejesLWwiq50WaesQXcgkMcs/Wn+DbA3oqI+V9pmF7
         wq2XTUKSaSqLGZFXRuqvWaa1SNwBsaWIsADClLa4ePXv+PKZ7ZpPhuscmAIfLsWTIixe
         asEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK1ODfPuiqy74tMgh3VS7BeLHYwE4OORZZuyFNTHt16OCFOqLvKGSWigw8RR05A3RvOshSCziZ2HyDecI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKY0Oi3GHBqpUtc1/yPYcOgauZ308zo74up3WQEABn5csQcnz/
	rTM254Ocqh9mAk4ZmLTevalo+qx7EDobxa7yeB40gHI4MCLZ7tkzMve0YfzuXBogad1e9R6l9VU
	L3xR7Q3on7Kt4aCXvPysG3WiRc5w=
X-Gm-Gg: ASbGncs3JrL86R/56iG3B088Vh+okLCuLBkWHdUhBFgfltWoZWEkWHgB4u8thluVsOx
	uAY3Eb67gy25d11SkrJxA9pg6bbgBf8FXx6VZx644tjMHXhv++k2yXNf+cJ4hMZnyZxa4o5L4Lm
	sPzOuqvcJ1PSIdokzMSLvODNlZsw==
X-Google-Smtp-Source: AGHT+IG5EbBLfk+a++Lf1d8KLuWy5t9OVqcVAdEepuVcJDL9Q2EPpXL8y9V/ZJv+B4xR2onXjAG+ZpfsrPoPmqJ9TeQ=
X-Received: by 2002:a17:907:7d8c:b0:ac3:1373:8a3d with SMTP id
 a640c23a62f3a-ac738a01edfmr1554380866b.20.1743657563398; Wed, 02 Apr 2025
 22:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com> <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
In-Reply-To: <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 08:18:47 +0300
X-Gm-Features: AQ5f1JrAee71IeO5RCFI5zeCzsyf3Lq4mvs_EnjRXEAk6UlxP5mxjnKIxryxluA
Message-ID: <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.

>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  drivers/staging/media/av7110/sp8870.c                     | 2 +-

Please, split this on per driver basis, as they have different
maintainers and trees to go through.

...

> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *d=
ev,
>          * if it founds something different than string, letting it
>          * to fall back to the old code.
>          */
> -       if (cur && cur->type !=3D ACPI_TYPE_STRING) {
> +       if (cur->type !=3D ACPI_TYPE_STRING) {
>                 dev_info(dev, "found non-string _DSM entry for '%s'\n", v=
ar);
>                 ACPI_FREE(obj);
>                 return -EINVAL;

This change is good.

...

> diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/medi=
a/av7110/sp8870.c
> index 0c813860f5b2..8c5fa5ed5340 100644
> --- a/drivers/staging/media/av7110/sp8870.c
> +++ b/drivers/staging/media/av7110/sp8870.c
> @@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend *f=
e)
>         }
>
>         if (debug) {
> -               if (valid) {
> +               {
>                         if (trials > 1) {
>                                 pr_info("%s(): firmware lockup!!!\n", __f=
unc__);
>                                 pr_info("%s(): recovered after %i trial(s=
))\n",  __func__, trials - 1);

But this is not fully done. Why do we need to keep {}? Just shift left
the code and remove those {} altogether.

--=20
With Best Regards,
Andy Shevchenko
