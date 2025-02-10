Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25162580D5;
	Mon, 10 Feb 2025 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204999; cv=none; b=hnG9foizWb4uMYMHlVil1zKtV/eZphPpK7GrHso7egudpTH2Sb91Gp88gEO8yYsvoZuC49FUZNS9Szyzhbd50TPhIzuscFph63RQX0Olmmp5sb3H9wP4wCCNE9lVxYdpM/4obSDaiKouuaGUe54FsXFjOc0mSt3bFqkobkUtcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204999; c=relaxed/simple;
	bh=aJQ3wPuA97X/MqiECnTmoH6E+G59Gv0FFvSfYA7GYUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HS0oZg2dLJfHGoa4ObGPakpCUp8WVh9G+wSVzeFAiYvwuZkIt2ed5z1gQvqDew4rhiyD3ywrZRxSEcgKZ/e/5Uof2riikaTCtjyygdFbwFZGHhskWT4k9paylcVNS0sfdWwDghNh61CBpB9cp5LsWrZitH5YAZzxO/UKAHKnYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epJTwner; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epJTwner"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C565C4CEE5;
	Mon, 10 Feb 2025 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204999;
	bh=aJQ3wPuA97X/MqiECnTmoH6E+G59Gv0FFvSfYA7GYUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=epJTwnerpEUsWPGtCbgfAIs2JSjt+ev5r7YF3KffuZvxOKzrElMELgu8JLUW7eKWU
	 GH7U3qG3lnWBDO5CB57RO1EDbbsU79K1GrxswEnHLomwGIjBj6m6mnNi1Yc2DYMRpg
	 IeSOgj5SE9rQrY+YK8RD3Df92skDVEdWs7iRtZmGKh1IM/vzyCp7GZqp2swrtDscbw
	 kNipadcXyeuKW2OrRbVSI9jyRWh1KDbCTvCpzJyYDfhKZjeTHX2Py6aUWRcSjTICoP
	 vC45tvoasfT9K77B8S6ttPpxbhn8v4wPUlV8gQD0qkdRzLNzqEvrXfx/5FVafhHXch
	 z7JKbQ0goyuHA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
Message-Id: <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:29:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 20 Jan 2025 15:31:07 +0530, Vijendar Mukunda wrote:
> This patch series includes below changes
> 	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
> 	SoundWire IO and ACP PDM controller combination.
> 	- Add common driver modules for ACP7.0 and ACP7.1 platforms
> 	(acp pci driver, Soundwire dma driver, pdm platform driver).
> 	- Add SoundWire generic machine driver changes for legacy stack
> 	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
> 	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: amd: add register header file for ACP7.0 platform
        (no commit info)
[02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
        (no commit info)
[03/23] ASoC: amd: acp70: add acp init and de-init functions
        (no commit info)
[04/23] ASoC: amd: acp70: add logic for scanning acp child devices
        (no commit info)
[05/23] ASoC: amd: acp70: create platform devices for acp child nodes
        (no commit info)
[06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
        (no commit info)
[07/23] ASoC: amd: acp70: add acp pdm platform driver
        (no commit info)
[08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
        (no commit info)
[09/23] ASoC: amd: acp70: add acp soundwire dma driver
        (no commit info)
[10/23] ASoC: amd: update ACP7.0 KConfig option description
        (no commit info)
[11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
        (no commit info)
[12/23] ASoC: amd: acp70: add acp ip interrupt handler
        (no commit info)
[13/23] ASoC: amd: acp70: add acp pdm driver pm ops
        (no commit info)
[14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
        (no commit info)
[15/23] ASoC: amd: acp70: add acp driver pm ops support
        (no commit info)
[16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
        (no commit info)
[17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
        (no commit info)
[18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
        (no commit info)
[19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
        (no commit info)
[20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
        (no commit info)
[21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
        commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
[22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
        commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
[23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
        commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee

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

