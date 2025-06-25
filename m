Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A12D6624;
	Wed, 25 Jun 2025 17:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873195; cv=none; b=Z9nGToI717w15ZA1DHGNk0ak7fXNldh81nMe0zXL13LdaOunvdYzCRYbGws/4+rueWMeN/chvs1b4aHvS88xWQ3DRL+FbdhkuJWDyNzOUBm2DdVgiOuQAcKtPU7pAlmlZuqC91fmQtjZ7eahlUG0NaVUDuI+0PJGMtaPNA48wKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873195; c=relaxed/simple;
	bh=ExdVo+xqNNHCrzpD1GLmq96PFFu7gyIf98fc4flcU+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZXdkBA5NoTcJDpUvFsoY7iAVV4VeCPw5FQJtW5y6XSQQ8vNGNp0S5VKTA5Wl+T0/WhYcKplfAJLh4M4zEJT5iZgkKejw78V5MIUhNYAhTDqZYW8najQcG9LyVpaif52lRDwyOA2g19cfqRqofX84CcF6AJQRqVyPHIOG3JtoPqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCq2UUXm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCq2UUXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1FBC4CEEE;
	Wed, 25 Jun 2025 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873194;
	bh=ExdVo+xqNNHCrzpD1GLmq96PFFu7gyIf98fc4flcU+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HCq2UUXmnpJnMHOp1LKjbUbMqcUjFgHFhgjCtrtXmiqEa3Tu7sLNtf0c/LOaacRZu
	 LcKlDFNNKyM9kbtofh5TiHAb2GdfMZ1FeKqaUVCFjV/0PzQpkwfyGZDPHYE1cNBfFy
	 8Yb5bi6gsNyEN3iU0Kui9N6y6FTvQqxOEyFx4IIqbhtox2BX2ozbj574tJuBa100lT
	 28ZYUz1bz9Aoj18kSMGkKgb78QoNOrEkUTqKxl/YGNHRZFKILpv8h13FdKrQf+JJYK
	 6RVFu2C4HzcBw05TXyY3Gc/abUBDD6tjJoDwVL/2lveyJR+2Lm0uY41cMu60Ete9Ui
	 ycYADo8bFTeQQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 mario.limonciello@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
In-Reply-To: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
References: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/2] Add SoundWire machines for ACP7.0/ACP7.1 sof stack
Message-Id: <175087319206.198995.12597800532047615959.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 18:39:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 20 Jun 2025 17:38:41 +0530, Vijendar Mukunda wrote:
> Add SoundWire machines as alternate machines for ACP7.0 & ACP7.1
> platforms with the below machine configuration.
> Link 0: RT722 codec with three endpoints: Headset, Speaker, and DMIC.
> 
> Vijendar Mukunda (2):
>   ASoC: amd: acp: add soundwire machine for ACP7.0 and ACP7.1 sof stack
>   ASoC: SOF: amd: add alternate machines for ACP7.0 and ACP7.1 platforms
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: add soundwire machine for ACP7.0 and ACP7.1 sof stack
      commit: 8b04b766714e93ca5a8021ff3408c9ef89d9eb85
[2/2] ASoC: SOF: amd: add alternate machines for ACP7.0 and ACP7.1 platforms
      commit: 59566923d955b69bfb1e1163f07dff437dde8c9c

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

