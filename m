Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC446299CD9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637367; cv=none; b=iVY/X5LqJ+0n5WOA5iUsTsd19ABiy7o34/H8hJMoW1MWh31OoXM+h6SCq23du+KLFD4v+p26cbF4+vIbWTyUOeiwIeLrRKQDg4Q15k9j/R3/g4V10WQIX/QYvUNoSXonvErR0mLW8ed9n3qNWguXDxvXa8EC1bxRTXVyEdD+NCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637367; c=relaxed/simple;
	bh=qsEin6BSteemoAydFk8Sa2k6YykFa7GlJ0Q/uY88Pg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcVA4uS59cL1f/xrtl5+QYBgiTnu5pdQ6Hq2JTsZC+N4uUXsZVtfbSHXO9UcGDL107UGsX2nbIjypIy+8F5owDluoHXe0HicGi/AcbOAmeJ7TCV3Y69QkvHcIUWhFNXHnYEZyn2XeaTNI03dLfZ7QCdvoTS3+USSfZUT0xCHO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cby0Fjw0; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cby0Fjw0"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5241abb9655so230090e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744637365; x=1745242165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIG3nYBZANIFgu52jyjhWW3N+y09Fbww46hgtWyndUw=;
        b=Cby0Fjw00R39aRkTMEGLgM8VX+6RmzRf9UcfeZ7YLTM/EPZDCjdeLsCI6Nc55Vr1dJ
         +gmQrn1smlWw0yKEq86OBYT4nYyd5Nm3LKLLnNAo01KGP5AGB0t4EqrsFcEN8K7AayS3
         pCBEd/U5ZtTuSqhfDDhw4H3ulJ1TAQEb6Fwvmsy7Ovsx3t0dPeDAir2Jc0Pd+bHKdjRS
         hljYuD+4aB66D30poTRUfarNkkak5lkTb8+xosE8NDdd3biN0nTtKvTGrbu3LWAyD/ie
         ApKvybv7aVIkiLXPdnEuCTfZe4++dkLBBHT/LBSjEu9wfW09a46aSBPsZyzgEMxWgOdG
         FjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637365; x=1745242165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIG3nYBZANIFgu52jyjhWW3N+y09Fbww46hgtWyndUw=;
        b=gaXyGGZZ3xrnQebAWGogP5nrGwXsnjq1leteMn1G7ipTK/orH2YBoToFzAT35iSyrO
         FaNHzVmRKtME1cY/noU+ktmgGeAYb7ig+DQ4UsaPG0Kae3xw7kQmv7Mm3a4T7cxOu2eQ
         J11kCrWOysmNEpNzNGyYtvqRp8RUcj+UyXZjrmV6xQXJK/7/nPQi95er20l8RNfmAwf+
         RR5XdYm1NDDckI/Es5eC3UeubsOle5ZqzZTZzd1lV/2Cjjoq+EvdBHVlhYIKZCfUAh6u
         6VpYJpkWHLFHqVHsDtO4PUvcxSzO2pXRqVocSOBW/uJeNvSnLH6OKFmf9AsDhVE86Nok
         NJvA==
X-Forwarded-Encrypted: i=1; AJvYcCX2pwUB6QikhSe6+Ki6r5PQIuyG0/rYs5UORLkqsgJJeqEBchPUKcBgKMBfm9LWY7gk9qU27TGNbPG5cmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXiAiLju2aqOKXxhJU1JcTjgh+O9A/tvROXXKJWrV8w1Wa2p+
	GoRE0GhjyX4t4u7avZhbQr+VK565R9unbZlZXNNJYRbLfgXhuvY96IrZRGhQJ/PrA04eNT9L068
	YZamkhxVx2tnMV+LV5wTwLajiRsU=
X-Gm-Gg: ASbGnct98uKcl8/mv9itzI784RH2yNLMeUj9HJiAb8jySE5LgRWCVYBfQBvpUFR/9sB
	ZOmJwE3YotDHf9I9kQvJrXb9goGlItaLOhH4x7dXk6QFoKj24g6OylgU7eVXPtp0IBD+4sLT/x5
	rIAqMRQp5wcqUz9VXNLBignWA+t5PL6b3D
