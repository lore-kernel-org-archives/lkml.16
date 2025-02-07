Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46261EB1BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943092; cv=none; b=MjuQvw3nu5TLTdkm/hf2oG0dMXtt+3J/V9VrkfdtoqXaN1+9WYE7w0ybJP3R2Gvgml+VRJShvsvEWdJjfazQ7XgB5G3yFUYgzBWwiSucex5gW9LckTNyxyb03W2HbmgEWMHifM0pM1dTmQ7QgpfddbfAOWqkydYQSS/nYTA0zEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943092; c=relaxed/simple;
	bh=vLxrN4YBqD5nvQbWI4jWw6tgHFstxzqxzL2NSP2qU4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZg8x3RiXE/bVNHCHwjEb+aaNvpbRweoev/NReglylB7wQ01en6lFeTHVINAfp2ri77HECQPzW17S5y5g3Iqdvvwm/+QXOmsVv9PsTvy13zcI1PA6KLx0fE2j51J1Wl40dbosoq2uuGYg2kP+w3ysuyjd8rJqPJsj5/T9EuoTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E774E1E7D;
	Fri,  7 Feb 2025 07:45:12 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066C03F58B;
	Fri,  7 Feb 2025 07:44:45 -0800 (PST)
Message-ID: <64d25a7d-cead-4fce-9000-3481295979b9@arm.com>
Date: Fri, 7 Feb 2025 15:44:44 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/40] x86/resctrl: Export the is_mbm_*_enabled()
 helpers to asm/resctrl.h
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-19-james.morse@arm.com>
 <49e78ef5-b500-4135-a32d-003d3d62f239@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <49e78ef5-b500-4135-a32d-003d3d62f239@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2024 23:00, Reinette Chatre wrote:
> Hi James,
> 
> On 10/4/24 11:03 AM, James Morse wrote:
>> The architecture specific parts of resctrl have helpers to hide accesses
>> to the rdt_mon_features bitmap.
> 
> hmmmm ... no ... this patch creates those helpers.

is_mbm_total_enabled() and is_mbm_local_enabled() from the subject were added
by commit 9f52425ba303 ("x86/intel_rdt/mbm: Basic counting of MBM events (total and
local"), way back in 2017.

I'll add some of the helper names to this paragraph, but I think a list impedes readability.


>> Once the filesystem parts of resctrl are moved, these can no longer live
>> in internal.h. Once these are exposed to the wider kernel, they should
>> have a 'resctrl_arch_' prefix, to fit the rest of the arch<->fs interface.
>>
>> Move and rename the helpers that touch rdt_mon_features directly.
>> is_mbm_event() and is_mbm_enabled() are only called from rdtgroup.c,
>> so can be moved into that file.
> 
> There seems to be a contradiction here ... earlier patch moved the
> event IDs to common header so this makes these events shared between
> resctrl and all archs.

Unique identifiers were needed for the events that are shared by all architectures - using
the x86 hardware values is simple enough, and benefits the x86 architecture code. It was
an easy choice because today they are 1,2,3 ...


> rdt_mon_features bitmap positions are
> the common event IDs. Why should rdt_mon_features thus be considered arch
> specific if bits that can be set are not?

The values are passed into the helper, its up to the architecture code what it does with
them. For example, MPAM currently uses these to check pointers in an array, but once it
exposes events that resctrl doesn't offer to user-space, it will need to do more pointer
chasing.

I don't think its a good idea to require data values to be exposed between the
architecture and filesystem code. It's simple today, but having to maintain a shared
bitmap of event types across architectures sounds like a headache.
Helpers like this have a much clearer and closely defined behaviour, and are much harder
to abuse. When one architecture needs something different, its free to do so. If one
architecture wants to expose something like rdt_mon_features and test the bits - all that
can be inlined in to the caller.

(Currently the realloc-threshold is the only data value exposed because it would have been
more churn to abstract it)


> The patch may be ok if MPAM wants to do something different here but
> motivating it as "this is arch specific and needs to be hidden by helpers"
> is a stretch since there is nothing arch specific about it.

My view will be coloured because at one point I did have helpers to remap 'resctrl event
enum' numbers back to x86's hardware counters. The cunning plan was for the compiler to
optimise it out - unless it proved impossible - which the compiler could work out.
But I figured it would be simpler to get rid of it and use the enum values directly. (the
actual values don't matter to MPAM - as long as the enum isn't too big).

I'll reword this to cover why exposing helpers instead of an unsigned-long is preferable.


Thanks,

James
