Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C92F7D0E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482324; cv=none; b=gofNIV3vRosaJoTmWYAijYFErGAOuOvuConW/18KPU/yn9g6juuEkQH+wUO/YlKdWKDa901mlwwylgPwfHZUy4lcXofGQYdSmv/CC0hzPFAPrpfiiZ5yCE3lkSRUOJnAmT/OBIKmXXX3rjPYpn0RxuHOZbJRDH7/zy37pH2j/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482324; c=relaxed/simple;
	bh=An5eZLxeHN2VPzfu1AgAXV1orrEO9TkqlxOeOGf0JUI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sB2bu/cm3uuQ/ldAW47e6u7/hT3WCO7qoKUQr/GzxKJBa213VMGL9BqkLqQlD6PQIUcKXGHQLfZJgrOtZZRaCJzJRoJR8C0OdkmKsD1wpvxR4Sw4fhQTYW0HYstc7lOZFynKlZ6xGvQY+2gL54hOpceMTpYQL7UCwa5w0B4AEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTnlMhIi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTnlMhIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729CFC4CEE7;
	Wed,  2 Jul 2025 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482323;
	bh=An5eZLxeHN2VPzfu1AgAXV1orrEO9TkqlxOeOGf0JUI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LTnlMhIi5PBxhkf7c6QGmLVj+n3EWVMy6XtrDXf1BYVJjOPGI8w+2GJ2xP2gwYenN
	 f8eUot2C843hDc3Qv7NT2RUuBrwUdxvf6J+TTgxJCHIPpUNIRZjXXOW2+5z1FbMcqs
	 kebnDUm2/E5lxmdGzCKcbub6zzzJLWqDSahxk+TcpYvrvrSJiIx0FiuyCDyscplBkq
	 GkTQQSyWkMRpGIP75gV8jW0gp5ewh0CrlCR1ykxKURHKCe5VffRDMsfFZ2ZoKT2PZu
	 SlTcr8452jxtAnPqPB9WcCVH+WD5ltdFSa3KXKKXpPoQYyCSSIaKk699mEsLfY1JZd
	 VtutKos1d+1JQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A30383B273;
	Wed,  2 Jul 2025 18:52:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Fixes for 5.16-rc4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175148234801.828808.9478212728527237912.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 18:52:28 +0000
References: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
In-Reply-To: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 27 Jun 2025 12:56:49 -0700 (PDT) you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Fixes for 5.16-rc4
    https://git.kernel.org/riscv/c/867b9987a30b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


