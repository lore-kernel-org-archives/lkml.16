Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069B3285CBC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078566; cv=none; b=DZhKvVvT2gg0CxE+2prUef/ER8vgXJzSGQVtD+8mwl4c3kfOexJ2Q1ok82dzA5IjOF1Egz7mheSt56K+8P26A1I9PV6up0LmrS1vfePn7M82ncufw/G2szDp9+/2b8r/5A9vm2DJ0R2rPUdp+2alRgBRpOltHGyZQse+eYgAxqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078566; c=relaxed/simple;
	bh=spYR/2xvF+MKkfbF3T4H8ZiASBq5PM0aP8gj+hYX5xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRXrx3NfmUeIyndE1o/Cit1e9casUIwd4+Pgkmlid5IzOrZAyLd6OR7l15r9YHPOM0HZpV1DLw/dnmrCmpUJo74whdsDxuzR323Smm+T9KQWOtM35bZtExkrEoqPENeSkiTGYtaqxUqKtNRNPGJ1x1gyqiLzWQWU3JrrNT6a2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKM+PDe6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKM+PDe6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF48FC4CEEA;
	Mon, 16 Jun 2025 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750078565;
	bh=spYR/2xvF+MKkfbF3T4H8ZiASBq5PM0aP8gj+hYX5xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKM+PDe6B26U3+HuDJMqmAsTAWa2DzNlpTuY3RYu4R2Be2sofu+JWv5tIjNjbSJ7P
	 LadpZRYVGXa9SOoqtEdGBiVsiZKla7Dvba9rZSGlDawXQY0ygmf+nFEcLSmlK+hfyY
	 fMkBoCOlwztQgfNsPccigLGVhEcCltszLMZhhf/LmCWCdp/XM1hqKOw6Feb/G/MRf9
	 4h5v1v8AFknIXp5F38hIud1SdIg2rZIczqgxzT6gf1Fgoc9/OEHBLPmXUypCw+TzqW
	 PN2I/GYvRbCrXGr7fP+JUh9O+z1AXn7niqiZPrjIS93p4+l/cPB479aEZJlW6GQJxb
	 gxxOlfXKR7U2g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uR9Nb-0000000020W-16pB;
	Mon, 16 Jun 2025 14:56:03 +0200
Date: Mon, 16 Jun 2025 14:56:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
Message-ID: <aFAUYwB8IqZKFMT6@hovoldconsulting.com>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
 <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
 <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6232e835-921d-4855-8b10-8f873a4e3c30@linaro.org>

On Mon, Jun 16, 2025 at 01:23:08PM +0200, Krzysztof Kozlowski wrote:
> On 16/06/2025 13:20, Krzysztof Kozlowski wrote:
> > On 16/06/2025 12:32, Johan Hovold wrote:
> >> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
> >> its Kconfig symbol but the defconfig was never updated (which breaks USB
> >> on a number of Qualcomm platforms).
> >>
> >> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> >> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Cc: Vinod Koul <vkoul@kernel.org>
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > Thanks. This was sent on the lists some time ago and since a week is
> > already in pending-fixes. Should be in coming RC as well.
> 
> Uh, now I noticed that due some other work I put it on different fixes
> branch and that fixes branch was not feeding pending-fixes. That's my
> bad, I need to fix my workflow.
> 
> It was in linux-next, though.

Ah, good. I did search the list but apparently only lkml so I missed
that one.

Johan
