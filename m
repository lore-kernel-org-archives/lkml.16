Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B74263889;
	Wed, 25 Jun 2025 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880370; cv=none; b=Cg5CbhmKWJ76HFv2aJFPuJ2zFuhW1J66t24Sc+PVb4SAEDd11KS5iAhay66XV/BT8lRSZCwhyuEsw8v3j1L8HTrdYeE7+SizfjxTpo0bqpGaf4chbRcWiGBh8ycgUrChpsspdLrYHzZ4JqUkkt7itqFM8HtMWOfl3KUqPXOzloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880370; c=relaxed/simple;
	bh=6DlABh1XUb+M1JsVeT5pGkKPi41UFB4YwPIf08LrXVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZR+DcLriN8gCT6z0U7eJE2eIOocAiC70UtstXPixkNOFkEzfAIqStBf5LFpKt9+5y8G7gssrX5COsZ6pRGMUDGB/O39ChOOKGhQCgp1kYBHGwz1p1H/Ye+CHHe1Q0EKvstSKRQSxH05JQtkaJTd+IAzQgOWxfRja70WVmsWyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qI74I42l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qI74I42l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D9C4CEEE;
	Wed, 25 Jun 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880370;
	bh=6DlABh1XUb+M1JsVeT5pGkKPi41UFB4YwPIf08LrXVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qI74I42ll82+zvFWcVZyXaVmuxMf7u+kk02cQ8TLcVhrTL52wWJdtmN+SJVzBNDT4
	 xs0pmAXDwyLZ0FvAsy2Xs0y3ThFiOEh4sXze8nMvTzBRKSechWnTFLeilUvYMFRSXT
	 aUEF8Ey9epIZRubAvMu8N0lkFuzszQ8OTC3AVLjz9YUPn3McrsNc0O/tngf6jUbO3E
	 Jvx5rYw2OJK19QznYDnJa1K4oLCZ9tnPjmRa8Z4ctR6f7nWpcVMHlcT8KPxUdMIBOL
	 1KGLmSIPtfLMB/UMGDoiuVyBokOCX22JABMKmZhSa7SSidbZvPWQ2rrDNO5V83FC75
	 VpOeZBsZzwpXg==
Date: Wed, 25 Jun 2025 14:39:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Message-ID: <175088036858.2092918.12040107423396326625.robh@kernel.org>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
 <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>


On Mon, 09 Jun 2025 22:59:40 +0800, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

