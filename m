Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F18274662
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907588; cv=none; b=LS0UP1KL3k48Towx5OOeg/7jied1ojbt4rJnG2Kw3xo2SMP/aPaPfRjWwM5XiUozi4jC+uPPB9pDBcBOcyag5GqCt/kgHdTHVS1elkOulO3cRnSyLnlgUHmA0STzdXPzes8e5LxMD2Hb/sjpYZVuC3wkDAMCVD5RD8i7EltJILA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907588; c=relaxed/simple;
	bh=1p3Ed1Wp3JQMkXl6MiiaCvCqz+Q90OFJQfLZvBqYLnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkXgqLddjsCzoJ6+YYhK1Y/mCTcW9ypvv+23x4Jq0RzAPj/C2ovaGBkdFGs8AjzZcysTu9XIO7wSG4LiLt1i+8sPaYg6Uc6qA3QY54ju5HAdbf3p3gRmu/y6BZ9crq3VZ/lo7Sfpv40RffV24j+9YRloH4Y/PuOu4jQMAtFY3Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r0NGkXxv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0NGkXxv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3656810f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907584; x=1746512384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgrG7OeGQj76YEPIalvtDdq3ojvcIbL+3UwDpcCGYaQ=;
        b=r0NGkXxvLKw9UFXoiHVcIq2rh+K99wdHwbi8bUozbZqKv2nofAlPj8MkKAz1qpWq7U
         vf5mq0/uII2kAlfd0Ty6/jsVSvpIKUlMT+fxLN43YK3OEfMa+z84zXTnrR46g7oCJVbh
         jSrZ05VAYIoa0bmJJOXi7k1mFv6s6qJbk7wV9hW2Bn9Ct+Yh/mVqrzss9iLSbd9HSzKt
         JkXUm9bQ9rAIyVzUYhfmpVFR/GasU0+I3EVVTcI0hcZXwX98lo8RwMz1xG8S85OL3aB9
         insSkbOUBzWrWuzuMv9vnz/eON8U5/oMN8wcNnalE839NQDUi7eFbP9//jRJWkhu3SWA
         H93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907584; x=1746512384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgrG7OeGQj76YEPIalvtDdq3ojvcIbL+3UwDpcCGYaQ=;
        b=BvyVHm6B4DHYXOOwCOk5f7dAV2jmL/p3ODEoMxt4oZW+0pi27RQm2VOOCXSOaVEEVk
         XvTJ1G8SfIStRzH7RgESvVP9agNHgPoF2km6YTj1m30tQZuE3uFUV9xSIKh27OyDCdZz
         7YbtLQ59HsqBGMyj5oeBlsBMZAkzMZd4XeSq3kvNmKsepCn6DmJJx03I+fLWza+g+d5b
         t2+1bwZv3R2PwTMeu3WYnTMiAccNR6rVo3cieXcUspELzO0ZJCrTx6wWECqd1WCL3wb1
         4s3jSTPuZ4qDHr+dSXdgeZkTvX11swFrcueTar4gygZFbhPND98/xFombEmwzw0ailTS
         l/7A==
X-Forwarded-Encrypted: i=1; AJvYcCXTq2LkUWj3GzoADtPbExQmOPX9xEIEJD+LOT7qiM9lfab0ckD2kwlxN+kro7gaOBVHilgQtK5yTo2aTiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXcJhUUnbJ3Gv2dOkLIHyHN9C6LEffeGgSxyrSvOIeI4VNlccq
	HrdDzMMNjOD2wQkzJyDc7HM86xbvW1Ye0FBBbmoUa8wlTXkgcrML5f4o7ZOAvN4=
X-Gm-Gg: ASbGncs9hb+GMEJ1afWHE0X7B3b60mnN4PDHAsDS7JU973Ce4Om+mM0eKzPVmRUSxH8
	DXQYtJjq43kBa029zBVwqEy3reHEgh46zeiaEAwZPTm8rusJjAWVxUhf8mujSgXvXSc+PFzvbRm
	9ys7oNEyjvpCKuQNdtZgNDtLV73l4jKTSuKHoc8oGQwPbknjITWnF/Ok1SCMdg/qsdjLGMuuvwz
	H68TG0NUzxk8Fx1M9FI6tG0de04jyZpOski18jZoF6hmXB4ucA2S5aOUdsy4YQiYV4CRWMzhwyO
	bLyyrrfCfCTvoY11vwvVEgOcVP2Ne2qSQ8V0Iy07enKm+RGNSHme70VgDmcxGu8Iw/ZN9qadvZn
	SZoQwDw==
X-Google-Smtp-Source: AGHT+IGHSL7ckT6XlTUI2xoHREOmOeno84QNXGxfUIyn44nQrEmqF08HXr04DbsCv07w1TWSDtclsQ==
X-Received: by 2002:a5d:4571:0:b0:39f:d13:32a with SMTP id ffacd0b85a97d-3a08a537866mr1031592f8f.29.1745907584641;
        Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:38 +0100
Subject: [PATCH v3 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-2-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=1p3Ed1Wp3JQMkXl6MiiaCvCqz+Q90OFJQfLZvBqYLnA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG97nzjm8S2bPdEwuiDbGAt9JuPUE3hHH4CEN
 d5l0FTLThqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 um9aD/wOuYuYHXnqEPhVHxNZhVZWFZxJHmZAUbkLkvSr3c88SFKnbaZnosW02hkS+GbPrh/QiQu
 MQQe+87iPfi0pZqPZcfs0QSf0P6/4+3ojcT65lIj+QOvCu+uFbA10RPMhC6CkEpO+Q6PgFcVoNE
 /VbB3sQ7RtdxGmY6CljAOZUhqls4daN0yy78gZ/tqPvOZQIwwAfm7U7AvAEMUR4XbSMqMUr2lfE
 3au1OSNRRXwIgUDp3yyScZgrx0pTSBeSoKD+r5SJGW+KdbpNXs14V5v6qGg/V7iDVGC7LHOH+By
 IMwZ05H4B+TM9iK6nBNybIDqzWnbwPs+/V59MwZJp8y60beVh+U9NKXOooW8vPUafX1LElU/FcA
 5raSyGg/tvuqBpsFIEM0NcVYp7g4LtBW5yWowJ0Ut3qZwhuPKalvZgc8vHVwIfpAfVVU7QgU3rU
 7seE8aRb7AkLTBDn/5X1hnWNgRsKfKO6kKmPLhIoQfSGBklLsXPaavjmrxww0Ov3EicnHb7D7Pq
 lNr3sUJQljtQl848LzuDsbtgbtiK6q13+DB9/z2cyazIsdCalOG1GDzQnxEZExE4TdZxaAQPUaY
 Ri+PONPrIfpJW6hzSaAdJrcpoqWyL8pOdmx5zE5P3KGG/BvKMPjgjX6zVvj0GXdkaKiR4IswZjN
 nDgLJRNINGZjpHA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..3109df43d5028c61cbcaa597e7bd8cb530eafb37 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -129,6 +129,11 @@ properties:
     description:
       Node for reboot method
 
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
 required:
   - compatible
   - reg
@@ -189,6 +194,16 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      required:
+        - google,pmu-intr-gen-syscon
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.49.0.901.g37484f566f-goog

