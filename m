Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8015665C;
	Wed,  9 Apr 2025 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229926; cv=none; b=nGD7SOQ02daslq/SQ4Qx2ByabHJ6D1PONsysiYD2jw892CwJxpfl41BgoIX5kLM/S7h/rZ+t9l4D9jFk1iwz0hSKcaHCbaD6CEETZRhdDylh5cVX1nzZDStI6tvvUraA0t6Q3NqB6HFZpmFFAJpKTazkZFpYrmg0rHczFnYumiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229926; c=relaxed/simple;
	bh=5iGNb+8reKVLjhupKS86Do1SI6y8JNP5ofcs7yMtpU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mnN/nfUjrmoxi+FstXLjbY52FHSGQ4nXClX/vFecDcElYpZx7QkaHFH8Co3fOXqqsrtIKWxxSMuZoTvZzmQ4oISmt8zGUipNexBNsMrF1YpNHZeRwcwIIMoOWpzdgtOnQ4RDeCrEXYxH4yJMc8UBOGHjCbBlXgwTw5noCFZfLNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cj9N72Pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cj9N72Pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE817C4CEE2;
	Wed,  9 Apr 2025 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744229925;
	bh=5iGNb+8reKVLjhupKS86Do1SI6y8JNP5ofcs7yMtpU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cj9N72Pn6BwCXq+C+p14nzaEVomBHkQQzXYjkocrvNg5EvkiuEJlTym6vCuI3//KM
	 Ni+uZSlVs8THcdm+LZ8ey5fBbo4vkkAolQhaR9lRxaDz0svvUDdOYFo9SHUnmHkcK/
	 a61Rt81dsNH2fFY/3tZKcRdbl0eZRJGZQ3Uy8jgHLWcPWB5GAPNJcHfL/9Ll8p4hVs
	 I/KrRoNDo8jFe0M+8QiZIbDBC7Ju/ZEzjtfCCvyk+T3FWVZ2O02R4UymKUd6syzpv3
	 Ao116QlDlHwKOPetqF4w0rchIw8/KeH0z9JiAs79rYpj3OMK5z7PXciv/J7lyxnnT2
	 8E92W3og7nA0g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250408-upstream-adp5055-v5-0-dc58d98a7a3d@analog.com>
References: <20250408-upstream-adp5055-v5-0-dc58d98a7a3d@analog.com>
Subject: Re: [PATCH v5 0/2] Add support for ADP5055 triple buck regulator.
Message-Id: <174422992361.1502590.6910464577711922993.b4-ty@kernel.org>
Date: Wed, 09 Apr 2025 21:18:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 08 Apr 2025 12:25:47 +0800, Alexis Czezar Torreno wrote:
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

