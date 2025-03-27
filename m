Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA614642D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108499; cv=none; b=Uo8eLAlq9FaMJaPyevXw951rLHQRQkvWNYawczjljrvo3nUtnIakkXwwDIyv4m04Etk+uV+jch0DAAVoujbEwdPyG31ksimIJcn9H22qWnJ6olyfdkAPAiEc1OkTft+CsEd8z/o1Z3cTNTqOKysUnFzPFxRDMCh+z/puO9FdQnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108499; c=relaxed/simple;
	bh=/g3b7aCeTuYJgNVv2KEofa9aHrE2pLsHFvsByYzGtPU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=lGwTYSQLKiFMKCpEPvxaPFR8lRdj8IdQ6ErEgWE5t/Zsi168aeZpkut++4oUzYblsAuz6r1ePQ01k+Gjb6GiyXnzlENcwSbEAqPFqpW0CX2lGrM8tSBmFBsN8nyzAvB5RGpun8uFdIMm6rpm6/uVE0jITcxnAISDGqTbPrArtIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEqY64ZA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEqY64ZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D657C4CEDD;
	Thu, 27 Mar 2025 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108499;
	bh=/g3b7aCeTuYJgNVv2KEofa9aHrE2pLsHFvsByYzGtPU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mEqY64ZAcKg/3DFw5e8J2sfKMLGgUX0wWcmiC7TmDrmuVg/Ta+Mz3B4NE3qJ1rcuR
	 6DrdC4arSTHu14+5la+CaBkCaY4rhcPOCYAMvUvLP3QBuIOEsWlWcdEjV8pVqcvFpB
	 SRxUB++5kmOOcVrG7DzQeLkQFd5eiHaoKWTveBHqv2lq1Un0BAML4dJ3I3eTcW5dcj
	 VuWtyQO2y6WHB+LDCtUAT3GWg8XvMnpjfyZ7QPlI8P7X1+Zj+Q0O7KJe9by99a5lMJ
	 CIqE9TuftI2qUjDNl3IePFUK1wxc37+T/Ha4QuGakdGVNdSTHexzyR7OZzu7LRa0/w
	 wr9UxGUGQD0WQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFD9380AAFD;
	Thu, 27 Mar 2025 20:48:56 +0000 (UTC)
Subject: Re: [GIT PULL] jfs updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <94b4d641-ca23-4b1a-aacb-0870e1ac7b25@oracle.com>
References: <94b4d641-ca23-4b1a-aacb-0870e1ac7b25@oracle.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <94b4d641-ca23-4b1a-aacb-0870e1ac7b25@oracle.com>
X-PR-Tracked-Remote: git@github.com:kleikamp/linux-shaggy.git tags/jfs-6.14
X-PR-Tracked-Commit-Id: a8dfb2168906944ea61acfc87846b816eeab882d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f79adee883586b94cf977e4d28384ea0288473ed
Message-Id: <174310853563.2212788.6066102601757564357.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 20:48:55 +0000
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 11:25:27 -0500:

> git@github.com:kleikamp/linux-shaggy.git tags/jfs-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f79adee883586b94cf977e4d28384ea0288473ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
