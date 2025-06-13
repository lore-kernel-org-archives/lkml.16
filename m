Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926251C5F35;
	Fri, 13 Jun 2025 15:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828051; cv=none; b=HtqzA6miehTDMyjVF5Pi6eg55U96U4/zvTsaLL641VcRl7UlvL3K+tt+JufeuCd5/RTTuDnTOAc4A+ONvFycFHQCklfhXujMUcarJnafUdoT+HclS1bfkRK9vOXiurfJ/7w7mwn/M4X/5CkTPibFeVB0ptVSnh1WrEsaHcRCXtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828051; c=relaxed/simple;
	bh=yJh8wUe8O6yisKujC2BvncPhHYlHY60Fj/MEkh60iAs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EHDnC8yItQ1R0OGHz1JefLFxNMWE1Zfv0Af1B0MGKkWlPOl4Wo6F9DyqG+gdjOhFVpSsW6Yjs5BPiLLL2Wvj2zFbtxbA6mUjtoTmVuhRQuetThrQSRMaZ36hnIYOt2LZffwU73CoS6Ro4m4rKHVzcRLvyRNNzAlAjLlvQl0UHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x9b4L8Y7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e3XRZCur; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x9b4L8Y7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e3XRZCur"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y99w5xbXZlHqhJmkAcWt6eHp7e8pIBnfekQ+uOBgfiE=;
	b=x9b4L8Y7SBiWYB8qWlXkFprlFSc/Ls96RG2dLrdtphpZ/yzJpMxEHqYrtiEMW/sP3Unb6g
	xhcEO1hp8dH1qdzLUBpP14vhIEhpxffxdcbjZj/DJyNVP4+ZYqnsCm3poTZj9Ge+pU/UMF
	Ih7ls63dI39vdPuZCxSv7l25TYLvtOehtM5GAYYG+7uQT3YqtYC1C/aN+Z5TMgSUZhUOh8
	JBn2dQ99+6j5U167frLC82ejquMPfGAj1n+0vC2CZsbsaJr3IgO9Bs4854wygZH4cqcBYl
	T1JoWo6qRWvMHCPwn/En+FDu+Ycq/yJD3BNJX093cIgLP9bNiJWgglQF/DVSHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y99w5xbXZlHqhJmkAcWt6eHp7e8pIBnfekQ+uOBgfiE=;
	b=e3XRZCurYlkq925qA3nri43KFntODZa6XTRWPoo/RM5f3sSE1mNxdnfmSyFcMwxBr9Ih5B
	ljFe1qJP3yUEoLAg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v4 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
In-Reply-To: <20250610114252.21077-3-zhangtianyang@loongson.cn>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <20250610114252.21077-3-zhangtianyang@loongson.cn>
Date: Fri, 13 Jun 2025 17:20:46 +0200
Message-ID: <87o6uris6p.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 10 2025 at 19:42, Tianyang Zhang wrote:
>  		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
> -			return 0;
> +			/*
> +			 * The new affinity configuration has taken effect,
> +			 * and returning IRQ_SET_MASK_OK_DONE here indicates that no further
> +			 * changes need to be made in the subsequent process

This is not what IRQ_SET_MASK_OK_DONE is about. The documentation
clearly says:

 * IRQ_SET_MASK_OK_DONE - Same as IRQ_SET_MASK_OK for core. Special code to
 *                        support stacked irqchips, which indicates skipping
 *                        all descendant irqchips.

It's not about further changes. It's about preventing invoking
set_affinity() callbacks down the hierarchy.

And you still fail to explain why this change is correct for the
existing code. That explanation wants to be in the changelog of the
seperate patch doing this change.

And then you can spare the comment, which is btw. also violating the
bracket rules in the tip maintainers documentation.


> +			 */
> +			return IRQ_SET_MASK_OK_DONE;
>  
>  		cpumask_and(&intersect_mask, dest, cpu_online_mask);
>  
> @@ -121,7 +116,8 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>  		adata->cpu = cpu;
>  		adata->vec = vector;
>  		per_cpu_ptr(irq_map, adata->cpu)[adata->vec] = irq_data_to_desc(data);
> -		avecintc_sync(adata);
> +		if (!cpu_has_redirectint)
> +			avecintc_sync(adata);
>  	}
>  
>  	irq_data_update_effective_affinity(data, cpumask_of(cpu));
> @@ -412,6 +408,9 @@ static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
>  
>  static inline int __init acpi_cascade_irqdomain_init(void)
>  {
> +	if (cpu_has_redirectint)
> +		return redirect_acpi_init(loongarch_avec.domain);
> +
>  	return acpi_table_parse_madt(ACPI_MADT_TYPE_MSI_PIC, pch_msi_parse_madt, 1);
>  }
>  
> diff --git a/drivers/irqchip/irq-loongarch-ir.c b/drivers/irqchip/irq-loongarch-ir.c
> new file mode 100644
> index 000000000000..ae42ec5028d2
> --- /dev/null
> +++ b/drivers/irqchip/irq-loongarch-ir.c
> @@ -0,0 +1,562 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Loongson Technologies, Inc.
> + */
> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/spinlock.h>
> +#include <linux/msi.h>
> +
> +#include <asm/irq.h>
> +#include <asm/loongarch.h>
> +#include <asm/setup.h>
> +#include <larchintrin.h>
> +
> +#include "irq-loongson.h"
> +#include "irq-msi-lib.h"
> +
> +#define IRD_ENTRIES			65536
> +
> +/* redirect entry size 128bits */
> +#define IRD_PAGE_ORDER			(20 - PAGE_SHIFT)
> +
> +/* irt cache invalid queue */
> +#define	INVALID_QUEUE_SIZE		4096

