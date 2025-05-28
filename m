Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1F22069F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461465; cv=none; b=ZMRiEuCCUevkuCAd7wBUshwTwahs3+XM8akfSJ59NnRK3AoTkcWi7MQR34L+VwCouZPdls0fXXGW1MB0qKb+5p5v1gXRAu8m6HT3IG1Wnt/fK02aYjiVSOwxSSOVHprDU/RSk5kg5Ot8zpv03tPfEZJXC1AEObi//JXSPMnfVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461465; c=relaxed/simple;
	bh=l+FD8tfxx5PXi4a2mxT95JkOscGaL2qMoClkGjO01+o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZVfZkS76/TOTWSp/iFqNQRgng+Xg1Z9lMRLtFJp+Z6hu/lLftETf6BdQpOvESKQsj5kAF3kw035uP4blfvHdHL1qZJ/NbL2sKElA6XmrL0OGCbHHG8O9ATX1V6QnpocNM/JkWZu1EpHmeGaOfvcYYlgHjoSRn7LCgt6QFJaadT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkL4T8r9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkL4T8r9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F465C4CEE3;
	Wed, 28 May 2025 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748461465;
	bh=l+FD8tfxx5PXi4a2mxT95JkOscGaL2qMoClkGjO01+o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DkL4T8r9MtomB0+Yr/owhYUBgbHG3cekK0R9p0qpl3m4KYyzehzSvQCBkU6aWEX8+
	 HFs6uaHXsmdFqfHT4J8Mro05aGTUr56mQnH+wojeoIydAm58o6dxbj9KS+v8U9GJaN
	 rZ8gxvOEHanArMqPJeaIvA9nNtKl0OTkOUKXcKi2+OCgHVIy0dT2DRqN+F2C8CXaM3
	 XR8uVfX9yXYmTy6ERGU6N/jyijdBPBBedRd5n5b0s+RuhM056flK2P1sTdGZ1IOG11
	 r5pcecviVjlb5ekIR6PbjrOB73ba9tsDD0tPu8/Ep2weP1W7AlixwXVApU2fHVk/Gz
	 LzPUhi6rG/95w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CF53822D1A;
	Wed, 28 May 2025 19:45:00 +0000 (UTC)
Subject: Re: [GIT PULL] exfat update for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd_vDJU-iBpWVC_6VYKH0YOGpZ9m5-9sw-kzDzyTgBAADg@mail.gmail.com>
References: <CAKYAXd_vDJU-iBpWVC_6VYKH0YOGpZ9m5-9sw-kzDzyTgBAADg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKYAXd_vDJU-iBpWVC_6VYKH0YOGpZ9m5-9sw-kzDzyTgBAADg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.16-rc1
X-PR-Tracked-Commit-Id: 46a557694b464881b3c2c4a0ba389a6436419a37
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c69d8e9de00995ebc69392a470da99256127fdf1
Message-Id: <174846149892.2536722.11099914443521995826.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 19:44:58 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, "Yuezhang.Mo" <Yuezhang.Mo@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 21:38:11 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c69d8e9de00995ebc69392a470da99256127fdf1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
