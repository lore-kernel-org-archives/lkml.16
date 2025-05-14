Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FDC1DB365
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235663; cv=none; b=MVCIRkeqG7JLj1PhTssmfrYM3QrQQLRxNCGxtBsbmHhh2JAaTVKOP1ZKEsfaoSBsSkgaVDCos7R/TBaN5BiXIf1gl0K1HGisbSZMjTcpTaDju3KxAj0PM9s2eeeEUGnI50FjTQjejsxo+ukVn0g6osdblb4DxaR0l3/ALs7boaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235663; c=relaxed/simple;
	bh=cJRgpdMEXZHEJK1t7Kg/C1eNrowNSvxU60h62Y5kvtc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjMytXoljPrl1/SDpRwn9RkvSLT9SnMotWPLeWTswGyfx1Ibka6Y2CEAq6zGK7oaTQAsSL8s0uuQ/J4ks81tD6E7+KqfEhJ2Y54szWDGAJdKXhs17A33cCIkxNfQeIg+kzGLoycMn27F9EplE1cR1JqZd/FhYSxtekSao+7r7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDmI5TZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDmI5TZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91160C4AF0C;
	Wed, 14 May 2025 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235662;
	bh=cJRgpdMEXZHEJK1t7Kg/C1eNrowNSvxU60h62Y5kvtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TDmI5TZZjn/npyMlYJoum+PjSv5HtAVaOgXRweFZGSwsSMdDI/CQ7BzLDG7vT4jHs
	 1iFdFoHIPLjzcH5tFt50wu64yyYVcYKz/hAQTDLkRcYPgTKG9yDXQc23aUuu2EVpNn
	 NKsqIehfFQzD1K8XwdVYiT3NXoV94kd9J+HBo4S26mT24asWWTkHpI3+B9VfEoeZuC
	 4tyPN9MlQMeUf3OY2AH6jwtMJH2piXMb8d4t5tGS7cvXQcXhO0AgmU8Uqk3KZ6ao5S
	 FmOh8nSjltLKlaQ0QmeFfUl8Qs6ymwouIYwxvdOJmu7YPvqouy898PJWITqIBdLwIS
	 vt8z2WvWBW0UA==
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Permit lazy_mmu_mode to be nested
Date: Wed, 14 May 2025 16:14:12 +0100
Message-Id: <174722572203.77262.3085803317219491344.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250512150333.5589-1-ryan.roberts@arm.com>
References: <20250512150333.5589-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 12 May 2025 16:03:31 +0100, Ryan Roberts wrote:
> lazy_mmu_mode is not supposed to permit nesting. But in practice this
> does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation inside
> a lazy_mmu_mode section (such as zap_pte_range()) will change
> permissions on the linear map with apply_to_page_range(), which
> re-enters lazy_mmu_mode (see stack trace below).
> 
> The warning checking that nesting was not happening was previously being
> triggered due to this. So let's relax by removing the warning and
> tolerate nesting in the arm64 implementation. The first (inner) call to
> arch_leave_lazy_mmu_mode() will flush and clear the flag such that the
> remainder of the work in the outer nest behaves as if outside of lazy
> mmu mode. This is safe and keeps tracking simple.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/mm: Permit lazy_mmu_mode to be nested
      https://git.kernel.org/arm64/c/1ef3095b1405

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
