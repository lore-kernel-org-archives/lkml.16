Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2619A4C8E;
	Fri, 27 Jun 2025 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033410; cv=none; b=QlLaVNwuAVgiYOLkcWy6kazUW2Zo94MsVBrx7gdL6kLrXSyriJSnMrJxwHXzP9xjwYA8A3EzyJWirWXmlffIdtqrd79xfyCgO+aWqvMD10DyT4xTrjccRYFpIRYEKvq9EIVGcDRG760R4Bw35dUNPOdBiYUIjWuQnfrJGbETVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033410; c=relaxed/simple;
	bh=DrDNd1n9rorpnzW8lOgvAYhTbYWmHvB8IqjLwn14ltI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXXHQhBUr80bNNKFmQSjCzqhXvnxqBdl7uAqnR9pc1Yb6d088Y110uVxBgMDabvE+hSfg5jI52d0kJPGfn4OOXzmTVYxeyn5PliGcZDySzfFntJEY8midnx80bf97njf/O8bbLR2L1+Khsk9HYREMhEMyAOZbzCqg/zfz/XJsyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CY606U/M; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CY606U/M"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1657507f8f.1;
        Fri, 27 Jun 2025 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033405; x=1751638205; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tN6UiRrUpULk2bRb5lg5BQJc5fPZ5i15Aj0sGl1FE+c=;
        b=CY606U/Mip/KMYga+plXMchdZcOttKdmbC3f7FlgyYD+gB/9if8FnYLK11vrfS2bMv
         ly0gyMtXrJUHJbboVPNvd0BNyVIoYLhTnet2mL2BZdeoAxSWmNkfldPcMDm6xMOnCy1K
         2ililp6K6TrsMObN4WloaRvoOfVZIhNaFLKTbD29smngv/k8R0HWrWWwA7SEd6a6wMNl
         5q1QDxWuApu9Z3j4EGVYc6BZMDHvZSFXJM3nf6myBVYh/prw1lO+EqrTE8CQFLD/6zhp
         2tRXZobtYSs6nJbo1Ma398/iwMtUZKYFB+u/f1L6TGbNTGVF9SHglW9/1+BLCKqgFZ1S
         BOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033405; x=1751638205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tN6UiRrUpULk2bRb5lg5BQJc5fPZ5i15Aj0sGl1FE+c=;
        b=Gy28GTu5DFAFTOZLjkmH+E03dH6mpRuB+kTILBQ7lYk3snqJGlW/1no6HH52YiqV4k
         5HGxzyJtEZ39jbEeSuawUqqHPHL5POaIbxch2y5Wo44l5nF12AQdh2ds4LGxSGCa6Qts
         zgmJLN2HH6WgMcPuigjVOCeY/03XldX0raHcNjepw2W0LQEbAzMB5VVY6uDesLJxT648
         VUO0+ra5inQ3Vvk2Eb8R8HPQwylZmx9EEY0b4gsKiHlVOyWL50OyLurcAkej0UylWssh
         DuuiQMBVKn/P9Brx5akM67AqVdVfF/Oa0qRcz6oyHSMdy1veo+V8Q4NMKt18HVjU/a1C
         O08Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjjI7jWr9lAA+eXtevbg/mmyrF92GhR6Rbkh9Bu/GS+w4voQBVOBx63bGlg5FLED7XI7kezqnQIlsA@vger.kernel.org, AJvYcCWWPAJcuCpqhdKuMZ22hJZ3YQov2hI6VlHe4Sh0EgMHMA2rCBSRCkR4M98S5ghvuM01Hk2P8+kqLJY3IQfm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzarh6+4KWfs69AY0rKGnppugP3TGA/kAW/vUbjynLCKnaD6jtp
	kWhtcmdnmljxUKImCmSwx/pB2Wb47OweGlbVIVIaJhuyyTkom9CUyc+2
