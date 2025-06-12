Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0523D280;
	Thu, 12 Jun 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734920; cv=none; b=VfCAB+bFK9KACwmTH2Gcn8XNcTVBREHwQvNIojjsJSXt1iqLePC+qQwigBjPCfNeV2NvQqSOoOJ6ynX1BwkYRwslsOeKcRApLAtMqJ9G6qr3BCFTUbRNEkHSxQmROQOshjyNxgpxjxpbYRrX6YRe9scmtyR1ly1h9xkYlwm1Ld8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734920; c=relaxed/simple;
	bh=MUAMt7IyYN6ZQmmkvlBMzdYo8IOrzdeKO1Ry14nP/ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijNQpmF2TuuS0jb8Yj0Wj+esC8O9qCEKEzzMCy3Hz6XEJFs7HjKvthqc1U3Qyf3mft0rqxXwz9p3X/ZraKG4RHvTIGqNzv6/zosp9JOfN1hjdqH26y7RfuYAW9cMSOws4/dcUN0aqxsNIbu9W+WTxwKTkXeznSuLTrM3QQu+YGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EShZ9C2b; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EShZ9C2b"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a522224582so567093f8f.3;
        Thu, 12 Jun 2025 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734915; x=1750339715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=EShZ9C2bL8K68BZWYvw4a5s+W41/AbRizMFZChagV74sOCwW6igpu7b+UqdhUE56p+
         ovGeZB6ZzPU4y3z7qcCJw23FSwy6xB3wAsP8DFd9Oa5TFeaXL2MkMBhVPhzRaOWSuazK
         gi213oVc7gnv2aV6VhmJcUcVxxGzzE4Y7hBltZKg514tDUOP7YVn2IjKQ2+LdTRFSjNY
         SfieNw3br4KE70q+z+3dtX6O9n4Lri3P/1s0fx7N77PBtmB9zaoHECWM2B6C8xz1tsuV
         lgsHIbVfJ/yxK7B//MLS3DdPAdRE5rNNEGFuIFyh2b3nqFTJQ8WNW+lnoVjaANUCE9ee
         lWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734915; x=1750339715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=Zim2TZu0ssSuq/VPskl0Ok6moTFrgK4lZg1O9eiztin/6M8UIBPvO2B1BlHvoQbFYM
         MUM+SiC57+FMeqPFuf0sc9tjL6gMUlU0Gd24nGxuQPwLgv4EkTORNxXP0tSFa6tpOCH/
         TwuI/OISAffI3vtm1AbfBKoXA3G+kh7yahv9gaH5wwxCNDi8CoCOt79RuUV6D1vDvxwc
         Wd4Vu27/dzwyBf7FKBp2y8kEjne7BicPdMDyqrHeVyMlr7dYabhBvhwXE77EUlLlWul2
         s6NgxlYtBbh5mzwDujDLkwr+WjqMuphfpVF90Nzvy+pAIQoR4pJIByQ55cCV9CL5APL/
         ZnaA==
X-Forwarded-Encrypted: i=1; AJvYcCWVaYlieL5NsUGxWEjPRe3D2sdpz2U6Xsn37ns1cFcexsmakK4hzBZKJnoUfBI5cFmCWxip6IJPJSmo9D/2@vger.kernel.org, AJvYcCWgO8etQlwBt435qYeOzuAXamDqzn00McX9sz23pC3xpXaE+jSRih8VqfI6nO5XENey9fmMi9O7H/Xx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BRDsAd6pg2WmSV02ezHUGXFQlXUjtQD/uQU5OM3MmxLK64BX
	qa+v4b3X3b7B3lUu6tDiceyqo5dcPd49gp8m/LvoxtG0Rz8Zj8RPWbQjXW9qflunz1Q=
X-Gm-Gg: ASbGncsvHcOmZRxBOV73c+oh0xKDZBIG1O3cObLQnpu6MAG1LVaVBNr4Htdf/1+9LHk
	mnmP7mRwgwP8ci3Ljfg6CRTvo6IlibL00E/1qfiiMMujHTARBpVPAPTSwubQWYVotx3pt25pUNd
	cDFPwY+Hom4Ts5Pp4HVTN25MubaatAC5QpQQWdOMXpRsQnWIhm5M/53npuOMTZmLxlLhYlL1eGv
	9BzM/Q3AZXvMMHTQDToFs3ZMo3Xng7t9J/0AcYuq7pYqBASqWjrhZS7rVM1JWAH6dcdRWy3L0b9
	PAi32iwWEll/bfX2LeiaunyzCA7gNKf9J1vQDJ5//g+AajNlmM4A70eNKkwNtcZgZAksecwWzjY
	=
X-Google-Smtp-Source: AGHT+IFWiGNMBdTBUMs7+0ijX2pUaO7IssAxRo0dN8J+TZrkwdKUEWMff5QxI4+ITXCstzD5fkIxsw==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5586dc413mr6122966f8f.27.1749734914690;
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:34 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Thu, 12 Jun 2025 15:28:09 +0200
Message-ID: <20250612132844.767216-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.49.0

