Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AD44438B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744568627; cv=none; b=d4jszq4WgoR9/0PkPn5sldZf0gmOjvSJEyEBBkDtD7czvozEVn+B0f9Wr8AZHLwS5lYF+5y04dGNbdMROhr0c+uErYxpzpfi6fV4IrsrpdgB8oxHCFtQQpdi+W/JbVCJlBXLlQml9Hi9Aqbc1vQnI0w0AeMRIZZhb6FkbtsJVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744568627; c=relaxed/simple;
	bh=jEwpVw+oHQmNW+ILSw2idMCiUVWbHMNleBmVtQjVKng=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=su9c+uNsliflrY/o5Gsmx0lUow8HMkR5KxY0utM3Qh4rYVNMvmhp3BO/EjGkv97EhFJxUHzMhclMjI7k5XUgfS0IS+c+0ce4xVt1WKYteM90dDWlCu/XAzJLFkhR6NtXew00fWWOoYgturcLhumY1ftYr03lBeIZdfv6roddWDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVnTmVkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVnTmVkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64976C4CEDD;
	Sun, 13 Apr 2025 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744568626;
	bh=jEwpVw+oHQmNW+ILSw2idMCiUVWbHMNleBmVtQjVKng=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gVnTmVkYKOabHix0WGUzuFrTlVZ9ZeuTXAHzHpHoPYCF91d2QXgTH4klunH2pdkq1
	 qYTO3ZuihCYUmXhOog/bs+j5NHxN3llxezu4YHVeSnp4xn6oG+4BymiWzcPjsacWwi
	 hEpGr9cVbqo1X2VI4AO77eh8aC12txRMhjyeq70ZlpNnjFSXAX8+JZKsamzZ0azQ30
	 AbVD3AynGfIdGkmbsorYtuC1j0Q9iDAyKzweqBiFvKd9eecnf/IsJ8/IjwxEU+mRJl
	 ttvTgmibR3Jc8WRq7nZtO8A3s3MuF1Ej1cBV8NO/b1cQADIO0mLcpCFmQKl/emQ5Bz
	 9i4/icB97sJXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710FC38111DD;
	Sun, 13 Apr 2025 18:24:25 +0000 (UTC)
Subject: Re: [GIT PULL] erofs fixes for 6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z/vubg+MYaiszHm2@debian>
References: <Z/vubg+MYaiszHm2@debian>
X-PR-Tracked-List-Id: <linux-erofs.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <Z/vubg+MYaiszHm2@debian>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc2-fixes
X-PR-Tracked-Commit-Id: f5ffef9881a76764477978c39f1ad0136a4adcab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 004a365eb8b9c6d7d409bbeb5687a4a5ebf8f110
Message-Id: <174456866398.949293.17563812017915309732.pr-tracker-bot@kernel.org>
Date: Sun, 13 Apr 2025 18:24:23 +0000
To: Gao Xiang <xiang@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Sheng Yong <shengyong1@xiaomi.com>, Bo Liu <liubo03@inspur.com>, Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 14 Apr 2025 01:03:42 +0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.15-rc2-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/004a365eb8b9c6d7d409bbeb5687a4a5ebf8f110

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
