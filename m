Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA02220698
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213479; cv=none; b=s6/aqsuD7eiI1GJa0iSWHiKxtnab6QDT2vT+6bkkarvaTCnBo9HZFtKQPxqUuA0MvkzLZOrszDe893f0Z4M1H8I0U50qR4FFZK8ylE9esMkmFu4UAr6U5NAevKQDCTEr+i7vMKW3kian3frEIpDp6eLkUeqpzhFvZvhoj3LRhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213479; c=relaxed/simple;
	bh=4qxzgRYj3R0YSr5c7wuqfhdIlrtZfod1FQ+TL6UyLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYT7riifPGI6nYu9Iha2bKUrL15i8j6XAJwZLlONPpQpz+r/cu+58B/ch2BmWSqKG7IRVicplqjtVt0nd4ToIf2G3PaS8LW2UuZX9RJYOW78ttJRviaWGuXrBF7IvERbHjfJfToJOQo/kEgXmSTmcoK9mc9V86GftMQADzXalGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hoc7v/A1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hoc7v/A1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso3033608f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213476; x=1747818276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=hoc7v/A1yzO8Gv8DLZUATdV7x9gpTuSgqMrYFj9n8A0nVu1qubAijxormEOpnLpGka
         TdfKSLlcmo/l+giozAANxSQwhoejjL8454YEEAruOmzVIkQkCshCsJwg+S+tcIjkjTAu
         7T08bf1GeFm/Kxm1Bf4T9BrZqJ93F3/Ougc4CiwoSv7zogZYvFkrn63tV2GQ6rQ/8y/q
         +qqF0+soqWm2OAOVS/Jrmfso60bViI0tm3K5BGui/cxLvKwXYI2V63d5zxA22pDkiWHP
         hZUBIFjPsyIkcAZ+6s57v92XzqP3cvlygtL2rBltAOuHo4V5WgYizstZzVihU6h17Ouq
         z5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213476; x=1747818276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlrLdd5J+/M2OISiprAv0x4oZKgNtFnWiJLXGIklBOE=;
        b=heNeBuBGHey0/+QNn1SwDWJkO4wspH2udRcqwg0AMh96D95fcGsAs8zSjhtq+xvI0I
         AEaG3sEpZmmqzM9I05Ofa7vfsBkcP9sIqNTxni3KXTh7y61Hnk7/gmqmJPyNHZaNxV2E
         2khoI3hTLfrf3pPnwiDSl6Q/sa3y+q0Ro9hpgMwim7Bi3D5MEuAQeJnwVbHqtSPn615E
         pi370s9OFCAJYNz7ZXHI5St1gRswibXny5La5r8b/CqGTtUBlkO8+t0R8n7v30vtfc8h
         yXY+TeSB2NG74erYWT/5u1Yywt4+oaU3DjuoFFyZuLysztWqCghnSl8XMmT///5YooX2
         0fXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQCgc/WoyL7ZfwzwHMd3PRdPflsP/TlddIfk+gG4xYCSKbGfQ/39GJ5sHsq4Zw0NFNAi9IFWtIqIEhri4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIkFVtNhpzhb4eAMf+RdrO/WE8eYDTfS1O+pPT+Eox3zHY2V7h
	U4OPr5pIuWMIc34OekxVtoivWGWxvKDVe0KlX7aKjNl9DA9//RQlxJwyUlsNIp4=
X-Gm-Gg: ASbGncsR3XzSA4NqJewOVTbmjK8Q6CsAVdODtIwRZrACIQ5LocjfW8UJoyjzXqcrA6C
	xUiZxPKTIt1JIQP0Gi5ThyQT+mCHaodcfDIMouioL1h+7/f8tFEVGMZTKQKGvqb0zjrlA+hO6BG
	7sofQYbSpUunUeAXks6mXeF3psb2EMjM94raZfbzmWU/eTxWTC8vYgZ/9wYWIxgtdMoHx87MRbZ
	c0zESN01mNx1HAkGQF5muA6xbsNNFQHa7aHSIVYZE3w6TvSC5uv6o+3/uRh/eiG4JxNevxMQzHL
	J0cO4rrWo9h1tqPXbqDtEm+ztyFH/1aw5TqPTsUHynjaslz5V5yS3lWnpyYkXGtK8aZtabeuSvA
	/r+mb
X-Google-Smtp-Source: AGHT+IEKWrUAq9SfIgehioeqh/K72TgwuXn7Fpock53ym5/tWn404/btuDmLUE0Kr4GNSRDHbVTVpQ==
X-Received: by 2002:a05:6000:430b:b0:39e:cbc7:ad38 with SMTP id ffacd0b85a97d-3a3496c28cemr1869568f8f.32.1747213475727;
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/8] Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update #power-domain-cells = <1> for RZ/G3S"
Date: Wed, 14 May 2025 12:04:15 +0300
Message-ID: <20250514090415.4098534-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

This reverts commit f33dca9ed6f41c8acf2c17c402738deddb7d7c28.
Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the
Currently, there are no device tree users for #power-domain-cell = <1>.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 .../bindings/clock/renesas,rzg2l-cpg.yaml      | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 0440f23da059..8c18616e5c4d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -57,8 +57,7 @@ properties:
       can be power-managed through Module Standby should refer to the CPG device
       node in their "power-domains" property, as documented by the generic PM
       Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
-      The power domain specifiers defined in <dt-bindings/clock/r9a0*-cpg.h> could
-      be used to reference individual CPG power domains.
+    const: 0
 
   '#reset-cells':
     description:
@@ -77,21 +76,6 @@ required:
 
 additionalProperties: false
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: renesas,r9a08g045-cpg
-    then:
-      properties:
-        '#power-domain-cells':
-          const: 1
-    else:
-      properties:
-        '#power-domain-cells':
-          const: 0
-
 examples:
   - |
     cpg: clock-controller@11010000 {
-- 
2.43.0

