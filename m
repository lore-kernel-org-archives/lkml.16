Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3D1DB551
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749454413; cv=none; b=GgACeIqtlWKncMroQHGiOKbzVyc2FkvE1Njp/vKjJlRqLo3Zb0VzqSXZPmDK3q8acVN9Xn5cxKalTMlxdDMXqcMjHPdOKj24K2/plaAt1WmtPzf3WNC0ifDnVWIFBfUkAvkskurgiFjtwReM5mE3yPLNyAKtPR6QObXJk24C9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749454413; c=relaxed/simple;
	bh=QaxojkVtlA/Eecw7/nitLhom6Y0NYWMUD+mP43cCj/I=;
	h=Subject:From:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FtfVr2r7siY8efDkmoc1eh1VIYZKcFkTAHSf9gJjDtpAZeEPrmrwgKRpoA8IcrE2PgHN5pWvh38hQmxpvtTlvBWljXTsTzPnUGcoV+Ep1mpWZsNZL3q1/XkoIRTkuK/MsBCvCaYMI73SLGo6VNm2IcmYHiMKRVH+VuA3q0Msouw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bG3563fNrz2Cddg;
	Mon,  9 Jun 2025 15:11:54 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id C8ADF140118;
	Mon,  9 Jun 2025 15:15:44 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 15:15:44 +0800
Subject: Re: [patch V2 06/45] genirq/proc: Switch to lock guards
From: Zenghui Yu <yuzenghui@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.373998838@linutronix.de>
 <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
Message-ID: <fbe8512c-ca7d-7a8c-887c-98eba94e1da9@huawei.com>
Date: Mon, 9 Jun 2025 15:15:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200017.china.huawei.com (7.202.194.83)

On 2025/6/8 20:45, Zenghui Yu wrote:
> Hi Thomas,
> 
> On 2025/4/29 14:54, Thomas Gleixner wrote:
> > Convert all lock/unlock pairs to guards and tidy up the code.
> >
> > No functional change.
> >
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >
> > ---
> >  kernel/irq/proc.c |   65 +++++++++++++++++++-----------------------------------
> >  1 file changed, 24 insertions(+), 41 deletions(-)
> >
> > --- a/kernel/irq/proc.c
> > +++ b/kernel/irq/proc.c
> > @@ -81,20 +81,18 @@ static int show_irq_affinity(int type, s
> >  static int irq_affinity_hint_proc_show(struct seq_file *m, void *v)
> >  {
> >  	struct irq_desc *desc = irq_to_desc((long)m->private);
> > -	unsigned long flags;
> >  	cpumask_var_t mask;
> >  
> >  	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
> >  		return -ENOMEM;
> >  
> > -	raw_spin_lock_irqsave(&desc->lock, flags);
> > -	if (desc->affinity_hint)
> > -		cpumask_copy(mask, desc->affinity_hint);
> > -	raw_spin_unlock_irqrestore(&desc->lock, flags);
> > +	scoped_guard(raw_spinlock_irq, &desc->lock) {
> 
> Any reason it has been switched to a raw_spinlock_irq?
> 
> I've hit some random Oops with the backtrace looks like:
> 
>  Call trace:
>   string+0x110/0x3b8 (P)
>   vsnprintf+0x2f0/0xac8
>   seq_printf+0x180/0x220
>   show_interrupts+0x4e0/0x7e0
>   seq_read_iter+0x350/0xd80
>   proc_reg_read_iter+0x194/0x248
>   vfs_read+0x5b0/0x940
>   ksys_read+0xf0/0x1e8
>   __arm64_sys_read+0x74/0xb0
>   invoke_syscall+0x74/0x270
>   el0_svc_common.constprop.0+0xb4/0x240
>   do_el0_svc+0x48/0x68
>   el0_svc+0x4c/0xe8
>   el0t_64_sync_handler+0xc8/0xd0
>   el0t_64_sync+0x1ac/0x1b0
> 
> I haven't dig further. But it looks to me that this patch had introduced
> functional change and I'm planning to give the following diff a go on
> the same box.
> 
> Thanks,
> Zenghui
> 
>>From cfad0937ffb724c2c51c8656c212ccefb09c8990 Mon Sep 17 00:00:00 2001
> From: Zenghui Yu <yuzenghui@huawei.com>
> Date: Sun, 8 Jun 2025 19:41:41 +0800
> Subject: [PATCH] fixup! genirq/proc: Switch to lock guards
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  kernel/irq/proc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
> index 29c2404e743b..5af8bd1f3ab4 100644
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -86,7 +86,7 @@ static int irq_affinity_hint_proc_show(struct seq_file
> *m, void *v)
>  	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
>  		return -ENOMEM;
> 
> -	scoped_guard(raw_spinlock_irq, &desc->lock) {
> +	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
>  		if (desc->affinity_hint)
>  			cpumask_copy(mask, desc->affinity_hint);
>  	}
> @@ -298,7 +298,7 @@ static bool name_unique(unsigned int irq, struct
> irqaction *new_action)
>  	struct irq_desc *desc = irq_to_desc(irq);
>  	struct irqaction *action;
> 
> -	guard(raw_spinlock_irq)(&desc->lock);
> +	guard(raw_spinlock_irqsave)(&desc->lock);
>  	for_each_action_of_desc(desc, action) {
>  		if ((action != new_action) && action->name &&
>  		    !strcmp(new_action->name, action->name))
> @@ -489,7 +489,7 @@ int show_interrupts(struct seq_file *p, void *v)
>  	}
>  	seq_putc(p, ' ');
> 
> -	guard(raw_spinlock_irq)(&desc->lock);
> +	guard(raw_spinlock_irqsave)(&desc->lock);
>  	if (desc->irq_data.chip) {
>  		if (desc->irq_data.chip->irq_print_chip)
>  			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);

Plus,

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b0e0a7332993..57facdc30d55 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -964,7 +964,7 @@ __irq_do_set_handler(struct irq_desc *desc,
irq_flow_handler_t handle,
 void __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int
is_chained,
 		       const char *name)
 {
-	scoped_irqdesc_get_and_lock(irq, 0)
+	scoped_irqdesc_get_and_buslock(irq, 0)
 		__irq_do_set_handler(scoped_irqdesc, handle, is_chained, name);
 }
 EXPORT_SYMBOL_GPL(__irq_set_handler);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c94837382037..400856abf672 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -659,7 +659,7 @@ void __disable_irq(struct irq_desc *desc)

 static int __disable_irq_nosync(unsigned int irq)
 {
-	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
 		__disable_irq(scoped_irqdesc);
 		return 0;
 	}
@@ -789,7 +789,7 @@ void __enable_irq(struct irq_desc *desc)
  */
 void enable_irq(unsigned int irq)
 {
-	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
 		struct irq_desc *desc = scoped_irqdesc;

 		if (WARN(!desc->irq_data.chip, "enable_irq before setup/request_irq:
irq %u\n", irq))
