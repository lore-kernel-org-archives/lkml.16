Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947181724;
	Fri,  6 Jun 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204308; cv=none; b=SXycvI0XPNXhTzuXcPX2D6FysWitS/OQKsjmKWg+iHJU3kS5RjE85b2OIuiUvFRwAl9Kdx8s0p3VZHuVDX1ibHRGaj7fs4oA+uLgAaEpm+ZZlJKWWEckw3zppy47enrdRDcKRhotM/nDc4Ee5+o21fDG5jUFN2TbMVEh/keAJ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204308; c=relaxed/simple;
	bh=zg31OCNDujZUAqHixJFKbfF9+ZIcCZFGjjRq/8K4wso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT//uUgb9LErB8HA3N3d4CRlDtP0dkZKoTMThsGSJFeQAO552gP2aBeTwHZqCYVHh6Ff7RW1DDuAe/UlKTVdEBw+b1YGRMk3dSB2UBxBk+3EX6Xn12Ye+D2yg931IahNeCM0/d5SDvWcUesqkR63rrg5iLgRkJLCrlZQKzlwm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sdd1t3xB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sdd1t3xB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad89f9bb725so358217366b.2;
        Fri, 06 Jun 2025 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204303; x=1749809103; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhpYN2L+e8ZOlXdHKAWYCgXLcomAnicmHPGk6SGwhY0=;
        b=Sdd1t3xBoKvjwdP6LZ5yJOEGEKXRjScbv/VVDdvrIsVxRiQMdIDowcfiz4t3z3RXzG
         8Ntn/XT/hQ8onu4E2Vp9pbG0u0L+Ftc/rCdlHU0SRbvzIU555meUiqgweSJzkN1R4eyj
         8dTV2Mzv3bBa/1b9E5PHU/+HZTXb7ib1+HayVaa0ekSVrOq75B83y2MMijBFckclyK/b
         QajLDZsjnbswFEc2fyGdsXCgxtPlVUlWO8oCq/gZny60Qia0Tocw2DmDVaNYj5xeIm6w
         biadyxPXaUdru6ChHsXmjM6dva0oyA4B9iGI6QT3g0dijXd8kOIQKl2K3X0ppBB6VKgG
         lPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204303; x=1749809103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhpYN2L+e8ZOlXdHKAWYCgXLcomAnicmHPGk6SGwhY0=;
        b=AWgN4XChxXiNHfcFGZdx//T+W1gDrkIDdXsn4JXFd4HD+LeydKBZ88XWpdGRCyhUs7
         9HUo/0xGJQLJYhdP4vws0vys7dEOHRHAnD9nrjulPeHFJmluUatjmljj9z1jLdelbLg0
         0tgtFvCukUcJyP9AFRfNmIZY+Q/ffKf3gsR15U/lB/fIhw7NOW40L81rnC/mdxnnYX5N
         wCaRac9woKCIrpuoYVRb54EXDN4D+h25hjbgRcjRx+BjM2uJMOjfHnJDmBMXfJwXVXIH
         mG+yfMeJ6fVtftGCE9JFd9lWuAKHA6ZmmvlL9bC4R4AankQMHySIfNC+zXVz3ikDET3x
         5r9w==
X-Forwarded-Encrypted: i=1; AJvYcCUe7w0rmerzceGs4fPkzUsI+1PRFMHZYCP3c2nb1HBDBFr/O7foMSIqz52SlxLgfznRrw30KG6kfZjUjSXV@vger.kernel.org, AJvYcCWNOR+xTC3I7W6MezJzaykee/l3df8K9lUmfGfXqCP7Ix49aTgjawGRQQG+HtqU+I0TGYUg9FABRd8l@vger.kernel.org
X-Gm-Message-State: AOJu0YzKzAA68VEFuKb+UcJULt3ao087U/psIJ+7qLELhpEmmpG8gq+E
	DXYQ0C7oyu7PIZVbgyf72dXEP3TpDKBN/V0UT3Fj2NTgliW/YInsKzI2D077azljMs9NDw==
X-Gm-Gg: ASbGncskcXGnIF7DgOWOKNBsOIOb9xMFhuYPlyzebgDvF3tLHRikFXDTOfLcgTdEreX
	z6gDX1yQo14vmp42DRaiyPYbwoV8HQlKLHNjkaqoJn4nACvepu0cxH2RKhLUMB9aEDo3JYx6PLA
	25vnVU485aEdbxQGoga5Dbc2ikY/4GU/NRnaIP5Yr496ygiwWmSjUNqK0p1VDY1vPppcD6eA88O
	btjR9vj4nMEoNQK2uJSRuMO1/2u1A1EH7mf3D7EK6FbctvxDOWdBlR9M8cmc4UErTO+SNZjJPv2
	5Q7sM7Wvpb9BuAHGNHmzv2oY1jAw/8FoF5zj90yYTcv+nwL+oUUXMNUPbHWp7s41L/3zjf6+IlR
	C
