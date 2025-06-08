Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A01E1A3B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408784; cv=none; b=FMfWlG9pm9NP4GIl5SrhsSgXo1EYcivu8avPDFVzP1+PJAInCG6irOHeU5zxdd72ICli9ixHuXAo9g/QKQBC5x/NBmatKT3VvlHp656f4dP6GIQLoNBU5AT1/ybJsRYte/5rS4WjivQMq8LgeLgy4yIRTKgbrQwJ13O6OxKrouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408784; c=relaxed/simple;
	bh=WQXC1nwnaS6QaOjlVVKmSn6S7jF6xByJkIt4FgqvLX4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kbkp6RWTDvkYBYaxbdAN8u02yq/qYt28QlE8y5GZjgZrUl+iNtIGi9sL4AYRMwSRDegBh3iCpowNgLpSt5nINhubtesX31DM79I540edDEVzy5WmQ3NkfxlI3V2fCsRpssdujEZx8VfZLmV5qilXSOW05beWbdwrkufWuvJRKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwMUEN88; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwMUEN88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C0C4CEEE;
	Sun,  8 Jun 2025 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408784;
	bh=WQXC1nwnaS6QaOjlVVKmSn6S7jF6xByJkIt4FgqvLX4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QwMUEN88bA6xBjloDL4eDoofdQvLoBiDeork3DQfJmSkwpFmtnjB0k7r8dS8rt/Bg
	 VeHeT+9VGQDFPdNz5p8vpyPwy1gCkxWSaGlblRVMPAVSvRDRQSJZCCn9j1tR243oDP
	 OLVEjiKvXivd9tuSYe1X09svWH1et1/9JlfbpgbvK0PnmH/KirL60zPWZESe+PiHFc
	 7IJpo0IpVEV9QGGitt+Qout+UCTxYGX/bUKQBaYPaoE/KK1n+U+EGH/hIHn6CfAGpN
	 ziDNSqL7wLoBlj4mgRRhcqN70yj7NOmToCeBcRi6f6Q1urLKVX2qJPvaDpLmW6aQFw
	 TnP/mIlKpZ+uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB6380AAE2;
	Sun,  8 Jun 2025 18:53:36 +0000 (UTC)
Subject: Re: [GIT pull] perf/urgent for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174936764909.749406.14078984601089344731.tglx@xen13>
References: <174936764731.749406.17114868218275391074.tglx@xen13> <174936764909.749406.14078984601089344731.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174936764909.749406.14078984601089344731.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-06-08
X-PR-Tracked-Commit-Id: 86aa94cd50b138be0dd872b0779fa3036e641881
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d9864e7d151194b06c6cdbee8e69f0686238313a
Message-Id: <174940881554.385950.18211552582329188118.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:35 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Jun 2025 09:28:09 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d9864e7d151194b06c6cdbee8e69f0686238313a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
