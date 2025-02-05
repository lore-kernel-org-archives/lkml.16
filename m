Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C321A452
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748089; cv=none; b=LJQYyrueGT87TkC7XqtEhR/z9fGj7sWBtQYzpbxZ9kQj4ufqvuPAgIa3yUYSf80rH7k8s7cujFKnjovmXdir2qenT9jCMahsiTeJ5cAU/r5Ljeo188SKcrJ8eb3/46mSTsRuwdqiOsNofRMKrRUfe6wwvgeqdsl3zcRKMxZB+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748089; c=relaxed/simple;
	bh=o/pQsToO5lcNo/64fZ2Vj6koVI7V+OA3L3uMP6/x4JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6udPAgtdZX+nl2uWIeR4P1le5Gie2ct6iZaKirAFZjSYOWWDBKdRpIT+wx9unIFRmkLT/W7oMSkLbQWLoGKtTvzL8WS8WJmYlzvuF0vHvgKSoqEC9ddm0G8s85N3DepbyCF0TlCT6i5c0DW8JQs/rjiT4wBM1OxJjaktrJXCow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=IavjjRz4; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="IavjjRz4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57F8643310;
	Wed,  5 Feb 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738748085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIR884vCteswdNPavyvmrErLy8EesNlGMdYC5Rzvwvw=;
	b=IavjjRz4bplzLq0FzPP+6aqRIObleshRjfQYtH9UDjG62OC9wfEvZCNpoKC6E83ljBiWjo
	HlZ2N0s9Nna7hs/c5zq/caDPyah3ve9E0KLWtlvCF5uF7lxvDVjdpHUKrfatq3NQaTSlG8
	icWarVUdN9YaOQ+tyqbDIvC/he+HRbSkvP9m3AGeMitEpY38pLQGcUJ40y9jX7AkrsBUjv
	s+ZvJ9G7GzbQM9DqHhjJq5vsV16JqCPnv4hA7vIrl3E162+jJ3+hMwfkP57lzw9zHvYmz0
	uwz8oKIHhy8TGsIXMoIDwOGnUNYe4wyoc9Fs+3NAVDiKy00NfuAkMLIuGW23Rw==
Message-ID: <bfce0a88-a607-44ad-b867-b7fde9b69732@yoseli.org>
Date: Wed, 5 Feb 2025 10:34:44 +0100
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfefudejieeiueffudelfeegveejhedvfeeggefhffelkeehjeekhfegffejnecukfhppeeluddrudeihedrudeihedrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeluddrudeihedrudeihedrudeljedphhgvlhhopegludelvddrudeikedruddriegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
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

Yes, here is one case:
[  754.030361] irq 24, desc: 8aa85495, depth: 1, count: 0, unhandled: 0
[  754.030510] ->handle_irq():  a0b6d8ed, handle_bad_irq+0x0/0x1e8
[  754.030673] ->irq_data.chip(): 6b09f160, 0x4164e544
[  754.030788] ->action(): 00000000
[  754.030843] unexpected IRQ trap at vector 18, flags: 00002711

JM
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