X-Google-Smtp-Source: AGHT+IHJ3g9KDsHyFfInaEEVSx+H7Y6yZwCxQ9nsa5Q8ta2kMV05CkLuufoL+/0uzndXu1HOJQdIGg==
X-Received: by 2002:a17:906:c154:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ade1a9c8247mr209498466b.47.1749204303107;
        Fri, 06 Jun 2025 03:05:03 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1225:ec01:d1d7:779d:8019:7bb0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754180sm93099166b.9.2025.06.06.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:05:02 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:05:00 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <lmh3y23qcffyyy4oxbyinsfagcawovxgpqiskyhjmwurqx4pri@tg4ipxn4abgo>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
 <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>

Hi Frank,

Thank you for the review.

I think the only thing up for discussion on this thread is the tx_fifo
packing (see below).

On Wed, Jun 04, 2025 at 03:10:13PM -0400, Frank Li wrote:
> On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > core that supports I3C and I2C devices, multiple speed-grades and
> > I3C IBIs.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  MAINTAINERS                         |    1 +
> >  drivers/i3c/master/Kconfig          |   11 +
> >  drivers/i3c/master/Makefile         |    1 +
> >  drivers/i3c/master/adi-i3c-master.c | 1063 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 1076 insertions(+)
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
> > index 0000000000000000000000000000000000000000..6f44b0b6fc2020bb0131e8e2943806c0a9d9ce7b
> > --- /dev/null
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -0,0 +1,1063 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * I3C Controller driver
> > + * Copyright 2024 Analog Devices Inc.
> 
> 2025?
> 
Ups.
> > + * Author: Jorge Marques <jorge.marques@analog.com>
> > + */
> > +
> > +#include <linux/bitops.h>
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
> > +#define VERSION_MAJOR(x)		(((x) >> 16) & 0xff)
> > +#define VERSION_MINOR(x)		(((x) >> 8) & 0xff)
> > +#define VERSION_PATCH(x)		((x) & 0xff)
> 
> Can you use GEN_MASK and FIELD_GET macro for it?
> 
Of course, for V2 I will do for all.
And also reformat the regmap to format:

  #define REG_SOME_REG
  #define   REG_SOME_REG_FIELD_NAME

