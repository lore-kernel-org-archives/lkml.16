Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088B20F076
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480070; cv=none; b=QuyDPejmqpFLFVGL1FqwNLrcUBoK/RPXywN2qT7q8ELX1gw2G8AsEPRb4cp4/4HKvRHN0w7c7s2cHL8Z54a0foyZxH2bzA2CXdgFNCYdYBSMpofYVPFjvpL9MHIPqfeE2D+SCiP7kibDIaWet3lOOB3Uq2j/B9PUAM/t6cYEaz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480070; c=relaxed/simple;
	bh=u2Nrcgw7jkwsuXcOLlFIjL5vyZPM1WYAtiGtFnUjhwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3eCaaHPkiuL3RGVRfE1OM59buJ/ErPSaEtQHBIl1/zNymmkc91KH/aivvPV1XtOmtb5GWhCnfh/rTLAqYelnG+vU0NgMQo7dKvM4YxjnvEIS6NuFa7dIFPWLnr3MbukrhI/cOU+EQNe38RH2+uC4O1BmxbZEc2l2wlsyXC0I9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so717542241.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745480066; x=1746084866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTjQn1pRO29n/BIx3/Uvj8AT+NnaG1jO3iBKpZy4Wb8=;
        b=sATcwwfrdPeJ6Ly2y3Jn8PaFS3RwyRzPepplaVJUwYWeM5ros4g1jocU0eRqi7Ghmr
         TqD3x3GQ2Fy2KucyZ2tMPahm7uArE/If1L2Lzd483/jYvVOyKOhb1Yj7uOGHb/eqyFdC
         vHt2W0UJ+08+5H6cuXCiYgv1EFVAZ21HjxNWL0abt3lnX3eVntZvgoSgGu7W2rkXf4EE
         jYxvEJ5qfrSRj/KZk1T/4kv0p5E6o2sZRgW05dS5UEtiWykZIIOOBWViX6Y9pLFVSgCl
         wRX9QP7YMmqg6Qg14uXHF7OwTvlOz6ysb8wEZAfCnHtkrydKtf2pLqgJfMFmVBeomS9/
         w1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUKShcseYlLzyHFGRXQnTiiPJGWZqho8CvWhZSggj0AKsq2IUwVgB6GUJSO9wkmUZXcBWBFlSuMQx+Kjww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaiiCHr8hUu5fng990IqG9uein+fVnxzHTVdfaOayqB73uTRg
	71bqlMlitIogmQyFmCL9hKyh6JCMddW98VGlZlMOIGytuJdleJWN9ncjoA4/
X-Gm-Gg: ASbGncuSSw/Onp6OyDWVEO8PFwa6U5jIms1PaeRUngt7Q2XRh2zJJe7ptG6UfkSUubj
	nYXvZePnUG6E+IVXu+mA0vl8+0g9bQ2cgtBONY1ctqhVk+hw5BINnFGXEuNZRBh39cKZN3GVGDG
	HdgVFzlbixFyfnw78w80evFTsngM8MZjoatCuY0c50gom4DY9WHojXI57s1dspsP+uppXqPEiUE
	ERG3y0ZdyqeF+uD15hxGhrz14r07XEcTElWD30Ngf/FS3LOMJekHzQGaSSxphVwd6ec0it53zGF
	V7pyMhLswVW2ZmMi7DlnJpxRZuw64MJoZxift+4ed3VdyZCa2FK7ZdpTuJbY/BnsB3y1R4/3dZi
	VJUo=
X-Google-Smtp-Source: AGHT+IE+R+g/xCkDqYVqMXZeL+xQU7Bvw0g2zr5DJH7+YAbDKBWFFc9XUsVZE8CSTvpeFuPbhnZuqg==
X-Received: by 2002:a05:6102:292b:b0:4c1:a15c:ab5c with SMTP id ada2fe7eead31-4d38ebe8f73mr1154271137.20.1745480066573;
        Thu, 24 Apr 2025 00:34:26 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-877aedf91c7sm196396241.6.2025.04.24.00.34.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 00:34:26 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8777084a3c0so701683241.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUl750ybOzPQ6WEvmUJyGmXC9hCmnsvif3BrdAgqja3IFfYZKFmZyDZkhAJQbz5L8KixpxlqLd0cE6yyI=@vger.kernel.org
X-Received: by 2002:a05:6102:292b:b0:4c1:a15c:ab5c with SMTP id
 ada2fe7eead31-4d38ebe8f73mr1154262137.20.1745480065531; Thu, 24 Apr 2025
 00:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423164006.2661372-1-arnd@kernel.org>
In-Reply-To: <20250423164006.2661372-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Apr 2025 09:34:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzLuVjA=8PMm3UPXXPUEwBQjnTmp_W9oi_KHCx=m-QZA@mail.gmail.com>
X-Gm-Features: ATxdqUGQnUlzm5W2tVtEkcCP0cHDrWqBr1nsmTcSEp-9WZNmnHDiuaEyg8EZoF4
Message-ID: <CAMuHMdWzLuVjA=8PMm3UPXXPUEwBQjnTmp_W9oi_KHCx=m-QZA@mail.gmail.com>
Subject: Re: [PATCH] iommu: ipmmu-vmsa: avoid Wformat-security warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Magnus Damm <damm+renesas@opensource.se>, Arnd Bergmann <arnd@arndb.de>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 18:43, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> iommu_device_sysfs_add() requires a constant format string, otherwise
> a W=1 build produces a warning:
>
> drivers/iommu/ipmmu-vmsa.c:1093:62: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>  1093 |         ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
>       |                                                                     ^~~~~~~~~~~~~~~~~~~~
> drivers/iommu/ipmmu-vmsa.c:1093:62: note: treat the string as an argument to avoid this
>  1093 |         ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
>       |                                                                     ^
>       |                                                                     "%s",
>
> This was an old bug but I saw it now because the code was changed as part
> of commit d9d3cede4167 ("iommu/ipmmu-vmsa: Register in a sensible order").
>
> Fixes: 7af9a5fdb9e0 ("iommu/ipmmu-vmsa: Use iommu_device_sysfs_add()/remove()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
