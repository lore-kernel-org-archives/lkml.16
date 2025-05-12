Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22910195
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064843; cv=none; b=uM4Vt8tm16aQC9lawZ8h3Lq2V3Cjd0bdE0BwaM7tNbeGa5dWu9YALRjZh+eJVmERoCRp/z9CIZh0Y+d1SXpHQ4i3OjygvNqUHq8SuFznIYUMvbj/BOytVlo0FlNT6lhOetcgAMYGPMC5W3wjBUh9GTZUSyjrqgkoBDvFaeE4454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064843; c=relaxed/simple;
	bh=tUkGeaZlP3x1PEPFhPd7Xaku48ipwY2NnrpefVgMago=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PDLwuV1c0PWOqxHMeCt64wz0H6qE2vCbE9+/pCgf/lgm2we2JJ4asjxMYxTuxCnVVGKToR/EiSj/IupppHvJj9CYFbe6mursDbiRj7JJRCKkQjINuyiK7LlvS1HP6JnsnK+slCe0mLilwybhQTkNdaiDs8a15PxKIsKpE2lkNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMh-0002iA-9Q; Mon, 12 May 2025 17:46:51 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMe-002OVJ-27;
	Mon, 12 May 2025 17:46:49 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uEVMf-000IW0-01;
	Mon, 12 May 2025 17:46:49 +0200
Message-ID: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
  inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 12 May 2025 17:46:48 +0200
In-Reply-To: <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
	 <20250509112032.2980811-4-elder@riscstar.com>
	 <20250512135429-GYA517867@gentoo>
	 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mo, 2025-05-12 at 10:34 -0500, Alex Elder wrote:
> On 5/12/25 8:54 AM, Yixun Lan wrote:
> > On 06:20 Fri 09 May     , Alex Elder wrote:
> > > Add a new reset_name field to the spacemit_ccu_data structure.  If it=
 is
