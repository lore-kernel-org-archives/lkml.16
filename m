Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B6209F5C;
	Mon,  3 Feb 2025 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597154; cv=none; b=lejavZX80ay4LPX6YsVN9mhT6kjXcZg3Ftjl66wk8MIItcooB9+kbW5El89O9xhCRm2ZVZV9rE09c4kEqOjynrGrWcUBX3VpewK42/ndsu6SQh+YCLuE3L6CHqh6nFt9de5DxndCMnbLPmx+425qrIIuYKtDazQHhC1DWpP3wzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597154; c=relaxed/simple;
	bh=pgQ/XI31xowbU+3+u9CKK81XMYjgEjIVkb7lnDyVBBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9fa9ZHb7tSwQi+WlE3ar0wvf0NwaQqQ7cuK8+un/lgFf381YCiY4Zz12ZOye0UEnDNbScmLHMAmAbHtqNVUFRD2Bmq3eE/q+Ej4K1XpNyz8VsDtrmuFA+LnjC0mfM0n0VaYw+WioE+ufwMkKCpnJSa1WjXIB3Ob9b6YxniMM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGcJB2lS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGcJB2lS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7D7C4CEE0;
	Mon,  3 Feb 2025 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738597153;
	bh=pgQ/XI31xowbU+3+u9CKK81XMYjgEjIVkb7lnDyVBBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KGcJB2lS4USat7u61MlEPuvkLeMiiKmgr5f/KHvd5qFV4o4HzGID9aW9SCKlt1aL0
	 XFK4FyBvBkSetnTlgX5e+DwjskyupsT9unPnixYrvfQ7cr0N0PC6mo0umvdPGXedYE
	 Pjh7Yz+QW2VpD97KJYE7JpHvjxf48eVA7qhljZLOVFDlFqyH9xCQn/7U/32lDjv2G9
	 soloPQSduGSZ4i5J0W7pIokBl16PnpMjQKzY4TrHu9sN3vCb5S37roswYy2qctEstd
	 cPUjExtYTPkrElMazA6NI7pGvbh5076Pb1QRlngwu8EIlS7a0X8al+ojFEJiYgQzx/
	 HXlPSSiR0NJNg==
Date: Mon, 3 Feb 2025 15:39:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/3] regulator: dummy: convert to use the faux bus
Message-ID: <3238a3af-3296-435a-a326-859d0188d51c@sirena.org.uk>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-applicant-unwomanly-13df@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T/ceAofdHzykrrf3"
Content-Disposition: inline
In-Reply-To: <2025020326-applicant-unwomanly-13df@gregkh>
X-Cookie: May your camel be as swift as the wind.


--T/ceAofdHzykrrf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 03:25:18PM +0100, Greg Kroah-Hartman wrote:
> The dummy regulator driver does not need to create a platform device, it
> only did so because it was simple to do.  Change it over to use the
> faux bus instead as this is NOT a real platform device, and it makes
> the code even smaller than before.

No, they did this because you explicitly asked that this be done....

> -static int dummy_regulator_probe(struct platform_device *pdev)
> +static int dummy_regulator_probe(struct faux_device *vdev)

Just dev or fdev - we could just pass a struct device in here, we don't
actually care that it's a platform device at this point.  Having the
abbreviation mismatch with the device type is odd.

--T/ceAofdHzykrrf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg4xkACgkQJNaLcl1U
h9Cwtwf/QHGnq/IfZF89VKM4thKP/if3Gv5NHvycpdSJDkPjyY22feQPTc3NN0Ev
qNnnbkJmDUf3yqg39t7ZJpd45uVfgzbXJKXpRVrpdUAYec4woH+lkHRPmTFL2anh
0tpbEV7QRAa2rNJrmdeuxoDIRCSW8yB632ud9saiQ66gLHfyiEyPVx4pdfQUqXBO
klQQeLoeTlwhPVKEq/APbwGeDSjEPXxkgda4G8sSwcqQU2OFTZXUh3/GPWFLmXPk
uIsP8S/X5wBjcm9xelyzj1iC4ya50Cq20MHAZ4bAwXAoT/fJhLgjYBT7YDNETP3a
s5UuEUUoIZoktxFUTs+lxEK5paQk9g==
=C9qo
-----END PGP SIGNATURE-----

--T/ceAofdHzykrrf3--
