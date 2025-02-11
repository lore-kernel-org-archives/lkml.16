Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887591EF0A6;
	Tue, 11 Feb 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262603; cv=none; b=HpGkg0EDNlA+ecUO28FZz0GZssH0Xyy1pwgO7x0+RINRW+tGIFQHvyY/RArrkeTEkseRwVvGhUUu5QEskjeo15sgVIAH4F/5KGqmH1mCh6L42AiZ09hXQzh1/yzvD9M95q4hu44h2nF8mC+be+7oPj6+8pMPLepc+qXNTPKIiUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262603; c=relaxed/simple;
	bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtPW/HYBBnrqxQ2BQdPxFRdBpJjQRXttRmukhPO2XHpQ4Ew6LB3HyvXXzCmiZJs2wzB+DcqqhjxmTF1nebjbU0Kyw0nnyqx3RoJBPZ9r8jKcEgBJVraBr2ChJlP9STXYlmf6aSehujInb6q/H32wKVE6YjgZqOvDyC2/tfubhls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPsM920z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPsM920z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BD5C4CEDD;
	Tue, 11 Feb 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262603;
	bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPsM920zDczb0Yxbv7ZH2WHn+G3xOMFEpF64NBqd6gsSIm5tbxc1IKsEdAfvHv2Fw
	 0W++zDfDwxRFm66KqDgAtlEydhrenhMuobv6sz8L+ACiLe13VptrzGPOWk5z7XADrX
	 +3cgoSS6WfiH7G5PmPuX+HpYdMlTM+VbPGejhQZOcJ4OdMv8h0VICBos6cZvJDU6Y5
	 IVe/TmIqD4eHPMzO4XKk0YkpPkCe2gs3S8H76b4tmE42OXc0huuELbovx04aoD0Zol
	 DoTkj8SHhx8n8GuOJgYIGT+upF+Q78k/WbBj/LcnUgUzVZ7MEQdhHIa9WF66oXtfq4
	 Fw2UlaZeNpYhw==
Date: Tue, 11 Feb 2025 09:29:59 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8370 SoC
Message-ID: <20250211-judicious-tentacled-chihuahua-9bb5b6@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>

On Fri, Feb 07, 2025 at 04:18:30PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> This new compatible is needed for this SoC support, as the other

You *always* need new compatible.

> existing compatibles for the same GPU architecture (MT8188, MT8192) do
> not match the required power domain number.
> The other compatibles (especially MT8186) cannot be reused because of
> GPU architecture difference.

Just FYI: you must not *ever* reuse compatibles. What you wanted is to
mark devices compatible and not. You claim devices are not compatible
because of this and that.

Please fix the commit msg because I am afraid later people will use it:
"I can reuse the compatible because that commit msg was acked".


Best regards,
Krzysztof

