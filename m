Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E22367A8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635750; cv=none; b=QjDKyyq7KrjBMNs7PVJWTnvK+E6HqYa8LfIZXjis4RU62Az5F2QZGGddpLwFmNroPE4df3TtEWyHdcGlq9UW1YhfsJeJljonWrCZDTbSmZ6MNp8rm26edZOKW13qJ3RrfyBKh4pNbMhSKu82n6rEf2JSrFQQSPehniNYwCCXo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635750; c=relaxed/simple;
	bh=jS4uqnsrbb0Bec/mD8kNEClOeTZSwS0qkXLSDWD/rBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2+FhU+36qoQFFke5yGPaUQaPISJuVcmULDuxEiHSqCXb9KqzW6UDifCFVFub9wgXT/r8R87dumTfddvXmAWR1U4eJK5qSHqVoPwUQVAL+GGiifUg50gEFnQ5Mid1sZmCl1aZU2MSBPx7IL/DGIIWIedUoFXpfMsCkt0+xAR9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B8841596;
	Wed, 11 Jun 2025 02:55:29 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E54C3F673;
	Wed, 11 Jun 2025 02:55:47 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:55:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Message-ID: <aElRi0Usn8dH6O4m@J2N7QTR9R3>
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-2-anshuman.khandual@arm.com>
 <aEhnzsXHfilVhJ1s@J2N7QTR9R3>
 <68d762d4-a755-4ede-976b-0616bf3aab28@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68d762d4-a755-4ede-976b-0616bf3aab28@arm.com>

On Wed, Jun 11, 2025 at 09:10:45AM +0530, Anshuman Khandual wrote:
> 
> 
> On 10/06/25 10:43 PM, Mark Rutland wrote:
> > On Tue, Jun 10, 2025 at 11:01:27AM +0530, Anshuman Khandual wrote:
> >> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> >> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> >> macros become redundant and hence can be dropped off completely. While here
> >> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> >> true width as well.
> > 
> > I think that for now it'd be best to *only* change over to the
> > generated MDSCR_EL1_* defintions, and leave the register sizes as-is.
> 
> I had tried doing that originally but without changing mdscr register size,
> there is a build warning because MDSCR_EL1_MDE is defined as GENMASK(15, 15)
> which is represented as 'long unsigned int'.
> 
> #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> 
> arch/arm64/kernel/debug-monitors.c: In function ‘disable_debug_monitors’:
> arch/arm64/kernel/debug-monitors.c:108:13: warning: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709518847’ to ‘4294934527’ [-Woverflow]
>   108 |   disable = ~MDSCR_EL1_MDE;
>       |             ^

Please mention that in the commit message. As-is, the commit message has
no rationale for changing to u64.

More generally, if you need to make a change to avoid a compiler
warning, please describe that as part of the rationale.

> MDSCR_EL1 is a 64 bit system register as per ARM DDI 0487 L.A (D24.3.20).
> Representing it as u32 does not seem right irrespective of whether the
> extended break point support is enabled or not. Besides even arm64 kvm
> uses u64 for mdscr register.

Sure, but that wasn't my complaint.

My complaint was that it was a logically unrelated change, because you
had provided no rationale as for why it was necessary to change to u64
as a conseqeunce of changing to the generated MDSCR_EL1_* definitions.

Please also note that *almost all* system registers have the
"${REGISTER} is a 64-bit register wording", including things like DAIF,
SPSel, etc. It's necessary to consider the context of use.

Mark.
