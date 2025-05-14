Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E238278772
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237198; cv=none; b=CM1VHB2VFa36GOJAvinuseLzfSUsQy2p1QH0eIlhxzF/RnwjGpRQZp2lkHGgqgEdFQaaiUHAZThPujDqgRC2XndF17As+bwJ8ovzhDCMlXhHsxOz7e0lu95MPW3DJZr+PgjtBzWHTBSjj+tKNBNeSgSmtncC/BY7A128nQr5qss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237198; c=relaxed/simple;
	bh=Sz4YK8rbWcb/mqL039IAl49CvL35GI7XnAS3+n+eh98=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FRZgpILdrCE2ljnNSZ7gzCLt2pkk8zrEak5vA7cb12SOviqG1zVS3dfLX2bP+5df2AjDHuJPnfuEW1ap/TO/GdXIJv6pWcS6Vt4Du7dY7LuF7HzGxxh9W0aCtOBL2pZsRX6ksa1pKJejKamszy4a+/sQoL+FyyvOVQHpIuTjc6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEsVTkpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEsVTkpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFE7C4CEE9;
	Wed, 14 May 2025 15:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237197;
	bh=Sz4YK8rbWcb/mqL039IAl49CvL35GI7XnAS3+n+eh98=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fEsVTkpJlieTN3Wr1GK9pRSBK60nx+63s4cPnjIfsiC+D9Rt+M66H6ccbou+9UeWS
	 3nsWP6n0ixo+44Uznj3MPY2hT4yJqZHtgcPSlBf07erd0Oty/lGP1mgevFznk4mUl/
	 lo5J0cV+krW2ckp/IUSJbmgCNuTxzZlrXKIj4lMyWXO3rSQeKwmpaDPsCsP8WxYAbu
	 kZpCM/AYveqXTHKAMR/zK6FufhZlyqyrTno0HfI+w9Ldh9PSbHp8dM5IFuFp/JHyC+
	 CIn14zJr+GLly9+8dzPIgpzKEiA28eGpmTsJUYf2EPc9gRFyy6Ee9rJrp2QK7z+hML
	 qHOiB1ziSp7Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E43380AA66;
	Wed, 14 May 2025 15:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: add a method for calculating the
 remaining blocks in the current segment in LFS mode.
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174723723510.2412407.16198049270620230058.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:35 +0000
References: <20250512073611.718-1-yohan.joung@sk.com>
In-Reply-To: <20250512073611.718-1-yohan.joung@sk.com>
To: yohan.joung <yohan.joung@sk.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com,
 pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 May 2025 16:36:09 +0900 you wrote:
> In LFS mode, the previous segment cannot use invalid blocks,
> so the remaining blocks from the next_blkoff of the current segment
> to the end of the section are calculated.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/segment.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v5,1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
    https://git.kernel.org/jaegeuk/f2fs/c/91b11bd8152c
  - [f2fs-dev,v5,2/2] f2fs: add ckpt_valid_blocks to the section entry
    https://git.kernel.org/jaegeuk/f2fs/c/313d10d79a82

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


