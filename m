Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA524224240;
	Mon,  2 Jun 2025 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748904998; cv=none; b=h0OSbT1C2VMPB7XfnJpHNP+Vdff4pWyTHrE+sKlpsnl9aKxXafC7JyNshUxXOzOjD75QzmtY7EdOdRzq/0atV+annT64aIntqKNE1ssA2OJlR9DX517ITLJjDFL5pnk7oiYBtXjkOnDgKbBoUz+iKEkJ+TAqsMYodD7ThERVuMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748904998; c=relaxed/simple;
	bh=+vUJTsDAo2f2hWGgoDTN6JIZNq875apShg3dNj8gA7c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nxSG6GenxB2vU3VsuOxNaNMz8mGlAobpL1hdMgJyVyuZ9QxZuzHmof+t4zr7tACJCH6EkyExD9BCxCs5S++wE2EcjBLGe/jz4uvRQyrOgRcZSXZ2WmqICsNsjULBCHP8QRe1bKv0amhccPKCa2Yu9mlvJEzqmZj94eMze6ZIOcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrMcwiLd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrMcwiLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98397C4CEEB;
	Mon,  2 Jun 2025 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748904998;
	bh=+vUJTsDAo2f2hWGgoDTN6JIZNq875apShg3dNj8gA7c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SrMcwiLdKqhhquYCeI/mmky8Xn9/ZCeh9N0C6EH4Ad+Btne9jP22xLknN+a00k0qJ
	 OkrS6KgYsR2Y+IURqd83GY5wmHRJW3if5+U1u9M+tCRi39ur01ME0pq2+9zrBKerqm
	 XJOiDxB+uTe7u9qidwVjoWMW1acWNh/jkQ7HWOnQVwLcVl54EjdWFs2OzJyvomFyPE
	 OCcdvgB8ZdrW/R4fxezDuOXaxPVkoAx8H6dDkCaot/zzf9P+2GIvqgXOED8LbBsW9J
	 Fvvwg+C0WzstUHfp6qhHi61tJE7FxicLIisyTrX+1A+000NLZNjZ9Qqe6covChcmjg
	 Io02mzQVKtL9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71479380AAD0;
	Mon,  2 Jun 2025 22:57:12 +0000 (UTC)
Subject: Re: [GIT PULL] additional gfs2 fix for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250602161242.2106610-1-agruenba@redhat.com>
References: <20250602161242.2106610-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <gfs2.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250602161242.2106610-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16-fix
X-PR-Tracked-Commit-Id: 9126d2754c5e5d1818765811a10af0a14cf1fa0a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe4281644c62ce9385d3b9165e27d6c86ae0a845
Message-Id: <174890503103.939710.16670523386502907705.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 22:57:11 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  2 Jun 2025 18:12:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16-fix

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe4281644c62ce9385d3b9165e27d6c86ae0a845

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
