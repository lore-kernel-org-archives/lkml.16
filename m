Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D09528D8FD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795730; cv=none; b=S/CX25HDqWF2/l7MydyTHAG65in3BmiCIf1ckzjerH6Au9HV4W0zeH/LK9Ve4FvDy1sUqiExP/tCpo69Og0MIN1z2JPiV/oaDzhdfsS8E6LrQQrwhVNqOk9nA/WX+JxFc+oqvZeo2SQ51knYOSMUNEv/hG/yxKPMSoH+1GqlNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795730; c=relaxed/simple;
	bh=Kze0SyEYvQc8SDRBVeNXW/G/mCAizeF6tVAMrvRPVhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQm4CjU1rWtteRs43vHoGZaCOIEfy/UPzYlFtIkfxAVUygfhmfZtG2F1Ka2TFVwsjwCjbQ08y2iZ+IzOyg4RKNHFnz5m1tFOHRdlBlB1NDHiOtFCXDAHC2E8aKWtJA+Ty6S9v0rJ+bnwO/27PReWEyxpTY2702rQo/ROlwhEOi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B18BA1595;
	Fri,  9 May 2025 06:01:56 -0700 (PDT)
Received: from [10.57.90.222] (unknown [10.57.90.222])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87F603F58B;
	Fri,  9 May 2025 06:02:05 -0700 (PDT)
Message-ID: <2ad910f4-6930-4da2-aa2b-f3875f71e001@arm.com>
Date: Fri, 9 May 2025 14:02:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250321130635.227011-1-alexghiti@rivosinc.com>
 <4dd5d187-f977-4f27-9937-8608991797b5@ghiti.fr>
 <64409a13-1c07-42cd-b1ec-572042738f1b@arm.com>
 <84cb893a-46e3-408a-ba0e-2eff0b44d2a1@ghiti.fr>
 <20250508123046.GA3706@willie-the-truck>
 <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAHVXubjZB-riBLv+RGis6ErS8NvU4ijVTgvUO06fTxPhbEjXfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 12:09, Alexandre Ghiti wrote:
> Hi Will,
> 
> On Thu, May 8, 2025 at 2:30 PM Will Deacon <will@kernel.org> wrote:
>>
>> Hi folks,
>>
>> On Mon, May 05, 2025 at 06:08:50PM +0200, Alexandre Ghiti wrote:
>>> On 29/04/2025 16:09, Ryan Roberts wrote:
>>>> On 07/04/2025 13:04, Alexandre Ghiti wrote:
>>>>> Can someone from arm64 review this? I think it's preferable to share the same
>>>>> implementation between riscv and arm64.
>>>> I've been thinking about this for a while and had some conversations internally.
>>>> This patchset has both pros and cons.
>>>>
>>>> In the pros column, it increases code reuse in an area that has had quite of few
>>>> bugs popping up lately; so this would bring more eyes and hopefully higher
>>>> quality in the long run.
>>>>
>>>> But in the cons column, we have seen HW errata in similar areas in the past and
>>>> I'm nervous that by hoisting this code to mm, we make it harder to workaround
>>>> any future errata. Additionally I can imagine that this change could make it
>>>> harder to support future Arm architecture enhancements.
>>>>
>>>> I appreciate the cons are not strong *technical* arguments but nevertheless they
>>>> are winning out in this case; My opinion is that we should keep the arm64
>>>> implementations of huge_pte_ (and contpte_ too - I know you have a separate
>>>> series for this) private to arm64.
>>>>
>>>> Sorry about that.
>>>>
>>>>> The end goal is the support of mTHP using svnapot on riscv, which we want soon,
>>>>> so if that patchset does not gain any traction, I'll just copy/paste the arm64
>>>>> implementation into riscv.
>>>> This copy/paste approach would be my preference.
>>>
>>>
>>> I have to admit that I disagree with this approach, the riscv and arm64
>>> implementations are *exactly* the same so it sounds weird to duplicate code,
>>> the pros you mention outweigh the cons.
>>>
>>> Unless I'm missing something about the erratas? To me, that's easily fixed
>>> by providing arch specific overrides no? Can you describe what sort of
>>> erratas would not fit then?

One concrete feature is the use of Arm's FEAT_BBM level 2 to avoid having to do
break-before-make and TLB maintenance when doing a fold or unfold operation.
There is a series in flight to add this support at [1]. I can see this type of
approach being extended to the hugetlb helpers in future.

I also have another series in flight at [2] that tidies up the hugetlb
implementation and does some optimizations. But the optimizations depend on
arm64-specific TLB maintenance APIs.

[1]
https://lore.kernel.org/linux-arm-kernel/20250428153514.55772-2-miko.lenczewski@arm.com/

[2]
https://lore.kernel.org/linux-arm-kernel/20250422081822.1836315-1-ryan.roberts@arm.com/

As for errata, that's obviously much more fuzzy; there have been a bunch
relating to the MMU in the recent past, and I wouldn't be shocked if more turned up.

For future architecture enchancements, I'm aware of one potential feature being
discussed for which this change would likely make it harder to implement.

>>
>> If we start with the common implementation you have here, nothing
>> prevents us from forking the code in future if the architectures diverge
>> so I'd be inclined to merge this series and see how we get on. 

OK if that's your preference, I'm ok with it. I don't have strong opinion, just
a sense that we will end up with loads of arch-specific overrides. As you say,
let's see.

Alexandre, I guess this series is quite old now and will need to incorporate the
hugtelb fixes I did last cycle? And ideally I'd like [2] to land then for that
to also be incorporated into your next version. (I'm still hopeful we can get
[2] into v6.16 and have been waiting patiently for Will to pick it up ;) ).

I guess we can worry about [1] later as that is only affected by your other series.

How does that sound?

>> However,
>> one thing I *do* think we need to ensure is that the relevant folks from
>> both arm64 (i.e. Ryan) and riscv (i.e. Alexandre) are cc'd on changes to
>> the common code. Otherwise, it's going to be a step backwards in terms
>> of maintainability.
>>>> Could we add something to MAINTAINERS so that the new file picks you both
>> up as reviewers?

That's fine with me. Lorenzo added me for some parts of MM this cycle anyway.

Thanks,
Ryan

> 
> I'm adding Lorenzo as he is cleaning the mm MAINTAINERS entries.
> 
> @Lorenzo: should we add a new section "CONTPTE" for this? FYI, hugetlb
> is the first patchset, I have another patchset to merge THP contpte
> support [1] as well so the "HUGETLB" section does not seem to be a
> good fit.
> 
> [1] https://lore.kernel.org/linux-riscv/20240508191931.46060-1-alexghiti@rivosinc.com/
> 
> Thanks,
> 
> Alex
> 
>>
>> Will

