Received: from e240-9.smtp-out.eu-north-1.amazonses.com (e240-9.smtp-out.eu-north-1.amazonses.com [23.251.240.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D6113DBA0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747454036; cv=none; b=BJHPfSTG3hRV1fm4XVcADphjn23wpizr6ittAaWOnp8Q3UL+5/a10XlpnFAWJj1th+7OXSSGsM1JXEZwnDCmr994AQKQxxQZpaBt1YWKal5/z79uFKTX7RP/AxFUgGkZCNMJyvpiiM+fCVgQYPYD/hgE7rDvSfO6eBxnXVLthR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747454036; c=relaxed/simple;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYo97GnjNv2oAGLoqkV+sz56odYkAxKDaW1XBT9rE0TcEpjWVJ96D2eniODSp8CLboBGqEpaPd5a8JjgHHd2H5gLYh2/e40IOWf/x6DoxwuVgJanFE5lND7RhC6pXoByb4mkak+P8O11XXJVGwBEbEJHMoEPOtQJyIY0KdhWH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=g8+2CCsh; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=OnXiyvPI; arc=none smtp.client-ip=23.251.240.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="g8+2CCsh";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="OnXiyvPI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747454032;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	b=g8+2CCshfNeqXm4oxhJHH+fKWnCQHLZJOzDDGE2sO8x9VoIyQ+9YJnzdgJ0dCar+
	l4sRkvl/eR55eA++eq/RNx7uuy79SqNcwvUHU7Tqv+sLsvE7gWuuVVa3VWey7pYxLml
	cDlXhhqH6kZmKBrKnvqT17paFHPowjIX4tnMwA7r1B5ziDpKDNpqFA2+gy+ZTDWHQVk
	58A3bXJaus/xvTHYPZdkBGqPaPplCjVTmJPHPmFw9eGFHHORShNG6DGQ22T4drdR/zF
	vmTDO4c2knHngC5KqFUU/fVj9cqDero9UDLG4CaDrhgqmXltr/9gjHU7OfgG/sXFCMC
	4HZAiL1IyA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747454032;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Uev6fEYlz5XwC9qWMx8Sr5cx34YcV4H6PxahUjMrGlU=;
	b=OnXiyvPI356Z60rtLU2Vm7E0WOxd6qwOjh9WbsFbfgJYPM2wc5sFl80rXI+wQg20
	KPhzU8HRz/PaKgQm/snupotEUmyKshEa7Cvi8tfQ6GtH+BCu9bGuOhtPBYUkYHpc/Ck
	rPwgXHuSvhljceZzP/qBRT7Qqcy/NRzw1RG1CLtg=
X-Forwarded-Encrypted: i=1; AJvYcCVzx3vn77dBIHHnG4N4ZpF3pP1mM+ggQ0TSSiEkBdLmysOGczEb17wjrH53+yxH86PVDhDGp/7dgR95MA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUMn5l7DlW5u4cJ5qQa4AOYttYUl5aMmi0GlM6yKYJIaWVMVd
	74z+RdGPQ0lPzxh/7C4DqUUPv9OybrtrjfdwynduhIr5G2rWHvFhne3G7VUs2z67lsPtJfSKdw8
	HYDw96qYWbzaGbvuok0vIgez55eLhIh8=
X-Google-Smtp-Source: AGHT+IHf19z2sbUg7xrM4qsuKOPs/2f9qWqFkx5Ys30i8cc/aKp+R4ErTYpyM5kQDtvy+RMgphYTqVKTkUuG9PdPAhM=
X-Received: by 2002:a17:902:d484:b0:231:e413:986c with SMTP id
 d9443c01a7336-231e4139adamr56049165ad.11.1747454030242; Fri, 16 May 2025
 20:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sat, 17 May 2025 03:53:52 +0000
X-Gmail-Original-Message-ID: <CADvZ6Er=6M4Q9WKyQXSxfQ=KDgZ7rabKER=MUVoirxavukwQjQ@mail.gmail.com>
X-Gm-Features: AX0GCFtcuNqyH6AItJPisixd0IN5CrGy5hhjrQS6OJ-E5B0yBtGKj1UY3yegyfw
Message-ID: <01100196dc607ab9-d9d71ce8-d818-46b9-a84b-e2231c85eed6-000000@eu-north-1.amazonses.com>
Subject: Re: [PATCH 2/2] fixing typo in function name
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.17-23.251.240.9

Jihed Chaibi <jihed.chaibi.dev@gmail.com>, 17 May 2025 Cmt, 06:09
tarihinde =C5=9Funu yazd=C4=B1:
>
> "ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS
>

i didnt see this and yes *grph_object_ctrl_defs.h* is exactly what i'm
talking about, please ignore my previous email.

Regards

Ozgur

> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
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
>
>
