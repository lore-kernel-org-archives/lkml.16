Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783A1F8697
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936955; cv=none; b=YQIGN/NSkxnGfn14Kwp64RO607hSZtZTpIedIqRQXqoqPpbnKViwWRgry2f9Z/Fm12Rj7vj+j2n+eNpIYG31H2weeOgpIS8w7J7dsgJS7CwEiJfVjtpaY+QFIgqPublNEXdwXUtaIyL8X2O7IRonb0XUXw++c7fQ/s6K7Kwh8b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936955; c=relaxed/simple;
	bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvH4i1ELt42SaiQ023ujLaa8qzWpmPETh+E8x2DF0eyIVn8wdCLRnixud7+QheAHTdcYlbSohjqUW9YLwG0QRDtc1iUZAaV8YhqwJqqqzSXAQDa/9Y63YBKT9VRF4D6g0pzmxzeTjN6x8KMtDAhdDogKx1pHziC/2VCir911wJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wzyem8AS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wzyem8AS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso14192365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738936951; x=1739541751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
        b=Wzyem8ASXlLjLuUN9r9gLKU6JxDVS8vheIKNBqa+IKFbE63BGAqVwH5X9PAufbcf0R
         MyD/ifGLUNLLVnPseqEtGyh/94riSWkeYABddjQmmHU87VUkxMt1TlwZpJrwnapF9qhd
         UwiB1pBIV7xwOjVWzLIqCzezzzNGfU8LEcITs7kOXm4l/epNBhyleNYltc/1VraVwP6X
         708M+xx5zMuNZYCxnQA3zcH2EWt6Ngm/aw2PXsSllLhLp0lb3ZJALBReqbX+SABYmbLC
         3bys+eNStPr53ZRYchh0lgUhR3R04ES0aifHs1oZTLdT8rTrMDTZMWvGRXJjC1pjPxL7
         q9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738936951; x=1739541751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va1zoX8mtnqXVu53ncI+bFuzSEXb1z3Cq8WHUrR/Cog=;
        b=FmpdCMmoQrkc7YQtIP5P7uBObrwKK5MDdsEcZcdR0O1VoU3fawBco0NceJrR1Fvirc
         nFPT+QYo/WnDYYp7YJQlefOHzmUDw75gYuz1wwrjvSiQ5YOcf7rCMgkgsOPT5w5U1hDx
         GHP4Bh7f3Zvh69BVOy/I/lK7BZ40kicyv49vNnKo6ldPyYAzNq896XxRcp78ESPIA18h
         pHOMZLzqACxXxx9/IfxB8VudgE8aYKldwHaOZNirJC/85ls6djJPCSgaXbGblIF56gqP
         ZvR7BqxcmV5F8CN0T5XmbViUyrhIkp7VhsHy0SKUhsez4T6c5+4vYhmmFueeCvzEQk1k
         CziA==
X-Forwarded-Encrypted: i=1; AJvYcCWY88TS+UgYS0shbcFjsZl9wF3QAjm+EcLEHojneDz/oCLmxtx+44Chasj7U+jUdnNKM/qv3Kdet0hhcFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypvpZFG/0EGzOjKcTtRjZ/z8zzZFuHY4Krn0smn+fxu2uh8lit
	dXoQQTaTVaodcKAsBpNRpnsADJAVSs+zeR2ssDT2pQzo3JmZxdTyEYbskSQysak=
X-Gm-Gg: ASbGncuiGgZWsVIopra44kqMHhyOe3bGjaRGStkS4NmRKxt/sdcCbbQCZRms7EZW/oa
	lYRvGc1zIkcjFvnFIJzeY6T/tsrnHeMoNh6/j4mlyMPX9hPWuLeWktweRbfuuMj+XlgtE33flrA
	VhcTx+1Eh4zCIy9YLg1x3Dm6KDdtS6UBJt2jLBKa2p9xTsnuJ6Kv5nlF926vlVQLr4/HKUe3oeR
	R8YtRGW/VsPJnkILtnKdSRaRzk62fCxL3btA2twXvaYT13ZjIO0P0yHYbMh9hc0C6b60+ko4RTd
	+ywP2r943s39Z7ggNufKrq2c+WT78w8xIld1
X-Google-Smtp-Source: AGHT+IE2pJXNda+hiiYnwyeBf6vBChbDoGs/+EqGbBksx9jMu31CSNXFGKBuAI/bGm3C2qIU4yweWA==
X-Received: by 2002:a05:600c:502b:b0:434:f623:9fe3 with SMTP id 5b1f17b1804b1-43924993dbfmr34954585e9.16.1738936950538;
        Fri, 07 Feb 2025 06:02:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm57384605e9.2.2025.02.07.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:02:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 15:02:26 +0100
Subject: [PATCH v2 2/2] dt-bindings: display: qcom,sm8650-mdss: only
 document the mdp0-mem interconnect path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-2-f712b8df6020@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lZqVKRzTEdObAW6fXjwuLR5X8ri06xq7SpagYA8tR3A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnphJyiEPELOgnJBIrAJ4yLck8xsXgt7sOkv8NKNNl
 /ePkwIyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6YScgAKCRB33NvayMhJ0Ua6EA
 DPpbduG9cUIr8ze7BRlZWsk3QO6dvuL50SUVot8nbJqcCPXvDc/HnTsk+OEoRj8CaXmBWR3BzmBG/L
 /5XllqZl8ExbyFyuG5+zBL65iOY47eF0O/aGFwWYfGllkGIoAJNhfvCnZuiPJcmywX9npz4fr9lrPn
 NA7cWWPpyBkPUMnpmK43ghDcNGVqxoX7NjTcZEbX9yAT4nD6sJp2P4mPkMCb53FhaSUt3B7h3tqZTB
 371BLuhR7iKhrHqh8rYpfGFocGuQTGjDMncKy9ph0URTdDzBwCvd6OfRbGrnvKZn6oI6fa+tAt4OQE
 gALlwfWc4/hLfL+8zdn6Ut5shc9Awu6ML0/EMjfYcHGcuUD+Rp6N/bSDiuWZdcqwXokATkSRMZBZ4c
 zC41gBPROo5ZP7X5zZYDOv1JQ6Q5TkYFsCnge3ufFrtPBLdy7ezYvEt7623ceMeJXdW3D2a2+47saB
 AkJKOH1Af5TsYnzAJeP5nRjXLCu6GcYCTnwEwX73HnDKsjQclHec3CkjBsaqO0EWmBYCT4FX3rV2re
 ZegOnpXqhyQODY7TqQjO/BMjg6qjequoVVc1Al3phvn9XVw5ofaoPsE4CHcWHNCJwCtSqjipWbp21p
 XAZxlQP8JdwFsadGqr7kMjuhD2gCLw9YLGsQD6MmtpESrvwfcFxFku6ZEfBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..cee581513c519924712c7e0fc055099f886d0a99 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1

