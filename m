Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F442F2C4C;
	Thu,  3 Jul 2025 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.28.40.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566893; cv=none; b=CDsTIZko7rES2Sk/tqHpMhdfIrkuPQl3/zzLDpqIeB9zY3ZZyv7kcCKGdKWfRQaPm72GRHS5srz8V0s+uRlcOsMUr6jD/TkcSOfSTnQRbiYSE8U7jPoou+7q17mw6djyiiRaW4GKKorLwbRobKhu+kbKpF+twR0VnnA51SUadgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566893; c=relaxed/simple;
	bh=12KSMMjnVg8dZvbPiKPjh2oNz1KNvtRf9nY3iXHMh1M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvsYvoossh038Muq3yQqe9l4HOedN2FpmusNHtIVnnSe1R3U1NbE7sNXLrIHaXQ0Bis3farOTRocz2hceggMmU/5rNxEJeRUUkqPvL1CNpX3VvSSc94OzG3DWWiXU9nI2MyraPEtG5TjDiP/CQcuyrJxWsfY0jNSHYaOWf7Ea6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; spf=pass smtp.mailfrom=nabijaczleweli.xyz; dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b=IAFx/PJz; arc=none smtp.client-ip=139.28.40.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b="IAFx/PJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1751566890;
	bh=12KSMMjnVg8dZvbPiKPjh2oNz1KNvtRf9nY3iXHMh1M=;
	h=Date:From:Cc:Subject:From;
	b=IAFx/PJzatiLKsMBsVvhCpDqsCv6tbypAvtet7DcoPvoSjReZxsQaEvzEJ4B0O+de
	 IeJtfdcqFsYQKhLpPlY2V2pPMm4zOSctxVmKKBU8kwn8ighFcFrzpZZWptOfTF+oG/
	 feuehYbeS0TQia4+Q7oQX6IeEdS7Hj0dAXxZnwgzTm5TRzOxy9ewWYaA/FHsiRA8At
	 HZb2JtgtWhNRA9rN3vkiqDkDuFDDKwx6NxuUKXafAINmB1NH+KNzv6ooAYpP4obBhU
	 Jn/5nK9sNccbfceDAkpr0a5c7Otxf2cGa7ekiGy9QGsYCRK52X3OMnAbzYxvooC7Cq
	 WUKnsGo6gpNig==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 1E18794A;
	Thu,  3 Jul 2025 20:21:30 +0200 (CEST)
Date: Thu, 3 Jul 2025 20:21:29 +0200
From: 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: emu10k1: fix "for/take a while" typos
Message-ID: <e4owjda3hf5vjc2237m3ctokey4qglfrciga6ho24bd4os5awk@tarta.nabijaczleweli.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zwrmjaa7eaqstaih"
Content-Disposition: inline
User-Agent: NeoMutt/20231221-2-4202cf-dirty


--zwrmjaa7eaqstaih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
v1: https://lore.kernel.org/lkml/h2ieddqja5jfrnuh3mvlxt6njrvp352t5rfzp2cvnr=
ufop6tch@tarta.nabijaczleweli.xyz/t/#u

 sound/pci/emu10k1/emu10k1_main.c | 2 +-
 sound/pci/emu10k1/emupcm.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index bbe252b8916c..6050201851b1 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -606,7 +606,7 @@ static int snd_emu10k1_ecard_init(struct snd_emu10k1 *e=
mu)
 	/* Step 2: Calibrate the ADC and DAC */
 	snd_emu10k1_ecard_write(emu, EC_DACCAL | EC_LEDN | EC_TRIM_CSN);
=20
-	/* Step 3: Wait for awhile;   XXX We can't get away with this
+	/* Step 3: Wait for a while;   XXX We can't get away with this
 	 * under a real operating system; we'll need to block and wait that
 	 * way. */
 	snd_emu10k1_wait(emu, 48000);
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 1bf6e3d652f8..ca4b03317539 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -991,7 +991,7 @@ static snd_pcm_uframes_t snd_emu10k1_capture_pointer(st=
ruct snd_pcm_substream *s
 	if (!epcm->running)
 		return 0;
 	if (epcm->first_ptr) {
-		udelay(50);	/* hack, it takes awhile until capture is started */
+		udelay(50);	/* hack, it takes a while until capture is started */
 		epcm->first_ptr =3D 0;
 	}
 	ptr =3D snd_emu10k1_ptr_read(emu, epcm->capture_idx_reg, 0) & 0x0000ffff;
--=20
2.39.5

--zwrmjaa7eaqstaih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmhmyikACgkQvP0LAY0m
WPH8xBAAoNuyqLH78miufJfAkns2RlNbqsLjqKqk667b7niJq1b5EWQF8cC8rLV/
Hl71N1u3spjs8ktbzfvEMvW3bpXRyYQhExQ/ocz+gXenC8yaBOXvlhIQIP0wof0d
ni5az83x/Qwdpu/kv3pNumpMTGfjWz1V6B/urTe8hf1HoHiE88TyaEKP61xRVsuw
ACjic+uKV1/jqdS9EVzUpgRPj7dXELxIvDXMyKQjMN7volFRis4Tin588Ewp8WSy
joIXRY5/u5GWynXzeabcBFuRlxHlk5KG/gdCYz+DDBZjvh1jTyqYaG61qodlz1h0
G9wk6UwTu6SqjLXdvpa607UCleISax74Hsw/b1JrTUdAlJG7R6k7lfPLQq+JkgTd
k9F06sCuyDzfYvs5sNoFnpjfzzeuJwzuiTMAypIJqtXPI7pejM+BosybubDD9ABU
S+rViQ6C+ftFvgwOZ0Y3b4y1+Vq8j+ZoOouZj/GKQ3grE98CnjNPT9q9rjMxR+wE
9+2E67f1KzF9J9yLfFw76CWLFHZkTbw+EZQSCQfkDBIMUSOphtJsBf7IuJoevUqX
GpEv5QMWZwfDjEo8ZFfdNTEM3HKBCEesvOXziHqEAYqkWxA0XPVCdBLkyvf+0TnI
844FwF1saFR3TLtdP/yKKRZSxZc70artOwV37d65J4GVhCI0iek=
=nYRO
-----END PGP SIGNATURE-----

--zwrmjaa7eaqstaih--
