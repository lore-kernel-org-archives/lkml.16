Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF5278140;
	Wed,  9 Apr 2025 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224777; cv=none; b=TzaVo/C3gs4FKK5kKunZWw1RoDWWF5z3MF7UUyoOD5rAzv0AV0KYiAN5hWnH1YyZEUeaweKbk4q8PvvFJAIe3HINaUS+hjmdFN/ZcPatqg7pLNhiQZ6jpqNpmkau4GUNoO/qMY+B1Sz60nGOIUWRbtInTKlEQC0GMYF4MRVOXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224777; c=relaxed/simple;
	bh=5i1oMW/PxJo8IGsBtUHGwIqfWeGBp5ZC4nCXduHQAdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUwi69aJup2bcgBA1EG+KUf+zTjNT23rwiOTHiM9ugJKdvlyDDi8Q0o8dMjraZVNR7rhNPcONQDXRmGfbMi5gdTn5y1ekMP8mky3HUvMv7cN2cGqkhkpLRjYm8ZGTCPx6/s6uEKqks5Bvx5316vxG99Iqoe96nQDpzs0+s+kkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOfyG7PD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOfyG7PD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AC2C4CEE2;
	Wed,  9 Apr 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744224777;
	bh=5i1oMW/PxJo8IGsBtUHGwIqfWeGBp5ZC4nCXduHQAdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOfyG7PDBZX3we7FQFstC56mPPXAykM+j5NntmYBOMqa8g5iwCPLLoE8pvkrwTRsG
	 DbjErxAL+c/aVy+9xgBfbSYYICzttEkmh8rdbvxzBVDFYmnqE8VdSvdI+g0c8mNZse
	 FBVisHsQgQ5egKob3v4SshMvSYOMophejaWbaA0Qgnm0ZRibtPzW4x1tileqXOYPHi
	 pUviOvWlV7DSS40ewBSdXq8DxMctZBf2AFccvlzL80XBj1IIrT6j+ikMC5eD1Kvn39
	 116CB8cK1KyV5xcg7JaTNA1WUYnMFLhSBnbFnImGbWQ2KHz2Y7tcR3YYWaKULJh/Ee
	 tHo9iBJrJeQ5w==
Date: Wed, 9 Apr 2025 20:52:51 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] x86/cacheinfo: Properly parse CPUID(0x80000005)
 L1d/L1i associativity
Message-ID: <Z_bCA8788lrr-NdB@gmail.com>
References: <20250409122233.1058601-1-darwi@linutronix.de>
 <20250409122233.1058601-2-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122233.1058601-2-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> For the AMD CPUID(4) emulation cache info logic, the same associativity
> mapping array, assocs[], is used for both CPUID(0x80000005) and
> CPUID(0x80000006).
> 
> This is incorrect since per the AMD manuals, the mappings for
> CPUID(0x80000005) L1d/L1i associativity is:
> 
>    n = 0x1 -> 0xfe	n
>    n = 0xff		fully associative
> 
> while assocs[] maps these values to:
> 
>    n = 0x1, 0x2, 0x4	n
>    n = 0x3, 0x7, 0x9	0
>    n = 0x6		8
>    n = 0x8		16
>    n = 0xa		32
>    n = 0xb		48
>    n = 0xc		64
>    n = 0xd		96
>    n = 0xe		128
>    n = 0xf		fully associative
> 
> which is only valid for CPUID(0x80000006).
> 
> Parse CPUID(0x80000005) L1d/L1i associativity values as shown in the AMD
> manuals.  Since the 0xffff literal is used to denote full associativity
> at the AMD CPUID(4)-emulation logic, define AMD_CPUID4_FULLY_ASSOCIATIVE
> for it instead of spreading that literal in more places.
> 
> Mark the assocs[] mapping array as only valid for CPUID(0x80000006) L2/L3
> cache information.
> 
> Fixes: a326e948c538 ("x86, cacheinfo: Fixup L3 cache information for AMD multi-node processors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

Yeah, so a Cc: stable tag is usually reserved for recent regressions, 
or critical fixes - but this is a bug from 2009, ~16 years old. This 
bug is old enough to receive a driving license in the US, and can 
legally buy beer or wine in Germany.

So I've removed the tags from the two commits in tip:x86/cpu, but note 
that the Fixes tag itself will give backporters enough information so 
they can decide on whether to backport. Greg's -stable process 
typically processes all Fixes tags for example, once Linus pulls this 
into v6.16-to-be.

Thanks,

	Ingo
