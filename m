Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D081E485
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648551; cv=none; b=fDaRRmjGGlbOv4XdxBoguJZkLsbbm3zMW06TTQzkIpeyotmtZpwT4nOBqn2hpbReS32CRStGfBASFGhY4ZJs7SnV2vtNQm6MG0cTrtTYp/rJlrsQMpwhFrmKof6iU0iGgry7YSzfZtfUaBHgHli42Sxc3c9rzBbYMNHsq/W1bF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648551; c=relaxed/simple;
	bh=jVoywLIjzkET+7C9/4zMdTppLO0aEIqMddLoYr6BrJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mffeKh2uD+kXBIq5kI9ZLUvfMUgTIUsmygOYhQoBTsRoNIeQhK/cqLYURxdy/2wzjPR5uoiIhxkQb8fAuiHEkhMhul8YKWltS+0pT9gC8WN095Jph5qjMXTP8zO5IKm2vvAogRDexA2jjzJDRlZEasrzCPhX7UC+S0JgzpwOMoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1bMcdQl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1bMcdQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533FC4CEEE;
	Wed, 11 Jun 2025 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648550;
	bh=jVoywLIjzkET+7C9/4zMdTppLO0aEIqMddLoYr6BrJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1bMcdQlZmKXoE6ZzP6N2uOp4KbfTIWMvBxj0RRyKwBWiZbzYCio7ndrUZWXGWpoa
	 9gw17Ml+9XyrHL+L4yzdgNE3+b44SSkdIk9gR0n828Z8X/wQiDP3ngR+2qG0f4SuYg
	 0tIE7mmdjGLmP9wF+IyOnt9IZ860UzQ/1YO2W1vRwOpK61N4Ii69kTSiLamv+pJ2Zu
	 uMX/2E0QNPfUkWl+YoxYl5GQSGzRJK8TVEo0mff9GKU/agw/dJahn18XNx0pyqThQ8
	 mm83vmu5KOmk0vNSZLgaig3rmxaZpZtMxwpRROP1dipC2F/R1/GNIZBsJc0LtFg67o
	 3LuFCLzeomelg==
Date: Wed, 11 Jun 2025 14:29:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, ardb@kernel.org, frederic@kernel.org,
	james.morse@arm.com, joey.gouly@arm.com,
	scott@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: cpufeature: add FEAT_LSUI
Message-ID: <ba043c27-710f-4f0b-bbcb-64175bad5df7@sirena.org.uk>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
 <20250611104916.10636-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oz64gCgUqRj8hwmu"
Content-Disposition: inline
In-Reply-To: <20250611104916.10636-2-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--Oz64gCgUqRj8hwmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 11:49:11AM +0100, Yeoreum Yun wrote:

> index 10effd4cff6b..d625f4987aa7 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -59,6 +59,7 @@ HAS_TLB_RANGE
>  HAS_VA52
>  HAS_VIRT_HOST_EXTN
>  HAS_WFXT
> +HAS_LSUI
>  HAFT
>  HW_DBM
>  KVM_HVHE

This file should be sorted to reduce spurious conflicts.

--Oz64gCgUqRj8hwmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJhKAACgkQJNaLcl1U
h9BLDQf+KuI5ZMIqzhIfVTfzb+HD4DGRoZA6vg7HfP25HR/0YpUltbfRndSRtRYb
hZeaBR1zeYkCkTzqY/ytnPwXlNKTW9AsTX2BZC8kEwhUKfHyHYqMYxdk5y16Ys6R
oWLpPz2KslpRoe/pFDoB92OOBxC0PdRK9zl+XmphsDiOcfFuV9RCL5e/tg7zqeWe
rYajVsB/tgv/qdh7tgQlImrxN19W4lVVuuNtbiqpIZ9AXKQjMmlk1KkTqlW7Z9ir
ee3GLRH6hXnpZtVrWFHLu01UW/YNBd9pg+IupGaSMvWsc71/2jOKxbpdHY34ieV6
8gTIKD8lxVmwwbleJz0y9VyzOhlp/g==
=l7pp
-----END PGP SIGNATURE-----

--Oz64gCgUqRj8hwmu--
