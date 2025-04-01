Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8311C8609
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472968; cv=none; b=eIIlex6mOzNOLe6yQScFeEd1jGDpGR02n+UZdHgXI9phN2YKnOu43ed3WARdCGS6TdyvAVtnc1kY7ZtENmmc5qJYv6/KPkrPsOFAPR1yIGicUunJHL6K9ld7xFWZb/2A5r3hO8ukug8pNRpC7hU39VkTJRJNSjWPcl1HoREig6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472968; c=relaxed/simple;
	bh=WcWBpHrMEd8bc4AMaa16daKpwU7n6tCVBfCJBgRhy5w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JX6fSrNxNIoV4I20LN86BY+Bez0n4r1hFTUW+SUto1hxoPrHlQTn5mrUkN5mqIu3XNXSLDrlevxl5a44udmLUZq0KDdSWeO6469mk5nmlUHiNP2qPtGUhHbOsn1vxl93U+ChMxLsPb5WTVAeWJrLzkeVibw9y5R5CKLo6oKV+G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1zuoxsX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1zuoxsX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA91FC4CEE3;
	Tue,  1 Apr 2025 02:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743472968;
	bh=WcWBpHrMEd8bc4AMaa16daKpwU7n6tCVBfCJBgRhy5w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F1zuoxsXNdYwEl27GNNZ7dPTzebOOph+UvRkcdP73ePsLq+y88s1ACoIyUhlZLwYv
	 8NLDGr1wj0x/cQlai7qDGsOrvnrpI0aF+ShY2upsa86SbZ2gRy+gb5rY9WbUBWxQOW
	 JoPFDdk7xZHKVqwroG5AVsFGbUmJX3AHYNwXMoP3C9HS6EVjGRI5D4gLCieahplWhE
	 43kGUU12+ooRush4B1npIZOwGL+eLqNooz/w8pE8Uf7v0RuQ6nS892iAUfqxYncq0B
	 KgFdK5w8USWU0JlGW7W8TPFTXAk/xg0vM5iEjw65uIB5NxpiBUTQA+t6zQFdYssVyy
	 MfOVErqd2iohg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE22E380AA7A;
	Tue,  1 Apr 2025 02:03:26 +0000 (UTC)
Subject: Re: [GIT PULL] ksmbd server fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAH2r5msxpWx-jGPQZcowF=u5Lum4mYAOJtgVQ=u0vJv13U254w@mail.gmail.com>
References: <CAH2r5msxpWx-jGPQZcowF=u5Lum4mYAOJtgVQ=u0vJv13U254w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAH2r5msxpWx-jGPQZcowF=u5Lum4mYAOJtgVQ=u0vJv13U254w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.samba.org/ksmbd.git tags/v6.15rc-part1-ksmbd-server-fixes
X-PR-Tracked-Commit-Id: ddb7ea36ba7129c2ed107e2186591128618864e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f64a72bc767f6e9ddb18fdacaeb99708c4810ada
Message-Id: <174347300523.206397.906498867060162455.pr-tracker-bot@kernel.org>
Date: Tue, 01 Apr 2025 02:03:25 +0000
To: Steve French <smfrench@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 31 Mar 2025 19:17:11 -0500:

> git://git.samba.org/ksmbd.git tags/v6.15rc-part1-ksmbd-server-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f64a72bc767f6e9ddb18fdacaeb99708c4810ada

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
