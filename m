Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B854C7F;
	Mon, 23 Jun 2025 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750641276; cv=none; b=qVPsrU8i82UCZE4vInjrNmnTwvxqYFgyjS6Hh9c0cFrJVGbxU2JiaywpaEcm+TYabYKQTQt5b2/LLDk1OVYI1UrV8AWX9neOQk02wn4Lx+W03m0cX/qITJJpF6FydtjI6MDH6TglpCcyrA1dW4BtMYX1o/Gw9ePN4cDP8srl9i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750641276; c=relaxed/simple;
	bh=7ULXjxBT15KMqSaHyqu0hXJQEiICOMQf/UAcK91OmgA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QdSGqlHDJf6wo17WEcXo7qfWdqVSPOvFB7LhV0mJY7jTlqUbc7OKj9acd3WoWtX2BBqO3VEzq6cdou8gzJ2fwg6Qnr6jvgoPkYPe7xID8qDI86rvFltmstvQctY88evhKGr4LuZDjAyP6XvuR+1IipBfizIZ9+SxUEyWsFRvy70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxjXJvqlho41gbAQ--.61527S3;
	Mon, 23 Jun 2025 09:14:23 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMCxbsVkqlhoqo4mAQ--.54823S3;
	Mon, 23 Jun 2025 09:14:15 +0800 (CST)
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Super User <root@localhost.localdomain>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <87qzznivtp.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <10014657-8756-f31a-c3b4-f175b764346c@loongson.cn>
Date: Mon, 23 Jun 2025 09:13:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87qzznivtp.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxbsVkqlhoqo4mAQ--.54823S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKryrZr4fAFyxuryrWr4Dtrc_yoWDuFg_ur
	1xtwn8AF1UZrWxZr4S9F43Grs7Za1xurWUtFWvq34jq34rJa4DCF4q9ryS9an8XF43Jrnx
	Xr90vr15t3sF9osvyTuYvTs0mTUanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jTq2NUUU
	UU=

Hi, Thomas

ÔÚ 2025/6/13 ÏÂÎç10:02, Thomas Gleixner Ð´µÀ:
> On Tue, Jun 10 2025 at 19:42, Tianyang Zhang wrote:
>> From: Super User <root@localhost.localdomain>
> That's a valid developer name :)
Sorry , it's a realy stupid fault.....
>
>> This series of patches introduces support for interrupt-redirect
>> controllers, and this hardware feature will be supported on 3C6000
>> for the first time
>>
>> change log:
>> 	v3->v4
>> 	1.Provide reasonable comments on the modifications made to IRQ_SET_MASK_OK_DONE	
> That's not really what I asked for:
>
>    "This change really wants to be seperate with a proper explanation and
>     not burried inside of this pile of changes."
>
> Emphasis on _seperate_, which translates to:
>
>    "Put it into a seperate patch with a proper changelog explaining this
>     modification and why it is correct."
>
> You still have burried this in the whole pile of unrelated changes.
>
> Thanks,
>
>          tglx

Okay, I thought it was just a dissatisfaction with the "inclusion" of 
some changes. I will try to modify it here


Tianyang

