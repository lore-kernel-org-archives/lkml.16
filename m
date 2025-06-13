Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71552293C43;
	Fri, 13 Jun 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823040; cv=none; b=VZM35EFG0XnG6KdEEoM7oNLAXaVFP6hmRhNXhj7dYpjjdWODkCtDPY3/zOqX5TSzKGGikP4nwA6sbRwocEv0WTECK3zKtoJuWfpAbvATnJ6zuGUnRISyA+8KJ3/8j+sXDTyxRaeWwrWIXZfSuCrIbYCIfJ5BpZwLqQds4LJ/XIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823040; c=relaxed/simple;
	bh=Ap3YfoMrAAPUvNenAlN6PgDCXyKScfqGCsqAZOV8aE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U/fQmeEAfRyLsVSbHtUl/hzEe6MQi9c4RK+MJhJL/ygDqHqH+CeI5+0SXPlJrMAsZF6PwKBYLso/VSUmWGmSV34wT7horJnlr9BDDp4XyaPLNjh3zVnZ1ERdTLqeFhOB9PmznrQ59QtBqaEFrjSy+2feg0PQs0Tuxukumt8jvfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0YJdYSB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0YJdYSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F558C4CEEF;
	Fri, 13 Jun 2025 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823040;
	bh=Ap3YfoMrAAPUvNenAlN6PgDCXyKScfqGCsqAZOV8aE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f0YJdYSBM0NhkuR+ilaaiG+/5suEAkg6qQuSWwqD3/t3vGt6i6iY6Jy80l2nyrq0+
	 ffodXlfZP5yW3t0K9NdkZ/3yYqP7rsy6xkOWF8lOIhHT1nlzwziFnL3v8Feefxc/JS
	 pxr+pksRSwTJ4ujPRXd0aGwlC5yq0ktpox+/ynb2N4PLfyYzfkAySNAg8R08EjUJDX
	 SNz0+U2Heyh40/Uru2pNo4yoNuXLvnN6L8ttdcqbXx6FW5inZpl5tgaocbCx94IxKe
	 RSm3rk9bRz/y5BGo5U+alYKWtttJ8B2MT7IRoo/HmAcCf9Es2ZMStJZox7i7jksnwl
	 4ooZuaNqRwMiA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>, 
 linux-amarula@amarulasolutions.com, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250530160748.2476088-2-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
 <20250530160748.2476088-2-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v5 1/6] dt-bindings: mfd: convert mxs-lradc
 bindings to json-schema
Message-Id: <174982303687.920028.789914432686351362.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 14:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Fri, 30 May 2025 18:07:32 +0200, Dario Binacchi wrote:
> Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
> binding documentation to json-schema.
> 
> The clocks and #io-channel-cells properties have also been added; They
> are present in the respective SoC DTSI files but were missing from the
> old mxs-lradc.txt file.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
      commit: e528f715cd30110137fb4830eceea6c817285163

--
Lee Jones [李琼斯]

