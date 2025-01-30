Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DFC1B21A9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250411; cv=none; b=jSMywK5xV7G1MZDL3Mm/JrIyL4GizzcAtXqSlxL2WOSiAYbFwx6RlpfCD9gvUw0A6/Yi6llTL9QfDgWoMfWlkWVT99thP2sJUP5bJpHj8ifAop+9PR3BowkRKGnCtfS+lGNaQfQmK49QyZ/iCLtLiGUqfDgAom/uJBY/UWm+Wds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250411; c=relaxed/simple;
	bh=geV7bZQ9kn2RnS6n8JJtmB9/FyC+NjZVuvwdpgQHfLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZP1PHxpft1VW5h0R4YPt5rioNfxt3pLOUtxYvA4wE7DVFuJUhErF+zuVQAZFn8sA617+jP5m7T4OlcbE2j/1UlFdaLQ0kLz1SVjHjszN4DBZJgXdx4Tw4mZTdgYktBit1FMf9tW6L0I31wYZIiL3kigR6PXGxP00hG8xbAhMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YkMhs5qpGz9sS8;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97DfCRLs5zAY; Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YkMhs534sz9sS7;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AC968B774;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9tEHCDtSNdJp; Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4199A8B763;
	Thu, 30 Jan 2025 16:03:09 +0100 (CET)
Message-ID: <05f6f732-e155-4b60-8c4e-984e42e51ee4@csgroup.eu>
Date: Thu, 30 Jan 2025 16:03:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250130145409.D_so_mR1@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/01/2025 à 15:54, Sebastian Andrzej Siewior a écrit :
> On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -25,6 +25,10 @@
>>   unsigned long global_dbcr0[NR_CPUS];
>>   #endif
>>   
>> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> +#endif
> 
> I am uncertain here: Do you need to DEFINE it? It is set by the sched
> core which also defines it. It should be same thing after all, right?

As far as I can see it is not handled by sched core.

$ git grep sk_dynamic_irqentry_exit_cond_resched
arch/arm64/include/asm/preempt.h:DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
arch/arm64/kernel/entry-common.c:DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
arch/arm64/kernel/entry-common.c: 
(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
include/linux/entry-common.h:DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
kernel/entry/common.c:DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
kernel/entry/common.c:  if 
(!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))

It is in common entry but arm64 and powerpc don't use common entry.

$ git grep GENERIC_ENTRY arch
arch/Kconfig:config GENERIC_ENTRY
arch/loongarch/Kconfig: select GENERIC_ENTRY
arch/riscv/Kconfig:     select GENERIC_ENTRY
arch/s390/Kconfig:      select GENERIC_ENTRY
arch/x86/Kconfig:       select GENERIC_ENTRY


Christophe

