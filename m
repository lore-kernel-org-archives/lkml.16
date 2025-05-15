Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69891A275;
	Thu, 15 May 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294528; cv=none; b=Dk+dqfm1eFaPFYn66IC7djWbHSVHowWQqMJOm79LidHij/7Yp/ERiRpVDsrVIfFT1LODeu/SBe0WdEHgp+41Yaf996owrWrUR4MAPevExPIcSDXTLyv5s7WDMqrpfUj9hdQTrSvGi61GmFNNjzW218jY7T83HGZzLY6+uaYXeHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294528; c=relaxed/simple;
	bh=+KJy2T+MNcXBlOneJXLi8WasNvcgLEUfdbqlEhlSagM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nyZS9yaSGW/nhx0ZP+Kf5GdZPjifwmlXQBauPx5Cww8YMSYGNttRYxcBMzdX7tSIUrW1cO7g2Nj/7kr6nI8XltEHjhdB61FvU8z2V98egleQ0OczmyODdSSNmiFH8D49arPYR9rpIQc5Cn7WVicrr5Keb8BhMauSohYGiMuLrLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKbDu/ls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKbDu/ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1552C4CEE9;
	Thu, 15 May 2025 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294527;
	bh=+KJy2T+MNcXBlOneJXLi8WasNvcgLEUfdbqlEhlSagM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JKbDu/lsaSuMyXHGr2FudR7ulPXsrvfo4wdjpQGWb40M5hyCSuNzLRqWhKfL3jCNB
	 SA4P/flssGjW1tQmY+EUl7Jf9ONe4Dok49kDy2GOkdjFiQTZeH6EqtDZM5NgSwxL8y
	 R8rD8UklimLrAcj7OgWntQz1L4OcNcej2RuNQLhGIeEVXfTG40bxiuDdKD5+Ju3yjT
	 gyMARGGAm8VfyCLpm58mtBALD5rdXy2DMGUL9EkrtbNJNmRGnjwHLo4pWQimy9dtTL
	 64XH8YUmGIauPMQl01yOPGmmiyNe4b7TXScDHsgv1B6cQ/xVzIi435hjY6qcgRC/7g
	 xYScWXQONwQYw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
Message-Id: <174729452159.272498.16252204109859942609.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 12:57:03 +0200, Krzysztof Kozlowski wrote:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider
      commit: 0e4e9d75899cae4e7f379c50fa3d0121eff9641f

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

