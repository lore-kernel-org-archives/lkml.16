Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817481FBCA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039024; cv=none; b=ifRaCE5NNgY87kQRIqGo7BpNBToGLfMDqeBcKf/2iEbzmnTd7yk3t65ydq7W0Mm3jdhG7yfXjFUQjSR3qcATdDyhGXMf5rbmxKNB+CbqQ1KkDz3rLiUbVIKilc7bW9l3glj+sm83lfZLSL0bW8MuwHW/6SrjH4bIZF/A6lsmXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039024; c=relaxed/simple;
	bh=KuijAyV9elDpjy8R345yMaaZw2M3RehdE6ABXqYOG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REvQd+89TsnH6RKqGV6/5Pd6hq6BZTnWZVLSeIg09ahJhwOMEgT7jPZ8QicWAsH4Uj5UH0n8NdHxbR59mr2esY6w6DHaNNPRJS/8qj1r0oCIRe1qQhuEymGXnGqoQwVIuPprDWwuBo771O/1hUZFqDLy4CrCnCViPYk1Ej9tmt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vaoqre4r; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vaoqre4r"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac73723b2d5so942649866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744039019; x=1744643819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
        b=Vaoqre4rY8zXtOO34JfKJ+skp4t6nPIY2DIZrHGGnb+Rq0OcD7GeGDulCCYyVdu7sK
         n3so1zBTjGBd4IjFAi8UZ3ovTFfy9nOXdmJCuvfjgWirZtkSXIxPg3NUbvRbKvXejxd8
         HUSikvxVQNqEGRccU/hCgRM6CeO+XOI6auYOeCX15nRBlMbBQnwC3THtCTLHPF47R/i3
         PQe59tMaeQZE0jjFOE5t9qEBybO+4ktAR6uK++/c/xyEYiQexkcNdfUSa96UWd1zyiAY
         8hhsgCYJ0RWYk7Os5AVDnEHTeZ4RyPjIKvNuagqSASjmaQFNogXdq74SZnoY/pzcrCW2
         kOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039019; x=1744643819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxnBAvpwCrecjAvuTm91rB4larlUyZM1HHjTp7DbEqQ=;
        b=rtxcPRgtzWrP09WlOOmT0Ep1AVU3tws5Ro+qBqYmdChrdm1+gmtJS8TkiDlhKp7aNA
         AarjmopHsLjos+Uq8B3IL790wgUjC6/tIgCBL3qpic11U6c6ug4YyUWRjwvev5WFA6Ou
         FEuCFu72RPpzSvSNjcNyoZ6EQ7b7+rGZKFR5wWlqX+L41k6XG8wQL5NwGevI1sfDi2ZT
         W4sbH7cmLDZ+NoVHUG8gZXeTIgYO7c5YHChm/Ep5f7jhx2LkeJReVU36IQ4uXPHF0Q85
         1U1YqNYDLUz2u/TmwTKynf4BMdq3LIEMiKWw5KQkDe8DlVvKya4yn2CsGnEkyflVnnl2
         U+Ww==
X-Gm-Message-State: AOJu0YyTWq4f7st0V4vv0jPsC23WwQfMN0VpFHgYnc9cS9LSkMVC3eDH
	tnteWruWJ9ctnheTTvU8s6DrJq9fhu87ONuFIVmTCDUifSnBvf3LcNGXNdNnob0=
X-Gm-Gg: ASbGncsFkRBiKhZJE3sM6HMQeHVt3ObKGCiUV36fz3/52nSAY2lNBXKTfCfQ7Eg+uNQ
	ZnlPXqyKI1PUteM8uYF/QINzwO3EyzmvFMqkp6gcJlPKTTW7xUp6yhr/XDNbsOhdhZo/BPYtf6m
	Oa8Iny3/sjujla5D8VruiI0TjJqvciWUZh/TXAtJXGIUpysuUl5mItqs0x3YaISebpJxZo3qfkZ
	sHLGS0KmFum8CxTKEsanFSKrrq7e3KOQwGCuXv41Eqv2MqS0A81YIyWFje9uTrrPDyir0PzV/bY
	T4/Sr/rcVlA387WfBxBNJQ4EIXdZ01fW2HnshUo8kjDclXB04g==
