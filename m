Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943622DFB2;
	Mon,  7 Apr 2025 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068960; cv=none; b=bkSszsd0oyVg0Bj89WNpMgMhK4qLG1Zg2aowgWfTUHA2Or6wLrC0rHOanTmefTYrsVG7lepPZUAhrkAj9SL+F2xZrz4HVmwJGykICj3zVjVWcw7vIIXoIyrt5vX1cRu4p03bYWp7TXLuHF4jWi4SySrYbiNREsoPhurd8pmAAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068960; c=relaxed/simple;
	bh=KTkq0uc9IoFczHum25qEcd7t6ypEzG4uxvrPNhRaJys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k5HWjBJxTQUJiwUt9ZMrmsDAV4nzf6UFC9mAmZAB2PQHpiXlzpJKIBc6Zl1m0xc/biqLqHjKEKTiTj1QoGE936ZLYXuT6KazW0DhD7uRolVloOaxUa+bQfQaCoHVExr0NHrTXRvCqIvFD6D5msyplie3R+roEP4w5VMwlAIlyfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncJ/Iujc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncJ/Iujc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5C3C4CEEC;
	Mon,  7 Apr 2025 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068959;
	bh=KTkq0uc9IoFczHum25qEcd7t6ypEzG4uxvrPNhRaJys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ncJ/Iujc95Byyj4VPsC5KTRqQ3fiaULNUMQK/Okz+6J5OPl46oEqOOgke1TcPHJuf
	 bJQU8si5JZWQPJ7toFZe2RJ2jYcUL2goSCKfoH/fVA8/R6r9Jh9VXXG4k2sajERKpt
	 JDvgpcreeFj9TYCAQ6kYzh60Uv3RF5Un2bhw2Ym+KcLxCwqw9qLUwJtEALFgZMXO9B
	 6kHt9G80rOu+tAQOGyt3/38DCHpgop6GSYkAlXSpbAy9wGFG5NVsg5OOOoECpH5Hhp
	 0a3879DaiHeXkaBBSlDpKlAfFH3pt2w7lonPOFo54pf8BY2o2OTeka6rS7ThCpQevz
	 sOFecCubttc9w==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250405125808.302259-1-thorsten.blum@linux.dev>
References: <20250405125808.302259-1-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: codecs: rt5677: Use secs_to_jiffies() instead of
 msecs_to_jiffies()
Message-Id: <174406895824.1337819.13371783286316955668.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 05 Apr 2025 14:58:08 +0200, Thorsten Blum wrote:
> Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
> 'delay' to milliseconds.
> 
> Since 'delay' isn't a compile-time constant, secs_to_jiffies() expands
> to much simpler code compared to msecs_to_jiffies(), reducing the size
> of 'snd-soc-rt5677-spi.ko' by 472 bytes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt5677: Use secs_to_jiffies() instead of msecs_to_jiffies()
      commit: 7afa96026f0a1d81b7e9cc8f1811cae4b80d4d94

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

