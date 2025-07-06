Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380A202F67;
	Sun,  6 Jul 2025 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795915; cv=none; b=PD4c32WV/rXamQ4QU4XoBvnWzcQQ9jqrE9woNk1gSOx2V92fV2xgadliZdXbjNMW/TDaiSg5+H5PUqZC+6pzM2nPIbQEsKmJEnY61YJWUaj1QHoMFT4cf9SIsqpqrjECkcReBiURtirGf7CqZ82surCxH8h1F1hwPfLfsVR9izI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795915; c=relaxed/simple;
	bh=C6qblwhf7Ipn1ASAc76zndedi6aR8+qsdrNjj1sEqWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJV8PHPMhrnvrrL6gU50HjIgpkxtCp6A/ffd+/fVBKlwPW+ul824nY3hOT71daUx9TE3a0r/PuMGM9bHojU/S07UeWl1JsrWC7CmtMnNHqIEQDK+NIJrjz/N5tI6ynTAgHZbc/EnszWqijbFTnZllziJuPddM9Iu5dbFHQID2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=ZCYWZFzg; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="ZCYWZFzg"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=7IFUgnPQyuVFa8Jj8ChajhgVnk7mfJFWlHVz17ozesI=;
	b=ZCYWZFzg4P9WrTsU5d6CCna4Qga4Q/aWUCSIGZfBh+srCwNdj3w3iLVSFj478A/b5BDM7qoD+wsnt06xKUKPe1UqykDHEIDUpUno2Z7hXPAO5oX2zjP1t9FJuObAGEIEFZ52iLRYxY7WTkag5WRFMS+RXWRNl3Cztg/zmMffkuI=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:58:17 +0200
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
Date: Sun, 06 Jul 2025 11:58:16 +0200
Message-ID: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
In-Reply-To: <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
References:
 <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <2998364.e9J7NaK4W3@lukas-hpz440workstation>
 <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10685525.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10685525.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:58:16 +0200
Message-ID: <8549188.T7Z3S40VBb@lukas-hpz440workstation>
In-Reply-To: <4648f0bf-2957-45bf-a6c1-01787e5d3e88@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 11:46:46 CEST Krzysztof Kozlowski wrote:
> On 06/07/2025 11:41, Lukas Schmid wrote:
> > On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
> >> On 06/07/2025 11:07, Lukas Schmid wrote:
> >>> On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> >>>> On 05/07/2025 23:38, Lukas Schmid wrote:
> >>>>> The NetCube Systems Nagami Keypad Carrier is a custom board intended
> >>>>> to
> >>>>> fit a standard Ritto Intercom enclosure and provides a Keypad,
> >>>>> NFC-Reader
> >>>>> and Status-LED all controllable over Ethernet with PoE support.
> >>>>> 
> >>>>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> >>>>> ---
> >>>>> 
> >>>>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >>>>>  1 file changed, 6 insertions(+)
> >>>>> 
> >>>>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> >>>>> 7919b5bf5..a2f16d064 100644
> >>>>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>>>> 
> >>>>> @@ -610,6 +610,12 @@ properties:
> >>>>>            - const: netcube,nagami
> >>>>>            - const: allwinner,sun8i-t113s
> >>>>> 
> >>>>> +      - description: NetCube Systems Nagami Keypad Carrier Board
> >>>>> +        items:
> >>>>> +          - const: netcube,nagami-keypad-carrier
> >>>> 
> >>>> That's just enum with previous entry. Don't make it over-complicated.
> >>>> 
> >>>> Best regards,
> >>>> Krzysztof
> >>> 
> >>> Just making sure here. The actual bindings are fine, but I should merge
> >>> them into one patch, correct?
> >> 
> >> No, you got two comments what should be changed in the binding.
> >> 
> >> Best regards,
> >> Krzysztof
> > 
> > So if I understand correctly you want me to remove the
> > "allwinner,sun8i-t113s" from the carrier boards and keep it for the SoM?
> 
> No, I spoke nothing about that compatible. My comment is EXACTLY under
> the line being incorrect. That entry should have been made enum with
> previous board compatible. Look at other vendors, because this file
> repeats that pattern for some reason, eh...
> 
> Best regards,
> Krzysztof

Ah sorry. I think i understand now. You want the carrier boards in a single 
entry with the different compatibles as the enum like:

      - description: NetCube Systems Nagami SoM
        items:
          - const: netcube,nagami
          - const: allwinner,sun8i-t113s

      - description: NetCube Systems Nagami SoM based boards
        items:
          - enum:
              - netcube,nagami-basic-carrier
              - netcube,nagami-keypad-carrier
          - const: netcube,nagami
          - const: allwinner,sun8i-t113s

Best regards,
Lukas


--nextPart10685525.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqSLgACgkQJnN+drMV
RtiERQgAhtJfnRb+0MWY3I9NrlK10nZqNnvJr1RrRAl3ac/hg00rMlrCjI1GWna3
WnNjQY8ztNvMI83gXaTLDv1raTVU+6sIMcwiZcSGn8wdWSO/Cx4Rl3ziY/z3mAtc
axXLv907yLGC62k4U/wpBJ3+wTEe49M4JaBTs868YCa1Q/vjpqZsnIun+1nWlTFR
hH06vVJhgoV32fDePHQsGyAdn6sQoxt8bLqryu3u2aZaJLDDH/K/bcxpbSCYlSyj
c84tM50/VIdh8/MyMXUUbas/odCS/+7Tvm6fNdlJG/BdIeWL454EJNaVlUdj+Cvp
/4qEOroTN+xTqZNKizC7wI6uMqBkjA==
=g2nF
-----END PGP SIGNATURE-----

--nextPart10685525.nUPlyArG6x--




