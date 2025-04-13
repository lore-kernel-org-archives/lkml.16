Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A0B19924E;
	Sun, 13 Apr 2025 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584611; cv=none; b=iLAwu6ten0gJgtBWXB6cMWMtaR/wkWT+ViX4IJZ/gik4dxUzbg67qXvqWLp04zTkPuseqYmmFjcOeadtWGyBrmbcUGgDp7EQfj+b6KzH7DQ9lL7x87foZG++yYdS9R233WLriq4WLg8yVf2hBsBq4SAB+A/7dUUiPMvm0+AL7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584611; c=relaxed/simple;
	bh=HiaULOJIVEBkYuXBrKiSwazeXPqvXbbNxBqzni9Lgfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC1A1226UKyzkgFva5YNfvCCRNphcjnrhayYSbpf0PZAZsgG2zuPxxwgnCUX5yYacOQSLgU5ha5Rc6Y5qRBN/MKCrb9fRAIts8eJ1j7b64McZBUsI9LG+Qj8opFkqf4eyJOwhSulh+ZanOYkMLmaU3EkNAX1qPxGDaOGoe1SXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LECH45Fj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LECH45Fj"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso60539276d6.0;
        Sun, 13 Apr 2025 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584608; x=1745189408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrNfyuaiNE80NUtIgfuYRzdtYhSSrWKGHiXSGsvIXV0=;
        b=LECH45FjBBhFFuhxCrVw2iU3wlrI/933Brc529C8B/8OWUj8+bcBm5PoVB12NxVzGH
         b2IZIXhrj+g447weUJoMvC9Gdxmlwp3OoZ3r825TizGkiqFl/GmoYP/5gqON85RLHB6Z
         NQzJ/vZkc6vOSaWFdIFCCMKIaAjZOToP+UqUbS/FN9acZdJOKvDJGBm3F9k99IXRRkC0
         OVr+CwqBuS82e3m3DGs/oWasaJ87KaoeZbUdOW4h8/4AskL1UM+G1jsL1xrRqq+31/KS
         iJlNVusio4N04dXw5AnbsRARGGcfgdYdMaxmuFNfzSFegYLs0CJxNzVyb+bfqAhO3bf3
         v2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584608; x=1745189408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrNfyuaiNE80NUtIgfuYRzdtYhSSrWKGHiXSGsvIXV0=;
        b=KB+SWBuIzmJ9Sc2RkPKzjIspLBTb3niqJXJohiKdHweT2ZQOLVyD6tf9evFgAVHSN7
         s9taoRYc/gh7b8kyo45h4OqvhQ9EqKv9Btl1Sv3zw38cfNxnkCSUFjDJnbSaWaQ38MDw
         gtUle/8v+9eYvpX+wgVE0oY0O42wkkp1FX2TjKeyZThtDryjXPob3BRh54yAQb0gNJTR
         FFJtUpuKi8I1jNVsdt+/+QUdfmll5j/jWpk1oNgWFW7A6vswWgRMeBPyp4Zp5PHGsJcC
         Ct82LYw0/iwBNx22VAjd/3iq8qJ+WEgKRLS5DkFY5vZKpilRGLygcxyu784BWFHiIvez
         INYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmeEOpwTJqN0tVJE+afViIwMyoDJKLhKBEP8jcU61O5B257uPQcFfWjISSfyhS7Ckl3fo5pQoel08/@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/PF851s+w7X8lEyBaebIXw4GeqM2F86IbLv9+5egoXZ9NPcJ
	kcGzKqRbovfKS6/NvbHkp59cs+Rhp9mmxm8DPeQU/FD9s6s8dt2M
X-Gm-Gg: ASbGnctOrWCUQfJMU+1hhE7RryoaT4aoGdiBphPsCkT/LEy/B2O2zOBxEcGE6iv3YQm
	NURKPFfOWX7HzjWlNvf9bFoxND1Uz1pYaX17KSbPSkCz1TOIYDFJjRun/zNHTpUtAaI7+8VWrpd
	xvYC9rLPuw4cb/akvsjpKZUBUxqxrJZCd2vecweJayElcHWStpg6lRO+tXPyXgT5lIzAz4yW24P
	816ByhRmTu5aap3X1vLksr1k2Ji7VNM6CAcZC68j+EjanpVLiw/hW5n9avQfJH/TUVEoVs8txtx
	OFjpooCPzzzD20zp
X-Google-Smtp-Source: AGHT+IGezSlcB3D+9Dctk909BXGBm8lYrlvVcv4JvNqDMNQxGcSzqabUhgzaiLOybe0xMXTrDj6gQw==
X-Received: by 2002:a05:6214:230f:b0:6e8:f99c:7939 with SMTP id 6a1803df08f44-6f23f186798mr127407696d6.44.1744584608252;
        Sun, 13 Apr 2025 15:50:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea2186csm71294766d6.123.2025.04.13.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v4 1/4] dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
Date: Mon, 14 Apr 2025 06:49:12 +0800
Message-ID: <20250413224922.69719-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224922.69719-1-inochiama@gmail.com>
References: <20250413224922.69719-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, SG2044 also uses an external msi controller to provide
MSI interrupt for PCIe controllers. The difference between these
two msi controlling are summary as follows:

1. SG2044 acks the interrupt by writing 0, as on SG2042 by setting
   related bit.
2. SG2044 uses interrupt number mod 32 as msi message data, but
   SG2042 uses setting related bit.

Add support for the SG2044 msi controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 .../bindings/interrupt-controller/sophgo,sg2042-msi.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
index e1ffd55fa7bf..f6b8b1d92f79 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2042-msi
+    enum:
+      - sophgo,sg2042-msi
+      - sophgo,sg2044-msi
 
   reg:
     items:
-- 
2.49.0

