Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D31FDE2E;
	Wed,  5 Feb 2025 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780792; cv=none; b=hiJsBPy8SwuugjkqjVt/z+lYyJ8pohK8sUuG8lzWECKfFPYTCjE37Q+WYw96UUOkcCIHsOIpl+hn18Ewnt2yY3Hnau49rodQ9x+iB0eG7/rF+eWfDdWrZWiQ0gkxE6wz4G/4koquySLeKZVGakohMK6okKGuYdZjfQ79E+v/Ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780792; c=relaxed/simple;
	bh=RZJ+o703dCnyn+DGJQBzmv0okn1Q4nOsGUDRznitTNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkDfQxmdMvTF+az5J8tTm1VWq/tE0OktE/YZ7VATyUSt1p6AWiar3UhcgbkJfvPcD/N7cAxO/scfNHpMtsQjFF7xOojfLNXSlpeBb7dqgmaZE+4tcX+ROXM1I52NASmZayx6nZRv0euG8FETgbLybM8a0zvVQqD/hf4o5i/tcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufT6cP6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufT6cP6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74B5C4CED1;
	Wed,  5 Feb 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738780792;
	bh=RZJ+o703dCnyn+DGJQBzmv0okn1Q4nOsGUDRznitTNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufT6cP6quBlHFB/mc66SetiVY2Qf07vrk3Lc0jGhQLIt4Y9cphNj/LQtJN09H8U5A
	 vzC5ptFacPMLSWJwhTGaJpNpdFHEFJuwHwc6pKm6EUjXX21ucKBtKrzBgKEGr72+aE
	 KOqsEbOxXChmLOQkhgW0SfIgFCB9jG4J20jbLowNf+zgTgopaQ68JweHx6yZVz7NTo
	 NcAw8Ae2AHeB+f3gRWZQJyQ72qD1QTNnIiyBrAMqNTH7HIQdYsPBHQ+fopzIdZoTs7
	 vgXlR8iJ0zhsQt9WWdi8MfWF1dpi5CqadCfo3M8BAC1priBO8pVw86XG/E0Vj/DaVo
	 zKTe8VvLY0Vvg==
Date: Wed, 5 Feb 2025 12:39:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <173878077870.2290384.3805470934352312489.robh@kernel.org>
References: <20250109154149.1212631-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109154149.1212631-1-lukma@denx.de>


On Thu, 09 Jan 2025 16:41:49 +0100, Lukasz Majewski wrote:
> This patch provides the DT Schema description of:
> - powertip,st7272  320 x 240 LCD display
> - powertip,hx8238a 320 x 240 LCD display
> 
> Used with the different HW revisions of btt3 devices.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes for v9:
> - New patch
> 
> Changes for v10:
> - None
> 
> Changes for v11:
> - Combine both separate dt-bindings patches for powertip,st7272 and
>   powertip,hx8238a into one
> - Drop the quotes for in "title" entry of powertip*.yaml files
> ---
>  .../display/panel/powertip,hx8238a.yaml       | 29 +++++++++++++++++++
>  .../display/panel/powertip,st7272.yaml        | 29 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> 

Applied, thanks!

