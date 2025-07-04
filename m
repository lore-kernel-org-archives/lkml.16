Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418A298CA4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631958; cv=none; b=dBJXMcjMswtmDjiZBWVgZh93LR1NVwYB1iIZk+hC44HTrug+Yw41KZu3Jmrp/06QN418joRj9c81MyPHGPiFnF9rHspNQahbF4K1Toa09H/BxPMIBpapKVhUwMeGVX6AfmkVwf7+O850jiCtLtVIg85TfbTVGoh+Raki61bkpGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631958; c=relaxed/simple;
	bh=yzJ9HssHenBi/iFGp5cyylipdwjBjFmFKRamvRxOc24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXLgL/+ULm/tq4oRz9Y74oW9v27kLh0Egg7NKsF5JqeNNeN5IfCe8m9V/th98JZ7glr+FZuCrt3Iu5g9ukVYFIU67ou/gsUE2cdOPsAmuWouhNj9vB6myunvmIn1hpUdbd5F9kkF1oaoworvsuJYJZPOHetUU+LC5ZzpvGgHCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E8F043A0B;
	Fri,  4 Jul 2025 12:25:51 +0000 (UTC)
Message-ID: <bd2bca3b-2b23-40be-b81b-f842b7afb10e@ghiti.fr>
Date: Fri, 4 Jul 2025 14:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Fix for riscv vmcore issue
To: Pnina Feder <PNINA.FEDER@mobileye.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: Gregory Greenman <Gregory.Greenman@mobileye.com>,
 "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "mick@ics.forth.gr" <mick@ics.forth.gr>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
References: <20250409182129.634415-1-bjorn@kernel.org>
 <20250630112309.97162-2-pnina.feder@mobileye.com>
 <87jz4txsjx.fsf@all.your.base.are.belong.to.us>
 <MRWPR09MB80229B89C8D4B4865783B3D78F43A@MRWPR09MB8022.eurprd09.prod.outlook.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <MRWPR09MB80229B89C8D4B4865783B3D78F43A@MRWPR09MB8022.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemgeekugefmedvjeekugemvdgrtdemrggrieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeegkegufeemvdejkegumedvrgdtmegrrgeijedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemgeekugefmedvjeekugemvdgrtdemrggrieejngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopefrpffkpfetrdfhgfffgfftsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopefirhgvghhorhihrdfirhgvvghnmhgrnhesmhhosghilhgvhigvr
 dgtohhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihgtkhesihgtshdrfhhorhhthhdrghhrpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr

Hi Pnina,

On 7/3/25 14:06, Pnina Feder wrote:
>> Pnina!
>>
>> Pnina Feder <pnina.feder@mobileye.com> writes:
>>
>>> We are creating a vmcore using kexec on a Linux 6.15 RISC-V system and
>>> analyzing it with the crash tool on the host. This workflow used to
>>> work on Linux 6.14 but is now broken in 6.15.
>> Thanks for reporting this!
>>
>>> The issue is caused by a change in the kernel:
>>> In Linux 6.15, certain memblock sections are now marked as Reserved in
>>> /proc/iomem. The kexec tool excludes all Reserved regions when
>>> generating the vmcore, so these sections are missing from the dump.
>> How are you collecting the /proc/vmcore file? A full set of commands would be helpful.
>>
> We’ve defined in our system that when a process crashes, we call panic().
> To handle crash recovery, we're using kexec with the following command:
> kexec -p /Image --initrd=/rootfs.cpio --append "console=${con} earlycon=${earlycon} no4lvl"
>
> To simulate crash, we trigger it using:
> sleep 100 & kill -6 $!
>
> This boots into the crash kernel (kdump), where we then copy the /proc/vmcore file back to the host for analysis.
>
>>> However, the kernel still uses addresses in these regions—for example,
>>> for IRQ pointers. Since the crash tool needs access to these memory
>>> areas to function correctly, their exclusion breaks the analysis.
>> Wdym with "IRQ pointers"? Also, what version (sha1) of crash are you using?
>>
> We are currently using crash-utility version 9.0.0 (master).
>  From the crash analysis logs, we observed errors like:
>
> "......
> IRQ stack pointer[0] is  ffffffd6fbdcc068
> crash: read error: kernel virtual address: ffffffd6fbdcc068  type: "IRQ stack pointer"
> .....
>
> <read_kdump: addr: ffffffff80edf1cc paddr: 8010df1cc cnt: 4>
> <readmem: ffffffd6fbdd6880, KVADDR, "runqueues entry (per_cpu)", 3456, (FOE), 55acf03963e0>
>> read_kdump: addr: ffffffd6fbdd6880 paddr: 8fbdd6880 cnt: 1920<
> crash: read error: kernel virtual address: ffffffd6fbdd6880  type: "runqueues entry (per_cpu)"


I can't reproduce this issue on qemu, booting with sv39. I'm using the 
latest kexec-tools (which recently merged riscv support), crash 9.0.0 
and kernel 6.16.0-rc4. Note that I'm using crash in qemu.

Are you able to reproduce this on qemu too?

Maybe that's related to the config, can you share your config?


>
> These failures occur consistently for addresses in the 0xffffffd000000000 region.


FYI, this region is the direct mapping (see 
Documentation/arch/riscv/vm-layout.rst).

Thanks,

Alex


> Upon inspection, we confirmed that the physical addresses corresponding to those virtual addresses are not present in the vmcore, as they fall under Reserved memory sections.
> We tested a patch to kexec-tools that prevents exclusion of the Reserved-memblock section from the vmcore. With this patch, the issue no longer occurs, and crash analysis succeeds.
> Note: I suspect the same issue exists on ARM64, as both the signal.c and kexec-tools implementations are similar.
>
>> Thanks!
>> Björn
