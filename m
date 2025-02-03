Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA60914F12D;
	Mon,  3 Feb 2025 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599113; cv=none; b=o3pAnOusCUEo2KVXtPkyjQ+yxvJ8gDIHCKKge40LZgnC7ZaZ56OeRw/FHdIcbO+dncFN0VKr48Vtfzmtw/0mr5FjjKSFXjJNfigx4eOkWS9Q5MZD3fh3sBTe75NgNlVn2Ha71ewAsFrfi5h/oEcwrc/bnrshyh5EEa84J9HYFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599113; c=relaxed/simple;
	bh=lwngBm8tdOuzuNzAps5yz/e1oQBllorqc8kbxFsmD9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kdo6nYm2Ys9HSQioFHSTXPK3zB8xi2UQeovMSNjPMfQHxEN2wGWc2kC/fy+NHFw0WzNYAaPSWGOFHyyQk3hDMR4PSEGGy6oRQz46wpXubkloDuziYrAAwy329ziG0o/26hWSgtBMoNCM17FfiXQHNtCXK3y2/xtgSmrDsd1TiHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpLQkied; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpLQkied"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1187FC4CED2;
	Mon,  3 Feb 2025 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738599113;
	bh=lwngBm8tdOuzuNzAps5yz/e1oQBllorqc8kbxFsmD9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpLQkiedDUijIu8NatV8KrWUlI3lorTIcRqDhbVQbyA02ruNQUKlrAlxjgTV1rUzC
	 HYADSHQBm0vcnTPxmxiZZmJDxzpis0p+t0pJK/TagkQWmJzQSLqo2FOdR735lEBllk
	 Jdsj9h2wZNrkauW4Af8q0oe7mGuoGldsuCJddO5iBxqEhjN4k78aMR2CgvX1Zm7D/R
	 Lq6h3ON77+b5sJN13BFwiT20I8HqBM9V2OTldUudJ2nPraUAZu58z2iZPN3PO1zuNU
	 WpeerMIZI+vpMH1uwuFin5WW9MMEnif7utrfEFKsitiE0cazQLkJnNpoyQWiaDDksc
	 65l9wFL2qvgtA==
Date: Mon, 3 Feb 2025 16:11:47 +0000
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
Message-ID: <6272997d-1216-47ba-a26a-4741162b1002@sirena.org.uk>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020326-applicant-unwomanly-13df@gregkh>
 <3238a3af-3296-435a-a326-859d0188d51c@sirena.org.uk>
 <2025020313-constant-ravishing-1506@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3kO593+neO6gBpX2"
Content-Disposition: inline
In-Reply-To: <2025020313-constant-ravishing-1506@gregkh>
X-Cookie: May your camel be as swift as the wind.


--3kO593+neO6gBpX2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 04:46:02PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 03:39:06PM +0000, Mark Brown wrote:
> > On Mon, Feb 03, 2025 at 03:25:18PM +0100, Greg Kroah-Hartman wrote:

> > > The dummy regulator driver does not need to create a platform device, it
> > > only did so because it was simple to do.  Change it over to use the
> > > faux bus instead as this is NOT a real platform device, and it makes
> > > the code even smaller than before.

> > No, they did this because you explicitly asked that this be done....

> I did?  What was it attempting to be before this?  I don't remember that
> at all, sorry.

Yeah, there were some things where people were creating custom buses for
internal uses like this which you pushed back on due to code duplication
- you said to just use platform bus since the bus code looked identical.

--3kO593+neO6gBpX2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg6sIACgkQJNaLcl1U
h9CZfgf9H9Z96UBpYIek36CNU0EdLbkC9jmziDzhHIasCp7YgpAMxsYPrz1Obvpc
E/X8cH7+puKuXyc8RZ8sULMUfG5lG6rJJMf1wEHyrEt+15c6aws2LOvnUub8aYP6
vpidSvYafG1ul4rMDfdK2mcypVtWcu/23xaMYlK72lop/iZk9M76rNH763gCVzDD
bTpyp7PCf2f+wAildhQijxT5dT/nBTyMUWrGC/eImqNLHhvDpWy30Ta0f/H5V9MV
gMokiyS9Kmrzdb3eY9gXb1klnamEZlWHVpfqnHCMgPS0w4Vtt+ecTm9V3IO/ArDY
YgS9Stg4vUNMp806OO8qfmiThCRhWw==
=uDKS
-----END PGP SIGNATURE-----

--3kO593+neO6gBpX2--
