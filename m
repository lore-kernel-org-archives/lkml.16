Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E31A23BA;
	Thu,  3 Apr 2025 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697197; cv=none; b=lqCz2PYGkcRvPWYNXIHHyJ7zc513p9Tgu+EJww5oY62Xj5ISJRwlUx41bG1O1Y8k6b3e0dHXENp63IWtgnTat6+xDvmVFr9MR4CW7lUHod6wNXHK3rCZm6HeDtRsHfT5agKDXRd6eT0i2GRCzzTlyujK3Orl9gB2tBJFAbSfUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697197; c=relaxed/simple;
	bh=CaqBqUereHqZXhHwwqd9yvDXNCjIzmhZi6Y/BlkYcLA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rLYJM8d4VkMVNYmycTyPoVG9LLW9xP85wQ5uT6KYluHPtgkSWA4Yc9YAo4wSApioqUmzUYL0kYlG39tt5tQPkP6lrw5jlMvtQfRPEONjvgjbtbpSJlhF/2Zb04iHOL6dJHs/tnV7jfZGACDH0ClXmKnG5pQhjpGX6Rurh2ociBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8ML1qZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8ML1qZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBADC4CEE3;
	Thu,  3 Apr 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697196;
	bh=CaqBqUereHqZXhHwwqd9yvDXNCjIzmhZi6Y/BlkYcLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E8ML1qZZkz7sYG9w06ltotzKs7rn/Y3wwWhnJKwhTYaAVMAQaOBYlCxNNQLHmeUo3
	 ChlnLA2zT30/HAuhaquUDw+YLK3EE9K85Xu3FtXPGPdAyHEDI8/ENQwO0WSQhgBz8w
	 IyW38hVyHraWNK7J+KObjtlC+7gtqSnI1Zg107yfItdo1gUmKy2uOw8yGAHIBwpUCG
	 SjpnfHVUypc6/wt5+uyTNToW+dlar/lGducTyzbOxZX8DTNdEobA4Q0/Jj400OVrRG
	 jssocABKTYr5cFDzQejuVCNRlV8rIZ2t8kN8fXOzXCkYeFsweXlctIQpqNLhTh8+wk
	 EY9R9/PkbRzZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE53380664C;
	Thu,  3 Apr 2025 16:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/6] Add some validation for vector,
 vector crypto and fp stuff
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369723376.2563936.10648565099662367295.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:33 +0000
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 ebiggers@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 andybnac@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 12 Mar 2025 13:11:43 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> This series is partly leveraging Clement's work adding a validate
> callback in the extension detection code so that things like checking
> for whether a vector crypto extension is usable can be done like:
> 	has_extension(<vector crypto>)
> rather than
> 	has_vector() && has_extension(<vector crypto>)
> which Eric pointed out was a poor design some months ago.
> 
> [...]

Here is the summary with links:
  - [v4,1/6] RISC-V: add vector extension validation checks
    https://git.kernel.org/riscv/c/9324571e9eea
  - [v4,2/6] RISC-V: add vector crypto extension validation checks
    https://git.kernel.org/riscv/c/38077ec8fc11
  - [v4,3/6] RISC-V: add f & d extension validation checks
    https://git.kernel.org/riscv/c/12e7fbb6a84e
  - [v4,4/6] dt-bindings: riscv: d requires f
    https://git.kernel.org/riscv/c/534d813a0620
  - [v4,5/6] dt-bindings: riscv: add vector sub-extension dependencies
    https://git.kernel.org/riscv/c/e9f1d61a5e18
  - [v4,6/6] dt-bindings: riscv: document vector crypto requirements
    https://git.kernel.org/riscv/c/a0d857205756

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


