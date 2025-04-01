Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F471DEFE1;
	Tue,  1 Apr 2025 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491680; cv=none; b=jLWGFaFBQJp9yt5O4eNMgDaPt8KMy4IIZ6J3JwqEjFg7OPhu5vWsy686B5k2We9Zw0oiygTPB3UfndJmNAN8qmQCPGhsOY6gfWK1bzIZfJQLR39lfS+7KXoeecm0t8uQoAMQcaBGssXHC1IYBVVp60ROOlXeukmXlqvYHboWA2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491680; c=relaxed/simple;
	bh=nUOHroF+0XkPQGstjVhmf/WCBbJVGo1d8cH+vjBRrzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BzLpte9dm8fg9YAgB8SOIwgw6hZpyPrL0pFR/7HyVWIwAwzP8SCeBoRZNIHSdNTZsxsLcfdVut4V0tvZIwaC6HctXMxOpvhqn2wAiWv7x2nfa4yFzEmRW7lLfJFvku73eSAHpetJdDID1KY4UEeZp0pZz/zHUgwy/IXfhTvZZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dgtT31HH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rEug0PAm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dgtT31HH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rEug0PAm"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743491677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Sun3c8Lmw+e7fjJdrqY5kBivpZpnMD3xstjmCGLqhE=;
	b=dgtT31HHMoeFC3XSjNmCmMSuz9dNEUuYJALN6paPNVygBkbePdkVzk9iI5oBd9Xvdgs+xh
	6qsXGzoyOUjbbaYvmk6e23GFL1P8dlodC3q2/sVQXTKq4ISAlcQfuMlmglWSrad9Ktd77t
	7/W3/wHY3MctOvsE4xdvGNH+S/eYyCY7QLRiDHB61r40wZYPg2/b4DCPbYF/HFfvPmGht4
	iPZZ+ZYB22RHGtNnJq2UYXAaHU3ioxe9uhyZKbu99Vkh5LBCIUF8dVoQZ+lXkUaD59qqNp
	fqRC7yQch13KrZJDmzXpHCRpjQfL7tq0/mYuEy5ZBEV3JbFmOcGEncBBtXWwBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743491677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Sun3c8Lmw+e7fjJdrqY5kBivpZpnMD3xstjmCGLqhE=;
	b=rEug0PAmwMI7u9bdtbI9ACTshakfWHarFbbRfNN+IGF3W4DpwjKcCSLhmT9gKRY29+ykwy
	q9XDKStsmjEUjOAg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v2 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
In-Reply-To: <20250331064116.32540-3-zhangtianyang@loongson.cn>
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-3-zhangtianyang@loongson.cn>
Date: Tue, 01 Apr 2025 09:14:36 +0200
Message-ID: <87ldskwdyb.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Mar 31 2025 at 14:41, Tianyang Zhang wrote:
>  	irq_data_update_effective_affinity(data, cpumask_of(cpu));
> @@ -242,6 +233,7 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
>  		d = this_cpu_read(irq_map[vector]);
>  		if (d) {
>  			generic_handle_irq_desc(d);
> +

Stray newline.

>  		} else {

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
> +	wmb();

Undocumented memory barrier.

> +
> +	iocsr_write32(tail, LOONGARCH_IOCSR_REDIRECT_CQT);
> +}
> +
> +static void smp_call_invalid_enqueue(void *arg)
> +{
> +	struct smp_invalid_arg *s_arg = (struct smp_invalid_arg *)arg;
> +
> +	invalid_enqueue(s_arg->queue, s_arg->cmd);
> +}
> +
> +static void irde_invlid_entry_node(struct redirect_item *item)
> +{
> +	struct redirect_queue *rqueue;
> +	struct smp_invalid_arg arg;
> +	struct irde_inv_cmd cmd;
> +	volatile u64 raddr = 0;
> +	int node = item->table->node, cpu;
> +
> +	rqueue = &(irde_descs[node].inv_queue);
> +	cmd.cmd_info = 0;
> +	cmd.index.type = INVALID_INDEX;
> +	cmd.index.need_notice = 1;
> +	cmd.index.index = item->index;
> +	cmd.notice_addr = (u64)(__pa(&raddr));
> +
> +	if (cpu_to_node(smp_processor_id()) == node)
> +		invalid_enqueue(rqueue, &cmd);
> +	else {

if () lacks brackets

> +		for_each_cpu(cpu, cpumask_of_node(node)) {
> +			if (cpu_online(cpu))
> +				break;
> +		}
> +		arg.queue = rqueue;
> +		arg.cmd = &cmd;
> +		smp_call_function_single(cpu, smp_call_invalid_enqueue, &arg, 0);
> +	}
> +
> +	while (!raddr)
> +		cpu_relax();
> +
> +}


