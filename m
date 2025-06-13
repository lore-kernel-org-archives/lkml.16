Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E42E11D6;
	Fri, 13 Jun 2025 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825500; cv=none; b=YBDXW8y0X3Qt23sNc1Eq+GUvCNOZwzxua/xF09lB724Pt5w7lV8M6KcdbjQXnSAjfDJkr7ozJ2YhEkCPBFJnpaDrVxtGqgUkjXRisSH1nBH7saGmPC4HvHYx2anOqYyYJP3nRUE1+QCVQrWulofKgCC9bpqjFBTStdB+iSWJGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825500; c=relaxed/simple;
	bh=72UKJbZgygU3I/7FaNc+D1AwlBQQCsQR3FH9DEz2Bjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvPbDkBAjPFpSvuVZWyX2xaGcewkVX6ozskTMhjhL/X2BH8wmWDnvsVoBs0rOSErpwkyj91WxlN4nUOztwzboEQ68aVh/tKJnxq88qFjRj1q5ZlBV6B2Zd2Y491s8LuUnnHJmO2Kx+/Jo1Zqv6y+ZhjcQQRSeMwucTpVFLhX0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0NS+mN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0NS+mN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6CEC4CEE3;
	Fri, 13 Jun 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825500;
	bh=72UKJbZgygU3I/7FaNc+D1AwlBQQCsQR3FH9DEz2Bjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0NS+mN8VCm4FKZwvLmvdn8xaDq9PJGtAn4HpElss4XdTXDrBW6bMr4C+yYQO0Lm0
	 tBZrgumJJHZi/a0DYkLgTvGcBx/+B9FkVxNs6KKsQ7Z48YXuHQ1ELCrxDGT0n+ZfHZ
	 f7q2ucRnB0fpTwiOnAn78gmPhc1zLH3kpUX7ghVhqmNm8AqW5D/wtxJV00AlNrMWCm
	 DUMOm4eP7buiAYzEnoVLSUGMyi8cR1svDggvdzhmJiX2fGlLbFzhG2ztbd6lj/9QWC
	 kbDCwB8Og/kulnim7UGJERtyTCmO7tVwGWSxLtDTZvwrz+70ZTX5SD8k7bXP9gpDMD
	 JA0HaiKUfIALQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
Date: Fri, 13 Jun 2025 16:38:11 +0200
Message-Id: <174982533895.547352.10071865015714260186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
References: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 19:19:24 +0000, Sven Peter wrote:
> Fix the following warning by dropping #{address,size}-cells from the SPI
> NOR node which only has a single child node without reg property:
> 
> spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      commit: 811a909978bf59caa25359e0aca4e30500dcff26

Best regards,
-- 
Sven Peter <sven@kernel.org>
