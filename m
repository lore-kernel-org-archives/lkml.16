Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4711805B;
	Thu,  3 Jul 2025 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502331; cv=none; b=meeR7IzJH6iu5k8Fs1zfn9SMqbOCMMwc1Xc1L/YrHv/A4JzcUd5vRx5z9BuEtQxPV3vqSR8yR9cDqEuQeorgKCHSM1SebUWovwFUI8LC699DuzHVj+GY1/cVsMGF9HLPo9l7SvwyPODgwZOEiOrQ3XnCM2a8/oc0w7LdHgb7z70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502331; c=relaxed/simple;
	bh=NSLzIqO90YkPCol3RRrpeMNsBThgzqJUNZzQMcg/9E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIsb19E8azLIhlVCw5ff0Y7p6Q/SLa+WJ6AkxFpOLpDWmkkzxl1HRtk5L0jGg1lyC1gPGRqa2heTGhJS5xs96z856Ofyb2cjdHpjOhnA70uI43S86KX2uRpNSKpH0QrzYqniarXjbz9J3IAC1xjJYf4CeUPco2VGZozIJFshei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X0Ideb/c; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X0Ideb/c"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748f5a4a423so3145702b3a.1;
        Wed, 02 Jul 2025 17:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751502329; x=1752107129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NSLzIqO90YkPCol3RRrpeMNsBThgzqJUNZzQMcg/9E0=;
        b=X0Ideb/cmw1sgYZOAUQLjdZq0aQ5URymxxFptaT/ddfBHGGWFWe4TIfZlH9Z6h8FqA
         VQSCcJz91TE7pvzg2M7vAVtisBsO0hIzIFHbuDUUJDp3bf8wvIYOEQRMIvGIVTFN0rXx
         948sakVlls6Tq7Rz4ZoNwY9ieisci4qoYjMjGEns9D56/I+PVDpQKVY2/WPcGHXKVh0V
         rJy4BXdqiHuXyTrN402vlPu+gL4wNv/UWTJ+1YPx0HEZKwX1vSrk3uvitmk/xxvLG9s2
         MPbUW+RYqDTEYnroXMLU+EScJwYH4b3JNADfzlha7g0m4qd5JH8LiJtnXwqYnRi2mBhZ
         Su3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751502329; x=1752107129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSLzIqO90YkPCol3RRrpeMNsBThgzqJUNZzQMcg/9E0=;
        b=PkFoloCZssVYTXZL6pnPE1DzhlC/YIvH9cYLbE10BOXPUuJBCxCCUL6G9DR7jNIHcm
         Y/eQKynm89U+k1auzt7wwPrlM7UiNn9tlclKvSKvRseAqMCxCgEwpXyyDd26bb9uQZjP
         KKcY7aClSIDmf+Dk4ezV6oaVw2/QGtXEX5R2vZtB9WImj1vze6IDCyFWNHKvdjnlnGja
         sBs9IMDN7sgD7WgY+j324a1tMeh61I0uxWHJRh0p0BCFOj1spuaKXNTC+fpLcLYSVVYk
         OIhsL6C6twvuwRlNf1SO/5QO5bnRExVp1RdWorx/rLzTyjBB+xWjoFrdS/EsXlyfYhqO
         svVg==
X-Forwarded-Encrypted: i=1; AJvYcCU17EMPsEAENKTJ+bpTjGFPyQ/IODjcRNlc+XLTE4XRycYGOYSnBJvBhC5XESpFRNTT3jtMqDiKdfaj8+/D@vger.kernel.org, AJvYcCUBpy+DB4h7PQZbRyyAlJ+TcowGzDSh5uu3+EPYcFKQYm2FgnKT5bqME+ROhmBc8D4lgCe9hvBBY2f8JRflkLM=@vger.kernel.org, AJvYcCV+rqj6RdLr6yM/hHmbN6sP1AeK1NVw7NuXgzzZnKlJTbn7LiBu76U8Up0/W8GdbKIHpfR9Fus9hTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/MAK6ngf8VFeU7U3s+zpEQSi/Y/BZ8RB0BR9p3pX8qiELkFS7
	Grpl7WbM4lSfKYfCZMVw9sSjyw4CIgjBf3V0njUnIX/Sf0KzI/VEWowg
X-Gm-Gg: ASbGncsT36rsmEsaInKpZlIXhIj6eMMwRwo3CehT4GQPOs9tdrXQ5YD0jkJAs06s2vh
	aItfHFYkwU/JYg9zZkRS01gl3SWnQo+MgyD3ywtEwkEqo9G9VJtoOuzNTc2lNdK1eWTwXR3igIA
	USwtyrau5SLsNf9EiqhuU8QvPFeoUNC6GhS+C9cr+ovnt26mZKUDK9jbTlyVseX4X/lWvc5qqdA
	GrT2IvhX0UAbsSXke/BKHzq0iML+/P6/G7Z1K01TPCOGyjn3UXwr9IpjvH44e+ZlEemfaPTyqKO
	amqqsggow9+2+pg0h8gHczrh2THKc/YLTFers8uyL2fXlI4C9GRPWirV/dWlGA==
X-Google-Smtp-Source: AGHT+IFjsUoYBmLh0X886pHpGqMQ8Rzj9r2662mubW8hFdwnbM8UjOnwwpMzrtrSu1OAJYGsoZ2aHA==
X-Received: by 2002:a05:6a21:104:b0:220:1ca5:957c with SMTP id adf61e73a8af0-222d7ef985bmr9329384637.31.1751502328716;
        Wed, 02 Jul 2025 17:25:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57f1ef1sm15687041b3a.164.2025.07.02.17.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:25:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A16E14206887; Thu, 03 Jul 2025 07:25:24 +0700 (WIB)
Date: Thu, 3 Jul 2025 07:25:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 6/7] Documentation: gpu: nova-core: Document fwsec
 operation and layout
Message-ID: <aGXN9C_ouM6ylzyf@archie.me>
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3EAk4poTFdusGnth"
Content-Disposition: inline
In-Reply-To: <20250702-nova-docs-v3-6-f362260813e2@nvidia.com>


--3EAk4poTFdusGnth
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 08:00:43PM +0900, Alexandre Courbot wrote:
> +FWSEC Memory Layout
> +-------------------
> +The memory layout of the FWSEC image is as follows (this is using an GA-=
102
> +Ampere GPU as an example and could vary for future GPUs and is subject t=
o change
> +completely, it is just provided as an example):
> +
> +Here is a block diagram of the FWSEC memory layout::

Above sentence is redundant (as it is implied by preceding paragraph).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--3EAk4poTFdusGnth
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXN9AAKCRD2uYlJVVFO
o7TTAP9xUUoDhtQRYj0Qu6Zz2laGb+FXpuJd8JcCBV+0OSY2HAEAk+mrOqjJ0RCF
ch68VLOtkWzBsPK7zw9sxNMGVFYBYQU=
=gaWJ
-----END PGP SIGNATURE-----

--3EAk4poTFdusGnth--
