Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC822FE0E;
	Thu, 26 Jun 2025 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750916921; cv=none; b=hYmK3T4oPhQe9TnGXa1bCBh02u8sv3JdTsE1h+pPrMebA6A4fqf682C2tTqDWsKNaWkJX2TDkYQVM1bJehaWI6HBxdB5F8IxP8eGC5MomWRtT6bOuzU5S0DcAopsNmsuG9m8vAfZ6FZX3swW6xUDIRSWtCg5M2z/M/1o4RYlSdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750916921; c=relaxed/simple;
	bh=eqw2uNogzSEHqRSYQw3W6ydW9AcJN3BT9ZnFghmU5HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WClWru8O8GpJ6gCqWWlOQYcYnESjupEMWpb8hzz6uRu5PFRVZhfQQ+ac8TsjVk3WSsfpC8u8ep5No5vGCa4lH8er80+1XRXkI7m47DZKXH7hs/tju8Jkb+GAmuKVjan02UOoU/VQbh3GGeeOU/jo0sYRIAC6iHutENyZHkm+xOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBuCEYhu; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBuCEYhu"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-710f39f5cb9so6513347b3.3;
        Wed, 25 Jun 2025 22:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750916918; x=1751521718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FDIEMHgS7ajFHvH9Fh1sd1G2DjnILNUgFqu1dUxQhM=;
        b=bBuCEYhu5Geu2s3EMDFZg1fQgslZsZIkQrJWzbsRy11PjXWgWFrrs2LcYfttAp/J1c
         OX1ZWMuq17+JpiI9tDuNesoAJELMVnNtorwkIOsOODaXQcVST0lBXoFybWaR84Xhp+OI
         UH711+3w+7QzLC/A9sckue8pI/ux2DoDLGO+kRcqIL3coCsNl7doqswMk4zt76JEpe/z
         A6M5dYSiUU4wiNnA9JT8PZWRArQ4B6aPwLIIRWbS3bGwQ5/kHOJHFR4Hb4bSyRtnteJi
         59xtQKRUJJyG9K5eaPvHKNJcrSML4307Hx7CZo7NeHeJzjymxLKbVtcwxYB32LfyLi75
         B2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916918; x=1751521718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FDIEMHgS7ajFHvH9Fh1sd1G2DjnILNUgFqu1dUxQhM=;
        b=UTKsOl8bbe+4Dq6Bc1H2BgcyxEt2580/OrwAYUK3bp6qZ3CR7M1qMTPpAMf9lPOb3Q
         UYJKR9ghDR2ThFQfHsqXjgnSrIA3dKO87Rb+3SAZHLX+5rUAPP2Gg8UPRY09wsj04Bco
         5FUQKHdCl6BT1PLrFMxCuPGxdPdDuIx2AyCh6QAPBoc7LTAtpdQgGr05FAx22yTa3mdQ
         WA97l1uPz68yGyS01TrU3t/OYunniUMNgvnfjO7Y0Dy8va8olfgJEr7MifrH1ooLoZi+
         tXxssXkuIwkpoyjUQO5xJt22KfHkpvQlP2mf1aVCC49OPO3a8NBUo7pUjh0p66fTl3uJ
         ADaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmzdudBpSV6lTTfcwIYbSR4nG6HPawpenRTh5HANxf/ZrK+jiqOK+OBNRXeZPUd2tOC1hfiNnAdBChta+R@vger.kernel.org, AJvYcCVqP/tfU4Zf7Iei7qH+ah+gAqPWOJbGwKf6t7HYzoK7VxeKgtKCjokXrCnPzIYPH4wYcajdFw7eueAq@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJghCY2k0XsrCNLT452lLrkerTeQTBDx31/RvdxZa0Su2+WYj
	D6KT7CCGdIXP59N4hjfDxOYZb7hd8YcQqarAUABN4DAYlpIUwuHuzRMt
X-Gm-Gg: ASbGncuaB36BJsYWr3bF+G1zFVGrX2h9fWPMbB8VOSRVStn4Y998SI3vJpLNBoTPEx2
	ByixP4qpDzLE6BTKj41SnoSxdg1zvD72YV/rgpr/W+pJBaviCzi+jCrmIpJWRciVN5NJw2W+ZXF
	K+aXgjKEIJhz4I1V7KnVQrYe17TjvZ9DGKnqRgA6ZCWeBbBfetActVTky0taaApSn9TzJyIOtxW
	AnxJGLJP+1Ro5+8JK8rT9pkz/ZK/jw/qKRkHLY/YV+OxVlG/M5NiHDbTXeAvSlxgsZahotDvoDa
	oa1voPlAVJfVwOVFAgQV4Pfi5jM0EPXnXh8LFY7FXEsbR9iDDSticShidl0KKXX/pvHGcBE=
X-Google-Smtp-Source: AGHT+IFluHKTy+1TvhZm02sbj1gWxLYizB70KgDUwgLVV/tMTaczcVwUjR3mSGLC0W9MNbI3PX0YVg==
X-Received: by 2002:a05:690c:4c02:b0:70e:779:7e6a with SMTP id 00721157ae682-7150875ee1bmr39801987b3.22.1750916918571;
        Wed, 25 Jun 2025 22:48:38 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b97299sm27323757b3.66.2025.06.25.22.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:48:38 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Thu, 26 Jun 2025 01:47:27 -0400
Message-Id: <20250626054728.4882-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626054728.4882-1-inindev@gmail.com>
References: <20250626054728.4882-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 58b9312c6c73..28db6bd6aa5b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -300,6 +300,12 @@ properties:
               - friendlyarm,nanopi-r4s-enterprise
           - const: rockchip,rk3399
 
+      - description: FriendlyElec NanoPi M5 series boards
+        items:
+          - enum:
+              - friendlyarm,nanopi-m5
+          - const: rockchip,rk3576
+
       - description: FriendlyElec NanoPi R5 series boards
         items:
           - enum:
-- 
2.39.5

