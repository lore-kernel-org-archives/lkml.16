Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4A1FF61D;
	Thu, 27 Mar 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062202; cv=none; b=H1IWboFgCBDh0GdcaMq62xmZlLnxZ7fg28YpzSY9KfdYEhjI5jjRtbGIzJmdf2fA/zXDqUaMDDyFNAlnd/PVzo2UPzcK24xYksvsN1hwzBOPYDYClllt8dzE5AVf20HQvcxq7/qwOQqqBGZiFA3SGyQ8JtkVkTq8Ovb9qHoq/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062202; c=relaxed/simple;
	bh=9MOdzY1W+VK84uZ8tY1V+cmmJLQHaZQN4UG+HUI98rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mze686rHB/Bd1FZagCAE0N7JbSQFr7WQtaeucJy2d7OV6Oj29J/mG+iieL9J+iFpf7lFSpAci3+wbbuxJgNJ50kG2PWJsEg4d/+f7UB2S7h1qpBkPwe+sqro7Zxzjuz6h3noOf3o7ZiMfk1LaY9P/fRNZLwxWSSchnvtIfFG0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erB0l3R7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erB0l3R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAEEC4CEDD;
	Thu, 27 Mar 2025 07:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062199;
	bh=9MOdzY1W+VK84uZ8tY1V+cmmJLQHaZQN4UG+HUI98rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erB0l3R7EZDRT5tgRtDDgHuHvjoMgzFzVBPut/hNLKYULis63NkBUwQ8amwI1nSGY
	 H+IAjZDBV2smrpYpmatjq595O6QZIhurrBae0x9QY/tSlZr09+uipP32v+6rcJpBnx
	 uDqxnJkDADTBj+t0srgIwZQFsY/RD6LNfaACBx8+UXOrkbZ3I9RuzbYBr5gTWhWd3H
	 ZZyb+TYdSqBaryp4F7vmgk65ssy/xGwpZ6de7mO+AN3QRyizHBhAg+mEpGJBB8Ht7Z
	 NDrScMHw/vxq+NwIT2Ag9iiePE0AdMOiK3uZ4dkw/Ryz4U2EPxi9zRyaCEnIw3l73F
	 3ADvX2kN/vvLg==
Date: Thu, 27 Mar 2025 08:56:36 +0100
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
Subject: Re: [PATCH v5 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250327-beneficial-crouching-rottweiler-90d0e7@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-2-e4c46e8280a9@imgtec.com>

On Wed, Mar 26, 2025 at 04:48:22PM +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

