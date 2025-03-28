Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0016B36B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120559; cv=none; b=l3wKv2zZpdLl3F2SSM/ZXMJDK0trIBVruR7mfRg9R1WmHClo64ggs2nT5uuZCKW1DHQn6zjZ67WdfpJFA01+WVzNvkCTOHfMI3Djc0GlNRd54l4xSJY+9YC71EWv9/v6Py2i602XMEcUBRFGPZn814041vb4QyXwjPwrjUgN/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120559; c=relaxed/simple;
	bh=IhZwOPTZO47x4ytKaSCkZDIAr42+6od9UbJ6CRDGSF8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GhvyLxtQLPcwq/RRpvquFihACHnG+0S5Xgnu29/j3C/L+GDZrXrVAqG7u0w1lJuY5tCUsbBlrI0yIIo56433WIxzyux7cQL/lg05HbWnkedYRGdsXbnrPnPeh30wGD7aCOaAHJscp0jHaoZ3DVYlfTGdzIF8AKr7suriO1aOOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jliBgt4K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jliBgt4K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD886C4CEDD;
	Fri, 28 Mar 2025 00:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743120558;
	bh=IhZwOPTZO47x4ytKaSCkZDIAr42+6od9UbJ6CRDGSF8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jliBgt4K/znY9DAWI/BcIB0i4pjK7NH0z+Qla1gHXfjP+tsJyKx9d0yEyrpdyfta+
	 DrbOarWOdM7y6qnxSpY0N7F6gJNPf59pgQ9O+SPXCEZ4xLMkq5thI20TRO30mQ1RFt
	 iBSMFaHJwOqZYtRvkFle1Gdd+vcnJlanXdFHe1z1QbMBQwCr1i8JlMrmS4u5DT6xf/
	 2O5NAM+c18ZygJNu2gyLa9Yg2DZgjSYQ8bNiYeHc+1KTQIbCCyxScXMApvkQAk98Vo
	 Q4Rx95cV7T9XvwWS3CRJqMJnhqtPyrTf3BL4vystE4VZJJcLMURWx5RklR+h5yhzzH
	 2BUEcKwkhC7Ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711F9380AAFD;
	Fri, 28 Mar 2025 00:09:56 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: scripts/sorttable: Updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250325180527.5fc0a1fa@gandalf.local.home>
References: <20250325180527.5fc0a1fa@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250325180527.5fc0a1fa@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-sorttable-v6.15
X-PR-Tracked-Commit-Id: dc208c69c033d3caba0509da1ae065d2b5ff165f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd161f74f8198c62f9bcf893f72c64bbb0d68b25
Message-Id: <174312059505.2290382.15306229374898038273.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 00:09:55 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Mar 2025 18:05:27 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-sorttable-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd161f74f8198c62f9bcf893f72c64bbb0d68b25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
