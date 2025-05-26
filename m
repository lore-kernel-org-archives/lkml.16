Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF3242D69;
	Mon, 26 May 2025 21:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748294378; cv=none; b=JsJYcnnfwgHuAt5GjTSLa4t43bQ0dV6qUMuNuTl+f4FfnU6TXHVyyonyQ4Fdh1e3G0XgqTUYNA9NROZOXwWmFAey5N9BjynNStCKbdqE44Tf0RB9DHIzWWB4XJwZc8ByXb/krZ4X4ubvlTa3R77Ia5NAEeh3c8Y5X53dRz2RuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748294378; c=relaxed/simple;
	bh=SAllJ45hTY3udtl1fqt6/wd5ohSPsuns725LM+/YgYk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j8x1/auQQklpr7CPuhcRj5y3GmlRupnXO2V1TOUWT1BRbxi6Z/G1HV3ud280wh8cS588FRPeLNuay9st19EXnfEXXSCL/Zv5uesy8O/yCIfEvjBjnEoYvfmCW0Eon8W0aHI3YnLFUxnW3DjJs/uNQi/MI1XcHunsgmdGj6iy5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6qfyDxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6qfyDxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381C2C4CEF3;
	Mon, 26 May 2025 21:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748294378;
	bh=SAllJ45hTY3udtl1fqt6/wd5ohSPsuns725LM+/YgYk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L6qfyDxa0uEkLtRyMhd7m6I68Hkz2pEm+WQ+4v+YFC7Mphs2ihq8gDrMCXh73zLxD
	 zGXRsM/EcYGOdyFuyq6OtZhwlENuU0OM7dKu2AvTCprO7zT38ZUgXH16DeAZTz7afx
	 omI2AWNPrvhKMRdX787rtpvC86gRj6s03G2mEvLcyyDutjw7OYw0lN2KVUdo57Xu1n
	 C7Xql3AsLiniRDBW9A4pYZWDBPhhZ79U5+9SdcV/P/cawrQFEDtS/h4unQCg6h8Qh8
	 PyUa8fsijSSIznJOi3qvoQhQa49/l+CPIh4bxjj6Zh5MaYNwPRaZYAYAcUJBcOn0E4
	 a4PQ7Osjf86Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1E8380AAE2;
	Mon, 26 May 2025 21:20:13 +0000 (UTC)
Subject: Re: [GIT PULL] gfs2 changes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250523205122.1783753-1-agruenba@redhat.com>
References: <20250523205122.1783753-1-agruenba@redhat.com>
X-PR-Tracked-List-Id: <gfs2.lists.linux.dev>
X-PR-Tracked-Message-Id: <20250523205122.1783753-1-agruenba@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16
X-PR-Tracked-Commit-Id: e320050eb75e914aa5e12de2a9ab830c9a2ce311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8fdabcd9c01d9ac585d8109a921e0734a69479fb
Message-Id: <174829441289.1051981.8038892790938571851.pr-tracker-bot@kernel.org>
Date: Mon, 26 May 2025 21:20:12 +0000
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 May 2025 22:51:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/gfs2-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8fdabcd9c01d9ac585d8109a921e0734a69479fb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
