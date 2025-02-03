Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EB20E030
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606163; cv=none; b=tJa81hki5s60wiFFc9xVRuWy4MI4WdbcEpg8rtxWFbY32B+JKfl+Pc9kLxmD/uC5XcFcFk31zi9groIDBQqJ3DvFJPtvGlpsLFbolMcG51ss19OuygvylmYJJhIVCp9k14TfSu/zjW6UeCxAh4U4av+OcOlP54tx62V1buLD8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606163; c=relaxed/simple;
	bh=zIzMqyEmfYxYFhTHUpMlsKjadOHpAGE5Yom9Wq/8Y4s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Q2lS7KmbygfikstmMsoiUOLxgH7F8KxpI3q1gkOLcrTski+H82nIGhqIKTBrFIW4Q+ZVPODpkUXINbqJ0pty9TWgkzLrjYpzNO3XuA4/4wAf+S4rOvMC7E6sv6y+rUECAv1TMz/fOmuSMPmVKQzLp098o0eM7CyYUWoS+M0R05c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlnS2BsK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlnS2BsK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0800C4CEE2;
	Mon,  3 Feb 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738606163;
	bh=zIzMqyEmfYxYFhTHUpMlsKjadOHpAGE5Yom9Wq/8Y4s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qlnS2BsKWb31aP9FkKwYwOCXBBThjh6iExAtWXofPI/uYKq//wxd9xvrJ0EvK4cyf
	 lHBsMnLhd1PDDk37FAUb4gZS5yyjOhQDNMEl3Cd8iBUzYDjUZrgMNqNA4EHT2DFnRM
	 IPdVz/XlmxQErnxFwHv82RIMXU/3mSgSOZbsH7/oG1g7I0cbGcT56MMmbh4QHRTJtW
	 YI0RF4YVIkgBozi49CV13XNoQB6alxFAys8PY+sKPRftB2yWADWwcBtA++qcnrRMtJ
	 hzvEBK/BD74Q1unnH3pVkSaZ4RM03vBMCYioJzJOftMnsh64wfokL9vcQCOJy4/BC9
	 jRdMLkToBZjQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBB33380AA67;
	Mon,  3 Feb 2025 18:09:51 +0000 (UTC)
Subject: Re: [GIT pull] timers/urgent for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: 
 <173858836968.600052.5042226943389744452.tglx@xen13.tec.linutronix.de>
References: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
 <173858836968.600052.5042226943389744452.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: 
 <173858836968.600052.5042226943389744452.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-02-03
X-PR-Tracked-Commit-Id: bb2784d9ab49587ba4fbff37a319fff2924db289
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f286757b644c226b6b31779da95a4fa7ab245ef5
Message-Id: <173860619055.3393002.5936901521177965243.pr-tracker-bot@kernel.org>
Date: Mon, 03 Feb 2025 18:09:50 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  3 Feb 2025 14:19:27 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-02-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f286757b644c226b6b31779da95a4fa7ab245ef5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
