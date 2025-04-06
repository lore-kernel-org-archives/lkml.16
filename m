Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFA338DEC;
	Sun,  6 Apr 2025 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743942926; cv=none; b=BquyAbd/FefluAXe1EbFLMog5Lzj7JrSd0mULR/s0eGa+qzsUNC+RCQrZniU++6qd96AXBzCES5/Qxhg3lGB3Psm+nMFk6BT9Upi82cPtqdB9F9WKFhUoEIPVxonNKRecJM689OSIJUbsaXrc3CZv0UrxM91oo6IqsCnEB5WhiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743942926; c=relaxed/simple;
	bh=jwd+CvfEDtZfTHG883yK1HMa8fhxAm1AgPY9/b8O4E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6fJPQ/X0S4S8tLpZjVWCT532PQPQUzUluNgBWymRkyhQCDSICQjujtAOWdLZHrZN2ea7DP7krX35upYpZPDoEYp3PU+C/EwsKdaDXuGbhHF20QVXThgfnnAgCo1Ttje15FYWNsy81gslqg/79VfX9gbXWVlTucHfdK6RQ1b9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDAv+VQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDAv+VQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C096C4CEE3;
	Sun,  6 Apr 2025 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743942926;
	bh=jwd+CvfEDtZfTHG883yK1HMa8fhxAm1AgPY9/b8O4E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JDAv+VQjV32fa0VTCth67L1pHqocRPfalVuaguxSlhz7dMCa6jJEGf2w1HoPZ8crz
	 3pYO/ZY1rw9g3iiC/1EQPrtaflzmEc/19hjeBCujk39sHiDPrKtELopBzyW9l+3586
	 +vz4w38aaalkrFwZGZWvxR9nJjNgssTYHOWv2P5r8njUAzAK9sD3z5x8T3DMv9QAXe
	 c/2NkYFLi28JbbFonA2rH5z4PMp0mOe4zhP304q8FEqoljhJ7cOoc0hOrQ7utJw08L
	 8Wf2R+XAaZe+oLR/vjF2wWO6M7GkT/diwM3zZI141hhTmhVHYGWKJ6BZJnaTY/H01a
	 1ZDgmopnsbKZg==
Date: Sun, 6 Apr 2025 14:35:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek
 DRAM controller interface
Message-ID: <20250406-hasty-saffron-flamingo-5c1dae@shite>
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-2-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403065030.22761-2-crystal.guo@mediatek.com>

On Thu, Apr 03, 2025 at 02:48:47PM GMT, Crystal Guo wrote:
> +maintainers:
> +  - Crystal Guo <crystal.guo@mediatek.com>
> +
> +description:
> +  A MediaTek DRAM controller interface to provide the current data rate of DRAM.

DRAM controller does not offer scaling? Or PHY/timing configuration?
This binding looks pretty incomplete.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8196-dramc
> +
> +  reg:
> +    items:
> +      - description: anaphy registers
> +      - description: ddrphy registers
> +
> +additionalProperties: false

If there is going to be any resend then this goes after required: block.

> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

