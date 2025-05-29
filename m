Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CA1E8326;
	Thu, 29 May 2025 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517453; cv=none; b=D+OwR0DwFM0/JdepR9gOGQlrYZgLxVvReFRxKnbaEdS9Lqs3L0Po5RRPz8EngYjaF6Yz+mmC4rFVdFBUMBf0CL5ihLcIhTZtMHgiInD97CDgUi7HUZ4qC1Kj3U22vFwbYnJyZgYWjDoyKPtxZDedzdeqbaj/97L+1XVGkfUQwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517453; c=relaxed/simple;
	bh=tvIVFwDVFikH3SyG51Hbn5TG8e+E83JqNfhqx5+ohQI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gafyB7lPN6GyW9b+/NUEjTIwKX3amDIOKEXaVfqBHNJdJDdSFL638kvFWlwFwAad33WI5icQx9HHmLKH36AqjP1P2w6b7NiYG5LvlQ2veWktCbxBlXT/4exZO/14nF+nAgRO8qRay0A7r3qJ2HTOw3nS3qfpO8ZzSsd6tmLMFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7NzL6PjHz67btf;
	Thu, 29 May 2025 19:13:50 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 5188514022E;
	Thu, 29 May 2025 19:17:27 +0800 (CST)
Received: from localhost (10.203.177.99) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:17:26 +0200
Date: Thu, 29 May 2025 12:17:21 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
	<sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>, Jiri
 Slaby <jirislaby@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 21/26] irqchip/gic-v5: Add GICv5 IRS/SPI support
Message-ID: <20250529121721.000066fb.alireza.sanaee@huawei.com>
In-Reply-To: <aDgplizfKU/iFwe/@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-21-b36e9b15a6c3@kernel.org>
	<20250528170318.00001dd8@huawei.com>
	<aDgc7URS+jPBlfQX@lpieralisi>
	<20250529094519.0000460e.alireza.sanaee@huawei.com>
	<aDgplizfKU/iFwe/@lpieralisi>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Thu, 29 May 2025 11:32:06 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> On Thu, May 29, 2025 at 09:45:19AM +0100, Alireza Sanaee wrote:
> 
> [...]
> 
> > > > cpus is a phandle? I think this is going to run into current
> > > > discussion on what phandles to CPUs on an SMT system look like
> > > > (Rob Herring and Mark Rutland have different views)
> > > > https://lore.kernel.org/linux-arm-kernel/20250512080715.82-1-alireza.sanaee@huawei.com/    
> > > 
> > > I will make sure to steer clear of that then ;-), whatever the
> > > outcome the current "cpus" bindings should continue to work
> > > as-is, right ? 
> > > > Anyhow this doesn't look right to me.
> > > > I think it should be of_count_phandle_with_args()     
> > > 
> > > Aren't they equivalent in functionality if
> > > of_count_phandle_with_args() cells_name == NULL ?
> > > 
> > > I will update the code but if the functionality provided is not
> > > the same there is kernel code to fix (it is an example, there are
> > > others):
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-apple-aic.c?h=v6.15#n903  
> > 
> > I think this is fine, as long as we have always len(reg) == 1 which
> > is our current case in the dt.  
> 
> I don't understand what you mean. "cpus" is a list of phandles, what
> has "reg" got to do with it ?
> 
> "reg" of which node ? "cpu" ? why should it be that len(reg) == 1
> always ? It describes MPIDR_EL1, it depends on the "cpus" _node_
> #address-cells.
> 
> I am missing something from the thread above probably.
> 
> Lorenzo

Hi Lorenzo,

This goes back to the Rob and Mark discussion in regards to
representing SMTs.

With SMTs if cpu-node reg property has
more than one entry, then you probably have to count them and also ref
them differently.

But if every single SMT is a cpu-node in the DT (which is indeed how
things are currently), it is fine.

