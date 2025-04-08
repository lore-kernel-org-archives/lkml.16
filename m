Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153BC2AE6C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080366; cv=none; b=nfFpi7Ar9tYxqAUiMt+QJngUgTuPut3mW1JCxWGUpPdd3fLvMQlZMj7rixHKBmlNz/aj0/FsAaAtBzADLotsHOkjqjoZIB5dOEZ+/SozKRGOVeKiuLsi/wi9spoPneLMrz5gbqPwF0/48DFoFWj2iy0xow1Avuo9qQWt1vOvTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080366; c=relaxed/simple;
	bh=EJwspP7jB0NxkzeKqLfyaDNnRfd+oKg3DseSPP9tNLs=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S8dTt3/SvUUNEN1AExrIKByhATnSJGzUA+x55MTlNLCUvcHZQa4AFJ+ZtsbKAnYZW+8x6h97a9KKFFHIFGfO+Sd8er6U4DorwUkvagwjwChVJsXuGRiHvEizCJdpnCKi6Ob53QpXdKwj/X2uvhT00Hg/PN+u5OT7oahkfR1G6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxqmrljfRnINq0AA--.40207S3;
	Tue, 08 Apr 2025 10:45:57 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxj8XfjfRnhCB0AA--.21383S3;
	Tue, 08 Apr 2025 10:45:52 +0800 (CST)
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
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5f830e7a-7cfa-3c62-ba3f-f93808e95821@loongson.cn>
Date: Tue, 8 Apr 2025 10:45:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <bzy7cad37tafrbcmsstn355fpljxxmi25ifc4piihp6ln3ztxh@zp3c7ydsjmuq>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMAxj8XfjfRnhCB0AA--.21383S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZw4rur4UAF47tw4rCr4UGFX_yoWrAr18pF
	s2v3WkJa1kJr4vyr9rXF4fXF15ArsrGw1Uu34fWFyUAa1Yqr97XF95tr45ZFZYgwsrAry0
	qrZ5CrnaqF90ywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnEfOUUUUU=

On 04/08/2025 09:23 AM, Josh Poimboeuf wrote:
> On Mon, Apr 07, 2025 at 06:52:10PM +0800, Tiezhu Yang wrote:
>> There is a potential execution path with only using s0 and ra
>> (without using s1, s2, s3, etc): 2d58-->2d70-->2f88-->2e78-->2e84
>
> [...]
>
>> From this point of view, it seems that there is no problem for the
>> generated instructions of the current code, it is not a runtime bug,
>> just a GCC optimization.
>
> I don't see how this is responsive to my email.
>
> I described a code path which revealed a GCC bug, specifically with asm
> goto (unless I got something wrong).  Then you responded with a
> *completely different* code path.
>
> How does that prove my original code path isn't possible?
>
> To summarize, the path I found was
>
>   2d58 ... 2d9c -> 2da8 .. 2dc4 -> 2ebc .. 2ec0 (runtime patched static branch) -> 2e78 .. 2e84 (ret)

Sorry, you are right, I misunderstood.

>> (2) Analysis
>>
>> In fact, the generated objtool warning is because the break instruction
>> (2ee8) which is before the restoring s1 instruction (2eec) is annotated
>> as dead end.
>
> Actually, it's the opposite.  Objtool would normally consider BREAK to
> be a dead end.  But it's annotated as "reachable", aka "non dead end".
>
>> This issue is introduced by the following changes:
>>
>>  #define __WARN_FLAGS(flags)					\
>>  do {								\
>>  	instrumentation_begin();				\
>> -	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
>> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
>> +		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
>>  	instrumentation_end();					\
>>  } while (0)
>>
>> of commit e61a8b4b0d83 ("loongarch: add support for suppressing warning
>> backtraces") in the linux-next.git.
>
> Putting that annotation behind a conditional should not break anything.

OK, got it.

>> (4) Solution 1
>> One way is to annotate __BUG_ENTRY() as reachable whether
>> KUNIT_IS_SUPPRESSED_WARNING() is true or false, like this:
>>
>> ---8<---
>> diff --git a/arch/loongarch/include/asm/bug.h
>> b/arch/loongarch/include/asm/bug.h
>> index b79ff6696ce6..e41ebeaba204 100644
>> --- a/arch/loongarch/include/asm/bug.h
>> +++ b/arch/loongarch/include/asm/bug.h
>> @@ -60,8 +60,9 @@
>>  #define __WARN_FLAGS(flags)                                    \
>>  do {                                                           \
>>         instrumentation_begin();                                \
>> -       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))                     \
>> -               __BUG_FLAGS(BUGFLAG_WARNING|(flags),
>> ANNOTATE_REACHABLE(10001b));\
>> +       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))             \
>> +               __BUG_FLAGS(BUGFLAG_WARNING|(flags), "");       \
>> +       __BUG_FLAGS(0, ANNOTATE_REACHABLE(10001b));             \
>>         instrumentation_end();                                  \
>>  } while (0)
>
> Huh?  That's basically:
>
> 	if (!suppress_warning)
> 		WARN();
> 	BUG();
>
> So it upgrades a conditional WARN to an unconditional BUG???
>
> Not to mention the reachable annotations are backwards: the WARN() is
> annotated as dead end while the BUG() is annotated reachable.
>
> Even if that silences objtool somehow, it will most definitely have the
> wrong runtime behavior.

Yes, my original analysis seems wrong.

>> (5) Solution 2
>> The other way is to use "-fno-shrink-wrap" to aovid such issue under
>> CONFIG_OBJTOOL at compile-time, like this:
>
> As far as I can tell, that would be a workaround to get objtool to stop
> warning about a legitimate compiler bug.

So this is a run-time bug rather than a compile-time warning, it should
put the option "-fno-shrink-wrap" outside CONFIG_OBJTOOL in
arch/loongarch/Makefile as a workaround, like this:

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 0304eabbe606..98241e3015fb 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -108,6 +108,8 @@ KBUILD_CFLAGS                       += 
-fno-jump-tables # keep compatibility with older compilers
  endif
  endif

+KBUILD_CFLAGS                  += -fno-shrink-wrap
+
  KBUILD_RUSTFLAGS               += 
--target=loongarch64-unknown-none-softfloat -Ccode-model=small
  KBUILD_RUSTFLAGS_KERNEL                += 
-Zdirect-access-external-data=yes
  KBUILD_RUSTFLAGS_MODULE                += -Zdirect-access-external-data=no

Thanks,
Tiezhu

