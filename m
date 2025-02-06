Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D339199385;
	Thu,  6 Feb 2025 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865602; cv=none; b=FNjFceRSiH4iwWtPCSpPWlnkLClyRj7n3Bfq9z/5a1oLUH9rXRwXBMFJmsGYdU6nb6CLq6CtQJOhMGIzl0DPyaSSVLYx1DDF3AqCmkQELNcf4K8IP8euUigrqPFCwQ4ARlI3r9W83W6ScDcG8BFw8drViKr/rlYNJ1YmiIUrYLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865602; c=relaxed/simple;
	bh=zm/qQh7A8Swkkid0PIiYsRoSC0ki1h+Dn600rblvx7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ql5KlI9qFHl7uExrE4dE5SzruBNKGEFZmVFwPcaeDzg54KojcFl5iTPW/gisD+9PX1T8wrzbUemWC/Wh3oMVc/cUll7occFwM4gugniVXbvzWc/xCsl9GiTMekuZbjZQwTpVi6pnOw9+MxL1c/PqyR2zKbpAPRC1OYWzYOxfQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3N7A39F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3N7A39F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090E9C4CEDD;
	Thu,  6 Feb 2025 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865602;
	bh=zm/qQh7A8Swkkid0PIiYsRoSC0ki1h+Dn600rblvx7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3N7A39F+dLefEgu2q45RFYpyvOIEmAaOGNzkzVw2uKB2GRoJNsW6lRKsb0OUK+GP
	 cN/BIpUWwabpPMBvLeSWEynr+Nf7a4eVH9CanUn+PF/+vCgKAiyGX+oKSb6+NxrRac
	 I/VIZaQo+lCGxeEwcDNDgqocktPprxjIIRUL6Sk3rTOWgqdG5melRJHg2w9MITRFqa
	 ebwNZ2tSCB2N/fTAmfLuOdn8yW4InGKJwcHh/VUNEWPkZZg0R4rXA7pxV3+GfHpam4
	 bw0UL29sNEwGJDHSPN9XSBtwUhBoyaBl1Efhdppx52MiHHQ1pPPU6DKH6IPq+Kv1pH
	 c0LNQmDU4bL9A==
Date: Thu, 6 Feb 2025 10:13:21 -0800
From: Kees Cook <kees@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
	justinstitt@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] alloc_tag: work around clang-14 issue with
 __builtin_object_size()
Message-ID: <202502061011.BD9611CEA@keescook>
References: <20250201200503.2532357-1-surenb@google.com>
 <202502051056.B910C691C@keescook>
 <jdnvctbd4kfzgjy4s4wpd24zpv66zsn3cjgnsialjbnrl3oa4e@vexb7u4ku2tr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jdnvctbd4kfzgjy4s4wpd24zpv66zsn3cjgnsialjbnrl3oa4e@vexb7u4ku2tr>

On Wed, Feb 05, 2025 at 03:16:12PM -0500, Kent Overstreet wrote:
> On Wed, Feb 05, 2025 at 11:18:35AM -0800, Kees Cook wrote:
> > On Sat, Feb 01, 2025 at 12:05:03PM -0800, Suren Baghdasaryan wrote:
> > To Kent's comment[1], I believe I was using __builtin_object_size() here
> > because I have a knee-jerk aversion to sizeof() due to it blowing up on
> > flexible arrays, but that's not relevant here. ARRAY_SIZE() would work,
> > but only if type checking to "char *" succeeds, as Kent suggests.
> 
> Yeah, that rational for __builtin_object_size() makes sense - although
> it's not what the gcc docs say, those talk about getting the size from
> an attribute on the allocation function (!).
> 
> ARRAY_SIZE() is sizeof() underneath, just used creatively to guarantee
> that the input is an array - although that property is probably what we
> want here, since strtomem_pad() really only makes sense on static or
> flex-arrays, no?

Okay, here's my proposed fix, and confirmed that it solves the problem:
https://lore.kernel.org/lkml/20250206175216.work.225-kees@kernel.org

-Kees

-- 
Kees Cook
