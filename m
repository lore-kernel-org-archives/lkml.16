Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE931EB1BC
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943047; cv=none; b=pCnTdJRxAWJrCX2dzBWOR0SLt7OuIwzhp6O0B3qPKKMxzxNmfJdZ1h+a/7NaKtD83/5NtSpLR+YSvrmOH/ziR9hjGjsY9eu0d/TEakxGUGrNDeaTb9kLTgdfG4L9W+u2aHZ4lbTFmDrXmS746L5uXr6AidWELo3g3o4HsKp29/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943047; c=relaxed/simple;
	bh=tWyvV6TN9ZlIoRI5GQzK6C31rOOy6GemxCxQSeFrX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLjLASsUnAubrnMJrYZWMj8vaXBsxZalldTAHFogPt+iioPh6yWHB5xkQ5m5XtnvQd/4xs/JLQp0+r9a7iJTiAw9SJfCIPGOag5v63gg4i5VWRH5Lled9/2HP2IAGDxnoQnLWCogv/wqCZCv1BEYDqp9qq6ij8V3YUCsX/Hy92k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6H5L5J0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6H5L5J0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6674DC4CEDF;
	Fri,  7 Feb 2025 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738943046;
	bh=tWyvV6TN9ZlIoRI5GQzK6C31rOOy6GemxCxQSeFrX88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6H5L5J08FBjKM89+5awG+3iyAtNIEztSkZcIjAes6Mr6j2E0IIKP8o5f+/HuV+WR
	 WPKsswqfUGOgxJqCBL8Oqv0zawsDVGt+ne/kdi9hYAfkL6scdZTQZgZFiSodejdYTQ
	 ucRU5ysz8F1WrntbvFo29ZLN2dc+Jq75pldRtXhEtdAKLL/oUCWsH69Q+X2d8rRoxp
	 uyyCtL3lLcmn0Tq/t53E2wjOdFtfQADjMbDEzWWa2Y8xx57cMSWVNF4FNNAojww1v4
	 FAbdIShSe2yYODWaUy3oIi4A0a1qysF8pzT8XjgZeDr+h1tLwvri4URUJarbjIQbQv
	 kVqkY+FlzXoLQ==
Date: Fri, 7 Feb 2025 16:44:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 43/45] pwm: gpio: Switch to use hrtimer_setup()
Message-ID: <2nvnbgmvrgtquoyzz3dzeoityq4deqxikzu3osd42kuy3n3dk6@7mjuj6kpkhb7>
References: <cover.1738746904.git.namcao@linutronix.de>
 <7b7115da84372a49e36a0ac1a5ce553129c3ce0b.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efyvkbyv6q7tzwtb"
Content-Disposition: inline
In-Reply-To: <7b7115da84372a49e36a0ac1a5ce553129c3ce0b.1738746904.git.namcao@linutronix.de>


--efyvkbyv6q7tzwtb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 43/45] pwm: gpio: Switch to use hrtimer_setup()
MIME-Version: 1.0

Hello,

On Wed, Feb 05, 2025 at 11:46:31AM +0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
>=20
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
>=20
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: "Uwe Kleine-K=F6nig" <ukleinek@kernel.org>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks
Uwe

--efyvkbyv6q7tzwtb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmemKkEACgkQj4D7WH0S
/k62XQf+ISrtQgrNUvaPZ92XcG9HE3OkqjrYfF+qdIVVUzU1hdLGQ2Z3R7YJ6k3R
N5Xayd3RTyuUtxcK377rBkxto4DwTjN4aSCwhY7Oy+44aJboTKi7g+FAxbGA1n1v
kITGBQdxM9YayvLxzVXkieqLPQoKQXI1lcd5TuODc6/RvxBLMiUcqdyumftoLMF2
uo6FBt1GPXOAjkRDa9vvIh7k8EBaBTySH0i4v8foLcv0AtLwbQPUKIwEcM+6xQNu
tG4Xxbj3kzIy0rc3JqDXgcJZPW0oLAhXSvPcxsmcMyhVthZE8rr61Z/usoOcENDR
XUfTdnplK63mPwL/3pEd4+tgzbtr0g==
=73Pe
-----END PGP SIGNATURE-----

--efyvkbyv6q7tzwtb--
