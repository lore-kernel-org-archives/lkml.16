Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ACC42AAF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339646; cv=none; b=smu6h/b/3IZ1fCRlPOsPhy1PTqgqXpzyWB/nohECt6exGjPxazT8WLqibbe9i9CnfryoFzBQk8lh0sGvSiEQyY3qUE2I0Y5r91WaJigrFSfwZ8BZqfwR3d5QjtT0s78yK1bnA8X/JEZTQNlzxtZ7Ir9Tzuj6guDCDmtHLKre+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339646; c=relaxed/simple;
	bh=bTyR4xbeIuIV2k+SYHoVRkW4JkBMOCjGrTDld2aXbsQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F96vf7Uk5ZswVH6YN5Ca2elISi2/rZ3lIacWD1L7krooxJFtn+4laWINoxuA2lzDp967xzWiP7+Du7NsEZL0NJVSkpAZLNZ94Mz6Z4WV4p/N5LlibWKvdatQngLK7/Hkjp++0jVW259siecGCj61VeoqlKOgtHd29XSS445jRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx12mzgvhnCS+4AA--.43958S3;
	Fri, 11 Apr 2025 10:47:15 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxb8evgvhn8sB5AA--.34844S3;
	Fri, 11 Apr 2025 10:47:13 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
To: Wentao Guan <guanwentao@uniontech.com>
References: <20250408092907.22856-1-yangtiezhu@loongson.cn>
 <20250408161239.1023788-1-guanwentao@uniontech.com>
Cc: chenhuacai@kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3019eada-7496-ca11-b645-f5efd7d215f4@loongson.cn>
Date: Fri, 11 Apr 2025 10:47:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250408161239.1023788-1-guanwentao@uniontech.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxb8evgvhn8sB5AA--.34844S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr17KF45Cw17uw4xtryDXFc_yoW8AF43pa
	srCrnxGr4kCrs7uFn5G3y0vF47JasFyFW2qryDtr9rAas0vw1qgw42gwsxCFyxWa1kA3y8
	JF47Aws8Cr9YkacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U

On 04/09/2025 12:12 AM, Wentao Guan wrote:
> Hello Yang,
>
> I don`t know why change it defination remove "asmlinkage",
> why not explain it in commit message?

$ grep -rnw "define asmlinkage" .
./arch/x86/include/asm/linkage.h:20:#define asmlinkage CPP_ASMLINKAGE 
__attribute__((regparm(0)))
./include/linux/linkage.h:22:#define asmlinkage CPP_ASMLINKAGE

include/linux/linkage.h

#ifdef __cplusplus
#define CPP_ASMLINKAGE extern "C"
#else
#define CPP_ASMLINKAGE
#endif

#ifndef asmlinkage
#define asmlinkage CPP_ASMLINKAGE
#endif

So for LoongArch, asmlinkage means extern "C" or NULL, there is no
need to use asmlinkage for these prototypes because they are not put
in uapi headers, that is to say, they will be called and built only
by C compiler rather than C++ compiler, so asmlinkage is actually
NULL in this case.

Furthermore, there are no asmlinkage for the other exist prototypes
such as _save_fp, _restore_fp in arch/loongarch/include/asm/fpu.h,
so in my opinion, just keep them consistent.

But according to Documentation/process/coding-style.rst, it seems
asmlinkage should be used.

"Large, non-trivial assembly functions should go in .S files, with 
corresponding
C prototypes defined in C header files.  The C prototypes for assembly
functions should use ``asmlinkage``."

There are two ways:
(1) no need to use asmlinkage for these new added prototypes for
     assembly functions in asm/fpu.h and asm/lbt.h to keep consistent.

(2) use asmlinkage for these new added prototypes for assembly functions
     in asm/fpu.h and asm/lbt.h according to Documentation, and then add
     asmlinkage for the other exist prototypes if necessary.

That's up to the arch maintainer Huacai.

Thanks,
Tiezhu

