Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F9622836B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738739232; cv=none; b=Hu8wpWIb2d//LdQ48vSIumADKKdfET7wtSjeHyQ8R7BSqLFDzy/a6BE7gX1QMtI4USNoaIQqK2WjkzwXTt5s6EuAk60BMWO/YDRHwFbiIhxafmb0Q+TfCDrfGzRcyLaXniULIf8MLv6lYI4zLOSda9AEFW1doQOnzgyCjFoWT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738739232; c=relaxed/simple;
	bh=nQd6usJsvwVhoEPf5AmSTBAup55zRcMYQ394ji0nGiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbBLFzfii3uzU8HQR3CffRR4plFgDy0A7WPuCGtFnHH+SrkyVbuO4a5QELIqua7CB9wR/Tc+qNMxpiX5A9mX0GRWsDXXnt//MwNIn7dmWEHx4EmYWIJVgou5CFrD8hfa7o1Pdn++5BF9J2B0xH8r0tDY+1CqyPGVciRDOsxyj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=cQk2ETrd; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="cQk2ETrd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6FA5442C9;
	Wed,  5 Feb 2025 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738739227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0VtT32gYLV6F3SgoDwUDv0XaYjZqDJeK1pWum/LuLk=;
	b=cQk2ETrdYBwy8UBWKe0j9YLkql+9R9/FCSGxh1/McdaHpPaPZlc37uY4mUnsjVSu3X7+VY
	peF3kR/Jo0RlBh+j3yK9eH3TcAFCq1YwymaY69qJ7JPx1hhK4tx7sK5D7LuZ+1hnFLzPJx
	bIG4XdCvM2hm/hqdACgWWEJtMDGWk+d84TvS37WTtLMIgrKtx+AwooftAbJCnJ8aPyCPDk
	fKhZ0zp1u1FLXiczcxKiUI96wO7b06kXGSUVjBRUY6N+SHv3aO98jywg3MM0xnZ8gjaHAO
	V2tKiPNxw6vc43IpKzP09HFwyNS+2brW8+dyTZBx+Uus+7HsItEifuILdwKFQw==
Message-ID: <770e02b6-d9c5-4a2c-8516-63e08bdc4358@yoseli.org>
Date: Wed, 5 Feb 2025 08:07:06 +0100
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfefudejieeiueffudelfeegveejhedvfeeggefhffelkeehjeekhfegffejnecukfhppeeluddrudeihedrudeihedrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeluddrudeihedrudeihedrudeljedphhgvlhhopegludelvddrudeikedruddriegnpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
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

The only change is the Supervisor bit in SR which is not changed in
arch_local_irq_disable() while it is forced to 1 in my function (setting 
it to 0x2700 AFAICT).

But I can confirm I couldn't see the issue with this code, while using 
the existing arch_local_irq_save() it still appears (less frequently 
than without it at all, but still).

Any suggestion :-) ?

Thanks,
JM

> 
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

