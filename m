Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781222DFAB;
	Mon,  9 Jun 2025 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512512; cv=none; b=mqBO/OhDYG6jWdyXZkUL2iYw9k8Pqn/LBVW+GbtxiJRFUCqp3zppjgH6nXQbHGdgJt3aJ1ysk6cOZS+H0ZoxsHpgSL+bBT8n8DP74b0uBWvQZCpvTfkYrSPI76lG7sfTxlqFguvqr3D/inDkGwy7GU64F3aZIj9a0KQs0msM3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512512; c=relaxed/simple;
	bh=ag0IxnzkMWAnYTP13+IFj8LREQUaFbVfxSQb0a51zeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1+aLNbWdIVvM/YumW57t06+/2Sa1aoge5ypkSFlSEllMTl+oKiUciP9sNgA0Ib0EyzXvGvU8HGOqARB8F5pY3aed01g4iebbmVGGn8ihzO/umllMJQtyA+sGJ6MoDlNfzHSOb7osoRJAc/pqzGMYUY0FqONja3PqhoNm/BBhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0Pm1xZD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0Pm1xZD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3937182f8f.2;
        Mon, 09 Jun 2025 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512509; x=1750117309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=j0Pm1xZDKhiP+xEY2QXUkFJrd81rb4AZv2OdbxTL6c7mDIQWtQ3eA5GnbNNgywsjmy
         vHN5eFd1uHf9DTRHgHT1XYp2agCO7Yq9XKlpoAzQ7K1ERFou84pm2qMxovjcxxYfAvWD
         lJlbuMQGCck7712fUQWFjurI6i+JL9Qego72KfYAVaOBcX4wAi1IfbkUv9DcG1Xyw3dx
         /Ti8tF4iTFKNkkM11Wc6GXJDPfZGat1wIXVUAjBA+1tlYqQTs2LiDCKsTGPAUzeLG97f
         tAIVODcs6mNOnHxz+KofjKwBSIk7fZPkyGVIVljA8+ce2dnTCtxy0R+EIORyFBbb6OPT
         WLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512509; x=1750117309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+I5q8ocBYkmAGG3bQeirsTiO5x3ALmlbHtk/JRr4K8=;
        b=gWaIOwS81kUcV3X7ulCUAf8se6YMz1jfsH6R+0d95geJdUlD9eVchHYzMar4mfP7Gl
         2/yDP/DqP2CTxhPicQjKYr5yO5AZ2X9KUDppq63P8HCuVG/QebFoJ5ajcwPJrMu4pY4a
         oCzXDohHnsk0rVqP9V2ufuXTSl28F5wS/xrKppVLBE//Mnq9/Mif7cMMMXL26Oryz/Fv
         ZU4SBPrRWvDDsW1VoVPjea2hpHLxvMOQaLfOwX8F8EtBq5UpQ/LqTPxJXYHbdhVsc9r6
         qaeL7QG6xoJMvE8fhl9l7nsmiQCsNtSrXNnKzL9Ve2bZEs5WVJRqIdqM7FTYhiH+mEo/
         8esA==
X-Forwarded-Encrypted: i=1; AJvYcCVJwsEGuEi3JRcG53TmOJs/LIdQwRuC2vqo/InMlydnzO9TikAzebS40yGPNNliSH96BvpndTf/AXAD@vger.kernel.org, AJvYcCXubhuSF+R9DazwjaUWypzCoXbLOsejbMjPe/lIFMv+IeonNv+ToDbRVq4BRAWJGGbijV6o/jBcl6DQmP2g@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9DIBW+tHuYrlCRJ96bRLk1Z7R+KLjyzkM4M34nhzkHVTipiu
	/YsJeboQd2yHwShYd38KQk8++OAUY3IDoMUpJVih4P1kWv4MSiXlVklY
X-Gm-Gg: ASbGncsOr2AgBEDKHmUoAuNxAKvYzsyXkXKJJ669qEE0zPZ7M1G5awQ34qT0EcIbTbk
	ZvfRuN/m2kkOEkTnx32Q9tJOUP8mJ8gy2VVknj4kj+8idsRXnD8QdZ9yqh5J8NC1viztggXSATh
	rkjbEht7ku8bbW4rkIQUafirl+46Ki5XI+k/4m3b/Yl3NX66DcOVofywmjerjFr3XXprEOJpSkG
	TpwP26at4Nw1I7OkRYwGLljKOTI97U8F+oH3+ycAHYrLxVzKELFmYcm4ITXz4Y9NTECJwsyhQxw
	oztd8VWk487OKcmA31qFtGaRPGdkOQwFmvTbIsIGC9ANalK4Ils/YNrVvNSv3PtghZ5NdrLd9Zc
	=
X-Google-Smtp-Source: AGHT+IH7NDEGMIC05I8s3EhjGk1K/ehAcQxaj+kxcQV2s84i3k/Szs+b90p3CrDVe2+PWCJhk4iWsQ==
X-Received: by 2002:a05:6000:2407:b0:3a5:39a8:199c with SMTP id ffacd0b85a97d-3a5522ddf1cmr376314f8f.53.1749512509285;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
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
Subject: [PATCH v6 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 01:41:12 +0200
Message-ID: <20250609234125.722923-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
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

