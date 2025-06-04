Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00D198E81
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056091; cv=none; b=euNDmzb3speaFzlsmHd6U4TB4YMuObTaVytSLy21jyquSFZb2faiiiCBqH1RDxIY3nYAf54wE//Qe3H9Zap308n3z/U69qrafjRI0EQMsjVvtFPmDlcQ1iiIPgZ1Y+UDY5XifNhh8Lv8xp2OTo1K1iL2C6x7kdDUJQNwKyGFQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056091; c=relaxed/simple;
	bh=4DKEyF4tpd5LE4WYj/Ecz1SQwUxE88FvS29eKBTxUcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKNbdDCuUtUvrpWwVIkOEgG0gSZ06yo9BfPNGHzMIZRwcT7nev+eLhxhPoGPdSCcapQLSxX7+R06O3a5EoQmq0MkTG309CQZPu6ql9jBA1Xx5w13aRJCjliua+jOLdcMnK6jjIAIhit3QnyF1UW1RfZY8DCceGqPVG+UvsxOx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c64g4RHi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c64g4RHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mcu2aJZ7tNizCqp+CAr0S3BB27I77lxIBXbe3cEyD/k=;
	b=c64g4RHi9rKJekwG+HEabPmOgkZi+9/D3xZ7UJXzsaeHZq0S6bDIey+hq8i6KOMuYOwrE+
	H5oiKHmbwApbv233vwA1zRHV6qDLsRJS77hDPn5XBVQHeFT+9c3lB3uJR9+p6KAyY/RR61
	cP1MgRH71+4iTrdPQ0A3w+6hUns/OzI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-82JEwE54Pl2rHdBtiJzBFw-1; Wed, 04 Jun 2025 12:54:47 -0400
X-MC-Unique: 82JEwE54Pl2rHdBtiJzBFw-1
X-Mimecast-MFC-AGG-ID: 82JEwE54Pl2rHdBtiJzBFw_1749056087
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso614708f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056086; x=1749660886;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mcu2aJZ7tNizCqp+CAr0S3BB27I77lxIBXbe3cEyD/k=;
        b=U3XeAKki5ToWtK3zwEuYNzVxNnpawJhFyST60f0wXXb4RYKzahfQl/hxmEouuirE9K
         iUZva0SAJkEPYdQTC0d/IHe1BGBOQH0OCkc7ddONe7ah0d9RRIxSmjCzVg5wWSWQXmKr
         IbZjgxsCWK9Nkv1mK/824fbXSMVreRacsSjYqUT9nGw7SOCUIyWqgy7HhYN8IpHdljGB
         MkTQRRNnV1WuA9zWyDHPPVXFx8qMdX5j85RPhxYdCWdITLWySMnfvIlCSZ5TWOdUpUnd
         sR7njHXszz4rlrepD6BmCR0wGr1ZSZcTXtoz7EAYP47tx4NBPs2I+Esclz0j/E2dl37t
         54vA==
X-Forwarded-Encrypted: i=1; AJvYcCV/ICMk/gwInJ4d+RqSK2AudHuJDJT0/8RehkFaWGmodkP360Vy0o6Bm4x0RHXwTdJOQskzrs4333PXSHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlEpiFOS23gBAcj+rRh61AWO9OrB3Va5jiNSHS5w/pNkfrung
	9hTBlOeI0JIQE+iaNPnPtzl2cIfDeeJZD2jNS9jm5P94uNIyRKGREem2xFIzxbYOVEGn6Wrndpq
	e8EDifVcB3isjZpg1ntZtzlhcnhVarusxV6/dt9KFanW8j4eg4jb/dl8VSnRuakWQXQ==
X-Gm-Gg: ASbGncsMteiN7rp2vhF17/TEVdO0iKz7Gciuad3cucQ3iUml2KL0x8D4s0QmeASb+yd
	hw/BN6bGBOpNPk1hmyOVyuQl70c2WCEot+FQgHmnmVytWI+A/RWfML2J4P6fIE5BK0Obp0sdLFE
	xjdNErzUnrn2zHNL+ZoxXvI3OvAUR6Uu0F10Mlu68SiK2t7iKF+du5fN/7w4VftarhFNLyXMUGo
	lBwzmbnW9p6wn3I0PJhAcujX71ziD4CRz7+32GGdbsuJgfH4z17lYIa6eiNNOohHMSchlWpXCD5
	BNXE7vYJ7J5png==
