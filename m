Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00098248C;
	Mon, 26 May 2025 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748224315; cv=none; b=LGZlYHuI6EBa5FmbM3USWqcxPchNNharm2C2oN3Vk3bV2SlmjUauTPpPk0kqjVWSlPRt/GyEpGBtdgZKsJfqJxGQRV+iy9cnLvS8G3X8xzjYAenG85pZch+9kZktaNM1GvE5xSw4Mr5tKioGmcE7iDNN08cC/iDzMmHm89l0FRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748224315; c=relaxed/simple;
	bh=QY2ohkza2x1tajvdG6eeg4JxxBs3fEmJoktrKFBxEgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeTMm293NH39czmFS9i6j0mZvE7Xhd+pQY2jlWax0tc3bpzfL9eK98KKO1WuyqGv3xPrgnBxxvXuWg0Bogy0QFsJSaXeMq9DE2Rno2Ti8bS7bMizb8HnrnAYBh/edElJToc0qUoRDH5bQCuktR5b26VEb2lckMoBV4FnIH1yy1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ze5KlatB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze5KlatB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1692899b3a.2;
        Sun, 25 May 2025 18:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748224313; x=1748829113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DKj8oNkwRWAiy5DwXiV4r+Z3UZ5RRrUNHD6WtNis8g=;
        b=Ze5KlatBmy7jdVmSrhn8t8PA63mU84+o2dmg4OaW24mGhX/wm7UJOr2AIb8NhB6M2G
         1+Qh/YpycL6QwCvr+HomSigfBuAUGnwOwg+YN2/xzfx8QXJwjqHIATYnd1f240GOWlL5
         F67jOTbhta5DbkFwhPt4gHZ3W6rynJ5mdE40EeBea16inqfjpiZiD0eJIiOj0PQG7xwW
         flKaYl9lIiLNrl0AZQqE0PIiEL7OxIg8ITL8g99lP9+7nwHiSxaZSRNSRPgtm30r2ZDZ
         algrQDccQcFdJzC2Xftfm80IT/y1qYJpJao2M0+ke4HV6ubqfi6XcqGtoT0LlKgvKZq2
         mPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748224313; x=1748829113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DKj8oNkwRWAiy5DwXiV4r+Z3UZ5RRrUNHD6WtNis8g=;
        b=gbdZ96UJStu3v/20uezZYu/3s451IKYxeche2IyRrEA2oI+z24WxGkPbnLUmvVAdJg
         ybL0e3IP5Kom4NRm3cYDE2TPe+QdhlTo0KAjZPB+Vglc/3lHOZ4OgiGFTNQpj/eAHelA
         CiLmWc1oR9UskO94DkUs/tLgJt6hi8vL4yRiQb3znEc45g6iC8pQ6RN2WlQd99O/jpNM
         ivB6Al61kzMj1d8jm+Z7WHPnnkl2HXaBN24Jzl0UXp/FvYIPZgzJjs9fYzV7iioIV+ZF
         h3De3pKgvKTBooLo7b0PHC61YJZzE9S8SK6J4OKsjmBk1KJh7rGn5mxc0uLVs1yI67xe
         nnJA==
X-Forwarded-Encrypted: i=1; AJvYcCU87IdeMUuzv6YYYopDp9/1zz1yNDa+n+y2LHtpx2AUc0WTFn43UQwV7WdqkNDJvl+4EoinYgDjLFk=@vger.kernel.org, AJvYcCX694GptvhHfrnwCakntm3Id5WlNJC2jadd4vide+q+LppgOQOFHPP0QrEenKvHCMvEEB+Md3KL1kBeYJKU@vger.kernel.org
X-Gm-Message-State: AOJu0YwfCxsV7l3ywooQBDdj1q5ZrVgT9SQPwzJllYhnmId9qobCbEeq
	IOoVn4o0HPzpvaXEL0Z+fkPBw13Jps0sX8OtspszU/U4ebDU5MDIH8yl
X-Gm-Gg: ASbGncuwDsRAYmuEtFUo4VZTlukJG/37JmrlvFs1UXiNtlMexr5qNNYd7sf23bQ3tC9
	RCb5TE9cjJyTGpOXl30BIugzPtUTx8cpa9Nm/Oef55Yc+q6nSeDFK/wJ1QImHBUHQvN67a+w901
	ALNoRYVl16C0EntCsVnhHLp9oL1gW2+GgUQqviMWS+qJ3RI8i2g5C3Pv+Ca1krGv5hBOckY/keq
	eoOSvdrF+K8UBAsgg9Mrr0HFCtUs8ta9mi0XVb/key/AsuCDycZQx1JLFQX25Plet1JLB9h8lI0
	LVa0J5lMf1/DHVE1DJy0Nst1HV5kDI+jFNPIQKMvQ0t0nuAV5CN0nFJkbkrigA==
