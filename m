Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C28263C7B;
	Tue,  8 Apr 2025 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101872; cv=none; b=W9wcXGBv+tcrGnI+dcOHcgOezGiNe2DNjNhFiq9G1XiyGS0KARPQFCWcfbDM5a+4pRmVss3mjylwAU2ufHdwtKboVdb63pyco73XxsalEhSa/8Ze8XohUhJYpSTILiG5K/2AiO57IbVmeYFszfS9XTh4LlSukREbuE8Wte0YyLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101872; c=relaxed/simple;
	bh=i2Rl7x4Xq17P5xJJLLS3QmfNszFaBGXQwbEl2XSC/bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9Ly3n78tyHSe2N3glGH3gHKhKUo+WnIyDFhgj+NEXjxwgQ6ntPsFRLVDWbiHF2RXdYZhdwrRLhCaJANoz0g0yUOfuXFK+lw+SqHpOblV5Fd9+61jvwPT91ZtiwisP2ZPdyOuqO/e1ygg7phlBFMqucuuEQ68dExB4fHnqS3yCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j57bW5gQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j57bW5gQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso51385251fa.0;
        Tue, 08 Apr 2025 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744101869; x=1744706669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XUQLSJBnGa1PmwIDuHGtKHPGc6cqddLm6J++qb94PQ0=;
        b=j57bW5gQpxc8YJNQghL612/43IKPzK60v1CoKAbzzwD5P38iszWM7uC9aJFWSk1rXG
         kRCk2HVenpGKZiRibpv1Ics75K4v2jkKWkZDRc2uACJtcFDQhjx5NJOBqK7FODfkufNA
         DQFrXYl6zD2V3mCjCjqlW8JHF5ZZqheopn0tQWaQLx6f565Q/fPN4fpaeVLhwLQ5+3/4
         Bd80Kl3++TvoiPgj9PCmTSZOd/e03i6C/NDrGqtR8GC4OxofrdmwgsEs3JMFn7cqJzSL
         8mhUywRA4e/O+PgJdaq78PxG8aoZQlJvyZPp8w/mXPVFpB1OGFX7JbvulbJDCyoJy1hu
         fu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101869; x=1744706669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUQLSJBnGa1PmwIDuHGtKHPGc6cqddLm6J++qb94PQ0=;
        b=J28wfttSkzQPcb0EVdNhlks7/jLmkEtZqyHhM8qSXDqzevnsvVZ8PdCNIDIz1yOHQ/
         WluxL/emHn0/XSxI1rxegyx1uuHNEnyjZqRUeZymt0a3j6dMFa9hKczGxse2iF8Jp0Ov
         2jOR56mmYHTt9YSnSjiPQr50YuIatlH+DnHBcnYCdHtp3MrGnePlALN+DdHNPKjRB9T9
         Oy8bE3bDumYpfHvgAgnKY7FbEihnlpqDSsddl5q/IwrlcqiBdBfv366KY6NmJrkOCIKh
         ZNrtVTejZBZdPop5kAHIV24gFFN9jZsWwj1g63xKDTkoVQy9ViVwrube3vHCLEIlySxU
         Fzyw==
X-Forwarded-Encrypted: i=1; AJvYcCVRlRLdeA8wemPzpMpfCKFZZ7W5ql2wlHA3Lv9fLd0u/CaH9n8qkX7B5Fx3fhpbRpDpdIVwWZ0JbeNJ/egz@vger.kernel.org, AJvYcCWWaTZgcMAcmjvtJP71edpWUWSrcKxg6WzA/rkXM5Pxep8sRzIuh7nHKp8o7a8Qy91zAXlro9cxGYeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIs0OIPI6rRBj6X5i0XPQoe1qBJDVbnZyJ1a2GzWfrrnG9+Sc
	hj1XTpYDBDJs1r0Ok1jJ3WQr/k9zDTlz2PAtBVeXgLKE17XwR13h
