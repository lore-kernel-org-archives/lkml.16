Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7028DF4A;
	Wed, 28 May 2025 17:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452260; cv=none; b=oOQJixbEkA5J27idX/m4X5wBiwpXvyZt3Nq+e+QbxlC/3o8nMqHER7f0Ds2J9oOmxw9nlmygUiwi6QZuNbcNFWY8F+X2SP136UqTrnoYNCyzgIma8Sen4Yec9xyn18Q6RMvEQtO21h1yZa9/cywzskxRzyEbCfXlnQykfb44xWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452260; c=relaxed/simple;
	bh=DO6ou6OnTWsI3LEEk/Jz78Jd7roAwP4XTCg4Be6eYbo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g645rODElgpKe1m8LCizmC5z3Mj3JRJdbkwbLIDu6d1cRjTWt8IBcLEf96j0OUdRcFjiPuW1o+H4NO3JlPxlfod2eyi29IAhKXeNs3JgPsD9e+bqf/Dp2/hnJmdq+yIIjTO3DT7Zkz3jWIhW8Fxicm8UyNOqxRAG4bn6YxjR9Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itr+YT8a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itr+YT8a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B817FC4CEED;
	Wed, 28 May 2025 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748452260;
	bh=DO6ou6OnTWsI3LEEk/Jz78Jd7roAwP4XTCg4Be6eYbo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=itr+YT8a9rO/BcueQIXBSOzwgL9bKFCI1M6WtERfUkeIVuiHHWgm/n1IOG6KDbqwe
	 Tzr+DVyL1yTF7vPY8/8XoPhjs0z+ubFnb9sp/cETsX0WjK4No64OEFpp+OVOnnSZwj
	 Pp31ckMmPpIqxcLDiglAricu1v29G/cDL/wBIirl13H1bbGEzGZP/DFkwwTV0NvLX6
	 1w8klrf/cu5kXww177V/b0Xb1Pf9fYFYBH9O/qBC/4YxHeVigD6F3E/Mekftobv/jW
	 Kn6NrYC4+yDJbmvORtRrvbKakVpZ0Xdi/VfZP8XvyME0cmbDDGl+QumYDNopGWcrwD
	 1astQx8R5MdfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5043822D25;
	Wed, 28 May 2025 17:11:35 +0000 (UTC)
Subject: Re: [GIT PULL for v6.16] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250527085921.4bd19558@foz.lan>
References: <20250527085921.4bd19558@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250527085921.4bd19558@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.16-1
X-PR-Tracked-Commit-Id: 5e1ff2314797bf53636468a97719a8222deca9ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a61e26038143727d9b0f1bc01b0370f77f2ad7e4
Message-Id: <174845229463.2474092.15976564379401125364.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 17:11:34 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 27 May 2025 08:59:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.16-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a61e26038143727d9b0f1bc01b0370f77f2ad7e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
