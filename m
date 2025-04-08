Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585B2116FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100375; cv=none; b=vETHsQtRZg7jgtBSswXJ6HMRv9N/bJezg087Dmq7HH5hVvPGD1E+cHFiud6DwYn+2e8cEOly38iC8ZFZwNwx+XQzvKbfKPbZ2zDrczP7gHj455CA+PW7x+cXzmXyzFdm0VzxIiESYIssN/O664afDBejs1d+aR0Lk5FlJPUs+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100375; c=relaxed/simple;
	bh=RWDluSmvD0EtJvctRRT5CAy2qsHtkmsuPO3psGuGfu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ5Wm6Ek2Zmm4rv9Wd7PiZhqRdS0NfDUNHUD2l5iWqhvPKu8QtemSjd0ET2U9VyzFEr+QSFirDtUxJUC0IHYDVpmXdtx5gRNd1fwAhzOfwzITOiMUDDYu0yYyrE/yVx92/Qgenc+slD1U0KuDRu/4JRrx2fCUFcYGXIAYLPbnqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9fyQ3Gq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9fyQ3Gq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A75C4CEE5;
	Tue,  8 Apr 2025 08:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100373;
	bh=RWDluSmvD0EtJvctRRT5CAy2qsHtkmsuPO3psGuGfu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9fyQ3GqpUgtbdKyXZ5kg7qfihhKGhrMj9B+li0orUu8ECTiBYoX8A7Ag09moZPEK
	 jBF2Fu0YW/3aK5odPeKGsp180zLWjClPnR5os44/2upIxcGmj4NsL5PaPqLbgleNAQ
	 e3jPwUh+tiiVrbdRXjP8flZpkagucKgwDQqSbsxZ9QYW9iVfDZ7dL/QC/qDyD4np3/
	 WnKhaVGlg93orolKq4yXYTbPmblttltWolA3CguR23J2KZzrwEd3nEznlfRDnLXgWV
	 NHm1n7XQxFlcnBE4wW8r/E/y6mnz1APehNyqJj5YvSUNAV49Yq7rh1hIHbKo9w0r0i
	 i8Q2o07ml7Gyw==
Date: Tue, 8 Apr 2025 10:19:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <Z_TcD8KV-Ix9_yzK@gmail.com>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
 <Z_QCYzEJXTnd97Sf@gmail.com>
 <4961949a-75db-4071-a478-fdc543c1dd28@stanley.mountain>
 <Z_QgoB381ltKBdbG@gmail.com>
 <20250408025129.GA1168636@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408025129.GA1168636@ax162>


* Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 08:59:44PM +0200, Ingo Molnar wrote:
> > Good, although why is this compiler option named so weirdly in Clang:
> > 
> >   CC_AUTO_VAR_INIT_ZERO_ENABLER := -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> > 
> > Hopefully it is named thusly because Clang has adopted GCC's 
> > -ftrivial-auto-var-init=zero?
> 
> Clang did -ftrivial-auto-var-init first, where the original author added
> both pattern and zero but intended to remove zero once pattern has been
> optimized enough compared to zero (if I remember and understand
> correctly), so the "enabler" flag was added to try and make that clear.
> Eventually, Kees leveraged both Linus's stated desire for initializing
> stack variables [1] and GCC 12 landing -ftrivial-auto-var-init=zero
> without a separate enable option to deprecate the "enabler" flag in
> clang 16 [2] and remove it altogether in clang 18 [3].
> 
> [1]: https://lore.kernel.org/CAHk-=wgTM+cN7zyUZacGQDv3DuuoA4LORNPWgb1Y_Z1p4iedNQ@mail.gmail.com/
> [2]: https://github.com/llvm/llvm-project/commit/aef03c9b3bed5cef5a1940774b80128aefcb4095
> [3]: https://github.com/llvm/llvm-project/commit/00e54d04ae2802d498741097d4b83e898bc99c5b

Cool, thanks for the explanation!

Thanks,

	Ingo
