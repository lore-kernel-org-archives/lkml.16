Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF92528F3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697204; cv=none; b=jugegVmQWV4ZM3ECzQO7PY4Nws3JqE4iEdBArK8KwX7muhVoyXyMd6YUv7lRgfg3J1hIAhRhenHlx/6nVssIAyOcS+MN++xxE9B2ujr6qq8YTqWM2pzuR+mXLL2gJS2jk4R1KKUXRBhq8bBMRr35lI5dYc7Gi4VB0TDQut9wCeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697204; c=relaxed/simple;
	bh=rcZGb9wxRSmf6FvWkV5IkQo4iouEKnBTw/tL9ai8L5k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XQUQ/hfviYsPTC+5Xf008z41auHVrkhDN55pq7F2wihPoAdlh60jYAXH7LvjrshPHgQmY6xpE/z1Ao6Hlq/J2hi3siIc0pqyGc9B5uK/5AnvoDG5bDtPE6ySVOGckJtpU45tdprRefiSPNudMbOKRZ7IIjNbZfhGeJVx8VJtsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukqS7FSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukqS7FSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C096EC4CEE5;
	Thu,  3 Apr 2025 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697203;
	bh=rcZGb9wxRSmf6FvWkV5IkQo4iouEKnBTw/tL9ai8L5k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ukqS7FSfDgHDsXobOQquum9UKC4IZ2AITSYbMox9R5akm/JU3bfb8sSTN4yG8775M
	 e6JaH8UfVlOHfqUSUglp5+HJV/FnmMkf3rMfC//iedOQWX3Yjq6iHsiLtprwp601pv
	 vdYVHjVo5UPtu0Ms1rHXPvlNisq7fECSaRhVPRY+5kmH9FvfeoPjLsNRpThFuRB0eu
	 pl7MLGcDBIlKqIS400H6+PfFFWDPBOqYCygiNFVBZTcgv6QMNl2Fj5VXxVXrfUZAua
	 lx/suIVY4rvli6NErTEf2dXZGuxpiabEGlg4oMvGxH2r3Y2+y0Mf+rbHnHubCDAT46
	 yudOUEv4aSYNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBA6E380664C;
	Thu,  3 Apr 2025 16:20:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Fix hugetlb retrieval of number of ptes in case of
 !present pte
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174369724048.2563936.1581552891050877179.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:40 +0000
References: <20250317072551.572169-1-alexghiti@rivosinc.com>
In-Reply-To: <20250317072551.572169-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, panqinglin2020@iscas.ac.cn,
 ajones@ventanamicro.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 17 Mar 2025 08:25:51 +0100 you wrote:
> Ryan sent a fix [1] for arm64 that applies to riscv too: in some hugetlb
> functions, we must not use the pte value to get the size of a mapping
> because the pte may not be present.
> 
> So use the already present size parameter for huge_pte_clear() and the
> newly introduced size parameter for huge_ptep_get_and_clear(). And make
> sure to gather A/D bits only on present ptes.
> 
> [...]

Here is the summary with links:
  - riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
    https://git.kernel.org/riscv/c/83d78ac677b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


