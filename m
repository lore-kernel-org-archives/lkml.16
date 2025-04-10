Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BE1FE45A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258205; cv=none; b=J9HETO+iYutHDOd4QfREidqLlJFKiWpm6lN7MXqmWzpsDWOZqAMZUa/8dW8cQbmFdWnhwkEWncrOzhZkY6g2qt2WlFd0I2dvef3o/pRKjrI/Sxe+RleaMkcAySxZgJ9r2PzPTJHy4QtDTlFX67faCdORNCpxu31VmRFdH/ICYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258205; c=relaxed/simple;
	bh=QiD5P4HIEFdEOWQbswZze8511DS0Gq0+nwdZBm2CxBw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Vu26BnCaaEseBnoBV7jruMdX68+h2iROd3SO3kYyPVt54dp68YGTdF/ziPYgnNtdm6d3jph1DZrjT0dZfHpuNhou+c6ne66gkTrqW9aPF7XSv8ECDgxregYe2Ji0kToPtfX9Saoe5eEOtPeWnx7XlFXDnNpkai5JILlhi9ntLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwZVT9ju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwZVT9ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76393C4CEDD;
	Thu, 10 Apr 2025 04:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744258204;
	bh=QiD5P4HIEFdEOWQbswZze8511DS0Gq0+nwdZBm2CxBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nwZVT9juCsOi6/s26O+7Z47BmCQeV5KnULgd5h9sUOP7ssUzOSbRAtaAMGBeGZ7lS
	 Q322aUXiDhTPW5r4I95WVN2Dt7kqb+VnU12riNMbGOL7Y+U21pheclUbX/H/K5p+kw
	 aOD7kpvHuNtCGO147/eHZuyvO2qK2TkimZ9TwLyf9qiQNgTKjvPkmF9N8FbDMMqCXH
	 pAmnopYIa2D4J6jf3COr5Sx/M2XoXzksRfs+ZnK3vFmG6G2yxA9Ky38Cqys/zRhx9z
	 l61YyFAHagSb9KHCE24TSJu92tYK3/ZF1hDQ62j+9ZhFUmeobWyT6W+IKqN39BRaoO
	 B3Y2VZziw3Nkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B5A380CEF9;
	Thu, 10 Apr 2025 04:10:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174425824176.3146257.18250969661492747760.git-patchwork-notify@kernel.org>
Date: Thu, 10 Apr 2025 04:10:41 +0000
References: <20250325080646.3291947-1-chao@kernel.org>
In-Reply-To: <20250325080646.3291947-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 25 Mar 2025 16:06:45 +0800 you wrote:
> A zoned device can has both conventional zones and sequential zones,
> so we should not treat first segment of zoned device as first_zoned_segno,
> instead, we need to check zone type for each zone during traversing zoned
> device to find first_zoned_segno.
> 
> Otherwise, for below case, first_zoned_segno will be 0, which could be
> wrong.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: zone: fix to calculate first_zoned_segno correctly
    (no matching commit)
  - [f2fs-dev,v2,2/2] f2fs: zone: fix to avoid inconsistence in between SIT and SSA
    https://git.kernel.org/jaegeuk/f2fs/c/773704c1ef96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


