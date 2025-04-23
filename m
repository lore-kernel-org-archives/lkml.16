Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4414137750;
	Wed, 23 Apr 2025 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416165; cv=none; b=T8MWToVDXwGtyA1UzP0xlMXj1XBUo3Lja18u94FUYCXhLazjSu9wnHHujca37f2ZRDYx1GcLoNEL+bCMJNxiyg37fzzXrr5pq3+7w5RUF2n+Xmc4I88wqWYZvd8ZNEDr3msS3rSdLkpzXYHKDgGOn/dU2EoyeF3GwlvDr2QYqiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416165; c=relaxed/simple;
	bh=osGtOXoJ3/G4yq2pLf+qpaLC++EVm4B+QQ46Ny8HTnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pJLk855lv/D5VpDFtaNsPW4d819w4QcAmQKMlcPg5wy3l1Rfk38SO1USYkPT0fBGoCT75LqkUxGEneh3nyPw93RTCHqw4wEhm8DFtXuG/nZjuTjdxPMbECLV8oW9phRk73vk3Xf3eljXMoXigB9mCFyBJFUAjX7zuNy6/axfldA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txMPS8mz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txMPS8mz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FE6C4CEE2;
	Wed, 23 Apr 2025 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745416165;
	bh=osGtOXoJ3/G4yq2pLf+qpaLC++EVm4B+QQ46Ny8HTnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=txMPS8mzhOH4JqWs1/gpActbHw272wesasElzGIudFpTPjkYoE2Fidl1RznTJYoB6
	 HrIW0sUUeMDYBEGX9A/z9xoQkqHITBpJgrLpcBLkoETNeCWg2Ppw1Z4WTmIhG6Zt5M
	 2S7JGvwX4KzuRr6fzQEyVX5BPNuqZhTBegeRGEdr3O0aPf6H5i5qWfemZZRNWldNdt
	 ylCBx4jutIwZmwtbc/01ACKzZptf2DOuKlb60SkdBqPU9zb3pJJHQlnDh3EdZDXjGD
	 dP7fKeCj1xnj6YDBpdC9zQ5dxsTbRteEBjFwyn8anEIXhn2f3+SuZo2N/hs4VsISpY
	 keUVg1uVu8MiA==
From: Mark Brown <broonie@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
Subject: Re: (subset) [PATCH v2 00/11] Add RK3576 SAI Audio Controller
 Support
Message-Id: <174541616068.423395.2187976314107237451.b4-ty@kernel.org>
Date: Wed, 23 Apr 2025 14:49:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 21:39:52 +0200, Nicolas Frattaroli wrote:
> This series adds support for Rockchip's Serial Audio Interface (SAI)
> controller, found on SoCs such as the RK3576. The SAI is a flexible
> controller IP that allows both transmitting and receiving digital audio
> in the I2S, TDM and PCM formats. Instances of this controller are used
> both for externally exposed audio interfaces, as well as for audio on
> video interfaces such as HDMI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[05/11] ASoC: dt-bindings: add schema for rockchip SAI controllers
        commit: fd55908d3278300ec4cbbacbfb07748bb9166314
[06/11] ASoC: rockchip: add Serial Audio Interface (SAI) driver
        commit: cc78d1eaabad3caf3c425c83037cd8ba1c9f2bc6

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

