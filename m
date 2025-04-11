Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83552293B4F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360532; cv=none; b=NTkfj8/4iFtSawEJVPhtikjVjAUBFXTUC00K7fEHT3P66Vquwl1i7Yk23DZm0s3sGOCCi/GnRPnRjj554pO3NLyPve1ixnJVCdyxSfZp22C9AQqiDtACCfsYwPYeQ9kzAgBuUdPcs1mWpCb/tymarHNKtvWyknXBDuLSlmnFJD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360532; c=relaxed/simple;
	bh=bC+zN7q/lFuWDxUgB+h5yCukm3W5Ry3g4EKgxl99quU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzrQEUxGH5W1nLeg+5Yx1jL7B1S/mW01voieZdAQPNH7649XUUjnf/sWgadixImuUnhCIeqzy2f3DYut9QjUwHSlsoXQOeLIaO81s19/wOgldBfMFcAHIDhJbdKAgKyGryXr2qJO/pqaWRvXqG3544Ucz0Zabb43/2orUTaknKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7F3743155;
	Fri, 11 Apr 2025 08:35:22 +0000 (UTC)
Message-ID: <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr>
Date: Fri, 11 Apr 2025 10:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Nylon Chen <nylon.chen@sifive.com>, linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, charlie@rivosinc.com,
 jesse@rivosinc.com, evan@rivosinc.com, zhangchunyan@iscas.ac.cn,
 samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
 <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeduffeugedvtdegleeuhfeuteetueegfeefkefhheffvdduhfegvdehuddukeffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppeduleefrdeffedrheejrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelfedrfeefrdehjedrudelledphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehnhihlohhnrdgthhgvnhesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpr
 hgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Clément,

On 11/04/2025 09:36, Clément Léger wrote:
> Hi Nylon,
>
> I already have a pending fix for that bug which is to reenable
> interrupts while handling misaligned faults. Please see:
> https://lore.kernel.org/linux-riscv/20250317170625.1142870-12-cleger@rivosinc.com/


Can you extract this fix from the series so that it can be merged in 6.15?

Thanks,

Alex


>
> Thanks,
>
> Clément
>
> On 11/04/2025 09:38, Nylon Chen wrote:
>> Use copy_from_user_nofault() and copy_to_user_nofault() instead of
>> copy_from/to_user functions in the misaligned access trap handlers.
>>
>> The following bug report was found when executing misaligned memory
>> accesses:
>>
>> BUG: sleeping function called from invalid context at ./include/linux/uaccess.h:162
>> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 115, name: two
>> preempt_count: 0, expected: 0
>> CPU: 0 UID: 0 PID: 115 Comm: two Not tainted 6.14.0-rc5 #24
>> Hardware name: riscv-virtio,qemu (DT)
>> Call Trace:
>>   [<ffffffff800160ea>] dump_backtrace+0x1c/0x24
>>   [<ffffffff80002304>] show_stack+0x28/0x34
>>   [<ffffffff80010fae>] dump_stack_lvl+0x4a/0x68
>>   [<ffffffff80010fe0>] dump_stack+0x14/0x1c
>>   [<ffffffff8004e44e>] __might_resched+0xfa/0x104
>>   [<ffffffff8004e496>] __might_sleep+0x3e/0x62
>>   [<ffffffff801963c4>] __might_fault+0x1c/0x24
>>   [<ffffffff80425352>] _copy_from_user+0x28/0xaa
>>   [<ffffffff8000296c>] handle_misaligned_store+0x204/0x254
>>   [<ffffffff809eae82>] do_trap_store_misaligned+0x24/0xee
>>   [<ffffffff809f4f1a>] handle_exception+0x146/0x152
>>
>> Fixes: b686ecdeacf6 ("riscv: misaligned: Restrict user access to kernel memory")
>> Fixes: 441381506ba7 ("riscv: misaligned: remove CONFIG_RISCV_M_MODE specific code")
>>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>> ---
>>   arch/riscv/kernel/traps_misaligned.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
>> index d7275dfb6b7e..563f73f88fa8 100644
>> --- a/arch/riscv/kernel/traps_misaligned.c
>> +++ b/arch/riscv/kernel/traps_misaligned.c
>> @@ -455,7 +455,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>>   
>>   	val.data_u64 = 0;
>>   	if (user_mode(regs)) {
>> -		if (copy_from_user(&val, (u8 __user *)addr, len))
>> +		if (copy_from_user_nofault(&val, (u8 __user *)addr, len))
>>   			return -1;
>>   	} else {
>>   		memcpy(&val, (u8 *)addr, len);
>> @@ -556,7 +556,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
>>   		return -EOPNOTSUPP;
>>   
>>   	if (user_mode(regs)) {
>> -		if (copy_to_user((u8 __user *)addr, &val, len))
>> +		if (copy_to_user_nofault((u8 __user *)addr, &val, len))
>>   			return -1;
>>   	} else {
>>   		memcpy((u8 *)addr, &val, len);
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
