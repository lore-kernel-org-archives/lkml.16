Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709D118B48B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493572; cv=none; b=UibygVsUZlhnLaGCsrh2uX1+dU2FwYpDXB2QMyi4efossM6iB8mzML7aqnc7r9dlJLT29mh32/vc4Fi0mASQspg/zMIbGPqaCqO6uOqxRWbFZ4DOxsYnKj2wC1ePU3gz35gGGvUn8Q5T/+doAGdiiPOxqB7zlskUjwgdYq3L2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493572; c=relaxed/simple;
	bh=BiXf6ehgzeCGkf+E2sShUWqz0uGfrwDvhp3revO7BnQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=QCd9CzRTCiOwn/drFSnoxbrzrrxsUQ+c1dMB5EFjgAbpuPbom7fOKF1rBAHQ4l5QV3hbwzaAJxx0Iu7FfpkF6ROvgdHb9vwIJS6YHYsSUdWEEuhZicqfCfz0anvGFH4VVhME+k7jtdL3iBIdka3VooGkgrpKPHabfpBUl2iwy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxaeC3metnE32tAA--.29062S3;
	Tue, 01 Apr 2025 15:45:59 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx7MSzmetnXG9qAA--.55803S3;
	Tue, 01 Apr 2025 15:45:56 +0800 (CST)
Subject: Re: [PATCH 08/11] objtool/loongarch: Add unwind hints in
 prepare_frametrace()
To: Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
 <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>
 <Z-uQ7NqMzqAShWcH@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <2e25fe84-f772-5d87-c7a7-bf40055fb4bc@loongson.cn>
Date: Tue, 1 Apr 2025 15:45:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-uQ7NqMzqAShWcH@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCx7MSzmetnXG9qAA--.55803S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Jr45GFWxJw4xuF47trW5Arc_yoW8Jry7pa
	y7tanFgr48GryIyw4DKasF9F98Kw4DJr12gr1kAry8WrWDZr9ava1Fga18ZFyqgFWFgFy8
	Jr98urWktayjvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0Urc3UUUU
	U==

On 04/01/2025 03:08 PM, Ingo Molnar wrote:
>
> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
>> If 'regs' points to a local stack variable, prepare_frametrace() stores
>> all registers to the stack.  This confuses objtool as it expects them to
>> be restored from the stack later.
>>
>> The stores don't affect stack tracing, so use unwind hints to hide them
>> from objtool.
>>
>> Fixes the following warnings:
>>
>>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
>>
>> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
>> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>
> Note, I skipped this fix from tip:objtool/urgent for the time being,
> because Tiezhu Yang indicated that he'd be reviewing and testing this
> patch.

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

