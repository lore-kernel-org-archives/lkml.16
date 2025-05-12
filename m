Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBAF1DB346
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064081; cv=none; b=vEX0LdUnqOTfhDsR9RFohhQODpiKlL4aXf+gbD8yFflzS7uhNXuFzoQk/bEIdLiU7cnXMhAnN2kK2zZ3feYSauQLs5/o7iDm3Ff4goDD73edJjgQ+k51Bd4FHt5QDjPa1PZ7E9+OjK8eaNYvwhSiHeoLZsVog1dxT9DmQUObNqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064081; c=relaxed/simple;
	bh=vn6X8kfk8KLhiRNCeU8et9vapzolDu7blq28rCHKTsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7IqNLzzwpzSK0JMrJi8RadVWjDGIMaLhr4Mi/NapE9ZSk61QDfiC7Rntl6lRXcvMc+iWl+sqqLufx8Lb7CNSPSEvVAs5s0O/UiWW/IFGKG+VlYMM8i8Lo2V/p5maZeq8AIPwDwU9cKzp3iJ3X2IiPPKYp/Uvz07Tr2KUaaWaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C3F214BF;
	Mon, 12 May 2025 08:34:28 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBEEE3F63F;
	Mon, 12 May 2025 08:34:37 -0700 (PDT)
Date: Mon, 12 May 2025 16:34:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
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
> 
> | Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
> | from ARMv8 and are now considered to be UNKNOWN.
> | 
> | Since the kernel doesn't make use of set/way cache maintenance and it is
> | not possible for userspace to execute these instructions, we have no
> | need for the CCSIDR information in the kernel.
> 
> Actually, these parameters are directly visible (and useful) to
> userspace in the form of the cache size. Rather than make userspace
> perform benchmarks, we can expose this information in a standard way.

Yes that is already present, which is DT or ACPI.

> There is of course [id]cache-size, but these properties are absent more
> often than not:
> 
> $ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
> 1248
> $ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
> 320
>

Just to be clear, I am fine with exposing to the userspace, but just
not reading those registers as stated in the commit message I shared
earlier.

Why can't it be done via DT/ACPI ?

-- 
Regards,
Sudeep
