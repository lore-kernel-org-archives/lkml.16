Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88A1E1E00;
	Thu, 10 Apr 2025 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280315; cv=none; b=uua9gc69t4GE2PcN5CJ8bs9tdelaxtQa9wjJmNPbKYwsiXiMSrOR/bLeyjVdIm8zHzBxM2X9y1DYTOx7MtGAewBnKOhtlV8C4qP6ETdBJHaYeuBvh7gT6O4G/FZwt20k22WhdogCSnmZ0zfePgqOKMD+fySVd0/MJ5YS+0YW/lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280315; c=relaxed/simple;
	bh=dsVWrf0xzWyYwyghGB7xrazS0Xxr4ZxY8zXtzb8k0qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iluFd9J0ZjM75pzNYPRvu9j3gFhmtpuZ8f8OuTu1ZZ9D7DQIEprG9DAaDRgv/4lEaWyD+wmSfEO4akYA0o9aPjf+ZzAdLDSWeMhyRw1Pxx3i82qMffZXTefoQ5r6hZQrsf/n3PKC1TohVqLJMUeYMoBys6rQMlhcDVgt0WtYjvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T455zsZk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T455zsZk"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45F8F352;
	Thu, 10 Apr 2025 12:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744280191;
	bh=dsVWrf0xzWyYwyghGB7xrazS0Xxr4ZxY8zXtzb8k0qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T455zsZkqCtAYV7CEXOaCyxkmPXL6S7RjI6CqzMR5E6/1PRJQkRyadBCB5M/4UzZN
	 iNwrbvCy1TIzOtyH/VopN+vkScWsWjLBQ3+fD3ukqSjFBti/AXPTYIyHax2HdMVWFq
	 VrPL4r7Dyd27jjlHzRou0C/HSSCmBwy6LgPzcxFM=
Date: Thu, 10 Apr 2025 15:48:25 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>, 
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, Nishanth Menon <nm@ti.com>, Hari Nagalla <hnagalla@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Beleswar Padhi <b-padhi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, praneeth@ti.com, "Khasim, Syed Mohammed" <khasim@ti.com>, 
	tomi.valkeinen@ideasonboard.com, v-krishnamoorthy@ti.com, s-tripathy@ti.com, s-tripathi1@ti.com, 
	c-shilwant@ti.com
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
Message-ID: <czmir7yvss3oreveesyrjqfdcawyn2axtstomsj3yx5sntqwo2@r3udnsyrxvkp>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
 <e131298f-3713-482a-a740-ff89709270b4@ti.com>
 <091c0869-525b-4b40-b5fe-a5c1907ec606@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e3db444jyk2gutly"
Content-Disposition: inline
In-Reply-To: <091c0869-525b-4b40-b5fe-a5c1907ec606@ti.com>


--e3db444jyk2gutly
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
MIME-Version: 1.0

Hi Devarsh,

Thanks for the cc here.

