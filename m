Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B761EEA3E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257299; cv=none; b=Y03HGLEN+rJjjYxkTiM08oAcwC/TdEnnQtHB/kP8wZJ7+iGJ1KB/zb1AzkF9YYc1Spt1onItDHBLt1NQHNu/y7X1SS59rUUiyAW0i/Jif2Eg+XinK0vAfIH6nwIt70wM5W1w5SQjV5GzqUr/fYbz6meCQIErj5lxB/tv+FLC5XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257299; c=relaxed/simple;
	bh=V66vqLETAqIlmvAy/67ssLQmHPay1NXIcOidlOXVJiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ICw2K0BKR5c4k0kUg/blA2nHn/GOFWUaoc8rqzZaK+whXARAYMVRE3fdIaIIlNgIjhBOx1yqvCMsD7UNaE6NbydkPc+dEK2ZOQZI5R0XzwRqvjZrWLVu0Y0Q1N+uqX/oTiUQIKhQgcqWvovPGBOUmmluhaInFw5LvLblfsRRv5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZY5Rl12yfz26gtd;
	Thu, 10 Apr 2025 11:49:55 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 24721180044;
	Thu, 10 Apr 2025 11:54:53 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Apr 2025 11:54:52 +0800
Message-ID: <eea41388-cdee-492c-b636-3aa3341bf0a7@huawei.com>
Date: Thu, 10 Apr 2025 11:54:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] arm64: kprobe: Enable OPTPROBE for arm64
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
CC: <yangyicong@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<naveen.n.rao@linux.ibm.com>, <anil.s.keshavamurthy@intel.com>,
	<davem@davemloft.net>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>,
	<fanghao11@huawei.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<jonathan.cameron@huawei.com>
References: <20250216070044.1792872-1-xiaqinxin@huawei.com>
 <20250404083442.5317827966254c89382cc3f4@kernel.org>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <20250404083442.5317827966254c89382cc3f4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemj200003.china.huawei.com (7.202.194.15)


在 2025/4/4 7:34, Masami Hiramatsu (Google) 写道:
> On Sun, 16 Feb 2025 15:00:44 +0800
> Qinxin Xia <xiaqinxin@huawei.com> wrote:
>
>> +#define        OPT_SLOT_SIZE   65536
>> +
>> +	.global optinsn_slot
>> +optinsn_slot:
>> +	.space  OPT_SLOT_SIZE
>> +
>> +SYM_CODE_START(optprobe_common)
>> +	stp x2, x3, [sp, #S_X2]
>> +	stp x4, x5, [sp, #S_X4]
>> +	stp x6, x7, [sp, #S_X6]
>> +	stp x8, x9, [sp, #S_X8]
>> +	stp x10, x11, [sp, #S_X10]
>> +	stp x12, x13, [sp, #S_X12]
>> +	stp x14, x15, [sp, #S_X14]
>> +	stp x16, x17, [sp, #S_X16]
>> +	stp x18, x19, [sp, #S_X18]
>> +	stp x20, x21, [sp, #S_X20]
>> +	stp x22, x23, [sp, #S_X22]
>> +	stp x24, x25, [sp, #S_X24]
>> +	stp x26, x27, [sp, #S_X26]
>> +	stp x28, x29, [sp, #S_X28]
>> +	add x2, sp, #PT_REGS_SIZE
>> +	str x2, [sp, #S_SP]
>> +	/* Construct a useful saved PSTATE */
>> +	mrs x2, nzcv
>> +	mrs x3, daif
>> +	orr x2, x2, x3
>> +	mrs x3, CurrentEL
>> +	orr x2, x2, x3
>> +	mrs x3, SPSel
>> +	orr x2, x2, x3
>> +	adr x1, 2f
>> +	stp x1, x2, [sp, #S_PC]
>> +
>> +	/* set the pt_regs address to x1 */
>> +	mov x1, sp
>> +	/* store lr of optprobe_common temporary */
>> +	stp x29, x30, [sp, #-16]!
>> +	mov x29, sp
>> +
>> +	bl optprobe_optimized_callback
>> +
>> +	ldp x29, x30, [sp], #16
>> +
>> +	ldr x0, [sp, #S_PSTATE]
>> +	and x0, x0, #(PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT)
>> +	msr nzcv, x0
> BTW, can this code save all registers including flags?
> Previously I talked with Mark and he mentioned there is no way to
> save pstate register correctly. That is why we could not implement
> this feature.
>
>
> Thank you,
>
Hello,

Same way to save regs with kprobe trampoline,

you can see in arch/arm64/kernel/probes/kprobes_trampoline.S

Thank you.

