Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F79D218EB1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462239; cv=none; b=bz9X2V9i3iR8ZsXraqEH61xNJn+gHlVoatgK1SP9O8F116IZA7+B4C9TjBUkImmHSIDBhIThtWVfml5vxzGRbt76dz6dhe4XE5/lpvvwuK+VQLwcMH80FFEFsBomTYSakS+DeneHQaWMMK9HQSmCZ1eh3Op7bKIgGZS96EL4+xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462239; c=relaxed/simple;
	bh=pVQoY2tMvY1bG+KKCYoQBM+7JiHkA5uoBLgsR0UXjf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9D/hqzOg26ZDzC7jTJKXkr5PbzeUqEVajI1GANQqmktHgtfL0k4CLwjGfK6eA6NDA85j0Ua5Y2ZLUBmcpCgNPjft9dmLStrNfB+pwfGpixCe4jIVMO3Gw7Y2n6l/DsT4glpB5gKdBZ5fxcdTInqktwQrURarwPtV/kDjkfpuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCfi0B6U; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCfi0B6U"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36748920cso165976f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462236; x=1749067036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZkzIt+VTNDuOeuHZJXYBs4wfX/HzzJDRDfTN1kT4V4=;
        b=JCfi0B6UVftMUrPg88K/tbg7gcIb/TByL6ZVTPSwsnAQXuTUJPd9if8Fy79+nVD9c5
         wZ2BSUPHbi44tu3zFFZu4MWm6PwIQwARKGKbiO9FbTqKXKaH7yc+kN344C24BZyEcLyK
         l8GIRZJbTcpVp/hCzSALzzS43M0WDTSZu+87KCLHrOs0G0bvSQOY6rpuTLE8ndD2WkeI
         od8Bl8wDwHfGJmT4EJQ1Lc//UNvYMR3slCvzOr+y0wkIrJRsTLrqEOwFmDWtoP8luZpy
         ILCTxNK13Qfv0F7VCbYDfzo33jzQPkpxJVw3QXDjhDqgQulBp7s+tP7Lnk1iY0C6GutU
         NYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462236; x=1749067036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZkzIt+VTNDuOeuHZJXYBs4wfX/HzzJDRDfTN1kT4V4=;
        b=TljVtay/VKUCwa5THM51+jCMOZJWr4/dhHzBj5CQ6XEwNe9tK/gvimErd3FYSzmquy
         j/AWKwIKxt+Ch2U/O110xI3+3yKPqz8JdvsIHYuZD3l0AYSor7/NJeIRY1ZXUPHvcWRw
         9pvavt1Y7C8k79mtlGR9/YMjbto085+wSa5V4WeAbNpIvt2t8PlCpMB7ko0D/fOIT8C/
         EGOyZynhWUco7og/QxoxEsRHLGmPDw6QeYBFX+Y+UbP5ushML3QvEh2L6X0qQLssJWVX
         qj11Gefmb5T83NT/pe1tU1tpyJyfNxF9oj2SiPXJvNFbb/fLshi3yu3eIDOt9QThwUG3
         4epA==
X-Forwarded-Encrypted: i=1; AJvYcCVSrkzEhw+pDrNnINC2Iq8qSJMbbztNUfqcqiNn6XOb8dFOeX3qvzW2uUJWFm7iANFu098426Vp2erJEm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+wp2wReN4h33a4FkF3XAGww5LokAjr5uxBlYCBtt/YX3JvL63
	XeQXafNvWqc03EVSA7imSwoxIes6u0SQ7fRcBkcrLO0KRI8UrqyxMqlQsv2AZuimZBg=
X-Gm-Gg: ASbGnctakNymZWL+JKWdnngg0cKhBb9yDnXeLGCmiJTH3lKnkl2UX5dVZ3XCa13kfIG
	WAYMXcV/pc1yyak+VWgmvUNCP72vz2etS4AqnGe4GSpiVqEoknOh3xLSidxoA7y3q+fk3Jb4tbd
	3YFIaHZk8clV+rFJSg1Nq2EOckxDYKWAuOyzA44Asm5wmzYO6dp5l8TuGpO0fDELvF7AdEqRsZf
	ZvdFMRbJlyfoeG+CBUwB5sz3lF2UHUKfUmvBZXqnoR9dCvPPrPfwEZEgmEm7za4TDjgEFcytuqw
	bg/y0gPAOU2pFKX+FX1WS/UfjgmAFZDxLDhbdekF/YvbBg9VmkoXWmeu3GTmygWKpg==
X-Google-Smtp-Source: AGHT+IHIxmmykQrqu735nSLQ1ET0rx6h2/v3wuHEtKjqqdqG51esqr6GYjEdXnpcisfuQFGupRBg5w==
X-Received: by 2002:a05:6000:178d:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a4cb43dae1mr15437245f8f.7.1748462235728;
        Wed, 28 May 2025 12:57:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3bc1sm2360397f8f.99.2025.05.28.12.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:15 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: [PATCH 1/4] dt-bindings: usb: Add compatible strings for s32g2/s32g3
Message-ID: <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Add the compatible strings for the NXP s32g2 and s32g3.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index cc5787a8cfa3..400d885fea96 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -24,6 +24,8 @@ properties:
           - nvidia,tegra114-udc
           - nvidia,tegra124-udc
           - qcom,ci-hdrc
+          - nxp,s32g2-usb
+          - nxp,s32g3-usb
       - items:
           - enum:
               - nvidia,tegra114-ehci
diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 019435540df0..ca677d1a8274 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -21,6 +21,8 @@ properties:
           - fsl,imx53-usbmisc
           - fsl,imx6q-usbmisc
           - fsl,vf610-usbmisc
+          - nxp,s32g2-usbmisc
+          - nxp,s32g3-usbmisc
       - items:
           - enum:
               - fsl,imx6ul-usbmisc
-- 
2.47.2