On Apr 10, 2025 at 14:30:59 +0530, Devarsh Thakkar wrote:
> Hi Andrew, Judith,
>=20
> Thanks for the quick revert.
>=20
> On 07/04/25 21:28, Andrew Davis wrote:
> > On 4/7/25 9:13 AM, Judith Mendez wrote:
> > > Hi Devarsh,
> > >=20
> > > On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
> > > > Hi Judith,
> > > >=20
> > > > On 05/04/25 05:45, Judith Mendez wrote:
> > > > =C2=A0> From: Devarsh Thakkar <devarsht@ti.com>
> > > > >=20
> > > >=20
> > > > Thanks for the patch.
> > > >=20
> > > > > For each remote proc, reserve memory for IPC and bind the mailbox
> > > > > assignments. Two memory regions are reserved for each remote proc=
essor.
> > > > > The first region of 1MB of memory is used for Vring shared buffers
> > > > > and the second region is used as external memory to the
> > > > > remote processor
> > > > > for the resource table and for tracebuffer allocations.
> > > > >=20
> > > > > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > > > > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > > > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > > > ---
> > > > > =C2=A0 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96
> > > > > +++++++++++++++++++++ ++--
> > > > > =C2=A0 1 file changed, 90 insertions(+), 6 deletions(-)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > b/arch/arm64/ boot/dts/ti/k3-am62a7-sk.dts
> > > > > index 1c9d95696c839..7d817b447c1d0 100644
> > > > > --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > @@ -52,6 +52,42 @@ linux,cma {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 linux,cma-default;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c7x_0_dma_memory_regi=
on: c7x-dma-memory@99800000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x99800000 0x00 0x100000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c7x_0_memory_region: =
c7x-memory@99900000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x99900000 0x00 0xf00000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mcu_r5fss0_core0_dma_=
memory_region: r5f-dma-memory@9b800000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x9b800000 0x00 0x100000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mcu_r5fss0_core0_memo=
ry_region: r5f-dma-memory@9b900000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x9b900000 0x00 0xf00000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wkup_r5fss0_core0_dma=
_memory_region: r5f-dma-memory@9c800000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x9c800000 0x00 0x100000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wkup_r5fss0_core0_mem=
ory_region: r5f-dma-memory@9c900000 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x9c900000 0x00 0xf00000>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 secure_tfa=
_ddr: tfa@9e780000 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reg =3D <0x00 0x9e780000 0x00 0x80000>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alignment =3D <0x1000>;
> > > > > @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 alignment =3D <0x1000>;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 no-map;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > -
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wkup_r5fss0_core0_mem=
ory_region: r5f-dma-memory@9c900000 {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D "shared-dma-pool";
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D <0x00 0x9c900000 0x00 0x01e00000>;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 no-map;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > >=20
> > > > This is missing the edgeAI specific remote-core carveouts and
> > > > RTOS- to-RTOS IPC memory regions [1] being used by edgeAI
> > > > firmwares which come as pre-packaged in the official SDK release
> > > > for AM62A.
> > > >=20
> > > > There is only one official SDK release for AM62A (which is
> > > > edgeAI based) [2] which packages these edgeAI remoteproc
> > > > firmwares and in my view it is a fair expectation that remote
> > > > core careveouts in device- tree should align with firmwares
> > > > released in SDK.
> > > >=20
> >=20
> > Why should Linux upstream care about what we do in our current evil
> > vendor SDKs?
>=20
> These carveouts are specific to remote-cores and so have to match with
> firmwares running in these remote-cores. The debate is on which firmwares=
 it
> should match to. The firmwares being packaged in SDK are the most used-on=
es
> and so in my view it is safe to account them as the official ones, unless
> of-course there is a major overhaul and re-architecture planned and accep=
ted
> for these firmwares in which case we should wait for it.
>=20
> > We change things around every cycle, and do all kinds of hacky things to
> > just
> > "make it work" for the current SDK release.
> >=20
>=20
> I don't see any changes done in memory map for last set of releases, but
> agreed if there is big architecture change planned for these firmwares th=
en
> we should rather wait for updated firmwares then adding bloated carve-out=
s.
>=20
> > > > This is because most developers (including me) and vendors
> > > > download this official SDK release and use it with latest
> > > > upstream kernel and modules (right now we are applying required
> > > > patches locally) and this patch won't suffice for this, in-fact
> > > > it won't work since the remoteproc firmwares are already using
> > > > regions beyond the reserved- regions from this patch.
> >=20
> > Then that firmware team should fix their firmware, Linux should not
> > do things just because some builds of a firmware did the wrong thing.
>=20
> Maybe some optimizations would be missing, but carve-outs for lot of thin=
gs
> which these firm-wares do out-of-box (and not even related fully to AI) a=
re
> missing. For e.g. there is RTOS-to-RTOS IPC test which runs on startup and
> there is no reserved region for same, this would lead to tricky failures.
> The DM R5 remote core also controls ISP, but all required regions for same
> are also not present either.
>=20
> >=20
> > Just a random example from the top of my mind here, a while back
> > someone on the codec firmware team decided to take the standard RPMSG
> > name service structure and modify it to suit some specific usecase
> > they had, suddenly all the firmware we made for AM57x devices stopped
> > working on upstream kernels. Instead of fixing the firmware we just
> > carried a hack for the same in our vendor kernel trees. Now customers
> > have no path to use this old firmware on newer kernels as adding the
> > hack to upstream Linux (rightly) failed [0].
> >=20
> > Let's not do that again, if we have firmware that doesn't follow
> > upstream, then let's fix the firmware, not hack around it upstream.
> >=20
> > The edgeAI firmware folks have no issue ignoring existing upstream
> > IPC carveouts and simply replacing them all with their own custom
> > ones in their SDK[1], I see no reason they cannot continue doing that
> > if they don't want to fix their firmware.
> >=20
>=20
> There is no apples-to-apples comparison with TDA4VM, unlike AM62A7 it off=
ers
> SDK for both edgeAI and generic Linux [1], so if someone just uses latest
> upstream kernel and device-tree with this generic linux SDK, that would
> still work without any overlays applied or carveouts added. Same is not t=
rue
> for AM62A, as AM62A offers only edgeAI SDK with firmwares packaged for AI
> use-cases. So if someone, just replaces latest upstream kernel and
> device-tree with the patches from this series in edgeAI wic image, it won=
't
> work cleanly due to missing carve-outs.
>=20
> Also even if we keep aside edgeAI, basic camera+ISP use-case won't work
> without the carveouts and we would prefer not to clone another layer to g=
rab
> the overlay and apply it every-time we want to test run camera+ISP (and e=
ven
> the edgeAI use-case) on AM62A which would be a pain.
>=20

On the basic camera + ISP usecase, afaiu the downstream edgeAI SDK uses=20
custom gstreamer elements that make calls to the aforementioned R5 core=20
that controls the ISP. On top of that there are additional gstreamer=20
patches that are not yet posted upstream for review from the community,=20
so the userspace design isn't really set in stone, or upstream-friendly=20
yet.=20

IMO if that architecture is still under discussion, it might be better=20
to keep the edgeAI specific carveouts out of the upstream DTs.. just in=20
case the carevouts have to go away, or change significantly.

If you are sure that the regions and firmware architecture is set in=20
stone and won't be updated even if there is a complete redesign of the=20
userspace/application level stack for accessing the ISP (let's say using=20
libcamera), only then it makes sense to add the carveouts right now.

> > >=20
> > > I understand your point, currently with this patch remoteproc loading
> > > will not work for some cores. However, the goal here is to standardize
> > > as much as possible the memory carveout sizes, push the "demo firmwar=
e"
> > > to request resources the correct way from resource table, and move aw=
ay
> > > from this dependency and limitations that we have with our firmware.
>=20
> I understand this, but my view is that w.r.t firmware only goal should not
> just be tp demonstrate correct way of requesting resources from
> resource-tables, optimize the carve-outs etc but also to demonstrate the
> primary use-cases (camera+ISP+edgeAI) which the device is capable of.
>=20
> > > should soon be able to generate our own firmware using Zephyr,=C2=A0 =
which
> > > Andrew is pioneering, so with this firmware we should move to the
> > > correct direction upstream. Downstream we are still using the memory
> > > carveout sizes that the firmware folk want so desperately to keep, for
> > > now..
> > >=20
> >=20
> > +1
> >=20
> > I have this Zephyr based firmware for AM62A working and it uses the
> > standard IPC regions as specified in this patch. I'll be posting the PR
> > for it in Zephyr upstream by the end of week.
> >=20
>=20
> I understand this, but will this zephyr based firmware support vision +
> edgeAI analytics ? Does it demonstrate all the unique capabilities of AM6=
2A
> SoC ? If not, then what would be utility of such firmware on AM62A where
> these are the primary use-cases w.r.t AM62A ?
>=20
> Why should upstream device-tree use carve-outs which match to this demo
> zephyr based firmware (which apparently not many are using and is not goi=
ng
> into any official SDK release) instead of official firmwares going into S=
DK
> ? SDK released firmwares are being used by so many customers and SDK
> documentation maps to it, but zephyr firmware that is being pitched here,
> who would be the potential users and what would be it's utility ?
>=20
> [1]: https://www.ti.com/tool/PROCESSOR-SDK-J721E
>=20
> Regards
> Devarsh
>=20
> > For this patch as it is:
> >=20
> > Acked-by: Andrew Davis <afd@ti.com>
> >=20
>=20
>=20
> > Andrew
> >=20
> > [0] https://lore.kernel.org/lkml/20241011123922.23135-1-richard@nod.at/
> > [1] https://git.ti.com/cgit/edgeai/meta-edgeai/tree/recipes-kernel/
> > linux/linux-ti-staging/j721e-evm/0001-arm64-dts-ti-Add-DTB-overlays-for-
> > vision-apps-and-ed.patch?h=3Dkirkstone
> >=20
> > > ~ Judith
> > >=20
> > > >=20
> > > > [1]:
> > > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/
> > > > arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=3Dti-linux-6.6.y-cicd#n103
> > > > [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
> > > >=20
> > > > Regards
> > > > Devarsh
> > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opp-table {
> > > > > @@ -741,3 +771,57 @@ dpi1_out: endpoint {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > =C2=A0 };
> > > > > +
> > > > > +&mailbox0_cluster0 {
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 mbox_r5_0: mbox-r5-0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D <0 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D <1 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > +};
> > > > > +
> > > > > +&mailbox0_cluster1 {
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 mbox_c7x_0: mbox-c7x-0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D <0 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D <1 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > +};
> > > > > +
> > > > > +&mailbox0_cluster2 {
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 mbox_mcu_r5_0: mbox-mcu-r5-0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-rx =3D <0 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,mbox-tx =3D <1 0 0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0 };
> > > > > +};
> > > > > +
> > > > > +&wkup_r5fss0 {
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&wkup_r5fss0_core0 {
> > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
> > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&wkup_r5fss0_core0_dma_mem=
ory_region>,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <&wkup_r5fss0_core0_memory_region>;
> > > > > +};
> > > > > +
> > > > > +&mcu_r5fss0 {
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&mcu_r5fss0_core0 {
> > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster2>, <&mbox_mcu_r=
5_0>;
> > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&mcu_r5fss0_core0_dma_memo=
ry_region>,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <&mcu_r5fss0_core0_memory_region>;
> > > > > +};
> > > > > +
> > > > > +&c7x_0 {
> > > > > +=C2=A0=C2=A0=C2=A0 mboxes =3D <&mailbox0_cluster1>, <&mbox_c7x_0=
>;
> > > > > +=C2=A0=C2=A0=C2=A0 memory-region =3D <&c7x_0_dma_memory_region>,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <&c7x_0_memory_region>;
> > > > > +=C2=A0=C2=A0=C2=A0 status =3D "okay";
> > > > > +};
> > > >=20
> > >=20
> >=20
>=20
>=20

--=20
Thanks,
Jai

--e3db444jyk2gutly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf3mvEACgkQQ96R+SSa
cUWkGhAAzCCnr4vaiqwl+eFE71335Drwwdm32P7PapSrveFwTaWYyVaAHV6ua/Cm
sbvbJuHPgh9LIy2zNEq2EnsjfA513NovuM4yoGA5x1LBb2q/OtfhS8xDlxza0aJ4
wN/jkJmTZJ7R+Oc3nvZBtLMLzlfhNFZFV92ob472rFGE9gS8V5KjcEJ5GAMAQqfd
KMCdN3nqza9bVLnMDg8jTPJVR2K5ktonx3CyuIg44Q0Zgrxqj9otqm/QcF2Gt3gj
jDQKMU9Ryowcm4SLoE/xlKOWQj1hwtY9HsegR4A7dzGDm//XIBo3iXCWsAMbWD1f
+enRtwycF96a1A/tei1yfNGj2yFVxamiUCtVA27i8XHr2Sfewl4zSSIhDYGJMU5o
UxwjpKy4DGaPZuIH1h9TF1jFFouQgs9XZJBxk/IE6yzU1eU/W8eVgT6oBQCpVRL8
FwAk4mUYNKiy4axTD1H5Xb8Z5JwpycuqZcp8j0GJPYDty2iYIxEZv55C7LciPfgA
jL2Y/g7sx4rCPXTUGlKy4QnfJDm3pdxp6QbLnqsvgdjFA/6UGQyhGRolZCgoOkJy
BANT1OM2ZN4B8OnIrcwrRcnecYsaTKqAU/ecEf1N/Zr6NQZNQbNbbC/KEoGrNH3G
pRViFRX9b2Washmr6+9sy3XfKsFqbzz1p8OMsdQDLJSZnJaJW5s=
=3GrP
-----END PGP SIGNATURE-----

--e3db444jyk2gutly--
