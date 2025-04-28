Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3D18DB29
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880014; cv=none; b=N9DBtde8vEmVs1Rd+Sn2zM+AEka+OYYEG98SGaJr4fK9kELlDdKIOYdH7Rh8G18GmwMhLom3vBaMlyfr6BhMt+VL4QgvjqbB1QwiROe7XkYegHQ0RmxhgkUB6rRdgtgRj5vH27fWDSbFBwpgJHe6BaJ2RyIecFInizmVzECyEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880014; c=relaxed/simple;
	bh=5eS6DGU2Q+bCtF9R1Dk2V/qavNj0iNbuvOWY14ztV8g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rrcfUR0amXyCK5w805vJbs8emESV24axTE3ZnGCgvhDX2BPtiYFJnmLUUWNHtaGh//o6cS2EQGjVZp+rinbFpG5XOEVlD8O/ogbCBPijSV0+S4W/TUVYg7PNlZP3H3pur/r69fxNTpD+8bgBSEzuqeYFTPGy92HxHKKVgE/aqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbCBIElQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbCBIElQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD479C4CEE4;
	Mon, 28 Apr 2025 22:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880013;
	bh=5eS6DGU2Q+bCtF9R1Dk2V/qavNj0iNbuvOWY14ztV8g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tbCBIElQ4XwfCdkAsa0HnDaZaICSy3NqmUwPyyxiYNKPNclSBPu6pOoU+DoaeOgYj
	 JiAp06yF82wR1SxVlvS3N3Npc1GxO2JOMWbx8k7GmB67E8NBxMbY+AtDHnFbTA1Tlh
	 5iod7zHvNZxG9PLMjxm9OQ82cJgjCauJnY/TuBuzSg3OtwIzbGuIZb9j1L/aFpl7uV
	 D9KJ/fdmKg3KyXkzAdKKm9qTNeG27SRbODWwkVE+ThE6qU4sOr9ipAinbPXBu95td4
	 4Q+hoE/vUAhBB+6pCSqnqaQivOuc2p7w2MgiHFMXUfs5ibF555gn2Yu647I8naB7xn
	 8Cj1DOMo6TwMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD673822D43;
	Mon, 28 Apr 2025 22:40:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: sysfs: add encoding_flags entry
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174588005248.1067750.11308178018864136202.git-patchwork-notify@kernel.org>
Date: Mon, 28 Apr 2025 22:40:52 +0000
References: <20250416054805.1416834-1-chao@kernel.org>
In-Reply-To: <20250416054805.1416834-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 16 Apr 2025 13:48:04 +0800 you wrote:
> This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
> it is a read-only entry to show the value of sb.s_encoding_flags, the
> value is hexadecimal.
> 
> ===========================      ==========
> Flag_Name                        Flag_Value
> ===========================      ==========
> SB_ENC_STRICT_MODE_FL            0x00000001
> SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
> ===========================      ==========
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: sysfs: add encoding_flags entry
    https://git.kernel.org/jaegeuk/f2fs/c/0d56663919d2
  - [f2fs-dev,2/2] f2fs: sysfs: export linear_lookup in features directory
    https://git.kernel.org/jaegeuk/f2fs/c/217fc63224a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


