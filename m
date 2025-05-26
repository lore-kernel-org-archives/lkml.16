Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C66A32
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 21:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748295792; cv=none; b=i1/UO2a6ZSVC2RIER+H+Ndq2np7zR2rzQSwYZPkqkCTNrKVC8On4pTJlBmair92/Rv5DuROXj0fJ4uQZn9ryuI8+cQecqxIRNpNbQXJoFxWqtuNSusEfq+b6bn/RpQRj6NjE9ijbbZMYYXBrjtdAI6uZFSXQzETtA27ORKpb9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748295792; c=relaxed/simple;
	bh=+Ck4mPqAxlov3HBYiLojeENHAA4WBaXp1ioz84MyJUo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LhD+yT0oq7I+v1k56rtdJ949vLh76dp6UUlppgJCZMaP/cKhNqpurJ3XIgx1pSanEZ5LVuRh1QaG69jWBx9ZADJdL3XyJlidDq4O2t3IThJCbtrYCUAbLv5Vw8Vs8bly09pj6FJ5T/mKyCG6ux8Y1/3LQUSHAPqBcssKsiUk/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZsWplfe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZsWplfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408EEC4CEE7;
	Mon, 26 May 2025 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748295792;
	bh=+Ck4mPqAxlov3HBYiLojeENHAA4WBaXp1ioz84MyJUo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cZsWplfeOto4Sp0H4sajQY6etOSHG8iTDvsH8Kuq9xc0GZSoScQk/IRYezCPKbfKa
	 h27rIVcrIvuUg/uR/re916fK5MKUWZRJhc5LuN0pHFkao1M1U21ijvogFlDrohXVg4
	 YYoP1z5BkfcsnVnU0qKcBKH8dePVt/3acx0SsHeQiTUkW/FdCeR8hxvQlCeKMqjoaq
	 ZwpZhCL5+lFaakQJjYydkHxTkUEgOtu+BeELo6AsYHPse27f9maIimEAWcey/SydCE
	 pHjri9RBdCGeqMPNmSMUMEGpAiCb6Qh+eOOpqKst9mgj2Mj415pTdSlM+7qloWnMdd
	 e81RpNjGR7PGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1FA3805D8E;
	Mon, 26 May 2025 21:43:47 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.16-1 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
References: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <c8dcda66-14d5-4f76-8e83-69840e49af91@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-1
X-PR-Tracked-Commit-Id: 8682a5749a3d2b416b57709115c0351b50c8efcb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3349ada3cffdbe4579872a004360daa31938f683
Message-Id: <174829582655.1067115.5551098722471991963.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:43:46 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, amachhiw@linux.ibm.com, atrajeev@linux.ibm.com, bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu, eajames@linux.ibm.com, gautam@linux.ibm.com, gbatra@linux.ibm.com, haren@linux.ibm.com, hbathini@linux.ibm.com, jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, msuchanek@suse.de, naveen@kernel.org, sfr@canb.auug.org.au, sshegde@linux.ibm.com, thorsten.blum@linux.dev, vaibhav@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 26 May 2025 07:35:53 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3349ada3cffdbe4579872a004360daa31938f683

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
