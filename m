Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2E1DE887
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749408783; cv=none; b=uQ82sXli+kfoaJWPrCSmDsUwnoRXFrs8Fiq7FUvHm4XJQteO543jbxzs/qSPrPhf0ycwlHHvbP3MdjojyL4mbEb3cjPYWtR2es2OI5FIV+i6OVx0Au2stqTRIV6hQAyaSce19BXp8wPHoQVbHoToz/cUnRaoCcaJF71FfAGL+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749408783; c=relaxed/simple;
	bh=uMK+HujGVifXIIKnCIYK4HAu865M1AJXxVD5Hhyof8I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AT3ab24wvZaSUYfYepB0nicigu51iQ1MXgeDYXNheLHuaiwZsB+h1IeFiJAzQfjkvPBlrpabNBWySz2velQb9wyhEeE6JECiB3icJ+sa0QjWKZC9FPMgwkU2FSp9+ubwvirsH3v5XRABZD4Go9V/CCCih4PsRYfTTX7XvwhuMoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTEich6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTEich6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F751C4CEF1;
	Sun,  8 Jun 2025 18:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749408783;
	bh=uMK+HujGVifXIIKnCIYK4HAu865M1AJXxVD5Hhyof8I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nTEich6k8v1izW1TAk7HkTyRhk5kPwizF0TCm3CsCmGQX/bqxyRCFwthWo3fdpcBR
	 By4qD4XY3P9G38bK22EPVxDa5dHxxUTcQjws90xRrbEckALAJ1/boNayjG19eIhW6w
	 9ZwS/XhET8szTRYZc+wms31dNdPRNLqffbesBUg/j751/HjlqLbamxQJ65bPjo5PKv
	 c165mXsj6OuZlr3N8rvJZ5euuH+IxLR6ygjpMk+L5bwpWN7/tkQ9gxYAcmeFj4Rfkz
	 1VcNH16RpYRsw/0PVUN/mCHD5OyTvaF9mGKqnLonR1o1ypDCfB/wTGpxrTojkYZwJz
	 Mh4h+7DqbmI6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BCD380AAE2;
	Sun,  8 Jun 2025 18:53:35 +0000 (UTC)
Subject: Re: [GIT pull] irq/urgent for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <174936764731.749406.17114868218275391074.tglx@xen13>
References: <174936764731.749406.17114868218275391074.tglx@xen13>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <174936764731.749406.17114868218275391074.tglx@xen13>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-06-08
X-PR-Tracked-Commit-Id: 9cc82d99b13c1ad04e3dff9182b7953a8dba10b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70b7d651ca6e0d37cbfd60929b7fdb55ce66d41f
Message-Id: <174940881402.385950.9141403171833937152.pr-tracker-bot@kernel.org>
Date: Sun, 08 Jun 2025 18:53:34 +0000
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Jun 2025 09:28:08 +0200 (CEST):

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-urgent-2025-06-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70b7d651ca6e0d37cbfd60929b7fdb55ce66d41f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
