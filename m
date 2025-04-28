Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2D2144AD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880019; cv=none; b=Lca/jQKZ0/GCIN+oW/U2EJdfuIwEGEsKSIW4DMuzA0/i2p4dczjTGFFEwYaH2rSsGURhuh5SZwB8eGVTXCXL4ns3WdbTywqtE3qvn+HcTGqlursJpMzWSis6DlpZnBnz5m8wsrDrM68LQHlvVGQSDOEqp4lASC2b61RBnuBKEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880019; c=relaxed/simple;
	bh=xR58l5ApOwkgDREvZIoci6c6A90X/0HtsU5oc8bqiEc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=d5bcgn2aJNjvPZ2KlWsv4eRokQluiyhl54h5s21pTwfvlZKoK5bvti7Ow8DBY3qDuy+Ng/p4wvTnpic+dIddTnplWeD5Fhb4zQXsPFkV+sgOA7jBGQuih9PDM82kVouV20nB/YaM+9MPwf/vPvrmpcIdXwIQuHkapA1mbd32MHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxjCt+Mx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxjCt+Mx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D189C4CEEA;
	Mon, 28 Apr 2025 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880018;
	bh=xR58l5ApOwkgDREvZIoci6c6A90X/0HtsU5oc8bqiEc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pxjCt+Mx1daBhAgH7Kg5hP60oSgkR2jVYst1meRjjHV8TRPyk0lZWN6F9ZS3V9vFe
	 RF8W8qxGIo8WM3lTA1PNEHCIImaOzSUBezmqR1Cy0Wf/v/5zu8Cn4RhKY92wEwQmIf
	 4mvQ2gvt6qQiiSohy6oZ/o/UQ7U//k9YCyHKCC1H0nUePxjcZdiqIfri57bQ1v2hhN
	 CbM/YbtYC+6J83Thk83QOR0cZixk7ZuG9JgTyIziGbzaXXGy3WHE9WYta6BdSf1Z8x
	 kvocfGJfbqM+nskk6chqeq3xI0r31DFBk5gg/OEdAJtVx0TdBwVYzOi8/ibt/CVurX
	 OslD4f6xE+taw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A163822D43;
	Mon, 28 Apr 2025 22:40:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005673.1067750.3162104682532482124.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:56 +0000
References: <20250410031019.2884852-1-chao@kernel.org>
In-Reply-To: <20250410031019.2884852-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 10 Apr 2025 11:10:19 +0800 you wrote:
> A zoned device can has both conventional zones and sequential zones,
> so we should not treat first segment of zoned device as first_zoned_segno,
> instead, we need to check zone type for each zone during traversing zoned
> device to find first_zoned_segno.
> 
> Otherwise, for below case, first_zoned_segno will be 0, which could be
> wrong.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: zone: fix to calculate first_zoned_segno correctly
    https://git.kernel.org/jaegeuk/f2fs/c/dc6d9ef57fcf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


