Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEA221555
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748981356; cv=none; b=CnS1FVsPKkcXMjAqeAgP7rh1IcMfk6bzqJ6IVsfF9J2P6qEjGiXUN01NORAguYnHAo2TuLvyZgw2F8+t72ZNLNBw4igJ/2NbPDfGyguSrnSThYvaApEVDj1QFDhlPhO7+JjbWaOlWaNf5LEvl8FU9mSB9zpopQR9qL5Zyhvw8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748981356; c=relaxed/simple;
	bh=mrgTZQ9qQQM1STwP2VlbrzVcQCqAZxnRXAZSrwBgXFE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kS7I6ZP3s0dvt2sw9ULwGSFN57atCbkERhBlS5Kkv0MDxaFtrVUqek/Pq9LL1m/kH1qjPCkADkXCCkhm1DmYpKwglOyQ85HaQTUPgrnWX/wHVV8z+zx1ql9nEweAYQ6oHGKOZBQ2bUvFVRYilqHyeq6VrQQIZhvGWb/hq3KNsS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIlKTRP8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIlKTRP8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFD6C4CEEE;
	Tue,  3 Jun 2025 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748981356;
	bh=mrgTZQ9qQQM1STwP2VlbrzVcQCqAZxnRXAZSrwBgXFE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XIlKTRP8fbwbYNQHzK60YTFpjDq9svdo0FIC8tB32sCv1+HOscKgdqJuRup+GiTZg
	 8LEBfuRECrLVWTk693rPAx2wwiPSz2EVZlPe/vCs7rtRadpuzZDWbNqdudFCIwvRcW
	 mrExT0rHhomczAcLfliNXivMcys2Z9AxNivMv+uhOdY//3cW7ghLKhgHn0JcXZScA+
	 HQv0b0ElMQssRp2tOlmmTeq9G4kAhQGT7vT3XyCjhes4ACBEWnF/MTMLjQGouyTvOs
	 eL4rc25L6nyX9RDdJdBebhlZOeqJrzTwxnKumf534VRWAU5u0SvfzWMa81psRVyN8F
	 C3WIN4UY9FY/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B65380DBEC;
	Tue,  3 Jun 2025 20:09:50 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603100132.GD7758@google.com>
References: <20250603100132.GD7758@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603100132.GD7758@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-6.16
X-PR-Tracked-Commit-Id: b338a2ae9b316df1d81b5289badcc8cbbbfe1b2b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b546608ea2151eebfca515d362bc400645e02d4f
Message-Id: <174898138883.1645326.330734022782863751.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 20:09:48 +0000
To: Lee Jones <lee@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 11:01:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git leds-next-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b546608ea2151eebfca515d362bc400645e02d4f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
