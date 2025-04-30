Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB9B134D4;
	Wed, 30 Apr 2025 04:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987494; cv=none; b=R8CIu+YVtetI/0MUc/Fn07tuRzgkZxjbQXnwE9rnTyHnxXCMoL+u5bDkZC/WW7cX08Zb5O0M7r8s5lBpOHc5X+0sHdYFxgQWFqupt81KM/G6BvgX9pPlYJKWWGrzIQbs067D4RIeXYpkgqT6VpVQbjPwST6GBYIETBhhEF54fvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987494; c=relaxed/simple;
	bh=Xch5i+pOwOmWkgSc289YJ0Z+tNONrmPcI3BET6rGG2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fm6ZsQnYh2qPAbRJof0DR+zktt4KBJYwT0FhtbrVmZNEWD1ZPu/7USrf+NFcPkDQGqnvm74ywXjzeVj43eiVXUjTMN/21LkrtPNka23pB2ZbynseKwa7jV2lzNMQ54d9pElG5PidSPBHGQsSDjML2yfzS1TFPjgP4HkcNK3eq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4338A106F;
	Tue, 29 Apr 2025 21:31:24 -0700 (PDT)
Received: from [10.163.50.23] (unknown [10.163.50.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A333F5A1;
	Tue, 29 Apr 2025 21:31:27 -0700 (PDT)
Message-ID: <896970ff-bcf6-4c7d-9c51-6c95246e00d1@arm.com>
Date: Wed, 30 Apr 2025 10:01:22 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
To: Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
 <20250429162754.GA26677@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250429162754.GA26677@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 21:57, Will Deacon wrote:
> On Wed, Apr 16, 2025 at 11:57:06AM +0530, Anshuman Khandual wrote:
>> Add an entry for nodebugmon which has been used on arm64 platforms.
>>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This patch applies on v6.15-rc2
>>
>>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index d9fd26b95b34..f4a313d6c0ab 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4085,6 +4085,13 @@
>>  			/sys/module/printk/parameters/console_suspend) to
>>  			turn on/off it dynamically.
>>  
>> +	nodebugmon
>> +			[HW,ARM64] Disable debug monitor
>> +			Disables the debug monitor exception handling on the platform
>> +			regardless whether breakpoints and watchpoints are programmed
>> +			or not. This prevents debug exceptions from being enabled via
>> +			MDSCR_EL1 register.
> 
> Hmm. I appreciate the effort to document this, but I'm not sure that the
> text above is really going to help anybody.
> 
> Firstly, this option goes hand-in-hand with a debugfs control
> ("debug_enabled") and so the two would ideally be documented together.

Completely agree on this, but could find an appropriate Documentation/
file listing arm64 platform relate debugfs interfaces. Just wondering
if we need to have such a file created in Documentation/arch/arm64 ?

> 
> Secondly, I think the documentation should talk about the user-visible
> effects that the control has... and that's where I get stuck! This has
> been there since day 1 but I'm not really sure what it's useful for. I

Hmm, alright. I tried to reason about what is being done in the kernel
but as you mentioned above, user visible effects were not very clearly
apparent. But having a kernel command line option without documenting
on what it really does seemed problematic as well.

> _do_ remember needing it to use the DS-5 debugger back in the day, but
> looking at what the option does (it mostly prevents the kernel from
> touching MDSCR_EL1.{MDE,KDE} which effectively disables hardware
> breakpoints and watchpoints for kernel/user and single-step for kernel)

Right, it is an system wide override regardless whether there are any
current users for these break/watch points.

> I don't see why that's relevant for halting debug. The architecture says
> that EDSCR.HDE can be used by the external debugger to enter debug state
> and I don't see anything to suggest that MDSCR_EL1 settings interfere
> with this.

ARM ARM DDI 0487 L.A states that EDSCR.HDE can be used to enable/disable
debug halting with OSLSR_EL1.OSLK = 1. Hence MDSCR_EL1.{MDE,KDE} controls
are not required to disable debug state in kernel.

> 
> Maybe the problem was that the external debugger left a load of live
> breakpoint registers around after detaching, so this was a way to
> suppress those? I don't remember :/

But that would be a bug in the HW, not an expected behaviour - is not it ?

> 
> I wonder if we can remove this?

Yes, we could probably remove both 'nodebugmon' kernel command line option
and 'debug_enabled' debug fs control if EDSCR.HDE is the controller of the
debug state for external debuggers.
