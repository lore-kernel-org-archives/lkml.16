Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88E82866;
	Fri,  6 Jun 2025 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225708; cv=none; b=AuWxapbFg0uMcl0ObBoryKkE6twDCcohI7ZpQJrCJemOhNlhBh6+OHKY34qBdHGyV7qtitEG0ne07hcCtrMTfN6IpCzB4KNX89VTp7YTMamWDOYbEnAfhR9LA79SLeqDsJRnB2EiWv/mzYQ4BN/STpe0yiQKpl9J4aMhMAo0cyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225708; c=relaxed/simple;
	bh=vhVShy+skVnHFGzfDTJtn4TVEa894a3+Y2xjxqrM850=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWa7nzmfXSojpTC/sd7g3LitX5UCDNrBB+dB0pgG/O1AODdEOrYEl8WjXA+YZcqyHjLTnS6baX6ejPB0KvNWX3y5PivL8tWgVOTuSMBPA1qG2Qw3Q+pl6cvPEfH0c06Q/bEAFXdlj121tVec3KerQX0g7p6gGLsNA/McYFDCZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2BcI4Ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2BcI4Ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB77C4CEEB;
	Fri,  6 Jun 2025 16:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749225707;
	bh=vhVShy+skVnHFGzfDTJtn4TVEa894a3+Y2xjxqrM850=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2BcI4Mlhm7S2wN2qr+fzTsG6NZqxkE/MjmXsyG2VIRIXTUJvnYAj6v7DCMkWYQpM
	 9zSNy4itoSohUNXsmhyMXu+UmGtp5TGOEaPmRoVKvAk/d/fdgx8BwTx1MRCuZXVCwb
	 fAUHe5HmjbwdrO4Js2VMuYfTuYQYtGrIufqKnJ+RGdrFtdUOU6RGDlk3fCLGYLaWUA
	 LRQMDy9tjmVGux8bWFDXHfYaT7BNBEYpI3hzDpRDNR0qyvzZlEgj1OEwsNlFGmbCeq
	 oOa0CM32BjqEiTb/qaTKY/xPBUkxm4pZutRd3v5sL+7i8WDRpNhnNZRNBYL7Ayn17s
	 jZlsYvn+8Gjnw==
Date: Fri, 6 Jun 2025 17:01:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <20250606-viable-guts-13687b1fbcdc@spud>
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
 <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <4vuneynwhmsyokkuw3wlabxij6kobl6j7bbbcymlcmsdc2hhb7@u5mhb7je74km>
 <MA0P287MB226230791E82A7A4D566C224FE60A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9oQ+77yUoZqjb+2M"
Content-Disposition: inline
In-Reply-To: <MA0P287MB226230791E82A7A4D566C224FE60A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>


--9oQ+77yUoZqjb+2M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 10:49:58AM +0800, Chen Wang wrote:
>=20
> On 2025/5/31 9:34, Inochi Amaoto wrote:
> > On Tue, May 27, 2025 at 06:22:05PM +0800, Chen Wang wrote:
> > > On 2025/5/27 17:34, Han Gao wrote:
> > > > On Thu, May 15, 2025 at 9:33=E2=80=AFAM Chen Wang <unicorn_wang@out=
look.com> wrote:
> > > > > On 2025/5/14 23:15, Han Gao wrote:
> > > > > > sg2042 support Zfh ISA extension [1].
> > > > > >=20
> > > > > > Link: https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resourc=
e//1737721869472/%E7%8E%84%E9%93%81C910%E4%B8%8EC920R1S6%E7%94%A8%E6%88%B7%=
E6%89%8B%E5%86%8C%28xrvm%29_20250124.pdf [1]
> > > > > >=20
> > > > > > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > > > > > ---
> > > > > >     arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 256 +++++++++=
+----------
> > > > > >     1 file changed, 128 insertions(+), 128 deletions(-)
> > > > > >=20
> > > > > > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch=
/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > > > index f483f62ab0c4..8dd1a3c60bc4 100644
> > > > > > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > > > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > > > > > @@ -256,11 +256,11 @@ core3 {
> > > > > >                 cpu0: cpu@0 {
> > > > > >                         compatible =3D "thead,c920", "riscv";
> > > > > >                         device_type =3D "cpu";
> > > > > > -                     riscv,isa =3D "rv64imafdc";
> > > > > > +                     riscv,isa =3D "rv64imafdc_zfh";
> > > > > Need not touch this. "riscv,isa" is deprecated and replaced by
> > > > > "riscv,isa-base" & "riscv,isa-extensions".
> > > > >=20
> > > > > And only adding zfh for this looks a bit werid.
> > > > >=20
> > > > > Actually, I plan to remove "riscv,isa" later, so please don't tou=
ch this
> > > > > from now on.
> > > > I think that since the linux kernel is the upstream for devicetree,=
 it
> > > > cannot yet remove riscv, isa needs to maintain compatibility.
> > > OK, maybe it's not good to remove "riscv,isa".
> > >=20
> > > Can this patch not modify "riscv,isa", but only add something for
> > > "riscv,isa-extensions"?
> > >=20
> > I can remove this while merging the patch, is it OK for you?

> Han does not want to remove this "riscv,isa"=EF=BC=8Che said some other c=
omponents,
> such as u-boot may have dependency on this.

U-Boot shouldn't, what actually needs it, opensbi?

--9oQ+77yUoZqjb+2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEMQ5gAKCRB4tDGHoIJi
0svJAP9Sj+tPyw/qgj7Nuqwdlm3h9SJL2W8YJeG/9/7t7SMLmAD/QshrFinvdV9O
0fyCldiYSrBiW7dQFbTy4jBpo492ag4=
=3AHM
-----END PGP SIGNATURE-----

--9oQ+77yUoZqjb+2M--
