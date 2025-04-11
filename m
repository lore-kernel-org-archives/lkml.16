Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C36290088
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370589; cv=none; b=c1dkAM5BDYtJX2RwxRE2RDYP7BbF6yDDO8ml5RQDlYooGeGT4IbyncXfdXu+H0yDz8aDGCTPV2KF/DhHgYJbjTgM/9RVtICI0V+mWRawPk1Y+9ZKK1IoaDNOMltog3ig3xuncVDq28mPB17JYIIUuwgV6KqZZqGa58MqDYhTJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370589; c=relaxed/simple;
	bh=IbCqT9Qj0SRvRVX35LE4R/zFAo0wm/0sOgn3wEptBnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WeIdPg5krXW+iYSXmjrnggyXjhhKNE6U8F2h3OZ7u1LFgMwxYXEfrvTKH3t5niPYgngGfDZpeCWpiuRzu/L9cBc6uomLSYCONFBBXG49wcIKG2q5vEovPRl9p+3zjMoD4Fub/T7484yoPihjbTtoRdCGNX45R+lZ90zZ6re347c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/lsgVC+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/lsgVC+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1517710f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370584; x=1744975384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvuT5K4ef7yME+rjzaW3Rw8HkErqmqjuXIV88zDMXzk=;
        b=k/lsgVC+BWMgVaJv8FoTZwK4+hHpHuTKqhfR4cbm3AkKtAkaHKY2LIba25JdORMbsx
         VvbVnhxncDGLZp9bNiCiGxyrbBS1PGWeXQj65OlVwQ+91sP4WRpprx2qDVBzGFljVYmD
         REak1dfRGk/hOlDi7WpxayCPjMyDnkooxzCN6QM8zidGfsykeA3hyqQfk1O3LCxSCo4g
         nvc6suyRYstzncf2vnFuY2bXQKN85MTWHMgrAxOoW1wxkYTbKIwMTcqtmzxnUgm0W5pn
         NOcejH54btyCYbbiea0ay0TORobZcxMmNru/ZGI7TiMUrSQGikJfjEy0N/FAKq97TJXX
         CtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370584; x=1744975384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvuT5K4ef7yME+rjzaW3Rw8HkErqmqjuXIV88zDMXzk=;
        b=mI+N8L9mOAJZbVib9tGJlAhD+SYP5tsgtZ+EENvxZ7HzpXPkwY06mxMmzvjXTx68Qy
         T+5+yhQIkCZKdPKx+jTXocJnpWbCVxYylULfri/71XsRmsStySSLjgrcBhyd70BFNq+X
         N2l3/oQM5ajbWf8qoUbwLo1nWlZNiarQiFsEzP35k+s/JsefMhiLh3WnlTP/8/KKIrB/
         0qYMrZs3nzhjwhmVry36k9Wk9DDnksUx23hQQDNroUhgRkskIYyxvTdO20hXz7U6pePv
         PWVfCSNK9g3F4Q98U40ILqPacCPPg9R8qIC8x673PIsSDKVfZkOzZ4oNAKBza/sENtdf
         nDSA==
X-Gm-Message-State: AOJu0YywEmKhLHCQkrrNXY9Y+GLFFFL5bSRhiGkezf3KPe3DTIiQVy/R
	FQRUOk/VZy5x6lLQr3d+rsovKzzi3vJdyiMoFaO6cfMwCL8ojsgTY3S3czAFGbo=
X-Gm-Gg: ASbGncuGgpCv0uluRFyHfv/yRb0QwuZYav4hUz6zMRJRfcqJoM2Sip3mSvmFLoUqC2j
	ZTfSr+hoJXXOUT2A+eTee4Ji0O1SJlmCrj5RrUSFyq/uf5WaLTIa78liAw/xTPlLOrnWzy9vJZI
	JcEGOTZaZOaoaG1a8YyZ58ho2mnX3Z6/DNlHb3S1wESK+K4KXH96LrkB97PaWT+9i4Lrl5LWIyO
	U87MFKJb0ygF8LYWz1hV3T30u3Rl5zLZwuQLxLy89QfAAh6fwGqGh06nEFS3wekbeLwB9iUFHMg
	S5JLHye+mZtDjZ5iRn6tVVFAPMFizWoFmKXkavufwKIFq3EADzKVHMYPaW7d2rqTvg==
X-Google-Smtp-Source: AGHT+IHXZXXeLQ1KPHL/wRSBBghuLAe4x6MaJPp5u1iAgPzXlypyasuKyo/sUqXHbz8nGHyk8jzFDQ==
X-Received: by 2002:a5d:64e6:0:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39eaaec75cbmr2064863f8f.46.1744370584449;
        Fri, 11 Apr 2025 04:23:04 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:03 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 03/13] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Fri, 11 Apr 2025 12:22:41 +0100
Message-Id: <20250411112251.68002-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

