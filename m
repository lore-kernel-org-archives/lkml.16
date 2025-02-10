Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3B1BC077
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179884; cv=none; b=gMO5s+ay6z9MP2FmqtrziUkbr+PuCRAAhPaTr/HxsMtsz3dqM8auIAX7pOiPDSCypwgt+PdOZrfU7agQX/c0qc20Ac1pdMLx5HWVzLvr35JRcOWiTiM88AfdfDjJEv6tClJkEmeWgEcXrOD4pGfnTT49ntmGYkNNl6Ny3d0v15k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179884; c=relaxed/simple;
	bh=PMYCYqrHPFsuRuu7KYz1rA2tCf6HdTbT92AT8YSZrCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdZU/ychMFjnSYE1xFU/qES/tjg43xYUglpLSQl6Evr/1k+ti9Xr12sK+bEDUgD7bpLD8j7urElUfFJAzePurWOtprreo9GyFOhoVIJpiqHd25YYIP4g7tKHFxje3xWLBKQIgLYl4Bv1iNx/nddFhz17fa0rmmlLXQlpiK5QvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WupgZAs3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WupgZAs3"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30613802a6bso45021071fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179881; x=1739784681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvFghhNu+y2kHYgbITMEYchLalWOuthlO7SM2EKd8oo=;
        b=WupgZAs3vd3z3AvqyzJp+IzBQHeoYBfSsYozXs6YuCKzvfgod7NpdI5CL8X/vaE+qP
         D6VIyv1s0stJWob2pFfO1+mnHIXIgWA60MMIqyUoeCMHcBaxAzrg8O5Uu6PusDBHwW3I
         uDe5TYl72KcRg7gmXpdnp/2ghRsQDw6fFJWkVvaHQ2qWLF00UwnnJ8HuI/LxDWUwW5YV
         pQqIEVx4IgGA2cuEICMgFbhwvurjmR2Re1GNDpGYMiI8cI3h9uBC9OafiOXj2zbEQiSz
         mgYtPd78N7v46Qz0BjGYdbL2f7Wid51kcl3SWcnMpA/ACFfVNKJVBezO/C7M5ca567fd
         GPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179881; x=1739784681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvFghhNu+y2kHYgbITMEYchLalWOuthlO7SM2EKd8oo=;
        b=Bn9RGF9fDlID/aN4um8JN2xQPyI1zPvr1F3Yk4TzjsUy8XqNFzQEYrpooKqrIa1GXo
         punniDEvyWrOkMSarfcHpwHT0a0PidV8ZscCmfeS53OzHE6u4AIrkZtRHXHIEazBcdiJ
         76QC1LZP4yDlkZzcc3Mi5cbFWFcDqFZymg/SxToRtb8UuY5AIz/52xXKUCDZqL4PbL0q
         etEAFSpRxkfFiS4RSMeGu2pp8VSI04dSgNIT0eTUcUPuYWo1DITxiM+px7yyBaX7fx4j
         nDIPNjCRn9Zwjgj3f8q+4+zW72fuJvO2qXV72Wi8D082asNkNTbJ6e/qsPRtTn3pBZWU
         VmIw==
X-Forwarded-Encrypted: i=1; AJvYcCVHXTH/phjVzZJ/RD7FPU8J1aequj/V038hpqhWdN6qyVRZMg+TLMKq4Juhvy+KhG30qQwzj4kLLVJzdD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXXJ3EEBQBFRAenHWv6+IALHeIXDCwSWvAcSTWEt29HlQSNXi
	ufm+YELkct6K6IRfbH0jQ1g0DNY4l61ZaVvnlDvPNNGNictX8GP60RnVErL3jPw=
X-Gm-Gg: ASbGnct5oVM8LvvWTu1YMGw5YPvhjnuNOJGqAgD9ll/yBVsxklX4dT6JPr6REiKt3ED
	Fu69f3c1K5DfOxObDXSABQhzptZo+nYqFA2/lgxr/dCwVH05w0rtCQY9hVvtgNJr7sMBnWd2PNE
	6tHULQs6mAVDy2NPWAqmhCBIMzFtCFKS0kkPOkdn+LTbxwp6fh6eIJgauBlQUd4t3MYH1uHXoFF
	2/d8SPBylcW0F0vmzpgFVuKXnuZIca7HuZDaX4jwPQk7eWZfw5thNybARzNh+dFGAslfaDTa0jx
	q3KiMUI/l8jLLqRGsevovCETxw==
X-Google-Smtp-Source: AGHT+IHA9jdEDExFsB1ckj5rrWeE1JQdfDm1JsFfGf+Q5WqA/JMVcTakPGWn5k/lCtIb64eRQae82g==
X-Received: by 2002:a2e:a98e:0:b0:2ff:a7c1:8c2e with SMTP id 38308e7fff4ca-307e5a6697cmr36096631fa.28.1739179880794;
        Mon, 10 Feb 2025 01:31:20 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307e09a1df7sm11645321fa.23.2025.02.10.01.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:31:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Feb 2025 10:31:15 +0100
Subject: [PATCH 1/3] ARM: dts: Properly assign NPE to ethA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-ixp4xx-dts-v1-1-6b752d745e04@linaro.org>
References: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
In-Reply-To: <20250210-ixp4xx-dts-v1-0-6b752d745e04@linaro.org>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The way to assign NPE (network processing engines) shifted
during device tree design and an erroneous entry was left
behind in a disabled node. Fix it up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 51a716c5966986bffb23f640af0736862a3f63a7..0adeccabd4fef902dcf7203cbd0454968a2b8294 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -193,10 +193,10 @@ ethernet@c800c000 {
 			compatible = "intel,ixp4xx-ethernet";
 			reg = <0xc800c000 0x1000>;
 			status = "disabled";
-			intel,npe = <0>;
 			/* Dummy values that depend on firmware */
 			queue-rx = <&qmgr 0>;
 			queue-txready = <&qmgr 0>;
+			intel,npe-handle = <&npe 0>;
 		};
 	};
 };

-- 
2.48.1

