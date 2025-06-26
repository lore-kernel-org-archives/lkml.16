Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D121CA08;
	Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980443; cv=none; b=Ms8zEs/exNWPy4+bSA6PkVOUx2KtAIu5xOURweLi8uY81AlK4IRmTlGymJwBj5Doerw5i3fyU+E1HW8gnJ/Kqw2ii5p1setmZTpvneR7COzOSbuzXjtZ0l6u/x09X9XjnFbmxPpk25LvCxRsnql/jMqCFTjaOz4wnc7FZwcNKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980443; c=relaxed/simple;
	bh=rGd8vHm/pPWBrQU2pyGvRYmV2BAuKK2EJhchFvW1jhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A59/THExVsr1gc2di1Fw5EfjPyFWdVxPfOPKz66zmHnFxX5HcGbU0c0krzcRwnjs6uW+P6ArNUS3M4f/QFUFRM/riP9/j07HqSrB82HMOL3MKUXm9IYypx4AH7D3Fyo93XHbs2teIcAn0J4wtAJW+6SjbpHCU2UdDyuWFJEnNdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7jYLF0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7jYLF0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C547C4CEEB;
	Thu, 26 Jun 2025 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750980442;
	bh=rGd8vHm/pPWBrQU2pyGvRYmV2BAuKK2EJhchFvW1jhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7jYLF0tw2pR7Hfsb/eeM3tS6+x9BiYkO1MmXkp5lMY3wDl7vxrlGP+jyGJGcxP4C
	 /un5N8u6PQXyfXvbbkWd5hIVeyO6Ci3gIqzfKWetXWhMmQodR3EaWB9HfKQMlfIdwu
	 fYurMq9P0VUgvlK2EPtT1gj9nkaSIeZ+rfuC/eXMbQGS1n7vs4BxkIO87xb95mPqNQ
	 g9yKKW/csMUMnElCSTVr6z45DixTZ84TSgC9as+/BG7Ml6athlIiVlWg6bUDyFqQl0
	 4s4wPtKxunL0/ZR9QIXCXgCjNEZ3MzZXi5BlUTaFcF3Jz+W2nhBuyAvpdJ9plcGF+q
	 4QmfjxWg/hpDg==
Date: Thu, 26 Jun 2025 18:27:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: Add Apple SoC GPU
Message-ID: <175098044101.1398221.2403754383485344517.robh@kernel.org>
References: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
 <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sgx-dt-v2-1-fb2b7d1c3ff7@gmail.com>


On Fri, 13 Jun 2025 23:17:07 +0200, Sasha Finkelstein wrote:
> Add bindings for the GPU present in Apple SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

