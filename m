Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309481E32DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473032; cv=none; b=mve/hjKp3gT697IGDpKiVvTiLFD9rDEe9KZZUGZbU2ePLLVB5jezwvoaTfYRIGTVB22XjYLdfcu87blXoYrZxxD8Zsp4+UEx7LPCFR8AdsXKVsuKjwSEh+Ic0Db0T8YzT6tSavJrGp+KCedDTO+oXQHIXNTOeGLtEoiozystEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473032; c=relaxed/simple;
	bh=N6w5ocafwebBiNMgi0e1/9oq0U6deIfUb/h3sckv4Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9oPYINpcHH4CGuJ/pEpWXFsBlKf7vZpaW5pVKc93uP+Gi/RPexgnp9Yil2VefAYWfIjAzZt3bSEG+xmogGAnRg3BoOyPD0QgFRR6GCbtQWDwxwa53xe4nOym/Z91NzT9dsDnLN4OZ23LP5Xetw0eX3v4zDOM/g9vlIZFrOBGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nyjw8tko; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nyjw8tko"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531898b208so2496645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751473028; x=1752077828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZV7K9gzSH7zs3d+hR+/IvlGu7qHrPEIqi+iLPaQt08=;
        b=nyjw8tko8e6v+5Sq3DE5u+ebWBHzitg2UA2WKLscmRdEqd+q/mFJtNmYOu+jiKOs9c
         EzwZlVEHWakA3e6OOD91fRYVpxtzhZ1prTJL6kmmmy+qJSh5B1EJkVrCfsyyYI7uuu7k
         Ey39lOaWGrN6gYcBAn/9VgZAj/XzGvbJawWWSYo/B73b3qEDstH8lrS/3UCn1n8lucSM
         hsF3BQKqR9YfDxnDy+A3/IAivNVIPQ1wlNPTV+X+Hew3TTLkB4Y7rVyoLCffJpPxwMTI
         hXb+nZBzKZrEYKy06pBMbzBNY189YzhDMqQPMRNe+8pFJtCoC3UmN5ak9bvfvxhyUzUP
         qM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751473028; x=1752077828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZV7K9gzSH7zs3d+hR+/IvlGu7qHrPEIqi+iLPaQt08=;
        b=IKzZwAQcS7KN13HCsTN17Iwp2jWrpCUKWRE/ESd+XWss9NSdKRcCLu8SXleq3VZamp
         piINQCwx+m+C6P2xDOnQ7Rhr/Xxk+PzzANgBxbLW/JUzbOvNVhuu053N1CTe8UWHeuN0
         YH6ZV7+tmExrhlRmSMPF5hDNQiW+MjcuCVI+AAAeRAiSO9beLekHcMV6CkVeEfwNco7L
         qGSo6q3aod/49PeWtPvU/gpuKz8g78SiIqDA+3BlqCUjqikQe2AInr0tQD08JjS0X4D1
         U8p5uOSelO+LkacEYFG+sIHZal5PICp0tnT7khBs8H25In6PUJBEMtN6SSaaygSuWJbZ
         3Nig==
X-Forwarded-Encrypted: i=1; AJvYcCVaDHvxCaJrWvab3eoLV9SIqVV/oUcILxoSWZxLQu3nyRN/LOEaZMmfqnvLOtXt5POTVBHBqUr5UeA0Uok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi04ReHMPBf4lWRJXbsJ6zb9gIPzq5mST9jG341IB7a3n+n85r
	atHJIRsOVQ5rELsU4gj89jMxnLMeMbuclnkMkO2KW+wNLk/ggEG2r4536/C/ttDc9Lc=
X-Gm-Gg: ASbGncvMa+qdjNx0PxCqp1Hvp9VArKgtOlPY3ZIebolX8T/Sa2upq7OEIJ6bSOSAa26
	bk0J8bARDDfcydiZjYtZvqxNFttWctqlEa2Wwolymwh2U8mP20HpV59zYCyompXu7/0loEW2AI+
	tBdFiTQBJG5nI2thxOKyXq9WBZzqJ28OxBuwgvxINgQjc5cOZHHSE0bYobJA4f3jYGzciLq4yTu
	zkrBwL8DlEVYskEWnOj80btuySfd/x5JODwBKRp2YzjbalR+w2MaTSDQjRacktLRM+YKeBqonwO
	KIJZL1RyyO/uAIwwTQj0uYkIiWpsS58ClgGx7C3E2xuMNEY8GPl+8xK3kSGx1FrADgttwY3Ks5Q
	=
X-Google-Smtp-Source: AGHT+IEHWqRy8MijAgqzuOdBkGI3eGTj6ssaO9cFV4rFL7c+pb9YGw5n+rDkzIwmr8Ysf4r0MgmJ9A==
X-Received: by 2002:a05:600c:8412:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-454a367a6e4mr15832565e9.0.1751473028343;
        Wed, 02 Jul 2025 09:17:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969aa1sm2470435e9.6.2025.07.02.09.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:17:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] docs: dt: writing-bindings: Express better expectation of "specific"
