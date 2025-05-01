Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B825F7B9;
	Thu,  1 May 2025 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081487; cv=none; b=A9Qsot4RCRsPS0SgQZGi68py1rK3Bk0n57VAKZ72UYseb+tBoiueTLn5k9ULTOZF1SswiRSQ+P152d3fN2zD8XawETDQmJ7SkVg42UsSYcwOq9MI37yW1GjBpEPcq0FOBrwlKcHyBpG/4/WI2X9EweY40lo2biLsuJQ0LSvhAYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081487; c=relaxed/simple;
	bh=UAP2AV+qSbFSO/2/N++l3ypruXuDaFFIRSPyTIofkqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S3XoL6EVnfpz23WpLSkiDvFaSski64YUbPVlEuNSmW8L7BG0B8N63/NZZ2T+OIg3/inj2DWtGpzvEyB6W/TYDVSP/lAebMOlWLiq5NyqrsTM+E6hwSF7aPNVeq4fd762T7cYnxYPNiufPFNUN3+NjUvUy1rgZxLb9pHBQobumDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTK9N3wF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTK9N3wF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE5AC4CEE3;
	Thu,  1 May 2025 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746081486;
	bh=UAP2AV+qSbFSO/2/N++l3ypruXuDaFFIRSPyTIofkqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nTK9N3wFBMkhJe08xeOfs0C9EN4ztFCTh7V3x7cbBbR0jT5Wd68xB2EcCgKupe7vj
	 DMnGWRYowzYv7KdRIGvxdPra3V571FpD5SgH8wudI2jmNigkHtleguUE+3hymi62DU
	 ZcE9DY186mYo9CyQGHEOOzs3DiVTx/VTfjCiBQzDjJVPbqICnlWzA+J37d/A9NYhHT
	 lkBQwunLyYBoI+uT+Ge9aPReAx+9quY0zhLB/ZaJCj9Vy1rvPPrsnLU6ZHGuAYNfq0
	 KVL3zmVq2VcijwmMSIIYIOnxBMZOUydXa6wZbr/pHZi9T5mp0RB25OswPcvHuiLF9k
	 I5+ojStYAwv+g==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>
Cc: linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250430165210.321273-1-olivier.moysan@foss.st.com>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH 0/2] ASoC: stm32: sai: fix kernel rate configuration
Message-Id: <174608148419.4032397.674149169345577452.b4-ty@kernel.org>
Date: Thu, 01 May 2025 15:38:04 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 30 Apr 2025 18:52:07 +0200, Olivier Moysan wrote:
> This patchset adds some checks on kernel minimum rate requirements.
> This avoids potential clock rate misconfiguration, when setting the
> kernel frequency on STM32MP2 SoCs.
> 
> Olivier Moysan (2):
>   ASoC: stm32: sai: skip useless iterations on kernel rate loop
>   ASoC: stm32: sai: add a check on minimal kernel frequency
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: sai: skip useless iterations on kernel rate loop
      commit: edea92770a3b6454dc796fc5436a3315bb402181
[2/2] ASoC: stm32: sai: add a check on minimal kernel frequency
      commit: cce34d113e2a592806abcdc02c7f8513775d8b20

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

