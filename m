Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765AC1A238F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886203; cv=none; b=N0jTZkGtV2N+rqxy0/iCEq5s1fMSSR7eTGsz7ENNKAeg+BurqHt90c7GGscFV/JExUCeE6HpC5NkR3PtWSMs9Vx6Niz1giWdYlHexFyLEIkA7sqot5hhSdmhH8DT648w6ieMMuog0Hbwy9TlYF2UZTAsH/6R96ucH7lBMgSujYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886203; c=relaxed/simple;
	bh=k6s1HMycW/2+Q0ckiJFixRxi79LsTRokwcJ4Iiit0B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBgjtYgg1zs56aoRN8rw8DJ6J0FQrQ0sdCsAe/EI/9i2hU+gX29SewRBcRiXQcY4o0Tj1dBNvKBAhvVe9DsggJrp2mp4NVvx0CpoDveKl2JRcgQyP0ooFxfzFKCISmaBZ1foiOesVCMcGV6zQ0qguhhPL8svnI8Ew1yETt4mdmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3963F15A1;
	Mon,  7 Jul 2025 04:03:08 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 062E13F694;
	Mon,  7 Jul 2025 04:03:19 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:03:17 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 23/23] binfmt_elf: Warn on missing or suspicious regset
 note names
Message-ID: <aGupdb+eEwnoto4/@e133380.arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
 <20250701135616.29630-24-Dave.Martin@arm.com>
 <D620FCC4-4A72-45CB-AF16-456E2B49B5C8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D620FCC4-4A72-45CB-AF16-456E2B49B5C8@kernel.org>

On Sat, Jul 05, 2025 at 08:14:33AM -0700, Kees Cook wrote:
> 
> 
> On July 1, 2025 6:56:16 AM PDT, Dave Martin <Dave.Martin@arm.com> wrote:
> >Un-migrated arches will trigger WARNs with this patch applied, and
> >arches that don't specify codedump note names will always get
> >"LINUX" -- since the whole point is to stop guessing the note name in
> >the core code.
> >
> >On _unpatched_ arches (only) this is a potential ABI break for the
> >NT_PRFPREG note (which, for historical reasons, is a "CORE" note even
> >though it is OS-specific on most or all arches).
> 
> After all your arch patches, aren't all the archs using the correct
> values? Is the WARN for new or out-of-tree archs?
> 
> -Kees

[...]

If there are in-flight series where someone adds a new arch (?) or more
likely adds a new regset to an existing arch, then we might hit this.

In practice, all per-arch regsets apart from NT_PRFPREG use the name
"LINUX", so defaulting to this if the name is not specified will hardly
ever be a problem -- unless there really is a new arch out of tree that
is going to merge imminently.

I'm happy to simplify the check here if people prefer.

Cheers
---Dave
