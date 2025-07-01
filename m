Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243825C83E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353638; cv=none; b=Od2bwhqSkB5UvlEW1AItaovSp3CC6qpSvWHLHnS6qg4NTEIo6lHr/144oibsTLzQJaRtuhJmNgwXsC3KQ5HmNcXxNVNz7XOXAnR0A5H4d/qxdiOrzFD2Qq413+WvP6VEHs5kPT69ekSAsQPqtAPcuwFioTmkFIoN+UTccvzANsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353638; c=relaxed/simple;
	bh=lk4M686Bx0BvzXTrQUku+8V3HgOcKLRqezUoSSdCZmo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To; b=ODkL5OmzuCg7VJAoteIFuviX+1v6jstPRXcV3qdahdcqmZtOzmOuS/4OyzPJ4w/Fzg/VMNeRWgnV0sCY2U/ty4dztWBgmg2ZEoXfrapk2+D4o98P1q29vQVrmT6gcnHDHhzSJ8S89CP3MmRAJ4u30rLzBmPgTY3tlodljNTse9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn//zpZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn//zpZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3302C4CEEE;
	Tue,  1 Jul 2025 07:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751353635;
	bh=lk4M686Bx0BvzXTrQUku+8V3HgOcKLRqezUoSSdCZmo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=pn//zpZZ5CHUEhJFXAxlPfOPi9t4GB/YmdJ9JN9inGHm/dJog5dT0BGf6lRAqu1mm
	 78L5cWc31tjU/39Tro61BILPfUiv2xekiOrlUjRuCl8iQ3mK0rTBGGLABrR3A+VucU
	 sUv0ksuM82u7ZSsZrwKkcGQPvLEv861fxfQo0sJrAiOKKDGsTm9euIQZE1MPK9X5v7
	 0m4sKanRI3MHpUdcFCAFNO1wUIQ3Kcm+mHA3jNYTEYPMShkVF5pyDRNH1H3VfQYPC4
	 dyVnajXWRpRNeDOlTZkCvouyWYe0xm7zgtxVxno9GxPqdg1J0dV8tuY9wwKzfGVtqj
	 +ZPcupY/YgkHw==
Content-Type: multipart/signed;
 boundary=4330f9573f003d1ff9f1b456a236d9a4f92e9099905690fb0c4407407adb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 01 Jul 2025 09:07:10 +0200
Message-Id: <DB0J1QW7DG98.CDM408QMNM74@kernel.org>
Subject: Re: [bug] spi-nor not unlocking on Ubiquiti XW and WA
Cc: <tim.j.wilkinson@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jean-Marc Ranger" <jmranger@hotmail.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com> <DAZRDAEP431C.26ALRPF1GSJQH@kernel.org> <DM6PR06MB5611F88B8684C981CB986867C546A@DM6PR06MB5611.namprd06.prod.outlook.com>
In-Reply-To: <
 <DM6PR06MB5611F88B8684C981CB986867C546A@DM6PR06MB5611.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--4330f9573f003d1ff9f1b456a236d9a4f92e9099905690fb0c4407407adb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 30, 2025 at 7:50 PM CEST, Jean-Marc Ranger wrote:
> On 2025-06-30 05:25, Michael Walle wrote:
> > This seems to be due to the use of the uninitalized "mtd->size".
> > Could you try the following patch which is based on the latest
> > next kernel. It replaces mtd->size with nor->params->size, so you
> > could backport it to 6.6, but maybe it will apply anyway.
>
> Thank you so much for taking the time!
>
> Your patch applies automatically on 6.6.93, with minimal fuzzing and=20
> offset changes. And it fixes the issue! Formally:
> Tested-by: Jean-Marc Ranger <jmranger@hotmail.com>

Great. I'll prepare a proper patch shortly.

But I have to wonder whether this flash is locked by default after
each power-up or if it's just locked once after it comes out of the
factory.

The MX25L12805D datasheet reads:

  BP3, BP2, BP1, BP0 bits. The Block Protect (BP3, BP2, BP1, BP0)
  bits, non-volatile bits, indicate the protected area(as defined in
  table 1) of the device to against the program/erase instruction
  without hardware protection mode being set.

Does the bootloader enable the protection bits on each bootup? If
that's the case be aware that the bits might wear out over time
depending on how often that device is restarted ;) Likely won't
happen but it's still not nice if the bootloader fights against what
linux is doing (or the other way around).

-michael

--4330f9573f003d1ff9f1b456a236d9a4f92e9099905690fb0c4407407adb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaGOJHxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hiCAF/WdENLB+OmvVRleGVn8UKquWONyjuauGm
sOeusNIWuor2qKCQLLc00hSMXYJHgHUIAYDkRIpeYjPpcnpyhlZdlWDbMULzDipD
QbiQSjwj+71RvwGKO4dEYGZz96RT0EGM3tM=
=faSi
-----END PGP SIGNATURE-----

--4330f9573f003d1ff9f1b456a236d9a4f92e9099905690fb0c4407407adb--
