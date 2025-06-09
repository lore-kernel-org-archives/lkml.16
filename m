Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349B4223DC5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509124; cv=none; b=ehjvHGD465TtXJHU7JDGAib3obkQlDisvL/W5qqZItYjVOJ0LWvzhBiK+sX7iTca6oCiXmENYViYz1QUFSzUp7lF0fcMmCH8RTrjOgH28sXBB20perMLh5A6sAorxr7Ju5uvsRGspj4pwcxVc6bRMJ6nuG2f9hOjL3nCFydVL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509124; c=relaxed/simple;
	bh=Iq0x5q2nwlvRMcB2qn2pumIsm+x63752VXEgXOhaJCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGBJn/Xk8I4IAxJ3bIGjzRmx9/Rca393MCGMaPkCzfBV78kzOt/OXQhFMnwmRjEY2KCrjyg+3nIsy42wPcb9PppDTx+cozLnLHuXL6/2SSNsKUu2980I1Ha5rA5fkLu8Ec2iRAgwOzK7OhiB95VhowH/u/EbfqMgL/eBG/iEY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UZhS2BAg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UZhS2BAg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e1d710d8so58659425ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749509117; x=1750113917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
        b=UZhS2BAgdnWp2y1MrJb8Abl6UkXMp18Aqa+ZxZDs4FVnOjlJSEqaeRidRe+OUnZe+r
         u0JvcT4rNrekQy8kpFnX+dzOj27lUNEcw3TfkX+5lOlV8SDYdniWNvW6541wQTxQKVwT
         Xpd8/63mVT95n+4IPRt4hHzLl1sIL11dJ0G9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509117; x=1750113917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
        b=YaaZ2ojGdIEICARcfmJiABUGFTCsUEtwZwf+8jMWJqNp7UyBrvIvx736NiJ5cFSEud
         X/IMoupaT3kUJcTWrdn9cOcugC+PjNgg+zbW3Ao2+7SOGDUvLRxUaZleXRzXStpfues3
         TiJXsSd40BFynZXK2dvayZrEHHKVoXjRffiMsnkftoXLhWHFse4KZvjz/q34eP8Aolpw
         UKoCI+TeVTu1BMds2GR9u3xae7XLCggoCsnR50vDkHk+zd7GlhMtSFA9v+tyFu7m0hbI
         n/Etsrudc5ZndK30dLzu8emXocuG7XNxy6Tfu5S8wPvCUpvUbVNO39hEh3cKxX749eS9
         Z3Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUggI+ZC5Vio97W9RKd17+aJdcjKY31AShFvjYVGDXBA4laK0FL6kc8LsIchdMQxHQdl/qARJAsVvJISyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlfnQLMJTZJ8ijbb+8KnyL46kruHtw1qscwRsqrwaR7ZbfmqLi
	4tlnEHJ5u4IqL8Y9vgRqNvgMDO+4xZWeQq4XoLIFm1JE3REpwAtTpkSaTNt2twdMvmMoj9mDIGV
	ywYhs4A==
X-Gm-Gg: ASbGncsXsDQ4EThbyEjvc1FhHbSlNNAMeU2TgMTnJlo7CC1z4eg742mNS+RKdDcRLlj
	THQjFew93BhH6ADuZGWn7xFXKIKlLXmjGc+SEe/5D1sCh31t9RH0zSbqjAgenhUQjyrQ/biqLAR
	YX35lUYXp6rJsX2epgppWpDMBGh7P73Yr8GUYCethw3ZbZLdbYTx3YxKFWIopwaP6HHBipEMd6q
	SZGlxmm6uEIxA62BYFiW3xKCkAjKh6Qj4f0FOy29uHUfVBfNlLRl9Wgx6vAaNfDgALjq07cJdHt
	Mj+zzaWDwBQwOg+jmycBCOuZco0UKvgGU1hiljtZuH1UWAvmdAKJ7Lzq06fzwd8zjJSycOqtwiv
	1wpqnUU8JVWn99xH5qQbhxyLM1g==
