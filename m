Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA5E1E1A20
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206634; cv=none; b=XFZQeF64AbWLjGT5KvuzIVmcls9XMOnpEQfHOBmge2MPpDpfWqJ36KXVVjz3O8aj6JNTPPcKJ7f7kCLD3bJxpO5DckKrueYBPQm0QbmNOAF0xkKepH2rp5Nv01Gqx+u570bwpACzydlFPf+6FeN+8h9YMrwrB+M3eCvwRw87mv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206634; c=relaxed/simple;
	bh=/B+EwXmyrRAKb+rC7ELavWBH8AzZRPfvLMfeSNf7qgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb0s4EVPB3lT1uO901/VKmqy3H2+lDNltCb4OWV4aUqcI8ppm+4zRAeYsUbVLTYGJy/xBM7de90++2P4kJhdrcLvYfbtVaXN/vKRZAGPQfleHUfW9hzBXF4X7/LEw/pMw5UuWX2fPssyxrJKMFqlkK+LbOb+9ovFytDvDyHk54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-879467794efso3698647241.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206630; x=1747811430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEdCTK8Ua/3Kxw/UlKLJuxTv51uEZAV3qqkGRptSF+I=;
        b=SqcMV4VsWn07J8IL75rOFoQgTyHNzN/Sp5GiIs/UoF+9GZqcaDhyRRS2ZydHn2U6FE
         MtJEXAkb+DT/07Dc/QH+MOuNsnWNJ7Khc+pd7ixhWER2dJLU9NsBHI2cDUmRdq/O1lBJ
         WlHQWF5FvqEIt3KCM2vnDu7FRWF7s8MPPk4ssD4CPnXSav/9HuZIZP80ArF+j5ma6IRS
         ENVHU60xgDr+SmfnWHibz/Mfafk5uS6icQAnFNFlTxC8M6elc3ux/ZHFxkmuoCbtQ/rg
         9M1CSclOFBQTZUNU0pZK1pKD3aPtJMqyKogvr7Y2h1hBN9CeJPcaH4dAKlD5B53yHpVK
         asTA==
X-Forwarded-Encrypted: i=1; AJvYcCVU24kIhogvdX/vWU7k4AwUyVG97/jHJ8Ds/Bmxc5Gxk/DQVPrQVvrUv+XjXaTD7DViY0zssjviV0a/dSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIJJlhJCHy/QVI9SFiWD1UEm4pS/vinbrQBj2lTr96vfPckidx
	b7RSZFkVV6goExRbHHBlZA+CfQT/9KfQ8cMBCf2vAFOXz7As7B8CHqbsq0X6
X-Gm-Gg: ASbGncvFmWpN4z/x7X2+oa4/EfJBrUTgqDK9eGVxF6zfEQAj/FI1+e8h7s3e1BHu5gx
	ovSr4GqL7LDEPCgV7p0yYzmJGpB3dsz7H37V2ELWWcVA35/vh/K24roCRoOG6r5EIiAonY49UeT
	/dLrb+p3WVvZK6VduVN/yu+rrKSYUvohWnObyAtziddH+GePAUgiQ8u4r9aYiExSbyzMIyzjxCY
	1oQWvH3QIzel8aYTHiV6gZW3p3JLGkZHG2+OgYy1BDv53vmvQRsaW+yLctyGbvlVTua91pbuctS
	GJi+GzI6PwFYhVJv8L4PAutn07e0Whw0wYd/PyOXBpHIQsTC4Pl5MnGGOqHva4G5fpdkkiC9gNE
	Oi2IV98Hy3P35khcjGQ==
X-Google-Smtp-Source: AGHT+IF8b3l2Hoh5XBKHxXkI29ADP3Wek8DeeBYNYlX726noSyN+NDSpP7XT6a4Hd8NH8TztfTCszw==
X-Received: by 2002:a05:6102:4a96:b0:4bb:e14a:9451 with SMTP id ada2fe7eead31-4df7dd3fcbcmr2168213137.20.1747206630547;
        Wed, 14 May 2025 00:10:30 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb2016d30sm7893611137.21.2025.05.14.00.10.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:10:30 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52403e39a23so4303232e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgc88MsF+uT12axCP+mZevA1Cu0UcggjgqWIqOLRQVg+r/ZewWBaI1rO2GhAax1SRbKUTLp/XMcoSu3uQ=@vger.kernel.org
X-Received: by 2002:a05:6122:8c2a:b0:52c:54fc:745 with SMTP id
 71dfb90a1353d-52d9c5d8acamr1925737e0c.5.1747206629577; Wed, 14 May 2025
 00:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514052327.96537-1-siddarthsgml@gmail.com>
In-Reply-To: <20250514052327.96537-1-siddarthsgml@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 May 2025 09:10:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxDPDQVwx_9Z6ngvs4sYro3cobE=YP0y-b0zs0ody2vg@mail.gmail.com>
X-Gm-Features: AX0GCFtFiSkMy3thsoXl2i-HHS-GqeqxowX3AK-tXVsLRnHiROCSZrI6s0ya3Vc
Message-ID: <CAMuHMdXxDPDQVwx_9Z6ngvs4sYro3cobE=YP0y-b0zs0ody2vg@mail.gmail.com>
Subject: Re: [PATCH] m68k: apollo: replace strcpy() with strscpy()
To: Siddarth Gundu <siddarthsgml@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddarth,

Thanks for your patch!

On Wed, 14 May 2025 at 07:23, Siddarth Gundu <siddarthsgml@gmail.com> wrote=
:
> strcpy() is deprecated; use strscpy() instead.
>
> strscpy was chosen because the code expects a NUL-terminated string
> without zero-padding.

... which are not sufficient reasons: there is no size information
about the destination buffer.

> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

> --- a/arch/m68k/apollo/config.c
> +++ b/arch/m68k/apollo/config.c
> @@ -218,7 +219,7 @@ static void dn_dummy_reset(void)
>
>  static void dn_get_model(char *model)
>  {
> -    strcpy(model, "Apollo ");
> +    strscpy(model, "Apollo ");

include/linux/compiler.h:197:62: error: static assertion failed: "must be a=
rray"
[...]
arch/m68k/apollo/config.c:222:5: note: in expansion of macro =E2=80=98strsc=
py=E2=80=99
  222 |     strscpy(model, "Apollo ");
      |     ^~~~~~~

Please try to (at least) test-compile your patches before submitting.

>      if (apollo_model >=3D APOLLO_DN3000 && apollo_model <=3D APOLLO_DN45=
00)
>          strcat(model, apollo_models[apollo_model - APOLLO_DN3000]);

FWIW, if the strscpy() would have prevented a buffer overflow, the
strcat() would still cause one.  But none of these can happen for real.
>  }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
