Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866D204589
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700232; cv=none; b=UPsrApekt3/CumKxT+19KBv6CekdikABRaObioo+28UfqmZVc0V1C0jNG5laax3lIc+StnW0MAUkgFH6RwWv5lqPbSYUxuRMYT3p02HN1LLfDn9hIem8uMr9VaLuRdT0n8Pm3tCd5AOwBlz9sdwNu73227ntFjvAGX9rhM/OcPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700232; c=relaxed/simple;
	bh=cqNFdRo7JWvDWMI0Jiucy/HHSiw/Mm4U2HDtidBUTqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALvdyVfRiAXmHtgTMZcj31KMkEzSsWNMXOik0kdEq5x4IiV27IuJUE3S+iWcRUgZ3smVDozaK8izXb1BIvpTl9FCaHWHkMkhaNvwVfxB68gi1d1tEN7hDJCNJydl7KgMnEzKT5zhv0PwusqhtbZukZyzRcQUHjlGwcHDlXsxjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=eCPHrmh9; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="eCPHrmh9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF384442CA;
	Tue,  4 Feb 2025 20:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738700223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr8DClel7ZTedbngqGf/lQ7u2+pT/4V4s//m4zfK1rg=;
	b=eCPHrmh9LW1AhFE6sJYj+QqZFMWkuOxrjSU91wNWsAqq9B9phUh+KJSkodvESL1rBwajkp
	lrAw8GS3SNWltrC/uNw3m4HqaTAupzkSNr3QT9obhTkOMPLlbJw/3wlUGt8FRwsvSnUklH
	vybEHhpAe95LSPcevPFfbkuKN6JI5f6QUW//7EqzkeqCy34Mnx2jekeS1b07UyYNvLwOeh
	PxyqEDPdvkvQ3tm+99hLDpdO+4Ucm7iJteUznLEdHSMP05YUVjFkXEQDQgkMhbpvKJFSab
	dqfhgUF2Wjf3Sk/MS4utBNnL46F41v+Eev9sDwa6npNJ9jkf6w4gUPZ28y3v7w==
Message-ID: <d6f4e8b7-2626-4fed-b46d-80a9cdb54a50@yoseli.org>
Date: Tue, 4 Feb 2025 21:17:02 +0100
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
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <CAMuHMdXkq57WjUPeg3kTsgi-YSw23qV-gK4gVxymOSKGGTDuQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfefudejieeiueffudelfeegveejhedvfeeggefhffelkeehjeekhfegffejnecukfhppeeluddrudeihedrudeihedrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeluddrudeihedrudeihedrudeljedphhgvlhhopegludelvddrudeikedruddriegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
 hhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Geert,

On 04/02/2025 20:27, Geert Uytterhoeven wrote:
> Hi Jean-Michel,
> 
> On Tue, 4 Feb 2025 at 19:38, Jean-Michel Hautbois
> <jeanmichel.hautbois@yoseli.org> wrote:
>> The ColdFire interrupt controller can generate spurious interrupts if an
>> interrupt source is masked in the IMR while the CPU interrupt priority
>> mask (SR[I]) is set lower than the interrupt level.
>>
>> The reference manual states:
>>
>> To avoid this situation for interrupts sources with levels 1-6, first
>> write a higher level interrupt mask to the status register, before
>> setting the mask in the IMR or the module’s interrupt mask register.
>> After the mask is set, return the interrupt mask in the status register
>> to its previous value.
>>
>> It can be tested like this:
>> - Prepare a iperf3 server on the coldfire target (iperf3 -s -D)
>> - Start a high priority cyclictest:
>>      cyclictest --secaligned -m -p 99 -i 2500 -q
>> - Start iperf3 -c $COLDFIRE_IP -t 0
>>
>> After a few seconds the dmesg may display:
>> [   84.784301] irq 24, desc: dbc502da, depth: 1, count: 0, unhandled: 0
>> [   84.784455] ->handle_irq():  0ba0aca3, handle_bad_irq+0x0/0x1e0
>> [   84.784610] ->irq_data.chip(): c6779d4f, 0x41652544
>> [   84.784719] ->action(): 00000000
>> [   84.784770] unexpected IRQ trap at vector 18
>>
>> With this patch, I never saw it in a few hours testing.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/coldfire/intc-simr.c
>> +++ b/arch/m68k/coldfire/intc-simr.c
>> @@ -58,6 +58,14 @@ static inline unsigned int irq2ebit(unsigned int irq)
>>
>>   #endif
>>
>> +static inline void intc_irq_setlevel(unsigned long level)
>> +{
>> +       asm volatile ("move.w %0,%%sr"
>> +                     : /* no outputs */
>> +                     : "d" (0x2000 | ((level) << 8))
>> +                     : "memory");
>> +}
>> +
>>   /*
>>    *     There maybe one, two or three interrupt control units, each has 64
>>    *     interrupts. If there is no second or third unit then MCFINTC1_* or
>> @@ -67,13 +75,17 @@ static inline unsigned int irq2ebit(unsigned int irq)
>>   static void intc_irq_mask(struct irq_data *d)
>>   {
>>          unsigned int irq = d->irq - MCFINT_VECBASE;
>> +       unsigned long flags = arch_local_save_flags();
>>
>> +       intc_irq_setlevel(7);
> 
> Can't all of the above just be replaced by
> 
>      unsigned long flags = arch_local_irq_save();
> 

I will check it again, but it seems a bit different. Now I get:
[   97.919407] hrtimer: interrupt took 203520 ns
[  161.757921] irq 24, desc: 24ef8971, depth: 1, count: 0, unhandled: 0
[  161.758074] ->handle_irq():  60d6a158, handle_bad_irq+0x0/0x1e0
[  161.758241] ->irq_data.chip(): 93aaf7a5, 0x4164e544
[  161.758359] ->action(): 00000000
[  161.758415] unexpected IRQ trap at vector 18

So, maybe isn't it exactly the same after all ?

JM

>>          if (MCFINTC2_SIMR && (irq > 127))
>>                  __raw_writeb(irq - 128, MCFINTC2_SIMR);
>>          else if (MCFINTC1_SIMR && (irq > 63))
>>                  __raw_writeb(irq - 64, MCFINTC1_SIMR);
>>          else
>>                  __raw_writeb(irq, MCFINTC0_SIMR);
>> +
>> +       arch_local_irq_restore(flags);
>>   }
>>
>>   static void intc_irq_unmask(struct irq_data *d)
>>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

