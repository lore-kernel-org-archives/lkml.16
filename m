Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF741D5CE8;
	Sun,  6 Jul 2025 09:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794908; cv=none; b=XXAbUQVAurgEXD6WOVFo80U0ZBNu2ZSTRSdl7WhOCBoHfQv4Y5QMfIl5d6TywQhdqR1g83I5WHNwyKinlwXd3CPOova0vRQbQCszMlzjRfrwR7Vq0icJdL/RnYwPYZHS8Cl5zQaJf2mmavdTYhIl1TZwlgeQV+Kqr6BGPqFW1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794908; c=relaxed/simple;
	bh=Xi20BYTgtvSL7wbwXI2dPYfVQxDlWwuB4hQBwMpMsIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4jPpTP/BlyjYPD14XjXcbGaAWZJtWCOJQ2R6KsKu2AZ6w+sb4fxFSwvl8dwtwBsWtEicZGbshvhqYM+sPT9R9IU11ikpDwuqmauBjqetBRGS/Gy4wEWLiZVH3OJo4F0GckiX86fZM3+EJCn4Zga0UsGX6VG518xHkrfGEosgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=WM1oT5px; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="WM1oT5px"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=Tx6cDw7EKbhkJw6fG1D90ClaQuotZ1sAaoIkU3c1stM=;
	b=WM1oT5pxVG9Iy9k5huD7gAh1ZzQlWUQf6t5rW9vfWRI3KVBlDO4eHl8jOQaokGwLNAz7ECOOaXQ6nT7snNJEwX7rtI0Yu/1HoS2ngzmKLM1TBLLFRCFvrhB5+JVaJ2FvcT7Y6I4C5Q+1107J2YwAaluYa2HuD0Qw7j1fQPir9gU=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:41:43 +0200
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
Date: Sun, 06 Jul 2025 11:41:42 +0200
Message-ID: <2998364.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
References:
 <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <4994705.GXAFRqVoOG@lukas-hpz440workstation>
 <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3359771.aeNJFYEL58";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3359771.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:41:42 +0200
Message-ID: <2998364.e9J7NaK4W3@lukas-hpz440workstation>
In-Reply-To: <6f257dd2-b88c-4dc2-a2ee-f92de4e0412b@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 11:36:34 CEST Krzysztof Kozlowski wrote:
> On 06/07/2025 11:07, Lukas Schmid wrote:
> > On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> >> On 05/07/2025 23:38, Lukas Schmid wrote:
> >>> The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> >>> fit a standard Ritto Intercom enclosure and provides a Keypad,
> >>> NFC-Reader
> >>> and Status-LED all controllable over Ethernet with PoE support.
> >>> 
> >>> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> >>> ---
> >>> 
> >>>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>> 
> >>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> >>> 7919b5bf5..a2f16d064 100644
> >>> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> >>> 
> >>> @@ -610,6 +610,12 @@ properties:
> >>>            - const: netcube,nagami
> >>>            - const: allwinner,sun8i-t113s
> >>> 
> >>> +      - description: NetCube Systems Nagami Keypad Carrier Board
> >>> +        items:
> >>> +          - const: netcube,nagami-keypad-carrier
> >> 
> >> That's just enum with previous entry. Don't make it over-complicated.
> >> 
> >> Best regards,
> >> Krzysztof
> > 
> > Just making sure here. The actual bindings are fine, but I should merge
> > them into one patch, correct?
> 
> No, you got two comments what should be changed in the binding.
> 
> Best regards,
> Krzysztof

So if I understand correctly you want me to remove the "allwinner,sun8i-t113s" 
from the carrier boards and keep it for the SoM?

Best regards,
Lukas
--nextPart3359771.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqRNYACgkQJnN+drMV
Rtgc2ggAg2Nrmm5+cnCBI7/+eAqaPrOuJ58OsFqoNuxGRtkqTCEJMrnk9aphn+QO
R+KYZmxhxFv8GTKAgfPdAG54XMVUTXV2upUYad0Qk2D2IbiPG/HU6Cd3EkxEtMum
NICpcxvZid1uNT0WzzYsD3Agn3DsYNrvVFTPUhx413QWykIxtDw0yOAzIw+HPWCN
8/1HSh+3TVj/Pk9HSuaBDzQ1faa9JHTsGoCQDsXGsybl2gis+J3CjR3MaNnCLKd4
bwOnxGLUmwKl4JBD2t/sK+rUXi52phr3wcUQeHmCxhXegO3ck9kdCMRCSPAzHuqL
zI6pL/QFThBIepZbBw12Vdv0YjmKJg==
=qoZP
-----END PGP SIGNATURE-----

--nextPart3359771.aeNJFYEL58--




