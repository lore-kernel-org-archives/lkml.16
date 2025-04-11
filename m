Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D928D857
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363304; cv=none; b=kY/ELPvtCJUXyT4YYOLAy3nyQorQ6E4oA0z7EYozqzynKVdenPrIibbZkoMal4gcf/p8RvafF7S2t7jO1iZsYGDIfbb6p6D/u07pbHZ3UldbJUIS7KaSKK+lJNpZzZ6J35+I8AbW7PeFySxX06EzINenX6n8b4DU6PU0+Fwggf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363304; c=relaxed/simple;
	bh=TU38Yz0wslbhAhgiT67MgDKR2lBijTLSXefhthfuYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7supgekAzAYTm8b5TRg+0a+CKgliI0G/3o4+Fub6i15pIbcgkKwwcUCMxboXn3zamFkISgF0ZRxH170YniX9Vo6mEKBT6faAMrIxaJF6QnKmORBmwGxnFRSmqe5bA/Ae6yBYZejK5AGzCW4EP+FA92UeuGnQvvraMSOnVz9H+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjXHwmnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjXHwmnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A46C4CEE2;
	Fri, 11 Apr 2025 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744363304;
	bh=TU38Yz0wslbhAhgiT67MgDKR2lBijTLSXefhthfuYAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SjXHwmnMOpa/T9EDIGZIX3IDPYF02ahzYO+YFFts9WBT9LzVU+sYE7lMFunEOQ6jC
	 i3wle5PIGi0XEF7KoFSrobsHG4iLPceRLhg3C6GU3Ry3UNp7hkKNQcQYQ/s4/NLn+3
	 Q0EFYQ0FW4/p5igzjZmcqVsIOYDmArkMmLPPFLrgyi5FToLl/MbdIPVJjn76QEOMPC
	 i53dzsttNM1if0JeK0UXoTKlynDInlA6vtJAPClKBzRETPL9clMN33KrpH1gQo6+bh
	 5/FPJTOH4S0Pe27UzE9YpsNYeyXYnrbnG+Ca6jrZMF65hsEqwfCPUL/tiO65R1C7rW
	 ATb6+H13FBf2A==
Date: Fri, 11 Apr 2025 11:21:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH v4 00/18] pkeys-based page table hardening
Message-ID: <Z_jfGlOEb4Bjl3vO@gmail.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>


* Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> Performance
> ===========
> 
> Caveat: these numbers should be seen as a lower bound for the overhead
> of a real POE-based protection. The hardware checks added by POE are
> however not expected to incur significant extra overhead.
> 
> +-------------------+----------------------------------+------------------+---------------+
> | Benchmark         | Result Class                     | Without batching | With batching |
> +===================+==================================+==================+===============+
> | mmtests/kernbench | elsp-64                          |            0.20% |         0.20% |
> |                   | syst-64                          |            1.62% |         0.63% |
> |                   | user-64                          |           -0.04% |         0.05% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/fork      | fork: p:1                        |      (R) 225.56% |        -0.07% |
> |                   | fork: p:512                      |      (R) 254.32% |         0.73% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/munmap    | munmap: p:1                      |       (R) 24.49% |         4.29% |
> |                   | munmap: p:512                    |      (R) 161.47% |     (R) 6.06% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 14.80% |    (R) 11.85% |
> |                   | fix_size_alloc_test: p:4, h:0    |       (R) 38.42% |    (R) 10.47% |
> |                   | fix_size_alloc_test: p:16, h:0   |       (R) 64.74% |     (R) 6.41% |
> |                   | fix_size_alloc_test: p:64, h:0   |       (R) 79.98% |     (R) 3.24% |
> |                   | fix_size_alloc_test: p:256, h:0  |       (R) 85.46% |     (R) 2.77% |
> |                   | fix_size_alloc_test: p:16, h:1   |       (R) 47.89% |         3.10% |
> |                   | fix_size_alloc_test: p:64, h:1   |       (R) 62.43% |         3.36% |
> |                   | fix_size_alloc_test: p:256, h:1  |       (R) 64.30% |     (R) 2.68% |
> |                   | random_size_alloc_test: p:1, h:0 |       (R) 74.94% |     (R) 3.13% |
> |                   | vm_map_ram_test: p:1, h:0        |       (R) 30.53% |    (R) 26.20% |
> +-------------------+----------------------------------+------------------+---------------+

So I had to look 3 times to figure out what the numbers mean: they are 
the extra overhead from this hardening feature, measured in system time 
percentage, right?

So "4.29%" means there's a 4.29% slowdown on that particular workload 
when the feature is enabled. Maybe add an explanation to the next iteration? :-)

Thanks,

	Ingo
