Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2732315E97;
	Thu, 29 May 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511136; cv=none; b=azfGllDBZxFdIxIxenXubBdTew7I6bkumJ5DMD/Vp8u/LCgC/Da3TmlWhrZXNd4PeSxD76xOsD2qA+xOssOLeWS70U6L/40a0IqNmtmUDmNL5IbpFrCGm01oSCpggv4O9CMBVjIWl+WiDnEib27qcp3bCa6PNgWq6by92lq98rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511136; c=relaxed/simple;
	bh=D7Q7izIW/18YWGsGj6j6P8khrUe3PYv7VUdiwcpCC5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWVSJuIDsmTkGu1m9uwlPTN4uud6NRzeVcduLZOGBgjxmy6c8Cpq4g51J82bES/h0p4ZmefI2Ji2/467g5rwcyz87CvTWHXN2hb6/pX1PTgOORiBuReCoJduA1sItNmduzF+DASw51zjLgh48WExpEfYvV3h13ULstEFBf8ruNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnyyvfLk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnyyvfLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F5CC4CEE7;
	Thu, 29 May 2025 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748511134;
	bh=D7Q7izIW/18YWGsGj6j6P8khrUe3PYv7VUdiwcpCC5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnyyvfLkjjmtiTA/MlSNXebX4gCvoyHDRGQOdN4l9YN9OOnA2RTodUchiyyeAh/1R
	 lVJabYFS2K6F9YoLwBqxTtfNGheD2ASHH99XY9EhisamrDo7WeYxLOri/uN0oCvIRI
	 kombMr3qmYidzYJ4N5oGuDG4vjuFRggSbAUTedK5wH1HHnHFPvSFBuXlRRRbtd7+QD
	 EyEgr50WWtFLwFq1v07BUyCZAhEpdyqPYKe2p1Oht+fv00/nFSqxxymudhuDM/RS9q
	 RPZCC3KJuQzMMPmQeojysiA7q7RQgFpa+ohW/yOhqUuUqv09q5cZbQAxglGQ1NWL/G
	 taI/UG22PcyXw==
Date: Thu, 29 May 2025 11:32:06 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 21/26] irqchip/gic-v5: Add GICv5 IRS/SPI support
Message-ID: <aDgplizfKU/iFwe/@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-21-b36e9b15a6c3@kernel.org>
 <20250528170318.00001dd8@huawei.com>
 <aDgc7URS+jPBlfQX@lpieralisi>
 <20250529094519.0000460e.alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529094519.0000460e.alireza.sanaee@huawei.com>

On Thu, May 29, 2025 at 09:45:19AM +0100, Alireza Sanaee wrote:

[...]

> > > cpus is a phandle? I think this is going to run into current
> > > discussion on what phandles to CPUs on an SMT system look like (Rob
> > > Herring and Mark Rutland have different views)
> > > https://lore.kernel.org/linux-arm-kernel/20250512080715.82-1-alireza.sanaee@huawei.com/  
> > 
> > I will make sure to steer clear of that then ;-), whatever the outcome
> > the current "cpus" bindings should continue to work as-is, right ?
> > 
> > > Anyhow this doesn't look right to me.
> > > I think it should be of_count_phandle_with_args()   
> > 
> > Aren't they equivalent in functionality if
> > of_count_phandle_with_args() cells_name == NULL ?
> > 
> > I will update the code but if the functionality provided is not the
> > same there is kernel code to fix (it is an example, there are others):
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-apple-aic.c?h=v6.15#n903
> 
> I think this is fine, as long as we have always len(reg) == 1 which
> is our current case in the dt.

I don't understand what you mean. "cpus" is a list of phandles, what
has "reg" got to do with it ?

"reg" of which node ? "cpu" ? why should it be that len(reg) == 1
always ? It describes MPIDR_EL1, it depends on the "cpus" _node_
#address-cells.

I am missing something from the thread above probably.

Lorenzo

