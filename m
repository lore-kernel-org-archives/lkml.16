Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543912CD96;
	Sat, 21 Jun 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750510151; cv=none; b=IX3T+NhzLfLpcWTwuhrqlmT3a849cbR0iKTPw8jyBnruGbd9+4cHTrgdkPlWp0R86uLivp0ReBjejqJAts6a5vRBoTu2gaWt9fIIpUVReiKiV1JJ3H7hx3sTFl/8vcGKeKTCK6NAGrXqJBgFFf6P7rwCdn9X5IpCKsOxGDP/ueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750510151; c=relaxed/simple;
	bh=5tN7X1W7UK3zZKB4vPlpS1QEaHwjxdsMtbLGW2YjRc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CU3ob6X+dmbKrdlqIPGS84r9WJoBIy5J4dBpZq5lb0CGkdeJ4dOO+6nooqt/K7sdYR6UkLlS1sBpV0eXBNyaBQO8C4A2PDn1ZzbOBedmjxO73daVgtoSbrd7lLIY1Gl35dzGnWOG4dE2VzX9tfSdoRezu8cUHKCwAHyFDS1FsXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1Rc/3sL; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1Rc/3sL"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e733a6ff491so2500721276.2;
        Sat, 21 Jun 2025 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510149; x=1751114949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=c1Rc/3sL8/xoWcWoyp6vAKDHoOiqtEGPv8PmsWewNzWzw9ygb1bXDjnEkuIdPHdwLC
         BRncsgCXGYjgQEwka+/NQnLNTg3bhzT7kr9TuebBaTjXz/7dDrEu32TPznUYgvCRa9wD
         Y7GatoCK5ga5R50Ym6kBt34vrrqRrY6mt029SanKGEhCo8ifBN8xnds0xL+r7nFXgFbi
         bn0AhrlHm+njl+HyNmaIjpnYMGSrbtMcUitma5Feefvyfr458Ykqlwu4sblJsUBBZY2O
         ilorIQwPxE5lHbOHaHNRGpNTWIA37xC/e21+XWuifvWYfHq8jcd3qcLgwlHIlgiXHPsc
         NHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510149; x=1751114949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuU/RbW+cz7bY01MdkUli4UXkzNIisU/tS1eH4Yg+lQ=;
        b=GCugV7uz3E1+un20kqSFkgvmB6ujiTUensdA0BPjqZ344PjeB0oRYR2VNmFKBWkz4P
         3IF7pljh9Wfel1ZUGgn4R5bDyxTEwWnAnGxBDo6cfhR2j2tVh34N1i4zskxmM8b/ESyO
         5iuJdSv7JEt4HCW+kQBVTirGcJQ4ycAVs0XAqqTwufZxN9Ayj8hDxuimI4U9nba92EZR
         WQgUA7+SSglPA8teZVTXaIr/xhwkon55jPsn20MCsa3qSkNdSNj+RGw+SMMHzLZ0MB9+
         Nj0nIlSWr42w2K0UTwI9acqxXtWBCSiLxEH9fe2qSkszhDh5VW7W7irZibZyiEqqAI6w
         13cw==
X-Forwarded-Encrypted: i=1; AJvYcCUiaXpIwWSWgcE5YRNgErMPFM4bfifJ07kCovwchkUPkyGg2FhYsbEPYwdhMYUIV9edg3VJ64oNEFfi@vger.kernel.org, AJvYcCX47Z33xnQ1WyqlvH1vr/Wy6yB10hCUiN6srpEm9536jmbdCROZUQ6CBScYNk5JlCXccMJL57+1L+gfxjBy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8q8mKGCNYkvmQ7YE1iMzVM6LX8VgIa0sGT4EaQLL+S+8mfBs
	YOG9GVJfNfnEFrsqnaWnK96yNIbTX33C/Ty5VKAziWFqObi7fty+PfcF
X-Gm-Gg: ASbGnctJWY2VernQdY2f5Yec/jcGeh4Tlw/7mQ1euKvWvgGhqctAW6OnGLJURU5V4i5
	7H8S1lAEYdvF62dYaYZSOFML+b57a9mwskmv2Hp915DH70TD+a5a23ZJUqVih0Vzhd87rXS/dYS
	eEuiOeo6T2URWJV7cU3cAg63eorWC2kjnnUrvwh2/EOthafiV+f0In+Re+NTW6yDqo1p2dSNza7
	aJnBaC3LlI/GWtn+BKOnWqXEFRO8MlGbX3bK63J9tMmls+vqnCrxReITv/9/L/7ON0CrZb7ijLz
	CiLAMCPkG3gnRVUFHmtKsnlN53nij7qM1qsPhlxcpzHVKzAesPwBPs7AOawURI6LOUa+iPU=
X-Google-Smtp-Source: AGHT+IGb4QBZwlRaOnmhbLYGlHYFCszSZWOAsqOUSTLFSK+Gp9tDIZx+sf5NecxM1UlD8NEgaiMx8A==
X-Received: by 2002:a05:690c:3608:b0:70c:d322:8587 with SMTP id 00721157ae682-712c639d769mr89059217b3.6.1750510148901;
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a1625fsm8357727b3.27.2025.06.21.05.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Sat, 21 Jun 2025 08:48:59 -0400
Message-Id: <20250621124900.214098-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250621124900.214098-1-inindev@gmail.com>
References: <20250621124900.214098-1-inindev@gmail.com>
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
index 59b69c4741c5..10de9b7bdfcc 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -295,6 +295,12 @@ properties:
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

