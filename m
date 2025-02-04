Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670CD2F46;
	Tue,  4 Feb 2025 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672543; cv=none; b=JAsOrbSkydchE8slI9Atr6yFKahpRqdfb+xjG3G4SZEkjuZaeIObCVR3BZsRmCdPwumpHR9lzvIQbutWQh6v1+39xI2VFB8/b0z6SRrv0lhCVWJcpa0FV7U+lnts8F41BheDydh1/5Zgymn9K6cdrNE+K/123UHOQr6oKK0Qohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672543; c=relaxed/simple;
	bh=sDo4ylyREyY0IsEh81UfzsOSyB2hR5vSX7/3Qn4NJwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atGmB5jdcpt177HMBNTEgYNIt9FVr+xxiNaqEAwiMSV3bPhbDympcsw+H5kUhoFKKxxUVxqVDpQOZlMHZYA0Ct7+mXQlOC3oEI94O8LD/VmwrZlAQUQchr2xqLQUrNmvq7olGR2pmt+duBA1ZHM5PDuTa1fUqnkpkadbMU2HJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt3wswhT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rt3wswhT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3370C4CEDF;
	Tue,  4 Feb 2025 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738672542;
	bh=sDo4ylyREyY0IsEh81UfzsOSyB2hR5vSX7/3Qn4NJwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rt3wswhT1QwLgRPokVl+zLmiYEUC3ucnYgpBTy/E7DEexXLIE4VvWzHZSfELVyQft
	 sOEnteU15hoPwuqHhroEFPK5xMnOZsFCxxo+iTLIqn/TovF+k9h5HRl+bowE3CKQP9
	 oOx9ItDOC4SIa2Ns3NY2p8A6pfH/qGp61XOUOj1oTl3mFnhU7j/Z+PeSIafSDuBuXD
	 gbBwsQa6J9Aua/DoxlNJ45wKBg3X+rl+ukp7dzWymexOafqS52Z4hLnnFbC1wYBIOv
	 XmiKPVma8eFxFtlWTrtd2UgCaWVws/s8+eLhYjduL6o81WLW0Tp+WivVw3A4WDqKgx
	 00YeTnoMb1iKQ==
Date: Tue, 4 Feb 2025 12:35:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/5] regulator: dummy: convert to use the faux bus
Message-ID: <6ada102f-6398-45da-a2b5-ecb5beafc8bf@sirena.org.uk>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-shuffle-facedown-973f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H5wfRr13WUrFqxB1"
Content-Disposition: inline
In-Reply-To: <2025020424-shuffle-facedown-973f@gregkh>
X-Cookie: Spelling is a lossed art.


--H5wfRr13WUrFqxB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 12:09:14PM +0100, Greg Kroah-Hartman wrote:
> The dummy regulator driver does not need to create a platform device, it
> only did so because it was simple to do.  Change it over to use the
> faux bus instead as this is NOT a real platform device, and it makes
> the code even smaller than before.

Reviewed-by: Mark Brown <broonie@kernel.org>

--H5wfRr13WUrFqxB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeiCZgACgkQJNaLcl1U
h9BW7gf8DtamOUPXC8HwfqntlhbX1mMHH1kTDiF7CkOOuVVmmRQ6/RjWQ7IOrLzd
mqam12fQHxTy0SmA8dwLM5pE1M+Zn3TcuSEK+aM5QX9jjiloE3Gg6h3gRNHQVBMa
j+rKV/P7bkD5ng0SGdghxcJ/9ZK9+QTlNu9OBhjys2sGIVMtNhicEqdrw2OBtars
gbU+ipXI0XxyCTDfa7tIOqE/nGYuaLxF4e0NKv65t57ZutWaqbgb5sSVl8gMZTVd
KYsVBIKOifT4y8xdMZR3KVihZBcg0VPtqjBewY+bwyxdxBE7+VptBAImbNDzQyU5
tcOGgXyyUAmyz0bNPOAKF0D/TKwfrQ==
=KN7Y
-----END PGP SIGNATURE-----

--H5wfRr13WUrFqxB1--
