Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4651DF987;
	Sat, 29 Mar 2025 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743278147; cv=none; b=GwtMgHTHCmjLz4mt3OY0MA+zLNVJfvHO8RcPtitfj6m5kbgC9TpGS7AF4MbHHIEI3MmISMvsLvs/2AMvlJPdb95RqXNaV3Ug8mmfkbKLOoOqxXf45/vVP0PVujtsFxYnGCXFjB/cJ7xDAs3u+seh54w8w6XZxn5wvbRXndhhreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743278147; c=relaxed/simple;
	bh=zUfURZwmpuSlCfiGs2rB1RhSuw65teGVVXIId4IA2kU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HffovzqDXR1XNVASOCDOJ602v51zgUWCbzx+yCdMe22BWutsqBfnb3axu6Fjwnb9A6nL+c6UZ7cfWwfrJh0JE+Sqg/H+vAL95LeuEPdIDU95CzYl/08l6XfgsyRsmBp6jE4tckg/nDBSJH7ucNcxKeIJSboRqRrhDOIkKWRx0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tz0IpwMx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tz0IpwMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E655FC4CEE2;
	Sat, 29 Mar 2025 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743278147;
	bh=zUfURZwmpuSlCfiGs2rB1RhSuw65teGVVXIId4IA2kU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Tz0IpwMx5lTsEA7JcmTQInssL393MXwF+qusp3Zpi3qcXLoa5TTf+RGhuossK3Iht
	 +pXD+18qTm9/f6NZbDxV4h2wrWYLcW21/z4J8nuy5bTsm8cqbhA2Uv+mQo9t//pXlt
	 8CgLHmMb91YBkbNnywU7g36RruCFtvAwyC8ft9A0kiS6CGLPjUwwAaRVAPG80eU4Yd
	 4UIMaM8sNibo4gnFLpb5KqhpwGDaD9xswHzCF9atLuqTXLsb4PAXlZpVSHg7WvFHJg
	 Yaul8OdQv5qtPfnewXh14kZlVHWyO9LYNeW3MPf1LP7smHgAtHK9l9Bu8QV2otzL5L
	 UUuImGvIxoUSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE8D9380AAFA;
	Sat, 29 Mar 2025 19:56:24 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree updates for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327194144.GA884505-robh@kernel.org>
References: <20250327194144.GA884505-robh@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327194144.GA884505-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.15
X-PR-Tracked-Commit-Id: 314655d41e650b3d72c60aa80a449e0ab22e2ffd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b9ea5b5ed7e07c47932bbc40ef633de51b3752f
Message-Id: <174327818319.3264055.13274017237770804978.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 19:56:23 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 27 Mar 2025 14:41:44 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b9ea5b5ed7e07c47932bbc40ef633de51b3752f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