> > > non-null, the CCU implements a reset controller, and the name will be
> > > used in the name for the auxiliary device that implements it.
> > >=20
> > > Define a new type to hold an auxiliary device as well as the regmap
> > > pointer that will be needed by CCU reset controllers.  Set up code to
> > > initialize and add an auxiliary device for any CCU that implements re=
set
> > > functionality.
> > >=20
> > > Make it optional for a CCU to implement a clock controller.  This
> > > doesn't apply to any of the existing CCUs but will for some new ones
> > > that will be added soon.
> > >=20
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > > v8: Allocate the auxiliary device using kzalloc(), not devm_kzalloc()
> > >=20
> > >   drivers/clk/spacemit/Kconfig     |  1 +
> > >   drivers/clk/spacemit/ccu-k1.c    | 90 ++++++++++++++++++++++++++++-=
---
> > >   include/soc/spacemit/k1-syscon.h | 12 +++++
> > >   3 files changed, 93 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kcon=
fig
> > > index 4c4df845b3cb2..3854f6ae6d0ea 100644
> > > --- a/drivers/clk/spacemit/Kconfig
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -3,6 +3,7 @@
> > >   config SPACEMIT_CCU
> > >   	tristate "Clock support for SpacemiT SoCs"
> > >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	select AUXILIARY_BUS
> > >   	select MFD_SYSCON
> > >   	help
> > >   	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> > > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu=
-k1.c
> > > index 801150f4ff0f5..551df9d076859 100644
> > > --- a/drivers/clk/spacemit/ccu-k1.c
> > > +++ b/drivers/clk/spacemit/ccu-k1.c
> > > @@ -5,12 +5,14 @@
> > >    */
> > >  =20
> > >   #include <linux/array_size.h>
> > > +#include <linux/auxiliary_bus.h>
> > >   #include <linux/clk-provider.h>
> > >   #include <linux/delay.h>
> > >   #include <linux/mfd/syscon.h>
> > >   #include <linux/minmax.h>
> > >   #include <linux/module.h>
> > >   #include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > >   #include <soc/spacemit/k1-syscon.h>
> > >  =20
> > >   #include "ccu_common.h"
> > > @@ -21,6 +23,7 @@
> > >   #include <dt-bindings/clock/spacemit,k1-syscon.h>
> > >  =20
> > >   struct spacemit_ccu_data {
> > > +	const char *reset_name;
> > see my comment below..
> >=20
> > >   	struct clk_hw **hws;
> > >   	size_t num;
> > >   };
> > > @@ -710,8 +713,9 @@ static struct clk_hw *k1_ccu_pll_hws[] =3D {
> > >   };
> > >  =20
> > >   static const struct spacemit_ccu_data k1_ccu_pll_data =3D {
> > > -	.hws	=3D k1_ccu_pll_hws,
> > > -	.num	=3D ARRAY_SIZE(k1_ccu_pll_hws),
> > > +	/* The PLL CCU implements no resets */
> > > +	.hws		=3D k1_ccu_pll_hws,
> > > +	.num		=3D ARRAY_SIZE(k1_ccu_pll_hws),
> > >   };
> > >  =20
> > >   static struct clk_hw *k1_ccu_mpmu_hws[] =3D {
> > > @@ -751,8 +755,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] =3D {
> > >   };
> > >  =20
> > >   static const struct spacemit_ccu_data k1_ccu_mpmu_data =3D {
> > > -	.hws	=3D k1_ccu_mpmu_hws,
> > > -	.num	=3D ARRAY_SIZE(k1_ccu_mpmu_hws),
> > > +	.reset_name	=3D "mpmu-reset",
> > > +	.hws		=3D k1_ccu_mpmu_hws,
> > > +	.num		=3D ARRAY_SIZE(k1_ccu_mpmu_hws),
> > >   };
> > >  =20
> > >   static struct clk_hw *k1_ccu_apbc_hws[] =3D {
> > > @@ -859,8 +864,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] =3D {
> > >   };
> > >  =20
> > >   static const struct spacemit_ccu_data k1_ccu_apbc_data =3D {
> > > -	.hws	=3D k1_ccu_apbc_hws,
> > > -	.num	=3D ARRAY_SIZE(k1_ccu_apbc_hws),
> > > +	.reset_name	=3D "apbc-reset",
> > > +	.hws		=3D k1_ccu_apbc_hws,
> > > +	.num		=3D ARRAY_SIZE(k1_ccu_apbc_hws),
> > >   };
> > >  =20
> > >   static struct clk_hw *k1_ccu_apmu_hws[] =3D {
> > > @@ -929,8 +935,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] =3D {
> > >   };
> > >  =20
> > >   static const struct spacemit_ccu_data k1_ccu_apmu_data =3D {
> > > -	.hws	=3D k1_ccu_apmu_hws,
> > > -	.num	=3D ARRAY_SIZE(k1_ccu_apmu_hws),
> > > +	.reset_name	=3D "apmu-reset",
> > > +	.hws		=3D k1_ccu_apmu_hws,
> > > +	.num		=3D ARRAY_SIZE(k1_ccu_apmu_hws),
> > >   };
> > >  =20
> > >   static int spacemit_ccu_register(struct device *dev,
> > > @@ -941,6 +948,10 @@ static int spacemit_ccu_register(struct device *=
dev,
> > >   	struct clk_hw_onecell_data *clk_data;
> > >   	int i, ret;
> > >  =20
> > > +	/* Nothing to do if the CCU does not implement any clocks */
> > > +	if (!data->hws)
> > > +		return 0;
> > > +
> > >   	clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, data->nu=
m),
> > >   				GFP_KERNEL);
> > >   	if (!clk_data)
> > > @@ -981,9 +992,63 @@ static int spacemit_ccu_register(struct device *=
dev,
> > >   	return ret;
> > >   }
> > >  =20
> > > +static void spacemit_cadev_release(struct device *dev)
> > why this function define as _cadev_ prefix, while below as _adev_
> > is it a typo? or c short for ccu, I just feel it isn't consistent..
>=20
> It is not a typo.  Yes, it was intended to represent CCU
> Auxiliary device, while "adev" represents just Auxiliary
> Device.  It is releasing (freeing) a spacemit_ccu_adev
> structure.
>=20
> > > +{
> > > +	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> > > +
> > > +	kfree(to_spacemit_ccu_adev(adev));
> > > +}
> > > +
>=20
> This function is operating on an auxiliary_device structure,
> so "adev" is used in its name.
>=20
> > > +static void spacemit_adev_unregister(void *data)
> > > +{
> > > +	struct auxiliary_device *adev =3D data;
> > > +
> > > +	auxiliary_device_delete(adev);
> > > +	auxiliary_device_uninit(adev);
> > > +}
> > > +
> > > +static int spacemit_ccu_reset_register(struct device *dev,
> > > +				       struct regmap *regmap,
> > > +				       const char *reset_name)
> > > +{
> > > +	struct spacemit_ccu_adev *cadev;
> > > +	struct auxiliary_device *adev;
> > > +	static u32 next_id;
> > > +	int ret;
> > > +
> > > +	/* Nothing to do if the CCU does not implement a reset controller *=
/
> > > +	if (!reset_name)
> > > +		return 0;
> > > +
> > > +	cadev =3D kzalloc(sizeof(*cadev), GFP_KERNEL);
> > > +	if (!cadev)
> > > +		return -ENOMEM;
> > add one blank line here?
>=20
> If I do a new version that's easy but this was intentional.
>=20
> > > +	cadev->regmap =3D regmap;
> > > +
> > > +	adev =3D &cadev->adev;
> > > +	adev->name =3D reset_name;
> > > +	adev->dev.parent =3D dev;
> > > +	adev->dev.release =3D spacemit_cadev_release;
> > > +	adev->dev.of_node =3D dev->of_node;
> > [..]
> > > +	adev->id =3D next_id++;
> > so I'd assume the underlying device doesn't really care the id?
> > but with different order of registration, it will result random id for =
the device
>=20
> These things are identified in DTS files by their index values
> defined in "spacemit,k1-syscon.h".  If there is a need for the
> assigned device ID to be consistent, I'm not aware of it.  Can
> you think of one?  I think all that matters is that they're
> unique, and this ensures that (for up to 2^32 PMICs).

If there are multiple reset controllers and the driver can be unbound,
it's trivial to provoke a collision by keeping one device bound and
unbinding/binding the second one until next_id wraps.
This could be fixed by using ida_alloc/free to manage the id.

regards
Philipp
