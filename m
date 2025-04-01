Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAB91D8A10
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487945; cv=none; b=LG7buwCtQc1195fyOadTJqq724R6bny6PqGIcO8rwrif8tGyGclltVdaDEA2w17M+jubdeoMVU/Yutc1v2gggFdzT4RLkT/cMpAYvVET/HzUF8dAw2dGqx4Dq39Wkmx6JWeRPU+2x8Ca7lOCLCippAk/yKlOFfmhYt/AUdgfweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487945; c=relaxed/simple;
	bh=RknVZ4/NHoDlnM1tYI6TNUi236BkP/5SGe13+I9/WVI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=f+mzo2B2+0bh5s0XhiHIYwe1y9apqeGgs4pSvkA04WP/XRgfRDEmSiAEGASDASjKLN6ERutv0JIebtFu+xxm5VsIIgHDLEZp6oLz79gUqqRcHqVEkozdE7fiwM2cTFJFfY0iSyCn/J4HbYTAtWKTkg8TtEiPAR8k4yDBJF2ysX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxvnPEg+tnDGStAA--.60359S3;
	Tue, 01 Apr 2025 14:12:20 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBx3MTBg+tnhlVqAA--.54347S3;
	Tue, 01 Apr 2025 14:12:17 +0800 (CST)
Subject: Re: [GIT PULL] objtool fixes and updates
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <Z+s1ceHFa0L1GMrn@rli9-mobl>
 <703f98e1-5638-5feb-2b66-7cf7bb21a896@loongson.cn>
 <ublufyjv3ekvabhbsswswuhg25v7yalrucvtprozva46s7mli3@jhnsdb5wkqky>
Cc: philip.li@intel.com, a.p.zijlstra@chello.nl, akpm@linux-foundation.org,
 bp@alien8.de, linux-kernel@vger.kernel.org, lkp@intel.com, mingo@kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c0e9e3dd-91fd-6805-358a-9b5046c0dfe7@loongson.cn>
Date: Tue, 1 Apr 2025 14:12:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ublufyjv3ekvabhbsswswuhg25v7yalrucvtprozva46s7mli3@jhnsdb5wkqky>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBx3MTBg+tnhlVqAA--.54347S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr4kXFWDGF4DAF17Xr4fWFX_yoW8Gry5pa
	y7Ja9rXr1fKrnayay7t3sYg3y0krsrJw45KFWFyryUCrWYvF4DZws3tFyj9FZ0gw4Yq34I
	qr9ag3ZxAa4jv3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
	U==

On 04/01/2025 12:15 PM, Josh Poimboeuf wrote:
> On Tue, Apr 01, 2025 at 10:05:41AM +0800, Tiezhu Yang wrote:
>> (2) I did not meet the following objtool warnings before this merge
>> window:
>>
>> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack
>> state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
>> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack
>> state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
>>
>> and I did not notice the robot report due to there are many unread mails
>> in my inbox, I will try to reproduce it and take a deeper look at the
>> problem, maybe it is related with some special configs.
>
> I actually already have a patch for it, will post soon.

Thanks for the fix, I will test it once you post it.

I can confirm that the objtool warning is not related with
the patches in the branch objtool/urgent of tip.git, it is
related with CONFIG_STACKPROTECTOR which is default y, but
CONFIG_STACKPROTECTOR is not set in the robot randconfig
loongarch-randconfig-001-20250328 [1], there is no objtool
warning if CONFIG_STACKPROTECTOR is set.

I can also reproduce this issue when compiling with v6.14
if CONFIG_STACKPROTECTOR is not set.

[1] 
https://download.01.org/0day-ci/archive/20250328/202503280703.OARM8SrY-lkp@intel.com/config

Thanks,
Tiezhu