X-Gm-Gg: ASbGncsdDiA84x+HSb2blSjUaVyP+DMbEmji1omN32W8l2xDLK4kgvw227i3YPeawXo
	q7X7kBzbxN+DzxTA6oSkd72TfHgk8YdWFEv09Q3DP4TmZkmJWeyMP7/MVhVrYXepFeSXF+FBmqo
	RkzQ0rp4l+oyVT7hu/15qU2S970VzwbSIPjEpSeIbu0LBGtKfUaBX/thkmjQGQGotmhrv1TW8RW
	GFmY5LAPkZ/wjv91hyWv2umkvQPCm8YwrA20j7MREG9OkGgh0napBZURkQOpW2WXS6GqC8FMfko
	Ic8Gk9gu+hYoy42KjXrFTRVxp9ly7JtOZ6Z6tUyzAMNyxAY=
X-Google-Smtp-Source: AGHT+IFT+REP1j37pi56UHxa9McAYCbOzg+QsEbvDGM/D+SaNPwvcbbyyPf1Sf8RRvYKGD2Nb7z1UA==
X-Received: by 2002:a05:651c:12c3:b0:30c:2590:124c with SMTP id 38308e7fff4ca-30f0a10b7bbmr44729681fa.11.1744101868731;
        Tue, 08 Apr 2025 01:44:28 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcf76sm18109851fa.75.2025.04.08.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:44:27 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:44:24 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/14] dt-bindings: mfd: bd96802: Add ROHM BD96806
Message-ID: <3c245cc3829dc64d977c97eae7ae8e2be6233481.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rWrmcppmFkKxiPNV"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--rWrmcppmFkKxiPNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The ROHM BD96806 is very similar to the BD96802. The differences visible
to the drivers is different tune voltage ranges.

Add compatible for the ROHM BD96805 PMIC.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Acked-by: Lee Jones <lee@kernel.org>

---
Revision history:
 v2 =3D> v3:
  - Fix missing space in the title line
  - Changes to node names and 'reg' description dropped as they are now
    done right in the patch adding the file
 v1 =3D> :
  - No changes
---
 .../devicetree/bindings/mfd/rohm,bd96802-pmic.yaml  | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml b=
/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
index ccabbebf9a29..6cbea796d12f 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
@@ -4,19 +4,21 @@
 $id: http://devicetree.org/schemas/mfd/rohm,bd96802-pmic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
=20
-title: ROHM BD96802 Scalable Power Management Integrated Circuit
+title: ROHM BD96802 / BD96806 Scalable Power Management Integrated Circuit
=20
 maintainers:
   - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
=20
 description: |
-  BD96802Qxx-C is an automotive grade configurable Power Management
-  Integrated Circuit supporting Functional Safety features for application
+  BD96802Qxx-C and BD96806 are automotive grade configurable Power Managem=
ent
+  Integrated Circuits supporting Functional Safety features for application
   processors, SoCs and FPGAs
=20
 properties:
   compatible:
-    const: rohm,bd96802
+    enum:
+      - rohm,bd96802
+      - rohm,bd96806
=20
   reg:
     maxItems: 1
@@ -27,7 +29,8 @@ properties:
       for fatal IRQs which will cause the PMIC to shut down power outputs.
       In many systems this will shut down the SoC contolling the PMIC and
       connecting/handling the errb can be omitted. However, there are cases
-      where the SoC is not powered by the PMIC. In that case it may be
+      where the SoC is not powered by the PMIC or has a short time backup
+      energy to handle shutdown of critical hardware. In that case it may =
be
       useful to connect the errb and handle errb events.
     minItems: 1
     maxItems: 2
--=20
2.49.0


--rWrmcppmFkKxiPNV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04egACgkQeFA3/03a
ocXgoAf8CWiZOyKurNrN+fXDN3Phjpqn9lThbo3WhCHPPi5Z8kcm83IHKZ3F3OmY
cnvK3jIazN1p8/upXlQr6ETOTnbjWJjtazBt+fg9Lxtp4oZz4WEKRyCOvgcewG9j
lcOsIRWDrdJARFOOETEvxI5xj07jbIxO6hgs35GSn6fTxL63qB0Ck8X6aEMmf0uM
VH2mkbXkckmXy0q4vBfb7wbJnaIOv6slmLWaB2Ar+uihuedaKmHzNvLSoqVfKCJE
L1VdGPqBpn8mn8GR22cMUzFJhEvGanE5/GCDmpaTmJGiqrA0yOU7GEpRuH9MR8ww
Oho6Bt6ESchw9QGsukbDz7AwTs7cMw==
=SYqO
-----END PGP SIGNATURE-----

--rWrmcppmFkKxiPNV--