Use SPACE after #define, not TAB. All over the place...

> +#define INVALID_QUEUE_PAGE_ORDER	(16 - PAGE_SHIFT)

I'm pretty sure that the above magic numbers have dependencies in some
way, right? So why is it not expressed in a way which makes this obvious? 

These magic numbers are just incomprehensible as they make the reader
guess what this is about. Here is my (probably not so) wild guess:

#define IRD_ENTRY_SIZE			16

#define IRD_ENTRIES			65536
#define IRD_PAGE_ORDER			get_order(IRD_ENTRIES * IRD_ENTRY_SIZE)

#define	INVALID_QUEUE_SIZE		4096
#define IRD_INVALID__QUEUE_PAGE_ORDER	get_order(INVALID_QUEUE_SIZE * IRD_ENTRY_SIZE)

No?

> +#define GPID_ADDR_MASK			0x3ffffffffffULL

GENMASK()

> +#define GPID_ADDR_SHIFT			6
> +
> +#define CQB_SIZE_SHIFT			0
> +#define CQB_SIZE_MASK			0xf
> +#define CQB_ADDR_SHIFT			12
> +#define CQB_ADDR_MASK			(0xfffffffffULL)

GENMASK()

> +#define CFG_DISABLE_IDLE		2
> +#define INVALID_INDEX			0
> +
> +#define MAX_IR_ENGINES			16


