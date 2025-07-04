Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B41339A4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592024; cv=none; b=PUUR5uFmGaC/Xwtj13LejkB1lojHvgnlBAtvahGeSQOgZ16gfyJl9ANe1VFQZPUj8SMf7K/6GU52uUtsKViMLvZ1H7KL6A7fICIsPnn66ELXLk75PnlsE6eWMU82t26w8OGFR9atFUKyoe+zw16p9lvMiPcR6v0xNjge1P6cUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592024; c=relaxed/simple;
	bh=HdPNF5tvzZHy/U0HDtfqdXSgMT7sjPnEhZmbbJSwPeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLnKDQtgzRCXm2ZRUbzxrLDVZFB64Xf+W/rKjSj3F9sGPxKOoZxqvlWIErOV1SvoJpPRDtp4AMI5XlT0DAjrIuHlCaDs7nN3cSy3wsOlW9eQEpoqOfcwnRRm2sktgNCZ14LZ6rSnyYyzNGHcJG+sxQrpn/iIJbmam+S9Eucqh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9M8fNAR; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9M8fNAR"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40a4de1753fso343102b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592022; x=1752196822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDOdTwjs+UuXyvtB1sz+zfsO9z7jQfbxWc72oZjmuY=;
        b=X9M8fNARfbX+l9vKuw33eRuJGo9YuMzprCWWDnz8MbxiQ29+SMkyQW32juajQl6Eim
         SKp+qnAxPmMhuN08wlQ88/Cg2y16k5qVPWMpfxag8feSQ0dn8D4y02xgxlOA0sufCI/F
         NigYwlsegYjHvZ+BGL3MsKhfm7BNbDy86bxh7NWc7ghPHSM6McCFqLhLyyKTXh/W2ABs
         IIlHg2UmoA8JTXqtRe7EmM2r3TtD+QnfVgZIXH8fmASZjvYqF3Zg79zmxRPf3VITOhRm
         ZUgn2/CGLV46sJqE/Mc9f3lPPUesZrefx7d4WKZRjGrT2Oe50kssgemUuGvJhpjji+YF
         c2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592022; x=1752196822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVDOdTwjs+UuXyvtB1sz+zfsO9z7jQfbxWc72oZjmuY=;
        b=EZUV1wWK6dTosDCk3mYwE2hZFxcadpXW8phi6G3ZSUY6/UEWFO5zBwgmnsp1wT5IbO
         ztiDlJXwmjHMPlzaqZmBkHtcPr4X+honWqYytk3oJDPpulXnJ3NkkWXZmQVB046fm0rs
         258Jy++xmMqNXGt6glhSz8D8QFgOVMaYHw5gD728boXCbalktxFu6dY0DNbHVvcA6In7
         9/USNnBtnV+q2k5nZ88RLpJ5+8qz+8MkKiB3zqKS/vd9Q+zrVZ0phOlIZ1oX2XvuQPdn
         maK7hrlocIW/xhAmypt/wdPk1Hon4iIxGsL7oEaCALMPFAQv3J9cdJ9zwF6C0XTV2wjw
         /aHA==
X-Forwarded-Encrypted: i=1; AJvYcCXB51a/tyUeAktbS2QL/wv/LKz5YW7t/XpCuwGrPr/6U6yVEWkxtWlgSC4PEYjwz0G0epRk9Y05HxQQpKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvx0E7ijUESWWaMU0KrKYGRkH31O6Fm/L7lvN6EvoBaB7Jz4s6
	QKQELz8qTZYE3uNTGalZ/1jhXb1WK9uUdwnreUzM4UBysGkyvIcMRnAzodTqHNQGolc=
X-Gm-Gg: ASbGncu1f3Vh7d4S6khPW0RbAtCLF1HwruH8SQ58P8lKjpmjFkuMkYid47AsUzVf7Ef
	mDb8/ig75W6g6af1s2p5/oyIhHiEVAa/z60llhv+Y2MQ93yb/hmWZDPBTY1ZR66CUqWkp5RpXzS
	plGB9bYXnVkEx8U0nx3MEPEjbzOplAShYI34LRS0lLcH0rcrd0RRd/lBPe/muNVcbiUAnACrpAr
	3k8V2d+s8lhQk7+aeBdHHcK2ZFVItfuw/HX0kgKlgnLxFrYMaWjWV9Q0VoMPENy+JKJ2IztpI4Y
	ZpyLUZf+sL1YTpdMhcYKNKDcUZ37XyxB3+A415cHgWUNrDfI5a90U7vhLDvPma9bQ5kb0w==
X-Google-Smtp-Source: AGHT+IGL22h42DOm/O6EysFpyLDhHXHpPkLnW4IjU4MzOnIssrqexxfruWiHq2QQ0znXzzhun3GQ/Q==
X-Received: by 2002:a05:6808:1b22:b0:40c:fda3:2f0 with SMTP id 5614622812f47-40d029f5278mr1098385b6e.6.1751592021667;
        Thu, 03 Jul 2025 18:20:21 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40d02a33d47sm149020b6e.10.2025.07.03.18.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:20 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:18 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <596d188a-9a2d-41e5-af70-c99bc2b7ca7a@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Add the compatible strings for the NXP s32g2 and s32g3.  These chips
are mostly compatible.  The one difference is that the s32g2-usbmisc
device has an errata ERR050474 which requires a special flag to be set
for handling packages that aren't 4 byte aligned.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Remove some CCs.
    Fix the ci-hdrc-usb2.yaml file

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 5 +++++
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index cc5787a8cfa3..691d6cf02c27 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -23,6 +23,7 @@ properties:
           - nvidia,tegra30-udc
           - nvidia,tegra114-udc
           - nvidia,tegra124-udc
+          - nxp,s32g2-usb
           - qcom,ci-hdrc
       - items:
           - enum:
@@ -37,6 +38,10 @@ properties:
           - enum:
               - nuvoton,npcm845-udc
           - const: nuvoton,npcm750-udc
+      - items:
+          - enum:
+              - nxp,s32g3-usb
+          - const: nxp,s32g2-usb
 
   clocks:
     minItems: 1
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

