Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2C264F88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104754; cv=none; b=TJgwXNOvAoTjM5mwdryoAN6JlM43xXu143cYmV8gRbvWdX3IrZmSZu2HuFzfXr+gEyrWb8J6iatHlZoEvs5TerwQUF2yukRrSLPk3+Ix2dThOCAOw6HZ49qjWexOw1ThTtXoB8D9ubepJr5AF/w6N1qx/IzCRhkVcl74rH3Q5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104754; c=relaxed/simple;
	bh=nJhtU/p+2ibFPm6eaeU2RXeqcRvO83wil1AuYBv0Kj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=msbm4i0CpbwinpAciFmzUHyhHUKN/7/M2tNnsi/+WUHZ78gQiy3TlVoCNVVTJen6XLj7meYvT9oJ79fCc0K1+gt4mZ7AnZO9/qq7QsShMq6Ss2c060gJ4rtTGXJsSw8MTE9OD8TihAkrv7jUB8E/WdJXMGMVUgvVOMgxx/wu+Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NdSqZPdR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NdSqZPdR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso4113235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104749; x=1744709549; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geg1UNNsJZdELs71YAT3icaSzTrvBq+oyumhCKCeUhI=;
        b=NdSqZPdRn2rsaQzSIdJIWDXqhUCR3HV8H5aDFygc9c/MiP6KLvIMr1b925rDPHTvUp
         joC3L77dIxb1q82I84iHM6dhkHZ4L47KDPZRPjfmWowDrV3Wb7pevn6wIzgbcj17eI8e
         KMS8/m0bxjhC0rH62ktd4Mp2+s330su6jcwnoEGOGB89///5brcc5cqWfAjkJPHOOKtg
         BOMDmtQBPInNvYUBCxrys3c4uVhiNTSpAU3Xbw6cDbYQvmlwW5fuXyG9fvb1sgV9H3If
         2bqXBLWLAI4snGuC+szOCSqMZwuZwrgGPmAf3T2e0nSa/PJ29dQ87e7VmPn5qCuualp5
         gR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104749; x=1744709549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geg1UNNsJZdELs71YAT3icaSzTrvBq+oyumhCKCeUhI=;
        b=pRCACWVztP2LrXP1wx2UmTxL0IL7sCDhqlasFVQubV2wQ/8w1/QA78AfDn/k1ArSZv
         H2FYRPM9DYBZ/9CnrqJpmb5m8kR+A8D3BeBwzpOkQLqx2YnF07whzbZUB09dkh3Ty0no
         J5ITsVv2MI9jUE4D9rKKG3Q5JywzJes31QD87heE0v+b1dL9SwCIsY6Hff7M6h5++eJ+
         DPAi3G5fpelGrTA7DjpF4WxBE4k8b9QtGyvnV712NYuw16Fwjd36EQMxtFYG5rxkQO5s
         pG98Kc2VtBqIP9+qDxD9lYbZrGdXRgIxzo2ThUd5PQLhtFBg4Lf7bq/X/1wVmE3bhMsT
         tFfA==
X-Forwarded-Encrypted: i=1; AJvYcCXdM8hfPolHMTwmgP0Z1S7s12/azGDT5mfPyMcvOI9iV0hqQRCRB2x1T089aJPJnSTvbRHF4KjrGJwURwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL+mXpxZW/GvY8xQ/adNHJnGksgRBgsy5wqxM+0WXFMjkOAAig
	rodlX3hwGmv8Mv9rbKfcVD9UZvYjwGOMS7lEfLH8KknPEZxVz3DIgzFuhT6E0nA=
X-Gm-Gg: ASbGnctegFe7iYV2IUUHof1HKzNe16r4hQu3zVqedkgKL0dtUCOYA2x67swoiTFavgr
	6vyY2JCpd7eebFtgr2ewNhZixCtet1USTWNqhiLfvrNk/zpjShRzxbEiRiv4OQKWHqJJbrZ1HQw
	LCAY3E1QOIxcvzcQuAwcHWFgRl/pvH4p6U2uOdqlogm4x6qOx40cYX8PC0h2Z1webs1He81vZaK
	9O8pJzKGdQwb68Qc95ny3XOOcHue6JwvYC0IX9alvZmH/A5WDOnvp3yvatyKKWSac1PBlANDyhz
	jBr6m3bVe1jy4Oahf0uBaZ+4iceQRvKW/PulpI5uH054Hsc0kD6MAnOIP7iB/7U=
X-Google-Smtp-Source: AGHT+IGTYGmUMNbxn+aRLmSjuIMeJmi+FJspkI6rVYXBi9pbLL/Nl48clIeCAgsdElyn6Gj68h7MvQ==
X-Received: by 2002:a05:600c:3d12:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-43ecfa56d10mr57083635e9.8.1744104749509;
        Tue, 08 Apr 2025 02:32:29 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/24] ARM / arm64: dts: qcom: Use the header with DSI
 phy clock IDs
Date: Tue, 08 Apr 2025 11:31:57 +0200
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7t9GcC/4WNSw6CQBAFr0J6bRtmDD9X3sOwgO4BOiKD04RIC
 Hd39AIuq5JXbwd1QZzCNdkhuFVU/BTBnhKgoZl6h8KRwaY2S40tkBfFF/knsgrOw4Y0enooFhX
 lVV5yZy8ZxPUcXCfvX/leRx5EFx+239FqvvZ/czWYYsUlc0utoaK7jTI1wZ996KE+juMDQiZcq
 78AAAA=