X-Google-Smtp-Source: AGHT+IE6K+6ijPE+dksXxp7Oqdxs4k0Q0R0oq4emwgDjccyvb5sKZeMABB3ISbsVabxpNJjW6a5Rcg==
X-Received: by 2002:a17:902:e889:b0:234:d292:be7a with SMTP id d9443c01a7336-2363818a23amr4285065ad.1.1749509117532;
        Mon, 09 Jun 2025 15:45:17 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078175sm58915215ad.9.2025.06.09.15.45.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1261142a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6i+SSdRAoI7hPjB8MNGW1FJTJ2RdMl7Esq9ddpMN17bngDc0gkP/XCsTwS6ZAl7Gq5yIO57VgqrgoKJc=@vger.kernel.org
X-Received: by 2002:a17:90b:6c7:b0:313:1a8c:c2c6 with SMTP id
 98e67ed59e1d1-313a1695527mr399198a91.16.1749509115055; Mon, 09 Jun 2025
 15:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506125133.108786-1-nicolescu.roxana@protonmail.com> <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
In-Reply-To: <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:45:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
X-Gm-Features: AX0GCFvms_bTeu1m1tYJFabPtpRa0hg1AcW21wJUDi4AC8ourQTRpSPGDqEtFkQ
Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] serial: kgdboc: convert to use faux_device
To: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	jason.wessel@windriver.com, danielt@kernel.org, jirislaby@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 6, 2025 at 5:51=E2=80=AFAM Roxana Nicolescu
<nicolescu.roxana@protonmail.com> wrote:
>
> The kgdboc uses a "fake" platform device to handle tty drivers showing
> up late. In case the tty device is not detected during probe, it will
> return EPROBE_DEFER which means the probe will be called later when the
> tty device might be there. Before this, the kgdboc driver
> would be initialized early in the process (useful for early boot
> debugging) but then the tty device wouldn't be there, and retry wouldn't =
be
> done later. For a better explanation, see commit
> '68e55f61c138: ("kgdboc: Use a platform device to handle tty drivers
> showing up late")'.
>
> This replaces the platform_device usage with faux_device which was
> introduced recently for scenarios like this, where there is not real
> platform device needed. Moreover, it makes the code cleaner than before.
>
> Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
> ---
>  drivers/tty/serial/kgdboc.c | 50 +++++++++++--------------------------
>  1 file changed, 14 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 85f6c5a76e0f..d1ffe6186685 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -21,7 +21,7 @@
>  #include <linux/input.h>
>  #include <linux/irq_work.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
> +#include <linux/device/faux.h>
>  #include <linux/serial_core.h>
>
>  #define MAX_CONFIG_LEN         40
> @@ -42,7 +42,7 @@ static int kgdboc_use_kms;  /* 1 if we use kernel mode =
switching */
>  static struct tty_driver       *kgdb_tty_driver;
>  static int                     kgdb_tty_line;
>
> -static struct platform_device *kgdboc_pdev;
> +static struct faux_device *kgdboc_fdev;
>
>  #if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static struct kgdb_io          kgdboc_earlycon_io_ops;
> @@ -259,7 +259,7 @@ static int configure_kgdboc(void)
>         return err;
>  }
>
> -static int kgdboc_probe(struct platform_device *pdev)
> +static int kgdboc_probe(struct faux_device *fdev)
>  {
>         int ret =3D 0;
>
> @@ -276,47 +276,26 @@ static int kgdboc_probe(struct platform_device *pde=
v)
>         return ret;
>  }
>
> -static struct platform_driver kgdboc_platform_driver =3D {
> +struct faux_device_ops kgdboc_driver =3D {

nit: s/kgdboc_driver/kgdboc_faux_ops/ ?

Other than that, this seems reasonable to me. I guess I'd assume that
Greg would chime in at some point since patch #1 in this series would
need to go through him.

-Doug
