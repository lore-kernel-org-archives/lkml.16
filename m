Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3053250C0F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697202; cv=none; b=Zp8QRINr1ZOSQxMlhtnod9cKLNNlpMylPT3kXn5bnlTabjyDXhgmi2u9wdeiwtYUPccWbjSQtAC4ir7aBNwvTLfvLqrXA4XIjBb/uW6gc8jotQpyPug0xzt86h+ataz2alT47lO6SVHz/B8PDgToivxveltkLaEejP2I9ztJ5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697202; c=relaxed/simple;
	bh=bX/eqFqTAZib4IifIZyHWRQYMwAIbQlXwCICt6K1lso=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I9wzaXK9f4xF/NrOwacE15UR4wTPQja5NGGdFBMtut4/u8NoFZ9ynebUHB1dkVkdMMcr+px4QZWVg3X8Rcpr1TwK+Hic0GnjEc8/qt4wFTCn3yJHliSmSLLqVyDH08Pr0osGcR18pL3Hdg7EhGDqCar5f81Jv8PemohLg4VNKBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA2z4Ni3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA2z4Ni3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4742FC4CEE3;
	Thu,  3 Apr 2025 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697202;
	bh=bX/eqFqTAZib4IifIZyHWRQYMwAIbQlXwCICt6K1lso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PA2z4Ni3NHkaparTHZPL+uyTig9fbaFWAexoEt2ORhGOC2jyu5dqfj6oz5Oc0JKeT
	 OuVNZeCiqkHezq3cX6aRPJjuyZEBwqe7AfyYMwd2n44nE0pFU1F/qvYiPW8D4Qgajg
	 th4VQiF64ThMHqu0IlzzbG9upBmGs7o3zIAFqIbJsXs2voJB+cnCWXjm4jHGkt3400
	 oLQbwd8FroYOJRqHO9rBhNMdzCZCigHraTsgAzdQBZwfMEr6neZPMmsRcVd78uyj0w
	 +PnKpADnP/TPkiSKgQHkun7BLIy+LIqPJTuFdRw7LJkS//2BIVRkRhB6vUXSsVZq26
	 wggFu5zQ7UWnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D3C380664C;
	Thu,  3 Apr 2025 16:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369723899.2563936.11573121851709668346.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:38 +0000
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
In-Reply-To: <20250328115422.253670-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel@vger.kernel.org,
 lkp@intel.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Fri, 28 Mar 2025 12:54:22 +0100 you wrote:
> Old toolchain like gcc 8.5.0 does not support zba, so we must check that
> the toolchain supports this extension before using it in the kernel.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503281836.8pntHm6I-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Make sure toolchain supports zba before using zba instructions
    https://git.kernel.org/riscv/c/8a2f20ac8e14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


