Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046F54C8E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 07:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749454104; cv=none; b=fXVBynGZttdVzrwSCIHkQ83uZJ1OnkOKg0xlFKkFGJeuMZ5OqGMa44lwxlWwy4IonqRo8aaREjgUy0XcD9QfHdQ0vmPhPenvFaeQV32nV2RHcqiPo1b4y8VbcTIztZBjYkC/8iOOj31bWbMqMKLOjsLUKERSOMqCfiRV0nUiaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749454104; c=relaxed/simple;
	bh=WctuW6LTUfaAaTyy+eZLsKVRcPaX5EMM7mCIoXCU2K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLHlEs1qv4o6PRKsbpZbB63lGv9tDW4TNSv+oXIaPQPsimGjvXtUH2ijADtuwNR/EEqZfOBmyOzPGYu/LW2zvu+StXfFGiEd3f/Nwio3fVnKrNipm6rSkfW0oq2pwaN1eiDlzm1SldzTYjwT4TVx0DPOMSFtgd0+I6SpPwRqzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F72DpPGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F72DpPGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD69BC4CEEB;
	Mon,  9 Jun 2025 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749454103;
	bh=WctuW6LTUfaAaTyy+eZLsKVRcPaX5EMM7mCIoXCU2K0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F72DpPGHwgVMbyQa/fC44dYvaqXYFicj9MWvLG+F65HAMJntOBC6RfOgv7UHqA6jx
	 IueZsHvMvxpU5avvQNj/y354i7UswORVBUnoM1wSepLy7ASX1DqKC2lkMnTDK33Cun
	 jbReWTnB2+/gC6VAXqD2B3X9AvfXc0x7APO0uxjiJl0YEAzNCnldulJe8R9UksHRfe
	 UrU/9pb4yDN6vAcIlTZlsxK/epGWiluYS++kssyyxnFab/PDdNJWNHCeJr8kymBWyw
	 SHkX/9Z18O4FVeMwdJ8zO4ittSWIA19UuCDcDRtB9dkTrFVMsANliOajKnweAoS3EM
	 7kTlJ07oL39mQ==
Message-ID: <fb08e507-d46d-4700-aaa1-506331136b82@kernel.org>
Date: Mon, 9 Jun 2025 09:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 06/45] genirq/proc: Switch to lock guards
To: Zenghui Yu <yuzenghui@huawei.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.373998838@linutronix.de>
 <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
 <fbe8512c-ca7d-7a8c-887c-98eba94e1da9@huawei.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <fbe8512c-ca7d-7a8c-887c-98eba94e1da9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09. 06. 25, 9:15, Zenghui Yu wrote:
>> >From cfad0937ffb724c2c51c8656c212ccefb09c8990 Mon Sep 17 00:00:00 2001
>> From: Zenghui Yu <yuzenghui@huawei.com>
>> Date: Sun, 8 Jun 2025 19:41:41 +0800
>> Subject: [PATCH] fixup! genirq/proc: Switch to lock guards
>>
>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>> ---
>>   kernel/irq/proc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
>> index 29c2404e743b..5af8bd1f3ab4 100644
>> --- a/kernel/irq/proc.c
>> +++ b/kernel/irq/proc.c
>> @@ -86,7 +86,7 @@ static int irq_affinity_hint_proc_show(struct seq_file
>> *m, void *v)
>>   	if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
>>   		return -ENOMEM;
>>
>> -	scoped_guard(raw_spinlock_irq, &desc->lock) {
>> +	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
>>   		if (desc->affinity_hint)
>>   			cpumask_copy(mask, desc->affinity_hint);
>>   	}
>> @@ -298,7 +298,7 @@ static bool name_unique(unsigned int irq, struct
>> irqaction *new_action)
>>   	struct irq_desc *desc = irq_to_desc(irq);
>>   	struct irqaction *action;
>>
>> -	guard(raw_spinlock_irq)(&desc->lock);
>> +	guard(raw_spinlock_irqsave)(&desc->lock);
>>   	for_each_action_of_desc(desc, action) {
>>   		if ((action != new_action) && action->name &&
>>   		    !strcmp(new_action->name, action->name))
>> @@ -489,7 +489,7 @@ int show_interrupts(struct seq_file *p, void *v)
>>   	}
>>   	seq_putc(p, ' ');
>>
>> -	guard(raw_spinlock_irq)(&desc->lock);
>> +	guard(raw_spinlock_irqsave)(&desc->lock);
>>   	if (desc->irq_data.chip) {
>>   		if (desc->irq_data.chip->irq_print_chip)
>>   			desc->irq_data.chip->irq_print_chip(&desc->irq_data, p);
> 
> Plus,

Could you send proper patches, pls?

-- 
js
suse labs
