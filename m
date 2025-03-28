Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0226AC3;
	Fri, 28 Mar 2025 03:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132364; cv=none; b=hhroeV/vSQed1O5Wn9vFhCUb3aKbp+qUTIolhrawfcpreHjjQmOnluY4L0abdpE1f125LUgKVor2fpVk21+H8f5x3JsTQ5fky1yojp5H6fFI9dQEKNAZX8eu1ay1Ea1ZMpPjDvQF2gE3k2Jcu063YOH8cgp7czbsVvH0c19bO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132364; c=relaxed/simple;
	bh=bLqxuH/RljGu4OwV80a6B/nqpvjB6uVH16Q2lIa2nQs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MZv0Wfcffbuk5LxkvkX2epwOoe3R0ZWmw59EflqI1N+X7zaAMjp34EIblT3LAaaQG6DxvPuLbLGjhw80dQQpBt7cRKJUCnH1KNdXMF0tt6bZ/x7Hoo4IAD+jkT/E+gWwB/EJT2w4Mh23ef/nySXM57ZxFfwJwJIdJ8ZEclx1H3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lia46rwe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lia46rwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C0FC4CEDD;
	Fri, 28 Mar 2025 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743132364;
	bh=bLqxuH/RljGu4OwV80a6B/nqpvjB6uVH16Q2lIa2nQs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lia46rwe7oSJhzqsOR56zN2G9ndIRcMMYLlRtasYd5aedpJSnj/9tcyZjYx5VfRNH
	 FMq0nmHZWuNT7xp/ClQBo2eJKNRO4+beirsqla0bhkMdBxqHljFHN+9eze8ezHmatb
	 6PlY+oTEIuamrqsdi1/DF8gGNEbHAlZ18guGi/bWqelrWxL/sDGrF2wb+CtCrlNyk/
	 QCEVvu61Guz270kLTOmb3rz5xk+OzNt2EWJ1uc5Z9z/o2ruIBtZBjmSPTPqUsEpL3u
	 iZTI8+lXWXZ6KGcuPZ95dYQZInac3FVq0g93iDCQ42NEE+fsqow7Ra6G47uzgMNkId
	 fnGEWOFZamgUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB2E8380AAEB;
	Fri, 28 Mar 2025 03:26:41 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <85317154-c8a9-432d-b43c-34dc5e511890@linux-m68k.org>
References: <85317154-c8a9-432d-b43c-34dc5e511890@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-m68k.vger.kernel.org>
X-PR-Tracked-Message-Id: <85317154-c8a9-432d-b43c-34dc5e511890@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.15
X-PR-Tracked-Commit-Id: a7130910b80753d52ff8a493cf787bd1c9473404
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: acb4f33713b9f6cadb6143f211714c343465411c
Message-Id: <174313240053.2338593.13172377204323849367.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 03:26:40 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 21:52:53 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/acb4f33713b9f6cadb6143f211714c343465411c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
