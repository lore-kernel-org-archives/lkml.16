Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3070A2C859;
	Mon,  3 Feb 2025 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612671; cv=none; b=b7eZ2bUGLtrs6brBukIs1IZyqJF7wvrv6OGSQRQQP2Jmyl6xeBnm3Sqj6RtoNqYlrGg+gBUeifGsKvulpNXiHC+IveXzZcZaQu62cz3vIFO3+F569dkUGjyBX788paZIBdlSdp7c+F4F8xB4VzDJWCmLrf9ZPpnxW7yxV5dbQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612671; c=relaxed/simple;
	bh=durZiyUzKeQV8I7CDYBd9bdRLrh73k2nsD8U1EuoMNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XPFa7tmfNxy9fr7mwJLuCHdSYCRX3giuK/aXL61TAbpNSHc/9zDNraeJ+inBVWQmqFW9UwDWyJGOwu2gadPRBfT25pJBp6ureryVyF5LlNmM/f6YWMlcLq1rxGcLz3ZtzmXYCh/ZxkEq1DPPFQTlEr5UQwLBCqo3RJDGnOffwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwzGCyl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwzGCyl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37BDC4CED2;
	Mon,  3 Feb 2025 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738612670;
	bh=durZiyUzKeQV8I7CDYBd9bdRLrh73k2nsD8U1EuoMNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GwzGCyl+NjMgN6QiwVEbFS1WawVGL2e3kcTGvNzQUqJ9W93Jk/xBCjut6IL6lN30t
	 HPAiZoCt9knGKLw4BWT+5jplUrJ08LSqhhNEmlFN+bBgRsmvencGfc53E8lb9L2oZF
	 IrHMnff+KS1Ktq1Mw9A0JJb9TvavUnidAHJHV+A3rcRQiGlOhcmyTdM/3/4G18/tYe
	 LZv4hPRa1RIu/hS8qqM+xX8wDtHO6NPv75H8KhKoUxOQzxRd0g9XUX1VZhKOx3cUkh
	 VFUSFeZ2vPwFIc56CMBTXcYsy5cyKcwnhfVrE18N3OQnEtQr4cbuZ5anw4eEW+VAPp
	 nBE5nGZeSZF2w==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, 
 Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder@fris.de>
Cc: Bo Liu <liubo03@inspur.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v3 0/9] Use correct LDO5 control registers for
 PCA9450
Message-Id: <173861266637.674751.16665389874730608623.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 19:57:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 18 Dec 2024 16:27:23 +0100, Frieder Schrempf wrote:
> This is a follow-up of [1].
> 
> The main objective of this is to fix the PCA9450 driver to
> use the correct control register for the LDO5 regulator.
> 
> Currently the control register to use for LDO5 is hardcoded to
> LDO5CTRL_H. This is wrong for two reasons:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/9] dt-bindings: regulator: pca9450: Add properties for handling LDO5
      commit: f9cbf56b0a1966d977df87d15a5bdbff2c342062
[2/9] arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
      commit: b5ec74c2aec76fbdff9bc16951455602e11902bf
[3/9] Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
      commit: c73be62caabbec6629689c705aea65e5ce364d5d
[4/9] regulator: pca9450: Fix control register for LDO5
      commit: 3ce6f4f943ddd9edc03e450a2a0d89cb025b165b
[5/9] regulator: pca9450: Fix enable register for LDO5
      commit: f5aab0438ef17f01c5ecd25e61ae6a03f82a4586

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

