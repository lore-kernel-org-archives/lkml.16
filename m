Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD7275873;
	Thu,  8 May 2025 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715144; cv=none; b=IVdtUd803JJF8B2DBgqX123JNq4n+lB0bw0x+07BzcCoX7noyDEJyKo2z6p4s3KHLemHXiruReSncK3u4ZCchQJQexL2yFnej8gNJTjT7amHG7/9i9NJfvgAeFZElJXH/enoFs6m7bwuDfBqRI3wS+a6dcbXWAenhupxIt4swt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715144; c=relaxed/simple;
	bh=fAsk8LB0xqCO9tGcY4ShnRjZ0RH8OtKy42FSrNFZLkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CDmGS1XeYW5hskZ+fkKNSc7zpsKyLw51pdjoMW3k2rSnWtgHaOLkSeu9OaozYrUSKwf/DyJELWersFjJdrEJb7hZB54kZpQIZRWCN4bQXKQkzq8yazhfEpPai0zQLiX5V4fxXaqtxHw4PpMEOemM204YFlaZImogr7FxTarCtMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+jUagS5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+jUagS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533B2C4CEED;
	Thu,  8 May 2025 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715144;
	bh=fAsk8LB0xqCO9tGcY4ShnRjZ0RH8OtKy42FSrNFZLkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=m+jUagS5MH6qWfXiT1UwVM13wkewdoJVfeW/qGI9Bl9kAHX58I0fHzpuPJaH2ovdd
	 YkF+dtKettEllMaNOdtVdpioCKBWvA9T9RGPLsJNCF8f5oRxalcQ6e+WEyDGuBPQdL
	 ArPQYBXRPz1j+UnIi8+luHF/homTUvJTuO2T18FslZME5/l5kiqU/sKwQ701eG8BDA
	 jI58Ecj2Pb9p/qI0kof01v8Q+jUPuavLZ9kOxDAG2qPw2rmuiD93RowPWpZb5/83WF
	 jZUqScH09PTOen6FqJzCMTOFcjvpd87ciVDi65UvRL6ap43XMMs5Ton0EZSqITzu54
	 fI/0ThjwrqSgA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 christophe.jaillet@wanadoo.fr
In-Reply-To: <20250508084527.316380-1-colin.i.king@gmail.com>
References: <20250508084527.316380-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][V2][next] ASoC: rt712-sdca: remove redundant else path
 of if statement
Message-Id: <174671514156.7345.16339489109303663127.b4-ty@kernel.org>
Date: Thu, 08 May 2025 23:39:01 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 08 May 2025 09:45:27 +0100, Colin Ian King wrote:
> There is an if/else check where the else part is executed if
> adc_vol_flag is true, this else path checks if adc_vol_flag
> is true (which is a redundant second check) and the if path is
> always taken. Remove the redundant check and remove the else
> path since that can never occur.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: remove redundant else path of if statement
      commit: 8147e75bd5f0977f6d389f6cdb4f10956cc3d88f

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

