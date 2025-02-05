Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685222F17F;
	Wed,  5 Feb 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759475; cv=none; b=nzj0QtMq1K7AGmzkHGt13hlceORD1o9rqw9p/qRyTP07ljswFwPBzrj06rWZ+poV3Eyoh1d9Y/O6cIhlF3G+d/CXF815PU2p5n2nIMXzfHgewGJbM+dFJxZSnZgvgH+XYYZoKNQdXzk/3/uyJBZ8Ub+4e9JZ22jD4qk2TIH353Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759475; c=relaxed/simple;
	bh=BKicQvUmuXjDNbRZxUNlJ8r+EcHKaqqCQZUX4SaRzuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XPrzi2J92PhwEJ8s5UJMJI/6aa7zuYgQcd6rRDsB6s5b3Y7fIbgwdAexAJGQJphCA0uLxZO12bMULNXL/m++hKONuMTfEX3dDdvibDCh84dzGaaw+61IUz/6CYA7mKIkpJqK4hSfE4wCzSDVxIN5dmXjFWsCLdeZcaJBK7qrUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjYjSZvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjYjSZvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B4BC4CEE2;
	Wed,  5 Feb 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759475;
	bh=BKicQvUmuXjDNbRZxUNlJ8r+EcHKaqqCQZUX4SaRzuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IjYjSZvwELSQpD5fB7WkqjYVoxJq4rM1/k43Ug4L7RVYc8tveaU3L2TBDc/fdHgaI
	 qnUoeGvd/JwyW+FcHFNFKluby6U/yZP2HSsp/sTT96hMRvdEVcnPdQBBGVAWpE7RWl
	 VH3L02IuUR+P6PXu9O60xRnhSBwuurZ1MJKOEeXbHXk1vB0FQ23e498CuVggoISxWc
	 jUhCuNFw4F1zwCEql9Up5sji8o8iG9WdiwnPItFGlMBr3si2cT+1614uklRtIzzfPL
	 jhbLmnMUaiK5lMnKe8Z8wjnaPOjB9cXYXpsCDWrEcLBQQvDrNjyBGFsikae59SB1BS
	 oSdWN6fJ8roBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux@treblig.org
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250201005021.447726-1-linux@treblig.org>
References: <20250201005021.447726-1-linux@treblig.org>
Subject: Re: [PATCH] ASoC: mediatek: Remove unused mtk_memif_set_rate
Message-Id: <173875947335.32457.7286096499117133517.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:33 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Sat, 01 Feb 2025 00:50:21 +0000, linux@treblig.org wrote:
> mtk_memif_set_rate() has been unused since it was added in the 2019
> commit 9cdf85a19b3a ("ASoC: mediatek: common: add some helpers to control
> mtk_memif")
> 
> Remove it.
> 
> (The _substream version is used, and is left in)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Remove unused mtk_memif_set_rate
      commit: c9e9aa80022c6db71bc097a621a6145f39aa0ade

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

