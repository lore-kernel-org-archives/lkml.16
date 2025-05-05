Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2B1FBE8B;
	Mon,  5 May 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446321; cv=none; b=SyXUXDy78szHhFdWlYxVBdz5rj4Gs2Z1CaznLMQEUsMqzmOrRS9xgd3pY+4kRjewokyGJPYc9H7IJGEtN/cWhEvV739h3iQkemCA8USL5MzqlJzN0Tze/8aJePKoXOKWNMIFlI9Jm78a3L1YeLbfbyIn1oA8rNWpxxch7Dqp/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446321; c=relaxed/simple;
	bh=bCU02Z4YtmP/mOd/KT063huwsDfYDDWDFR8Fy8frLfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiVq8ACfpfMfKDSfXG5IuWJh0h9Rly97XY0UBpo+Lxjz+6b/fS1wREiDvNe8nJnLA1Tipi+laJ4y5Q66YZ0Yev/LVISpA3FP2cLHCWp+rzQwB1ovGPqjDGIDpt1W0gJ/varvngK8dW8k1gJ2svhusMVWXYJPfMX0ydnIjz4NMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXgcVlhK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXgcVlhK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb615228a4so1023156766b.0;
        Mon, 05 May 2025 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746446318; x=1747051118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=YXgcVlhKvoMRo0/pIGItUstgK5xJdAkOugEFuSYHYPNtjdMqROdMRHlrtJJ3k/u80M
         YVkntfbZnNx24v+psTfsAWJTSrABMDJ4F0tqzuDA9RXqyD70+n9YsTL1H1uWWbQDslEh
         3lGIbr3AYduYJL2LCtXbfNS2KvALzI0JGjryRzJtBWdhIPxkccYyoD2yQ+2tro5yvFgw
         zW44GLKy1P+pngoruC3a+ZOtm5D0t9nArLhRtnEj1vSYNRmhFnfkNCK2xdMF0HHmBGBU
         IUcTzu6cI9FE1SYV+Gil7DyDyAYoCaKHv7RWWw/hlqnAWsgbOzzYcHBQ19BDQNAdPUmy
         P+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446318; x=1747051118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS8GP7tAyFx96vdZ9/xCHSVkyyfdDbFaiSakmVPCWYQ=;
        b=U1sP8FLa/PDCWMtOprYeU6Tp4m4s/SAoAy0oeSZD9yBmeRpClq9DS/ogonEkXtWPQ8
         cik8Y+ot6MeFEYG145cJZUr7JKIjnCJWGt7CybAh/QD8sNIOFzy4ke2HERbZtGLhLv85
         DAjrzvyqBr63r0qrZHEm9JJSd9SK1fTaszIshk1YjpFOxQtF1uU7qZmCXogTPKWM/guX
         sJhjjUfLdFQkcWeMiPH9RYHq/ZnQkP7LYdGEPSarUcHnM1dgCJgfD3K3sqJkBQ9nekdU
         OsBBdpm+rnZGKwYVB7mGYCbbrotcp62pCA+/sgAhtQH64rbcwUh7HY6J761n1U2rD7BX
         J6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUDJNW8E8GlD1DF9Ts0y4SI1y9h5DXsnRylJ41yObePSHi89paz7Mwh5uPeQtcPh6jepJBtmJeUTamA@vger.kernel.org, AJvYcCVNw4zMkgjIbU94TNnJFibzo2WkahAbt55cH+oo52x99xOl4pVVqEnKwKU11DSIDpSyDC7SMmnlupRqZYPi@vger.kernel.org
X-Gm-Message-State: AOJu0YybltsFEqgX4K1hMbkmajua4kgldCm3IAcvyLSU1XiXDBhv0ciQ
	v0NsPst9oCzod2W3t2MJDiJvU8PNOzQRh0NZNmYvUBx5MIp2OqPr
X-Gm-Gg: ASbGnctiq+N22EYzPxxNDlJwFe33GYcZraEmL445TjUYlo8NP6DoYqFfhSirapCth0t
	mCm0MahhHNdX28io8jd1hIHqMClj6p6AsFA81eutmz0hVSUYIMReARdjf3jdO+X56hE0BWYehzR
	NMfqHS66E06G//yFKopLGTTcHOua7jaGUSF4wYoHlCi+/fIdeL1R+Z2jrWj5xDlLn7mRynmtT2n
	Nuy7eUMgcd/9V9ZI9UUhaJDgCJOv4u6EmjgCIPEBL9VHpjXy6YlA3BCVigKe+ZSW5UL/1F9gxey
	qKpOIOwYuK3fFfr72C00yu/yVkor+Zg2nvBeb+BwmaPEOA6/CVl8u6+/hN8xmeDbWuAAsSCxp+I
	+kQ==
X-Google-Smtp-Source: AGHT+IHumqO2HEtVZQqU6y21OIhwqmx6WMl1zZofroVgIP8P5LdpNm2LFNH9OFJLdEBy/IULZh6H/A==
X-Received: by 2002:a17:907:999a:b0:ace:51fa:be56 with SMTP id a640c23a62f3a-ad17af32ce4mr937803566b.19.1746446318015;
        Mon, 05 May 2025 04:58:38 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c53sm489568566b.56.2025.05.05.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:58:37 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: arm: stm32: Document Ultratronik's Fly board DT binding
Date: Mon,  5 May 2025 13:58:23 +0200
Message-ID: <20250505115827.29593-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505115827.29593-1-goran.radni@gmail.com>
References: <20250505115827.29593-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This commit documents ultra-fly-sbc devicetree binding based on
STM32MP157 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 5fee2f38ff25..65c4dcdbdf1d 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -184,6 +184,11 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: Ultratronik STM32MP1 SBC based Boards
+        items:
+          - const: ultratronik,stm32mp157c-ultra-fly-sbc
+          - const: st,stm32mp157
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
-- 
2.43.0

