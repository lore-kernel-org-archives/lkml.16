Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E285A2701B8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745473847; cv=none; b=eGre7S4xjn4p7YxYZIfXpOXpfbOLi4ihOjtekSPd7Tb/1oxUY9NEtVf4fd+o6trZwW9JweEfzPXYWGsHQRImCSVAXoTCSZOXPQD3Bh8iOt1yYBsbDKgHyhCISguMjCWFxe0w/c28QmrYZnhXYh7+dEvG4hicdnhapUiDqwPRVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745473847; c=relaxed/simple;
	bh=sB0hUbV58wH1WzUzW0e3EsN347j5zpwecXfO1q1RcPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKKKAD3X18W+CzyF0iU7670/kpOlfBBncLfCdt1n9gzGxsks+/jWF2j48alq2OWQd5sVHZpyKIot8TQ/YmrBhbPfCQWkEII0NDI7d4IYjUolS4sEd3xHQm8jQdxdW85kwb/F1i92BE/dNnfd4yG/0tfINOhc8A9H296mdc11rsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf7P+cj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf7P+cj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBFEC4CEE3;
	Thu, 24 Apr 2025 05:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745473846;
	bh=sB0hUbV58wH1WzUzW0e3EsN347j5zpwecXfO1q1RcPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yf7P+cj/WjG4xDNnJeeXFp9SIDXaBLmddmL7fBn9ZIsgT69CUajoQN67/NbtNc9bc
	 UWZgoNgBAbtvD/fkFLFaWlseB8IbWTqgGag8iNTph2RvTC9ulA8MdICXvB+GOy+s5G
	 sHIHyBrmy3xZsyoX6Os5xSPaB8vRyiBzwx79pzwsa6ylUQAwY+I5baSGuLwwwgq/vO
	 1D/sdImaEAUmHqi6GK+aIRL2eiPtcyJ8Ol+hhi0rCN/gWJxflG0C2HoAf9cmt1ttfZ
	 eTRBmPMYiPMbOmUkboGxL14DSyWJ+PFX5fS+QI078fjPvIzVEniGcrPhSmCZg0Vj93
	 iN+1rWfE+ZGZQ==
Date: Thu, 24 Apr 2025 08:50:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] execmem: enforce allocation size aligment to PAGE_SIZE
Message-ID: <aAnRMGGaytI3ELMu@kernel.org>
References: <20250423144808.1619863-1-rppt@kernel.org>
 <20250423143650.6595dcc7178351b62c31782c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423143650.6595dcc7178351b62c31782c@linux-foundation.org>

On Wed, Apr 23, 2025 at 02:36:50PM -0700, Andrew Morton wrote:
> On Wed, 23 Apr 2025 17:48:07 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > Before introduction of ROX cache execmem allocation size was always
> > implicitly aligned to PAGE_SIZE inside vmalloc.
> > 
> > However, when allocation happens from the ROX cache, this is not
> > enforced.
> > 
> > Make sure that the allocation size is always consistently aligned to
> > PAGE_SIZE.
> 
> Does this have any known runtime effect?

Right now it'll make the maple trees in execmem_cache more compact.
And it's a precaution for the case when execmem callers would want to
change permissions on unaligned range because that would WARN_ON() loudly.

-- 
Sincerely yours,
Mike.
