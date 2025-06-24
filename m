Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE92290D8F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768183; cv=none; b=R+UlUMN6I/ah91Fu+LFDG3yYy8hRX5aGqm7WE0dKUvs7E956P45wR7qRVVcvTrtTLT6Gc0D7Opr7sMJ1eEijYhyuxyPRwyQZrxOUhhnEmthRV6hAeRv94zU8NKKUzFujmNpPwSYlLGlbgNM1g2vBA6oWib16UCF6bwgMxGKNYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768183; c=relaxed/simple;
	bh=tk5me8Uo9bpIzNKntTtMT+cM4Cb5YcZ3GuSYHhb0qxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cD8UDBPJGRuitLmdyekSCfryUZzD5jicR+ql1iIRV8mKBdRHsQXsLuYha1qFtbw5zeBSPGortgvirYCKmV3fozcwKdF70P0nW7YZFJriZhsDtW4Xgdf8Rq6CSkBQAt+/oKuNSF2+58RMDtf6xdHvnh5UILHroBS/UHtyOaYhXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLy2KAf9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLy2KAf9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso255366f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750768179; x=1751372979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8z72Xk/UQR8s3JCoKhbizomWVQUM7xOfiqftVGVa0M=;
        b=hLy2KAf9k5PsGzVxG6N321kxYZuaCWp63iRrakULfGwHhJg1h3podUmDb8CxH7YfnY
         P0v93f7DmoeFVhugKPs+jnL+VuAqTQ8BMpZ2UNFfDhi8viQTOsQkeNQLAvcw98zkWuIn
         hM2Z0RHGiVO3yyVopCRCMzFNIV38yPJAJxFT06H/1l0XgbqK6w6CWnN3t3GVI+RCzeiy
         nUNEdZ7/ZjD+ehWoA6SR6zA6lRwXwH/ZS/KSaWcZYa7qjYkMdIy9P25VjxLr6wOHElDj
         jT1329mgiwlp6OzNSEygeqdeP+LvtJF31HVBZl5K+f4nlnAfvAI+xPArAxWv+ZCPhamm
         Gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768179; x=1751372979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8z72Xk/UQR8s3JCoKhbizomWVQUM7xOfiqftVGVa0M=;
        b=Mqn0ErsD2Jl4ojnCEwmmF0cvh++umQX2iuJ6uSJe+W5/anbXGdXAfsAXb1kZd9uoi7
         Mm63FuR4CDwYLvSgT1PXEFjQhb9i4p5jJlozzKdMh+hB07rN81fWaSxKVTeuUkBGvgql
         0eBKwuG1LSXxTtQDsM6ldt1DI1YZ98fqHhY656R847V6Sn39/LWrkqhWAuAQ8l4+O6+L
         oI0Eqb66tkoaPOgUfd1b8gJbsL1atG6b9W3FJb3r4QchxoPGpB19ZgEpW2Owc9rUZMFp
         c4BZMLfEJyrNYRLSuHdnkIuNINx8+Px5KEwZAKpJ0zbW8mMGrdn9anSZQJYi7ur8hRts
         piYA==
X-Forwarded-Encrypted: i=1; AJvYcCWR1DH3cPHIc34zpfBaUzZ5o9p6wUj0e58U0tuw5LV0nvhgymP2mr+G+4NYpAWzcyCajL8e6rQvBAUeVu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWIRO0z7hxehtudK0PzxckBDFLtovVeZTdAZaTeNA3mmwXKfmO
	jmH3z0Kdqm9QlA3Kpvhe5vMVB5iRc7d3m+Xf74MJHw0xQDrRH9OhXJO7sLVsZeoAS7oe3V4FKrf
	F5hjk
X-Gm-Gg: ASbGncvUiOMHBjbVipw4cSjiKAkIuS6zdnG8FQ8FpbRzBdkIt1WZUsdO0NPH5a6EbXe
	NJApBaS8RJmSfuPpMVT10rtTCkTmWTVyVoE0i1ijQ3iYnPY8/0lPmpt0eW4RfIrEt0AWwUQ8LGi
	XF3V/Hu7R5AZhnp0FPFOvIFtKt8E6SfSFYzk83ky5UpVnf8BQSrE6yLoRyA00mHqoAS1ZSBczrH
	pajztVzwE1vN9uoz6NfRjzddIjwYEOz5IUjjyL91MHsggTx4coW4oJB2sKQgXnmsX5JkFgS+CQd
	0hKg4l24435Q2FziP0P3ZvBfcu7K8tztaMpVOLyqj5t6ElvZGgdD0Ivkcl7+9isDgEUdmBYQ8mu
	6qvgjVHc=
X-Google-Smtp-Source: AGHT+IFHsJjw7S1n5plNZ6prP3gOPmZZg2elF58BZkzaQ51gZ2FoYGybedifRMo1uu++mNZdpaalmw==
X-Received: by 2002:a05:6000:230e:b0:3a4:f7d9:9617 with SMTP id ffacd0b85a97d-3a6d1185238mr4945874f8f.0.1750768179508;
        Tue, 24 Jun 2025 05:29:39 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8051f58sm1899941f8f.12.2025.06.24.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:29:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Date: Tue, 24 Jun 2025 14:29:34 +0200
Message-ID: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tk5me8Uo9bpIzNKntTtMT+cM4Cb5YcZ3GuSYHhb0qxI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpote8z4iv4bjWIG0UeW4eGTUo8NnG2d502Yt
 AXLXLw+rlCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqaLQAKCRDBN2bmhouD
 11I8EACDBePA7awX8UOJtFcjhDnyLPagf5PiaMTbrU4f+mFW7o/Ql6FomEAVI9AA4DyE7m+X9N1
 MByvokeP6qP6R8aTa8CefTj9y5DraCxwFTyNHdRvCAhatPJI3EnzLcLi/VlnVhY45lgr6Udh1EV
 8sUvKLncuG+k/6wfhuJlF6hNt3pIMgsZofx9PUBXyt4sI+xkhuKOmSf/bKil0yQND4adK0NgBiE
 3F9f7yL1JIkdrF4ypJiyf8W1b/VHyOnRDQFs+e1WFMj1YtjOfcTAH9b2XZ6IdiDL8BC4K0Dq2YU
 wIpUZSJvbyJnXsVCHitVwiJuZIVMBNXubh3XhAVFLDM/hn0M5M0fmFZArKTHbBK6QM91DF0oNsw
 TqaepC9wfVLpwLjnlxfKuZFN7A1BEyJtgpsV/H3/8xT0erWlMB8BvuuJXCCs35i+s7jahpj5MeI
 hogdGusmwPG5KdlzU0F3SfA6Bov373klUvP3PUOqpoZ8taE5jKe+psg4JtLBNxvYtXOLtYmlEpX
 7Whyrv8crZDYnDsQ3GS0OHWV/NCB2oxwqscfSM55JGfi4mYuVZ5NG2vzvS80dJSV+2nBKUjjYGa
 qbZg93gy09Rf1C/vJRJyiW+H6mFHPjMUuaD9U3Q/Jw0b51r09PCVkFlS0JuUFHH9bz25ck+JF3c vD0g5pAGdnswG/g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add support for playing audio over USB DisplayPort (the two left USB-C
ports on the CRD device).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v1:
1. Rebase (x1-crd.dtsi appeared)
2. Re-order cpu/codec
3. Add blank line before status for mdss_dp
4. Tags
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c9f0d5052670..ffef25719f27 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -219,6 +219,38 @@ sound {
 				"VA DMIC3", "MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -1124,6 +1156,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -1132,6 +1166,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
-- 
2.48.1

