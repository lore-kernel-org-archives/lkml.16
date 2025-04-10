Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF301F09BC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258197; cv=none; b=t6uQbPdqgebBijF53wzK33dtpzaaQZ6b9zoBBlYOvUyuY9oKrs1fzJJrS+YnzIl9mWH47wyoKezR8V3thlCxLlxD6N4jhvIdeF/VS4NR9odHbos6BOgptSz3PRpQMfknNY0cAoxz/7zdW/ayDAAqqRwI1h029rz7dtPUx8E869g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258197; c=relaxed/simple;
	bh=MxQmQXDfASm1KPFqYDhl4v/yAuddVzhL0fvjTL/VhLg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W18nLlzUOAZsVD+hllDb0HJYwjlLYebNE5XS9tBU/uAOy9cEuKTzTdcFPN2yIioVMHWmSE6VZUPrPlUzF7RZDQT4zfWl9z7rCQMGczw5JPaZvfN5C7+Zf8nE9LmV2cmc7B/9cM49Ck9LfJo8vaWhmNKgWQK6EDGPnt5Pi0NF6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MC9IKyH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC9IKyH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A4CC4CEDD;
	Thu, 10 Apr 2025 04:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744258197;
	bh=MxQmQXDfASm1KPFqYDhl4v/yAuddVzhL0fvjTL/VhLg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MC9IKyH7lcBJHzGnhihmdhiDdv5Qk07pwV9DcbVBoZjJ8nCz9NCDesx6JOXTJfA/r
	 tXyWBC146+9RliIlo139bIdeAlMuFZCXstaQfoLyIRRELjGoJ/HBIKt8yHn51tO2UR
	 YwWCSz593lnWF1Ji0IK+fKexD/Wkj83bJWueByBI6QAgzzC0TXIzdSmPWlpPS0dVf4
	 Eeywo7CObmJUkAfMEBoFgVRpJ5DmG2bxY2tape4Kd7bHJiJ7PMSTjGG7O/YVMTBZ2p
	 WYKoe4HP5RVUh2N+6QAYjNvALAzxMRNB8z7wmn0LfyYipUKCK9gfXlwkvu8l5CyWuv
	 XkUMIagvmgi5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5F0380CEF9;
	Thu, 10 Apr 2025 04:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add a proc entry show inject stats
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174425823476.3146257.16619631062841973924.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:34 +0000
References: <20250320022230.1938110-1-chao@kernel.org>
In-Reply-To: <20250320022230.1938110-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 20 Mar 2025 10:22:29 +0800 you wrote:
> This patch adds a proc entry named inject_stats to show total injected
> count for each fault type.
> 
> cat /proc/fs/f2fs/<dev>/inject_stats
> fault_type              injected_count
> kmalloc                 0
> kvmalloc                0
> page alloc              0
> page get                0
> alloc bio(obsolete)     0
> alloc nid               0
> orphan                  0
> no more block           0
> too big dir depth       0
> evict_inode fail        0
> truncate fail           0
> read IO error           0
> checkpoint error        0
> discard error           0
> write IO error          0
> slab alloc              0
> dquot initialize        0
> lock_op                 0
> invalid blkaddr         0
> inconsistent blkaddr    0
> no free segment         0
> inconsistent footer     0
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: add a proc entry show inject stats
    https://git.kernel.org/jaegeuk/f2fs/c/e073e9278983
  - [f2fs-dev,v2,2/2] f2fs: fix to update injection attrs according to fault_option
    https://git.kernel.org/jaegeuk/f2fs/c/2be96c2147e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


