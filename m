Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9132EF9D4;
	Tue, 17 Jun 2025 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186102; cv=none; b=noE+jVdQXFNFgHqqGSZ4jIY9t6VewYyao2+0Ytrfekuf1iHHmIISMEprXL9RBmmU8deppFhCYzB/QX9sePc7CyK8DFmvQ8NblWtyby4B0atcNMzTQMNpAfXLbsKJ52Oqn5nL7D5WP6Ic74cx3MIUATn8v5Ua8PWzIsGmTCygX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186102; c=relaxed/simple;
	bh=xXrkHKB+EL6rA4PB287KHi2ShFXyyA+Au3iKbif/BEg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qq82v9eBZ6e7j5UGTl2gxD2wYg36orNpyjj9EA+yqCZ5xehyMgdmpujr7g5p2KM+ZlmD5okX62438Yn2P4Mtvvp/4N3zNSLI3LKa+/twCWVG8+ZOd1PAZ1D8hIi4kLxHHsxRsUJHaDBEdB1xJ2lfoqAa+UMNoL/IY6xUQLUAUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haePrrBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haePrrBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F27EC4CEE3;
	Tue, 17 Jun 2025 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750186102;
	bh=xXrkHKB+EL6rA4PB287KHi2ShFXyyA+Au3iKbif/BEg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=haePrrButp7lnbes6zl0ZMjOwV9JIPvOZMjFpVEQ9enwhtUXcZ4UPqqaSnZHB4MKu
	 PD0kVY52B5+gA1UGhflEs/4xH1OoJx9S0AzVHeiHz/lkXe2+tnGtxe9uXadugsmRcd
	 slyALuP+T4+TQkYqGoFZyHovuol4ZVhQKsnuBz9LKFFnAy72Cc4/6mBhOJjcUQhJL3
	 kZHli/e039+C7T2OFQ6jiNm23Fm73ZbCeripTJmA0k1YV7tuKoqc4CeC7sI2bmSkFL
	 zHJsNzpyYorMlEJNvRseu+2wcg4/lzLJQRFmccmdijL4+Ny2bdIt2EjHjDiWpyei+z
	 eEcV6VNSb0Iig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7106139EFFE0;
	Tue, 17 Jun 2025 18:48:52 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-2
From: pr-tracker-bot@kernel.org
In-Reply-To: <pdx86-pr-20250617152816-1278911842@linux.intel.com>
References: <pdx86-pr-20250617152816-1278911842@linux.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <pdx86-pr-20250617152816-1278911842@linux.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-2
X-PR-Tracked-Commit-Id: e2468dc700743683e1d1793bbd855e2536fd3de2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4663747812d1a272312d1b95cbd128f0cdb329f2
Message-Id: <175018613108.3294381.13079775060200758242.pr-tracker-bot@kernel.org>
Date: Tue, 17 Jun 2025 18:48:51 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 17 Jun 2025 15:28:16 +0300:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4663747812d1a272312d1b95cbd128f0cdb329f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