X-Google-Smtp-Source: AGHT+IG6g+fPMqIcko5cV+T9c+jrMKIzJVLV4IR5A3Y/Uj+5/l+H4zy3gxbLj+sMLQriAlG/2Nxbv0zeR9OXLxHkxgE=
X-Received: by 2002:a05:6102:5e82:b0:4c3:52f:175b with SMTP id
 ada2fe7eead31-4c9e504ca1amr2508561137.6.1744637364455; Mon, 14 Apr 2025
 06:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414063611.2100-1-vulab@iscas.ac.cn>
In-Reply-To: <20250414063611.2100-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Apr 2025 09:29:12 -0400
X-Gm-Features: ATxdqUG4Qb2Ft6FqGFxR47VXph-78DAr6grKjDU9soRx-alt8lzMAqt-V5Z6ysU
Message-ID: <CADnq5_N_-0cd69Zh3zJ0k6xEVs5N7XoJQjdZp+v_kUvqHoTVRA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Fix wrong
 return value of fiji_populate_smc_boot_level()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
	Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:24=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:
>
> The return value of fiji_populate_smc_boot_level() is always 0, which
> represent the failure of the function. The result of phm_find_boot_level(=
)
> should be recored and return. An error handling is also needed to
> phm_find_boot_level() to reset the boot level when the function fails.
> A proper implementation can be found in tonga_populate_smc_boot_level().
>
> Fixes: dcaf3483ae46 ("drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unu=
sed variable 'result'")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2956..7d0cb3741b94 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -1600,19 +1600,28 @@ static int fiji_populate_smc_uvd_level(struct pp_=
hwmgr *hwmgr,
>  static int fiji_populate_smc_boot_level(struct pp_hwmgr *hwmgr,
>                 struct SMU73_Discrete_DpmTable *table)
>  {
> +       int result =3D 0;
>         struct smu7_hwmgr *data =3D (struct smu7_hwmgr *)(hwmgr->backend)=
;
>
>         table->GraphicsBootLevel =3D 0;
>         table->MemoryBootLevel =3D 0;
>
>         /* find boot level from dpm table */
> -       phm_find_boot_level(&(data->dpm_table.sclk_table),
> -                           data->vbios_boot_state.sclk_bootup_value,
> -                           (uint32_t *)&(table->GraphicsBootLevel));
> +       result =3D phm_find_boot_level(&(data->dpm_table.sclk_table),
> +                                    data->vbios_boot_state.sclk_bootup_v=
alue,
> +                                    (uint32_t *)&(table->GraphicsBootLev=
el));
> +       if (result) {
> +               table->GraphicsBootLevel =3D 0;
> +               return 0;

This will skip setting the voltages later below.

> +       }
>
> -       phm_find_boot_level(&(data->dpm_table.mclk_table),
> -                           data->vbios_boot_state.mclk_bootup_value,
> -                           (uint32_t *)&(table->MemoryBootLevel));
> +       result =3D phm_find_boot_level(&(data->dpm_table.mclk_table),
> +                                    data->vbios_boot_state.mclk_bootup_v=
alue,
> +                                    (uint32_t *)&(table->MemoryBootLevel=
));
> +       if (result) {
> +               table->MemoryBootLevel =3D 0;
> +               return 0;

Same here.

If you are intending to match the logic in
tonga_populate_smc_boot_level(), the existing code already does that
(minus the error message).  This change would break that.  Returning
early may break working devices.

Alex

> +       }
>
>         table->BootVddc  =3D data->vbios_boot_state.vddc_bootup_value *
>                         VOLTAGE_SCALE;
> @@ -1625,7 +1634,7 @@ static int fiji_populate_smc_boot_level(struct pp_h=
wmgr *hwmgr,
>         CONVERT_FROM_HOST_TO_SMC_US(table->BootVddci);
>         CONVERT_FROM_HOST_TO_SMC_US(table->BootMVdd);
>
> -       return 0;
> +       return result;
>  }
>
>  static int fiji_populate_smc_initailial_state(struct pp_hwmgr *hwmgr)
> --
> 2.42.0.windows.2
>
