Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010622069F;
	Thu,  3 Jul 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555303; cv=none; b=CWIyJ5/qLp/pbmQYyys5bqP0yTZaGNxpzZtnJxXIItAiC9q+ce0G17TbabFTuLgstUIAxiyF+UF/aM1YhLO7YHbK4V9sDXrgsT7oLEIOG3avWU+FasLxba6dCkzX+HbJ98bW9ID1NYu9jPycalQa83c1LLehtEJRvWTM+4Ny1Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555303; c=relaxed/simple;
	bh=Gb914pc7tsoCoXqiZnvsCRpUXUTAG302g/C/bqi52gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rwx+CrD04f2tQ7361V4+SLHH30J9y59qN9nGxPAlrFlmYFsZVTLpELCNCyVrXtJhdoO4jJEO+2jgjXRAxG8GAjtGO5/O196A0ga2avwi8X21vl8tQkX/DUn1gcnYhTJPD9vw2D+8kceWcnFLzTN9pMVoBT4acVgW+Dqsy8aZZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgHB/A2j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgHB/A2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9F9C4CEE3;
	Thu,  3 Jul 2025 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751555303;
	bh=Gb914pc7tsoCoXqiZnvsCRpUXUTAG302g/C/bqi52gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TgHB/A2jJ95+PyjWVexyghrisZx/+KIm3popnDjXIuedv/S7mYBFEi1rPNHklq/jZ
	 OYPyLyTcQS4L1PDRdN9iEVkLRhU1D5TdnkWwR/SOuKloYIW9trutx91CQXkb9VVYLg
	 D1M72Iz5RTYNPE58xveByR6e86Zkw4Mmg6DLViWfqdVR3q6QyR+Om0/b1Js7k4BWPW
	 Trt1h2+Ik5JK8geQfanZ1jkvPL3AWzNMLk/YV3vFeKxXku8SGAgrE8+mKobDZEUasa
	 ZRp3S9TMRWjzmqxlVfOS4Urv4vW7nEC1UQsWDMSI6ZVHzUq5oIA4X3pXMdLClX8tSX
	 BGa+eiHqw3tJQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org (open list:SPI NOR
 SUBSYSTEM),  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS),  linux-kernel@vger.kernel.org (open
 list),  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
In-Reply-To: <20250523155258.546003-1-Frank.Li@nxp.com>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
Date: Thu, 03 Jul 2025 17:08:20 +0200
Message-ID: <mafs0frfd1fdn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 23 2025, Frank Li wrote:

> Add atmel,at26* compatible string to fix below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
>     failed to match any schema with compatible: ['atmel,at26df081a']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav
