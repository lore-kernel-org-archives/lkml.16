Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7122172F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502547; cv=none; b=gSSElbal//RGVHMBeGzMBXu30JG2RwtxMu9XlB6n7SErLG1dF7Ofce1jTfrYc8tBd/1vY68HtgbXqe1XlTC4zrXHtiHtIoVTSeaJivugkDdOW5H10nhB3dxNQv2Sz65zdzqvjLwbEgpZvUVj5/ddmnYIgIeF/CCVta/RxaFuTbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502547; c=relaxed/simple;
	bh=DTYx9Dawj/Zj6Ock61KyxoXhL18zAF98UER5Vrg69Lk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VW3FLdn5MDjniw4QN20gX/WKnQmql55sPWAa/U9jpnwYhsp8JmHZFfDvrY6Sl/m3A8SDJB7P03Br/WIUKABRlW5lN4hg2SLbn5LhBD2Gf7cTIhwVU/la8re/GJcc9/Cudqqrxh4NLddoqnHIWRnYR4qp98zDY/2+UzUQ46xUsGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Egmrf9dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Egmrf9dt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40163C4CEEB;
	Mon,  9 Jun 2025 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502547;
	bh=DTYx9Dawj/Zj6Ock61KyxoXhL18zAF98UER5Vrg69Lk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Egmrf9dte6jKUR+x7ySX8UGIAkM5ZtoW/5xyZIKgCxARjDOw8Ixc3CkaI/Rdiyd6c
	 LA3MDvz3bBIwck0BSC6MfNTOLkmtf+sPsUsOIABTnr7HTwfZ2U3H35dOrcEK1i3PUf
	 6HT1+WGwDEUG4jjOujCG+O4tB++JIrIr6IpZiJIvvZ325rZ/cAbnXR0gqQ7GQ3KP/q
	 60lE2BsSQjvzpdlD/YXy+YHsBrXTFReBtU1HT7xIL4YnSTGNCC7gossYRddX0oMwUX
	 gnuGF1zX7i8Cf3dCNjFAQyFmoQN773RNEa1UbsJuvpR/Wa0Hwov+nJbt+tpeUGLZdv
	 2kId2umyrH/hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BE33822D49;
	Mon,  9 Jun 2025 20:56:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: drop usage of folio_index
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174950257781.1531626.13890659221205140362.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:17 +0000
References: <20250427185908.90450-4-ryncsn@gmail.com>
In-Reply-To: <20250427185908.90450-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, kasong@tencent.com, nphamcs@gmail.com,
 chrisl@kernel.org, david@redhat.com, hughd@google.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, yosryahmed@google.com,
 hannes@cmpxchg.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Mon, 28 Apr 2025 02:59:05 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` and that is not supported for f2fs.  So just drop it
> and use folio->index instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


