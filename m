Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB35D2E9745;
	Tue, 17 Jun 2025 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165536; cv=none; b=ZbtDKctqL/TJZAIdwpufcRim2OYwRaBc6kNRRxOn+5EIsFxGJNi1yI9WgDggG2LvU8iLA5wvxCABJUHc7C5N/ZJeZEMiltksGavJ0LZOnYSIcWeJp8SzOh4FMCohnLw9VMehlm1W9rLrHv/R78veppxNdPBFdTjlsT/ex4syIgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165536; c=relaxed/simple;
	bh=Y1jhm9G4SP/4vxnYEyVeKD7jxvHJZ383xo4yScrKClI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Si2BUaBdvAOVFVCygUrFziuf95K4ZEY1hy4Z1vVNA7UhcTop8nrzIvV3WAP7OJCH1GhnM8CQVna70IeAgEwX4cehIGtOIs+Ky01La3bcDzSQrzaspUt/LjoKQeoc7PlJ4ut7db7J9/nHOynkkwdfk0ObE7ctYkaeMEmKlwrayHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyV1SvyS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyV1SvyS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451d7b50815so48140505e9.2;
        Tue, 17 Jun 2025 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165533; x=1750770333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZSWNkllSNOP0Alk5Rg5mB/Z0/Xf3katUWXaq3TCIC0=;
        b=eyV1SvySAsvQpt7CcD/AV3thLdEkBM0vyrjNJHaRxEGv5ZmiBiOZAv+rjeekVe0ihM
         w+w+ZjUtIy/vxwPHXR8AjP5y9HmTNa+BltV9CSSehUQlnHB+U4zAPoZ6segQLYN7Twy8
         v4Sb52jtNiInyVZaTrsNkZ5mRThsxc/6y883c06jTxNferlp4/1Dz6WXYIP785IqN/VS
         7ry4sQLOZIyzAwnOTZhd/4rURxVMIh66wQNNsqWPo7sP02U+W7u8BsEcD/sVsiPagUjn
         +zK8rw3bPGlmCrPzLgBQ2VB1FU+E1BNQ4lNi4PYIK7xOB98zSwztOkL0RINAiltsp62K
         gNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165533; x=1750770333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZSWNkllSNOP0Alk5Rg5mB/Z0/Xf3katUWXaq3TCIC0=;
        b=SZwowLdaX+frwz7rXZdUurNHS5U7NtUX7h7SO5rRl7oglZRhkCrMfbZwOGTtwWrTkA
         jCAkPXfDVHJk32+kGoif5Ky7E7VyVLIxLlNU/LIwhb3Q7E4sN208OxthzWcEyQc9iFHF
         yd0Fvn+/v3NB0ybKyt7ObQYzYEP9Erw4YB6S7A4LrvdhPWlyw0lU+/oopYs4riq/oXGp
         t2H5cWTFXF4dDOgUnRBldoYUZMQNITiIMkgD51V8a4i3Gh4w+3Wrxj5li59db6CW7Hca
         oXtuWsd7C/R11yTLtU2yKr1Sasi1K8ltEyjDhASc6jYLNl68sOLo86HXaDGVVD7n7ySA
         VvVw==
X-Forwarded-Encrypted: i=1; AJvYcCVF30OBK0kjcNsQiBZXzA05oTeBaA0xUY+s3XCogmezgCqPwMhQ6nAGjK7hzDovcJGu6kmwp5/pOhpv@vger.kernel.org, AJvYcCVgkXrN1CE+An/C5b7ACWeFS1OlCMXHUuzW12IOPycbvCm7tEPu78O0jxN058GX9uy64K+XCGhHl9RF@vger.kernel.org, AJvYcCXWfsfhXCk4OSIKxH9JWtSkcxv/CyaEieoimSyCR0ELQxaFe8MUJo6hMX2jrrGiUm5ZB0m5Zfl5m3Pg9FuC@vger.kernel.org
X-Gm-Message-State: AOJu0YxAPuPJvkcDpy5x/cNKAuB56401gyCv0Kky3KqCOqe6xJLrTQuP
	0bPGEuGsA02GeSAKWkqIL9jTchT9+zPzENjg0TlD76g+8GQOeJBl8YRo
X-Gm-Gg: ASbGncuTg213Nv/O4ciiY6fy5K8RRQGP5OxOb2wvzyTTa+ZUxbMFio0EdEqmo3oUtsz
	z2pY+UGHvEdQwhHU7oQXPReErPW3AWXPM4zP8+0tW4+MZXFz4n5e4IfRI2ibhFkSLgI3FijCt2T
	FbIzMqebbiisE4z3n/pHjQjTK/dKWZsekQGAt+RfKcLeBOkWAepsh1oWyyIAbjbavRkWOK0ElJr
	anhJztA4h21hFj9ubbkI8WGssLKXMAKwONSpCWNEp50YS8ACnnn7x3llpm5DzIpffiSafbfqDYG
	sJdg5l8XuQm86cmZ5v5Tyr0NriDKTI9TkjCOR9C5fmGsux5fGs/X2n0O3++GkPJtSErq8C0AZyL
	qCZgBCEL8+e7rMXVB/AK8Y0NXZ5duKbc=
X-Google-Smtp-Source: AGHT+IHINz6TP2OxYogxHsV9z7CWehOy9zUSrxOanKAqSJpCphw+YmrXFCvLl6RW2RuWZgVEtbJ7VA==
X-Received: by 2002:a05:600c:6388:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-4533d49b94amr127487045e9.14.1750165532339;
        Tue, 17 Jun 2025 06:05:32 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 06/10] dt-bindings: clock: airoha: Document new property airoha,chip-scu
Date: Tue, 17 Jun 2025 15:04:49 +0200
Message-ID: <20250617130455.32682-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617130455.32682-1-ansuelsmth@gmail.com>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document new property airoha,chip-scu used on new Airoha SoC to
reference the Chip SCU syscon node used for PCIe configuration.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..bce77a14c938 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -49,6 +49,11 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  airoha,chip-scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Chip SCU syscon node for PCIe
+      configuration
+
 required:
   - compatible
   - reg
@@ -66,6 +71,8 @@ allOf:
 
         '#reset-cells': false
 
+        airoha,chip-scu: false
+
   - if:
       properties:
         compatible:
@@ -97,5 +104,6 @@ examples:
         reg = <0x0 0x1fb00000 0x0 0x970>;
               #clock-cells = <1>;
               #reset-cells = <1>;
+        airoha,chip-scu = <&chip_scu>;
       };
     };
-- 
2.48.1