> > 
> > > Potentially with cpu-cells as the argument depending on how that
> > > thread goes.
> > >   
> > > > +	if (ncpus < 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	niaffids = of_property_count_elems_of_size(node,
> > > > "arm,iaffids",
> > > > +						   sizeof(u16));
> > > > +	if (niaffids != ncpus)
> > > > +		return -EINVAL;
> > > > +  
> > > 	u16 *iaffids __free(kfree) = kcalloc(niaffids,
> > > sizeof(*iaffids), GFP_KERNEL);  
> > 
> > Maybe I should rewrite this in Rust :)
> > 
> > > > +	iaffids = kcalloc(niaffids, sizeof(*iaffids),
> > > > GFP_KERNEL);
> > > > +	if (!iaffids)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	ret = of_property_read_u16_array(node, "arm,iaffids",
> > > > iaffids, niaffids);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	for (i = 0; i < ncpus; i++) {
> > > > +		struct device_node *cpu_node;
> > > > +		u32 cpu_phandle;
> > > > +		int cpu;
> > > > +
> > > > +		if (of_property_read_u32_index(node, "cpus", i,
> > > > &cpu_phandle))
> > > > +			continue;
> > > > +
> > > > +		cpu_node = of_find_node_by_phandle(cpu_phandle);
> > > >  
> > > 
> > > 		cpu_node = of_parse_phandle(node, "cpus", i);
> > > 
> > > not work here?  
> > 
> > I think it would.
> > 
> > >    
> > > > +		if (WARN_ON(!cpu_node))
> > > > +			continue;
> > > > +
> > > > +		cpu = of_cpu_node_to_id(cpu_node);  
> > > 
> > > If this is all you want then Ali's series gives you a helper
> > > 
> > > 		cpu = of_cpu_phandle_to_id(node, &cpu_node, i);
> > > 
> > > Though even better to have a helper that allows
> > > 		cpu = of_cpu_phandle_to_id(node, NULL, i); and
> > > handles the node put as internally.
> > > 
> > > Ali, any reason we can't do that?  Seems to be a fairly common
> > > pattern.
> > > 
> > > 
> > >    
> > > > +		of_node_put(cpu_node);
> > > > +		if (WARN_ON(cpu < 0))
> > > > +			continue;
> > > > +
> > > > +		if (iaffids[i] & ~iaffid_mask) {
> > > > +			pr_warn("CPU %d iaffid 0x%x exceeds IRS
> > > > iaffid bits\n",
> > > > +				cpu, iaffids[i]);
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		per_cpu(cpu_iaffid, cpu).iaffid = iaffids[i];
> > > > +		per_cpu(cpu_iaffid, cpu).valid = true;
> > > > +
> > > > +		/* We also know that the CPU is connected to
> > > > this IRS */
> > > > +		per_cpu(per_cpu_irs_data, cpu) = irs_data;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}  
> > >   
> > > > diff --git a/drivers/irqchip/irq-gic-v5.c
> > > > b/drivers/irqchip/irq-gic-v5.c index
> > > > a50982e5d98816d88e4fca37cc0ac31684fb6c76..e58ff345dbfaf840b17ad63c4fdb6c227137cf4b
> > > > 100644 --- a/drivers/irqchip/irq-gic-v5.c +++
> > > > b/drivers/irqchip/irq-gic-v5.c
> > > >
> > > > +
> > > > +static int gicv5_spi_irq_set_irqchip_state(struct irq_data *d,
> > > > +					   enum
> > > > irqchip_irq_state which,
> > > > +					   bool val)
> > > > +{  
> > > 
> > > Similar to previous, I'd call the state parameter state rather than
> > > val.  
> > 
> > Right.
> > 
> > > > diff --git a/include/linux/irqchip/arm-gic-v5.h
> > > > b/include/linux/irqchip/arm-gic-v5.h index
> > > > 4ff0ba64d9840c3844671f7850bb3d81ba2eb1b6..187af307de9170d9569898cb1e50de376a38bd0a
> > > > 100644 --- a/include/linux/irqchip/arm-gic-v5.h +++
> > > > b/include/linux/irqchip/arm-gic-v5.h @@ -5,6 +5,8 @@
> > > >  #ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
> > > >  #define __LINUX_IRQCHIP_ARM_GIC_V5_H  
> > >   
> > > >  
> > > > +#define GICV5_NO_READ_ALLOC		0b0
> > > > +#define GICV5_READ_ALLOC		0b1
> > > > +#define GICV5_NO_WRITE_ALLOC		0b0
> > > > +#define GICV5_WRITE_ALLOC		0b1  
> > > 
> > > Given these are being written to fields called _RA and _WA
> > > so the defines provide value over 0 and 1 in appropriate places?
> > > Maybe just about. Anyhow, your code so on this up to you.
> > >   
> > > > +
> > > > +#define GICV5_NON_CACHE			0b00
> > > > +#define GICV5_WB_CACHE			0b01
> > > > +#define GICV5_WT_CACHE			0b10
> > > > +
> > > > +#define GICV5_NON_SHARE			0b00
> > > > +#define GICV5_OUTER_SHARE		0b10
> > > > +#define GICV5_INNER_SHARE		0b11
> > > > +
> > > > +#define GICV5_IRS_IDR1			0x0004
> > > > +#define GICV5_IRS_IDR2			0x0008
> > > > +#define GICV5_IRS_IDR5			0x0014
> > > > +#define GICV5_IRS_IDR6			0x0018
> > > > +#define GICV5_IRS_IDR7			0x001c
> > > > +#define GICV5_IRS_CR0			0x0080
> > > > +#define GICV5_IRS_CR1			0x0084
> > > > +#define GICV5_IRS_SPI_SELR		0x0108
> > > > +#define GICV5_IRS_SPI_CFGR		0x0114
> > > > +#define GICV5_IRS_SPI_STATUSR		0x0118
> > > > +#define GICV5_IRS_PE_SELR		0x0140
> > > > +#define GICV5_IRS_PE_STATUSR		0x0144
> > > > +#define GICV5_IRS_PE_CR0		0x0148  
> > > 
> > > Blank line here as this is end of register offsets.  
> > 
> > Yep, fixed it.
> > 
> > Thanks for having a look !
> > Lorenzo
> > 
> > > > +#define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
> > > > +#define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)  
> > > 
> > > 
> > >   
> > 
> 
