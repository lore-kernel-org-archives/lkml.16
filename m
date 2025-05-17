Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AF137923
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747500354; cv=none; b=kvBKKhEhF/4RDAFEFKf+kAlMpijPWMe5wXJBUOqXj6j+haBnuX7sxfNVu35P0oKDzN82ENzUmV9Vf+MobEkQch+GgqwMZmc9WC+RVXjyWyriGE2qLzW/WjE3oVPJFJQPwdlMhvFLD9W1vLTsqEZz0SLVkDRnhmsP8HQCAhZyW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747500354; c=relaxed/simple;
	bh=O3BL0umFxn7eWMgY1o+713K/D/yjdZ4QXL/2PnsTbFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZwtlZXnjeMPcrE58m27K2BeojEX36MqMYDebLnmW6qgv9jkQC6HW39OuypdZiTRcS9Wk7Gx9Nfvgdb6DI7YVb28IdwwKNlqSKCVEfNLb+N/JYKg7VupX4JKyteh4mPID37SkzmiSEgCveF0GyjThLpWUyC8PmJT7ii24CUnCk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVBuL/WJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVBuL/WJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4ACC4CEE3;
	Sat, 17 May 2025 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747500353;
	bh=O3BL0umFxn7eWMgY1o+713K/D/yjdZ4QXL/2PnsTbFs=;
	h=Date:From:To:Cc:Subject:From;
	b=mVBuL/WJwalaCMwLs40Sv+sb9ct9pAjX2bNO/V3m98J8kHwXnKaZiNQpuREu+lErz
	 sylOcNtoXoIc5VB+dQhfSxqYf8RIVdeNv1cTbbqTSOV9xKh10kSio064BVkGT3oFLI
	 oJ5COzpPFRbZO3lUJHiVkTNI3I1S5SjphPuODeBsIOtYTh7pjzUFD6PVsWGlVD+yJU
	 +TZrGTplGYUFBpxMh5W3xHDNDPFRoTWffZ72qX+g6kH3VEPxq7Da9EMcWyuNxAjKrH
	 dZF94ZElTR+q+6HXw4cAWpQcdtrQPJOl98l6OG5EtZnFWIPIv7YnuWONY1Qsn2nOz3
	 csMjqlo/pkkfA==
Date: Sat, 17 May 2025 17:45:50 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: soundwire fixes for 6.15
Message-ID: <aCi9PijlCQGpWjXF@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVSjJ1Yx/uU5dfZN"
Content-Disposition: inline


--ZVSjJ1Yx/uU5dfZN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive single soundwire subsystem fix. Sorry this is
coming a bit later than I would have liked, but vacation, linaro connect
travel made this to be delayed!


This fixes race on irq domain creation in soundwire bus

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-6.15-fixes

for you to fetch changes up to fd15594ba7d559d9da741504c322b9f57c4981e5:

  soundwire: bus: Fix race on the creation of the IRQ domain (2025-04-10 11=
:58:43 +0530)

----------------------------------------------------------------
soundwire fix for 6.15

 - Fix for irq domain creation race in the core

----------------------------------------------------------------
Charles Keepax (1):
      soundwire: bus: Fix race on the creation of the IRQ domain

 drivers/soundwire/bus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--=20
~Vinod

--ZVSjJ1Yx/uU5dfZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmgovT4ACgkQfBQHDyUj
g0f96xAAsnOaaG0nvXy6jrxKGInrT86r13+cEXM1Y7kfpzqsfwkXhHm1VSNSWOG8
Ie+I6Tv81XgN0I1Y1A8qj5DGvQAU2aZu4LZ3R/GKRlNox0PKWa9qXRLy5xE9adv1
Y+CsUZlD/p1OkEUFYPmYRi8hPnBDPtjcWFKd+wzWlKZZTJCCv/SFDI+MB5pXvs0W
NNhtJxCFAD0nv0i2aYsFrdR6tRxz3CEoVc0CkZ+sE0NLtaDblBxv4o/tsnPjGMus
00WG41YeCkWcuEBTCZ27eFtPMdzFr9ePqlqoRlDSY32GNMrl/osRFBp0JsLo0E98
gX9jZo7iVDgvq/TfD7CjTwFIs4dZQhmUvj6l3IsZRScOuO/YdUwpDAdKiB6KK2f3
bR0gjwGz9xIPyn+eRMOdQJhEmppjnlAEbFbzreDynlPRCIavW7GRTNJ7kURDAIXo
HNppAzb2SarHZEQLPUjhaMRudhC4GGu7ZkZks6FIRPnZVNOiYWBSpStmKWF7cc1l
sU9zgLRWk+6CXObW+An+ozKtf/zlBEIhipFaQShJS7faeG/P/C6C8vr7EoH5yX4w
zEoyT9zPKidF6IzVqts5Sqav0M0wcmxDLoWui018dgCN3Iag5KaH/6osUmd/jYPa
ASLgLmA6BU3E11MnyJSRfnMWloM6Y8WCZDpjf5huEU5pbeZmJNE=
=X1gK
-----END PGP SIGNATURE-----

--ZVSjJ1Yx/uU5dfZN--
