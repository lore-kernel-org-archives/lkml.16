Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C1221FC0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422947; cv=none; b=rSFiLvy1HrLswDOYH2gxdw3+yXc/Ko+6ZkEYZjkOj9/UMLQ5ppgXm1n22fVWSvZX9+7+2X4Ax9doMXZ4vCczOeblJIXzsgmPuzcvP62rNGpMv5Z+jS3mkDZqHzh8i0HwUG4Tx8Fc4nYH6IBqS8l33D7Ip+6Yoau3FsulHcIwIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422947; c=relaxed/simple;
	bh=Gu4jaSl8lqGVfzPCdbGH2jzFTk6xz/rBKrwIbv7GIwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrzDEOZTNDmJjSYNUBXvb5iL8Tot/64B2eu0edFPm6weUBDBUNOnNDja7PugNP9pa5NJyYMz8XPW0kHsytChuIO9rWsksjxEnCsqTch5uUuSf/bKSi5sUGuf4OlhwqZdVxns2/ehUv1L4LD2RLPEGAUNoSk5VttIE9HAwH6I0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC8C4CEE3;
	Fri, 20 Jun 2025 12:35:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>,
	Dylan Hatch <dylanbhatch@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v7] arm64/module: Use text-poke API for late relocations.
Date: Fri, 20 Jun 2025 13:35:41 +0100
Message-Id: <175042293849.3925078.10159804916524712470.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603223417.3700218-1-dylanbhatch@google.com>
References: <20250603223417.3700218-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Jun 2025 22:34:17 +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
> 
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> [...]

Applied to arm64 (for-next/livepatch), thanks!

[1/1] arm64/module: Use text-poke API for late relocations.
      https://git.kernel.org/arm64/c/91b89a634487

-- 
Catalin

