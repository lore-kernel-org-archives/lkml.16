Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630ED202C5D;
	Tue, 17 Jun 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160689; cv=none; b=FZCDHVek768NHZxDvhN/tD0STBfR/jVKPzI9O+bvSxX3eQ3o8TCyYCSfdZ63eXynXHmGcPs7/pwo3XHimdvqDQ/ifYcdoAbE3t+5GYfysmPVHkOx2rQZHwg26RbTWLH63dJiwWoyE14c3FMX9cIfR7JtnGW2Y+veNiP8pBE9tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160689; c=relaxed/simple;
	bh=hMo47zn5Tyk4OZaFrxAF3FN5fCi7aLHrovnuT0ak3VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLpdsZXoLSXspOQzc3JqKNrCH9vmLGD67EosRY1E+adxr7aA6gUH+lnDVr8Z1IjWJEsp0mJ70+2DYCN5S2rk6y4SeDjLizzK/7eHPjV8/onHDWUyf/aPrPfNCcN1FoMIfwH1FdFvvFExzKCUilEvC/5g0Z+GWzdXzdf7xEbDT1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKvv/xEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKvv/xEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1A9C4CEED;
	Tue, 17 Jun 2025 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160688;
	bh=hMo47zn5Tyk4OZaFrxAF3FN5fCi7aLHrovnuT0ak3VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKvv/xELxMOXEcAbdfOG+LxBnyHDhPUpyHFQqScN+dIgncNYXAPqm8CEepxjEge+n
	 XbBb85Gj/ltNEr48OONNYK8sqjoZFuXE9pYNHcMWEZU3byR0t7bedc6G4POFHJn+b+
	 9uxZzbuYR0dGAQoLZFd4VcIpAqnOz+yv+tvaKT4Sxhkb5voB4Nb4XR3UqPo9IZmXFt
	 WJhuBwpA5PtRhfefGWWE0I4dSpryBxXU5huJMpcpY8xRPAEUp7eYh42VZMbVWA75tE
	 uB5OOEK4wg9IeQWKv1oKwpO2vumRyoI9RlOPJolHgJzh4qnvfUrn1rUwgqzpOHtual
	 PUB13WjK3FPbQ==
Date: Tue, 17 Jun 2025 12:44:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, frank.li@nxp.com,
	ye.li@nxp.com, ping.bai@nxp.com, aisheng.dong@nxp.com
Subject: Re: [PATCH v1 2/2] regulator: pf0900: Add PMIC PF0900 support
Message-ID: <386754b3-8c66-4d20-84ed-87a6052b979f@sirena.org.uk>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-3-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9zsvdg93WU2jbOgA"
Content-Disposition: inline
In-Reply-To: <20250617102025.3455544-3-joy.zou@nxp.com>
X-Cookie: It is your destiny.


--9zsvdg93WU2jbOgA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 17, 2025 at 06:20:25PM +0800, Joy Zou wrote:

> @@ -0,0 +1,1033 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP.
> + * NXP PF0900 pmic driver
> + */
> +

Please make the entire comment block a C++ one so things look more
consistent.

> +static int pf0900_pmic_write(struct pf0900 *pf0900, unsigned int reg,
> +			     unsigned int val, uint8_t mask)
> +{
> +	unsigned int rxBuf;
> +	uint8_t data[2];
> +	int ret;
> +
> +	if (!pf0900 || !pf0900->dev)
> +		return -EINVAL;
> +
> +	if (reg >= PF0900_MAX_REGISTER) {
> +		dev_err(pf0900->dev, "Invalid register address: 0x%x\n", reg);
> +		return -EINVAL;
> +	}
> +
> +	/* If not updating entire register, perform a read-mod-write */
> +	data[0] = val;

Having a write operation that includes update_bits() functionality is a
bit confusing.  In general there's a lot of register I/O code in the
driver, and open coded copies of the generic regulator regmap helpers.
You'd save a lot of code by providing a regmap that implements
reg_read() and reg_write() operations, either stack another regmap
inside for the physical I/O or just use I2C SMBus operations.  You'd
also be able to use a cache then, and you'd get all the regmap
diagnostic infrastructure.

> +static int find_closest_bigger(unsigned int target, const unsigned int *table,
> +			       unsigned int num_sel, unsigned int *sel)

This should not be open coded in a specific driver.

> +static irqreturn_t pf0900_irq_handler(int irq, void *data)
> +{

> +	ret = pf0900_pmic_read(pf0900, PF0900_REG_SYSTEM_INT, &system);
> +	if (ret < 0) {
> +		dev_err(pf0900->dev, "Failed to read SYSTEM_INT(%d)\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	ret = pf0900_pmic_read(pf0900, PF0900_REG_STATUS1_INT, &status1);

This smells a lot like the system interrupt might tell you if there's
any need to read the specific status interrupts?

> +	ret = pf0900_pmic_write(pf0900, PF0900_REG_STATUS1_INT, status1, status1);
> +	if (ret < 0) {
> +		dev_err(pf0900->dev, "Failed to write STATUS1_INT(%d)\n", ret);
> +		return IRQ_NONE;
> +	}

We're unconditionally acking any interrupt we see even if we didn't
understand them, limiting the ability of the genirq core to manage
unknown interrupts.

> +	if (system & IRQ_EWARN)
> +		dev_warn(pf0900->dev, "EWARN interrupt.\n");

It's not clear what this is but it should probably generate a regulator
notification?

> +	if (system & IRQ_GPIO)
> +		dev_warn(pf0900->dev, "GPIO interrupt.\n");

This should be a normal interrupt, though you didn't wire up the GPIOs
as GPIOs.

> +	if (system & IRQ_OV)
> +		dev_warn(pf0900->dev, "OV interrupt.\n");
> +
> +	if (system & IRQ_UV)
> +		dev_warn(pf0900->dev, "UV interrupt.\n");
> +
> +	if (system & IRQ_ILIM)
> +		dev_warn(pf0900->dev, "ILIM interrupt.\n");

These should definitely be generating regulator notifications, as should
some of the others probably (eg, the OV and thermal ones).

--9zsvdg93WU2jbOgA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhRVSsACgkQJNaLcl1U
h9Dp+gf+PaRhc4shJrQNqEou9ev/KFFgCFohnnBFdONzTcLd/wWjsoDQJ8l5SCkJ
KJ+a+ZHCJCmrGt5zZPWEumR1GymcWj9UwiiLoHY53YvWD0K22PXqsVK02mzVpVBB
M80saoU5X0nrsQpgo/qW2VL+OHYSa53eT5v1hof575CET9m3BWtCIZvfEOM9lpVG
sg3p8GJxsKTh7t2FW3cT7C3PwF2QLzsk8NJjWIVSmLCvOMc7S56fwPV/F9NyGatn
o3fQXlAiP42ZeRQ/8EWhmn/p9EHrBL87BompYpfyd6yaVkXD+yEGIWfyGhLy3uPW
Zd2QmO/aPVsr1QlwXyDtdKlp1oTUCQ==
=K+tC
-----END PGP SIGNATURE-----

--9zsvdg93WU2jbOgA--
