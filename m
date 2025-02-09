Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28741DE2CF;
	Sun,  9 Feb 2025 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739104199; cv=none; b=m0+BVXRzavGb5vZ8H3Ha3JAnVk+LoldE3XbDnDxBIesQ4mcHPFN57HR/c4Xl3aPAIkc9qzhw1W3NlEtPVh7yDspxzR4n41EfsMn4+VJQzGgXj05bJk27PFF6zyY1FiGSlR1LYGNnaVSFQc7jdrJdI8J/OgENd1MVojxgsLjFowc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739104199; c=relaxed/simple;
	bh=p4VBjEuDUMgJhKnr37g+n+0nkAHr7jbDxdoWs5++Ufs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRQse9rauwubw85o25UENCgM6iFJIXm4Wn41A2Bok4ykUiZJ+tBkCihWKWl/RuDvvjlOyaEwUB2JKujA+0iAqyz/q8xdskof91u9ljdtp2IUySbEu68bJuhGp9kjo8Kn1VEB8frT4LxREz9RFQyq3sqvBOOmWXHgsdBzg9fiYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxCFKl8m; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxCFKl8m"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0155af484so493798485a.0;
        Sun, 09 Feb 2025 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739104195; x=1739708995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZmXC1QHZ6qUPtq4dKp71UFZwZYd4E+dKLToMhoQDzA=;
        b=ZxCFKl8mjq/DqVP4C6dOH30kgVh61+/61ia5K/T0iYayrkZk+KVjH9jTm1JP6ooJz8
         y3xu2WKBIh69ysQHhfCA7jEwenR8E0KgilVto7X8GKwrm7MFJ+inWDKzHRisAJC3zbVv
         b3T1ylyvNgZwtLET90Zm1lzspu8WS7iGwoGQP7joPT5ZQRVEC4TlXM1wgTc7vKcgoRyt
         Oy6SNMdES+6X2plA1rVtqtI0rZAnSHNU6vbt3T97+Ld6DDe7wzHdmsfosIZhunxOAT2i
         OcQ8TeSlBs8EctW04WivDa84CLmI+rWZrWQBStZYYhwE19finm+s7Prf5jnU2V698280
         3P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739104195; x=1739708995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZmXC1QHZ6qUPtq4dKp71UFZwZYd4E+dKLToMhoQDzA=;
        b=lEpt99XhJHNyYx4k+zYI2HZo36ok9DJHBz1Wz45DOySfwjiCow7bk/dN8jkNuG1yF4
         PF85mGSyQ749j2JPSSk2nO77udLQnGWmFNGMxcq7s675qCDAkGgB/uYlODCRjM5x5VmG
         rb21S7exO2dPwthtHfXfRoE6BQcTcWXUvXh1KUpsR4BcxULmuKhrtW4k4iP0/v1pnFBZ
         oExZL1Sr0SLMgaLq8FSuEf7XFYZ7UCOW/CbOBYpR08H3YMVgimahEC9KG2CV9c3bxRim
         P3vl8Eh2glH9TN2ydDCDw2X1kG4HeMsNGIdCOXPU4KORMDKi/by0cgAAScilt9ANMhSq
         LL4A==
X-Forwarded-Encrypted: i=1; AJvYcCUyrduCpjO1y4Kf7t0uk9oey0wSnOyQgJahrx+JSzRGVrK8Z91muIcrRZexFGxB3UQE4W+bkfiqzsTknZKA@vger.kernel.org, AJvYcCXnhRf9XYfT8conHrdCfSSzMbRnw9+JIQOvjW0Qs/UBUT5LlFR//6MUAuAjwT/EoJ3eB+iS3udht31V@vger.kernel.org
X-Gm-Message-State: AOJu0YzXIi7PfXNBzD4U3H6Smpf3a8OdHHJCSf5+dHtvN61n7NRGvGyy
	2MWRm0LIgkuLIEvM/G94DyEdNq+icnJVP5ARYy7TZUQqG5T3dOrx
X-Gm-Gg: ASbGncsZWLIdI+VYRitqEfkAtM4zW/iY1l5EDBbP0MrjS1cDNXKxaQtr+St+9Hw4Pk4
	oibt2BljXSR5v9IrZn6Q2bkNxjZe9hZdLVaosffUQlLP4INGBZkFips3sGbnoxn5YV1NCI57fxs
	rZVbKt44mKXBftmDdDo+vghwHVOEG1UIvhIBwVfAwgNJ9dZUPq5HfdF0q/IrpG1IEP65yPnDQs8
	NEpIMOCt8rlT0fLDqByEE1qx9oD4yVLXng6afEPN2dMDQE2oKAY2vExM/tMtCmUoQU=
X-Google-Smtp-Source: AGHT+IExVq5/Fb5tbJ7DgmsClGXTJgW9O4NKt1wq0W6lQou0Es6079usRdVZZ9UQb0DXmg/JvDBVuw==
X-Received: by 2002:a05:620a:319d:b0:7a9:c129:5da7 with SMTP id af79cd13be357-7c047c355c8mr1378460885a.29.1739104195605;
        Sun, 09 Feb 2025 04:29:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c056b42b89sm115301685a.69.2025.02.09.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 04:29:54 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Sun,  9 Feb 2025 20:29:32 +0800
Message-ID: <20250209122936.2338821-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209122936.2338821-1-inochiama@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..73f8009698f3 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    enum:
+      - sophgo,cv1800b-reset
+      - sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.48.1

