Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4CA223300
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 20:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502549; cv=none; b=CLemMrjlKB5aXpfNWu8Z4vJ2An9qC4ustUZp1wt3glQxkPCF4zSC4K96MyYqQFkZ7pt3+yqw4CWSipOKI5wfEaFKnC8kZtZqU45L7wL55uUMG382sWjjBMdgYxV5GqIAf7p9Q9LZTmUWN3ZoBP6OZsSzXIqLxctQjnMIiak3er4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502549; c=relaxed/simple;
	bh=FY6gqqH9JmRV7d802KdcakpN34IqV+GwM9Cmr/5iyvE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VWIpW/171nvfrNIzDuRHEkjLD0XbBVbShOMLN62HRptXWV9KSrjATf0MtZMB8uijkY5dcOPuE/jZeoGprzQKS5T7w6zNxMyq2N5B3TKN9p7pz4zi9KUDu8wP3t2kgTdU1aesX2dJ6HtIcIKhYcXTse2j0uk4c6or1HyISmXV9/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA1BAvXs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA1BAvXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3A3C4CEF0;
	Mon,  9 Jun 2025 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502548;
	bh=FY6gqqH9JmRV7d802KdcakpN34IqV+GwM9Cmr/5iyvE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JA1BAvXslVN3D4i9BJ9vFhyyQvtsdmXX5tsinuV1jv4qY9rGrDYEpzQDsVqaJVIsn
	 13HrFO4Rh/PNzPxeR0LMCkjnsQwyQB/gqssKWC/RIV3rRGfSspplWpEn4s0GFrhOAJ
	 2dEc4+f5Y+aE8AEqJ9sr9DDqLu2uk0EjqEgQ2Aifp+9aZzZ3bY1H6fuY4L6wYaaIHQ
	 5l0AqEpjmNKk8PazIVzaKNh9VsZ5Du06a2HbcxF6YWP7l68FJ0YYCv2NK49v6XxfET
	 Jedhvd0tEpjdCXPKwqwru8HwhG9vpNtyaCkX9j5Unj9W4QR1AcSHdMPhmne+9zZCNl
	 98S8DGEwi4YHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB8D3822D49;
	Mon,  9 Jun 2025 20:56:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 3/6] f2fs: drop usage of folio_index
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174950257925.1531626.6267627182271643754.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:19 +0000
References: <20250429114949.41124-4-ryncsn@gmail.com>
In-Reply-To: <20250429114949.41124-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, kasong@tencent.com, nphamcs@gmail.com,
 david@redhat.com, chrisl@kernel.org, hughd@google.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, yosryahmed@google.com,
 hannes@cmpxchg.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 29 Apr 2025 19:49:46 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


