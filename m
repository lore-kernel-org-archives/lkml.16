Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FCA27466D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781189; cv=none; b=SedzCjASvvJluD/CzJtBb4dWmNFBEtvv0VU8llnWiHpAwNJWi57kqv/cRWn0tJlUzRMvnz8uKp9wQTWdRFa+JTdZSGM+hZosBwWc3kWxBvy0xGt5gQg+AXW8Qh8yMaT18MI3Cbfv1dN/c+JJmGyD1u/PQ2+/QtfW605x+WN/JQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781189; c=relaxed/simple;
	bh=rAFzUZAkSv653DMA1Gt82SdKNPVMD+FcAEb6O/SlSkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ8AJqwNIM1ZCKWsGpLvwxLI5gw2f1DM3Mk2UzV+c5MMifvDP0gJHeVpaR13/xveddUmBrBDrxmhb2oJ/F90cVNAmuCmQKsoF9dR5E7qKC+jRsBgWZ/qqXz/kkEKCLphIcsT0gocWY37xaQAr3XusrqrWVtQw8Q5fsBhExrHdJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQmUwce9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQmUwce9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso12729055e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746781185; x=1747385985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
        b=WQmUwce9vfpx+a/iQTF6SCrAPLWhOsUtEDYFv08+H4w/72eZyBSAu+G3ZFGFT3ceDG
         tnbYSIje/Ky5YYroxYuxqx7xBZ74JLkmt6XFmG2fiVEVlkkwGBCoJHetGlWsM33QUiuP
         9cY028rrP8ABoZzTahAorVfzuxLT4iuVfKCTZgTlWINFdeybFLNskgtfzwWF45G1yDrU
         AYGbGAISv4qivfPSjUxbmuJaryps0vyth/sgs021HrNxtLjUEvRrk/SjUjxdcVeXRs2X
         EdUvkC45fJe1Vjk3rHmddisUegMvawv2riKIG+QgVScwGy4QL1kQVTgHnt5ioyBDHwo8
         bZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781185; x=1747385985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
        b=Gjw0mWuROlJRyRJsP72PIBUrAnue0PZglylLLQxIbzcZpDlndmc1YmnqfbNb1sTD4K
         5+dYxdsbeMu2gkhMFANtErCGJQ3FiY9a94/ww5Ooo0pawpMEzV5thdCO6wm7qvredtkh
         dI/LXJ2gosQlnDkpecXaabqMDLAlOy/wEY5AeCoS/kUn05WPY6NchUL2cdZWDeHm/wpP
         fd7JjAyNESfE0hpBqWoGp1MbKckwTmCW0cVF3WmSreooQ9Y3uc2OpsgJLhZqPt0EMm6r
         uVsE6maxgV6uZKpvRXmvNQKWpg8alJOt431QcwOqQ4rfEeD8PKVQYHDBxIS+lXquVyM1
         fv9g==
X-Forwarded-Encrypted: i=1; AJvYcCX/8rrNDkd2BYoMccgrDFprMWsgkCaxGrPBk4NoJ2QVvjlaosw4CNwTwJlnfNuqRWcvj+3IShWZBfDaFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+2Ad446XyyhzSOeNFYJ3rbk5DQrCut4B92rc+TVhi4bArMiW
	Dt+bcu043Gqr719wGeF33CpuLQ04Lo0kHSMb4Jtb3Uu3MBkVX1rVJphPwW/LZog=
X-Gm-Gg: ASbGncvG7A950ZIhx9D5w0BBc80J1YtrR5PYiedKJTdLZiqOGHqZF3LjyJp7EURrL17
	zCSHfYNtiDTvtVi0yQsbz5514XMRjs7aQGyxdKpLz0ej+yHhI6AMc87mN0j6D5xOLOp3ky0pf48
	pZZEeUYzyKGha5FQe52E1ZVnKTxoDZLpq0a89/EX1vXU0aTQ2OlccR6Ns8CQOviPWabTKCDqjqN
	CCRqRHS+l6aQM0uNQHaT/UyhMQctmH5JjOqAAWpmU/ldFLgRoawufWfWHsKvqG2pO6qSP/epm0z
	m4bFCmOJWMMF25W854b3Grm06l3DEkZTbh11foZFyNuZbOQwHfFHYT65rGiQEg==
X-Google-Smtp-Source: AGHT+IGGLXUusoILbS1CySmY5yLxrVw4d+a59DHYYC61SdUtYSIzuzu1CJOLjh+OwwTUyJ0NNUtfDQ==
X-Received: by 2002:a05:600c:c1b:b0:440:6a68:826a with SMTP id 5b1f17b1804b1-442d6e05cf2mr22229985e9.13.1746781185559;
        Fri, 09 May 2025 01:59:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:59:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 09 May 2025 10:59:39 +0200
Subject: [PATCH v2 1/6] dt-bindings: display: visionox-rm69299: document
 new compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-topic-misc-shift6-panel-v2-1-c2c2d52abd51@linaro.org>
References: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
In-Reply-To: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RZnJ7ALArB3S7wde3YqyxUd7RDqI3oA1G2B1Dr/Q+do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP9MKcRO9eIXObPviW/V5gNHncIf/stkVaVtTSb
 nYclvCuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/QAKCRB33NvayMhJ0QEzD/
 95LJQICNhRzxZ4fY78+fdBWGHMKqvJi3xCj4wryHyTDLLvc7cIb8RMbbk1fBjxzw0nKBXTBiHL+1Ws
 wRhxpfIfw2EXYauyhjvDrJ+gDaODcxbRtR+VriZDWaTe61aXeYRiVTsSLeg56xhgQ64iTj7IGj834X
 MsCeaIeJ8rOdsKpPt7aL/cChhG8jfmT3jYWEWD7FHc1DKPI7BSqFkx23ZycuyD+qOSsRZR7xdr+HbG
 lNjRqJabzwvJ0mPQEsr9XCWpv70J6a6xOHscpjDO1A5XyTB+eGzlqo0Smc4sqFnLKT6VXhvsQbe0zG
 x0f9HblXFIU7Myx9NeuQW3ui8vVVrlXL8P/KYRi+Q4kxCmhzD0OZUab79dH/QXmUOgrPXk2nxAWPqJ
 7/ZHliXq/zSjUh5hN034abXLvSS+tNB3/K8iZAWgYfGD5zGEOaBxMVntGn7HYiVj7mGPqB+0ZPH+fJ
 4c4oMcmxseBJr28aTrH+g465Rqtxiq8JBBsWw9+YzJQgQcBw4xANAH7Cu3RHahc0i1lP6B++vdHP84
 TAsgdfMONKDvxthNkpBxz3Q/Tv0L4/gNt/WdbDqNwNpkzy9Yriwufe9qIu9LZCD2OWhPJQDbmt+lAB
 PGvf3e5yEvM4mFFeuiUHgKBRywMPHiE7JzziZfxLO+3f3L83mT7eKhaqLYMQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Caleb Connolly <caleb@connolly.tech>

Document a new compatible string for the second panel variant.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index 30047a62fc111ff63cbbc275914ef8bb7cb4ffd6..f0a82f0ff79099cdccfd5c5001de0d319e94410f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,rm69299-1080p-display
+    enum:
+      - visionox,rm69299-1080p-display
+      - visionox,rm69299-shift
 
   reg:
     maxItems: 1

-- 
2.34.1

