Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D8642A80
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232191; cv=none; b=dLN+CKmRJ2kTMLZHe0MYYU8zO7gmMx9p8ezBVVg+O8H7lC/56VDsvFZtcbet8M3gJywZ5mR3zQr/PmTvDC+PjtbR0mANguJFrHRznLI/WlXVUbpPEyQvqXlt4CXVImgSk4O4CrzT7V3F6perzwNNQcz5iEZ40+OmgpoGGD2CnVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232191; c=relaxed/simple;
	bh=dctgj7OI44hL4Z70amYhMFqF1v3D71Minb2zs5mQdHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bllxZmQJla/cHzZs3yxM3RrS+1lxwP6DY4+IQOKAAJSVxU0K5UgHIURfxsdUWx/U+7hbkXz5PEW7ZgGuQr1WnxJ1TdgDRh3TGw80b7rUPnqWdpQGShDCAab5NcZK6G5pI1TLvtzrmrp5PRt0dVIt9fg1gV2MW136Ih3EhSkSpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN9Fq1We; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN9Fq1We"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231b0ab8044so20845ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232189; x=1747836989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
        b=AN9Fq1WeXjV82p5AFgB3GJZvj9Xg+bwrXtgVwGs8NFuDeNhmH5ETsb3XLd6U9DnHF2
         cSlKxZ3lGV060fbJ0pUyGWtqvoyVOGi6/wTZz1kmo7mWjixD/Z7yc2tovslD3la5luuu
         TnpQXKFt468DiWom/+ZvAsGL72cHHm+Fk1qt7sxtwvuazTpQ/D5R8B14jxtYW9ejvi2+
         IlsdrK0Yq1EI14JKw6G7KUYgAgcHdVHlJpei5WaViCQN0IIVhqDtPMS0osO0doIxEPYz
         uqZzzeIQSXUbCmnAF7btA2T/hEt0weSpIBzF/9WBdZbLBqOKX9GajKQKQyKwF/9QB+tw
         GG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232189; x=1747836989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3n+16DpFOcpOhaliZB3idim37DYPJw0hjtvBfmuDl1M=;
        b=BMHs023ced7sOyskdjbwyGtB9wtQf/z3UlIvP1BPkKwIQ/XVlcECv/exHmcUvJCV6T
         rzbMgvbE6Wcbs87cZoqX3dtNl7pZJhHVXFJS3QFzdUBAWpZ6TBXonalKWvKkfFi87gre
         LtfiiS46mUtJQPaxNJD8dTKZJwdgewZil6gBHdmNTttajDxOhFyoPMtJUfL2NSi652vy
         w55p91RNrOebYr3Wgt9UUHfp8ja5aawXCkHVORQN1/YmTei/XBimNqf3ADHSbTcwQDj3
         3kz0lv8h7OSFO5YP/fmNoUfcYLbKJDk1JnmzVT7Cwm6Rir6ueSz7rCk2LZj87Gv0+qYx
         AVoA==
X-Forwarded-Encrypted: i=1; AJvYcCUHufoMoTthhie5OKy8x5Oe7IQaQNRgZCbZ0imgA1Sj1gGt29f5m+SHqX58kn31s/9+IuIc9D6Fg94Rbvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytndWF88u7CGGgZ2Mpgze9ZvuDZ653iczsuHv6CFDc1zZp72R/
	4PIqwIKVmtPHpdRDDI/NIxAUFeN31a/t3Ble8wAYmNTUf/EwnnoAd+diK9ePluTEIVDuI2GcrC9
	9cAqHacFDZOHFBB4jGfXDpsUTb/Y=
X-Gm-Gg: ASbGnct3b3zDqnxbuypaAhkEAHPSRvSSgdAvliNLdImMw6JCrKj/Akt0kTZ+FBIFdEh
	4yav1ptz9YXtcx3oj8qNZ55N4W42BEGzkdHIkqZu3CnT/LLmsXvq81J43h5hzKq3mWQigsHloGU
	tZgiDwLkTfdU6Oqk8G3jV0S9+I+uieVpRV
X-Google-Smtp-Source: AGHT+IGgOLVHlFTGN9a0SvwGp9aOaUq0v2qKq+BNE0DOArgTcRewkV7J2kadBkn8RZHPlisNdGKLis3afd8TsAPJpdo=
X-Received: by 2002:a17:903:1a6f:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-2319812a735mr20961985ad.10.1747232189515; Wed, 14 May 2025
 07:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513233212.21186-1-contact@gvernon.com>
In-Reply-To: <20250513233212.21186-1-contact@gvernon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:16:18 -0400
X-Gm-Features: AX0GCFukKcW8G7VG06CTXQGuzf_x_lHNu0hKnNMVT_ZvRA146nuD9ytPZqqbJCg
Message-ID: <CADnq5_Nv1b+C-oaQi1hEq15T2fOZS0FiQ+RgOyQyOizC6hGuaA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix docs build warning
To: George Anthony Vernon <contact@gvernon.com>
Cc: airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:24=E2=80=AFAM George Anthony Vernon
<contact@gvernon.com> wrote:
>
> The kerneldoc comment for HGCP locality check debug mask was missing a
> semicolon resulting in a documentation build warning. Correct it.
>
> Signed-off-by: George Anthony Vernon <contact@gvernon.com>

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
> 2.49.0
>
