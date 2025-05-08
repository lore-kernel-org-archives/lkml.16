Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878FB25744D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694944; cv=none; b=jqoFkTPuEgWesTAT+ktEej/Aw4PAl8lUNcpUMfAMZvh3DZivhb8Y+1800XDrBBO0aP1eRQNLBOWwOZUPhNwgtpDACHOs/jOBXZXqW99g9zADDQr7qTAzDITntoobJg/ra/b/23uXsBfr8rfhPPo3JK36l7z4Y8+bOGegdl27A04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694944; c=relaxed/simple;
	bh=IGe+U/YH/iUPaG05eqrCD/ah/1kOmm9NRWUhqyUdTJM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=usvm7aeU5WxHci4zeY5zTlg5fOpGzH8qdG2HxGFQu/wZQ3dDVoYVRtAQjQgg9TIu+cYJZmsb6QqS21ZhblEGymdE4Ma9vCCO9TcKmmYAjrT9olZxf7zWJm+El6irNP92yKmLk/RePytBZnGmLDKEv+t8H7elWrsAeqcXaFMP1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8b-0008Qf-0D; Thu, 08 May 2025 11:01:53 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8Z-001hI1-0c;
	Thu, 08 May 2025 11:01:51 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCx8Z-0003Eh-0J;
	Thu, 08 May 2025 11:01:51 +0200
Message-ID: <8b5d8045041f2f07b68066e4e541d5e42282fa9b.camel@pengutronix.de>
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:01:50 +0200
In-Reply-To: <20250506210638.2800228-5-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
	 <20250506210638.2800228-5-elder@riscstar.com>
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

Hi Alex,

On Di, 2025-05-06 at 16:06 -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  The code is structured to
> handle SpacemiT resets generically, while defining the set of specific
> reset controllers and their resets in an SoC-specific source file.

Are you confident that future SpacemiT CCUs will be sufficiently
similar for this split to make sense? This feels like it could be a
premature abstraction to me.

> A SpacemiT reset controller device is an auxiliary device associated with
> a clock controller (CCU).
>=20
> This initial patch defines the reset controllers for the MPMU, APBC, and
> MPMU CCUs, which already defined clock controllers.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/reset/Kconfig           |   1 +
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/spacemit/Kconfig  |  12 +++
>  drivers/reset/spacemit/Makefile |   7 ++
>  drivers/reset/spacemit/core.c   |  61 +++++++++++
>  drivers/reset/spacemit/core.h   |  39 +++++++
>  drivers/reset/spacemit/k1.c     | 177 ++++++++++++++++++++++++++++++++
>  7 files changed, 298 insertions(+)
>  create mode 100644 drivers/reset/spacemit/Kconfig
>  create mode 100644 drivers/reset/spacemit/Makefile
>  create mode 100644 drivers/reset/spacemit/core.c
>  create mode 100644 drivers/reset/spacemit/core.h
>  create mode 100644 drivers/reset/spacemit/k1.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e686..b1f1af50ca10b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -354,6 +354,7 @@ source "drivers/reset/amlogic/Kconfig"
>  source "drivers/reset/starfive/Kconfig"
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
> +source "drivers/reset/spacemit/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
> =20
>  endif
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c..6c19fd875ff13 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -2,6 +2,7 @@
>  obj-y +=3D core.o
>  obj-y +=3D amlogic/
>  obj-y +=3D hisilicon/
> +obj-y +=3D spacemit/
>  obj-y +=3D starfive/
>  obj-y +=3D sti/
>  obj-y +=3D tegra/
> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kcon=
fig
> new file mode 100644
> index 0000000000000..4ff3487a99eff
> --- /dev/null
> +++ b/drivers/reset/spacemit/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SPACEMIT
> +	bool
> +
> +config RESET_SPACEMIT_K1
> +	tristate "SpacemiT K1 reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select RESET_SPACEMIT
> +	default ARCH_SPACEMIT
> +	help
> +	  This enables the reset controller driver for the SpacemiT K1 SoC.

Does the size of the K1 specific parts even warrant this per-SoC
Kconfig option? I suggest to only have a user visible tristate
RESET_SPACEMIT option.

> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Mak=
efile
> new file mode 100644
> index 0000000000000..3a064e9d5d6b4
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RESET_SPACEMIT)			+=3D reset_spacemit.o
> +
> +reset_spacemit-y				:=3D core.o
> +
> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+=3D k1.o
> diff --git a/drivers/reset/spacemit/core.c b/drivers/reset/spacemit/core.=
c
> new file mode 100644
> index 0000000000000..5cd981eb3f097
> --- /dev/null
> +++ b/drivers/reset/spacemit/core.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset driver core */
> +
> +#include <linux/container_of.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +#include "core.h"
> +
> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller;
> +	const struct ccu_reset_data *data;
> +	u32 mask;
> +	u32 val;
> +
> +	controller =3D container_of(rcdev, struct ccu_reset_controller, rcdev);
> +	data =3D &controller->data->reset_data[id];
> +	mask =3D data->assert_mask | data->deassert_mask;
> +	val =3D assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> +}
> +
> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, true);
> +}
> +
> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops spacemit_reset_control_ops =3D {
> +	.assert		=3D spacemit_reset_assert,
> +	.deassert	=3D spacemit_reset_deassert,
> +};
> +
> +/**
> + * spacemit_reset_controller_register() - register a reset controller
> + * @dev:	Device that's registering the controller
> + * @controller:	SpacemiT CCU reset controller structure
> + */
> +int spacemit_reset_controller_register(struct device *dev,
> +				       struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev =3D &controller->rcdev;
> +
> +	rcdev->ops =3D &spacemit_reset_control_ops;
> +	rcdev->owner =3D THIS_MODULE;
> +	rcdev->of_node =3D dev->of_node;
> +	rcdev->nr_resets =3D controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> diff --git a/drivers/reset/spacemit/core.h b/drivers/reset/spacemit/core.=
h
> new file mode 100644
> index 0000000000000..a71f835ccb779
> --- /dev/null
> +++ b/drivers/reset/spacemit/core.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* SpacemiT reset driver core */
> +
> +#ifndef __RESET_SPACEMIT_CORE_H__
> +#define __RESET_SPACEMIT_CORE_H__
> +
> +#include <linux/device.h>

This include can be replaced by forward declarations for struct device
and struct regmap.

> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> +	{							\
> +		.offset		=3D (_offset),			\
> +		.assert_mask	=3D (_assert_mask),		\
> +		.deassert_mask	=3D (_deassert_mask),		\
> +	}
> +
> +struct ccu_reset_controller_data {
> +	const struct ccu_reset_data *reset_data;	/* array */
> +	size_t count;
> +};
> +
> +struct ccu_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct ccu_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +extern int spacemit_reset_controller_register(struct device *dev,
> +			      struct ccu_reset_controller *controller);

Drop the extern keyword.

> +
> +#endif /* __RESET_SPACEMIT_CORE_H__ */
> diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
> new file mode 100644
> index 0000000000000..19a34f151b214
> --- /dev/null
> +++ b/drivers/reset/spacemit/k1.c
> @@ -0,0 +1,177 @@
[...]
> +static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev =3D to_spacemit_ccu_adev(adev);
> +	const void *data =3D (void *)id->driver_data;
> +	struct ccu_reset_controller *controller;
> +	struct device *dev =3D &adev->dev;
> +
> +	controller =3D devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENODEV;

-ENOMEM, this is a failed memory allocation.

regards
Philipp
