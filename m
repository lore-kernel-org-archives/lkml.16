Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59922094
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187670; cv=none; b=IX9neY1VeUT7SB/v+B5kIDzVKwu2Kik5XrkTRq/Uaq0jP+Alk1lnMkX8tNCwqoeLYYUlDcwmQfmDsnPZgpBsX0UYqwUebQpnyttq9R46lMXqNW99hzhbsOEzrgy+jaosZaxQN0F1ilTYBkBTCf9A+2IkHyzdJFjjSzACj3oQFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187670; c=relaxed/simple;
	bh=GHOKahoG9CWMz1lQLck1AhqJdvINwU6zT5Zcdu6eHqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atvMVOFKAjZJ+Mix7Tn4BCBe4qUFp5jIJZPKPzfL9/vMmImIN6eD9lXVveZZnCj8M9227+Z33s73yD/J/8EYyGj6LQAmNqy11snCMwOGYPYFGx+adznBsZ0/u4TyFKdyt6w2TeHsauJFelJrv/eMMf/CQYXHf6iMeseTEYYaoiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4e1aVBd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4e1aVBd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso640742a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743187669; x=1743792469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
        b=S4e1aVBdOFptoGRI5uUu3EUrB+BwVilrg/eBG8h/c099GKxIgCKgCzcDH9d8NjwAwN
         tJG7+SQ7Xt8+4STIwGrh1WayA3JuEhSn3PGbVEdG2HFpWEljryALk4pV+ERkM1pp6cIR
         8SsiWlPeTqTkjXhbn8V9t2R0gLbdPZ+ZlTuL9kJZD6k5FvdDUBm0SNHlNbHuGhGx/tzu
         UGS4AqH9Lo8yGaF2g/vKFBNLUzEmW+kAVEZGzP8AQHr0F36O/lCRnmnKVH7pMCpWYYV6
         2dUnOdDLX0ehkMnXIMASVhScslDOCAQFHuB447G7lTAoFMaAV6PntTwRMazeHeoXj2tO
         rffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187669; x=1743792469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZaBQSGCWBE4y8Yxfb/IZp7h2QC6U5lj6cYuHqPma8Y=;
        b=R1bf7W0HKb15ky0uMk9LTVhLiDeLPt7w2ExAxf2mMiDtCdJveraOHvsb8n9lyBE6WU
         NisL/A0eU114vxeyhjHKiqPDlbFG0ZxDblN2wv9ZVIqf7/EEsDEPJfx+tMi0sbXgqhjT
         2gYyHD0lI6Z1/ktly8jdfkP7CMNIem+2Me6ByTX7AXy/dIDvIQbHFa1uEOWkgF/aywcW
         u438Ri8x4Jm4Qpsj0InZZs+NKTqAU9gunnNcfMhHcDxuHNbLITA5SRjWE+hyL65mYXVn
         +fa3w031lZ8eXAGGnfxTTi6nhd8NEJpGMjarEcas2G64MgcyaqjzGE4lxE054+aJ97se
         g1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWS+5CxKAGZ1rbgRUgOoX0GbQ32GcnISbyg4wAF4ObP8lK8nqbF5lEnZ3l9TIy9gdG0025+Lfg8Eb6ydwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4IhptQEQoDVaDgW4Apr/HN69w9gM4otV9/fmVmka+yAQuAZA4
	JAD5iPoOMkrvLWy3EtIpyekQ2orxYiaMCPvxABZHO8toAP5aUegv+jl2+ggMoU7OsTrqELtU+Zv
	6mVy64EhLLNEK6LEfxRDl6jF5P6U=
X-Gm-Gg: ASbGncs4B/+sHTRg2ozegSA1NXXHXKnrxeofmP//2IDFYHqNyRJdoM1WcwZ9UncrtaZ
	6Pxdh0wGAy/OBgFI+eQKqy24JNitgteGDOq8c7fCb5pmdUjQGeYqg5zah2q6safZGznhgXqqkCo
	bpbaZhaNK6Ujj8ljC1pb2sKK0YmQ==
X-Google-Smtp-Source: AGHT+IGged0fiKJixaESzWEycujCFhGP10Um4mqXsySmBso06gxn7OacXwS/hBBtYkJHKWSaCbjdAnUtABiTT1XdSmY=
X-Received: by 2002:a17:90b:3e8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-305321512bdmr184984a91.3.1743187668589; Fri, 28 Mar 2025
 11:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328032942.16264-1-bold.zone2373@fastmail.com>
