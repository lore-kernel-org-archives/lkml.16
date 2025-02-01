Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E3446A1
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401508; cv=none; b=AiQ42gV4/api8CjBBLrPO0WvDp60qXIPUJaU0ESNlIBhJWJqO3+9UZDI+Mw3FkGL1HfuboSUVVSchv0Mg4xpldOD32fwtEOUcr+LepE/5xSe4fKmMSOp0hDsCKn03G/pLrOH93Tc5pMi8hBMwYlOybLX4C38/o3GBbmcqM3vcsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401508; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKqu/rMstGAICbHagNclGwzDC2GIyIeetdvCULOX3GfZj8Sy3UExQyvtN4m6kN7RrlugvmOebpKAhzEkBf0XP+pbmsxTh6AHCa63VOE6iVPr9jQc8WuwuquuttF5GSEH1ZDdtoq5Wf25QtW9CzkICWXgNJLx5D6HKGXKmLBu2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQKKSnD/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQKKSnD/"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54021daa6cbso2965103e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 01:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401504; x=1739006304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=JQKKSnD/ZD0kAB7DVqyPgBlNlTx8Bh2RPkCa9drpt1jqlqGWZTFAJTION916lMKi3V
         gvqbAirFaagHFBUZnoWgWqiczdR6/Ip/8ygjgdZDh/5m0a85czdGki3ORmBDhjZ9aDJU
         vrq+eHABBY8NpmFgQsMuLXvmPZS5HFx9S2GtVghba6dN0+HRHuiZPNIDHeVrb+HxB73R
         6HjhvQYaMo08gX0K4vleWhZdL5tNoWOWpQyvJbpOq1thnXXMCkZbyR71kGMt7RWGQFC9
         yxqDJAcXM8LuSBIPN5MSAtOWSHFNroGFBfAEeVgmHJ7taf7QD0dZJpxgENOrCmrB6a8G
         lXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401504; x=1739006304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=FPp2vMEEGl9eq73a2ozc5DPNInsB7DO+DwM6VkbNkwfsrumX42eQCg3PHsoje/V8AJ
         p+ryOwkme7neIWQ4LLBXFXnTFrxueZeYy3h7dcEKZ3uNZVxmRO9p3ETT1fKGC92ahzG5
         w2PeozxEjxA3nWwRoJx97T7Tx27U3DCItChWAw6ITVdrGxX+DegBDp32JGEg3jljYUFq
         0UVaMmmcsBg4gLUGXU8l6YNkjgidhxuajAwl2NqUlvq7OOV7ZU525grlZtRyQq11vYt2
         jvpI1hZXjb0iJxMAcM3Fg3IK2XDNcnDfPQmUMw/8pBfc8KqjGNATm6Y5wLlAV1qRF7O+
         NQAg==
X-Forwarded-Encrypted: i=1; AJvYcCVOB1ByrdCg5tP1Sgkr2cdVRqZrIJAsnKmWYnS9FZXwL2ewX+yD8K52cpyaBn7c2VlgvfCITUCEEfpxTnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJfTiRfI1tNfmmtOhsnwe1RV2Zrj0ci76vswPJzCalME1wDRl
	9WkiNNFVNnRDlkew6Uz0Ipr5v8YgY+5bxS8e6dqfQqcTELg6bit9ADapHBuB0sEi21qA3REQ5jO
	E/edk4/pz
X-Gm-Gg: ASbGncuCr8VNtIENju14J5StyZBDQ2V4hx+85rdiWaru8e41We5TcMRW52XofGGMNLu
	69dv/2KLfANbojulcMQJHfM8Mfz50T+4zkmq/uk+Zyefv39LuKf4XjYyMwUrWihmDpOXyMoQh55
	SxJBihHB7+g4gCO8rp/D2xX8WRf0/HFDw3F7VgKVTGfNvxrOKGzgYuhJlnwjjFcnzUmdMU/vp5b
	l4aMAK5PKZoBQZrONkh7p+efjGu2YaYsFaCHxbOB0clgcc9ZvEIdXi7XF4ngclPP8qEMR7f86QC
	Qafs5pNaq0HCseT1mrHKikc=
X-Google-Smtp-Source: AGHT+IGiRfjDKtaRtE74/3E32Xgbx+xUI+Z6VTOl4MviUCpPu0F+jCWREENY9yhpuR/ad2XyiVRB8w==
X-Received: by 2002:ac2:5d6a:0:b0:540:1abe:d6d2 with SMTP id 2adb3069b0e04-543e4c3163bmr3579004e87.35.1738401504395;
        Sat, 01 Feb 2025 01:18:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 11:18:12 +0200
Subject: [PATCH 1/4] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v1-1-ae896c4923d8@linaro.org>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
In-Reply-To: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbzl89z/LXYWIUNKnCvqLJKCCBTEZ+5EeSD
 phOp0niv6qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1XTpB/wOUCuCsDnm0sv7LN/SmT6GcnhouDa4Jzkklz/k4zPqobHgUhqUwI/h/6OgsmjprUbDiYe
 neToqxBkjZPhARR2AppFVLNNVTkixM9TjItTaVkF6jnEkPe400Zmc7Spqa2SszmRkCOn9CGBF1j
 b01MJladUlpuRymUxSB7/5pWjqKGhlST8/5zi6iXQsHYGrN6Lptb0j5ZF4tqVSwelW6AcSkQxOS
 3p8hExOr62p1ckoVY57dfcfJ1CCsW3+BhSKu7xqMk292Mb2P6UxQBj0hfcrPy2VxL90CH9gLAIu
 4Ns/oCBKjIFlU34yhCVieV3C93JnLX5eCxCMlUmwfn8tJfPD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
requires different firmware, so document it as a new compat string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index a72152f7e29b490003114dae1e36df85cba384df..6353a336f382e4dd689d1f50a624079aa83b2ffa 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,qca2066-bt
       - qcom,qca6174-bt
       - qcom,qca9377-bt
+      - qcom,wcn3950-bt
       - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
@@ -138,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,wcn3950-bt
               - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt

-- 
2.39.5

