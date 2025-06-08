Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51B8BFF
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749386757; cv=none; b=mP+nRQE/WUBQiKCQ2zUsSptZwtFosgWnxQTBEhtuJlnDN31or5SJvUS/+rM7oZwye74g/kE2QTnPKlRDkZVzzF+ShEfbaF9nLL3YK5Pwl39jiDLin3JfCiU65qpEFjpgjumgwH2ZEQeLxvPOydlLa5RZYBnkLz6wJPhh/ZRWwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749386757; c=relaxed/simple;
	bh=k0EpbVOfD8iVtGt66nbJ3iMzT1849g6rZ5ii7QnMSwM=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cjB//LUJk9pmeTq9+o8LZHG1ntSEMDJIG6c1XMdRt7zQNyT6VOyeLkasxIUaTy3vo5pUiAV66OpAO22hYUmygi46xElJGsZVtVkMPykJ6DzXJFBj93mS0cA2xg7RlfIGICy9PM/I+YUkwsCzJrMp59BdWOGuVCAGE/1deQFr9po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bFZWP4p3QztRP1;
	Sun,  8 Jun 2025 20:44:33 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id D34FB180064;
	Sun,  8 Jun 2025 20:45:45 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 8 Jun 2025 20:45:45 +0800
Subject: Re: [patch V2 06/45] genirq/proc: Switch to lock guards
To: Thomas Gleixner <tglx@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.373998838@linutronix.de>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
Date: Sun, 8 Jun 2025 20:45:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250429065420.373998838@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)

Hi Thomas,

On 2025/4/29 14:54, Thomas Gleixner wrote:
> Convert all lock/unlock pairs to guards and tidy up the code.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> 
> ---
>  kernel/irq/proc.c |   65 +++++++++++++++++++-----------------------------------
>  1 file changed, 24 insertions(+), 41 deletions(-)
> 
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -81,20 +81,18 @@ static int show_irq_affinity(int type, s
>  static int irq_affinity_hint_proc_show(struct seq_file *m, void *v)
>  {
>  	struct irq_desc *desc = irq_to_desc((long)m->private);
> -	unsigned long flags;
>  	cpumask_var_t mask;
>  
>  	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
>  		return -ENOMEM;
>  
> -	raw_spin_lock_irqsave(&desc->lock, flags);
> -	if (desc->affinity_hint)
> -		cpumask_copy(mask, desc->affinity_hint);
> -	raw_spin_unlock_irqrestore(&desc->lock, flags);
> +	scoped_guard(raw_spinlock_irq, &desc->lock) {

Any reason it has been switched to a raw_spinlock_irq?

I've hit some random Oops with the backtrace looks like:

 Call trace:
  string+0x110/0x3b8 (P)
  vsnprintf+0x2f0/0xac8
  seq_printf+0x180/0x220
  show_interrupts+0x4e0/0x7e0
  seq_read_iter+0x350/0xd80
  proc_reg_read_iter+0x194/0x248
  vfs_read+0x5b0/0x940
  ksys_read+0xf0/0x1e8
  __arm64_sys_read+0x74/0xb0
  invoke_syscall+0x74/0x270
  el0_svc_common.constprop.0+0xb4/0x240
  do_el0_svc+0x48/0x68
  el0_svc+0x4c/0xe8
  el0t_64_sync_handler+0xc8/0xd0
  el0t_64_sync+0x1ac/0x1b0

I haven't dig further. But it looks to me that this patch had introduced
functional change and I'm planning to give the following diff a go on
the same box.

Thanks,
Zenghui

From cfad0937ffb724c2c51c8656c212ccefb09c8990 Mon Sep 17 00:00:00 2001
From: Zenghui Yu <yuzenghui@huawei.com>
Date: Sun, 8 Jun 2025 19:41:41 +0800
Subject: [PATCH] fixup! genirq/proc: Switch to lock guards

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 kernel/irq/proc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
index 29c2404e743b..5af8bd1f3ab4 100644
--- a/kernel/irq/proc.c
+++ b/kernel/irq/proc.c
@@ -86,7 +86,7 @@ static int irq_affinity_hint_proc_show(struct seq_file
*m, void *v)
 	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
 		return -ENOMEM;

-	scoped_guard(raw_spinlock_irq, &desc->lock) {
+	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
 		if (desc->affinity_hint)
 			cpumask_copy(mask, desc->affinity_hint);
 	}
@@ -298,7 +298,7 @@ static bool name_unique(unsigned int irq, struct
irqaction *new_action)
 	struct irq_desc *desc = irq_to_desc(irq);
 	struct irqaction *action;

-	guard(raw_spinlock_irq)(&desc->lock);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	for_each_action_of_desc(desc, action) {
 		if ((action != new_action) && action->name &&
 		    !strcmp(new_action->name, action->name))
@@ -489,7 +489,7 @@ int show_interrupts(struct seq_file *p, void *v)
 	}
 	seq_putc(p, ' ');

-	guard(raw_spinlock_irq)(&desc->lock);
+	guard(raw_spinlock_irqsave)(&desc->lock);
 	if (desc->irq_data.chip) {
 		if (desc->irq_data.chip->irq_print_chip)
 			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
-- 
2.33.0
