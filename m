Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73190204C3B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748943357; cv=none; b=rm15WLn57el4IsedSlBfdksgJsK0Po6AJ2qfF8coI3ZRCriGYfYSQFMggtb4gcTHsigRctbmIzG0rGprcCmTOzaxq2B4gyHhdDC9m6O7NpbSXS0GuE5FIVHodIs482e+C2j1aExyBlk5NkYmgOyXeQjWXv19WXhAPRq1Inv6MiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748943357; c=relaxed/simple;
	bh=KpRxVXq9z9pj1izRGg15ByyMBBPEY2dZxPTHXE+8dg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfKk9CNHIkdNRN1dHmqbuTalRQQAC24oUeQ4WtepoIPgGNIQsajFZZBuZvxgROBB+9DgU3n2+/WEbZshv2sf674U0qrv0B7YYnFJlIVnZA3hP7Lc+paCz/IeS2CIrN+3mynGtMmIaUcTIEeK4XLUCEtu0r/QP8v3ZQi4P59CotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYRjX0jw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYRjX0jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687BEC4CEEF;
	Tue,  3 Jun 2025 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748943356;
	bh=KpRxVXq9z9pj1izRGg15ByyMBBPEY2dZxPTHXE+8dg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYRjX0jw0MB9HHfTfzm5EVGq8w699ism5RlT1dxhGjb6WvLvEQJ8MXTI8UZDnbgX4
	 4xpIE8VuHt3L2KpatZ1hSoPicrshhe5V8uyxn7sp6DBNvgH2JKMBZtnZLCCN3YRce9
	 glo4NhFhk8BWqtR+Qkcpt9GReOAi20JscwCMp0Nvh8ytpkxY/o/D3UAaO/JqFfOCGo
	 QEX3p3eC/NfZpKlS2nZPff28t8TVUqDfdx8Tex131nAtk9WH0DlaZ3LCWA8my5cavv
	 hnmts1HtCnDWIQ4xDln8RzTlQ+LKrgEwGaISHcb5jKsb8VKJkhXPjphBT34ALUchGl
	 5owQF3BcR/aWw==
Date: Tue, 3 Jun 2025 11:35:51 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 3/5] genirq/msi: Move prepare() call to per-device
 allocation
Message-ID: <aD7B96BiSb6mK9Bj@lpieralisi>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-4-maz@kernel.org>
 <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b1d7aec-1eac-a9cd-502a-339e216e08a1@huawei.com>

On Tue, Jun 03, 2025 at 04:22:47PM +0800, Zenghui Yu wrote:
> Hi Marc,
> 
> On 2025/5/14 0:31, Marc Zyngier wrote:
> > The current device MSI infrastructure is subtly broken, as it
> > will issue an .msi_prepare() callback into the MSI controller
> > driver every time it needs to allocate an MSI. That's pretty wrong,
> > as the contract (or unwarranted assumption, depending who you ask)
> > between the MSI controller and the core code is that .msi_prepare()
> > is called exactly once per device.
> > 
> > This leads to some subtle breakage in said MSI controller drivers,
> > as it gives the impression that there are multiple endpoints sharing
> > a bus identifier (RID in PCI parlance, DID for GICv3+). It implies
> > that whatever allocation the ITS driver (for example) has done on
> > behalf of these devices cannot be undone, as there is no way to
> > track the shared state. This is particularly bad for wire-MSI devices,
> > for which .msi_prepare() is called for. each. input. line.
> > 
> > To address this issue, move the call to .msi_prepare() to take place
> > at the point of irq domain allocation, which is the only place that
> > makes sense. The msi_alloc_info_t structure is made part of the
> > msi_domain_template, so that its life-cycle is that of the domain
> > as well.
> > 
> > Finally, the msi_info::alloc_data field is made to point at this
> > allocation tracking structure, ensuring that it is carried around
> > the block.
> > 
> > This is all pretty straightforward, except for the non-device-MSI
> > leftovers, which still have to call .msi_prepare() at the old
> > spot. One day...
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  include/linux/msi.h |  2 ++
> >  kernel/irq/msi.c    | 35 +++++++++++++++++++++++++++++++----
> >  2 files changed, 33 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/linux/msi.h b/include/linux/msi.h
> > index 63c23003ec9b7..ba1c77a829a1c 100644
> > --- a/include/linux/msi.h
> > +++ b/include/linux/msi.h
> > @@ -516,12 +516,14 @@ struct msi_domain_info {
> >   * @chip:	Interrupt chip for this domain
> >   * @ops:	MSI domain ops
> >   * @info:	MSI domain info data
> > + * @alloc_info:	MSI domain allocation data (arch specific)
> >   */
> >  struct msi_domain_template {
> >  	char			name[48];
> >  	struct irq_chip		chip;
> >  	struct msi_domain_ops	ops;
> >  	struct msi_domain_info	info;
> > +	msi_alloc_info_t	alloc_info;
> >  };
> >  
> >  /*
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index 31378a2535fb9..07eb857efd15e 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -59,7 +59,8 @@ struct msi_ctrl {
> >  static void msi_domain_free_locked(struct device *dev, struct msi_ctrl *ctrl);
> >  static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid);
> >  static inline int msi_sysfs_create_group(struct device *dev);
> > -
> > +static int msi_domain_prepare_irqs(struct irq_domain *domain, struct device *dev,
> > +				   int nvec, msi_alloc_info_t *arg);
> >  
> >  /**
> >   * msi_alloc_desc - Allocate an initialized msi_desc
> > @@ -1023,6 +1024,7 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
> >  	bundle->info.ops = &bundle->ops;
> >  	bundle->info.data = domain_data;
> >  	bundle->info.chip_data = chip_data;
> > +	bundle->info.alloc_data = &bundle->alloc_info;
> >  
> >  	pops = parent->msi_parent_ops;
> >  	snprintf(bundle->name, sizeof(bundle->name), "%s%s-%s",
> > @@ -1061,11 +1063,18 @@ bool msi_create_device_irq_domain(struct device *dev, unsigned int domid,
> >  	if (!domain)
> >  		return false;
> >  
> > +	domain->dev = dev;
> > +	dev->msi.data->__domains[domid].domain = domain;
> > +
> > +	if (msi_domain_prepare_irqs(domain, dev, hwsize, &bundle->alloc_info)) {
> 
> Does it work for MSI?

This means that it does not work for MSI for you as it stands, right ?

If you spotted an issue, thanks for that, report it fully please.

> hwsize is 1 in the MSI case, without taking pci_msi_vec_count() into account.
> 
> bool pci_setup_msi_device_domain(struct pci_dev *pdev)
> {
> 	[...]
> 
> 	return pci_create_device_domain(pdev, &pci_msi_template, 1);

I had a stab at it with GICv5 models and an MSI capable device and this indeed
calls the ITS msi_prepare() callback with 1 as vector count, so we size
the device tables wrongly.

The question is why pci_create_device_domain() is called here with
hwsize == 1. Probably, before this series, the ITS MSI parent code was
fixing the size up so we did not notice, I need to check.

Lorenzo
