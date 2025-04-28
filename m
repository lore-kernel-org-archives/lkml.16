Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE792144A4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880019; cv=none; b=JFZOWXGwse+8vx/ltmD0t1kLkJAl5QJrX/Ia2Z2sRLB3lg5GZT95YI6Da2H+db+HTRQMGI1weZEkUsJFmieNa902tTp0Vm4r8b/uk2GLtnyMr1ohzRKVZg+smEVPyiimP14grdIaaEBPXyalekqXtkcUEGyzlF/H227iA75fCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880019; c=relaxed/simple;
	bh=hW8OBlEtNhGteY8BD89YhPa5txGl0BrBpZfLGBY/d7A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J8kpgDfEMHhXdz7Tf7eI+jB+IxEq6Lpbkc/6/TtBxw+onNZx7W6WxJuIwE3g8Ia/BxR1RnX4a+CRCbxFUzWPB8oFU1jNfY9eRFH3PwGJ16I0JtHusaVPtrxhk2ZFWsCcPMhOtXlEAzWSM7uNCDviML8uRVhiUaJBbQeTH5zmLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIRmMbgH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIRmMbgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48802C4CEEE;
	Mon, 28 Apr 2025 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880019;
	bh=hW8OBlEtNhGteY8BD89YhPa5txGl0BrBpZfLGBY/d7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lIRmMbgH90LNqQELKn/Ngr6Upt/UUJxwIUtHrjqPgugfamIJF1AL5FQcF2d4HfhNe
	 fW7k1ZyHFwE8dTAxXS0ppCdOwividCqjAm/4iPkGhO5Zjx2xLgHI/LJ/x591fpBaYQ
	 7kN7zsScKHBsS2bRjU0vb2hsz/MlB2WN4nuUjL/lBiFz3kGQiGx+3/OrEAGUsBogY7
	 dIxaEhnsjK5jaIDQz+sZoj1HYIiZ1Prs/3S1Je/qJl3RG+53tGU4JDVXJ2k/Sxrt3n
	 fSdczVIUHpxQcB5Q4DjTC6IksugcdbNOdjaJgS1dU+hmYV47a3rm3skSqi7CCH0xoa
	 WHicYTqlkTXPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BFD3822D43;
	Mon, 28 Apr 2025 22:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: handle error cases of memory donation
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005823.1067750.16743465439008922626.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:58 +0000
References: <20250423204935.2335000-1-daeho43@gmail.com>
In-Reply-To: <20250423204935.2335000-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, daehojeong@google.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 23 Apr 2025 13:49:34 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In cases of removing memory donation, we need to handle some error cases
> like ENOENT and EACCES (indicating the range already has been donated).
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: handle error cases of memory donation
    https://git.kernel.org/jaegeuk/f2fs/c/ad5291e2c1e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


