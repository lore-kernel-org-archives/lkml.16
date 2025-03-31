Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FF8472
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457494; cv=none; b=L27P0x9fBbTF+2Cn1aID1m4eyTGhr73BB3Mp4xAJBdlO4PjiIPDJxmA+HQl23V1aiYtOexxYhc521hWZ5iilCVedzqD1pXku2SN2Ay/gXNcAVWa6FLwXxL4zOBYXzKvoeKNcO192xQzSWJsPxT01JlQIm7VYvLLfMaOBB8+djsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457494; c=relaxed/simple;
	bh=iAfD84PRUcW4kZUsB/2plk+B3j6BuTIihUOGxSrLNHM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Jby9kw6fUU6HS4qC1pVIKxFTkxUB4n2Rwq2UyczogaSNPFvl4LbUiXbLoKt/L6hcUZ3cTFeLzMeRES0OLwlLKsWTx/kpFR2NALjKiLqEBs19mC+0aGn62iLipds9S22jxN/yToI4hKImUCVwOLbJCe37LM592wZMyXz05vmROMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcHYWYEv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcHYWYEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D33EC4CEE3;
	Mon, 31 Mar 2025 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743457493;
	bh=iAfD84PRUcW4kZUsB/2plk+B3j6BuTIihUOGxSrLNHM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QcHYWYEvDvedc8sEkQVH3reftruDYOJ2sRH2nTHLG1VrOGFmdXy33fB6hKve71fmM
	 zoUH8WglBdq0D5ora3Gi8ZaNXwN7A3zAorbM7F/EbvT+sFV8N0PbFCk4YwrClJDcHi
	 dNFXEKWZmlUYh+cVvvuZWQuMV5d4M1YJ8cNxA7OyYqho4P78oIIpM1tktLkScuZF4x
	 zBQbXPR14uJVICjA5wORaPj0vCYYlZPaq1LJfX6n9DdaVpr+VRTUli3yVXDfpsDt7R
	 LdiuL7lJzJ/AAyLjKufciydg/DsXhnDVS9xmvS572iQb7fp/2sBROZb+s6noCW3d4d
	 Mp/sTsM8n91BQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EED380AA7A;
	Mon, 31 Mar 2025 21:45:31 +0000 (UTC)
Subject: Re: [GIT PULL v2] ring-buffer: Updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250328173533.7fa7810d@gandalf.local.home>
References: <20250328173533.7fa7810d@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250328173533.7fa7810d@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.15-2
X-PR-Tracked-Commit-Id: 028a58ec154257e618c27fb0eba8d9e30379bc3d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46d29f23a7213d3ce3925725057344a28f7de2b0
Message-Id: <174345753006.143436.5331522610379296080.pr-tracker-bot@kernel.org>
Date: Mon, 31 Mar 2025 21:45:30 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Vincent Donnefort <vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 28 Mar 2025 17:35:33 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-ringbuffer-v6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46d29f23a7213d3ce3925725057344a28f7de2b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
