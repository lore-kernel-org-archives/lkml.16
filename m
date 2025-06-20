Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7621C18E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440561; cv=none; b=T8RT6qQxGqyOxQ5nDWmRJAh+wEADfoN0OnPnVLuj/lC2wmf8wUcfnjfyavbrBLCy+rVi3D6AzUcaI5bUykeoYOmVa23NFaMx2iMlZkVk6uCiM34151055ucLWtHz8A6BpKLS4FJ4URqTTPwQSBWkQcSSop+kclq5gjj+kTG920E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440561; c=relaxed/simple;
	bh=85cr4eLyWlNP87n+hSpFBj2t7Xu9xQ0rfmOLdT9i2B0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DRIpYYVTwB53rER7JuVt6kdMPuEm4aGbR6dGuRFWP54VnAQeqzEX60NT/J1lAQtUm5cf+hiPaw4adCxHeSoG5Uqjfmk3n0PG+xx2pbaIITFH9OsPbJyuReBGqdmubu2U33dGLnA2qRi6ZXcIHHSwKgXd+COAVK4UekrDdnmis30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqvPrcjg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqvPrcjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57416C4CEE3;
	Fri, 20 Jun 2025 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440561;
	bh=85cr4eLyWlNP87n+hSpFBj2t7Xu9xQ0rfmOLdT9i2B0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mqvPrcjg0YsD6pPYqwQkC0g+f61GnckyP16nfS1pmpDQvUA8D2AEM1mViJTdjamgW
	 5uaGwKRdSpGTr3PdaB+skvwbawUz9MPzIo5RSoydL2EGBkTWrvXDWsk5kdNM9yRy3m
	 qCxvBe/3YV3dxlrqvIv+h9rZfu5B5UgnOrg4cRyFpXE8vt1ZmSVHnjCrQr5uIDrxjI
	 Xu7goyCOSg4sLxZC2hg6Vr/1mgcKJexe7bvUD3TDFjgeVm34e4fK8LoIUzug0yX2b4
	 ZTycvpRpolP5gCP9Oink4oMSsNDp1CAP2KdszJSz6rMGMv3ulIUwp0IkihX/m8ANWC
	 eivCN/XWT5rCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FC639FEB78;
	Fri, 20 Jun 2025 17:29:50 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250620105005.GA22615@willie-the-truck>
References: <20250620105005.GA22615@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250620105005.GA22615@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 39dfc971e42d886e7df01371cd1bef505076d84c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d41fef1ce2f3cd9df128d2c3cf6d91ce15130daf
Message-Id: <175044058898.1649825.15526665644913580484.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 17:29:48 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 20 Jun 2025 11:50:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d41fef1ce2f3cd9df128d2c3cf6d91ce15130daf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
