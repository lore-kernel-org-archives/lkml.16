Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6D28FFEF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047558; cv=none; b=FgggoJrDFfVYX3qGEhdgFTDHAQZHYrqu6pkMESvG7CZ4KWn16z/Hh4YgtO0F1pqWOVeCraWVoB2OVdrVJ1yTGCbYw9MeHrf5XOjaUmYeqlRb1FTEfH18nZFRMsP9TFtHjuW4MRyUeD3GlPMNsO/yVqRuSkIVQrvvfWDY4KD/d+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047558; c=relaxed/simple;
	bh=O87SbhJu8MiAOI5eh0Puuguvo3LgbY3USgQjEazZQpo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LzL6g8lO8NjFmX9zTGQmFUZIfBtHEVx1Aikm6yqFhDEwneaQ8OAAYGwmHFtA3TjAnSMPM6u4GXLDJ9OKVSh6R4IF3V7v+8uW23H+N8K/69q6AKAcQAP/IRYi+N221V78FvgsxLdPYjQw82qdgBiZaX4BJeYn41Tso5BgkY9tpNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEgMPt0B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEgMPt0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FBFC4CEE7;
	Wed,  4 Jun 2025 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047557;
	bh=O87SbhJu8MiAOI5eh0Puuguvo3LgbY3USgQjEazZQpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jEgMPt0Bgzg6ctCIJSWZMCZxt/hbyRD4wWVB6bkpUzlBPFnGniMjAvRLrjTtcgso5
	 M82G3WqjhsGU5gRwiW5dGGwMelMyEKKYQSNfgB9uWO0WzdokraZrqLRYG3y1q6DHfm
	 H1BFiE138JGS4ur6BRfCrSw5eU7fTHniz6A35Waf7gIKDOHMh3K6w6y+fCe1Tml9zx
	 ewnP5ePr652n+i6PhJ+wl/ra3pMLXtrzkOBLpdb4FQeI+OfHcVbtU+keVtm70lq5dy
	 nApBuyYdbsUm61Wqg1hO/XIuv/z1+G3yLwTeqrdeVzt2rXca3xP83euqZOygiXT9ff
	 6nPtW7/GM1w2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC1E38111E5;
	Wed,  4 Jun 2025 14:33:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174904758974.2309006.8809303189389627595.git-patchwork-notify@kernel.org>
Date: Wed, 04 Jun 2025 14:33:09 +0000
References: <20250513151631.3520793-1-namcao@linutronix.de>
In-Reply-To: <20250513151631.3520793-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue, 13 May 2025 17:16:31 +0200 you wrote:
> Add KUnit test for riscv kprobes, mostly for simulated instructions. The
> test install kprobes into multiple sample functions, and check that these
> functions still return the expected magic value.
> 
> This test can detect some kprobe bugs reported in the past (in Link:).
> 
> Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
> Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
> Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: Add kprobes KUnit test
    https://git.kernel.org/riscv/c/91d95bd795b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


