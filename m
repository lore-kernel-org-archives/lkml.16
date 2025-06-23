Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5451F582A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750713208; cv=none; b=o5b9pViOf+xuwsIDjjaxAGJmri/l614Os1aXYL1gyZ3dX+GGErMVIQJutZSMmGu1L2r/N9A7KNYXkevOSwD5f3JSlnGI14lzjIvMn5LPpOYerrv3i564szrvNYH38yatlFXQami23vhhZs0u8hcqMTsnzKcX/gMuh7xGGYJ3LAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750713208; c=relaxed/simple;
	bh=VWVsRSpyp9om8/0KWgL7tdZWKKjdTWeTGhICGGbTzpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COYsElXniVfk36UtkYg1vJn/OQ2fMn0xzBGQpp+Rt6XQCMrj9s2lESkkPawDZUzL9I27fKI3aXNyZgNuM8gG3IQPpI7b76q6EALoQfZ25pOZljJgiThQQ7L93YyvP05DEmB1kir0d/TpLRi+8sAEns9XB5xh1w3WbOsHugLe+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3MVLPR6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3MVLPR6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ef29524fso9506895ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750713206; x=1751318006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qSuUz61O9R9DWRc6hYpmGsRWTEUvwzmHUEHSLXNcDM=;
        b=O3MVLPR670k+1He66AaFNXCYA36ywtvi8l3DF4vkIzuQx8oKRVqoq2ryuPii8AcTCv
         T94cZ4JO+//W4cMjY50l+/FQczCCmGNGndqV5M0RRzXkBcNAubU9hHPsLAt3ZwbwDdLp
         Q0GhlZVaD2WqGUa3UCYPsPwrbOXng0kZO+oLWNY1iOft469101m4wYiBaFCx7DBkslL4
         5vo7y4dtyllsJhp0fJ+464pa4drL9FFXIKTYAlkYH7GnU5sdyceTj7PLdL2jB6ZkzJZU
         Tvc9m4uy4gepOp1kEkYQcVRpUWAk+Iri66D+izK22bMkFc+aDZRQSFZVQGLyWcg+bVQy
         kTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750713206; x=1751318006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qSuUz61O9R9DWRc6hYpmGsRWTEUvwzmHUEHSLXNcDM=;
        b=SMnmeCV9MD4Cp29Q8SgPlczfE6dlj4Xd7T8ZMkkCZ7WZgE8x51FVaEG0NJiwdHbwGP
         rMYF23JBACrGBtGW9URHrYbUKhFrdgtbdRAEQ346JZmKhyHIfzC99QM+G0BQp/WJAgd0
         6iSRMODibvRpuC2x8nGzgy5ERmNmARedA3iaJDyOYiEeSW9KHE/I3H8OEcloUM8rwTfD
         CGMCn5VWdHzarDcz9Ebbu5GpShDU70GiNTJ0yJaarj8h0GaK86eO8yJR9seRF0EQoqme
         itt9lvW1R+s2vAa/GIOP/N81xAtL8cXro+vpw/5kAh9mo5zm27RZOGrqvaI4Czj0hJbG
         g1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVwS7qNInxk02NKVHyqE4nvOt0GlIi7Refgsg8auQ0W/di1+AIe3HKGLkrAC1aDRzB7yNManE5EXrEy0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++gfArkH9Mj/Q2Q55IgoWTkQArHsNMkFE5sd/4xqBcHsmtbUJ
	ekRQhbqwpItV7Wbt8YeTQY5uT9Ljis4xrEj/phf7huXhbTJieNI1wsBzAEPmaIp8AbdWrcI2JCM
	F8LZPK/XHRDRgKtjRCDmWySITubj7MwI=
X-Gm-Gg: ASbGncsRPUg0jF7dN55GvT873S3+JFwdBwcpsy+13qDN4x7nXEwENULfQmV27RolsG2
	Epyq/3IP4dsOI2cZEahIchitOYh4vcbKBmFqtJmXV3iLOWzciq5nNt8E+72gYsISvGYg65FfT13
	3ev6BRlnzA11SeuARaB9JZl80937RdPG9T2erp5P9dDor6
X-Google-Smtp-Source: AGHT+IE4UEnMX4SHARtfc4Pz4EoCInMw0dZNhxIqb0vDlTIdHbQL8/0EkXkglubtJGt+k6Z/YskFdgQuNYDNBIIoMDU=
X-Received: by 2002:a17:90b:1cc3:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-3159d62a650mr8145127a91.2.1750713205892; Mon, 23 Jun 2025
 14:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616160908.26333-1-tiwai@suse.de>
In-Reply-To: <20250616160908.26333-1-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 17:13:14 -0400
X-Gm-Features: AX0GCFsFFe-2LvssttCw1mdTW5tv9Wrcql7NeIfnrDmK15SQFUge-Z5vCU9SLEE
Message-ID: <CADnq5_MWVPJ5XXS_78Kv5ZRPUZe7vFtMYomcun5mKePBhMX2UA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/amd/display: Add sanity checks for drm_edid_raw()
To: Takashi Iwai <tiwai@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Mon, Jun 16, 2025 at 12:09=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> When EDID is retrieved via drm_edid_raw(), it doesn't guarantee to
> return proper EDID bytes the caller wants: it may be either NULL (that
> leads to an Oops) or with too long bytes over the fixed size raw_edid
> array (that may lead to memory corruption).  The latter was reported
> actually when connected with a bad adapter.
>
> Add sanity checks for drm_edid_raw() to address the above corner
> cases, and return EDID_BAD_INPUT accordingly.
>
> Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use =
struct drm_edid")
> Link: https://bugzilla.suse.com/show_bug.cgi?id=3D1236415
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> Just resent, as the previous submission seems overlooked
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d4395b92fb85..9e3e51a2dc49 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1029,6 +1029,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
>                         return EDID_NO_RESPONSE;
>
>                 edid =3D drm_edid_raw(drm_edid); // FIXME: Get rid of drm=
_edid_raw()
> +               if (!edid ||
> +                   edid->extensions >=3D sizeof(sink->dc_edid.raw_edid) =
/ EDID_LENGTH)
> +                       return EDID_BAD_INPUT;
> +
>                 sink->dc_edid.length =3D EDID_LENGTH * (edid->extensions =
+ 1);
>                 memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc=
_edid.length);
>
> --
> 2.49.0
>
