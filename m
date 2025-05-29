Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A4F1362;
	Thu, 29 May 2025 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536827; cv=none; b=k0WlxUm7tXXQHeU7MgN3KkmMS8Gz1d5jvo7hGUbO3p1cXzWFiv3n8CMFNgkeA8iGUbgLefEICmXJyxpYmCvv1OrFOqcIej5nvYKUdBSXArQA3DVxoFSXFWeCLpYpeUS8Knt0PkswkTnPjgQzp8bfvKmx4Z9GBz46ptMpAWVl12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536827; c=relaxed/simple;
	bh=9kRyzsZxwEJ0SmNoj/a0nLwWZmoSk1uLa36PioXi1kk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tMW3CGsrgMDR4zKHrayXYqLhjtQFDX/+6abeeiwhIhp7kx/UDMrm4CvUVlj8wpknOO0AkIFlllFG2amG5XQr/KcjM7sblLsut1IpiB3pG5ui0n1fQEAWMzRlIEsdz9FCBsh4znOMZ70A1LZqHYLXHcqeKiWb/+ONq6pO7qCOgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOA/eXN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOA/eXN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330A3C4CEE7;
	Thu, 29 May 2025 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748536827;
	bh=9kRyzsZxwEJ0SmNoj/a0nLwWZmoSk1uLa36PioXi1kk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cOA/eXN/UF4cdKXVxioOGSIfPeTvdePNuyU/tPiWadwBm7hbBvvuGdDIgsEGGsG9/
	 KNI0WxiLeVkNtW8FURFvJbMNKSgZ4SE+kR9Q3n2v47EwdDZ6zZBzzPBqfRJCIg/Fue
	 8QejKV0Q1WMoiqb5Joc3oZgXAQYA9CJdE6f0dxN5cGBDQu4TFUl4dxvI6AGpoV5gLf
	 iZF3huPTz8/3I+xj1WqX7LJajApYhYurBSr6TR3V9f/49giKVd7/MATsLwsdM/BJPf
	 9Udu4Y3BgjX3JPZPJ0gT16bqyA/SOul/d9ffbYCu91gEIxIbIzZfQlmU89U+p/TxCL
	 x56snTg45vXfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E06380AAFB;
	Thu, 29 May 2025 16:41:02 +0000 (UTC)
Subject: Re: [GIT PULL] Devicetree updates for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250528155257.GA4154719-robh@kernel.org>
References: <20250528155257.GA4154719-robh@kernel.org>
X-PR-Tracked-List-Id: <devicetree.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250528155257.GA4154719-robh@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.16
X-PR-Tracked-Commit-Id: 89ab97de44fec8eecedd1d327d418c5781303c05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf373e4c786bfe989e637195252698f45b157a68
Message-Id: <174853686107.3320073.14314406389295331070.pr-tracker-bot@kernel.org>
Date: Thu, 29 May 2025 16:41:01 +0000
To: Rob Herring <robh@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 28 May 2025 10:52:57 -0500:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf373e4c786bfe989e637195252698f45b157a68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
