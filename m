Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476A11F7561
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936953; cv=none; b=fL9mC0y2tvry0aZILHZpyzwzmNv8pXhKQtFhC2Z+Oecxsig3ocgMQWWHE6/6lC1pWmkMOt7hVjfTpJdvhobaYQ/CAjs+UFeHps6VqrPpKjAKNMhhmgf6WU9+xUDNil6enlhIkdla6vywt+bD0J3tAodTVSS76EMmKcZvuvDBUm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936953; c=relaxed/simple;
	bh=TcDVf7iIOl+k8slgEJNXrVsMAuZkLgOUD8RsgAfG3OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eAWLjq3J+8xMeXumRq0m6aadmfKxHCXBrqml5Liz06146lryaA9iVLJiPCTaSAYu+XGYgA8MgsKhqCsOAR5uhjg38xgwdjLP9kfmTdvXfE2O4WNUBJJjgwJAnqH5b0M9bc5DXWbT2msP/jTRPgX00j71NmEb5JvHx+IzGaAJcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axFCGIRW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axFCGIRW"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283d48so15080835e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738936949; x=1739541749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+t0PeRcRiGWGlq2DudmFu4wvPO0Qc0iTCeH5AgQYu0k=;
        b=axFCGIRWk+kbX4aXOoNBpoPkalGcxA1F9o0FSe7Q29CRDvwBI/Ui1Pr/QuBrakJoC8
         UhZw0gQtSs17q263L4C/vO+KQe5mxEPya20ujEfkXzcKx/hfgdwfTUqiBmKltkcXPJ5V
         hNuNEEPvtgKynsi1Jqhnn/6KIJ2BhHF0WiaI82IwGR9WoIauPjgL4CpQgWu3SHFFcUZU
         Asz6Enne2Fv4AydG+duEmjnq7XbTFHiPbiDj2t3KW36efsVSfSQaTDnq7VEa1eDoOQhV
         dUefWqHMXTAx6N1rfCOaPhuxuVEsoWCNWJtvGPbtezIFW/zfI2CilsOA20b6XtB/aDW6
         spAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738936949; x=1739541749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t0PeRcRiGWGlq2DudmFu4wvPO0Qc0iTCeH5AgQYu0k=;
        b=ivr4BuLsPdqgb903f289skOQG8BnYKmITD/qA/abrBdM35pY3XaWEe4nkhOcH2kPvZ
         aDbrx829uK2CRRfOKxo32BeLnbFY+NS0Ep9nAzFDQtf4PKrlmtug+1ExEw/N0PdQ9aVI
         jdafEn2cKB9ZxYfaXlmY6g8+IbSVeM7v/JPIISjN1qbTWl3S360f9O7gCMbR3Hvmz8Or
         OqUZ1k4yTxYG6ZxY2HFKgsPnprHiHs8BS7D9pGarSzMI4/Ao8HaOC5611/josoTLyFQQ
         y1s/gq+zQ/kMXHHpphcGjVbRzed/zNcq8sK3emXHCcuqUXoe5faPsQ5U4EujTApo7slk
         CtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWutlxoMdWKltCAihojU/ak6F8jYMcSPC+d5wpuTIP4QF4AQ0qY9OMwKAucNTP7PJfIGHG/ddiek5UOXbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6q1NyCbqvrxzx/6j1P1eGAuQeBdMrdGTBN/OEsct4BBD3VSiv
	IxihUAaoMC2HriZ8SZO2zsA/JGhbp1+KZFhbS/KwAmDVm6T8TePknZuRfY/nd+U=
X-Gm-Gg: ASbGnctw5sQgicx12/uIX6inU1MJEkn7PG162pih4LC5EXALGrwOXa3E730Aa4YrjTK
	zB+uWvRywvPdMHd3thMyptmmWU6BVU5DDTMtUaOVc0y9JQ4lW2Fw7eO8NCoHNEIIecNVuTc3PFB
	gCYt2vhazLzX2OkagG+gc4kV4CJtchGwDNtISnMWTHGW2Q5VWH6pIZZAOFrt++sQVWkRh7cCFLd
	lN5pi0dYEq8foSWnmdTF1eWoZIN9PgSQpBnWdJyoTiRerFFPlu5dN0i2LJ/FUAa+QfhyfmNMNOm
	/FQ4W8zic3+e84hSx7c9IKAoFG4u47tap+T5
X-Google-Smtp-Source: AGHT+IF0Kfmf/PwEzCNegLbzDTONXpBMWhSLTuNeh60qPhqC5TyM8mWAKMBSCB9PUmIinuW/+wiCEw==
X-Received: by 2002:a05:600c:35cb:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-439249b2b99mr23312925e9.21.1738936949368;
        Fri, 07 Feb 2025 06:02:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm57384605e9.2.2025.02.07.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:02:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 15:02:25 +0100
Subject: [PATCH v2 1/2] dt-bindings: display: qcom,sm8550-mdss: only
 document the mdp0-mem interconnect path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-1-f712b8df6020@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TcDVf7iIOl+k8slgEJNXrVsMAuZkLgOUD8RsgAfG3OQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnphJyo+NERuJHQbRXvuofD/Lg8Z58aE+Lc+D7Tps0
 T9gSRoKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6YScgAKCRB33NvayMhJ0S6eEA
 CzMMqK956gONtZcEyWLIdpW851mCXU/HbQLiPU5tYUWwcaT7KEbVp8Ac3EYh4czEGOt5AMgpIt9X0K
 Px8UYk6ASwesv0OgkVz95wNNryHI4AH40p+zfVtCUUDAGcImca2Jf0L3cUU95NVDwTdPWNOh5AiznE
 KhnqMWp4xzm/0yV0AHStb5ph/Y4bjwOKThwbyc/QIk3hJrDKxbgjsrIj90EmwQbIuIED48vXAbkzR/
 wOn6/h1gL/zWv1PHniAJvTxzi7TIOhFRqnyBggpp9igt8Fo33XHkRjjAfZ+pCmC3E86jKKD3FJtXFu
 ze+d1mrfRCvMFxmEzgcKYupLotLZhPdf4TI+0fzLu0NcKD6i1XB/4TXwQeYaKaKk7uIzblgmxSCrdr
 nqxBHjC7ygZcmV3zBqwjethUT80+bcIQ8kMjV9p9lnNh+npY9FjHTfoJhFuCc1e60tFnUbOqUtRUZq
 WZdBPhKPA0zcTfmJgVD+VyH4LtzBVZ63mXsOhXqz2/MvPJ+162jxCAnpNpQU9+OMC3DFzy2yeLcA2Y
 rNhR4rF1FiDeckHfnwUeIGSv0sgxoyT1CRv1XvggUU0i5qORa82H6HiznnmShFu1j5M6Et98RnQFvh
 CbueXYNX84Ncw+RxrbE+RMBwbLLw+vwFisX8OaI5i/7c22V28zC0KzdcEn8A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..9631fe11c152449f3dfa0b8f8f53feeba721c950 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -91,9 +91,8 @@ examples:
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
-        interconnects = <&mmss_noc MASTER_MDP 0 &gem_noc SLAVE_LLCC 0>,
-                        <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
-        interconnect-names = "mdp0-mem", "mdp1-mem";
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
+        interconnect-names = "mdp0-mem";
 
         resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 

-- 
2.34.1

