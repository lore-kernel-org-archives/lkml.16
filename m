Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE571B0434;
	Thu, 22 May 2025 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901768; cv=none; b=nsFYgg3tHNISueBXNqIn5oIuEICoWwxRZJU7ptB3JMF6Ny5SQxK3YgvmggZpMphIEQ4x8EncYGo12k32X5Ff08qD7w5cZYqEHWQqvRfTlb32OpOUtWLSlxkHuxWrSo7eRkG2WgC46lNTS+V6Bb8ddBCDqB0ENz+A+lTwL3jD1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901768; c=relaxed/simple;
	bh=KMc63RmTzPcR/81j0drv6M/ddsUQd+ajSyxtG85Ui/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jwhocu8oNFwGSdgDlI4X7CvxJeloAIHNIyf9w51NtPmWGkMYFPeXCdu7f8NAQezREpPLU5YD/cB/wFFqCfBt7JzIf2/gm7G465nA8EMYwKHIR8UYQv7razOOTsG7phwx6judTEdqKeLxaeYggCFYaBxBzGK25jpOwg2+7+GyZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7akfoFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7akfoFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931FCC4CEE4;
	Thu, 22 May 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747901768;
	bh=KMc63RmTzPcR/81j0drv6M/ddsUQd+ajSyxtG85Ui/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7akfoFnEQDybY3kmBGiab4XMcKqhRgGaO9Xcn4WMAmy/KOo6Ov5FJhuHE252+57N
	 wAraR4i7GdUapYu9QH27lm296PjPHXaadys2oIfaj7yXrYM6ah+H1wIOGEeDcx8ohP
	 iswaUGq3uGaMsJMDtOUzfUWnq3r1sioi3pulREExlc+JotF0JVcKDrQrv5X2QEgdM6
	 KvRJSWjDOyMBoTdU6ObQhtAyHtfmEkeZ3jc8bkDOfd4Mh3q6SpvFG5BPnJr/y+dST4
	 XlfWBTZ2fLOndWe8HKk/XMu7WXx0ekIWjcf7GYEYTpyfvsJfbn+mTuZJxD7gyew7gF
	 mmAh+/recW7aQ==
Date: Thu, 22 May 2025 10:16:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: imx: convert fsl,dcu.txt to
 yaml format
Message-ID: <20250522-practical-beryl-corgi-be233d@kuoka>
References: <20250521165310.307339-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521165310.307339-1-Frank.Li@nxp.com>

On Wed, May 21, 2025 at 12:53:09PM GMT, Frank Li wrote:
> Convert fsl,dcu.txt to yaml format.
> 
> Additional changes:
> - remove label in example.
> - change node to display-controller in example.
> - use 32bit address in example.
> - add interrupts property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
> ---
> Change from v1 to v2
> - add Reviewed-by: Stefan Agner <stefan@agner.ch> review tag
> - add interrupt

Thanks for doing the conversions and for review from Stefan and
Alexander.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

