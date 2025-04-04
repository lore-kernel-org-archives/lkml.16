Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F613541B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731124; cv=none; b=cOfCSdW8r97uGdgybDMXjeuzKBgS1sHPLl6fe3sKCSE4irTAa6BHueND2bEzPkleJ/NaZfeXjqaYf2RuTrctVSyTqDcwdnKb+zc/wwz8Ki/mLQmnsSvqWGHboQixRu3cfcIqYHd2BtNsG6S6V5u1DhKcCrN4s2Zoj6fC2NZaHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731124; c=relaxed/simple;
	bh=JP6AKaV4c6RL9Raq85GTSsXxMQ0cqI+v85EdlRj9uMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZLKOFiEHvgPaxYFEvhdlvBqLOrRCW3nOQ1hyzqebGQoxUOBQuCgRY7LNRI3niSf7iuWRdyBiGorN0hg4zcxLaA+8Zel4bwU32wyOzIk1zA/C7lq+3gh/czfBiwYVM7RTWM8+V1Zql3un3QEU5DwqyXBasNKpLgu7ma0NwLhW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZyNxalpR; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZyNxalpR"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399838db7fso1447020b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731122; x=1744335922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYIA0N87xhRP/FjDDfT4iz9SD40PFBY0c3zy23Ct7oI=;
        b=ZyNxalpR+zDKtKtPsc1OAcpW7vkfj4E+VwiqRo/GNF+Eoz1lAXIMe/8UhoxusrAl9P
         D1QEyA5pN3hRir6OEusicLk8vYp+Ax3BQBNP7vTWWE7n2W15d2t6R4rVOaBUgfIURgWt
         JuhIsbr02CQ4PPDuZW6UrOjs3fG1aNhsa/fWGQ5xhcUXnNgty8Ro1G67ApwLtLJaw+37
         BGN214gDS6bCLdlvNn/5u1ts1+Bw1uWkrdswcbLEVpYYG0K0li2GaVnsHsklX8XrxtNM
         6Z3eFCGBoPMAYvRc1jQptZlH46xtrEl4wdsTj6s612eitgPHjlLiPUGFlD+a0zzEyr5G
         P1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731122; x=1744335922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYIA0N87xhRP/FjDDfT4iz9SD40PFBY0c3zy23Ct7oI=;
        b=omRXdNg/D9I873wF30PVJThob8d5+bYlDbE6URwLuNrCKR8hS3qlq3OQQWN45lwa83
         GjOu/PVopicI+prQeiyJlXds/Mp+qpZNMlCWX7ekLBV7vBSgvTrUHfd221hRyqwwoMTE
         Li6j3a1Rw/hr2ajcV0Sg34LqaYjiJvk+Yf7FelAiokk04dYqPvdkzh+Ye5D0IKoxgTuw
         wnDQK8esWVj0v4bx56dHlIgTG40R+PCT4hUfNHVSv8Vf06xcK1SNHnsB3VyCZiKOOp50
         tI/l2MdZ4rGrD7HHSS4gxE1U5u1Wdf5i2qrTK53EeX+yTE/p8CMandZpQii0W3p3/UvI
         mXyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+N8vapH5oP2qPbt5hRSv3MBg5YFy2tk59KE4ishUGyBBuBZd4+FNTUprfeJoClxGn3GLrV9rh84Su4+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94gKYv+7lA23wf2ZW1yrq6rIMz+JccEyzKTT+jD8g0o7c5Xs9
	ERZNqdwT2Mao/tcxUgtmdI9BorqomEEAs5HENc05w5M66DzrzUYtGr37Q3bcZSs=
X-Gm-Gg: ASbGncuI7M8JZUWmWD5e37SWgjYW+XTV1YpTthMjvdlQIsXRDTrJrnerGp2o4bC9Q+F
	oLEUq9hivYDhQPLKtwJkVPdDEq2ZtXEDdsCLdp+Nm1lE66TJTHWwlGJDk8+INbA9Y8dEnneWn5O
	1CwhDF8Jyx7Tg2VIsZIMWmnpgycONh7agWwPTAWTkg86SnkhqJUq/ovCU6wbyCV4C5H5AB6bUbu
	lyIdiNBxxFVb7AlIXyrwmPBez3qLkBDe0mS/VE+rRSprh+iZKJshtk7XFf0O7c4mEL+T+w4zrVm
	BUbL912j5JGRfP0vIDVLQYD7D7qmkItpHW/SgIzLcKzR7vzQe30axeKVhvvcx14yUGgYGZ4TzQu
	hqLj6fBQ=
X-Google-Smtp-Source: AGHT+IGUWvGCzCm24c563t3tszQcWD7Eqxr/TN4zH8xD6j46vgIvGdKnsQwIgKwAI0GN2sB6xtHpKg==
X-Received: by 2002:a05:6a00:2e0e:b0:736:491b:5370 with SMTP id d2e1a72fcca58-739e5a7772emr1705055b3a.10.1743731121712;
        Thu, 03 Apr 2025 18:45:21 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:21 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml reference
Date: Thu,  3 Apr 2025 18:45:00 -0700
Message-Id: <20250404014500.2789830-5-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404014500.2789830-1-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti,divider-clock uses properties from ti,autoidle.

As we are converting autoidle binding to ti,autoidle.yaml,
fix the reference here.

Add dual license.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
index 3fbe236eb565..aba879ae302d 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
@@ -55,9 +55,10 @@ description: |
   is missing it is the same as supplying a zero shift.
 
   This binding can also optionally provide support to the hardware autoidle
-  feature, see [1].
+  feature.
 
-  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
+allOf:
+  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
 
 properties:
   compatible:
@@ -97,7 +98,6 @@ properties:
     minimum: 1
     default: 1
 
-
   ti,max-div:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -116,20 +116,6 @@ properties:
       valid divisor programming must be a power of two,
       only valid if ti,dividers is not defined.
 
-  ti,autoidle-shift:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      bit shift of the autoidle enable bit for the clock,
-      see [1].
-    maximum: 31
-    default: 0
-
-  ti,invert-autoidle-bit:
-    type: boolean
-    description:
-      autoidle is enabled by setting the bit to 0,
-      see [1]
-
   ti,set-rate-parent:
     type: boolean
     description:
@@ -156,7 +142,7 @@ required:
   - clocks
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

