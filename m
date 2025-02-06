Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A01624C3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850623; cv=none; b=LOC6gKzAwJfX1Fpt33DzBP2dtEe9pEIDk1LaMxPcYx9EzJ/jpbOYBzP9rPctIeRVSWO1cvH2rLmT2KZUA42b6jsiTwWCHdE8NqYKBpjKlgL9zZk2+kaShI1XBk2QRzoYMB0RdZV5k2qsg3eHlHcWAOvObgkz5Ku4i94FjDVtQrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850623; c=relaxed/simple;
	bh=zP1g1SOPuwD6rfrBCH+KpqRIfxgUOgDdUeTG33sbxIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8fHi0Icnt+OsxQllGKSEDJae04BfS2Ep6WfhTu5N7YQjKp11v054lvd/KLX2jxAWTijiZ/OtZFCTCARaXOn3SYbe4JNVidOLcBFR5aHx0SmZ1gfkzHnv4tfFcxJweradFl/E9LxmkQN+m57kFhneBDSLjwK30nx0Oo9Zrr2rcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkfyAmRW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkfyAmRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E310C4CEE6;
	Thu,  6 Feb 2025 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850622;
	bh=zP1g1SOPuwD6rfrBCH+KpqRIfxgUOgDdUeTG33sbxIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkfyAmRWlCkQ4Q1daEV9dcu2uoJG9q6ZJ9Y52AiF+LDZDY0gBO9qS7tqtyJkTWhC4
	 gsLey/qFBjp+Mf9nUA/9orzx0LMG4CHeLU7Zql/x7j4Y8bY0HCVaQ7f07+wt+JL1bA
	 wBVYvS2MDOUCXIhY89GKkHXaHOIf34FoYRqadHtBuXpLG1ulASEqa2uyyDN36mjl3/
	 ppg9kzuLOiZIFKXtXDSb/2oDH6aRro8IxLJ0oSimiyagxjfFxEu/a/xFEUEeD1xQDR
	 HoR5wymXPuHO03/Hlqg1qV4Q+CQf9QHJi7rV3vP02wk9KbrmrZut5i3uSE+nsfcVFQ
	 pLhH7BEA55Kow==
Date: Thu, 6 Feb 2025 14:03:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, dheeraj.linuxdev@gmail.com
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
Message-ID: <67355756-997a-47bc-b563-cb31cdbc37a3@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
 <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
 <f81d5101-1dd2-4ff4-9a23-403b6efbcdf3@sirena.org.uk>
 <1afa0cd19e48014f3a59bfeaae58f85c9db92c1d.camel@ideasonboard.com>
 <28767ef9-0909-4d74-99fa-514c9bc99afc@sirena.org.uk>
 <1da6b6e3f9cd1abd84cc5d3d73a2ad3d1340914d.camel@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fzZ/jJpPKojkRDb+"
Content-Disposition: inline
In-Reply-To: <1da6b6e3f9cd1abd84cc5d3d73a2ad3d1340914d.camel@ideasonboard.com>
X-Cookie: With your bare hands?!?


--fzZ/jJpPKojkRDb+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 01:57:14PM +0000, Isaac Scott wrote:
> On Thu, 2025-02-06 at 13:44 +0000, Mark Brown wrote:

> > Yes, like the message said please resend.=A0 Though isn't this the same
> > as
> > the fix that Dheeraj already sent:

> Yes, we have both fixed the same thing! Although I wasn't CC'd so I
> didn't know they fixed my patch.

Yeah, that wasn't ideal.  In any case it's fixed now which is the main
thing.

--fzZ/jJpPKojkRDb+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmekwTUACgkQJNaLcl1U
h9AGtQf/Y5YasXRvR05PNOo8TFrnksclPMvp1bfX8xJ+hWA2F/5XfWk5nQ/LORkJ
9m1EXGGbtXgaiFwLtmNN3cHcu+z7O7I6/HKfI6BNQV77T6dGsCErjmkdsONKGD+l
/46gx0iBREjNOTA5EvyVS4RP+7zKsParlHSLWJV1Rox2vh5KOsxrCSmQYPkk7xnh
mOzd0Vj1y1j2quAe8+OmtWWFUZHhzPVXp8gDx3ornMwCeDmcNdA4c5ywHh7nWiwY
tn8IFNC7EdJgqXz0PffG4hhva2bCrxYDC6rGdZWm7V+O55W47Y6qQLkJqwtAnTDY
6CeaBreu14ntEDjR7c1if3FLx4L+Dw==
=KAkl
-----END PGP SIGNATURE-----

--fzZ/jJpPKojkRDb+--
