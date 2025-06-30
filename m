Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5707084A2B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280358; cv=none; b=UwVsITFZItx5aeIIe8KNYJMnQLKq21VxBx7F04pxcpJlrbTF1Vf42aEPE+2PlJ98/2QhQalLIgk65WJzvf1mrNP2MYkGR6pvlyIkT1DZRlmEAkJkoCasKohydPbbAntRbt0cfIN8NuSjJ2Os+F1DoDBf3DjDAaQkWMMNkG+NhuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280358; c=relaxed/simple;
	bh=ckfqOjrElKSUbuKeCm9a1f9djSvgw3q0SgTJaaFcTAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5NuZFkiCES/xnc77rFjn9BlQlJnbMr4N81AeLUzcsJtsk+MTY4HRGJgDSSa4Pl3h8s7E6QgflW7ex1EONWeKQ4zEb+Hv1V/qJhiC7i5T+9+yStLdM7xivwRMTWnHYa1bIE9qIkJAArIXQ/z+RPzgkNubRo6Iw8YYgn+4xv8Bo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8E0B1F60;
	Mon, 30 Jun 2025 03:45:40 -0700 (PDT)
Received: from [10.1.34.165] (XHFQ2J9959.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A96E03F58B;
	Mon, 30 Jun 2025 03:45:52 -0700 (PDT)
Message-ID: <7eaee53b-d538-4991-addd-379a380b8ee2@arm.com>
Date: Mon, 30 Jun 2025 11:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
 <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <29f418be-31c4-47b0-bcac-3375f57d00e7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2025 04:33, Dev Jain wrote:
> 
> On 30/06/25 4:35 am, Andrew Morton wrote:
>> On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:
>>
>>> This patchset optimizes the mprotect() system call for large folios
>>> by PTE-batching. No issues were observed with mm-selftests, build
>>> tested on x86_64.
>> um what.  Seems to claim that "selftests still compiles after I messed
>> with stuff", which isn't very impressive ;)  Please clarify?
> 
> Sorry I mean to say that the mm-selftests pass.

I think you're saying you both compiled and ran the mm selftests for arm64. And
additionally you compiled for x86_64? (Just trying to help clarify).


> 
>>
>>> We use the following test cases to measure performance, mprotect()'ing
>>> the mapped memory to read-only then read-write 40 times:
>>>
>>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>>> pte-mapping those THPs
>>> Test case 2: Mapping 1G of memory with 64K mTHPs
>>> Test case 3: Mapping 1G of memory with 4K pages
>>>
>>> Average execution time on arm64, Apple M3:
>>> Before the patchset:
>>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>>
>>> After the patchset:
>>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
>> Well that's tasty.
>>
>>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>>> introduced by ptep_get() on a contpte block. And, for large folios we get
>>> an almost 74% performance improvement, albeit the trade-off being a slight
>>> degradation in the small folio case.
>>>

