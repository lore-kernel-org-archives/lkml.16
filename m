Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B4244670
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572888; cv=none; b=jbx104375xJraAReG088nK0sqS/q0qdBH/7NptoD3VldpY/K6aJ4yYSIBSRpDoTL7SXld2Ifm8zJxd8nmtg/2z5kp9wTuleaGvd4DgdrzWACaZOt2eqa57Ipmos07q/87XkTqWrm31AJzqXmWv6umWGu41FSJ+759nniaMTAbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572888; c=relaxed/simple;
	bh=gVVDtdo+XEAFkN3H3+WoNAnx5w2ndueoZSJP/uuRddc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EszWrTJDUHDuEPL90IzpJqFHGp08c10tSE9yfk+rl0ljY7kQAFKWz4tOOlLO6ZyZcfNV/U3sbRN1VhJ8PHuI13fl808EiLzaPBeyjR6XXukxfCaB7mT7j4h8tKCohlzg+l+v7ezxGluCa9NeB5XSNLnsg8bObj4/qx2c3DWN8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUA1NH5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUA1NH5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E6EC4CEF2;
	Tue, 10 Jun 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572888;
	bh=gVVDtdo+XEAFkN3H3+WoNAnx5w2ndueoZSJP/uuRddc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hUA1NH5BcVQ8M2fdOev8wUS9K1hf4GAu+17GC/5e4eBsPBXuNSMfZMfW9fzrdHSpC
	 RzAxDkuJTJ5xCWRLBMsWb87qO3dlp848vabbZG+M6Ztz0H7I3/oQi9VOknaZ89/0N5
	 TgFDcXUpIC/ReEveqk+qA3v3tufU3Cy7w3pRHos9cTGQgKNx36dwJ1gOiVqX/zy157
	 yVIPje/kEn4IQmpwIq6sPnXKx8VQ8C+FTI+a/hiEl/idhv0ZfAlmxPHjws2hfVUv9a
	 mOkzT7vh1onFAMFh6QAHCkBV9QvbNbb+urRr2Gp5r2t+4zON3T+B6tWMmhiUuzSRK8
	 fsGK24F4h0Ydg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCEB39D6540;
	Tue, 10 Jun 2025 16:28:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] irqchip/riscv-imsic: Start local sync timer on correct
 CPU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291849.2454024.7268696984666677694.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:38 +0000
References: <20250514171320.3494917-1-abrestic@rivosinc.com>
In-Reply-To: <20250514171320.3494917-1-abrestic@rivosinc.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Wed, 14 May 2025 10:13:20 -0700 you wrote:
> When starting the local sync timer to synchronize the state of a remote
> CPU it should be added on the CPU to be synchronized, not the initiating
> CPU. This results in interrupt delivery being delayed until the timer
> eventually runs (due to another mask/unmask/migrate operation) on the
> target CPU.
> 
> Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-imsic: Start local sync timer on correct CPU
    https://git.kernel.org/riscv/c/08fb624802d8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


