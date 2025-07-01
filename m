Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2A278E7C;
	Tue,  1 Jul 2025 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384059; cv=none; b=cN0sz8FByAeYXy02//XzjJ3/jRNI0fIlvVutPinFvYyN33JblfRaTqg1TX68DeNqXMkixSxDFoJrSdzZ9peX/CL19AeN3b2JC74B98mpBnVcArY9sXpSwhuPuhdH+mQr2HB920Mj21xC9sQBpM9UEM5oZCS44cd0kwkjMDNxmFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384059; c=relaxed/simple;
	bh=AH9Z6C7wirZHRgTf7xtKygEtYqmcXb+8joqPI90O+Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUnnr1TpxrBnChgcCRx3lHYXU60tA/QpoSKPf8kW/0CQFlywrrkBHUSCCPi/HdCEWekDqJ2bCi6Qu5O970vCU9CsCPtq/phIuyuhLq7kWWo3GPfzALODfQqgjEM9Mc5YjRVXPyl2LmGGXMN3lq41ZTjLcxe6mUC1lFkVGrrokPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc2GDzlZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc2GDzlZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308EAC4CEEB;
	Tue,  1 Jul 2025 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751384057;
	bh=AH9Z6C7wirZHRgTf7xtKygEtYqmcXb+8joqPI90O+Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zc2GDzlZtyxVJTRblAr5DbO/RV0UeFRC3yuCFXosRS9dc6fl1H0qyOZYGuqWi+44f
	 TaSuL6WYmkSayQky9iEhTiCQOvZaFhoCEObTgtXoZ4A47G0mCFHObOzeZGuOVKe+gM
	 x0VM7ULs9UzQGYzKfB3CODrWwVI5yWvm4tXqN+PABBv5Qkpr6M12FMD2uOAdK6RES3
	 JRabFd7LyUmNPCXg6nFOimbtCPZ7+HjY99Q7Z6lldLQDJVCRYWFMegRSwASqO+U0I/
	 htKEEZjKVGeAGqIhbPzrltvpgMb6pURyEqGQIub73pNxt8Y9NjErouezc8ER0dPO5Z
	 PBv5tXqznRpHg==
Date: Tue, 1 Jul 2025 16:34:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Add a bare-minimum Regulator abstraction
Message-ID: <25e9a9b6-4d81-4731-98fa-add40ccd4aab@sirena.org.uk>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <CC8F34AD-811F-4504-B625-AFD845198549@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2FiScofoYLxfGN1"
Content-Disposition: inline
In-Reply-To: <CC8F34AD-811F-4504-B625-AFD845198549@collabora.com>
X-Cookie: No shirt, no shoes, no service.


--z2FiScofoYLxfGN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 01, 2025 at 12:28:37PM -0300, Daniel Almeida wrote:

> Is it ok for the abstraction to only be built when CONFIG_REGULATOR=y? This
> means that any Rust drivers using it have to depend on CONFIG_REGULATOR too.

> I thought this was acceptable, but apparently that is not the case? See this
> comment from Rob Herring [0].

The regulator API stubs itself out when disabled, but given that this is
just wrappers it's not clear what the tasteful thing would be here - it
should do the right thing because it will itself be built in terms of
the C stubs.  I don't know if Rust can sensibly stub things, or if
there's much percentage in that for a thin wrapper which does basically
nothing itself.

--z2FiScofoYLxfGN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhj//IACgkQJNaLcl1U
h9BJmQf+PQNmJVDyd1ku6OwqE/Iaa8pmaqpZRGQ/npwdLNaXRHPzw/ToJt/602db
8HTsyrFqcu+MvpcJo9XDIdVgQ7JItxJW+C9ZcoRGZtF3IfEg6TiHnHvxvDl0i8+E
f/ep3dYObBpR7rSyKfAqY4Op+KdSLTPmitMrkIzVQ42apkz3HGi4Z6Wt97ovfCon
eiqB8BOu7Th6i86HsEmXrBwTyEFzYFE3BGoUvWxD5gp5g3hi+vsJoDx4pWBnrzMB
4TQ0DZMbSuV1DEijI1vfu1BjT0so94iIBQoWXXRAAJyKl4T+xg9xYvw+pGGAHZZn
raWvq/IWAv8UaOTp7Rx5B9WpqUQIqA==
=fp0k
-----END PGP SIGNATURE-----

--z2FiScofoYLxfGN1--
