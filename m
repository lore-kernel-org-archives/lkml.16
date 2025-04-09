Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B321CA14
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231077; cv=none; b=dwmtlU3Csh62JQt72xDWmGkwVqsmFvcCXEiYvwDnsfdFIe3ZaqNpt+OyX13h9r3XRJvp0VqiysCQTKTyQ3KpqE7HVc5OKO4TfDgwDonspAO/6vOj9DgeTIg9WMOD+MuoDPMEQDX19M4RAnH6xk2UCGb1RsQYZSJNJAOWSMJ1di8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231077; c=relaxed/simple;
	bh=CoKrSJInLiIXwlY1ZZ7M5lRUgwJwFwDmaqWcxDpmqQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdmT6WqSBX/0qR8fDl4j/z9bsCYBDdjY3gUB49ltE9Eq1OgLqq2WQj9p/roMIgR+FqPA/nQj85bhOPfFxlbs3PrLmwaamqa6PKEGeTxwmdQVzrkPv3ByyH5kFawNxT0HPhfzgmeC+sm3UpOx1vPv5FpYV9w5iqYQxOnNbcDHezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQ2JPrfy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQ2JPrfy"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab78e6edb99so13304666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231066; x=1744835866; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=uQ2JPrfyUL4InhIYJFfMorllx1mzrBQFlwuQghTNuTEbVA9uzUptUuwbdJBoR7sROh
         daTsVIxDMfBXo7w+dSyQIlEzyUb9SpHT0s+U2OejvKDOAe3f63hTr98Ocglgvzu0kOiW
         5aPEr7xyLzTl/SR6ZlMYr3KMb2J5nR6dp7PwMY4q7l3ifdl5qy1+OgUVTT277z/DVMtl
         2C09nOWOU+haKmfD+V5qqmX+QlaBeru5pUvZXVlQFAbDo2gCCRE1xllwbOGyryoVxG9o
         dXbAP/8Wj70FG/MrKFv2EC/bpoxg3391AilSGNJjDySBH7hlpRXOohBHIJSVpJIL6W02
         aTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231066; x=1744835866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ow5hOPbiIZXZpWZ6Uu6oQmw7CcTYqg39bQG6yedoPQ=;
        b=sncDzkWnQukL5FyQVbJsztlg1pCQgvYKz3ZFVsK0TRXzQYMTpU5ajKAg6AOU5dLgdL
         72tSklOHi/B9M7PII3sFNyHe3ehkkI0+r4vaONhmPF9JhJq+CTIO7l+ZybcOKzoHjDwR
         hOsl6+iBHvsmqM9TW+GnrqjG81wzPjX33UyTxyypndLttHA3YmBSFDFF7epBdlpD7/VG
         Egypn7eVBI46Zg+zXCIg3FLH2Y1bZ07oqX0pTAThC5GMobW7ObQLdi9bW/wQlE84+wgo
         +abYiwUuT31bFxjjiIsNChV6WKVLHBkKeuPSS6ZJu27migz2u0Fp6/tZcPSH8/gi7PHL
         ShUg==
X-Forwarded-Encrypted: i=1; AJvYcCVO+LfjpLxg4yhv7FUkFVIjYyr98NU2vpMPNCKSvbQOdfMzipYBnhifoRfHhGzIN6w9b601u6p8+ZW1izY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyml4rfXmdjGQoKZ8UQuUM82I9ON5nIXdePTU8/eTgxtW5nHzMj
	syZY46ypwYT20BBUb4BdMQueqI7JKc+zdfq7w+jgOru9p2Zd3AbX00lR1lvI27M=
X-Gm-Gg: ASbGncsFG6qGY/hOujjmISODIzALm3SvSSYoAgmEFIeDKqTQuDuamk8rOWGRhlsJREe
	WyW1Qz9eHIzwOcVsy7pXHABuGgutijRLopKy20qO0ADypUTFJDsXdCsd3GWeDldL4DvMkfc1m6t
	gFAqTwBwFJAB3/NqYLG0Er1fMGLHWTRq6blJ745W3y8qdz7dGFwyR/YqQOFQQZme1TZx68fUWI1
	+DQiQlc4Olr7ecsZQ4QD//GD9SeL815YcFxND+781ocDHOoSWira2ctkS2+Xyq5Y+GEE77ukK1z
	pzXm2tCk69eqssnUfwFOWyvQKuL+XGmyUwZFzywro6P24HoH9irHJ7QfFBztyq0Sx0S4X1gorrq
	rRxGAD12xugA4IkZ1EGU4xyY4hq8=
X-Google-Smtp-Source: AGHT+IHIxFKwjUo5uFV6Jyj3wWXPZsF8lPwam2ydOiylWhWcuYhWeTd4XU5X8ZDB51XZhRzJ2FSu4w==
X-Received: by 2002:a17:907:7d8b:b0:ac7:9acf:4ef with SMTP id a640c23a62f3a-acabd4d7131mr6904366b.56.1744231066055;
        Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:53 +0100
Subject: [PATCH v4 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-32-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.604.gff1f9ca942-goog

