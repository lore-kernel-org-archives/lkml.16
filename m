Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD931A9B5D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174603; cv=none; b=fTwD0uFwy9qtXEgAx7dEThwopPDI+qTHd87aG9oxZvIiOUmZaL1FWT01aYwDmljd7eN5A9He6qUzSxDMKuyCG7lyzKdtNyOI/fuYBAzLl+3+01CGMnG21F4/mStFRPNShZ6DggrKG6P2TdfLuVmUi2rCmjuLqtAlJuX41uKDv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174603; c=relaxed/simple;
	bh=8mVD449PawS/p5m/Co7ffo96wtsQqQSnrPundwS6NoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZ/fCnmlbs1npHNRPpEP+SFA1vmHjtSj8svwPqCKceDfHe98ZSxtqlqrheWMFbn11R9oShWegGKmu97bM6x8/8vn3U6kfWcSbU/ys2KJphMEKFF/8JesJ5TUuYVM2/EfMkLP5varziQ+qlM9dsDdrwXuzewvDKMI9bxKoWkROtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7qnPUyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7qnPUyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053AEC4CEE5;
	Fri, 28 Mar 2025 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743174603;
	bh=8mVD449PawS/p5m/Co7ffo96wtsQqQSnrPundwS6NoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7qnPUyA7fNCJOX/b3W3QEGEVBZxw86ST+Rf3WT8ywwQiOA9WwaLvPlOJz1dIiYT4
	 WN8yfBOGiKSXetz+e0MCWbLf5GQGPuxGAYREMQaG37iRAf8S4Wg7i8wvLIvX2WKr+v
	 e91YHfk6ViDsnqdTn7nagkrxGh8jZ6+WzSxlPw01XWxrdLeHOi4MAYhErYAOH6Jn4Z
	 S6cAoXTdw9MyDFIazGhFh1JKDreJjMFKEGOo6OInVC9EPwa+/WgJHYqbniAYCyfHjO
	 azNxz4vc/idtUeiGoxCY6bkomZ0Gy7XtfeItwDlOQKT+kwf/maxZawZ0Ey6pwqNJrO
	 M0ZUtRLyPTqXA==
Date: Fri, 28 Mar 2025 16:10:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
Message-ID: <20250328-idealistic-invisible-unicorn-961d67@houat>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-4-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75a2n7mh4apie7ji"
Content-Disposition: inline
In-Reply-To: <20250327160117.945165-4-vignesh.raman@collabora.com>


--75a2n7mh4apie7ji
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
MIME-Version: 1.0

On Thu, Mar 27, 2025 at 09:31:12PM +0530, Vignesh Raman wrote:
> Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.
>=20
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
>  drivers/gpu/drm/ci/kunit.sh      | 34 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/ci/kunit.yml     | 19 ++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100755 drivers/gpu/drm/ci/kunit.sh
>  create mode 100644 drivers/gpu/drm/ci/kunit.yml
>=20
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> index 9e61b49e9960..90ae57ca86a1 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -109,6 +109,7 @@ include:
>    - drivers/gpu/drm/ci/build.yml
>    - drivers/gpu/drm/ci/test.yml
>    - drivers/gpu/drm/ci/check-devicetrees.yml
> +  - drivers/gpu/drm/ci/kunit.yml
>    - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-sta=
tus.yml'
> =20
> =20
> diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
> new file mode 100755
> index 000000000000..197b19d05fba
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/kunit.sh
> @@ -0,0 +1,34 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: MIT
> +
> +set -euxo pipefail
> +
> +case "${KERNEL_ARCH}" in
> +    "arm")
> +        QEMU_PKG=3D"qemu-system-arm"
> +        GCC_ARCH=3D"arm-linux-gnueabihf"
> +        ;;
> +    "arm64")
> +        QEMU_PKG=3D"qemu-system-aarch64"
> +        GCC_ARCH=3D"aarch64-linux-gnu"
> +        ;;
> +    "x86_64")
> +        QEMU_PKG=3D"qemu-system-x86"
> +        GCC_ARCH=3D"x86_64-linux-gnu"
> +        ;;
> +    *)
> +        echo "Unsupported architecture: ${KERNEL_ARCH}"
> +        exit 1
> +        ;;
> +esac
> +
> +export ARCH=3D"${KERNEL_ARCH}"
> +export CROSS_COMPILE=3D"${GCC_ARCH}-"
> +
> +apt-get update -qq && apt-get install -y --no-install-recommends "${QEMU=
_PKG}"

Thanks for working on that.

I'm a bit concerned about using making it entirely debian specific here.
Between the call to apt, the gcc triplet and the qemu package name, this
not really a script to run kunit tests, but to run them on Debian :)

We should make it pretty explicit and / or just assume the runner has
the right packages and call kunit directly.

Maxime

--75a2n7mh4apie7ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+a7yAAKCRDj7w1vZxhR
xQvVAQD1lfS0Kb493V52mh+q8MQC1q6XrDmqPA2YMCaf+0CXYAEAs5AVppk0CIA3
T/QxymOrulLOT75Wz9HOu5L8QRI2NAg=
=wBRy
-----END PGP SIGNATURE-----

--75a2n7mh4apie7ji--
