Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09B2EF9DE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843413; cv=none; b=sgAorLe0m64kOe2N6WoRy7WXLSGamSdFkylQ4lUD4JhdGOKtAFoXzeBdDVU8qArxpWc6JpKYBDpjB6ystmEznSBezaJF6wvb84ii+6p2xM6/vHQH5Ft0fq3Db/KSt6AdKC3gU415EXg+le/lO537Y3mr+gGWHCMztLTJ1h/SdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843413; c=relaxed/simple;
	bh=jj4FXpnaY2L8qRW5W5/06pfPaCeBVQY5CbMDnnBtNOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xjcxmjrw1x2+U/8OL546DH/7bwPQfYhxUyHuMet0UArpkJfpxvIKgwlpzUMmCKdUQlzCkQSnF1yIAYC+qGRcEFogWjHDIyll1pgWj/93Yb8rc7QArHa6FhOhan7PILjCJ6wAZLaNbpJvhX7HP2hT3qgEJOuWq55VFNT90+W/xqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TYWShlci; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TYWShlci"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so981639566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843400; x=1751448200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=TYWShlci2W5Vwl3f0oDuA0g1jKsPVsnAaplQ6wJo0q1upNo7DmpauwIWLYQWJybV1e
         MP3HQsU4RR+e+fV2MeWLKo14TBHoNVcCqw6nypUZJ9Cd4OyvYuRjV6hg046cDcCoOTNJ
         Q/Leh3Sx7qGqljcXbzOmTAWIhkUAe0vkzORj58R3RuK0OoAMVJ+97djUq9NiiVtvnfa7
         3Ecc8Em4E4DW7vERFkRl5Etwnovx12CB9z2pF3Q2JgoVTyuc9U50fcRBiS1rjFHk30F8
         otXqmlPtDZ4HqfC5rupSp75N7Oc9Npz5fAeW16UBNxeWoIMv1lWfnm8j0A9hrWE1QtTw
         zfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843400; x=1751448200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PueVIxrY0Lhx5OoYalpVzj7TJ+cyHwt+DTi/ni2FBMg=;
        b=L9gysiCxmnCwMFRA8ziS0ulIoKYzQXgy+2TIxdXdFkeFxa++c1SFUwfYjDB4m/ApiG
         As6YDvn6t4hnbonaOh6DH8LZyF+N6So06gu+sHRTKM9NZvfgL4OLbUctrhhQ6QmziKUH
         vhKo3ypY/d+djvdH+mmiKf6iWxXEM3XWu5ujoH2GodIq1NXGgoljr0A6G5s1vISUimOF
         HGTUFICEkKZS2PWV5c+nzI9PK7exKMF4zU5e3cZ3+VJw0Y/Uu0Cmwg36tIhCK7GTm7W1
         P1j9ORb3sEVAFh9t4CzQ6ZLGfkLHkfFcbfqmHx996ePS0KoMgPqisW2+xiEzxEQYOSup
         xVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjecVWPWSeKGyBtzTKIUCUFgrVQaSRtjK9Zuc9dMrHcpeYQ40GPwIqpCq9bUDWeV8CXLF8/GQwL38+CXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzunRBaq6ioAYfzQbnJEf7YZZCqllOe6QTsL1v8qC68muVEex3V
	AwkRvUtw5KiPah0QaMX4yAfxVaQJNb9FqGBxmr7a8IUAcE83aZt9tywpICS58gSVXkM=
X-Gm-Gg: ASbGncvFlG3fhk87Nm2azfLbZsxHMuj/zUyc+k2jU3YTLqskGc0biW17MILrMvGMsO2
	wttinNDM6e8LPEsz9MmWXAGvCOqKwBXRPPC9HugUXbh86JcvN02t+5pqMpzms5uFfjfR/c1fzBA
	ZJtyhz3FFpcoDynHGByvgVD7rSF9FV+wbGMxNEjDhsIg7igHOWZu7ss0zFsyVm1xnoNVTU1LnMz
	e8UwNjw8Tohnr14eqj9sQuHBUGJQItGtAD3FgUZngpwIce1wEsEA8SXujsdFSGYdxxIdB3CimKv
	lc5ZfbrZmbLjDOKQRUkBi2xmDIWROGEqP2Rbps28wZlzHIvfaLQzercUVfun/yYveMJzPr/5Trj
	9WH1QFaCTXrK/J4kMmjF6PqA/KBEeZYto
X-Google-Smtp-Source: AGHT+IFufR/i6s8bQEjNP+fAneYyap2WFk8eT5JzaxB2nRH9U0X06huQYHvxc1UIF4P5JtCVtPmAUw==
X-Received: by 2002:a17:906:6a12:b0:ad8:8529:4f77 with SMTP id a640c23a62f3a-ae0bea790d5mr233626966b.38.1750843400340;
        Wed, 25 Jun 2025 02:23:20 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:23:06 +0200
Subject: [PATCH 11/14] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM7635 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-11-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=920;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=jj4FXpnaY2L8qRW5W5/06pfPaCeBVQY5CbMDnnBtNOA=;
 b=QKOjYfcAGy5ZXnCmFyoCw5qgS3UKBJcYTNOrXIfiYw6DV7itFoCGZHGaadZiBNtQHiCfzjhFV
 Na8qSuO8OQ1DyaQjIxXMBvzPUgOVhYUCHVfApprHUM0Cz5utU9EaZ19
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SM7635 compatible used to describe the pmic glink on this
platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..2b77021b278dd9dca604cf31e39d9eca98f2aa7d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,6 +37,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,sm7635-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink

-- 
2.50.0

