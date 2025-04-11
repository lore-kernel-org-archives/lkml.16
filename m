Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A7D29B234
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375060; cv=none; b=J6/Q8ygsElbccqFvbXgPUKfxuUSW9FIed9Jota4E7IpLCmmk0O7Eyr1swBIKsML+oOGubY07GKTS57SX/Fnhxt9VCAvl/zDn4PDMtE5/vdSLVDJ3bZ7KteHk6EO+a5n0VXC7PvNw+sy9juEKiUNKI3hlP3J0xGMD9SEDc+o0SNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375060; c=relaxed/simple;
	bh=K8aOFY0lZAi5uOXMBzfS/Bk2rYtxiD2U8l6dY0mtMkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ovvk6iAhe67Qw2vqEHam/qx6fg4A7A8fGipE3Wz8GAF6+5MN//7aNuPvO09G8iS91jMViAaA/sBmhqRWhssU9VPO8+3CPtttUWa3WNlU9P16uTvJZkq1Lb6S9genLEI3kX85GGYI1h2BhPjb3EmCr5mr4yfLkOhBMgnD8wRV+Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E3F106F;
	Fri, 11 Apr 2025 05:37:37 -0700 (PDT)
Received: from [10.57.72.36] (unknown [10.57.72.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81F003F694;
	Fri, 11 Apr 2025 05:37:31 -0700 (PDT)
Message-ID: <5bad616f-8a62-46f4-9c0c-929f4ab1dde0@arm.com>
Date: Fri, 11 Apr 2025 14:37:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 00/18] pkeys-based page table hardening
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
 <Z_jfGlOEb4Bjl3vO@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z_jfGlOEb4Bjl3vO@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2025 11:21, Ingo Molnar wrote:
> * Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>
>> Performance
>> ===========
>>
>> Caveat: these numbers should be seen as a lower bound for the overhead
>> of a real POE-based protection. The hardware checks added by POE are
>> however not expected to incur significant extra overhead.
>>
>> +-------------------+----------------------------------+------------------+---------------+
>> | Benchmark         | Result Class                     | Without batching | With batching |
>> +===================+==================================+==================+===============+
>> | mmtests/kernbench | elsp-64                          |            0.20% |         0.20% |
>> |                   | syst-64                          |            1.62% |         0.63% |
>> |                   | user-64                          |           -0.04% |         0.05% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/fork      | fork: p:1                        |      (R) 225.56% |        -0.07% |
>> |                   | fork: p:512                      |      (R) 254.32% |         0.73% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/munmap    | munmap: p:1                      |       (R) 24.49% |         4.29% |
>> |                   | munmap: p:512                    |      (R) 161.47% |     (R) 6.06% |
>> +-------------------+----------------------------------+------------------+---------------+
>> | micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 14.80% |    (R) 11.85% |
>> |                   | fix_size_alloc_test: p:4, h:0    |       (R) 38.42% |    (R) 10.47% |
>> |                   | fix_size_alloc_test: p:16, h:0   |       (R) 64.74% |     (R) 6.41% |
>> |                   | fix_size_alloc_test: p:64, h:0   |       (R) 79.98% |     (R) 3.24% |
>> |                   | fix_size_alloc_test: p:256, h:0  |       (R) 85.46% |     (R) 2.77% |
>> |                   | fix_size_alloc_test: p:16, h:1   |       (R) 47.89% |         3.10% |
>> |                   | fix_size_alloc_test: p:64, h:1   |       (R) 62.43% |         3.36% |
>> |                   | fix_size_alloc_test: p:256, h:1  |       (R) 64.30% |     (R) 2.68% |
>> |                   | random_size_alloc_test: p:1, h:0 |       (R) 74.94% |     (R) 3.13% |
>> |                   | vm_map_ram_test: p:1, h:0        |       (R) 30.53% |    (R) 26.20% |
>> +-------------------+----------------------------------+------------------+---------------+
> So I had to look 3 times to figure out what the numbers mean: they are 
> the extra overhead from this hardening feature, measured in system time 
> percentage, right?

These are relative increases compared to the baseline for this series
(described earlier on: 6.15-rc1 + 2 additional series). Real time is
measured, except for kernbench where all 3 measurements are provided.

> So "4.29%" means there's a 4.29% slowdown on that particular workload 
> when the feature is enabled. Maybe add an explanation to the next iteration? :-)

Yes that's right. I thought it was clear from the description above but
evidently I was wrong :) I'll add a "plain text" reading like this one
in the next version. I should also have mentioned which config was used,
namely: defconfig + CONFIG_KPKEYS_HARDENED_PGTABLES=y

- Kevin
