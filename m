Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7035D529
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747107178; cv=none; b=oA49MFOHxAyM/mfvVMEt50vuZlaJ42D5N0Rn9krXlv0WUJmN51HQM/ap+jYeaz0BEyg2T2COs4tT+PGXQqCujrklSZxe8NuApvl+FoFDFrU7aU0tjHsn2UWT19Ypg8jp2V7GrO1bC0D0D24zOPKvbfxtlq+rSAs8Qo+QeiGlafc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747107178; c=relaxed/simple;
	bh=KANwdTrPMrf7Y1HjV27ZsvjwWQA1FisJr3J+a5RRaAc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Ft0HqN0wFUTLEc2WFJNPLWfErEN31HGBQK7gmJnHvkFF49L/OmyHUXCIQYVyXEN/AlA548+EOpNblMiVaPbkQgSvGPVMTMV4FewEoxiZm4bkqmaqXiUdBJI/KokwkD7glXeyH/6MvAkgWm5Zx4WonWry3oQE20Wgb4jtYPR8Z7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQ8zHYb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQ8zHYb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82104C4CEE7;
	Tue, 13 May 2025 03:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747107178;
	bh=KANwdTrPMrf7Y1HjV27ZsvjwWQA1FisJr3J+a5RRaAc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nQ8zHYb6oHCFM/ljLcDeYDR5++1ClN9iMYMelbDp8SGdCAkgduPNPnUbmA5YyKMSr
	 VlNR50XvkhWanQnxo7yUi7Yw7ZXu2BFwgq3WIs5lz0IS5nq2MSzQeMcIG7ffGRXEpf
	 85Vwloqf+c4heqUVIBEV5FeIDkFDBtGHtS0Zt2LeUl2gsnLahlN+koO1RWdv5ksh12
	 dbof3mzXX1P65NjQEs1jewKQPBpg8Bzhw+Gbfmu4drrOF5a/7XBUFFaaB6z9Lm0KXE
	 gwN+AEeTt7iq5OHI1nW/9wolBUc+qQq/4Aq89wYHtUceGAfbn/TsubtwXOQWnjad/N
	 +g0/qqIWhquog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B6739D6541;
	Tue, 13 May 2025 03:33:37 +0000 (UTC)
Subject: Re: [GIT PULL] sched_ext: Fixes for v6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCKYbH3D3BYW8Hzy@slm.duckdns.org>
References: <aCKYbH3D3BYW8Hzy@slm.duckdns.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCKYbH3D3BYW8Hzy@slm.duckdns.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc6-fixes
X-PR-Tracked-Commit-Id: 428dc9fc0873989d73918d4a9cc22745b7bbc799
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9565e23cd89d4d5cd4388f8742130be1d6f182d
Message-Id: <174710721603.1163096.7327897116609827431.pr-tracker-bot@kernel.org>
Date: Tue, 13 May 2025 03:33:36 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 12 May 2025 14:55:08 -1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.15-rc6-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9565e23cd89d4d5cd4388f8742130be1d6f182d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
