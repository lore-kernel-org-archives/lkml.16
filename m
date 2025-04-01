Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA823BBC9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743493681; cv=none; b=Z7kddgCSzrqB2vDIx9Px+t7gDZwzbxMu9PzLHbL/gXU9a6ZsBu8dEbLuz0zHpdcwmsD+Kd4UMD5k3Phkj/tY+8NHtfI9O7AzW+19FnpbDOOKtlLw2v/MiquWSBMhj9iZX4OZ89OKTM5fC2gmlXLKe2iTeSiOMItguqCdQaxIW4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743493681; c=relaxed/simple;
	bh=cJC/ukGT4MWeRvxdr5QC9pG2QNBmUmxjo4YcWGdilRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qcBYjN5pLMInFUx1GZTfEgGqgn7zCvtKsfEVWOn72/UR40x25ZXrmfjWdHWSUM1bqAFgWJRctsQiL0wgDHP6otEojToRJqcsWdWBEkOQXcTL5wBEADxxcYSnpx8Hn+TwghOoD0YcFcCX3cXz4VWMwvmOqR9ahrnUFNsacPBiiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6B514BF;
	Tue,  1 Apr 2025 00:48:01 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CEE73F694;
	Tue,  1 Apr 2025 00:47:56 -0700 (PDT)
Message-ID: <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
Date: Tue, 1 Apr 2025 13:17:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
>>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>>> instructions; it returns NULL otherwise. When that's the case, signal to
>>> the caller that it needs to proceed with the regular alignment fault
>>> handling (i.e. SIGBUS).
>>>
>>> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
>>> ---
>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
>>> index deff21bfa680..b68e1d328d4c 100644
>>> --- a/arch/arm64/kernel/compat_alignment.c
>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>>>  		return 1;
>>>  	}
>>>  
>>> +	if (!handler)
>>> +		return 1;
>>
>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
>> the right thing to do here and consistent. Otherwise does this cause a
>> kernel crash during subsequent call into handler() ?
> 
> Yes. We call a NULL pointer so we Oops.

Then the commit message should have the kernel Oops splash dump and also
might need to have Fixes: and CC: stable tags etc ?

Also wondering if handler return value should be checked inside the switch
block just after do_alignment_t32_to_handler() assignment.

	handler = do_alignment_t32_to_handler()
	if (!handler)
		return 1
