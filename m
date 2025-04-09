Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3510211A05;
	Wed,  9 Apr 2025 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229927; cv=none; b=bk8afpoZasE0gNlt1t8wzyt1ePS5WOlpwLL0s/Os60aDZJovuyIyJK1mB6IdCNcjX0sUvqlNBYk3BF2kTHLsvbaaaNS6EGJ1c5n8utMvC8l4ryBU8miBOjmvzG5uxGlNJZSZDnjUuetazDVKQi9mArlLfyQZylm5VXayyVNHLac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229927; c=relaxed/simple;
	bh=42VrcdLF35wazgO/76/95DLh/k8XSD23INsF5p5+ERY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AY77zSDoB3UypCD6JZllm5wAmui1WNFdvP7hmdE/kZ4RI3ZNH9WHIYCC15x0HnXTe75B/Z8Pv2tY1CQEksyzbICPWZs0MIBb70928ztJnXB9XWiwKDM4gpZ2gfFeTm13TGlC0tLanYh5rTjJXg+52QF4OeEcHtm0QoSkbehRNws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqd5sQu/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqd5sQu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB3C4CEEA;
	Wed,  9 Apr 2025 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744229927;
	bh=42VrcdLF35wazgO/76/95DLh/k8XSD23INsF5p5+ERY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nqd5sQu/KDnOmJSussSDVUpZx9iVZBLsJr6geR1yi5qlujKn8ErG7gQ0JmImy9t0E
	 WXaxalwm4SkMDVQNFJk1CoJ1aAClhz0ofg66rov6uuKHxSBi/HsDpNutO8i5MzWHXe
	 RuzOfTEfYkEYSSVnlTiG4n3ibeY5VZ9P1+MsUZ+aG2FhSsDFmG6Fq1tusRu6z8Tjyn
	 rpo1hxwsq8LwHz7F0Lv7R8axFMQ2VDVZOa8KCqehAPNPiQh6vpQBk7QKKK6weuR5j5
	 l1CwZs2Ddegtmmmx4jaoMqbPVDNg/AOv5qWpd+Gh9xARhexR0aPVCd4Bp1/isYXDDE
	 99UV8MkeEtckA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250409-upstream-adp5055-v6-0-faa6e810deb1@analog.com>
References: <20250409-upstream-adp5055-v6-0-faa6e810deb1@analog.com>
Subject: Re: [PATCH v6 0/2] Add support for ADP5055 triple buck regulator.
Message-Id: <174422992559.1502590.8300583025355539632.b4-ty@kernel.org>
Date: Wed, 09 Apr 2025 21:18:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 09 Apr 2025 09:34:27 +0800, Alexis Czezar Torreno wrote:
> Introduce a regulator driver support for ADP5055. The device combines 3
> high performance buck regulators in a 43-termminal land grid array
> package. The device enables direct connection to high input voltages up
> to 18V with no preregulator. Channel 1 and 2 deliver a programmable
> output current of 3.5A or 7.5A or provide a single output with up to 14A
> in parallel operation. Channel 3 has a programmable output current of
> 1.5A or 3A.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: adi,adp5055-regulator: Add adp5055 support
      commit: 5bfc88c4e5783357399ce66f40a479a090af2ba0
[2/2] regulator: adp5055: Add driver for adp5055
      commit: 147b2a96f24e0cfcc476378f9356b30662045c7e

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

