Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A34281516;
	Tue, 22 Apr 2025 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327578; cv=none; b=BEcq+W0zCIFGWElfPdg640Ud6WZ3axWfzy+oKUMxHk3/jIJwt7+UyVCLSTCGhiUN1ZTNqoL6o6DxW4dwAN6at/2rpg5Q9+kIpAD2wGpUC9MVJqVSL5GoJ43NTidwyTkvTUL1Z3R742O6cSOzO2jgNswoF4N4yKWqtbBx2gkR/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327578; c=relaxed/simple;
	bh=M2b/98XJIE0KwMkHH1jJWTFXHpzVJGdrwuvHvzByUQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CDG286NcdbN3F1SxcQZRx0U6a/Z20kJjsmP4YfuF8PMtWUQqU8JNJOs3Hsmw48E/OtTKQV2rv6mmv/muOJ+PHEKRwOTxmYufQjI/mERZI9iq+cTKjJ5MvBE2q0TCYUHHd8KUtyiQg+isvjlpfCvF7JFYz6jwFypnvmUfm1ADyGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpoz6q70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpoz6q70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6501C4CEE9;
	Tue, 22 Apr 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327578;
	bh=M2b/98XJIE0KwMkHH1jJWTFXHpzVJGdrwuvHvzByUQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kpoz6q70MrwxFcMed6BpL7E4YyL86sWKc4mf8WbOg52Ar1SXEFRen8XgfuSjXaxkw
	 ll4vaJPegHVSwB5HCg0h5OBP1BrwpLAMm/AJnJkbAHsyQJbA3bQhJqvPaBGOxpAt1/
	 bFXkh5uFqBQWT0Fs0Jv3Fw4G/81KyHI38mjOF4T21B92BJPu1upVMo1XdiMvSpqRIN
	 cZfYuciiOAnnb1TBmp3togtYtvLUvCMLV9eOw3gXgx75w5q4aah1XMHZNHQqyB33mN
	 9EuUZ1nBLUqra6RSG6tLnZ5lsc3qsDByduJoW7AY6wzMAEiCA0G98layxCjnHVEHsJ
	 /qpKrDo91GS+A==
From: Mark Brown <broonie@kernel.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250420232733.182802-1-linux@treblig.org>
References: <20250420232733.182802-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: codecs: Remove unused rt566[58]_sel_asrc_clk_src
Message-Id: <174532757641.44137.2335903918864536323.b4-ty@kernel.org>
Date: Tue, 22 Apr 2025 14:12:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 21 Apr 2025 00:27:33 +0100, linux@treblig.org wrote:
> rt5665_sel_asrc_clk_src() was added in 2016 by
> commit 33ada14a26c8 ("ASoC: add rt5665 codec driver")
> 
> rt5668_sel_asrc_clk_src() was added in 2018 by
> commit d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
> 
> Neither have been used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Remove unused rt566[58]_sel_asrc_clk_src
      commit: f506d45666828d3e94bb08e3d98dd9368c509345

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

