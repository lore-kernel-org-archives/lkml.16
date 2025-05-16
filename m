Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06AE79EA;
	Fri, 16 May 2025 00:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355249; cv=none; b=B2VFCaEfc4J9XdCiybUwBwyyRS7eAGfZIc9TPWYlAY6VPXLfiRIwA510rQ0T+dF6pxLBT7flFy1hA74MaWW1wig92cnNyni35lR1lq2MZYkponbJhUPihwepiL6hTav3j/7MyMBhYj5100QP5D61tiZmJuGFsPT3hJQr0twPuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355249; c=relaxed/simple;
	bh=m8y7oNK4mQ/m2Uf2jBqnaU44utkTGkxnewrOCYXR5rw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o1d7nzjutUN2LOK/Cv9gFBe8U4IKcItzb0AAHuy3wNqulGjsjUqjs3ImO5n5j64pydxccpeF50DoCJMF2Zrr8gKS0wU8QqkY+oqjGUAu4eMtnVlCuX157JRBdAjg1f5+hnbzWh5dw0YtAUldtERyDQ5iVux3XCqu7XbjCBJFYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNoWtfeE; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNoWtfeE"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-48d71b77cc0so20908491cf.1;
        Thu, 15 May 2025 17:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355247; x=1747960047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG1srQqLDMHsfN+f66cDo9FQI+23IqqYDi3JvlxhSCs=;
        b=ZNoWtfeEutjGbB+h9VehJyanNdgGVQ3TX1PUVSxpe1p/mhsPgwEU8N3Urt+ihAPCAt
         kq20W93IOfKawIfNG70uFY/8DW+57XpNRyeBivuQ6ETcbpa5J0kDAYqzSaE9dcXzAv4X
         WnEdCA66X4ngBHE+F+Pv8+8JOO4Y+/XgSTpXFWW8ceInStvgv0r1FQPnfA3LjO+DjRI3
         wfnh5/ox0XGC3sQHrquZOtx4ienMN/TJCVnnZK7vROw3kCK7zuj+preVZFF0O/Dy8aUx
         y9G4O8/cEE3vLKjOqx1MWqR/eOVZDyXbF+yy59lyRe6dhkKIEmvKxM0tvjf9tUissChM
         7Y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355247; x=1747960047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG1srQqLDMHsfN+f66cDo9FQI+23IqqYDi3JvlxhSCs=;
        b=S9RwP91uieTCdbC9TjS7/i61sQr4DL9sjKzayWMZVtQe8q1Vtbc9CgkI/Bh17nn4X4
         d2qkWWTmvX77BCxzppA5ySNt9b2p4w3fDGOgseSth1InZOdfdQnHhzeL01rJqf43en9s
         jwGxVEDchdqwB/sEQ4xhkD+iqGMdI+R9KwCtcYtPFm6O8xB77GHtVBv8XU8YgKl520E1
         DKr56bDjgPUsPKzQunXpDy79j/Fu0KxrWFrjt7+MHwX6PnGUUPGqJPZGA+aA7MOg6/7c
         6Jzcayaen3qa7cfT1KM+Kkit+CHaGTfdqS8JEF6bgk8uAVTLjJPyPp6iCr4Mh146v9bE
         mx2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2v5f2KDfheN+igxNTv5v3SZgQE8qccJ02qccNv/Z0wp5nldMzieXoTL0+jLlWfNBwRSE2J0Jn+DOt/4DP@vger.kernel.org, AJvYcCU7eCyVYbaKfpIx/piN+KQDq1SIHzZxdc1+kbWxJ+SNCnPf2ZChp6CzD/TXqZeutCp8NKtmmsTUN1cb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Amee+au7cyMmNxgJ/CyCO1J8AMjzOyAZOMiavRXBWRp0CCgE
	0xw9HKFVnyPjR9mM5z67cSkAcMIaxAESnEEDhycvWIMLqqOK639GHhXB
X-Gm-Gg: ASbGncv2jy0Eog9O+nJii5bXows4FF8vuZSqCpE3bhKFXMadvhdV2PVkmvYP4KiTnmc
	u1P/qnASNok6fjdlUZklRsxmqOZCzzJdd2vni8nwrG/e8uGZQDSh5v7K8ZnUCnItZLcS2+6IGjV
	0ZjNLytgUzjSepMZ5ppn5RJ84FD03jZe6Ek/XZtmW1m4rHd+kHXNjzM5FmbtJnranGX6wgYSt9i
	WXNJO1sTu8m+XqplxnLnFhr826iFB55JBn/qeiWaa/76RhIZ39sY5+Xg+tlWg2acc2vs8JtBWCW
	QZZX9Wy142SGjXEuZJJRm7jwlTh4UHMUJd0wNM7PQy0LhR7OwsZbxT7UuP35k0c=
X-Google-Smtp-Source: AGHT+IEjVGD+KJUzfAVDNX3aei6Ghs7s/wzZPF1MSYk1HD/3RtP42wverW+f60i4kYRC6qGzqu1QSA==
X-Received: by 2002:a05:622a:4c05:b0:48a:de9c:8c0e with SMTP id d75a77b69052e-494ae3d8194mr23972861cf.24.1747355246704;
        Thu, 15 May 2025 17:27:26 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:26 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Thu, 15 May 2025 20:27:11 -0400
Message-Id: <20250516002713.145026-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250516002713.145026-1-inindev@gmail.com>
References: <20250516002713.145026-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..4fc73fbd592b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -884,6 +884,8 @@ patternProperties:
     description: Nanjing Loongmasses Ltd.
   "^lsi,.*":
     description: LSI Corp. (LSI Logic)
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
   "^luxul,.*":
-- 
2.39.5

