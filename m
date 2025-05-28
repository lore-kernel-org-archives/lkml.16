Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69F27450;
	Wed, 28 May 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460034; cv=none; b=JasGersJ07HUQZBHax9KoVo1wyquQHdkHq7oFJJPvxFrmupMSq6Mo88DszKUXu0vv3PqrUoEqj7XfaMTu2MrX7+KG0ACqFIUbtUzGWRDDA2aBo/rTf1JvYqo5LH4ZezfMHv9DKoNT734TAOuELpHsXuKJ7qlHLkYgM5bIkScRso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460034; c=relaxed/simple;
	bh=FT5jPs+dqCD3AjbDySkSPNsUV4PVLpX3vb2PFRhmYnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHNkk1YjNoMiPf0y4QdbzcVktQOADYK4LG8OkmXaZvdMa4VN8Km/jcvy3+uPkLDtkuo+2U2zlax7UW+COH+NBDnLkMkbvETu1N3U2rZnMdp1xL2YgF31sZX/0WhnNRGhtcdYjGpEPFdddxfc+HcM+iQT15IYIMZD3jlzeRiwJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVWjUyGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVWjUyGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81775C4CEE3;
	Wed, 28 May 2025 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748460033;
	bh=FT5jPs+dqCD3AjbDySkSPNsUV4PVLpX3vb2PFRhmYnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVWjUyGyDzirPgLRjooIgaKeZFIxW8vutU4g3CsekM7nLkNvCsLuXDM5M/kQUN9mI
	 b1tcpoxnJzN/dHT4647kwmRqtRoCZalXgjSIpjJ+M7zp1/Wen9PBJjNEy9ax68/2rX
	 pS+ie0yAJatGakj+J8kW8rEu9FXiwuZvLTBGYdrpGX3JXG09CxpvxShs0WgMVfnpf5
	 6H8OvIAV4DBf34QV8EVmd8MiE7twLMvVdIJ0VNyu40rFRf2PPMx04hB7OPAciBM7pg
	 RuAzJ16oeGqIf/9zM/+c4Y2+zQv2rz93ptpEqjcXBD3hj4iQbExBjfNRI7Y+LoNK7s
	 +Rw3JI6LkB5CA==
Date: Wed, 28 May 2025 20:20:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Okazaki <dtokazaki@google.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 0/2] userspace-consumer: adding is_shared flag
Message-ID: <f1084652-9a1d-4d2c-a7c7-9f40e380f5a6@sirena.org.uk>
References: <20250528174426.3318110-1-dtokazaki@google.com>
 <a0bf24c6-58da-42e7-b686-03a893b38ecb@sirena.org.uk>
 <CAOC4094v+MyrWgbkDJZ5KJhzuTmmgAuS-XacbFt5jHK3aYtOrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LnHhjw4lHIpo2VnI"
Content-Disposition: inline
In-Reply-To: <CAOC4094v+MyrWgbkDJZ5KJhzuTmmgAuS-XacbFt5jHK3aYtOrg@mail.gmail.com>
X-Cookie: Keep away from edge.


--LnHhjw4lHIpo2VnI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 28, 2025 at 11:32:19AM -0700, Daniel Okazaki wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> > What is the use case here?

> The request is for a regulator to be controlled by two different
> subsystems. One is a userspace HAL and the other is
> a kernel driver.

> Alternatively I could expose sysfs nodes in the kernel driver
> for the HAL layer to connect to, but it would add coupling
> between userspace and the kernel driver that might not
> otherwise be necessary. The userspace regulator driver
> would add some abstraction between the actual hardware
> and the sysfs interface.

Presumably the HAL is working through some driver since otherwise it
would have no access to the hardware, that driver should extend it's
interface to cover managing the supplies.  This coupling seems
desirable, we end up with one kernel thing which knows about the whole
device and the firmware description is not dependent on the fact that
there's a HAL.

--LnHhjw4lHIpo2VnI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg3YfsACgkQJNaLcl1U
h9CmuQf/URGMV+wiSdqliXqyCqE0ly8XyOiPnNdRUNBVEfIypYpd5lE8f7xLz8vt
a+ljoiGHxPc7Q3ellVkZ3Il6C8pbrWbysA0iRHg2XilEmpiPtpE+p49Emb+J/MMB
hCyZUNdV5BAuL7kdXvOr7xgZIJ3EAZNhE22k4iP6G+JV7NPAW9F7skfSFZQOjFfy
mgrksJs4jfJhPxtrPI0V0/lmV9/NBJkzX2fkaHWp8GdeCiF4ESbdPKXFxuoVD8cl
vxyH+4fQSQ619gm28HEpDwX+tdnZD1VLHxpHkwW1/ILbgLLdgAWhM5HXSbqAtYUy
IOaLVjEwP8egw0GHSsPIEzfmWNK7Rw==
=gQjK
-----END PGP SIGNATURE-----

--LnHhjw4lHIpo2VnI--
