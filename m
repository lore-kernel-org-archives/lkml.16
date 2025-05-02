Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888CB21D3DD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175285; cv=none; b=hMOaNMknJ4N7dlCjk4YRYnC8nx/UrwbIiKlRSljagCoMtjc/ekQoHHXcgHW4xKKdpvat6HvMwlbI5Qyni7bA+JYBEweG9s943UPKZndCgNsQqH9R32eiiAVowyyLyYTqSMY2522IhtaN5DTogsufY5BGjwkTlGmP38XG39px8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175285; c=relaxed/simple;
	bh=npABTeUFUCu6LQpOWIpBYOYHmW80tuI5wNyqHdFBqYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njQHyGB/KXomKY7uHJ2bD8Zaa666OC6SLbtsUEKE0DSdow6QiOZuekqn8L+sPyOTFGhEPVKEkGAAK8XIifjiKAlBgGGtwetp/JPB7xmBLqhNrtFMYLVT74zcs+6xX65SvREUsIGtjomrRe+OwIoKE7boMKtECjYvujsQQ3z1lZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=itGXcyXA; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="itGXcyXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=3z7pnP5a9433Xs9kCWo2kjpx1MkwlxyUKoKm47boGUo=;
	b=itGXcyXAYcQ3CClaj9PZUTkMaImSdVHKR2a1uLDihBVXJu3Uwa+wTHYkhrvI8A
	fgEe8vdTz8BBrCLsxOCLnGWu7e4j0n44nCTLliQlAYMX4EFZKwEUCs3gV4n9Tx51
	S2MNH7IjaRqyDotndsNuVJhUT5Jz9RmlViYGG0fN9MrAo=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDndAIWhRRonRbODw--.57534S2;
	Fri, 02 May 2025 16:40:55 +0800 (CST)
Message-ID: <398dd7f9-7651-4b36-a543-093a219c0077@163.com>
Date: Fri, 2 May 2025 16:40:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] genirq/msi: Fix MSI domain debugfs show
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de
References: <20250430124836.49964-2-ajones@ventanamicro.com>
 <96a6e4a3-c89c-4446-8c3f-a0f173aed26a@163.com>
 <20250502-10084e4c093eceb9a3d276e2@orel>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250502-10084e4c093eceb9a3d276e2@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDndAIWhRRonRbODw--.57534S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWUXr1UtF4DAF4UGFyDWrg_yoW7JFykpF
	y5tF1UCr48Jr13Xr4jkr45Z34UtFyaya47JryUWF13AF1DWw1DtF10qFZrCrn0yr1UJr12
	yr4qq3y0vr98G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRniSLUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhRBo2gUbY-O1wABsK



