Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF626C3BB;
	Tue,  6 May 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540052; cv=none; b=CHMXHdnENQEGTUlZ10L0YoH5A0lYj1NdCJlM10TR10jEIjgbC2DhvpvU7qhpvYGcrcfMMJbMKDecU7gOhePGq2SxACxN3ttGFjt90KxvlspoVZomWNfRYIhjRrAS9UFlnu7+nJQTuCqHyJX3tvVqyEsadSIONz8ddAqepkQgvng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540052; c=relaxed/simple;
	bh=RTunjjerQMOG6JqP5SEr/SXRszaOYJggarZQB11SUgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnehI0xL7YQ8b0k2/mTlVBzXvaJ+bmhHNR1xUoqWrdEBg54sUQUeb4N3ttaFK/wpgamnr5nOHAm0Pz1i4IRbncxaQLXmI/O331hDb5+e3qq9pxlNUDEaXleiwQO5VBjBDDyI8ZQcW7mO8FezjccaD59ifCM/Xh2kr+qpSmgHJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIP5//Xp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIP5//Xp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99C1C4CEEF;
	Tue,  6 May 2025 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746540052;
	bh=RTunjjerQMOG6JqP5SEr/SXRszaOYJggarZQB11SUgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIP5//Xp8s96nLwZsGUWhujXfso4VgeWPHLrMuam+m10u5R3X7/BPdewrUI4yctjL
	 LefotrHgUV66uofHxlkvmeAHQDmQ2EE9dLirwjspept1exkqb7NichTtJArtEMS96l
	 S0VV7aqvHeKuA5Hm58Y348UcKgp/Wrjne9zqYYovU/qLXy/RwqDwMy9WxTBbSR6kcf
	 3Z6vZhbMSRYcF8SDZvxKbe//mEo7uw+JM3s8TSn/TbNgrwi276hC4IZJkNc4yGXlzd
	 FQ88/e9DO3CvPkCns/ops5jM3X5saAAO+9elwncOQDjFaH19oFH7Cw7zuNlAUjYOVh
	 Uyp77H1osfvBg==
Date: Tue, 6 May 2025 23:00:46 +0900
From: Mark Brown <broonie@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 35/57] irqdomain: sound: Switch to
 irq_domain_create_linear()
Message-ID: <aBoWDhLDAMt1hBtO@finisterre.sirena.org.uk>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-36-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UVjalNMIA2B13dbK"
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-36-jirislaby@kernel.org>
X-Cookie: If in doubt, mumble.


--UVjalNMIA2B13dbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 10:29:28AM +0100, Jiri Slaby (SUSE) wrote:
> irq_domain_add_linear() is going away as being obsolete now. Switch to
> the preferred irq_domain_create_linear(). That differs in the first
> parameter: It takes more generic struct fwnode_handle instead of struct
> device_node. Therefore, of_fwnode_handle() is added around the
> parameter.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--UVjalNMIA2B13dbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaFgsACgkQJNaLcl1U
h9DoNQf/epAusRU/62pN3pjA7gGrjbGsWwyu1AvlI2WBWZaJqFVxWt+8kCj95Xrz
eUqErsroG3yUnCtkB0SyAxFZCEF6jufQy9KcAtFbHy0vDPqtmgTvczUyGQa3nKWD
Le56e0h2rYUbGIp+gxuY84uPePo4J1m52rtBwS79H5/cpMf0t2io8X/mFijKpuG8
zOz+9WWPcQDF2V6V8piBOrD3t0L7dqMdqk1B8rYcdH6KdezddGJLf7k/lIInLLxg
NX1cHmQGwhH6CIG/XjNxNXfoIlnHrFJI1aaej4LI1oKtPuQDI1MgCO9/n1Pr503b
+WWf/wVDjWZTojOeumr+UOIhwEVS+w==
=DiVB
-----END PGP SIGNATURE-----

--UVjalNMIA2B13dbK--
