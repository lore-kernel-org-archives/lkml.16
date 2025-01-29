Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9B1E9B00
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738180823; cv=none; b=ecg7AtC3pMalEpn4ASDUkVhnovKHlziUk4mszO1zFif0R7VahQFNYzG/IvmEMymhs5xxvdichMzHH/JMapYJ9rF9MsH+HUi+7exZBYb6N/GBIbBZm82lGzxn7MIGoK3PF4HD4rkq7T94qA1qN3Fm5ye9eqE8tWL1ZdlgE0OCQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738180823; c=relaxed/simple;
	bh=iVfZkLVruIbbdzsnZUjYzyiyWIqjBGQkh7u7/V1Jtwg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sUTJnzTmM1cGe/FO4VgpAZMs1wUQN2JPMGkcBFY/Oc1Zn0Jq+Qt3GThg56KYdriEbCh/YQtvdMsdSySfOgILDZrIpyfmkqmJuyZPG39KDuHpQuK8ciM22FIoB5vnukeM490fl9qLZgEEf6PJKVIx6QnMSzgI4+o+uBMdrktoF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwRQ+iFU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwRQ+iFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D33BC4CED1;
	Wed, 29 Jan 2025 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738180822;
	bh=iVfZkLVruIbbdzsnZUjYzyiyWIqjBGQkh7u7/V1Jtwg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UwRQ+iFUxtV8g1OM6HbfW7XBiTOdcc/n32bE6o0YauK6Yubvs+bPxASqrw+klc3Kx
	 hf/kBWMvjhuSdv8XLNlYEle//ixLcuE1b5auG6ohvQvkb/eAAiT7pkknr+wXSaXit9
	 DEn8Pe1AdadAVCSMpc8ecCdkZPjCYfpdyh+JXhkzAcMtPhOS/GEzkM0SZoxb/xkKtr
	 8YDmdn2GaTbee1y41bSMYs6ZUNdy/EwDpKCQx8r47+XuUI+jAERfU4cZ16nkfex8C3
	 t/B3IV4sizKP6opgOb9MMx4yohcN1/1bd1cx3SOSv8Xl7xNBxELvZrI505mOj5vOrm
	 fIrmDChy72NcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC238380AA66;
	Wed, 29 Jan 2025 20:00:49 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250129183614.2601-1-jgross@suse.com>
References: <20250129183614.2601-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250129183614.2601-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc1-tag
X-PR-Tracked-Commit-Id: bda50f7770e5b8e730745e119eb6ca78570f7abf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2091a64820f068dd19b7dd5351d8095adb3e5f6
Message-Id: <173818084837.411204.4406262662728868525.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 20:00:48 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 29 Jan 2025 19:36:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2091a64820f068dd19b7dd5351d8095adb3e5f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
