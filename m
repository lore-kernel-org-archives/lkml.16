Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290691E260A;
	Sat, 28 Jun 2025 14:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121175; cv=none; b=EnB2WbFXzF2yA81mQdJlpztiZ8cTpuksqCiHVHAZTOgwr/3eh8UaI1Fo1yqveYaXCI78N5ZjcmuV22Fxxwp2f6Pjh27yZGDjMB+ylr7JsKzB8WjJ04kH55cyAagqrs6wKuPC+UIiAUlWUI/uwvTqK08gAH0/S9QlOP3hdp6JzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121175; c=relaxed/simple;
	bh=SurKMSd03VbzTEJNIXvd1aCQ/0K2JELTMC9f5AmxlLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/fsAoZ6VZTsn+b1yIJQ3uMCt+GbR7r9FZxNMcGiI0jJoTdwNsPgJ+2kiP7dGS4CF/Nr1rzUNE790V70+JZO1ODQnQ9iEUmZwKDAKBxvGFKwoju10msIKAg0Lp8r1CjL1rmY7KGcDOX44qhCfk7fUnt3aG9OW4mKki9iA3ikis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7CTqxv5; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7CTqxv5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-714078015edso7497257b3.2;
        Sat, 28 Jun 2025 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751121173; x=1751725973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/02Lsj/T/97jLP9Ha8ukw36R8/b/6z88Oefrj46EVM=;
        b=O7CTqxv5ZRtjHmAhVYmUC1BcZkkYyEKbpMPPeQc4S9Rh0dJfZyaUZJRqHoksUrXnqE
         ELXt8swStA9oYpCV81cYWQHWclkLTjsu0Z0gHL27mmaMIH7RVPoqZkXSPM2mIyaUyCHc
         dVGiTDBjrCl09TNQCPuleYZdCk40K7hIUhsDd5c/bRGv5pXp6qKDm907/sLYlhT3QptS
         QQlkeqea2cwftGA+cGawCP8GoGBOS1UbdDFbfvaVzkaKvUyjVZ2gJoVRVCCI8zfYnZDk
         ULBMH3z/xAvquc1hYcV+zHN9CfD54PqgojuTq8fb9u29HmuDsFfC30NoBGA3OvFjcvLF
         4q/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121173; x=1751725973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/02Lsj/T/97jLP9Ha8ukw36R8/b/6z88Oefrj46EVM=;
        b=o1kSHkRMT/plGv9JP/UHepWgmaa9oRK8mrFLL0t4qzGEr0uEiU9bn9JL3TWMCWl2ti
         kFUYi0JWCV7FWhave8HQueXuPRblhBxLK3tunnjnLttm/Ov5GinaW8xsAMLXLYNK2KSC
         COPZqNHf3uQcw5Azt7ZAt94LA53nr8nvCJMbMbG+kSIocfCR9pRWtbeWeyPAkGQFhU7f
         vtjMI2kUAzhSJVEnUS4NGicgEVTt46GXYKkFetewHMWiIfTNH3kDZKMLGoo0Ful56mIz
         SMcKI0yK3EQ/OwqGIh+z+xhnKt2R0c5xNX141UxgJ8XdUKdol8RRIGpqznOAcEli0S61
         zl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM+oi/1ijiuQ1lGv1mTE5wECyaDMB7tbfPvD12ZaXqsCX5+pMzNb0oF/fR9ttroEOFD3Ijb+qAr73AH/jr@vger.kernel.org, AJvYcCX+GJE6OURo4O9GT0UQ5Q5vbztP6uT83GZ3lfnzTkMFkAmaUTO4vgriQIbPMHl7n9TIX3jQ/h9qpCor@vger.kernel.org
X-Gm-Message-State: AOJu0Yym6jKdws8QKj2F4I4OvBp57VOf0WtcdlGOJvEM1BZ2evz1cHWi
	xJOji5R7/HJjd985SiYLSR8vrqa50TehWGbjr+U52LO2uZN5mDzzPfLqq7pKbYJ9
X-Gm-Gg: ASbGncstl1GzxrrdtQFNHa2jVLD0iBW2iALe/05a094NILIHkMJ+NBpmjvreycSq3xf
	uHBJ9wzG3BXdPnxJ8jiE17z5B7lwkOZ5X3gZIIwh9FjKMK95fgoUUtWuLa7xwBAuSSzS/zVitVT
	HQiOwBovvUzPIUFy7CAgTz0aeMc16MfRh2Z7P+vpBjNVWAwpXu2Nzo6OMxCkrKx7KtvK1mv+Xl8
	GWwUhII+B6tiZuY/8jKFCYffx1L1bmiV2D+6OdJjnMmu85RrRoRSwVIW1XHYuGHhquE9PqGwz2u
	84/OjNL9SBXKMGAJWkE8LD0e/ee4a1L3I4NN8RZTRvS5BsVsgeiCGQB8+SgWPbg8hn5b5WY=
X-Google-Smtp-Source: AGHT+IGWGkuH751nkoncx6f/tnMkzFFAkH3Xsoy1345CUebdsXKdkIGHBQnf4vWQpcS7mthSyWmNkw==
X-Received: by 2002:a05:690c:9418:10b0:707:dba5:2e44 with SMTP id 00721157ae682-715171b48camr78145837b3.30.1751121173125;
        Sat, 28 Jun 2025 07:32:53 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515bee257sm8393477b3.23.2025.06.28.07.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:32:52 -0700 (PDT)
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
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
Date: Sat, 28 Jun 2025 10:32:28 -0400
Message-Id: <20250628143229.74460-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628143229.74460-1-inindev@gmail.com>
References: <20250628143229.74460-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree documentation for rk3576-nanopi-m5

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

