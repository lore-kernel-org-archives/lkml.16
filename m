Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69486235379
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860700; cv=none; b=BVbnHM0dsIM7zpv28zw9BrOdCcMKGQnkA3qz3EgUBmLbe52fM0iAApIU+yc/W6bMcxw5nZ8P/at+GyTF+TNkqw6gIkt91BKW1PEedsmZfo3aPa1hqJZ8qmrvD7Tn70D9txn8/G5nW1B2ZKHBHLz3k22HCfjxuBIkQslmn23biDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860700; c=relaxed/simple;
	bh=LKYMQum0d8WAVtaaR+e5ocj8ndexotoYw5ZuNUKQpgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITSKKrJzobFHk2QcGd7A2/qHOKbgYnX9R9Z2ZybS25esotF7yRLnIEttTc/lwy5o/COgdH6IlhWk/JVOXkCOPnQb41knPAx8YUOBkv30Gw54plzgy4Nh32JIt5fPk25nH+w4LurP97hLFhvEFnNHO182tBNXgnDKop+eMf+WhaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+FuTSCa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+FuTSCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D0DC4CEDD;
	Thu,  6 Feb 2025 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738860699;
	bh=LKYMQum0d8WAVtaaR+e5ocj8ndexotoYw5ZuNUKQpgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+FuTSCaa4IKftdhtfFTG9rFGzE2Domkv2p134y1R9I7xCQRxJyKCK5lk/aAT8VK+
	 ZXJe8SwPKGyPyL8d6Y8fD0UOHFbR47PeQPzfmKsggKSMlyZ07uHIiZzUnkmyX0CjT4
	 bv4t5GH3VFDp/mU+7d+DKr4TQAzscvV/aDupoklzwceWvwFDEn1pKEdybVir45D3sG
	 XFvqA3zGouZL+i/MMMHmrOpp4J6flx/kD2YGX/wZi4dJJFKxfhOMyZtFOETJX0TqeU
	 Rg7Dx9E4URrFfIqGzZWNNCrFtvmlLFue5obaeyVK01QhmybZBeaNdN9lh/0wqAU9w7
	 mSARNA7rOnrqQ==
Date: Thu, 6 Feb 2025 16:51:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: irq: Use one way of setting all bits in
 the register
Message-ID: <1a60ef2d-365b-49ea-99b1-b83faee910c2@sirena.org.uk>
References: <20250206162933.1127937-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G/N3VPvq/ULC3hzw"
Content-Disposition: inline
In-Reply-To: <20250206162933.1127937-1-andriy.shevchenko@linux.intel.com>
X-Cookie: With your bare hands?!?


--G/N3VPvq/ULC3hzw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 06:29:33PM +0200, Andy Shevchenko wrote:
> Currently there are two ways of how we represent all bits set, i.e.
> UINT_MAX and GENMASK(31, 0). Use the latter as the single way of
> doing that, which is crystal clear on how many bits we are talking
> about.

I think I'd rather go to UINT_MAX since it's more obviously correct if
we see platforms with int that isn't 32 bits.

--G/N3VPvq/ULC3hzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmek6JYACgkQJNaLcl1U
h9AYeAf/dmNRGEohKSrUqDllOpmG7lBnnQvzJOCwJI6W3VGsBatJSs7/ca9t1MQK
2f+cG3VVfffX/eZWrdJxLR0ipMB4Pq/Km0ngBX3Iu9sGUELw3O3qQib010qnePUn
oDPsqUmwpda4tQCyBpIIbzd3WuIEVtsH9LzIiO5Cplyp2FLcfHXtOd50e17UkSG+
ehanpIEwB8xAgpGqhlyu2nBV1Gw4Z1BZDqwu7IK2KXigbYGZZk6h4gkcgCyCXP7i
KkOczR5f/8JBzs4pJKBm/KUN45auAo6kURa90uT3FIckCypYSKIChfDpCCb/rqP4
geFEdRw4zmtK+PNSj3OzXzXKjIMz0w==
=O1IV
-----END PGP SIGNATURE-----

--G/N3VPvq/ULC3hzw--
