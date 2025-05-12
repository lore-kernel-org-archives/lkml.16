Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3009DB672
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064247; cv=none; b=Vbon9awt6WingiQ3qddymGw/SqjdI0tet8kafGusy7ZWnZ088R42er94fPDHBOUAw4F6b7HwYIC0AQSDafYGrW/q4oAMWV0egEgcO6BaS50SK4xVHpzBWypp68yT7L7g8ZydNcqbB+qOFQVsvfMC3ubweaFH8UFvEyUUgJBC5PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064247; c=relaxed/simple;
	bh=CSGL7fJhJ9GHHwnEaJ9xRGo2VYSo1ROa7Uc5Ss5VWgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faP6xWwoPU/FvuReEPcHlDOtC9rp1q3TB8L3NbeNPXH8RuhX6luDOgNdBHAMBkaezRCRn2qwofwL2zfyGhKcUlRTwKBw1kpvM8xz1c3bA8yVGFHbWROb8NQd9WgJrHq8a9FYxlCohZ9lWlkQqUv743sorfQx/N0OmLglZekpSro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69A1014BF;
	Mon, 12 May 2025 08:37:13 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE4AA3F63F;
	Mon, 12 May 2025 08:37:22 -0700 (PDT)
Date: Mon, 12 May 2025 16:36:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <aCIVec7zl3tIh73h@J2N7QTR9R3>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>

On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> On 5/10/25 03:04, Sudeep Holla wrote:
> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> Cache geometry is exposed through the Cache Size ID register. There is
> >> one register for each cache, and they are selected through the Cache
> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> >> CCSIDR changes to allow a larger number of sets and ways.
> >> 
> > 
> > Please refer
> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> > 
> 
> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
> | in conjunction with set/way cache maintenance and are not guaranteed to
> | represent the actual microarchitectural features of a design.
> | 
> | The architecture explicitly states:
> | 
> | | You cannot make any inference about the actual sizes of caches based
> | | on these parameters.
> 
> However, on many cores (A53, A72, and surely others that I haven't
> checked) these *do* expose the actual microarchitectural features of the
> design. Maybe a whitelist would be suitable.

Then we have to maintain a whitelist forever, and running an old/distro
kernel on new HW won't give you useful values unless you provide
equivalent values in DT, in which case the kernel doesn't need to read
the registers anyway.

The architecture explcitly tells us not to use the values in this way,
and it's possible to place the values into DT when you know they're
meaningful.

I do not think we should resurrect the usage of these registers.

Mark.
