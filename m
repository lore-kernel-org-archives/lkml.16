Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0A24169C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916193; cv=none; b=PFKYraDOpsjgFjM43v23ff/SHZ8atjFf/xjbWp09zAyJMCdDRoEl12VuGNDa1ppo0pK5z9MK8IAk6eP0yoTAK6etfZspJ0awdicMh75C7be6fwADGn0ZS3gQXgosT2T0St5FQjeGMVNk+3OQ5/lrwpd2TGPDy+Z9sxeGrCyNKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916193; c=relaxed/simple;
	bh=2WiSBdqR2jEursVoeXUuiW1A74IIEdUo88Qk5TSEpsM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RIIEZ7CVM9AEr7uC7q1WHXS4MCN8mvBRDVriudQBPswe8dtNyRIgoYludsTBEok7Rzj/Cg+qXO0APs6WeQ0hfCQCzpG9WdzDVZYUxupguyE3dSMmr+DaS280ntFGll3+or7ahuwdi7K1IdjtMTZuXjQmgxPR9RzsmUTxjg2UcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f93FjgV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f93FjgV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572BDC4CEE4;
	Thu, 17 Apr 2025 18:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744916193;
	bh=2WiSBdqR2jEursVoeXUuiW1A74IIEdUo88Qk5TSEpsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f93FjgV8wfhlhniI48DRpxfaP7ZahncidpZgk2zv8LOm5XZ3jyPycnnNx4LVctFFf
	 h5g6jzD7fvhOBRlKVksGtkw5C31V8/d4LSy6IWsTX7cefBXn9x7JLthQlUiUaRg9iT
	 0s2brjGH7p3jcTQNXIwRkXNZUa6ZNTlppveWLsXOOBFjmYq0T5m990dURv1adDfzyp
	 FBc7eA3KG/NJLMUPZXHwxV6EhOmdXdrke14iixDLg9YUMo/LRoz4vWjXTiRruS0Z1f
	 GmGHN2gZpySRCeYdv1FYHwY/FQtCyv8ouimMNQ23Kzgn1gJLiSPzwo2dRiFATv2/C3
	 vcBxaa+ANw/uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD1380AAEB;
	Thu, 17 Apr 2025 18:57:12 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250417145831.23359-1-jgross@suse.com>
References: <20250417145831.23359-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250417145831.23359-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc3-tag
X-PR-Tracked-Commit-Id: 715ad3e0ec2b13c27335749f27a5c9f0c0e84064
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85a9793e769e2af692d341a2b3935703eac65328
Message-Id: <174491623122.4184086.14165543907582591003.pr-tracker-bot@kernel.org>
Date: Thu, 17 Apr 2025 18:57:11 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 17 Apr 2025 16:58:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85a9793e769e2af692d341a2b3935703eac65328

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
