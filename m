Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47A267B00;
	Wed,  9 Apr 2025 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224936; cv=none; b=JZimk2kQlZKkoxI1WWEx3aKue1++kj8qjjTGwrqVVQNVqmEmPgqJEo9jLrONGot06zP5Pyu8+enDRLtfG4JeMWKhEcmZh70RznsNA/5zqQGtG9F3uvibW8pLStR6KPLzhJjXmVb8yxmWefCwUsQmwljvD20iKGAv8KQqSSXfKgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224936; c=relaxed/simple;
	bh=GxzZGa11dJaT5t8KC5rLIIaTWnySj5yNvd0FLyFFcR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEIpkP4KN+/hU5OQ5DRKx35a9aV7piRB6eUYL8Uejo3MOe0FbJFIsJqNHdRBrf0L254BSt/T/rgoLeQWjnpbiC6zd8CXpi3Z9acOUc9AS8kIFeqfE6lc/GRNFtBQxCsdgRvpGcAcY6wOlnNhqSJSXwRq7tscMu9JqV7N8ISJ6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4mVULdU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4mVULdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4552C4CEE8;
	Wed,  9 Apr 2025 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744224936;
	bh=GxzZGa11dJaT5t8KC5rLIIaTWnySj5yNvd0FLyFFcR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4mVULdU986Mk8AfKa1tPWq69WXSXdm95PCbYPqvwPLAGnKa2HTGPqiT+9PjjmWT8
	 XkRIkUUzwCmbidei6NBBBRsA5yBwylyRISOLIOpmZmBhJ4ysVx858o0z5lAONjzZ2M
	 rbvvUmsYRDfaHPWncYrtuiMb+H0Ux4bDOUHsZIQrXr7ArB0UntN0pk10HmImN47FSu
	 4crDFEq42YI2aYg8qcRr1522+4UNApUTDxABFSbMVzWxgXQ+/I4RBcmK4hIoLBQkOT
	 Ti0UMM/s+xna+OdOe4uShuey9fKFjRtpOEtzN06OQdi+esfwQ9LRCDiMEeM5b4HcNt
	 uL1mSALYQ96Sg==
Date: Wed, 9 Apr 2025 20:55:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] x86/cacheinfo: Fixes for CPUID(0x80000005) and
 CPUID(0x80000006)
Message-ID: <Z_bCohmnbteC_eCA@gmail.com>
References: <20250409105429.1048199-1-darwi@linutronix.de>
 <Z_ZdZpJqgeZ16Fwj@gmail.com>
 <Z_Zqkpma-vWgpW3o@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_Zqkpma-vWgpW3o@lx-t490>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> Hi,
> 
> On Wed, 09 Apr 2025, Ingo Molnar wrote:
> >
> > * Ahmed S. Darwish <darwi@linutronix.de> wrote:
> >
> > > While working on the x86-cpuid-db CPUID model on top of the CPUID(2) and
> > > CPUID(4) cleanups at tip/x86/cpu,[*] I've discovered some L1/2/3 cache
> > > associativity parsing issues for the AMD CPUID(4) emulation logic .
> > >
> > > Here are the fixes on top of -rc1.
> >
> > Could you please send these against tip:master?
> >
> > tip:x86/cpu already has your previous series, and I don't see the need
> > to create a version skew between v6.15 and the x86 tree for v6.16.
> >
> 
> Sure, I've just sent v2 over tip:master here:
> 
>    https://lore.kernel.org/lkml/20250409122233.1058601-1-darwi@linutronix.de

Applied, thanks!

	Ingo
