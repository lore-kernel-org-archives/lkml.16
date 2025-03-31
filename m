Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4AF33EA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743390776; cv=none; b=GQYHhVdlBOw0nQvBHovBv4fX6wJNxE6P7kAFhHczPdR9NfJsBPHm+YyMCrFQ+TdQqaODD+K0VNx2Ycj97g3rh1LIX0mlbLHM+b71CRctv+lEEhamctV9V5IVLJXGTf9J50Y/aS+hehMHhgdM98bN63y5feMgNvllETcNGH9gpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743390776; c=relaxed/simple;
	bh=71JvYHEOJBqqrlUmSjKO/E+aVnas33vMdNyB/Q0ZQuY=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Bx/cFD3BDJNmmlstHSrna6Bxcqm2KigSc1Z8kg1mHIKtkfQelC+8NiAKhYU3a4CBqBRJJcGgBBH5fKIqPVnadCO3kmpnBhmpq5dL9fjHUDUODsG5NZIwDtfChLMKPV7NZzGClzD5hM4bLqROCW5IBuEibcfLO/DD/3yeSR0JzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZQx060jvxz1jBP9;
	Mon, 31 Mar 2025 11:08:06 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 49FBB14011F;
	Mon, 31 Mar 2025 11:12:51 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 31 Mar 2025 11:12:50 +0800
CC: <yangyicong@hisilicon.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<naveen.n.rao@linux.ibm.com>, <anil.s.keshavamurthy@intel.com>,
	<davem@davemloft.net>, <mhiramat@kernel.org>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <fanghao11@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<jonathan.cameron@huawei.com>, Barry Song <baohua@kernel.org>,
	<chris.zjh@huawei.com>
Subject: Re: [PATCH v7] arm64: kprobe: Enable OPTPROBE for arm64
To: Qinxin Xia <xiaqinxin@huawei.com>
References: <20250216070044.1792872-1-xiaqinxin@huawei.com>
 <9ce3dfac-e6b2-1b2c-ae09-b0dd509d1581@huawei.com>
 <704bf3e2-be54-4463-b59b-3c1b867e7df0@huawei.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5a096fa2-4b3b-931d-453c-ad709e9ba687@huawei.com>
Date: Mon, 31 Mar 2025 11:12:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <704bf3e2-be54-4463-b59b-3c1b867e7df0@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2025/3/25 20:06, Qinxin Xia wrote:
> 
> 在 2025/3/17 12:01, Yicong Yang 写道:
>> On 2025/2/16 15:00, Qinxin Xia wrote:
>>> This patch introduce optprobe for ARM64. In optprobe, probed
>>> instruction is replaced by a branch instruction to trampoline.
>>>
>>> Performance of optprobe on Hip08 platform is test using kprobe
>>> example module to analyze the latency of a kernel function,
>>> and here is the result:
>>>

[...]

>>> +
>>> +void optprobe_optimized_callback(struct optimized_kprobe *op, struct pt_regs *regs)
>> need to be static.
> ok, I will fix it in the next version.
> It must be referenced by 'optprobe_trampoline.S' and cannot be covered by the static scope.

Then it should be marked as "asmlinkage" and declared in the header.

>>> +{
>>> +    if (kprobe_disabled(&op->kp))
>>> +        return;
>>> +
>>> +    guard(preempt)();
>>> +
>>> +    if (kprobe_running()) {
>>> +        kprobes_inc_nmissed_count(&op->kp);
>>> +    } else {
>>> +        __this_cpu_write(current_kprobe, &op->kp);
>>> +        get_kprobe_ctlblk()->kprobe_status = KPROBE_HIT_ACTIVE;
>>> +        opt_pre_handler(&op->kp, regs);
>>> +        __this_cpu_write(current_kprobe, NULL);
>>> +    }
>>> +}
>>> +NOKPROBE_SYMBOL(optprobe_optimized_callback)
