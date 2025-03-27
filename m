Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D9C20F08F;
	Thu, 27 Mar 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743075739; cv=none; b=ov5GFs2HIECDnlyaablL/jvfCtkG2F23oM3t5mzNbF8DO0u0YUzizfa1tTXzTXZ7QVt+arNBCsRQ1tnjz4+5a2ankMdWGKnKn5Pw8M8iVplICKJCIiiGhztYc/ViRvG5tJJllC8/BeoekdcVlIlDzm9nWCdaeu5sBiuryd4z7FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743075739; c=relaxed/simple;
	bh=Pglc2XYPxGtlcT+pJGdGG59wtrPATxrsu95GS/aPjSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnjbMK8NBVkXFUqcX/lBk/FkYxBQS8Bd5tyh/VNZQV8DzBzxnQx4kLua3CWH6p5jSObtydIdAMvwb67B3f24zAW+HEfpAt8KtHHmWBH/j5lLs1cgQLx5TWoNc4Vr3tkFZKADAPPH7eObiD4MSAyWiKRiQixzu6wuGbaa3LmI9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=calZW4y2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="calZW4y2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93FCC4CEDD;
	Thu, 27 Mar 2025 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743075738;
	bh=Pglc2XYPxGtlcT+pJGdGG59wtrPATxrsu95GS/aPjSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=calZW4y2o5Z9zT6S/GJ0TJZ2tBx+84RsV+GaeagTGFAa0uDZItSk/DdmQNcJJydJS
	 C+POGa/hU3sxWpR73Jz5tPLI7kKL/V+dUeeB0qaLLcYQVEwDmBVBubf6bbTPfqnxyJ
	 PdDjiHWsg0ONcsyEzzuIxI8FGTJEt+VCapGTsUUmVLaH/vFq8+U9ani6S18BNdsiD/
	 4vvqTzOTmpDbcpZbWmqde8txgRsIk4G5VeZuBsAceRslSSDTjw7/2n+ZRPVmkCOOcN
	 bo1rik73jdXQqQAwLs8b1fdhUTcJFJ61MKpTmqQuADEdvzN1wTBhLih9SWku5JrKRz
	 nnNaB1tiFPGIg==
Date: Thu, 27 Mar 2025 11:42:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
Message-ID: <197b2670-f628-4a1b-8034-89fb94ce38a6@sirena.org.uk>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
 <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
 <AM7P189MB1009748DBA1F99F2BBEC2292E3A12@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cc8Rh8ict0uNPh7O"
Content-Disposition: inline
In-Reply-To: <AM7P189MB1009748DBA1F99F2BBEC2292E3A12@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
X-Cookie: Multics is security spelled sideways.


--Cc8Rh8ict0uNPh7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 27, 2025 at 12:36:23PM +0100, Maud Spierings wrote:
> On 3/27/25 12:32, Mark Brown wrote:

> > My understanding was that the enable was done by transforming a
> > Regulator into an EnabledRegulator but if you can explicitly call
> > disable() on an EnabledRegulator without destroying it then you've got
> > an EnabledRegulator which isn't actually enabled.  Perhaps it's not
> > clear to me how the API should work?

> From my understanding, disable() takes ownership of self, it does not take a
> reference, so the EnabledRegulator is consumed and the Regulator is returned
> through the result. So EnabledRegulator will get dropped in this function
> which owns it.

Ah, OK - if the disable() takes ownership of the passed object that's
fine.

--Cc8Rh8ict0uNPh7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflOZIACgkQJNaLcl1U
h9AhXQf/dNicQf9OMfu+K1+9BvgEoG+M7+CE1/yNPe0gt2K+GSsz/txmddjjEFm/
GXxkbVFaS+KDY9Jcy9pHMc86ALUyEWMDf/TbpyE0/k0O7XG1hzd5BST9k51x0qbI
VkI6rhZTHuHZdBtdLkTh/BQC1DN0CVflxaM3IYgQBkjOGKiNnaDGomInLu7fSBH3
Lm5o2wgsEMt4SiMSd4QGuc08qh8RD6wXOK4AoJwodZXjQoYs3iB4/+hmOeXoqr4Z
49CjLXjt7aZO/PxSkXibG/v2jMBy7Y1oVZ+w1QYtTj+bkYbwGexIsHqLQcTW2JcL
HDZGytfBxCZZs2yt3YYAjkXe2fD/Qg==
=zgaO
-----END PGP SIGNATURE-----

--Cc8Rh8ict0uNPh7O--
