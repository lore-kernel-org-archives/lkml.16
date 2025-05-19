Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0C284B45
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666693; cv=none; b=MqD0E6dSbKvcG/wfBWPmOE4nakOfLWG4NCr9Bke0HZyCuPKI57qmMepJKl2cfeqSCjJVC2lgWhEVVtKmTRUuMowz7OAibvRi2CnGIRr5In7SQxy8/MWljKm9FV8/mDHdUtQN323iwL7k3D+L+V0XsMxX8hA5FU0tW7jjv23fRCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666693; c=relaxed/simple;
	bh=+TvgGqsTS0cQ8wJis1lJzVngOM4do4hNwiF9gXth3p8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOFeh2r3YwSjJ4SaGJq1HLItNeHrSdiAJ4t4l2Lbw6nbX9K88qLZnZJwm09xdcf51gkQuXrkDJwstFy/3DfIAI3n+10kjTp8oa34FSZmoB0WaqvSSd85szAkodZqS/i5IwDNY8R1npsuDiCt6aya0UaFc0CnhqwFErUCoSQutwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YseZ/05z; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YseZ/05z"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23228a8acb0so2150665ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747666691; x=1748271491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5gdvpRaAaLM19UVx/GrdVW5vV6MuRm9rJTVLs3u7oM=;
        b=YseZ/05ziOfZyBuvv3KnvBLux16VQetXthnUNhQN4ZaNIANDxIjwtoG8dLf/6AoLDG
         lAdzRrd7R1UauYjPnhYCRwV/dD+GnsXZF4uYsrUMOjhN0/JDbb4kV2YMuCmopd8c7pG+
         aQuj1k3BH49CE7NzS9x0EmLRdpBG2QGZ18Tx+0r0yrjlic3Smqno9HAi3uCxBAmxWwf6
         AT5NA5G5VeP7NoKMq8m/b1usvA7jpCqkexXXmgDSM7cf9mZtSbCSpIuNdmkewyde8Bve
         R1/qd2nwMfziVl6d9ZmPpzPMPBlAEMjWL7Sc9zmwKe2v67ZAfeMTLp0FQXzfpz8PoCyo
         M0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747666691; x=1748271491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5gdvpRaAaLM19UVx/GrdVW5vV6MuRm9rJTVLs3u7oM=;
        b=v53Haa9mnYsT9wME5Nzbzyr6O+RcxDGzU+a4i2ZaFOAfDmdF1gi8XmbDkBgkNJ5tzX
         b+Q63ip8G+d/QQ5uTComCnzgQSTEDatPc12bdTlSFwmBDwscyt+MTxyBQp4GS2pNr6gt
         zaF36hvbvMtgVcC+/gX7ptAKsEVNoXUvuByDsA4kqKzwuLhrmKlv9fgmsDPNt1zxzVcd
         bqCRWu28JI/5JT6T2Qgk9fC+pAtbPLzuqSC05aRpYCSnmg/kfh9uWKjdoWNbKWb/cYo8
         uIPn1V2RQG1q3QE+81PIW/Jmo9EhSm1gDQMxkIv7KPxrXek60L3T2rL/ffXd5gMJvlz+
         zJLA==
X-Forwarded-Encrypted: i=1; AJvYcCVVxi5ZpTKQVWzL24NPVPLPYIsd0G+VuaDrGH+lrYTXqnp2uVjH75P/HfvH2AaW4cidmX3JDAD1m6QoAtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwosZbe+wKpFc0yTJBLwa1lImHedsr+SFCqGUoVNAqs4k5ZzsIs
	YbSS4r/m/7ERiB9wsyjEkx8X3BMuJstaFeLlODOsW6vwe6/WFQPi4MZ7wfUve1HYjL1ONINz/WD
	jhXcETp2i2XGzKpJ54ncqEKE44KmaAws=
X-Gm-Gg: ASbGncu4rZodVvQE4ldt5P5Jsoow3kUecZcSR9A+gZ80HDID/cYdLsa+offbzPbA1eC
	xKc1OaCupEhNZYT25tDNVkJ9qK1BNu/+BJfZCzXycPYRxK8Vbn25m9F4oZjKobe80JMn2JMDtIk
	B4Lwq/+jIeKegCLqNYvFif/R4Nsuo0VO69uGi4DSbdQS1H
X-Google-Smtp-Source: AGHT+IFS6lS24Joef5xwSP/U3viHYHqlSjU3heJ3YK/ZdGumYT2oGf+W1cgyzoDIT8SU1Nt1vS15n5viC2uvxxX0zH4=
X-Received: by 2002:a17:903:2285:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-231d4502e3bmr65053865ad.9.1747666690994; Mon, 19 May 2025
 07:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030609.818725-1-jihed.chaibi.dev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 May 2025 10:57:59 -0400
X-Gm-Features: AX0GCFvc-a8H_zK_oq_ihi9yggKR3zIAwzCZb1xZzKZDlyUyHmFEizJ6vo0AuvE
Message-ID: <CADnq5_P1jJQGuJkcx-f-SiVWTJk=6Bd3b54djy-Tfb8tCkRO0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] fixing typo in macro name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Sat, May 17, 2025 at 7:43=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>
> PS: checkpatch.pl is complaining about the presence of a space at the
> start of drivers/gpu/drm/amd/include/atomfirmware.h line: 1716
> This is propably because this file uses (two) spaces and not tabs.
>
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
