Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291872CA9;
	Tue, 27 May 2025 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748309008; cv=none; b=BqaTKFKE3WGcEacxJkDyj+RfhutbJdTvb+jUnvKOcTSx5SwhWvzrU6WMsE6CWKnmRw7XPVvn5sObc/T2FDuXpxg0Ig5Fl4+PXvH87grzCvOwXzq/dZfsv7uPqoiLb/qtBxbyFBzCCNDK38DI4gL2+YatRGIUBh/t/7g9VQECRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748309008; c=relaxed/simple;
	bh=RCTS5Q8jZ+oF/3rMbSOpe3KLs7/BzUkxofZQFAlY7ts=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=A3dn+CZoH5An+f2ytl5Ez+jIkcMNe1TBvxHXqhW2liy76vESdXzy9emaCBs0ZLod9dTppN2D13JRRCkSQS8pStxrKWIgKcTBVc/wTekLoWySjgoTWJVN/16V1XShZ2LTtbU/ioxJmOBvvOtIJd+JKCasCyDHmQN2xRyXX4QBKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxGHEKFDVoJqb9AA--.17694S3;
	Tue, 27 May 2025 09:23:22 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBxLscEFDVorBn0AA--.43652S3;
	Tue, 27 May 2025 09:23:18 +0800 (CST)
