Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205F1EE03C;
	Tue,  1 Apr 2025 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743548103; cv=none; b=dLMhiUDjFZVitQvrahOm7fX2DF8dkDfolQtZAKlSmL3qiqnj97c/D0C+dt7s8q0D1Q9PS1BbuER4I+x9ZPWCNbwbKCUYbwW1A7+ix6qZpCdNhZyP2FZ9NdRD2rxPYbZrwrobhU3qMTdh22dXiV9ynZe5r184CNptSAkkaglVH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743548103; c=relaxed/simple;
	bh=8IOMWPEHaPa1SIeTc6T4y8WXaQdFNkoAbfKYYZNVMu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oL2QuyQ9LCMbjOScc6qszX86GN0bqcM+unb88WMSUDe8PjxfEUqT2QtPZg7AYkp4KMjEwuLqg8PcPO546jQWagWbOk3IWsodTWrZXwu9sCb5xxaB/l81lOmYD0H5pLpSXFq1nUj2a5H/nqB2CMSxLLFaMJdOIvKdly3sMrbfCWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqrNnDWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqrNnDWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13551C4CEE4;
	Tue,  1 Apr 2025 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743548103;
	bh=8IOMWPEHaPa1SIeTc6T4y8WXaQdFNkoAbfKYYZNVMu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqrNnDWxY2ZrLn/4600euCHu95ymOkO3q5ZWlBqFTZ4Wdy2U8SaXNf3xOGkwmyjM5
	 hbhFbH2Il1SsY81+DA9903USQA6+eI2IUCtWZ9hN/m0QU3uzqUGkTrZol7rXAdN0u+
	 lS67Ej+kGUDLeC4NaCuK9y0AUnvaQk/Pbj/9gU5jTeDoM32kh2umdBSo1W3I2i3xxU
	 5cyo3fK49DoJTK48YimytvdyAza+hn/xrOzsmEvkwWlEWClkn2r0gwgauLMl9hwU6h
	 ghNqoH5uYqVm5aXw2P5qAWFVRnV1XhkusXaYXsxbUhFIdoT/CbQuqiAuPTMVDCDuIL
	 7jPs0sryEZ4VQ==
Date: Tue, 1 Apr 2025 17:55:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: writing-schema: Explain sub-nodes with
 additionalProperties:true
Message-ID: <20250401225502.GA27530-robh@kernel.org>
References: <20250331081345.37103-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331081345.37103-1-krzysztof.kozlowski@linaro.org>

On Mon, Mar 31, 2025 at 10:13:45AM +0200, Krzysztof Kozlowski wrote:
> Document recently introduced pattern of using additionalProperties: true
> for sub-nodes with their own schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/example-schema.yaml       | 15 ++++++++++++++-
>  .../devicetree/bindings/writing-schema.rst        | 11 ++++++++---
>  2 files changed, 22 insertions(+), 4 deletions(-)

Applied, thanks.

Rob
