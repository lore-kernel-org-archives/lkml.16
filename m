Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8DE2820D5;
	Thu, 24 Apr 2025 17:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517120; cv=none; b=CrqnRVlSl6FZsIgdchUnvHectAbjgFINHzceDl//SGD7Awc1x9xCc439pzX45qACcAc1mqUAbJ5r18ehVQ2DXWvt5V6wSUbbLGaHqF7P7MyuncmA0hSJ8fDw/f8Pu3V32Ijtr8aQkSA9hCJ/qwfOwMKnUjLmvXbSJv+tgNQ8JX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517120; c=relaxed/simple;
	bh=WLZVxO/n4jiBa7vp1gw95JRiuvUbJlbF0H7e58V8w28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLEDz5/0UCu6nlNq1kDSwOt/SLZBkd33tah68flLojm6TJefdkVJj/heEWp9guH8jdrRZpC5N/qG1n2G/vjNbtmI8+GQr1NWi5K/LYcoVYlAIel3yrB5xBsgez3zdkkz/ZgpFtxiLlAK8raXDwJBEiOcS2SXG+/DFrHr2xz5RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6adSVRZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6adSVRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0248C4CEE3;
	Thu, 24 Apr 2025 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745517119;
	bh=WLZVxO/n4jiBa7vp1gw95JRiuvUbJlbF0H7e58V8w28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6adSVRZrQ8nvw3NpL0SgRG7NT5apxX9SIvPsUt29V39lD1QhLBa8Sa+GHKOycqKf
	 Sk9GaJnOSgOD+6F9tpoX/V7groycxVj51kb7sehimQicxMvu/3hhK3zbKHSAxrKmA/
	 LbDnyP1qXhC5y0+/+2umSZjTZYjb/R9hUByWFd0W6VVVaVKc2I7oVpCfv6IimVFDs9
	 LjfiCf0sRHIY28xieafNZeS296sCsbFIzop7SiaV/kTWChMWp1YARTnooVQ/2Hoxtl
	 cziSHaE0GfmTTjRcsyyYsHsJtU2t+N0p40iwlHpCNPzkcTrGbsT6rQqtulq7G05Wia
	 TETOOe0RSuGjQ==
Date: Thu, 24 Apr 2025 18:51:55 +0100
From: Mark Brown <broonie@kernel.org>
To: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
	Jacek Luczak <difrost.kernel@gmail.com>,
	"Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
Message-ID: <70293c18-f17d-48e4-94b9-4e7f62cfa45e@sirena.org.uk>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
 <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
 <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9qc0K4gUM1jblXPU"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
X-Cookie: Star Trek Lives!


--9qc0K4gUM1jblXPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 04:53:45PM +0000, Prasad, Prasad wrote:
> On 4/24/2025 12:57 AM, Mario Limonciello wrote:

> > Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the=20
> > issue on S16 here.

> > Jacek - can you reproduce with that reverted?

> We will send a fix patch to resolve this issue.

Excellent, thanks for jumping on this.  There was an AMD CC on the
original report so I'd thought it'd have been seen.

--9qc0K4gUM1jblXPU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgKejoACgkQJNaLcl1U
h9CM+gf/X8VDQYvr7ew4jmCoux8dVWY7FTdG83h6xMoZsbupPP8BKez0NRWRIvlJ
ymcTby5vZPUOciocQwkP2LRdn5jgicKS9igAPidOIILWxJmSLTEuqLvXR4Tf7Pq8
R03DLEKQZyaNEBoh9wRFrcZtpfg06U1rqf8pQPFBy71HRrGvriqq2TFgUfg2pFit
qI/qXgor9Okf/kMwUDQwRkI0aT1c/yXA+ZSFgacxnzgh+GR42rYFp8KxknslNe6B
N6MqWiDMsqbxvVhmwnLn2KRo6adFn19C+v0xIgejt68NpTfYIaRZtcUTuCtPwyab
8GhOq7kZgcDWYAe0TMqxKK89wXRjgg==
=0WiB
-----END PGP SIGNATURE-----

--9qc0K4gUM1jblXPU--
