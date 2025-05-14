Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C4421B9E4;
	Wed, 14 May 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211398; cv=none; b=eIKEkJ18VfR4LZeN/4ccUS4h/GDMI8NqBB4MLgGWgMmrO9aVw9iVg4k2ebSg4ZdpS538/537/iatlt3Q46JzwMxKDjauAkMFKOXioQUuy81Ep/z7YiS7a17MN+LKXfa7HDStSFSuRJZqhJ/2rTeIIE6yvVPtd+ND5dgxzBHiRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211398; c=relaxed/simple;
	bh=UDo0iqhDIRPoWj9+ujO/asZadhdSeDpkcJfUIyMlvW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc1yZIPscA3xFDg3yhd/Z0iL0+3kAxtwI5XAZVlMVUCshCROFz+yYBf4CCSxFJE/rW2zEPT03M3MNThAb5nTAE1QQJFgs/mxKE1OlREvHCgRVqdKlm6c3DBdBOBZX00SKgtLCXvvb8TRwienDBNCoF6H/WFgGdnjRun79oeBPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rReAGh3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rReAGh3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E751EC4CEE9;
	Wed, 14 May 2025 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211397;
	bh=UDo0iqhDIRPoWj9+ujO/asZadhdSeDpkcJfUIyMlvW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rReAGh3rraICJW7PHr5bGqurPZIijRdHUf6O2t4PQ2GFGukHHvGbUxPpZGIx30gwN
	 6pozWu4Gtm0aP/jOBlKnHsiGtBEZQj34p594VAW2gwjt9L9ReN1BJ3BWWDhVbghr4/
	 qxKhUbFoT2lpjcyqeHrdlZrIMmI2BgLQ9co3ttv/5lZIdKfBzZwrOUZmqzS5asYPUr
	 nCmZocE98PxncZGWposgmZXJdQRfbMFv+hqa4x7lRLYiTfGDHsZo52vhy61t6l3fyC
	 ydpxbdBF7RDcIf9UdjXg84cg+r/wPnnpLpelKdjq2+4qrZdyTKvAVPcKQ8XCL7UVeL
	 pj5ytNgOalXrA==
Date: Wed, 14 May 2025 10:29:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, tiwai@suse.de
Subject: Re: [PATCH 2/2] ALSA: hda: cs35l56: Log tuning unique identifiers
 during firmware load
Message-ID: <aCRUgeFcG4iubmSV@finisterre.sirena.org.uk>
References: <cover.1747142267.git.simont@opensource.cirrus.com>
 <2fcc0e6fc5b8669acb026bebe44a4995ac83b967.1747142267.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e+812Av5nI8WoFLT"
Content-Disposition: inline
In-Reply-To: <2fcc0e6fc5b8669acb026bebe44a4995ac83b967.1747142267.git.simont@opensource.cirrus.com>
X-Cookie: Well begun is half done.


--e+812Av5nI8WoFLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 01:39:24PM +0000, Simon Trimmer wrote:
> The cs35l56 smart amplifier has some informational firmware controls
> that are populated by a tuning bin file to unique values - logging these
> during firmware load identifies the specific configuration being used on
> that device instance.

Adding Takashi since this is an ALSA patch (and not deleting context for
him), Takashi is this OK to go via ASoC?

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

>=20
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---
>  sound/pci/hda/cs35l56_hda.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index b6fecf119261..aed7d7284231 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -676,6 +676,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *c=
s35l56)
>  	if (ret)
>  		cs_dsp_stop(&cs35l56->cs_dsp);
> =20
> +	cs35l56_log_tuning(&cs35l56->base, &cs35l56->cs_dsp);
> +
>  err_powered_up:
>  	if (!cs35l56->base.fw_patched)
>  		cs_dsp_power_down(&cs35l56->cs_dsp);
> --=20
> 2.43.0
>=20

--e+812Av5nI8WoFLT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkVIAACgkQJNaLcl1U
h9DLsQf8CwmbSDW21fooswjD03I5LXbtmieVj4i5y7p9tN20imlRpOx1+CQfMNNY
FjNLdVgmWzT97Hb4FLN3KKZheWy9x1Ozy3S6/BgSaLMuz+xQsDgA1Z2Ei6M2fHP6
qNhogLtISqVXpsV0gGL4pzbc+M89OexChf0ek4Ivv/Bahe1ZEZZA9UlPZv4USRbZ
aEBpiu/dWVpMDhfSxmr2tgByPBvmmCD85h2rg6RtwtZjK3BIc6hZhfUXatCl/c/e
Rg0zp19PVZ/btrVPZvXpG9Hb5V2fCZcc9HO5KoBd65YDSKEc4WevO/56WTjhxbyF
h7vDbqEvkse+FPuP3Din9HRo1e1fgQ==
=gUuS
-----END PGP SIGNATURE-----

--e+812Av5nI8WoFLT--
