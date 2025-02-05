Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2022A4F2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754823; cv=none; b=VUIMTB5GSuKfnAReD+7P2q73F0/Zllax9h+mmmqNOYD/t77jq4pVZYivPQFMOh/VBnWqwE+G/VVfGCxKAHSKE++Rv/3KCe70N+lX1H9XURjEFyMJtlCu0/UuzI92ZJ6fwX84DohblJS9GzAN+03Re9wouH89/GTm4d97VfBqIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754823; c=relaxed/simple;
	bh=vAjOelsLhgE7cTbajS/rLoP4/dBuyc7KpYJdvzKzjjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9QavVqpBgd6kwW6MtF7Mx2diigYQXEGyCTz2MF6gijyPbUb0dl0q2QKeQoy/VlfW1osQNKIrYFwnS9uG6LeiTS1rmyypdK2qu8fU8YRBKzZY+INk93W1RIvSeUyv3UyvhptwfknXNt2ktZsqFttn8yg63L/Nh8GikU6joKJc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=PNdxbj8i; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="PNdxbj8i"
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9FEC431F3;
	Wed,  5 Feb 2025 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738754819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sq5Wl3VpxfteH7yDU0FYkqu7z1ZPKnw3eIciZDN0ybk=;
	b=PNdxbj8im98MeQerosXAQ6X/mIgTqYZqaoe0HGa2e6w7B3za+PwmGO3R5YPbHWSad44ZfI
	k6OG0KIJIJLsIAkyH92N7T8P6PRcX8M7dRbzgxVXXVMn2zgLF//66O2AoBzuz1g2ovtClH
	aEoVcy3CeFQkBm6dK+5uMpDiPwkQU0wBj+KSEHG17wj1pXXm8a/DN1lfoQb17SaAwRVEIO
	MFV7CAUsFZH7+LEQZREj4yPlLPpptVTVTjbL9eQVP0zZf/u7velVSXxwUSkk+puh5X+x+A
	NTVEFcLAaIcj+kAZ7UF4ipPirmqxwTol7Wsx6Prqgg6kmgjL5c+Actbfo8xIqQ==
Message-ID: <f13b40d7-4a67-4de8-8d25-1a56be164dbe@yoseli.org>
Date: Wed, 5 Feb 2025 12:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: coldfire: Prevent spurious interrupts when masking
 IMR
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250204-coldfire-spurious-irq-v1-1-b8f28855f690@yoseli.org>
 <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
 <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
 <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <CAMuHMdXtzGFr2iE7py2fQPMegJTnfKe_NtW25g=h+sohfEhmAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfefudejieeiueffudelfeegveejhedvfeeggefhffelkeehjeekhfegffejnecukfhppeeluddrudeihedrudeihedrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeluddrudeihedrudeihedrudeljedphhgvlhhopegludelvddrudeikedruddriegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
 hhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Geert,

On 05/02/2025 09:14, Geert Uytterhoeven wrote:
> Hi Jean-Michel,
> 
> On Wed, 5 Feb 2025 at 08:07, Jean-Michel Hautbois
> <jeanmichel.hautbois@yoseli.org> wrote:
>> On 04/02/2025 20:27, Geert Uytterhoeven wrote:
>>> On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
>>> <jeanmichel.hautbois@yoseli.org> wrote:
>>>> The ColdFire interrupt controller can generate spurious interrupts if an
>>>> interrupt source is masked in the IMR while the CPU interrupt priority
>>>> mask (SR[I]) is set lower than the interrupt level.
>>>>
>>>> The reference manual states:
>>>>
>>>> To avoid this situation for interrupts sources with levels 1-6, first
>>>> write a higher level interrupt mask to the status register, before
>>>> setting the mask in the IMR or the module’s interrupt mask register.
>>>> After the mask is set, return the interrupt mask in the status register
>>>> to its previous value.
>>>>
>>>> It can be tested like this:
>>>> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
>>>> - Start a high priority cyclictest:
>>>>       cyclictest --secaligned -m -p 99 -i 2500 -q
>>>> - Start iperf3 -c $COLDFIRE_IP -t 0
>>>>
>>>> After a few seconds the dmesg may display:
>>>> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: 0
>>>> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
>>>> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
>>>> [   84.784719] ->action(): 00000000
>>>> [   84.784770] unexpected IRQ trap at vector 18
>>>>
>>>> With this patch, I never saw it in a few hours testing.
>>>>
>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/m68k/coldfire/intc-simr.c
>>>> +++ b/arch/m68k/coldfire/intc-simr.c
>>>> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int irq)
>>>>
>>>>    #endif
>>>>
>>>> +static inline void intc_irq_setlevel(unsigned long level)
>>>> +{
>>>> +       asm volatile ("move.w %0,%%sr"
>>>> +                     : /* no outputs */
>>>> +                     : "d" (0x2000 | ((level) << 8))
>>>> +                     : "memory");
>>>> +}
>>>> +
>>>>    /*
>>>>     *     There maybe one, two or three interrupt control units, each has 64
>>>>     *     interrupts. If there is no second or third unit then MCFINTC1_* or
>>>> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int irq)
>>>>    static void intc_irq_mask(struct irq_data *d)
>>>>    {
>>>>           unsigned int irq = d->irq - MCFINT_VECBASE;
>>>> +       unsigned long flags = arch_local_save_flags();
>>>>
>>>> +       intc_irq_setlevel(7);
>>>
>>> Can't all of the above just be replaced by
>>>
>>>       unsigned long flags = arch_local_irq_save();
>>
>> The only change is the Supervisor bit in SR which is not changed in
>> arch_local_irq_disable() while it is forced to 1 in my function (setting
>> it to 0x2700 AFAICT).
>>
>> But I can confirm I couldn't see the issue with this code, while using
>> the existing arch_local_irq_save() it still appears (less frequently
>> than without it at all, but still).
>>
>> Any suggestion :-) ?
> 
> There are other differences: your version clears all other bits, incl.
> condition codes and master/interrupt state.
> 
> Can you save the flags above in a global, and print it in the
> unexpected IRQ handler, to see which other bits are set when
> it happens?

An interesting side effect is... that only saving the flags makes it *a 
lot* harder to reproduce -_-.
Which is coherent with a race condition though :p.

Each time I got the message, the flags saved where 0x2711.

JM

> Gr{oetje,eeting}s,
> 
>                          Geert
> 

