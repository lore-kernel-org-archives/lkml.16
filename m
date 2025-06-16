Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CCD1FF7DC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060662; cv=none; b=Ud6KobT6ZQbnyqwyF82oB4qzNObPqxexBGC8ukq/NJNcWnE/4tBRE8X/m8WG6OS/vf7/EjIuqUO0xOzCk3sMo8GKwhvDEAnR4RRE2MMjbHFEgFF5JK6wlPQuE95+TO2LgsBkSCMJQI0JEPwpqY96tA2TXSSGX0fWbZdUeXep0NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060662; c=relaxed/simple;
	bh=v4ujFtr3vgn5KRxTHB70r/Erqu/00cwMM1kskJKpICk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LK9VGUxK7OLD5ky3Oo7puvIxhvQhBYMD8bBmY5bjKd6RKrmTs6yfj7apOo2LrEjt5B5qfIy08yu5gzFSamvKo/aOAApq1wjQVVLw1sAtM6bmXeyMlnOnNhbpgzrJ1LlVCQ6mgEu+FFuMKeTXRk35wZjpnQZ8DwFsY+xM97sBOfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bLMmc1s5bzKHMvD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:57:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 948741A194C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:57:34 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP1 (Coremail) with SMTP id cCh0CgAXyHhtzk9o1UOwPQ--.23414S2;
	Mon, 16 Jun 2025 15:57:34 +0800 (CST)
Message-ID: <a1e709c5-53a6-4cfe-9958-3e26c8009414@huaweicloud.com>
Date: Mon, 16 Jun 2025 15:57:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in
 regs_get_kernel_stack_nth()
To: Will Deacon <will@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, "David A . Long" <dave.long@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
 <20250612163331.GA13384@willie-the-truck>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <20250612163331.GA13384@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgAXyHhtzk9o1UOwPQ--.23414S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWDJF1xXFWUtFWDJF18Zrb_yoWfWFc_Zw
	1qv3WkKw1rursFqwn8JrySvr1Fy3Z5XFW0v3W8Jr97Aa43Xr95ZF15u3s3Wwn8Xw4FgFs3
	u3sxW3s0v34Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UK2NtUUUUU=
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2025/6/13 0:33, Will Deacon wrote:
> On Wed, Jun 04, 2025 at 12:55:33AM +0000, Tengda Wu wrote:
>> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
>> index f79b0d5f71ac..fe3f7e554d14 100644
>> --- a/arch/arm64/kernel/ptrace.c
>> +++ b/arch/arm64/kernel/ptrace.c
>> @@ -141,7 +141,7 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
>>  
>>  	addr += n;
>>  	if (regs_within_kernel_stack(regs, (unsigned long)addr))
>> -		return *addr;
>> +		return READ_ONCE_NOCHECK(addr);
> 
> I think this should be '*addr', but that makes me wonder wtf s390 is
> doing...
> 
> Will

Sorry, I just received this email as there have been some issues
with my mailbox recently. I was about to send the v2 version with
the '*' mark, but I found out you have already fixed and applied
it to the linux-next. Thank you for your tolerance.

Tengda

