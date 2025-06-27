Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB041A8F;
	Fri, 27 Jun 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021612; cv=none; b=kmzlFnUZC8xfGoH3PRiI+ieXFqGPpllxw3cWpEfTDrm6mf4EG6d2X2icEniA3V8BVuye/ECZPiD2aYmSE4b607Xy8XgWX7e0xh+xOt0DiS/ozZe+wwkDFdHFkUxsy8qq/S0y1T/Xa5bzkb2BuKkRH5l31ZMLqIabfscWAXnpKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021612; c=relaxed/simple;
	bh=VCjbvRdf6XSyodZZQyEnO3752BxeuOjhcMPqXymOMWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iXXxUTEj+Fnbd83LOpiFzeXh1G4fNWQBAs8IxwAjs5OJgenMkziknZuK6+uaKEaG0C9Er6eloLavYs/WZlliCVwr07ezu+RIzb2bTkW4BsPtmbIJqSHDXMYqkzPGV1lQFqOB1B1OYoiCEmcu+mpj+OLdUyIs7x3BP82GTsIQ3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwzJ9fZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwzJ9fZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CC2C4CEE3;
	Fri, 27 Jun 2025 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751021611;
	bh=VCjbvRdf6XSyodZZQyEnO3752BxeuOjhcMPqXymOMWU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kwzJ9fZiZW0Z7dWIRbocLMuMAmCxPeBuzff8/2znikaRc1brjLdOwsYYf2XesGt1d
	 duvcWDO8WMkc4zpbViTfwO/sg3qDNiOdTBOn1GFuvls0iP8rAu1Mz0RkaFkXx0Vvb2
	 ge/2qRgFkb66/3uv4nwbwV9pDqZl0lakEs8KP0lQsAJEww0LVJ+vSNSC09pg4O1VXT
	 cE/0Z6NocHUxvdPi8s1MfCCau6V+qftv/mVkKVCekNLTzR3ypRxUJPqSbOZBmTAxSK
	 zVIFkX6ZroP0LjIUo88wDbNQDZtNeOdfBcGR3K1kpUmXP6qWIdIZDT2mT98EDZ8eKe
	 FQ7MnywY0WvcQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
Subject: Re: (subset) [PATCH 0/2] Extend nvmem patternProperties and then
 fix W=1 warnings in Apple dts
Message-Id: <175102160789.6398.6252477701848323795.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 11:53:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 10 Jun 2025 17:17:33 +0000, Sven Peter wrote:
> This brief series fixes a W=1 warning recently introduced with the Apple
> Silicon PMIC NVMEM nodes. We have cells that are the same bytes but a
> different bit offset and these currently result in the same node name.
> The legcy layout already allows to specify the bit offset in the name as
> a suffix but this isn't possible in the new fixed-layout.
> Thus first adjust the fixed-layout cell patternProperties to the same pattern
> as the legacy one and then fix the node names in our device tree files.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit positions
      commit: 6aa656ce94693c8712c004045375e2221b157659

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

