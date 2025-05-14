Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDFF25E823
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235659; cv=none; b=TSiWx1igaglNomwy11hriJCYG2JLi7MIEG5A6zqjjDMsxFkgDqBFbunliCwLe2Boo4BWWZb73ryL9RlLwBGcU1yqmv1w1CuZDK7MO0EbpveYl/hfeHwYLE1PUek/fWjHnkMm94iTyO25QoQ0g0fl9i6qxSpHDykw4KSFoBBB4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235659; c=relaxed/simple;
	bh=VtwAscQyUTlRhZtUQltGV4edyb2igJ5ad6uHqpn+WRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1VYwD6Hx8VNYORt2BTXTrXMvXoOko9BV4bQBxF/nbcD8nOtNV3QLfLdNkEesR76O7GggONEF/1fIhYLf2hgAaNLKtKRatcoMpPTE81e4yStW53OPSIWBZbOQoLIefFcNFXuGKhAMk+Li63Un7EXxowCXpIYbVci7SD9f3JrIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtpYjOSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtpYjOSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1442C4CEF0;
	Wed, 14 May 2025 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235659;
	bh=VtwAscQyUTlRhZtUQltGV4edyb2igJ5ad6uHqpn+WRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtpYjOSME//tW2/y4bFxZKPp3B5Ja5xV63HYq7wpQOJn2o6cQsf0XViPQLUMo6jgx
	 M8BK8QREZ6B4bMEmer82tTJUoZAIZ9EsK2yBAGVZRAv3KFrimGX6lKVqiX/lKwzSzU
	 RmNmfsJacG/YNCEvLQyvBvjjlIRquxImSiJ9A0fjuqFHnRZqz3yu1ksiJqWfeqx1yf
	 LXPBIEGC1n+8ewTFdNatWZ1e8tFujqss0mjfK8vJceqjgV3bsXDz9+EgVWyN0xwkI5
	 PbG9m4BVDiCxgEhN2A7LdckrQ9KdWIqtTa/qjKT0uOGkfsj1UG9m2WfUPm5VnaZoBU
	 LSMLMLHG88HmQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Date: Wed, 14 May 2025 16:14:11 +0100
Message-Id: <174722567630.76853.13198140352994941416.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 12 May 2025 11:22:40 +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Disable barrier batching in interrupt contexts
      https://git.kernel.org/arm64/c/b81c688426a9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
