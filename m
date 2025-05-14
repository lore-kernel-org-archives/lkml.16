Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B0727A470
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240725; cv=none; b=NBTMv1NHZuT+9hiMBbo3YxOrtC8d1b5YnNbS/nfZ0hhn3Y7OdPf47JPPn9ah6VQgYX4bQ4Gho0JVD+hYZT7c3eqyrKyFEhNUk8o/rVavByjVQQjuMHwJ/HAHGhemdh0Tu1ErcwqSvukfCG3JwoEASiM6y3ClybIy6iEueG2uPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240725; c=relaxed/simple;
	bh=dLUd+jQ3CwecUQLGWI5l0N5k83zXNo7zTWwz2ItlCXg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eZUONl2/Js4CO+PJOJlqVx3bJ3goSLRSMK2SXyLAnDBnbsXo/unXYLOZCgeNLgTUU0neOYpigmo3oA6Jwf91TmWYwGpY1wjX+T4X6P9PHwekg60Sl3oTnWODh+TYAqDYF/qOvmlxN1SH11dXNFzVWEIHmT6z2MBNheQrg6mmgEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETsiA+XH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETsiA+XH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E404C4CEE3;
	Wed, 14 May 2025 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240725;
	bh=dLUd+jQ3CwecUQLGWI5l0N5k83zXNo7zTWwz2ItlCXg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ETsiA+XH9YM2b3XGRBb7/u05/LXy0SNtoowVSnbrKJK+VH9y8GmnOHJ/vIIK795Eo
	 9ZzRAsekc9Du15dRDyZejd9zxsuuzJUz+XTwHxg0pseRthCBPe2TJ0V+sLeHiWU2Y4
	 sIkylu/hcrC0HQX7oewYZExcrNQy+Tf1gZ2KY2ag2BvLatH3+0KAppA7QJ4pO00HxN
	 p7ikiGZWvLGLS0s8Ygaorq2T+kXKOJFcFBop0dUzQIMR7ewal9NaAANdY66e57Dn2l
	 au4u+Wxn3w/r+ZRfVDbjZNho3RaWBRGSwx2mPbu/cMyUZ74+6F6h1k+dieJrhiBJTP
	 IEqtUhTcyDvgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADCD380AA66;
	Wed, 14 May 2025 16:39:23 +0000 (UTC)
Subject: Re: [GIT PULL] execve fix for v6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <202505140853.4D9C198E2A@keescook>
References: <202505140853.4D9C198E2A@keescook>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202505140853.4D9C198E2A@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.15-rc7
X-PR-Tracked-Commit-Id: 11854fe263eb1b9a8efa33b0c087add7719ea9b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1a80a098c606b285fb0a13aa992af4f86da1ff06
Message-Id: <174724076251.2432206.375801502657486108.pr-tracker-bot@kernel.org>
Date: Wed, 14 May 2025 16:39:22 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 14 May 2025 08:55:23 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.15-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1a80a098c606b285fb0a13aa992af4f86da1ff06

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
