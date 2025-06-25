Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD4D2DECCD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843393; cv=none; b=q55I5Ck0LvEQkl/zmyKr7i/F0jnT87AaLHHgIpXh8DHVC1FgjmOidq6BWLPiGd/3QuC0dhuiZ+hTlH21+czQYqy9lRK+1nxhYnokrgk5pO75ZO7F4yA6iRLf6o7y9ND9wcbypmENV5XJMLs7KKwqu/rw4xtpHNoI2rZ8lAHkn5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843393; c=relaxed/simple;
	bh=eQWT5rynZ1PMaMurlFu0xtL6k2P+7npo9dOzB+6rBOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGJuf/rID9u1qvFQlcurNjB4FFx7am1L0nkd16jVOJl/qKqR64f85E4nPL+UqGorCYyi1o6FHGGDLBY/6i661ytK+yqLYp0+pi51r+OuIqPcWA7/ocFgOmV/igxYAT5fVOQrs88mQppDYxLsMuDvvfNCMvSoEagHRj3Y8N4s15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GZgjw9su; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GZgjw9su"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso164928366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843389; x=1751448189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgqZI7oI1+Rtsh8AHih668v9LL7u8KNYlhdavj5r3Pw=;
        b=GZgjw9suSVLTabJ9F7qRKHA0qOqRKhuHZpCQPymMtDT7WRYpM3iqp314KdtrHhMcen
         VU0V1meOabxlhUQmEeaeqiYab9ecYmepVQ3+4O5qxoFhi5WTBsI8qdCEYnAbrH1M6kFk
         8Rw/sf2aeq5vW8n9CJkdaGv+fjizW/nC9iE75Fgh/nMyyhg1bdW7UKeWW8RGBS0b+aex
         NTXvqFfDcKl2UvCB6U0Oi9q4Gs0e4b4yPA42uS7dCwXJ8q3g4NPcuHykXz11dIwEGQ+V
         uNtwDDdiN8TwdCktMdgtKz9Sy+raWkEpjrlckVY7Etq3miO4NIGOORO07lkLUBc+7uwO
         Kq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843389; x=1751448189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgqZI7oI1+Rtsh8AHih668v9LL7u8KNYlhdavj5r3Pw=;
        b=nqn3QlXA35h4ldl4q1Bnk6VDx1ZOiynG1GrGsno2nw652mlCh5Zzb6JZKh6vjRoWSx
         LTskkBbBKwdOx9QGt99oonXqGByCTcHICibEbqVvQVwbgcOfeD+RlMDXNMvBZ3gROlrU
         uC1OwKe3bBGXqhG4tENErt7sDKHs2CLp5GTVilFVUXyzV7QvspV0Yl37KkgY84o7lMGL
         IvwYiJgoeS9kRriaDmXYExG0pbuOwBWNIZsjUrSdU4qByv1vWeWTR8aGlkKEl2cH5UNS
         01GzpS+azGr4BeekBhMjwqFTB6HSV3J7pgFTYFOUpr/8vKcUm0eFl7VxNoLr+KCesyR6
         x+sg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cdHoGDnVpcB1QA8uTvmm8TSFJy/lFUJbLwEvqxZVLGmB+yXphbofQ9L/k4BCJcQMRiUhKP2AxS7bAaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAhDoSptzaei+oXAn00/BOWpFa4eRFA8rDAk+3BiIWBFruAfh
	z/8PovpFI0OSaaM1AsYENwaYdBfYEqsZQUc25owZlUiWoJ5ikvg25uXjAqgN0F3VAe0=
X-Gm-Gg: ASbGnctU4GxAJfqLzFlJ6XSKqEJuHixrvHYK0pw5LX2AuKXegnE+KvI2/YoVvZufwvS
	qfSwJnMdfLOziyPlNsG1g6KD+ouInGc7AsRg6ddpkv3nr7MhayHAwY63xMfpHdX0U4URTg7orqV
	yiOgdCWdW3dEzcFYTKlC7Z/xL/2CwxH8DYkqDju1mv03pX8OBvBiKL5/oSfPB+i0icfDXhGtIIE
	1XOnD339e0FP+kYiHLaSDqBNJM2buDYaC/I594fae2UYObArvufKSRyubumw0Ps83bNmOZOmXA1
	2ktZYxbxaKKDc0uaLYoPG14gK9eLB94Ko78ieOP7Q8SvyIZRS50ZEwhp0vDK4HgD/HmVD3yn2rW
	UoLyMWCUChplISPVebVnleGVlqGzK50xg
X-Google-Smtp-Source: AGHT+IEbu2f/7cXyJsOb3QqXP0wh8TgrbA5ZDl76nci0eiAzw3s+R0MtL3pVIqORzpzq/cBkmMRAoQ==
X-Received: by 2002:a17:907:6088:b0:ae0:a597:2959 with SMTP id a640c23a62f3a-ae0bed8e8acmr247450866b.32.1750843389413;
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:56 +0200
Subject: [PATCH 01/14] dt-bindings: arm-smmu: document the support on
 SM7635
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-1-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1465;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eQWT5rynZ1PMaMurlFu0xtL6k2P+7npo9dOzB+6rBOg=;
 b=gDsmUgdZBFiEdwrYEbZ8pi64XslJKaJrZmQirkFpqMll05JV6aPCYeaepteR65EJtYCQZk9aa
 7x2FpL//Q9vClR/bmMVFhIADOJuoW9AUJVzbXxYdMo+K4lm7WiiCaKO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for smmu representing support on SM7635.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..8545dd8e886b265caa333188c031f19a44d7fa6b 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -55,6 +55,7 @@ properties:
               - qcom,sm6125-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
+              - qcom,sm7635-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -99,6 +100,7 @@ properties:
               - qcom,sc8280xp-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
+              - qcom,sm7635-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
               - qcom,sm8350-smmu-500
@@ -535,6 +537,7 @@ allOf:
           items:
             - enum:
                 - qcom,sar2130p-smmu-500
+                - qcom,sm7635-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.50.0

