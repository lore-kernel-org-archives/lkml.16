Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC724DF60
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473748; cv=none; b=isYdqZsahJmrY0NSJ2EojrAJgOE4qdLuOnlrGSdbBuUKR9yNw6+UzmSu4g8CHCIes0v4CIepSpu78lF2o5krPjr9ByyYAJYZTFg02L4E8AjKZXbVFutrSoVZYh64U9qnx4Uv610noW2fk9eANPljTBQ6P7Ssvpc6dM8RrAEIw2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473748; c=relaxed/simple;
	bh=yK7sCII2pcmZURx+Xjim+BLAiRlgmXjngtSEYTBTWqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iOno54TYJXLPWBqQtt6tO8UcV43L9LMn8DyRK7zMf0g79uzPqvL0qlnspVzkbpWmLiBSMNKr70b0koZdL663XQ2Hp1ReNbcpcuKRa6NJoqnDH2cIc8LAvguoSAyAnGLOIKVKpgbzDvKl44M5GGJL+QIa3l40ibVLD8LRecFx9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lv3RaiNh; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lv3RaiNh"
Message-ID: <6863ae24-10de-4d50-9175-ab5012f204ed@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743473743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVIt39iX+yIgMFcd6pfezPgLCafub6eRM8LBfRP+VDw=;
	b=Lv3RaiNhQ7iM2mSKuBeumVnHUGxMvbPEkEblwwu27O6scytl9/WT5PmIvHUAojiSX5GIu8
	AhIPHYBh6iBwkE50GK+v5PMixUr9rgZ6x0+vriQ0vZMoA25qxya32DT7h+fDFhr/UxCbnw
	vmhQ148wJ3rfComORpzs/IvMG3/9mIo=
Date: Tue, 1 Apr 2025 10:15:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, tglx@linutronix.de,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-3-zhangtianyang@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250331064116.32540-3-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 3/31/25 2:41 PM, Tianyang Zhang 写道:
> The main function of the Redirected interrupt controller is to manage the
> redirected-interrupt table, which consists of many redirected entries.
> When MSI interrupts are requested, the driver creates a corresponding
> redirected entry that describes the target CPU/vector number and the
> operating mode of the interrupt. The redirected interrupt module has an
> independent cache, and during the interrupt routing process, it will
> prioritize the redirected entries that hit the cache. The driver
> invalidates certain entry caches via a command queue.
>
> Co-developed-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Liupu Wang <wangliupu@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>   arch/loongarch/include/asm/cpu-features.h |   1 +
>   arch/loongarch/include/asm/cpu.h          |   2 +
>   arch/loongarch/include/asm/loongarch.h    |   6 +
>   arch/loongarch/kernel/cpu-probe.c         |   2 +
>   drivers/irqchip/Makefile                  |   2 +-
>   drivers/irqchip/irq-loongarch-avec.c      |  21 +-
>   drivers/irqchip/irq-loongarch-ir.c        | 561 ++++++++++++++++++++++
>   drivers/irqchip/irq-loongson.h            |  12 +
>   include/linux/cpuhotplug.h                |   1 +
>   9 files changed, 594 insertions(+), 14 deletions(-)
>   create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>
>
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

Add some comments?  In kernel docs:


22) 所有内存屏障（例如 ``barrier()``, ``rmb()``, ``wmb()`` ）都需要源代码注
     释来解释它们正在执行的操作及其原因的逻辑。
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
> +
> +static inline struct avecintc_data *irq_data_get_avec_data(struct irq_data *data)
> +{
> +	return data->parent_data->chip_data;
> +}
> +
> +static int redirect_table_alloc(struct redirect_item *item, struct redirect_table *ird_table)
> +{
> +	int index;
> +
> +	guard(raw_spinlock_irqsave)(&ird_table->lock);
> +
> +	index = find_first_zero_bit(ird_table->bitmap, IRD_ENTRIES);
> +	if (index > IRD_ENTRIES) {
> +		pr_err("No redirect entry to use\n");
> +		return -ENOMEM;
> +	}
> +
> +	__set_bit(index, ird_table->bitmap);
> +
> +	item->index = index;
> +	item->entry = &ird_table->table[index];
> +	item->table = ird_table;
> +
> +	return 0;
> +}
> +
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
> +
> +	kfree(item->gpid);
> +
> +	irde_invlid_entry_node(item);
> +
> +	return 0;
> +}
> +
> +static inline void redirect_domain_prepare_entry(struct redirect_item *item, struct avecintc_data *adata)
> +{
> +	struct redirect_entry *entry = item->entry;
> +
> +	item->gpid->en = 1;
> +	item->gpid->irqnum = adata->vec;
> +	item->gpid->dst = adata->cpu;
> +
> +	entry->lo.valid = 1;
> +	entry->lo.gpid = ((long)item->gpid >> GPID_ADDR_SHIFT) & (GPID_ADDR_MASK);
> +	entry->lo.vector = 0xff;
> +	wmb();
> +}
> +
> +static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
> +{
> +	struct redirect_item *item = data->chip_data;
> +	struct avecintc_data *adata;
> +	int ret;
> +
> +	ret = irq_chip_set_affinity_parent(data, dest, force);
> +	if (ret == IRQ_SET_MASK_OK_DONE)
> +		return IRQ_SET_MASK_OK;
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
> +
> +	avecintc_sync(adata);
> +	return IRQ_SET_MASK_OK;
> +}
> +
> +static void redirect_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
> +{
> +	struct redirect_item *item;
> +
> +	item = irq_data_get_irq_chip_data(d);
> +	msg->address_lo = (msi_base_addr | 1 << 2 | ((item->index & 0xffff) << 4));
> +	msg->address_hi = 0x0;
> +	msg->data = 0x0;
> +}
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
> +
> +static struct irq_chip loongarch_redirect_chip = {
> +	.name			= "REDIRECT",
> +	.irq_ack		= redirect_ack_irq,
> +	.irq_mask		= redirect_mask_irq,
> +	.irq_unmask		= redirect_unmask_irq,
> +	.irq_set_affinity	= redirect_set_affinity,
> +	.irq_compose_msi_msg	= redirect_compose_msi_msg,
> +};
> +
> +static void redirect_free_resources(struct irq_domain *domain,
> +						unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *irq_data;
> +	struct redirect_item *item;
> +
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

The line break handling here is not good. Two lines would be

sufficient. Your code style is extremely terrible, and it seems

that you haven't passed the checkpatch.pl test yet.


https://docs.kernel.org/translations/zh_CN/process/coding-style.html


Maybe it would be a good idea to read the kernel

documentation before preparing for v3.


Thanks,

Yanteng


