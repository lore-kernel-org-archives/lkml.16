Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3BBA42
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 01:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643731; cv=none; b=BnbLRtuiMfP/P62rt4W1L0jQV0/Nn8YzeEUrxOS4KC1M84M77vyjmhPQZUoRLypqkgavCNsr3mE9vXI5+i4iwBhFLBbCda5qS2cgpzWsGko9JEHN4GvqGWOSG4DDUuxQLnhkyzSONQD3ygv1PSgGN40t4btTaO5HfiroSPZ9UfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643731; c=relaxed/simple;
	bh=TT//47kexa7aVR4iJyweRcU69m32eT+oeMsUd5B+KMI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Hsx8m0Wuwcnrau63znUhNm+IfQMkRbKy+vPM53aELwC1ldt41UsH6hshwf90lIxT+9AYRRWJBOpkdLZG5rBK59ivQEMFj/O4HTS16JSGcfUPY5QLkliFcHzmM/WnDPTFPzhWCIT/UEyDRUhbFaRiOYMcy6mRMv1pEMRyYdfv3iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ns71WrQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ns71WrQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C48C4CEDD;
	Thu,  3 Apr 2025 01:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743643730;
	bh=TT//47kexa7aVR4iJyweRcU69m32eT+oeMsUd5B+KMI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ns71WrQ8AHa7/W8npSeMA76PPVFkWuzHEic7VdYH6q49h+XDbAyasJUFqHdHSgEt3
	 01Yk2XViPcwBytw9QtYrr4KCrmvNvNmdv2SvkIa2lwxiPXZ3gMzBWNrgiPIODlD94/
	 gDCe1NXh3efLDDTiMrjWGR6wxRPl1aI0go6FCvOOO2TEWURWMLz6XEMPIJ0aZHROxR
	 u+WGidRLK3s5wS00bzHBYBFAwP/LOETgDbFVB3Yx5+XuQQp5vwT63KA7oZDQPElBjc
	 JdErBgOlkIvlBuYiPkU+/VPVb9StoByCanN5ZxMm7xmulZp7vPGuB48v8xnjVFqNXw
	 1pbpHvHjteiaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACD3380CEF1;
	Thu,  3 Apr 2025 01:29:28 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc driver fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-2WXkaNHGqsvPNm@kroah.com>
References: <Z-2WXkaNHGqsvPNm@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-2WXkaNHGqsvPNm@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1-2
X-PR-Tracked-Commit-Id: 2dc25093218f5d42391549de6fe45e1aa9325676
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0935e4ca3e1f2d5176a5b60bf6092cd7eba9914
Message-Id: <174364376760.1744561.6401757010492219784.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 01:29:27 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 2 Apr 2025 20:56:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0935e4ca3e1f2d5176a5b60bf6092cd7eba9914

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