> +struct redirect_gpid {
> +	u64	pir[4];      /* Pending interrupt requested */
> +	u8	en	: 1, /* doorbell */

Use C++ style tail comments for this as documented. Do you I really have
to point out every single item in the documentation explicitely or can
you just read all of it and follow the guidelines?

> +struct irde_desc {
> +	struct	redirect_table	ird_table;
> +	struct	redirect_queue	inv_queue;
> +	int	finish;

Groan.

"Struct declarations should align the struct member names in a tabular fashion:

 struct bar_order {
        unsigned int    guest_id;
        int             ordered_item;
        struct menu     *menu;
 };"

It clearly says to align the struct member names, no?

Otherwise the example would be:

 struct bar_order {
        unsigned int    guest_id;
        int             ordered_item;
        struct 		menu     	*menu;
 };

which is unreadable garbage obviously.

> +};

> +static void invalid_enqueue(struct redirect_queue *rqueue, struct irde_inv_cmd *cmd)
> +{
> +	struct irde_inv_cmd *inv_addr;
> +	u32 tail;
> +
> +	guard(raw_spinlock_irqsave)(&rqueue->lock);
> +
> +	while (invalid_queue_is_full(rqueue->node, &tail))
> +		cpu_relax();
> +
> +	inv_addr = (struct irde_inv_cmd *)(rqueue->base + tail * sizeof(struct irde_inv_cmd));
> +	memcpy(inv_addr, cmd, sizeof(struct irde_inv_cmd));

Seriously?

struct redirect_queue {
	int				node;
        union {
 		u64			base;
                struct irde_inv_cmd	*cmds;
        };
	u32				max_size;
        ...
};

and then this becomes

    	memcpy(&rqueue->cmds[tail], cmd, sizeof(cmd));

That's too comprehensible, right?

> +	tail = (tail + 1) % INVALID_QUEUE_SIZE;

Why is this before the barrier? The barrier does not do anything about
this and you can simplify this. See below.

> +	/*
> +	 * the barrier ensure that the previously written data is visible

This barrier ensures .....

> +	 * before updating the tail register

And as there is no rmb() counterpart you want to explain that this is
serializing against the hardware.

> +	 */
> +	wmb();
> +
> +	write_queue_tail(rqueue->node, tail);

	write_queue_tail(rqueue->node, (tail + 1) & INVALID_QUEUE_MASK);

No?

> +}
> +
> +static void irde_invlid_entry_node(struct redirect_item *item)
> +{
> +	struct redirect_queue *rqueue;
> +	struct irde_inv_cmd cmd;
> +	volatile u64 raddr = 0;

No. See Documentation/process/volatile-considered-harmful.rst

> +static void redirect_table_free(struct redirect_item *item)
> +{
> +	struct redirect_table *ird_table;
> +	struct redirect_entry *entry;
> +
> +	ird_table = item->table;
> +
> +	entry = item->entry;
> +	memset(entry, 0, sizeof(struct redirect_entry));

        memset(entry, 0, sizeof(entry));

It's obvious why using sizeof(type) is a bad idea.

> +	scoped_guard(raw_spinlock_irqsave, &ird_table->lock)

raw_spinlock_irq as this code can never be invoked from an interrupt
disabled region.

> +		bitmap_release_region(ird_table->bitmap, item->index, 0);
> +
> +	kfree(item->gpid);
> +
> +	irde_invlid_entry_node(item);
> +}

> +static inline void redirect_domain_prepare_entry(struct redirect_item *item,
> +						 struct avecintc_data *adata)
> +{
> +	struct redirect_entry *entry = item->entry;
> +
> +	item->gpid->en = 1;
> +	item->gpid->irqnum = adata->vec;
> +	item->gpid->dst = adata->cpu;
> +
> +	entry->lo.valid = 1;
> +	entry->lo.gpid = ((long)item->gpid >> GPID_ADDR_SHIFT) & (GPID_ADDR_MASK);

Hardware addresses are type unsigned long and not long.

> +	entry->lo.vector = 0xff;
> +}

> +static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
> +{
> +	struct redirect_item *item;
> +
> +	item = irq_data_get_irq_chip_data(d);

Just move the initialization into the declaration line.

> +	msg->address_lo = (msi_base_addr | 1 << 2 | ((item->index & 0xffff) << 4));
> +	msg->address_hi = 0x0;
> +	msg->data = 0x0;
> +}

> +static void redirect_free_resources(struct irq_domain *domain, unsigned int virq,
> +				    unsigned int nr_irqs)
> +{
> +	for (int i = 0; i < nr_irqs; i++) {
> +		struct irq_data *irq_data;
> +
> +		irq_data = irq_domain_get_irq_data(domain, virq  + i);

Ditto.

> +		if (irq_data && irq_data->chip_data) {
> +			struct redirect_item *item;
> +
> +			item = irq_data->chip_data;

Same and all over the place.

> +			redirect_table_free(item);
> +			kfree(item);
> +		}
> +	}
> +}
> +
> +static int redirect_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +			unsigned int nr_irqs, void *arg)

I asked you before to align the arguments of the second line properly
and according to documentation..

> +{
> +	struct redirect_table *ird_table;
> +	struct avecintc_data *avec_data;
> +	struct irq_data *irq_data;
> +	msi_alloc_info_t *info;
> +	int ret, i, node;
> +
> +	info = (msi_alloc_info_t *)arg;

What's that type cast for?

> +	node = dev_to_node(info->desc->dev);
> +	ird_table = &irde_descs[node].ird_table;
> +
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct redirect_item *item;
> +
> +		item = kzalloc(sizeof(struct redirect_item), GFP_KERNEL);
> +		if (!item) {
> +			pr_err("Alloc redirect descriptor failed\n");
> +			goto out_free_resources;
> +		}
> +
> +		irq_data = irq_domain_get_irq_data(domain, virq + i);
> +
> +		avec_data = irq_data_get_avec_data(irq_data);

Neither irq_data nor avec_data are used here and only required way
down. Can you structure your code so it makes sense?

> +		ret = redirect_table_alloc(item, ird_table);
> +		if (ret) {
> +			pr_err("Alloc redirect table entry failed\n");
> +			goto out_free_resources;
> +		}
> +
> +		item->gpid = kzalloc_node(sizeof(struct redirect_gpid), GFP_KERNEL, node);
> +		if (!item->gpid) {
> +			pr_err("Alloc redirect GPID failed\n");
> +			goto out_free_resources;
> +		}

Why do you need this extra allocation here instead of simply embedding
gpid into item?

> +		irq_data->chip_data = item;
> +		irq_data->chip = &loongarch_redirect_chip;
> +		redirect_domain_prepare_entry(item, avec_data);
> +	}
> +	return 0;

> +	iocsr_write64(((rqueue->base & (CQB_ADDR_MASK << CQB_ADDR_SHIFT)) |
> +				(CQB_SIZE_MASK << CQB_SIZE_SHIFT)), LOONGARCH_IOCSR_REDIRECT_CQB);

Align second line properly.

> +	return 0;
> +}
> +
> +static int redirect_table_init(int node)
> +{
> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);

