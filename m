Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13AA3085CE;
	Wed, 18 Jun 2025 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750285055; cv=none; b=fzQfAQbG68XihN6PSXp2xYdvqazDBQpoQ8AqOZ+wzroeFbJPgpUdP3dsZBjEOhX1EjaeXd4mW4i9WZAfQDsWbteI/Iq3S30t2NmcoUlGms5tVyysRJi8a+Q9EU8XB5rVn1+QzK95jmHhs5RqEX5YO+OKABadX7M/q6Pw/mrCtlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750285055; c=relaxed/simple;
	bh=/Ll1Q2+eYgj3jVhhqZsNeoV565p3aJuD8JDZTp0R6AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t161QwrJri/vG87KGZBooLvq8MIaoNTbswQS5Gge2+GvQ6Jdo1OaqQIzDUpD9rS7QW/mdromzW1uNd+qLkSbughoTNRepk1mbZwQlpGP5pclwUv81AnvXeV1L7x/e1ZQrVnbEbDwXNkYrRDDuASWzzoouKdzAm2niTiWdaVwNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewm9XU+1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewm9XU+1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453426170b6so7845865e9.1;
        Wed, 18 Jun 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750285049; x=1750889849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQy2YloKWnlXW5p2ZjPxujl4NM/CLMQmw1ymVkGuAMo=;
        b=ewm9XU+1YI3ZtE8NQCs3FLH6n2tFzLIYDHrtpg2k808pVrEtIapQP0x+MPOpmi5n3Q
         pxipw9EjzC5TCuvWawrvHZzfPxuGXwzd9HVnWzv/tkjujVvtWfhBPRnEU6ZMJcUeJu48
         7dStmJPIe/ZJB3RYZPOWyZJ7pp2zqO0Xk22EKb8AOXhPsu741AwwzySvD8FDm7sIykGb
         NrR0PcF7xeEWDCZzzfzyRELQ+w+WqXJflUuZc2Xj6OBxJmVmQxInVaou/ndM4nR0eOQM
         nJaRmoe3myut+6Uxl1k26eYdfRNU5JI18cMrMdhrPYJ9Kq6boX3FAdy3qv38WWcgt/s5
         RZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750285049; x=1750889849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQy2YloKWnlXW5p2ZjPxujl4NM/CLMQmw1ymVkGuAMo=;
        b=SL5ODHaJSygFwddm8Ltr5FuU91HNisVkhJg+PfujouLTKow36Kv+3Z6has/sAxt+JW
         mdkHRLgFmy/Eh7JaxXQ6Eim8ruTquW8ldkq03kelvehh9vWnXaQ1HsgxodcqwpIssYeO
         PuDwKl2luNYST5JyZhrI7/oN8A8UYBiO9nJyASCNI2aDYGZ7R2ZzKdqXF38oqeGeYGAr
         qVJ3V8wRF6BvYBpHfCDcPghEydIpgMUkAIu09ZJtAA7KUyctOkKKbcdO2LAThmVbOM+3
         U0B4WlM0wlwzveqnV1zbdU5IhCOdOqWh+CMQl836ceqP6rRX22wdQ0SORgl9O84yHRUe
         U1kA==
X-Forwarded-Encrypted: i=1; AJvYcCWTFJv+rSvia2O3om/ed0hbr0yWFy0FunfR5T4eIycXJJllOEJAWcJ+bSS84dWH6RXHeNMvmcYrbZRRftM9@vger.kernel.org, AJvYcCXim75oOZNZzkEr45mknCy2KSxyePDQdR2w3Q+Mp9f4uL+n2NzUCINSgmFFQUCIIVLglkXisd+0HqFL@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdW5/ChPcPbwm8ruEIa2s/oWGQ1A9dbdXnjmpzjPkyljA/IK3
	4VmWg9hWxmsb27SvJTRdlWUlV9PNUHcMi1njXadVZVyEo8ylCz8vag2W
X-Gm-Gg: ASbGncvrPXTVn6lPpOdlEzcNiKAUaPn3QATdVVwYa+jwZ0XcyqLvgDuM5xhwPx7bU4s
	FPUeLB8tNbCEKRvygRGZJ+iJquFPiV4X6z7WBowSgBGATfB9kVAHk+4oSecTEfYDcG0uEoqc2iI
	lvAdlBB1jWvTaQviupY3+All3tXqcB/QDzUsAWprZvxi+qfXeSLKyWAWndnNeozel+dwYAWWaiH
	HovskdYk5pF8YjO5xQPcpr+EiYE6N9HlmvnB8yQo7jTVNSztMYVz8av8Neyp851h+v2zTInTJMq
	1xAGuzfES2GC3RQ+DNcA1XtWTA08gTjuCq20640wROTeZeY41gz0kwE5blGQLQ4FOfuV1JP+T1J
	yBMTXBzpGuDRIr3MdWXlhyg==
X-Google-Smtp-Source: AGHT+IGAJs5rOoNoXuvVz0ApsMRK9wNzEw4ApL8fqYJKn3UJ/fbwhJdq7TDNj1vE6/oqLnGaFnUXgQ==
X-Received: by 2002:a05:600c:5285:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-4535ec8f617mr11991275e9.15.1750285048826;
        Wed, 18 Jun 2025 15:17:28 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:12c1:8801:20af:3ab0:e9d9:22c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b79f45sm17927707f8f.101.2025.06.18.15.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 15:17:28 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:17:26 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <j7chefh364hvw5l3g6dmij45d7ysze23ydruanjnv5jlfykq24@msvelo5g3tm4>
References: <20250618-adi-i3c-master-v3-0-e66170a6cb95@analog.com>
 <20250618-adi-i3c-master-v3-2-e66170a6cb95@analog.com>
 <aFMWSpmXGlk7kjfe@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFMWSpmXGlk7kjfe@lizhi-Precision-Tower-5810>

