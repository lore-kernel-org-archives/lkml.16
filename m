Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A577F1EFF93
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364653; cv=none; b=fczz+LJ8AD+OxgLNhl7u9e6ahPeB1wkAs0jBPUVd6O6pqGlQtYjTGdy3j2Y3Dq4p+S1WF/iyiY6PNoj2eVt4lGvb3prx5LuouWd9VNOw+ssIqXDvIsBlSctk5G2BSVdgCL776RhFS83gQ+XCFfg8LibRv2Mo0xcY7VLwVhWJ2eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364653; c=relaxed/simple;
	bh=cQlJQWMR1vpM4VqDeSr2vhN4E6SlND+oqKZ9malEpBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDqEpzW5LBAHmYM0xAMej4898p8KVeu4LNEJaIV7LT0vpiGbMgG/UjjV3nOgOKq2u45Wrt/ObZEGKfwwjdjVs/B+0lFuGCsdJa/ZXiUBcctPkct20ofWFHnmU4JOKfS9LOTgcToleLosoHNok2Onmv0Fakppvt02AdmxwcAy0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGgINeP/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGgINeP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48808C4CEE2;
	Fri, 11 Apr 2025 09:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744364653;
	bh=cQlJQWMR1vpM4VqDeSr2vhN4E6SlND+oqKZ9malEpBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGgINeP/Iroy+Euc1kql8/6jR3BdcNgJ1T5VquxKF918ZjjBEw0Im09GA2r6OkzAM
	 NkHvG0FrMFcrHIS3+ImuLCigg7VkY6V1E0N8PVvk4iJin55XreYuwnh2QdrePL/v3P
	 Q8VMP9K+bPV7dWE6isttzEUR1gxmDYJqiPpsnvykf4mv0MtrKg2EB5Z4pugaJGYkaC
	 kHHfU2qEzwMBRqS+4HQtc9xxXqGs1ZnHUrbuUjIDnlvJF+D/CbU0vQa3iAW7QjgI+A
	 hpBKUKpFeXYM99vtcrVanAlI6D+bXl5D/7j1JwaeMVrI/IOh/9SaPly7pXe3iSJfKH
	 QbVsY+mUrQUhA==
Date: Fri, 11 Apr 2025 11:44:07 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
Message-ID: <Z_jkZw58Ew5Iwj5K@gmail.com>
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>
 <Z_jgauFyTTKgVnJy@gmail.com>
 <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff39455a-7fa8-48c1-ba43-33ea4992f6e1@suse.com>


* Jürgen Groß <jgross@suse.com> wrote:

> On 11.04.25 11:27, Ingo Molnar wrote:
> > 
> > * Juergen Gross <jgross@suse.com> wrote:
> > 
> > > On 10.04.25 21:31, Jason Andryuk wrote:
> > > > Hypercall detection is failing with xen_hypercall_intel() chosen even on
> > > > an AMD processor.  Looking at the disassembly, the call to
> > > > xen_get_vendor() was removed.
> > > > 
> > > > The check for boot_cpu_has(X86_FEATURE_CPUID) was used as a proxy for
> > > > the x86_vendor having been set.  When
> > > > CONFIG_X86_REQUIRED_FEATURE_CPUID=y (the default value), DCE eliminates
> > > > the call to xen_get_vendor().  An uninitialized value 0 means
> > > > X86_VENDOR_INTEL, so the Intel function is always returned.
> > > > 
> > > > Remove the if and always call xen_get_vendor() to avoid this issue.
> > > > 
> > > > Fixes: 3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
> > > > Suggested-by: Juergen Gross <jgross@suse.com>
> > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > 
> > > Reviewed-by: Juergen Gross <jgross@suse.com>
> > 
> > Wanna merge this via the Xen tree, or should it go to x86/urgent?
> > 
> > The bug was *caused* by the x86 tree so we'd be glad to merge,
> > but your call.
> 
> x86/urgent is fine for me.

Applied, thanks!

	Ingo




