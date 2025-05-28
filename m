Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5C221FAE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470612; cv=none; b=Ddg1tgFA3+vPlGe4TmrT14i2BLH3f7a+eYS5LF0GfjWuWqt1kjCQnAacMHylQzKPvMkUykYV1X8Oz52tlTg3ekzujRUz+Vcrv2nesGGPZhhFpiIaB3X0IuChdF/SOXoQcvHvkplnC+PgD08kUQ9kMX2MXSw4drcQwe2k6nVHvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470612; c=relaxed/simple;
	bh=ME97XvHP1p/V2KP9dL0rNzabOMCHQocn0bMBshCDqEY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kmIvOwYpZ+uYjlY+4RDDQB2Egsf5YZ4B29c2Oib9Z1nKgNnlAjQH0MoUjpwxzmQYLMptzCRJHCK6XhcpNjLmPbK5Yh5awanBPD3I9nUf774hmdKBZEnmwHQ4E5bfXxQ6XZlY0wTHL23iVW6Zc2RT1LqOgGI7WnXY6f3w3Tz3StY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY8oYg+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY8oYg+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F5DC4CEE3;
	Wed, 28 May 2025 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470612;
	bh=ME97XvHP1p/V2KP9dL0rNzabOMCHQocn0bMBshCDqEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bY8oYg+WH5wXr+R1LSgLvMOs0WJ4knWwqMWhgq2cYtwFK1wIS4Ww4n8k8pKc1U4wv
	 RII9pc5JXDFi4OPTTd7pV5yPBAyaiqTj16hZvnHZMxHq88wbnYCnEq7cM02+/xNgRm
	 GBSeJlI+G9d4AdQk4FXbWdhSI44hYKTM3+gidkos06Y5SrKna7dj1QrB/4gwOLOtYM
	 EgtRsBsHQCjULHPt6jj/1txwBHDT/jakHN48iyU+E7I8yXAbmBsGMGlVwfhl7RgHrr
	 R74joo7Yy8E5/wd6fxhsDuM7trc3B7FQZ8+LigPhxJOdUQ9u8qWVaKX3RAMcCtu80H
	 hjI3DADA6fIyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CD53822D1A;
	Wed, 28 May 2025 22:17:27 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250528114103.GA27965@willie-the-truck>
References: <20250528114103.GA27965@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250528114103.GA27965@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 217e3cbba3d6613bee9ac33ddc330f8676eb9eca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47cf96fbe393839b125a9b694a8cfdd3f4216baa
Message-Id: <174847064592.2608061.11972465031439133363.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 22:17:25 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 12:41:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47cf96fbe393839b125a9b694a8cfdd3f4216baa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
