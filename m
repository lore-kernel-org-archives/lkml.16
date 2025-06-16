Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305820DD54;
	Mon, 16 Jun 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089049; cv=none; b=MFue+oJgAVj3ZKX5j09cH6gggvUMtrwpN38SljNc4ZLd8R4iRCn+WHVC/1tvOzqP4A+HW7/mGa/tCsquRSSbucvnmd3FL4Y7Le2cV3g4RC7EGAyjfSIOjeoQptXBkQR11K1WusvgLTxl/UiJ+l8VKQ5ATEBc51XYTSbNLPTbSww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089049; c=relaxed/simple;
	bh=ZvyxT+BLHx5DS2IcO1NmOuiRk2nhSfoLDrUKrw0sJe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i/ZmbFraZA63OA40Se9/W10KOcekRRdKv2+U5qLdfbNMPk1P0OWstht73m6qXfrdRxsG0bPuOjoVj9nmfKfr2P3FvE+qug3Klf9V8GaYyCfFYd/BBN90oTCXH0HOkQv3uK2NgZ5cbrDHfd4XQSxIQ9NFyNbbms3og/bY5Hvz5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVqfnmM4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVqfnmM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06D7C4CEED;
	Mon, 16 Jun 2025 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750089048;
	bh=ZvyxT+BLHx5DS2IcO1NmOuiRk2nhSfoLDrUKrw0sJe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jVqfnmM4ALR/uTwNxSGtcmpMOVWFdjt5LUfVJpp7JZYIr0QuNZfLz73BQqbEy1t3S
	 IrlhJI7Xhl3chkELWQyR/m8TizEKWCE2ytTm1Ji9FLDupIZz9hv3ONjur2qAi2yXrh
	 ZgIzoHZAuLCWRoitic7YQaXFz50W/AFd/r3tnR61OLPj69/cv7kAtoutAMdn+Vx18U
	 rqFlMi2Rm9yBPEWzfIlKY9ozQ5V3YrBErnoiM1KXQZ2HyBw7VfiPT28uh8DwLMyj4t
	 +BU7G3N39Z83aF3WLRRgED1QHlNbvZrIhtW5+6wKuOBRgKdARHFfbIaKfS18GnUHLB
	 71ceJxjs5NWsg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
References: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: add core shutdown operation for
 imx8/imx8x
Message-Id: <175008904672.262284.1831269930819653048.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 16:50:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Fri, 13 Jun 2025 15:43:10 -0400, Laurentiu Mihalcea wrote:
> Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while the
> firmware image is being loaded. Because of this, the DSP may change the
> content of the firmware data just after it was loaded, thus leading to the
> data having unexpected values when the DSP is reset (via run()).
> 
> Fix this by implementing the core_shutdown() operation that will put the
> DSP in stall during suspend(). The stall will be removed during the run()
> opertion, thus guaranteeing that the DSP core will not be able to run
> while the firmware image is being loaded.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
      commit: b081d8564e4a396843a78788476fdcbf70efed06

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

