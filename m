Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F21885A5;
	Sun, 25 May 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748164007; cv=none; b=hww0UcTws4cMNT7yb42TJ/RI6Lq4swiVkalOMY2sM2xeXNw5njS2IxaBgp6huiFICeYoQcpW3GfWsmiUUC3V7/TwPjDXGurzJW1vv0KA+NA1Gxwfq191FMTSa1ON0+49cePonYpVIapF4Z8eHjufEUPev7w3xtO3ZlefqDE0V8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748164007; c=relaxed/simple;
	bh=D33noQ2AMXpbt2NqWECeX0gAwhvUwt4rDukf/XL12Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iyT2p03GJY7Egxv2ptpLuk1102IcsIcBWa83b9xFtggh6JdnwH4mPLjYDm5w2o8tI2eTZoYTLYidMUJCEGtvOvMnrRs1wpJV2oBkxSvvOPY4bSb0sAgnK8qNpNo3dApuafOI895lrOmgDfLuSLSO/1kuzg5gEzF54tIgDvZHIuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VBoH9eVB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RSWFhWVd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VBoH9eVB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RSWFhWVd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748164003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10c6UuaUy4gsHzyjK2Ohkf/opmVxLXcOaDen0Va9OQs=;
	b=VBoH9eVBxEV9wLTBH6/J9vF7Uhr8nPoYO99Q3JJBHUbNiDINCYUxReQIzHxJJ8Mca0WFFT
	O75xm1I0kKICTRDbskWa7Y/yOFWjAg+/Ns6jDmyp8RnCYR+POe08CnAUKZsW5Xt7akv637
	jegvVHPpISlv+W2N9GfJgpIc8GIW3rCC1bxe+K1q2B/f0S+MNiA2esiL84/TmsB1kopojP
	Ysw6jpnVll8VMlAdaI4SHY83yb4sSg2LSyCeeDDhBCwP2UkCntAabwXfT107wyywct7SSv
	E6iwWmOSxkj9D5m3w5ANuGjS74xeWOvTMbzOxuxp+qlmQLhqem+3GtvlWl7wGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748164003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=10c6UuaUy4gsHzyjK2Ohkf/opmVxLXcOaDen0Va9OQs=;
	b=RSWFhWVdmJrlquNScQ3F1eWUdb/ckMT7qIwsfiXscLP/beD0PsdE3lJlYVAvW10DqQYciU
	/2bU2yyKKEjgYjDg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v3 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
In-Reply-To: <20250523101833.17940-3-zhangtianyang@loongson.cn>
References: <20250523101833.17940-1-zhangtianyang@loongson.cn>
 <20250523101833.17940-3-zhangtianyang@loongson.cn>
Date: Sun, 25 May 2025 11:06:42 +0200
Message-ID: <87ecwdqct9.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 23 2025 at 18:18, Tianyang Zhang wrote:
>  
> -static void avecintc_sync(struct avecintc_data *adata)
> +void avecintc_sync(struct avecintc_data *adata)
>  {
>  	struct pending_list *plist;
>  
> @@ -109,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>  			return -EBUSY;
>  
>  		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
> -			return 0;
> +			return IRQ_SET_MASK_OK_DONE;

This change really wants to be seperate with a proper explanation and
not burried inside of this pile of changes.

> +static inline bool invalid_queue_is_full(int node, u32 *tail)
> +{
> +	u32 head;
> +
> +	head = read_queue_head(node);

Please move the initialization into the declaration line:

       u32 head = read_queue...();

All over the place, where it's the first operation in the code. That
makes the code more dense and easier to follow.

> +	*tail = read_queue_tail(node);
> +
> +	return !!(head == ((*tail + 1) % INVALID_QUEUE_SIZE));

What's the !! for? A == B is a boolean expression already.

> +}
> +
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
> +	tail = (tail + 1) % INVALID_QUEUE_SIZE;
> +
> +	/*
> +	 * The uncache-memory access may have an out of order problem cache-memory access,
> +	 * so a barrier is needed to ensure tail is valid
> +	 */

This comment does not make sense at all.

What's the actual uncached vs. cached access problem here? AFAICT it's
all about the ordering of the writes:

    You need to ensure that the memcpy() data is visible _before_ the
    tail is updated, no?

> +	wmb();
> +
> +	write_queue_tail(rqueue->node, tail);
> +}