On Wed, Jun 18, 2025 at 03:40:58PM -0400, Frank Li wrote:
> On Wed, Jun 18, 2025 at 09:16:44AM +0200, Jorge Marques wrote:
> > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > core that supports I3C and I2C devices, multiple speed-grades and
> > I3C IBIs.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  MAINTAINERS                         |    1 +
> >  drivers/i3c/master/Kconfig          |   11 +
> >  drivers/i3c/master/Makefile         |    1 +
> >  drivers/i3c/master/adi-i3c-master.c | 1026 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 1039 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6f56e17dcecf902c6812827c1ec3e067c65e9894..9eb5b6c327590725d1641fd4b73e48fc1d1a3954 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11247,6 +11247,7 @@ I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> >  M:	Jorge Marques <jorge.marques@analog.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > +F:	drivers/i3c/master/adi-i3c-master.c
> >
> >  I3C DRIVER FOR CADENCE I3C MASTER IP
> >  M:	Przemysław Gaj <pgaj@cadence.com>
> > diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> > index 7b30db3253af9d5c6aee6544c060e491bfbeb643..328b7145cdefa20e708ebfa3383e849ce51c5a71 100644
> > --- a/drivers/i3c/master/Kconfig
> > +++ b/drivers/i3c/master/Kconfig
> > @@ -1,4 +1,15 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +config ADI_I3C_MASTER
> > +	tristate "Analog Devices I3C master driver"
> > +	depends on HAS_IOMEM
> > +	help
> > +	  Support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > +	  core that supports I3C and I2C devices, multiple speed-grades and
> > +	  I3C IBIs.
> > +
> > +	  This driver can also be built as a module.  If so, the module
> > +	  will be called adi-i3c-master.
> > +
> >  config CDNS_I3C_MASTER
> >  	tristate "Cadence I3C master driver"
> >  	depends on HAS_IOMEM
> > diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> > index 3e97960160bc85e5eaf2966ec0c3fae458c2711e..6cc4f4b73e7bdc206b68c750390f9c3cc2ccb199 100644
> > --- a/drivers/i3c/master/Makefile
> > +++ b/drivers/i3c/master/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_ADI_I3C_MASTER)		+= adi-i3c-master.o
> >  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> >  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> >  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
> > diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d4e0756efec9588383ac55ca9ea9228368ce767d
> > --- /dev/null
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -0,0 +1,1026 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * I3C Controller driver
> > + * Copyright 2025 Analog Devices Inc.
> > + * Author: Jorge Marques <jorge.marques@analog.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> > +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> > +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))
Hi Frank,
> 
> I suppose that needn't (u32), any warnings report without u32?
> 
Here I will actually remove and use the macros from
linux/fpga/adi-axi-common.h

> > +
> > +#define MAX_DEVS			16
> > +
> > +#define REG_VERSION			0x000
to be replaced removed, and ADI_AXI_REG_VERSION used instead.
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define   REG_IRQ_PENDING_CMDR		BIT(5)
> > +#define   REG_IRQ_PENDING_IBI		((u32)BIT(6))
> 
> needn't u32
In earlier CI runs, I used to get with gcc_x86_64, due to the inversion
~REG_IRQ_PENDING_IBI:

  > conversion from 'long unsigned int' to 'unsigned int' changes value
  > from '18446744073709551615' to '4294967295' [-Werror=overflow]

Couldn't replicate in this patch version, so I will remove.

> > +#define   REG_IRQ_PENDING_DAA		BIT(7)
> 
> Add empty line between registers
> 
Ok
> > +#define REG_CMD_FIFO			0x0d4
> > +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> > +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> > +#define   REG_CMD_FIFO_0_SR		BIT(20)
> > +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> > +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> > +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> > +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> > +#define REG_CMD_FIFO_ROOM		0x0c0
> > +#define REG_CMDR_FIFO			0x0d8
> > +#define   REG_CMDR_FIFO_NO_ERROR	0
> > +#define   REG_CMDR_FIFO_CE0_ERROR	1
> > +#define   REG_CMDR_FIFO_CE2_ERROR	4
> > +#define   REG_CMDR_FIFO_NACK_RESP	6
> > +#define   REG_CMDR_FIFO_UDA_ERROR	8
> > +#define   REG_CMDR_FIFO_ERROR(x)	FIELD_GET(GENMASK(23, 20), (x))
> > +#define   REG_CMDR_FIFO_XFER_BYTES(x)	FIELD_GET(GENMASK(19, 8), (x))
> 
> Sort according bit pos. REG_CMDR_FIFO_XFER_BYTES should before
> REG_CMDR_FIFO_ERROR
> 
Ahh true
> > +#define REG_SDO_FIFO			0x0dc
> > +#define REG_SDO_FIFO_ROOM		0x0c8
> > +#define REG_SDI_FIFO			0x0e0
> > +#define REG_IBI_FIFO			0x0e4
> > +#define REG_FIFO_STATUS			0x0e8
> > +#define   REG_FIFO_STATUS_CMDR_EMPTY	BIT(0)
> > +#define   REG_FIFO_STATUS_IBI_EMPTY	BIT(1)
> > +#define REG_OPS				0x100
> > +#define   REG_OPS_SET_SG(x)		FIELD_PREP(GENMASK(6, 5), (x))
> > +#define   REG_OPS_PP_SG_MASK		GENMASK(6, 5)
> 
> REG_OPS_SET_SG(x) FIELD_PREP(REG_OPS_PP_SG_MASK, (x))
Ack.
> 
> > +#define REG_IBI_CONFIG			0x140
> > +#define   REG_IBI_CONFIG_LISTEN		BIT(1)
> > +#define   REG_IBI_CONFIG_ENABLE		BIT(0)
> 
> sort it. keep consisent in whole file, from 0->31 or 31->0
> 
Ack, decrementing
> > +#define REG_DEV_CHAR			0x180
> > +#define   REG_DEV_CHAR_IS_I2C		BIT(0)
> > +#define   REG_DEV_CHAR_IS_ATTACHED	BIT(1)
> > +#define   REG_DEV_CHAR_BCR_IBI(x)	(((x) & GENMASK(2, 1)) << 1)
> 
> FIELD_PREP()
Ok, I will remove the simplification and make it clearer by setting

     #define   REG_DEV_CHAR_BCR_IBI(x)       FIELD_PREP(GENMASK(3, 2), (x))

