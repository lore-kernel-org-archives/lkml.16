Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7A80B;
	Sun,  6 Jul 2025 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751792880; cv=none; b=LXLj9eno3JDTSUtx2PYGcOSPNFTo5UQVHYYsKOt0VbXa6+6NrweliBXCDeWVv9aCO/bT8JEOapW1pxH8/puQj7h9T2upDAwADsIyrr6PgMDbIBO4Cij5gKZP/BcnCTYVMgq07fDMlnQcqiQNfgifLpvgRd3I5KB7NJOLs+h5iKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751792880; c=relaxed/simple;
	bh=o90NXVCoL+tGL5VVvy/yB5Xa0doRgIA76TaIzJVBePQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCYMIX1v3aTL4w86Jel6k2/n+WW2Xfewd1NgxjczBlR5gAWkF1hYGcYfmMu+5zpronG69mM5A4KPF5tHBZ4qLc/I4o2jRzmiWr4Af5D6Ax0o69pVmHHjrTuXk4WJZsofEYnsPKD0MB0DTpDZqIMLRgzPnLLnOEMdT4+3LDeOY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=kGT+P99n; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="kGT+P99n"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=Ho2vJrnmP0hAKFMj4ugRd5xpUyaSxVYHzOv8nai9HE4=;
	b=kGT+P99nbmbmlDK5wRcoQe7iTi0tj4rgq8Ja1NThF/Ut/eVDDS6zSOy/cBNeWCpC2WaWEjsDTE9nALznc4eUbYmsFDflpU7Wy67/u3PIg+8N8YG8NlKJU/04n5ytvbG8QSj/DyZPcvrVBo4AODJMy3a1l8NyWoAb1HZ6/bnTz/o=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:07:39 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad
 Carrier Board
Date: Sun, 06 Jul 2025 11:07:38 +0200
Message-ID: <4994705.GXAFRqVoOG@lukas-hpz440workstation>
In-Reply-To: <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
References:
 <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-4-lukas.schmid@netcube.li>
 <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1926776.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1926776.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:07:38 +0200
Message-ID: <4994705.GXAFRqVoOG@lukas-hpz440workstation>
In-Reply-To: <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> On 05/07/2025 23:38, Lukas Schmid wrote:
> > The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> > fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
> > and Status-LED all controllable over Ethernet with PoE support.
> > 
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> > 
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> > 7919b5bf5..a2f16d064 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > 
> > @@ -610,6 +610,12 @@ properties:
> >            - const: netcube,nagami
> >            - const: allwinner,sun8i-t113s
> > 
> > +      - description: NetCube Systems Nagami Keypad Carrier Board
> > +        items:
> > +          - const: netcube,nagami-keypad-carrier
> 
> That's just enum with previous entry. Don't make it over-complicated.
> 
> Best regards,
> Krzysztof

Just making sure here. The actual bindings are fine, but I should merge them 
into one patch, correct?

Best regards,
Lukas

--nextPart1926776.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqPNoACgkQJnN+drMV
Rths8gf/e6eLq4uNu0vJSGM9LYg+wGaYJJBiydq7iEk18FH2Vf60tOp7PGIYhSjW
hX9iL6iA5xvsycCO01AkcgT3+qV0r9sNoIiRyBPKVIdDltG4WRYzGnzGtGD6maff
mN8PR9rZ6k9qhlAFvdqCPTagJJ2GOHFu7NMv+uWxtuDedBNR3bMm5Q/EixQ2iqF8
tYMkXbl+DEGoMMbceDoBAitKJC6cZcWUsqaSFtLn84F9yl2EOM16r/9NTUAusT0T
nOkfvSD05VWc9iDoukZbIHPlH+63S/+LksJVMKYtJXI+0OUTH+YZwi0qzrK3NVgI
s9BZgcYcWUtfy5TXpq3lhvVxus+DDQ==
=jjD0
-----END PGP SIGNATURE-----

--nextPart1926776.tdWV9SEqCh--




