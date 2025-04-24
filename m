Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B598D528;
	Thu, 24 Apr 2025 03:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745464478; cv=none; b=AZ+od2CoDOY3SZRoddfPyYEkxEcc+8pu+4FN5S+sxRLOog2goGMeWvw6YZPp8JJoWJt5zcbFJ2jDTWwpXCty0kQizmlXzmMSb+JaPHZWwHqToywhBbsdJkuQ7HSUITCZHPCwecaEQqH+OLFpZ0pEIWqu435M/EF5UDeJtOQUIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745464478; c=relaxed/simple;
	bh=uxqqPLtfquSGpR0a3F5lgTtkpuZBETiI2PWs7xLi6e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBUJDDYBh8SXRGIpq+WaZSPI63BvcAflggx5M2qHoimzWhw4u+FtlcahlclOFjD6VAG84cnSZFxLmAVcobzBfbzPZzxy6kq/H70l+spTuJXGIdMg6wtZBstbDlQciye5hNlWonWniC53XRRp5GHw4PpQyyVuaZeCuTTATIU8dmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFYZnSwy; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFYZnSwy"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-317f68d0dffso898721fa.2;
        Wed, 23 Apr 2025 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745464474; x=1746069274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyqpXtC+2wI8GWT7piY98hrPsFMqRLLtqHGrUWcefco=;
        b=hFYZnSwyoDhP6DdtuLQPwv2ePsq3JKBdRlO9LfOoEKsRMP/OsbGR8GLK5ZPaxl38re
         5SvptYEC8Kg/W3SzU57xSUoh2y7k+F0g8RiK+3rY8xSNcxWVPnFPiluEaG/rKqk3HO4o
         OOdPUvUG1m2J6tceGwI+w+zj+s7XgkUDTK2beUrgQuB4o6c5BfIBOi3Rq5O3CnCP6uie
         tonv/+HPce5tLFVUU/VfLrqlZtYsANVvVBZgBK0mgxuK7GEhs0Yt4CNxvltsZ+GR4cYz
         Kn9gPmVdDqjGh9phlKf1noUmwOFXXtxbel23vTgk6JS5LQaQ1XZVeC7uN8pR+9tfQgy6
         Ax5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745464474; x=1746069274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyqpXtC+2wI8GWT7piY98hrPsFMqRLLtqHGrUWcefco=;
        b=WIPD5DxPHL1cFKIfvFC1Hu6utVCG/CgIlkvVhM2XszsymlqqQW1/kHowrpmmyK3JOe
         GCrzlNfaiqAAm6Prc2TdpB4nqcakoO+y+EI4egN5YzrhCNw7GerUwcC6cqiJdRP1s07r
         uAb0EpcglaceHuwetToghijc0PQL/b4FgZtMdzRlmCuos7L/0Mg2mtThebd0hl6VTJ46
         Ld3BWsobKStxaRPtEbeMXYZedaG7XFJJtiXUnwJIAwG053z6ct2y4xaviO3F8+qQcAVf
         WYvZymIVkwfa9TGpTuG2//GEUzm4B8218GSoUF03nSQQ+LvJDq2f3xrpXHAiYrj7eFGD
         q6qg==
X-Forwarded-Encrypted: i=1; AJvYcCVAyizNqpypp6H4jei1FC73CZxbEoqEnJC+5UWu8rQ0Q+jwIy/L//6vyqwgJyYfZmCvbK5LpvmatVoL2hM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzARZ0u/UXsHHE5MZNu+BSr22TWD9sFo6w9CTft6gBBKOSSvJX7
	8WrMDnf7QSU1i0U0j/J7GsU9jMpFxnHqjSlMVdl8Z9h+YUFFmxoRNPH307PNAO0NEYaXT7c5mX+
	8QHpm7nb3uHs43PwG9UZ70Rs/MMk=
X-Gm-Gg: ASbGncvI2WvraSngLfRYEPsbYwRXvXZ/Cpdy29qFJy64q+oNEqdyc73AO4Vu03ltmXD
	patRt4bjsN3rBcIYlg2NSFyZLnVCf8qEEDuSl2OdjBX+rXzDzT8HGidxo7HSnOYqbdIeKp2aSZC
	SNHH8P0XfCugC8LcwWvqD/1w==
X-Google-Smtp-Source: AGHT+IGLoadUpQLTRLCAJ3l6g3fgJzXL2nB55IKQNckSaeWghU0ctmrMm7oAhGiEdKP+jogLXP6EGndVW8TtTOnmOU4=
X-Received: by 2002:a05:651c:50e:b0:309:26e8:cb1a with SMTP id
 38308e7fff4ca-3179facababmr4257241fa.30.1745464474217; Wed, 23 Apr 2025
 20:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Thu, 24 Apr 2025 11:14:24 +0800
X-Gm-Features: ATxdqUFJtavlghAgSoe50QLBzyCPUPVj3ZXniFpQiDgK1QwMzwYglV3Fm_q4cmw
Message-ID: <CAEnQdOopYHSK_SVAaEjVDCq9Jk5xQCe02YZnKXnbNHcePC2O1A@mail.gmail.com>
Subject: Re: [PATCH v1] clk: davinci: Add NULL check in davinci_lpsc_clk_register()
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david@lechnology.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael, Stephen,

I wanted to follow up on my previous patch submission to check if there are=
 any
additional feedback or changes you'd like me to address. If so, I=E2=80=99d=
 be happy to
incorporate them and send a v2.

Regards,
Henry

Henry Martin <bsdhenrymartin@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=881=
=E6=97=A5=E5=91=A8=E4=BA=8C 21:13=E5=86=99=E9=81=93=EF=BC=9A
>
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> davinci_lpsc_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue and ensuring
> no resources are left allocated.
>
> Fixes: c6ed4d734bc7 ("clk: davinci: New driver for davinci PSC clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/clk/davinci/psc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
> index b48322176c21..f3ee9397bb0c 100644
> --- a/drivers/clk/davinci/psc.c
> +++ b/drivers/clk/davinci/psc.c
> @@ -277,6 +277,11 @@ davinci_lpsc_clk_register(struct device *dev, const =
char *name,
>
>         lpsc->pm_domain.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s: %s"=
,
>                                               best_dev_name(dev), name);
> +       if (!lpsc->pm_domain.name) {
> +               clk_hw_unregister(&lpsc->hw);
> +               kfree(lpsc);
> +               return ERR_PTR(-ENOMEM);
> +       }
>         lpsc->pm_domain.attach_dev =3D davinci_psc_genpd_attach_dev;
>         lpsc->pm_domain.detach_dev =3D davinci_psc_genpd_detach_dev;
>         lpsc->pm_domain.flags =3D GENPD_FLAG_PM_CLK;
> --
> 2.34.1
>
