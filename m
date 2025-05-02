Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C93202961;
	Fri,  2 May 2025 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746219344; cv=none; b=qG2FbR3GH9EXRk7uSPHm8RJdTqtsBoRmqcMxtg1ewN1bxqHNZSRK7iOp3+uNqDUDWdr4oTi2yViHg0vac5wfNmACNPdOJjxy1M5bkDMLSTdEQymlWWFJPT9lLoMprCAwxW6TVTnrfmQQh2Xt/Z/WZIcSAKhArcr7WJzCVBox29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746219344; c=relaxed/simple;
	bh=ODi0JC2HXqZMTWwR1s5f2hkdCy0uXccGWzvYMQKQfwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dml4Nk1vhmHcHhORi2LIFFsgiEjmAtf0QbGx/INhADjrfHegHaxMRU7vcJImNdVyK/WLAHZ+NPckdPiJJagUZYK+IJZCnJFCp92MnF7fx6Ts4/8V2JTEXcTVQB9DfB5aVzJ+7CrkyAhqbYJ6eRtjyHl8O7yA3ns3azzFs/c6BEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDTpie3S; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDTpie3S"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf0e07954so39688006d6.1;
        Fri, 02 May 2025 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746219342; x=1746824142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=JDTpie3SlLqQ3ZKbANLTbXnpsCOFKbqjvNoyAn3HPjGtWv5AMk6snsHbn0KbMLjDAS
         Q1UkQBgLBetPXPiKZWH+2fUKSCqVMhr1zkh5GwR+saJVIaPjE4Bu79427vGngNetptjh
         ssWesN5caM/ixcNeItNIMb9yvkstJhnjGwoEgifJOrYeaMRP63w+uWchwC6eMLmvXouL
         UtznFk9C0GPwazjHxmdfbmf+vOXOcRwMqhgjsDkiGwjCaoKKzfq7psy0Wp/8rsnyxgwf
         t+SyCjdXwALCePsFdJJX1KMDD9NiK6BA9VUWi/wEqxbHbNs8e07fYdhfzGFNELHC5azX
         FDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219342; x=1746824142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeBI1hiHxX3EY5hNbTVYMQnv6jTJMzI7qpXjSX73AkQ=;
        b=wCSnQ6aJdIsYGX99VgeqwPde/sDo8GgHCAP07E+DPtGc33SrrvyWZ0i485vLuZPsp3
         LwEmikVeBRIO4bvOqpX1vOc1mH4v1lpgMyYjSkITPLK3RGZsBu0Gmr0vzrbKa5aALJ0j
         CXsphbzhmdsE9Kv3cwaZ4hDrp7BARa6g+j19ymwfHavcVjeEoC3R0ZMgFaA4COlMJbcZ
         6BLmaEtHv129aoMh7Rt1R7JdsVhOOosOO9r1W+F88rS5KAHOvdQATkUjPHKSxgoZPIsN
         S9JpGrhu3rHy3IuktKsixSE6f3nGzXBlqdu+jaTPfODE0CGc3UFKupYpioofzJGo034q
         p7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWSINWkbyeBBobFdt5gR7vrYkhMKGTF1Zp5EFyGwtn9juSEyIu5rcYq2l7R3wnam21oZz6FUzJeTMSw@vger.kernel.org, AJvYcCXIujzW8M8gTeOetbZEBjEFRft0ZG4+l4Q5peCr1lqdaatnzK78z+CSCHqsUPppDiA12QJcReKhjGUK0fEf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7FP7Pp80bKg+SMXTBTsF03MkWrx0sVo/2XnmpLPOLUY2PW/8
	XJbR+dTGRGe5xsp3NtLC/vOdITeuDoPzI8JienpCdnw+z4yLGTvD
X-Gm-Gg: ASbGncsm0R9c5e4QOZfqZwG+TnAqV4308181LaP9aR/Gc0g1singvMZV6icnAIiAINx
	BZ8UoILLyzKzrfqNgO4Hu/LYKwnEyXS1YXI7yiEBnYm2GYzAmG9/UhFjRVLaQoG2oZVXaZzI55k
	wLV5Vhf92AWOpRgIgl0Ooc2tg0mqYng9VKfa+pWGsR/3OScAN7KIQEO0DZHbbQ+tLQwm/wCdlcw
	oQQ6kHW1bgkAIHx4eIyPWONAfhqvuvZ5+JPZPVBefHwGuAwwmHD7gnepqOtQFtM2P1ev/x6rtgo
	+HXzdx1QDueMsWiz5LVQ9zmncHw0XUrjNej8c5r2DK+pZNt+ZVK+
X-Google-Smtp-Source: AGHT+IFHthfJ3MLNCB25zeq1ZIPDkXFJ/gT/GleGPTEkTfIvObyY7a5raHnfm9C6X36wZpZbAZ4e+w==
X-Received: by 2002:a05:6214:1256:b0:6f2:b0a7:3982 with SMTP id 6a1803df08f44-6f5156184admr77433756d6.37.1746219341935;
        Fri, 02 May 2025 13:55:41 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2844sm23129936d6.56.2025.05.02.13.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:55:41 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
Date: Fri,  2 May 2025 16:55:32 -0400
Message-Id: <20250502205533.51744-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree binding for the Luckfox Omni3576 Carrier Board with
Core3576 Module, based on the Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..225a2d9e4d94 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,11 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Omni3576 Carrier Board with Core3576 Module
+        items:
+          - const: luckfox,omni3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5

