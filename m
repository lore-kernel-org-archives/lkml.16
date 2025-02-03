Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC92B21147F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610128; cv=none; b=cClp0Not4tUlnVJRwHd07fSNayqwcW39M2AOWpeEi0L/dKRFSWoCogQyR1HQGfyt9yJCqFYtk5Ff3AnFvExxSxUVcDMliop0iltuffPaR4uCY3yarBGW8oM2wfcA/SGdKWOgiXOKa2LZfUKL4NNuGf1djd7/YHCor+c2ZBsNNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610128; c=relaxed/simple;
	bh=G71XgD6NBttNoh5ePrRcBF+6xM6ctRI91NRyBpdswK0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D73oQSKpc1RiGMj3wrb5HFmQTX9AAnOkuReqSlQclBy6IoUL3nDRzoXmHwcUW9FlbShZi523bkOb75KzZLAFUnePDXTfg3zT99SRj07AMV6Gj0AC9YqqVglYnUsF8EZc0FVM6DAFZTWG39O7WUR5q92cMd3nWtk1yLzy0A8jur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZluC7Sfb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZluC7Sfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A335C4CED2;
	Mon,  3 Feb 2025 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610128;
	bh=G71XgD6NBttNoh5ePrRcBF+6xM6ctRI91NRyBpdswK0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZluC7SfbnMeE+VOg8JwLzooSY3dCbr72C9MRFkgwlmd30uv8ConOhriUQ7soaM8y+
	 mef8HwLZhwfSng50uOZgz1nCDsQDdYVt8WKpJVVqaDzef33NLiz9cmPChlqc1SmyhR
	 dBvI2v9l9GEHpvCiOx9jdW738UgsUZHqP2AFr+6AX65hydnqDcbgveKJr1ycS913rm
	 jxlQEef9ETeu2JWrTmDdy2pOvfFnasyhWXahs1tF0jr2YDWg/pmyZftQ0f4z1llkAP
	 bhYBMZayliLbA5y5G9TRmo5/HqBZ1SpoqCWkTZ5p+sScyxpiEYo0wVboG8snoBb9ec
	 O/JQl4tLSoFJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3BB380AA67;
	Mon,  3 Feb 2025 19:15:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND 0/2] riscv: iommu: Add shutdown callback for kexec
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861015549.3409359.6278773851647840223.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:55 +0000
References: <20250103093220.38106-1-luxu.kernel@bytedance.com>
In-Reply-To: <20250103093220.38106-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, lihangjing@bytedance.com, xieyongji@bytedance.com,
 guojinhui.liam@bytedance.com, linux-kernel@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Joerg Roedel <jroedel@suse.de>:

On Fri,  3 Jan 2025 17:32:18 +0800 you wrote:
> After kexec, the newly booted kernel can not initialize iommu driver
> successfully as no one resets iommu state before kexec.
> 
> This patch series supplies shutdown callback for iommu driver. The shutdown
> callback resets necessary registers so that newly booted kernel can pass
> riscv_iommu_init_check() after kexec.
> 
> [...]

Here is the summary with links:
  - [RESEND,1/2] iommu/riscv: Empty iommu queue before enabling it
    https://git.kernel.org/riscv/c/8d8d3752c0a4
  - [RESEND,2/2] iommu/riscv: Add shutdown function for iommu driver
    https://git.kernel.org/riscv/c/77a44196abfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


