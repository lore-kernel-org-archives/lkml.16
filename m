Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8323D29A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966933; cv=none; b=dqRavJ5EkRV8hYvTJZ0PrKxlRtazECwvHp9ozpy3ojDYg3rmeoPSiQbDm3oflm1oCYAErP8JddCH41bS5ovga4qQ4YybiqR8CO2L97lclSoPJ+f1Bi0HrEgF9Clhb90JoWIm8dzlK1fROgPkPFnjBOQsfoh9WGsvqw31j7jF0rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966933; c=relaxed/simple;
	bh=8tlYnJbFhRyO2996bUeGVNCRe6luyaLSTq41N5Kmd6M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=simKowQV0I8duYDLumgj7R8muvcHxKUh/GZy2rCDcbgJQCiaSoeDvGHLF//oINd5MK5xRBeeEj43KH4PCzqdGxCJwWwKWusWvzC+IrVJTBJmMWuQWvrybZBum9IAhDp6rSDUQ2Woq8/xZUE/oPPFM/W738A/2On8YTjnJ774osw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkF5DIxS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkF5DIxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BC1C4CEEE;
	Tue,  3 Jun 2025 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748966932;
	bh=8tlYnJbFhRyO2996bUeGVNCRe6luyaLSTq41N5Kmd6M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HkF5DIxSTNDjlisIxDiAEbDB7aOn1Do+OwyONVrqX+UihmkbIKQR24NcSIawm8esd
	 yG7WXKr66M1W2uvQPAvQG9h1hq59MVIeY8amDSai5jRG4cnw4QRupqys0mXTcC/kPU
	 SBW+X4A4nHEu9Sh2MoTRuZ51E9Qkn4/cnzHbkfRc7a46Lb1+TPmxX3j+xYVIkBrsZE
	 3/dlKeJ5qdT09ss3Co2Pw3PQDHTL+zwcyGeqcO5p7Gcxmo8ZexYv142mh20MEgs7bS
	 Ob1geXh/1q+u5qa9rUaGoEeuyr+x99Sy6HmSBYbF2xZiwJvTBQykTsRTO4F4LqExdk
	 e/VYdsIR/kc4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C02380DBEC;
	Tue,  3 Jun 2025 16:09:26 +0000 (UTC)
Subject: Re: [PULL 0/3] xtensa updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250603110351.1583773-1-jcmvbkbc@gmail.com>
References: <20250603110351.1583773-1-jcmvbkbc@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250603110351.1583773-1-jcmvbkbc@gmail.com>
X-PR-Tracked-Remote: https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20250603
X-PR-Tracked-Commit-Id: 3d6d238851dff53f49ff88d280ab9fc45eaec60a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5164456c604f6b7cdc5d8ee2cf792b10fba3aa2
Message-Id: <174896696473.1571592.5501684770973187084.pr-tracker-bot@kernel.org>
Date: Tue, 03 Jun 2025 16:09:24 +0000
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue,  3 Jun 2025 04:03:51 -0700:

> https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20250603

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5164456c604f6b7cdc5d8ee2cf792b10fba3aa2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
