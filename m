Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D54174A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320088; cv=none; b=aVtFs+GF3OIQe1ahcC5xyS6JsfW5jAYRk8CrKhrRIw2C+AsT3G7r96WRYNQZw+NJV2iwbdj4WA6ShP2PlOVa8uCTK9u1TQwktUsgb1kNOSLvuVeUzE76s68ml2YP3PEzmUgjHbohuvKydyqFcQJOtxQHru5duPaq4MMyIZ4syrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320088; c=relaxed/simple;
	bh=GGCOO8gh5v0IPUWTOSMFV9wtWph30MpxpFMkOXzoxLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMw7pPGNoR7FgYHiufbpaSgUaYuDMtmJbE1W8AAm3L/73KE41woLL5JwhNV/ci97DyrjT3c+4HqkKDd5FOmzByxnngZvDfyl2XgEua56QkQwVVaw5D27EKNU7gHt8BOxOrpvlztSW8J9OXv5UZYibu9QlAavGY+yfBpkuCjhPKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn8wWBZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn8wWBZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83823C4CEEB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747320088;
	bh=GGCOO8gh5v0IPUWTOSMFV9wtWph30MpxpFMkOXzoxLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cn8wWBZcZBu+50/bI/vML3S1fJCIyBkL1T5LMigT8JuRaFt+fM5ERuQqXDVv8tT3X
	 wk4XXIC0c+TJOdbSOFB2+hnMo/V9jJMqtK+KeDe22bV7gf09//MoQldgdqvopEEsEk
	 wLmJz3vB2bMIugqgAWIkH0/iNJHUMgRDEhzwDY1fjJ80dTbx44jqZsjBr4ynZdfNoM
	 spkWZcD8XCerL7ZBXkm2KjErH6tUv9QKLTiXIGrfGU4O6aI57fXaydz3G9RD1Xr0i+
	 O85NngRl2yLMawFCzNPqNt3QUiMxsH8ZIWC32UGjMLJPuKcKPzvFTotAi7A7mMj3K3
	 xIye2U8ReWJiQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-606648c3f9eso375391eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:41:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YxT9LIAK4kT5AXBPNHecbFq6hcGOo+9vdpaQ6EgdWOa4fG+ApGT
	nR7eggOJ/blc+o7hyS+Fzk6TPqWKZHj3s/PEtoJh4iv2lZOt+C8L1PIGijZxwpSgdGouT1ulnr2
	gXfGPT/vANrYSNSNgQs7Tnnhy+ek=
X-Google-Smtp-Source: AGHT+IEZGD0DWj8wTGg9YtoxbZ7YwZEeS4DGgoLHewi9729Zm1KP8A4InPw1mcjxJBqh5Z93q/Ni5MKfgoWu5arlbfE=
X-Received: by 2002:a05:6870:b30e:b0:2c2:d2b8:e1ab with SMTP id
 586e51a60fabf-2e3a3d06384mr1549232fac.18.1747320087994; Thu, 15 May 2025
 07:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210252.1139749-1-rdunlap@infradead.org>
In-Reply-To: <20250513210252.1139749-1-rdunlap@infradead.org>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Thu, 15 May 2025 23:40:52 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2jhA-vqEpRXmQmn-+5Zq8tJy83Y_iCdC2XMb=hR4HKQA@mail.gmail.com>
X-Gm-Features: AX0GCFvymginBQ3U9ZmEYG81f_hcQ4hQy7ZdbUwwwRnq9hGtsZwq8NTe8flMw0Y
Message-ID: <CAGTfZH2jhA-vqEpRXmQmn-+5Zq8tJy83Y_iCdC2XMb=hR4HKQA@mail.gmail.com>
Subject: Re: [PATCH v2] extcon: max14526: avoid defined but not used warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Applit it. Thanks.

On Wed, May 14, 2025 at 6:03=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> SIMPLE_PM_DEV_OPS() is deprecated according to <linux/pm.h>.
> Use DEFINE_SIMPLE_PM_DEV_OPS() instead. This avoids a build warning
> when CONFIG_PM is not enabled:
>
> drivers/extcon/extcon-max14526.c:265:12: warning: =E2=80=98max14526_resum=
e=E2=80=99 defined but not used [-Wunused-function]
>   265 | static int max14526_resume(struct device *dev)
>
> Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> ---
> v2: adjust patch subject to be consistent with other extcon patches
>
>  drivers/extcon/extcon-max14526.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20250512.orig/drivers/extcon/extcon-max14526.c
> +++ linux-next-20250512/drivers/extcon/extcon-max14526.c
> @@ -272,7 +272,7 @@ static int max14526_resume(struct device
>         return 0;
>  }
>
> -static SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
>
>  static const struct of_device_id max14526_match[] =3D {
>         { .compatible =3D "maxim,max14526" },
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
