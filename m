Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0632AEED;
	Mon, 28 Apr 2025 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850530; cv=none; b=YWlLAklgmnFeznoVxmFdIMVJPBfcSW3rEDzMgiHdLA8LBumSwECZVikxeQQUPkeHVVLeXKp3iSmK+n6d7a3Iri0LG43QddYp1bYuIi7cF+ymojcT7DrwUbonp0QomOia0ExvcOjeF0UXacC5SyxdsKkRfNqoI3UVLBNrw2ITcsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850530; c=relaxed/simple;
	bh=hdCOCV4zJWl4/oxtxfJhrg/z+ro0EzkOCQTyZRBms4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtEN4udL74PSxs4JWgrAp4NjsIH3t70FDTfKTEJ7BVXEvEMRi/qmmcQO2x3KESoJ7rQmmPPrVdzgbIjOk8NfdRWDaMcTgEFY4pR1ZmnaPvnQaMYGpzL4jmHpn8HUN7dcg62epKxoru5x7AdvMpOfwSj0RLz8unvhMo8/rP26OGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4CWfVAR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4CWfVAR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2295d78b433so51540325ad.2;
        Mon, 28 Apr 2025 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745850528; x=1746455328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5g4Z4+GwIKYIpvt4NVYWM9yg9MYntd/UapAZZileFbw=;
        b=k4CWfVARjH/tf1QkBIw9VXWnCsEarw9zy7aefV6uoJzlsRNGi6sGGUXa2ikbVXuJ4G
         27HbeRq827FY/BNIAQH27sx+ubHCAWd4EYUeG8OGdA1tTjJ3QlUsJvh3LrXUKiHfPnof
         FB+OCaESldsbp6NZ+MWS16VeubS6HsjocLhz49uAm3k4ZKafv/Lqt72MjzQhVkBRHoV/
         23QAxg+18ETyEjwHX3gSDhlB0kZB/SNlaNWgQJpVmFtZN4pa+PkuiXZttSlFEbvMk0Gm
         N6Km7lyclOILyy8oo28A0lZsDi3RK5s7OlEGduJ5hK6zidR7xXBXJRJkwjupInkrhKFg
         jWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850528; x=1746455328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g4Z4+GwIKYIpvt4NVYWM9yg9MYntd/UapAZZileFbw=;
        b=l+a6c1K95R12DHn3UgomiXjIxqWpx4fBKhGJcEp7dzBG7YXhMN2kw6zn150hT+ZOOK
         M2+J1XZMVF6zy7rkz7AbFqQS8ryJPIfL/qrooVMC98Sjm09rYlKzlmpBNoFsKlXq+oet
         8zHgrJEcUthJkjyyuSl3wZhbKRhy3pcXEWjWnfsTwSbBwSQaY4OL0oWeUEV1fQPpYLtD
         4/ha85m5B9JvEpWJyFq2X6jpci9TiLF69X92B9YSRAxtEQpV8V1E0ZwvT2ihvBZlOeTa
         mzdkfLkz1i3r3k6xSI+kse+bO3YwR40IMOHZexbgAGLQoYBGFwpcb76wZ7Ni1YjMt5br
         16cA==
X-Forwarded-Encrypted: i=1; AJvYcCXSFLeblP+y10hR4Ow3fikpYeaGe3cXsFZpD32lU3WS1d2XNudqPn8SDZFgWxk4NcW122KAi3Zy1yY=@vger.kernel.org, AJvYcCXaM1a7bobwBovc4v7GGGch3iRF09qAXx1c0ll6Kg60Tfxn5NYFzuxk0DY56agyW1AOVSzmER6r7T8DCgWC@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQn+7HPVLm+8c6kruniV9sbJRMN4o+nmbHWwEiipR7FVih6U8
	rzIm9HOqqQMXuBjqsfbjX49fuc+Y/3oLzGlvHdMQuBm/tHUInws9vfquYQ==
