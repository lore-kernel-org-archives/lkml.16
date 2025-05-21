Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1CE264614
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827925; cv=none; b=NN8t1L+Ln0ywkS2zIgcfPMA0cefW6TXpH8kE1sMDFMBTNqSVqeYrbqhTaobFLRam0UXBwMcQjP8gm86ST19msTMFzpM8Dtu2VmopXFHU8pUFrd+92LgetIo3tKN710DJpVeJc9EOvbGg5fPX0o4tLS3+G/EPcAaAwjW/46y+sU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827925; c=relaxed/simple;
	bh=LHmftg48uOSPM9d1ROZ7ItxmnGefyebUpsZpGGD93Z0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fNpn1xgVgqCsDHPtQHJDfQkO4XeWercwsUG2DolkNm4OZm82X4ti5DOdhgRhyXIhUUvxy+YBDyKTH05Ysike/JgOD2MB+TlIgUOzcw9qxe4G+M96xMtthBW1FdHvSb+q+URo3n9YxyjqzflOcAAaoSzHZFZTEFQmOpcCwMI4z7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3598C1515;
	Wed, 21 May 2025 04:45:08 -0700 (PDT)
Received: from [10.57.94.227] (unknown [10.57.94.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4380D3F6A8;
	Wed, 21 May 2025 04:45:18 -0700 (PDT)
Message-ID: <7a1ae902-d97c-41ae-a3e7-5b6258ced1c5@arm.com>
Date: Wed, 21 May 2025 12:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
 ptep_modify_prot_start/commit
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
 <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
In-Reply-To: <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 12:16, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers; in case not, they are implemented
>> as a simple loop over the corresponding single pte helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>

[...]

> 
> I have some general concerns about the correctness of batching these functions.
> The support was originally added by Commit 1ea0704e0da6 ("mm: add a
> ptep_modify_prot transaction abstraction"), and the intent was to make it easier
> to defer the pte updates for XEN on x86.
> 
> Your default implementations of the batched versions will match the number of
> ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
> calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
> of the batch used for modify_prot_start_ptes(). That's a requirement and you've
> met it. But in the batched case, there are 2 differences;
> 
>   - You can now have multiple PTEs within a start-commit block at one time. I
> hope none of the specialized implementations care about that (i.e. XEN).

I had a look; this isn't a problem.

> 
>   - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
> ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
> and according to your docs "PTE bits in the PTE range besides the PFN can
> differ" when calling modify_prot_start_ptes() so R/W and other things could
> differ here.

It looks like powerpc will break if you provide old_pte which has different
permissions to the "real" old_pte, see radix__ptep_modify_prot_commit(). So I
think you need to at least spec modify_prot_start_ptes() to require that all
bits of the PTE except the PFN, access and dirty are identical. And perhaps you
can VM_WARN if found to be otherwise? And perhaps modify
ptep_modify_prot_commit()'s documentation to explcitly allow old_pte's
access/dirty to be "upgraded" from what was actually read in
ptep_modify_prot_start()?

XEN/x86 and arm64 don't care about old_pte.

Thanks,
Ryan

> 
> I'm not sure if these are problems in practice; they probably are not. But have
> you checked the XEN implementation (and any other specialized implementations)
> are definitely compatible with your batched semantics?
> 