Then usage:

     #include <linux/i3c/device.h>
     ...
     bcr_ibi = FIELD_GET(I3C_BCR_IBI_PAYLOAD | I3C_BCR_IBI_REQ_CAP, (i3cdev->info.bcr));
     ...REG_DEV_CHAR_BCR_IBI(bcr_ibi)...;

> 
> > +#define   REG_DEV_CHAR_WEN		BIT(8)
> > +#define   REG_DEV_CHAR_ADDR(x)		FIELD_PREP(GENMASK(15, 9), (x))
> > +
> > +enum speed_grade {PP_SG_UNSET, PP_SG_1MHZ, PP_SG_3MHZ, PP_SG_6MHZ, PP_SG_12MHZ};
> > +struct adi_i3c_cmd {
> > +	u32 cmd0;
> > +	u32 cmd1;
> > +	u32 tx_len;
> > +	const void *tx_buf;
> > +	u32 rx_len;
> > +	void *rx_buf;
> > +	u32 error;
> > +};
> > +
> > +struct adi_i3c_xfer {
> > +	struct list_head node;
> > +	struct completion comp;
> > +	int ret;
> > +	unsigned int ncmds;
> > +	unsigned int ncmds_comp;
> > +	struct adi_i3c_cmd cmds[];
> > +};
> > +
> > +struct adi_i3c_master {
> > +	struct i3c_master_controller base;
> > +	u32 free_rr_slots;
> > +	unsigned int maxdevs;
> > +	struct {
> > +		unsigned int num_slots;
> > +		struct i3c_dev_desc **slots;
> > +		spinlock_t lock; /* Protect IBI slot access */
> > +	} ibi;
> > +	struct {
> > +		struct list_head list;
> > +		struct adi_i3c_xfer *cur;
> > +		spinlock_t lock; /* Protect transfer */
> > +	} xferqueue;
> > +	void __iomem *regs;
> > +	struct clk *clk;
> > +	unsigned long i3c_scl_lim;
> > +	struct {
> > +		u8 addrs[MAX_DEVS];
> > +		u8 index;
> > +	} daa;
> > +};
> > +
> > +static inline struct adi_i3c_master *to_adi_i3c_master(struct i3c_master_controller *master)
> > +{
> > +	return container_of(master, struct adi_i3c_master, base);
> > +}
> > +
> > +static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
> > +					 const u8 *bytes, unsigned int nbytes)
> > +{
> > +	unsigned int n, m;
> > +	u32 tmp;
> > +
> > +	n = readl(master->regs + REG_SDO_FIFO_ROOM);
> > +	m = min(n, nbytes);
> > +	writesl(master->regs + REG_SDO_FIFO, bytes, m / 4);
> > +
> > +	if (m & 3) {
> > +		memcpy(&tmp, bytes + (m & ~3), m & 3);
> > +		writel(tmp, master->regs + REG_SDO_FIFO);
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> > +					   u8 *bytes, unsigned int nbytes)
> > +{
> > +	readsl(master->regs + REG_SDI_FIFO, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		tmp = readl(master->regs + REG_SDI_FIFO);
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
> 
> can you move above two helper function as inline into drivers/i3c/internals.h
> 
> or create new one drivers/i3c/master/helper.h or other naming.
> 
> Renesas IP have similar above two functions to access FIFO.
> https://lore.kernel.org/linux-i3c/174964724485.330045.2181706921272138816.robh@kernel.org/T/#t
> 
Ok, yes that's common because the passes type u8 doesn't ensure
multiples of 32 at least. Added to my TODO list.
> > +
> > +static bool adi_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> > +					    const struct i3c_ccc_cmd *cmd)
> > +{
> > +	if (cmd->ndests > 1)
> > +		return false;
> > +
> > +	switch (cmd->id) {
> > +	case I3C_CCC_ENEC(true):
> > +	case I3C_CCC_ENEC(false):
> > +	case I3C_CCC_DISEC(true):
> > +	case I3C_CCC_DISEC(false):
> > +	case I3C_CCC_RSTDAA(true):
> > +	case I3C_CCC_RSTDAA(false):
> > +	case I3C_CCC_ENTDAA:
> > +	case I3C_CCC_SETDASA:
> > +	case I3C_CCC_SETNEWDA:
> > +	case I3C_CCC_GETMWL:
> > +	case I3C_CCC_GETMRL:
> > +	case I3C_CCC_GETPID:
> > +	case I3C_CCC_GETBCR:
> > +	case I3C_CCC_GETDCR:
> > +	case I3C_CCC_GETSTATUS:
> > +	case I3C_CCC_GETHDRCAP:
> > +		return true;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static int adi_i3c_master_disable(struct adi_i3c_master *master)
> > +{
> > +	writel(0, master->regs + REG_IBI_CONFIG);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct adi_i3c_xfer *adi_i3c_master_alloc_xfer(struct adi_i3c_master *master,
> > +						      unsigned int ncmds)
> > +{
> > +	struct adi_i3c_xfer *xfer;
> > +
> > +	xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> > +	if (!xfer)
> > +		return NULL;
> > +
> > +	INIT_LIST_HEAD(&xfer->node);
> > +	xfer->ncmds = ncmds;
> > +	xfer->ret = -ETIMEDOUT;
> > +
> > +	return xfer;
> > +}
> > +
> > +static void adi_i3c_master_start_xfer_locked(struct adi_i3c_master *master)
> > +{
> > +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> > +	unsigned int i, n, m;
> > +
> > +	if (!xfer)
> > +		return;
> > +
> > +	for (i = 0; i < xfer->ncmds; i++) {
> > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > +
> > +		if (!(cmd->cmd0 & REG_CMD_FIFO_0_RNW))
> > +			adi_i3c_master_wr_to_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
> > +	}
> > +
> > +	n = readl(master->regs + REG_CMD_FIFO_ROOM);
> > +	for (i = 0; i < xfer->ncmds; i++) {
> > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > +
> > +		m = cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC ? 2 : 1;
> > +		if (m > n)
> > +			break;
> > +		writel(cmd->cmd0, master->regs + REG_CMD_FIFO);
> > +		if (cmd->cmd0 & REG_CMD_FIFO_0_IS_CCC)
> > +			writel(cmd->cmd1, master->regs + REG_CMD_FIFO);
> > +		n -= m;
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
> > +					   u32 pending)
> > +{
> > +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> > +	int i, ret = 0;
> > +	u32 status0;
> > +
> > +	if (!xfer)
> > +		return;
> > +
> > +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> > +	     !(status0 & REG_FIFO_STATUS_CMDR_EMPTY);
> > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> 
> how about
> 
> while (!(readl(master->regs + REG_FIFO_STATUS) & REG_FIFO_STATUS_CMDR_EMPTY))) {
> 
Ack, thanks!
Same for 'REG_FIFO_STATUS_IBI_EMPTY for'.
> > +		struct adi_i3c_cmd *cmd;
> > +		u32 cmdr, rx_len;
> > +
> > +		cmdr = readl(master->regs + REG_CMDR_FIFO);
> > +
> > +		cmd = &xfer->cmds[xfer->ncmds_comp++];
> > +		if (cmd->cmd0 & REG_CMD_FIFO_0_RNW) {
> > +			rx_len = min_t(u32, REG_CMDR_FIFO_XFER_BYTES(cmdr), cmd->rx_len);
> > +			adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> > +		}
> > +		cmd->error = REG_CMDR_FIFO_ERROR(cmdr);
> > +	}
> > +
> > +	for (i = 0; i < xfer->ncmds; i++) {
> 
> I think you iterate to ncmds_comp?
> 
You are correct thanks! Each command yields a command receipt interrupt.
> > +		switch (xfer->cmds[i].error) {
> > +		case REG_CMDR_FIFO_NO_ERROR:
> > +			break;
> > +
> > +		case REG_CMDR_FIFO_CE0_ERROR:
> > +		case REG_CMDR_FIFO_CE2_ERROR:
> > +		case REG_CMDR_FIFO_NACK_RESP:
> > +		case REG_CMDR_FIFO_UDA_ERROR:
> > +			ret = -EIO;
> > +			break;
> > +
> > +		default:
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +	}
> > +
> > +	xfer->ret = ret;
> > +
> > +	if (xfer->ncmds_comp != xfer->ncmds)
> > +		return;
> > +
> > +	complete(&xfer->comp);
> > +
> > +	xfer = list_first_entry_or_null(&master->xferqueue.list,
> > +					struct adi_i3c_xfer, node);
> > +	if (xfer)
> > +		list_del_init(&xfer->node);
> > +
> > +	master->xferqueue.cur = xfer;
> > +	adi_i3c_master_start_xfer_locked(master);
> > +}
> > +
> > +static void adi_i3c_master_queue_xfer(struct adi_i3c_master *master,
> > +				      struct adi_i3c_xfer *xfer)
> > +{
> > +	init_completion(&xfer->comp);
> > +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > +	if (master->xferqueue.cur) {
> > +		list_add_tail(&xfer->node, &master->xferqueue.list);
> > +	} else {
> > +		master->xferqueue.cur = xfer;
> > +		adi_i3c_master_start_xfer_locked(master);
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_unqueue_xfer(struct adi_i3c_master *master,
> > +					struct adi_i3c_xfer *xfer)
> > +{
> > +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > +	if (master->xferqueue.cur == xfer)
> > +		master->xferqueue.cur = NULL;
> > +	else
> > +		list_del_init(&xfer->node);
> > +
> > +	writel(0x01, master->regs + REG_ENABLE);
> > +	writel(0x00, master->regs + REG_ENABLE);
> > +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> > +}
> > +
> > +static enum i3c_error_code adi_i3c_cmd_get_err(struct adi_i3c_cmd *cmd)
> > +{
> > +	switch (cmd->error) {
> > +	case REG_CMDR_FIFO_CE0_ERROR:
> > +		return I3C_ERROR_M0;
> > +
> > +	case REG_CMDR_FIFO_CE2_ERROR:
> > +	case REG_CMDR_FIFO_NACK_RESP:
> > +		return I3C_ERROR_M2;
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return I3C_ERROR_UNKNOWN;
> > +}
> > +
> > +static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> > +				       struct i3c_ccc_cmd *cmd)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_xfer *xfer;
> > +	struct adi_i3c_cmd *ccmd;
> > +
> > +	xfer = adi_i3c_master_alloc_xfer(master, 1);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	ccmd = xfer->cmds;
> > +	ccmd->cmd1 = REG_CMD_FIFO_1_CCC(cmd->id);
> > +	ccmd->cmd0 = REG_CMD_FIFO_0_IS_CCC |
> > +		     REG_CMD_FIFO_0_LEN(cmd->dests[0].payload.len);
> > +
> > +	if (cmd->id & I3C_CCC_DIRECT)
> > +		ccmd->cmd0 |= REG_CMD_FIFO_0_DEV_ADDR(cmd->dests[0].addr);
> > +
> > +	if (cmd->rnw) {
> > +		ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > +		ccmd->rx_buf = cmd->dests[0].payload.data;
> > +		ccmd->rx_len = cmd->dests[0].payload.len;
> > +	} else {
> > +		ccmd->tx_buf = cmd->dests[0].payload.data;
> > +		ccmd->tx_len = cmd->dests[0].payload.len;
> > +	}
> > +
> > +	adi_i3c_master_queue_xfer(master, xfer);
> > +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > +
> > +	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
> > +	kfree(xfer);
> 
> you can use
> struct adi_i3c_xfer *xfer __free(kfree) = NULL;
> 
>  to simple code.
> 
Ah cool, will use in all xfer instances.
> > +
> > +	return 0;
> > +}
> > +
> > +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > +				     struct i3c_priv_xfer *xfers,
> > +				     int nxfers)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_xfer *xfer;
> > +	int i, ret;
> > +
> > +	if (!nxfers)
> > +		return 0;
> 
> add an empty line.
> 
Ack.
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > +
> > +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(dev->info.dyn_addr);
> > +
> > +		if (xfers[i].rnw) {
> > +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > +			ccmd->rx_buf = xfers[i].data.in;
> > +			ccmd->rx_len = xfers[i].len;
> > +		} else {
> > +			ccmd->tx_buf = xfers[i].data.out;
> > +			ccmd->tx_len = xfers[i].len;
> > +		}
> > +
> > +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);
> > +
> > +		if (i < nxfers - 1)
> > +			ccmd->cmd0 |= REG_CMD_FIFO_0_SR;
> > +
> > +		if (!i)
> > +			ccmd->cmd0 |= REG_CMD_FIFO_0_BCAST;
> > +	}
> > +
> > +	adi_i3c_master_queue_xfer(master, xfer);
> > +	if (!wait_for_completion_timeout(&xfer->comp,
> > +					 msecs_to_jiffies(1000)))
> > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > +
> > +	ret = xfer->ret;
> > +
> > +	for (i = 0; i < nxfers; i++)
> > +		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> > +
> > +	kfree(xfer);
> > +
> > +	return ret;
> > +}
> > +
> > +struct adi_i3c_i2c_dev_data {
> > +	u16 id;
> > +	s16 ibi;
> > +	struct i3c_generic_ibi_pool *ibi_pool;
> > +};
> > +
> > +static int adi_i3c_master_get_rr_slot(struct adi_i3c_master *master,
> > +				      u8 dyn_addr)
> > +{
> > +	if (!master->free_rr_slots)
> > +		return -ENOSPC;
> > +
> > +	return ffs(master->free_rr_slots) - 1;
> > +}
> > +
> > +static int adi_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 dyn_addr)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	u8 addr;
> > +
> > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > +
> > +	writel(REG_DEV_CHAR_ADDR(dyn_addr), master->regs + REG_DEV_CHAR);
> > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	return 0;
> > +}
> > +
> > +static int adi_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data;
> > +	int slot;
> > +	u8 addr;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	slot = adi_i3c_master_get_rr_slot(master, dev->info.dyn_addr);
> > +	if (slot < 0) {
> > +		kfree(data);
> > +		return slot;
> > +	}
> > +
> > +	data->ibi = -1;
> 
> why -1 here?
> 
Doesn't mean much, just stores the ibi slot occupied by the device.
NULL would be position 0 of the array.
It can be left uninitialized and not cleaned-up when removed.
> > +	data->id = slot;
> > +	i3c_dev_set_master_data(dev, data);
> > +	master->free_rr_slots &= ~BIT(slot);
> > +
> > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > +
> > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > +	       REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	return 0;
> > +}
> > +
> > +static void adi_i3c_master_sync_dev_char(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct i3c_dev_desc *i3cdev;
> > +	u8 addr;
> > +
> > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > +		addr = i3cdev->info.dyn_addr ?
> > +		       i3cdev->info.dyn_addr : i3cdev->info.static_addr;
> > +		writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +		writel(readl(master->regs + REG_DEV_CHAR) |
> > +		       REG_DEV_CHAR_BCR_IBI(i3cdev->info.bcr) | REG_DEV_CHAR_WEN,
> > +		       master->regs + REG_DEV_CHAR);
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > +	u8 addr;
> > +
> > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > +
> > +	writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > +		~REG_DEV_CHAR_IS_ATTACHED) | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	i3c_dev_set_master_data(dev, NULL);
> > +	master->free_rr_slots |= BIT(data->id);
> > +	kfree(data);
> > +}
> > +
> > +static int adi_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data;
> > +	int slot;
> > +
> > +	slot = adi_i3c_master_get_rr_slot(master, 0);
> > +	if (slot < 0)
> > +		return slot;
> > +
> > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->id = slot;
> > +	master->free_rr_slots &= ~BIT(slot);
> > +	i2c_dev_set_master_data(dev, data);
> > +
> > +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> > +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_IS_ATTACHED | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	return 0;
> > +}
> > +
> > +static void adi_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> > +
> > +	writel(REG_DEV_CHAR_ADDR(dev->addr) |
> > +	       REG_DEV_CHAR_IS_I2C | REG_DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	i2c_dev_set_master_data(dev, NULL);
> > +	master->free_rr_slots |= BIT(data->id);
> > +	kfree(data);
> > +}
> > +
> > +static void adi_i3c_master_bus_cleanup(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +
> > +	adi_i3c_master_disable(master);
> > +}
> > +
> > +static void adi_i3c_master_upd_i3c_scl_lim(struct adi_i3c_master *master)
> > +{
> > +	struct i3c_master_controller *m = &master->base;
> > +	struct i3c_bus *bus = i3c_master_get_bus(m);
> > +	u8 i3c_scl_lim = 0;
> > +	struct i3c_dev_desc *dev;
> > +	u8 pp_sg;
> > +
> > +	i3c_bus_for_each_i3cdev(bus, dev) {
> > +		u8 max_fscl;
> > +
> > +		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
> > +			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
> > +
> > +		switch (max_fscl) {
> > +		case I3C_SDR1_FSCL_8MHZ:
> > +			max_fscl = PP_SG_6MHZ;
> > +			break;
> > +		case I3C_SDR2_FSCL_6MHZ:
> > +			max_fscl = PP_SG_3MHZ;
> > +			break;
> > +		case I3C_SDR3_FSCL_4MHZ:
> > +			max_fscl = PP_SG_3MHZ;
> > +			break;
> > +		case I3C_SDR4_FSCL_2MHZ:
> > +			max_fscl = PP_SG_1MHZ;
> > +			break;
> > +		case I3C_SDR0_FSCL_MAX:
> > +		default:
> > +			max_fscl = PP_SG_12MHZ;
> > +			break;
> > +		}
> > +
> > +		if (max_fscl &&
> > +		    (i3c_scl_lim > max_fscl || !i3c_scl_lim))
> > +			i3c_scl_lim = max_fscl;
> > +	}
> > +
> > +	if (!i3c_scl_lim)
> > +		return;
> > +
> > +	master->i3c_scl_lim = i3c_scl_lim - 1;
> > +
> > +	pp_sg = readl(master->regs + REG_OPS) & ~REG_OPS_PP_SG_MASK;
> > +	pp_sg |= REG_OPS_SET_SG(master->i3c_scl_lim);
> > +
> > +	writel(pp_sg, master->regs + REG_OPS);
> > +}
> > +
> > +static void adi_i3c_master_get_features(struct adi_i3c_master *master,
> > +					unsigned int slot,
> > +					struct i3c_device_info *info)
> > +{
> > +	memset(info, 0, sizeof(*info));
> > +
> > +	info->dyn_addr = 0x31;
> 
> master address is hardcode?
> 
Yes.
There is/was no register to read it from because the controller does not
support secondary mastership or changing role, so this address is not
used for anything (as is). Since it is odd, I will move add these
hardcoded values to the register map (read-only), still won't do
anything.
> > +	info->dcr = 0x00;
> > +	info->bcr = 0x40;
> > +	info->pid = 0;
> > +}
> > +
> > +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	u32 irq_mask;
> > +	int ret, addr;
> > +
> > +	addr = 0x8;
> > +	for (u8 i = 0; i < MAX_DEVS; i++) {
> > +		addr = i3c_master_get_free_addr(m, addr);
> > +		if (addr < 0)
> > +			return addr;
> 
> assume MAX_DEVS 128, if only get 4 address, suppose you should enumerate
> for such 4 devices, instead of return error and give up do_daa.
> 
The IP Core supports just 16 devices (max # on the bus), so it should
not run-out of addresses, but I understand the assignment. As is, the IP
core has 16 slots and will only terminate the DAA from its side if it
run out of slots (if no device request an address (NACK bit), the DAA is
also terminated). Not writing a DA during the DA IRQ will just hang the
bus.

For the suggestion to work I need to re-read the spec and rework the RTL
to allow this early termination. However, I am currently a little
opposed of changing the RTL beyond basic read-only registers
modifications.
> > +		master->daa.addrs[i] = addr;
> > +	}
> > +
> > +	irq_mask = readl(master->regs + REG_IRQ_MASK);
> > +	writel(irq_mask | REG_IRQ_PENDING_DAA,
> > +	       master->regs + REG_IRQ_MASK);
> > +
> > +	master->daa.index = 0;
> > +	ret = i3c_master_entdaa_locked(&master->base);
> > +
> > +	writel(irq_mask, master->regs + REG_IRQ_MASK);
> > +
> > +	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> > +	if (ret && ret != I3C_ERROR_M2)
> > +		return ret;
> > +
> > +	/* Add I3C devices discovered */
> > +	for (u8 i = 0; i < master->daa.index; i++)
> > +		i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> > +	/* Sync retrieved devs info with the IP */
> > +	adi_i3c_master_sync_dev_char(m);
> > +
> > +	i3c_master_defslvs_locked(&master->base);
> > +
> > +	adi_i3c_master_upd_i3c_scl_lim(master);
> > +
> > +	return 0;
> > +}
> > +
> > +static int adi_i3c_master_bus_init(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct i3c_device_info info = { };
> > +	int ret;
> > +
> > +	ret = i3c_master_get_free_addr(m, 0);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	adi_i3c_master_get_features(master, 0, &info);
> > +	ret = i3c_master_set_info(&master->base, &info);
> > +	if (ret)
> > +		return ret;
> > +
> > +	writel(REG_IBI_CONFIG_LISTEN,
> > +	       master->regs + REG_IBI_CONFIG);
> > +
> > +	return 0;
> > +}
> > +
> > +static void adi_i3c_master_handle_ibi(struct adi_i3c_master *master,
> > +				      u32 ibi)
> > +{
> > +	struct adi_i3c_i2c_dev_data *data;
> > +	struct i3c_ibi_slot *slot;
> > +	struct i3c_dev_desc *dev;
> > +	u8 da, id;
> > +	u8 *mdb;
> > +
> > +	da = (ibi >> 17) & GENMASK(6, 0);
> > +	for (id = 0; id < master->ibi.num_slots; id++) {
> > +		if (master->ibi.slots[id] &&
> > +		    master->ibi.slots[id]->info.dyn_addr == da)
> > +			break;
> > +	}
> > +
> > +	if (id == master->ibi.num_slots)
> > +		return;
> > +
> > +	dev = master->ibi.slots[id];
> > +	guard(spinlock)(&master->ibi.lock);
> > +
> > +	data = i3c_dev_get_master_data(dev);
> > +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > +	if (!slot)
> > +		return;
> > +
> > +	mdb = slot->data;
> > +	mdb[0] = (ibi >> 8) & GENMASK(7, 0);
> > +
> > +	slot->len = 1;
> > +	i3c_master_queue_ibi(dev, slot);
> > +}
> > +
> > +static void adi_i3c_master_demux_ibis(struct adi_i3c_master *master)
> > +{
> > +	u32 status0;
> > +
> > +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> > +	     !(status0 & REG_FIFO_STATUS_IBI_EMPTY);
> > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> 
> use while()
> 
Ack.
> > +		u32 ibi = readl(master->regs + REG_IBI_FIFO);
> > +
> > +		adi_i3c_master_handle_ibi(master, ibi);
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
> > +{
> > +	u8 payload0[8];
> > +	u32 addr;
> > +
> > +	/* Clear device characteristics */
> > +	adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
> > +	addr = master->daa.addrs[master->daa.index++];
> > +	addr = (addr << 1) | (parity8(addr) ? 0 : 1);
> > +
> > +	writel(addr, master->regs + REG_SDO_FIFO);
> > +}
> > +
> > +static irqreturn_t adi_i3c_master_irq(int irq, void *data)
> > +{
> > +	struct adi_i3c_master *master = data;
> > +	u32 pending;
> > +
> > +	pending = readl(master->regs + REG_IRQ_PENDING);
> > +	writel(pending, master->regs + REG_IRQ_PENDING);
> 
> Add an empty line here
> 
Ack.
> > +	if (pending & REG_IRQ_PENDING_CMDR) {
> > +		spin_lock(&master->xferqueue.lock);
> > +		adi_i3c_master_end_xfer_locked(master, pending);
> > +		spin_unlock(&master->xferqueue.lock);
> 
> you use guard, keep consisent, use guard or scoped_guard here
> 
scoped_guard
> > +	}
> > +	if (pending & REG_IRQ_PENDING_IBI)
> > +		adi_i3c_master_demux_ibis(master);
> > +	if (pending & REG_IRQ_PENDING_DAA)
> > +		adi_i3c_master_handle_da_req(master);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> > +				    struct i2c_msg *xfers,
> > +				    int nxfers)
> > +{
> > +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_xfer *xfer;
> > +	int i, ret;
> > +
> > +	if (!nxfers)
> > +		return 0;
> > +	for (i = 0; i < nxfers; i++) {
> > +		if (xfers[i].flags & I2C_M_TEN)
> > +			return -EOPNOTSUPP;
> > +	}
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > +
> > +		ccmd->cmd0 = REG_CMD_FIFO_0_DEV_ADDR(xfers[i].addr);
> > +
> > +		if (xfers[i].flags & I2C_M_RD) {
> > +			ccmd->cmd0 |= REG_CMD_FIFO_0_RNW;
> > +			ccmd->rx_buf = xfers[i].buf;
> > +			ccmd->rx_len = xfers[i].len;
> > +		} else {
> > +			ccmd->tx_buf = xfers[i].buf;
> > +			ccmd->tx_len = xfers[i].len;
> > +		}
> > +
> > +		ccmd->cmd0 |= REG_CMD_FIFO_0_LEN(xfers[i].len);
> 
> Just curiouse
> What's happen if IBI happen (address arbitrate) at first command?
> 
The controller does the state machine for the IBI and yield a IBIR
interrupt, then proceeds with the xfer, yielding the CMDR for each CMD.
> > +	}
> > +
> > +	adi_i3c_master_queue_xfer(master, xfer);
> > +	if (!wait_for_completion_timeout(&xfer->comp,
> > +					 m->i2c.timeout))
> > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > +
> > +	ret = xfer->ret;
> > +	kfree(xfer);
> > +	return ret;
> > +}
> > +
> > +static int adi_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct i3c_dev_desc *i3cdev;
> > +	u32 enabled = 0;
> > +	int ret;
> > +
> > +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> > +				      I3C_CCC_EVENT_SIR);
> > +
> > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > +		if (dev != i3cdev && i3cdev->ibi)
> > +			enabled |= i3cdev->ibi->enabled;
> > +	}
> > +	if (!enabled) {
> > +		writel(REG_IBI_CONFIG_LISTEN,
> > +		       master->regs + REG_IBI_CONFIG);
> > +		writel(readl(master->regs + REG_IRQ_MASK) & ~REG_IRQ_PENDING_IBI,
> > +		       master->regs + REG_IRQ_MASK);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int adi_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +
> > +	writel(REG_IBI_CONFIG_LISTEN | REG_IBI_CONFIG_ENABLE,
> > +	       master->regs + REG_IBI_CONFIG);
> > +
> > +	writel(readl(master->regs + REG_IRQ_MASK) | REG_IRQ_PENDING_IBI,
> > +	       master->regs + REG_IRQ_MASK);
> > +
> > +	return i3c_master_enec_locked(m, dev->info.dyn_addr,
> > +				      I3C_CCC_EVENT_SIR);
> > +}
> > +
> > +static int adi_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> > +				      const struct i3c_ibi_setup *req)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data;
> > +	unsigned long flags;
> > +	unsigned int i;
> > +
> > +	data = i3c_dev_get_master_data(dev);
> > +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> > +	if (IS_ERR(data->ibi_pool))
> > +		return PTR_ERR(data->ibi_pool);
> > +
> > +	spin_lock_irqsave(&master->ibi.lock, flags);
> > +	for (i = 0; i < master->ibi.num_slots; i++) {
> > +		if (!master->ibi.slots[i]) {
> > +			data->ibi = i;
> > +			master->ibi.slots[i] = dev;
> > +			break;
> > +		}
> > +	}
> > +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> 
> same here, use scope_guard to keep consistent.
> 
Ack.
> > +
> > +	if (i < master->ibi.num_slots)
> > +		return 0;
> > +
> > +	i3c_generic_ibi_free_pool(data->ibi_pool);
> > +	data->ibi_pool = NULL;
> > +
> > +	return -ENOSPC;
> > +}
> > +
> > +static void adi_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&master->ibi.lock, flags);
> > +	master->ibi.slots[data->ibi] = NULL;
> > +	data->ibi = -1;
> > +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> > +
> > +	i3c_generic_ibi_free_pool(data->ibi_pool);
> > +}
> > +
> > +static void adi_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> > +					    struct i3c_ibi_slot *slot)
> > +{
> > +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> > +
> > +	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> > +}
> > +
> > +static const struct i3c_master_controller_ops adi_i3c_master_ops = {
> > +	.bus_init = adi_i3c_master_bus_init,
> > +	.bus_cleanup = adi_i3c_master_bus_cleanup,
> > +	.attach_i3c_dev = adi_i3c_master_attach_i3c_dev,
> > +	.reattach_i3c_dev = adi_i3c_master_reattach_i3c_dev,
> > +	.detach_i3c_dev = adi_i3c_master_detach_i3c_dev,
> > +	.attach_i2c_dev = adi_i3c_master_attach_i2c_dev,
> > +	.detach_i2c_dev = adi_i3c_master_detach_i2c_dev,
> > +	.do_daa = adi_i3c_master_do_daa,
> > +	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
> > +	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
> > +	.priv_xfers = adi_i3c_master_priv_xfers,
> > +	.i2c_xfers = adi_i3c_master_i2c_xfers,
> > +	.request_ibi = adi_i3c_master_request_ibi,
> > +	.enable_ibi = adi_i3c_master_enable_ibi,
> > +	.disable_ibi = adi_i3c_master_disable_ibi,
> > +	.free_ibi = adi_i3c_master_free_ibi,
> > +	.recycle_ibi_slot = adi_i3c_master_recycle_ibi_slot,
> > +};
> > +
> > +static const struct of_device_id adi_i3c_master_of_match[] = {
> > +	{ .compatible = "adi,i3c-master" },
> > +	{}
> > +};
> > +
> > +static int adi_i3c_master_probe(struct platform_device *pdev)
> > +{
> > +	struct adi_i3c_master *master;
> > +	unsigned int version;
> > +	int ret, irq;
> > +
> > +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> > +	if (!master)
> > +		return -ENOMEM;
> > +
> > +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(master->regs))
> > +		return PTR_ERR(master->regs);
> > +
> > +	master->clk = devm_clk_get_enabled(&pdev->dev, "axi");
> > +	if (IS_ERR(master->clk))
> > +		return PTR_ERR(master->clk);
> 
> you have optional clock i3c, not use it in driver?
> 
It is not used in the driver indeed, it describes how the IP Core is
compiled and wired, but doesn't affect the logic in the driver itself.
The RTL logic is always driven by a 100MHz clock, and the source is
either axi or i3c, if the latter present.
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	version = readl(master->regs + REG_VERSION);
> > +	if (VERSION_MAJOR(version) != 0) {
> > +		dev_err(&pdev->dev, "Unsupported IP version %u.%u.%c\n",
> > +			VERSION_MAJOR(version),
> > +			VERSION_MINOR(version),
> > +			VERSION_PATCH(version));
> > +		return -EINVAL;
> 
> return dev_err_probe();
Ack.
> 
> Frank
Best regards,
Jorge
> > +	}
> > +
> > +	writel(0x00, master->regs + REG_ENABLE);
> > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > +
> > +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> > +			       dev_name(&pdev->dev), master);
> > +	if (ret)
> > +		return ret;
> > +
> > +	platform_set_drvdata(pdev, master);
> > +
> > +	master->maxdevs = MAX_DEVS;
> > +	master->free_rr_slots = GENMASK(master->maxdevs, 1);
> > +
> > +	writel(REG_IRQ_PENDING_CMDR, master->regs + REG_IRQ_MASK);
> > +
> > +	spin_lock_init(&master->ibi.lock);
> > +	master->ibi.num_slots = 15;
> > +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> > +					 sizeof(*master->ibi.slots),
> > +					 GFP_KERNEL);
> > +	if (!master->ibi.slots)
> > +		return -ENOMEM;
> > +
> > +	return i3c_master_register(&master->base, &pdev->dev,
> > +				   &adi_i3c_master_ops, false);
> > +}
> > +
> > +static void adi_i3c_master_remove(struct platform_device *pdev)
> > +{
> > +	struct adi_i3c_master *master = platform_get_drvdata(pdev);
> > +
> > +	writel(0xff, master->regs + REG_IRQ_PENDING);
> > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > +	writel(0x01, master->regs + REG_ENABLE);
> > +
> > +	i3c_master_unregister(&master->base);
> > +}
> > +
> > +static struct platform_driver adi_i3c_master = {
> > +	.probe = adi_i3c_master_probe,
> > +	.remove = adi_i3c_master_remove,
> > +	.driver = {
> > +		.name = "adi-i3c-master",
> > +		.of_match_table = adi_i3c_master_of_match,
> > +	},
> > +};
> > +module_platform_driver(adi_i3c_master);
> > +
> > +MODULE_AUTHOR("Jorge Marques <jorge.marques@analog.com>");
> > +MODULE_DESCRIPTION("Analog Devices I3C master driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.49.0
> >
