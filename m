Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8404B1E63
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747357195; cv=none; b=M6CDhmooWCNetEW84HApLWx/H9PTG6GvEmONMlHREzQirKNXPqWQUPLs7Rgit2uSHk6ECUTVwkaTTu6B+iBo8gMYOB+5KzlKn/IATHVzNCVfTIHX3wO6iEux9uLq8ltqSX3lZXnni4Yj+LGDW04zlXBJ0qD39gs7E3wMpg1QkeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747357195; c=relaxed/simple;
	bh=QK99jlTxzSrD8GYe8ICI0Cky/DYqE+Sfoh3ij1u3sII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLsXw8o7CLsKBgtBPKJceQcAQFX7N7dZO/o6YlqAeliBVyF2plybFEmCQeli+1BTCpaTjFgyrNhaolnwS7J/5XKoZ5ib5QbnUWDsacrGIt5fubWHBvHNPvogYAhUaM6B2Q7Mq41HCHMWRh3xpzO7LA7xNFV7gmvmTF/q/3zDxyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=J9SH2qsu; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="J9SH2qsu"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-730580b0de8so1808967a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1747357191; x=1747961991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lSVGOCCQRkHI+KN0h6m6NVcznAgAUXi3SggTF2KH/g=;
        b=J9SH2qsuksebi8F/AMVSjGfh/ndcPZ4y9qKYa6UEYm+L++K/oqicV1+WdTSa8FhKRu
         JHmSgCykTz/ULoq4wRCGBOP6cvvjfIeG82Zdam57XdjzVfuMK7aubju5m3ozm/O0iyyI
         ozeMTpYsZywCkepCSxhZk/IotXpbcAlPOTQxp2QpYrti7RzjqInFVMHloFoZx7Is9Tad
         3hegSu/NyWkoHTRc4F9tM9lE1ItaOH0MejO2bXBuGEmzgZPaUoKXqKo4jAXtF8mXoijf
         6rQUwOqc8Xwzg6bHAPHl0U7OTMBpm+RrzQVn7xPPX7ZYkdnaLUnsEEcVa0NgrSNFIRA5
         LqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747357191; x=1747961991;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lSVGOCCQRkHI+KN0h6m6NVcznAgAUXi3SggTF2KH/g=;
        b=UUp7nV+F9BsNVT3dh+8uqSmNIqtR3iZFJWPi7nZ7qXzsiPLs6x1jhOrmIMd5316Wsm
         MQhExME7bFgDE7wtAH6DwRUmfNA5RcrEVL9GI1cmEK6XRW2jj6aN8bSF6t2cKWqXr/TR
         sW0USzP6ClU3QSJHdBc5fa65j4eACR5HOdH/gy4aYmYx0mZVuRuQDUsCmGThnscIk+cx
         zbumS0A6WDp2WBfLef/qoBA/2Tw1gnoqGiLnCGudJIxNddJLEhvRG01d1Xidmy3Tg4ee
         ZFa7N0gZa2ghwG/aFdwVD4fM3eeP3N70LbjJYFm0PNSyobPFIV04z+AiEb4maOFo56mW
         Py2w==
X-Forwarded-Encrypted: i=1; AJvYcCW2QkxmVOS9/NoRNt7LW5rjAVIFHix5QK+7XLAXDrtOVk0nECsDkSNFuabmFEfPePuWLxl3kpNuWBRwOS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhXKdv32uto/X2Ikx4v2Z6T7MGztaIcb+SgCPFhQNap6acDqq
	cmdVqjCbM/pe+6cfRglzewHjyw5ICOWLQq1ed88ZsaTJE9OY4+cy7cwnYdlM0WM775M=
X-Gm-Gg: ASbGncuxKHPdvfOQDNdbO99U7zVbJzaFQxfwNsdxs/KkLaLV5M/W2+c31uHH411g9/3
	tILr+BrNWE+xziIvD54ImZ2SaaVJQPAJfySVsrNuYc3qhNg7Lu3c+FBNXWHrs/K8rP7dw/0Ru5q
	f577cNvQ84k8sliC8Dwioy/QoNnqf9wbRchEgUmpTRVPJqD1z3Q/JPUf8z+IMCtHOEuzUOncj4M
	qBDOql9AUrKniHBXwqdDg+56Vn0WX+vBXmFdbguurqvaJcmFju3hlzLCkKkyGwdX+nq5f1Y7mpo
	6vJ8Wziq+RVCVgvB29CEVZnuFeQAAf0iG89pm9nXZOpdqiSyFAa9UM8=
