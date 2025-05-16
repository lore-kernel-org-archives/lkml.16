Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157711B85CC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409875; cv=none; b=J41ki8IzqJbKPQnMQUyKfxwvYvIBLmmLOSjO6lXoe9rrB5gGI8E9b85CHqJYMLXAqLBpeOS102V359wGmjHCVUfvtmkNfp4NaK/5FNUzRzPSUp8urPqVocZ0uHcMKCp0FhwArVe9K2JXrWP2zon2hr2HI8DaoGBV/mCN8nYAPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409875; c=relaxed/simple;
	bh=z4tSAygEeJrgHxjp8RduNrZTO6ccDbYrOyWS4Ye800s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cODoxnr1pg6TAJGrQNB2kq8/gCvBl6iU2n+nNgC/V2ai8hEDNnQOOxI59+TKYpwlpyWHmo7ZrX8GYgqox5N/PECykrS3rgz+RKvG2bX/PfXyV/zQqiG2BRFeo59R2iMZTQBhLpIc2jPbiKmvyV0YqFrccVjc31oC3lbZ9u8AeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc/gc3ne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc/gc3ne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9824C4CEE4;
	Fri, 16 May 2025 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409874;
	bh=z4tSAygEeJrgHxjp8RduNrZTO6ccDbYrOyWS4Ye800s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vc/gc3neqXrUFZIaPBCF23eZ2iLdSzCLqkb7x/tOGNiSvRqhqi5HWkfBDirL5W4X+
	 09U0tQiOURkq9DybrHGaNSgS8DTzWs0XAsRbtBanyWkRy36YLXicFNMBe7xYk1B3Wd
	 Wu0EeCAFCg/7pvQzUWGihu7Vhf5w7w5btfarFvtcyV6ljb8FYUkSeYLpVOAugh/mKa
	 dAzVp1oObnxz4UaF8Rp+fgs11hcVVmMRNEekICGYKf6A01xqauQG2fQGdgo7sKzs8I
	 FYeA3dpgbbuhetxHwTk5a7qBK9QAvrMEpV36NFJ0TU1/0icuJ9mJi8eWcfbEVAS0j3
	 ljahUOihKYGaQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
Date: Fri, 16 May 2025 16:37:43 +0100
Message-Id: <174740439712.2574974.10617041555602541143.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250429050511.1663235-1-anshuman.khandual@arm.com>
References: <20250429050511.1663235-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 29 Apr 2025 10:35:11 +0530, Anshuman Khandual wrote:
> mov_q cannot really move PIE_E[0|1] macros into a general purpose register
> as expected if those macro constants contain some 128 bit layout elements,
> that are required for D128 page tables. The primary issue is that for D128,
> PIE_E[0|1] are defined in terms of 128-bit types with shifting and masking,
> which the assembler can't accommodate.
> 
> Instead pre-calculate these PIRE0_EL1/PIR_EL1 constants into asm-offsets.h
> based PIE_E0_ASM/PIE_E1_ASM which can then be used in arch/arm64/mm/proc.S.
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/1] arm64/mm: Re-organise setting up FEAT_S1PIE registers PIRE0_EL1 and PIR_EL1
      https://git.kernel.org/arm64/c/29e31da4ed26

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
