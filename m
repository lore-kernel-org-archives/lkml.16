Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD51F2BAE;
	Wed,  2 Jul 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481282; cv=none; b=kkUH3Bpuj+uLY3iRB4y5HnLW2/o5VIygfei4ti4Zwoav5o7untbUfugwKzhkyzr5+nZI6oR3Lm8wrBXo+/gi6HAYAcVtwmM5JA/r1iC1VIWzlr6RhKUCrJilJhPr08/IyK/218jVch2Rm6XMBUrwg+ObAhMD3gP0PpYM+CNcHws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481282; c=relaxed/simple;
	bh=aWuUX6tLZD4z9ADKTWTUwJg5KGFXyu88N0DH7uktLNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6W91zwVZntq3RzeI/56YUZOurj/M3EFCMz8/iccoKcUTNYKw1btAvrFkQSa+xG4eCe4mRKdtVqifWU13NIoFfcxUle7Rkcz7DoIW3Ot1SAgHE0LZ/mdTRBplW35owaFDtc4ErotEojpa11xGWc2x8NAAekJgRIFFvEjfFLGPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937CDC4CEE7;
	Wed,  2 Jul 2025 18:34:38 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 00/10] support FEAT_MTE_TAGGED_FAR feature
Date: Wed,  2 Jul 2025 19:34:35 +0100
Message-Id: <175148125053.2930777.15499665158759959456.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 09:45:03 +0100, Yeoreum Yun wrote:
> The FEAT_MTE_TAGGED_FAR feature provides support for
> reporting all non-address bits during a synchronous MTE tag check fault.
> 
> This patchset extends the reporting tag to include
> not only the memory tag (logical tag) but also the address tag via
> si_addr when FEAT_MTE_TAGGED_FAR feature is supported.
> 
> [...]

Applied to arm64 (for-next/feat_mte_store_only), thanks!

[01/10] arm64/cpufeature: add FEAT_MTE_TAGGED_FAR feature
        https://git.kernel.org/arm64/c/66984536899f
[02/10] arm64: report address tag when FEAT_MTE_TAGGED_FAR is supported
        https://git.kernel.org/arm64/c/7c7f55039b8d
[03/10] arm64/kvm: expose FEAT_MTE_TAGGED_FAR feature to guest
        https://git.kernel.org/arm64/c/61eae495da68
[04/10] tools/kselftest: add MTE_FAR hwcap test
        https://git.kernel.org/arm64/c/49a9942ff80c
[05/10] kselftest/arm64/mte: register mte signal handler with SA_EXPOSE_TAGBITS
        https://git.kernel.org/arm64/c/cfafa517c9e6
[06/10] kselftest/arm64/mte: check MTE_FAR feature is supported
        https://git.kernel.org/arm64/c/2e3e356560ef
[07/10] kselftest/arm64/mte: add address tag related macro and function
        https://git.kernel.org/arm64/c/ed434c6e0813
[08/10] kselftest/arm64/mte: add verification for address tag in signal handler
        https://git.kernel.org/arm64/c/49cee364c866
[09/10] kselftest/arm64/mte: refactor check_mmap_option test
        https://git.kernel.org/arm64/c/64a64e5d12f0
[10/10] kselftest/arm64/mte: add mtefar tests on check_mmap_options
        https://git.kernel.org/arm64/c/d09674f98cdb

-- 
Catalin

