Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D90915B54A;
	Thu,  6 Feb 2025 17:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863018; cv=none; b=DcK7CX5vvotzakzgDtyHOG1Y7Dr4pAbt1/88oLG9cGlgXM7oGLoE3GPKQ/qiIMf9hRfMFS+1D0AHeJOXvx4qQG9gD8Ifmac2BCPrgyx5lR+GhrsPiH9xevKvhTnXp728U0B7igVp1QmKfwMfSiqbk0VRN+H7kyrn9T2HqPPicVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863018; c=relaxed/simple;
	bh=fhaJk1sIOdwzSqsp6HlPozVr3tyh/ttyP4dTEz5l3KQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TXJOMMMgXroOM2cqW15bnE3ie0S/6FG0G/wWFP5JBBg72vF3NdnAGU2fzVxgZYOI12BI2zR//80NsmEUqjlUTZQ/6fu3SU2eLxRUIeJteVmwG05suvEaYac0b9pEKafuikgC8O6aM+YqZD8H3DXpiX0piJrY1sbz3a2+tmzLuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKt0yn9T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKt0yn9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128D2C4CEDD;
	Thu,  6 Feb 2025 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863015;
	bh=fhaJk1sIOdwzSqsp6HlPozVr3tyh/ttyP4dTEz5l3KQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BKt0yn9T/xT6FU78FtJljVzUaR3YqTHzk6hFBLFkZD5xnYh/l7YpWikkLtQXNW1Hh
	 PpbVHt56MGSwgZHNPP3XCim6N05QZCa2j06z6QDBhc3PWqZ2ENG4N8jSJcz+A3bEx8
	 87pMx0eEB6oshi+rM41UurjrX4/X6TeL70MWsPSetXBVBFuslG5PgEXqQHjS0ErzjL
	 bUBCH9fe/fCN4GmyoUJ5dU+stbluFYwiHK1nM/JC/D2AXBqG3QUzdeHlrMjpImjB0D
	 eABQPehjBvRvuqNWNnQaX0olAtzhbfJ6nqSOx6JCNh27Ek981/08Tiou8yHM+r8fec
	 p0r/msH0ZrWhQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250204153333.3045-3-thorsten.blum@linux.dev>
References: <20250204153333.3045-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: amd: acp: Use str_low_high() helper function
Message-Id: <173886301370.325569.17989854749792559122.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 04 Feb 2025 16:33:32 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_low_high() helper function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Use str_low_high() helper function
      commit: b3d993c7566fed1c027c5c18f3ef482ba8e6307a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

