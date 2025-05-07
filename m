Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A60D2147F6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630647; cv=none; b=buGbrBhrquNz+FLbbyhtyWkfS5eL6Kz86C8cOUNkoTUlVDe9hXC0PIX51KqBo/gnN272JTv3W0upQdkaMHTmHd9UA/AmMy0PLUGJ4tcHnsF4MLbdGyL/dSIHkftWNP/msTVuRulVqrv15mCyll+2cHBKIiP5CUogKpK2IC7TrXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630647; c=relaxed/simple;
	bh=lwAlqY1UhzZgMN3vdEchqmpXPEQEntKECmVwLeE0ysg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFME2VmwemkwMxPYqRxKG8GM3QEBfoqImHyfzW1syPLZFBKRdkIp5soNl5fAPKBFNUFHhwS5H7klwlkR57s2WF2In+VAMNSiY8CqeH4v92x282iylmAhQL2T6h/WRTgcT5Oo9oGak3XbXqcKpso0QtxV9KtqToWRHVArJWn+j3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1IK6YkC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1IK6YkC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a8caca5c8so1009a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630644; x=1747235444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr7SlBb+Mxic3W0vjBKAoi3hgA/5VfbFQVNl/yBWl2M=;
        b=k1IK6YkCxMRGBB1y5AkgRmO+8W/zhEgZ2I7dXer/MGAq4ux3MzyXDHMWxi8DlWDlvp
         FVxw0E1pw23q1Uk4KUVAKwJM63kv7NE0iy4ZzVUxZIQ52ZEBmGUkw0BL6U4D9WUHCklV
         Wmlm9JtwEPRAkW4y4verUlK/o0KUDCwARHydKMIYJ0R0uQyiBWkObfUwDSdd4oOZ9Q5H
         HZ+gF0FoP4LLOrYVr1zVoZrQxe/hTXm98z5u1A2/S0tr8wuzXTbSMcJwrrLlcYQKvHSf
         G15ymefbav+NhN0h1wFtzEOq2Bei1EQiBTCtIRMtrnQTNV2ktyTWBc71ccZ4M7TeG1A6
         Xdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630644; x=1747235444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr7SlBb+Mxic3W0vjBKAoi3hgA/5VfbFQVNl/yBWl2M=;
        b=lwLMYXj36oucA28VxwxlUynNThto4YWiqkVK4X5tZx98Dz8ahBiRhZipLe/oLZ/CAS
         a3Dnipmos7G7Kty1YtsnMTRfujr65ymDfMmk+zTylnQypoyqreCixMNl0WoQNP5oSqrZ
         PmxND3Wly7U7DTRgVYOevr71qWOhVifT2dCsFhCXFeax3jGNx8C5C5llDJFfFMMVTpaS
         DxtyxgfvMCy5vcKiDzrVveS4b5aRdTO3ihhx71zaEx2LEivVRtxizVEzZ+QU9KfavVXR
         iEqU8ozuI7ZcTqr/8je5ByYjD56Br9dhWij3q2kSjexevapFEKRs+pCayDNAz8LI+cEc
         ypjg==
X-Forwarded-Encrypted: i=1; AJvYcCXeISC8McQSq1mVOL9RxFV0bh4M1UZtfc3xnH3uwTh+lqHmrcOW7yG5wjspADdWgLBDUgBLiIsdrHhL7WQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/LQLTLb7fnxIwjzbZetTikrgI+2UAi5usc7kkCa/T4HD2DcE
	Xi+ylOCfqKuoLLdE7+dEKt9VWVCDPXqkCXNT5UuLEyCRgfsG0lEqHaTt0sIeC4tRlyTdxy+npaB
	5s3G0dbN59peyBpAD/8eBvbqbQMk=
X-Gm-Gg: ASbGncvxHnOVa0U3gKWhShxyvQDz7XXQsPTWqDJ8jD5Ih/2l6E4RAIyW4Yum/T+CAwa
	N0d69qU+i7xP6TGqPocJmPn6agkk0vbBCCIuh1DuwvYW3OgmqLz4q74umgbJ3H2lqRoLVxXruRE
	ufojvvMTzxRFWYSGE1y3tiHw==
X-Google-Smtp-Source: AGHT+IHs751kgovWTS/yqPwWIwj5rYGwaenWwA5o/tymdJxAfSymJ3o5v+LKLXXv/sRdy8BfgThzhohaNXNRvPfXyxM=
X-Received: by 2002:a17:90b:3882:b0:30a:a51c:5f48 with SMTP id
 98e67ed59e1d1-30aac26b85fmr2036308a91.8.1746630644306; Wed, 07 May 2025
 08:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507002425.93421-1-linux@treblig.org> <20250507002425.93421-4-linux@treblig.org>
In-Reply-To: <20250507002425.93421-4-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 May 2025 11:10:32 -0400
X-Gm-Features: ATxdqUE3O2iczVjE8Eax_qzR85S_kXa9idjGqD3mrYnEK2wwEG3f3vkjlSdNm00
Message-ID: <CADnq5_PPpDSY8o6Ru7nrE1q=xaboKJDjG7WiUhDdX8G9Kz00eQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/pm/smu13: Remove unused smu_v3 functions
To: linux@treblig.org
Cc: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied the series.  Thanks!

Alex

