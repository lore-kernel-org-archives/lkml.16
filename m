Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B681EA7C9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496207; cv=none; b=JQl1XeICIeGyqkKR+a3bp4qpwxr2M9JHXYcjFXEh3dyHv2QJMf87472rIklYeH++GxVfVe5b3xjmakpW7tcw9S71IquhI8vSCTPaOu9nkujD/6L9TPvVYVq7lbjwFzmaAAxfw8+NMoFTu/vlZfNa2KfzjGtII/Jpl9mNGUzvTk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496207; c=relaxed/simple;
	bh=3mt5Skfu6TniMgoKHzDUuqtneTpb2TY4fxM0WZWtyNY=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HqyY9wvXK2kA/IFH3U6nVA1j5jnbRiEoLEtOB5OQjk1up4/GloR9S0TGBsW6Vd+Ip95dFUky2GMoIQ1HCWu/3r9OG+USLC8DY+cCqnu8yG8fGfiLctejPG0OAV8lM7QmPOITf1bZNjo0sv35RBSHrk6wj6y6OEAfOyNUjfQNriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxWOEIpOtnHIitAA--.27167S3;
	Tue, 01 Apr 2025 16:30:00 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxLscFpOtn1XtqAA--.61059S3;
	Tue, 01 Apr 2025 16:29:57 +0800 (CST)
Subject: Re: [PATCH 08/11] objtool/loongarch: Add unwind hints in
 prepare_frametrace()
To: Ingo Molnar <mingo@kernel.org>
References: <cover.1743481539.git.jpoimboe@kernel.org>
 <270cadd8040dda74db2307f23497bb68e65db98d.1743481539.git.jpoimboe@kernel.org>
 <Z-uQ7NqMzqAShWcH@gmail.com>
 <2e25fe84-f772-5d87-c7a7-bf40055fb4bc@loongson.cn>
 <Z-ufkGy0hPbwMUYI@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 kernel test robot <lkp@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <10d45fa8-d1f7-28be-9fc6-9c8a244601ec@loongson.cn>
Date: Tue, 1 Apr 2025 16:29:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-ufkGy0hPbwMUYI@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxLscFpOtn1XtqAA--.61059S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZF15GrW5JFWkAF15XF1DurX_yoW8Xw1Upa
	y7JanF9r48tryxtanrKwnF9F9xtw4DJr17Wr1kAry8Gr4qvrnavr1rKa18uFyjga4FgFy8
	Jr98ur9Fqa1jqabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxUGYDUUUU

On 04/01/2025 04:10 PM, Ingo Molnar wrote:
>
> * Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>> On 04/01/2025 03:08 PM, Ingo Molnar wrote:
>>>
>>> * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>>>
>>>> If 'regs' points to a local stack variable, prepare_frametrace() stores
>>>> all registers to the stack.  This confuses objtool as it expects them to
>>>> be restored from the stack later.
>>>>
>>>> The stores don't affect stack tracing, so use unwind hints to hide them
>>>> from objtool.
>>>>
>>>> Fixes the following warnings:
>>>>
>>>>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>>>>   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
>>>>
>>>> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> Fixes: cb8a2ef0848c ("LoongArch: Add ORC stack unwinder support")
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/
>>>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>>>
>>> Note, I skipped this fix from tip:objtool/urgent for the time being,
>>> because Tiezhu Yang indicated that he'd be reviewing and testing this
>>> patch.
>>
>> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> Thank you! Is it fine with you if I send this fix with tonight's
> objtool/urgent pull request to Linus?

Yes, no problem, thank you for doing this.

