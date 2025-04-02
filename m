Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F51F4632
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616076; cv=none; b=WxUiKGuS+MP/zBaGb2cgEEVuNvi0QwvORcnCe1cnViqlT7lzVUC+DuCSm4DFxIrZiBQTm5lpYJy5To/biSmRMEunCsGRmczpKUBxk4OcFg5Fl5Qd89FAeZjuEb2MGdxZndN0GntrB+ZpHYXajk5IT2buoiRlDdza4n6wHlGcJNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616076; c=relaxed/simple;
	bh=+kRQYdsr2d4qdawsHEct+HirVAfk9PMqIy6EbRMmIfw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=brxStWyun0+/cjnsyZp28CtsLdlx4rG59Bf0xNc00d8m5zZftvM08JsuJ5lphmUbu+w9uuB7t9ERTgrXxlF7eu5LTF+CF6K8VtNY8QfEAa7og2oNcKqgh07VOCdLfskPaWqs1+bkrZnrhSbovXEJnfXERGzLrckxyHRcdHd2BNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bw5z7UrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bw5z7UrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC1C4CEDD;
	Wed,  2 Apr 2025 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743616075;
	bh=+kRQYdsr2d4qdawsHEct+HirVAfk9PMqIy6EbRMmIfw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bw5z7UrBuBHN2bJOhtCvyvRZDDDkduUlKrsM4nBMZnmw+u3QVqGtoaQZSPwIZN51H
	 BaL+DgIUVUnn9yK6Wsc4OdjcQU/J9q8dcH8sU9iiPhyjGjQq5ycMXsIuSsy4Qqoe6q
	 ZFKAtfgeaqglJp2ljDpQ26m3h4tenoITRXAKCWXsDoKumbAP5CIjUltIq9SJ/Xlv5a
	 tswwbF2ymro1+11MtYBZH+td6aU41BpK+722TRbNjzr4EMDSd7jiiNmBBoLiLGM381
	 mCWuf1fXdWL5zlk7Kvnu4GSDLb8ijTSVtZd/1qiY9m4QKPIDrx3iXP8cT6Sfhit0+W
	 ha/JpspsZvRRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACA9380DBDE;
	Wed,  2 Apr 2025 17:48:33 +0000 (UTC)
Subject: Re: [GIT PULL] objtool fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-xFKa5hiQ5urVwS@gmail.com>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-xFKa5hiQ5urVwS@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-01
X-PR-Tracked-Commit-Id: 7c977393b8277ed319e92e4b598b26598c9d30c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92b71befc349587d58fdbbe6cdd68fb67f4933a8
Message-Id: <174361611256.1617726.1665589807933776642.pr-tracker-bot@kernel.org>
Date: Wed, 02 Apr 2025 17:48:32 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 1 Apr 2025 21:57:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-04-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92b71befc349587d58fdbbe6cdd68fb67f4933a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
