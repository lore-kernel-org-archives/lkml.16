Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626224418C;
	Mon, 10 Feb 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210815; cv=none; b=tqJZxyAgG/qmHqdBftPwqHta/8hX0JZoF30or+EKwMN3R16lGp2FwCWIEpJIcWcY3a+laSbq08g3dDwyXVgi60JD9QIqvG3HEZ5XlIn+Npa4Fd59Xojw69dsNeABgZIVATAaW+jKICmBNZApky3rX5j1gLjgp3uSy90MkvFlZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210815; c=relaxed/simple;
	bh=9exn/4ZsF5vuvnX6J4sI+LMbw0QAxfbaUGw2qKxET7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aSfyA8zasFXLNaox/gBQ3bdbye5VXD6TBprmPgMfa10Tufqe2a8wsgRhwYrkeNdI4arMdUX6DNFnGKVozX/zBBiYYpcO2YnvGr7HBiGYgH/JTqcO4DC+FDitW872cvvjLZ2PDdCNhmU8KtKYXKeNC+kOUawIQPWo9Vqngctdhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMzbYXU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMzbYXU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318ECC4CEE8;
	Mon, 10 Feb 2025 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739210815;
	bh=9exn/4ZsF5vuvnX6J4sI+LMbw0QAxfbaUGw2qKxET7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bMzbYXU7pAqM8vaN+LfTd+RHouNCUWylspD71+355yoGwmaqVxbZL12NJ5ABmgfny
	 OjA5s/GjFxGA2nmlceA4IoJBJANqaHtJkqZGpzT9JumSEi5699kTFaOQM/bHzKd7fG
	 0lNRB1TTWq4JqCJZoxtwQUUIF1+CqUln35kgfB8cVaOHyPfcbugv+0zfCJ0tEZqNoM
	 8IHIhgwex9NPAyOyINexrKA+vVE63tPIgVS+ihcUB9tv1dMPnnZYtyac/SVZUhVFnh
	 lHTZA6D7saT8qrqcKn/7fBQUsj71e9i4HFlwQZdMtySeYXTLZZqFbD7ugEq1pw5+MB
	 c6+tMrgm5ydcQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Alexey Charkov <alchark@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
Subject: Re: (subset) [PATCH 0/3] arm64: dts: rockchip: Add SPDIF on RK3588
Message-Id: <173921081291.95415.12801821205911755480.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 18:06:52 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 20 Jan 2025 13:01:26 +0400, Alexey Charkov wrote:
> RK3588(s) uses a several SPDIF transmitters which are software
> compatible with those found in RK3568. This series adds the required
> device tree nodes in SoC .dtsi and enables the dedicated optical
> SPDIF output on the H96 Max V58.
> 
> Note that only SPDIF 0/1 are meant as externally connected outputs,
> while SPDIF 2/3/4/5 are internally routed to the various display
> encoders inside the SoC. Thus, using SPDIF 0/1 only requires their
> device tree nodes to be enabled (provided that the signal is routed
> somewhere usable on the board itself), while the rest rely on driver
> support on the display connector side and are therefore not touched
> here.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: ASoC: rockchip: Add compatible for RK3588 SPDIF
      commit: 330cbb40bb3664a18a19760bd6dc6003d6624041

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

