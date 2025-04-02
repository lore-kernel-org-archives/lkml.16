Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFDF2356A2;
	Wed,  2 Apr 2025 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582686; cv=none; b=NLyInbzUDPY9rtkRzpMZvsy7561AI+FoHEwdx/Mnkgbce0UKAvPTpd9K9krI3AyAQm9E72Z2kNGo+iv+uNyVPPWxOJR6LzTYp7p4zpJ+doOf9U/0Y5eBJWFOH6GSjW57iQRGwSnEOPfFi15/d7jNPSEKZfruty/2crdDCGYoRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582686; c=relaxed/simple;
	bh=L/MG90LSJ63Q/bHuOmvwjbAM0LR8ukk15/QEHxyHjfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL1vJJO+IXNCAjHexWtSYz9x552W0Jky3S2lhkbp9IKQZm0GzXE00cayraV1dAEBYlR49rzzRnFazHAX/0z3chovT8rJ88X9TP3YuP+4k1S2zw+jL0/g/saHvYlNzW3+foYhwGbDJrt1JxIoZ6Sh9S+5rOKPAe7UtbhlzGyOaVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJEUFseb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJEUFseb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6619CC4CEEA;
	Wed,  2 Apr 2025 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743582686;
	bh=L/MG90LSJ63Q/bHuOmvwjbAM0LR8ukk15/QEHxyHjfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJEUFsebw3XsOSdgpyf0TrUNgfNEDlVXFosqQHAbwd5W95A0cFfwwJ1+OdUnFXffT
	 FMvVjIOoAr/bFZEFIbjGk+FFL1IFF84vF+2FkKB0ITM2dSYyzs21UEDgpimEHm2v68
	 Ay/Rphwg/wf+wfdpgq7E0gebtIBlEVWrIjEHeKQEPwsXO8LpUKoUOAsXxZyPAUJP8a
	 Mx5Y+Kz8KS5tB66W+T2BA+DoSX2dQsEmpHZU1FEjZgjlk7RSnSmVQfbtKvXbzIvd6l
	 bCo0pMrdZyx+8DrK0+ukqIkYlqh0MwpHDZojN+FTz+sGPEQvCyXYEzpBZagqNYUS/y
	 6z/pOt3h/SiVg==
Date: Wed, 2 Apr 2025 10:31:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: st7571-i2c: Add Sitronix ST7571 panel
 bindings
Message-ID: <20250402-sambar-of-holistic-efficiency-f778b1@krzk-bin>
References: <20250402-st7571-v1-0-351d6b9eeb4a@gmail.com>
 <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-st7571-v1-1-351d6b9eeb4a@gmail.com>

On Wed, Apr 02, 2025 at 08:12:10AM +0200, Marcus Folkesson wrote:
> +        display@3f {
> +          compatible = "sitronix,st7571-i2c";
> +          reg = <0x3f>;
> +
> +          reset-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;


so RST or RST_N?

Best regards,
Krzysztof

