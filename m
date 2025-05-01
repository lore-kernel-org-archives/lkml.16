Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E2422083;
	Thu,  1 May 2025 00:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746059461; cv=none; b=rOx++dlqhgWM3MpI3HzfiXDq+68a7aqsTybFAFi0sQ4jxAl+MNOMxCPTMi5UwBwpT5btA6spvKFnuq5QJLKz0/vlyLUZX0WskrFIxqy+qvnlCgRwu3GfJExibiLGPNpN733LFxF4jTV8bpS1PkWCJm8ZyTAFBKmvdoPhyQHHo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746059461; c=relaxed/simple;
	bh=WmWXQoaOvf8Ws0IsFcyWt/5E0xZpcoMExsvGw0lys/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iO2flb4KSkut8iGlymZGvy1po+13O+wh/8JwgNZ56JLq8lYNSMeIHlgX57ultkIfT0S9RDNWtVNo0ZFgtcmrl4eCH5XUcdHced2e8vB8lHI4aApFFa5s+3/t7mZaqD0Agw9pTCLVSgdkAG0WlJ4Bbq4oGKnml859tEd+8ulpIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMhzWRKY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMhzWRKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5F3C4CEE7;
	Thu,  1 May 2025 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746059461;
	bh=WmWXQoaOvf8Ws0IsFcyWt/5E0xZpcoMExsvGw0lys/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMhzWRKYKWGBUvzM/2SYo8OHPm+CVtpcDQJLS4429RDDzB3pqDwXbSbNpe++Gp7eu
	 27PT4SHwYIdBkl3SC7qXFiD7z974Q5gYoqtSfxgAfFh1JQ7AX7SrqgzO5Vqi2h50yH
	 UouL9zazmLpkezf744qurt6k+X20sY13qVpAQcA2g/C/RuCv5mSuc4VjriZ2KwKne9
	 BY6rPY9fjCR0+p15v+/+iXuC9aTG4n6KkB61h8WdCIR65WK2/j+6upDZdLT25zWK8+
	 Nx4Smtaai1P1CeXyrJIfZ5qhyiS/nKOt++M7JjvuruFH1KYr9UUKYbOtDl6PfrQ59a
	 /wwkALPj5N9NQ==
Date: Thu, 1 May 2025 09:30:58 +0900
From: Mark Brown <broonie@kernel.org>
To: Jason Mo <NukaColaM@outlook.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: sound: soc: amd: rpl: No ALSA DMIC capture interface for ACP6x
 (PCIe rev 62)
Message-ID: <aBLAwjELCoWNWDyH@finisterre.sirena.org.uk>
References: <BY5PR07MB66126978095912E5D4A26E50A1802@BY5PR07MB6612.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19cqhS9he+iGqxg+"
Content-Disposition: inline
In-Reply-To: <BY5PR07MB66126978095912E5D4A26E50A1802@BY5PR07MB6612.namprd07.prod.outlook.com>
X-Cookie: Well begun is half done.


--19cqhS9he+iGqxg+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 01:14:07AM +0000, Jason Mo wrote:
> Hi Liam, Mark,
>=20
> The `sound/soc/amd/rpl/rpl-pci-acp6x.c` driver for AMD ACP6x (PCIe rev 62=
) appears to lack ALSA DMIC capture support, making the digital microphone =
unusable on affected hardware.

Adding Mario.

>=20
> Hardware Details:
> 05:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] ACP/ACP=
3X/ACP6x Audio Coprocessor (rev 62)
>  =A0 =A0 =A0 =A0Subsystem: AIstone Global Limited Device 1301
>  =A0 =A0 =A0 =A0Kernel driver in use: snd_rpl_pci_acp6x
>  =A0 =A0 =A0 =A0Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_=
acp5x, snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, ...
>=20
> System Information:
> Linux version 6.14.4-arch1-1 (linux@archlinux) (gcc (GCC) 14.2.1 20250207=
, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Sat, 26 Apr 2025 00:06=
:37 +0000
>=20
> Symptoms:
> * =A0 No corresponding sound card entry in `/proc/asound/cards`.
> * =A0 `arecord -l` shows no relevant capture device.
> * =A0 No related ALSA mixer controls are exposed.
>=20
> Code Analysis:
> The `rpl-pci-acp6x.c` driver handles basic PCIe initialization but seems =
to be missing the necessary ALSA/ASoC integration for capture. This contras=
ts with `sound/soc/amd/yc/pci-acp6x.c` (for rev 60/6f), which includes full=
 ALSA DMIC support.
>=20
> Attached Logs:
> * =A0 dmesg (full & filtered for audio)
> * =A0 lspci -vvnn (for audio device)
> * =A0 aplay -l / arecord -l
> * =A0 /proc/asound/cards
> * =A0 lsmod | grep snd
>=20
> Question:
> Is the missing DMIC support in the `rpl` driver for rev 62 intentional, o=
r is this a bug/missing feature?
>=20
> Happy to test patches or provide more info if DMIC support is planned or =
contributions are welcome.
>=20
> Thanks,
> Jason Mo



--19cqhS9he+iGqxg+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgSwMEACgkQJNaLcl1U
h9DMnQf/eIuE3EV5Ctm6pCDEf15KslG3utGUDMswR749ORTxM9xF+sCqhddB5tC4
KN6DKk4Q4FtGEs0zPwtb9Zrmx4IclwniNcGSlrPehrbq+iTabyOWnzDagrD2MOs8
WQjGVbKwplN4uT1jWUKoHp9CVKi15o+G0I4CjW2fYfhfkcxyonVsCiXfx6kfzuoV
0peppBAoLTsRlijjjRtlnMpdP3fqDJQlRuBhzTP4/r/3I04B3A5DJT3r/inJLPfV
kEmLVUc1Je4X3YSQmJV0eKc9wq48rgVqXiorjoyuyC7elBaNCllNa8iCAYoXHjJh
oItuG24gBWANmVdTUVVGPGPzQiYMqQ==
=3+cv
-----END PGP SIGNATURE-----

--19cqhS9he+iGqxg+--
