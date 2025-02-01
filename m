Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845001CAA9C
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430959; cv=none; b=VJR737Q1nQnsrscGWdSWfXIT/T1awTXZZBwAd7v5LHZMFQ4Us2dp7RJpU9znOae6LqDe7/rcAW5qnFKH+BlUv/IygPQIfozyjAlAaZDk0nNSVSOxkdhfOrzOfDnGs81kIKGJfAJ1JN3ZLBjkd/IKXzf3AiWF35k/P9LYpqJllaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430959; c=relaxed/simple;
	bh=/d/geU3OxC4Nkibrq9A3Ew2gwBiXmZo2CHTH+6Gy0Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRTD3LbDBJ9INGfMLPkGuBNrzaG0gcPoUGKaPM5YnJNtzjxhJa90mLKYy+9CvVZeqJRh1uj+fSREF2yRLZZSbnInXCd2IThA24J/MSDNMenuttJYbw8jp0rjCqBQ/sU2VgeLom0wDe5QDoNpcwpW7W2M3WwHbTzEcjkG+G7/q80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EEB+hGJG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEB+hGJG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a6bso30717211fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430955; x=1739035755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=EEB+hGJG23MUswaLIHug+zBcLaUI7FgHBF7+31DvCX+D+AsY+l2aEyGy9Id1ZVruIA
         O9ljf+Bh/HRUstbg27Zm4m15lPZ0Uimkri7CYLVsOiYF31OTark2MDaWoecwS6eWpIMS
         Je0MCtBtgxgx/xwOgIgHk54XMUTKKLu8oJTt8x0esWnzo7QmEBm08HZyIE6onfVMgUJF
         x7YzxvFv650YA/qvjF9v45MHUdVkIgAqGmLzJ6lIhaUv4buLAqDXsEtkXmATkZfkf2Gf
         UdK8rVJe/DHJDFYd6UcitkcUDmfi2IpCosIpA57V/Kh5AXDLdl9nbYEMo/914o6Cb2Dd
         zysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430955; x=1739035755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Dk7ljpeNS9WkTUfxOFg/JBajDxdcbPw39k3Tq9ImKI=;
        b=boQBgfb512YdHDUmvuGKCvNeMZEWgTZ5YUwR+FrvwDkY62s87ESAJN5HMR2TyN+s8x
         8gs9Q9bnxoHGSSL6f68mL2QfpfjQqgCD3Dz77VGMBrWTgwEnCLO/yPyiQwZCvPJKlS0j
         dm53zW2QTP1cS9QgbKo+BkLUXUO2PPnf5CdfTTswyeyBKHAQSvDK/pXdCX6MhC279jlc
         RLsEbiJ//qjClZf2rTjN+AHpb/9isNYAnKI2HjcvkNf4uA/Pe3zONdVgy8Zy/U1H5uD6
         NgsbbK+ETlLoCxhV6QyKkbrJsmFFIH7SSBaTbHeTqE4YsVTuhnKbHPzAtukUSQRdHvxJ
         pYCA==
X-Forwarded-Encrypted: i=1; AJvYcCWLl7iGixRzxhAemg/Su4ljNy1+fIrGKPxE3VO70+1m/szAL2Z+wgiVBP4JIlaZC1rKH+2sD1jb6EOdVZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIgC09aLzvgeqqvWmGSXGh+DcpUi271LEE5Td6P6TP69rcWEIp
	YdUkSmpA7+MhBWHYCSHToa0JPpGRvaOdqJExbnIgt9FlMAU2huGf1HbiGd2uT6g=
X-Gm-Gg: ASbGncurRItKYt6DXC5nN2ONVzTQtdbU+OMrbJZPrdX/PfcTqsz1jXP95cK679MT8mM
	U1S7rJkY0FSpfSO4iHxrwmcvHpF9xMfPhuD14PJdLUJLaAvy451Z2HJtQdM379t3GkM/wpEiyVg
	C7zZ6ayBjc4MHwiL4BB6yi3T03GFBLbTIL/eSs+ovSv1xolKJcJBFs6qYXA9rCL2do88M7lrIV+
	WWT8lkM2M/7T2NldO+GTUsv9d0/Wb6h/HhNEruXZAOHkM8QGsv+/XDlaM+t2kkZB44okgWL+wey
	V6wGsPfCjhbO6M3ME9K+3mg=
X-Google-Smtp-Source: AGHT+IFQxLdgqV1VuCmiSKzy7E+QXwyUiqyAdxyDy1lhNZkJAj2DiV+iFyftVtLTyzS01O4ux7Ueig==
X-Received: by 2002:a05:651c:504:b0:2ff:a7c1:8c2e with SMTP id 38308e7fff4ca-3079694dd06mr58095141fa.28.1738430954016;
        Sat, 01 Feb 2025 09:29:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 19:29:07 +0200
Subject: [PATCH v2 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v2-1-fd44011749bb@linaro.org>
References: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
In-Reply-To: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnldnpgRM0nW8PS6YIAuy4YhrJbX7cj6BYnO
 B5keQ6cZ2SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5QAKCRCLPIo+Aiko
 1V2rCACNDKB2CIDYU4QR8+Ha7egrR/zbrKOgsECRWLewOohyIlcnXo6fluZVPXOuLXYY/fixjks
 YgDHawSRviONkIGOwNgN4/X+UCdXiu7KSuw6enXbGQaQEVBNtibf5gAkitbd2CmwxNa0ED+aNOq
 Wjcl3CC2MDkrUxnPnitHOBYvSIbUtSQSMbKXZrkm1khH4ueV0Rwao6VnvUdXJ/YMmlxdOqItlYm
 UxNJWpp7RiUl14118a+TgBlJAYgSAuzn7XE8P4seuArTn6vGNDLp7wCJQLAFHN8W3B2QGFkv0q1
 uJxif8MdAL/sz/wvo29d22rFhq+dzE4wKfBkmf1E7Srwwr59
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

