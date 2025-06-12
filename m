Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523BD1A3A80;
	Thu, 12 Jun 2025 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749764399; cv=none; b=sbV5Ygb94MkKqCiC07rdY/uSCiJ3W6SSs+pp77T8ZmgG8kSHVX5YNPcsrl3nER9rX0fpHZnCsdF7Ht4oCczo6hrUREBQG9TDFQutEnqeeUIpYSauIcsYa9tWQWlhtmgDHozZluMS7nff1kYU1/Nl+ir1zTRv2YCzbByRoffcLzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749764399; c=relaxed/simple;
	bh=ObnlVfJEB9QvQfc6CH70qi9cYvBWWCfz4W4K8ajRjeE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZQn0jWJzVrim8tzFu7ny1C7P4jcNBLwAByAejFNU0vajW2q5dgf2nNMh5KGDnvRJKUXsosBieBtNTI9baAl/PcI/dJpVZLxHLq5QsAiFsD4cIThYIVlFWjxa8DJ0mknX455iTLTAFDW8NQeVsyHDVpuhQgWUVuOfB0btGu0MCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URdeh8er; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URdeh8er"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0D2C4CEEA;
	Thu, 12 Jun 2025 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749764398;
	bh=ObnlVfJEB9QvQfc6CH70qi9cYvBWWCfz4W4K8ajRjeE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=URdeh8erkeYSt22fj8fayc6c4bZJHA7lByFZC1u17a1DVuVNn37zzHJFTG8IOzG6i
	 ZNDcL/Ddk8guWej01itzSA+cKJHlVSVabDe0dtmkBJnKWrkFkLhrxz3d4HeIy3YXDG
	 WhGrd/TAgBW6YeIKV3YVJricVoZ2zbfacQmic648YzKlzIVHDJcJJ9fQEndL3mjIgn
	 F0NJl3ivWa57tIbkI8vY3lgS0I3ItKU5S7qBMR5OXXQLCjGpKqPUOJUa6UC3Pp8uRc
	 4WumfFt2L8nln9ghQO9j7cDE4Q/RNzVdnlPInKxK07rd1uCGFWtE14bGWGnwLPNpzt
	 C08ny4y9bzZpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD363822D43;
	Thu, 12 Jun 2025 21:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174976442875.118664.14858626447477465303.git-patchwork-notify@kernel.org>
Date: Thu, 12 Jun 2025 21:40:28 +0000
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
In-Reply-To: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, guodong@riscstar.com, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed, 11 Jun 2025 22:56:04 +0800 you wrote:
> Changes to defconfig should be always updated via 'make
> savedefconfig', run this command to make it aligned again.
> 
> This will ease the effort of reviewing changes of defconfig
> in the future.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> [...]

Here is the summary with links:
  - riscv: defconfig: run savedefconfig to reorder it
    https://git.kernel.org/riscv/c/d958097bdf88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


