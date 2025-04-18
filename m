Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897B2405FD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008048; cv=none; b=LZRQFBeWiKqOSkh10PS7pXCXzV9o/k89i07VTiln5gJncgiLMOcjXU2jQFSg/H+dypKawZ6dHQcqAoL3q1IQX4BX3NSxALD//8gJZk/A6GQ+o7ynsAfmmnL3V5vBSBc+XBvE874N9EFa54xFCamEpHg4NYMQE3wlQVBeoYprYgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008048; c=relaxed/simple;
	bh=YV1VwNtfYNujRSVjOyD1UWauvjrDUilZR0/Cs4imwOQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hqjEl0W6DMu7aL+/pdqxAWN7iEVBNcj74tCTU7P3/sKdPiCeCRdqUDrOtLRBR/ox8fPQAD3XM2CbX63wTuTz7Qn69EDpGzOwdDynCy2ZnDpsL/d7zCp7hIV0I2HoKG0nwIoul3SY9xzN5Yy0YYCs4I4XiNXxGACU6gaxbaeLpIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eE0dMYq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eE0dMYq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F313C4CEE7;
	Fri, 18 Apr 2025 20:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008048;
	bh=YV1VwNtfYNujRSVjOyD1UWauvjrDUilZR0/Cs4imwOQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eE0dMYq12PS+Td5/XP4dNqfbU1ZkBNR14D+GrUPvWDnmbX9sCbgFKKYWf1w10rBQD
	 RxCM+O1pVZDilCnj0aQDossBCBkIzeynLdRzo+Y5kKQYmd1stQ2fpWYvDvjoNGpibQ
	 BfYxZAX0KopcAhWGk3xXHHQmX63NCYT3oanzAUtJYaJPwm9zS8gike+XPk1xDGkldt
	 fvSTPzr8mewwlzPrtOVMpYGxyNCLYZLyPDEs2+6OWpzpXg9rVaQDBSxea8Ak2H6ISX
	 InyNrB/xRIiMrzeTEO2LaI5os4BiUj//EULTPVl/FinHrD0H7uq6F4l6DDlArPB5hL
	 EIIxtbHCAN75w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4993822E09;
	Fri, 18 Apr 2025 20:28:07 +0000 (UTC)
Subject: Re: [GIT PULL] hardening fixes for v6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <202504181303.EBF4F5594@keescook>
References: <202504181303.EBF4F5594@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202504181303.EBF4F5594@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.15-rc3
X-PR-Tracked-Commit-Id: 3f2925174f8bd811f9399cb4049f6b75fd2fba91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bf8a4598ff32b59248be017bce8d20a4e472c7a
Message-Id: <174500808650.316726.7436427391264792240.pr-tracker-bot@kernel.org>
Date: Fri, 18 Apr 2025 20:28:06 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>, Mostafa Saleh <smostafa@google.com>, Nathan Chancellor <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>, Tamir Duberstein <tamird@gmail.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 18 Apr 2025 13:05:07 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.15-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bf8a4598ff32b59248be017bce8d20a4e472c7a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
