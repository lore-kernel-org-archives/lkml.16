Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430B43196A3;
	Wed,  2 Jul 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470731; cv=none; b=LIdEXLScDZnYxCo7UcP9EX1y9/y2pCJMup9Bv8NMp3J2EXaTOs8/u+Ju6rFeQBnU9lEgKvN7rw2fSj/FGJd8uOBm1FF6J/66thfnKVOZ0ECmJnkhrpgHxLlX/y1vsIoclpSl1oI358i88iTrP4QqtXdI9YnSFB4M6lZE7YOmMOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470731; c=relaxed/simple;
	bh=W5hQNC+bkejGwiI1QANbJUtEOUBM7Ud5weOLDUyCnVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RJnhCaa7Z4+69fJYchlECin7HnjnmFVQEsWi6P5b0zS06GgARBzXgRUA/+tOxDeYArUbUQ/JZLKGi4yMS6AJ5TqmBRlfpmB3mzYHLPghMvfComXwE0SBUTGrpUuG5SY5u+QsGzQxMCGWZkTD1VD10ngK8IsC+xcfJGHyqGLs8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYn+WMiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYn+WMiX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17436C4CEE7;
	Wed,  2 Jul 2025 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470730;
	bh=W5hQNC+bkejGwiI1QANbJUtEOUBM7Ud5weOLDUyCnVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CYn+WMiXXLuwzzAnFHFgLz2WkfY1eIdS+gE3M49/VMit47nrDIUcn8XuL+W0+CVtM
	 t41zn024BUchtZ21TR/++neYAPzm5xRKgf9H2UG5uuLdAUjmqmY3rECflKZ0VYZ4Oo
	 UnIpsr+sG7LtxeQSfwgCAoPusIDLntRVV3evUp0mx+Hn2curvbAP2WZPujiAO+luNZ
	 EuwJvTOp7b/MeRqS9oEa2qekIZvqrj4ifMp/VeDuT86O44iaYPxpS12fY3T78l0oRa
	 oQROCzhB6P8+CmglVi5nNUcL4Rw1J6Y9uHXC7Sg0+w8IhKg4oLkftucd6id/jYJ1M2
	 jup+3NovlCtYQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 Daniel Semkowicz <dse@thaumatec.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
References: <20250627-rk8xx-rst-fun-v4-0-ce05d041b45f@cherry.de>
Subject: Re: (subset) [PATCH v4 0/5] rockchip: rk8xx: allow to customize
 PMIC reset mode on RK806
Message-Id: <175147072781.3050679.14720793448550456209.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:38:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 27 Jun 2025 12:53:52 +0200, Quentin Schulz wrote:
> This allows to customize the PMIC reset method (also called RST_FUN) on
> RK806 PMIC from Rockchip, mainly found on RK3588 devices but also on
> RK3576.
> 
> Finally, this is required on the two RK3588 devices from Theobroma as
> U-Boot changes the silicon-default (which is suitable for us) to
> something that breaks our companion microcontroller's reboot detection
> which breaks a bunch of assumptions in the MCU FW code.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: mfd: rk806: allow to customize PMIC reset mode
      commit: 1ba8d6e2e2003681fc0a1548c145299d509e352a
[2/5] mfd: rk8xx-core: allow to customize RK806 reset mode
      commit: 2e8185c0f214d45cdbc20ee4e6796c561ba66c55

--
Lee Jones [李琼斯]

