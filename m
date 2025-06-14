Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A03255F26;
	Sat, 14 Jun 2025 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899571; cv=none; b=XwkjS5zyv1kGAWXpYvuWITDgF5pZ+fvNoRbaEDV77P60K8PqPVw0oOztuho4WD8CQZXvn381wkzxWN9ty6EsQI7RwCPzo9Hs71mW3T2ce1iHXWmd6tJG92VKensufT3dBWsxlvGRXnheGDcZOx6ebPh9ZlXUsM7d1fyRIBL3Ev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899571; c=relaxed/simple;
	bh=OdzKUOIlXTtgOB9zGHEAGif31oCm18V+9nmnRbwAMsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=diDhyYynsR5Bo/tP8Wjs588yyIfsuGMsSv8pvvzDaZT3HFmYu2PoBn3t51N9Rj/PY3viuQ5x3dJVgKrSZ4XKFV+TDBydK2zmTwzODX0vJcuqGwGDBnw1f/WZHEZkLQNB/j71EqsJc7AsN+ZFYBV/lci9CLVrhdk71n7IKTtxGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs6RiQY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs6RiQY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AEEC4CEEF;
	Sat, 14 Jun 2025 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899570;
	bh=OdzKUOIlXTtgOB9zGHEAGif31oCm18V+9nmnRbwAMsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rs6RiQY6mEScN2g9gvNZct944PNYuvJUfb5TcpPPq7M4NQW4WlkVR1HQAzx1vpcWd
	 AqI+P1159wLvojUyF9ZpKr3YbgpFNGJ6gEhixikqzGqviu4bvAhh2ca9/qym9zj3fB
	 AZPvCk3cuKMF1oYIypnIG6Q69NsYjqzGmaY1sslAaDNS7tod1LRUrtAcmrKxqIBfOE
	 WPUDvbCI5DvAns9YZ9zXv0H8/EXtkTERYVjxk939LdkMksuMIu59F4RKuWcie5sx/L
	 nm+KyCVzbBiDYpdViI3p4zHLR7QAWOrgstLqkXyKfsppdUPWHQJPL0YEKRSY/agBfx
	 97JRlvT2J3DGQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
Subject: Re: [PATCH v3 0/9] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
Message-Id: <174989956764.19870.14409381824476741020.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 12 Jun 2025 15:48:51 +0800, Chen-Yu Tsai wrote:
> This is v3 of what was just a single patch "ASoC: mediatek: re-enable
> buffer pre-allocation on some platforms". Links to previous versions:
> 
>   - v2: https://lore.kernel.org/all/20250424102509.1083185-1-wenst@chromium.org/
>   - v1: https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
> 
> v3 is simply a rebase onto next-20250612 to resolve conflicts against
> Mark's tree. I believe the main conflict is from my other series
> "mt8183-afe-pcm: Shorten source code" that Mark had merged earlier.
> Also, Angelo picked up the DT changes, so they are no longer included.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: Convert MT8173 AFE binding to dt-schema
      commit: bb90e0c91d375ec5db8a4f8cd2555900aea0725f
[2/9] ASoC: dt-bindings: mt8173-afe-pcm: Add power domain
      commit: 2fd902152c15a8cacab91e4a660413d189411561
[3/9] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
      commit: 473ee884263f2127ea4e46a74ba15d07446ceabb
[4/9] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
      commit: 81c73294a4eb2df31e974db2fc4397f5e0ecae09
[5/9] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
      commit: cd12d3a5ed10e3e3b323f2b2c652de1c8e17a750
[6/9] ASoC: mediatek: use reserved memory or enable buffer pre-allocation
      commit: ec4a10ca4a68ec97f12f4d17d7abb74db34987db
[7/9] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit DMA addresses
      commit: 9e7bc5cb8d089d9799e17a9ac99c5da9b13b02e3
[8/9] ASoC: mediatek: mt8173-afe-pcm: use local `dev` pointer in driver callbacks
      commit: b2c090c9f6aa9d19f4c966233d7fcb872255f83b
[9/9] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
      commit: bb8d8ba4715cb8f997d63d90ba935f6073595df5

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

