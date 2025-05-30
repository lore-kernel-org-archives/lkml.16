Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FF81DE4C8
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591953; cv=none; b=dSo2zLQtHkueZmEwk3SkL08VcLZD54H+nL5JuK3MPe+n3hDEEuZYejMGt4RTRlepsd9qJHxMSK7+Q6yjCc09tGZ/DUV2zQQk376jcOpUOk9d+eKocfjB9L3JFWkbOaZACWrmfiO37o0Tbe27aoRbQWrSscSYjZpIa8794jJg644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591953; c=relaxed/simple;
	bh=YV9A+aCd8kZIml2euQwLNMojr/1w4iZnzqSnsh6zKwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mt2B6MZngp7XeQrh80Ye74U67ev+NE7ifAIZ3DKOxXKJUalGPEowSdatHl7mpRdVFbpTWkTdsuSKWdA/JMM7fkOdOc5ECYrZwj04LieayR39EKJTNJgyBt7YsdDLfNm9jvHOgPRBX0IAcdJqjPSeEqPNiv9M9h9enW3u60oj5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E68216F8;
	Fri, 30 May 2025 00:58:52 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92FE63F694;
	Fri, 30 May 2025 00:59:06 -0700 (PDT)
Message-ID: <ca1673c4-1c8d-40d5-bc40-abc6489b2fdd@arm.com>
Date: Fri, 30 May 2025 08:59:04 +0100
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
 <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
 <a27776ed-4b45-4269-9e3c-5ca1463e4841@os.amperecomputing.com>
 <bfae581e-3988-44b5-af5e-8e2de4db68ed@arm.com>
 <cc1522f8-85b9-48e5-951f-9a1bb2075918@os.amperecomputing.com>
 <e0960267-0dd5-412a-be54-1afaacc6bace@arm.com>
 <4b2278d8-d627-47af-ae90-9d62ad249c88@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <4b2278d8-d627-47af-ae90-9d62ad249c88@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2025 21:52, Yang Shi wrote:
>>>>>>> The split_mapping() guarantees keep block mapping if it is fully
>>>>>>> contained in
>>>>>>> the range between start and end, this is my series's responsibility. I know
>>>>>>> the
>>>>>>> current code calls apply_to_page_range() to apply permission change and it
>>>>>>> just
>>>>>>> does it on PTE basis. So IIUC Dev's series will modify it or provide a new
>>>>>>> API,
>>>>>>> then __change_memory_common() will call it to change permission. There
>>>>>>> should be
>>>>>>> some overlap between mine and Dev's, but I don't see strong dependency.
>>>>>> But if you have a block mapping in the region you are calling
>>>>>> __change_memory_common() on, today that will fail because it can only handle
>>>>>> page mappings.
>>>>> IMHO letting __change_memory_common() manipulate on contiguous address
>>>>> range is
>>>>> another story and should be not a part of the split primitive.
>>>> I 100% agree that it should not be part of the split primitive.
>>>>
>>>> But your series *depends* upon __change_memory_common() being able to change
>>>> permissions on block mappings. Today it can only change permissions on page
>>>> mappings.
>>> I don't think split primitive depends on it. Changing permission on block
>>> mappings is just the user of the new split primitive IMHO. We just have no real
>>> user right now.
>> But your series introduces a real user; after your series, the linear map is
>> block mapped.
> 
> The users of the split primitive are the permission changers, for example,
> module, bpf, secret mem, etc.

Ahh, perhaps this is the crux of our misunderstanding... In my model, the split
primitive is called from __change_memory_common() (or from other appropriate
functions in pageattr.c). It's an implementation detail for arm64 and is not
exposed to common code. arm64 knows that it can split live mappings in a
transparent way so it uses huge pages eagerly and splits on demand.

I personally wouldn't want to be relying on the memory user knowing it needs to
split the mappings...

