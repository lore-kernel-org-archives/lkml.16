Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AC211A15
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610133; cv=none; b=pejlXime6MrONzj48PrTwgiijb6sSYN1tA1SKNRo2Z9otcu+83HrLijPOanfEIAHgm5T3NBF1zPFRYRVmG5sLCuYAbMdpFe6oHenPhXn/ejdlLGWw3usjzN1jqtVRLZOBCqHcBc5Vf4y3c6NIZTm/I5Vh1SAADfGdM8zR4YCG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610133; c=relaxed/simple;
	bh=hBLhlVSC1SmOlLRf8RDLAqvCsEbTbnRq4ZQNK7Br7uo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WOkHiE/QnFIuzPXw9e1utTWsvPnvAPP/iyROSPblPCI7P0K+df6pZcXDvZ20Wky0JeyD8tClyFDVXR8R+2KgDOu3Yq+QtIzs2yaXo5lB3DJfauI1HNdF7CBbufv8FDIORMaspmn+jVKxGDVerIuatCxK5iImmboP70LfaEARtAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClnQsAz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClnQsAz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAB3C4CEE3;
	Mon,  3 Feb 2025 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610132;
	bh=hBLhlVSC1SmOlLRf8RDLAqvCsEbTbnRq4ZQNK7Br7uo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ClnQsAz5OX2tLhHtVD8bfZen/YHh+8vlLKQKg8bPO2nKNkXim973IcVAkQNpjJmTj
	 tTPQagPuP5OxVqYg5xehg/oKrKHDctXRhTI0aQE5I/G3DqmQZELJXgyORI+kBysDrH
	 jyK+GIBjnuJrD11YxtROBOqGr5kioEqfYtCpZIA9tUM/ubI3HX1GeWej1ABHin5PUu
	 dfq0ojMP4yk2SACTHcy7ZI6hRLLa/oQNvhOzd6UyLAjJAi88gzj99e/p1x6MlPCXRF
	 nNY9IGtuq30nHFVZFuTkCevkerlhvG46yrmy9dofKD4BAMxNIBZTOzr2DyA49VFv0L
	 gsiYVvD0O9U2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7E7380AA67;
	Mon,  3 Feb 2025 19:16:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861015975.3409359.10153354970429495632.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:59 +0000
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 31 Jan 2025 12:08:40 -0800 (PST) you wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
    https://git.kernel.org/riscv/c/1b5f3c51fbb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


