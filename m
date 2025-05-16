Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDFC22F74A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364741; cv=none; b=jOWTAk+tXrjlPaHZ87L9ETqSt4MO8wqi2Ca0wURGKXNZWjKMF97i3KdlHGbufohoP8XFveTMDUd74xrYRvBIJgWICQWhSoLKiiansXZWUb0q9UBohlC5/ISjOgczya/OfAgtSAhE7dHNOxVOB4su6Z9BIKNoM8pvqenJg090w0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364741; c=relaxed/simple;
	bh=rGgZRpxBVOFQLMc4IbKbxX0j+8pNOxLzfGBnh6hfkdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BLNdmBJuJqRkEIGPqvZmQ7+Lv83zj8xX3gBhsMr1+8EAlEDbh8CZYri+w4ztMY45H5PGI5BKTESj2s2xdFX1H74TBuo0liVHE1Q4UWfqebVCslRnZObtd2rv4pJanV0ZbDSt5VRlWTuLoKqX8aNfBCq8/uC+6JAXYZfknkLmktU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C00lH8L6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C00lH8L6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e3b069f23so13934305ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364739; x=1747969539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=C00lH8L6fcInmV+ejalOPXNC0FNHPNdv0iMtVHNKBkXBALyyp9ohmY2NpMt/RYCKrr
         hfPiD/PoWGctFFwkQvo34pKWuwOMMqMs+yDKsoazyb9kmzoIxm3ycX0MryIseJmXXNSk
         9MZnCLGYund/T6vdd0NHxRJVVPDgeAPIpBjWEOJP6VKXpPwHzfiaY3/CdCHcvD0SOwJp
         5QvJBOmYlIcuSCXB/N+0Mzi5Du2HJBcmjC6P2AlExtQdFf30qWBpFUHCrxDTNNZwgbXd
         FSq1oNIRnNvjBCcyeRyKlQ9MjKSpt3PCEUxg2+oRclOgd6n68IBkoylEXGF4TLxOpsoY
         cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364739; x=1747969539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkq5aqcqgDyI2pIygo5ON8Kqr2pvfOAQO6NeyUgej+M=;
        b=ojoqE4jSyWaMfS8ezaMtYyh1XKLyKrtiYOm1PsFbo665t8GzXECNHKisOGNXJ/l1WX
         Yh3TSjVsG9uR0NXGKXPpYZXqtmlfYOmdXywnOnwSTe2owW9J8BIJ4in7QQcE1tafdUPx
         3mi+70TT73V67fYo2dEcSUCqG2MtoKNXXc9BlzD+NCCABXG4hZ/oqSZdcamWNMlgCTbj
         BSXwaROvQixDGytNX2xVGk2ZPFspAxi3RwvT8wKE0qHUC3S/VhYfZevNB+muGvdoTPRh
         SDNiwpWZSoeWXfu9U/fFywXsz3G3UyU72+rhGmn6YRQqh90lSBfjF9VhTva+9XXJc9tL
         zvEA==
X-Forwarded-Encrypted: i=1; AJvYcCW0N8IDxUoLdhQpElUUr4rR4s5gE+pfBqZEVtZyBH95amf0LrSOM7aUTNE0mGx/R7cqQfLoOpZD/u1wb2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6pi4aeHmIboJngeeXmS4P3ao7UAoJyauzy/SoyMXW5mO5MCO
	UzTmeaFi+Jb79Gx9HgFB/TvdD6tkY7Nua04giSw094zowW+9N2Wy1T6MNoclt3WDv/c=
X-Gm-Gg: ASbGnctPW510cijmDBlehrw7KZkNp/H+aoMAa2UV+uvOWr39dLaDa/vGqD2XwYdfJuC
	34tjAOcTYUocFaEiYtkDfzOahG+6d9e4f9pY7VLOjhVz++H5l3lhrBGrlcNic9OP1BrH/DNJ5a0
	vc2o2u5l3rS9AIgizQ3oHASJ4gINOOsBW7ti4Tz60LI3BSzpgE+QJ8BysJbLnEJOfz57vRHfq3A
	ahIxFs6PV+CqDQm4O7t0xskO0wzCCLeuWJ48dDDO2leemVjZM4vC0SlinFqrD6u+I5VGLvtV4Kx
	3/i1HcwPaKim3IX7JC3fNBHi6jJApt25ZfMqaGCV3vNwN7h62z4M5S8YzLZdUVwoLya5A5L563r
	YMaO6FWG4Mh5wwie1e0GEaw==
X-Google-Smtp-Source: AGHT+IGhn8VCzQ+upEiABqh6yMLEnwbq/fKp8JleBYzALUrKxgEFyJXQdx0bVgVT74oP9BQ13kZiGg==
X-Received: by 2002:a17:902:d543:b0:231:b7e1:c977 with SMTP id d9443c01a7336-231de3763abmr12204855ad.29.1747364739403;
        Thu, 15 May 2025 20:05:39 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:38 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 16 May 2025 11:02:59 +0800
Message-Id: <20250516030310.16950-2-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..d36e7c68d69a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,19 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # SiFive
+        - const: xsfvqmaccdod
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
+        - const: xsfvqmaccqoq
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

