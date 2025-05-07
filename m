Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C81F5834;
	Wed,  7 May 2025 11:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616380; cv=none; b=UHpC0TcdRRIGTUCfZKtlcN0ccyiQlZZRU2PdFjbPz+57375pk5rdeScm/aN/9UK8LpUsYK+jNlOdHu8VlR9ar3E3jMxhu+6Jzm5cB0uuW1VT2bxZGuLg24IuTcj2Zk1dm3WPOcmVJ35yDzv5u6vXjN8KkxTCZYlXyZsiwFCOKvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616380; c=relaxed/simple;
	bh=6evjK6udnapuTurtZ2LeZ+u3CzBeUcL7VoG3BAphDAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eVlucsB1jkwTBndPVTjUFtp1XEwIE7MdJQH1C99h97Z1hMEh8GUsdlf43Iyi1KJh7bENlX9mmHxb2Tn/YGr+FGznvsErroEDs1DhF+JEEP+8ZUYFbgc2sPMP0D4aJNM40AL/zgiLd1W6m0B3uByhBN+8pPr/18EZr/lfUkZOyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aua3jFs4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aua3jFs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0040DC4CEE7;
	Wed,  7 May 2025 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746616380;
	bh=6evjK6udnapuTurtZ2LeZ+u3CzBeUcL7VoG3BAphDAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Aua3jFs4Ti6Oi7P4jAorB2tVRa4IU7zA+ZC2+FqPilo9ieABm5CjzZbQfBRToGboS
	 mCbvbm8FWKjN4yAFHd+F1i9kIx88V6jwec24t6Ec5MYYkDrlpwocIQQ0O0ShmAMI7K
	 haH8ibWo8SE5LIGSylgy3JQywM5qv6NktO2EC10WJWBG/jyV6bURFQ2KH7y0IBPxX0
	 PMLG8LzRrNwcIqi9LCqAmshuF3yaec8d8gUk7fj8BFcb5Yh/FOCFtm4S0WxOpGqJQQ
	 //yOFHlPU1dJt33Gaz3ubzl5twYDEYfiM3O7knAXzmcEIk2ToqK9qmYDWch+nDruCG
	 N8FP1Kop2eI2A==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/5] Add support for CS35L63 Smart Amplifier
Message-Id: <174661637867.4174662.14582168796180489522.b4-ty@kernel.org>
Date: Wed, 07 May 2025 20:12:58 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 16:16:39 +0100, Stefan Binding wrote:
> CS35L63 is a Mono Class-D PC Smart Amplifier, with Speaker Protection
> and Audio Enhancement Algorithms.
> 
> CS35L63 uses a similar control interface to CS35L56 so support for
> it can be added into the CS35L56 driver.
> CS35L63 only has SoundWire and I2C control interfaces.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: cs35l56: Add Index based on ACPI HID or SDW ID to select regmap config
      commit: 9ea280f3df60df014527ba5723fd8d1fd7c3b3ca
[2/5] ASoC: cs35l56: Add struct to index firmware registers
      commit: 8c0821ccaa1e53c30f6a51d034171e20d522a9c0
[3/5] ASoC: cs35l56: Add Mute, Volume and Posture registers to firmware register list
      commit: a3ec669efcee2cffd8ca020df777adbf79ac0b75
[4/5] ASoC: cs35l56: Add initial support for CS35L63 for I2C and SoundWire
      commit: 978858791cedaf1dbbbaeb1e37126611b7c28a9e
[5/5] ASoC: cs35l56: Read Silicon ID from DIE_STS registers for CS35L63
      commit: 406fbc4d0fb34c16718551bb8f4c776710f63b55

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

