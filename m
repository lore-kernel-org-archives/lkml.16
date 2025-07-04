Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B412F8C2B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650746; cv=none; b=kh+o0Zx5NQLIe7AxRIq9lHPompPCxVKGnkFHaW3qaSJu3KSty46HMsdDlCCWVpbFjVcESc7NdF9GvH9eSyOdzzlOrm5AQ7Zy0JulWZI+PPPDPEFAmW9RRUTRPxLVXB5IAAlvlvNlnkbzqKyas+M0SJg5wVnJ0RmZYGZeP3Diybg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650746; c=relaxed/simple;
	bh=j02YDs6aDCl4rqT3OFIlEJ2Sbfh56QMrKCAykaGjHL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQ5rcMC0eLktnkmC9nvxCWi9yGKj8a92Z2i1sacIv4C9ghkjW7VUdP7xmfktgz+C3cQaK4+vRaGrRG2SmUaZXra5Kg1aPOBIsUXrgEbGca32ABLtN9188fKamyveHBy9iU3GMKL51WauVBtd8Lenj2FDqMo5L9Op2Gy62e8GPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9D1C293B;
	Fri,  4 Jul 2025 10:38:50 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C7A83F66E;
	Fri,  4 Jul 2025 10:39:03 -0700 (PDT)
Message-ID: <642f2fa8-cd61-47ed-9d63-a15de263d36d@arm.com>
Date: Fri, 4 Jul 2025 18:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cacheinfo: Add arch hook to compress CPU h/w id into
 32 bits for cache-id
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com,
 Ben Horgan <ben.horgan@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
 <20250613130356.8080-3-james.morse@arm.com>
 <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
 <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
 <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_Jsq+mXkQTM-zbozPGkCQ40CusOUudWgtaxx_ufqL+0t96mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 30/06/2025 20:43, Rob Herring wrote:
> On Fri, Jun 27, 2025 at 11:38 AM James Morse <james.morse@arm.com> wrote:
>> On 23/06/2025 15:48, Rob Herring wrote:
>>> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>>>> Filesystems like resctrl use the cache-id exposed via sysfs to identify
>>>> groups of CPUs. The value is also used for PCIe cache steering tags. On
>>>> DT platforms cache-id is not something that is described in the
>>>> device-tree, but instead generated from the smallest CPU h/w id of the
>>>> CPUs associated with that cache.
>>>>
>>>> CPU h/w ids may be larger than 32 bits.
>>>>
>>>> Add a hook to allow architectures to compress the value from the devicetree
>>>> into 32 bits. Returning the same value is always safe as cache_of_set_id()
>>>> will stop if a value larger than 32 bits is seen.
>>>>
>>>> For example, on arm64 the value is the MPIDR affinity register, which only
>>>> has 32 bits of affinity data, but spread across the 64 bit field. An
>>>> arch-specific bit swizzle gives a 32 bit value.
>>
>>> What's missing here is why do we need the cache id to be only 32-bits?
>>> I suppose it is because the sysfs 'id' file has been implicitly that?
>>
>> Yup, and its too late to change.
>>
>>
>>> Why can't we just allow 64-bit values there? Obviously, you can't have
>>> a 64-bit value on x86 because that might break existing userspace.
>>
>> It's the same user-space. Users of resctrl should be portable between architectures.
>> Resctrl isn't the only user, of the cache-id field.
>>
>>
>>> But for Arm, there is no existing userspace to break.
>>
>> libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Looks to me like AMD wasn't even supported til v10.8.0 (2024-10-01)[1].

'when mounted with [a particular option]'

AMDs bandwidth controls count in 1/8ths of 1GB/s - and you have to know you're running on
an AMD machine. I'm aiming for the arm64 support to be portable between Intel and RISC-V.


>> DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/
> 
> Is that even applied yet?

No idea, but its equally likely that I haven't found all the places this gets parsed by
user-space. I don't think we have a way of telling people using stable-kernels that we
might change the size of that field. It's pretty clear people don't anticipate it changing!

This is just the downside of exposing anything to user-space!

[...]

>>> It is obviously nice
>>> if we can avoid modifying userspace, but I don't think that's a
>>> requirement and I'd be surprised if there's not other things that need
>>> to be adapted for MPAM support.
>>
>> The whole multi-year effort has been to make existing user-space work without any ABI
>> changes. The effect is some platforms have features that can't be used because resctrl
>> expects things to be Xeon shaped.
>> But if your platform looks a bit like a Xeon (cache portion controls on the L3, memory
>> bandwidth controls somewhere that is believably the L3), then resctrl works as it does on
>> Intel. The only thing that has come a little unstuck is the 'num_rmid' property where MPAM
>> doesn't have an equivalent, so '1' is exposed as a safe value.
> 
> Fair enough, but I'd be rather surprised if there doesn't end up being
> changes to support Arm platforms.
> 
>>> Also, what if an architecture can't swizzle their value into 32-bits?
>>> They would be stuck with requiring userspace to deal with 64-bit
>>> values.
>>
>> Remap them in a more complicated way. Chances are there aren't 2^32 CPUs.

> What about using the logical CPU number instead? That's stable for a
> given machine and firmware.

Hmmm, if you offline CPU-0 then kexec, then CPU-1 becomes the new CPU-0 and the numbers
get doled out differently.


> And then instead of having 3 sets of
> numbers (MPIDR, compressed MPIDR, and logical CPU), we'd still only
> have 2. And logical CPU is what sysfs already exposes to userspace.

I don't think the linux allocated CPU number is robust enough.

We could use the CPU number as seen when walking through the DT to make it stable, but
that would still be a third type of number. It would save the arch hook to swizzle the
bits, but changing the DT would change the numbers which doesn't happen with this scheme.

Let me know if that is what you prefer.
(I'll summarise this on the cover-letter/patch-1 of the incoming series)


Thanks,

James
