Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8079367
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352497; cv=none; b=FP0EvY99Ia+uxOFD8OBFf5XdklmHo24Wxlmx4Ct1CBBsrhDHl8FgML0CevsGgvb4sD2mux7v8h/Qwfc+ZqwTjXZ7CeCxAezfoTiBtgLQH2uJZAoJEMkmHajmpYslKm4fzpRnbPVxan1mhmqMTH8olz0+up9WJEenywPk78hCF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352497; c=relaxed/simple;
	bh=kcIP+POmxmkSEg5c9FMWXe/3dEsvXgJ4/4YSNQkpI1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncWTybCt2X8emgd9xqkIm3c3Cr0D5e+P61XdiOLaqURMnEnHjdP7ec05AlwLh4WWURyOsC8KVqGdkIrinssG3XgtUnM0pvMK5/McBwMkSHooNL7lPopilpZKpAzadvmSYdGYOgjsLULAY4SX131w4BoTRczcJbBT1kzExSH3KZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 261264435A;
	Fri, 11 Apr 2025 06:21:26 +0000 (UTC)
Message-ID: <23693e7f-4fff-40f3-a437-e06d827278a5@ghiti.fr>
Date: Fri, 11 Apr 2025 08:21:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
Content-Language: en-US
To: WangYuli <wangyuli@uniontech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: chenhuacai@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com,
 Huacai Chen <chenhuacai@loongson.cn>
References: <C5DCACA951B6211D+20250408095454.67390-1-wangyuli@uniontech.com>
 <ccc97669-a4dc-459f-a26f-1fdad8b4a334@ghiti.fr>
 <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <3A22DFCBC7B91F71+320f58c6-0fc6-4dc4-9fb0-ab0d55be697a@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopeifrghnghihuhhlihesuhhnihhonhhtvggthhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvs
 ehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrtghhvghnsehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr

Hi WangYuli,

On 10/04/2025 16:28, WangYuli wrote:
> Hi Alex
>
> On 2025/4/10 21:42, Alexandre Ghiti wrote:
>> Hi WangYuli,
>>
>>
>> You forgot to replace kgdb_breakinst into kgdb_compiled_break.
>
> OK, I'll fix it.
>
> Thanks,
>
>>
>> You are fixing 2 things here, you need to split this patch into 2. 
> OK,
>> And as noted by Palmer, we actually don't need norvc here, so you can 
>> remove it instead.
>
> I have some questions regarding this.
>
> If .option norvc is unnecessary, what is the significance of .option 
> push/.option pop?
>
> Should they also be removed as well?


Yes, you can remove them.


>
> However, will this still function properly when the RISC-V C extension 
> is active?


.option norvc is used to prevent the assembler from using compressed 
instructions, but it's generally used when we need to ensure the size of 
the instructions that are used, which is not the case here as noted by 
Palmer since we only care about the address. So yes it will work fine 
with C enabled :)


>
>
> Thanks,
>

Thanks for the changes!

Alex

