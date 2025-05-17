Received: from e240-10.smtp-out.eu-north-1.amazonses.com (e240-10.smtp-out.eu-north-1.amazonses.com [23.251.240.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B579CD
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747453914; cv=none; b=uDbgRDl/bbqCbVu+w6EaWiff95K+vRN1uy5wzdhaMNFtcG2xz7rJmsk5ZavKu5kYRI0dByITVSveuxEs1mxVyAd/kvc5GpYSfMJMgSiiFE4MdYijcneTrVNhufPeJII0ZViCEWSU2RItIc+tfBIchqmeq96RCwt+Nd/GfD/geUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747453914; c=relaxed/simple;
	bh=4sXPVOrRsEGYyAatiAJkP4kjDL76SnxlQsN94GzYQgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAaVUsfvlHLSaTLmJX4xVCZ77M4Ff4qK3ZlMuaa1QhxgPisRtNfAz8LOBl5y+Ve3tVtPjxkn0A7xdblj+TdV8yOBT1cnZq7ZbCTITGu/VuRzXFoH/XK9ZM8Vu2/YAk0VqwwFDgeEtAD3B/qlDuAuqXYUPPB/8n/06iRZp7Ef8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=JXFSJJG0; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=ijKGlodz; arc=none smtp.client-ip=23.251.240.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="JXFSJJG0";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="ijKGlodz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747453910;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4sXPVOrRsEGYyAatiAJkP4kjDL76SnxlQsN94GzYQgU=;
	b=JXFSJJG0L5/h+ZwgUsjT5sELxbJXsUWsqs20orUUkkJve+L49hoA54Bx64zCcnvE
	rTlzs8k4Dg+m7cdRFJczRHyaJgKy/ls94m0iVojIEZnNfirIFjuW9ZtM1V5ZPIQcNyJ
	XDJ9pOgQ/CP9EzBuwjw0qk86svCjPRxBFeQNJLNwsQRY3E2syxRzTF9XLWlrPlv2iKF
	+8tGVcks6tFTB1G4rRL/1HEVjHlgTdk/Xfbq377z39SJp5cCeCjjm2swc7tAKTVj9NK
	qznO7lznxCRQY6hIBJOjfFxSuVHJ/tAxZPiN8Mw0wKYIMneAafgMEQ/FbxOUB3zPYsD
	9YSy9NIvmA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747453910;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=4sXPVOrRsEGYyAatiAJkP4kjDL76SnxlQsN94GzYQgU=;
	b=ijKGlodzNEu6KpEL3msg7PpIB7uBTFjsLGklFFmEjKiHGZXzUthfPnyhPZeTkRNy
	L/UFd2mvGit5ixi+o5N4IBr26jK1sf4lq4kCwYNL3ZhcmQJMvoHziRXYmGb3JdQiZl7
	md92itmB2AB3l5Kc7RSBNXBAEhYqmek2PYSDsxIc=
X-Forwarded-Encrypted: i=1; AJvYcCVMAeREaPCCL1QtlTWoUxX+X1tOUXkZKDSueCn/BRCI4A+3BJXvSHUER11f8OY1keBRa1829fkW0UOCXpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBBy8nf3vs8YTQ3i5qCaBw/f+C0VZ2jVbJbuv83HV0LVsfT8On
	isD4lJjZm3kK6giuJ1+mcuCypmaEX1qfl7mdxhC3cR62V9ZIEkeA4ZaJVFnlimt2T6tzrENc8uS
	gCS+YBhgeSvIl0nl7R1pwx+ZturObwRo=
X-Google-Smtp-Source: AGHT+IHdYrAbBt0QfCgyfrazR//wcX9OoH8u23Dj5OlR9+CGSH+w9e53g0dcAhAPQpKlB6Gp4TkQJw++gY+iqETgcMc=
X-Received: by 2002:a17:902:c202:b0:231:c89f:4e94 with SMTP id
 d9443c01a7336-231c89f4f9amr81335585ad.21.1747453907763; Fri, 16 May 2025
 20:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sat, 17 May 2025 03:51:50 +0000
X-Gmail-Original-Message-ID: <CADvZ6Eq1rFfYriAEscHfyxDHUfJ2pBky-1g-o2aCkDcwcij3yQ@mail.gmail.com>
X-Gm-Features: AX0GCFuSFDLpAmRI6TzZ3GJsWy23FWQt0gGmV19C8lxqhWmZ5AbnE04-UBbmvaM
Message-ID: <01100196dc5e9c60-c474b5e4-6779-4d7d-89a9-20282f0e4be7-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH 1/2] fixing typo in macro name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.17-23.251.240.10

Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 17 May 2025 Cmt, 06:06
tarihinde =C5=9Funu yazd=C4=B1:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> PS: checkpatch.pl is complaining about the presence of a space at the
> start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716
> This is propably because this file uses (two) spaces and not tabs.
>

Hello,

i stared at my screen for a long time to understand what the fix was
and finally figured it out but i think it also occurs in files
containing graphic objects.
it must have changed completely, there must be a macro that calls graph obj=
ects.

Regards

Ozgur

> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h | 2 +-
>  drivers/gpu/drm/amd/include/atombios.h                      | 4 ++--
>  drivers/gpu/drm/amd/include/atomfirmware.h                  | 2 +-
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c                  | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c         | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h =
b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> index 813463ffe..cc4670316 100644
> --- a/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> +++ b/drivers/gpu/drm/amd/display/include/grph_object_ctrl_defs.h
> @@ -424,7 +424,7 @@ struct integrated_info {
>  /*
>   * DFS-bypass flag
>   */
> -/* Copy of SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS from atombios.h */
> +/* Copy of SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS from atombios.h */
>  enum {
>         DFS_BYPASS_ENABLE =3D 0x10
>  };
> diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd=
/include/atombios.h
> index b78360a71..a99923b4e 100644
> --- a/drivers/gpu/drm/amd/include/atombios.h
> +++ b/drivers/gpu/drm/amd/include/atombios.h
> @@ -6017,7 +6017,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
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
>  //ulGPUCapInfo[16]=3D1 indicate SMC firmware is able to support GNB fast=
 resume function, so that driver can call SMC to program most of GNB regist=
er during resuming, from ML
>  #define SYS_INFO_GPUCAPS__GNB_FAST_RESUME_CAPABLE                       =
  0x00010000
>
> @@ -6460,7 +6460,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_9
>
>  // ulGPUCapInfo
>  #define SYS_INFO_V1_9_GPUCAPSINFO_DISABLE_AUX_MODE_DETECT               =
          0x08
> -#define SYS_INFO_V1_9_GPUCAPSINFO_ENABEL_DFS_BYPASS                     =
          0x10
> +#define SYS_INFO_V1_9_GPUCAPSINFO_ENABLE_DFS_BYPASS                     =
          0x10
>  //ulGPUCapInfo[16]=3D1 indicate SMC firmware is able to support GNB fast=
 resume function, so that driver can call SMC to program most of GNB regist=
er during resuming, from ML
>  #define SYS_INFO_V1_9_GPUCAPSINFO_GNB_FAST_RESUME_CAPABLE               =
          0x00010000
>  //ulGPUCapInfo[18]=3D1 indicate the IOMMU is not available
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm=
/amd/include/atomfirmware.h
> index 0160d65f3..52eb3a474 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -1713,7 +1713,7 @@ enum atom_system_vbiosmisc_def{
>
>  // gpucapinfo
>  enum atom_system_gpucapinf_def{
> -  SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS  =3D 0x10,
> +  SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS  =3D 0x10,
>  };
>
>  //dpphy_override
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/kv_dpm.c
> index 59fae668d..34e71727b 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -2594,7 +2594,7 @@ static int kv_parse_sys_info_table(struct amdgpu_de=
vice *adev)
>                                 le32_to_cpu(igp_info->info_8.ulNbpStateNC=
lkFreq[i]);
>                 }
>                 if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
> -                   SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
> +                   SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
>                         pi->caps_enable_dfs_bypass =3D true;
>
>                 sumo_construct_sclk_voltage_mapping_table(adev,
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> index 9d3b33446..9b20076e2 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c
> @@ -394,7 +394,7 @@ static int smu8_get_system_info_data(struct pp_hwmgr =
*hwmgr)
>         }
>
>         if (le32_to_cpu(info->ulGPUCapInfo) &
> -               SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS) {
> +               SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS) {
>                 phm_cap_set(hwmgr->platform_descriptor.platformCaps,
>                                     PHM_PlatformCaps_EnableDFSBypass);
>         }
> --
> 2.39.5
>
>
>
