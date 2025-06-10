Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E8264A86;
	Tue, 10 Jun 2025 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586360; cv=none; b=HTvr5tfxaLigat+Hm1qXJbHR8ovF87oWZX40n1+cStMzh3znyaBSha5bhpdZMqQjn3XqHrn45jzsYeYUXSCBZ8hsFE77pt+QA7xojCgN5FgeBMBRiLhB/ibXEBwCCVOq7A94FpYkCVZA17w75jk4oNsEG9HAYQXlx2OM21ioNCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586360; c=relaxed/simple;
	bh=MUAMt7IyYN6ZQmmkvlBMzdYo8IOrzdeKO1Ry14nP/ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y72ESP7b0sYW9Q+u1pKMzxvYYczyDscvxhx2e6sXpU+iow2JoBKaRzhn9gzb0XlAugNJPDrfJMPPH0eQp00nrZF2ZZHj4QPiqQWlQyPna7iVGIS3W94RRfgmYV6nbbbSWt08GtH/dJAkHoiga/RfEFdgETN+eeVelqQxBopVnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXHjp54C; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXHjp54C"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so73677405e9.1;
        Tue, 10 Jun 2025 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586357; x=1750191157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=IXHjp54CWh9ubrStaGbJJViY5YmW6nYIfiyXEzCAqZmBoY5oDcyMdviPKOYiVArv5+
         0T7bB5sLgVMuEdWsnGrgzTPl0K2bY+Y5g5wVJRQvXVwtQfWGYUWrgY2gHSD59EuOVLJf
         0Awh6mwRKteYWO6jEFcBJn1tQKEGSajGD85VVPnsjuBVhLGTUg+/I94mBtJS/P9adzOm
         bGR7YnKoDf177CSjyIooGRalbQkj95zFlVSECW0Md6tQe62R+gnJwp5ovFfpCMNpDbjY
         HDw0xYemjTmimm4ViIX7WhtnzxgxJ3jcGR6JD2UEa9gUFYYxreU9uAgrD+OLrPfbFRfx
         0w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586357; x=1750191157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=eSAh8C81CExAIIB5I4jYniiEkM1ekcqng3/YEbLZevr3egU6TwyoocxBlW41NJhvJE
         gaiH9N7VPCnqBMjXgTko5G5UjGWmO/hxQ1CNGkyfF/AMHzVc+Dje1uBulJMDP2kR1ep3
         o3TjAbf5vqOOWx52I8wgGFntw0EB3oWVVGh9qXDfKZbEd3tkOQb4/NQxGMltWKGoDxue
         IOj6gpFya9RJPYW3mZg/oxtfTKpUoo2oou3bwMO0QE2V3VL/tXNMOyo6Okp24YT731D+
         4RPpti0Z0OC81b+FZFSdHDG+7MPdJkMsFxvD55AIwBpfRmeskqqHGrLQAgrm/QfZIAA2
         r2oA==
X-Forwarded-Encrypted: i=1; AJvYcCUGHhNmZ4Ycwa75a8vwnlYGxxPvXaa8MD+JfYocjn/WdojFUIaWc6LG71WHnh+udOJYODVE4rKkyA9a@vger.kernel.org, AJvYcCXQNBr3Tv/Jf+x5QdWtv9Qp8/rSGbuZZxA+RlYECX3L7O8CsFzXhLcU92ppwdmppq8MsyoqFDRkDQpwg3yt@vger.kernel.org
X-Gm-Message-State: AOJu0YypkEt0Qe9s8QD4dip4SniUp+jxxEX72S5XjWo5HiT59dL1Z1r/
	k8C8U4Rvt2IaDCFy8zRsXQcJB1o9u6HczurdZo0iNhAfYvRHqvkrEkMS
X-Gm-Gg: ASbGncsbWCeybTjjBPnUvf657zjROZJe+w8BcGH8DrCFxr7dL+5CGeoD3rxMdJlq+8T
	uBzPtOriJfopuLpufJFlT6DpS1ienjedKAlL4qUJPOI+PxjJgchiw3+S4Um2xA5jwomMDI4WE6e
	HWDP2uxigpEAQaGEoxMAFi7nN/8vxzQJT3PKhLWChOM7X11N71FAGgJ7w2bQuzhEJx36WRRadi+
	9lmFv+c5WnLPX43CsWt69AJVfl/NEreRuz3kP0k1IEw5nX4yKyPMtfzddxaQUgF7UNmhxV/PdXQ
	6iPASBLgxyjZgdvnLJ2QjsExOVhd8Bh70GOVaECcM9d/A/QdUOrlAmLFiqIlccHd5ja52BslDFU
	=
X-Google-Smtp-Source: AGHT+IHuckGoI1j/EMl7lkrmT2zOOTmsg2Sb/9pg87R2veE+HZJovaI1z2FzlALGyE6dPK28uuYIUw==
X-Received: by 2002:a05:600c:354d:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-453248e1002mr3364435e9.32.1749586357157;
        Tue, 10 Jun 2025 13:12:37 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:36 -0700 (PDT)
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
Subject: [PATCH v7 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 22:12:14 +0200
Message-ID: <20250610201241.730983-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
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

