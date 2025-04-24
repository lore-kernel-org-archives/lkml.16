Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5F91B07AE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515369; cv=none; b=bjcMsTWdsau18CNcbQoCCnYJGRf8A9THe8TDxP0FTY60cn9/betY2UooKPJ3Wc0zZcBQ+fmdTlo2OyKU4LBVqVEkLE6kfBgTtic60fdnxhl1CGnDHojFpE2vF+emM68Kn8hBX5om1XXLCWCMKB3mM76Y1MLzLOqbEZRl5t3QQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515369; c=relaxed/simple;
	bh=wNCA99uLbH6Usp1b0F2kMpJij0jGAdtkZultGNQqhuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m07ohfUJRYiqsKALO1agJyNIOJjPwT6YGLQVGnHoWeDcACTT7QHwOxOLEmt/mbM8h/uO0LJMu51tOgz89zwmzlCBFpRJV0Rn+edth47Z/getvgF7LIhu2GxZhF6jmQ3fThkHtBP7M6mgQc9Mr9fbCiVezP4uq6AZvI/4lI2yXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EBA1063;
	Thu, 24 Apr 2025 10:22:42 -0700 (PDT)
Received: from [10.1.196.43] (eglon.cambridge.arm.com [10.1.196.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4D23F66E;
	Thu, 24 Apr 2025 10:22:46 -0700 (PDT)
Message-ID: <7681f92a-047b-4722-8cac-2f269ae10a45@arm.com>
Date: Thu, 24 Apr 2025 18:22:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>,
 Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <240d0962-b381-479f-b3ed-4e6ce72d6570@intel.com> <aAmr-FktkJiI-bxd@yury>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <aAmr-FktkJiI-bxd@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Yury,

On 24/04/2025 04:11, Yury Norov wrote:
> On Wed, Apr 23, 2025 at 02:27:46PM -0700, Reinette Chatre wrote:
>> On 4/7/25 8:38 AM, Yury Norov wrote:
>>> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>>>
>>> cpumask library missed some flavors of cpumask_any_but(), which makes
>>> users to workaround it by using less efficient cpumask_nth() functions.
>>>
>>> Yury Norov (4):
>>>   relax cpumask_any_but()
>>>   find: add find_first_andnot_bit()
>>>   cpumask_first_andnot
>>>   resctrl
>>
>> (sidenote: above list of patch subjects do not match the series)
>>
>> Thank you very much for doing this work. This simplifies resctrl code
>> significantly. I do have a couple of comments that you will find in
>> the individual patches. 
> 
> Sure, glad to see you like it.
>  
>> Regarding upstreaming I would like to propose that the upstreaming of
>> this work be split so that resctrl changes do not go upstream
>> via separate trees during this cycle. I am ok with delaying the resctrl
>> portion of this work for a cycle. This is because we hope to include a
>> huge change [1] to resctrl that includes the code modified in this series.
>> Having these two changes meet during merge window will be inconvenient
>> for maintainers involved. If you require a user to upstream these new
>> helpers then another possibility is to upstream this work via the tip repo
>> if that is ok with x86 maintainers so that that huge resctrl patch is created on
>> top if this work.

> I can move all the patches with my branch (bitmap-for-next) if you ack
> the restcl part, or let resctl folks (you, I guess) take over the series.

> Or we can split it, so I'll move generic part myself, and you'll move
> the last patch.

That would mean co-ordinating the order those get merged in, which is extra work for the
relevant maintainers.

The patch that moves all the code is easy to regenerate as this series doesn't add any new
functions. Ideally any series touching resctrl in the same merge window would also go via
tip - but it would also possible to rebase onto an immutable branch. (needed if
bitmap-for-next also has dependencies/conflicts on these patches)

I think its easier for the tip folk if I rebase onto this once as/when its got all the
needed tags.


Thanks,

James
