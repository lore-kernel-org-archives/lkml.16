Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB354221297;
	Mon,  2 Jun 2025 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895302; cv=none; b=Mq9i97vValHwX57DFN3QHAO9gFTKKMEjnwLYWsHp1BuX1uWLYxpvV4zRMFTQJI6JKKJ48t9DZ+cuOXd6OHQJYq/rYOnjG1e9iXe+JEP/oNZB8izxbd8hDCaLMNBBDTVLIH/pfo7+swSaa92jAgXvRKF5/G54DRB+mjusPE1UAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895302; c=relaxed/simple;
	bh=j68d7MpeEO8xwT9CNVd6kpQnlJhM4cvbAyjJbViCMiI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k6qHD5mMez8Brq8/lxQpAXkH0ZMShLcjMWXjxwY/YxEl/PXA5pgd3wHAquwB2sX8sCSVZ6whic3crDpWv7WQUdXyjxUNQCB+BRzs5S/nwquuXOiOIKH0ZcbPEvP0cll7mD5LdSKOCEqIlbcQuH7+vku364VvueYMvXfYJZkZFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K58Xp1j/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K58Xp1j/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BA2C4CEEB;
	Mon,  2 Jun 2025 20:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748895301;
	bh=j68d7MpeEO8xwT9CNVd6kpQnlJhM4cvbAyjJbViCMiI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=K58Xp1j/DTZ+al/jDGb0Ar+7rb+u0xWVsGhAi1RywDHNrKMXfyxCzJ+dKkiD2m0tD
	 qp8idM2bwurb2dCqJNe+AvV5ZWGWBwC20Dn9IzvmeDMvI+If+VFTuDIKhFOFcIeg3r
	 SNDtkAPex9eVOgz/78van6bZuYfQYv2mQ/UW5xWkmdaQme+UiWm8o7mnuQgbLbC2sW
	 qLuTogboIVbhv3AQLYPPA3lROFm36Lr7iFpGX7NMceHGUh1kZ3lLWkmF6xVg1vIP9z
	 5SMYuPrCfrsOXPyUlX+cAgvGwACyLd9jBg+0HduwWyI1jHJKyx0OxHc27cCUZ0OfHp
	 UwlfAui0Hx+Ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34079380AAD0;
	Mon,  2 Jun 2025 20:15:35 +0000 (UTC)
Subject: Re: [git pull] m68knommu changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <992c6488-4089-4e0c-96cf-70e8d18b4986@linux-m68k.org>
References: <992c6488-4089-4e0c-96cf-70e8d18b4986@linux-m68k.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <992c6488-4089-4e0c-96cf-70e8d18b4986@linux-m68k.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.16
X-PR-Tracked-Commit-Id: eb43efd062d10bacdf6b50df0e300a7049474e51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df7b9b4f6bfeb1143e7626c536e03bb122e90cc9
Message-Id: <174889533385.896656.14004325410523635837.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 20:15:33 +0000
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: torvalds@linux-foundation.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, gerg@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 2 Jun 2025 08:53:11 +1000:

> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git tags/m68knommu-for-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df7b9b4f6bfeb1143e7626c536e03bb122e90cc9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
