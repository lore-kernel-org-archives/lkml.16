Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD76213C918;
	Thu, 22 May 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908330; cv=none; b=bPVPirjkoszgSksl1oqOcQzhJbjXnF6OM/w47IQeluMkHwiFe2Of7ErZPtMXNJ8pFASNaYvzk1QIskOevbgMDHtRtmb3ijuwSVfWPbW9ec0RJU3VwZUCDn8vf0AzCMB1euFbOjgHeCUzBLB5bafzet8f4X/5iE48mkV3BLS/174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908330; c=relaxed/simple;
	bh=hkoSh4rXBV9F+AkBsFkCf0Q5b3OIolw2++iLyqldc14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tU8yRX7KS6V4vPL0LOd0F1GTmjAc84W50DqNxPsE/JX8ZuHZUeQHrfrMhpOyY60g/VxqjE7O0b3HF4r6BRSQphAPPGEXK0tBlCscesulfd1AlDRbptehTlA2JBD1yeTk818yGhC5IcdAVLZwazlWlcF2GB7XgeSlrPndjCUVa/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXrh6U0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXrh6U0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A865AC4CEE4;
	Thu, 22 May 2025 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747908330;
	bh=hkoSh4rXBV9F+AkBsFkCf0Q5b3OIolw2++iLyqldc14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iXrh6U0x9OthC/+HqU370DwY2ed6GOfTddn5tQbEieT2gd+nL5PQ7vWuBfyrKMjnS
	 LHk+EjupZ74LUxV2UydjKUhccewZrx+qAlbNnEOrC1hmm2d7gL/qOTgzW6jxMB0sDD
	 uyX4AAkC+X94+2MMjZvHT7egu1qs5K+RfECMsqgvXMCk5Zw+P09fp2nUWj7eoW8zWG
	 /o/lka1s0M/wo95VopLhca9TSYHo8qGTPOVTvE89Z7D1c8fq7s/ddzY+HY6/F7uxLx
	 KceDlXZvj9DQQpSZCFnolp5OEH0ddqsGMMqZcLUZbeRW7ippRsfyMoiK3kjne2DXsZ
	 YSChouLRbvXfA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
Subject: Re: [PATCH v9 0/8] mfd: bcm590xx: Add support for BCM59054
Message-Id: <174790832742.1284719.7437669812151854972.b4-ty@kernel.org>
Date: Thu, 22 May 2025 11:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Thu, 15 May 2025 16:16:27 +0200, Artur Weber wrote:
> Add support for the BCM59054 MFD to the bcm590xx driver and fix a
> couple of small bugs in it that also affected the already supported
> BCM59056.
> 
> While we're at it - convert the devicetree bindings to YAML format
> and drop the bcm59056 DTS in favor of describing the PMU in users'
> DTS files, as is done for most other MFDs.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      commit: 9d56594f3ebf6ea4b23884412d3fde11f39518d2
[2/8] dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      commit: 13980ebf8e9431975fe834df9df31dea39cb9a45
[3/8] mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      commit: 6adf48a3aa316ce360e02dd10222e96da9a0eff5
[4/8] mfd: bcm590xx: Add PMU ID/revision parsing function
      commit: d310cdbb4ee6285f374d4dfc32173c35f8a2273e
[5/8] regulator: bcm590xx: Use dev_err_probe for regulator register error
      commit: 37512643e1f889549e4f9632d6bccef6804cb776
[6/8] regulator: bcm590xx: Store regulator descriptions in table
      commit: 75dc12b4450269821fca4c8634f5185d28cf2117
[7/8] regulator: bcm590xx: Rename BCM59056-specific data as such
      commit: d92f474420e5bb2c8b773a4fe9cf93b6051dc1ff
[8/8] regulator: bcm590xx: Add support for BCM59054 regulators
      commit: ef7f3631a44b8e0990ab8ffcbed4b2c3a4270883

--
Lee Jones [李琼斯]

