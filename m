Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211EEC5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994811; cv=none; b=HFUlsItyED9S6FdI0jzbqRaxqLTaZ6pozz/To2bCXKM6hKDq7y4Swp/hhEOkBLjCgAGXesfYHuk+e9242ZbIcHhbP2hFV81SQnvFN6t/UojY86k5VWIVhI/0P5F35Xwjs3xtwUH9L0/Om2fg3tvelEWfa7lPYoJCefvagCQiBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994811; c=relaxed/simple;
	bh=qC5fCWD7G3vzvz2Fu1UusWpSqQ3RfBL4anoMR/H8Uws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0yde9Pcxcey6Tsqr0WtBfD+WqzGJNjOw6/f2pxiXO54vo9VwqB28cpfAfAmztaW4YBNPD/KYyAJZ97kKiB6EJnH+g0GuXxYo7BPa4tjdYGznX4fQQ+4fbrfB3xznnZIjVfwskSWkmU3OvcFc6+s/8lx4chgj9WnsyqQkJS8Nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D78942E81;
	Fri, 23 May 2025 10:06:38 +0000 (UTC)
Message-ID: <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
Date: Fri, 23 May 2025 12:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
To: Xi Ruoyao <xry111@xry111.site>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250411024600.16045-1-xry111@xry111.site>
 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekheejucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeffhfdvfedtvdffhffhleejveeviedvffdtudegveffffegffdtieetveehjeduveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlughsrdhssgenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvgeljedvmegutgdumeejvdduugemiedtsgdtpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegvleejvdemuggtudemjedvudgumeeitdgstdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopeigrhihudduudesgihrhiduuddurdhsihhtvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehli
 hhnuhhtrhhonhhigidruggvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeflrghsohhnseiigidvtgegrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr

On 5/23/25 10:02, Xi Ruoyao wrote:
> On Fri, 2025-05-23 at 10:01 +0200, Alexandre Ghiti wrote:
>> Hi Xi,
>>
>> On 4/11/25 10:04, Thomas Weißschuh wrote:
>>> On Fri, Apr 11, 2025 at 10:46:00AM +0800, Xi Ruoyao wrote:
>>>> Hook up the generic vDSO implementation to the generic vDSO
>>>> getrandom
>>>> implementation by providing the required
>>>> __arch_chacha20_blocks_nostack
>>>> and getrandom_syscall implementations. Also wire up the selftests.
>>>>
>>>> The benchmark result:
>>>>
>>>> 	vdso: 25000000 times in 2.466341333 seconds
>>>> 	libc: 25000000 times in 41.447720005 seconds
>>>> 	syscall: 25000000 times in 41.043926672 seconds
>>>>
>>>> 	vdso: 25000000 x 256 times in 162.286219353 seconds
>>>> 	libc: 25000000 x 256 times in 2953.855018685 seconds
>>>> 	syscall: 25000000 x 256 times in 2796.268546000 seconds
>>>>
>>>> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
>>>> ---
>>>>
>>>> [v1]->v2:
>>>> - Fix the commit message.
>>>> - Only build the vDSO getrandom code if CONFIG_VDSO_GETRANDOM, to
>>>>     unbreak RV32 build.
>>>> - Likewise, only enable the selftest if __riscv_xlen == 64.
>>>>
>>>> [v1]:
>>>> https://lore.kernel.org/all/20250224122541.65045-1-xry111@xry111.site/
>>>>
>>>>    arch/riscv/Kconfig                            |   1 +
>>>>    arch/riscv/include/asm/vdso/getrandom.h       |  30 +++
>>>>    arch/riscv/kernel/vdso/Makefile               |  12 +
>>>>    arch/riscv/kernel/vdso/getrandom.c            |  10 +
>>>>    arch/riscv/kernel/vdso/vdso.lds.S             |   1 +
>>>>    arch/riscv/kernel/vdso/vgetrandom-chacha.S    | 244
>>>> ++++++++++++++++++
>>>>    .../selftests/vDSO/vgetrandom-chacha.S        |   2 +
>>>>    7 files changed, 300 insertions(+)
>>>>    create mode 100644 arch/riscv/include/asm/vdso/getrandom.h
>>>>    create mode 100644 arch/riscv/kernel/vdso/getrandom.c
>>>>    create mode 100644 arch/riscv/kernel/vdso/vgetrandom-chacha.S
>>> <snip>
>>>
>>>> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S
>>>> b/arch/riscv/kernel/vdso/vdso.lds.S
>>>> index 8e86965a8aae..abc69cda0445 100644
>>>> --- a/arch/riscv/kernel/vdso/vdso.lds.S
>>>> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
>>>> @@ -80,6 +80,7 @@ VERSION
>>>>    #ifndef COMPAT_VDSO
>>>>    		__vdso_riscv_hwprobe;
>>>>    #endif
>>>> +		__vdso_getrandom;
>>> For consistency this could be gated behind CONFIG_VDSO_GETRANDOM.
>>
>> Nathan sent a fix for this here:
>>
>> https://lore.kernel.org/all/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/
> I've given it an R-b.  Do you prefer me to squash the patches and keep
> the SoB of both I and Nathan?

Hmm I was about to send a new PR today after the CI passes, I mentioned 
Nathan's patch in the squash so he keeps credit for the fix. Unless you 
can send something today, I'll keep my squashed patch.

Thanks,

Alex