On Tue, May 6, 2025 at 8:33=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> smu_v13_0_display_clock_voltage_request() and
> smu_v13_0_set_min_deep_sleep_dcefclk() were added in 2020 by
> commit c05d1c401572 ("drm/amd/swsmu: add aldebaran smu13 ip support (v3)"=
)
> but have remained unused.
>
> Remove them.
>
> smu_v13_0_display_clock_voltage_request() was the only user
> of smu_v13_0_set_hard_freq_limited_range().  Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  12 ---
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 101 ------------------
>  2 files changed, 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/d=
rm/amd/pm/swsmu/inc/smu_v13_0.h
> index cd03caffe317..6f74783472e5 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> @@ -183,13 +183,6 @@ int smu_v13_0_disable_thermal_alert(struct smu_conte=
xt *smu);
>
>  int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value);
>
> -int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32=
_t clk);
> -
> -int
> -smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
> -                                       struct pp_display_clock_request
> -                                       *clock_req);
> -
>  uint32_t
>  smu_v13_0_get_fan_control_mode(struct smu_context *smu);
>
> @@ -226,11 +219,6 @@ int smu_v13_0_get_dpm_ultimate_freq(struct smu_conte=
xt *smu, enum smu_clk_type c
>  int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu, enum =
smu_clk_type clk_type,
>                                           uint32_t min, uint32_t max, boo=
l automatic);
>
> -int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
> -                                         enum smu_clk_type clk_type,
> -                                         uint32_t min,
> -                                         uint32_t max);
> -
>  int smu_v13_0_set_performance_level(struct smu_context *smu,
>                                     enum amd_dpm_forced_level level);
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index ba5a9012dbd5..03242f65e262 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -709,18 +709,6 @@ int smu_v13_0_notify_memory_pool_location(struct smu=
_context *smu)
>         return ret;
>  }
>
> -int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32=
_t clk)
> -{
> -       int ret;
> -
> -       ret =3D smu_cmn_send_smc_msg_with_param(smu,
> -                                             SMU_MSG_SetMinDeepSleepDcef=
clk, clk, NULL);
> -       if (ret)
> -               dev_err(smu->adev->dev, "SMU13 attempt to set divider for=
 DCEFCLK Failed!");
> -
> -       return ret;
> -}
> -
>  int smu_v13_0_set_driver_table_location(struct smu_context *smu)
>  {
>         struct smu_table *driver_table =3D &smu->smu_table.driver_table;
> @@ -1073,56 +1061,6 @@ int smu_v13_0_get_gfx_vdd(struct smu_context *smu,=
 uint32_t *value)
>
>  }
>
> -int
> -smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
> -                                       struct pp_display_clock_request
> -                                       *clock_req)
> -{
> -       enum amd_pp_clock_type clk_type =3D clock_req->clock_type;
> -       int ret =3D 0;
> -       enum smu_clk_type clk_select =3D 0;
> -       uint32_t clk_freq =3D clock_req->clock_freq_in_khz / 1000;
> -
> -       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) =
||
> -           smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
> -               switch (clk_type) {
> -               case amd_pp_dcef_clock:
> -                       clk_select =3D SMU_DCEFCLK;
> -                       break;
> -               case amd_pp_disp_clock:
> -                       clk_select =3D SMU_DISPCLK;
> -                       break;
> -               case amd_pp_pixel_clock:
> -                       clk_select =3D SMU_PIXCLK;
> -                       break;
> -               case amd_pp_phy_clock:
> -                       clk_select =3D SMU_PHYCLK;
> -                       break;
> -               case amd_pp_mem_clock:
> -                       clk_select =3D SMU_UCLK;
> -                       break;
> -               default:
> -                       dev_info(smu->adev->dev, "[%s] Invalid Clock Type=
!", __func__);
> -                       ret =3D -EINVAL;
> -                       break;
> -               }
> -
> -               if (ret)
> -                       goto failed;
> -
> -               if (clk_select =3D=3D SMU_UCLK && smu->disable_uclk_switc=
h)
> -                       return 0;
> -
> -               ret =3D smu_v13_0_set_hard_freq_limited_range(smu, clk_se=
lect, clk_freq, 0);
> -
> -               if (clk_select =3D=3D SMU_UCLK)
> -                       smu->hard_min_uclk_req_from_dal =3D clk_freq;
> -       }
> -
> -failed:
> -       return ret;
> -}
> -
>  uint32_t smu_v13_0_get_fan_control_mode(struct smu_context *smu)
>  {
>         if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT)=
)
> @@ -1647,45 +1585,6 @@ int smu_v13_0_set_soft_freq_limited_range(struct s=
mu_context *smu,
>         return ret;
>  }
>
> -int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
> -                                         enum smu_clk_type clk_type,
> -                                         uint32_t min,
> -                                         uint32_t max)
> -{
> -       int ret =3D 0, clk_id =3D 0;
> -       uint32_t param;
> -
> -       if (min <=3D 0 && max <=3D 0)
> -               return -EINVAL;
> -
> -       if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
> -               return 0;
> -
> -       clk_id =3D smu_cmn_to_asic_specific_index(smu,
> -                                               CMN2ASIC_MAPPING_CLK,
> -                                               clk_type);
> -       if (clk_id < 0)
> -               return clk_id;
> -
> -       if (max > 0) {
> -               param =3D (uint32_t)((clk_id << 16) | (max & 0xffff));
> -               ret =3D smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetH=
ardMaxByFreq,
> -                                                     param, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       if (min > 0) {
> -               param =3D (uint32_t)((clk_id << 16) | (min & 0xffff));
> -               ret =3D smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetH=
ardMinByFreq,
> -                                                     param, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return ret;
> -}
> -
>  int smu_v13_0_set_performance_level(struct smu_context *smu,
>                                     enum amd_dpm_forced_level level)
>  {
> --
> 2.49.0
>
