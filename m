Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7A24A043
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582039; cv=none; b=hslV0yS9W45PXeCSSoUNOejl3WRR1lTGLYYyVZbNWHScTmyZZgRuClkquwUkdbzl4vbOeum8vLRj0EQvl5rihW87/a791zTXhoq3Cu94Qd+VfSwN5gsDSpRr9me65QcQOxabIOJWdvxGHm9sqRGQUf14O5+NBq+6XdnmMYrhCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582039; c=relaxed/simple;
	bh=1eEHp7uYWZhKEK9Ng0jAlZtb/iv/YO+ZJkAaGAMQmPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IW/ahhkIB3HRp3xcCpGybQkRQCIe5ZNxnPBvoZZubNv4mIv/VfzKjUixyASaBb2Ftd7r36On3rFO4TbPJaRNL72PoM2Fs/9dnwpVRr32qtQl8mIv3n1vN2dg1Wwv7RIBakqILIS7CosyK/K9j5er307vYmrXwx/t8YpTr94fEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DY+EuAHz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DY+EuAHz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so3521847a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582036; x=1746186836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfKL7p32J3lTL5hY/U8dlghW4gxQZ8SlxPE/GiXifaw=;
        b=DY+EuAHzYkr++SoajSKcu6/trBKUzkiCLvfy5NfAfoDB5C7spdUcl/CgBVALmjyEw8
         /iYS9e192ox4QRjjNlHXHLW1tEbLoGv6N/C30s25gp2UxinbQAlMpvW9tEvcgr/L7AmO
         w2rgniQ7FitwEpz/ve7eEClzIwH7fl8I44lzXbVs7qM3aGpKmvF5rfxSxbKx4EGy4D5d
         6y4hA7znLkV6JnWxqkux3rOp2Bh0JMWsps1Dgbh4nYDPoonZmAK7hXty0PTSOad+/28W
         ydItBQFPZ2PZDeriN/11yPhJEcwtFIRoLl+MQigK+2eyF9piq7xoZLRd+a80FdyyvuaY
         qpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582036; x=1746186836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfKL7p32J3lTL5hY/U8dlghW4gxQZ8SlxPE/GiXifaw=;
        b=UvKb3UzXTqkWvRoYDEbRuIoU3BdIEupl5czGAlNKzcakLmnGqdac6XigtaKeeUlklW
         5T/Ic0j1E0LoLs8swgePi2jl09huEbl1P3aDBAdgD9rhyQoYLQSumy+e2H8Lge2Ls6bf
         ficga6jdOeBx76M6VsvbkB3SI/kwmg1f+V0/OOFxwhiSz2s6GGAC4YC02ADxKzXxonGT
         Fi+LIcKcR7UGOoMHhzveomS1QWqhSswNZWPxzhDYxioRHw1WCA3/wwu71cETb+MgbBqZ
         1Hb2RAWW8bggQXT6IMc0MiByoMK9OEifAanGlfkEKOgXnwbnsku4wy9pRB74AJfw3HGI
         gnyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0LJpNG2dnamYVQOUGBU8cVv7fmScNjrMMI0f6ODGRxFZX3xw126KNy9MGqG2N4c/eolRl6ezzv1GLMHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6wos711gSop8U4Rk6itWhT+h7inTh8VvLQ+LmEjwd5zAF8Em
	GMoQvhYWMJ7KCvlG0Z9rHt+f3V47BPVIKrFAyH8tlhRUtckIKZZpwOYj8ziTAQc=
X-Gm-Gg: ASbGncsaryaiwKRZDqq0N6JbWTWZiLI/Mek30c0eKy6bWQPlHZBB0Ic4NuIajdPDsTF
	gk9LnEpDd5gkeKNXRMtj7Nc8qmqSkY7SZZoi0yaRPWu68SeF5+Je+RUjIIbtCQvcW1azJZJdwlJ
	rw9OddKdAb+2Ny+4BDrmq1+pdqkgRMVLtdTeOUocZQU08b3wck30rjgNCggMTE9R1dVltVW4Y0I
	CMvDff5eYC9XQzgNSgb+q2scqUM9d/s1mWsONeEByV8bwb04JiK9duF0d4vU3dV642WwIhsibqr
	dZW69V0GjfNZVbMnbUXL9oh4lSt+oCpIDozqJryDiaOQTkBKpKNBpgd44FDsGzv44dAQiQKjBy7
	v6nQD2K/IulUd3j0gL6DD451OAdhLhcuRiNgkJKLG+ce5mDd+iASUOKJE
X-Google-Smtp-Source: AGHT+IHEGtbYJkc/X6zmKZJpTYKg5SbhwKo367p0skHEsiPnLEarB+Zfnb6B80n1IamI/iDdFNeaIg==
X-Received: by 2002:a17:907:86a7:b0:ac7:7e3e:6d3c with SMTP id a640c23a62f3a-ace71425b3dmr210633566b.55.1745582035730;
        Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:43 +0200
Subject: [PATCH 04/11] arm64: dts: qcom: msm8996*: Use q6asm defines for
 reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-4-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts | 6 +++---
 arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
index 38035e0db80be9c4829b67233ba5c4ce8a2baa21..3897a177f12e98b77d8d57633783ba951f3da083 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
@@ -288,15 +288,15 @@ &q6asmdai {
 	#size-cells = <0>;
 
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index d7fa56808747ae1290b884430d5fa5443bdd9be1..bd3f39e1b98fb6360950b646fd05c6b7036dd0d5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -137,15 +137,15 @@ &mss_pil {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
index 5e3fd1637f449675411b556b9cace21383b1935d..443599a5a5dd573a1ac2a83f64c5016c36d27020 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts
@@ -87,15 +87,15 @@ &pmi8994_wled {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
index 5e3b9130e9c2c9e58c334e5ff2a340b82bbfbcfe..33d84ac541e1c52028ffa4d86d602e0dc876988f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts
@@ -139,15 +139,15 @@ led@6 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 
 	dai@1 {
-		reg = <1>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 	};
 
 	dai@2 {
-		reg = <2>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 	};
 };
 

-- 
2.49.0

