Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6624B28;
	Tue, 15 Apr 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702848; cv=pass; b=DBXHTtn6LPZpZ5xWBIUNcSnQWs+ciHeTbfueKPt/iaJECSLKhhCoZagl86AzRD6XBrxnPY2E3E/nkiKpE8HV24rErQXXCIfEUIqHvO7xI1Kfq8S9QvJVx7S9Xa3xo1OKpQNuAhrXdCd0Vlhug6+FMTfiNV16AF3zOd6pgkDNfGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702848; c=relaxed/simple;
	bh=yU0uVlGtDXeaxlwOodUHke+tqbdX1S3tQgjMGMTi7t8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=buzCz3kLhFI4cEd1IjqNbIXGAYkOrOthRcp3fr5K1c0SSANbeJA2MY2h99jpw23VxoHqVWCYAbkXnNzxnVheG2f+58vBUAXxUMvbd4aoGzgDW5319/MgO0+FaJK2ECj49+Rf7gHO44k7P11HOW7uV9fIeM7dj0Yi9slxXRqVXLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b=EVuhjwAw; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sjoerd@collabora.com header.b="EVuhjwAw"
ARC-Seal: i=1; a=rsa-sha256; t=1744702774; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NkU8spe0vKT08V1fXVABu5/53/gQbYk4BNMrFwDPZsuuvccHpPHSsVbcfjrjR/bQGLUg9Ta0Mg02gUixO06nxIxeTPQSKi3jUFH83n25ZCq62lGhw4Led0V0GjA7GTAh5rgreZW4JKllVNYa6Gz6Hs8LKWCS6YZEq7z7qodE7DA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744702774; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yU0uVlGtDXeaxlwOodUHke+tqbdX1S3tQgjMGMTi7t8=; 
	b=Y7ZPpfE+id/ntFmKRy7y2NAhV1gzFzurNoW0ZjmrU75LSbbfQn2BVs//6r53AB1Bc+Zy8jQLy9PGjv6Zd7vZU1xDRpoS9RRqtDyBbLlyN7wHOp8Zza+oiI2lDUSLuPtk0CznX7rat0ZZG8MMvtHwNZw/MT/1D1OGX7JAJCl0QQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744702774;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yU0uVlGtDXeaxlwOodUHke+tqbdX1S3tQgjMGMTi7t8=;
	b=EVuhjwAwRYM7/0zcg7r0GCMTJSTlVHZMZxkNQFQxVzGr6goyPp8DbT7Ng4UWe5VX
	H2iA36/QNHPm/XrnD6QsdJzrkrACjX0HSj5+gX+Z81sYUllypQmYHKKqpqVtfvF/o4l
	v0qUEpQ/qmRJ6tFUcmenLs0EYQHBlQJSv8Yvo/n4=
Received: by mx.zohomail.com with SMTPS id 17447027670091011.7454237538764;
	Tue, 15 Apr 2025 00:39:27 -0700 (PDT)
Message-ID: <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550
 board device tree
From: Sjoerd Simons <sjoerd@collabora.com>
To: Samuel Holland <samuel.holland@sifive.com>, Ariel D'Alessandro	
 <ariel.dalessandro@collabora.com>, Pinkesh Vaghela	
 <pinkesh.vaghela@einfochips.com>, Conor Dooley <conor@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner	 <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano	
 <daniel.lezcano@linaro.org>, Min Lin <linmin@eswincomputing.com>, Pritesh
 Patel	 <pritesh.patel@einfochips.com>, Yangyu Chen <cyy@cyyself.name>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin	
 <peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
 <darshan.prajapati@einfochips.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya
 Bhatia	 <a-bhatia1@ti.com>, rafal@milecki.pl, Anup Patel
 <anup@brainfault.org>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 "kernel@collabora.com" <kernel@collabora.com>
Date: Tue, 15 Apr 2025 09:39:21 +0200
In-Reply-To: <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
	 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
	 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
	 <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

Hey,

On Mon, 2025-04-14 at 11:00 -0500, Samuel Holland wrote:
> Hi Ariel,
>=20
> On 2025-04-14 7:55 AM, Ariel D'Alessandro wrote:
> > Hi Pinkesh,
> >=20
> > On 4/10/25 12:25 PM, Pinkesh Vaghela wrote:
> > > From: Min Lin <linmin@eswincomputing.com>
> >=20
<snip>

> > Although commit log says that this includes DRAM configuration, looks l=
ike
> > it's
> > missing? In order to test this patchset, had to add this following memo=
ry
> > definition (picked from vendor kernel repository):
> >=20
> > =C2=A0=C2=A0=C2=A0 L50: memory@80000000 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 comp=
atible =3D "sifive,axi4-mem-port", "sifive,axi4-port",
> > "sifive,mem-port";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devi=
ce_type =3D "memory";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x0 0x80000000 0x7f 0x80000000>;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sifi=
ve,port-width-bytes =3D <32>;
> > =C2=A0=C2=A0=C2=A0 };
>=20
> That is a misstatement in the commit message. The memory node is not incl=
uded
> in
> the static devicetree because the amount of RAM installed on the board is
> variable. It is the responsibility of firmware to provide the memory map,
> either
> through EFI or by patching the memory node into the DT at runtime. I beli=
eve
> the
> current BSP U-Boot does the former but not the latter.

Amount of RAM being variable is pretty common on devices using FDT these da=
ys;
Typically the dts still gets a memory node that's a reasonable default, wit=
h the
expectation that e.g. u-boot will fix it up. If you look at other risc-v
devicetrees in upstream they (almost?) all come with a pre-defined memory n=
ode.
For the P550 board a default memory node for 16G ram seems reasonable (as t=
hat
seems the minimal SKU?)

That all being said. Indeed the sifive BSP u-boot doesn't seem to call the
relevant `fdt_fixup_memory` to fixup the memory node, hence us having issue=
s
booting with u-boot directly (without going through EFI). Honestly this was=
 a
bit of a surprise to me as only most other architectures that's just done b=
y
common code, but that doesn't seem to be the case for risc-v (either upstre=
am or
downstream)

--=20
Sjoerd Simons
Collabora
