Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04637218ABD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104733; cv=none; b=uN5IMmxn5Pf68y9M70ufObZOuj/LMYHrq4RectjHnAjty1R2T+d3rppes74lBC92ONwEnOvVAEvbSc4BWgqR7/aCpSLqXO8Cp4AIoo70dD7PqFsEOjWY3yBsjV3sGZ7yTPil5tvKzoX+vzFCWIGppxf3VhAOrjr4elu3jhVVrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104733; c=relaxed/simple;
	bh=eUgN16UZ6MZKlcacifOD015XeGjpiWidkDRVHjo/3mY=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S7EPZvaW2eFJkB7EX9UdZNSUS+7tu3tXYwjdZUHyRkqPQHMpwwHfftW4PuJWkSlI3nwJ5pCqaXU91UvY028Jce4m/PV37rqpFoXj5g9rYliEtg6/MJa025VSlmdPcoEh9Z9o5z1SMnY2zA3kITgBDfKjS5xSs5OJHFcGAtVtrds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaWoV7fRn9hC1AA--.40655S3;
	Tue, 08 Apr 2025 17:32:05 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxPcUS7fRnun90AA--.18864S3;
	Tue, 08 Apr 2025 17:32:03 +0800 (CST)
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <202504011011.jyZ6NtXx-lkp@intel.com> <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
 <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
 <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
 <0cbe7ab8-bd87-b5f7-0513-07c82a7e76c9@loongson.cn>
 <bzy7cad37tafrbcmsstn355fpljxxmi25ifc4piihp6ln3ztxh@zp3c7ydsjmuq>
 <5f830e7a-7cfa-3c62-ba3f-f93808e95821@loongson.cn>
 <ozfqe7ppl6q632nzyimsxvs2vh2uanjaranc3kj4pca5uwzt7g@hmhmjvtvrmb2>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <35f7eac8-a970-5fd3-25f4-55f417e8e15e@loongson.cn>
Date: Tue, 8 Apr 2025 17:32:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ozfqe7ppl6q632nzyimsxvs2vh2uanjaranc3kj4pca5uwzt7g@hmhmjvtvrmb2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxPcUS7fRnun90AA--.18864S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw45XF1kGFWxJF1fKr43CFX_yoW8WF47pr
	ZrA395CF4kGF4rtF9Fyw4jqF4Yvr93KryaqF4xK3yDAF1Yqry7CF48KFWq9F98G392q3yS
	qF47WasI9F4UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=

On 04/08/2025 02:29 PM, Josh Poimboeuf wrote:
> On Tue, Apr 08, 2025 at 10:45:51AM +0800, Tiezhu Yang wrote:
>> So this is a run-time bug rather than a compile-time warning, it should
>> put the option "-fno-shrink-wrap" outside CONFIG_OBJTOOL in
>> arch/loongarch/Makefile as a workaround, like this:
>
> If loongarch folks agree it's a compiler bug, it should be reported to
> GCC, so the issue is better understood (and can get fixed).
>
> Without understanding the root cause, we don't know if -fno-shrink-wrap
> fixes it, or just makes this particular occurrence go away.

OK, thank you. I have discussed offline with the developers
Rui Wang and Lulu Cheng who are familiar with compiler, the
root cause may be that if a jump label's control flow path
exactly matches the caller's epilogue, the compiler may omit
restoring saved registers, it needs to be confirmed by GCC
developers.

By the way, add an empty inline assembly can also work around
the problem, like this:

diff --git a/arch/loongarch/include/asm/jump_label.h 
b/arch/loongarch/include/asm/jump_label.h
index 8a924bd69d19..dbc105e62380 100644
--- a/arch/loongarch/include/asm/jump_label.h
+++ b/arch/loongarch/include/asm/jump_label.h
@@ -34,6 +34,7 @@ static __always_inline bool arch_static_branch(struct 
static_key * const key, co
         return false;

  l_yes:
+       asm volatile("");
         return true;
  }

@@ -47,6 +48,7 @@ static __always_inline bool 
arch_static_branch_jump(struct static_key * const ke
         return false;

  l_yes:
+       asm volatile("");
         return true;
  }

We will fix this issue once the root cause is clear.

Thanks,
Tiezhu

