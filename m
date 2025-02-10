Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970291F4601;
	Mon, 10 Feb 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205010; cv=none; b=mD0XKTPbDSk7/E8YLr9bsIa1bu+Gird//qYjPVjqJtppOk8mD2yi4SWCHe5ppg7IHT88rgzQCRefkPB4eB4MB7Ei8XIdzttyXK2jeT7/bhX/WkgOZOzhBVi5W4CWTUqNWOcFZpncbmknwWUhIKko84k3Cw0RU+nzkt/Nh3lqxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205010; c=relaxed/simple;
	bh=vxbaXpNi0Rlbv5xiUxgUrErzeRA1WuHdZBaX791dnaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kfqo9LEXSAPUeIcVwEzDJ7jCHyBcV3Pf4+lTtiuuDRvaTY3kc+KiRD0Tj9E+OhgFlK171LQ4WyayCeOFQoC74Aa3zotApZ08kTsoyC1T2rvRXnV+EVWGn8KSah9uJm8o/2JhP2yh2+zZS3JCcAUmvZwOa3hc49uqhINSYh5tE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2a2CX90; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2a2CX90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B959C4CEE5;
	Mon, 10 Feb 2025 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205009;
	bh=vxbaXpNi0Rlbv5xiUxgUrErzeRA1WuHdZBaX791dnaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R2a2CX90esB4UW0/ykYzJL7n5qfcK/nSLsK0Gx5tGVsOK3LfsCySuoX0RegB8rY13
	 TG7b7FwyR+3PK1IMlkw+e2Q1aZiIwegtahZIxINNjYIn23bmcFFvmEtxJ6E6Zun3Uh
	 J8ikjyOeGMqwSqq0lW/39RsrvWamiR7qbBukHiK7kRhylAl3KH784ClDEZa6/hmSbu
	 NA/9UxhCzjfVQtKj1RrJ8+yqZAEZXdY+QXtNg59MllVZ1uM7/mjDF9rXZi75yPXymA
	 uZVL6sPlYu/+11JvaLxgDdjaA6VpLdoceCfCGkDznDls7cn4miAjgkND/VVW4h/Q4L
	 g7WKN7v21sxgg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V3 00/25] ASoC: amd: Add support for ACP7.0 & ACP7.1
 platforms
Message-Id: <173920500520.65690.5365981028345549480.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:30:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 07 Feb 2025 11:57:54 +0530, Vijendar Mukunda wrote:
> This patch series includes the below changes
> 	- Refactor existing ACP6.3 platform ACP PCI driver, SoundWire
> 	  DMA driver code.
> 	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
> 	SoundWire IO and ACP PDM controller combination.
> 	- Add SoundWire generic machine driver changes for legacy stack
> 	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
> 	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/25] ASoC: amd: ps: rename structure names, variable and other macros
        commit: e2ceac2f323625632f12dd5333092976298a0cde
[02/25] ASoC: amd: ps: use macro for ACP6.3 pci revision id
        commit: 4b36a47e2d989b98953dbfb1e97da0f0169f5086
[03/25] ASoC: amd: ps: add acp pci driver hw_ops for acp6.3 platform
        commit: db746fff89a14419379226ce0df8b94f472cf38c
[04/25] ASoC: amd: ps: add callback functions for acp pci driver pm ops
        commit: 491628388005a26c02d6827e649284357daec213
[05/25] ASoC: amd: ps: add callback to read acp pin configuration
        commit: 6547577e94ae3d9f8ff30d3267fe7ec394e3b20d
[06/25] ASoC: amd: ps: add soundwire dma irq thread callback
        commit: 0a27b2d7a224326fab543ca586d501fe1857b655
[07/25] ASoC: amd: ps: refactor soundwire dma interrupt handling
        commit: 4516be370ced14c4fb454fd6cc016e47bffe109e
[08/25] ASoC: amd: ps: store acp revision id in SoundWire dma driver private data
        commit: fcb754602724fa2a1d0db72f13ddc3ef0306f911
[09/25] ASoC: amd: ps: refactor soundwire dma driver code
        commit: 0fa0843db17ccd427fc7a23d313aafa88fc89e04
[10/25] ASoC: amd: ps: refactor soundwire dma interrupts enable/disable sequence
        commit: 43d6140cedad9f031b47dfde6f85856e007b3f04
[11/25] ASoC: amd: ps: rename acp_restore_sdw_dma_config() function
        commit: 605aab3b3ca83f58681841b2dd16d4a7baefde6c
[12/25] ASoC: amd: ps: add pci driver hw_ops for ACP7.0 & ACP7.1 variants
        commit: 7c0ea26c57b0bb72d503fe27d6533f5addc5e3a3
[13/25] ASoC: amd: ps: add pm ops related hw_ops for ACP7.0 & ACP7.1 platforms
        commit: fde277dbcf53be685d0b9976d636366c80a74da8
[14/25] ASoC: amd: ps: add ACP7.0 & ACP7.1 specific soundwire dma driver changes
        commit: c878d5c1a525b88807d9d79888fe8340bcbf1aa3
[15/25] ASoC: amd: ps: implement function to restore dma config for ACP7.0 platform
        commit: 1c35755f46423150e19ff57448786b4bb48fdb46
[16/25] ASoC: amd: ps: add soundwire dma interrupts handling for ACP7.0 platform
        commit: 0b6914a0121b4c9fc8f575b60a5dd43b74612908
[17/25] ASoC: amd: ps: add soundwire wake interrupt handling
        commit: 3898b189079c85735f57759b0d407518c01c745e
[18/25] ASoC: amd: ps: update module description
        commit: 0eb8f83c055cb3461734710d1b1ce2dd4f01806e
[19/25] ASoC: amd: ps: update file description and copyright year
        commit: f1e91acacf86fb2cd7478af490326cb9aa63e8ae
[20/25] ASoC: amd: update Pink Sardine platform Kconfig description
        commit: 552f66c40134542f15d4302837e7d581a0b8e217
[21/25] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
        commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
[22/25] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
        commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
[23/25] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
        commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee
[24/25] ASoC: amd: acp: amd-acp70-acpi-match: Add RT1320 & RT722 combination soundwire machine
        commit: 31e3100d5e1fe69f944f84867be0cbfa5fd380c8
[25/25] ASoC: amd: amd_sdw: Add quirks for Dell SKU's
        commit: 4bb5b6f13fd83b32c8a93fbd399e7558415d1ce0

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