Which makes way easier to read/debug.
> > +
> > +#define MAX_DEVS			16
> > +
> > +#define REG_VERSION			0x000
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define REG_CMD_FIFO			0x0d4
> > +#define REG_CMDR_FIFO			0x0d8
> > +#define REG_SDO_FIFO			0x0dc
> > +#define REG_SDI_FIFO			0x0e0
> > +#define REG_IBI_FIFO			0x0e4
> > +#define REG_FIFO_STATUS			0x0e8
> > +#define REG_OPS				0x100
> > +#define REG_IBI_CONFIG			0x140
> > +#define REG_DEV_CHAR			0x180
> > +
> > +#define CMD0_FIFO_IS_CCC		BIT(22)
> > +#define CMD0_FIFO_BCAST			BIT(21)
> > +#define CMD0_FIFO_SR			BIT(20)
> > +#define CMD0_FIFO_LEN(l)		((l) << 8)
> > +#define CMD0_FIFO_LEN_MAX		4095
> > +#define CMD0_FIFO_DEV_ADDR(a)		((a) << 1)
> > +#define CMD0_FIFO_RNW			BIT(0)
> > +
> > +#define CMD1_FIFO_CCC(id)		((id) & GENMASK(7, 0))
> > +
> > +#define CMDR_NO_ERROR			0
> > +#define CMDR_CE0_ERROR			1
> > +#define CMDR_CE2_ERROR			4
> > +#define CMDR_NACK_RESP			6
> > +#define CMDR_UDA_ERROR			8
> > +#define CMDR_ERROR(x)			(((x) & GENMASK(23, 20)) >> 20)
> > +#define CMDR_XFER_BYTES(x)		(((x) & GENMASK(19, 8)) >> 8)
> 
> use GET_FIELD
> 
Ack.
> > +
> > +#define FIFO_STATUS_CMDR_EMPTY		BIT(0)
> > +#define FIFO_STATUS_IBI_EMPTY		BIT(1)
> > +#define IRQ_PENDING_CMDR_PENDING	BIT(5)
> > +#define IRQ_PENDING_IBI_PENDING		BIT(6)
> > +#define IRQ_PENDING_DAA_PENDING		BIT(7)
> > +
> > +#define DEV_CHAR_IS_I2C			BIT(0)
> > +#define DEV_CHAR_IS_ATTACHED		BIT(1)
> > +#define DEV_CHAR_BCR_IBI(x)		(((x) & GENMASK(2, 1)) << 1)
> > +#define DEV_CHAR_WEN			BIT(8)
> > +#define DEV_CHAR_ADDR(x)		(((x) & GENMASK(6, 0)) << 9)
> 
> The same here.
> 
Ack.
> > +
> > +#define REG_OPS_SET_SG(x)		((x) << 5)
> > +#define REG_OPS_PP_SG_MASK		GENMASK(6, 5)
> > +
> > +#define REG_IBI_CONFIG_LISTEN		BIT(1)
> > +#define REG_IBI_CONFIG_ENABLE		BIT(0)
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
> > +					 const u8 *bytes, int nbytes)
> > +{
> > +	writesl(master->regs + REG_SDO_FIFO, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp = 0;
> > +
> > +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> 
> ALIGN_DOWN(bytes, 4)?
> 
> Do you need conside big/little endian to trim down data?
> 

This is due the byte array passed may not be a multiple of 32bits.
If it were, it could be simply

  writesl(master->regs + REG_SDO_FIFO, bytes, DIV_ROUND_UP(m, 4));

Also,
  
  writesb(master->regs + REG_SDO_FIFO, bytes, m);

Is not suitable.
cnds and dw i3c tx fifo write do the same.
The data is packed as follows ("D" is discarded):

+----------------------------------------------------+
| Payload transfer, length = 5                       |
+--------------------+-------+-------+-------+-------+
| SDO FIFO Stack     | Byte3 | Byte2 | Byte1 | Byte0 |
+====================+=======+=======+=======+=======+
| #0                 | 0x78  | 0x56  | 0x34  | 0x12  |
+--------------------+-------+-------+-------+-------+
| #1                 | D     | D     | D     | 0xFE  |
+--------------------+-------+-------+-------+-------+

> > +		writesl(master->regs + REG_SDO_FIFO, &tmp, 1);
> 
> writel() is enough
> 
Ok
> > +	}
> > +}
> > +
> > +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> > +					   u8 *bytes, int nbytes)
> > +{
> > +	readsl(master->regs + REG_SDI_FIFO, bytes, nbytes / 4);
> > +	if (nbytes & 3) {
> > +		u32 tmp;
> > +
> > +		readsl(master->regs + REG_SDI_FIFO, &tmp, 1);
> 
> readl()
> 
Ok
> > +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> > +	}
> > +}
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
> > +	writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
> > +	       master->regs + REG_IBI_CONFIG);
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
> > +	unsigned int i;
> > +
> > +	if (!xfer)
> > +		return;
> > +
> > +	for (i = 0; i < xfer->ncmds; i++) {
> > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > +
> > +		adi_i3c_master_wr_to_tx_fifo(master, cmd->tx_buf, cmd->tx_len);
> 
> what's happen if data length bigger than fifo size?
> 
Right, I will add the safeguards.
The behaviour is to set the minimum between tx_len and tx_fifo_room.
And if there is not enough room, data is lost.
Same for cmd_fifo.

> > +	}
> > +
> > +	for (i = 0; i < xfer->ncmds; i++) {
> > +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> > +
> > +		writel(cmd->cmd0, master->regs + REG_CMD_FIFO);
> > +		if (cmd->cmd0 & CMD0_FIFO_IS_CCC)
> > +			writel(cmd->cmd1, master->regs + REG_CMD_FIFO);
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
> > +	     !(status0 & FIFO_STATUS_CMDR_EMPTY);
> > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> > +		struct adi_i3c_cmd *cmd;
> > +		u32 cmdr, rx_len;
> > +
> > +		cmdr = readl(master->regs + REG_CMDR_FIFO);
> > +
> > +		cmd = &xfer->cmds[xfer->ncmds_comp++];
> > +		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
> > +		adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> > +		cmd->error = CMDR_ERROR(cmdr);
> 
> what happen if cmds[0] is write, cmds[1] is read.
> 
What is important here is to check the direction, I will add checks as
follows were applicable:

  if (cmd->cmd0 & REG_CMD_FIFO_0_RNW)

Instead of relying that tx/rx_len are set to 0.
> > +	}
> > +
> > +	for (i = 0; i < xfer->ncmds; i++) {
> > +		switch (xfer->cmds[i].error) {
> > +		case CMDR_NO_ERROR:
> > +			break;
> > +
> > +		case CMDR_CE0_ERROR:
> > +		case CMDR_CE2_ERROR:
> > +		case CMDR_NACK_RESP:
> > +		case CMDR_UDA_ERROR:
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
> > +	unsigned long flags;
> > +
> > +	init_completion(&xfer->comp);
> > +	spin_lock_irqsave(&master->xferqueue.lock, flags);
> 
> suggest use guard(spinlock_irqsave)
> 
Sure!
> > +	if (master->xferqueue.cur) {
> > +		list_add_tail(&xfer->node, &master->xferqueue.list);
> > +	} else {
> > +		master->xferqueue.cur = xfer;
> > +		adi_i3c_master_start_xfer_locked(master);
> > +	}
> > +	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
> > +}
> > +
> > +static void adi_i3c_master_unqueue_xfer(struct adi_i3c_master *master,
> > +					struct adi_i3c_xfer *xfer)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&master->xferqueue.lock, flags);
> > +	if (master->xferqueue.cur == xfer)
> > +		master->xferqueue.cur = NULL;
> > +	else
> > +		list_del_init(&xfer->node);
> > +
> > +	writel(0x01, master->regs + REG_ENABLE);
> > +	writel(0x00, master->regs + REG_ENABLE);
> > +	writel(IRQ_PENDING_CMDR_PENDING, master->regs + REG_IRQ_MASK);
> > +
> > +	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
> > +}
> > +
> > +static enum i3c_error_code adi_i3c_cmd_get_err(struct adi_i3c_cmd *cmd)
> > +{
> > +	switch (cmd->error) {
> > +	case CMDR_CE0_ERROR:
> > +		return I3C_ERROR_M0;
> > +
> > +	case CMDR_CE2_ERROR:
> > +	case CMDR_NACK_RESP:
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
> > +	ccmd->cmd1 = CMD1_FIFO_CCC(cmd->id);
> > +	ccmd->cmd0 = CMD0_FIFO_IS_CCC |
> > +		     CMD0_FIFO_LEN(cmd->dests[0].payload.len);
> > +
> > +	if (cmd->id & I3C_CCC_DIRECT)
> > +		ccmd->cmd0 |= CMD0_FIFO_DEV_ADDR(cmd->dests[0].addr);
> > +
> > +	if (cmd->rnw) {
> > +		ccmd->cmd0 |= CMD0_FIFO_RNW;
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
> > +	for (i = 0; i < nxfers; i++) {
> > +		if (xfers[i].len > CMD0_FIFO_LEN_MAX)
> > +			return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (!nxfers)
> > +		return 0;
> > +
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > +
> > +		ccmd->cmd0 = CMD0_FIFO_DEV_ADDR(dev->info.dyn_addr);
> > +
> > +		if (xfers[i].rnw) {
> > +			ccmd->cmd0 |= CMD0_FIFO_RNW;
> > +			ccmd->rx_buf = xfers[i].data.in;
> > +			ccmd->rx_len = xfers[i].len;
> > +		} else {
> > +			ccmd->tx_buf = xfers[i].data.out;
> > +			ccmd->tx_len = xfers[i].len;
> > +		}
> > +
> > +		ccmd->cmd0 |= CMD0_FIFO_LEN(xfers[i].len);
> > +
> > +		if (i < nxfers - 1)
> > +			ccmd->cmd0 |= CMD0_FIFO_SR;
> > +
> > +		if (!i)
> > +			ccmd->cmd0 |= CMD0_FIFO_BCAST;
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
> > +	writel(DEV_CHAR_ADDR(dyn_addr), master->regs + REG_DEV_CHAR);
> > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > +		~DEV_CHAR_IS_ATTACHED) | DEV_CHAR_WEN,
> > +	       master->regs + REG_DEV_CHAR);
> > +
> > +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > +	       DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
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
> > +	data->id = slot;
> > +	i3c_dev_set_master_data(dev, data);
> > +	master->free_rr_slots &= ~BIT(slot);
> > +
> > +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> > +
> > +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel(readl(master->regs + REG_DEV_CHAR) |
> > +	       DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
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
> > +		writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +		writel(readl(master->regs + REG_DEV_CHAR) |
> > +		       DEV_CHAR_BCR_IBI(i3cdev->info.bcr) | DEV_CHAR_WEN,
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
> > +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +	writel((readl(master->regs + REG_DEV_CHAR) &
> > +		~DEV_CHAR_IS_ATTACHED) | DEV_CHAR_WEN,
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
> > +	writel(DEV_CHAR_ADDR(dev->addr) |
> > +	       DEV_CHAR_IS_I2C | DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
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
> > +	writel(DEV_CHAR_ADDR(dev->addr) |
> > +	       DEV_CHAR_IS_I2C | DEV_CHAR_WEN,
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
> > +	pp_sg = readl(master->regs + REG_OPS) &
> > +		  ~REG_OPS_PP_SG_MASK;
> > +
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
> > +	info->dcr = 0x00;
> > +	info->bcr = 0x40;
> > +	info->pid = 0;
> > +}
> > +
> > +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	int ret;
> > +	u32 irq_mask;
> > +
> > +	master->daa.index = 0x8;
> > +	for (u8 i = 0; i < MAX_DEVS; i++) {
> 
> Not sure why need pre-alloc MAX_DEVS address here?
> 
Here we just collect 15 free addresses to send during the DAA, the
allocation only occurs at the "Add I3C devices discovered". This driver
does not match an dynamic address with a provisioned id, so the payload
obtained during the DAA is discarded.
> > +		ret = i3c_master_get_free_addr(m, master->daa.index);
> > +		if (ret < 0)
> > +			return -ENOSPC;
> > +
> > +		master->daa.index = ret;
> > +		master->daa.addrs[i] = master->daa.index;
> > +	}
> > +	/* Will be reused as index for daa.addrs */
> > +	master->daa.index = 0;
> > +
> > +	irq_mask = readl(master->regs + REG_IRQ_MASK);
> > +	writel(irq_mask | IRQ_PENDING_DAA_PENDING,
> > +	       master->regs + REG_IRQ_MASK);
> > +
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
> > +	writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
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
> > +	spin_lock(&master->ibi.lock);
> 
> use guard(spin_lock);
> 
Ack.
> > +
> > +	data = i3c_dev_get_master_data(dev);
> > +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > +	if (!slot)
> > +		goto out_unlock;
> > +
> > +	mdb = slot->data;
> > +	mdb[0] = (ibi >> 8) & GENMASK(7, 0);
> > +
> > +	slot->len = 1;
> > +	i3c_master_queue_ibi(dev, slot);
> > +
> > +out_unlock:
> > +	spin_unlock(&master->ibi.lock);
> > +}
> > +
> > +static void adi_i3c_master_demux_ibis(struct adi_i3c_master *master)
> > +{
> > +	u32 status0;
> > +
> > +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> > +	     !(status0 & FIFO_STATUS_IBI_EMPTY);
> > +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
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
> > +	addr = (addr << 1) | !parity8(addr);
> > +
> > +	writel(addr, master->regs + REG_SDO_FIFO);
> > +}
> > +
> > +static irqreturn_t adi_i3c_master_irq(int irq, void *data)
> > +{
> > +	struct adi_i3c_master *master = data;
> > +	u32 pending;
> > +
> > +	pending = readl_relaxed(master->regs + REG_IRQ_PENDING);
> > +	if (pending & IRQ_PENDING_CMDR_PENDING) {
> > +		spin_lock(&master->xferqueue.lock);
> > +		adi_i3c_master_end_xfer_locked(master, pending);
> > +		spin_unlock(&master->xferqueue.lock);
> > +	}
> > +	if (pending & IRQ_PENDING_IBI_PENDING)
> > +		adi_i3c_master_demux_ibis(master);
> > +	if (pending & IRQ_PENDING_DAA_PENDING)
> > +		adi_i3c_master_handle_da_req(master);
> > +	writel_relaxed(pending, master->regs + REG_IRQ_PENDING);
> 
> this need move just after readl_relaxed().
> 
Yes. I had to make a small RTL change to to allow this, since previously
the irq was sticky until resolved, which is uncommon. Now it is latched
on the rising edge and only re-sets on the next event rising edge,
allowing it to be cleared then resolved.
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
> > +	for (i = 0; i < nxfers; i++) {
> > +		if (xfers[i].len > CMD0_FIFO_LEN_MAX)
> > +			return -EOPNOTSUPP;
> > +		if (xfers[i].flags & I2C_M_TEN)
> > +			return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (!nxfers)
> > +		return 0;
> > +
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> > +
> > +		ccmd->cmd0 = CMD0_FIFO_DEV_ADDR(xfers[i].addr);
> > +
> > +		if (xfers[i].flags & I2C_M_RD) {
> > +			ccmd->cmd0 |= CMD0_FIFO_RNW;
> > +			ccmd->rx_buf = xfers[i].buf;
> > +			ccmd->rx_len = xfers[i].len;
> > +		} else {
> > +			ccmd->tx_buf = xfers[i].buf;
> > +			ccmd->tx_len = xfers[i].len;
> > +		}
> > +
> > +		ccmd->cmd0 |= CMD0_FIFO_LEN(xfers[i].len);
> > +	}
> > +
> > +	adi_i3c_master_queue_xfer(master, xfer);
> > +	if (!wait_for_completion_timeout(&xfer->comp,
> > +					 msecs_to_jiffies(1000)))
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
> > +	bool enabled = 0;
> 
> enabled = false if you use bool type.
> 
I will set as u32 as suggested below.
> > +	int ret;
> > +
> > +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> > +				      I3C_CCC_EVENT_SIR);
> > +
> > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > +		if (dev != i3cdev && i3cdev->ibi)
> > +			enabled |= i3cdev->ibi->enabled;
> 
> if you use | here, suggest use u32 enabled
> 
Ack.
> > +	}
> > +	if (!enabled) {
> > +		writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
> > +		       master->regs + REG_IBI_CONFIG);
> > +		writel(readl(master->regs + REG_IRQ_MASK) | ~IRQ_PENDING_IBI_PENDING,
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
> > +	writel(readl(master->regs + REG_IRQ_MASK) | IRQ_PENDING_IBI_PENDING,
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
> > +	master->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
> > +	if (IS_ERR(master->clk))
> > +		return PTR_ERR(master->clk);
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = clk_prepare_enable(master->clk);
> 
> use devm_clk_get_enabled() instead of devm_clk_get() to simple err handle.
> 
Ack.
> > +	if (ret)
> > +		goto err_clk_disable;
> > +
> > +	version = readl(master->regs + REG_VERSION);
> > +	if (VERSION_MAJOR(version) != 0) {
> > +		dev_err(&pdev->dev, "Unsupported IP version %u.%u.%c\n",
> > +			VERSION_MAJOR(version),
> > +			VERSION_MINOR(version),
> > +			VERSION_PATCH(version));
> > +		ret = -EINVAL;
> > +		goto err_clk_disable;
> > +	}
> > +
> > +	writel(0x00, master->regs + REG_ENABLE);
> > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > +
> > +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> > +			       dev_name(&pdev->dev), master);
> > +	if (ret)
> > +		goto err_clk_disable;
> 
> needn't goto if you use devm_clk_get_enabled()
> 
> Frank
Ack.

Best regards,
Jorge
> > +
> > +	platform_set_drvdata(pdev, master);
> > +
> > +	master->maxdevs = MAX_DEVS;
> > +	master->free_rr_slots = GENMASK(master->maxdevs, 1);
> > +
> > +	writel(IRQ_PENDING_CMDR_PENDING, master->regs + REG_IRQ_MASK);
> > +
> > +	spin_lock_init(&master->ibi.lock);
> > +	master->ibi.num_slots = 15;
> > +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> > +					 sizeof(*master->ibi.slots),
> > +					 GFP_KERNEL);
> > +	if (!master->ibi.slots) {
> > +		ret = -ENOMEM;
> > +		goto err_clk_disable;
> > +	}
> > +
> > +	ret = i3c_master_register(&master->base, &pdev->dev,
> > +				  &adi_i3c_master_ops, false);
> > +	if (ret)
> > +		goto err_clk_disable;
> > +
> > +	return 0;
> > +
> > +err_clk_disable:
> > +	clk_disable_unprepare(master->clk);
> > +
> > +	return ret;
> > +}
> > +
> > +static void adi_i3c_master_remove(struct platform_device *pdev)
> > +{
> > +	struct adi_i3c_master *master = platform_get_drvdata(pdev);
> > +
> > +	i3c_master_unregister(&master->base);
> > +
> > +	writel(0xff, master->regs + REG_IRQ_PENDING);
> > +	writel(0x00, master->regs + REG_IRQ_MASK);
> > +	writel(0x01, master->regs + REG_ENABLE);
> > +
> > +	clk_disable_unprepare(master->clk);
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
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
