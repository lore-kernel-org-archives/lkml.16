Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A62A242D94;
	Tue, 10 Jun 2025 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572882; cv=none; b=thzhjAkk2KgzC4r0l5Wb/b79hKEj1T3/1Xj8lsgBn0UtqCWTt3kRqWdsU7sXBUujhVBLTQkkGVN60FXaLW5rprta1pWm8HbSN2udNQgfMR/sDuceMT9MVWryxaYpzo6M7tkr+ez/2pRzbdiqhQxHB8ilNGtv7joLDu0efYtEqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572882; c=relaxed/simple;
	bh=XpKG6U7SUEDx6WcwKev1QZDTNBiTYhfWnKPEGgxnf44=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tadiVFA60pM/g0GIU3F1Or72YHJrsaBibq+91bOZ1DmKydzZCRn68X/J0STmUy5CxOgqokKgbcTXsz2ahrLx0NoAtu8HhrmeDRWCA6NRj0FFFLJ5jfuQoi+OAVfHgTx4S+j0Z3g32zelqxVyrs9UxgQv1KeoSjlhHlkeBCH6dus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIGC3Ft0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIGC3Ft0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA8CC4CEED;
	Tue, 10 Jun 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572881;
	bh=XpKG6U7SUEDx6WcwKev1QZDTNBiTYhfWnKPEGgxnf44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dIGC3Ft0E6fUFpwr5EO0a3vwKR/NPZcxmwIAFd++UTG7xF2tN8FNLwHMN13cM/jHH
	 5U4ujPKj92PwceN5B04bQA3Diedc6LEKja3TlErcKgrHoqSEX/IEXNJSGOePMS904m
	 9P4EKz+t4O7CjXuLpMTIA99/iaxMWrgvcyv0EgNyqhsw4kiBXJTCws/KV3RJHBmqOr
	 h6fJ6t8o0E5+Gkv8h7SumAxho0F6pWXhbf9qWtRhy7Mja6ouSNVbgxTEzLOpC5nzmz
	 pctGAzAajYZLL2jJoUiPnZNV0Z1xy8HkHBFYw7PClnQdPxIMIctEcFy8YNKu5LfBjr
	 JQM4OCFhIxDlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B1C39D6540;
	Tue, 10 Jun 2025 16:28:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: Remove obsolete cpu-topology.txt
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291224.2454024.11937218792717571483.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:32 +0000
References: <20250410201325.962203-1-robh@kernel.org>
In-Reply-To: <20250410201325.962203-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, samuel.holland@sifive.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Thu, 10 Apr 2025 15:13:22 -0500 you wrote:
> The cpu topology binding is now covered by the dtschema cpu-map.yaml
> schema with all the relevant descriptions moved to it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpu/cpu-topology.txt  | 553 ------------------
>  1 file changed, 553 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt

Here is the summary with links:
  - [1/2] dt-bindings: Remove obsolete cpu-topology.txt
    https://git.kernel.org/riscv/c/3fb7bebcb6e5
  - [2/2] dt-bindings: Remove obsolete numa.txt
    https://git.kernel.org/riscv/c/540994337d47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


