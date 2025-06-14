Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D922D9EEB;
	Sat, 14 Jun 2025 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927601; cv=none; b=FdyK/w+CBLrb0Z9uJjubie7qahvCFOo9znMm0qsnjdHgxy/23LmZD3wzntm7YHHE/V9yEZTLFXXyV+/ZBVZch8f6WyNkK+LXN7F9Iu7MKKS/48w8hpZ4mUthqXev/6shHwjzOvEHdx0e2zYWbe/LJcHh196VTCai856GqrP89p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927601; c=relaxed/simple;
	bh=fq4DvLoofZqWBzB6DCIk7+wpoW0fii4MRbpBebm9/gs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pv0Q/QT41C1D4iy6VwSmGal9bwm8RZ3R2Y1ubClzlqZvj0zH6R/eu8vs1bQY7HfxsC5ntNguMZhbuShXiyb1DB3SIqYH2epM2GjZ7CS2KS6DEbbIuSC1ZJbMN29GvJtpo1ABkcTy2AEXNCE78p82pXfNmAOioArUMk2CdCdBhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVhPZXuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVhPZXuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB6CC4CEEB;
	Sat, 14 Jun 2025 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927601;
	bh=fq4DvLoofZqWBzB6DCIk7+wpoW0fii4MRbpBebm9/gs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iVhPZXuFFPiOWfWCuPbHX7nb+0vMd4FqLV48HWoAQzG466CWosfzfn95PQ+ao2Wrb
	 BKWb/4bV37U1sS1nq/fObwf08uBMVHDCckvddiFj4SdIntWpf3USujpfB5B2GK74LW
	 7rWIL5mLd6duGM4dL9rsozBH5edc5MFVM4rmt5CCutUYv/gekhX6yyij1AbxNvGk9s
	 l75mbw26mk/pXiKo4Hhfm4f/s5lmlGG8D6JR9KkxCEesuFp3ioT7KRxxY1y99HMYBz
	 JOEur9BsQ4pxJk8PQhcSjzKOrN24qdvY2+rfJuOX6sGMymftKmX5/IoW3rbr7u126C
	 JhDoS2cTA8boQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DBE380AAD0;
	Sat, 14 Jun 2025 19:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net-next v2] net: sysfs: Implement is_visible for
 phys_(port_id, port_name, switch_id)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174992763074.1151198.12926690918861173112.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 19:00:30 +0000
References: <20250612142707.4644-1-yajun.deng@linux.dev>
In-Reply-To: <20250612142707.4644-1-yajun.deng@linux.dev>
To: Yajun Deng <yajun.deng@linux.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jun 2025 14:27:07 +0000 you wrote:
> phys_port_id_show, phys_port_name_show and phys_switch_id_show would
> return -EOPNOTSUPP if the netdev didn't implement the corresponding
> method.
> 
> There is no point in creating these files if they are unsupported.
> 
> Put these attributes in netdev_phys_group and implement the is_visible
> method. make phys_(port_id, port_name, switch_id) invisible if the netdev
> dosen't implement the corresponding method.
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v2] net: sysfs: Implement is_visible for phys_(port_id, port_name, switch_id)
    https://git.kernel.org/netdev/net-next/c/0c17270f9b92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


