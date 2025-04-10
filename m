Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036701F150F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258199; cv=none; b=kztMF2HUAbM9qtbQm4e6ia1k5f3uEXPdUXV+BLJ+pCxQYEPknAAUw6zKUpf0KkzbAd39HB4Ma2bwm66U3qecEH81MtUqezA3fuJ3m7QmnXGz8Vz6NjMGrlMaGzotroVTA7g/hJiLzu7uEwEDjmDSTxG3cSDCxOKsfq4fhq1UZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258199; c=relaxed/simple;
	bh=tEYKdeRfcTul1MXSng5Vi4LchF3VJtYyaCoLzaI3JlQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ctWo7RQzeb8G5xfdJMkbBqYCm+bspbrZHe1AZov0o2+7rx9UGfDLNbyKD5JTwLFR0nm4XJC3/1+ig0SJU3FZrnLTe+mK9FUWZG9cI56J45BbbDecSCwksSYunHqruPfTw12tWtZ0r2CO4kEqonquyPMTKtE2QprCoEAwOEl7+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDx89Fo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDx89Fo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734B1C4CEDD;
	Thu, 10 Apr 2025 04:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744258198;
	bh=tEYKdeRfcTul1MXSng5Vi4LchF3VJtYyaCoLzaI3JlQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DDx89Fo7xPntr3qDjxYlXciVCvbp6GioM+KiN9FtVMx0V6STJ1Iv9ICXlkWeteMah
	 RNgnt2imnCKxAPXjCDPLCVywVy6iim7IA7IrY4krL+fG3VNnUAsoXNbYl5FuG+yLQb
	 QsrUyYApr9dUkJiq6eBzLxBhprXvj1CgCPS97EV8QpnYNCzl0UIONuEWHy3EnPqjhc
	 ie228EpCqVK00TCnXjNd3wTS4t4nLlrFHiQsiUWvPXNcnsFnS//g2K6fj34xstQBFI
	 1HDiohBEodhYFcrB/8eNBaxAtQoqk7QxLtlkufiKfH1V7LZt1dRHT7DZsNfozmbrpE
	 5Xi17LciWhFsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 30925380CEF9;
	Thu, 10 Apr 2025 04:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support to disable linear lookup
 fallback
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174425823600.3146257.11616360860207146898.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:36 +0000
References: <20250401035800.51504-1-chao@kernel.org>
In-Reply-To: <20250401035800.51504-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, krisman@suse.de, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  1 Apr 2025 11:58:00 +0800 you wrote:
> After commit 91b587ba79e1 ("f2fs: Introduce linear search for
> dentries"), f2fs forced to use linear lookup whenever a hash-based
> lookup fails on casefolded directory, it may affect performance
> for scenarios: a) create a new file w/ filename it doesn't exist
> in directory, b) lookup a file which may be removed.
> 
> This patch supports to disable linear lookup fallback, so, once there
> is a solution for commit 5c26d2f1d3f5 ("unicode: Don't special case
> ignorable code points") to fix red heart unicode issue, then we can
> set an encodeing flag to disable the fallback for performance recovery.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: support to disable linear lookup fallback
    https://git.kernel.org/jaegeuk/f2fs/c/51dc491a0855

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


