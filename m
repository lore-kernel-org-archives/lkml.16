Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B6328C87F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296557; cv=none; b=hXY8u+MOPt/TvrzwdB9v+z39KYkwnw1ncKVtL5S0hryzr1QmQ2XhQlqpkgEklkH5/cNHEOkWH4HbgL+EWuXJ8+aZ0rrHomxCN+uDuPOzoVVCt7DorXowEkeotIAGzcKEFO26bU275kJBfB1sCJGDiygeBj5dMlAH/4p/LACvwTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296557; c=relaxed/simple;
	bh=qUjuLTmNcbaEXQsGgwDbeTL7U1+S0S4WiD49WjSD3hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvGj228UXvv0mosGCsdwHP/6tqRyRGZEV/PrHTwv0czGQLcAjnD3v7eRylOAB/yAf+mAvxB+9fppjnhZc7Nxpq2B0vNb5Wku7rNUF5/RS5AqjUN+aAbwHGoCwzNjfnLQ80r85GQAkR9Z2eOI46ZfS7tIfxJXlu7dL2tTnfyDJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a4o9yTwb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a4o9yTwb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-555024588a8so2301193e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751296553; x=1751901353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1AOLwFTOE5XzMvxlxFognU3FkvdviGhVUSRhoNGQGM=;
        b=a4o9yTwbjw/bm8Kx8RyJAD4oIxxveHQ7YiiMEO16uOk3A37C63lU4l4rxH126fG1IS
         q6dK0fHxizluJARSwuHiBIvMVuzEec3gjkG49vFEWTCTuU9/xRweVSA47hUvEFYWbnhO
         4EpIyDlNxsmxFkMyMEdWfZT/zvQ2/qHoI3K0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751296553; x=1751901353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1AOLwFTOE5XzMvxlxFognU3FkvdviGhVUSRhoNGQGM=;
        b=Cqu/yZHjuDKPNRr1PWJl85VvxB7z/YYOXcfFAYYVfcfGsBkEc52OodNfjfzlWHOoPR
         gFP16y12QoLoZpUhbLRwmFVnGDxGdPrhmN/qqq4xRR9nq4Fzvk6oWw4hWiEf/beuFB5b
         ZavvrLjGxn7sVkdkYvKMUVc9RtFnu0cPYpGQuTWYsY0nsKqvFbh8LO0/fqghLxziQd+v
         8ECkAECEArAcRSjlDQ/j7RoL78fwdntacj8ZvxZgOrzpVezRxIq/PiA6mtCIEf1jkgy3
         QW+WGdPRiERBzeHekvetRv/ERU1Av7OhmRlQi24FEKP68d6fQ2FHn1MGMYxeKptlr9SK
         vV0g==
X-Forwarded-Encrypted: i=1; AJvYcCVz0uOjZPU9Dsyheir3L/W7nkUm0B/ylgYGUmdCNq6aDiksV3HtOBIjZ9stfsT+NsPsd2umLNuWb/NwK0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQueMsR5bOktoXWVieSfSZnqJUme8BWI0A7aF6gL5NIYr7TRF4
	r11Q2hIu24gVmH5fJPrEeW6ZBRPqvQMAUrncdAt8+qFTw3tpVMdHMTe1yWyjpInQjBz2a6cUOdx
	e4yX/SA==
X-Gm-Gg: ASbGnctM2X+xGHJ9x3YPRHbz5rDuRfoiQ0OeB1DIOy0/YFBAU/E6HleNhX37Djr2MDW
	I3GuGyZXER+J1kkXEKoCOqIOeUO+NEmJURyiKLzJuqiiGO1pzD4CnDbvL/iqdbNzQdRBUF3REx5
	Zo/8C+HBybya0DvmtPVqftV3lz8irocpmz1lnLypuy21a4G+HlkZKsbhTgGVPacKwJuemHRMYgP
	U40Ku7H7Mtr+kDv7K4GNhc8BUCuhE5Pq0MJE/Vjj0vl6XTJu2wiWjv4gU/XA1pwRTz1cLO/GG9s
	zDa2ZFNERipeLVsjPFiWqsV1gJUaovsNg9KaP2WOzlmmhVf99ryIR4SPf8wucUAcU2UC5i4JZ1c
	54gpPnUmm7c3SjcWDGhZm9zEb
X-Google-Smtp-Source: AGHT+IGRDqxV/Tb0X6gGk8O/+s8a9JSh1UWgZG37BfEoGUypmvz62GZoNAnRFcA66+kxxlE8h8tReg==
X-Received: by 2002:a05:6512:2396:b0:553:6526:82eb with SMTP id 2adb3069b0e04-5550b87b083mr4272847e87.14.1751296553255;
        Mon, 30 Jun 2025 08:15:53 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce7d9sm1440594e87.176.2025.06.30.08.15.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:15:52 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553b82f3767so2464874e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGbfmXXm8KDS5wSLFqoBfXzN9JirCWJllTWQ0O7fgnnAngG+ESok5j18ooSZwnrQVUF8CmynWltSEbrC0=@vger.kernel.org
X-Received: by 2002:a05:6512:3d1d:b0:553:2f8c:e631 with SMTP id
 2adb3069b0e04-5550b860cc9mr4540604e87.9.1751296552162; Mon, 30 Jun 2025
 08:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com>
In-Reply-To: <20250630150107.23421-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 17:15:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
X-Gm-Features: Ac12FXygYZhncua2VSpYRf_F0i2gDNxE8CXtvpMAoS-xI7uTpLX06TMihRMBcX8
Message-ID: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Desdes

How did you trigger this build warning? I believe we use C11

https://www.kernel.org/doc/html/latest/process/programming-language.html


Regards!

On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This fixes the following compilation failure: "error: =E2=80=98for=E2=80=
=99 loop
> initial declarations are only allowed in C99 or C11 mode"
>
> Cc: stable@vger.kernel.org
> Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 44b6513c5264..532615d8484b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
> +       unsigned int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>                 return;
>
>         list_for_each_entry(entity, &handle->chain->dev->entities, list) =
{
> -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i) {
> +               for (i =3D 0; i < entity->ncontrols; ++i) {
>                         if (entity->controls[i].handle !=3D handle)
>                                 continue;
>                         uvc_ctrl_set_handle(handle, &entity->controls[i],=
 NULL);
> --
> 2.49.0
>
>


--=20
Ricardo Ribalda
