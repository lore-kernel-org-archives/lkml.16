Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC22E6102;
	Wed, 11 Jun 2025 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644851; cv=none; b=VvcYPbqPzBYey/mGFch68Ff/pPo6X+2gfao3eQioaZ/l4yL1OmpEcw5dt/4gWPPAI2YDqY+SL8iQb2QkXzfK2btfwGdQbepPascH/YEaz2/2HtV5SKgtzqbPbf9ml2p8yJKUwSUigiAf/3sLhFl5OLfw95yuUTKf98vFKR69bfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644851; c=relaxed/simple;
	bh=VarOxXQv873WZeOePrBSFiWHWwREU4KYRKEOJZm2ft8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afnxwVUGx1Mf4BZG1/VWUIlpqlG8mxhGVeGhjevE1sQ+OHaM8pP6kGzkiTfYJAMWdwooHIdn8ykXBY5BwIsJrHz2msHNex3IBAqC9DFxzMLetcTvEuzDdkDJLM3/jox0AFwtDip7iXrsHCc40FCvVzxb0fGGmNFd9NRDBvYAAko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnzEgD9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnzEgD9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFEBC4CEEE;
	Wed, 11 Jun 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749644851;
	bh=VarOxXQv873WZeOePrBSFiWHWwREU4KYRKEOJZm2ft8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnzEgD9wYy94tuU52DTucvNNzWEatNaRBB7xmDtwPxMnxZgwU22zmzRcih/2WPBKq
	 Dgy43YBwmQHBRVokY5DFBkZeG0DvaPu1VBJ8IwkBFRoLurDkiEsHX8qI8pi1KaXpZp
	 1lV9SgR0+N9dcE2BOpxYQ1soef4YG8JJX/7DCPll86aSBMvLhdI/SCKvnXal9egw+f
	 Qf288vg86BnTQNHzWQ2KCPhKEENu3+YrDXnU1SwshaxcU+PyPDl9SW3e2GjwiZr48M
	 0j+z9pN7+u1BARMhReH+EMUgTzryPbdGXRf0UZOIySClxZIjAQAISOhW1jyNQn1klS
	 XctqA9VFIarEw==
Date: Wed, 11 Jun 2025 13:27:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 8/9] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <0eda8416-b8b8-41e2-8d08-6dab1c1c3561@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-9-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoS+YBzfcBx+g2dq"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-9-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--xoS+YBzfcBx+g2dq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:41:06AM +0100, Yeoreum Yun wrote:
> Before add mtefar testcase on check_mmap_option.c,
> refactor check_mmap_option:
>   - make testcase suite array with test options (mem_type, mte_sync type =
and etc)
>     to use general testcase pattern
>=20
>   - generate each test case name acoording to test options.

I didn't specifically check that all the tests are the same but assuming
they are:

Reviewed-by: Mark Brown <broonie@kernel.org>

--xoS+YBzfcBx+g2dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJdi0ACgkQJNaLcl1U
h9DPxAf8CnBE6O1+B8YUArr53BhKE6sjRiy4cbtq4RUmuffXxC2JZbKPOEl/e6lV
sbcz2vavI6MsUS9bULJ8Gk4SNQJhsuqhzdYaVdjpfCtoOcUQ94B2xXkPmrKyBoEM
UIqbVr0b+oD9dCQirR2L7U6KbE4xwG2+7+1jNxGkzhtykBNqkvH3o25ZqeTwXgci
nbDhB6NT13EVnlJHsYsyv2fNtdLpnBfjw3eD3lGBGN6q5BCcQiKtxKGeGDw0J/aC
ILqkJgNo33mvMo7U+6wF0oAWV/HZpcOL7OPrtEQATkoPgu92FvPL1LhT39gE3XQW
wLjATcW7vwncih6h6oxbuW28Pu0BCw==
=SK6+
-----END PGP SIGNATURE-----

--xoS+YBzfcBx+g2dq--
