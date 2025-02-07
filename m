Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0B32475CA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943214; cv=none; b=kmUnesi1krfuvTrzagiwShLmoytkFuoEm701DnaR6V+jyCBl9UwuUv96bzzMBM+k5ZUtaAxZIYXqbXulS45bcuW185hrWIaapcwJdC8p4hdAwSW0Rwprly2BNLTGnpArIXczbz/R5cXxzyxSR4kkreUkHzlqE4TXZoUGy3Iur4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943214; c=relaxed/simple;
	bh=aLacViqaUc3354guPSu4Icas4R1pfzpcrIiTi/v8GCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tq1YtWNQkx0vs9fPd123TspY6GmQIVya3l0HzgaD1jXJf+SSKqVOZu3RR66PVnhEZczFxWZmEw+sUj7e71LB6ufbheB0XW4pRojQ9w/zKCFI4oeEM4a10npeyPZ+M5Y50UEcTB6d3kNNvompOfeaIdUcgWbYlTnoBSkzqziVHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF6C81EA6;
	Fri,  7 Feb 2025 07:47:14 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E69A3F58B;
	Fri,  7 Feb 2025 07:46:49 -0800 (PST)
Message-ID: <787e55a2-71a6-4333-b808-7b5f36b1300b@arm.com>
Date: Fri, 7 Feb 2025 15:46:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/40] x86/resctrl: Describe resctrl's bitmap size
 assumptions
To: Tony Luck <tony.luck@intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-31-james.morse@arm.com>
 <ZwV_B-4gz9tUaF67@agluck-desk3.sc.intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <ZwV_B-4gz9tUaF67@agluck-desk3.sc.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

On 08/10/2024 19:50, Tony Luck wrote:
> On Fri, Oct 04, 2024 at 06:03:37PM +0000, James Morse wrote:
>> resctrl operates on configuration bitmaps and a bitmap of allocated
>> CLOSID, both are stored in a u32.
>>
>> MPAM supports configuration/portion bitmaps and PARTIDs larger
>> than will fit in a u32.
>>
>> Add some preprocessor values that make it clear why MPAM clamps
>> some of these values. This will make it easier to find code related
>> to these values if this resctrl behaviour ever changes.
> 
> ...
> 
>> +#define RESCTRL_MAX_CLOSID		32
> 
> Do you really need to do this? Intel x86 architecture allows for more than
> 32 CLOSIDs, it's just expensive in h/w to get past 16 ... so I picked
> that trivial bitmap allocator in ages past. But if ARM can have more,
> then why would you need to clamp the value?

Just to avoid touching this code now! For feature-parity - no-one can argue they have a
33-CLOSID use-case that works on x86, but not on arm64. My cunning plan was to flush out
the people who cared ...


> File system code could ask
> architecture code to allocate a CLOSID. On x86 that will fail when there
> are no more CLOSIDs, so filesystem will fail the mkdir(2).

I didn't have a strong reason to pull the allocator out to be arch-specific, so just left
it where it was. That avoided having to think about abstracting the limbo thread.


> Or, since you put closid_alloc() into the filesystem code you could
> change the closid_free_map to u64.

Marvell sent a patch doing exactly that - so they must have a platform with more than 32
PARTID. The version I'm carrying around removes the limit:
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot/v6.12-rc1&id=61e646352b8286b869f8ee0627cec81f01009e3e

(I did think it would be more invasive)

As the existing limit is not important I'll swap this patch with the one linked above that
removes the CLOSID limit into this series.

(The MAX_CBM bitmap size can be inferred from things like struct resctrl_staged_config's
new_ctrl u32)


> If you really do want to have this #define ... maybe you should use it
> in place of the hard coded 32 here:
> 
> static void closid_init(void)
> {
>         struct resctrl_schema *s;
>         u32 rdt_min_closid = 32;
> }

Oops - I'd missed that.


>> +#define RESCTRL_MAX_CBM		32
> 
> Intel x86 could plausibly expand the cache bitmap size (the MSRs
> that store them currenly have bits 63:32 reserved, but that could be
> changed).

> The only 32-bit limits are the CPUID field that enumerates
> CBM_LEN and the CPUID field that enumerates the shared bitmap. The
> length has space for expansion, the share bitfiled does not. So if
> Intel did go to more than 32-bits we'd be stuck making sure any shared
> bits were in the lower 32-bits.

Thanks for looking those up - I thought these limits were hard-and-fast!

MPAMs limit for the control values for the cache bitmaps is 4K - I suggest we ignore this!
MPAM can't describe a shared bitmap, if someone ever needed that, it would have to be
done by a firmware table. The CPU's max CLOSID limit is 2^16.


Thanks,

James
