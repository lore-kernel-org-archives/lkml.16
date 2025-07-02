Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB719D8A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436948; cv=none; b=hNCrMEoRNIFaOH7mIAUJZ0deiiCb2wb2PewW9GCOR+JbzYyRYlmwHah7N/d4MiX9Cz3J84hZm3dhgroK3m/dmt7oO3dRnAbf4QteF4QR5iJlU1c1C4k5O/VXb6Spq0qzLsqDx+Jx396NwZdUNLWGh0095aCskhoWhDJFoBPF9HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436948; c=relaxed/simple;
	bh=FLaVe+H/5henra017IcfsYJhyAcqrChTySMeW9rIE0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RRX6NDP6EUv/Vr181BOVFmqOhZ344IoUF6oJqMYJ6rPJNTw0FPx56PvqmCEQhsMb9AsQvqTF8E/5nWg8WXvfGmjzU5R4wYBSvLdanbsx+WuTjdcP/EXz+9T6fPr8Tsgt7ZNqAwioVF4gXG6NolCoD7GKEGBAwFhZyBfqZ+uGwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJ6369++; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJ6369++"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3a4b3fa38so34928866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 23:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751436945; x=1752041745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdbxkzgHI5luNqjYHdBnybrZHqg71IzJUJvornOEViE=;
        b=xJ6369++LBOad34RRGY0C2Nk0CXdZ7B4q+usTwNHrGPBCKT+KgKilHhkP7vIT4x4cS
         TuPWcGsJ6bRhH/M2c7Vt3xpekRRq2og2g/+srFYQLbD37As9QyH2x2KsDeIH0UdCnXVi
         lQmOdWI5hjiSvmVysEUsNhlft6QU1OLiq0by17ioqT75EQjQXLGEGXgceNHOGhfvaeqd
         FEW+QEb/p3RmBIHEgmyDOppldL8VEltnnwpRAptjwmq+Y+cA6kpY+aJOxn+w4dexjOyM
         k5qnOgs5IMdfbTn7wjL0N1Bkcp142LRh14GGSW5+kcktdHDlx4hwI27D/iNUad2d3ZU/
         M8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751436945; x=1752041745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdbxkzgHI5luNqjYHdBnybrZHqg71IzJUJvornOEViE=;
        b=qkqj83a46T64AL89gYudvdSC8HG5C83VWYSg083VtLhh++ifotomZpL/ZJSdpAqv+w
         B2bb9XhYZr+BOQaGvHESNHQEA4tCQwtFvYVI7bFVRnUDdQZsXzolaVKBWZOKEEm1UDsr
         SyBb3xz998ac8Zr+Q4k8Sgj90d4T9lErArc4zbCXtpe3SAC3M/OPqRYAW0LEbQO3WS1z
         z8Y1dp+9awEB6OzYCjjr3cm9QBs/DaCluo1kkCOGoFrnby5iJ8NPVQYccyo6gtosKQUu
         n/x/nbhwham8FPxSc7E03Vou+xc5J41Mj8bGfOet0ArjOwA7FQSOcthwvrWtuUR9Upq6
         7QfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDwF2C34vBS1kBR+RxuKWfkk1p9w6ezIvUFrU/qLEG3VXvTGaqiBqW41+W9bim7QKLMaP1YK6o1Ig5tOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ucufQDGiMAHUltVdhUxg43qSxXsg1ro2p+u8IftSPeQ1Aiv3
	dHiDKKMVPT3w/fRqZ1XZeUBRwguyE6xcqoq7jSk4JDCAT+MY/wcIZGm1hbOBRsq4TvU=
