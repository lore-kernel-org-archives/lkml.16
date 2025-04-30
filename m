Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD492609C5;
	Wed, 30 Apr 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030332; cv=none; b=k+lcWRx7aDtCsgNOk/zOgfvQO1MTpnXXF+EoDp1n2lI+kQeZKL8ymNUyltQaPTX2rnodEZWTOHCo8fciM5T61wxalZpz6QNauDP064u/ouS9jVgQCJUYOU6PzsIN/8PSM+4v9R47XzvRc158Uyd0J3mId8puN9wvoFmKFFNQabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030332; c=relaxed/simple;
	bh=uxA2/IFGQS2CsjppIpaZKosVTUIfJXCxRl+4zh0crMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6O+7pEbyHfaz5P+ArrtOWrlARXtXDyPh+DiaKBYz4PWa9DwHl8O2mqt6NcVaaQZBCdfy2hgZcA2c/gP8YUOzxtbVojpYjpKqSl3UpfjxIHpLGxdeDaxz7TjBnFHMWMOUWhJliBoHj9xB+/uwWPnUvjCfFuXzCvqA83x6hhMxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAfUnKiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAfUnKiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5D1C4CEE7;
	Wed, 30 Apr 2025 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746030331;
	bh=uxA2/IFGQS2CsjppIpaZKosVTUIfJXCxRl+4zh0crMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAfUnKiALUmjadUJ5Tz1NTAYk9gFmt1b4U0ASfky2uj6W7W8L7VdrOWkg+8mtLCng
	 A+F3u4+/3cGHHVD4eMetAFtKIANsC1bckXQa26fe7tTSaoQfd8RC7gZNbU/jK4VQEG
	 pMeVyK9CP3KdMRSLM1o6H2kMgU4gm9L74t2MyyKFfuxAVRQ5SU2SAOQnMIlvlS20kE
	 ZDrNw8bXvVN+pT6+NtQ3NTt/ZrSY6Pe47EplddRmzQYN+QR8anAswciC3t1uwhSkAu
	 8vhXLBNYFN5s2hKTs8rZ731kjuM1LYZ4Y5mdvTquBMMeQGsc809hpmnaEu3H47LW3U
	 jEQ2SJQSAMTXg==
Date: Wed, 30 Apr 2025 18:25:24 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBJO9GEyb+0t6W6u@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c31j20i.wl-maz@kernel.org>

