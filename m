Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DA2144B7;
	Thu,  8 May 2025 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682736; cv=none; b=lBsB1V+FMd0pqscp/y7CCbweYJrkyLEliyoWvRYsbNM3CYgSoJ/MBiCdwB9enp7cWtpTOfWoV7qrXnW5PD1NxemB1ynEi9dBFvsV41hG69TTFvFfF+a1lz754hREayo7VEl4qBCUdsqyrDKI0rd4hMcT/qNeGJHCifBSQ2MnQO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682736; c=relaxed/simple;
	bh=dDCrl7bkwo/0S+4APKJnm3R6af9SQELqg9M5HZnlgFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUZ6++/Azuf1LfbidN9cvszLJiFGmpSyN+Bo9Bqgq5GG8yww3caNA6BP5z1PklUgN42+s9JdUSj0X0LoGbpXM7FWXMLDu3GJAn4BVniPU1TfWHGEBfUEALEiEySJauvHRpDqq0kgiVs8Nx2e7yTAMFSoPWxEfZ2L79Q04TT7G98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=bnXy1y85; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=1ZCSTR2U; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="bnXy1y85";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="1ZCSTR2U"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 96FA612FB444;
	Wed, 07 May 2025 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746682733; bh=dDCrl7bkwo/0S+4APKJnm3R6af9SQELqg9M5HZnlgFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnXy1y85/b2c9u9GelQ+EWxYmOcP25x/X4mu7n3Hk7WxQvGvHJTEKvMRInDeQGJON
	 CJydroNKSYlW2P7BMVwe/YZsoPToMgaBv1AZQhOe4MJ9rZ2T3YKi3APDRyiStx2jB6
	 8mblpqic/vFCLea7qgCZ8lrUA7iDUqsTZ3cBen8ckgA57SMXpbI2OjUfl/qJA1rV/1
	 Whhf+bHiDao2TW1lh+UJ1ngRYdzfYU9Kp0krWuZA+EOAQhA/IOY6RoqBvAPWCMiBD+
	 A76ndalXqqA/XDH1iao5VF9INz7gn2GDNBBKwSpa1zMapbYS1LlHzKoS4ex+QC1Vpi
	 j0pMZEGkzPzeQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLEJHnSxcwgL; Wed,  7 May 2025 22:38:19 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 7773212FB404;
	Wed, 07 May 2025 22:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746682699; bh=dDCrl7bkwo/0S+4APKJnm3R6af9SQELqg9M5HZnlgFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1ZCSTR2UamB34rz6a0We4Hxm+i7shGD78C0zzsPrCYtO4ElKKXZ5B1r9CyF1Bnwvw
	 3xhCO7GIr8ibHgQMnZKZJwMbIijgOg3JD/gtXWviUPE+cCwYtaKhJcIX8DVs90Z3Av
	 it6iWm2SnKOY3j1fjQ3XUtkJLCPMaKxt6g93++gr1gJa5FqEe761gCbSIYgkX78atw
	 j87r5jc5yIgagwzEmUGRnlzgZY1Vq4E1ENA5TUDStsGuFSrXbCCj70r+5sh8NAS6Si
	 yPuNjkXVh5c7CWQmp0ZAygwvP6ei3Cq2evvtm3qUv7szHCke/dFSTDew6PEkysSGcS
	 q1J5WYq0dbQpA==
Date: Thu, 8 May 2025 05:38:11 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <aBxDQ1_2xJjGlwNf@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-5-elder@riscstar.com>

On Tue, May 06, 2025 at 04:06:35PM -0500, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  The code is structured to
> handle SpacemiT resets generically, while defining the set of specific
> reset controllers and their resets in an SoC-specific source file.  A
> SpacemiT reset controller device is an auxiliary device associated with
> a clock controller (CCU).
> 
> This initial patch defines the reset controllers for the MPMU, APBC, and
> MPMU CCUs, which already defined clock controllers.
> 
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
> 

...

> diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
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

With auxiliary bus introduced, Kconfig entries for both the reset and
clock should select AUXILIARY_BUS, or building defconfig will fail with
undefined references,

        riscv64-unknown-linux-musl-ld: drivers/clk/spacemit/ccu-k1.o: in function `k1_ccu_probe':
        ccu-k1.c:(.text+0x19c): undefined reference to `auxiliary_device_init'
        riscv64-unknown-linux-musl-ld: ccu-k1.c:(.text+0x226): undefined reference to `__auxiliary_device_add'
        riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_init':
        k1.c:(.init.text+0x1a): undefined reference to `__auxiliary_driver_register'
        riscv64-unknown-linux-musl-ld: drivers/reset/spacemit/k1.o: in function `spacemit_k1_reset_driver_exit':
        k1.c:(.exit.text+0x10): undefined reference to `auxiliary_driver_unregister'

> diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
> new file mode 100644
> index 0000000000000..3a064e9d5d6b4
> --- /dev/null
> +++ b/drivers/reset/spacemit/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RESET_SPACEMIT)			+= reset_spacemit.o

As RESET_SPACEMIT is defined as bool, the reset driver will never be
compiled as a module... so either the RESET_SPACEMIT_K1 should be
limited to bool as well or you could take an approach similar to the
clock driver.

> +reset_spacemit-y				:= core.o
> +
> +reset_spacemit-$(CONFIG_RESET_SPACEMIT_K1)	+= k1.o

...

> new file mode 100644
> index 0000000000000..19a34f151b214
> --- /dev/null
> +++ b/drivers/reset/spacemit/k1.c

...

> +MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
> +
> +#undef K1_AUX_DEV_ID
> +
> +static struct auxiliary_driver spacemit_k1_reset_driver = {
> +	.probe          = spacemit_k1_reset_probe,
> +	.id_table       = spacemit_k1_reset_ids,
> +};
> +module_auxiliary_driver(spacemit_k1_reset_driver);
> -- 
> 2.45.2

If you're willing to make the reset driver buildable as a module, please
add MODULE_{LICENSE,DESCRIPTION} statements and possibly also
MODULE_AUTHOR(), or modpost will complain,

	ERROR: modpost: missing MODULE_LICENSE() in drivers/reset/spacemit/reset_spacemit.o
	WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/spacemit/reset_spacemit.o

Best regards,
Haylen Chu
