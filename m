Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2DB4A00;
	Mon, 28 Apr 2025 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825070; cv=none; b=jHPWDDKscZurAtaCQQXsQRMMEVMgOMIun+QblYQ/LQosEncNTpUFQ5sgwKCU467yLAFxi//75Gqnv3+C6mWSPL35aKkBmNQBn70UZhblnaeP5fi941RfFrHmjk0xqJjcTRdJ2W6DPr8ZFbn8Qy2hXPlwLfglXFUuYA8ilXgzhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825070; c=relaxed/simple;
	bh=l2Q0gVsxUqyisBJ2iI60NbNxaAxhgA/lnFVxrp9bRkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THH4RkMKiQHn5xGFW13uMSwQ/Kj3sJTCB5ogTnViX3ea35R8R+U/76tnTLLDDzDAHo+XZ38yP8G1Nry8MiYV8taXdBq1RSNH8AUf4oIOajOwkbh6r3FxZfXBE1kcNd+DVfE+2ZOFuC9iLyyla7Bfr6oV2HVJJek+SYvuJQFcKkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8mUjBEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8mUjBEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F53C4CEE4;
	Mon, 28 Apr 2025 07:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825070;
	bh=l2Q0gVsxUqyisBJ2iI60NbNxaAxhgA/lnFVxrp9bRkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8mUjBEX3qghyYxxSLaMxhfEAUelgqIa9poC9QElj8JHQ+ydGZJfRC4p7TfqmBb0N
	 o1/MTx3M6+coi8AxWIslo93Bb66PERi7D9k44xGPLZflp8SD5SWrvyMFBXbGk+WCJs
	 5MmxyH+s+Dzdhr8pi3xbMM98IsTSVDLXUm7vGUiTHxrZJhb6++yPoRHTWhNKadFQdS
	 c9Vm3ENcA8+LgKdrPlT6Lk3wnWvvd2XrrkS/oLPGvot1Fy/zIfXyG/2SuSpCDzxvQ/
	 c3bXW3WNYvT8+G456CTP8Zoqd3jY0dFsxdKmFlY+e0uPH/EXcaeAjOH71LillOekLR
	 kRsa2sUwZednA==
Date: Mon, 28 Apr 2025 09:24:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 01/13] ASoC: dt-bindings: Convert MT8173 AFE binding
 to dt-schema
Message-ID: <20250428-remarkable-authentic-mink-74cef6@kuoka>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-2-wenst@chromium.org>

On Thu, Apr 24, 2025 at 06:24:55PM GMT, Chen-Yu Tsai wrote:
> Convert the MT8173 AFE (audio frontend) binding from text to dt-schema
> in YAML. "clocks" is added to the list of required properties to match
> "clock-names". And the example was slightly fixed up in style. Otherwise
> everything is as before.
> 
> A contributer and maintainer for a recently added MediaTek audio binding
> was chosen instead of the original submitter.
> 
> Cc: Trevor Wu <trevor.wu@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../sound/mediatek,mt8173-afe-pcm.yaml        | 87 +++++++++++++++++++
>  .../devicetree/bindings/sound/mtk-afe-pcm.txt | 45 ----------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

