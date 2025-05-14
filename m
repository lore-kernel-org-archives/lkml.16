Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1803115574E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232180; cv=none; b=Wq/r29YhrdydHFgJPSKCXH2zUT7KN2JIBHDlHumpXmJCr4CK+656jN0P7PPYo3lJeXhe6ijH9Dp0UtGXUygReOiCZsEcUlQ7p6n20Fz1tvt89RrsCn5acD5O5+A3JEgI44fp3BR+n4/CXv01EEeYBZEEDPmxmpD1YqC5KNW/+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232180; c=relaxed/simple;
	bh=26grGj1agecMz+PCvuHvclLshWUQzEmjBvBmS8cdWSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5vED9wP2h/nz5jEYjL0b1bCRzt0vOHwcyIl118eJgbo7KCh7eNRlyJ6wLvCl3rtPnn+J6UFyGSGwcl61x6xkSYZ2fI9ILNurQMZJEm18z6a5LJUA+E2TQolzPtBnPIo96mncdo5i4BedORfPKGUSmbrXrDPe446IM4dOtF2lXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUA7Hbr0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUA7Hbr0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7414c7e45acso815815b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232177; x=1747836977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
        b=dUA7Hbr0fsddlg970iSHYJxcxSQqKcMxOsj+qvO7RErPPmvJVgTWcMMGHxvV5WrWk0
         zrbKQBHi7cP6K8H7r0eu8wgMFXUwkBeMQ9Pdj1rxHRBJyKkX+/rR4k4djT22WwQHmpRV
         wjAMtQ7l2hHJacgwlCp/ntRrxFtIBAs1/o97NPUxF7fJYMFUxe1r/EJvxYO8vk611uKg
         WhRkjEyUssQLsYsfMOtUUJOLgU8VV9e9w1MPCDz4SEihUzShIN6SkEsIaj4pmsZ4TOXO
         oOvOEUYYJUkuyChhT5pLzueDB4yKR+LMFdolROi02P1ei0KM9/8KsKavDxslW60utOLe
         YX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232177; x=1747836977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9l/yJokrJezdTMly2gEBI61HIpT790BZH9nQ/918eA=;
        b=sVCeOshS08ZuqL3tF22JM12vU3duk4SOXzSOv1JZ2xpaOT59mIwoqLf5/F70gG/J3G
         3yZiRYj7JRlWHeTpYtv0fYp4/jpSF+VgT16yz17MN19ldGuzDziuDmEaMQ8N7D4PSP6i
         zakMC92tW+S1kftnl5udUSdwVcdz2erDrD1U930SyK3mQqNGrgnMv8rtivmgzFPXvkib
         mmM9U1ueH0WDG8CgazA3wEuXVp35pAiUBr6Cso05NGaH82G2pO57qJKUoJDCTllvnYB2
         xOm44fX5S+nxjeayv/pJWCLBn/akD8shD7W8Je4WLgrVzLIliwdOzWl81IqPvSdkGUVH
         fLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo5AxGV81vsKU8Q5qvkMm5QmhuOvmskq9sI1olOGKiYnv1bFF71NNUL/PhlviKkXjOGqxmzKgkfgg7Z1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMY9AJOloWTVSX870Pv/XqW8jIzrlrCnXCFG1HLs0S+L7Vmpe
	H/ToxGvQIXCAlSbByEAzzPVcJC1QkiQdQKmE5F//6QXXwzmoDOXpAsqkBGwxvHJqad2rC9UDTCu
	ZQcgPoWf2bJS7+lDxne7kycPDff0=
X-Gm-Gg: ASbGncsTOcimRmlv5qUMmIln6tRshrZNxZG3jqImmi5cWmdCiiDKhNqaZMCQg02vwYh
	rHABgsK4p6OleXXuUQHBW/NL31/PtrlIs9qu95/JZ4j7qBJg0bohgBLOkCU1xGw59hsahtYV8Z3
	0nQcYYYfXzEPlbJJHmH6IZzi5teS3QiPCU
X-Google-Smtp-Source: AGHT+IHtKxU0GEGaAeLVg/+ec50sLA3k6YKoCWcfCuiQT8vSKq7Gdewqx4zLExHIkduOo2EYU8VEwV70WujGnLmeMn0=
X-Received: by 2002:a17:903:248:b0:215:435d:b41a with SMTP id
 d9443c01a7336-231980ce4d3mr20167045ad.1.1747232177142; Wed, 14 May 2025
 07:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:05 -0400
X-Gm-Features: AX0GCFvNZ6---Ox_xhZShkODoC-fkTW8iHJut3_i8L0kz1QSIWvS7bGXMuWlPGI
Message-ID: <CADnq5_MAYSH0Cj6pfZFdPx8b_goJRFEeB61iW6bD_wON-GWxzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: fix kernel-doc parameter tag format
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:31=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
> colon after the parameter name in its kernel-doc tag:
>
>   * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...
>
> Kernel-doc insists on the form @name: description. Adding the colon
> eliminates the warning and ensures consistent extraction into Sphinx
> documentation. No functional changes are made.
>
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Thanks for the patch, but this was already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Che=
ck FW
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.25.1
>
