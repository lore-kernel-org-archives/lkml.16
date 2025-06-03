Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2625393E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748992879; cv=none; b=GpM/7kIwBv/CId0nHJb5gw2w2NP8yQZDOCZ0RKfMiojS5BRc84H4K1zTxSb5v209U+tMTJl2SMl250TpXOA2qpai2Rd3/GqDQ0hQdaFoXnSXdBcCaOcppaD459SzV6B7B3O/pOaSB1EPJbAdc0bUvB016Lehlr+nGniU7gWBSAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748992879; c=relaxed/simple;
	bh=ds0Ht0wqPulwQhUsGaEklmNu8CD3UCq3I9giQPvmClY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XfU3HYRCZz1iuobWsTV4d1bIY+eeOIjeMRFjj68lysQaGi3od78+LNSbL61vKTWrPnXzMg1NDPXRJRvG8dUigfCej9Iba9tlbTVwrt1p53FgiC0aP08UhI/lJhC0nkdvYNNn6EqV3qeN9xWICuSpedCsStoRr3mvJGbCFdLGRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5sN+fm9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5sN+fm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F6EC4CEF2;
	Tue,  3 Jun 2025 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748992879;
	bh=ds0Ht0wqPulwQhUsGaEklmNu8CD3UCq3I9giQPvmClY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I5sN+fm9Pf5/HqF/txm78hPhk8Byls896tO7UDMuzzmilkyewiQMWxoP2Qp54yF5b
	 4qnEIccIb3qd571P76Nx6q4yCmuFNn37+mrj8uiMX84Vn+JW5FY3/uDt7lcoEQMwcg
	 8G+HA7QOnTC2qCGjrRdmMQFp0YmTQnrYPJDx8zMQdjJ5s/PJWgVvif2phdWhC7y1Cz
	 qoQzn4m09dwev3Ec8dG90jXlPTiOrSjyxzCOrFxx8JMmLN+TxcCk5pVYPmbFvnOk1z
	 vFA/AFjgENvps92w+IMkkN8OSSPOceXIHRU4J8n1D/I0zsGSEPjXgAu7hDA6oRG9Fv
	 ljw9q9d8oAr8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D25380DBEC;
	Tue,  3 Jun 2025 23:21:53 +0000 (UTC)
Subject: Re: [GIT PULL] tracing: Fixes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603155909.2564d008@gandalf.local.home>
References: <20250603155909.2564d008@gandalf.local.home>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603155909.2564d008@gandalf.local.home>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-2
X-PR-Tracked-Commit-Id: a4a45a9a72f3a9eaa17ec502d6e97c8eaa901825
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70087d2200d4a3bd31812ab4578c9ec70ea344af
Message-Id: <174899291186.1704306.18335522364810908921.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 23:21:51 +0000
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Ye Bin <yebin10@huawei.com>, Jesper Dangaard Brouer <hawk@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alison Schofield <alison.schofield@intel.com>, Dan Williams <dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 3 Jun 2025 15:59:09 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git trace-v6.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70087d2200d4a3bd31812ab4578c9ec70ea344af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
