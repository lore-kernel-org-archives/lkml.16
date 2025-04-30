Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693871E570B;
	Wed, 30 Apr 2025 19:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042109; cv=none; b=NPbioKxdfM+MA5mWRwWbysa4o0hkgqb8Nb+vuIZ1sHfgOB2KkZUzOEUrXSdGf/6dfqRkfY3dfkUKX6eAGAnpdm7xfXE/pxq1LPRXSPisAallcA4VwX8ydWmXWpqI/uBzo4hAWAcWdnzjJrBDPerZ4gj37UWeU+cpig1bogST3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042109; c=relaxed/simple;
	bh=hpfAhy/7tVhagfc9z4JgybjSfRl2vTPI06TuCoChDUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LbivDyRJIc4nPQd15gbbGHuC0ecqHexeD1MT/rDeRgu48PF7UkphSgj45KWXsc9GYYE5TF3JCVcL0WssTpZ4iYUqb1+HcK/5JW9Hjfi1JhTnnuZ6x0iM1jVALCdrc1w0dtwAH9P61PhAKh+Hp+P16NcRMEmVRw7uCzvN4hUrVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9UCymD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9UCymD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3D6C4CEE7;
	Wed, 30 Apr 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746042108;
	bh=hpfAhy/7tVhagfc9z4JgybjSfRl2vTPI06TuCoChDUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y9UCymD/N2lgHtazdCALwEztIiO3B6AihkoBnLIQwX8jf5BouAMCk2GqQO+F2j17i
	 LD1YLsmNsWc8n1bJWzdge2XYDrroxdW4jpDyx/0s5xuN79n+gMpVMxtQXk4R/x3PTD
	 g25P8NedW9cmZohv1NMH2CHa9fKEpXnmvclK0s3oq+eewwqMhBuMxOaOCu8PVcEfRh
	 JvO0YW06OXT8OvmFMTpmTv2N+3URcdcn8aJb7wMOboV8lSbOdBLJyky7PJSQo4mn8Z
	 9wBEJhdKv6ozC3X8zlFQTnSxmokHy8FxBnmOkdWg9qWauZuHX3SnLLEXi/Tc04m7Kq
	 mX30ayso6Irjg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Apple PMIC NVMEM cell driver
 (Formerly: Generic SPMI NVMEM cell driver)
Message-Id: <174604210497.121736.17664603572137635486.b4-ty@kernel.org>
Date: Wed, 30 Apr 2025 20:41:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 23 Apr 2025 19:55:12 +0200, Sasha Finkelstein wrote:
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
> 
> The NVMEM cell consumer drivers will be sent in a further series.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: spmi: Add Apple SPMI NVMEM
      commit: 342ad99689be22776c50ab5d82064b700e516a98
[2/3] nvmem: Add apple-spmi-nvmem driver
      commit: 8d2900cc141122ad3a754d6d86cd15a9a4bf0b74

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

