Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375919F13F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231323; cv=none; b=s4jExzO37xCHvlBR4pyfzq7Qzm/jff+k49QkCxQ6GcRuX8YO27EcKFnJBjT+70/cX/PLeqbzKtVB+NI67hgZ2etnBPblkwgjE4Zh/G6VrI5sW5Js80Shdg5H9EdKVBFfXP54xHUXdRVwlzIQh4Bb9iBvSc1WNqWW6PXbwPTW/cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231323; c=relaxed/simple;
	bh=iA9qHjm74xAiI8KdifL6xBUSzz+XVlgjCmJbMIp2zug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gqf7TqwHkExKBABAn3MLqDXrIIrVlQfqsNploqABu3TAM83ciiKiPKLoOyBBUu79B4mmhOkcNHPeN2n3emvTvslUa1Swd1DHft76HODKHeFgD9dtMIqpIgDE55cuc2gIhI/LpMYCHiphz0cbh6n1gnfoWBvI27lSDMNX7rdAuNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2040D43423;
	Thu, 30 Jan 2025 10:01:38 +0000 (UTC)
Message-ID: <03594835-6f12-4582-a4f7-cbb1630dba91@ghiti.fr>
Date: Thu, 30 Jan 2025 11:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <a21df8a8-a50f-49df-a098-69faa51ed8cb@ghiti.fr>
 <649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com>
 <a0012a8d-0c2b-4948-b5c7-7d8efdf1cab0@ghiti.fr>
 <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <32cc0753-a033-4f55-8aca-09416f62faa8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehhtghhrghuhhgrnhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheprghprghtvghlsehvvghnthgrnhgrmhhitghrohdrtghomh
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 28/01/2025 09:10, Clément Léger wrote:
>
> On 27/01/2025 09:09, Alexandre Ghiti wrote:
>>> I believe the goal is not the same. Using CONFIG_VMAP_STACK allows the
>>> kernel exception handling to catch any stack overflow when entering the
>>> kernel and thus using vmalloc is required to allocate twice the page
>>> size (overflow is when sp is located in the upper half of the allocated
>>> vmalloc stack. So basically, this is two distinct purposes.
>>>
>>> AFAIU, kvmalloc allows to fallback to vmalloc if kmalloc fails. This is
>>> not what we are looking for here since our allocation size is always
>>> quite small and known (STACK_SIZE basically).
>>>
>>> But I might be missing something.
>>
>> arch_alloc_vmap_stack() only vmalloc the stack and does not implement
>> any stack overflow mechanism, so I'm still unsure we need the define.
> Hi Alex,
>
> So actually, the stack overflow check itself is done in the exception
> entry. It check if the stack pointer did passed in the upper part of the
> vmalloc allocation (see entry.S:122). In this allocation, the stack size
> is actually * 2:
>
> #ifdef CONFIG_VMAP_STACK
> #define THREAD_ALIGN            (2 * THREAD_SIZE)
> #else
> #define THREAD_ALIGN            THREAD_SIZE
> #endif
>
> So even though it does nothing special by itself, it centralize the
> allocation size/method. And size the size is larger, using vamlloc makes
> sense I guess. The same mechanism is used to allocate irq stack as well.


You're right, it makes sense! Nit: we can avoid the ifdef by using 
IS_ENABLED() but do as you prefer.

Thanks for the explanation,

Alex


>
> Thanks,
>
> Clément
>
>> Thanks,
>>
>> Alex
