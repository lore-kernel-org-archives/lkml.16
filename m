Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA422068B;
	Fri, 13 Jun 2025 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812637; cv=none; b=aHNL7xoz3SIDghD6CPH3ieJDY6DUStnjcQ4J2gtXG9VA5E/J1sJaJOKtpKe17lzCTkVpzDdKCZVJFIfhwKsbNVSN0lgcKYFrtSWxmd336D98T0pfk38u03joCOZBz3SJ9cF9dXZjVibc/iyfBNDVAWMYxW18B3ixvqFKrUaGtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812637; c=relaxed/simple;
	bh=ImOyARAzYzFA2uZnP4HrKkCzOzuHZTZu1WoIccEMb9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFy1kq8aA7+yUPcuJ+8Jb44XvtHHNcKa9CQfRHMcBdxsy7bZgF3UvWuMx2u9Kytv7tWUbtQtma5G+Hsd4Hge7RKHVzJMSPZtJ05TZGbF13lL/pH3Q2TTa6K6b9FDO3Awjb63ivUQGnzbdwzLVbJ+4Jv/jcsELvd9egoQsjMw8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZYVPSlg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZYVPSlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5567AC4CEE3;
	Fri, 13 Jun 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749812637;
	bh=ImOyARAzYzFA2uZnP4HrKkCzOzuHZTZu1WoIccEMb9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZYVPSlgnNrOjaleyFTtJmCmkH0pxkECwf1lK4LDu85aNK2JlHgCpWmjtrzBDPXFx
	 Op30Zqu+pGrSid+xkejjm8KFhajeuLUUdSqiKwubbIVj2v2onugE2DEBrIhLvrsfko
	 cFx2klkWMgWdP8WO6oPXqFVO2iwm9biOeasEwtkpiNeKUhwHBxhO6JKtDXRdbnpUNG
	 W6Ycg5KPDkqk27jZixFo8wHCDMHy2AZQ+UewFdPJ91TJ7JCN15V1L62OD/LwcDMPCC
	 HWHHR6FiSYtVhhwshEPISpN4x1dl3KhRzfgPz3LqKjU2SkXYz1kcKpEy0sHv/yvFlA
	 EeeRSVOcC7lFA==
Date: Fri, 13 Jun 2025 12:03:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Raven Black <ravenblack@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Talhah Peerbhai <talhah.peerbhai@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add HP Victus to yc_acp_quirk_table
Message-ID: <39aecfc7-7066-4f32-a3f2-9b9aa71aac04@sirena.org.uk>
References: <CAEUaNDfDmSDs19NU7+dW+-_zGgvUsaaK7ox2YhjQ-q3+xvFF1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpy3FwVTxf4W336P"
Content-Disposition: inline
In-Reply-To: <CAEUaNDfDmSDs19NU7+dW+-_zGgvUsaaK7ox2YhjQ-q3+xvFF1w@mail.gmail.com>
X-Cookie: Use extra care when cleaning on stairs.


--bpy3FwVTxf4W336P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 10:45:53PM -0400, Raven Black wrote:

>   DMI_MATCH(DMI_PRODUCT_NAME, "OMEN by HP Gaming Laptop 16z-n000"),
>   }
>   },
> + {
> + .driver_data = &acp6x_card,
> + .matches = {
> + DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> + DMI_MATCH(DMI_PRODUCT_NAME, "Victus by HP Gaming Laptop 15-fb2xxx"),
> + }
> + },
>   {

This is badly mangled and won't apply, it looks like tabs have just been
completely deleted.  You might want to look at b4 to send the patches,
especially it's web submission endpoint which avoids having to configure
mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--bpy3FwVTxf4W336P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMBZcACgkQJNaLcl1U
h9C63wf/VDscDIqAokUDo7qagKtMfgI1Xu+t2X8b2kmQLZyu6btC91x63hQ6uYsD
fq3tv1WzwloW2jYpz0ENKAm/NsksLicGzrCDvidhHZHhPDpwlwilvGd04OaHwXMz
DNWf7KzTIHeqyh8ZB31RmWEJBQgtp2T1YBs26+X2Nbhh0KjeRMXEo5WB5Nd4vRsk
4WrYvgbwC6FrwVjIK2oTRXr6OqyTN266rXXpBGmVeqw8lBxNKej5ptdYmWkceEq5
zRtBJl5vaMHpKazbeQ3uG72We3oW0l0W/tNwDkfPgFxvHgQ2MN89hjlhcw9I127a
oUhGuPNzsXhd6s+lpfZYVx+k07b1Sw==
=IHmk
-----END PGP SIGNATURE-----

--bpy3FwVTxf4W336P--
