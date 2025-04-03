Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376A2505BB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691529; cv=none; b=HW5lMLs+bRWPrrK0BCPfab2FSPPeAlUNYhYRI4zZpodKdMuLYh5JSHr2AfB5VsVAImvg9NAl63SjdgrbGxMnoMHlqjyDUApMUk8xOIAyhMPq9zMCT9vFic1YIeXFsSs8cAFeQg0nchxwruX7BzzIMGIJcutwDkhl/LRo+mqFSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691529; c=relaxed/simple;
	bh=EY2S50CyISdq3nPrExweydCBhMumYyhAyAOp25X2rvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkQLpeJLalR/eHHwfdFh38uVJEMcBvfbBGVypsgZhKsp4+ikx9FpisBA2+ILQstv7ulpta9Od8PyGYXcP32DJw+X6EmXtrwei4Pe921f9NjpU/usI03Rnltz8izzQcdz3dNvgEG/J0iUdnEy9nuJtPs/VaaBAlC0i+MwMb5NBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGiG/cqT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGiG/cqT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so674589f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691526; x=1744296326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEnUjNuUqm5QapxreDthsg15VWD/vl1byEP9/xBmO2o=;
        b=xGiG/cqT1tL2fyLylaWg2xPCdjdy7Fxqqe9eldEtdBVsXS+2i4aCt0ydYXf7HUhpFl
         68cLuooyhvlonRMraUHXbTg94K9P7H+ovKXGQiIiVXNp8uZy2N5/YB8EnjFdjAgVRdq5
         nIygII/da4GqX0Ml/WrAFZoUntvlU0DuG00Pgn9AD2W/773QA7oWCJhrcGiK56k/weQR
         hn7+AKRduN3cQbgSClAlSb6DYLmY4fwCgE0nJxrmB1c481wiI8ZIPD9SxdM0adA3Tve0
         BVYRyFF05ovdq7o4U2lLFIR1oJLQ3hKTsi3kzV/U2Cni8gy3l78hg3zwwE6TQbwHQFFs
         CGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691526; x=1744296326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEnUjNuUqm5QapxreDthsg15VWD/vl1byEP9/xBmO2o=;
        b=vezI2AEHV1BX45TRh52MRqololkHDYjBIlCAfi4zxBlmJHXOk05Bk+bSRdgTUVoDl/
         TSo/6jLSD0P/GfKa4FM6BR3nRp8JBcPLDfLvG2JaTiguw3G5jnqCsWhWESLmAlhX8wcX
         HG0PrJIhirNuSRN25zXzSq1tRDUtxo1Zes1A//LtGf6chcJvojXAKAJh3ka1mnXWzGfd
         fH1rpoE63aI3yN3Rbw4ohBlynQOzCpupHhUqbzsa/3MLFuPLFGrZHDCGouVMSTiyvYKM
         E0CQMQftxssPocYWLzPNFCPogzwV9jUNEGJNqjf8tn95svobMNSrqDAGSBNqJU0vJSHx
         5vpA==
X-Gm-Message-State: AOJu0YwRvRFpJX+QW/E7R6hT19TLH1AQDmpJa0FNSYg/GRzlURm4eBZK
	JHoCzQsr49eIe5huF7lUKNGnlxRdkNdbqiwXPw9Tw9N2UyvVezZlLuMWYVNIqvM=
X-Gm-Gg: ASbGncv14eFi+7B4FY3iVJwUkTyzeC1vVlUYbxcAsRxUebdW/O6w3EVSVnJiUEl8a+h
	LVWF8qXDoZR95F+NHtYtgNoU7BeNjsMvYoc6RDz9MD8I4cQpW1yjeBjMSVB8pTlmBAnk1BCAW0q
	GnTJlQZPQoQl8qPkp/Xz08xt/cG4McmMSGFho3HjT/u7OIXQUo5JDRxiQC0Ry2feisgjmSv+fdi
	LS5yrMDEQWfux4w5a3TE8z6Kd7xVvAhJAdP6QZeQ1f4aQ2U7KsnStTyBhxf/PVYm8duekybRErj
	+yGpE7+eaZ5Sd5K8w0TPx+JrVKXQos2uRLPu94R6GnEzyH5whyZ0H3HoPMyO3G3ayWLIFw==
X-Google-Smtp-Source: AGHT+IHDFzdxOwN6XXtuBlSIqbVVALr4j1sMR67+MDLoZSHkGE0YblGeOmgeaK5cO/4CNlrFhJ+zrQ==
X-Received: by 2002:a05:6000:381:b0:39c:1258:2dca with SMTP id ffacd0b85a97d-39c29a0571fmr4584039f8f.59.1743691525723;
        Thu, 03 Apr 2025 07:45:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:24 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 06/13] dt-bindings: nvmem: Add compatible for MS8937
Date: Thu,  3 Apr 2025 15:44:54 +0100
Message-Id: <20250403144501.202742-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=6W6zcrnhaw2WbDgBvmsytJG9L01rOF4mMuUIqSbG5OA=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7it9Or2Ry5G+ZoMbzoQF1DbMBw3+O647n5X asfTxAD27yJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV N8KqCAC61qQtcaIBTnv2VriRzEfrBA1sctqF8G5s+cg9sV0y0DdM/fu5vaOeyvMEMW7rHbF15xw RT98As5NzPa0r/nvLgdhRAFUPE7476Wx+/XKxknLGSb11udyZxMIo4vNoECEUHToNslEXMCmhs8 Y+VDiXbpy11pHAwsISIGSl5KKKTSYXrxkj5IAB6gGjkWqlaIXoDlf8ziOEzmiWbJYTXSa+jk30p 47w6rJ88aJTI68BhasupUCgjVjw3nyjvwOsBSKG5v7SioJekCOYjXVZ80UxvqvvgVswcsdwxeJg nyXhTMf4VoQiZ1oDYV0zvu3o0DlkfLv8tzIs6mehrYfZwo1g
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Barnabás Czémán <barnabas.czeman@mainlining.org>

Document the QFPROM block found on MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index a85f817b015d..a9de635bf31e 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom
+          - qcom,msm8937-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
-- 
2.25.1

