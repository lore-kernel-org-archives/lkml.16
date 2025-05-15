Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F01A0B08
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319853; cv=none; b=uOWC1FG+G6ebr/vsL1HPpSh9cjqF8Mlk0lBa6bw4Pcz5Gmhw56lJ/jsdZ/g+ILRK9AWRMmaqpkGQZ1pxW6+RjaiRNiIlFE2oR6mb67uonnycixFbwS7xvsK/MaOOocSmJByRPwVnt8Pl0wDOK8hEaMHdcSbfr362LkL6PlyWxQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319853; c=relaxed/simple;
	bh=SQgbBL5RYcSAsngaHeGJNNqtuXZsSXNQ+yscYHWqeM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKkEvGLfuhZVg5SOL/idnhnAWqfpJJh6hMRwhTr+5LOLkPxoqztSmYf4+Fj+DmnQKaDGdjnlfH/smcCl3cAJ3MyJNEwPFyu4vexmZMRxfCFI8ivhUsnZKjPWXz9Q1A+dfdZ+4HnPjyvZiObP/vrliufyV4HZ4gLbNBjuuIoCpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCBwCh22; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCBwCh22"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22eed3b3cabso1357145ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747319851; x=1747924651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
        b=QCBwCh22qKP/aGJ9UceJ4RqAAZqOXP6bokF46246yLohQkdZFFMjd3osANISj5qMY+
         5bqWc60AsmSQuw9kWlnbhEStCQnWrbUlcZVGNNlT2dCihl95gYN1KJUISVK2a6ybq3vS
         d/0HEOr3BizDGYUX2ViXjKObNvvvNhdZjHPjQzaqyoP844cGW3cq6xHKX2WRs4FADF9d
         8aPVdhXxtE5N6lb78WJ1/P5OFX1wQ7clD7oQH15GCW+HdzzwHyBPR6EqpBkOE1B6/KDv
         2HMIJqVPfcLLJlUYk0JiAMkez8TaqaOOgG8uWByO0oga+P8PIEvr2ieoJhRS5xjfLmj7
         DTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319851; x=1747924651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yhx/trwlq7m4oFPBZzH0TmWWvywnM8oewCNJl0cBG00=;
        b=e9OkJAwl27Vc5jFgN/ZyPYC81aCHbG1Kd6/T56jDdE+k6q/9ZW16wGVmnTRrEtRl0m
         BY+Ke4fnKu6zEr0W09ckW1zlh/GxB/9zkHAtNcrAdjWThVEy41wsVl+NVT9PRwYOQ8eZ
         yuJC5cXP6/DicXWYOMkB9MDFt/8YLl3DuJaogTszl0sJfKaU41gI05GjeNXIakSf+KFb
         odudskJ/ao1IIvX20E0186DxVJLvQahh+c3LG5MQDjPskZeWZb8tgmWKMvxIGAk7wVnD
         UIRFS51nQKCKZ3H9alImhe6H4lNxbvDlnFmAvRLYTL/4lhqSn2eoCW+3to/br2QpITFu
         RXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIHIKqqoa31wE2WyI4CaJxia4raRbvJE6mCHGLgJVJY6FKf1UlTvj5pGvHz5S+VfvqQm8mU/8jsazbCr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+VZhgmK7EMH/ZA5rXhWQ5CumevSQ48SYwRF4VNYbq+VCMz1E
	0WQoe2w4p/wwP8AztIqec4sI30JtPtnk939JF4sfhnXb3SFJx1iv41fl0Pks9tU4Btk14wOVWiM
	ptJYKcbAF4KTjBCiqxi5MSCi9/L4=
X-Gm-Gg: ASbGncvCxMRcHHGSm/vJixkccAKvY6l5gdhxrKpRVmtr1FtflcxAT3ht9gArCmobaDZ
	kZ/Gqh75wgtBLzO7VgtyF6FyCW+PClbyDTehA+hwecFXqlSQb7RaJMNaQb0KXwo4RAhPZ+PK4z9
	WSf9HJaPUcOmqOG0ittfzbOv3HuS+IQ9H9tg==
X-Google-Smtp-Source: AGHT+IE6YzckvATVsA8ojqUKzTuHbFQEbdpn6dyEbZwwrvVfuh9yZqbs6GMEM12xPFjFO+94qbP7aQBl2ClYYnEZHX0=
X-Received: by 2002:a17:902:dac9:b0:22f:a1b6:4495 with SMTP id
 d9443c01a7336-231980e4054mr41337035ad.5.1747319850679; Thu, 15 May 2025
 07:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514213511.380890-1-rk0006818@gmail.com>
In-Reply-To: <20250514213511.380890-1-rk0006818@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 May 2025 10:37:19 -0400
X-Gm-Features: AX0GCFsggvZBkjWGjCTAgk5MrozCZH-a5UHDUJm9gsAKzfN3QltHqMR6QfX5QOI
Message-ID: <CADnq5_NNRfTM-Cb_bvtEQcLRE4LXh7Uf1Pp1+chCtfRmee0aug@mail.gmail.com>
Subject: Re: [PATCH] docs: fix doc warning for DC_HDCP_LC_ENABLE_SW_FALLBACK
 in amd_shared.h
To: Rahul Kumar <rk0006818@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 3:09=E2=80=AFAM Rahul Kumar <rk0006818@gmail.com> w=
rote:
>
> Fixes a kernel-doc warning by correctly documenting the enum value
> `DC_HDCP_LC_ENABLE_SW_FALLBACK` in the DC_DEBUG_MASK enum.
>
> The previous documentation was incorrectly formatted and incomplete.
> Updated to follow proper kernel-doc syntax with a full description.
>
> Verified fix using `make htmldocs`, and the warning is no longer present.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Thanks for the patch.  This is already fixed.

Alex

> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..ebe0caf1fda4 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: Enables software fallback for =
HDCP locality check if the firmware fails.
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.43.0
>
