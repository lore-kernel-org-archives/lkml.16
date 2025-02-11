Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749921EC00C;
	Tue, 11 Feb 2025 08:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262620; cv=none; b=PC+yRPlkd3w2zY4+kWsybX+T+pyxJejDZb8Ivdc4YE9UVBmW84sopAQJqpEOta9Y/hgiX+HEA5EhI1X7B/KTYD/NwWTUpyHCtYkYHI7NmhcjkBwPOuOoDYThzUKC+0AzWlKuAMcy09/A2boq+wevtqgt3tSrYaW0EAzzBqwUJN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262620; c=relaxed/simple;
	bh=38hk58Y0kLRwemhQaSYbq9+FRPzKOCdH6VSASaua6m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=op70emM8otlTDGBQ6kOoc1/uboQdUq7IsLJ0+EJ3iu01C9BZJQyK+cgWZ7IR56V6pApkUJHUBHByHEe+idNCnd6j/EIm+OBAJjtET8VaTonAVx+gUBlI7UN48cOAAheMb3cdKMUqdM8wCRskl5zzaQZqEqqFKtOFNjGWJavxnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5mXKFsM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5mXKFsM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A9C4CEDD;
	Tue, 11 Feb 2025 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262619;
	bh=38hk58Y0kLRwemhQaSYbq9+FRPzKOCdH6VSASaua6m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5mXKFsMYV50EQ5sGGZZgzh0OmE+815ZQh2PjS3t8fd41NZaOpuv0f6k5iFHKlitW
	 49yp1lfNGJ5OOSASgGRUE07QC/RMizUsUE2XUxlfp87lgzKBmTgPMQH+5HLoZwc7rJ
	 EmNRTRZ7+LCVvGA2lT43pEDxcQA6bOjjadbSYyHo+5Dj+olTuDf4Sn7OVrRcbOM1yq
	 Qc+Z0qFIrDaoRQqvQGH/HfDbdJdvzeRx76+Qzjvl9CUD8F0eSxVDGNPamAOG9Qsyb1
	 SijNNUevS87VgRK2t/3Y2ouT5EORaVjWLgER0Do8oH7U+EHg/4cIY7URzMF6X3YmGn
	 YOewXlG3oo6UQ==
Date: Tue, 11 Feb 2025 09:30:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
Message-ID: <20250211-sociable-buzzard-of-enhancement-dfd4f0@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>

On Fri, Feb 07, 2025 at 04:18:31PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> with the same platform data as MT8186 (one regulator, two power
> domains).
> Despite their different GPU architecture (making them not being
> compatible), the MT8186 platform data can still be used for MT8370
> because it only describes supplies, pm_domains and enablement of power
> management features in the panfrost driver.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