X-Google-Smtp-Source: AGHT+IEej+6PkcO2/DXbswdOAlQW3W/DYX0Gbdx4UIAQjE96Wze4Ix7GvGI6pQ+GrMV3odHkPK89sg==
X-Received: by 2002:a05:6a00:2905:b0:742:a9ed:a3d6 with SMTP id d2e1a72fcca58-745fe035fa7mr9505358b3a.17.1748224312672;
        Sun, 25 May 2025 18:51:52 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def30sm15993990b3a.20.2025.05.25.18.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 18:51:51 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E85A84230C03; Mon, 26 May 2025 08:51:48 +0700 (WIB)
Date: Mon, 26 May 2025 08:51:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: add overview diagram for drm stack
Message-ID: <aDPJNBTDmHoZ-z1d@archie.me>
References: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
 <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hXCUMJnyg9VmLHa2"
Content-Disposition: inline
In-Reply-To: <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>


--hXCUMJnyg9VmLHa2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 03:52:26PM -0400, Abdulrasaq Lawani wrote:
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/intro=
duction.rst
> index 91bb0efc96d69921a122c5265b1431fa18110a7a..2653048ad4bb0ecbc2b676295=
440442dddbabae6 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -15,41 +15,43 @@ and the new vblank internals, in addition to all the =
regular features
>  found in current kernels.
> =20
>  Overview of the Linux DRM Architecture
> ------------------------------------------------
> -+-----------------------------+
> -|     User-space Apps         |
> -| (Games, Browsers, ML, etc.) |
> -+-----------------------------+
> -              |
> -              v
> -+---------------------------------------+
> -|    Graphics APIs   |   Compute APIs   |
> -|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> -+---------------------------------------+
> -          |                   |
> -          v                   v
> -+---------------------+  +-----------------------+
> -|  User-space Driver  |  |    Compute Runtime    |
> -|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> -+---------------------+  +-----------------------+
> -          |                   |
> -          +--------+----------+
> -                   |
> -                   v
> -        +-----------------------+
> -        |   libdrm (DRM API)    |
> -        +-----------------------+
> -                   |
> -                   v
> -+-------------------------------------------+
> -|     Kernel DRM/KMS Driver (i915, amdgpu,  |
> -|     nouveau, etc.)                        |
> -+-------------------------------------------+
> -        |                       |
> -        v                       v
> -+----------------+     +-------------------+
> -| GPU Display HW |     | GPU Compute Units |
> -+----------------+     +-------------------+
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Why promoting the section heading?

> +::
> +
> +        +-----------------------------+
> +        |     User-space Apps         |
> +        | (Games, Browsers, ML, etc.) |
> +        +-----------------------------+
> +                      |
> +                      v
> +        +---------------------------------------+
> +        |    Graphics APIs   |   Compute APIs   |
> +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> +        +---------------------------------------+
> +                |                   |
> +                v                   v
> +        +---------------------+  +-----------------------+
> +        |  User-space Driver  |  |    Compute Runtime    |
> +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> +        +---------------------+  +-----------------------+
> +                |                   |
> +                +--------+----------+
> +                         |
> +                         v
> +                +-----------------------+
> +                |   libdrm (DRM API)    |
> +                +-----------------------+
> +                          |
> +                          v
> +        +-------------------------------------------+
> +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> +        |     nouveau, etc.)                        |
> +        +-------------------------------------------+
> +                |                       |
> +                v                       v
> +        +----------------+     +-------------------+
> +        | GPU Display HW |     | GPU Compute Units |
> +        +----------------+     +-------------------+
> =20

This is not how reviews from v1 should be addressed. Instead of making
separate commit for review suggestions, you need to squash them into affect=
ed
commit(s) in v1. In this case, there should be only one resulting patch. Do=
n't
forget to send it as v3.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--hXCUMJnyg9VmLHa2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDPJMQAKCRD2uYlJVVFO
oy74AQDPmxrQb9rYKD39w7NaTsaOldYEhp+puSEJ2KpMwsY1SAEA9lVhnB307H4N
uJLfQF9+cMButgaKwwW89bmWLnPxTQ0=
=XjDz
-----END PGP SIGNATURE-----

--hXCUMJnyg9VmLHa2--
