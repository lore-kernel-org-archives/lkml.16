Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8F20CCC9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066867; cv=none; b=Q8zb2YydAFTG3H8HuFF/+ZoLhA7p/xOERk9EmRJHZUkF/qnkmJz5mjLpccvjvUT41cQofhEKkJu6BBvo4nXel10iwKjEeaTZEqcFPc2tTwNhsErzEckXcgQYkMC4n8wqDifKIGnFJ4Pn3eaEhMPR/yWr396Gh9kSPxmRBsBVqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066867; c=relaxed/simple;
	bh=7XgftMYlowI9omQsqIdx6iLF24jqn6RByllX2ehfs7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD5Wgq3LMOtL4X8Y/ZlJIztwqqbzH+/EKZYN/jNwUvCTV6losaV1Vs86L+pyhVcVb7RBz5TAFacBmivC/6Sf3S34qhElML5Ae8143GetnBPsel/1E4B/a/cv5qQK8U2/5RZ9ujNmmGURkhKKMkLg15i5CILTF9ZTdz8q0kKaBuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GWCt+dz+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GWCt+dz+"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b82f3767so1830146e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750066864; x=1750671664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
        b=GWCt+dz+xgX1+HTKkjCZXjMRV7n/QHqw+aBcgYC0SnsqkYJ+sgXMWHq+ZWPK7LTaBt
         6nDaEIBRp2k6IiutyYuXPyVWtkdUzKQPC6JVb/yqLe9ohmZTwjpKmEyq/ObkmEFY+DSw
         P5AOU/CSqlA9EgMx4/2Fny+uOGdJDHYL9lfina9VfUCXtt6I6gzwQT4aqL2J6it+sQhu
         JBNCNsUKihsXQ+BTfpoiIPx92h7mKGqRxX8gfTPf0EPH28J66pVnfWvj6pVI4B4ooTLR
         xRrzNBIf3i5H/JOOezwkR9FSkCispNTrhpbBVC6jnh5LxSNTPbWZg1tJXIOs69qSOnXM
         PI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066864; x=1750671664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
        b=CqJIDsW7lWaugBbfhm4oKdeyTSIa6u9G4qEhFTrUxYaXgaFRlM2rHA3bY7X3TQNUbP
         Os6LzG2BeqxBdDAN6UJzR9GSYp/4Nbo03Pjm/Y7HNnCxsn6WzFT5o7VJcxdK+ahrpUny
         WogP2AUBdxW4hErhkMjB76EHyignXZTcNmZoxPEi9FSTaxTjbdAALhgugjayWT57wvoN
         36ebX9YYA3g27McjuwMWdSBSmImYoqv8GlcWW6OviB7wo/DkENvzijLWvAAxqWCPAf91
         6/7eqxbNy8I+ZAkZ3Y/0o98IeEG9epeMaJQJcTQKjXXb2fBxNPQ0dINmuHJBV9jL/2bX
         Bp+A==
X-Forwarded-Encrypted: i=1; AJvYcCXzXDgLSCjDgcHyfCj3pGDIHOSKpgJzwXfvrE6eIjR4A9Uw7XmD53zsBnOoXq9B7+tYBinor7+p6/A/6Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoAzrvgsoW25sb6IBYQsAFaxPNPxhy8q+7d+CASHFYT6+PNvu
	hSc2xFgBbgIhKdSc0R8tEUaxijMw8+nKzyXPLt9t/2ZyUQrMyGAO45VCiPD2zQDr4C+oqfe0xNC
	JcxftKTHjJQWi0L6brMoc9j2TCHyJX2Z9OMi60/jGrA==
X-Gm-Gg: ASbGncsMidgiNsX0X4DyDWlhsmafoQ/RO5Ycmlb5RupBE9Wle6DL6Het8ggRwNceEKC
	LB7jga6KVab/dgZpAljhWx2nB9vKjx6Ktx/42bC4Bj86230t5SoeneZG+xQL1iDZLECgPesQjjR
	hZv3T10Atyy3jBKntKKdgCzDOEJeMf4kJ1Nb6p7DlFWqd+NO4sreiOcF6KU4yeDL7Xnb7da+8SE
	I0=