X-Gm-Gg: ASbGnctIDakQpVAl8btT/N7R5yXeSKz5vcuNHCYPvnYZe1n42qGWjtSkgnRPv6/stnU
	Y78txyxFkLWC6x1jl3wVRyBH207FL3aw9yExmge5WCIDnU5efOMmiMUXL0niB3JIV7nmWBNTP3m
	V7jjwP+FaJtDCBgex3tRCcnLW43Hv19BRMgs0RQ51vtVsbZO+dfffHdauvu9sc6turYc0inAyvX
	qzrzynLykWm6NVvZKdkQuRqf9i4o6Gb4+wCjYZ1bdGVLze4Rm4LYEIID96g1V9XkwKF+WpOa/qs
	xHlVTHLVDJ9brrp8eJpSWRE2kjqn15tzJseTuryyO+SN1oPQBydnyqWJNcWxG1djECRLA8Qx3Gq
	j+yPK+as=
X-Google-Smtp-Source: AGHT+IHWSOFzH2J2X3bcPLTtw6529i3ordDjg4qVHQt1/CD26pZt19mnq629lQSvRGIWscAkr8/8GA==
X-Received: by 2002:adf:9c8b:0:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a8f454923amr3122814f8f.7.1751033404427;
        Fri, 27 Jun 2025 07:10:04 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7386sm2818198f8f.20.2025.06.27.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:10:04 -0700 (PDT)
Date: Fri, 27 Jun 2025 16:10:01 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <e74rbtdfsbrdwwhstud37z7zjwkds5rtzvzpihiehpvrmd4s5t@xhbp5d6jzmtj>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-2-3846a1f66d5e@analog.com>
 <aF16kCPkll6J0vxZ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aF16kCPkll6J0vxZ@lizhi-Precision-Tower-5810>

Hi Frank,

There is some commentary from my side on set_speed, and one or other
NACK.

