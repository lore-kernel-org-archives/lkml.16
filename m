Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F362AD1C;
	Mon,  2 Jun 2025 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871732; cv=none; b=jL707zS7f+aBcWmwh+SnFrnrdTDGShuQt+iTC5vBuL7nURJqf2Ns7tIbO5/pebwTSm2uDNx2M0Fe/+/a29tqRePVlDpJ3p2oGdBfn3B2R0jQlqjqVCjm+pMlmhy134pW372WY6KHXyk6DmpAKmV7D8OqYKR0SyX0e3PPajL7dQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871732; c=relaxed/simple;
	bh=awCLTapDYtSLunhjJmur8jP9nvPrd0Ml3WwwNIr/xQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJ8sAlhdLDuXSO0rXOhwhoqlTLJlONBiKwvBsbW1tXE7++nNOItF9qfooTIIN8QKB2ltWHT+qZZ4qFWui/U7IS1bVHXY1pzMwzZiRXBwCtBX/PRXNzdHORBEgMvFuihyfJXDEZf0J8Ly8ilShMa22E7B9nWO+jgroX80+0yYhMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8trEMFF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8trEMFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A68BC4CEEB;
	Mon,  2 Jun 2025 13:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871730;
	bh=awCLTapDYtSLunhjJmur8jP9nvPrd0Ml3WwwNIr/xQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8trEMFFNU2PciE7wqR3jyQF70v8wlnypdjcFuhGrR50KHgO6yywiaxQOS/nsJAm4
	 DbZzlRsClJhuvI4iUurDptSom65I4dbTTFr24iyDs8T5/taK5yhTMBWH9tayQFCGBp
	 UVrj0VAo2BTjsbHNhNfL/BJCIUmTqraLmgWvRpS+/9gLi3jr2XdLSQkjJbapfUin4d
	 nsYaxu9Hn4qQDWwHa8ChbNDMUwtww5UuRFer7X+KUGZFVccIEis1WsH6rKe5n0kZ+8
	 eZ97bkziJSMRQwSRmNo8IBSbdGvw9SE3XLLnvKiGipQ9+eURuWJ7atKF2I2Rc5yt2t
	 E4FfLPc9sWhdQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Date: Mon,  2 Jun 2025 14:42:02 +0100
Message-Id: <174886496430.2938723.8299701252646132199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250529073507.2984959-2-ardb+git@google.com>
References: <20250529073507.2984959-2-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 29 May 2025 09:35:08 +0200, Ard Biesheuvel wrote:
> It turns out that the way LLD handles ASSERT()s in the linker script can
> result in spurious failures, so disable them for the newly introduced
> BSS symbol export checks.
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Disable LLD linker ASSERT()s for the time being
      https://git.kernel.org/arm64/c/e21560b7d33c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
