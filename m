Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91A2D3231;
	Mon, 23 Jun 2025 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709136; cv=none; b=K31O3nWp0D7B5QohKJWnDHInm8zbdz/w9U4SorOHObyzDqkNloshIJUjefDYyEXmPHG3rfBKhgAXe5O2+LzxB8sBpfSSm0oxmtgpbjMEpqHluV/TzDpMztbLigwLRdC4uhqmpmXMmrkMajmsJsmBn+PiAehC6hnr4pJefdqRi9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709136; c=relaxed/simple;
	bh=D8uHjK24h11d4qSJcEP4C96xsm8K+FoZ8/horBvHnf8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OHAToZ9YQ8Wys7z9IOLo/NMiGIF0eczXa1KnoWJZZO/04bQMMZuqoPuhxCfGVseeMwwty0nJgEhvLZZQeteU7hGC6JzPQs9CrP6Mtqbh1naf08PxxBPcZ8D8HLSlKn8QUtw7s/PSrsYPm1E3oM5m/UMDMlZqgSrwaN/xZWEgbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FeK0768e; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mp/3JIaa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FeK0768e";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mp/3JIaa"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750709132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMM6QwCsCKxnWFFi+r7c6XK6N7v8X1dMyHwbTGK2fn0=;
	b=FeK0768eH/1WBYabmyCN/mg4CIMYw60exRcAJ3J3y0LuEVW+9pVUf+SpuCWD3AnKUCRN55
	jeTl5yzGkZanoqeyjxLrSl2dRPPCtuzWnCdw64hpUAsstc2zuqJnr9GjsvC/Jpzu+pHILb
	45EeFp36YmkC6mGU11yBI3Pjkx7rCxU6iJzd1wiuUVkb1gnN4vfbrOyta/lw2mERRfj3lu
	JDK/OT+zU5wP2CHXZdAOHQJbfjqnEjG6Eo36uq5KDZypRHpOUPkpD0YXnZHSQGgJE+Orfj
	IlYZ/4AHOxTCGmOB44GgsZAGDx06bYZXj8S326flTPnZMxXC7VC6z90KLvjdfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750709132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMM6QwCsCKxnWFFi+r7c6XK6N7v8X1dMyHwbTGK2fn0=;
	b=mp/3JIaavtG/Tx0bjkqXU3kT7YAWlNr6GVGZjS0cIpIzgrzsyT4hvL4PFc9edpg5JhQL+q
	dllKV1wj5PlG3fDg==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
In-Reply-To: <fceb603c-6072-2941-15d5-56c8a4b4c32c@loongson.cn>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <20250610114252.21077-3-zhangtianyang@loongson.cn> <87o6uris6p.ffs@tglx>
 <9c60326b-f7bd-0b36-3bc5-0ad7d19690f1@loongson.cn> <87v7omooag.ffs@tglx>
 <fceb603c-6072-2941-15d5-56c8a4b4c32c@loongson.cn>
Date: Mon, 23 Jun 2025 22:05:31 +0200
Message-ID: <87jz52nrzo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23 2025 at 17:33, Tianyang Zhang wrote:
> =E5=9C=A8 2025/6/23 =E4=B8=8B=E5=8D=884:27, Thomas Gleixner =E5=86=99=E9=
=81=93:
>> tail is the software managed part of the ringbuffer which is shared with
>> the hardware, right?
>>
>> So even if the compiler would be allowed to reevalutate tail after the
>> barrier (it is NOT), then tail would still contain the same value as
>> before, no?
>>
>> The wmb() is required to ensure that the hardware can observe the full
>> write of the command _before_ it can observe the update to the tail
>> index.
>>
>> Anything else is voodoo.
>>
>> Thanks,
>>
>>          tglx
>
> In my previous understanding, tail'value is actually a part of 'full=20
> write of the command '.

Of course. The hardware observes the tail value. If it is not updated
then the command is not executed. But these are two distinct things:

The invalidate command is written to a location in the command buffer
which is determined by tail:

	inv_addr =3D (struct irde_inv_cmd *)(rqueue->base + tail * sizeof(struct i=
rde_inv_cmd));
	memcpy(inv_addr, cmd, sizeof(struct irde_inv_cmd));

requeue::base points to an array of invalidate commands. The array
size is INVALID_QUEUE_SIZE. tail is the position in the array to which
the software writes the next command. tail is software managed and
written to a completely different location via write_queue_tail(...):

static phys_addr_t redirect_reg_base =3D 0x1fe00000;

#define REDIRECT_REG_BASE(reg, node) \
	(UNCACHE_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | =
(reg))
#define	redirect_reg_queue_tail(node)	REDIRECT_REG_BASE(LOONGARCH_IOCSR_RED=
IRECT_CQT, (node))
#define read_queue_tail(node)		(*((u32 *)(redirect_reg_queue_tail(node))))
#define write_queue_tail(node, val)	(*((u32 *)(redirect_reg_queue_tail(node=
))) =3D (val))

The hardware maintains the head index. It's the last command index the
hardware processed. When the hardware observes that head !=3D tail then it
processes the next entry and after completion it updates head with the
next index. This repeats until head =3D=3D tail.

> We must ensure that tail is updated to the correct value first, and
> then write this value into the register (perhaps by adding wmb in
> write_queue_tail ).

No. The local variable 'tail' is purely local to the CPU and the
invalidation hardware does not even know that it exists.

There are two things which are relevant to the hardware:

   1) command is written to the hardware visible array at index of tail

   2) hardware visible tail memory (register) is updated to tail + 1

The memory barrier is required to prevent that #2 is written to the
hardware _before_ #1 completed and is fully visible to the hardware.

> In other words, this is originally to prevent the write register=20
> instruction from being executed out of order before updating tail.

No. The barrier is solely for the above #1 vs. #2 ordering.

There is a difference between program flow ordering and memory ordering.

The hardware _CANNOT_ execute the write _before_ the value it writes is
computed. That's enforced by program flow order.

So it's always guaranteed that the CPU executes

   tail + 1

_before_ executing the write to the register because that's a program
order dependency.

If that would not be guaranteed, then your CPU would have more serious
problems than this piece of code. It simply would not even survive the
first five instructions in the boot loader.

But what's not guaranteed is that consecutive writes become visible to
other parts of the system (other CPUs, the invalidation hardware, ....)
in the same consecutive order.

To ensure that ordering you need a WMB(). If you would have CPU to CPU
communication then you would need a RMB() on the reader side to ensure
that the command is not read before the tail. In your case the hardware
side takes care of that.

> The above is just my personal understanding

Which might need some slight adjustments :)

Thanks,

        tglx


