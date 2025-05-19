Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED1284B2F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666779; cv=none; b=CkHv7wB/gClanLbwUcWRMuLTB3yg1TSOpwLXZn3KPIwIi1kfd++ire3GuSTdskkrN/6T5nHRFGXglyEQ5MegEa1X2b1W8ewVQNnzMr6eKa9wjWg7IHb8BDmCsAFJml33MaoECY66CF7Lzcz/Gcz/4/RHjwCdBw0OncRtIyXyp2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666779; c=relaxed/simple;
	bh=7oSkyG6mSA89oGxPnxCMu+L1kjgYHryzmDKNjMLyeNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6j51HrP5UVxAKmtip0uyvu9Jeil7Yyw5ia7EZ6bZd26FpTU7FGvrRRiJkDUqOZpfgIRmsZY1a1x1l/CIyDTfFToLzoKxJOHjlqLcnW0HQ3L91vguRcOEBJAHu38+hNPxSeX8LIYpmssCslgsUIrK1ZDaKJx0IXKGJNrNyvYR5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTqe0j+F; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTqe0j+F"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231ecbe2a5dso2244385ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747666777; x=1748271577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
        b=fTqe0j+Fu108CU1OGj5JpuQQZKg3pQvP4WCyfKSQvxjXSWpmWN5YiCwmAqeLglqix0
         n8IghLRI8de/MDObs1yYryHTiQFiXoFV/zvvuHJxBUr6vOAk3DmVy31UOwIGbe51/T4z
         00OrSPKjwayhJBHrDGX1p/8UY7Rz6NgfBSOFy4y6Z6p7I/Gz7xCPK2p0y8c0STsbCPXW
         oUpUFCTNfEed9Cb334RqjUjUPRiR3SsGY7Ywtvm0R5X1DvqjjTuugarbQmWQ9i8oPGck
         lHcouwJNj229j1sd6YmnFrlGCRC7yODYwvBdyDyLAJVyhThshqabXXzor98PnjAuwSbm
         QfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747666777; x=1748271577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJbKnQ6THaOIWWHkWKM4XnXv59kQm5WmU7EOv3ddOfo=;
        b=XFDH8RJSsE6TUMyEVuL7jyYx9ItIUPKpp72bET789AUa1rpnKabqI2C9eEj0W0FEQI
         5nGzYhFe/Dqp6806RiCv6oM9IrU1YyNojnPBnw1L+VVKiTDLkTzDQxF6DqWfDk1as4MC
         l/yJ31L7fBcyxxnI25IoD0yeOix5EU3FZLIaj9YuDEDAZZgTeKmPXpgwWRL5wpSH/iZc
         5zJQ306YH+Iu81eRbTm/2sE6lB2t9tz7C9V0nRJYYypwTsyOeHKBj3j2cekECFkyUAJl
         AsLbdhyF/o+nc/JpfCPj7LhkiwcqGeein2Q2Fykw3l+vMxRe5a5HR6+0R9ldr8yp/Qkw
         1jeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjO+PTeg07Jz98FS7WN0tYq92/DM7ELM9yk4M9UTLEZQdFUnAlq+JUMh9yeXsvJ7cQDLsMmrdTOjWFBE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrJnEJOTo86wEW9Nv3q75GqyLCElLZjT8WAzkqkH7S4tdmaVe
	O2wVvxfPalLeGMeV/Ocx29S4K7X6X0boLEOl0FD7Q5KyAv3C5T0o+EMNCWEVdigWoKM5MXC87Sb
	t9Y0c89V/OaD/jBJXpWB5+LdJWhFU3Ro=
X-Gm-Gg: ASbGncuL8br7ZO9Jva8FbAhJvssH7XubNllqmowyl0e6onZxeuEsyapMo/6mAbQ8q5k
	heqy3ijP3zxRfqz1uu/AAC3Fw44fn6DJs6YvJEpZZ5/JBnMFaaQ/AalCyFm30qZ+ejxGRhnJ7GG
	27Xtn+1zTsm+v9qeYPou4y/h9+LFjdMOi7rg==
X-Google-Smtp-Source: AGHT+IHLS/MC9ULQUfEueaLkKs2Re4yb5qkf2UfVq+r3wklL/AUqeNW5UH4uETMeYpvy3Y7FlPakYzri3fcicI5uAZA=
X-Received: by 2002:a17:902:cf07:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-231d437f0damr66974215ad.1.1747666777173; Mon, 19 May 2025
 07:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:59:25 -0400
X-Gm-Features: AX0GCFsSRi45LP3otZw9uo5k9qEKoUzLkQAZiNfSWJQGWEj7HNf0_zawacqQN8Y
Message-ID: <CADnq5_PSfZ+jMMAXb427TF1Z0qQBq_kgZVo+3qfrXkFxJTSzRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 8:38=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/atombios.h | 2 +-
>  drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/a=
tombios.h
> index 2db407892..b961096a4 100644
> --- a/drivers/gpu/drm/radeon/atombios.h
> +++ b/drivers/gpu/drm/radeon/atombios.h
> @@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
>  #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE              =
  0x01
>  #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                             =
  0x02
>  #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                       =
  0x08
> -#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                             =
  0x10
> +#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                             =
  0x10
>
>  /***********************************************************************=
***********************************************
>    ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
> diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_=
dpm.c
> index 55dbf450b..4aa050385 100644
> --- a/drivers/gpu/drm/radeon/kv_dpm.c
> +++ b/drivers/gpu/drm/radeon/kv_dpm.c
> @@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_de=
vice *rdev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(rdev,
> --
> 2.39.5
>
