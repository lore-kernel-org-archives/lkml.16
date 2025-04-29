Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0762472AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945122; cv=none; b=SWrvwt8zw+gjgdge++sTpksCxxW2PTu9FZu7Jjp/W+plWacOCgS7aTzdRs/6LHUuvPszJI2wJci/jB1yzu3JeUJ+M7WCtl6JXkdVYzM6pb22/05xwPLKzV1kx328Soa4OxeFm7w3j63YyOV3oPLR9mcKzJzOaLoF7tPfU+xXvMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945122; c=relaxed/simple;
	bh=NuBSriunJki75VP9+4VyqJ5KXuHhAB4EctSKiWzZUJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKU0MIBybSpAfOMf9P2X8kffrGzbRpjNl0F7PTA0XWzi9HGFeagTqwrcYhmtbgKZHZCtRnn1uF6NHIH+fvrOXvt7qMEBXff7FPAe7ju+KWvsl09y1LYadzni9jsaQkR65P2ROlrc6TuBo8IzEJ3PxiGpYG61XqjSardBrvB0W90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF9DF1515;
	Tue, 29 Apr 2025 09:45:12 -0700 (PDT)
Received: from [10.1.25.156] (XHFQ2J9959.cambridge.arm.com [10.1.25.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A832A3F66E;
	Tue, 29 Apr 2025 09:45:18 -0700 (PDT)
Message-ID: <b07c1320-3140-40d3-899b-7c2b6e0d3c18@arm.com>
Date: Tue, 29 Apr 2025 17:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/mm: Implement pte_po_index() for permission
 overlay index
Content-Language: en-GB
To: Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250415054442.2287891-1-anshuman.khandual@arm.com>
 <20250429151134.GB26272@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250429151134.GB26272@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 16:11, Will Deacon wrote:
> On Tue, Apr 15, 2025 at 11:14:42AM +0530, Anshuman Khandual wrote:
>> From: Ryan Roberts <ryan.roberts@arm.com>
>>
>> Previously pte_access_permitted() used FIELD_GET() directly to retrieve
>> the permission overlay index from the pte. However, FIELD_GET() doesn't
>> work for 128 bit quanitites. Since we are about to add support for D128
>> pgtables, let's create a specific helper, pte_po_index() which can do
>> the required mask and shift regardless of the data type width.
> 
> You say:
> 
> "we are about to add support for D128 pgtables"

Providing some context: Anshuman has a private branch that adds D128 pgtable
support to the kernel (it does not yet do this for KVM). I originally created
this patch to fix a bug on that branch, so the "we are about to add ..." comment
really only makes sense in that context.

We are not yet ready to post D128 upstream - there are still a lot of questions
to answer - but Anshuman has been posting some of the reshuffling and cleanups
that prepare the way for D128 where (we think) it makes sense. The aim is to
reduce the diff as much as we can.

> 
> but all I've seen so far are piecemeal patches like this and it's hard
> to know what to do with them, to be honest. Somebody could reasonably
> turn up next week and clean this up to use FIELD_GET() again.
> 
> Grepping around, I also see that the KVM page-table code uses the FIELD_*
> macros on page-table entries, so perhaps we're better off adding support
> for 128-bit types to those instead of trying to avoid them?

I think FIELD_* are always implicitly 64 bit, right? I could be wrong...

But I agree with the overall sentiment; where stuff is clearly crossing over
into KVM, which hasn't been tackled yet, don't post until we have a good view on
what KVM needs.

Thanks,
Ryan

> 
> Will