X-Google-Smtp-Source: AGHT+IEXrn7R9cmcMwEuGNM6Agx5Q+PXzeVpg0mfgBHl3pli4HpMG0xvmYDc+378blHepXiD82F0lA==
X-Received: by 2002:a05:6830:2a9e:b0:723:7853:8791 with SMTP id 46e09a7af769-734f6d13facmr898942a34.0.1747357190711;
        Thu, 15 May 2025 17:59:50 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:d0c5:1ce0:9035:258c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a9a7adsm171095a34.30.2025.05.15.17.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:59:50 -0700 (PDT)
Date: Thu, 15 May 2025 19:59:45 -0500
From: Corey Minyard <corey@minyard.net>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v2 2/3] ipmi: Add Loongson-2K BMC support
Message-ID: <aCaOAVgb8V7_-rLR@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
 <0963b8274bfe25a21f56da9fcba05830fb43408b.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0963b8274bfe25a21f56da9fcba05830fb43408b.1747276047.git.zhoubinbin@loongson.cn>

On Thu, May 15, 2025 at 10:32:25AM +0800, Binbin Zhou wrote:
> This patch adds Loongson-2K BMC IPMI support.
> 
> According to the existing design, we use software simulation to
> implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.

This is a strange way to do this.  My preference would be to have a
separate driver for this and not put it under the ipmi_si driver.
But it's annoyingly close and it would duplicate a lot of ipmi_si_intf.c
Anyway, I think I'm ok with this basic design.  But there are problems.

> 
> Also since both host side and BMC side read and write kcs status, I use
> fifo pointer to ensure data consistency.

I assume this fifo pointer is part of the interface hardware or the
implementation on the other side of the interface.

> 
> Therefore I made the whole IPMI driver independent.

What do you mean by this statement?

More comments inline.

> 
> Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmi_si.h      |   7 +
>  drivers/char/ipmi/ipmi_si_intf.c |   3 +
>  drivers/char/ipmi/ipmi_si_ls2k.c | 250 +++++++++++++++++++++++++++++++
>  4 files changed, 261 insertions(+)
>  create mode 100644 drivers/char/ipmi/ipmi_si_ls2k.c
> 
> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> index e0944547c9d0..5eb3494f5f39 100644
> --- a/drivers/char/ipmi/Makefile
> +++ b/drivers/char/ipmi/Makefile
> @@ -8,6 +8,7 @@ ipmi_si-y := ipmi_si_intf.o ipmi_kcs_sm.o ipmi_smic_sm.o ipmi_bt_sm.o \
>  	ipmi_si_mem_io.o
>  ipmi_si-$(CONFIG_HAS_IOPORT) += ipmi_si_port_io.o
>  ipmi_si-$(CONFIG_PCI) += ipmi_si_pci.o
> +ipmi_si-$(CONFIG_LOONGARCH) += ipmi_si_ls2k.o

Shouldn't this be dependent on MFD_LS2K_BMC?  It appears you can disable
that and still have CONFIG_LOONGARCH enabled.

And this MFD can have multiple things hanging off of it, wouldn't you
want to make the individual drivers their own CONFIG items?

>  ipmi_si-$(CONFIG_PARISC) += ipmi_si_parisc.o
>  
>  obj-$(CONFIG_IPMI_HANDLER) += ipmi_msghandler.o
> diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
> index a7ead2a4c753..71f1d4e1272c 100644
> --- a/drivers/char/ipmi/ipmi_si.h
> +++ b/drivers/char/ipmi/ipmi_si.h
> @@ -93,6 +93,13 @@ void ipmi_si_pci_shutdown(void);
>  static inline void ipmi_si_pci_init(void) { }
>  static inline void ipmi_si_pci_shutdown(void) { }
>  #endif
> +#ifdef CONFIG_LOONGARCH
> +void ipmi_si_ls2k_init(void);
> +void ipmi_si_ls2k_shutdown(void);
> +#else
> +static inline void ipmi_si_ls2k_init(void) { }
> +static inline void ipmi_si_ls2k_shutdown(void) { }
> +#endif

I'm not excited about this, but there is history, I guess.

Same comment as the Makefile on CONFIG_LOONGARCH.

