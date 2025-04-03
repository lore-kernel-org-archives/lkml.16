Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4C24F5B5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691525; cv=none; b=kSCTFALIrESXTnceViaoUt/RZaeh9C75k/9+VxnI755HIA6wBLnm6+Hyrfes4Uwl3Oj3x6KSHyk42ZgaltJ0kQeQcSdr9KBaP48kC0h/aY/Gx/8wjTkl8PAa2Rwr7wsuIAPTT2ticC2OjXioGyN2hUseiH4NlRJfeiUNhXKKQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691525; c=relaxed/simple;
	bh=IbCqT9Qj0SRvRVX35LE4R/zFAo0wm/0sOgn3wEptBnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M4o3QBaMPYs3SAgs1kW7FuZIJe2gI/+3GkEHhgIN0i2IvCPJ2s64M/daf5AoBAya3wByefJGDtsZqgbmJmWgo9iRLNm5n+8ir3ZHHsOjFPLgw/U9Gl97DzuoXGcNLqg8iZa1qXYuCC5lmzi16QqhltpzKaDlLaw+tx+6mpQ06RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rnk+7Tq0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rnk+7Tq0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac9aea656so883638f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691522; x=1744296322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvuT5K4ef7yME+rjzaW3Rw8HkErqmqjuXIV88zDMXzk=;
        b=Rnk+7Tq0nWy+HJleAvS0TixeGm3lFWOxDsamt0XK6ztyAGEA8p6pfcb8yzTJSNPFtd
         GS411lno+EgGg6o8y4KWEMwjatCfdGPLy+Z5L/YXry5OCpz71AZMW4eu2q3UW2wJlbiY
         k/oMwIBX4WVtLwTlkEfmw2SzdD+U0yvv8fyDlnMDeoC7BrB8TgFkS9B6Iq82acjKr43v
         G1Vm6KlQ7Vto+lUFHQMCF2EOtpefKWTp4OJjTe/MmA2IV7HJ2Kp4nvfOThb+aGMa8Sus
         5L5/qw5PdEETZe1DfuiOkRkM7NIURev+9J4wyXbQ/KIgLolQLC7KLHo6AUvI0w5KYYnr
         IAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691522; x=1744296322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvuT5K4ef7yME+rjzaW3Rw8HkErqmqjuXIV88zDMXzk=;
        b=SJQq+gjEyhoXLvKYT6b/fF+cLmz63TNpepO39mKQsbF5gITZmEIcTFK/5fzEZ4dHgv
         6mskeR6JAmN7x1nukKm79ceHRmmv4MVQ9FHpZlkuEWhp0Nfg38JLbBchpucLtP/7Rr9d
         7XrbuFZ9VK14IYUmD88Y1/cKo6BKrG6jagfLE+V1NlgFlOzfv2gEHPHckNeF4eiLADTM
         IMkL91ayKkZPOfDaqWYnmwl8UG91RdMQnMyXpnQcJTENWg5NbGMr6R94zPAjaI0l9OvU
         3OlhJHgKSQMj7yhqRX6ejOk5QOsufSYUx4N/wLYG4QIsmrn/gOkpa2bPrpaTOdZ0h4ko
         ziaw==
X-Gm-Message-State: AOJu0YzqdsxVbN98Yxwgl8KWr/scMy27Zlr7pqurGdaeitNrcIIfB3O4
	Fgl2EErsywWypWcxMHRCUPJ3FOso4w42pPj/SKP1vrGClXX4HkND9z0d6SsmVIE=
X-Gm-Gg: ASbGncvPOwCIyaq2/OXEgu2tsfSkfkLev+Qe+FkHwDBN2tOy1nImigBYYdJj8R8Ml18
	YayyeUTdcZJf3qf1lhzls159Rew31hkJIoadwL24uEQF5gE3ZFSnNfLZZf49amU7pc2qUyjRKqb
	ae3AF9OA2kx10+gXuaUHIJP/1sAdfR1u5mEOzG5DxVC8K8pFBsmBN1tYAAVDMsD/01uOJKix5ys
	QwDU4nSPOO2n2NEd5jjtdRDmWnS3utNCK0OyWxx8+vk7L6DrJcCg6G3FkFbaKrKJDWYiC3nD8qM
	Q46WHsGv6nz8TAzZt6mxGnfS1IYNnkkW8JBO27CMhC1be/eWaYy4PoawsIEd7nvAgpTH/w==
X-Google-Smtp-Source: AGHT+IEawIaItdhkpU1YmQ/oG96nEKNdlGY0SU/p9H8bv5b6/nb328wX9cF2woTdcGY6z/IunfNdkA==
X-Received: by 2002:a05:6000:1842:b0:390:f745:bbfb with SMTP id ffacd0b85a97d-39c120e3411mr17865227f8f.26.1743691521984;
        Thu, 03 Apr 2025 07:45:21 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:21 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 03/13] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Thu,  3 Apr 2025 15:44:51 +0100
Message-Id: <20250403144501.202742-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=315j7te8DHIX7CoOXD6y1qrlOdPkjXrIr2YKi7/ZYms=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7iX2vpbjTlrfTExYn+V6o2x+tqTgVZJEb2u /xU1V4GdbKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV N9zKCACCZ8QwGeFdsmW0A75jjiqBELLrXZbzCw284HPHzEka4mwE0xCLmiWzLUa0OAIKIG0styW Zeg1fFh51XDH7gEJC2B4sxCzLjyPT9sWsZkVmnBi0kzhCvNT+sSbeIDPfpMCoOUUnB7sB6CyiE+ eHGgfuv61rWkfNK+KFI+cROrGnZ16lDR1wm+qoR4UmzCSPKx54VP99s/w3nQfl54equNno5b7Cq InMzhqmk7NERijM0+a0XhFyT43TqpbXJ8GR8TzkzACcVSrpB6OUbvtM8ai2/CK8C+SUCSdy72M8 8zbX91r/a2d6RQnQXlfoGotJzW/pYSJXz71GiiJI2pRdt0kn
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

Document the OTP memory found on Rockchip RK3576 SoC.

The RK3576 uses the same set of clocks as the px30/rk3308
but has one reset more, so adapt the binding to handle this
variant as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/nvmem/rockchip,otp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index 3201ff8f9334..dc89020b0950 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3576-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -70,6 +71,26 @@ allOf:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-otp
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          minItems: 2
+          maxItems: 2
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+
   - if:
       properties:
         compatible:
-- 
2.25.1

