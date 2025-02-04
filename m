Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09285204C3C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654983; cv=none; b=t2nS35GEefpT5oKavse9mXUgdfcNmT7erBxuACuUbAtmCeB9p1aWFrzkYXkW6bsBZJpmlWjbWe48XFoPXuvg6hOI6MnNbkBaWSHat7CvLxksc8b517KV9T6DThBn0HgrQpCHMY/XttdumfnkIeaT7kyqRqsvlZBF4jQcckdIW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654983; c=relaxed/simple;
	bh=Ka0qrGRUs+mm2RhExoKIJw5tzg6+NfIq5LSKW/zQewg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGhQJvwWbGGk1aZfDQCSNZ3zSlhvJt0EmdnHxj7wafNmeo39MrDntSgxf3O2mVDrayFzxlRFS1LC3ILg22OfjZ/C15timIQxXmd/YJ+VIVShXxEODKPDyAyf6VqgHTSj7AJbCwjuuZMvoSeX6MpMD02KDiIs2G1NyoC5+goaoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afe7429d37so1374742137.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654977; x=1739259777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0AMgkZ59v94RZ6z6SKh2pbiqGshBRpTXZyxuIUBs2k=;
        b=KZEYKzFJCtWOWukVq3tpLC4cUHvJB3VaxognaayhE8omdhikdolL7w6wzD2JEAkoy7
         gJG5q0sPQtJuBGsR3MEDjkTn62wplV20bUOlKY3rCrSqJvFzu+HumG6H/zePjmIZsm5F
         2bLPJw4VGz8ftdcbxD0nW+SUn84F4HugISm40jvVFF1wun5nRu0s3yrHpuzhe7KWaxgn
         5wUEIaUng2Lr6ZfrmnxPtZrIiGU85GOPAx/hf6NvEOFTtA6YpYZ39g27VtrsN89VEVMB
         9h94MHAFyDUZWxBzN0Xr2E/x7Q8SUkTqwlLrV/ma72GRVNDBU2JrjBZ6StgtFtotR1C0
         zfJw==
X-Forwarded-Encrypted: i=1; AJvYcCXu8G9C3FUqMyBB9mmFMBuWszhb8C3Urof9jEu1PSx4YXb4JUnWI5p0Nx6SIcIkDgRNBfYyMN2P8JIv9w4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbvv0PplabJn7NUQvqZeZXycMYZ+W4jRSOyv+h2CK5hhSp/PcZ
	c+QMQVHjB72ewh5UkQLpxa6JOP6AVgXINf8B4b27lzURzIlQHVu0uchk7UBW
X-Gm-Gg: ASbGncs2lbFvbgfvEp1LrPbHmwYSZfO07r16TOZSbUZLRGr41fNs1RwVuuue9GGIiBV
	RK9mk4xCdDZcf9DgU+MgP/dA524LtGVVoqUCABsdghvFgim4HIhUgtqCPU5Ay7O/OPhwwBthpRm
	7QpSlgEes5D2zTmCdTdU+ia4DQHpwxhV8Nv2QQrRKvkZ8FAchsz0qpTydO+b4FWE016bf84DIHi
	sCHFv1hYMt+37wlJM64XwB147kgflCEZobe2t98aCEW/BL9Cz7DLG4SC+VjT1dG1/PHJl0OMuXO
	JKHjeRAKZSjXIAKAvyqsexoBPAZvIWi7NZAPvHXebsc/sDzCxZbEIg==
X-Google-Smtp-Source: AGHT+IGdy8uugkYWP26UHi6r+MXgn/Yfof+QZU0Lq0jpAOBzA9FqHwKNPqN43MwuoUhMw+BZoPFtjA==
X-Received: by 2002:a05:6102:a54:b0:4b4:7cb0:ac58 with SMTP id ada2fe7eead31-4b9a4eb44aemr16016119137.2.1738654977085;
        Mon, 03 Feb 2025 23:42:57 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa18af4sm1866723137.1.2025.02.03.23.42.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:42:56 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so1192813241.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWD/n5OEm4zwQu27qi5b9rapV3wzGgz4xkZslBA5bw9JeIB1SdnRvie0DwwHh25xRMo3dE5ny/ntDMuf4k=@vger.kernel.org
X-Received: by 2002:a05:6102:504e:b0:4b2:cc94:1881 with SMTP id
 ada2fe7eead31-4b9a525bca9mr15855668137.21.1738654975532; Mon, 03 Feb 2025
 23:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203150801.2399555-1-vaishnav.a@ti.com>
In-Reply-To: <20250203150801.2399555-1-vaishnav.a@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 08:42:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
X-Gm-Features: AWEUYZkDgnPf76m_8qyV4BFvYG1jJH4IXxwnablOQ3R27shfCtbF4RxvzCNS7dc
Message-ID: <CAMuHMdUOMCxfsOrUF3-6PX0ZZ_E2g1SK4bwDqZE=mWiibPFt1A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, krzysztof.kozlowski@linaro.org, 
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com, 
	ebiggers@google.com, ardb@kernel.org, nm@ti.com, vigneshr@ti.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nfrayer@baylibre.com, glaroque@baylibre.com, tglx@linutronix.de, 
	u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"

Hi Vaishnav,

Thanks for your patch!

On Mon, 3 Feb 2025 at 16:08, Vaishnav Achath <vaishnav.a@ti.com> wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
>
> bloat-o-meter summary on vmlinux:
>         add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
>         ...
>         Total: Before=31615984, After=31778459, chg +0.51%

My first thought was: that's a hefty size increase for two rather
small drivers!  So I enabled these two options in one of my own kernel
configs, and saw a size increase of only 7872 bytes...

> Fixes: 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> Fixes: b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> ---
>
> V1 : https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
>
> V1->V2:
>         * Add Fixes tag.
>         * Add bloat-o-meter summary to commit message.
>
> Previously both of these configs were selected for ARCH_K3 in respective
> Kconfigs, but commit b8b26ae398c4 ("irqchip/ti-sci-inta : Add module build support")
> and commit 2d95ffaecbc2 ("irqchip/ti-sci-intr: Add module build support")
> in dropped this recently without adding those back in arm64
> defconfig, this causes boot failure in all TI K3 platforms.
>
> Passing bootlog with configs enabled:
> https://gist.github.com/vaishnavachath/03d8d3ce0f22219643c2f4d1dd243fd1
>
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da4415599..1f25423de383 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1551,6 +1551,8 @@ CONFIG_PWM_VISCONTI=m
>  CONFIG_SL28CPLD_INTC=y
>  CONFIG_QCOM_PDC=y
>  CONFIG_QCOM_MPM=y
> +CONFIG_TI_SCI_INTR_IRQCHIP=y
> +CONFIG_TI_SCI_INTA_IRQCHIP=y
>  CONFIG_RESET_GPIO=m
>  CONFIG_RESET_IMX7=y
>  CONFIG_RESET_QCOM_AOSS=y

However, on arm64 defconfig, this has indeed a much bigger impact,
as it also (re)enables several other drivers that depend on the
irqchip symbols.

You probably want to mention that in the commit message...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