On 2025/5/2 15:33, Andrew Jones wrote:
> On Thu, May 01, 2025 at 09:51:07AM +0800, Hans Zhang wrote:
>>
>>
>> On 2025/4/30 20:48, Andrew Jones wrote:
>>> irq_domain_debug_show_one() calls the irqdomain's debug_show() with
>>> a non-null domain pointer and a null irqdata pointer
>>> (irq_debug_show_data() calls debug_show() with those the other way
>>> around). Ensure we have a non-null irqdata pointer in
>>> msi_domain_debug_show() before dereferencing it.
>>>
>>> Fixes: 01499ae673dc ("genirq/msi: Expose MSI message data in debugfs")
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>    kernel/irq/msi.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
>>> index 5c8d43cdb0a3..c05ba7ca00fa 100644
>>> --- a/kernel/irq/msi.c
>>> +++ b/kernel/irq/msi.c
>>> @@ -761,7 +761,7 @@ static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fw
>>>    static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
>>>    				  struct irq_data *irqd, int ind)
>>>    {
>>> -	struct msi_desc *desc = irq_data_get_msi_desc(irqd);
>>> +	struct msi_desc *desc = irqd ? irq_data_get_msi_desc(irqd) : NULL;
>>
>> Hi Andrew,
>>
>> I think irqd will never be NULL.
>>
>>
>> static int irq_debug_show(struct seq_file *m, void *p)
>>    irq_debug_show_data(m, data, 0);
>>      if (data->domain && data->domain->ops && data->domain->ops->debug_show)
>>        data->domain->ops->debug_show(m, NULL, data, ind + 1);
>>          msi_domain_debug_show
>>
>>
>>
>> static int irq_debug_show(struct seq_file *m, void *p)
>> {
>> 	struct irq_desc *desc = m->private;
>> 	struct irq_data *data;
>>
>> 	raw_spin_lock_irq(&desc->lock);
>> 	data = irq_desc_get_irq_data(desc);
>>
>> 	If it needs to be judged as NULL, should it also be here?
>>
>>
>>
>> static void irq_domain_debug_show_one(struct seq_file *m, struct irq_domain
>> *d, int ind)
>>    if (d->ops && d->ops->debug_show)	// d->ops->debug_show is NULL, not
>> irq_debug_show.
>>
>>
>> If I'm wrong, please correct me.
>>
> 
> # cat /sys/kernel/debug/irq/domains/PCI-MSIX-0000:00:01.0-12
> [   51.954695] Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000000010
> [   51.956868] Current cat pgtable: 4K pagesize, 57-bit VAs, pgdp=0x0000000101a9a000
> [   51.957207] [0000000000000010] pgd=00000000407e8801, p4d=00000000406a9001, pud=00000000407ac001, pmd=00000000407ad001, pte=0000000000000000
> [   51.958324] Oops [#1]
> [   51.958417] Modules linked in:
> [   51.958721] CPU: 1 UID: 0 PID: 83 Comm: cat Not tainted 6.15.0-rc4-00147-gebd297a2affa #1 NONE
> [   51.958993] Hardware name: riscv-virtio,qemu (DT)
> [   51.959196] epc : msi_domain_debug_show+0xa/0x8a
> [   51.959736]  ra : irq_domain_debug_show_one+0xb6/0xf4
> [   51.959871] epc : ffffffff800a26a4 ra : ffffffff8009f064 sp : ff2000000035bc10
> [   51.960035]  gp : ffffffff81516710 tp : ff600000802d7080 t0 : ff600000809f20c3
> [   51.960204]  t1 : 00000000000000de t2 : ffffffff80e01470 s0 : ff2000000035bc40
> [   51.960373]  s1 : ff60000080285f00 a0 : ff60000081eb5000 a1 : ff60000080285f00
> [   51.960533]  a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
> [   51.960697]  a5 : ffffffff800a269a a6 : 0000000000000000 a7 : 0000000000000010
> [   51.960854]  s2 : ff60000081eb5000 s3 : 0000000000000000 s4 : 0000000000000001
> [   51.961017]  s5 : ff2000000035bd00 s6 : 0000000000000000 s7 : ff60000081eb5028
> [   51.961188]  s8 : fffffffffffff000 s9 : ff60000081eb5038 s10: 000000007ffff000
> [   51.961349]  s11: 0000000000000000 t3 : ffffffff80e5d850 t4 : 0000000000174000
> [   51.961509]  t5 : 0000000000000002 t6 : ff600000809f20de
> [   51.961635] status: 0000000200000120 badaddr: 0000000000000010 cause: 000000000000000d
> [   51.961886] [<ffffffff800a26a4>] msi_domain_debug_show+0xa/0x8a
> [   51.962098] [<ffffffff8009f064>] irq_domain_debug_show_one+0xb6/0xf4
> [   51.962250] [<ffffffff8009f0b4>] irq_domain_debug_show+0x12/0x2a
> [   51.962389] [<ffffffff80246bd6>] seq_read_iter+0xc6/0x316
> [   51.962516] [<ffffffff80246f12>] seq_read+0xec/0x11e
> [   51.962634] [<ffffffff80381d20>] full_proxy_read+0x48/0x88
> [   51.962771] [<ffffffff802184de>] vfs_read+0xb2/0x288
> [   51.962897] [<ffffffff80218ecc>] ksys_read+0x56/0xc0
> [   51.963012] [<ffffffff80218f4a>] __riscv_sys_read+0x14/0x1c
> [   51.963147] [<ffffffff809f3566>] do_trap_ecall_u+0x186/0x206
> [   51.963290] [<ffffffff809fdf42>] handle_exception+0x146/0x152
> [   51.963588] Code: 0209 9181 b7a5 4981 b759 7179 f022 f406 e44e 1800 (6a1c) b983
> [   51.963910] ---[ end trace 0000000000000000 ]---
> Segmentation fault


Ok, I see. Thank you for fixing this problem.

Reviewed-by: Hans Zhang <18255117159@163.com>

Best regards,
Hans


