Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853AD28468F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546590; cv=none; b=A10jpMyp0Y/VMOuW5Cxo/am6jU3/2sg4VK80R43c7fyRymhWtioRoEvNymb+Sc0sUFjA2pM4FZ8nuGuHFG9ZUuU7rnJhcVMoW3l1GaTwjFJnWbvBMdljUpNumLU3T6IJ3RinnpI6xy1pxUhggUKLf8REkJkB5I9Cl3KA9mCZN6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546590; c=relaxed/simple;
	bh=eZ12zjHqBDv3Di0J7CrGXIw28xIk1srLukArWBz7LOI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=foq0P+/8MVsu0UbU/rNeuBF5iebmC6XAIYZW3ec/15seSbgaQ6BBivRMNlCj5O/buwR/o0BF/XX3neNX2RjxSIs6nj7IPNDVJE9Ia1kf6Eqie6c9lBAco/MpbBwhfKb4SnXdF8q4UwSO8krYocghl+x6T75XTqlRLIr+7faUdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPUk0Vu3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPUk0Vu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E0BC4CEE4;
	Tue,  6 May 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746546589;
	bh=eZ12zjHqBDv3Di0J7CrGXIw28xIk1srLukArWBz7LOI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MPUk0Vu3hFq3XQM2HP84gvHrZ71GqT8bbdRmrdHy6mBsNviIicbHmMElcDoXKzxB8
	 P3KL3zWM5FbV4p2UU4twxSrIyF7kneMvPxfEp4sU38YCf2po0CCQdEfQMCAihxQUI8
	 YHcE+9UzF+0/z+Y68EOvaK05x96H4zVKlcaBPJFbvxFl8svJ+Qf6ppn+nsyaviKxbg
	 Fne4urRU3T8RivPE6q2/km+6Y1Jl/4KZqe99R1d9Ha7ARjPhxmdCczEnVbm4l3jprB
	 PxdaXa0mRMfSbIOAK8S9j1pbRXNdk82eQNjp8slt85OO1FwUPMX/fwnnMcSIySNHaM
	 65EoRguffqF4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B77380CFD7;
	Tue,  6 May 2025 15:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: sysfs: add encoding_flags entry
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174654662900.1568197.9643895525173017879.git-patchwork-notify@kernel.org>
Date: Tue, 06 May 2025 15:50:29 +0000
References: <20250506074725.12315-1-chao@kernel.org>
In-Reply-To: <20250506074725.12315-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  6 May 2025 15:47:25 +0800 you wrote:
> This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
> it is a read-only entry to show the value of sb.s_encoding_flags, the
> value is hexadecimal.
> 
> ============================     ==========
> Flag_Name                        Flag_Value
> ============================     ==========
> SB_ENC_STRICT_MODE_FL            0x00000001
> SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
> ============================     ==========
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: sysfs: add encoding_flags entry
    https://git.kernel.org/jaegeuk/f2fs/c/3fea0641b06f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


