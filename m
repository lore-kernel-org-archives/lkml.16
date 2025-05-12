Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4272422A1E5
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065132; cv=none; b=pJqkj9bfXOajTQECVMOhovztHos8QmvDdGT+pEdJu/8iwUCxVuJrvYSX/NMrPMJi5lq3Aygh74NEgkHAnA2XwBk8Q/FQrPUXG9jFXcbVkld+8b+yBta1ad20556lfHmLYmUoEl4ULE6LjJ2qFan4UBQK6OhMtTfKOS5EOE+onzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065132; c=relaxed/simple;
	bh=hs9+KggMp/U099qUIV+eyLEDo/uHUutOdEs9dFGzZOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us+8zzNGWERGcTDahlQKw6bt3pZt4KE4mR6jyotkTG1yyhLYjkZ1xGAlCWCS4F3bXNEqzczNGcPg2XU+wdkzb+c6GGNyGaT03jLtdd75ayb4yGE8eVDGpEJaGhRhnNaKu9qEnJSwCNKhmAM25VFeO4tE21ixieIZSL/qXFFhQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pciWP+l0; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pciWP+l0"
Message-ID: <6d43f466-5786-4957-86c8-8297aa739030@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747065128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bQK9BG+j/hEhpu8hZi8th8YhOfeYv7OqsnL+EJuFLtI=;
	b=pciWP+l0iQhMy02PYIChZa5nE48TTtrzBTyWxtlMx62kQYXCqczinCMiKQOby7j7FI4QCr
	oWhVwEMkwG/ZjThwcIQ9gsEB/nmd/15Ss1qfyaxQYbRE/L/gsvv75bMs6GLR/mLaEus5h5
	mVbDPY1qIuhagBGUqDpPeHZJViv9pcs=
Date: Mon, 12 May 2025 11:52:02 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Radu Rendec <rrendec@redhat.com>,
 Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/12/25 11:34, Sudeep Holla wrote:
> On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
>> On 5/10/25 03:04, Sudeep Holla wrote:
>> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
>> >> Cache geometry is exposed through the Cache Size ID register. There is
>> >> one register for each cache, and they are selected through the Cache
>> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
>> >> CCSIDR changes to allow a larger number of sets and ways.
>> >> 
>> > 
>> > Please refer
>> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
>> > 
>> 
>> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
>> | in conjunction with set/way cache maintenance and are not guaranteed to
>> | represent the actual microarchitectural features of a design.
>> | 
>> | The architecture explicitly states:
>> | 
>> | | You cannot make any inference about the actual sizes of caches based
>> | | on these parameters.
>> 
>> However, on many cores (A53, A72, and surely others that I haven't
>> checked) these *do* expose the actual microarchitectural features of the
>> design. Maybe a whitelist would be suitable.
>> 
>> | Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
>> | from ARMv8 and are now considered to be UNKNOWN.
>> | 
>> | Since the kernel doesn't make use of set/way cache maintenance and it is
>> | not possible for userspace to execute these instructions, we have no
>> | need for the CCSIDR information in the kernel.
>> 
>> Actually, these parameters are directly visible (and useful) to
>> userspace in the form of the cache size. Rather than make userspace
>> perform benchmarks, we can expose this information in a standard way.
> 
> Yes that is already present, which is DT or ACPI.
> 
>> There is of course [id]cache-size, but these properties are absent more
>> often than not:
>> 
>> $ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
>> 1248
>> $ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
>> 320
>>
> 
> Just to be clear, I am fine with exposing to the userspace, but just
> not reading those registers as stated in the commit message I shared
> earlier.
> 
> Why can't it be done via DT/ACPI ?
> 

Well, do you want to go through 200 SoCs and look up cache info in the
documentation? I think it would be more expedient to look at the TRMs
for two dozen cores and determine if the above registers expose the cache
info correctly.

--Sean
