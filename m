Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7318E351
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943813; cv=none; b=Tyk9e6qOYE4FSDWYT5l9/EQqVDNoOX+YqIi6tA7o8sUMfV7fpnQNiWUaSBcGFFvMNLf4X66aLwavu5dOcj8dN1T9l47/G9m3rdxC88Z5dpiQpXCApN9XXLZQlS3aa5181FKN1MVjvYG40pM/JftG0wKWg1Gmctwl00jeLqLdfUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943813; c=relaxed/simple;
	bh=LqA0TnpriX6BG6wFMMTRQwjG15Mb4xWdLzul4jT3ckw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7xVvehNadhAScQI9H6wqJ/gln9Q0x0BD8upFj6KSK3vi/6NjjnXyAl/BY+bvzQTlrtnw1IzV7CWczBUFgMBesCxsWekbtl8LiunJkcEE6kmQyKMGZQwx0/XQxqqrNXX18dzqpwzPsFCro7nbkGb1LP3xMF/gO/cYAPMgk6wmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5gIOqbg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5gIOqbg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc627eba6so993946f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943809; x=1739548609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3dWOoof3Xw/2OHGbRzCfoAg04gz2ejhFyHKSGYevMQ=;
        b=l5gIOqbgTayffTKPLM73X3/pubPi7dP9/lqBtshxn/FtF9r5n4U+yiGCgZXB9jbZ4L
         ej3OwBcyXr/K3gcNoSafoOGUJ/zFfva/PdGy/X2jPB2wfshmZpgCI7kHWglZyTl7QqvF
         4ZW7iqVRWGDHRq6qJQMwnnnfvdru3xzMe8AUuGNgcnyD/hg7XRSACwdicmz4WZ5z9u/Q
         Kz1uPxJwYs7ojZjV8BeFtgDARMJiNFkb7uHuZlYrXyHofct2MWQqVWjgMyGnkWqqghTc
         OYfm4cL7Xjq+05OXLJYIqN/euuXu4xDzCclVq5F+Z1iSidnMxuzYekiXDD4GcuHT/G6s
         jFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943809; x=1739548609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3dWOoof3Xw/2OHGbRzCfoAg04gz2ejhFyHKSGYevMQ=;
        b=uQ240TI1FTTNh3l90M2UWVZZiFi0dtBPSytI+Og0ERsQds57Jmx7+9HXZ6Mg2GKz63
         Qi/yrGIpMLrTNnL0bXPCMsc1ncXE7Lnp4p/Q2n5/WrZO1/lgPMzRexYw7hOYiyrqVE/1
         QwQxyOrqdMYIOGYpzvVzsXO/BzkUQQX9OQukT648uJlA5wqGM7FHL5+nOtgvmwfzvqgK
         GP9PDKLbUN6DxVBdouNcENz1a8MyNtUt+TsKPsPvSDVATMDamrtovbJ2xv+NI+ITpCCd
         bchka+WIkQ+a6FNgq7ut9x3DkWtr0d84+9FJeHK1IHtJgxLxfE0Xl1MRPO0/X85nVR47
         GrDg==
X-Forwarded-Encrypted: i=1; AJvYcCUKLfAojDSj2nR37M9GARa91E2OqN84RtQeYYhqNSzcJhM4n3fWamnyiN/kiJEfRe95fIf41P4XZfuwJh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOh7juUe1oQ+HRBejm+yD5arEdwF2BT93xXKsgLy42djoCZSVG
	LEhDakcW1VjdxNDyWCSeZcq7+y/h0bxnlthaigfnaqsiZdZcHAvVXnDdTkwSWN4=
X-Gm-Gg: ASbGncu1DwDZgzQUwQSXo/fVEeJrDQBlDi8Zsz5+L/DXYm5Ife/HKUzhrCUwOk/aVZB
	Uv+NiF3joZ2dV7m9JKpdipFPcVJOQcXRYe3+utF/O6Jug4tRTem/yPf8kkXcp7aiiSAdVjTyQNj
	7BXg7X3HAoj/Ts/tfxvAPFLDrGoLm0TaTCSHdt0EC11Ji+B8f8xCcxVlgT4DQ2SROmCxw1Zkc03
	kVCMAAATrRwjoAwKfajB5yS3VbECYHcyvAts4hnaGDocgRqRKltJiVJ7k0JYaMxgVvEa+ZX4e0R
	paq4tp/uXfsnN1Cwj6LBIS+U+AulhZNTUnVbsM+WyNhKoQ2XlGXZiE3ZBElgga44UE+JvP4=
X-Google-Smtp-Source: AGHT+IHi7d+qk0bKlKvNvtjux0Ae8ZnowO4Boe9Bx+bhD4ZewXY1Ic6zG9Cm+U7d/qkhyLu5UCqFyg==
X-Received: by 2002:a5d:6c66:0:b0:38c:2745:2dd8 with SMTP id ffacd0b85a97d-38dc9138771mr2372188f8f.37.1738943807901;
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:45 +0000
Subject: [PATCH v4 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-3-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=954;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=LqA0TnpriX6BG6wFMMTRQwjG15Mb4xWdLzul4jT3ckw=;
 b=DWBaLZg5xR+Gle2U+lAVVq/Oxzacpni3Vbk3bF4m1w4g94PpWCXFJwkjJtFjtSG95lUHggbvy
 nnlqQIL2mvZBPYsiLt7N1rZwTwLCF/sYW5PVuaCUUv14pSHoqCEgTg3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the ACPM protocol node. ACPM protocol provides interface for all
the client drivers making use of the features offered by the
Active Power Management (APM) module.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 25ba262e3b3c..cc97c08fa9b2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,14 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1.502.g6dc24dfdaf-goog

