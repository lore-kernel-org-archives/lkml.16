Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB02ED145
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257207; cv=none; b=sL8V8b+CYi1tl44szMgL6qn6npcMyXUBhNhbzc/3yfzRRsbN6h9mGg99qu/ksmBxan4pf9/xH+v7tAtvAg96H8iP/rXCfz4t+Na9nZS6PDehY2BtJaL9PiSOXAwq2Vo/YpgspHU++NWoJQcsdzaJjKD4d3kdh8uE+t5ffJc8L0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257207; c=relaxed/simple;
	bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPiZbR8eX5XRLljNdZEeMFuWYSrmVFXRo93wGkTIxXszumJyXJhgrTfqRgRFxttuNT4eqODAcJc9Be4nA4f8R0WieJXQ4q5yZQqBd6SFITFNzYABNlzPe/hZTXF+uu86+SBH/ohOUgEhIUVYwxbZ8aA3VfhLScC1+Th/rv6+cLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X803yxpq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X803yxpq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad5767b448aso87527366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257203; x=1750862003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=X803yxpqI9HGNZNt6Ml9J5IInCo0vjLa8PzJ89ZeyZlrZbU6D7VA4JtCv8yaUdbTyV
         oHGjZrdbb4YqW1ZWYJLDqkUvxWwGiElMc2WNmAuJmHZKQwbMXtj0WMwsK0IbGbRGxK6q
         222GaGWz2Eyv9BLJLeS4fhqS05yjWvLyzeDZcN56+wsn5hzXNzGr/01gLxRg/f7ZOQh9
         dj9aufUGbKAxFc4s9up0VHIYMyWqSNesmPK/Nz45cKVUUDNnnDjJ76f8U/cMIpIybTr9
         0uiWv13hLMqyrrsM3QL9MNW3lQqt2PDNzjv2CZsd9K7ujg94KxbVaoIuQCA3K5A96KXj
         ZSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257203; x=1750862003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=aGShuMSDzDv1pLwdrxMFHLPQ9IqoCPvoXD3FP46HuIm9nj1SrUh5etbvYk/Apdk69+
         kP/uZq5s03RAui1FfV793NSXuFiaK18gjDrobvfnRvE6ASAPMmHXXvh5WjDxoGTHkqJA
         kdJ+fTdB8tQWTMVymkQOk7U/zwAT/pKycaaxKRjpDUtCMDhKyUg4/i51XYgz5VS0tDdK
         m3A8mbt3saNbWhzt/f8aWrd/VKRiuqJXKpR7CRIkLdyU9i+FTZmgnkLxhZHZj2SvXN4X
         vgNyV1RF3dl6XadOnSSF0RkA8OOaRrTF8u2YnbzaU8Jqn8i8yXlOtHYI7ESqO8fHmsxP
         Yn0g==
X-Forwarded-Encrypted: i=1; AJvYcCXpcKwUwq4eDODbCFxvi4rAWOA4PI/afkECMuLjMAUJUWwBmhZ2lVOseTBEHwN7O8wWoZ+dA82BQXFfFG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGM8YGfUbmLERm5C0EVu3Ai5FWSn67Eba9Z+9JMekT5O7KjcK
	M2zxBXUIpaPGTovrGhQSJ97qjTqW0sFoug187FpZi6CXHxF2P26UQJ270M3cr0N6RGg=
X-Gm-Gg: ASbGncusLric/5Xl4TJqdxCwsxFY3TckZWUG97CmJAQRfyz7Qp8Eweqb5JzYndUYToc
	TSaYw2/si9eAy4+ACYh/+8L2K7gOoYmfxfsCMSrCnfEecvp2pTPBRFLYrr9CGno1r7ra6ZqDEcN
	/uewLenXPuuenvTsuemRpZ00kauqbvoxkJGpFzNkR8J3t/6t/vEHd8iUEVCjjZbVW/T9fkmGspl
	WQwNrx3OnZ+35WNZNcDGQpicmvmH12A6lGQRYCmueCUVfRv2BJBnDFWUcmHXIx6znelbG51HGHj
	S0i+V3TgO7tbK/vAPSEutO4YzRRiPAabOb87aNDwDYXKOJAbY1vC8vLkvVd1ZjGtn8UbHcjFc9O
	g1Nvfeck=
X-Google-Smtp-Source: AGHT+IGKoU3r5D3IZbrkbPBazMthEl22m5NBaPqPXUVpxmH3yzoNI/f7ET2xcNcP5H3K+nebEBMVdw==
X-Received: by 2002:a17:907:da3:b0:ad8:7eed:44e8 with SMTP id a640c23a62f3a-adfad3474ebmr581069566b.5.1750257203283;
        Wed, 18 Jun 2025 07:33:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:33 +0200
Subject: [PATCH v7 04/13] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-4-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4dZs1e9OLTQkOIh8+NO/IZR+1Sq335TLEff
 VNu15nXqAuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHQAKCRDBN2bmhouD
 1+b4D/sEq0zX3Le/YzKdLb5dMwUM7vmJzklGoMLZ5YnuqSYnEcWCT+ys+2772Bys9J6O2KqFwfz
 EmL14QjfV3AjyeoH/MeLZ/JLMfdOVqWlf65XiltotDKNCIEvJBLOBHEsj0+Cx056Snv1cC9fmu4
 HOXi6jzcYSx9V2GRYeO+cajCpf3Nx+sF/fGY+4j8Zd1Zi4+hbfYnwJwcJ6VFUDVzIM+F51FclAv
 fDlbo3NMdt2qw3ZrQvNO3bAlfRjiV1XpXE9mAH5C7414rMM/pyFIPDyEu0xpIPno0NGI5CnMV75
 Exu5JEjbfiKBW7wS38qTpHUMBMtQQ9NyjGzSHqxgNMj7rcfjoTim/qIsx5aDv0O6aGwQzKemlc+
 xd+6yTHegRbMg95Lw+ViGX4oehhHf4KDEYPPP62r/JB6xRtWt3oohACFUWxzK0qEf33kq0tyWJW
 EeeySLYozaIsDvHos1RQoMJJ9fRTZE0ZLtq8LOErlHzFf0bVSXa2cr36pWOiD/nAtTa3HSdNdVm
 6EWsGIRO5DtQOwfMj7to8DWk+3ZVUrEShYkodvFaFHMH1U+2jXHQAaAZba8V4TzsE8tNGYrdtXU
 VdxY19RTAJAde5sOBxpbfW58sGn8AzreL1s+Uf7zmL2brNTSkhLp1lUeooQLt0uhnkAUDeoqVOH
 U0MgYBsYOZugdmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

