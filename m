Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24227EFE3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254290; cv=none; b=kNZdMBh1kIj7hmI4Z3loO2l6wLO9NfeKyXlcqUa++5k9GDl6hOrEH0CblAvJ4YIXHHW1c9UcciE2VhYr0EBvKaBqHV2xpCxYUzIJeJFlGxH04LAlqwdBIOp8bdENruZm4O+Gj/4GoEGy921Ac2YyfyjcBB+KiQzSf5Pj/4s5Vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254290; c=relaxed/simple;
	bh=9Pn5+pieU9S6yQFIfZFNE3Sm0wbJoEWVjuv8ZUiurXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGa4oqurE3hd8DtvYhpnJEUaLm5EovI4XpsMe/t70qSOCP7ynTztX+K5bIhrLMOpPHe/avkfRJKc1LaoNHs99k1YyzVKRClHlp/RzDe71D4opIheZ86HUV3dI8/mkoJuRmvVmcpKJVrhGNPyC+KaUwuQVjXyIBjfA2ShPWBbdSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ycs0YwPw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ycs0YwPw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54e98f73850so6543122e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254287; x=1750859087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
        b=ycs0YwPwmoUCCg6YrRaZicxvoDp1R+QK1yYapHRstVkUcfRI6u9whQOUnbDu4SWN52
         j351ysMD2+kNQcgeW6qtMDXvMG7sEhfJ6Apfoc7AtMxTNXOgk5DbfGHdgNHzVc4HxkYf
         ZDemfyB+RBkmMBY2Tcpj6o9SELDk4ADlTq1q8mj7oEgew2Bmpia9FVpCUxrXF1h45mIP
         Eb22DFO8P3OULz0uOsBZNxTiCs+I83kVXELiUmpxegeSAdbbsQUxWmkFeSQYp8egL2W+
         tuz+iAcZfZqVhUrXQZ7m8t+RxcZzsiFp1NpP0rDGyWRhVzie/du1/XSWQSbxpeqRu8kA
         FNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254287; x=1750859087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOnqA9glXHMp+wjKPZ26EK/2be4ewo0aSocx50Gz+sQ=;
        b=XukJcsoR/9+aBZbfg74K39yw3s15Khk2CDzNCpyu9d/OgD0LLLl1rhJs5rO5NzBe90
         nDy9quHULJ3dGnyYzEbhY1AoS55chBg7mtzsUe05tFIWX1wMIOkFBXIKGU1IO12AWCrM
         Bl/WS6WcTzYvQvX84PoJy6MkoY4pj5HEdQL9l/WM4NfF9BvzgYpGpyDrdgmxjaM/nJoQ
         olarQRhirX0fikq0H+iFY7zyySUQWYSuv5t1IAL6G3LukIx8SOX2nLNS/ibey/dGhMo/
         WrVsC5NsAUGUUtfYB7PlLpMCxUwQM6HBTTolXFo6uCah4wvHYLodpza2u8PKBOc0g5V8
         uN0A==
X-Forwarded-Encrypted: i=1; AJvYcCUx5raOkx43dFqx7VBhABHM4rBdp9Xkko6rXzLfqxgwvpsIDObNHzP7dC5F/5+Wtwp10SRsmd/J2pTQLbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YycGlJK0pYUXWK6HVQlJXQQsqGnSdnhd4U8cj1F5BaRkQALjoVM
	qXmLscs/+EL8gdoVoYriLNL6x3c3Wyxj320vp8a8oQ8ds9ZFb/SgMDHRc2pYEW8CTya4i4qwjDm
	adO/PZKYVwL9yYzlRNZM1+NaHh+ZM/G7gPvSWN418sQ==
X-Gm-Gg: ASbGnctPINcjPASKnA2j7gFznLJVLg2gOw69F5bghtvgyV6bHqTWxjnoASlV6zwwkI2
	m0PTsLEBFOPmos1NkBceN9bo63zACz5c5BhJOuP4VA3irVhAyFIqTTyVO4TjWnt3jyAmWmeK0lW
	b8Sj2ohcBy5NjuYimJGxXQLJxYimM8kQZaWHbTCsJa7NbipR/nj3jNRMvW606Ilqj80Djj96/ih
	A==
X-Google-Smtp-Source: AGHT+IH6Ld+eVfdvk23fMVj2Sr97EjUVBPbCt4xJwvj5ob6oDsk8hpgZs7OsgvSQaNDiPWolo67AHI2eB2C2BKgawwc=
X-Received: by 2002:a05:6512:3ba5:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-553b6f4470cmr4999420e87.50.1750254287228; Wed, 18 Jun 2025
 06:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618102234eucas1p2a1899b494c5ed75e0f39ea517d81c81d@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:44:35 +0200
X-Gm-Features: AX0GCFuxF3RhQHueJgJf3bU829GFZMlCkCu1kP_wz3N4DTe6r8qi2RcA-BS33s4
Message-ID: <CAMRc=MdXmtZ3EbPDSGQeVaH40oZS7yc8MSMO2TbHza+F2HnBng@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Several RISC-V boards feature Imagination GPUs that are compatible with
> the PowerVR driver. An example is the IMG BXM-4-64 GPU on the Lichee Pi
> 4A board. This commit adjusts the driver's Kconfig dependencies to allow
> the PowerVR driver to be compiled on the RISC-V architecture.
>
> By enabling compilation on RISC-V, we expand support for these GPUs,
> providing graphics acceleration capabilities and enhancing hardware
> compatibility on RISC-V platforms.
>
> Add a dependency on MMU to fix a build warning on RISC-V configurations
> without an MMU and enable COMPILE_TEST to improve build coverage.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagin=
ation/Kconfig
> index 5f9fff43d6baadc42ebf48d91729bfbf27e06caa..48fd31c031628c70b1e095227=
1baccf7f4694810 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -3,9 +3,10 @@
>
>  config DRM_POWERVR
>         tristate "Imagination Technologies PowerVR (Series 6 and later) &=
 IMG Graphics"
> -       depends on ARM64
> +       depends on (ARM64 || RISCV) || COMPILE_TEST

Some maintainers could say that the COMPILE_TEST bit should be a
separate commit but it's typically fine with me.

>         depends on DRM
>         depends on PM
> +       depends on MMU
>         select DRM_EXEC
>         select DRM_GEM_SHMEM_HELPER
>         select DRM_SCHED
>
> --
> 2.34.1
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