X-Change-ID: 20250127-dts-qcom-dsi-phy-clocks-79c6968df235
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4498;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nJhtU/p+2ibFPm6eaeU2RXeqcRvO83wil1AuYBv0Kj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0T9WCfm7gcLgeK675xTMsx9nuR+SYdE1ltE
 ea1H0zzXYaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtEwAKCRDBN2bmhouD
 1wfkD/44er75tkxY/bbq5Umyh+3XtV8uIAqETZvYpA+vo6Utozu7qC8gxNMjEUk8MLnNPcTQGvH
 fz4GcWXldLTuuAMs2mu4cT66mkdxbl0VelrSM0VjZrZFNbgwaFNi9hCg15DOYndr7pHPu2//hAG
 8IFSnyQY5oiA7KOi6BNOF23mmjaEg2Kbjoml4P9OSSnDxbdSdcg+9u3Hpep09Ig4RtLr46keRhw
 kD+cJslgwy9F6IFT0Ir2GyqX/qP/q6n4K9lX1fGDqK4uAp7G9ouJDHTnv3ws7xxaMB4k/6hk8vC
 7lAtrTDKiDoZv1r4ZgL9xscuw8HaKKb4wfarIbsFtya6/+vL/L76Nck+e7HlcpsLxcCDNHhca5b
 SecLFcDdepTSX/zqtObNJdiC61XmloM9CnEPKc8V0yXJXqy+yrILliIIumgLMuXulhPICP+9Py4
 8VtNPyO9j14QojQukIoAjBEyRk7DahYeEmYxpE2q6xAhuCPVhzAVv6YkKMJ4aZRRxIAEQOHMT+N
 jyiTdINi+q13pbHHIS+r86BYDr/FIEUA1QRT6VsyFpycBjzfRyThTkTh5re2N13YMGMveM1+9fE
 kqEiMXngZ6eN7M5pCH9FZAAwXbqDcHw201JLiTEsO3O8bCPyCpRm2gjy9R2B+YDWcZ7yfX+1ki6
 rZoNoOMbLV8/7EQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Collect tags and rebase (no changes).
- Dependency was merged, so this can send be applied freely.
- Link to v1: https://lore.kernel.org/r/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org

Use the header with DSI phy clock IDs to make code more readable.
Changes done with sed with alignment/wrapping fixups. Verified with
dtx_diff.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (24):
      ARM: dts: qcom: msm8226: Use the header with DSI phy clock IDs
      ARM: dts: qcom: msm8974: Use the header with DSI phy clock IDs
      ARM: dts: qcom: msm8916: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8917: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8939: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8953: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8976: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8996: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8998: Use the header with DSI phy clock IDs
      arm64: dts: qcom: qcm2290: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc7180: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc8180x: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm630: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm670: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm845: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6115: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6125: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8150: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8250: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8450: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8550: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8650: Use the header with DSI phy clock IDs

 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi            |  9 +++++----
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi            | 21 +++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8916.dtsi               |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8917.dtsi               |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8939.dtsi               | 13 +++++++------
 arch/arm64/boot/dts/qcom/msm8953.dtsi               | 17 +++++++++--------
 arch/arm64/boot/dts/qcom/msm8976.dtsi               | 17 +++++++++--------
 arch/arm64/boot/dts/qcom/msm8996.dtsi               | 21 +++++++++++++--------
 arch/arm64/boot/dts/qcom/msm8998.dtsi               | 17 +++++++++--------
 arch/arm64/boot/dts/qcom/qcm2290.dtsi               |  9 +++++----
 arch/arm64/boot/dts/qcom/sc7180.dtsi                | 11 +++++++----
 arch/arm64/boot/dts/qcom/sc8180x.dtsi               |  9 +++++----
 arch/arm64/boot/dts/qcom/sdm630.dtsi                |  9 +++++----
 arch/arm64/boot/dts/qcom/sdm660.dtsi                | 12 ++++++------
 arch/arm64/boot/dts/qcom/sdm670.dtsi                | 16 +++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts          |  3 ++-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts             |  3 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi                | 21 +++++++++++++--------
 arch/arm64/boot/dts/qcom/sm6115.dtsi                |  8 +++++---
 arch/arm64/boot/dts/qcom/sm6125.dtsi                |  8 +++++---
 arch/arm64/boot/dts/qcom/sm6350.dtsi                |  8 +++++---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts             |  3 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                | 17 +++++++++--------
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  3 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                | 21 +++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8350.dtsi                | 15 +++++++++------
 arch/arm64/boot/dts/qcom/sm8450.dtsi                | 21 +++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8550.dtsi                | 17 +++++++++--------
 arch/arm64/boot/dts/qcom/sm8650.dtsi                | 17 +++++++++--------
 29 files changed, 210 insertions(+), 154 deletions(-)
---
base-commit: 7702d0130dc002bab2c3571ddb6ff68f82d99aea
change-id: 20250127-dts-qcom-dsi-phy-clocks-79c6968df235

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

