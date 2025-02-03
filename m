Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2C20E00E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613219; cv=none; b=uq5gnWtlHquwfwemuqDfA7PMisn6QGBJgSkkhXJqo+6IxmnYJ14E8tao4yTabxI3/s+4ysAStyHp3vUJCQ0q2foyQrE8aCn4HsdP++U3fhoFbCxKcXpxX/H70KicLUfvR1103fMsTTe/C1cQMI4F58tM9nFUBeMwOka357phvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613219; c=relaxed/simple;
	bh=tMNjJRHiSav1UF2tPZmUTe3Jimi0LB/cQ+OmsnsydUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLS3QwvKRrQ11+GamRasygIbDzIglSJsQMs8/UPJhkEsQDVU4IVs1p20nckvuz5iCd225g6RNWLnuWnov2nytiVJCAPlQB1AJBQhupq17Zovoak9UI0fgr7+ingW1lH6Y/5XYv5OjRtU0nqkpgjt1EPaaNCbElLaEaiUZzLDJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqYrTfRZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqYrTfRZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so987342a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738613217; x=1739218017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KlE2Pf5IIVTTj2bUHtbNPbqvQ4Q71CGMLbh1XWWKvI=;
        b=QqYrTfRZ1F2IJTiUPKYykEzrTBcLtRVcQl+iyyDufxPEtoe/55uybz0/AQPVOl5hPd
         BavCefuieGi0stdycck5xyKerJ4Fyo7Sfrl6QU5rokVM64AuTMRAGm/8c4s8qkq/84EJ
         RuOVTZLBK6n1AQNmfqAEiiE4LSuzFOrZlGQMgLcusSp3FG/684xATMSHB+J7X4LDKWkI
         Q42acF8AIpgCk9LxSmxms3GUswDC9NrOjd579b4USfjrYEu6idQuzbqNd1b1Ko7gzAvU
         YmMCnnk+wWh7yg1odGpqjz/DNyHJ3oMzZeAZ6Azmrra81n8Yo2jw/yQ6VdrIPt6UaTi8
         vqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613217; x=1739218017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KlE2Pf5IIVTTj2bUHtbNPbqvQ4Q71CGMLbh1XWWKvI=;
        b=azuBzFWFNym7ruLyHyQT9wb1rDLCxsgw5CwbsjrvsWYBEkq6jbwnQwh/DfnybC9tOY
         V7gsn2wcoyKStr+InBHR8f+B3Bv8NYjNCFdeLZBB9q/1J/s4xWPuUQ+XBmno2EhbcKLY
         VR41uUkey7/GR1Mcr36zi/U1DcuX+u3gzLEl+/ewax+V6tTpAiWL6Dl3SU9YA1+N03cA
         V2T1qEmwpeyJypN3a8wnN4FXYq6wKdBdqxc65gm0Eis6gwFtXaNY+wLHO0GXOUVoo/DO
         39WsSSdLY30gKsAcjhL/60hDyWb0lceSJm4Emw5OOsAAt1JlwQ2LNXtYwhedGsz+WPKP
         GqrA==
X-Forwarded-Encrypted: i=1; AJvYcCV0SuBHRB+PtuKsnLRgMFGQfw3+nBsjNDQqsyT8hrVTMfk8fDnvMUUGAFu/GD/QsjfUvYiV5rK4ZrBy3W0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7XdR5W+yjjxRIECP2qoeuswXo4ebWUQk0jEjaLqpPwTxU8E4
	9gRboGNPgOraAmECdos99QP9/GSACPbcHMLiZtxv7VLx85RURLoN0U9wDeN6fts0KDsI9EeJPWC
	hSWVxvogPlgmDY6CUqh76bVtBYBs=
X-Gm-Gg: ASbGncv3osOgCUhIF47kba5rJ07S/27VXm9yu3rf4zEBNuDSHpYQeYYBjRMVzFBg2X3
	rMjm/c/6kHqE0w1b+iHveCIUwGvyR2H0cYzcRjgwZ2Ald/Hn/fRm/wKo4Tuu127mxAPePooIj
