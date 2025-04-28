Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9560C212FBC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880015; cv=none; b=IpJzRpmku4gVYSYkl14FHFQoH17aWtxJVxp327tahkzQFu/JW8WyJE4twc7stzvwm1AD8SR/Bvrgmw8aqycrLU1QD3GYJOxDEm9HuanGZiSBZluuM8MCjNy6uSVBpRqN7xyh70LE66Lo1b6KRrYcZp9z9rseLJGnp4+8pW+H5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880015; c=relaxed/simple;
	bh=v/Su/UmcjapUnnbzXElP2Fk3eCsS37fa0S8AqyfFp+M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZN9urRvqQnhVfZQg2dMqTVIwfDQL+TdJ8PRi0Patnh+PwalXH7yjsaN7tx9jxMlg7uF/xkjLqbNtXsIrcuyaBHq0CPEQywjYRsLoEAzqGr2DfDiM8zCWXhJn8Xl/7BE5Q9OgSYxOef91yNfoT5Ia+QKb9So5cuTcsZo4dx2fIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFqrFQC8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFqrFQC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145C6C4CEE4;
	Mon, 28 Apr 2025 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880015;
	bh=v/Su/UmcjapUnnbzXElP2Fk3eCsS37fa0S8AqyfFp+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rFqrFQC846A/wYL/4c19vZPQvb8fJ89UiUU7+qMORA+188ZDkZvnPOOTJsv5oKyLk
	 HvAuWc0TVqH6fW2OK0nxCdr0YIY+/VuPeubPgLa3RAnYpzQjiP+2rL9N2rp35cpgPg
	 pY3RMMeK7ehfMeqQKQhMplsDVSfU0q9twVSh2vnW+d8W+747yj8RfBEFz/WSToFbJ+
	 HKTkGDv5wtuMcMnpb68f9Ch1x+5YO4PO5Fw7mm3PdyGSQ1nwsjYXf3ER8rgaozOFgc
	 rx3k/rXxZwnp0eE8P+n03++6pCRQEew5XvW1zSQjQQOFAqxRNjEs0TQ3rWM0EKZvSC
	 x9AhNyOIsAUcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A343822D43;
	Mon, 28 Apr 2025 22:40:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005399.1067750.15578791704734066761.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:53 +0000
References: <20250414105237.728522-1-chao@kernel.org>
In-Reply-To: <20250414105237.728522-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 14 Apr 2025 18:52:36 +0800 you wrote:
> Just cleanup, no logic changes.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: clean up w/ fscrypt_is_bounce_page()
    https://git.kernel.org/jaegeuk/f2fs/c/0c708e35cf26
  - [f2fs-dev,2/2] f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
    https://git.kernel.org/jaegeuk/f2fs/c/aa1be8dd6416

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


