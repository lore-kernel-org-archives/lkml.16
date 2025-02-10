Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80503222589
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191928; cv=none; b=LTBGNJXJcI2xb13hoS4BaWHlvJEQHtdiTd6Oai8FSTYI9zRXakd5modNq6h7y+yPuP0Dd4Jl/RQQ4kcLUTFlIsmItUafpYL6keXZM5Lnbb04HmAd/SfwbfeAqsPmv/O5MPcAvtYSRONAmxibHS2Lk75LuLNrogxkFbhxUDdDXJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191928; c=relaxed/simple;
	bh=Lpe/i5C+5b5vZQpv9IAlGMgPvHSa+dmXip2VQoCAS0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVLYEiDuh5Kd7T75PYRWEyoJ2v5CUdowc4tTog0+lCEYWg/KZdI/XFz+aTCDeE9VY9DfhChPezyVvnFB07rojqjwEvl7mtxObcAfjUblTyyuEtoznzBUEvsqUvKM8gOPG4jQuNk5zJ/abbKGvq6JNABKma04UJq3ELOJOOhtOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8ae7rQr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8ae7rQr"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7c14b880dso180663966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=P8ae7rQrhLXqSrf+iW4zq87i+o6WOmdPeQUQyzn2Kmi0c4pZQ8tUg825eDvI8nUHrP
         K9M58f0LLqn8tVgrXyHdYpBvnxGZoYBhu5H2nXUHKKngjqMGJQa3Xyb0edp89TYmKliX
         JSqRvxxCLaJSYnqq2p8Tp+WXGedkJQbeLMGcJRKJV5vpNvIIJmFhvmc3vqP9iA0BbYr4
         iEPQIZvs0BIfoi5XpBbS6Fw2B0m697IZ4aZRQlDL68lMmnhdbudKjUViDG4n3GvQVdUS
         If5a98F8eUtiW5mhm0AySPpD7Kpv2RIFVOOwYKUsPVT76JeIBhxuLahMNWl9hBTl6NaX
         nGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=mWli3m0TypXtY9hlR3jHxgyzgLJmVUbg4WyMWKESN+/s8twaMou13Y44FZzWMJiux0
         sFDJeSCqimc08oa5kAIS9mBnqm3ROa0CVSraQhLjRkMtUA1W8PSpRpcGabQHntM8LHx9
         FbsKDyLQN2uw7P1Fr1BtA8GQ+bRSLhOmJweQASIxWbs3kqKvwW7gSjj6tE2un78WcPm7
         rXtB8jfcKOJFZRGjEXP+H+9xWnA1e2VPP8fssYlvVrAThUYWZ79lulhijc05LHT2Iiqq
         0s5gqdfXwtYiegTw4x6dQay24tiuSGiRSbedA8eRYDvusabQ2DoImkNPrG2WnE2lHrwe
         wIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6nWkF9yzzQu0Z7zCZlrl5vyR4TJsTFw+IizuaMusCixEeeCAVy0bexpfOqKM61QATmUBcv02MbYFdJeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz315IOO+p9eejulXkLolieytM8tMCjSIPrLoDIAdNJX7+fThZw
	+Wyu9RTb+aJ7pgaSBe7SkHq+5IvZt/DNOhZNEdyE2HMZZEzx9mJl9pLaK/lbg80=
X-Gm-Gg: ASbGncuUcFQ01FKtjuKMyNeGFX31krDpr88RFZ4eVI7dlmNvZHjaqOBPER1kC+C5qqC
	JQfA/0BCc2MxZ9az8e1N5U1LZ8JF9g7cf9xiMVLA6v9HatKeSp5lbLZlsGN2uujED4KjSKXNtcu
	Jr1OJnHezuG2LDjLEwljBxQFkwPqOdBiHuMVRO1QAHU1R1v9CQSjsQI3ZZy3dNAmky3Pv5HyK1w
	mH0IDwxT0DYLi4zYAj8/tAovMUi+EokwtKpiHqw/oBqQ+esfzYsnr+iUJpJJWaHxAtLjBls3Oub
	hM4iBwomEYHETWFO26viebBO/sYXFnRTGTwl9ZFAapxuZFBXnRVF+cFZCpRPp6C/GUcVi6jhmb0
	=
X-Google-Smtp-Source: AGHT+IH+NgzE2gbAq1itQhugXDlHXIYig8ArxGegZBDP7bul7fijUmgra+TzZrMkLOQO6b5p+6Fjqw==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr1427309466b.50.1739191923425;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:02 +0000
Subject: [PATCH v2 1/3] arm64: dts: exynos: gs101: drop explicit regmap
 from reboot nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-1-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The regmap property for syscon-poweroff and syscon-reboot is unneeded
here because the poweroff and reboot nodes are children of syscon
already. It also is deprecated.

We can just drop it to simplify the DT.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..e78dcd506a5c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1400,14 +1400,12 @@ pmu_system_controller: system-controller@17460000 {
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
 				mask = <0x100>; /* reset value */
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

-- 
2.48.1.502.g6dc24dfdaf-goog

