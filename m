Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C579277009
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982745; cv=none; b=eGMHQvbiFKhyWuzmCxPFntzQSe7WCasdXbqE/mudQ/J4w3tRJbaq2vczQ/5PzslDEJmvNr9d2sfp5rr0/xqeBRZjXOCELDNqyulkMO/U3XnENTD1OJuOpyQBOBrZ9myryRNFADiS9kN5X/Usw0pyrcFF0aYH5sO5Ype6ImLanCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982745; c=relaxed/simple;
	bh=ywu4EspQXslvbOXpVXmbcqYTOvi+d1sDMqlvv+vgTU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI5W8mz2ZF3pogCfDqHkcUP/Ijb96DXSrj9af/12MODE0OH+gwlm2BfWpt0uYgwRaVcmdheRl5xA7tTjn+kSAVVMHiZCaddpszlr/0oFLQAuJrpcKQaBPF6XTdfZF0HKPIpQC0RDJ2eV9MqFA/Y5gTtnPYwLizVRqgT9XQgwfIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl4bijeT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl4bijeT"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0459668101so230773a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744982743; x=1745587543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyC6qiVT+u6rR7PgNOginiie1BVxcpXDs4+aZTBzC9Y=;
        b=kl4bijeT/F8/qZvmpvJXK86cOeP5n7cIZXKXn+yqF8Qm3YAM91ryQhVkzTe7eyUk9t
         3Hvk/8c2zIpd1leam5R0880LNy9vcbAVUayl73aMOHph+3iOvfVFgpwM8DOTLJgngFx+
         F0xV6obgFQ2wO4K9xb/KuzvarZo+Y5dA3Yi2O65puHwSwGAXse3x2KB6EQRLWJCMaOP+
         JStJOOK/2teSHpDIUj3az2kuoIMXI1rHgaSpZMjB/pjYWuNg52AooTcJ5PgdL07nfgYk
         SZl2GCp7fU/QLsxkC+w/F621ZYLfRCU0y+7MN29K7ZcdSD1+7xPc8gau9aWmFLkiGHBR
         ChZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982743; x=1745587543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyC6qiVT+u6rR7PgNOginiie1BVxcpXDs4+aZTBzC9Y=;
        b=EfFRyYIjnW+5w7N7zWKSYhm2WtIDj3w4wpH2HOTUqdrgGvOewOkuIwtiQpbLkAua8N
         vr1yXpUNJ76b3TrjMBuR0D0VGP1PYSZ8TzNsfxzWIfQjK9Z3TmyDbkyTyg+hq2+vRyAS
         uVXH28D5KsFPqObkWVJ+N/lRlR7ba7JJd7i8ne/FmCb1bUDHoMeDMKp+cF/sGv5h17HU
         Il7fIqi5znqkYEbdhXS5jRaDNR/45xc0QPRTUosromlQYXaZMCq1dpPjW3fRf65v98wo
         gcx16gEtiLw6sefSKjcP3TVaW4tbOJM4fi6xFNQ0qVF6DBN9TSXrlb97gwO80kCWapzZ
         giMg==
X-Forwarded-Encrypted: i=1; AJvYcCVUVswkQ8HdffjgmZ5wKWZ3hL9OkH8JhXuGRvMPfaG91N4hH+giweoiXJ/nfrHls5XIOwH7nEfeJUIiyTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/dXDd54iKUQ+5z63hXJhIojIWSIE1bqRMRBjU5gI3ZbDH1IO
	Popw66Mjx3wD04k9KZSNKVxyfmy5GPyOt3iAtkWvycdHC/ViZanDWstndGmIxl3n1Qclm5PIA5k
	irjU5VmY693iZ4VjzPIGy1mDuNSY=
X-Gm-Gg: ASbGncsrsjM4zPbYCNmLyZSuArPBjY7Ei6FN+Ran7640EnQkOR3RgQXrv7sviIxmytQ
	WwQPt/cxzMbRSV1SItEoS9fPvOic4YOSx6k5L+fC0z6LrrF3D2RtdjI//xq5sDVC0YIChdZVWua
	nbtLEYZHDqlgCyHRpCcuU8EA==
