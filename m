Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EF1DA61B;
	Mon, 21 Apr 2025 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745249747; cv=none; b=ZX/Ub4lPEKoZDXQWp7mIbnHrsTZV8WLrM1RYOlpJ0mFrifXjvuI1FNMY0I0+KnYfFhHETzSYMMrzIdvfMlAmiky7MJFwcu6alK2whK08jewP5PeUeBRQqebBSX+yISSmSvLUmv9LOkzgVTOG7fU4+PrHt8LCneoT6EEKsWvAxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745249747; c=relaxed/simple;
	bh=CNcB+iCvJ2cwygcDuB+sL6/PpkRT2R0AC4Opt0P+wZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geH/faP0VNuJdlQmIn68KEVSUnGUPjCF7ngqRyISlluN3e9F2VRKbIIACJpx6TrTPZQuF5SGCIBpR93q/jdfhj1hcD018cf9Uhij0w3LErAj9691Q0Z/cCmy4kd7Wm57Q6Q6mGoxzXoIGO7LVTJHkBSRAXuNMMs1//so6qbtC9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luyQ7B4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luyQ7B4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8701DC4CEE4;
	Mon, 21 Apr 2025 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745249746;
	bh=CNcB+iCvJ2cwygcDuB+sL6/PpkRT2R0AC4Opt0P+wZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luyQ7B4ugsLZEkcEvRDvCYtKngIAPUNJ3ra/MclmXQCfCzUyYWSiOx+Dy26TaflBc
	 wsJbDTLGaU+Tih4pdNOvoUFF1sRnUfymDhBzTz2hS2mQ05xXnBWsQLhRvtkrniFiYG
	 1yN/i3lPVIvGF7sJ99p93/M/3sleWsqjYVnEehNgK8PtUgccpm2TIWs0l79w717x1L
	 zmV2/fVl8itCllUUupT9VAegHm7JqlECG0Ko6gIA8wli9C2LBTar+dL4y2Jby1yBia
	 Ha6aBTGC5rDWpd6NKC96Jth35B3XYN7sJdEfrlq0LVDo1mOO0nEho2gR9dyyEgebk0
	 x9LI8aM3xSj0g==
Date: Mon, 21 Apr 2025 10:35:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	Larisa.Grigore@nxp.com, thomas.fossati@linaro.org, S32@nxp.com,
	ghennadi.procopciuc@nxp.com, tglx@linutronix.de,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Add NXP System Timer Module
Message-ID: <174524973711.2547826.10808274774618846859.robh@kernel.org>
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
 <20250417151623.121109-2-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151623.121109-2-daniel.lezcano@linaro.org>


On Thu, 17 Apr 2025 17:16:18 +0200, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,s32g2-stm.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