>  #ifdef CONFIG_PARISC
>  void ipmi_si_parisc_init(void);
>  void ipmi_si_parisc_shutdown(void);
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 12b0b77eb1cc..323da77698ea 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2107,6 +2107,7 @@ static int __init init_ipmi_si(void)
>  
>  	ipmi_si_pci_init();
>  
> +	ipmi_si_ls2k_init();
>  	ipmi_si_parisc_init();
>  
>  	/* We prefer devices with interrupts, but in the case of a machine
> @@ -2288,6 +2289,8 @@ static void cleanup_ipmi_si(void)
>  
>  	ipmi_si_pci_shutdown();
>  
> +	ipmi_si_ls2k_shutdown();
> +
>  	ipmi_si_parisc_shutdown();
>  
>  	ipmi_si_platform_shutdown();
> diff --git a/drivers/char/ipmi/ipmi_si_ls2k.c b/drivers/char/ipmi/ipmi_si_ls2k.c
> new file mode 100644
> index 000000000000..cb31bb989fca
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmi_si_ls2k.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Loongson-2K BMC IPMI
> + *
> + * Copyright (C) 2024 Loongson Technology Corporation Limited.
> + *
> + * Originally written by Chong Qiao <qiaochong@loongson.cn>
> + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
> + */
> +
> +#include <linux/ioport.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include "ipmi_si.h"
> +
> +#define LS2K_KCS_STS_OBF	BIT(0)
> +#define LS2K_KCS_STS_IBF	BIT(1)
> +#define LS2K_KCS_STS_SMS_ATN	BIT(2)
> +#define LS2K_KCS_STS_CMD	BIT(3)
> +
> +#define LS2K_KCS_DATA_MASK	(LS2K_KCS_STS_OBF | LS2K_KCS_STS_IBF | LS2K_KCS_STS_CMD)
> +
> +/* Read and write fifo pointers for data consistency. */
> +struct ls2k_fifo_flag {
> +	u8 ibfh;
> +	u8 ibft;
> +	u8 obfh;
> +	u8 obft;
> +};
> +
> +struct ls2k_kcs_reg {
> +	u8 status;
> +	u8 data_out;
> +	s16 data_in;
> +	s16 cmd;
> +};
> +
> +struct ls2k_kcs_data {
> +	struct ls2k_fifo_flag fifo;
> +	struct ls2k_kcs_reg reg;
> +	u8 cmd_data;
> +	u8 version;
> +	u32 write_req;
> +	u32 write_ack;
> +	u32 reserved[2];
> +};

The above appears to be a memory overlay for registers.  But you aren't
using readb/writeb and associated functions to read/write it.  That is
not the right way to do things.  Please read
Documentation/driver-api/device-io.rst

