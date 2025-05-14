Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC9253958
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237197; cv=none; b=DapEEh4CyAFa62GnyQHHkV7X7snD0bKBcoA6Ia3RjJ7GikcsYdPr4+xkbDfe+9pyRDwB/lwNY0n/X7jMc60fpTN5aEe6oDiho9PQBgrdIM7ysDTdGHN75Vri6hcfJsORewVBv1NEoYomIYDlckszx7V+TEfynboJTHiB8pxBMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237197; c=relaxed/simple;
	bh=T40BRXA/ZUYBrn3MFNaEz9UTnOwLgkq194IcQ+iSgsg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eA5j2500rCCbOywURD7YuGRzpbGV9xmYUuu2wsPVUZPwCgg/rW5yeQnil1vMoMCSTyRlknp/jxk/fNP7N5B59KC84D9lQJE8eyWmFauGMyNe3AKJ71ktlfJblqfgFejywG9Qi4y9ymtFKJLMuwY3WsxEQ8v1jJMMJa+mLVoQucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmYCnQil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmYCnQil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B842C4CEED;
	Wed, 14 May 2025 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237196;
	bh=T40BRXA/ZUYBrn3MFNaEz9UTnOwLgkq194IcQ+iSgsg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XmYCnQiljW9ebjAlX02k8VKDfBqhBBnAaMVLGLWYQ+3E62Z01dmfnjYJppweUS3n0
	 4340zbrXuT27K+Kf2yU5Xat0w308tywhYj7S8fvArmEo5u8aR8oldSSPJ7leuDBAvB
	 Iu211ptItxRuCECrB+epqfGRNybqJsz6BwJ1XIEcffPeyKscP/dLKTyuRF3IYMFgxf
	 iIkpFkhcIpVmvKRCL+5/2tsvxh4PHjgJYEr0jSZCkLG0NI8diPj5W2l5AmD3dZnGcg
	 mq2d/0gJvrylT5IRqIqRB0bEv58vm3yWXDwHLpBQJreGSR4dtHSalAjyr93zhb7vL8
	 VjkAfSl2icoAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB33F380AA66;
	Wed, 14 May 2025 15:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add f2fs_bug_on() to detect potential
 bug
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174723723350.2412407.17903225728405091835.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:33 +0000
References: <20250512115442.2640895-1-chao@kernel.org>
In-Reply-To: <20250512115442.2640895-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 May 2025 19:54:41 +0800 you wrote:
> Add f2fs_bug_on() to check whether memory preallocation will fail or
> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 4 +++-
>  fs/f2fs/node.c       | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: add f2fs_bug_on() to detect potential bug
    https://git.kernel.org/jaegeuk/f2fs/c/0e799933a4e8
  - [f2fs-dev,2/2] f2fs: add f2fs_bug_on() in f2fs_quota_read()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


