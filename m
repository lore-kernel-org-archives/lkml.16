Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9651A5B82;
	Thu, 24 Apr 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745517704; cv=none; b=LueUOw++tHRKQPq0AZj2+fRYkcoK/faFANYpFOuwWhVyJsdGuvinrTFw8+/YA2DZNc8miibohDI7wkNgDHw3ZGWkW3Q6TSTk7V9wGnIe9tfi2IUPfd+y7BoA8f4HgWWbfPTczLLY0OMMbFnGgk9Gi6CqFLwwiOXGEySOUKE1eKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745517704; c=relaxed/simple;
	bh=1UzqVogGL3LmH9d4R4wP/lOW2RL5bF/zoPL9eg44mVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JK9LzEySc70oRUNnKWjy3yIAqw4+EsI5ov9+Vn2hgcyxu8TyyEcXisQykjwGhIRYqytaYziM49ICVmdAsd3HPCiRUlTivd+wMmXDiTScLEiVUZkPIleivuBIUk/bGvekZuU6QdeMlp5UOZsuAk623nFVd9saPRc1W24iBlRA49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di8Auxp0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di8Auxp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FDEC4CEE3;
	Thu, 24 Apr 2025 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745517704;
	bh=1UzqVogGL3LmH9d4R4wP/lOW2RL5bF/zoPL9eg44mVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Di8Auxp0PFt+QYUVd68e5bxQhwlqwWHun1bpXlYJfNpumVCakhDueyYfAxAoxruBO
	 nAfWiC56BxHXFFnZ12X5L3TyyxEnZKSNpMk+pbimrvsKJKb0YlX4yHTd0YSVr+rwc6
	 7R7wcAoRyglL9ZU8BuU4SoVA/xtVO7tNIP1kFSK0PeknizuQB3PHczHst4MVMPadrO
	 G1jToK2eaDnfkptNYKA9RhRu0YJYIxvMJx0OmexXc7iCUc4N07ukYo9rWqTbkCyi5N
	 ACJ/79IAPe5/DV4XOBP867DL1nEzMLuTEat9X3F1dd3XPZKMUph5eIXFzegTd6Os8k
	 xRHjEdYropK3A==
Date: Thu, 24 Apr 2025 20:01:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
Message-ID: <aAp8gyKY1YJqIOXL@gmail.com>
References: <202504211553.3ba9400-lkp@intel.com>
 <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020>
 <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
 <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
 <aAp6u9ylKCpvMJRF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAp6u9ylKCpvMJRF@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> The patches most relevant to this discussion should be:
> 
>       x86/cpu: Remove M486/M486SX/ELAN support
>       ...
>       x86/cpu: Remove TSC-less CONFIG_M586 support
>       x86/cpu: Make CONFIG_X86_TSC unconditional
>       x86/cpu: Make CONFIG_X86_CX8 unconditional
>       x86/percpu: Remove !CONFIG_X86_CX8 methods
>       x86/atomics: Remove !CONFIG_X86_CX8 methods

also:

>       x86/cpu: Remove TSC-less CONFIG_M586 support

Thanks,

	Ingo