X-Google-Smtp-Source: AGHT+IGA2GSTAywDothE4aaZEQCG9KA2LcsMMkt66UMVbFpOJqEwBYBrQrWcw8DiefRUGMpJEudlEvmgH0uRPQ2DcTM=
X-Received: by 2002:a17:90b:5387:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f9b8c8ad8cmr542706a91.6.1738613216698; Mon, 03 Feb 2025
 12:06:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131-amdgpu-respect-config_frame_warn-v1-1-68255384492b@kernel.org>
In-Reply-To: <20250131-amdgpu-respect-config_frame_warn-v1-1-68255384492b@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2025 15:06:45 -0500
X-Gm-Features: AWEUYZk0GtNqRLHvGXHBa-bqtGt-kcqPR_WVOrpAlU7nAcGYHuK4kkpV-uBxenE
Message-ID: <CADnq5_PGjwPKL5UXf9Ucf79PxWXO0s9W=eOwBnMQbQrdYT-Urg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Respect user's CONFIG_FRAME_WARN more
 for dml files
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Fri, Jan 31, 2025 at 5:38=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Currently, there are several files in drm/amd/display that aim to have a
> higher -Wframe-larger-than value to avoid instances of that warning with
> a lower value from the user's configuration. However, with the way that
> it is currently implemented, it does not respect the user's request via
> CONFIG_FRAME_WARN for a higher stack frame limit, which can cause pain
> when new instances of the warning appear and break the build due to
> CONFIG_WERROR.
>
> Adjust the logic to switch from a hard coded -Wframe-larger-than value
> to only using the value as a minimum clamp and deferring to the
> requested value from CONFIG_FRAME_WARN if it is higher.
>
> Suggested-by: Harry Wentland <harry.wentland@amd.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Closes: https://lore.kernel.org/2025013003-audience-opposing-7f95@gregkh/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/Makefile  | 14 +++++++++-----
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile | 22 +++++++++++++---------
>  2 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/dr=
m/amd/display/dc/dml/Makefile
> index 46f9c05de16e8c9035f9e26c0b5c481c274d52ef..e1d500633dfad75e4f2265552=
be42a3e19dee6bf 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -29,11 +29,15 @@ dml_ccflags :=3D $(CC_FLAGS_FPU)
>  dml_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -frame_warn_flag :=3D -Wframe-larger-than=3D3072
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        frame_warn_limit :=3D 3072
> +    else
> +        frame_warn_limit :=3D 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag :=3D -Wframe-larger-than=3D$(frame_warn_limit)
> +    endif
>  endif
>
>  CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o :=3D $(dml_ccflags)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/d=
rm/amd/display/dc/dml2/Makefile
> index 91c4f3b4bd5f46ac5c1c74f665b06dbe61081917..21fd466dba26ef3359196d0b2=
6bc29125bb1507a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -28,15 +28,19 @@ dml2_ccflags :=3D $(CC_FLAGS_FPU)
>  dml2_rcflags :=3D $(CC_FLAGS_NO_FPU)
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> -frame_warn_flag :=3D -Wframe-larger-than=3D4096
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D3072
> -endif
> -else
> -frame_warn_flag :=3D -Wframe-larger-than=3D2048
> -endif
> +    ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
> +        ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_COMPILE_TEST),yy)
> +            frame_warn_limit :=3D 4096
> +        else
> +            frame_warn_limit :=3D 3072
> +        endif
> +    else
> +        frame_warn_limit :=3D 2048
> +    endif
> +
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag :=3D -Wframe-larger-than=3D$(frame_warn_limit)
> +    endif
>  endif
>
>  subdir-ccflags-y +=3D -I$(FULL_AMD_DISPLAY_PATH)/dc/dml2
>
> ---
> base-commit: 7f2b5237e313e39008a85b33ca94ab503a8fdff9
> change-id: 20250131-amdgpu-respect-config_frame_warn-739a9b24496e
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
