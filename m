Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215A1DF244
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322178; cv=none; b=JogONO4hmPqtf1GEd8Ljr7EMyRYHE9IOSa2sa/Ts79QQ3Z0MWqPTju7D5ttgj6o2F6imSio7wVAEr5f7lb/AOGnZXbO572uHZUQUHuIk9y5rTHhxZ6rU2mAltNiHIP1Rp08mgSmcRXpYKHhkyHTQUGL41QqKlPmwSAZ5tk/Ul7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322178; c=relaxed/simple;
	bh=Xk0NdzlvjqfUN97TwKcy3isG8SQzMkQr//L/m8ZaWbs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mz6qm4zrNigsgXXD7CNI88T70FMaEsquDn8PZD67QDMd7vhfFSViJp/SHu4yILo48gMHaaNwuDTiw5+1zn/nuqf12HOZ/yGiUhIjN0r3Ij+8y7iaYwPC/JAyuCeyRdnpKHS6/mX/hiPsd7wtlJafHcqfoOGhGz33DLv2aIf3bYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpRUwfak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpRUwfak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9902BC4CEEA;
	Tue, 27 May 2025 05:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748322178;
	bh=Xk0NdzlvjqfUN97TwKcy3isG8SQzMkQr//L/m8ZaWbs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TpRUwfaklmGg4wkX/hAYHzZSq8E4QaZx+TRrjRNFbrTIvmfarFElJz+HXgeiDcDcl
	 t4ZCOH/11iFPWn3DKYo0SZVvnpuGWQGgWtgmQvg2AiqFnKJZ7MBJudaokIajVAWxXk
	 RjvB2KHbjIh2E3NhMU5ouv49hJwX15VhdqjXXAY9Sc7xofr7uy8E0yA1qw5mTA/TGU
	 OpXUhwpkMlt2Vo0NPLXqWQ4wnahvqSu1Xa90dSyEq8H+a4UiUMzThtrMWRVY+xrUik
	 qTghPAT0Ybf0CnRodwp+AKNC5iOHe4/n8qurbLg/naKI4HLT0TyCg82SJ7Cd48RWQ8
	 QDK6JQGH+DZAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A61380AAE2;
	Tue, 27 May 2025 05:03:34 +0000 (UTC)
Subject: Re: [GIT PULL] x86/debug changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aDL5XBNMbYXn5txr@gmail.com>
References: <aDL5XBNMbYXn5txr@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aDL5XBNMbYXn5txr@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-debug-2025-05-25
X-PR-Tracked-Commit-Id: 06aa9378df017ea7482b1bfdcd750104c8b3c407
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0aee0617267866555b4e35bd11e1fbb291fa9743
Message-Id: <174832221273.1158362.3853199180928681302.pr-tracker-bot@kernel.org>
Date: Tue, 27 May 2025 05:03:32 +0000
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 25 May 2025 13:05:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-debug-2025-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0aee0617267866555b4e35bd11e1fbb291fa9743

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
