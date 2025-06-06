Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A2B1DEFD2;
	Fri,  6 Jun 2025 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225612; cv=none; b=RU5Bc6wrKldcs9pH2g7mjrHuCz4JHrjvf3CKUOXfWf4SvrZDiLSv+7jBaOzrzWfcQgfIt4pcxK86R8kS35nc+4MYCTe1DXJ7DQGcTJWZg173HpqrfY6Fu88V477ayAB1MwGytE3M2+ESCnWk0j85X9TB2JX7bY3NMl+CWDbS0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225612; c=relaxed/simple;
	bh=Y1KQtPS81IExz4pchO3Uiy9RWFy+znuf0PIIHykxx+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtXjK15/LZoLkc3YOoXeakWyZJg/LjGP6b6GXCI0n60HQ5aQaC/F19f5UJlNVPzpFCPFXRs8DdQWv4Z++VOd9gAbcJWwayFdCOMonabMUXdM+bpbnnndHbMd9wwHWneIaAnak7J7QWrpQd1l8f0Jx9q1DLydgoJyv1IoUST9VGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGySD9tq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGySD9tq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E375C4CEEB;
	Fri,  6 Jun 2025 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749225612;
	bh=Y1KQtPS81IExz4pchO3Uiy9RWFy+znuf0PIIHykxx+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGySD9tq4ZQpSu/Wtj4XFkBDmmsKZGnIVxxl1oj7eYsTqQuRu23KRSHoeD85Vspgy
	 qxr+RhnwQFbveIX9CanFdBmFn8T/0wkywf65ZQIyrbHCzJnLpH6UpTcJbS3go7IGSe
	 7s6DuAYrZ200X3NBJxDFBQ5CdA5SSzLA5vhHCPYcuP5/H4aPZavwJcedFv7BS53s6z
	 o5izOMHe7gmyuWPWE1uGR4QhhMprbnqP1t3OncMPMCS0+8Hz/10g/w9QUUSi1mRSYX
	 1U8CS6d3aoF3I1AUnB8P546Ro7jroNxfuLYz6CVoVtk+Jhya/c1o93fFEqxvwUvGon
	 bqkT0VtUHxX0Q==
Date: Fri, 6 Jun 2025 17:00:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	tim609@andestech.com
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <20250606-booth-icky-b416c1827a43@spud>
References: <20250602060747.689824-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XnSn4wlHT+08Cik0"
Content-Disposition: inline
In-Reply-To: <20250602060747.689824-1-ben717@andestech.com>


--XnSn4wlHT+08Cik0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2025 at 02:07:39PM +0800, Ben Zong-You Xie wrote:
> The Voyager is a 9.6=E2=80=9D x 9.6=E2=80=9D Micro ATX form factor develo=
pment board
> including Andes QiLai SoC. This patch series adds minimal device tree
> files for the QiLai SoC and the Voyager board [1].
>=20
> Now only support basic uart drivers to boot up into a basic console. Other
> features will be added later.
>=20
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/

Ball is in your court now, after rc1 make a tree and get it in
linux-next, and then send a pr to soc@kernel.org with this new content.
Perhaps the defconfig should go separately, I can take that one if you
want.

Cheers,
Conor.

> ---
> Changelog from v4 to v5:
>   - Rebase the series on torvalds/master
>   - Clarify the patch dependencies (2 <- 4 <- 5 <- 6) in the patch descri=
ption
>=20
> v4: https://lore.kernel.org/all/20250514095350.3765716-1-ben717@andestech=
=2Ecom/
>=20
> Changelog from v3 to v4:
>   - Restore the modification to cache-sets and cache-size in patch 6
>   - Do not constrain renesas,r9a07g043f-ax45mp-cache since it's independe=
nt to
>     this series.
>   - Delete the redundant example added by patch 6
>=20
> v3: https://lore.kernel.org/all/20250513094933.1631493-1-ben717@andestech=
=2Ecom/
>=20
> Changelog from v2 to v3:
>   - Rebase the series on Conor/riscv-soc-for-next
>   - Reform patch 6 as suggested by Conor
>   - Modify l2_cache's compatible in qilai.dtsi due to patch 6
>   - Add Conor's Acked-by tag to patch 4
>   - Add Conor's Acked-by tag to patch 5
>   - Add Conor's Acked-by tag to patch 9
>=20
> v2: https://lore.kernel.org/all/20250503151829.605006-5-ben717@andestech.=
com/
>=20
> Changelog from v1 to v2:
>   - Add detailed descriptions to PLIC_SW and PLMT0
>   - Move the aliases node and memory node from qilai.dtsi to qilai-voyage=
r.dts
>   - Drop "status =3D okay" in each CPU node since the status property is =
by
>     default "okay"
>   - Reorder the nodes in qilai.dtsi by unit address in ascending order
>   - Add myself as the maintainer of Andes's SoC tree
>   - Add Rob's Reviewed-by tag to patch 2
>   - Add Rob's Acked-by tag to patch 3
>   - Add Rob's Acked-by tag to patch 6.
>=20
> v1: https://lore.kernel.org/all/20250407104937.315783-1-ben717@andestech.=
com/
>=20
> ---
> Ben Zong-You Xie (8):
>   riscv: add Andes SoC family Kconfig support
>   dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
>   dt-bindings: interrupt-controller: add Andes QiLai PLIC
>   dt-bindings: interrupt-controller: add Andes machine-level software
>     interrupt controller
>   dt-bindings: timer: add Andes machine timer
>   riscv: dts: andes: add QiLai SoC device tree
>   riscv: dts: andes: add Voyager board device tree
>   riscv: defconfig: enable Andes SoC
>=20
>  .../andestech,plicsw.yaml                     |  54 +++++
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/andes.yaml      |  25 +++
>  .../bindings/timer/andestech,plmt0.yaml       |  53 +++++
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.errata                     |   2 +-
>  arch/riscv/Kconfig.socs                       |   9 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/andes/Makefile            |   2 +
>  arch/riscv/boot/dts/andes/qilai-voyager.dts   |  28 +++
>  arch/riscv/boot/dts/andes/qilai.dtsi          | 186 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  12 files changed, 370 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/andestech,plicsw.yaml
>  create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,plm=
t0.yaml
>  create mode 100644 arch/riscv/boot/dts/andes/Makefile
>  create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
>  create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
>=20
> --
> 2.34.1
>=20

--XnSn4wlHT+08Cik0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMQhgAKCRB4tDGHoIJi
0iR/AP9kPQhWU7yiu4elPR9CbPEUL9giMIDGnTOMdYaas3PcgwEAsiTkRJcBi9T7
Y/QETMvnZHsQfGe/qM/xmH2VNJ/ZQAE=
=6So4
-----END PGP SIGNATURE-----

--XnSn4wlHT+08Cik0--