> +static int redirect_table_free(struct redirect_item *item)

That return value is there to be ignored by the only caller, right?

> +{
> +	struct redirect_table *ird_table;
> +	struct redirect_entry *entry;
> +
> +	ird_table = item->table;
> +
> +	entry = item->entry;
> +	memset(entry, 0, sizeof(struct redirect_entry));
> +
> +	scoped_guard(raw_spinlock_irqsave, &ird_table->lock)
> +		bitmap_release_region(ird_table->bitmap, item->index, 0);
> +
> +	kfree(item->gpid);
> +
> +	irde_invlid_entry_node(item);
> +
> +	return 0;
> +}
> +
> +static inline void redirect_domain_prepare_entry(struct redirect_item *item,
> +					struct avecintc_data *adata)

Please align the argument in the second line properly:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#line-breaks

> +
> +static inline void redirect_ack_irq(struct irq_data *d)
> +{
> +}
> +
> +static inline void redirect_unmask_irq(struct irq_data *d)
> +{
> +}
> +
> +static inline void redirect_mask_irq(struct irq_data *d)
> +{
> +}

These want some explanation why they are empty.

> +
> +static struct irq_chip loongarch_redirect_chip = {
> +	.name			= "REDIRECT",
> +	.irq_ack		= redirect_ack_irq,
> +	.irq_mask		= redirect_mask_irq,
> +	.irq_unmask		= redirect_unmask_irq,
> +	.irq_set_affinity	= redirect_set_affinity,
> +	.irq_compose_msi_msg	= redirect_compose_msi_msg,
> +};
> +out_free_resources:
> +	redirect_free_resources(domain, virq, nr_irqs);
> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> +
> +	return -EINVAL;

-ENOMEM?

> +}
> +
> +	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
> +	if (!bitmap) {
> +		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", node);
> +		return -ENOMEM;

Leaks pages.

> +	}
> +
> +	ird_table->bitmap = bitmap;
> +	ird_table->nr_ird = IRD_ENTRIES;
> +	ird_table->node = node;
> +
> +	raw_spin_lock_init(&ird_table->lock);
> +
> +	if (redirect_queue_init(node))
> +		return -EINVAL;

Leaks pages and bitmap.

> +
> +	iocsr_write64(CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
> +	iocsr_write64(__pa(ird_table->table), LOONGARCH_IOCSR_REDIRECT_TBR);
> +
> +	return 0;
> +}

> +#if defined(CONFIG_ACPI)

#ifdef CONFIG_ACPI

> +static int __init redirect_reg_base_init(void)
> +{
> +	acpi_status status;
> +	uint64_t addr = 0;

What's this initialization for?

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
> +			&redirect_domain_ops, irde_descs);

Please align the arguments in the second line properly.

> +	if (!domain) {
> +		pr_err("Unable to alloc redirect domain\n");
> +		goto out_free_fwnode;
> +	}
> +
> +	redirect_domain = domain;
> +
> +	ret = redirect_table_init(0);
> +	if (ret)
> +		goto out_free_table;
> +
> +	ret = acpi_cascade_irqdomain_init();
> +	if (ret < 0) {
> +		pr_err("Failed to cascade IRQ domain, ret=%d\n", ret);
> +		goto out_free_table;
> +	}
> +
> +	cpuhp_setup_state_nocalls(CPUHP_AP_IRQ_REDIRECT_STARTING,
> +				  "irqchip/loongarch/redirect:starting",
> +				  redirect_cpu_online, NULL);

Hmm.

> +static int redirect_cpu_online(unsigned int cpu)
> +{
> +	int ret, node = cpu_to_node(cpu);
> +
> +	if (cpu != cpumask_first(cpumask_of_node(node)))
> +		return 0;
> +
> +	ret = redirect_table_init(node);
> +	if (ret) {
> +		redirect_table_fini(node);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

So if you unplug all CPUs of a node and then replug the first CPU in the
node, then this invokes redirect_table_init() unconditionally, which
will unconditionally allocate pages and bitmap again ....

Thanks,

        tglx