X-Google-Smtp-Source: AGHT+IFzTIXbrDVkyQ6AbBiDuE5pSliyWRspT9PlDuGXWQ5GmY7qspmZDr7hbN6PADzz8nJe3cDOSw==
X-Received: by 2002:a17:907:9716:b0:ac8:179a:42f5 with SMTP id a640c23a62f3a-ac8179a43b5mr48095166b.14.1744039018700;
        Mon, 07 Apr 2025 08:16:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c01c2c3asm768777166b.176.2025.04.07.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:16:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:16:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
Message-ID: <wn3ef55yaangw4p5cihu2rafqlm7ckmylner6q5irtpu6yq3cw@tyjieqhlq6vc>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
 <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvxqsbn576kt2xa5"
Content-Disposition: inline
In-Reply-To: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>


--pvxqsbn576kt2xa5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 12:24:31PM +0200, Uwe Kleine-K=F6nig wrote:
> On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > while working on character device support for PWMs I found a few
> > inconsistencies that are fixed in this series. After that I plan to work
> > on getting the character device support into shape to get it into
> > mainline, too.
> >=20
> > While some of these patches qualify as fixes I think there is no urge to
> > get them into 6.15, but given there is a bunch of such changes I might
> > send them to all together to Linus for inclusion to 6.15.
> >=20
> > Best regards
> > Uwe
> >=20
> > Uwe Kleine-K=F6nig (6):
> >   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
> >   pwm: stm32: Search an appropriate duty_cycle if period cannot be
> >     modified
> >   pwm: stm32: Don't open-code TIM_CCER_CCxE()
> >   pwm: stm32: Emit debug output also for corner cases of the rounding
> >     callbacks
> >   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
> >     rounded up
> >   pwm: Do stricter return value checking for .round_waveform_tohw()
>=20
> I applied patches #1, #2 and #5 to
> https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fi=
xes

And patches #3, #4 and #6 applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

with=20

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index dca5d09d80b9..4b148f0afeb9 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -213,10 +213,10 @@ static int stm32_pwm_round_waveform_fromhw(struct pwm=
_chip *chip,
 {
 	const struct stm32_pwm_waveform *wfhw =3D _wfhw;
 	struct stm32_pwm *priv =3D to_stm32_pwm_dev(chip);
+	unsigned long rate =3D clk_get_rate(priv->clk);
 	unsigned int ch =3D pwm->hwpwm;
=20
 	if (wfhw->ccer & TIM_CCER_CCxE(ch + 1)) {
-		unsigned long rate =3D clk_get_rate(priv->clk);
 		u64 ccr_ns;
=20
 		/* The result doesn't overflow for rate >=3D 15259 */

squashed into #4 to fix the build failure that the 0day robot reported
in this thread.

Best regards
Uwe

--pvxqsbn576kt2xa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfz7GUACgkQj4D7WH0S
/k6YPgf/SN1j5yOtJmC7QVuGTcUlTuOBLQ2qNU8p1Lg66BPQ6jADoLAXq6aILNiA
Yd2vrJGFq4Aiw1p6B2xWwmzt7C2QdcqKRD8qdbDsfR1STaNLoseLs6nNG4PvbrKw
5HI6vqngB8oD4YE1TRq98S9/J0oGXmP9sHJk7LsHRbsVlaZggTLGXHqqc4wxJFNx
cOBJ4o8zEfjytVTIA4E5wYf86/ag/ZjROBWuZTuhzZG57hkeM3rzGnMtT58/8A98
VaEFgkpFp15TF3utVme6ORwWOm1JNGUJYyV67iDMY4h7IawmHHcstQYR5iOHfqoU
jzQYSZKQ/foRNzTwC+xzpVl5326WiA==
=EicF
-----END PGP SIGNATURE-----

--pvxqsbn576kt2xa5--
