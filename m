Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE5F20B202
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606162; cv=none; b=VFmrRQVYLYIMKRL7S1nJKCPyp6NSyvEetgq8Uu/SJ5OJDOFYMmqg1Vz5AuQeJbujsUr+rA4C9qMQP4SbFf69klnCIaHInV6P9LwoT4+UGz7CNwKctajh1i/oOQU1ECSlk4uimOacYOyZVa9ULlqiBc1ZWJFICr17hDX81ZPAQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606162; c=relaxed/simple;
	bh=ufNx2NCDTOfMNtBI/3OPDw1A3p48Z2bM02yGMtaI1yE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=akjgaVNxrSBTNTTdxqHVUYn3rx/y+BwLEyYYpLpIdKviQBpfsWdK5BFUud0g3Lf8B7rDdK3Yl80D7j7NHBendXtKZQ/E+d1iRMIDWuFGp/tyZUMOFmMaPo9Ls13mYp7esTK4eimpfnQbRkHWG+Z8JbedqUI2rbb42RUjXL9QKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4YQi95q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4YQi95q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68326C4CEE2;
	Mon,  3 Feb 2025 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738606161;
	bh=ufNx2NCDTOfMNtBI/3OPDw1A3p48Z2bM02yGMtaI1yE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f4YQi95qzM9FaovL8XKpnq9eXu2pxQVpaRbABSvr1gJUN4LPPrRRZOuxyRXrkJRu1
	 /nZwFnMYwQOoLeropI5ll0fE2+Ih4mFEZ8tpkJuoXaqqOiHRZeAJFVf8u4uVpxSUYO
	 E5EBK+5TGoY/aUCaoddg1eVxqyHY08pd0pv9A3lqNbul4pArIKK7sTlxeqF6AhcG7+
	 nUuTlL7feCN73/ZxAa7Dqb/XO/lrAah3sm2QDYJ4TFeaCYfwbr4Esr5+EiqVItW77L
	 fQApvXXh5+UlcJrQTDqfiqn71rDzd8JMpBbFNVx9J7guja1mo+gTv9YVV1s2pkRIEu
	 NSvUYOTwY+IHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE9AD380AA67;
	Mon,  3 Feb 2025 18:09:49 +0000 (UTC)
Subject: Re: [GIT pull] irq/urgent for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
References: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: 
 <173858836845.600052.7603327021374821758.tglx@xen13.tec.linutronix.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-02-03
X-PR-Tracked-Commit-Id: 698244bbb3bfd32ddf9a0b70a12b1c7d69056497
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a360f3ffd005fe00f002c033b2548aba57af8c9a
Message-Id: <173860618826.3393002.4896685211409591374.pr-tracker-bot@kernel.org>
Date: Mon, 03 Feb 2025 18:09:48 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  3 Feb 2025 14:19:26 +0100 (CET):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-02-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a360f3ffd005fe00f002c033b2548aba57af8c9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
