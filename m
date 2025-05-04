Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D841A8F6E;
	Sun,  4 May 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355584; cv=none; b=mFF/KKgMpBwVK2yCH0CKJuZJPjH5I1LSSVBspm38/Q/qNonpqjz7TD6+UECQt9ydSC57pqUm7m4jJY1t7k5eBCZTqIrSzIFMeJWrKO4hr2hmUSe6pQt+7MSrEo9pG8103mOP2xtwBPH+HI3yNs7Nx4p2Z7LmQurI3lrA+MN4TOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355584; c=relaxed/simple;
	bh=IOUbTpGZZeI+nBZmuxYvdduSXGQt/jXYcXqsGvwMSC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5kGDpY4L8z6CBfxp+5JwWRiBJp4Gpwh98OwoVtETMM/c7LCQ2PZlyksTz/hgBwryBCfa95cZ7zNn5jKh/qcnRZG7YcApZKWBsAb6PIzCSWRWCG7Owy1LYz7+WOO4vQtfsbBCGW981AJ6dmz6spR4DfobU8RY6GqPdhZV1TNino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrEbh+w5; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrEbh+w5"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5a88b34a6so378660985a.3;
        Sun, 04 May 2025 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355581; x=1746960381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=OrEbh+w52pG1/XxxiddiUAe1YN1y2JBoEGMuLuqDns7b8HpWQkOOjiuTlJxM8Yp+xg
         b15vGaP/gDMfyDTUPstNttzjLPzTXcNJyPARWoUyBG2ARWhdtaCl5syKWEQouj9S3I+6
         pzunP5OQclamgK4UoxYgCcDaa4QGpTtnNVWtLyAyCeqUmrpxeM1er9cGe1X1+U58ozXl
         a0DtMmQ6wSctKRgb2PoNFDRvL25HxYtXzXN1DmwpSCOtf4V1vNW30vmqL5ExUDKJg41h
         4hk5Uf1/NJEbcVKMFbyb76bCWQbITXWRe9SDIxOIeMlK+WdF0D3MeJpvCb2qc8zrAV6n
         vsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355581; x=1746960381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=escShxgqmxEgDuy/YC/G5yuwFFqNfpazqhWyoaXML53IjNhlEJ+5BpkOoG7FO/hj4z
         97FmZDtkC+K2s3LERCtBKNzj8HN73wkewwksyyAE9U/UBjYSBhVGPyTwdG7+JJg3bHZU
         Ykbv31BUUBQ19Q1gw9ZWH28nOoHXEXObxoUgGoDGRhgRNiPV67eS8tbcodHyFrbjdiVm
         L8d0QlN5qXNZxgWdAO5RsfD2hASYC5dLO07PWF2Ytszds+4LsEJ7PQ5A3xZtPnChDri9
         cWvHJ+zmYncV9eqJPu6Ak5caylbx7RFdYk8+XBYVriRK2sgejXjAyHmQ3pq7VkP1VQW+
         8jhA==
X-Forwarded-Encrypted: i=1; AJvYcCUE48Gqiz+zrO96UcfdZRu2eb4/qt/LEcc/BXjqBPZn4o/zuV2QBpbyYYIaTXntmCejmOFaimDZ8VB4EGG/@vger.kernel.org, AJvYcCUccJauDUtg9aWMElJ1n3t5hLMSdfapLKLz1KHyEhQUpPjy7bVMjGjIiL8DyteY60SphuLR5Yc5Heyn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+4A5W0NcPeS18G0z2c/Ao+RCKgX/fDEPXfyGkxm6KNhk0kLG
	B+pNv7twq2TyPULHeNdwbNqZJiTJYrrXFfdBUcZCcjKqJllzyQ82
X-Gm-Gg: ASbGnctRoWyA01JKpF4winS38WSb91AFgBlhBY0HxcELv1wQZLIO8da4PYIml/4vRXb
	fLfX18Avij7LhIsxfJ3z2AwYWDazjBQW3AagXLJzakIDuvmqZMkLi+p9eZO9MOkd0ghX56LcFpA
	kO9nYpeTiP8+bGodDbZrq6Af74kL/9DYt/ls6diwkOBAaBggbAfOeKk8t+mDpMmVf+3CdwKbdXh
	CTcYw2Qj0OWMY9lDUrHKHcOaAN0xqK4Jtk16z7w8n/by0mnJUklxuzEijH2xiEP1dgkyE5eiB0O
	Aw09YudbB2QL3j9P
X-Google-Smtp-Source: AGHT+IGYfcJI1KOo4mnYSm2aZ/wO68fNQbksb1q2N85JkbNZoHHGaOY6wCLzQBxd67wnG1djUIGKBQ==
X-Received: by 2002:a05:620a:2a10:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7cae3b0a53cmr471104785a.50.1746355580956;
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23b5f46sm429527585a.20.2025.05.04.03.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Sun,  4 May 2025 18:45:50 +0800
Message-ID: <20250504104553.1447819-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement. The
only exception is sophgo,sg2000-clk, it does match a real device, so
keep it as is.

Add new precise compatible for existed clock devices of CV1800 series
SoCs and make old wildcard compatible deprecated.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..379ce3e9e391 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - enum:
+          - sophgo,cv1800b-clk
+          - sophgo,cv1812h-clk
+          - sophgo,sg2000-clk
+      - items:
+          - const: sophgo,sg2002-clk
+          - const: sophgo,sg2000-clk
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1810-clk
+        deprecated: true
 
   reg:
     maxItems: 1
-- 
2.49.0

