Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7292248A5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828914; cv=none; b=rayUGfm8b25MdemZmaNAmC3Qn2Ct9NsCOp+RhDRLn/ODyyYOX5I49BNhB4SrIOZ0Vle8mjthVC0dIm+qC9pN6s2bbwZFb2q6XqIm+/BeYkl14Yxz69rXIId1RhJFzKAH6HkIt8KUcWcddbqeiHBPThl0FWNWeLHhSyPsxd/oI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828914; c=relaxed/simple;
	bh=Pa8CtMrmRipcqHnGu0QHHTWFJIGboQCpNY3td+rS4TQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KY6hDBWoiA+8QXSdAR/tmIury8zyCZBoQD1HV9+sxYLhXJs1s7MZ7akKODajBAQrARwVy+QLE6GFwXS9v5AKbcYIWo0jci2bd3PiU567eLlZRW/WkHteHd4JU9o8D1txgXTy1V+uzCKwSzlxBi0gxbzxWq6nA2izzmRWojCEMUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZokQCCj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZokQCCj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DE7C4CEE2;
	Wed, 16 Apr 2025 18:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828913;
	bh=Pa8CtMrmRipcqHnGu0QHHTWFJIGboQCpNY3td+rS4TQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hZokQCCjsyaqOsKwoPCDRQzfnyuArN0+KoLoUAaLtGjuQGurYmNpqGD9Tcd9ZAJ63
	 w6G0gV1YLVaJaIhG/ep4CfVEicIqNLwVZoeYFsRCSg0C7e5AWIjkbKzfpo/2XjR+S5
	 PIPD8hoJ9HP7he9h+7ZVFt7mGOKlW3y0RMHUhzXqwNz1I1hXuO8N5LemN6/eQnqqjk
	 ojD8p3bBsjFLsgj1cHcbtUJ8TYyJagVW6vR0nlUN2ZZmI4Gq4bZWyIIDi8KC9mLnyK
	 QHyUj1e3F8pSjPJSaQgZDYu1uO1tJiExFl72MotovVN0J9tbiRKUFTrsvweOlXBc66
	 GC1EVIrdDDUOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DB33822D59;
	Wed, 16 Apr 2025 18:42:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH fixes] riscv: Properly export reserved regions in /proc/iomem
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174482895074.3460781.13932594280682555131.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:30 +0000
References: <20250409182129.634415-1-bjorn@kernel.org>
In-Reply-To: <20250409182129.634415-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, mick@ics.forth.gr, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed,  9 Apr 2025 20:21:27 +0200 you wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> The /proc/iomem represents the kernel's memory map. Regions marked
> with "Reserved" tells the user that the range should not be tampered
> with. Kexec-tools, when using the older kexec_load syscall relies on
> the "Reserved" regions to build the memory segments, that will be the
> target of the new kexec'd kernel.
> 
> [...]

Here is the summary with links:
  - [fixes] riscv: Properly export reserved regions in /proc/iomem
    https://git.kernel.org/riscv/c/e94eb7ea6f20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