X-Gm-Gg: ASbGncu52tA15hVUMvrKvt9PlI6qBUtzt8Kr+0R0laNa84t6Vz6rByQ0D0soYSdv5dY
	BXe35xIZDhv/zVXhFQs7YYl8GpZQann2FuFcEQ+Cn85mACUXzmvfcY+/9lIQuaa3RudGsDwcviF
	51qbFrQlFBDO1cm4/T7i0tEp7jInnpTB+FV6BDsioq2j3CqwtrUfsyp2g1HTWe7tsjuDtTVn0mK
	t8onRbnA5iYHFEunFbKh6ygko5d3/1Hyatj0WnfgBX2twV/fOdgNXWUfaQ9vnV1tN/HZ+YddE8u
	jf8SQ3YnlQdsDRXwGHkqxZmGx48XKeE3f7EC2JGp
X-Google-Smtp-Source: AGHT+IHxqvG0AoPIk/6X9dVmJO7yaPKXmViUWOKnkpMryMvDFuF/uEWC1LrJWibExT6XT2YdzOFqcg==
X-Received: by 2002:a17:902:d54a:b0:220:f151:b668 with SMTP id d9443c01a7336-22dc6a00185mr115680765ad.20.1745850527727;
        Mon, 28 Apr 2025 07:28:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd432sm83410805ad.90.2025.04.28.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:28:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0DCA950790E2; Mon, 28 Apr 2025 21:28:44 +0700 (WIB)
Date: Mon, 28 Apr 2025 21:28:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Savitz <jsavitz@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3] docs: namespace: Tweak and reword resource control doc
Message-ID: <aA-Qm9dWSLTOqcNk@archie.me>
References: <20250421161723.1138903-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pgt4JicpTY9IIAZU"
Content-Disposition: inline
In-Reply-To: <20250421161723.1138903-1-jsavitz@redhat.com>


--pgt4JicpTY9IIAZU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc'ing Eric, Mauro, and memcg folks]

On Mon, Apr 21, 2025 at 12:17:23PM -0400, Joel Savitz wrote:
> Fix the document title and reword the phrasing to active voice.
>=20
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
> Changes since v2:
> - Fix another typo
> Changes since v1:
> - Fix spelling of resource
>=20
>  .../namespaces/resource-control.rst           | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/=
Documentation/admin-guide/namespaces/resource-control.rst
> index 369556e00f0c..553a44803231 100644
> --- a/Documentation/admin-guide/namespaces/resource-control.rst
> +++ b/Documentation/admin-guide/namespaces/resource-control.rst
> @@ -1,17 +1,17 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -Namespaces research control
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +User namespaces and resource control
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -There are a lot of kinds of objects in the kernel that don't have
> -individual limits or that have limits that are ineffective when a set
> -of processes is allowed to switch user ids.  With user namespaces
> -enabled in a kernel for people who don't trust their users or their
> -users programs to play nice this problems becomes more acute.
> +The kernel contains many kinds of objects that either don't have
> +individual limits or that have limits which are ineffective when
> +a set of processes is allowed to switch their UID. On a system
> +where the admins don't trust their users or their users' programs,
> +user namespaces expose the system to potential misuse of resources.
> =20
> -Therefore it is recommended that memory control groups be enabled in
> -kernels that enable user namespaces, and it is further recommended
> -that userspace configure memory control groups to limit how much
> -memory user's they don't trust to play nice can use.
> +In order to mitigate this, we recommend that admins enable memory
> +control groups on any system that enables user namespaces.
> +Furthermore, we recommend that admins configure the memory control
> +groups to limit the maximum memory usable by any untrusted user.
> =20
>  Memory control groups can be configured by installing the libcgroup
>  package present on most distros editing /etc/cgrules.conf,

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--pgt4JicpTY9IIAZU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaA+QlwAKCRD2uYlJVVFO
o7/ZAP9oWQHSgwNIJsXWK5L2ohjr2wvXaOpCzc+Q10NdAEeL3QEA/gCwf0OB8Hj+
zHhuqXi8a5rRf5+8b8HMOc1aPBeQBw4=
=DtNU
-----END PGP SIGNATURE-----

--pgt4JicpTY9IIAZU--
