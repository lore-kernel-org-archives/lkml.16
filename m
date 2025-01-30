Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7780E13FEE
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250585; cv=none; b=uNlk1XkSZnSkxZ1tB1OB53+1ANa3U8nHwpJS9le9BqgFPfBfzqoppkdkn6oLn7Frn0tBsObjnXwQ7u5/h2K3oMfuDKAUlzSLHAPpYEyBHvsWOr9u8DTBGg6kxQA8xk70GSFLxNfWwDV8ZhY6wyzw3RwRNAyrWwYVKuf41BzbNW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250585; c=relaxed/simple;
	bh=uww7W12zRIdXHNpWXGHheoZMHdMXMeB1fBakeVZJAmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIlh7Q9w/QORNAQZ/KyCeX04HHrsq2I4yNALH8iG+U2EKNiHt4VgLgjSpXFZ5Q7KPaeKcs5l+Pr/xmComKpjrYbMSIgymMH8G/GU20wWn7GGGc7WR5FHgkHldG1TvbjHEMtOAkpCGRgtAiToe12Ry5QrKC8QuGrJO2mk5Y8Igc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AF97442BB;
	Thu, 30 Jan 2025 15:23:01 +0000 (UTC)
Message-ID: <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
Date: Thu, 30 Jan 2025 16:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvm5xlw4anb.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuieegveegudffiedvveejhfejiefhgefhkeejtdeufedufeehhfeufeduleehieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepshgthhifrggssehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

On 30/01/2025 15:52, Andreas Schwab wrote:
> On Jan 30 2025, Alexandre Ghiti wrote:
>
>> That's a nice catch indeed. IIUC, we have the same issue here
>> https://elixir.bootlin.com/linux/v6.13/source/arch/riscv/include/asm/futex.h#L89
>> right?
> Indeed, though it doesn't result in wrong code currently.  This is
> because the compare value is passed unmodified as u32 to the asm and the
> compiler keeps the value sign extended in registers.  That would break
> if you would add a cast to long like in commit 6c58f25e6938 as that
> would erroneously zero extend it.
>

This is the disassembly I get:

ffffffff800fc540 <futex_atomic_cmpxchg_inatomic>:

...

ffffffff800fc566:       1605a8af                lr.w.aqrl a7,(a1)
ffffffff800fc56a:       00c89563                bne 
a7,a2,ffffffff800fc574 <futex_atomic_cmpxchg_inatomic+0x3
4>
ffffffff800fc56e:       1ed5a52f                sc.w.aqrl a0,a3,(a1)

a2 is used as it is passed by the calling function, so we can't be sure 
a2 is sign extended to me, what am I missing?

