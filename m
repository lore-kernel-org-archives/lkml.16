Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7022D542C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749611444; cv=none; b=bz6W9XIqop2V/KET3OHqzB+C8dCgJPE2OoPGEJTJMJaR+uq9er8OSr/ho/6UYBFtL9e6anCETNDSenFlofMsK/+uhomvGnpou6+zHAKfP/9jlGSq2fFAE3N6kz3o6A4JOetO5sPKs+uqn7OaKt4mBx3F9+phOrYCM+OXXQmbKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749611444; c=relaxed/simple;
	bh=cQCoqGfVXgfH6RP6u627QjM4iBrGZCHy/CEOkuwAHpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=qVN461xsOhWR2s4XVjSsw51Rs70grIb0acTvLQSjC5ph9owkYNUbM6hA9t6ln7UCF9j5RTiSgKfggJG11gURENYz5dpWvGnh0PMM5JFiM8LW8rwOzxsz8O+0W0fqOfgMWDWDQ3yx8wUaBlbm3K47ynllqFCRk+/5J/i4OlzqE+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EJ24A5lP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EJ24A5lP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234b440afa7so61549195ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611443; x=1750216243; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB2voV3T1S6s0kr9GCPOg8+T/mhra2+9mwe9rgHhrTY=;
        b=EJ24A5lPD8Ad9YwaZENdBBMg+jHKDm8bClXh+vcVWCWe8+conWAeTnfSeYMiak343C
         UA/SPdVjn9NaPqlIbpKAKwsvAQIW/bA5AtRKIRXaGdjzcGKfsA2XpE0p987Bkqh+BCws
         QKRm0XK5xWdQApyXs3Z7Ov26/6G8t/t8N3JPCBbcImOw32aYfYv9NBwo3pzDdTO78qfM
         Ub/CN0yrvUXgfFjA9CjWcH2ub0pJbilKksEIBSVgfi03Ldjzpd2bBVRxKiRym9sjAOX+
         FDYYjUWS0l5fNtmd4ELXMtPgmX+rMd/csVcBB3Jfy6aKR/xyHiNQEmwMPTHRrJEhKU9T
         a25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611443; x=1750216243;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yB2voV3T1S6s0kr9GCPOg8+T/mhra2+9mwe9rgHhrTY=;
        b=M54I4WO0/YkPkn+bfObl8iBTeiLCl0IUlgtyKk1SnHoB2MsuFCnEnDc6a9nFe4GMQo
         9xd7oVOtTqGt3uv5TB+9/HVESxKJ+b/twKOPgx9LxsKxBhdEYyjhM3eNQXPlJcFj61oz
         IKt6rvxVOXiXbASgXgqjresUFqhGsFvz9PgndC5LgyCN25u0ToTY/xSfI+YSpycL1bbA
         YrxG27mDWxEoM7XRdbK2vKekDSXqY+rixMtgClnmcCo9o6cR3k/AEXKzPVKs0aIiykSi
         yB7jjnZbQcZeNdnKiCwhY0aNNbIOqDkOMOU+EjFj4nYE7G527VrBpJz2P+qx1aDa98MW
         4tAA==
X-Forwarded-Encrypted: i=1; AJvYcCWcDx4H23MpJiMcj1X7TGGWodBN02If+vAYtRTZpsa2+g2s2CsaNeHf1lc6OVQ/unWAGiR7mvhTahEUKEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2rGmVws7lYpJvKaJ7TF9eWM//WJmdaiNd3d+QtH8gEa2ZIc9R
	/k3TGsjwvFE4EIy3MmbpF+RuBzQyCuNrQiR0yyNE9/XwvQ64jKE1KWlO3zk2qbgBI0s=
X-Gm-Gg: ASbGncui2nwoSBNPdKv9t6G4Y3uGqLE+L0O5jAlMEhAUDzbKiqK4gDMA8G5ktX2+xcg
	qcPFJdFGbaI5KmCijaNgLotQor0GYG4TSBcyD5uNZysSlAsMupKui5sHME3Actsxu/0VpO8UFUN
	tRO+9tDLRgiMKYHYF2UxAk2JwsNtL1GHMijKC0yfbeZn9K35XBz/Vl9NSYbD/noDdw1EFpKEIDN
	tt4J3FhPCjlCsPjEgNKllOEJgKMdiOBQnrdDHmY/sdoKn6XW2qlv9XhEU60ck8z4BCq3C25a+0c
	qBseqjEGVSF45XDjMsfCRHdIeElKBQDvbKuEzVkNwlWD7FZYAqtZ7PcU/Zu9mKmIilseII2CjkH
	9cixWyuxb
X-Google-Smtp-Source: AGHT+IF31vP92Jv6j9lEk0SYqK0SMTOB/iLYB6Qw7J13ixzOTBSXlAdB2rxPm5OhCWdhoVqhRABcCw==
X-Received: by 2002:a17:902:c40a:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23641aa2426mr19809255ad.7.1749611442683;
        Tue, 10 Jun 2025 20:10:42 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:42 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
Date: Wed, 11 Jun 2025 11:10:20 +0800
Message-Id: <20250611031023.28769-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250611031023.28769-1-nick.hu@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

SiFive Domain Management controller includes the following components
- SiFive Tile Management Controller
- SiFive Cluster Management Controller
- SiFive Core Complex Management Controller

These controllers control the clock and power domain of the
corresponding domain.

However, Since we don't have a SoC specific compatible string yet, so
add '- {}' for the first entry [1][2].

Links:
- [1] https://lore.kernel.org/lkml/20250311195953.GA14239-robh@kernel.org/
- [2] https://lore.kernel.org/lkml/CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com/T/#t

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 .../devicetree/bindings/power/sifive,tmc.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml

diff --git a/Documentation/devicetree/bindings/power/sifive,tmc.yaml b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
new file mode 100644
index 000000000000..4567d51148e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/sifive,tmc.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/sifive,tmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Domain Management Controller
+
+maintainers:
+  - Cyan Yang <cyan.yang@sifive.com>
+  - Nick Hu <nick.hu@sifive.com>
+  - Samuel Holland <samuel.holland@sifive.com>
+
+description: |
+  SiFive Domain Management Controllers includes the following components
+    - Tile Management Controller (TMC)
+    - Cluster Management Controller (CMC)
+    - Subsystem Management Controller (SMC)
+  These controllers manage both the clock and power domains of the
+  associated components. They support the SiFive Quiet Interface Protocol
+  (SQIP) starting from Version 1. The control method differs from Version
+  0, making them incompatible.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,cmc3
+          - const: sifive,cmc2
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,cmc2
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,smc3
+          - const: sifive,smc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc0
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc1
+      - items:
+          - {} # Leave a empty for future SoC specific compatible string
+          - const: sifive,tmc3
+          - const: sifive,tmc1
+
+  reg:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+# The example will be added once the SoC specific compatible string is available
-- 
2.17.1

