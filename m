Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8D218AAF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 20:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240653; cv=none; b=c6Wdc5QvN/fpDhQ6SSYE9KWkOSQDcAlFoDLUSgO7cPj0sG+maKEXwVtLNpLLwIZYDJq2sdwiQcUi6I5NzB+pLjBO1vLRjZ7VtZAJYC9VKk018Y2TdBLpH6RZ7iy67ioKN8Hoy9HA2UKehuuAlfeizyKNO8212ZBUgZQcNG4AQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240653; c=relaxed/simple;
	bh=+GDJ0Nu5QE5EUDCUWsES7cpX0Hil+V6LCVDl8RsoSmg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OHPSAQDdnaszw94adVRW7ATTBmC3UQJfoIivdopl2suvnShGXjyv8u7FdmjjVoiDEBHTKwjaOpQ8uM0admPL1ehL3oCtM0n6ByCcpa4sdBt9fJmQQ6s7mIHPBUOelJOYBHqUoioM6SK8pRMVon/Mo15ERXbab5H6HiyX6VQBxeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzJf6thx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzJf6thx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC93C4CEEE;
	Fri,  6 Jun 2025 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240653;
	bh=+GDJ0Nu5QE5EUDCUWsES7cpX0Hil+V6LCVDl8RsoSmg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dzJf6thxyNPeMnQoUI8w8YzFW9+1KeN0R6p+A93bb7tGwin38pJNGhe1eeL1vv8Lj
	 U/LpVkYNtYJF5aV4yZ2W4QHB3fKOHFYZFcet/MlCCv4y0+MxsQEXMqQqUR+Jp0noO8
	 e5FWqwh8CpkURxcc8sJkUMYK6/3D1bZyxfP95aQ/awQcaTpJgjQXuaLVvGUa31cEqu
	 OAnNOQrnegO/QOMHfJGenWUwuw9thj3WGCtdKatClIe4FxYczy3XdCktvFyCScc4JS
	 76RPM/sXwbQQcAe65a3ZHHCifUE/A1KQEhp4pe/DjPlfWlrxleDqw2+Oab1vNTqoZ5
	 bGesadcbul2Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3654F39F1DF9;
	Fri,  6 Jun 2025 20:11:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
References: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-06-06
X-PR-Tracked-Commit-Id: 04c8970771b4f1f39bb8453a2eeb188c4d5edbd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e332935a540eb76dd656663ca908eb0544d96757
Message-Id: <174924068506.3964077.8177096844390618389.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:25 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 16:04:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-06-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e332935a540eb76dd656663ca908eb0544d96757

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
