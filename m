Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E1A199FAB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309045; cv=none; b=fgQp0ykO+aBi1eF5Jfwez3FVbuDEKJWeGerQ+a4cXRIjOCKs4qJ+GyaV/9c3C6PaRvuaaLgfdaeClF1EBttKjGr8Ylp7i5Dcj5/ubJwPXde+fOsPO/uCSQmMljzF88IwRKMqV3R1fnvrpGN5OHFriRVoxD11XxRh2BzeLsv5Cb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309045; c=relaxed/simple;
	bh=kiO344wMhW90IABZ9lq9t9jrYl25cQNRqESNdsZN20E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WW+r+X9yKaD2yb+Gl666Cq4UxkYOUos7McDYb+REsQXeI6IS37CtvInHrfK530biz4jHrrpkf3ZJWyU2nv4OewkAEMXiP04BpB8asGCdi5fOe35VJD1zVxwBvJSljcWOQMm5SMmhVI+hu49zNZYyC69KaMzRxNXSGj7y3Gn0B7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U56uj8lU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U56uj8lU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29C2C4CEE7;
	Thu, 15 May 2025 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309044;
	bh=kiO344wMhW90IABZ9lq9t9jrYl25cQNRqESNdsZN20E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U56uj8lUzsEuyEAf8Y9RNK/DWziYzs/rcD3rVbGC5dq6R+qhRTl7CdkNQnB1dohoF
	 mq3tvUOdfH+wkTI7IsGAMw8gidLQNwJ9QUVlle5rMsQGMasCr0IjqFPJDE+pcHI7LC
	 1BgrcnE5/29O7rxryQnlCPhPCX2wqiEq4w334fXSt2u+hmjzrw0pQKhLGpzkW7Od5X
	 cZrvulZAAxa+BkovPJvOMlhOlKeMtk3k3Bp6Hdlwegap78korz+ICwHKmNAfxT3Gsi
	 32udjUYtqldR/X7xrvacHE/3tRMCemVwNK1bbp3Cp2oIBilvjJS/5FzygSrCF/X6S5
	 0tAi22WZM//Ug==
Date: Thu, 15 May 2025 13:37:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 17/29] x86/boot/e820: Standardize e820 table index
 variable names under 'idx'
Message-ID: <aCXR7_ou6QB-YArC@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-18-mingo@kernel.org>
 <aAduCoINHUkFwIzR@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAduCoINHUkFwIzR@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> ...
> 
> > +			for (idx = 0; idx < overlap_entries; idx++) {
> > +				if (overlap_list[idx] == change_point[chg_idx]->entry)
> > +					overlap_list[idx] = overlap_list[overlap_entries-1];
> 
> overlap_entries - 1 ?

See:

        https://lore.kernel.org/r/aCW-qKOYJWRLYgpx@gmail.com

> ...
> 
> > +	while (--idx >= 0) {
> 
> 	while (idx--) {
> 
> should work as well, no?

Yeah, but note that this function gets thoroughly reworked in:

  x86/boot/e820: Make sure e820_search_gap() finds all gaps

and the while loop is transformed to a straightforward for loop:

+       for (idx = 0; idx < e820_table->nr_entries; idx++) {

Thanks,

	Ingo
