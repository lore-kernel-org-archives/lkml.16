Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF811F2377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635787; cv=none; b=gZmDnq6toWclxWgYAndNm9/ivVmdTt1vv2dqfcLW84mjZnUSTbHjldHLHr9cMYltuLHdsFjo9rl/oO/3m7kpnPzDaihd/rupaHtAaVA0mVYnr2RyKxgisNNgtJsQgmjOR+vT6MUcF/XZWBdQNRt7GR0oKiS/7LUNLC9SRXkB0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635787; c=relaxed/simple;
	bh=gYdyl/xs9NszjtT8OQAgXzR0bFHdlz0ehH5k6XmLY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2/cKTq0G1wdFMuLcs5LcyEt20dUIAv0+8gOMtWkoxnA6/NW2FNDHH/bGZHdc1MMUIPM0vwuZCesDbyW4fH46KG6vvC/eyiALZho26ogGf6yEfbJQUS6RAH4tK/ABfbuGUkiQhEqbrStOqK1yC3Gv4FQWWdtimvteud7jjy5wxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgphsMYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgphsMYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B875C4CEDD;
	Wed,  2 Apr 2025 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635787;
	bh=gYdyl/xs9NszjtT8OQAgXzR0bFHdlz0ehH5k6XmLY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgphsMYlcU3zJqkYe8q0MT4PirpI2icfW8R9/HgqJWypfnhoiMVw9jHpk3p5mxk5A
	 bbC8CC/rl6CBc/scGR3m3WoBwKScOJm8VMav0tTXImwzAWqBB9ic8vRRzwHuXd9jpU
	 v4RVxuZ3RjN9CKosudcoyLL/Mk4ZGD/kKwx8lfK9WoC1uquDYpshaGTYGzHFyo8P6H
	 6sc+89Cpb8iivDBZMw9Zdy89PIn2iwIYz6Np8axxOzJtMIYhXofbCe/t9KFR47pics
	 BeYDyQOMKIF8aF9DZTg9S30gb8YeoM7pEj14NddEndT3tZBqbXBbf0isZIDXDvzHN0
	 jwgklcXAgnpaA==
Date: Thu, 3 Apr 2025 00:16:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S9KKK3S9kgEoh+0f"
Content-Disposition: inline
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
X-Cookie: To stay youthful, stay useful.


--S9KKK3S9kgEoh+0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 02, 2025 at 11:59:32PM +0100, Mark Brown wrote:
> This series backports some recent fixes for SVE/KVM interactions from
> Mark Rutland to v5.15.

*sigh* Forgot Greg and the stable list here - will resend, sorry for the
noise.

--S9KKK3S9kgEoh+0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmftxUMACgkQJNaLcl1U
h9DEHAf+JffhKVeSblMyoIP9HGnMagF8mZmvHmPVPJTR2HwxahEyIsFeBvCEMc08
b4h5AANF8kjtAX/9YhBHwFmHQ3RpCcgVcJk/kPB6NcUTJ9hhtMluXBMp54Y59Fad
oUtxQyjK9p1x3zKh+Ub+KU651q10D0oMOA9C1QJAmococbJEMp4ELnlECoKqDqyv
+I29xOo+X7XAuyO+z0kxxCuPxz78sEjVycHKUyLKRLjHiQHMS+3qeKvblvKkBxkW
q/+vTWIPozAZHnPaTcFWRIqlGtGsvx2Z5Pchhlz114SZFYLLtoRi8mTf+R09nOWG
aW4ZoQt8JmuviREoFTfYhC//tTtJ4A==
=2GZQ
-----END PGP SIGNATURE-----

--S9KKK3S9kgEoh+0f--
