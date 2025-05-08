Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E49279796;
	Thu,  8 May 2025 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719611; cv=none; b=sTRJcCve2BWBza8e13+MquWtzifftNOnu3LpEx/L2e4kn+BWcf/MKAkk+HO0CguVswErEUg5CWUvltx6YBMyKNmAmeI5ngt6cIiNEvALpH+A+mH9g4XS2uxdf2meW3gF8Mi6pVRVDMvY+DfoboPkayL9NJTAu0eV7PFjAJjgzns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719611; c=relaxed/simple;
	bh=uwhqKjkcwV2E6qMeIjFO64sl9COXAw54Al0pysmokWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IE+tswnA6lIke6NTdSFKvrPolnRSSFwh7CPHTV+BLNBhOU/1Uvvrc/ZERl/vHv2krsWUonBXAlBvPIbGqsCknrlDYQx70AjU7RLfRm8e0MG3RxGcOVHVjKqdGVOGLRnEYnqM8rDDLrxqj8v2waZWLVoyrTZAqYlA1SvpcphnT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH78ndHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH78ndHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C2AC4CEE7;
	Thu,  8 May 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746719611;
	bh=uwhqKjkcwV2E6qMeIjFO64sl9COXAw54Al0pysmokWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iH78ndHx9WEmDXkEhpFsHYsTLypYaJj268GkQQKNaLKMDcNX+VHzcM7ZYVuhr9y56
	 IihET9LZs2cHwGcJQkXiQ4LDvadYkjut78JFvzJX+f0mUQBk9CCrp7RXSktMUGJMvT
	 Ie0Xkac1mViFiGbLsmVdWWz8JctpPNN6KFazgNRTymsH7hogqYmvPxfiD0ToRZbiCE
	 rq7m4xwo1hsRhePo2oZdQCarK0i3LoEatihjHn1mAzknElRnz/21YiIT1Adokqs2sM
	 55d6fibGglcKXoqMDkzMb+zFabOCqzHcDlak/t4vQUtTN1+uJHGxx7pxXINglThYmc
	 JMQxpp51TW/hg==
Date: Thu, 8 May 2025 16:53:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-usb@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI
 USB8044 hub controller
Message-ID: <20250508-waving-sustainer-28fe228e01f8@spud>
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
 <20250507131143.2243079-2-mike.looijmans@topic.nl>
 <20250508-prewashed-jawline-37f53c0f9429@spud>
 <583dc73e-23d3-4c8a-a457-f2bf71190e6a@topic.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CzRFXEYtV/KODyA2"
Content-Disposition: inline
In-Reply-To: <583dc73e-23d3-4c8a-a457-f2bf71190e6a@topic.nl>


--CzRFXEYtV/KODyA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:19:03PM +0200, Mike Looijmans wrote:
> On 08-05-2025 16:58, Conor Dooley wrote:
> > On Wed, May 07, 2025 at 03:11:43PM +0200, Mike Looijmans wrote:
> > > The TI USB8044 is similar to the USB8041.
> > Similar how? Why's a fallback not suitable?
>=20
> I don't quite understand what is meant by "fallback" here?

A fallback compatible, since you;re using the same match data as the
8041.

> It's similar in that the USB8044 provides the same functionality and can =
use
> the same driver as the USB8041, all that is needed is to add the PID/VID
> values.

Is this onboard_dev_id_table table with the vid/pid used in combination
with dt, or in-place of dt when device detection is dynamic? If the
latter, why can't dt use a fallback compatible since the handling is
identical to the 8041?


--CzRFXEYtV/KODyA2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzTdwAKCRB4tDGHoIJi
0husAQDKJqY0447aERdg222zT8s/YoH4aP4Fr0oCykX3UpOeigD+PG/530cegue/
c/rAjQgKDz02F8mUNaWT2IxzwE2doAc=
=bHDE
-----END PGP SIGNATURE-----

--CzRFXEYtV/KODyA2--
