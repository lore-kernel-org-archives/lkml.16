Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A7A2147E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786085; cv=none; b=B4i54nkGllJcmFsSmVi9lGURsCUuSy/Aji+GKIDVVedcdOAxD1aj/5dqHztvZibHM6yPfb90LiFtF2pne2wob11O982daoxvZx4Yw8SmuL/vdfBeFwSbu88Cmx/bsYaCPEMqTu8WSt1KJhCJ2j8ncLPT+T/oJGI/yyN9/KjJ6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786085; c=relaxed/simple;
	bh=CVtA1y3MJxia669z5EEzpTaAZL7U0Rb4+ZWilTP2FCA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qlNeCmJIr/eQh/2dWQcFNH9mWZxaQPt/RhwgdnN3L29c91jxIh0pA1pM2sLbEorYtr79ObIi3V5sxDCB535WPzevZ4Cz9BWx3BVWK3INvqEBnnJyU/DfAqQmgsMNJnajKg+w95RHbMks/EnxWIgMLr9juJrvwI5Mv08rP/CZV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8M5ZgHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8M5ZgHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66179C4CEDD;
	Fri,  4 Apr 2025 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743786084;
	bh=CVtA1y3MJxia669z5EEzpTaAZL7U0Rb4+ZWilTP2FCA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b8M5ZgHexKXddsGDF8lUQo89cDc3pZyKmAwHrztW827qh8aNJVspX3QsZk4bfnAKx
	 a5o++MAWg4DTdlRxeRopalLH1mOqChfTqR3Jg+WXgpgL7L2fTprzyc3cLm+ASryQ0b
	 ePxFIgYyh9jVLQ6L6Z9d0zIKlg74OwKTpE43W+3O7Q0HJikXSPAYufY+KMLeFHfhhJ
	 fa1AP0YDIhNn6H2xGpIRCSAXU9dqRRmmuUixsYSP5QfTUKvby4KHIRzLmelW/A22Wn
	 raXhINNjm6t5BU19F/tj1/J8VlMKGVlrbqciO/Ns6noShgBOO8kU3e04mzJDus8CLb
	 2AbhKhAqxJTWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE50C3822D28;
	Fri,  4 Apr 2025 17:02:02 +0000 (UTC)
Subject: Re: [GIT PULL] x86 fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z--tH31is0ge9a9M@gmail.com>
References: <Z--tH31is0ge9a9M@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z--tH31is0ge9a9M@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-04
X-PR-Tracked-Commit-Id: e5f1e8af9c9e151ecd665f6d2e36fb25fec3b110
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fffb5cd21e0b4ac4a5e26f7b356bbd97ed0cb5bb
Message-Id: <174378612120.3331400.14955459391989287909.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:02:01 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 4 Apr 2025 11:57:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-urgent-2025-04-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fffb5cd21e0b4ac4a5e26f7b356bbd97ed0cb5bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
