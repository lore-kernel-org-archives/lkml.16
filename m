Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4729ACD8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842938; cv=none; b=Qm2w3cJD2/BGRKlOnImU3hq65+QBSIIF7PWHAum4ZOHuROwa4VXesV6qHlFUlCv2zsxfBCnIBy4PYi0pZxX9iU3R/s8UkzwTFrRNQcULtnv2c10aDIuvj+B700ZWOL6pEnqvBkIGpCu08fPoljLVZAhMGvGfbu0XXwmqVN8MaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842938; c=relaxed/simple;
	bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGvg8cVBsIip7wK6WZ/qTQJMQHSL9xDlMJPYnwwZ/7JLExkAPUEAkdbolinhDPxQNCHE47hOTl4+EpIheCSnxIIJAOk+rrOTkHwQmzA4hMcKpdYmcwjvHI/kkEI4AedV3AV68dOkKUbcNN36wb4sqMi2TYlDBjCbMvBBqFUajV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5ZsAuNk5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5ZsAuNk5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-addcea380eeso1031744466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842935; x=1751447735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=5ZsAuNk5flxRjdA5DeVAMW2lh6xoxyR4ixDJYAEy8F/NT5a8ALKjRLOo9NDnhNYsFu
         WQ+tvUOHTBAXPO9bZAkzITnHnlSYaX2SEeDqHixbWs8xR1tZuUDtucmdQ2bcrF58ct+7
         d9tLQrC5xGdG2kJzAF6C4diHWbV4lAdpbk1DdGLmoyuUaNX/lONPPzalZFMYLDWoOXtg
         9HfeE3tr4jH+eufqg0QhSAuQQrMMiZJyRJ3uz3e86hZbeb+oQouZ3F0V1Pid0KQrxF1S
         l3j9tqfLEdKQ7QFspmPyuqrhVvroIB9+zTeSqL3gbHPaKJmVJxQ6VJPWORvzMSgytHCD
         6R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842935; x=1751447735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQwwvKO2PKJcXyU4BMtZgmRvWaY7V2OrNVftKUzlUTc=;
        b=PjxYvrHKhECq59BZfH1Et2kj5aLcvHbkpqrBcLD9CtNkf44V7FeCG/dplnz76r+vUB
         HiY6akKCF3WfVUmHb5SER4zDWw0NgrTTdDSLwKdhU56PZKflofOhULjXBpB21j0UYKqU
         tulgoWY+lejnw2My7g5tiZlJ3nCItkf1T+xorYM0w+YvaBtHI1HA9p/DI6Ksg2qqk2RB
         Sw25woMEFN/XxmO/TecUuGfVh/Xl+w5pSQghLeHGiJrcUdzGIA8QPf8nlciacmXrbcSC
         qo5nTLUNArHfjvltdeFThh8sEObzy2KMrP6UY/0giKRoEeYIaxouZ/JcAQhKXY+eOU7P
         NgQw==
X-Forwarded-Encrypted: i=1; AJvYcCWpGcWKlJQ0Qs+KTuwGs4M8ua51XoNnO8Vn1svxxi745XLR4Uq6O4aq3lybem4ax1zU9MVC+TBcvdotz1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzgZf6c6iaCgD744fqm7kDG0VmbI7p4xtGydb0FxPa+RBmXVo
	WZk14FLIfCXYc4d1dADcgZWm2rmgSxCQ2DMoF62OpdXAE2eqIDK0tcIUqJ/PIPLZB/w=
X-Gm-Gg: ASbGncveOyAIpPW2g5Mz8kX+rCeuw/kz3w1S2m4a0Ok7zSkKbnSReqVg6oWSH28X0Cq
	wyGWGx75paSmQE65XK1LMKa0x/YC+4PGy79o3L2PktpDS2EPJQtEcSHbqZL2d+f7a/jzla9wmti
	4QydjmEPQ+AGEzUFhvurXFmLrRynV1Jdt6xRNgEFn64UdjluPUj7RJT0vgWBo6bsY32TDSyxK9s
	gTVsnA0wMnTNZrei8JPEFayVzIc8iYdVds6CIewQvioxcZeHpJHoovhBslqp5vgG7VZCIdovh7r
	F+m86cztFFAH7pj6GMrUb8x3FNU9hMhxrIOQ6spgcXGjg4qANAJvRKF1bkFrKYPuZ0i3wy97wFe
	cJ6XEEoGhUaluEjt8pZ5XO9u+pb4nGzE3
X-Google-Smtp-Source: AGHT+IEdvnMggPRjXeNXk9UrWAy82iX/E3YmgkRFIIX7Dwn9s76Z1yNwQakPIdmgVTzFWVP0kMULvQ==
X-Received: by 2002:a17:907:3990:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ae0be9c0a0cmr234927566b.37.1750842934951;
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0542035ddsm1029713266b.147.2025.06.25.02.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:15:24 +0200
Subject: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: document
 SM7635 MPSS & WPSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-remoteprocs-v1-1-730d6b5171ee@fairphone.com>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842933; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Etot5qab7z/I6hAw7yp3B6boXmmNPslhH2GS6MLF/o8=;
 b=lwVYnYjT3ta7F4XNDWGffuCCAndUwPpyI3CUun3yyQm2dg0KAa/k0Y0gEn/TWAaSv+QSMoFWB
 eFt1xh6vBvcBISUroSF2a6djQuaV3ag4qJEUIuIVNlkRGdIIsoyqUC5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the MPSS & WPSS remoteprocs on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sm8350-pas.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 6d09823153fc8331f04d4657d9acba718533cce6..9ffddafea33739d325fd4c469642bff461a933b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -18,6 +18,8 @@ properties:
     oneOf:
       - enum:
           - qcom,sar2130p-adsp-pas
+          - qcom,sm7635-mpss-pas
+          - qcom,sm7635-wpss-pas
           - qcom,sm8350-adsp-pas
           - qcom,sm8350-cdsp-pas
           - qcom,sm8350-slpi-pas
@@ -91,6 +93,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,sm7635-mpss-pas
             - qcom,sm8350-mpss-pas
             - qcom,sm8450-mpss-pas
     then:
@@ -142,6 +145,22 @@ allOf:
             - const: cx
             - const: mxc
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm7635-wpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.50.0