Remove the pointless brackets.

> +	unsigned long *bitmap;
> +	struct page *pages;
> +	int ret;
> +
> +	pages = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, IRD_PAGE_ORDER);
> +	if (!pages) {
> +		pr_err("Node [%d] redirect table alloc pages failed!\n", node);
> +		return -ENOMEM;
> +	}
> +	ird_table->page = pages;
> +	ird_table->table = page_address(pages);
> +
> +	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
> +	if (!bitmap) {
> +		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", node);
> +		ret = -ENOMEM;
> +		goto free_pages;
> +	}
> +
> +	ird_table->bitmap = bitmap;
> +	ird_table->nr_ird = IRD_ENTRIES;
> +	ird_table->node = node;
> +
> +	raw_spin_lock_init(&ird_table->lock);
> +
> +	if (redirect_queue_init(node)) {
> +		ret = -EINVAL;
> +		goto free_bitmap;

So redirect_queue_init() returns -ENOMEM which is then converted to
-EINVAL here. That makes absolutely no sense at all.

Neither makes the 'ret' variable sense because all failures should
return -ENOMEM and therefore you can make redirect_queue_init() return
bool (true on success) and return -ENOMEM in the failure path.

No?

> +static void redirect_table_fini(int node)
> +{
> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);
> +	struct redirect_queue *rqueue = &(irde_descs[node].inv_queue);

No brackets. They have no value and just disturb reading.

> +static int redirect_cpu_online(unsigned int cpu)
> +{
> +	int ret, node = cpu_to_node(cpu);
> +
> +	if (cpu != cpumask_first(cpumask_of_node(node)))
> +		return 0;
> +
> +	if (irde_descs[node].finish)
> +		return 0;

What's this finish thing about?

Neither the CPU mask check nor this finish hack is required:

        if (irde_descs[node].pages)
        	return 0;

covers all of it, no?

> +	ret = redirect_table_init(node);
> +	if (ret) {
> +		redirect_table_fini(node);

What is this for? You already mopped up the mess in the failure path of
redirect_table_init(), so doing it again makes no sense.

Just get rid of the failure path in redirect_table_init() and let that
return a bool (true on success) and invoke redirect_table_fini() here

> +		return -EINVAL;

Seriously? The failure condition is -ENOMEM so why do you want to change
that?

> +	}
> +
> +	irde_descs[node].finish = 1;
> +	return 0;
> +}
> +
> +#ifdef	CONFIG_ACPI

What's the TAB for?

> +static int __init redirect_reg_base_init(void)
> +{
> +	acpi_status status;
> +	uint64_t addr;
> +
> +	if (acpi_disabled)
> +		return 0;
> +
> +	status = acpi_evaluate_integer(NULL, "\\_SB.NO00", NULL, &addr);
> +	if (ACPI_FAILURE(status))
> +		pr_info("redirect_iocsr_base used default 0x1fe00000\n");
> +	else
> +		redirect_reg_base = addr;
> +
> +	return 0;
> +}
> +subsys_initcall_sync(redirect_reg_base_init);
> +
> +static int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
> +		const unsigned long end)

Sigh.

> +int __init redirect_acpi_init(struct irq_domain *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct irq_domain *domain;
> +	int ret;
> +
> +	fwnode = irq_domain_alloc_named_fwnode("redirect");
> +	if (!fwnode) {
> +		pr_err("Unable to alloc redirect domain handle\n");
> +		goto fail;
> +	}
> +
> +	domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
> +					     &redirect_domain_ops, irde_descs);
> +	if (!domain) {
> +		pr_err("Unable to alloc redirect domain\n");
> +		goto out_free_fwnode;
> +	}
> +
> +	redirect_domain = domain;

What's the point of this local domain variable?

> +	ret = redirect_table_init(0);
> +	if (ret)
> +		goto out_free_table;
> +

Oh well...

Thanks,

        tglx