> +
> +static void ls2k_set_obf(struct ls2k_kcs_data *ik, u8 sts)
> +{
> +	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_OBF) | (sts & BIT(0));
> +}
> +
> +static void ls2k_set_ibf(struct ls2k_kcs_data *ik, u8 sts)
> +{
> +	ik->reg.status = (ik->reg.status & ~LS2K_KCS_STS_IBF) | ((sts & BIT(0)) << 1);
> +}
> +
> +static u8 ls2k_get_ibf(struct ls2k_kcs_data *ik)
> +{
> +	return (ik->reg.status >> 1) & BIT(0);
> +}
> +
> +static unsigned char intf_sim_inb_v0(struct ls2k_kcs_data *ik,
> +				     unsigned int offset)
> +{
> +	u32 inb = 0;
> +
> +	switch (offset & BIT(0)) {
> +	case 0:
> +		inb = ik->reg.data_out;
> +		ls2k_set_obf(ik, 0);
> +		break;
> +	case 1:
> +		inb = ik->reg.status;
> +		break;
> +	}
> +
> +	return inb;
> +}
> +
> +static unsigned char intf_sim_inb_v1(struct ls2k_kcs_data *ik,
> +				     unsigned int offset)
> +{
> +	u32 inb = 0;
> +	int cmd;
> +	bool obf, ibf;
> +
> +	obf = ik->fifo.obfh != ik->fifo.obft;
> +	ibf = ik->fifo.ibfh != ik->fifo.ibft;
> +	cmd = ik->cmd_data;
> +
> +	switch (offset & BIT(0)) {
> +	case 0:
> +		inb = ik->reg.data_out;
> +		ik->fifo.obft = ik->fifo.obfh;
> +		break;
> +	case 1:
> +		inb = ik->reg.status & ~LS2K_KCS_DATA_MASK;
> +		inb |= obf | (ibf << 1) | (cmd << 3);
> +		break;
> +	}
> +
> +	return inb;
> +}
> +
> +static unsigned char ls2k_mem_inb(const struct si_sm_io *io,
> +				  unsigned int offset)
> +{
> +	struct ls2k_kcs_data *ik = io->addr;
> +	int inb = 0;
> +
> +	if (ik->version == 0)
> +		inb = intf_sim_inb_v0(ik, offset);
> +	else if (ik->version == 1)
> +		inb = intf_sim_inb_v1(ik, offset);
> +
> +	return inb;
> +}
> +
> +static void intf_sim_outb_v0(struct ls2k_kcs_data *ik, unsigned int offset,
> +			     unsigned char val)
> +{
> +	if (ls2k_get_ibf(ik))
> +		return;
> +
> +	switch (offset & BIT(0)) {
> +	case 0:
> +		ik->reg.data_in = val;
> +		ik->reg.status &= ~LS2K_KCS_STS_CMD;
> +		break;
> +
> +	case 1:
> +		ik->reg.cmd = val;
> +		ik->reg.status |= LS2K_KCS_STS_CMD;
> +		break;
> +	}
> +
> +	ls2k_set_ibf(ik, 1);
> +	ik->write_req++;
> +}
> +
> +static void intf_sim_outb_v1(struct ls2k_kcs_data *ik, unsigned int offset,
> +			     unsigned char val)
> +{
> +	if (ik->fifo.ibfh != ik->fifo.ibft)
> +		return;
> +
> +	switch (offset & BIT(0)) {
> +	case 0:
> +		ik->reg.data_in = val;
> +		ik->cmd_data = 0;
> +		break;
> +
> +	case 1:
> +		ik->reg.cmd = val;
> +		ik->cmd_data = 1;
> +		break;
> +	}
> +
> +	ik->fifo.ibfh = !ik->fifo.ibft;
> +	ik->write_req++;
> +}
> +
> +static void ls2k_mem_outb(const struct si_sm_io *io, unsigned int offset,
> +			  unsigned char val)
> +{
> +	struct ls2k_kcs_data *ik = io->addr;
> +
> +	if (ik->version == 0)
> +		intf_sim_outb_v0(ik, offset, val);
> +	else if (ik->version == 1)
> +		intf_sim_outb_v1(ik, offset, val);
> +}
> +
> +static void ls2k_mem_cleanup(struct si_sm_io *io)
> +{
> +	if (io->addr)
> +		iounmap(io->addr);
> +}
> +
> +static int ipmi_ls2k_sim_setup(struct si_sm_io *io)
> +{
> +	io->addr = ioremap(io->addr_data, io->regspacing);
> +	if (!io->addr)
> +		return -EIO;
> +
> +	io->inputb = ls2k_mem_inb;
> +	io->outputb = ls2k_mem_outb;
> +	io->io_cleanup = ls2k_mem_cleanup;
> +
> +	return 0;
> +}
> +
> +static int ipmi_ls2k_probe(struct platform_device *pdev)
> +{
> +	struct si_sm_io io;
> +
> +	dev_info(&pdev->dev, "probing via ls2k platform");
> +	memset(&io, 0, sizeof(io));
> +
> +	io.addr_source	= SI_PLATFORM;
> +	io.si_type	= SI_KCS;

si_type has been reworked recently, the linux next tree has the changes.
I'll need this modified to work with the linux next changes.

> +	io.addr_space	= IPMI_MEM_ADDR_SPACE;
> +	io.io_setup	= ipmi_ls2k_sim_setup;
> +	io.addr_data	= pdev->resource[0].start;
> +	io.regspacing	= pdev->resource[0].end - pdev->resource[0].start + 1;
> +	io.regsize	= DEFAULT_REGSIZE;
> +	io.regshift	= 0;

The above items, except for io_setup,  don't have much meaning for your
device; there's not much need to set them, and there's no need to
initialize things to zero.  They are for ipmi_si_port and ipmi_si_mem.

> +	io.dev		= &pdev->dev;
> +	io.irq		= 0;
> +	if (io.irq)
> +		io.irq_setup = ipmi_std_irq_setup;

Just remove the irq thing, don't set it to zero and then check it.

> +
> +	dev_info(&pdev->dev, "%pR regsize %d spacing %d irq %d\n",
> +		 &pdev->resource[0], io.regsize, io.regspacing, io.irq);
> +
> +	return ipmi_si_add_smi(&io);
> +}
> +
> +static void ipmi_ls2k_remove(struct platform_device *pdev)
> +{
> +	ipmi_si_remove_by_dev(&pdev->dev);
> +}
> +
> +struct platform_driver ipmi_ls2k_platform_driver = {
> +	.driver = {
> +		.name = "ls2k-ipmi-si",
> +	},
> +	.probe	= ipmi_ls2k_probe,
> +	.remove	= ipmi_ls2k_remove,
> +};
> +
> +static bool platform_registered;
> +void ipmi_si_ls2k_init(void)
> +{
> +	int rv;
> +
> +	rv = platform_driver_register(&ipmi_ls2k_platform_driver);
> +	if (rv)
> +		pr_err("Unable to register driver: %d\n", rv);

That's far to vague to be useful.

> +	else
> +		platform_registered = true;
> +}
> +
> +void ipmi_si_ls2k_shutdown(void)
> +{
> +	if (platform_registered)
> +		platform_driver_unregister(&ipmi_ls2k_platform_driver);
> +}
> -- 
> 2.47.1
> 