Thanks,
Alireza
> 
> > >   
> > > > Potentially with cpu-cells as the argument depending on how that
> > > > thread goes.
> > > >     
> > > > > +	if (ncpus < 0)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	niaffids = of_property_count_elems_of_size(node,
> > > > > "arm,iaffids",
> > > > > +
> > > > > sizeof(u16));
> > > > > +	if (niaffids != ncpus)
> > > > > +		return -EINVAL;
> > > > > +    
> > > > 	u16 *iaffids __free(kfree) = kcalloc(niaffids,
> > > > sizeof(*iaffids), GFP_KERNEL);    
> > > 
> > > Maybe I should rewrite this in Rust :)
> > >   
> > > > > +	iaffids = kcalloc(niaffids, sizeof(*iaffids),
> > > > > GFP_KERNEL);
> > > > > +	if (!iaffids)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	ret = of_property_read_u16_array(node, "arm,iaffids",
> > > > > iaffids, niaffids);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	for (i = 0; i < ncpus; i++) {
> > > > > +		struct device_node *cpu_node;
> > > > > +		u32 cpu_phandle;
> > > > > +		int cpu;
> > > > > +
> > > > > +		if (of_property_read_u32_index(node, "cpus",
> > > > > i, &cpu_phandle))
> > > > > +			continue;
> > > > > +
> > > > > +		cpu_node =
> > > > > of_find_node_by_phandle(cpu_phandle); 
> > > > 
> > > > 		cpu_node = of_parse_phandle(node, "cpus", i);
> > > > 
> > > > not work here?    
> > > 
> > > I think it would.
> > >   
> > > >      
> > > > > +		if (WARN_ON(!cpu_node))
> > > > > +			continue;
> > > > > +
> > > > > +		cpu = of_cpu_node_to_id(cpu_node);    
> > > > 
> > > > If this is all you want then Ali's series gives you a helper
> > > > 
> > > > 		cpu = of_cpu_phandle_to_id(node, &cpu_node, i);
> > > > 
> > > > Though even better to have a helper that allows
> > > > 		cpu = of_cpu_phandle_to_id(node, NULL, i); and
> > > > handles the node put as internally.
> > > > 
> > > > Ali, any reason we can't do that?  Seems to be a fairly common
> > > > pattern.
> > > > 
> > > > 
> > > >      
> > > > > +		of_node_put(cpu_node);
> > > > > +		if (WARN_ON(cpu < 0))
> > > > > +			continue;
> > > > > +
> > > > > +		if (iaffids[i] & ~iaffid_mask) {
> > > > > +			pr_warn("CPU %d iaffid 0x%x exceeds
> > > > > IRS iaffid bits\n",
> > > > > +				cpu, iaffids[i]);
> > > > > +			continue;
> > > > > +		}
> > > > > +
> > > > > +		per_cpu(cpu_iaffid, cpu).iaffid = iaffids[i];
> > > > > +		per_cpu(cpu_iaffid, cpu).valid = true;
> > > > > +
> > > > > +		/* We also know that the CPU is connected to
> > > > > this IRS */
> > > > > +		per_cpu(per_cpu_irs_data, cpu) = irs_data;
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}    
> > > >     
> > > > > diff --git a/drivers/irqchip/irq-gic-v5.c
> > > > > b/drivers/irqchip/irq-gic-v5.c index
> > > > > a50982e5d98816d88e4fca37cc0ac31684fb6c76..e58ff345dbfaf840b17ad63c4fdb6c227137cf4b
> > > > > 100644 --- a/drivers/irqchip/irq-gic-v5.c +++
> > > > > b/drivers/irqchip/irq-gic-v5.c
> > > > >
> > > > > +
> > > > > +static int gicv5_spi_irq_set_irqchip_state(struct irq_data
> > > > > *d,
> > > > > +					   enum
> > > > > irqchip_irq_state which,
> > > > > +					   bool val)
> > > > > +{    
> > > > 
> > > > Similar to previous, I'd call the state parameter state rather
> > > > than val.    
> > > 
> > > Right.
> > >   
> > > > > diff --git a/include/linux/irqchip/arm-gic-v5.h
> > > > > b/include/linux/irqchip/arm-gic-v5.h index
> > > > > 4ff0ba64d9840c3844671f7850bb3d81ba2eb1b6..187af307de9170d9569898cb1e50de376a38bd0a
> > > > > 100644 --- a/include/linux/irqchip/arm-gic-v5.h +++
> > > > > b/include/linux/irqchip/arm-gic-v5.h @@ -5,6 +5,8 @@
> > > > >  #ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
> > > > >  #define __LINUX_IRQCHIP_ARM_GIC_V5_H    
> > > >     
> > > > >  
> > > > > +#define GICV5_NO_READ_ALLOC		0b0
> > > > > +#define GICV5_READ_ALLOC		0b1
> > > > > +#define GICV5_NO_WRITE_ALLOC		0b0
> > > > > +#define GICV5_WRITE_ALLOC		0b1    
> > > > 
> > > > Given these are being written to fields called _RA and _WA
> > > > so the defines provide value over 0 and 1 in appropriate places?
> > > > Maybe just about. Anyhow, your code so on this up to you.
> > > >     
> > > > > +
> > > > > +#define GICV5_NON_CACHE			0b00
> > > > > +#define GICV5_WB_CACHE			0b01
> > > > > +#define GICV5_WT_CACHE			0b10
> > > > > +
> > > > > +#define GICV5_NON_SHARE			0b00
> > > > > +#define GICV5_OUTER_SHARE		0b10
> > > > > +#define GICV5_INNER_SHARE		0b11
> > > > > +
> > > > > +#define GICV5_IRS_IDR1			0x0004
> > > > > +#define GICV5_IRS_IDR2			0x0008
> > > > > +#define GICV5_IRS_IDR5			0x0014
> > > > > +#define GICV5_IRS_IDR6			0x0018
> > > > > +#define GICV5_IRS_IDR7			0x001c
> > > > > +#define GICV5_IRS_CR0			0x0080
> > > > > +#define GICV5_IRS_CR1			0x0084
> > > > > +#define GICV5_IRS_SPI_SELR		0x0108
> > > > > +#define GICV5_IRS_SPI_CFGR		0x0114
> > > > > +#define GICV5_IRS_SPI_STATUSR		0x0118
> > > > > +#define GICV5_IRS_PE_SELR		0x0140
> > > > > +#define GICV5_IRS_PE_STATUSR		0x0144
> > > > > +#define GICV5_IRS_PE_CR0		0x0148    
> > > > 
> > > > Blank line here as this is end of register offsets.    
> > > 
> > > Yep, fixed it.
> > > 
> > > Thanks for having a look !
> > > Lorenzo
> > >   
> > > > > +#define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
> > > > > +#define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)    
> > > > 
> > > > 
> > > >     
> > >   
> >   
> 
> 

