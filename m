Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871218DB1E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659196; cv=none; b=ZRHC1bky7MLtjjLGRVif1VWjISaHbAPoio184jyaU6XXhohzYdoNZAaTyRCo/wePG2HAis5zFeTud/eWmRz97ajF3w01mMK0mTCpDMe9PfsoGTztj6xSaLMUl2eKkfiUPfX+jSb4b/FE/pRtxosvTM4x5OpnqoH6uVDyEDC18hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659196; c=relaxed/simple;
	bh=ckvFSxlj1+kkG0OH5o0eCNmcsKIOimqpQC/7MnxNOU8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ELJohkgBV1giF/uDu341LfnTLvhXibiU6Nr6kqxADy2maP1DNpFpxRFsH2dPxJNfeDFG5/HX9mp8o3c8vB850IQIVCQ3DkKyUP2yjWDgzyoTwIkNfMUA/p/cB7KK0Frcx3ChlzgO0CwdSffoqcS420ATO3EcOMUwKiXH12dX19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JExKbsKW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JExKbsKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9018BC4CEE3;
	Thu,  3 Apr 2025 05:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743659195;
	bh=ckvFSxlj1+kkG0OH5o0eCNmcsKIOimqpQC/7MnxNOU8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JExKbsKW9s44BrqY/iE++bBB1tBTUN4l6aRx9b8HwP32SwDDob4Tl1M4/fPpV4COl
	 zegCHHq1VL+tsy5c13201CiwM6FGF5KZNQ9vr3T54A/rNoK01zBMyUq2yb0AGQjDPE
	 HNairwuQs8Ue5pljmBSiZv6GbbEjbGBO2qlVqt5rTPqatrUazAipO19u5hCTKDQg8S
	 rPLs9xpgEIPFu3brmlHxob8lX3BI90yxNtrKAtDSrOMuktm+q1aYEjTJ1YNrq0R17S
	 ealBHOi4XEIlqVvVZl3gCKt4k03REKy/XTUNp1byp3PwwVa1KqQPAo8cICIh4RuyL+
	 l2Od/iTswUOuQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEB7381090F;
	Thu,  3 Apr 2025 05:47:13 +0000 (UTC)
Subject: Re: [GIT PULL] firewire updates for v6.15 kernel
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250402141951.GA79643@workstation.local>
References: <20250402141951.GA79643@workstation.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250402141951.GA79643@workstation.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-6.15
X-PR-Tracked-Commit-Id: ca2c736554c105897d67a015a97973af315e1c32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
Message-Id: <174365923230.1797294.17924598340220092478.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 05:47:12 +0000
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, masahiroy@kernel.org, luriwen@kylinos.cn, rafael@kernel.org, yu.c.chen@intel.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 23:19:51 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git tags/firewire-updates-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
