Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8D202F71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258206; cv=none; b=NOQsTpjqHHa/FuYVjFGcsaFv+TYwmoD2baVUBCJSkOI3s09VNGyUBRohiKHVH57XidaLeozVvkVLwNr5Tked0m4mt2Q6P0slNM6GXxQibKKqIWzt0aDn9EzifC3LBL4Td0HDbLQ2+gF3Oa6YXru8GVtJL5DvbCWwHDqBY9JDGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258206; c=relaxed/simple;
	bh=4p3yZGio0+JmEDeC3I1vg0WzBBGpTFEUG+ffAl8vBHY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aE0a0LPZV9OZ5AlOO6mXUKednuOBTXJQn/iD41Jkd1gKQGoEcbcVnCfXtQ3qWKKKzdtbvMrm0qOzbbqISuOktyR77I/AYfjhaOFNvvbgbpHVtue4sZ/JGf3erk81vOfvg/3bR8fR0SaTzEY96xCDWWKxMVScrpM+PZ/Ry4kT7ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzOkXQ+O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzOkXQ+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01550C4CEE7;
	Thu, 10 Apr 2025 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744258206;
	bh=4p3yZGio0+JmEDeC3I1vg0WzBBGpTFEUG+ffAl8vBHY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XzOkXQ+OczmzYOhLU4GZE0Enlu4obPFA0t/CqPOZCtbWcVhXoUarYfHbIYrNnlned
	 exVxyO3/i1RClIcg5TxqgpV0GY1uj3sQYklQGla1B3V2TXd6XN1upm3d6WUYGn2YDJ
	 dxMtssQ4iBjGwNM9XjblaPU0kN+pH4OFQadIV+BwiRRS1MJJmYTp1bChz2Akc2SIdL
	 iVqfZpCukAYnYsC7DwrFaHFaMZGtsFRZedRiaQQ5cbM2QDxyDvnWSsdExujlfVhqi2
	 mRXfs6ziZH7oMMt9vd3w29CrJk/nwRJKq/3GSDdk8qrDtAnobqVpWJS+pCbvUzT1AF
	 wyNzfsOIdSn6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AFEE2380CEF9;
	Thu, 10 Apr 2025 04:10:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up unnecessary indentation
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174425824324.3146257.5905240460714241390.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:43 +0000
References: <20250404195442.413945-1-jaegeuk@kernel.org>
In-Reply-To: <20250404195442.413945-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  4 Apr 2025 19:54:42 +0000 you wrote:
> No functional change.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/segment.h | 40 ++++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: clean up unnecessary indentation
    https://git.kernel.org/jaegeuk/f2fs/c/05d3273ad03f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


