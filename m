Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94F02EA495
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042323; cv=none; b=HJtcTN4uHq9qj/m8tyqcM4N4RQz9KSCByByZawJd4D7iKunPiIL0AauttyJ7XQknNBo5eHp/JidyApKfC28gxHooA4aTftrULr527B3fnn7tY7yQcNGXuJ8IcSz8M0Sx5SIuiw98+Sjtp2YuVPVbV6jhacrb/6uNnKRXLVeuI6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042323; c=relaxed/simple;
	bh=A1MfYjfC2Qc4xBmDLjcOEpJYWjzkr9xA1YQcLlLnjmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0nGnN0rD6INBW4jmbqusgrmdn5sT/Vi+eC50pjV3wX+yWbIdi3/uFdwhNDTyq5mO8KHz5B6v0gyS9xJGWmBI7z8sA7AyvC8yJUsQEDBqN64zYOPzlWV2V+Xuz0jAGBkHiIN9WoHrbQ6EHuWCjdvtzMfl9NUm6Kf4dt4ROyhG2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E571F1A00;
	Fri, 27 Jun 2025 09:38:23 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E83CE3F58B;
	Fri, 27 Jun 2025 09:38:39 -0700 (PDT)
Message-ID: <ee08ba7e-2669-447f-ae04-5a6b00a16e77@arm.com>
Date: Fri, 27 Jun 2025 17:38:38 +0100
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
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_Jsq+rsBq1Dsw4+hfkMhopN9Pdwyp9JJbqeT6yB+d++s4v7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 23/06/2025 15:48, Rob Herring wrote:
> On Fri, Jun 13, 2025 at 8:04 AM James Morse <james.morse@arm.com> wrote:
>> Filesystems like resctrl use the cache-id exposed via sysfs to identify
>> groups of CPUs. The value is also used for PCIe cache steering tags. On
>> DT platforms cache-id is not something that is described in the
>> device-tree, but instead generated from the smallest CPU h/w id of the
>> CPUs associated with that cache.
>>
>> CPU h/w ids may be larger than 32 bits.
>>
>> Add a hook to allow architectures to compress the value from the devicetree
>> into 32 bits. Returning the same value is always safe as cache_of_set_id()
>> will stop if a value larger than 32 bits is seen.
>>
>> For example, on arm64 the value is the MPIDR affinity register, which only
>> has 32 bits of affinity data, but spread across the 64 bit field. An
>> arch-specific bit swizzle gives a 32 bit value.

> What's missing here is why do we need the cache id to be only 32-bits?
> I suppose it is because the sysfs 'id' file has been implicitly that?

Yup, and its too late to change.


> Why can't we just allow 64-bit values there? Obviously, you can't have
> a 64-bit value on x86 because that might break existing userspace.

It's the same user-space. Users of resctrl should be portable between architectures.
Resctrl isn't the only user, of the cache-id field.


> But for Arm, there is no existing userspace to break.

libvirt: https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
DPDK: http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@arm.com/


> Even with 32-bits,
> it is entirely possible that an existing userspace assumed values less
> than 32-bits and would be broken for Arm as-is.

Sure, but I've not found a project where that is broken yet.


> It is obviously nice
> if we can avoid modifying userspace, but I don't think that's a
> requirement and I'd be surprised if there's not other things that need
> to be adapted for MPAM support.

The whole multi-year effort has been to make existing user-space work without any ABI
changes. The effect is some platforms have features that can't be used because resctrl
expects things to be Xeon shaped.
But if your platform looks a bit like a Xeon (cache portion controls on the L3, memory
bandwidth controls somewhere that is believably the L3), then resctrl works as it does on
Intel. The only thing that has come a little unstuck is the 'num_rmid' property where MPAM
doesn't have an equivalent, so '1' is exposed as a safe value.


> Also, what if an architecture can't swizzle their value into 32-bits?
> They would be stuck with requiring userspace to deal with 64-bit
> values.

Remap them in a more complicated way. Chances are there aren't 2^32 CPUs.


I'll add something about the libvirt example to the commit message.


Thanks,

James
