Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37C4199EAD
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589441; cv=none; b=KT6oHZBAVD7MXcmHcl604crCkEsPNOX89lGwJgXIAXopU/gjC7zEnq+mDG5CMaoyTxWJ81Ql9/oCUg/LQplZ3fpgFD7D3Fvmvd11dgqUp7tWK0v4HmaxEL5chYh1nYa03iXi8pcPQljs5g3xaXyOna2h2kNiySvaQ8lu9SkShYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589441; c=relaxed/simple;
	bh=R/Akd0eX9hNqt3T32VBrsG4IMBzgGGHpD1UISoR2jaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8HekGFtraDTFSdWbqqqf7BWAiHTn91sDHJt+I0QJBVjYn++45SsgUpyy6gNFEv+rQbKI0aZ4y7yaImw/mulS5VOMGt2oVeqQRpIWCDsqb9ICq+oHeNF5T3p85i+uuvnZDJMmPYyrFKtexAkYJFnrN8yFHzELmdOGTwqmOKK6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 700BF16F8;
	Fri, 30 May 2025 00:17:00 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A91D3F5A1;
	Fri, 30 May 2025 00:17:15 -0700 (PDT)
Message-ID: <1cc04c6b-ba0f-4e7f-ab85-46c364c66300@arm.com>
Date: Fri, 30 May 2025 08:17:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <e8d74579-2e32-424f-bfed-5d3eb33b0a07@os.amperecomputing.com>
 <c44cb356-112d-4dd8-854b-82212ee4815f@arm.com>
 <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
 <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
 <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
 <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2025 20:52, Yang Shi wrote:
>>>> I just had another conversation about this internally, and there is another
>>>> concern; we obviously don't want to modify the pgtables while other CPUs that
>>>> don't support BBML2 could be accessing them. Even in stop_machine() this may be
>>>> possible if the CPU stacks and task structure (for example) are allocated
>>>> out of
>>>> the linear map.
>>>>
>>>> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
>>>> need to switch to the idmap (which is installed in TTBR0) then install the
>>>> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
>>>> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.
>>> So the below code should be ok?
>>>
>>> cpu_install_idmap()
>>> Busy loop to wait for cpu 0 done
>>> cpu_uninstall_idmap()
>> Once you have installed the idmap, you'll need to call a function by its PA so
>> you are actually executing out of the idmap. And you will need to be in assembly
>> so you don't need the stack, and you'll need to switch TTBR1 to the reserved
>> pgtable, so that the CPU has no access to the swapper pgtable (which CPU 0 is
>> able to modify).
>>
>> You may well be able to reuse __idmap_kpti_secondary in proc.S, or lightly
>> refactor it to work for both the existing idmap_kpti_install_ng_mappings case,
>> and your case.
> 
> I'm wondering whether we really need idmap for repainting. I think repainting is
> different from kpti. We just split linear map which is *not* used by kernel
> itself, the mappings for kernel itself is intact, we don't touch it at all. So
> as long as CPU 0 will not repaint the linear map until all other CPUs busy
> looping in stop_machine fn, then we are fine.

But *how* are the other CPUs busy looping? Are they polling a variable? Where
does that variable live? The docs say that a high priority thread is run for
each CPU. So there at least needs to be a task struct and a stack. There are
some Kconfigs where the stack comes from the linear map, so if the variable that
is polls is on its stack (or even on CPU 0's stack then that's a problem. If the
scheduler runs and accesses the task struct which may be allocated from the
linear map (e.g. via kmalloc), that's a problem.

The point is that you have to understand all the details of stop_machine() to be
confident that it is never accessing the linear map. And even if you can prove
that today, there is nothing stopping from the implementation changing in future.

But then you have non-architectural memory accesses too (i.e. speculative
accesses). It's possible that the CPU does a speculative load, which causes the
TLB to do a translation and cache a TLB entry to the linear map. Then CPU 0
changes the pgtable and you have broken the BBM requirements from the secondary
CPU's perspective.

So personally I think the only truely safe way to solve this is to switch the
secondary CPUs to the idmap, then install the reserved map in TTBR1. That way,
the secondary CPUs can't see the swapper pgtable at all and CPU 0 is free to do
what it likes.

> 
> We can have two flags to control it. The first one should be a cpu mask, all
> secondary CPUs set its own mask bit to tell CPU 0 it is in stop machine fn
> (ready for repainting). The other flag is used by CPU 0 to tell all secondary
> CPUs repainting is done, please resume. We need have the two flags in kernel
> data section instead of stack.
> 
> The code of fn is in kernel text section, the flags are in kernel data section.
> I don't see how come fn (just doing simple busy loop) on secondary CPUs need to
> access linear map while repainting the linear map. After repainting the TLB will
> be flushed before letting secondary CPUs resume, so any access to linear map
> address after that point should be safe too.
> 
> Does it sound reasonable to you? Did I miss something?

I think the potential for speculative access is the problem. Personally, I would
follow the pattern laid out by kpti. Then you can more easily defend it by
pointing to an established pattern.

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>>
>> Thanks,
>> Ryan
>>
>>>> Given CPU 0 supports BBML2, I think it can just update the linear map live,
>>>> without needing to do the idmap dance?
>>> Yes, I think so too.
>>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
> 

