Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA113C809;
	Thu,  6 Feb 2025 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863010; cv=none; b=rrt6qT1eNXHrqh13rL7/n+C+WB6OCT6y7AFOwyW4R97oKyowpFgi5EHbkEcsEIGJ8ODGb8TgWuYtJlLU3saPCzSXMvd4ivls1jSSk/kfrKG2jNAWsou42HiRb0ym5eu2w4kXL3jRGeGalHL0Vtj+pVH7JUuOjq4qAGIAmLifXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863010; c=relaxed/simple;
	bh=09KTedSG77AXoeir+b4HyRhzwue2u0WYm3LwzHo7ci8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QGsvSjOs5ppsMBTYvblfeUB5TdCBCuqe4k4kVCst/RxY3xBIgywTUdUgxAA6lI8I1tbRo/dZK71Ye7sg0gXRJ8a9+2ReuJXDrxmmSjLacY2pARrrmAIb8qRpjA2Lu7z4ivnQYbd0f4Pfx2yueP7LlKCdgDRSqZGNGcUNxVNQ7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3w9pT2v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3w9pT2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A309C4CEDD;
	Thu,  6 Feb 2025 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863009;
	bh=09KTedSG77AXoeir+b4HyRhzwue2u0WYm3LwzHo7ci8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i3w9pT2vZ2WN2ZQqCvJ21gyp79pu6ADWMlJ7U9AgIiZ54nFrA9zlaSLwyGNCFgREg
	 ivD32IvE5fcC62tCMypL24Xl0dBcN1mpO7FMY+26DTOpZQszDS7I2Bp6nSTZaqKPrM
	 mTe1MtnUyqNpBG5+FBCJlcwOXfAMQeq0tJp+wM7w+Yo629LE2a+KC2Q3Hd/cteLtIJ
	 YBFfzN7siD6ARNGFkXy3hME3T9NjShiU17CkXag6Yh9lSF+W1kgFBA1DnyoRmG4vfA
	 Dr1p/fHrKOtFX6RvBXYIqlKf5k2PEXQ8QojGJ/GgcZgaMzL1WXJLuu1SE53LHmYK90
	 O5hi3H/hZaw5A==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, 
 Andrei Simion <andrei.simion@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250203091111.21667-1-andrei.simion@microchip.com>
References: <20250203091111.21667-1-andrei.simion@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML
 format
Message-Id: <173886300585.325569.12869992577309610074.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 11:11:12 +0200, Andrei Simion wrote:
> Convert devicetree binding atmel-ssc.txt to YAML format.
> Update the documentation supported file for MICROCHIP SSC DRIVER.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML format
      commit: 6603c5133daadbb3277fbd93be0d0d5b8ec928e8

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

