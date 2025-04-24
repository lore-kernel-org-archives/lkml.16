Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8752518E1F;
	Thu, 24 Apr 2025 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477824; cv=none; b=quHtxiGN9CxqiYMrBAHjyERyROoKcO6MYTelDRjNlT1H1+v1vpjkYmId8fXBsksn2ufeq07DBX8RrN6YEulktdEuE3zCGLCdc4HX7esMqIY1OWWTPTgi5ZBGc8Mtwc7dv+SOmqzYHVBF3cZNvULB2ETwS90qCfiYrEBooTDfxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477824; c=relaxed/simple;
	bh=zPnLokL9Enz6v0drdyRj8ySVfYvqIPvXAh+2WZuW1zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY7H61mwBALnpZKIqBZNV0NLqGkRHYy02LvzFvD07LNNZib8G8h55OpgQNZ3TTLezTHxMfnUF2lB3+9WQQosR314H0Y8ogIsFt9XhpEBa09idvvh3MYpr04qPqi6ljVNKXHOGJ6S0t+NFgQC+fdV9aa2CyE+ZEh4cnXqabpWGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSnIxFI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSnIxFI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC9CC4CEE3;
	Thu, 24 Apr 2025 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745477824;
	bh=zPnLokL9Enz6v0drdyRj8ySVfYvqIPvXAh+2WZuW1zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSnIxFI1GokV4V+fVsJxeGyERS251Gwh6yUmDRa5Ougu/R0xkaB0lMiwcyIAGt0OA
	 /s5RDb5WGAcsouwzDoe5hdBVb2xf5O2NlM6HF9xEHKeJs1Wei2IH2bgr8qvgwVXQ0L
	 pkkUgy0EH/FZbqo1VlO4uPWXsGaHxvqJEzD5qWEAHFnFygMcxsA0SKBosSwZOZOoUu
	 IqbMlBOa9aqIslVymBzcqpzevDepPN8QQk+0s/cmEXi0v8sPcbAsxBZnoIm+cA9A9l
	 8Kxzk5N9/ZenwLSN4Q1sWSeN1W23eiVrVVEh5NaO4zzyr7F7IrRJJVGEGt/7w/ezzW
	 eedfsGbE8EQOA==
Date: Thu, 24 Apr 2025 08:57:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
	dianders@google.com, hsinyi@google.com, angelogioacchino.delregno@collabora.com, 
	matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	knoxchiou@google.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
Message-ID: <20250424-echidna-of-unreal-youth-9ac5b1@kuoka>
References: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424010850.994288-2-cengjianeng@huaqin.corp-partner.google.com>

On Thu, Apr 24, 2025 at 09:08:49AM GMT, Jianeng Ceng wrote:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof

