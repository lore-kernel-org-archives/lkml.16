Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A881C8639
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363631; cv=none; b=YlXJLKPhq3nwCfgXZkKaRAkJr3jcPLS94innSrbcLBm1VMgIivpx16ukAdGgwEchny9LFZB8SbeFj/P0jJr+FwbDejwCFDurliOkmkEv/W8CSK7N/nAcZ9+tzNexg2VWylSzkDTfa2edLnZlsLT8cl72K4HK2hfWXbDQ3W1xgYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363631; c=relaxed/simple;
	bh=wlS7DhN8y20vqXzQwNKbHgzXCRcEYtr0nbb6yGv9GHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkjyTv9g+Z8QKrmE5fjN6idxugq9VluAmeTaLSZmNshSpwl1W9iDygBpKpem/o458/jqyJcuuquIyThmJrgn7E+RAeLwmMvjRCd3vX7hwjn6aeqWJTYrF8tC1AnSDXd8fJNkabCTfOZ4iUwx/SIDn8pmUEJ2STSOqupZYL4t6k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgrgmilF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgrgmilF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6769EC4CEE2;
	Fri, 11 Apr 2025 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744363631;
	bh=wlS7DhN8y20vqXzQwNKbHgzXCRcEYtr0nbb6yGv9GHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgrgmilFZ0kvC1CHpR++RB+QquxA4fnfn1/IAgk6OvywpTWhNHi7HpJZohxvmUT8u
	 C0oC+pqEz5aR3HPSZlu8JSH1KtNL5uwZHzVB/SKM8M69LXBPn+B54ySqXALWGqDElO
	 v1XWRUqmp1+5Nm5OwEajeiVhVtZ4iR1roK6UU8ZPzeAQEzgUWX6kuxm4fVoS3JmlA7
	 exmpFUCrm8aTO0v4o9mMLquv5UEkjnPrxb+ny+Jul5UFbuuZ4bmHXcg/G/Yf8F0qle
	 o0fxRZh9RYD8eOye9IK9CeiAdHFQnM5Sr6gABJ8OgK7XyEmInBJFc8p6nnhvs46vjQ
	 PT0uP2zPdIa+g==
Date: Fri, 11 Apr 2025 11:27:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, "Xin Li (Intel)" <xin@zytor.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/xen: Fix __xen_hypercall_setfunc
Message-ID: <Z_jgauFyTTKgVnJy@gmail.com>
References: <20250410193106.16353-1-jason.andryuk@amd.com>
 <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c3115a6-f516-4f5f-8998-dafc343c829e@suse.com>


* Juergen Gross <jgross@suse.com> wrote:

> On 10.04.25 21:31, Jason Andryuk wrote:
> > Hypercall detection is failing with xen_hypercall_intel() chosen even on
> > an AMD processor.  Looking at the disassembly, the call to
> > xen_get_vendor() was removed.
> > 
> > The check for boot_cpu_has(X86_FEATURE_CPUID) was used as a proxy for
> > the x86_vendor having been set.  When
> > CONFIG_X86_REQUIRED_FEATURE_CPUID=y (the default value), DCE eliminates
> > the call to xen_get_vendor().  An uninitialized value 0 means
> > X86_VENDOR_INTEL, so the Intel function is always returned.
> > 
> > Remove the if and always call xen_get_vendor() to avoid this issue.
> > 
> > Fixes: 3d37d9396eb3 ("x86/cpufeatures: Add {REQUIRED,DISABLED} feature configs")
> > Suggested-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Wanna merge this via the Xen tree, or should it go to x86/urgent?

The bug was *caused* by the x86 tree so we'd be glad to merge,
but your call.

If you'll merge it:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo


