Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6021FF31
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237196; cv=none; b=EWelSQpPInj29rGU0Yo5mfJFOi4uYCOWChSVy+ENwWHSMh7CZJic+rxW3GDpt3HTx5sXQ5thbbO6UZwhRuv20EOV2ZAUczCBu5Ydv98TFAc7VsMQGjWNIVafAbkS/DWYvtpDjNtkTaANKiAoAkwTj2xWKwVLzlJv7iTSGs2ywlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237196; c=relaxed/simple;
	bh=XS01oqWI7MSKtVOwYi0RK+ZB6YU61HJHwn6jt2+5Eqo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nQIk7ct2sFYl7Kaw6FttZsnynAgebBwVczRP7utDe0CKVVRviZ//XzOdvlrSCk7kUq54oNGmSMYfvB5uq13Xh+r9ua9yJ5bk1H+RG5jh7kzq4XsnUAPgywhWmUrqV/nQ3KzXR32LyP3QEGgePPbVG3JLKi4kISlvApm9ogeDFnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFdj8DHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFdj8DHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2844C4CEE9;
	Wed, 14 May 2025 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237194;
	bh=XS01oqWI7MSKtVOwYi0RK+ZB6YU61HJHwn6jt2+5Eqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QFdj8DHABoRT7DQVWCEvQiWbQ+JZww14VKuXAugxR68XskrByFo4/5tqAdcWtbrbc
	 KiMY3zNVB9YflpFTw6Lgo2mfTIJRP2hngDq9sRtkeGRn/6Efl5jwWpSmHVM3PKwpnn
	 1VgNJb0/e8WAAvshNhuP7wQhVUhypnfFKMXTl1nij1dEBm9mrQnJyUlHUNJE2Lv0kX
	 T4V7yGet93/gbmFYkrxUn+M0+LAvYRcen1R5pQPVVpTIQPdfOytZBN1BmjLvM8EkyI
	 XGu9yC59R8d6pPo5GhCBekFDlSZDmltMbGMFVZ56iJk/t3nKYTX6Eai4qoBBORrEQD
	 5+ti4SkkbaeGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711AD380AA66;
	Wed, 14 May 2025 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bits hexademical number in fault
 injection doc
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <174723723226.2412407.3443427617975733647.git-patchwork-notify@kernel.org>
Date: Wed, 14 May 2025 15:40:32 +0000
References: <20250512115514.2641059-1-chao@kernel.org>
In-Reply-To: <20250512115514.2641059-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 May 2025 19:55:14 +0800 you wrote:
> FAULT_KMALLOC                    0x000000001
> 
> There is one redundant '0' in 32-bits hexademical number of fault type,
> remove it.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix 32-bits hexademical number in fault injection doc
    https://git.kernel.org/jaegeuk/f2fs/c/13be8795761b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