X-Gm-Gg: ASbGncukLNKTM+8WJLP338Je1lwxXFX3r4dKwOME4FLCnxPzrvqj214XaThtP4wGCil
	jIY+e8AazVE5OjwXHl+tx1IUzyHMWKfyPi9Yr3BdOGHsETaFMhYDvAGFHKrohhCEv8R7GTKZxL3
	G8QeNufSZuxGaRS/tnD12/cSVanPiHiqRtdvQ47gqcBrpSnKwqEaZHqJJqZwxUDqzIUQJoqBp9U
	aiDqVFCNRYYniZ3NnPY6DEqAhVoLaIQ00JSRL+q0chEikS69/QmA6rBcvzH/E3eRQZRxFQBMd/l
	ovblX0NTiGykeyQljpy/JnmEyuB0tseEjf+JQTwAaXy1H6yZQvM0RLLOqA4EzqvILoIyTkdcKlI
	=
X-Google-Smtp-Source: AGHT+IErFVGqx+MRKEZaebOZjF4D23rbEptzUG6EzmIWEtxVkYTOzvHdOzM7YlWZTcHShTlbIrQ4og==
X-Received: by 2002:a17:907:608b:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-ae3c2bbf645mr51321066b.9.1751436944411;
        Tue, 01 Jul 2025 23:15:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1cc9sm999481666b.168.2025.07.01.23.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:15:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg' constraint
Date: Wed,  2 Jul 2025 08:15:31 +0200
Message-ID: <20250702061530.6940-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030; i=krzysztof.kozlowski@linaro.org; h=from:subject; bh=FLaVe+H/5henra017IcfsYJhyAcqrChTySMeW9rIE0g=; b=kA0DAAoBwTdm5oaLg9cByyZiAGhkzoKiUOc0gOXXpRG0YAdx86FUIPvNYKTA6UqMG80O9BNt4 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoZM6CAAoJEME3ZuaGi4PXXQoP/11I xG+8AWFlDNGwVQygvf9SDD4ogj0uCRqQ6USLs68GBVCj7TYzTWe+1aQJZorH0GU9rSjDu5yTyNt BeN41WWgx3kvVeYJ+jtgAwbuZaeDyhwQCMyKiN98vDa+5iFROeEcw/thYyH3HDosFPZrnToKcHX 88ZA2/eo8ZDBZhneiz1x9DjWQi5cNTqNdOdEPgv1QyEGpCEuzCQQVPfubFHLzTFVLft26PJwOA2 PUUk8NEXnMSEN1AR2MRdSBFONJ6ndEd+XRWtpwjLnLJPHp2cXuO3VF8tgeGCrEWdLz0N4l5Eo0U GNDscua89/DMnuRYWtnF9hHCynS3PKIuoew8RXSnorsYmsFoDFk1ihSQUxqoJ0Y6zUyfQ3e3hi4 5OeVIefWWTGw7jzSVXhEXtMDND3BZ2j3A8CnD6jNfEL4OqtG6IN3ut7Cj+8XQZ14Wdg4g7vQmmS +hFcVBND6LZ4bPpM68TNd1cpVX/s+k5ngdqtblBa5izzC3fxF5DONI981ahjKyfv8x3vH05PElU tfwyVd13DUWQtxrwG5hP6r5GAunb1d2PAF5SSJt/Vv9hSW6da/UqXtjZAxcUZSUWPVjBAx4s54n /MaToZmtpdxN8E5cE2Y4/H8jgCJ0bAcsW8u77w6zs+uWGBGKzu+Lmy9S/yZV988+7TPxmunyHgn ub9yQ
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Lists should have fixed amount if items, so add missing constraint to
the 'reg' property (only one address space entry).

Fixes: c5eda0333076 ("dt-bindings: i2c: Add Realtek RTL I2C Controller")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index eddfd329c67b..69ac5db8b914 100644
--- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -26,7 +26,8 @@ properties:
       - const: realtek,rtl9301-i2c
 
   reg:
-    description: Register offset and size this I2C controller.
+    items:
+      - description: Register offset and size this I2C controller.
 
   "#address-cells":
     const: 1
-- 
2.43.0

