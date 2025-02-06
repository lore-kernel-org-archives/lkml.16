Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E6522CBCB
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843180; cv=none; b=s+RnsbEmGEz35LLf0ItsqVlUHrVfskyxqPXowAIddm1qQzOfR3fWKSlVup1BYmPRODUGATdth+pidzJQK4EYU91trzGeGarEoKTUoK+tkfKqcZlLsO94EHZ7PYg59rFy9CB+Jhu7xDwSXNQ4bALvEGlFhEmhJEM+WIIG1dyQFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843180; c=relaxed/simple;
	bh=14voOlX2mZun5mhrxgL/xuVpLxVjNxFu1AAWGDtNiQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inAHkCcHKqOmBZyOvCB/zZR2fNTGJAvOOqSMs7TUFcPAd0FJkm449j/ehyLo2vrLS/SvADBKHg64i0keEjzApxbzhn0SLAnHbvVKiAGGuO5fUoGCJ1lqIq/HPsRtmZvFkEN7XhX5O1d9IiJPjVKC7i/QmQgw9E2RQ87YholLLHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BBD312FC;
	Thu,  6 Feb 2025 04:00:00 -0800 (PST)
Received: from [192.168.68.112] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A5253F63F;
	Thu,  6 Feb 2025 03:59:35 -0800 (PST)
Message-ID: <b0a6ccd0-205d-42d8-9b98-6efb34c117e4@arm.com>
Date: Thu, 6 Feb 2025 11:59:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/16] hugetlb and vmalloc fixes and perf improvements
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250205235219.3c3a4b968087d1386d708b04@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2025 07:52, Andrew Morton wrote:
> On Wed,  5 Feb 2025 15:09:40 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>>  I'm guessing that going in
>> through the arm64 tree is the right approach here?
> 
> Seems that way, just from the line counts.
> 
> I suggest two series - one for the four cc:stable patches and one for
> the 6.14 material.  This depends on whether the ARM maintainers want to
> get patches 1-4 into the -stable stream before the 6.14 release.

Thanks Andrew, I'm happy to take this approach assuming Catalin/Will agree.

But to be pedantic for a moment, I nominated patches 1-3 and 13 as candidates
for stable. 1-3 should definitely go via arm64. 13 is a pure mm fix. But later
arm64 patches in the series depend on it being fixed. So I wouldn't want to put
13 in through mm tree if it means 14-16 will be in the arm64 tree without the
fix for a while.

Anyway, 13 doesn't depend on anything before it in the series so I can gather
the fixes in to a series of 4 as you suggest. Then the improvements become a
series of 12. And both can go via arm64?

I'll gather review comments then re-post as 2 series for v2; assuming
Will/Catalin are happy.

Thanks,
Ryan
