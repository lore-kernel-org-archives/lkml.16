Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBEF22CBEC;
	Wed,  5 Feb 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759468; cv=none; b=dtOBkL8/AC90W5Ult1GvohHgh7y3Brl9Lp8TLwB+dIUdF5qRXcSC05JbuSIegm6x5/ydFZ1POqVq7n9cwhCdrJHDJaqJFiX0C1tOS3cJeDCJkPzT2GK1i9wpx/EltOMC8m+ivnGeGMmxmGr0ORkH76T2agrHG/XBNVkWq/25/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759468; c=relaxed/simple;
	bh=c+a2ooTDUH4jg5oYVZA+uQgTghv5GTN3oNYgRZ2T2Tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JnqylAnSAdvRwXnLb8oz1tsnd96Wqg7ofMlWpoGHdltEniCJKWUs6EzHVGq2FmMdz4xIHsjuKeQPLuPHZot9mSlbgBkMgi3JBz29ErSxGmtxGayTjwmcI9lEatQvW3MKG1QQtdMr/Xvgciot0Ojf2vH//sVcds9f1XjFOn99b00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljdLAke4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljdLAke4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004D1C4CEE2;
	Wed,  5 Feb 2025 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759468;
	bh=c+a2ooTDUH4jg5oYVZA+uQgTghv5GTN3oNYgRZ2T2Tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ljdLAke4edizgDChqqyrMZXFXbzT0CLs6MJlafHGPBFsQ6ehphWDTB0iig76fxxIn
	 0t3BMJOqA5ZmlwMIEuMrl1mPGYHGDufnvCc1cy9WViq84BVrSmJS4pDJKcdEerM99t
	 6DPtZXvbwU6c6letH1DD8dJa45Fhqdo7F7vt8dDo2egmrUj0na2kvqh6+Q0MXdZRk3
	 ortLesCaFPLEmR7a2uPHYj+h+kns5kxo4+mKHqx6XYnYn0ljfdfWK18WDPL7A7NHy0
	 x90U60Wx6ws0JHiFdtRrinmRO/+C+3WzeilditD1UbDh2IXj5iU5GlbkT7yly5+igR
	 /+53Cazawx7Xg==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, oder_chiou@realtek.com, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jack.yu@realtek.com, shumingf@realtek.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
References: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v2 0/6] Expand SoundWire MBQ register map
 support
Message-Id: <173875946575.32457.11587009893936906812.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 15:44:02 +0000, Charles Keepax wrote:
> The current SDCA MBQ (Multi-Byte Quantities) register map only
> supports 16-bit types, add support for more sizes and then update
> the rt722 driver to use the new support. We also add support for
> the deferring feature of MBQs to allow hardware to indicate it is
> not currently ready to service a read/write.
> 
> Afraid I don't have hardware to test the rt722 change so it is
> only build tested, but I thought it good to include a change to
> demonstrate the new features in use.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/6] ASoC: rt722-sdca: Add some missing readable registers
      commit: f9a5c4b6afc79073491acdab7f1e943ee3a19fbb
[6/6] ASoC: rt722-sdca: Make use of new expanded MBQ regmap
      commit: 299ce4beaf714abe76e3ad106f2e745748f693e9

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