X-Google-Smtp-Source: AGHT+IEkg5l32NGk3QoxdJcXn0CidWWNtFY5WaOURIUpxvd0XNAJikgTjGRg3HBLp/wS28RhXBbDrZYprx9XXbEdsWo=
X-Received: by 2002:a17:902:fc46:b0:21f:3e2d:7d43 with SMTP id
 d9443c01a7336-22c5361fd79mr16154295ad.13.1744982743399; Fri, 18 Apr 2025
 06:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org> <20250418002117.130612-5-linux@treblig.org>
In-Reply-To: <20250418002117.130612-5-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Apr 2025 09:25:31 -0400
X-Gm-Features: ATxdqUFslTsaOCqwA3wvaxSTpSZ6IN0_tcLcXqKz9RibnGUgvP0nVR7xs914qb8
Message-ID: <CADnq5_PWLjCAfPx_2K+r=tuwf=+dN4iP1-OnyfP8mgXsR1Ting@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amd/display: Remove unused *vbios_smu_set_dprefclk
To: linux@treblig.org
Cc: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
	siqueira@igalia.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied patches 1, 3, 4.  Thanks!

On Thu, Apr 17, 2025 at 8:28=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> rn_vbios_smu_set_dprefclk() was added in 2019 by
> commit 4edb6fc91878 ("drm/amd/display: Add Renoir clock manager")
> rv1_vbios_smu_set_dprefclk() was also added in 2019 by
> commit dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
>
> neither have been used.
>
> Remove them.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       | 14 --------------
>  .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |  1 -
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c        | 14 --------------
>  .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h        |  1 -
>  4 files changed, 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbi=
os_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_s=
mu.c
> index 19897fa52e7e..d82a52319088 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
c
> @@ -142,17 +142,3 @@ int rv1_vbios_smu_set_dispclk(struct clk_mgr_interna=
l *clk_mgr, int requested_di
>
>         return actual_dispclk_set_mhz * 1000;
>  }
> -
> -int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
> -{
> -       int actual_dprefclk_set_mhz =3D -1;
> -
> -       actual_dprefclk_set_mhz =3D rv1_vbios_smu_send_msg_with_param(
> -                       clk_mgr,
> -                       VBIOSSMC_MSG_SetDprefclkFreq,
> -                       khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
> -
> -       /* TODO: add code for programing DP DTO, currently this is down b=
y command table */
> -
> -       return actual_dprefclk_set_mhz * 1000;
> -}
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbi=
os_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_s=
mu.h
> index 083cb3158859..81d7c912549c 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.=
h
> @@ -27,6 +27,5 @@
>  #define DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_
>
>  int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requ=
ested_dispclk_khz);
> -int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
>
>  #endif /* DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_ */
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbio=
s_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.c
> index 23b390245b5d..5a633333dbb5 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
> @@ -164,20 +164,6 @@ int rn_vbios_smu_set_dispclk(struct clk_mgr_internal=
 *clk_mgr, int requested_dis
>         return actual_dispclk_set_mhz * 1000;
>  }
>
> -int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
> -{
> -       int actual_dprefclk_set_mhz =3D -1;
> -
> -       actual_dprefclk_set_mhz =3D rn_vbios_smu_send_msg_with_param(
> -                       clk_mgr,
> -                       VBIOSSMC_MSG_SetDprefclkFreq,
> -                       khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
> -
> -       /* TODO: add code for programing DP DTO, currently this is down b=
y command table */
> -
> -       return actual_dprefclk_set_mhz * 1000;
> -}
> -
>  int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, i=
nt requested_dcfclk_khz)
>  {
>         int actual_dcfclk_set_mhz =3D -1;
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbio=
s_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu=
.h
> index 1ce19d875358..f76fad87f0e1 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h
> @@ -30,7 +30,6 @@ enum dcn_pwr_state;
>
>  int rn_vbios_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int reque=
sted_dispclk_khz);
> -int rn_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
>  int rn_vbios_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, i=
nt requested_dcfclk_khz);
>  int rn_vbios_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_=
mgr, int requested_min_ds_dcfclk_khz);
>  void rn_vbios_smu_set_phyclk(struct clk_mgr_internal *clk_mgr, int reque=
sted_phyclk_khz);
> --
> 2.49.0
>
