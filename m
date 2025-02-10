Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6402566CF;
	Mon, 10 Feb 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205014; cv=none; b=KKsBkyHNse3k1UE6dVy/4XYvfKnosfbd45BYcOdtZMNbfP3hD0f4vi11jWzdQC5dcj7P7EOFss7gCHLPfBGVKfmROR+HhMoxBAnatQC1R2f+MWrHYAGlaihDS5KEGyxRxB4NfoyT01OdQJvI3xGRX6Yf9MXDxcrVfFVcb429tmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205014; c=relaxed/simple;
	bh=w3gR9epEbOdPpKG/CDJNKHP0beU3qDBPxouIS8mtKZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q+ib5xP3t/L987PFyNJfxrskD4+UVvl8iRLv+R6gEWEB47PrDAgaKGtmNs4yJGCq4zpQ9YEsUZyTLUyPSqc4g0ngxNSOfSOr1lowv9El/H+7lFug9D7nb4o4GVPKBb24CghabsZyjOdGBBnXsuTUV90ktZ1mFn3EGNl/xTznJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqKSl95G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqKSl95G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1376C4CEDF;
	Mon, 10 Feb 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205013;
	bh=w3gR9epEbOdPpKG/CDJNKHP0beU3qDBPxouIS8mtKZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LqKSl95GRPy6N/20X5byFmLubTMu09oEqvOA8ky7uHPT7jW1RTArd+iJ11Ei0YWW3
	 0776rL8k8NmuM4XS1CZsytL2gXZ+TcVA231AqCrJUyRemvVXWbiklAYB9NpDDF9bHR
	 o3OcH/4YcFQEsYjdiVDU32hEpwaUoCp4q08vL/HEBExX6mEKWjdsx3R1qm1DRg7XRC
	 z+juolEkS5SfiWchoFHVGLJnu+NHYtZeafdq+NjzIIl7mnhFpzvOSIbdEXWLx022V/
	 ixOb/bwBRenGshYV+EffGYPPhSNvYJ3VVVF+Qs3sZlrsMDgzuiRTm+f0FcYcr+mHcG
	 dWJ9ClKAwpdvg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
References: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 00/10] Add SDCA DisCo parsing support
Message-Id: <173920501139.65690.16953311812837303876.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:30:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 11:37:51 +0000, Charles Keepax wrote:
> The MIPI SoundWire Device Class for Audio (SDCA) specification defines
> most details of the hardware in ACPI using the MIPI Discovery and
> Configuration (DisCo) specification. This patch chain adds support for
> parsing most of this information into the kernel such that future work
> can make use of it to construct CODEC devices and soundcards.
> 
> The most notable outstanding work here, is parsing the separate
> properties for the Control Numbers (roughly equivalent to channels)
> within an individual Control. The separate Control Numbers are
> supported but currently only the scheme were a single default etc. is
> supplied for all.  This should not be super hard to add in the future
> but isn't currently required by any of the hardware I am working to
> support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SDCA: Minor formatting and naming tweaks
        commit: 629dd55cf77bd3a8f80049150d3c05fef6d3b468
[02/10] ASoC: SDCA: Add code to parse Function information
        commit: 996bf834d0b61cb5a1389356c1ed7db1230139d7
[03/10] ASoC: SDCA: Parse initialization write table
        commit: 19f6748abbab8523a7b32a5e371e39d4d8d4aba5
[04/10] ASoC: SDCA: Add support for Entity 0
        commit: 9ee6d50ae4b0fe14ed70a5265a05874d41e10848
[05/10] ASoC: SDCA: Add SDCA Control parsing
        commit: 42b144cb6a2d87385fa0b124c975d6cf1e3ec630
[06/10] ASoC: SDCA: Add parsing for Control range structures
        commit: 64fb5af1d1bbcf1b808e9bb092b22fa1b691ae63
[07/10] ASoC: SDCA: Add Channel Cluster parsing
        commit: f87c2a275033120e15213f3d65234d98e726c4b7
[08/10] ASoC: SDCA: Add support for IT/OT Entity properties
        commit: 5c93b20f6de4478e1fbcfb38eb46738bca74180e
[09/10] ASoC: SDCA: Add support for clock Entity properties
        commit: e80b8e5c53c30df1cba45258d10b04872b7eea67
[10/10] ASoC: SDCA: Add support for PDE Entity properties
        commit: 9da195880f167ab7c2d595388decf783c9920121

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

