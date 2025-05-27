Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6861156CA;
	Tue, 27 May 2025 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372994; cv=none; b=Ae34/JIQmzfb8XPrR8D/9DI8KNAyQGovQWPecViemUWZ5jbSgBOa47J/f6p/EF1LsNy5QuPr9gZ97XcrvfNbUIwETa6/JSqkz/fmgTpfSAU9KeLKb553sSvu9Vtdp/Jdsn0/o8USkJhkiJLm2qXen58mhzn5uTN7jhNINCDXdNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372994; c=relaxed/simple;
	bh=VHztuzGquOD+tzmQ3R2X0Y1CsGSLa4Jcrnl0dAE1zA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW9pH7AWGV5av+5DjLKfWsWGtwXCuYZior3v1PP/sBMjQFP4wURJ1mPQB6GblmRF+wO4HEW0zzMpSa5/7f0mqaORz5z+BNXEFKyBV8iAs4G6JYG69fhBCZ+Nd2tczLDclO86tYFt5biI7qDSDQqcaO1P2imMtfok23oieMQ8ISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YghCVKUl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YghCVKUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC55C4CEE9;
	Tue, 27 May 2025 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748372993;
	bh=VHztuzGquOD+tzmQ3R2X0Y1CsGSLa4Jcrnl0dAE1zA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YghCVKUl9hFyXOEcAWMkkDdYGp8SioYcnbm6IuRf/5J82kxj4fDCWHoOMzowPH6Lm
	 cFnlHHA0L+AkDCSE9QEsK2hUM+EOUT3cRZmiuNr5jyxE2VFU63VnRicmjqEaG/4L40
	 yzB2iZW8mdnvkUGh1R3YfWapfO32Tz7VNeY9hoZ37+OJpNYYyn/MG9xJAiobeFntLT
	 tWG7yS/fk3CzH/MIl5vkKum0Hg4UtGKOuaG31D0C5U13I1qmQOIzBrBRO4fLMg+c+U
	 THpY6KyKcS31ffbfRV0H9U0K3dkmh9QoBB7yl8JLZVxER126R4pFS4GJybfAFY4inW
	 oNitg0JTarqww==
Date: Tue, 27 May 2025 14:09:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] ASoC: dt-bindings: qcom,wcd939x: Document missing
 VDD_PX supply
Message-ID: <174837299102.1004664.8576380880456043250.robh@kernel.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
 <20250526-b4-asoc-wcd9395-vdd-px-v1-5-64d3cb60313b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-5-64d3cb60313b@linaro.org>


On Mon, 26 May 2025 12:49:54 +0200, Krzysztof Kozlowski wrote:
> Document VDD_PX supply on WCD9390 and WCD9395 audio codecs, which was
> missed in original posting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

