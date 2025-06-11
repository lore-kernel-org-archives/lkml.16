Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D027C8CE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605398; cv=none; b=PDsJIW23ZJUVmhlJxFmFcwyr83g1iHcb8QNYzlt6lIvqqw+27WmKK53lN8zsqaj/xJVmpSGgrUpwuSmhuVoNufRYitTbgBj4p5FmmeQTo7RbbXa5D9sIoMc7Fe2gt7LHGg+p/vfrkSDMn6rwwc7bS2hmaqkxUEnpp84p7SvjdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605398; c=relaxed/simple;
	bh=r1RV6yWcPTMdXv7fcO+LFlOF0On2abCreVsMxm4BoXo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PEkMmtAq1fG6DSDl3v8aeDXcuzBF54fJHK4HFgST6K2SBDUX/+Zqg/AQkze0xjxh20hIOn3Stmbg0m4CzZjtAGUPGGcodXjvSeaFvijzRlo4NPTIAsjipVOETWfsw8PHOu726hR7ENy8nJCMw+m0kdQy+9O53Osdp+89tLqMxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBU4i5CF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBU4i5CF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A6EC4CEED;
	Wed, 11 Jun 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749605397;
	bh=r1RV6yWcPTMdXv7fcO+LFlOF0On2abCreVsMxm4BoXo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jBU4i5CFrmBcAS/iwe2PgxqcewiXD1vFGdE3VUxmepKIju5h1vBe+VFJp5WTe8MUd
	 rDsIFriUPwrZQOdQPBNCfuX0jZydOvM5qDiGEd/tHd+FzGzFbsSl8Qm/e04ljn69oR
	 Dig6eQByqMlPJ4kffeQyG67e4/ccC0NzqSZr6YDdTMR1OMXD8cd6R6HRAIdfmkgYAp
	 rHg5c6j/Xa/hnTbHzpLZ6IOX9M9Pc77wtuZpJ2VPNfVzGBUyc8WCOOm+tlQLOTM9Q5
	 oawapUlxdvsoIVPxMFXB3erJnvGoKnrday+xzliO8fEJC78nMrkxrWT52POFguexqA
	 Gfxb9cUU89Elg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0839D6540;
	Wed, 11 Jun 2025 01:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/1] fix riscv runtime constant support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174960542825.2762376.5266886940672974555.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jun 2025 01:30:28 +0000
References: <20250530211422.784415-1-cmirabil@redhat.com>
In-Reply-To: <20250530211422.784415-1-cmirabil@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, charlie@rivosinc.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Fri, 30 May 2025 17:14:21 -0400 you wrote:
> I discovered that something broke basic booting on riscv64 for a nommu
> kernel with a minimal configuration running on qemu between 6.13 and
> current master. The symptom was that the kernel would hang and print
> nothing instead of booting normally. I bisected my way to:
> 
> commit a44fb5722199 ("riscv: Add runtime constant support")
> 
> [...]

Here is the summary with links:
  - [v1,1/1] riscv: fix runtime constant support for nommu kernels
    https://git.kernel.org/riscv/c/8d90d9872eda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


