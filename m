Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346AA1A0BF8;
	Thu, 27 Mar 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062158; cv=none; b=CA1s+TxDFXwc6h8BfSTUch60t+GlyzZAsep2AZN2Csi29TT847QAdKuAvbFOtu6a8tr+yhlkyNRbG8+9/O4yN5HW40bk8cV0L658fwzikF9NUIKUcQLxkLBhZWxk1hHODnXB9D9yTbYlStxhQVBDgAosDo33sG1A7nXhddUGgAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062158; c=relaxed/simple;
	bh=XwCGCufdAWY9+XJt03fhUGbNeZ4m9tswVxZeGzrbztM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BC/FmBwxEMe2ZautXzN/bPYWbPaKtcVgqD60oXw10v9Fzdh6tq0+GjK/LcoCTQxnLrAbFAnHakAHWqHLRz929eNv5cKoRKc8Ze6GCoUkAJ5KdL8m6+RfjKtONLIcJBZZZzJTI6Ze9ivV+XQpDKNnBN4okVzHG44uZJ5W7y/V9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcz0RfUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcz0RfUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E03C4CEDD;
	Thu, 27 Mar 2025 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062157;
	bh=XwCGCufdAWY9+XJt03fhUGbNeZ4m9tswVxZeGzrbztM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcz0RfUU2oa+EZHU2Vp0WF0C2DVMOMzOMUwEtb7hV1R4SacNCyvy/2GIb97V+uKtb
	 BidzlLAIKlWG6R1wPA+K7DOFCQCwT6iNSOBFFRSbwgoCI/H0TJkqESKdxMU6BJ/+jK
	 6LFOdaEKlV1275mkmIt04r4cUsTZGMACGN28QzaPWBMUYBGX6F8s/oHpDK8H0KlvFB
	 ahnNpwQnmpdGFja9fOdgEwKkNmgFwLM/DnmaNZFtApJ5H9bLprpDpRtwLBH+iAzLKs
	 wfquhQ5C8xGa2hRcz48VNQOh2dMweFDr6RPXbM4SK2TOPGKF1yFAqQ+9+gziI0MGBk
	 HVIcZgydh0Jjw==
Date: Thu, 27 Mar 2025 08:55:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Message-ID: <20250327-pragmatic-lemon-flounder-e2936a@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>

On Wed, Mar 26, 2025 at 04:48:21PM +0000, Matt Coster wrote:
> The first compatible strings added for the AXE-1-16M are not sufficient to
> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
> string refers to the entire family of Series AXE GPUs, but this is
> primarily a marketing term and does not denote a level of hardware
> similarity any greater than just "Rogue".
> 
> The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
> only uses a single power domain.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