X-Received: by 2002:a05:6000:2c13:b0:3a4:ed9a:7016 with SMTP id ffacd0b85a97d-3a526e1d833mr225600f8f.26.1749056086584;
        Wed, 04 Jun 2025 09:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGyE8OyvTcTRJ+Ojy5kNOLlEVm5dxXrNtoBkm4cJYtYHAXG13nNuoW0OzHVyL762PpnSHlww==
X-Received: by 2002:a05:6000:2c13:b0:3a4:ed9a:7016 with SMTP id ffacd0b85a97d-3a526e1d833mr225575f8f.26.1749056086177;
        Wed, 04 Jun 2025 09:54:46 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450d800658csm203489145e9.27.2025.06.04.09.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:54:45 -0700 (PDT)
Message-ID: <2667fad4-3635-413b-87a9-26cb6102ffab@redhat.com>
Date: Wed, 4 Jun 2025 18:54:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] KVM: x86: Add CONFIG_KVM_IOAPIC to allow disabling
 in-kernel I/O APIC
To: Sean Christopherson <seanjc@google.com>, Kai Huang <kai.huang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>
References: <20250519232808.2745331-1-seanjc@google.com>
 <20250519232808.2745331-12-seanjc@google.com>
 <d131524927ffe1ec70300296343acdebd31c35b3.camel@intel.com>
 <019c1023c26e827dc538f24d885ec9a8530ad4af.camel@intel.com>
 <aDhvs1tXH6pv8MxN@google.com>
 <58a580b0f3274f6a7bba8431b2a6e6fef152b237.camel@intel.com>
 <aDjo16EcJiWx9Nfa@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aDjo16EcJiWx9Nfa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/25 01:08, Sean Christopherson wrote:
> On Thu, May 29, 2025, Kai Huang wrote:
>> On Thu, 2025-05-29 at 07:31 -0700, Sean Christopherson wrote:
>>> On Thu, May 29, 2025, Kai Huang wrote:
>>>> On Thu, 2025-05-29 at 23:55 +1200, Kai Huang wrote:
>>>>> Do they only support userspace IRQ chip, or not support any IRQ chip at all?
>>>
>>> The former, only userspace I/O APIC (and associated devices), though some VM
>>> shapes, e.g. TDX, don't provide an I/O APIC or PIC.
>>
>> Thanks for the info.
>>
>> Just wondering what's the benefit of using userspace IRQCHIP instead of
>> emulating in the kernel?
> 
> Reduced kernel attack surface (this was especially true years ago, before KVM's
> I/O APIC emulation was well-tested) and more flexibility (e.g. shipping userspace
> changes is typically easier than shipping new kernels.  I'm pretty sure there's
> one more big one that I'm blanking on at the moment.

Feature-wise, the big one is support for IRQ remapping which is not 
implemented in the in-kernel IOAPIC.

>>>> Forgot to ask:
>>>>
>>>> Since this new Kconfig option is not only for IOAPIC but also includes PIC and
>>>> PIT, is CONFIG_KVM_IRQCHIP a better name?
>>>
>>> I much prefer IOAPIC, because IRQCHIP is far too ambiguous and confusing, e.g.
>>> just look at KVM's internal APIs, where these:
>>>
>>>    irqchip_in_kernel()
>>>    irqchip_kernel()
>>>
>>> are not equivalent.  In practice, no modern guest kernel is going to utilize the
>>> PIC, and the PIT isn't an IRQ chip, i.e. isn't strictly covered by IRQCHIP either.
>>
>> Right.
>>
>> Maybe it is worth to further have dedicated Kconfig for PIC, PIT and IOAPIC?
> 
> Nah.  PIC and I/O APIC can't be split (without new uAPI and non-trivial complexity),
> and I highly doubt there is any use case that would want an in-kernel I/O APIC
> with a userspace PIT.  I.e. in practice, the three almost always come as a group;
> either a setup wants all, or a setup wants none.

Without "almost", even.  I think it's okay to make it CONFIG_KVM_IOAPIC, 
it's not super accurate but there's no single word that convey "IOAPIC, 
PIC and PIT".

>> Btw, I also find irqchip_in_kernel() and irqchip_kernel() confusing.  I am not
>> sure the value of having irqchip_in_kernel() in fact.  The guest should always
>> have an in-kernel APIC for modern guests.  I am wondering whether we can get rid
>> of it completely (the logic will be it is always be true), or we can have a
>> Kconfig to only build it when user truly wants it.

irqchip_kernel() can be renamed to irqchip_full().

> For better or worse, an in-kernel local APIC is still optional.  I do hope/want
> to make it mandatory, but that's not a small ABI change.

I am pretty sure that some users (was it DOSBox? or maybe even gVisor?) 
would break.

Paolo