Subject: Re: [PATCH v3 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250523101833.17940-1-zhangtianyang@loongson.cn>
 <20250523101833.17940-3-zhangtianyang@loongson.cn> <87ecwdqct9.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <3de9bbc8-9ef0-f187-dae0-659958e21db3@loongson.cn>
Date: Tue, 27 May 2025 09:22:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87ecwdqct9.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBxLscEFDVorBn0AA--.43652S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3ArW7AF4rKrykCw13Jr4xuFX_yoWxXFy5pF
	WUJa12gFWFqrWxWr1Iqr4DZFySvrZ3GrsrJrW8K3Zayas09r1IkF1rWFya9FyrCr15CF1j
	vr4jqrZrur1DJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jnEfOUUU
	UU=

Hi , Thomas

在 2025/5/25 下午5:06, Thomas Gleixner 写道:
> On Fri, May 23 2025 at 18:18, Tianyang Zhang wrote:
>>   
>> -static void avecintc_sync(struct avecintc_data *adata)
>> +void avecintc_sync(struct avecintc_data *adata)
>>   {
>>   	struct pending_list *plist;
>>   
>> @@ -109,7 +99,7 @@ static int avecintc_set_affinity(struct irq_data *data, const struct cpumask *de
>>   			return -EBUSY;
>>   
>>   		if (cpu_online(adata->cpu) && cpumask_test_cpu(adata->cpu, dest))
>> -			return 0;
>> +			return IRQ_SET_MASK_OK_DONE;
> This change really wants to be seperate with a proper explanation and
> not burried inside of this pile of changes.
Ok, I got it , I will add some annotation info
>
>> +static inline bool invalid_queue_is_full(int node, u32 *tail)
>> +{
>> +	u32 head;
>> +
>> +	head = read_queue_head(node);
> Please move the initialization into the declaration line:
>
>         u32 head = read_queue...();
>
> All over the place, where it's the first operation in the code. That
> makes the code more dense and easier to follow.
OK I got it , thanks
>
>> +	*tail = read_queue_tail(node);
>> +
>> +	return !!(head == ((*tail + 1) % INVALID_QUEUE_SIZE));
> What's the !! for? A == B is a boolean expression already.
Emmm....This is actually a rookie mistake, thanks
>
>> +}
>> +
>> +static void invalid_enqueue(struct redirect_queue *rqueue, struct irde_inv_cmd *cmd)
>> +{
>> +	struct irde_inv_cmd *inv_addr;
>> +	u32 tail;
>> +
>> +	guard(raw_spinlock_irqsave)(&rqueue->lock);
>> +
>> +	while (invalid_queue_is_full(rqueue->node, &tail))
>> +		cpu_relax();
>> +
>> +	inv_addr = (struct irde_inv_cmd *)(rqueue->base + tail * sizeof(struct irde_inv_cmd));
>> +	memcpy(inv_addr, cmd, sizeof(struct irde_inv_cmd));
>> +	tail = (tail + 1) % INVALID_QUEUE_SIZE;
>> +
>> +	/*
>> +	 * The uncache-memory access may have an out of order problem cache-memory access,
>> +	 * so a barrier is needed to ensure tail is valid
>> +	 */
> This comment does not make sense at all.
>
> What's the actual uncached vs. cached access problem here? AFAICT it's
> all about the ordering of the writes:
>
>      You need to ensure that the memcpy() data is visible _before_ the
>      tail is updated, no?

Yes, the fundamental purpose is to ensure that all data is valid when 
updating registers.

I will modify the annotation information here. Thank you

>> +	wmb();
>> +
>> +	write_queue_tail(rqueue->node, tail);
>> +}
>> +static int redirect_table_free(struct redirect_item *item)
> That return value is there to be ignored by the only caller, right?
Let's re evaluate the significance of the return value here, thanks
>
>> +{
>> +	struct redirect_table *ird_table;
>> +	struct redirect_entry *entry;
>> +
>> +	ird_table = item->table;
>> +
>> +	entry = item->entry;
>> +	memset(entry, 0, sizeof(struct redirect_entry));
>> +
>> +	scoped_guard(raw_spinlock_irqsave, &ird_table->lock)
>> +		bitmap_release_region(ird_table->bitmap, item->index, 0);
>> +
>> +	kfree(item->gpid);
>> +
>> +	irde_invlid_entry_node(item);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void redirect_domain_prepare_entry(struct redirect_item *item,
>> +					struct avecintc_data *adata)
> Please align the argument in the second line properly:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#line-breaks
Ok, I got it , thanks
>
>> +
>> +static inline void redirect_ack_irq(struct irq_data *d)
>> +{
>> +}
>> +
>> +static inline void redirect_unmask_irq(struct irq_data *d)
>> +{
>> +}
>> +
>> +static inline void redirect_mask_irq(struct irq_data *d)
>> +{
>> +}
> These want some explanation why they are empty.
Ok, I got it , thanks
>
>> +
>> +static struct irq_chip loongarch_redirect_chip = {
>> +	.name			= "REDIRECT",
>> +	.irq_ack		= redirect_ack_irq,
>> +	.irq_mask		= redirect_mask_irq,
>> +	.irq_unmask		= redirect_unmask_irq,
>> +	.irq_set_affinity	= redirect_set_affinity,
>> +	.irq_compose_msi_msg	= redirect_compose_msi_msg,
>> +};
>> +out_free_resources:
>> +	redirect_free_resources(domain, virq, nr_irqs);
>> +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
>> +
>> +	return -EINVAL;
> -ENOMEM?
Ok, I got it , thanks
>> +}
>> +
>> +	bitmap = bitmap_zalloc(IRD_ENTRIES, GFP_KERNEL);
>> +	if (!bitmap) {
>> +		pr_err("Node [%d] redirect table bitmap alloc pages failed!\n", node);
>> +		return -ENOMEM;
> Leaks pages.
Ok, I got it , thanks
>
>> +	}
>> +
>> +	ird_table->bitmap = bitmap;
>> +	ird_table->nr_ird = IRD_ENTRIES;
>> +	ird_table->node = node;
>> +
>> +	raw_spin_lock_init(&ird_table->lock);
>> +
>> +	if (redirect_queue_init(node))
>> +		return -EINVAL;
> Leaks pages and bitmap.
Ok, I got it , thanks
>
>> +
>> +	iocsr_write64(CFG_DISABLE_IDLE, LOONGARCH_IOCSR_REDIRECT_CFG);
>> +	iocsr_write64(__pa(ird_table->table), LOONGARCH_IOCSR_REDIRECT_TBR);
>> +
>> +	return 0;
>> +}
>> +#if defined(CONFIG_ACPI)
> #ifdef CONFIG_ACPI
Ok, I got it , thanks
>
>> +static int __init redirect_reg_base_init(void)
>> +{
>> +	acpi_status status;
>> +	uint64_t addr = 0;
> What's this initialization for?

The initial purpose here was to confirm the validity of the data 
returned by acpi_evaluate_integer,

but perhaps this is not necessary.

I will confirm again here, thanks

>
>> +int __init redirect_acpi_init(struct irq_domain *parent)
>> +{
>> +	struct fwnode_handle *fwnode;
>> +	struct irq_domain *domain;
>> +	int ret;
>> +
>> +	fwnode = irq_domain_alloc_named_fwnode("redirect");
>> +	if (!fwnode) {
>> +		pr_err("Unable to alloc redirect domain handle\n");
>> +		goto fail;
>> +	}
>> +
>> +	domain = irq_domain_create_hierarchy(parent, 0, IRD_ENTRIES, fwnode,
>> +			&redirect_domain_ops, irde_descs);
> Please align the arguments in the second line properly.
Ok, I got it , thanks
>> +static int redirect_cpu_online(unsigned int cpu)
>> +{
>> +	int ret, node = cpu_to_node(cpu);
>> +
>> +	if (cpu != cpumask_first(cpumask_of_node(node)))
>> +		return 0;
>> +
>> +	ret = redirect_table_init(node);
>> +	if (ret) {
>> +		redirect_table_fini(node);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
> So if you unplug all CPUs of a node and then replug the first CPU in the
> node, then this invokes redirect_table_init() unconditionally, which
> will unconditionally allocate pages and bitmap again ....
We need to reconsider here, thank you
>
> Thanks,
>
>          tglx

Thanks again

     Tianyang