> 
>>
>> Anyway, I think we are talking past eachother. Let's continue the conversation
>> in the context of your next version of the code.
> 
> Yeah, sure.
> 
> Thanks,
> Yang
> 
>>
>>>> Your original v1 series solved this by splitting *all* of the mappings in a
>>>> given range to page mappings before calling __change_memory_common(), right?
>>> Yes, but if the range is contiguous, the new split primitive doesn't have to
>>> split to page mappings.
>>>
>>>> Remember it's not just vmalloc areas that are passed to
>>>> __change_memory_common(); virtually contiguous linear map regions can be passed
>>>> in as well. See (for example) set_direct_map_invalid_noflush(),
>>>> set_direct_map_default_noflush(), set_direct_map_valid_noflush(),
>>>> __kernel_map_pages(), realm_set_memory_encrypted(),
>>>> realm_set_memory_decrypted().
>>> Yes, no matter who the caller is, as long as the caller passes in contiguous
>>> address range, the split primitive can keep block mappings.
>>>
>>>>
>>>>> For example, we need to use vmalloc_huge() instead of vmalloc() to allocate
>>>>> huge
>>>>> memory, then does:
>>>>> split_mapping(start, start+HPAGE_PMD_SIZE);
>>>>> change_permission(start, start+HPAGE_PMD_SIZE);
>>>>>
>>>>> The split primitive will guarantee (start, start+HPAGE_PMD_SIZE) is kept as
>>>>> PMD
>>>>> mapping so that change_permission() can change it on PMD basis too.
>>>>>
>>>>> But this requires other kernel subsystems, for example, module, to allocate
>>>>> huge
>>>>> memory with proper APIs, for example, vmalloc_huge().
>>>> The longer term plan is to have vmalloc() always allocate using the
>>>> VM_ALLOW_HUGE_VMAP flag on systems that support BBML2. So there will be no need
>>>> to migrate users to vmalloc_huge(). We will just detect if we can split live
>>>> mappings safely and use huge mappings in that case.
>>> Anyway this is the potential user of the new split primitive.
>>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>>>> Regarding the linear map repainting, I had a chat with Catalin, and he
>>>>>>>> reminded
>>>>>>>> me of a potential problem; if you are doing the repainting with the machine
>>>>>>>> stopped, you can't allocate memory at that point; it's possible a CPU was
>>>>>>>> inside
>>>>>>>> the allocator when it stopped. And I think you need to allocate
>>>>>>>> intermediate
>>>>>>>> pgtables, right? Do you have a solution to that problem? I guess one
>>>>>>>> approach
>>>>>>>> would be to figure out how much memory you will need and pre-allocate
>>>>>>>> prior to
>>>>>>>> stoping the machine?
>>>>>>> OK, I don't remember we discussed this problem before. I think we can do
>>>>>>> something like what kpti does. When creating the linear map we know how
>>>>>>> many PUD
>>>>>>> and PMD mappings are created, we can record the number, it will tell how
>>>>>>> many
>>>>>>> pages we need for repainting the linear map.
>>>>>> I saw a separate reply you sent for this. I'll read that and respond in that
>>>>>> context.
>>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>
>>>>>>>>> So I plan to post v4 patches to the mailing list. We can focus on
>>>>>>>>> reviewing
>>>>>>>>> the
>>>>>>>>> split primitive and linear map repainting. Does it sound good to you?
>>>>>>>> That works assuming you have a solution for the above.
>>>>>>> I think the only missing part is preallocating page tables for repainting. I
>>>>>>> will add this, then post the new spin to the mailing list.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Yang
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Ryan
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Yang
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 5/7/25 2:16 PM, Yang Shi wrote:
>>>>>>>>>> On 5/7/25 12:58 AM, Ryan Roberts wrote:
>>>>>>>>>>> On 05/05/2025 22:39, Yang Shi wrote:
>>>>>>>>>>>> On 5/2/25 4:51 AM, Ryan Roberts wrote:
>>>>>>>>>>>>> On 14/04/2025 22:24, Yang Shi wrote:
>>>>>>>>>>>>>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>>>>>>>>>>>>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>>>>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I know you may have a lot of things to follow up after LSF/MM. Just
>>>>>>>>>>>>>>>> gently
>>>>>>>>>>>>>>>> ping,
>>>>>>>>>>>>>>>> hopefully we can resume the review soon.
>>>>>>>>>>>>>>> Hi, I'm out on holiday at the moment, returning on the 22nd
>>>>>>>>>>>>>>> April. But
>>>>>>>>>>>>>>> I'm very
>>>>>>>>>>>>>>> keen to move this series forward so will come back to you next week.
>>>>>>>>>>>>>>> (although
>>>>>>>>>>>>>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> FWIW, having thought about it a bit more, I think some of the
>>>>>>>>>>>>>>> suggestions I
>>>>>>>>>>>>>>> previously made may not have been quite right, but I'll elaborate
>>>>>>>>>>>>>>> next
>>>>>>>>>>>>>>> week.
>>>>>>>>>>>>>>> I'm
>>>>>>>>>>>>>>> keen to build a pgtable splitting primitive here that we can reuse
>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>> vmalloc
>>>>>>>>>>>>>>> as well to enable huge mappings by default with vmalloc too.
>>>>>>>>>>>>>> Sounds good. I think the patches can support splitting vmalloc page
>>>>>>>>>>>>>> table
>>>>>>>>>>>>>> too.
>>>>>>>>>>>>>> Anyway we can discuss more after you are back. Enjoy your holiday.
>>>>>>>>>>>>> Hi Yang,
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sorry I've taken so long to get back to you. Here's what I'm currently
>>>>>>>>>>>>> thinking:
>>>>>>>>>>>>> I'd eventually like to get to the point where the linear map and most
>>>>>>>>>>>>> vmalloc
>>>>>>>>>>>>> memory is mapped using the largest possible mapping granularity (i.e.
>>>>>>>>>>>>> block
>>>>>>>>>>>>> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>>>>>>>>>>>>>
>>>>>>>>>>>>> vmalloc has history with trying to do huge mappings by default; it
>>>>>>>>>>>>> ended up
>>>>>>>>>>>>> having to be turned into an opt-in feature (instead of the original
>>>>>>>>>>>>> opt-out
>>>>>>>>>>>>> approach) because there were problems with some parts of the kernel
>>>>>>>>>>>>> expecting
>>>>>>>>>>>>> page mappings. I think we might be able to overcome those issues on
>>>>>>>>>>>>> arm64
>>>>>>>>>>>>> with
>>>>>>>>>>>>> BBML2.
>>>>>>>>>>>>>
>>>>>>>>>>>>> arm64 can already support vmalloc PUD and PMD block mappings, and I
>>>>>>>>>>>>> have a
>>>>>>>>>>>>> series (that should make v6.16) that enables contiguous PTE
>>>>>>>>>>>>> mappings in
>>>>>>>>>>>>> vmalloc
>>>>>>>>>>>>> too. But these are currently limited to when VM_ALLOW_HUGE is
>>>>>>>>>>>>> specified.
>>>>>>>>>>>>> To be
>>>>>>>>>>>>> able to use that by default, we need to be able to change
>>>>>>>>>>>>> permissions on
>>>>>>>>>>>>> sub-regions of an allocation, which is where BBML2 and your series
>>>>>>>>>>>>> come
>>>>>>>>>>>>> in.
>>>>>>>>>>>>> (there may be other things we need to solve as well; TBD).
>>>>>>>>>>>>>
>>>>>>>>>>>>> I think the key thing we need is a function that can take a page-
>>>>>>>>>>>>> aligned
>>>>>>>>>>>>> kernel
>>>>>>>>>>>>> VA, will walk to the leaf entry for that VA and if the VA is in the
>>>>>>>>>>>>> middle of
>>>>>>>>>>>>> the leaf entry, it will split it so that the VA is now on a boundary.
>>>>>>>>>>>>> This
>>>>>>>>>>>>> will
>>>>>>>>>>>>> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE
>>>>>>>>>>>>> entries.
>>>>>>>>>>>>> The
>>>>>>>>>>>>> function can assume BBML2 is present. And it will return 0 on
>>>>>>>>>>>>> success, -
>>>>>>>>>>>>> EINVAL
>>>>>>>>>>>>> if the VA is not mapped or -ENOMEM if it couldn't allocate a
>>>>>>>>>>>>> pgtable to
>>>>>>>>>>>>> perform
>>>>>>>>>>>>> the split.
>>>>>>>>>>>> OK, the v3 patches already handled page table allocation failure with
>>>>>>>>>>>> returning
>>>>>>>>>>>> -ENOMEM and BUG_ON if it is not mapped because kernel assumes linear
>>>>>>>>>>>> mapping
>>>>>>>>>>>> should be always present. It is easy to return -EINVAL instead of
>>>>>>>>>>>> BUG_ON.
>>>>>>>>>>>> However I'm wondering what usecases you are thinking about? Splitting
>>>>>>>>>>>> vmalloc
>>>>>>>>>>>> area may run into unmapped VA?
>>>>>>>>>>> I don't think BUG_ON is the right behaviour; crashing the kernel
>>>>>>>>>>> should be
>>>>>>>>>>> discouraged. I think even for vmalloc under correct conditions we
>>>>>>>>>>> shouldn't
>>>>>>>>>>> see
>>>>>>>>>>> any unmapped VA. But vmalloc does handle it gracefully today; see (e.g.)
>>>>>>>>>>> vunmap_pmd_range() which skips the pmd if its none.
>>>>>>>>>>>
>>>>>>>>>>>>> Then we can use that primitive on the start and end address of any
>>>>>>>>>>>>> range for
>>>>>>>>>>>>> which we need exact mapping boundaries (e.g. when changing
>>>>>>>>>>>>> permissions on
>>>>>>>>>>>>> part
>>>>>>>>>>>>> of linear map or vmalloc allocation, when freeing part of a vmalloc
>>>>>>>>>>>>> allocation,
>>>>>>>>>>>>> etc). This way we only split enough to ensure the boundaries are
>>>>>>>>>>>>> precise,
>>>>>>>>>>>>> and
>>>>>>>>>>>>> keep larger mappings inside the range.
>>>>>>>>>>>> Yeah, makes sense to me.
>>>>>>>>>>>>
>>>>>>>>>>>>> Next we need to reimplement __change_memory_common() to not use
>>>>>>>>>>>>> apply_to_page_range(), because that assumes page mappings only. Dev
>>>>>>>>>>>>> Jain has
>>>>>>>>>>>>> been working on a series that converts this to use
>>>>>>>>>>>>> walk_page_range_novma() so
>>>>>>>>>>>>> that we can change permissions on the block/contig entries too.
>>>>>>>>>>>>> That's not
>>>>>>>>>>>>> posted publicly yet, but it's not huge so I'll ask if he is
>>>>>>>>>>>>> comfortable
>>>>>>>>>>>>> with
>>>>>>>>>>>>> posting an RFC early next week.
>>>>>>>>>>>> OK, so the new __change_memory_common() will change the permission of
>>>>>>>>>>>> page
>>>>>>>>>>>> table, right?
>>>>>>>>>>> It will change permissions of all the leaf entries in the range of VAs
>>>>>>>>>>> it is
>>>>>>>>>>> passed. Currently it assumes that all the leaf entries are PTEs. But we
>>>>>>>>>>> will
>>>>>>>>>>> generalize to support all the other types of leaf entries too.,
>>>>>>>>>>>
>>>>>>>>>>>> If I remember correctly, you suggested change permissions in
>>>>>>>>>>>> __create_pgd_mapping_locked() for v3. So I can disregard it?
>>>>>>>>>>> Yes I did. I think this made sense (in my head at least) because in the
>>>>>>>>>>> context
>>>>>>>>>>> of the linear map, all the PFNs are contiguous so it kind-of makes
>>>>>>>>>>> sense to
>>>>>>>>>>> reuse that infrastructure. But it doesn't generalize to vmalloc because
>>>>>>>>>>> vmalloc
>>>>>>>>>>> PFNs are not contiguous. So for that reason, I think it's preferable to
>>>>>>>>>>> have an
>>>>>>>>>>> independent capability.
>>>>>>>>>> OK, sounds good to me.
>>>>>>>>>>
>>>>>>>>>>>> The current code assumes the address range passed in by
>>>>>>>>>>>> change_memory_common()
>>>>>>>>>>>> is *NOT* physically contiguous so __change_memory_common() handles page
>>>>>>>>>>>> table
>>>>>>>>>>>> permission on page basis. I'm supposed Dev's patches will handle this
>>>>>>>>>>>> then my
>>>>>>>>>>>> patch can safely assume the linear mapping address range for
>>>>>>>>>>>> splitting is
>>>>>>>>>>>> physically contiguous too otherwise I can't keep large mappings inside
>>>>>>>>>>>> the
>>>>>>>>>>>> range. Splitting vmalloc area doesn't need to worry about this.
>>>>>>>>>>> I'm not sure I fully understand the point you're making here...
>>>>>>>>>>>
>>>>>>>>>>> Dev's series aims to use walk_page_range_novma() similar to riscv's
>>>>>>>>>>> implementation so that it can walk a VA range and update the
>>>>>>>>>>> permissions on
>>>>>>>>>>> each
>>>>>>>>>>> leaf entry it visits, regadless of which level the leaf entry is at.
>>>>>>>>>>> This
>>>>>>>>>>> doesn't make any assumption of the physical contiguity of neighbouring
>>>>>>>>>>> leaf
>>>>>>>>>>> entries in the page table.
>>>>>>>>>>>
>>>>>>>>>>> So if we are changing permissions on the linear map, we have a range of
>>>>>>>>>>> VAs to
>>>>>>>>>>> walk and convert all the leaf entries, regardless of their size. The
>>>>>>>>>>> same
>>>>>>>>>>> goes
>>>>>>>>>>> for vmalloc... But for vmalloc, we will also want to change the
>>>>>>>>>>> underlying
>>>>>>>>>>> permissions in the linear map, so we will have to figure out the
>>>>>>>>>>> contiguous
>>>>>>>>>>> pieces of the linear map and call __change_memory_common() for each;
>>>>>>>>>>> there is
>>>>>>>>>>> definitely some detail to work out there!
>>>>>>>>>> Yes, this is my point. When changing underlying linear map permission for
>>>>>>>>>> vmalloc, the linear map address may be not contiguous. This is why
>>>>>>>>>> change_memory_common() calls __change_memory_common() on page basis.
>>>>>>>>>>
>>>>>>>>>> But how Dev's patch work should have no impact on how I implement the
>>>>>>>>>> split
>>>>>>>>>> primitive by thinking it further. It should be the caller's
>>>>>>>>>> responsibility to
>>>>>>>>>> make sure __create_pgd_mapping_locked() is called for contiguous
>>>>>>>>>> linear map
>>>>>>>>>> address range.
>>>>>>>>>>
>>>>>>>>>>>>> You'll still need to repaint the whole linear map with page mappings
>>>>>>>>>>>>> for the
>>>>>>>>>>>>> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked()
>>>>>>>>>>>>> (potentially
>>>>>>>>>>>>> with
>>>>>>>>>>>>> minor modifications?) can do that repainting on the live mappings;
>>>>>>>>>>>>> similar to
>>>>>>>>>>>>> how you are doing it in v3.
>>>>>>>>>>>> Yes, when repainting I need to split the page table all the way down
>>>>>>>>>>>> to PTE
>>>>>>>>>>>> level. A simple flag should be good enough to tell
>>>>>>>>>>>> __create_pgd_mapping_locked()
>>>>>>>>>>>> do the right thing off the top of my head.
>>>>>>>>>>> Perhaps it may be sufficient to reuse the NO_BLOCK_MAPPINGS and
>>>>>>>>>>> NO_CONT_MAPPINGS
>>>>>>>>>>> flags? For example, if you are find a leaf mapping and
>>>>>>>>>>> NO_BLOCK_MAPPINGS is
>>>>>>>>>>> set,
>>>>>>>>>>> then you need to split it?
>>>>>>>>>> Yeah, sounds feasible. Anyway I will figure it out.
>>>>>>>>>>
>>>>>>>>>>>>> Miko's BBML2 series should hopefully get imminently queued for v6.16.
>>>>>>>>>>>> Great! Anyway my series is based on his advertising BBML2 patch.
>>>>>>>>>>>>
>>>>>>>>>>>>> So in summary, what I'm asking for your large block mapping the
>>>>>>>>>>>>> linear map
>>>>>>>>>>>>> series is:
>>>>>>>>>>>>>         - Paint linear map using blocks/contig if boot CPU supports
>>>>>>>>>>>>> BBML2
>>>>>>>>>>>>>         - Repaint linear map using page mappings if secondary CPUs
>>>>>>>>>>>>> don't
>>>>>>>>>>>>> support BBML2
>>>>>>>>>>>> OK, I just need to add some simple tweak to split down to PTE level to
>>>>>>>>>>>> v3.
>>>>>>>>>>>>
>>>>>>>>>>>>>         - Integrate Dev's __change_memory_common() series
>>>>>>>>>>>> OK, I think I have to do my patches on top of it. Because Dev's patch
>>>>>>>>>>>> need
>>>>>>>>>>>> guarantee the linear mapping address range is physically contiguous.
>>>>>>>>>>>>
>>>>>>>>>>>>>         - Create primitive to ensure mapping entry boundary at a given
>>>>>>>>>>>>> page-
>>>>>>>>>>>>> aligned VA
>>>>>>>>>>>>>         - Use primitive when changing permissions on linear map region
>>>>>>>>>>>> Sure.
>>>>>>>>>>>>
>>>>>>>>>>>>> This will be mergable on its own, but will also provide a great
>>>>>>>>>>>>> starting
>>>>>>>>>>>>> base
>>>>>>>>>>>>> for adding huge-vmalloc-by-default.
>>>>>>>>>>>>>
>>>>>>>>>>>>> What do you think?
>>>>>>>>>>>> Definitely makes sense to me.
>>>>>>>>>>>>
>>>>>>>>>>>> If I remember correctly, we still have some unsolved comments/questions
>>>>>>>>>>>> for v3
>>>>>>>>>>>> in my replies on March 17, particularly:
>>>>>>>>>>>> https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-
>>>>>>>>>>>> b344-9401fa4c0feb@os.amperecomputing.com/
>>>>>>>>>>> Ahh sorry about that. I'll take a look now...
>>>>>>>>>> No problem.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Yang
>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Ryan
>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Yang
>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Ryan
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>> Yang
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>> Ryan
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>> Yang
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>>>>>>>>>>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>>>>>>>>>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>>>>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I saw Miko posted a new spin of his patches. There are some
>>>>>>>>>>>>>>>>>>> slight
>>>>>>>>>>>>>>>>>>> changes
>>>>>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>>>>>> have impact to my patches (basically check the new boot
>>>>>>>>>>>>>>>>>>> parameter).
>>>>>>>>>>>>>>>>>>> Do you
>>>>>>>>>>>>>>>>>>> prefer I rebase my patches on top of his new spin right now then
>>>>>>>>>>>>>>>>>>> restart
>>>>>>>>>>>>>>>>>>> review
>>>>>>>>>>>>>>>>>>> from the new spin or review the current patches then solve
>>>>>>>>>>>>>>>>>>> the new
>>>>>>>>>>>>>>>>>>> review
>>>>>>>>>>>>>>>>>>> comments and rebase to Miko's new spin together?
>>>>>>>>>>>>>>>>>> Hi Yang,
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Sorry I haven't got to reviewing this version yet, it's in my
>>>>>>>>>>>>>>>>>> queue!
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> I'm happy to review against v3 as it is. I'm familiar with Miko's
>>>>>>>>>>>>>>>>>> series
>>>>>>>>>>>>>>>>>> and am
>>>>>>>>>>>>>>>>>> not too bothered about the integration with that; I think it's
>>>>>>>>>>>>>>>>>> pretty
>>>>>>>>>>>>>>>>>> straight
>>>>>>>>>>>>>>>>>> forward. I'm more interested in how you are handling the
>>>>>>>>>>>>>>>>>> splitting,
>>>>>>>>>>>>>>>>>> which I
>>>>>>>>>>>>>>>>>> think is the bulk of the effort.
>>>>>>>>>>>>>>>>> Yeah, sure, thank you.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> I'm hoping to get to this next week before heading out to LSF/MM
>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>> following
>>>>>>>>>>>>>>>>>> week (might I see you there?)
>>>>>>>>>>>>>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>>> Yang
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>>>> Ryan
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>>>>> Yang
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>>>>>>>>>>>>>> Changelog
>>>>>>>>>>>>>>>>>>>> =========
>>>>>>>>>>>>>>>>>>>> v3:
>>>>>>>>>>>>>>>>>>>>            * Rebased to v6.14-rc4.
>>>>>>>>>>>>>>>>>>>>            * Based on Miko's BBML2 cpufeature patch (https://
>>>>>>>>>>>>>>>>>>>> lore.kernel.org/
>>>>>>>>>>>>>>>>>>>> linux-
>>>>>>>>>>>>>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>>>>>>>>>>>>>              Also included in this series in order to have the
>>>>>>>>>>>>>>>>>>>> complete
>>>>>>>>>>>>>>>>>>>> patchset.
>>>>>>>>>>>>>>>>>>>>            * Enhanced __create_pgd_mapping() to handle split as
>>>>>>>>>>>>>>>>>>>> well per
>>>>>>>>>>>>>>>>>>>> Ryan.
>>>>>>>>>>>>>>>>>>>>            * Supported CONT mappings per Ryan.
>>>>>>>>>>>>>>>>>>>>            * Supported asymmetric system by splitting kernel
>>>>>>>>>>>>>>>>>>>> linear
>>>>>>>>>>>>>>>>>>>> mapping if
>>>>>>>>>>>>>>>>>>>> such
>>>>>>>>>>>>>>>>>>>>              system is detected per Ryan. I don't have such
>>>>>>>>>>>>>>>>>>>> system to
>>>>>>>>>>>>>>>>>>>> test,
>>>>>>>>>>>>>>>>>>>> so the
>>>>>>>>>>>>>>>>>>>>              testing is done by hacking kernel to call linear
>>>>>>>>>>>>>>>>>>>> mapping
>>>>>>>>>>>>>>>>>>>> repainting
>>>>>>>>>>>>>>>>>>>>              unconditionally. The linear mapping doesn't
>>>>>>>>>>>>>>>>>>>> have any
>>>>>>>>>>>>>>>>>>>> block and
>>>>>>>>>>>>>>>>>>>> cont
>>>>>>>>>>>>>>>>>>>>              mappings after booting.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> RFC v2:
>>>>>>>>>>>>>>>>>>>>            * Used allowlist to advertise BBM lv2 on the CPUs
>>>>>>>>>>>>>>>>>>>> which
>>>>>>>>>>>>>>>>>>>> can
>>>>>>>>>>>>>>>>>>>> handle TLB
>>>>>>>>>>>>>>>>>>>>              conflict gracefully per Will Deacon
>>>>>>>>>>>>>>>>>>>>            * Rebased onto v6.13-rc5
>>>>>>>>>>>>>>>>>>>>            * https://lore.kernel.org/linux-arm-
>>>>>>>>>>>>>>>>>>>> kernel/20250103011822.1257189-1-
>>>>>>>>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>>>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Description
>>>>>>>>>>>>>>>>>>>> ===========
>>>>>>>>>>>>>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due to
>>>>>>>>>>>>>>>>>>>> arm's
>>>>>>>>>>>>>>>>>>>> break-before-make rule.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> A number of performance issues arise when the kernel linear
>>>>>>>>>>>>>>>>>>>> map is
>>>>>>>>>>>>>>>>>>>> using
>>>>>>>>>>>>>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>>>>>>>>>>>>>            - performance degradation
>>>>>>>>>>>>>>>>>>>>            - more TLB pressure
>>>>>>>>>>>>>>>>>>>>            - memory waste for kernel page table
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> These issues can be avoided by specifying rodata=on the kernel
>>>>>>>>>>>>>>>>>>>> command
>>>>>>>>>>>>>>>>>>>> line but this disables the alias checks on page table
>>>>>>>>>>>>>>>>>>>> permissions and
>>>>>>>>>>>>>>>>>>>> therefore compromises security somewhat.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to
>>>>>>>>>>>>>>>>>>>> invalidate the
>>>>>>>>>>>>>>>>>>>> page table entry when changing page sizes. This allows the
>>>>>>>>>>>>>>>>>>>> kernel to
>>>>>>>>>>>>>>>>>>>> split large mappings after boot is complete.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> This patch adds support for splitting large mappings when
>>>>>>>>>>>>>>>>>>>> FEAT_BBM
>>>>>>>>>>>>>>>>>>>> level 2
>>>>>>>>>>>>>>>>>>>> is available and rodata=full is used. This functionality
>>>>>>>>>>>>>>>>>>>> will be
>>>>>>>>>>>>>>>>>>>> used
>>>>>>>>>>>>>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map
>>>>>>>>>>>>>>>>>>>> using
>>>>>>>>>>>>>>>>>>>> PTEs
>>>>>>>>>>>>>>>>>>>> only.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> If the system is asymmetric, the kernel linear mapping may be
>>>>>>>>>>>>>>>>>>>> repainted
>>>>>>>>>>>>>>>>>>>> once
>>>>>>>>>>>>>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6
>>>>>>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>>>>>>> more
>>>>>>>>>>>>>>>>>>>> details.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> We saw significant performance increases in some benchmarks
>>>>>>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>>>>>>> rodata=full without compromising the security features of the
>>>>>>>>>>>>>>>>>>>> kernel.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Testing
>>>>>>>>>>>>>>>>>>>> =======
>>>>>>>>>>>>>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with
>>>>>>>>>>>>>>>>>>>> 256GB
>>>>>>>>>>>>>>>>>>>> memory and
>>>>>>>>>>>>>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>>>>>>>>>>>>>            - Kernel boot.  Kernel needs change kernel linear
>>>>>>>>>>>>>>>>>>>> mapping
>>>>>>>>>>>>>>>>>>>> permission at
>>>>>>>>>>>>>>>>>>>>              boot stage, if the patch didn't work, kernel
>>>>>>>>>>>>>>>>>>>> typically
>>>>>>>>>>>>>>>>>>>> didn't
>>>>>>>>>>>>>>>>>>>> boot.
>>>>>>>>>>>>>>>>>>>>            - Module stress from stress-ng. Kernel module load
>>>>>>>>>>>>>>>>>>>> change
>>>>>>>>>>>>>>>>>>>> permission
>>>>>>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>>>>>>>              linear mapping.
>>>>>>>>>>>>>>>>>>>>            - A test kernel module which allocates 80% of total
>>>>>>>>>>>>>>>>>>>> memory
>>>>>>>>>>>>>>>>>>>> via
>>>>>>>>>>>>>>>>>>>> vmalloc(),
>>>>>>>>>>>>>>>>>>>>              then change the vmalloc area permission to RO,
>>>>>>>>>>>>>>>>>>>> this also
>>>>>>>>>>>>>>>>>>>> change
>>>>>>>>>>>>>>>>>>>> linear
>>>>>>>>>>>>>>>>>>>>              mapping permission to RO, then change it back
>>>>>>>>>>>>>>>>>>>> before
>>>>>>>>>>>>>>>>>>>> vfree(). Then
>>>>>>>>>>>>>>>>>>>> launch
>>>>>>>>>>>>>>>>>>>>              a VM which consumes almost all physical memory.
>>>>>>>>>>>>>>>>>>>>            - VM with the patchset applied in guest kernel too.
>>>>>>>>>>>>>>>>>>>>            - Kernel build in VM with guest kernel which has
>>>>>>>>>>>>>>>>>>>> this
>>>>>>>>>>>>>>>>>>>> series
>>>>>>>>>>>>>>>>>>>> applied.
>>>>>>>>>>>>>>>>>>>>            - rodata=on. Make sure other rodata mode is not
>>>>>>>>>>>>>>>>>>>> broken.
>>>>>>>>>>>>>>>>>>>>            - Boot on the machine which doesn't support BBML2.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Performance
>>>>>>>>>>>>>>>>>>>> ===========
>>>>>>>>>>>>>>>>>>>> Memory consumption
>>>>>>>>>>>>>>>>>>>> Before:
>>>>>>>>>>>>>>>>>>>> MemTotal:       258988984 kB
>>>>>>>>>>>>>>>>>>>> MemFree:        254821700 kB
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> After:
>>>>>>>>>>>>>>>>>>>> MemTotal:       259505132 kB
>>>>>>>>>>>>>>>>>>>> MemFree:        255410264 kB
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Around 500MB more memory are free to use.  The larger the
>>>>>>>>>>>>>>>>>>>> machine,
>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>> more memory saved.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Performance benchmarking
>>>>>>>>>>>>>>>>>>>> * Memcached
>>>>>>>>>>>>>>>>>>>> We saw performance degradation when running Memcached benchmark
>>>>>>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB
>>>>>>>>>>>>>>>>>>>> pressure.
>>>>>>>>>>>>>>>>>>>> With this patchset we saw ops/sec is increased by around 3.5%,
>>>>>>>>>>>>>>>>>>>> P99
>>>>>>>>>>>>>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>>>>>>>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The
>>>>>>>>>>>>>>>>>>>> kernel
>>>>>>>>>>>>>>>>>>>> TLB
>>>>>>>>>>>>>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>>>>>>>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk
>>>>>>>>>>>>>>>>>>>> (ext4)
>>>>>>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>>>>>>> disk
>>>>>>>>>>>>>>>>>>>> encryption (by dm-crypt).
>>>>>>>>>>>>>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --
>>>>>>>>>>>>>>>>>>>> randrepeat 1 \
>>>>>>>>>>>>>>>>>>>>              --status-interval=999 --rw=write --bs=4k --
>>>>>>>>>>>>>>>>>>>> loops=1 --
>>>>>>>>>>>>>>>>>>>> ioengine=sync \
>>>>>>>>>>>>>>>>>>>>              --iodepth=1 --numjobs=1 --fsync_on_close=1 --
>>>>>>>>>>>>>>>>>>>> group_reporting --
>>>>>>>>>>>>>>>>>>>> thread \
>>>>>>>>>>>>>>>>>>>>              --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, but
>>>>>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>>>>>> worst
>>>>>>>>>>>>>>>>>>>> number of good case is around 90% more than the best number of
>>>>>>>>>>>>>>>>>>>> bad
>>>>>>>>>>>>>>>>>>>> case).
>>>>>>>>>>>>>>>>>>>> The bandwidth is increased and the avg clat is reduced
>>>>>>>>>>>>>>>>>>>> proportionally.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> * Sequential file read
>>>>>>>>>>>>>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache
>>>>>>>>>>>>>>>>>>>> populated).
>>>>>>>>>>>>>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>>>>>>>>>>>>>                arm64: Add BBM Level 2 cpu feature
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Yang Shi (5):
>>>>>>>>>>>>>>>>>>>>                arm64: cpufeature: add AmpereOne to BBML2 allow
>>>>>>>>>>>>>>>>>>>> list
>>>>>>>>>>>>>>>>>>>>                arm64: mm: make __create_pgd_mapping() and
>>>>>>>>>>>>>>>>>>>> helpers
>>>>>>>>>>>>>>>>>>>> non-void
>>>>>>>>>>>>>>>>>>>>                arm64: mm: support large block mapping when
>>>>>>>>>>>>>>>>>>>> rodata=full
>>>>>>>>>>>>>>>>>>>>                arm64: mm: support split CONT mappings
>>>>>>>>>>>>>>>>>>>>                arm64: mm: split linear mapping if BBML2 is not
>>>>>>>>>>>>>>>>>>>> supported on
>>>>>>>>>>>>>>>>>>>> secondary
>>>>>>>>>>>>>>>>>>>> CPUs
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>           arch/arm64/Kconfig                  | 11 +++++
>>>>>>>>>>>>>>>>>>>>           arch/arm64/include/asm/cpucaps.h    | 2 +
>>>>>>>>>>>>>>>>>>>>           arch/arm64/include/asm/cpufeature.h | 15 ++++++
>>>>>>>>>>>>>>>>>>>>           arch/arm64/include/asm/mmu.h        | 4 ++
>>>>>>>>>>>>>>>>>>>>           arch/arm64/include/asm/pgtable.h    | 12 ++++-
>>>>>>>>>>>>>>>>>>>>           arch/arm64/kernel/cpufeature.c      | 95 ++++++++++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> +++++++
>>>>>>>>>>>>>>>>>>>>           arch/arm64/mm/mmu.c                 | 397 ++++++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>>>>>>> ++++++
>>>>>>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>>>>>>> ++++
>>>>>>>>>>>>>>>>>>>> +++++
>>>>>>>>>>>>>>>>>>>> +++++
>>>>>>>>>>>>>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>>>>>>>>>>>>>           arch/arm64/mm/pageattr.c            | 37 +++++++++
>>>>>>>>>>>>>>>>>>>> +++---
>>>>>>>>>>>>>>>>>>>>           arch/arm64/tools/cpucaps            | 1 +
>>>>>>>>>>>>>>>>>>>>           9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
> 

