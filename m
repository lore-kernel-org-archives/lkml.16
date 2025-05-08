Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66928469E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721796; cv=none; b=OVzC7SrM2w2RzpV71XEt4OkZVWLAuM8fICrAvL1ssBRe0dcdaYQJzaBA5MNnb/u7JlFP2knN6Zl2CcvVuQhC/BbWVJBe0ZajWqpHtmCdKhWq39jJd88kUlZaxrPg5jofL0ujhD1cPmSEXHQA6hNfdZxF+xU1vBFlrVCb0+Irea0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721796; c=relaxed/simple;
	bh=emnJpzLvbQJrpPs3WoUmBKPR9xHTU7DnXmw4yOQRzLI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pOU+0g7aA34AcuZNHTqmbHeGoGP4lBV9RVbFprg+0+1vKz0aAjWIO3BBhJdZ+ZJS6iVb6IXpXCxv/ylHFBV+qvdsxvnxLIcCmRoe4Q9fBm0MtPDYMkPAQ24bePUxKGbmde/tGkgdiAC7Qvs+Qm1UGeZLCYnDsNj77jQd0Bcbjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tU+rjwtk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tU+rjwtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E446C4CEE7;
	Thu,  8 May 2025 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721796;
	bh=emnJpzLvbQJrpPs3WoUmBKPR9xHTU7DnXmw4yOQRzLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tU+rjwtk17GU2wRRyE/SFme6MQYTwywF9tNYFSPdYwEtrmfYdmVRFir3yozKw9hDT
	 LLsYip1ZNfh0d9Flxat3o7ppXslLx7LJ0Vo6ux48bJa71fh8xQmdp+ZgaQA5XdOVea
	 mxwjJPZnnk8ZqNdpCaBy+se/VgtMMa6ToG5qiIUlb1BEmzEGgmeG7OGEqYMq1gV6bH
	 99N92c8ghBRYZPAMLIzKdE4Hn2i+Oey2pv7RpNj30MZQ3Y45cYXru2MvQNlfq0tZne
	 zjgZFST/5saA4SC4dMQkRxJp58ecGg6loX1xOqURBtKin2ArpaZIPcCPExWYrbaDfU
	 VF0LoWmACrF4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFDD380AA70;
	Thu,  8 May 2025 16:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: return bool from
 __f2fs_write_meta_folio
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174672183439.2971823.3514035495469424112.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:30:34 +0000
References: <20250505092613.3451524-2-hch@lst.de>
In-Reply-To: <20250505092613.3451524-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  5 May 2025 11:25:58 +0200 you wrote:
> __f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
> As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/checkpoint.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - [f2fs-dev,1/4] f2fs: return bool from __f2fs_write_meta_folio
    https://git.kernel.org/jaegeuk/f2fs/c/39122e454419
  - [f2fs-dev,2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from f2fs_write_single_data_page
    (no matching commit)
  - [f2fs-dev,3/4] f2fs: simplify return value handling in f2fs_fsync_node_pages
    (no matching commit)
  - [f2fs-dev,4/4] f2f2: return bool from __write_node_folio
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


