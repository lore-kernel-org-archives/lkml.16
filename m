Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBF21ADBC;
	Thu, 27 Mar 2025 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102614; cv=none; b=cux6I+Z3qWdC+3rMV4Hg35nPTphX0yqVZde6WZFsi0WaxqzIlVUTBoyKiAekX8n1Y9/F7q+vkjGAIgD0eN5t9khmUL/ICClnANnxURrRv1nsWiu7O4l1/zI8JtDVS3TeVggMzOoB3aLelckuB4vtyZ/Z4hxeVN+9ss8Z2g5UgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102614; c=relaxed/simple;
	bh=b2oXZnPzsIum4K6TXMGqWU1F5vMP9hIiJKyV23xpD4A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kD8tb5UpVQl8e1Nw5vbj22JE+gUAO/kUDP7UlgyPfwIH9thHJ/ue1mpjPlte2NpsvZN2R4wP0PXndkxEn8BEovqQnu+u1v6pcXqaJ2xZCIwsKhx4WCTwT5IBpg7drREGQrkKwhCRVSodkyI4+frcK1WD72zDLR/AjTRiEIbeTe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q11eVxxl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q11eVxxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9540FC4CEEA;
	Thu, 27 Mar 2025 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102614;
	bh=b2oXZnPzsIum4K6TXMGqWU1F5vMP9hIiJKyV23xpD4A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q11eVxxlT2mMfu/SemfDhLr8oPIVcypJuO+4feKNi05V8rjEQDbQl5IPsOrvuv6xG
	 WTtI4B83NLp1fIt3AiOPOx/L18hZyR7GxTpiCbdI2cpWBHTzuRypHpuMTenjxdp7bu
	 mWB9R2zrckjkcfejlvitfp03T7mg/wwFotMZVb/yaOInQI0EyZ7r/5Ha2CsQ/qKnI3
	 9adMWrbQIvInxYa93IAbCsiUfClT/VkO7R8+8RT8yk9x/tkrDZzNiI9qQIX7FBWqvy
	 Q4MBiJ6H6ONnLgfrddKXwNA6EIHDfkZi/eAI2G8LvejLyMOSIyvsyCBMwQMktkfsu0
	 ys1GVUPdnYxIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F1F380AAFD;
	Thu, 27 Mar 2025 19:10:52 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm platform changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.15
X-PR-Tracked-Commit-Id: 46367f09b2203f7c63f89293aea9279b875d0ff2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3536cb1e5753a832f88c268e328c644f6e367980
Message-Id: <174310265091.2176831.2744875539352981808.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:50 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 26 Mar 2025 19:03:55 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3536cb1e5753a832f88c268e328c644f6e367980

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