In-Reply-To: <20250328032942.16264-1-bold.zone2373@fastmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Mar 2025 14:47:36 -0400
X-Gm-Features: AQ5f1Jq8EA08dieD66Twx8lZwHUaFgRa-kOz_qrrVj6oWZ2bGitqfzj7vLQrjb4
Message-ID: <CADnq5_M63JAhaqoe4OndwmcQN-Sw2NOYfGsd2wgsix_LqNnnjA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: removed unused function
To: James Flowers <bold.zone2373@fastmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Thu, Mar 27, 2025 at 11:37=E2=80=AFPM James Flowers
<bold.zone2373@fastmail.com> wrote:
>
> Removed unused function mpc401_get_3dlut_fast_load_status.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h     | 17 -----------------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c  | 11 -----------
>  .../drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h  | 14 --------------
>  3 files changed, 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/dr=
m/amd/display/dc/inc/hw/mpc.h
> index 3a89cc0cffc1..eaef3899da7b 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -967,23 +967,6 @@ struct mpc_funcs {
>         */
>
>         void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_i=
d, int hubp_idx);
> -       /**
> -       * @get_3dlut_fast_load_status:
> -       *
> -       * Get 3D LUT fast load status and reference them with done, soft_=
underflow and hard_underflow pointers.
> -       *
> -       * Parameters:
> -       * - [in/out] mpc - MPC context.
> -       * - [in] mpcc_id
> -       * - [in/out] done
> -       * - [in/out] soft_underflow
> -       * - [in/out] hard_underflow
> -       *
> -       * Return:
> -       *
> -       * void
> -       */
> -       void (*get_3dlut_fast_load_status)(struct mpc *mpc, int mpcc_id, =
uint32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow);
>
>         /**
>         * @populate_lut:
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> index ad67197557ca..98cf0cbd59ba 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c
> @@ -47,16 +47,6 @@ void mpc401_update_3dlut_fast_load_select(struct mpc *=
mpc, int mpcc_id, int hubp
>         REG_SET(MPCC_MCM_3DLUT_FAST_LOAD_SELECT[mpcc_id], 0, MPCC_MCM_3DL=
UT_FL_SEL, hubp_idx);
>  }
>
> -void mpc401_get_3dlut_fast_load_status(struct mpc *mpc, int mpcc_id, uin=
t32_t *done, uint32_t *soft_underflow, uint32_t *hard_underflow)
> -{
> -       struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> -
> -       REG_GET_3(MPCC_MCM_3DLUT_FAST_LOAD_STATUS[mpcc_id],
> -                       MPCC_MCM_3DLUT_FL_DONE, done,
> -                       MPCC_MCM_3DLUT_FL_SOFT_UNDERFLOW, soft_underflow,
> -                       MPCC_MCM_3DLUT_FL_HARD_UNDERFLOW, hard_underflow)=
;
> -}
> -
>  void mpc401_set_movable_cm_location(struct mpc *mpc, enum mpcc_movable_c=
m_location location, int mpcc_id)
>  {
>         struct dcn401_mpc *mpc401 =3D TO_DCN401_MPC(mpc);
> @@ -618,7 +608,6 @@ static const struct mpc_funcs dcn401_mpc_funcs =3D {
>         .set_bg_color =3D mpc1_set_bg_color,
>         .set_movable_cm_location =3D mpc401_set_movable_cm_location,
>         .update_3dlut_fast_load_select =3D mpc401_update_3dlut_fast_load_=
select,
> -       .get_3dlut_fast_load_status =3D mpc401_get_3dlut_fast_load_status=
,
>         .populate_lut =3D mpc401_populate_lut,
>         .program_lut_read_write_control =3D mpc401_program_lut_read_write=
_control,
>         .program_lut_mode =3D mpc401_program_lut_mode,
> diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h b/dri=
vers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> index ce6fbcf14d7a..8e35ebc603a9 100644
> --- a/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.h
> @@ -241,23 +241,9 @@ void mpc401_update_3dlut_fast_load_select(
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  void mpc401_update_3dlut_fast_load_select(
>         struct mpc *mpc,
>         int mpcc_id,
>         int hubp_idx);
>
> -void mpc401_get_3dlut_fast_load_status(
> -       struct mpc *mpc,
> -       int mpcc_id,
> -       uint32_t *done,
> -       uint32_t *soft_underflow,
> -       uint32_t *hard_underflow);
> -
>  #endif
> --
> 2.49.0
>