On Wed, Apr 30, 2025 at 12:57:01PM +0100, Marc Zyngier wrote:
> On Thu, 24 Apr 2025 11:25:32 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
> > order to support wired interrupts that cannot be connected directly
> > to an IRS and instead uses the ITS to translate a wire event into
> > an IRQ signal.
> > 
> > An IWB is a special ITS device with its own deviceID; upon probe,
> > an IWB calls into the ITS driver to allocate DT/ITT tables for its
> > events (ie wires).
> > 
> > An IWB is always associated with a single ITS in the system.
> > 
> > An IWB is connected to an ITS and it has its own deviceID for all
> > interrupt wires that it manages; the IWB input wire number is
> > exposed to the ITS as an eventID. This eventID is not programmable
> > and therefore requires special handling in the ITS driver.
> > 
> > Add an IWB driver in order to:
> > 
> > - Probe IWBs in the system and allocate ITS tables
> > - Manage IWB IRQ domains
> > - Handle IWB input wires state (enable/disable)
> > - Add the required IWB IRQchip representation
> > - Handle firmware representation to Linux IRQ translation
> > 
> > Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/Makefile         |   2 +-
> >  drivers/irqchip/irq-gic-v5-its.c |  68 ++++++--
> >  drivers/irqchip/irq-gic-v5-iwb.c | 356 +++++++++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-gic-v5.c     |   2 +
> >  drivers/irqchip/irq-gic-v5.h     |  28 +++
> >  5 files changed, 437 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 4280395e3bdff7858102f0b4eaaea1121cace52f..7bfb2369fbe494a64b72308d95ae33de93c6b8c6 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -37,7 +37,7 @@ obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
> >  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
> >  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> >  obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
> > -obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o
> > +obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o irq-gic-v5-iwb.o
> >  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
> >  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
> >  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > index da349b4709cc5ec8978859237838f039389ca4a1..b5eb4dbfe2296dc6620889eb9291b542cae4aeb6 100644
> > --- a/drivers/irqchip/irq-gic-v5-its.c
> > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > @@ -786,9 +786,8 @@ static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *i
> >  	return dev ? dev : ERR_PTR(-ENODEV);
> >  }
> >  
> > -static struct gicv5_its_dev *gicv5_its_alloc_device(
> > -				struct gicv5_its_chip_data *its, int nvec,
> > -				u32 dev_id)
> > +struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
> > +					     int nvec, u32 dev_id, bool is_iwb)
> >  {
> >  	struct gicv5_its_dev *its_dev;
> >  	int ret;
> > @@ -815,6 +814,7 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  	its_dev->device_id = dev_id;
> >  	its_dev->num_events = nvec;
> >  	its_dev->num_mapped_events = 0;
> > +	its_dev->is_iwb = is_iwb;
> >  
> >  	ret = gicv5_its_device_register(its, its_dev);
> >  	if (ret) {
> > @@ -827,9 +827,11 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  
> >  	/*
> >  	 * This is the first time we have seen this device. Hence, it is not
> > -	 * shared.
> > +	 * shared, unless it is an IWB that is a shared ITS device by
> > +	 * definition, its eventids are hardcoded and never change - we allocate
> > +	 * it once for all and never free it.
> 
> I'm not convinced the IWB should be treated differently from any other
> device. Its lifetime is not tied to its inputs, so all that's needed
> is to probe it, get a bunch of interrupts, and that's about it.
> 
> The other thing is that the IWB really is a standalone thing. It
> shouldn't have its fingers in the ITS code, and should only rely on
> the core infrastructure to get its interrupts.
> 
> As much as I dislike it, the MBIGEN actually provides a decent example
> of how this could be structured.

I wrote a diff against the heavily reworked series in progress I have,
(so it does not apply on v2 - headers moved) with what I came up with
for the IWB MBIgen like. It works - it removes lots of boilerplate code
but there is a hack we never really liked in:

gicv5_its_msi_prepare()

that is, using the OF compatible string to detect if we are an IWB or not.

If we are, we use the msi_alloc_info_t->hwirq to define the LPI eventid,
basically the IWB wire, if not we just allocate an eventid available from
the device bitmap.

Other than that (and being forced to provide an IWB irqchip.irq_write_msi_msg()
pointer even if the IWB can't write anything otherwise we dereference
NULL) this works.

Is there a better way to implement this ? I would post this code with
v3 but instead of waiting I thought I could inline it here, feel free
to ignore it (or flame me if it is a solved problem I failed to spot,
we need to find a way for the IWB driver to pass the "fixed event" info
to the ITS - IWB eventIDs are hardwired it is not like the MBIgen where
the irq_write_msi_msg() callback programs the wire-to-eventid
translation in HW).

Thanks,
Lorenzo

-- >8 --
diff --git i/drivers/irqchip/irq-gic-v5-its.c w/drivers/irqchip/irq-gic-v5-its.c
index 7d35f3fe4fd9..96e8e1df53f3 100644
--- i/drivers/irqchip/irq-gic-v5-its.c
+++ w/drivers/irqchip/irq-gic-v5-its.c
@@ -826,13 +826,14 @@ static int gicv5_its_msi_prepare(struct irq_domain *domain, struct device *dev,
 	struct msi_domain_info *msi_info;
 	struct gicv5_its_chip_data *its;
 	struct gicv5_its_dev *its_dev;
+	bool is_iwb = of_device_is_compatible(dev->of_node, "arm,gic-v5-iwb");
 
 	msi_info = msi_get_domain_info(domain);
 	its = msi_info->data;
 
 	guard(mutex)(&its->dev_alloc_lock);
 
-	its_dev = gicv5_its_alloc_device(its, nvec, dev_id, false);
+	its_dev = gicv5_its_alloc_device(its, nvec, dev_id, is_iwb);
 	if (IS_ERR(its_dev))
 		return PTR_ERR(its_dev);
 
@@ -929,7 +930,7 @@ static int gicv5_its_alloc_eventid(struct gicv5_its_dev *its_dev,
 		if (WARN(nr_irqs != 1, "IWB requesting nr_irqs != 1\n"))
 			return -EINVAL;
 
-		event_id_base = info->scratchpad[1].ul;
+		event_id_base = info->hwirq;
 
 		if (event_id_base >= its_dev->num_events) {
 			pr_err("EventID ouside of ITT range; cannot allocate an ITT entry!\n");
diff --git i/drivers/irqchip/irq-gic-v5-iwb.c w/drivers/irqchip/irq-gic-v5-iwb.c
index c8bbfe877eda..ef801ca31f0c 100644
--- i/drivers/irqchip/irq-gic-v5-iwb.c
+++ w/drivers/irqchip/irq-gic-v5-iwb.c
@@ -11,6 +11,12 @@
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+struct gicv5_iwb_chip_data {
+	void __iomem		*iwb_base;
+	u16			nr_regs;
+};
 
 static u32 iwb_readl_relaxed(struct gicv5_iwb_chip_data *iwb_node,
 			     const u64 reg_offset)
@@ -74,6 +80,22 @@ static int gicv5_iwb_disable_wire(struct gicv5_iwb_chip_data *iwb_node,
 	return __gicv5_iwb_set_wire_enable(iwb_node, iwb_wire, false);
 }
 
+static void gicv5_iwb_irq_disable(struct irq_data *d)
+{
+	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
+
+	gicv5_iwb_disable_wire(iwb_node, d->hwirq);
+	irq_chip_disable_parent(d);
+}
+
+static void gicv5_iwb_irq_enable(struct irq_data *d)
+{
+	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
+
+	gicv5_iwb_enable_wire(iwb_node, d->hwirq);
+	irq_chip_enable_parent(d);
+}
+
 static int gicv5_iwb_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gicv5_iwb_chip_data *iwb_node = irq_data_get_irq_chip_data(d);
@@ -111,19 +133,11 @@ static int gicv5_iwb_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static const struct irq_chip gicv5_iwb_chip = {
-	.name			= "GICv5-IWB",
-	.irq_mask		= irq_chip_mask_parent,
-	.irq_unmask		= irq_chip_unmask_parent,
-	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_set_type		= gicv5_iwb_set_type,
-	.irq_set_affinity	= irq_chip_set_affinity_parent,
-	.irq_get_irqchip_state	= irq_chip_get_parent_state,
-	.irq_set_irqchip_state	= irq_chip_set_parent_state,
-	.flags			= IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE |
-				  IRQCHIP_MASK_ON_SUSPEND
-};
+static void gicv5_iwb_domain_set_desc(msi_alloc_info_t *arg, struct msi_desc *desc)
+{
+	arg->desc = desc;
+	arg->hwirq = (u32)desc->data.icookie.value;
+}
 
 static int gicv5_iwb_irq_domain_translate(struct irq_domain *d,
 					  struct irq_fwspec *fwspec,
@@ -146,123 +160,67 @@ static int gicv5_iwb_irq_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
-static void gicv5_iwb_irq_domain_free(struct irq_domain *domain,
-				      unsigned int virq, unsigned int nr_irqs)
-{
-	/* Free the local data, and then go up the hierarchy doing the same */
-	struct gicv5_iwb_chip_data *iwb_node = domain->host_data;
-	struct irq_data *data;
+static void gicv5_iwb_write_msi_msg(struct irq_data *d, struct msi_msg *msg) {}
 
-	if (WARN_ON_ONCE(nr_irqs != 1))
-		return;
+static const struct msi_domain_template iwb_msi_template = {
+	.chip = {
+		.name			= "GICv5-IWB",
+		.irq_mask		= irq_chip_mask_parent,
+		.irq_unmask		= irq_chip_unmask_parent,
+		.irq_enable		= gicv5_iwb_irq_enable,
+		.irq_disable		= gicv5_iwb_irq_disable,
+		.irq_eoi		= irq_chip_eoi_parent,
+		.irq_set_type		= gicv5_iwb_set_type,
+		.irq_write_msi_msg	= gicv5_iwb_write_msi_msg,
+		.irq_set_affinity	= irq_chip_set_affinity_parent,
+		.irq_get_irqchip_state	= irq_chip_get_parent_state,
+		.irq_set_irqchip_state	= irq_chip_set_parent_state,
+		.flags			= IRQCHIP_SET_TYPE_MASKED |
+					  IRQCHIP_SKIP_SET_WAKE |
+					  IRQCHIP_MASK_ON_SUSPEND
+	},
 
-	data = irq_domain_get_irq_data(domain, virq);
-	gicv5_iwb_disable_wire(iwb_node, data->hwirq);
+	.ops = {
+		.set_desc		= gicv5_iwb_domain_set_desc,
+		.msi_translate		= gicv5_iwb_irq_domain_translate,
+	},
 
-	irq_domain_reset_irq_data(data);
-
-	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
-}
-
-/*
- * Our parent is the ITS, which expects MSI devices with programmable
- * event IDs. IWB event IDs are hardcoded.
- *
- * Use the msi_alloc_info_t structure to convey both our DeviceID
- * (scratchpad[0]), and the wire that we are attempting to map to an LPI in
- * the ITT (scratchpad[1]).
- */
-static int iwb_alloc_lpi_irq_parent(struct irq_domain *domain,
-				    unsigned int virq, irq_hw_number_t hwirq)
-{
-	struct gicv5_iwb_chip_data *iwb_node = domain->host_data;
-	msi_alloc_info_t info;
-
-	info.scratchpad[0].ul = iwb_node->device_id;
-	info.scratchpad[1].ul = hwirq;
-	info.hwirq = hwirq;
-
-	return irq_domain_alloc_irqs_parent(domain, virq, 1, &info);
-}
-
-static int gicv5_iwb_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
-				      unsigned int nr_irqs, void *arg)
-{
-	struct gicv5_iwb_chip_data *iwb_node;
-	unsigned int type = IRQ_TYPE_NONE;
-	struct irq_fwspec *fwspec = arg;
-	irq_hw_number_t hwirq;
-	struct irq_data *irqd;
-	int ret;
-
-	if (WARN_ON_ONCE(nr_irqs != 1))
-		return -EINVAL;
-
-	ret = gicv5_iwb_irq_domain_translate(domain, fwspec, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	if (iwb_alloc_lpi_irq_parent(domain, virq, hwirq))
-		return -EINVAL;
-
-	irqd = irq_get_irq_data(virq);
-	iwb_node = domain->host_data;
-
-	gicv5_iwb_enable_wire(iwb_node, hwirq);
-
-	irq_domain_set_info(domain, virq, hwirq, &gicv5_iwb_chip, iwb_node,
-			    handle_fasteoi_irq, NULL, NULL);
-	irq_set_probe(virq);
-	irqd_set_single_target(irqd);
-
-	return 0;
-}
-
-static const struct irq_domain_ops gicv5_iwb_irq_domain_ops = {
-	.translate	= gicv5_iwb_irq_domain_translate,
-	.alloc		= gicv5_iwb_irq_domain_alloc,
-	.free		= gicv5_iwb_irq_domain_free,
+	.info = {
+		.bus_token		= DOMAIN_BUS_WIRED_TO_MSI,
+		.flags			= MSI_FLAG_USE_DEV_FWNODE,
+	},
 };
 
+static bool gicv5_iwb_create_device_domain(struct device *dev, unsigned int size,
+				     struct gicv5_iwb_chip_data *iwb_node)
+{
+	if (WARN_ON_ONCE(!dev->msi.domain))
+		return false;
+
+	return msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
+					    &iwb_msi_template, size,
+					    NULL, iwb_node);
+}
+
 static struct gicv5_iwb_chip_data *
-__init gicv5_iwb_init_bases(void __iomem *iwb_base,
-			    struct fwnode_handle *handle,
-			    struct irq_domain *parent_domain, u32 device_id)
+gicv5_iwb_init_bases(void __iomem *iwb_base, struct platform_device *pdev)
 {
 	struct gicv5_iwb_chip_data *iwb_node;
-	struct msi_domain_info *msi_info;
-	struct gicv5_its_chip_data *its;
-	struct gicv5_its_dev *its_dev;
 	u32 nr_wires, idr0, cr0;
 	int ret;
 
-	msi_info = msi_get_domain_info(parent_domain);
-	its = msi_info->data;
-	if (!its) {
-		pr_warn("IWB %pOF can't find parent ITS, bailing\n",
-			to_of_node(handle));
-		return ERR_PTR(-ENODEV);
-	}
-
 	iwb_node = kzalloc(sizeof(*iwb_node), GFP_KERNEL);
 	if (!iwb_node)
 		return ERR_PTR(-ENOMEM);
 
 	iwb_node->iwb_base = iwb_base;
-	iwb_node->device_id = device_id;
 
 	idr0 = iwb_readl_relaxed(iwb_node, GICV5_IWB_IDR0);
 	nr_wires = (FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1) * 32;
 
-	iwb_node->domain = irq_domain_create_hierarchy(parent_domain, 0,
-			   nr_wires, handle, &gicv5_iwb_irq_domain_ops,
-			   iwb_node);
-	irq_domain_update_bus_token(iwb_node->domain, DOMAIN_BUS_WIRED);
-
 	cr0 = iwb_readl_relaxed(iwb_node, GICV5_IWB_CR0);
 	if (!FIELD_GET(GICV5_IWB_CR0_IWBEN, cr0)) {
-		pr_err("IWB %s must be enabled in firmware\n",
-		       fwnode_get_name(handle));
+		dev_err(&pdev->dev, "IWB must be enabled in firmware\n");
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -276,80 +234,60 @@ __init gicv5_iwb_init_bases(void __iomem *iwb_base,
 	if (ret)
 		goto out_free;
 
-	mutex_lock(&its->dev_alloc_lock);
-	its_dev = gicv5_its_alloc_device(its, roundup_pow_of_two(nr_wires),
-					 device_id, true);
-	mutex_unlock(&its->dev_alloc_lock);
-	if (IS_ERR(its_dev)) {
-		ret = -ENODEV;
+	if (!gicv5_iwb_create_device_domain(&pdev->dev, nr_wires, iwb_node)) {
+		ret = -ENOMEM;
 		goto out_free;
 	}
 
 	return iwb_node;
 out_free:
-	irq_domain_remove(iwb_node->domain);
 	kfree(iwb_node);
 
 	return ERR_PTR(ret);
 }
 
-static int __init gicv5_iwb_of_init(struct device_node *node)
+static int gicv5_iwb_device_probe(struct platform_device *pdev)
 {
 	struct gicv5_iwb_chip_data *iwb_node;
-	struct irq_domain *parent_domain;
-	struct device_node *parent_its;
-	struct of_phandle_args args;
 	void __iomem *iwb_base;
-	u32 device_id;
+	struct resource *res;
 	int ret;
 
-	iwb_base = of_io_request_and_map(node, 0, "IWB");
-	if (IS_ERR(iwb_base)) {
-		pr_err("%pOF: unable to map GICv5 IWB registers\n", node);
-		return PTR_ERR(iwb_base);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	iwb_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!iwb_base) {
+		dev_err(&pdev->dev, "failed to ioremap %pR\n", res);
+		return -ENOMEM;
 	}
 
-	ret = of_parse_phandle_with_args(node, "msi-parent", "#msi-cells", 0,
-					 &args);
-	if (ret) {
-		pr_err("%pOF: Can't retrieve deviceID\n", node);
+	iwb_node = gicv5_iwb_init_bases(iwb_base, pdev);
+	if (IS_ERR(iwb_node)) {
+		ret = PTR_ERR(iwb_node);
 		goto out_unmap;
 	}
 
-	parent_its = args.np;
-	parent_domain = irq_find_matching_host(parent_its, DOMAIN_BUS_NEXUS);
-	if (!parent_domain) {
-		pr_err("Unable to find the parent ITS domain for %pOF!\n", node);
-		ret = -ENXIO;
-		goto out_put;
-	}
-
-	device_id = args.args[0];
-	pr_debug("IWB deviceID: 0x%x\n", device_id);
-
-	iwb_node = gicv5_iwb_init_bases(iwb_base, &node->fwnode, parent_domain,
-					device_id);
-	if (IS_ERR(iwb_node)) {
-		ret = PTR_ERR(iwb_node);
-		goto out_put;
-	}
-
 	return 0;
-out_put:
-	of_node_put(parent_its);
 out_unmap:
 	iounmap(iwb_base);
 	return ret;
 }
 
-void __init gicv5_iwb_of_probe(void)
-{
-	struct device_node *np;
-	int ret;
+static const struct of_device_id gicv5_iwb_of_match[] = {
+	{ .compatible = "arm,gic-v5-iwb" },
+	{ /* END */ }
+};
+MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
 
-	for_each_compatible_node(np, NULL, "arm,gic-v5-iwb") {
-		ret = gicv5_iwb_of_init(np);
-		if (ret)
-			pr_err("Failed to init IWB %s\n", np->full_name);
-	}
-}
+static struct platform_driver gicv5_iwb_platform_driver = {
+	.driver = {
+		.name			= "GICv5 IWB",
+		.of_match_table		= gicv5_iwb_of_match,
+		.suppress_bind_attrs	= true,
+	},
+	.probe				= gicv5_iwb_device_probe,
+};
+
+module_platform_driver(gicv5_iwb_platform_driver);
diff --git i/drivers/irqchip/irq-gic-v5.c w/drivers/irqchip/irq-gic-v5.c
index 1d00ad1cd1fc..c1f26718c350 100644
--- i/drivers/irqchip/irq-gic-v5.c
+++ w/drivers/irqchip/irq-gic-v5.c
@@ -1030,8 +1030,6 @@ static int __init gicv5_of_init(struct device_node *node,
 
 	gicv5_irs_its_probe();
 
-	gicv5_iwb_of_probe();
-
 	return 0;
 out_int:
 	gicv5_cpu_disable_interrupts();
diff --git i/include/linux/irqchip/arm-gic-v5.h w/include/linux/irqchip/arm-gic-v5.h
index e28e08bccbb3..05e17223733d 100644
--- i/include/linux/irqchip/arm-gic-v5.h
+++ w/include/linux/irqchip/arm-gic-v5.h
@@ -372,17 +372,4 @@ int gicv5_alloc_lpi(void);
 void gicv5_free_lpi(u32 lpi);
 
 void __init gicv5_its_of_probe(struct device_node *parent);
-struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
-					     int nvec, u32 dev_id, bool is_iwb);
-
-struct gicv5_iwb_chip_data {
-	void __iomem		*iwb_base;
-	struct irq_domain	*domain;
-	u64			flags;
-	u32			device_id;
-	u16			nr_regs;
-};
-
-void gicv5_iwb_of_probe(void);
-
 #endif
