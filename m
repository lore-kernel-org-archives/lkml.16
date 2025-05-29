Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3934C9D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748543446; cv=none; b=mHuX/+IpmWJBcg+5mh1kyvu2ehSh1lBXTwi52vWyat5mnrGKxpnYSHtEX1VVq6AMqRgnW3z2ozotouhaJObUTn2N5rSiA+bcrGqXyeetpWmQ8RdcCaDFoRbKLTlGb7jSS/R8ddI6foVihPLO00kgOScfGOEkGHifd6lJuD/btQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748543446; c=relaxed/simple;
	bh=viWFs6iNNlHq9j8bu2VTqrFsdLcVz4eNaCVzp3N2EyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0cR/PwRjItLHD8/Z8JBZjLc8xRpqUx1nVidRN7sMc2HKRCBzIXKMpAnB0uLqhDn3mKjPa2F5RuCe06V2ciif42/jAWBphJJRZtPAU06St9S7F+D+nLNvs+ftC+4LoydAl07oPRU2EFs8GoD1NvYMTZ0vhdgGfzVMR1kaX7zU18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051121764;
	Thu, 29 May 2025 11:30:27 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17E8F3F673;
	Thu, 29 May 2025 11:30:41 -0700 (PDT)
Message-ID: <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
Date: Thu, 29 May 2025 19:30:40 +0100
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
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2025 18:35, Yang Shi wrote:
> 
> 
> On 5/29/25 8:33 AM, Ryan Roberts wrote:
>> On 29/05/2025 09:48, Ryan Roberts wrote:
>>
>> [...]
>>
>>>>>> Regarding the linear map repainting, I had a chat with Catalin, and he
>>>>>> reminded
>>>>>> me of a potential problem; if you are doing the repainting with the machine
>>>>>> stopped, you can't allocate memory at that point; it's possible a CPU was
>>>>>> inside
>>>>>> the allocator when it stopped. And I think you need to allocate intermediate
>>>>>> pgtables, right? Do you have a solution to that problem? I guess one approach
>>>>>> would be to figure out how much memory you will need and pre-allocate
>>>>>> prior to
>>>>>> stoping the machine?
>>>>> OK, I don't remember we discussed this problem before. I think we can do
>>>>> something like what kpti does. When creating the linear map we know how many
>>>>> PUD and PMD mappings are created, we can record the number, it will tell how
>>>>> many pages we need for repainting the linear map.
>>>> Looking the kpti code further, it looks like kpti also allocates memory with
>>>> the
>>>> machine stopped, but it calls memory allocation on cpu 0 only.
>>> Oh yes, I hadn't spotted that. It looks like a special case that may be ok for
>>> kpti though; it's allocating a fairly small amount of memory (max levels=5 so
>>> max order=3) and it's doing it with GFP_ATOMIC. So if my understanding of the
>>> page allocator is correct, then this should be allocated from a per-cpu reserve?
>>> Which means that it never needs to take a lock that other, stopped CPUs could be
>>> holding. And GFP_ATOMIC guarrantees that the thread will never sleep, which I
>>> think is not allowed while the machine is stopped.
> 
> The pcp should be set up by then, but I don't think it is actually populated
> until the first allocation happens IIRC.
> 
>>>
>>>> IIUC this
>>>> guarantees the code will not be called on a CPU which was inside the allocator
>>>> when it stopped because CPU 0 is running stop_machine().
>>> My concern was a bit more general; if any other CPU was inside the allocator
>>> holding a lock when the machine was stopped, then if CPU 0 comes along and makes
>>> a call to the allocator that requires the lock, then we have a deadlock.
>>>
>>> All that said, looking at the stop_machine() docs, it says:
>>>
>>>   * Description: This causes a thread to be scheduled on every cpu,
>>>   * each of which disables interrupts.  The result is that no one is
>>>   * holding a spinlock or inside any other preempt-disabled region when
>>>   * @fn() runs.
>>>
>>> So I think my deadlock concern was unfounded. I think as long as you can
>>> garrantee that fn() won't try to sleep then you should be safe? So I guess
>>> allocating from within fn() should be safe as long as you use GFP_ATOMIC?
> 
> Yes, the deadlock should be not a concern.
> 
> The other comment also said:
> 
>  * On each target cpu, @fn is run in a process context with the highest priority
>  * preempting any task on the cpu and monopolizing it.
> 
> Since the fn is running in a process context, so sleep should be ok? Sleep
> should just can happen when allocation requires memory reclaim due to
> insufficient memory for kpti and repainting linear map usecases. But I do agree
> GFP_ATOMIC is safer.

Interrupts are disabled so I can't imagine sleeping is a good idea...

> 
>> I just had another conversation about this internally, and there is another
>> concern; we obviously don't want to modify the pgtables while other CPUs that
>> don't support BBML2 could be accessing them. Even in stop_machine() this may be
>> possible if the CPU stacks and task structure (for example) are allocated out of
>> the linear map.
>>
>> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
>> need to switch to the idmap (which is installed in TTBR0) then install the
>> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
>> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.
> 
> So the below code should be ok?
> 
> cpu_install_idmap()
> Busy loop to wait for cpu 0 done
> cpu_uninstall_idmap()

Once you have installed the idmap, you'll need to call a function by its PA so
you are actually executing out of the idmap. And you will need to be in assembly
so you don't need the stack, and you'll need to switch TTBR1 to the reserved
pgtable, so that the CPU has no access to the swapper pgtable (which CPU 0 is
able to modify).

You may well be able to reuse __idmap_kpti_secondary in proc.S, or lightly
refactor it to work for both the existing idmap_kpti_install_ng_mappings case,
and your case.

Thanks,
Ryan

> 
>>
>> Given CPU 0 supports BBML2, I think it can just update the linear map live,
>> without needing to do the idmap dance?
> 
> Yes, I think so too.
> 
> Thanks,
> Yang
> 
>>
>> Thanks,
>> Ryan
>>
>>
>>> Thanks,
>>> Ryan
>>>
> 