On Thu, Jun 26, 2025 at 12:51:28PM -0400, Frank Li wrote:
> On Thu, Jun 26, 2025 at 12:07:37PM +0200, Jorge Marques wrote:
> > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > core that supports I3C and I2C devices, multiple speed-grades and
> > I3C IBIs.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  MAINTAINERS                         |    1 +
> >  drivers/i3c/master/Kconfig          |   11 +
> >  drivers/i3c/master/Makefile         |    1 +
> >  drivers/i3c/master/adi-i3c-master.c | 1017 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 1030 insertions(+)
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
> > index 0000000000000000000000000000000000000000..7e4dac4fb16553b0cbb667d503c65cc9187b92be
> > --- /dev/null
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -0,0 +1,1017 @@
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
> > +#include <linux/fpga/adi-axi-common.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "../internals.h"
> > +
> > +#define MAX_DEVS			16
> 
> name is too short and quite common, I worry about conflict with other
> define in future.  Can you use ADI_MAX_DEVS?
> 
Sure
> > +
> > +#define REG_ENABLE			0x040
> > +
> > +#define REG_PID_L			0x054
> > +#define REG_PID_H			0x058
> > +#define REG_DCR_BCR_DA			0x05C
> > +#define   REG_DCR_BCR_DA_GET_DA(x)	FIELD_GET(GENMASK(22, 16), (x))
> > +#define   REG_DCR_BCR_DA_GET_BCR(x)	FIELD_GET(GENMASK(15, 8), (x))
> > +#define   REG_DCR_BCR_DA_GET_DCR(x)	FIELD_GET(GENMASK(7, 0), (x))
> > +
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define   REG_IRQ_PENDING_DAA		BIT(7)
> > +#define   REG_IRQ_PENDING_IBI		BIT(6)
> > +#define   REG_IRQ_PENDING_CMDR		BIT(5)
> > +
> > +#define REG_CMD_FIFO			0x0d4
> > +#define   REG_CMD_FIFO_0_IS_CCC		BIT(22)
> > +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> > +#define   REG_CMD_FIFO_0_SR		BIT(20)
> > +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> > +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> 
> Does check patch complain miss () at 'a'
> 
Good question why it didn't.
Will add.
> > +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> > +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> > +
> > +#define REG_CMD_FIFO_ROOM		0x0c0
> > +#define REG_CMDR_FIFO			0x0d8
> > +#define   REG_CMDR_FIFO_UDA_ERROR	8
> > +#define   REG_CMDR_FIFO_NACK_RESP	6
> > +#define   REG_CMDR_FIFO_CE2_ERROR	4
> > +#define   REG_CMDR_FIFO_CE0_ERROR	1
> > +#define   REG_CMDR_FIFO_NO_ERROR	0
> > +#define   REG_CMDR_FIFO_ERROR(x)	FIELD_GET(GENMASK(23, 20), (x))
> > +#define   REG_CMDR_FIFO_XFER_BYTES(x)	FIELD_GET(GENMASK(19, 8), (x))
> > +
> > +#define REG_SDO_FIFO			0x0dc
> > +#define REG_SDO_FIFO_ROOM		0x0c8
> > +#define REG_SDI_FIFO			0x0e0
> > +#define REG_IBI_FIFO			0x0e4
> > +#define REG_FIFO_STATUS			0x0e8
> > +#define   REG_FIFO_STATUS_CMDR_EMPTY	BIT(0)
> > +#define   REG_FIFO_STATUS_IBI_EMPTY	BIT(1)
> > +
> > +#define REG_OPS				0x100
> > +#define   REG_OPS_PP_SG_MASK		GENMASK(6, 5)
> > +#define   REG_OPS_SET_SG(x)		FIELD_PREP(REG_OPS_PP_SG_MASK, (x))
> > +
> > +#define REG_IBI_CONFIG			0x140
> > +#define   REG_IBI_CONFIG_ENABLE		BIT(0)
> > +#define   REG_IBI_CONFIG_LISTEN		BIT(1)
> > +
> > +#define REG_DEV_CHAR			0x180
> > +#define   REG_DEV_CHAR_IS_I2C		BIT(0)
> > +#define   REG_DEV_CHAR_IS_ATTACHED	BIT(1)
> > +#define   REG_DEV_CHAR_BCR_IBI(x)	FIELD_PREP(GENMASK(3, 2), (x))
> > +#define   REG_DEV_CHAR_WEN		BIT(8)
> > +#define   REG_DEV_CHAR_ADDR(x)		FIELD_PREP(GENMASK(15, 9), (x))
> > +
> > +enum speed_grade {PP_SG_UNSET, PP_SG_1MHZ, PP_SG_3MHZ, PP_SG_6MHZ, PP_SG_12MHZ};
> 
> add empty line here
> 
Ack
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
> > +	struct adi_i3c_cmd cmds[] __counted_by(ncmds);
> > +};
> > +
> > +struct adi_i3c_master {
> > +	struct i3c_master_controller base;
> > +	u32 free_rr_slots;
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
> > +					 const u8 *buf, unsigned int nbytes)
> > +{
> > +	unsigned int n, m;
> > +
> > +	n = readl(master->regs + REG_SDO_FIFO_ROOM);
> > +	m = min(n, nbytes);
> > +	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, nbytes);
> 
> You need mention at cover letter or some place,  dependent on
> https://lore.kernel.org/linux-i3c/20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com/T/#t
> 
Will add to the top of the cover also.
I used `b4 prep --edit-deps` and `--check-deps` which appends at the end
of the cover as

  prerequisite-message-id: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>

