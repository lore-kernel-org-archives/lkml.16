Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB211F461D;
	Fri, 11 Apr 2025 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391387; cv=none; b=SrWgs2ribOOwwHVO9zsXFr7U9BfQF0YdqsCRXmpYpTwxKOnQxbIXxSlIFObF/rd307glh1PBNalY2MZAO8Jr2KKnKgXwRQidSkJtaRC8nb8yCW4F0LqhxRI0N/Hia/yljM5o1u+khywPMCLUMwJOpEdhYHv38DdJAM6pwh0Yg3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391387; c=relaxed/simple;
	bh=CYf2lwADdkdY+jMx3e4q4vSSDlVFa9/AluyS7+Ilp+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZu4rVigAUzk13bUkqDfWi1PeFnfbHxO08r0xQsCvhhRRzinG1mDo+NxIijh1K45YJsdb1G5YhrUDoEfAxBV2q2eMdvFJ1N8jyh9MLc2egFpKQJ2DBk2HH9kaC3nQmOL+UgLIO4eVcL5aecFZ8JtONctG5vo4vkpVCcyO2CMPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHD9ESS+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHD9ESS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8125C4CEE2;
	Fri, 11 Apr 2025 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744391387;
	bh=CYf2lwADdkdY+jMx3e4q4vSSDlVFa9/AluyS7+Ilp+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHD9ESS+Wwm07AxSNelkTJuvoioLtFD/zyYbdBJegPnHeWQW4ILRIfX810X/SF2Th
	 mqBsyyHWBxewvFX8KzEphYORGbHG8XRsaZAQMKrSBUEEN/5EgNVLezQpNsIafBYo5Q
	 M+96DadKU1NiZGtkOJLqQb7P8yyJ5CRFKnn70nzMl1NgXaOA0gJVydU9O0TEHelxbo
	 OMBMgc/Oi7LMLXoNouhMUfIT614+1KptJAbBPCHzdRoZzlldf6xdYdZefJoYZ0a6bh
	 ZAHfjBt/oj67vxnb22tW/XP1245yi7vOlGDIfSQ1M2nWeXkcyRg0iRJLbNyMY2u6cr
	 mYLK13XvZDIJA==
Date: Fri, 11 Apr 2025 12:09:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Will Deacon <will@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <174439138531.3430719.4031301893879549125.robh@kernel.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>


On Thu, 10 Apr 2025 11:27:42 +0200, Patrice Chotard wrote:
> Add bindings for STM32 Octo Memory Manager (OMM) controller.
> 
> OMM manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 +++++++++++++++++++++
>  1 file changed, 226 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

