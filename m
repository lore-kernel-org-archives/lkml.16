Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5C5204F99
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725633; cv=none; b=KT/dnjDD7U7NduqKOU6Pm/kk0nmryBLMa5oWtsQXM5eFWQ2w6j7PCDmZBJZv2SRyKk8Et6mnKcEZrMoBrNSh58ZnpUQ3qb3/2EXZR4PnCvnR2q9KzErtNgDZueJVbiFiyESdGJD9MEud6TyeY129XHmgOS6YUMp5SLeOxV9Be0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725633; c=relaxed/simple;
	bh=dLtQNA42iMbpSsSLCp5csx0b9bOIqDZ/GCWrS/GAOlg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=p5UbNpBzb5WXR65/zfD1xwm6uv9xCTdfksVw5z2x4Vj0uxwzSvfb/8G/yRSgAmSfMHYHKxTEl0yXGlHHeybOXZ86qR/txy8Oq3HFuk8ykLEMIiQlSvkcr3arjeHngYy4i+51wfmRZn2PWnvo0YV2s+TjdxISR5Oqmse6l+2m8Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkrrOnaW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkrrOnaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B85C4CEEA;
	Tue, 24 Jun 2025 00:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750725631;
	bh=dLtQNA42iMbpSsSLCp5csx0b9bOIqDZ/GCWrS/GAOlg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VkrrOnaWFROkxeh4gq5kv8R9uf3AfO4ro2IbrsHTYk7uy3F+/Kwys019DS6BTLNoE
	 VNxc5GDROqkszJ3VtljGW8bcd2tUpn2XPzT7BDgMZNl41Y7g9Oad/YWO8ikINaOFIY
	 FpuD5YKoqMQ6xQCLlC46LmH9N1PKwLs+tgWdXPhjpkIuqHfWvOxwgo9iFtkaH7RSa5
	 xXpIDhMjCrnT40ktuufKiPe4kj5qWq9TzX2OFN1fbj8WvYTv1OEa6IZlCzlIc5O223
	 Ax62nw7yUaz+l+gJURB8F/3FFI3J0MMyRSZaS7whLQY990ZcluCS8uv5qRsGOrsxM8
	 RIqw610UndTcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C1939FEB7D;
	Tue, 24 Jun 2025 00:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce reserved_pin_section sysfs
 entry
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <175072565899.3346761.9675336685729970783.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:58 +0000
References: <20250613055109.2335-1-chao@kernel.org>
In-Reply-To: <20250613055109.2335-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 13 Jun 2025 13:51:09 +0800 you wrote:
> This patch introduces /sys/fs/f2fs/<dev>/reserved_pin_section for tuning
> @needed parameter of has_not_enough_free_secs(), if we configure it w/
> zero, it can avoid f2fs_gc() as much as possible while fallocating on
> pinned file.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: introduce reserved_pin_section sysfs entry
    https://git.kernel.org/jaegeuk/f2fs/c/59c1c89e9ba8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


