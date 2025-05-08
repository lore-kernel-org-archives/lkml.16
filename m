Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153B251782
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713167; cv=none; b=mCKZAap/8CvSfEOCAarR25YCHGn8oMpr+6SCNHCBLYUAPq5nH/XcWUUrnCoeYe9miBnoG33oKMhSTt+BJHkQ5TN0IIEZCa5kQty7sRYY9nutm6gbAZwVUfy8YiwLCR5+8CQHkugQMREzJqZAlsqWJx6e1Wm/5glJ+gYbM5xDvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713167; c=relaxed/simple;
	bh=eJ5pmJRcT7XP3AMX0dWjaR8b37AQWuWyH63FmptjgSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLcKS2pwiB03c37cV7c4z3rrcFgfs4AQ513cQjLKBwrpvuhAL/M/F8RKBFLtBiAGA3ecd1WvaJXM6fdJNeUoWlKJTtxewV/Y1bBa98BwJ2jixJBF+A9db5dYLH8K2Pcj9Y6nTO8my1is0FxAlXctxMyjdc9neX8fygojT6kydCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k51Ses/Y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k51Ses/Y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso137001a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713165; x=1747317965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbQp/KRC0IVxT/kMtQ7giIE+KOgEDHeh2E2/AS8vuiU=;
        b=k51Ses/YkfTldCA0GWPzFT8ogbfNzbM6JQ67fV/VRNTaArjHr9Q42/ZfFAOWDnbfaI
         jNczgEwcmaMp/oitcITyd/SHX8+ftjYfUw27FZg3fJ1A74WP7lEguRqXrK0MBiGDdoPx
         FMcSY4fPb/uM1H1RLifAGzZzS2jYsXGYukYpfL6YMyh+2U3l5fqaH+mSBTw5IjXSiSqQ
         xshd5+ad/MyC7MFx8ZlfcUs/Ktxe8sP7PuJwffrtVMo1sNiGBQzUA7B8PprSkbXwt8z3
         K1jR+fR6tYFg22fBtlk+kzq+6Y06WUq4ga7Lfi49yOuE69EgWAgRrvU3fHV6WV/16d1u
         gfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713165; x=1747317965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbQp/KRC0IVxT/kMtQ7giIE+KOgEDHeh2E2/AS8vuiU=;
        b=QPvPFkBknHchpRT+IR8KMZSL1U0cNaRTKv9PM3NHv5QHJDDeIw6kbQpkgbCyfZO/Z/
         ZqlkLIqqyyB1IJ0WjQn9B/qX4LyIu9+dCgD1i9rUKvbAQ4Hy1H+f/Liic7J/Ad4w7xRe
         3DQSRenzSFhFNVb83f7Upgfhp57C4pp76gKib/gmvPJ5xbN9Nr/0SeM0kt9xVQBsvDRx
         2dtSulPstM3udce+unW4sb5OWx4aggFFZIW3gB/hSjGgGKYoNGOIwr57cvRANcamgJRP
         GefpDNwgav3u2WhDvoTQKstdo+F/12ISVJVHcdfgx6hOOVtjs+1OKdxilLLgRYxnYGxq
         t4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVPzAANAbARJBhPwV9eRVIoUCUP+qgIOxjhNtfRzBtPqn2bCwQch1PaYKnzk5E4v6zwXHFDeJ1WlozI9os=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3MeD6xvIN2rtdhGfZaFnfq99lqr3tOdjmtXrtEQ0HkcHYmJt
	Bi7RO/w+d+1ygrR8E6DMmaxiXN9Z+0++3LXVplt+bdEQKM9z8zThrshol4XFicafdwnBdoXatNE
	l18ZIqkg4SccqYv6ZdHqsMf9dzI4=
X-Gm-Gg: ASbGnctehfvKJx3yPIchhiLR+2tp4jn8CzxESRZGkOGp6jHhc/GdO/AfPWLB3fAQhSZ
	XndPKba09KAWhw/BKN0C8VBnjgWBDVHog/pWuizMyTEOcye4mviocf+19NCmPQJ4hvA1xPS4cXk
	kh1G4GwQzU5TDMzNLZODORsQ==
X-Google-Smtp-Source: AGHT+IGnr+cgq2Nv3N9dRmyYwyiKtfSfrJghMTozRQm1mqT1rvXG/VKf59MwbXQ5c7kmHlluu/KqkKJwEor2ehAS/rk=
X-Received: by 2002:a17:90b:4b44:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-30aac08d4c1mr4431232a91.0.1746713164717; Thu, 08 May 2025
 07:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507170145.102508-1-linux@treblig.org> <20250507170145.102508-4-linux@treblig.org>