Date: Wed,  2 Jul 2025 18:17:01 +0200
Message-ID: <20250702161700.229458-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3645; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=N6w5ocafwebBiNMgi0e1/9oq0U6deIfUb/h3sckv4Cg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoZVt8ZO/GbQXk9Y9D4xHMd48CvpStLM5FCBTqZ
 M6pV87i+aCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGVbfAAKCRDBN2bmhouD
 1+LJD/wOovbh+vuiQg+t3Yk4ldzDuDjqvRtxTKNUguuU4XjCLLhTvydtyUwFUN+Tw7c7agPB/sb
 +6ppLvNvQDIl07Oj5a+WhOOkjgpM1OJylEi2h9E4FY4R8J5FBUs4nn2ypyskVKTEssCLpUJao/P
 KG8/z9q1L+r3KsAHuDbZiyF387P3SYIPE8+nSrqkQPPb0HYtUkCI0Z46WlF7JJME4+BmujASlD1
 1XZyPOujeSIZ2aXZ0U5QGlDOKPhIMYYEa2rU0lZdrzTaOl2myElq7y1k2I5KCIeqJd0ucxBE+Vw
 4tBxwWFiqxtkHTs6+x9R41RWMkdlfUBghscLZ/r1cAwzw261MrZN6eQCcetNZWIdqN83wNSGC7m
 pLbbjUm/i5uENobHnvAg7L0ZV0cT5Dnn2H7URs6GwpqJdsrNjEJC4YJ6tiOUtYYrSM+dDho/GUd
 LnTWC7VncIyj+O82Qz8UDmEE+rxBDxGSlNV6t2htlVes6Hyr58q88B1z6QHoPgCJFpNbUs1x7+U
 DorqAichsuv67mvmmeKzVIIiaCzm21DBg9APHBJ2NYvCty/49KW4ZmqLKJLbQ6YrqLbdKlTqJnP
 pCidBMPwC7rx8nUfXcg8OYkweiJDRecdlvEBMO8Xn+gOhwulmlw36CU5jJfX99Iv+LcvT7CKIvw svxilz+HervMJUQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Devicetree bindings are supposed to be specific in terms of compatibles
and other properties.  Short "specific" has many implications, so extend
the description to cover them: no family names, avoid generic SoC
fallbacks, avoid versioned compatibles, avoid properties implied by
compatible.

Also document desired lack of ABI impact and acceptable solution if such
needs arises: clearly marking it in commit msg.

All above follows established Devicetree bindings maintainers review
practice, so no new rules are introduced here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I have vast (~10-page) document describing DT bindings and DTS rules,
based on Rob's and other people's reviews (with references...). Let me
try to funnel it here gradually. Why gradually? The intention of
writing-bindings document is to be concise, so rephrasing my 10 pages
covering each little detail into generic, concise rule is not that easy,
especially for non-native speaker.

Optionally I could also post my 10-page guide somewhere, but then it
would be one more document to ignore. I think we have enough of such.
Ah, and I would have one less topic for conference. :)
---
 .../devicetree/bindings/writing-bindings.rst  | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 1ad081de2dd0..dc0e4b63984c 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -39,10 +39,15 @@ Overall design
 Properties
 ==========
 
-- DO make 'compatible' properties specific. DON'T use wildcards in compatible
-  strings. DO use fallback compatibles when devices are the same as or a subset
-  of prior implementations. DO add new compatibles in case there are new
-  features or bugs.
+- DO make 'compatible' properties specific. DON'T use wildcards or
+  device-family names in compatible strings. DO use fallback compatibles when
+  devices are the same as or a subset of prior implementations. DO add new
+  compatibles in case there are new features or bugs.
+
+   - Use SoC-specific compatible for all SoC devices, followed by a fallback if
+     appropriate.
+
+   - Specific SoC compatible is also preferred for the fallbacks.
 
 - DO use a vendor prefix on device-specific property names. Consider if
   properties could be common among devices of the same class. Check other
@@ -51,12 +56,22 @@ Properties
 - DON'T redefine common properties. Just reference the definition and define
   constraints specific to the device.
 
+- DON'T add properties to avoid a specific compatible.  DON'T add properties if
+  they are implied by (deducible from) the compatible.
+
 - DO use common property unit suffixes for properties with scientific units.
   Recommended suffixes are listed at
   https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
 
 - DO define properties in terms of constraints. How many entries? What are
-  possible values? What is the order?
+  possible values? What is the order? All these constraints represent the ABI
+  as well.
+
+- DON't change the ABI, but if ever needed to change, then DO explicitly
+  document that in the commit msg with rationale WHY ABI has to be broken and
+  what is the impact. ABI impact is beyond Linux kernel, because it covers also
+  other open-source upstream projects.
+
 
 Typical cases and caveats
 =========================
-- 
2.43.0

