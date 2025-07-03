Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20912EFD8B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555628; cv=none; b=C5U5dWBuCt1lbET7KNKWMMZhll/9OwW7ffQ4D0CdB45F7lZxJ8IQ2pMzLMW/ZrTLiu8AbJ/h9smTYbla5euxs7jedU5+nx4o8lteeH50mdcZOVHcB5KOzjCgnHfnO80k0KEfW1gOXtbB/hQxDQVbVguTvOsy67j/s/kt7Y/RKo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555628; c=relaxed/simple;
	bh=qJgf1RF5GwyM1t3Atw/Q+kAszB7c4DDzNJhbDeMNAts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdE50H4w+eJKOGXGLZEHAN/ncIAAqYQI7wlBNYwjBaWLoJPhWnQlM5DYNd6J4A5uZ86mguKIVOaKshrmWzOkkkrLDamhPs71sfqk1KErz/xCKrMZnNVbPZD8FHJU0i9f3ofDGveBdBftROwUznO7zi4v48F9Gh//88EMAdphCEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfgFCklq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfgFCklq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so11396565a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555623; x=1752160423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=mfgFCklqtoxCLPZy3t+4gjqsCrB5P567O9yGv2ICMwYWYF9p6akr2ozIQo9ulLf4tO
         0PoL5YPOBvnRopNc286PS8bk/YmoBUOcxnbNraLGwo1JAdRZDUXSI5xySfRNPrkwBxBd
         rAYoBG9IxVGiTLwP47thngj005FHJJmrWr3XQi5EnUgPSx64I//tDiSHwqhFceig2neX
         vidUlXD9pV0cQ8Fyu/q6EvRw7p99gis1jmxGWvF2MrUMIZ/Mw1rNSWeK7p2I9HTd5d0I
         pwOGrKytSCpojm6KyL8hDW0Sn3bXjYCePzrzkTq/CXBEkE8SxrXk9DpcrmqfFfM/MFU1
         vF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555623; x=1752160423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhVhsVllegKUMnK5NOGl/rqgDtbDtwFSHzwLKRqIUk=;
        b=ggBIEDkVEXv/ErBcSj1sr70f7CswgyboJuIH8GzA+mVq/AukSciq+dct4w5EJhALU0
         LpvqA3pdW3QVjR6RvXJ0M9XIKay5HfF49g+yNUOV2JqySaLamxZbhRAZpriyG/Y4Bl2U
         lVEb3yNoJ8/3nws5R8mr/h6ojvQQSsSXbgGlBgKwkTK3ALyeno2U6vVKfl2N1aOppowe
         Dc2OzrJoCt+GBMP7iasNRHBPdYxhjln9s7dDUBXKqSp0+IC7Cvv8YrAZRlvkYJLkA7Ge
         gNquePli4cPh1M4qvJsE3ZPZF9i8V8AxM8R3BWRdmGmjC3G4fd9wNErDeqZ973ELosOm
         qy1g==
X-Forwarded-Encrypted: i=1; AJvYcCVN306EC1ebxLkZWakGwzskdsGa+L4bWZBg92BXAkwSs5H7a3BDo/QdEL8RjM5JelnZPamy16UFarV5+Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhKLovj5kALpIvbLe086wv+pC2ohX1G7gKoXYK7bYl5VrAzCep
	HzUZki8uBjve/hodJ+ST1YLF7M05Aj48FefPyt/nsVjLTzV5qYiciC7iMS632GBA4as=
X-Gm-Gg: ASbGncvbrVdF2AMuYd0yphz/DXN10clb0tpvalx8g1MqOxI6DMDzbMDSv21Nz+b9A2X
	s6xc+xxqCpHSDNrE/sRGDLwXikUBFlX2D34gs4yJoo+zSNJEIBrRdUbRfocJSn8y1llwNj0QfJE
	VM/NMwO2M4UfbueWfAOcdQFijyI9WFH3yGciliVKG+XUxaOY4XZwBWELlGWJCr+YOTpV6q7RvxM
	3pRdQMkpn9t/xr7SSAhIS50fJPyKQninvcygcsffwkVng70g5351j4N1uu4TUwQmsu0/6ILX05a
	JHMw/wLSIO9HoTi5Xd1o85e9Y6ML9iXfVsgTGlXKkYiXd+uMZZP5/ytTSJCyXYNJQ2sgpw==
X-Google-Smtp-Source: AGHT+IHLbeEWvDtZyLpkZYq9v/9MjHWg44ua068Wk7HOmNac3d6CS9uj1wvGNiv38jkJSQ0CP6C9+w==
X-Received: by 2002:a05:6402:22ca:b0:60c:39e4:93e6 with SMTP id 4fb4d7f45d1cf-60e52d1939cmr4886568a12.24.1751555623170;
        Thu, 03 Jul 2025 08:13:43 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1845sm10903471a12.23.2025.07.03.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:13:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:13:40 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Message-ID: <aGaeJIjFMLcV8ly1@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-1-b378ad796330@nxp.com>

On 25-07-03 11:40:20, Peng Fan wrote:
> Add i.MX94 LVDS/DISPLAY CSR compatible string.
> 
> Add clock index for the two CSRs.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
>  include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -13,6 +13,8 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - nxp,imx94-display-csr
> +          - nxp,imx94-lvds-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-display-csr
>            - nxp,imx95-hsio-blk-ctl
> diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b47f74f00f119ff1c1e6dad885b5b1e3b1f248a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/nxp,imx94-clock.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */

/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

With that fixed:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
