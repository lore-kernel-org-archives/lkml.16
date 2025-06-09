Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC721FF3B;
	Mon,  9 Jun 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481203; cv=none; b=jfu92+Jl9GgKMaruTPIsiNa6Nspig7C/J6AqX8u2YXEpaEQrVWXlm7VLc79KMvylGrZSTGtcmdBYg3sjZ+NSfrT/ypau24DLqTp9SEqI8RlHwziZ5coCBe12knzxzIYHrM4mnUXUsxki3eFrOL7xAbV7v4qjxyhI7GKby452+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481203; c=relaxed/simple;
	bh=PV7pE5dMBWkFx+09DLMIQbO1nXOreHSRyJXi4QVzwpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7L/kieglS9b0gmSFWUr9O3l1Up+TIVy2OiUC3pdmrFfXjLZJ1n1yHke8lJ6/bDqKO01iSLcMNkkvGH8odDx0o8FLVBuOAOgsizV1g+OQMQKtO6xyIrok6yYa81ivvUW/1Fyc3T6yLRFdM+7HdLV9gDsp4kGp3Ubjz+U9StaSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDx0NMKn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDx0NMKn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so3706780b3a.3;
        Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481202; x=1750086002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=iDx0NMKngwgnGZUnT9yP6Fp+ryYGqYRT6Gi+/PAEmYAlP0jSx2oI6W9mY/ycHbgl19
         SsC3OOfaTLS/BEl/yvcCIEro7+ZRBtJazAmqcM0L4azHerbysnKzP5xk6R5EJVWOL2pJ
         Lirq/smW8lM0xdn2LV7mIRnaW/jxVYc6C4+b7pw5rRZPrQAKRTNHPbAEcZW8T8hqlGGk
         l0lJV9Ac30TvEkQ8Jz2ZHcxaZkXutZ6XpkhurgxRzGNUZKqqBm6RKa43tu61VrmfMSoX
         t9NzhX6fv21+at3vNtqOPv+4U25l5K62SbSwxUySwRXHGtZg7sqgda3rgkbwga87ZkxD
         iOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481202; x=1750086002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=TO3XnO7BBNgLBsLuJ9YY2Wy9E4GZ+5D1LEYmynZl/T9a+pcwJP3JMm/Ocp9somMd/B
         dRU82uJWROI27V+uzI+tBWxuQca9Xa01OiBS/OVzwbGBCUxeZnAeoeVjzJXetmp6XS9d
         5HOOs+f764NetrJ1voeG8SCqQ0/FHtOtM8cq80BF2haJiDambdjhI/LekHAyiYDl4Nfe
         W50Sghrk8sWFDVk7trZFMbgeMNrxSoCpD2W5WvQo/gZWfWdkoYj/nYeVSCXYlLXp26ni
         EKw1u5KXWa0bl/aQXblj0hsb4h7DjIL0qhQsnqLWGXEwg/IWSNBbZrPF0p4ZHeEkWbQC
         0AHg==
X-Forwarded-Encrypted: i=1; AJvYcCWhOCPsZiKjZVk1J6/5sl09jwxrM8Ar8EQf+zmri/Gi+/LSmmmEJfRZiwWzHwsB1mueuIPAXxhXWQViXO5S@vger.kernel.org, AJvYcCXbo44iITVHySOHe0YksvqU1TIkw5r8RVxeJqwnBz3p6FFu/ruhMmXUru6ODbMgzzeRaOjosTdXM1wK@vger.kernel.org
X-Gm-Message-State: AOJu0YzwvIMNpaW+hfslYRchnSsTNpN9a3xlFmOzl2Vfv09Q2BW1IvcJ
	1pQRhz5pZLdXumn6NlLsGATtv0hkgjNSHPFtpCt9TSg1h4pRxjgH3kXFL8qB2A==
X-Gm-Gg: ASbGncsrmMQKj1vt7PH59xInriaciN/7zZGEmK9U4n2Yf8tH69UQB+BmfI6SW1c3s5R
	1rGSPfXrI3eQnIbrVW0V+o3sVhSBBNkaQoeAoUb7laU9lDoWe2uP1kKNkavCdLAOmD+r0ZoKD6i
	kgDDvknC/gAu2bD7DsKe7y+qDrZQspmW3U3elGna0ILw3+agVOn/kc+A3Jayq1cn64MSCvfX1Gh
	WgBwRvN4jjBaxC/5od5YxXwdS9mXFrJ+PIPQR5fawoDNwqCyT0Pp6pb7XFPrhb/14FkQUqKj4t8
	pOGn/7zvKcbHQq4+v201EVH0yofBpsvcNQOHsdYtdIpxPaZrJReGgGAs9kqahwOq
X-Google-Smtp-Source: AGHT+IGV2BGzzy6R/WMt4MsmQhW4tg+O2U+Kfqh52ETZGaR5pStKS0SKC3g3z0CgKS7hq4xQjozMAg==
X-Received: by 2002:a05:6a00:4605:b0:748:3a1a:ba86 with SMTP id d2e1a72fcca58-7483a1ad217mr10125395b3a.11.1749481202023;
        Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:40 +0800
Subject: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PV7pE5dMBWkFx+09DLMIQbO1nXOreHSRyJXi4QVzwpg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbrSXzpPSc4U1Y/S7t3cPsOVs/amNx26hwSC
 75fHAZry1mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb26wAKCRABygi3psUI
 JIDMEACtoNdBzyO/GML08ZRArDDdSgEyneMLwlJDBB8tfUOL8HgSVn0uDhK8i2+T3FtlNaKLCr+
 98Yevr4qNVc1xGwqjlbu08du5erfEiO8hPxiYob9zpbWr0RBekkKyGTj9ZHL1sd33xZKqEXGIJm
 oaV4B8L94MTsr2LHCqiY1yzY7EFjlLbgkfS9I3apVSst/9xdg9Y4+myUMPD00tO7Ca8NiM1XZ7W
 t35Z1vGSM2BsAlh/p6UJ3fQMqlE0+OnAEC1c4EGqo7oKYeQQDGqT7P8R65nQsVK5rt3yZJYnrmf
 6SodzMx0yiTPYx6ag3Xzo6kEsS211aDSZbeUp5Xo3KBjKogz3jngtz9hs6ZJGcF+KHUscdvpwPJ
 tEPklT4+Xl6sfDE/VZMSnkGXjGzNmTp76NIBgcPmsUrI4P6u5XkgvtTe5RL3QwqgeFTkkS3VLVp
 pB6Ua5eDtEGc1V3Syj9w1F0qeIXg6sEEcVK6lEp1wlkIemlHE92zJAmcZwDLaytBAxxa/fe0O0B
 chCB+X9P9u9dCnXXH6wkVX8k2zDVOxbOuVZxZf79fdlBzWdGrnVgu6dsQFaPBqj/5ZY2pcQVrTX
 KbpL1Hzadb5WV7oNSt5O7z2NOvrHCCFDPEem5oIhDBOspPXvHitN6Cxmh0HB8+SPaWd1c8kAUh+
 7QPNvOF3YH1z2cw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver so add their compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 16bd7eb2b7af2c0b176f0e5b1970f4670af691da..e3aa248c0326c36bb0307e8aad4025b1bc05540a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,6 +18,8 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,t8012-spmi
+          - apple,t8015-spmi
           - apple,t8103-spmi
           - apple,t6000-spmi
           - apple,t8112-spmi

-- 
2.49.0