In-Reply-To: <20250507170145.102508-4-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 May 2025 10:05:51 -0400
X-Gm-Features: ATxdqUGsmBFMkRdl1HtB8ik5UvnObs3HpdZj2YMdIn6cJ4Zxd8j9SvDJlce_bYk
Message-ID: <CADnq5_M85g5rKvQqLvFqvTW0Lr0FBADfLev6aL3irZ58ibYfaQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/pm: Remove remainder of mode2_reset_is_support
To: linux@treblig.org
Cc: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied the series.

Thanks!

Alex

On Wed, May 7, 2025 at 1:13=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The previous patch removed smu_mode2_reset_is_support()
> which was the only function to call through the mode2_reset_is_support()
> method pointer.
>
> Remove the remaining functions that were assigned to it
> and the pointer itself.
>
> See discussion at:
> https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR1=
2MB5165.namprd12.prod.outlook.com/
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h           | 4 ----
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 6 ------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c      | 6 ------
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c    | 6 ------
>  4 files changed, 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/=
drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index a5ba37f57650..eb0a97dde71c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -1229,10 +1229,6 @@ struct pptable_funcs {
>          * @mode1_reset_is_support: Check if GPU supports mode1 reset.
>          */
>         bool (*mode1_reset_is_support)(struct smu_context *smu);
> -       /**
> -        * @mode2_reset_is_support: Check if GPU supports mode2 reset.
> -        */
> -       bool (*mode2_reset_is_support)(struct smu_context *smu);
>
>         /**
>          * @mode1_reset: Perform mode1 reset.
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/dr=
ivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index 19a25fdc2f5b..115e3fa456bc 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -3089,11 +3089,6 @@ static int sienna_cichlid_stb_get_data_direct(stru=
ct smu_context *smu,
>         return 0;
>  }
>
> -static bool sienna_cichlid_is_mode2_reset_supported(struct smu_context *=
smu)
> -{
> -       return true;
> -}
> -
>  static int sienna_cichlid_mode2_reset(struct smu_context *smu)
>  {
>         int ret =3D 0, index;
> @@ -3229,7 +3224,6 @@ static const struct pptable_funcs sienna_cichlid_pp=
t_funcs =3D {
>         .get_default_config_table_settings =3D sienna_cichlid_get_default=
_config_table_settings,
>         .set_config_table =3D sienna_cichlid_set_config_table,
>         .get_unique_id =3D sienna_cichlid_get_unique_id,
> -       .mode2_reset_is_support =3D sienna_cichlid_is_mode2_reset_support=
ed,
>         .mode2_reset =3D sienna_cichlid_mode2_reset,
>  };
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 83163d7c7f00..38fbe0ddc4e6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -1976,11 +1976,6 @@ static bool aldebaran_is_mode1_reset_supported(str=
uct smu_context *smu)
>         return true;
>  }
>
> -static bool aldebaran_is_mode2_reset_supported(struct smu_context *smu)
> -{
> -       return true;
> -}
> -
>  static int aldebaran_set_mp1_state(struct smu_context *smu,
>                                    enum pp_mp1_state mp1_state)
>  {
> @@ -2086,7 +2081,6 @@ static const struct pptable_funcs aldebaran_ppt_fun=
cs =3D {
>         .set_pp_feature_mask =3D smu_cmn_set_pp_feature_mask,
>         .get_gpu_metrics =3D aldebaran_get_gpu_metrics,
>         .mode1_reset_is_support =3D aldebaran_is_mode1_reset_supported,
> -       .mode2_reset_is_support =3D aldebaran_is_mode2_reset_supported,
>         .smu_handle_passthrough_sbr =3D aldebaran_smu_handle_passthrough_=
sbr,
>         .mode1_reset =3D aldebaran_mode1_reset,
>         .set_mp1_state =3D aldebaran_set_mp1_state,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index c478b3be37af..c529859c83ab 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -2849,11 +2849,6 @@ static bool smu_v13_0_6_is_mode1_reset_supported(s=
truct smu_context *smu)
>         return true;
>  }
>
> -static bool smu_v13_0_6_is_mode2_reset_supported(struct smu_context *smu=
)
> -{
> -       return true;
> -}
> -
>  static int smu_v13_0_6_smu_send_hbm_bad_page_num(struct smu_context *smu=
,
>                                                  uint32_t size)
>  {
> @@ -3586,7 +3581,6 @@ static const struct pptable_funcs smu_v13_0_6_ppt_f=
uncs =3D {
>         .get_pm_metrics =3D smu_v13_0_6_get_pm_metrics,
>         .get_thermal_temperature_range =3D smu_v13_0_6_get_thermal_temper=
ature_range,
>         .mode1_reset_is_support =3D smu_v13_0_6_is_mode1_reset_supported,
> -       .mode2_reset_is_support =3D smu_v13_0_6_is_mode2_reset_supported,
>         .mode1_reset =3D smu_v13_0_6_mode1_reset,
>         .mode2_reset =3D smu_v13_0_6_mode2_reset,
>         .wait_for_event =3D smu_v13_0_wait_for_event,
> --
> 2.49.0
>