> +static int redirect_table_free(struct redirect_item *item)
> +{
> +	struct redirect_table *ird_table;
> +	struct redirect_entry *entry;
> +	unsigned long flags;
> +
> +	ird_table = item->table;
> +
> +	entry = item->entry;
> +	memset(entry, 0, sizeof(struct redirect_entry));
> +
> +	raw_spin_lock_irqsave(&ird_table->lock, flags);
> +	bitmap_release_region(ird_table->bitmap, item->index, 0);
> +	raw_spin_unlock_irqrestore(&ird_table->lock, flags);

	scoped_guard(raw_spinlock_irqsave, &ird_table->lock)
		bitmap_release_region(ird_table->bitmap, item->index, 0);

> +static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
> +{
> +	struct redirect_item *item = data->chip_data;
> +	struct avecintc_data *adata;
> +	int ret;
> +
> +	ret = irq_chip_set_affinity_parent(data, dest, force);
> +	if (ret == IRQ_SET_MASK_OK_DONE)
> +		return IRQ_SET_MASK_OK;

Again bracket rules. Also what is this return value translation about?

> +	else if (ret) {
> +		pr_err("IRDE:set_affinity error %d\n", ret);
> +		return ret;
> +	}
> +
> +	adata = irq_data_get_avec_data(data);
> +
> +	redirect_domain_prepare_entry(item, adata);
> +
> +	irde_invlid_entry_node(item);

This cannot work when irde_invlid_entry_node() goes into the SMP
function call path, because smp_call_function_single() cannot be invoked
with interrupts disabled.

> +
> +static void redirect_free_resources(struct irq_domain *domain,
> +						unsigned int virq, unsigned int nr_irqs)

Please align the arguments as documented.

> +{
> +	struct irq_data *irq_data;
> +	struct redirect_item *item;
> +

Please move the variables into the scope where they are used

> +	for (int i = 0; i < nr_irqs; i++) {
> +		irq_data = irq_domain_get_irq_data(domain, virq  + i);
> +		if (irq_data && irq_data->chip_data) {
> +			item = irq_data->chip_data;
> +			redirect_table_free(item);
> +			kfree(item);
> +		}
> +	}
> +}
> +
> +static int redirect_alloc(struct irq_domain *domain,
> +					unsigned int virq, unsigned int nr_irqs,
> +					 void *arg)

More random coding style

> +{
> +	struct redirect_table *ird_table;
> +	struct avecintc_data *avec_data;
> +	struct irq_data *irq_data;
> +	int ret, i, node;
> +
> +#ifdef CONFIG_NUMA
> +	node = ((msi_alloc_info_t *)arg)->desc->dev->numa_node;

Bah.

> +#else
> +	node = 0;
> +#endif

        msi_alloc_info_t *info = arg;

        node = dev_to_node(info->desc->dev);

> +static int redirect_table_init(int node)
> +{
> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);
> +	struct page *pages;
> +	unsigned long *bitmap;

Use proper reverse fir tree ordering

Thanks,

        tglx
