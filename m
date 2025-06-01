Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5122DCC0E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 02:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748744596; cv=none; b=qPY2zm+XhczVzZgnynIhL3Gq7FBkgS2rZHDWTC3YkrFaUSYMxtIJ960lUwfwtUbc4AejtWNnDXi5SDmBKBPGowHKXZPemaBathgTrL7f6e/YMDQFrAAu7fP1WxVEpgxctQU1unBg81cIRmozvSuOs/EEzV6nfnDZubXlbPk+AOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748744596; c=relaxed/simple;
	bh=gCIBVdaxxWBKdKeXTSUvV/O9G5mUzsYp7oFZ6IW8sUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J49NnSo+Y+vUR6DBHyrL6m9OUqWwbNAZqHj4aFN2+wq6zkbrcqJ4aqm69O0PGURshlbixHENXehqW2HSnftmOXrYy5BPsXPJc1R7/V+HsXoomtCE0N4LN7UoQPaSQkDEGsoH+K7BdFoU3Y4kBh/el6pr7Adyjlc54iY1QCLGNQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XmxwouDC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XmxwouDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748744582;
	bh=aJcX5sIOIBuhWL2B08C8Bkg1TDfRPZFOUtHDpv/nitg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XmxwouDC49dv1m+vOGud6NpWIPFfE+UcdqfFgEdlMnJ9JcIvarDE+3FeUp34C8MnZ
	 AkKtqt6UUd/2tSUI39cJnQ8QZ5JMkNn77U7V4HJP5zcLN6xvxQ5vceBFljM5Glx67u
	 xczbEqY5aIV1y8G8j2XIdkj1tWtv17cJLlt/B2Dp4WtUlNam5jBipMW65eOnUnHvdG
	 ZahQL3sXJXr5gAalXHK+npyo5wv9/svWweXeWmH1dqOQ91EBheOMpdLkrD8lAs4pbj
	 YJvxVP2MAXGcYLBNLtzLkOPiOxxqG3k6RSlKNahCakkp2G3r3gaNwnXrpxyDizgMT2
	 H5Nv1qgB3j+CA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b913T6ZhGz4x5Z;
	Sun,  1 Jun 2025 12:23:01 +1000 (AEST)
Date: Sun, 1 Jun 2025 12:22:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, linux-kernel@vger.kernel.org, Eric
 Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, kernel
 test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, Nathan
 Chancellor <nathan@kernel.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <20250601122249.63a31d71@canb.auug.org.au>
In-Reply-To: <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
References: <202505310759.3A40AD051@keescook>
	<CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
	<156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/13yDyeoR+xu0pkoGH2hrCZ1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/13yDyeoR+xu0pkoGH2hrCZ1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Sat, 31 May 2025 18:06:00 -0700 Kees Cook <kees@kernel.org> wrote:
>
> I'll throw it all out and rebuild from patches.

If you want to start from what you had in linux-next on Friday, you could f=
etch commit

  eef1355c269b ("ubsan: integer-overflow: depend on BROKEN to keep this out=
 of CI")

(that was your for-next/kspp branch) from
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

--=20
Cheers,
Stephen Rothwell

--Sig_/13yDyeoR+xu0pkoGH2hrCZ1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg7uXkACgkQAVBC80lX
0GxdFggAgIWpWu0/xg9D0XNpuo9Kpaz30zY/mzlK7eyXfqZuafooTRUJvgJa5iV7
MQwZGdwKvVwrQYJRHyMfstA87HvL5Bo82ucM1IifLtOyZbsZMu/1GD0fwFG89+0t
JN9Rldz3tAds4RFDovLUrtSwpc6jwR5p2BuOIL8/29t3ZQHW9BDq6oKqpZINGePJ
O2qweGoPQZmp2B3JR9CHsNfd/PZQ9IiYR1fVehuT0lMDqubouNJUL15gY/+JmmSV
1GmZQ1zemmFEB9+FRiPEFQRWb5ezWRAoCGgApKLcddlG8iFdN7nxRHMArp1EATX4
B1qkXQ7bNF4omsaOqJSpv5/jWjqV0g==
=jwMQ
-----END PGP SIGNATURE-----

--Sig_/13yDyeoR+xu0pkoGH2hrCZ1--
