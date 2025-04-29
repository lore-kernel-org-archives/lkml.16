Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026B269AE3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958493; cv=none; b=au5VBz0Yt2/RqhKLqHfc5bmuw02YZPJblkveAwyd0uiNpmiN+nnrOsfG1kNjOWSD+YWB+JBbsYIBlTVyrJUaoTCb7/JCZSFfHHLNGuiK6je6z+pXfxEB6BCA4n8ftmOqIQn2Z/0dVJmdmxDH8clpz0cOrIJZbJebxEr8YjdqPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958493; c=relaxed/simple;
	bh=pww28JlyTBzS88AER217678R1eGmM0hTlESvUyPTfGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hwNu4n87wS4UoIbtVsDn5k0x07baY5jyFI9Ah8M/a3EqB5RjkrqPszhjj5GNp/DI5CUWIeyGNbIQ/pF82iVgIrLWUZMSrwApiFJUZUuK5RenJTATMCIjER3qqv2uoLUWmNg77z30writjwD+8Z2EqG7/FEFw2DpdKNB1fqP63Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbeadhyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbeadhyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27413C4CEE3;
	Tue, 29 Apr 2025 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958493;
	bh=pww28JlyTBzS88AER217678R1eGmM0hTlESvUyPTfGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TbeadhyBqAFVD0mn9RAVEXLytFdg3lODFFUe5lpfsxg14ZozPnlGu2bii3qsIuQQ4
	 UQlui9EnSxzCmouPszdd/t/Yv5YfEhqWWhmCv9qseRj/gV6U4J4VagxgZwZaossTRz
	 rqZXN33+3C0oK5bycH0vg+/nW/VDUj1PUghWySNTM20CjbRTd967DHIu1j6NTq35F3
	 47RJWftcIR1iRuOhABl/1nVHrF9TcrxiR9r0x71CoTtTbKRptstYha98Nb9aPQHsNN
	 bmoBcQa/4Nf7nPw5iLAQK6Fz9hf0s8Gt73LHbYd29uDQ8o+bowFzq6qFnrgTYmXMkK
	 sOgrwGCATsOAg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ssradjacoumar@google.com,
	chromeos-krk-upstreaming@google.com,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
Date: Tue, 29 Apr 2025 21:27:48 +0100
Message-Id: <174593987866.472512.6873137326879401537.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250417114754.3238273-1-korneld@google.com>
References: <20250417114754.3238273-1-korneld@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 17 Apr 2025 11:47:54 +0000, Kornel Dulęba wrote:
> When the 52-bit virtual addressing was introduced the select like
> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> Because of that the rnd max bits knob is set to the default value of 18
> when ARM64_VA_BITS=52.
> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> be used if 48-bit addressing was used. Higher values can't used here
> because 52-bit addressing is used only if the caller provides a hint to
> mmap, with a fallback to 48-bit. The knob in question is an upper bound
> for what the user can set in /proc/sys/vm/mmap_rnd_bits, which in turn
> is used to determine how many random bits can be inserted into the base
> address used for mmap allocations. Since 48-bit allocations are legal
> with ARM64_VA_BITS=52, we need to make sure that the base address is
> small enough to facilitate this.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
      https://git.kernel.org/arm64/c/f101c5644771

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
