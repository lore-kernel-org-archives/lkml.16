Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3342C031D;
	Wed,  2 Jul 2025 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468651; cv=none; b=EPY5xN1iGxnSy7Kce4bSs/Y7R+YcpbBGeLWxsMwtLpYGVsMuRT5jB1IO1EBK0TYbuHmHcNR8FmE9dRQnfAm56A1Z7cLPqaEkhO83pzblLqDg7+ravpy1xsJlROe/RU8vuEnfz26oM/zbfclcPE6MPACwjODZ0QZqxa7d/cYtYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468651; c=relaxed/simple;
	bh=qj9JN0bIoM4q2XRV4+8lwVEY0tAGtWi0mdzE0otu6Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaJyipC5D+f2aWKCKH8H08NhNMo60760aD9wQB5GiS6lr8YoO1qfPKCLGUtFhG7T23DQWpcflEHdlwPYmIa38IMKf4U8czyjeNFfTf0imSIPRHWNou7a7vJ08PA5HpjeXKO6ubl9vB2G/wdxrSVqW6mQD1HuFZKbyBSVWf34E9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxFHGchs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxFHGchs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FABEC4CEED;
	Wed,  2 Jul 2025 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468649;
	bh=qj9JN0bIoM4q2XRV4+8lwVEY0tAGtWi0mdzE0otu6Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxFHGchsmxBrVAg+gQXYdRI8x3QES6OSYnCtYmCBe9sSdNjtJKPplC7fjl7c61y8C
	 EXFuwR+kUIyYTyUbgHn2EuP3kLuq9NSQD4xv4caY0TQkiLUGM1uQKmj24StIIeH3rb
	 KcfiVyXFzk4js6/KJBiYbnCi56Y3VVOi/9RzWkYT7hqntRgxaTad70RUsCK9th/an5
	 qfsncyxnICCAPi77FNFOeOsHPlQclOffy57Y39eKgpPir+Osu1tMG+2kZEAWQrYk+Z
	 KJngg4qUaP2jmgoIi5xZ4JV4Y4PtexxTM3eMrIQ+BARNHkq1h7Sie2EJS7MKo8vHjk
	 k3kbFPfu45nKw==
Date: Wed, 2 Jul 2025 16:04:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jorge Marques <gastmaier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250702-aliens-outage-958601861590@spud>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
 <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L1KGBXrwH67o7R7G"
Content-Disposition: inline
In-Reply-To: <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>


--L1KGBXrwH67o7R7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 11:23:43AM -0300, Marcelo Schmitt wrote:
> Hello,
>=20
> On 07/02, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wro=
te:
> > > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthes=
izable IP
> > > > >>> core that implements the MIPI I3C Basic controller specificatio=
n.
> > > > >>
> ...
> >=20
> > I went after the reason of the historically -1.00.a suffix and
> > discovered that they came into existence due to AMD Xilinx auto
> > generation devicetree tool SDTGen
> > https://github.com/Xilinx/system-device-tree-xlnx
> > that would automatically suffix with the IP version, defaulting to 1.00=
=2Ea,
> > and for a seamless experience, the were copied over to the dt-bindings.
> >=20
> > The adi,axi-pwmgen dt-binding went more creative and suffixed with
> > -2.00.a, while never enforcing Vivado to yield the devicetree with such
> > value (Major version is asserted in the driver through reg access, the
> > current core version is v2.1.1)
> >=20
> > Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> > defaults to 1.0, so the previous bindings from the other IPs are not
> > accurate anymore, either, (axi-pwmgen auto gens
> > `compatible =3D "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also=
)).
> >=20
> > For fun, the current Vivado version thinks the devicetree node for the
> > i3c master should be as follows:
> >=20
> >   i3c_host_interface: i3c_controller_host_interface@44a00000 {
> >           compatible =3D "xlnx,i3c-controller-host-interface-1.0";
> >           reg =3D <0x44a00000 0x10000>;
> >           clocks =3D <&clkc 15>;
> >           clock-names =3D "s_axi_aclk";
> >   };
> >=20
> > Let me know if we can drop the suffix, or replace with something else.
> > The current register defined core version is v0.1.0.
>=20
> I have no say in how dt-bindings should be, but having the IP version num=
ber
> automatically generated doesn't sound like a sane thing to do IMHO. Maybe=
 try to
> standardize with -1.00.a suffix? Though one could also argue about droppi=
ng such
> suffixes. Since we were told that the convention is to have the file name=
 to
> follow the compatible, I would go with 'xlnx,i3c-controller-host-interfac=
e'
> (without any suffix) so the file name is smaller and clearer IMHO. dt mai=
ntainers
> might prefer that in a different way.

To my knowledge this is an ADI IP from their HDL catalogue:
https://github.com/analogdevicesinc/hdl/tree/main/library/i3c_controller
I see no reason why it should have an "xlnx" vendor prefix - and I don't
think Jorge was seriously suggesting it either, given they mentioned it
was being shared "for fun".

--L1KGBXrwH67o7R7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGVKZQAKCRB4tDGHoIJi
0sjAAQCRJxw3ls7Pe6USBE3wFSZgnw2v13vG/nVg62Ip2v91kAD9Eue1UjXWxexy
CoOEsjQ7V6tYsmDw2UPtnNbCEdAJRAE=
=ce7m
-----END PGP SIGNATURE-----

--L1KGBXrwH67o7R7G--
