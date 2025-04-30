Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4942AF03
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999319; cv=none; b=NwljRGh4Ai8bK3fqBP73UzDDTjzsbxKQ4+hnEo8+t/r470WK+cmOVk/ogQLI7NpBrTIODUrlWHnnOqdKJYgyq2aXKcrV4WPV7qUw2W7JMQRZwoy81k8PpvwkXHMkxz98l+DleY/z06bwcTmpYQapvyCXBlli1cNZZkm1LOd8oUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999319; c=relaxed/simple;
	bh=KFKVuIe7E6WeRAjAMNqHz6l2G6fClyvQmCKHVZGMKQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMJe8VH0+W81AuWe+M/6P+rfdzDrUNPFpm2MpTqlFHfQS1U3tQPS3ki72VxoQGGNBPGyRPwAmwFQPEyyohsw+KRhDYD9csiYxJGPVq9+LlzuMDrsD2gjmoEB6oReT/40szE6BD+NKfIVZVju8dzltiJJAzbMsiVEcR77VDl2RCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFWe8D2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFWe8D2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA67EC4CEF1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745999318;
	bh=KFKVuIe7E6WeRAjAMNqHz6l2G6fClyvQmCKHVZGMKQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fFWe8D2eDngcb9YiA/4TWUfSADz8vZsm30EpHmrl5hdswT+fpMgMt+XtxAUiUODhH
	 8lBDsjWij/+d3N1LMDEjummhFcplaqG7/YRuL2+QvW8BTWynIC7Um2SSchqQ60+Qzn
	 MIMlrxAyCt15HaCLqxFAoS12hg/+1bvTqB8+Bcx86rH44dvX+gTou9j93BI1zmdOeL
	 QwrtOjnu93sd/1nIQ9HhhRDcTlZhOYmKkblyt5FaS7x+3YT/FdPi2szbWIkPejXjc3
	 AN0SYhBbkQ63hV+Mau3FNHtXaoqW3BnLA+SOJ+/IP5un8JNPKS1eaNp+mwpbMPTveb
	 4BDabhIZNaX2g==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1221609466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHjoBhoK459TtjRlUfBX1HagEmcvHUlFq2IyyWNNXX8kiNOjoJhqdxCAC57DhIahRy5pnPZBgV5eMVvNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzznBIcupY7Q5v+b54jRja4GGC8jsgukqFoI4UpWluWYoAWcVhF
	B1CSRceYgjfJrUzv9HxULclq5YTKHzFEcGaq7z6mVJWtJrb3xn2tzuzbTB2nsrmesJxy5xUl7i4
	dFSQ/4vdK+Tt52KV6rpcjT28Tql4=
X-Google-Smtp-Source: AGHT+IGOv15I2bUSbbHUW7KyfgwawqDRQgH+PfRRaXIh/Mm69kfF435CricJlaWM+toOOVRtYWhzzzOFpr5ow7y48CM=
X-Received: by 2002:a17:907:9404:b0:ac7:f3a6:5af0 with SMTP id
 a640c23a62f3a-acedc5a5ca0mr234942466b.10.1745999317336; Wed, 30 Apr 2025
 00:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430054042.24333-2-ziyao@disroot.org>
In-Reply-To: <20250430054042.24333-2-ziyao@disroot.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Apr 2025 15:48:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7t8NJYEA=JqSVVFPRZauuqc4pyj6bgNCDRjWcDqR2dqg@mail.gmail.com>
X-Gm-Features: ATxdqUEXbzRwzriWo5NVSkM6Wy6nsnLimRJtci0AuupuY6oyeItmUGXOa-pL2Ig
Message-ID: <CAAhV-H7t8NJYEA=JqSVVFPRZauuqc4pyj6bgNCDRjWcDqR2dqg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Use a fallback CPU model when IOCSR-based
 model probing fails
To: Yao Zi <ziyao@disroot.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
	Tianyang Zhang <zhangtianyang@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Yao Zi,

On Wed, Apr 30, 2025 at 1:41=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Reading vendor and cpuname IOCSRs yields 0x258000fff00 instead of
> human-readable model strings on Loongson 2K0300 SoC, which messes up
> format of /proc/cpuinfo since it represents as an empty string.
CPUNAME IOCSR is filled by firmware and readed by kernel. If you read
some garbage, that means you need to modify your firmware.

And if there is completely no CPUNAME register, you need to fill it by
FDT, see init_cpu_fullname() in arch/loongarch/kernel/env.c.

Huacai

>
> Let's consider IOCSR-based model probing fails if the result model is an
> empty string. A fallback model name is set in such cases.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/loongarch/kernel/cpu-probe.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cp=
u-probe.c
> index fedaa67cde41..785513d43696 100644
> --- a/arch/loongarch/kernel/cpu-probe.c
> +++ b/arch/loongarch/kernel/cpu-probe.c
> @@ -270,12 +270,13 @@ static inline void cpu_probe_loongson(struct cpuinf=
o_loongarch *c, unsigned int
>         if (!cpu_has_iocsr)
>                 return;
>
> -       if (!__cpu_full_name[cpu])
> -               __cpu_full_name[cpu] =3D cpu_full_name;
> -
>         *vendor =3D iocsr_read64(LOONGARCH_IOCSR_VENDOR);
>         *cpuname =3D iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
>
> +       if (!__cpu_full_name[cpu])
> +               __cpu_full_name[cpu] =3D cpu_full_name[0] ? cpu_full_name=
 :
> +                                                         "Loongson-Unkno=
wn";
> +
>         config =3D iocsr_read32(LOONGARCH_IOCSR_FEATURES);
>         if (config & IOCSRF_CSRIPI)
>                 c->options |=3D LOONGARCH_CPU_CSRIPI;
> --
> 2.49.0
>
>
