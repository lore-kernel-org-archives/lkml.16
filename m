Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950621CA03;
	Fri,  6 Jun 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240618; cv=none; b=TyDrCiQTz3Fg6OyZMyvYjbkoM1BUgABzmDyVH0tUpitDRpbMRb1wE1Qd23inp7hSSDsydyZoxLNtxPafxwF9eFjPj8Z0wYoMyURbynim6Y/0QHD2M6tN40Ig2MO7C3CIqHpAK0Fw8n+vdg6jkfbRvs07wt1NPalVA13CLD4Mgt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240618; c=relaxed/simple;
	bh=XDWnoNMOSB8RSy2MnEFhXs+GQFIvtG3L1qqedrrKzZY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BU8tOg5uwcnRbCn9eLQqDiPdmfHlcUtDw9d0j9tdlex/6N6wfxESt4Z0Nete3A/804UaPDCEHYSGtd92R+IXyyMqk6Hy2C30Rpp6gbcxkmbyO9BRPerPRpSyPsk44ao10adWrWuYZKFoTGkUJcrXuZMDgkpiIOBo+sRj+crSve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acCKf52K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acCKf52K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF7EC4CEEB;
	Fri,  6 Jun 2025 20:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240618;
	bh=XDWnoNMOSB8RSy2MnEFhXs+GQFIvtG3L1qqedrrKzZY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=acCKf52KVE7mweBm9+e8KOVef14gi79exHWXbFLRvaVUhA5dmZ4mv1EICJC8LYtlS
	 CKPC1hEwYPVEAOlFXccuOGGnJviwvAdI0pJMRkzXn7pwAQH+Xf5nBZZsmUb6d6mgUJ
	 rq2yzvjCkBMZY5NlYuYZQc1Yp1nYbokVMqoRyYb9gt8s0ivk1wKeQzClE7wgQpI/XU
	 +MKF4YADbcJi8SDf/A2XYqiv3schijmfQlNsbS210IbGDoP7e5ckV8gQBq+0cGsm6j
	 BlukwFQs0YGXjCDFS7HWXbYcPxY3rub4jtQwNF/uEK7Q4yXIs+mg7q85HDip4hnEyw
	 ePi8mc2L0JJ9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F023822E05;
	Fri,  6 Jun 2025 20:10:51 +0000 (UTC)
Subject: Re: [GIT PULL] Staging driver changes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEKo5zLupPYdXd6-@kroah.com>
References: <aEKo5zLupPYdXd6-@kroah.com>
X-PR-Tracked-List-Id: <linux-staging.lists.linux.dev>
X-PR-Tracked-Message-Id: <aEKo5zLupPYdXd6-@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc1
X-PR-Tracked-Commit-Id: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a100922a3855eb35ecd465f1d558546b1e144445
Message-Id: <174924065024.3964077.295723246213431155.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:10:50 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 10:37:59 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a100922a3855eb35ecd465f1d558546b1e144445

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
