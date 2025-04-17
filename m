Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30CD1922FB;
	Thu, 17 Apr 2025 02:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856428; cv=none; b=HlhGo49DL9f7uyKyydPa1WgOqHv2HMOSmP7Yk7CrWdU/mgapvKuv4KUJnJ1XOXXGQS0n1yL2PS3ExMZVfsRBtt7+b40CwUkTz7e4RZSaFqauRzxEdzUuBmOKFn3FRlp5zpm/vEI9LP343ZhUlpIPtZi9xQhOy4TGpkA5HyzDAjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856428; c=relaxed/simple;
	bh=rhvCIqQEwxBgv4DhjWDvEpT8TN1nGrgFuyPNSSHoA9M=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=csGX5O5VJKKvSDgcv8Qxc6x4XFW0ldKnffoYLY0zOki9Nq2P5+z1LiLzamV60nvgjyLpxVa/6CGM9gHKwNp2TDDAKsQ8nuk9PYHYa+5qHApijeghYPzmab76/xwY9t/rIEFBkQzPimlJN5NRNXpL8JAZCEBHL55WwbCfe2bUYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8BxrOJkZQBoLabAAA--.17906S3;
	Thu, 17 Apr 2025 10:20:20 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMDxvhtfZQBo_kOHAA--.20302S3;
	Thu, 17 Apr 2025 10:20:17 +0800 (CST)
Subject: Re: [PATCH v2 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-3-zhangtianyang@loongson.cn> <87ldskwdyb.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <a916e71b-de79-391a-55be-f8d7583ca344@loongson.cn>
Date: Thu, 17 Apr 2025 10:19:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87ldskwdyb.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxvhtfZQBo_kOHAA--.20302S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFWfWw48uw1DXF4kCF13ZFc_yoWrKF1DpF
	yUGay2yayrXF4UWr10gF4DAFWIqr48GrZrKrWrGa43A3sI9r1xCF10grya9F95Crn5CF12
	vF4jvrZ7ur1DJFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnEfOUUUUU=

Hi, Thomas

ÔÚ 2025/4/1 ÏÂÎç3:14, Thomas Gleixner Ð´µÀ:
> On Mon, Mar 31 2025 at 14:41, Tianyang Zhang wrote:
>>   	irq_data_update_effective_affinity(data, cpumask_of(cpu));
>> @@ -242,6 +233,7 @@ static void avecintc_irq_dispatch(struct irq_desc *desc)
>>   		d = this_cpu_read(irq_map[vector]);
>>   		if (d) {
>>   			generic_handle_irq_desc(d);
>> +
> Stray newline.
OK, I got it
>
>>   		} else {
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
>> +	wmb();
> Undocumented memory barrier.
OK , I got it
>
>> +
>> +	iocsr_write32(tail, LOONGARCH_IOCSR_REDIRECT_CQT);
>> +}
>> +
>> +static void smp_call_invalid_enqueue(void *arg)
>> +{
>> +	struct smp_invalid_arg *s_arg = (struct smp_invalid_arg *)arg;
>> +
>> +	invalid_enqueue(s_arg->queue, s_arg->cmd);
>> +}
>> +
>> +static void irde_invlid_entry_node(struct redirect_item *item)
>> +{
>> +	struct redirect_queue *rqueue;
>> +	struct smp_invalid_arg arg;
>> +	struct irde_inv_cmd cmd;
>> +	volatile u64 raddr = 0;
>> +	int node = item->table->node, cpu;
>> +
>> +	rqueue = &(irde_descs[node].inv_queue);
>> +	cmd.cmd_info = 0;
>> +	cmd.index.type = INVALID_INDEX;
>> +	cmd.index.need_notice = 1;
>> +	cmd.index.index = item->index;
>> +	cmd.notice_addr = (u64)(__pa(&raddr));
>> +
>> +	if (cpu_to_node(smp_processor_id()) == node)
>> +		invalid_enqueue(rqueue, &cmd);
>> +	else {
> if () lacks brackets
OK , I got it
>
>> +		for_each_cpu(cpu, cpumask_of_node(node)) {
>> +			if (cpu_online(cpu))
>> +				break;
>> +		}
>> +		arg.queue = rqueue;
>> +		arg.cmd = &cmd;
>> +		smp_call_function_single(cpu, smp_call_invalid_enqueue, &arg, 0);
>> +	}
>> +
>> +	while (!raddr)
>> +		cpu_relax();
>> +
>> +}
>
>> +static int redirect_table_free(struct redirect_item *item)
>> +{
>> +	struct redirect_table *ird_table;
>> +	struct redirect_entry *entry;
>> +	unsigned long flags;
>> +
>> +	ird_table = item->table;
>> +
>> +	entry = item->entry;
>> +	memset(entry, 0, sizeof(struct redirect_entry));
>> +
>> +	raw_spin_lock_irqsave(&ird_table->lock, flags);
>> +	bitmap_release_region(ird_table->bitmap, item->index, 0);
>> +	raw_spin_unlock_irqrestore(&ird_table->lock, flags);
> 	scoped_guard(raw_spinlock_irqsave, &ird_table->lock)
> 		bitmap_release_region(ird_table->bitmap, item->index, 0);

Initially, I thought there were no complex branches here, so I directly 
used raw_spin_lock_irqsave.

However, considering the unified code style, scoped_guard is more 
appropriate

>
>> +static int redirect_set_affinity(struct irq_data *data, const struct cpumask *dest, bool force)
>> +{
>> +	struct redirect_item *item = data->chip_data;
>> +	struct avecintc_data *adata;
>> +	int ret;
>> +
>> +	ret = irq_chip_set_affinity_parent(data, dest, force);
>> +	if (ret == IRQ_SET_MASK_OK_DONE)
>> +		return IRQ_SET_MASK_OK;
> Again bracket rules. Also what is this return value ranslation about?

My initial aim was to keep the return value consistent with the previous 
one.

I'll study the differences between the two return values and make 
appropriate changes. Thank you.

>
>> +	else if (ret) {
>> +		pr_err("IRDE:set_affinity error %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	adata = irq_data_get_avec_data(data);
>> +
>> +	redirect_domain_prepare_entry(item, adata);
>> +
>> +	irde_invlid_entry_node(item);
> This cannot work when irde_invlid_entry_node() goes into the SMP
> function call path, because smp_call_function_single() cannot be invoked
> with interrupts disabled.
My oversight. This approach is indeed risky. I'll rethink the design. 
Thanks for your advice.
>> +{
>> +	struct redirect_table *ird_table;
>> +	struct avecintc_data *avec_data;
>> +	struct irq_data *irq_data;
>> +	int ret, i, node;
>> +
>> +#ifdef CONFIG_NUMA
>> +	node = ((msi_alloc_info_t *)arg)->desc->dev->numa_node;
> Bah.
>
>> +#else
>> +	node = 0;
>> +#endif
>          msi_alloc_info_t *info = arg;
>
>          node = dev_to_node(info->desc->dev);
This is appropriate and safe. Thank you.
>
>> +static int redirect_table_init(int node)
>> +{
>> +	struct redirect_table *ird_table = &(irde_descs[node].ird_table);
>> +	struct page *pages;
>> +	unsigned long *bitmap;
> Use proper reverse fir tree ordering
>
> Thanks,
>
>          tglx

I'll strive to fix other code style issues.

Thank you for your reply.

Tianyang

