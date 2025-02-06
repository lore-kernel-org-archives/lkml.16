Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3343D16A95B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868510; cv=none; b=JVNpu6cKGPXfJ6QVyXNravqJx85Tp5/Gxuyw4O57f+XayDkDl1fKZBj3g5U/k+ViYG4cNxZaYIZW7vaAf9reXQE/9x6tvSld836zBXnaw0I5GeOeFn4FdW4POyQwhvlblRZt1iCly+mLEl2Y+5UOZ0wE3NY8ilpIgGqbXYnWdp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868510; c=relaxed/simple;
	bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJwMHfg9xIUEApyN+Jda35pzqyppZRJfXB7FYhvsZlMbBTH7iFK8XXAbaUAwte1TpQ1Z5kN2SeXLgZ0NbdrLNLDcQHIkmOlnZ+3cPoKnlWURoR40HOa/Kr6gIX0pbqVCT/tdycNyt2SfNHNpr5iFWoBsMhdccWJOCF/kA5817XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Df9zaj9+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Df9zaj9+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54410d769f7so952235e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738868506; x=1739473306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=;
        b=Df9zaj9+9IC8fyTO+LAviJqdFOO+UMN+s8gst16NahaFc+p4lgpT4YEJq0CXNYBFzy
         OWfFYa0NN4RaQNZhnbj7LmZ9b/yueA6QhqKJbxYG/CyNm3eQEJrkMdOATr2cs8seI6tu
         /uXzKdrWzliPFuIeJKSo489feKxHv93RgA8bQikFHvosorOY7Zx5KPi5Ya129+AXBQHx
         rp1+RQ1bOEwiLhbTJAU3WxqVbocryHEAd3SI7dKALSTzaN+omfaOVF16ZAd3/wF1e27S
         LQ32TWqDJ9atsiS9nGSWVOgvbxWtLDudcUuNZLDmmhF7cabHFJncgHfubH8SMak93Rxk
         SoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738868506; x=1739473306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H26hCa0BkZ3dMHTQ+5j05dxgsk8Xe5RdYR/UT/6FR1s=;
        b=OJ4A6gxCgKXoiTeRvHnrdJozpzGviCrnoEQjbW2JH0zCb1zGhcu7Nlkptp1mQIDk3n
         SnqtK8Y+nmt/3leOFwPinxyrjA9+g5eFS5EpEyB1C3Zg2XZajKekRQUp19Dn7KBXtEi1
         XlMFz46IngbJtInoccvtofVT/vCcYJRBXTQMjWmN0KBPfDjE++bbRPh3X+jPLSCsJD4n
         sIZNCE8wpHBAXnn46RZNDdzmHyFLUZ4v9zUJ5ifdTyD9a9ncdGbfZD/qAsXcCH+g18IY
         X21eiRHNob+ufvX93H3IPwI9DX0TQbOnE0erR0WbNy/PlWmjnsqxhlEyP1Xk/MiIOC4V
         yRSg==
X-Forwarded-Encrypted: i=1; AJvYcCUzolA58DeW+K3QmTeeIfSN5lA8DR5bVPFcvyM44ssK4C+6CBKjVBNEfbDymEzVfiJtycPbQLta3ZQdb0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo661XIyUyXIbBdkl9upgK7ARXLnW2AYDlYMjhaOACgxVZ0bvZ
	TbZJ1gSkFHuN13NjUN1eNGp6WK+8eiYUY12HghD4rg3qga1amMnf8YYLT6YS604OGFsyIkt3a1M
	ppC0k9vpNEx2/iZr0Xyq2XdUUbPMVlVjeqz0GLAKzDg8LIO+2
X-Gm-Gg: ASbGncsPCCs47l2ZSAYQD2UYbMAPe1iC8vJNM1+gs/P6cMWtcUwARpu9rntVCmWHSIJ
	5QEVCzVkSxq4BoN/BJ6th2z24N4Ag9kXRg5wLI/Klm0T6XRdl0tc6g1qaC4AcTCKdtZnlWw4=
X-Google-Smtp-Source: AGHT+IGYbTW64WX7v4eRIud9aI7sO+r6eN6uxSXvFM2flvdaMCaTnXZkw1PV8dpsvo+PKiCDP3tZfZA6qctV7ZLyAak=
X-Received: by 2002:a2e:a10c:0:b0:302:3de5:b039 with SMTP id
 38308e7fff4ca-307e57bc6b9mr333711fa.8.1738868506188; Thu, 06 Feb 2025
 11:01:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203101839.1223008-1-kevin.brodsky@arm.com> <20250203101839.1223008-9-kevin.brodsky@arm.com>
In-Reply-To: <20250203101839.1223008-9-kevin.brodsky@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 20:01:34 +0100
X-Gm-Features: AWEUYZkf3utqCGGAYFw3Wd0K9HPUGk1pvzmcRu62yuHXXkM5758Qny3DAHNgUk4
Message-ID: <CACRpkdZ_eGsfZh2vkG8dtSyZDbStMfDUuj7s7TQ4FcDwThJVkg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/15] mm: Introduce kernel_pgtables_set_pkey()
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
	Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Pierre Langlois <pierre.langlois@arm.com>, 
	Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

thanks for your patch!

On Mon, Feb 3, 2025 at 11:20=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:

> kernel_pgtables_set_pkey() allows setting the pkey of all page table
> pages in swapper_pg_dir, recursively. This will be needed by
> kpkeys_hardened_pgtables, as it relies on all PTPs being mapped with
> a non-default pkey. Those initial kernel page tables cannot
> practically be assigned a non-default pkey right when they are
> allocated, so mutating them during (early) boot is required.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

(...)

> +static int set_page_pkey(void *p, int pkey)
> +static int set_pkey_pte(pmd_t *pmd, int pkey)
> +static int set_pkey_pmd(pud_t *pud, int pkey)
> +static int set_pkey_pud(p4d_t *p4d, int pkey)
> +static int set_pkey_p4d(pgd_t *pgd, int pkey)
> +int kernel_pgtables_set_pkey(int pkey)

Aren't these all discardable after boot, so the whole set should
be tagged with __init?

Other than that it LGTM.

Yours,
Linus Walleij