X-Google-Smtp-Source: AGHT+IGQWWfUkusHDrOLuRcyzoECeHHGTF7H0pzgq8rg6Tj7LyO4hdSVch5xZMTnr/dQPwUpgGJMqB60ks8Us882nLo=
X-Received: by 2002:a05:6512:12d1:b0:553:663d:7354 with SMTP id
 2adb3069b0e04-553b6f31175mr1628391e87.48.1750066863507; Mon, 16 Jun 2025
 02:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com> <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:40:50 +0200
X-Gm-Features: AX0GCFt1wszk0eSWs2NPgAoE3A4kwN-NyBJ_b5il4mUmGBJkPe4uMiqiWgyvPn0
Message-ID: <CAMRc=MfdBd6HBwM4F1TcjDvwbOJ03kxgRk4hJQ8HFK7Wz2XBAg@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/imagination: Use pwrseq for TH1520 GPU power management
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

On Sat, Jun 14, 2025 at 8:09=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>
> To cleanly handle the TH1520's specific power requirements in the
> generic driver, this patch implements the "driver match data" pattern. A
> has_pwrseq flag in a new pvr_soc_data struct is now associated with
> thead,th1520-gpu compatible string in the of_device_id table.
>
> At probe time, the driver checks this flag. If true, it calls
> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
> probe on failure. In this mode, all power and reset control is delegated
> to the pwrseq provider. If the flag is false, the driver skips this
> logic and falls back to its standard manual power management. Clock
> handles are still acquired directly by this driver in both cases for
> other purposes like devfreq.
>
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), are modified to call pwrseq_power_on() and
> pwrseq_power_off() respectively when the sequencer is present.  A helper
> function, pvr_power_off_sequence_manual(), is introduced to encapsulate
> the manual power-down logic.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

>
> +static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       err =3D reset_control_assert(pvr_dev->reset);
> +
> +       clk_disable_unprepare(pvr_dev->mem_clk);
> +       clk_disable_unprepare(pvr_dev->sys_clk);
> +       clk_disable_unprepare(pvr_dev->core_clk);
> +
> +       return err;
> +}
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +266,10 @@ pvr_power_device_suspend(struct device *dev)
>                         goto err_drm_dev_exit;
>         }
>
> -       clk_disable_unprepare(pvr_dev->mem_clk);
> -       clk_disable_unprepare(pvr_dev->sys_clk);
> -       clk_disable_unprepare(pvr_dev->core_clk);
> -
> -       err =3D reset_control_assert(pvr_dev->reset);
> +       if (pvr_dev->pwrseq)
> +               err =3D pwrseq_power_off(pvr_dev->pwrseq);
> +       else
> +               err =3D pvr_power_off_sequence_manual(pvr_dev);
>
>  err_drm_dev_exit:
>         drm_dev_exit(idx);
> @@ -276,44 +289,55 @@ pvr_power_device_resume(struct device *dev)
>         if (!drm_dev_enter(drm_dev, &idx))
>                 return -EIO;
>
> -       err =3D clk_prepare_enable(pvr_dev->core_clk);
> -       if (err)
> -               goto err_drm_dev_exit;
> +       if (pvr_dev->pwrseq) {
> +               err =3D pwrseq_power_on(pvr_dev->pwrseq);
> +               if (err)
> +                       goto err_drm_dev_exit;
> +       } else {
> +               err =3D clk_prepare_enable(pvr_dev->core_clk);
> +               if (err)
> +                       goto err_drm_dev_exit;
>
> -       err =3D clk_prepare_enable(pvr_dev->sys_clk);
> -       if (err)
> -               goto err_core_clk_disable;
> +               err =3D clk_prepare_enable(pvr_dev->sys_clk);
> +               if (err)
> +                       goto err_core_clk_disable;
>
> -       err =3D clk_prepare_enable(pvr_dev->mem_clk);
> -       if (err)
> -               goto err_sys_clk_disable;
> +               err =3D clk_prepare_enable(pvr_dev->mem_clk);
> +               if (err)
> +                       goto err_sys_clk_disable;
>

In order to decrease the number of if-elses, would it make sense to
put the "manual" and "pwrseq" operations into their own separate
functions and then store addresses of these functions in the device
match data struct as function pointers (instead of the has_pwrseq
flag)? This way we'd just call them directly.

Bart