> > +}
> > +
> > +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> > +					   u8 *buf, unsigned int nbytes)
> > +{
> > +	i3c_readl_fifo(master->regs + REG_SDI_FIFO, buf, nbytes);
> > +}
> 
> I think you can direct use i3c_readl_fifo() without wrap
> adi_i3c_master_rd_from_rx_fifo().
> 
Hum, it is used twice in the code, involve a register address..
I would keep as is, feels odd to have only the write wrapper method (even
though has the FIFO_ROOM assert.
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
> > +
> > +	if (!xfer)
> > +		return;
> > +
> > +	while (!(readl(master->regs + REG_FIFO_STATUS) & REG_FIFO_STATUS_CMDR_EMPTY)) {
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
> > +	for (i = 0; i < xfer->ncmds_comp; i++) {
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
> > +	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
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
> > +	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
> > +	int i, ret;
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
> > +	return ret;
> > +}
> > +
> > +struct adi_i3c_i2c_dev_data {
> > +	u16 id;
> > +	s16 ibi;
> > +	struct i3c_generic_ibi_pool *ibi_pool;
> 
> can you move ibi_pool to fist one? in 64bit system, it is align to 8 byte
> so there will be 4 bytes hole in adi_i3c_i2c_dev_data.
> 
Yes
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
> > +	u32 bcr_ibi;
> > +	u8 addr;
> > +
> > +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> > +		addr = i3cdev->info.dyn_addr ?
> > +		       i3cdev->info.dyn_addr : i3cdev->info.static_addr;
> > +		writel(REG_DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> > +		bcr_ibi = FIELD_GET(I3C_BCR_IBI_PAYLOAD | I3C_BCR_IBI_REQ_CAP, (i3cdev->info.bcr));
> > +		writel(readl(master->regs + REG_DEV_CHAR) |
> > +		       REG_DEV_CHAR_BCR_IBI(bcr_ibi) | REG_DEV_CHAR_WEN,
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
> > +	u32 buf;
> > +
> > +	/* Dynamic address and PID are for identification only */
> > +	memset(info, 0, sizeof(*info));
> > +	buf = readl(master->regs + REG_DCR_BCR_DA);
> > +	info->dyn_addr = REG_DCR_BCR_DA_GET_DA(buf);
> > +	info->dcr = REG_DCR_BCR_DA_GET_DCR(buf);
> > +	info->bcr = REG_DCR_BCR_DA_GET_BCR(buf);
> > +	info->pid = readl(master->regs + REG_PID_L);
> > +	info->pid |= (u64)readl(master->regs + REG_PID_H) << 32;
> > +}
> > +
> > +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> > +{
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	u32 irq_mask;
> > +	int ret, addr;
> > +
> > +	addr = 0x8;
> 
> the first 8 address already reserved at i3c_bus_init_addrslots(). You can
> start from 0, i3c_master_get_free_addr() will return from 8 auto.
> 
OK.
> > +	for (u8 i = 0; i < MAX_DEVS; i++) {
> > +		addr = i3c_master_get_free_addr(m, addr);
> > +		if (addr < 0)
> > +			return addr;
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
> 
> This version should be fine, but I suggest use .set_speed callback. If it
> can't match your requirment, we can improve it.
> 
adi_i3c_master_upd_i3c_scl_lim configures the push pull speed according
the spec. Ideally no one would manufacture a peripheral that doesn't
support 12.5MHz, but the controller support slower push pull speed
regardless to my opinion and according the spec.

Looking into the set_speed callback, that's actually interesting, and
the name is rather misleading, something like "set_open_drain_speed"
would be rather clearer. Still, what it is actually doing, as seen in
the svc-i3c-master, is setting a 50% duty-cycle, and ...

... solely for the first broadcast address during bus
initialization, because, quote (6.2, Note 9):

  The Controller uses this timing to send the first Broadcast Address
  after Bus initialization, in order to disable the I2C Spike Filter for
  applicable I3C Target Devices.

But also, quote (5.1.2.2.2):

   If the I3C Controller intends to transmit solely to other I3C Devices
   (i.e., not to any I2C Devices), then it may optionally maintain the
   SCL pulse width below 50 ns, with the result that any I2C Devices
   present on the Bus will see only a 0 value. This shorter pulse width
   produces a higher data rate, because for Open Drain Arbitration only
   the Low time is extended. See Figure 13, middle waveform.

So it handles a corner-case of when I3C devices are in I2C mode.
Let's look what is on the market with I2C/I3C dual support.

  ST LSM6DSOX, INT1 pin:
  - not connected: dual mode, the ENTDA/DAA must be performed in I2C
    fast mode. When the slave is addressed, the I²C slave is disabled
    and the timing is compatible with I3C specifications (1)
  - connected: only i3c
  TDK ICM-42670-P:
     The device automatically switches to I3C after receiving 0x7E+W (2).


(1) That means the whole DAA must be done in open drain, which is not
enforced by the abstraction, the controller may or may not do the whole
DAA in open drain.
(2) No mention of the 0x7E+W high time, so I assume 200ns according to
(6.2 Note 9).

If I were to add support to it (6.2 Note 9), I wouldn't do it as runtime
configurable, but as a devicetree node, or even solely at the RTL logic,
as the default header waveform for the ENTDAA transfer.

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
> 
> this funciton is little bit long, I suggest use scoped_guard to make
> 	scoped_guard(spinlock, &master->ibi.lock) {
> 
> because it is spin_lock, so lock time should be as less as possible.
> 
> > +
> > +	data = i3c_dev_get_master_data(dev);
I can only move `data` before the lock.
And reformat the MDB var like this (the compiler should squash it).

  mdb = (((raw) >> 8) & GENMASK(7, 0));
  slot->data[0] = mdb;

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
> > +	while (!(readl(master->regs + REG_FIFO_STATUS) & REG_FIFO_STATUS_IBI_EMPTY)) {
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
> > +	if (pending & REG_IRQ_PENDING_CMDR) {
> > +		scoped_guard(spinlock_irqsave, &master->xferqueue.lock) {
> > +			adi_i3c_master_end_xfer_locked(master, pending);
> > +		}
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
> > +	struct adi_i3c_xfer *xfer __free(kfree) = NULL;
> > +	int i;
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
> > +	}
> > +
> > +	adi_i3c_master_queue_xfer(master, xfer);
> > +	if (!wait_for_completion_timeout(&xfer->comp,
> > +					 m->i2c.timeout))
> > +		adi_i3c_master_unqueue_xfer(master, xfer);
> > +
> > +	return xfer->ret;
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
> > +	unsigned int i;
> > +
> > +	data = i3c_dev_get_master_data(dev);
> > +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> > +	if (IS_ERR(data->ibi_pool))
> > +		return PTR_ERR(data->ibi_pool);
> > +
> > +	scoped_guard(spinlock_irqsave, &master->ibi.lock) {
> > +		for (i = 0; i < master->ibi.num_slots; i++) {
> > +			if (!master->ibi.slots[i]) {
> > +				data->ibi = i;
> > +				master->ibi.slots[i] = dev;
> > +				break;
> > +			}
> > +		}
> > +	}
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
> > +
> > +	scoped_guard(spinlock_irqsave, &master->ibi.lock) {
> > +		master->ibi.slots[data->ibi] = NULL;
> > +	}
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
> 
> binding compatible string changed, you need update here also.
> 
> Frank
> 
Yes. Thank you.

Best regards,
Jorge
> > +	{}
> > +};
> > +
> > +static int adi_i3c_master_probe(struct platform_device *pdev)
> > +{
> > +	struct adi_i3c_master *master;
> > +	struct clk_bulk_data *clk;
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
> > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clk);
> > +	if (ret < 0)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "Failed to get clocks\n");
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	version = readl(master->regs + ADI_AXI_REG_VERSION);
> > +	if (ADI_AXI_PCORE_VER_MAJOR(version) != 0)
> > +		dev_err_probe(&pdev->dev, -ENODEV, "Unsupported peripheral version %u.%u.%u\n",
> > +			      ADI_AXI_PCORE_VER_MAJOR(version),
> > +			      ADI_AXI_PCORE_VER_MINOR(version),
> > +			      ADI_AXI_PCORE_VER_PATCH(version));
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
> > +	master->free_rr_slots = GENMASK(MAX_DEVS, 1);
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
> > +	spin_lock_init(&master->xferqueue.lock);
> > +	INIT_LIST_HEAD(&master->xferqueue.list);
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
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c
