Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C1D282E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385438; cv=none; b=La/yBoTgdJg3qbpZrZISMrchO//oIV5zLyewl8Kad7MGPARHpaXc5hmeV5UjJViLPkcmIYkJrOFUwEOh012XKFR55LFmjeX0NZmpL6xmt4ucZMs47/su8d4zcXdnXtC3H2yBc6xDGPAo9YgHqcBeOjpnhCdnJ7ainqXm/O2Nt+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385438; c=relaxed/simple;
	bh=oyAZq4VrDYCb4XIaFvSHOK4nEVu1Z1PflrVEodCEaDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wh/J/TLeUIMd1pouyWrK/z+Jh6sCHkr1Vvei3wQ/ny8syHZyqaT8XNX2c8TvGS7hirejGw/ZjiLyyhCWc741xIgBLlGeYFDiXykwld01fyV6H8yPnebigqgL26LSa47Yhx+dLyY8U42zFQYt6MVi6Ky70khPZK44zCC22/0NgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZzLF63TCxz9skH;
	Fri, 16 May 2025 10:42:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9_rnZ1ov2bE; Fri, 16 May 2025 10:42:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZzLF62lT6z9sj6;
	Fri, 16 May 2025 10:42:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 56C528B766;
	Fri, 16 May 2025 10:42:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DF1epUiy2BfR; Fri, 16 May 2025 10:42:50 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A77368B763;
	Fri, 16 May 2025 10:42:49 +0200 (CEST)
Message-ID: <b506e413-f6ef-4f9c-8c15-5fc76f978235@csgroup.eu>
Date: Fri, 16 May 2025 10:42:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/23] sched,watchdog: Convert to sched_set_fifo()
To: Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 qais.yousef@arm.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
 wim@linux-watchdog.org, PRAT Maximilien
 <maximilien.prat@cs-soprasteria.com>,
 CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>
References: <20200422112719.826676174@infradead.org>
 <20200422112832.165197058@infradead.org>
 <20200422085155.7549ca94@gandalf.local.home>
 <20200422132448.GH20730@hirez.programming.kicks-ass.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200422132448.GH20730@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

Le 22/04/2020 à 15:24, Peter Zijlstra a écrit :
> On Wed, Apr 22, 2020 at 08:51:55AM -0400, Steven Rostedt wrote:
>> On Wed, 22 Apr 2020 13:27:35 +0200
>> Peter Zijlstra <peterz@infradead.org> wrote:
>>
>>> Because SCHED_FIFO is a broken scheduler model (see previous patches)
>>> take away the priority field, the kernel can't possibly make an
>>> informed decision.
>>>
>>> Effectively changes prio from 99 to 50.
>>
>> Hmm, this being a watchdog, and looking at commit 38a1222ae4f364d
>> ("watchdog: core: make sure the watchdog worker always works")
>>
>> I wonder if we should add a sched_set_high(), or have some other kind of
>> watchdog handler that is guaranteed to trigger.
> 
> It's FIFO, it'll never win from either a deadline or a stop-task. After
> that it doesn't matter.

It does matter. I didn't realise it when you sent out this patch five 
years ago, but today I'm facing an issue due to that patch. On powerpc 
8xx the watchdog must be woken up every second, the HW is not able to 
take a higher timeout. I have process that is running at SCHED_FIFO prio 
90. From time to time it keeps running for a bit more than one second, 
leading to a watchdog reset. This didn't happen before your patch.

Why having arbitrary selected prio 50 and not kept it at the highest 
possible priority ?

What would be the solution to fix this unexpected watchdog reset ?

> 
> fifo_high() is most definitely a bad idea, because then we're back into
> the whole 'fifo priority' has meaning -- it does not. At least, it
> doesn't until you've got system design information.

I don't understand why it has no meaning. When I have a user app at FIFO 
prio 90 and one at FIFO 89 I know the one at 90 will immediatly preempt 
the one at 89 when receiving data, and that's the behaviour I expect. 
What am I missing here ?

Christophe
