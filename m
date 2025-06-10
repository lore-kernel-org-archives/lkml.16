Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DE243968
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572883; cv=none; b=f8jXbiMk9u6qPobU4fu/kaspnp8KOWLHak1n9AZUkW4VclFEHCuee8Fo/KL9+R6ccK2SXHXTq96d153Bf3nzyaQObk296N8/ehGsjrYE/uKXhV/sW2iGalsnmJiVaiaV0USFoe0R60UluZ7sxVMWwFPmuLf50vxZCzUIRNCxTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572883; c=relaxed/simple;
	bh=SkPBGvkpgQ3nFCxLZOT13cN8O1yX5EiXJoXMRQriIeY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UQioe5mKjEz2Qfqno2OUaQFBPt+T5qabv2pten9B1VceP4JUBUZ3L4/aY55ErO7ivmjfQrrkfEf9bVM55BhCj+bVwXVTbEWo4RnTgiaDQGSWLrjpeSi4lKJHkqBl4Z9adZQuHAHzzoIyLxO9Aaa23XttzrThi3cmCAjzncR7/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRiKtcfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRiKtcfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F46FC4AF0C;
	Tue, 10 Jun 2025 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572883;
	bh=SkPBGvkpgQ3nFCxLZOT13cN8O1yX5EiXJoXMRQriIeY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HRiKtcfFwLVXbkBo0HoIfLKEGThJUdz0o8YHcehAF7WXLRjgQHu9TMx4gMuBoJphI
	 cKUDSaytEbodsdBDsOctGOcCtlo3Tior0YuUzPLZlwOYYwBl091j4cYMAG3519+ZbO
	 yK8ytlOWYh9OEnnmoR5QhgTPfJar8RChkl+whcfKLJ/auSeLDLWiHtPqNNeVxfC6O9
	 LS3ZI23bykLMzDhH3kshZZ9+T0wk0JDPZ4BTr+Nz3dAGAQ7YQrHQ8QfdAwt/qsX5Z4
	 snCzfl37916BOuUyohc3AUYEE/DkdMJaA5jSTlhC3W0sTToFo9mWKhwWzOFSb57S/j
	 JGd2uudTPvpRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC9439D6540;
	Tue, 10 Jun 2025 16:28:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291349.2454024.1402673095899933089.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:33 +0000
References: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
In-Reply-To: <mhng-5795BA9A-41BA-4268-96C1-57114649A99B@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 06 Jun 2025 11:10:37 -0700 (PDT) you wrote:
> The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> 
>   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.16-mw1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.16 Merge Window, Part 1
    https://git.kernel.org/riscv/c/119b1e61a769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


