Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5726FDBF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858020; cv=none; b=aoKZDjbK9KUL47K27N2IAJqgpGzeeaX1ZT09WbnCRJy4APCZZEkAnDxqD3PhApaVBMpD7GJhVzHrRBYffs9blu3vtadgCtfGgpp9eT6FJm3vlStFX/7vjKIsVZjAa9OWS8jqumQb5mpgeXQCpK+2ta8uHSv47xUgGhazWyBNFqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858020; c=relaxed/simple;
	bh=06W3RhuaA1KCx8LHfdM+UJUaup6l9lKuGtmqokMizFU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JpByfGiv/IGjidZDS9NXprHWyM8SKiMlUlIAsRNUsN5eOzZmIuDB5LFb0MyUbpB8vfZYRqXT8DCSEbgcl8EpagfRdR8v/ZVJN2izGPT+mVP6dOkD+/k0dMrgBXkdzcmUQ2QD6XtPM2TPJpDbKyRUszPI5huYJrwemRhaA+Vt8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqfLBTi8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqfLBTi8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2F4C4CEE4;
	Mon, 28 Apr 2025 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745858019;
	bh=06W3RhuaA1KCx8LHfdM+UJUaup6l9lKuGtmqokMizFU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kqfLBTi8CDSPQFwMZsj6zXiXb8eoh7O7CtMgYdImfa4kq/ErFjPYrZKkhIWL8yPbh
	 Slv5cpgPwlA/OgIfSKXF1WaehbpLwJ08iMkv6FphvQlMd5+qCUwe0slQK8+u7hjgWi
	 JdEiuNfaSBxfAFLY31gWXlBTWNMDl76MnhMr+j4xalpnWmPQin/YIOScykm52vt7TX
	 81MgYv8b3I8Z8pppES+NyyoVqwPtiWs39pFyOT0pS7fUVtyxYGKu8CJnp19r1Ku09W
	 FQh9PfDy8GTGAC7lDFyg04lsXacNWzQmY67ofLhEdA50B6GXaw5xAMY9HevQblZeCQ
	 TIQ8k4YkSOlHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE3F3822D43;
	Mon, 28 Apr 2025 16:34:19 +0000 (UTC)
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.15-3 tag
From: pr-tracker-bot@kernel.org
In-Reply-To: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
References: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
X-PR-Tracked-List-Id: <linuxppc-dev.lists.ozlabs.org>
X-PR-Tracked-Message-Id: <fb634e22-a820-4c14-a8a9-5cccb37bedce@linux.ibm.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-3
X-PR-Tracked-Commit-Id: e3f506b78d921e48a00d005bea5c45ec36a99240
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f15d97df5afae16f40ecef942031235d1c6ba14f
Message-Id: <174585805854.971006.13862543469827952448.pr-tracker-bot@kernel.org>
Date: Mon, 28 Apr 2025 16:34:18 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, ailiop@suse.com, donettom@linux.ibm.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, naveen@kernel.org, ritesh.list@gmail.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 28 Apr 2025 09:24:19 +0530:

> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f15d97df5afae16f40ecef942031235d1c6ba14f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
