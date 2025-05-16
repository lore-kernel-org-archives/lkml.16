Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB822CBE8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383387; cv=none; b=NaiDGzX3O90EYKMukes44hwO7dZX4H2gPVeexBUZGxhascP05jvyT2p7aXlDPAw2M8Z6rD1N9Pna8+ledyLnI5naKoB9RdVnyVbAr5RZKgzxX9A78B3lZLgOr76+k47U9M7e6LSyBX+noaPdtjzKPK5xvRLliL+Vmh2k4u3jiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383387; c=relaxed/simple;
	bh=ne4PfWXtPTDke/5/uFZ5cI1NkNx1QheiiJRSL2tSd1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+z9zUDQOZn1NL14tAm/B+OELDx0OsxLdyfGThw2vCRx4e0SdmDqGTuZB8dlbebsB08nWlg1KcwhRjCKJYZ37bqRjehqOieou36Kfx3BQk10pdi6lYe89RiZfwFKUCZu7ncu+PPKK44U2sLknpcMdUVDJ7eQO+YMjyUXCI7aATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ajQIsT/J; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ajQIsT/J"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e4db05fe8so18045795ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747383385; x=1747988185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V2daD2rTNcNp3coCr/ToEF+NAYlBMkaOYzNetHBK5g=;
        b=ajQIsT/JNGABAJnRdU4L0P233li6jU3+9UAWxfrTa0rzIpVAIxlhcxAXvYQv7prP2r
         l2CZA/HUdhquexq/VK1cum58wmLFcueq7kCdh6zMlVWg8SSAvEJbnTLfC2X3bjVj/LSg
         Wg0ddOsfnQSkjQkl/K93UA5VPBBF1ly7iCpM44d31KvaHuGwJ5lX3NImgIG2t97nxVSQ
         cCgte/vEfuUICw/VG0M2yc3zY1FKRjIQTk0s+q7Re0xHDVf6vZAlISqwjqup4SmcoOKV
         GE3Gc1a890brdf7lvyKd70Pus7cS5n8DN2wrNv5H0phPVXWc2Ft6YZwbepYw76QkIME/
         bY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383385; x=1747988185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V2daD2rTNcNp3coCr/ToEF+NAYlBMkaOYzNetHBK5g=;
        b=A3X3qpq4GtNnLH9QQ0UGt+DIWtc8ytOfdTG0Mpj6C4mMOQWUX8WTdx3opUrg8TAkgB
         KiADclhNkEExVdXWJWQ8mLH/LvYikCDrHOsRBNDFjPK/z5MV+JpwDEP6CiiNIuYGjnuU
         UJlEb/iWJgOAioidP2Wyy+GQ+qO6xPhAOfs0rjUDp82ouIDDuSp3jjX37cq8UIO0f/1r
         I89B7XsgmR9oBWXwC777FHZll8BHVvs9FH3s6zJLle9n058n4E/fmjqONOYpm9Tf2TLa
         IG81Xhf94jO4RremI2+bhXnrQhVIIXJZ2Eq9dLySNOckDMSNqDOsefzGd5b9OHU2EfDZ
         OeJg==
X-Forwarded-Encrypted: i=1; AJvYcCWbUkAPQeYDMbODjC9FFaib6xRLVUOcyJ5QcnyUNIEotBSQkqJlVMnFXVGlrlL6s7PQKmQ73o49qE2Lm2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxAn1ERnipfoPp9SW53nf6oYd95w6MJd3KmAgtfGLhY8Eituy
	epI27UNWGKzgkltQxm04+kpqArM2f7wizRlGFTBH9UXaeaYu2nvd1WBJX4DQ4iXPRBo=
X-Gm-Gg: ASbGncvyt1GgTYWvMuLSWfKe7MG9WhIFLEeilPFMM6VwaDfoWoEN7MpqtCcIa+iVUCa
	98WLwGujYWB+glp164IMqKTgtw7rKqGzFkCXnoEitFlYaKUGFbwL2z15aapPdJII/89SN+gzr7L
	HSLk+WII40rqTZXJNDBiUMKq3pqJpSzouYSxgOSRGgx3xmalhgL8R7PDs6yoVkDPx9i3UG5MYPq
	OcteT6TfaF2yB9ExCeI2GCtlgLPEgHn4KCmfSyikPI2YB/hsIgpVKop7+2/6fo0DtPKGTyFHmLe
	fpdlAeQHgYTIWEPCNVyhCm3OgfVdHgnQA5mVnvUpjsouSYUXIWmilLKl7isqtZJwk//gsBl87wE
	B75UyDehEouamwA==
X-Google-Smtp-Source: AGHT+IGNwOPd4/78bjds7wJXN85y4exK0t1zW51cDsS9UCcuz87FTXGSkJI8YZ6TyRB1xxjOHnrMRQ==
X-Received: by 2002:a17:902:ea0a:b0:22f:b040:9751 with SMTP id d9443c01a7336-231de3b9709mr18773765ad.45.1747383385431;
        Fri, 16 May 2025 01:16:25 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm9397695ad.133.2025.05.16.01.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:16:24 -0700 (PDT)
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
Subject: [PATCH v2 3/3] dt-bindings: clock: ti: add ti,autoidle.yaml reference
Date: Fri, 16 May 2025 01:16:12 -0700
Message-Id: <20250516081612.767559-4-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516081612.767559-1-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti,divider-clock uses properties from ti,autoidle.
As we are converting autoidle binding to ti,autoidle.yaml, fix the reference
here.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/ti,divider-clock.yaml   | 22 ++++---------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
index 3fbe236eb565..6729fcb839d2 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
@@ -55,9 +55,10 @@ description: |
   is missing it is the same as supplying a zero shift.
 
   This binding can also optionally provide support to the hardware autoidle
-  feature, see [1].
+  feature.
 
-  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
+allOf:
+  - $ref: ti,autoidle.yaml#
 
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

