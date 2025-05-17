Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18654D599;
	Sat, 17 May 2025 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447583; cv=none; b=kr0Bqr8p3LYWRnVYB1dj+rRzSHjErriUeREIOwTbWNzVQO6BJyxsTSZNjd0VmxZ2vNDC5Cf14zeOBizd8UeTWL2ghbtrbiYBEMNVwBLTm4GPVQVxumSLnndTeC0v9pkftxMNp1cpZiVIfMwWUgG4qdKvCWPipUwIc5+kFjOvznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447583; c=relaxed/simple;
	bh=2qHvh4pIm6qldHk5sjMMLAC004kNNTi8X3pMpMlPwKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cAwt7/FpR23IYbA0Emj8z22lsypYBboOIUv0BFM4SUoLe+gb7WU2MRHx6q7eGni8Gt1QnjIFkmC/6JV+EmwAkA2TahVpTLGj8LTKaV1z8GA98Gd6X4CoQBWtzdR4pFqMBWKjXxiy0ucfdlFz5cdHhcsUBnZs9co+gbSDp/YJ3CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrO/5xN4; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrO/5xN4"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8c53aeedbso5841856d6.2;
        Fri, 16 May 2025 19:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747447580; x=1748052380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKXLeL3ukBspnW2IUVVrIXJnVabhkRXsrkb89rHps2U=;
        b=TrO/5xN4XTWK3TKYV6kd3WrTWJ0dVgh/fGg2idQNJfNx9wGVnNqPFAAwVt0Kjbc27h
         YgqEiLRz5DoY8BC5RewU0JHrCLeV3lQV6aH77i9K4Rd4sNmYukMnLoDaPZeLf1iaYw3x
         xpIIsMog3gMdB09dbue7uBT+bpD1ilGIgQvolffohcFoC9/wHveBrn5hq1MDLovE2XOB
         twaZsPtwMcShLkz7wQbTceds2INrm8YULWayTzlKM6RK8qUSaKKKL979OPJRpjQ1szCY
         B6jk9P6v0admwkfzCxhvI22xnwVKrcchD6KZu7WMadDwIGAjpMJwynNy86GxoYdv0/1y
         7iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447580; x=1748052380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKXLeL3ukBspnW2IUVVrIXJnVabhkRXsrkb89rHps2U=;
        b=coWZrbI8DRj3+w7nLGUyY06iVvU2wHNFQpiSb8lbhKmPT2SU5HDHuBtEM3QkdnIdm9
         MUWcL1mu23RkH2LNSVDHno7mAM5P6a5AfwOpUGAygvWn+dWrCrp8bs2pdYAGB2kaNrN9
         U5tZ5HTqpZRJxzSOlJEctdoneTl41E3W+MPaZ+HjkQowzfzfHjEmMDSdYaWeUtf6WpSA
         +5I06sDYF7HG8xoOAiJ5zLHC/Pq4iCZbOdcPClXuN31RmEkdkbyfc++ifzlzfeYnqnaW
         TzBoe/H9RPLf7CzdgOyHAWmI89qzacaXwj+UaUdCh8HG3KEPS6JrBG7eS1RJNz8fD17w
         jwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlzUonmz2DodIWF/tvL+nLyPnW2AH0g5y9MxLwDZ1RcqtNxo6Ok6LexlMXOgFZYldsuaFPULNMSy8Vcrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwWbqO37MzTeHCNWSCKQBBZA9zuL9sRDAIjFqRWEtr3UMJKTo
	FQ2SZgk+NMHAmwn9VyGYZ8pNMz4sAzuEsP86HlO+h5KsjzSq11UMaq95M5GM
X-Gm-Gg: ASbGnctDACG9VYnSKr6M5KzReobe9YLZL4JBXn3CsTQPE7c/OxrYtTkrMFN3rZtVMNE
	J0m0R0PQMB4x3T8Xi3Gy7+02AOCjiwit7fCTCOYl035mWvEv9UWo2Z8bTCLiob6g8dTXH7h6xhn
	Mil4TifY9bfj5LeaJANs5BQUg0CJrccKoOrXNwDWRMyktWE/57rSs9nTaf95+XT0H/PCpiFSJe2
	KJVHFzQ3Y6p5TnBlb8hRr4sAIF9u8CoLuXE+B7kPZnhjCdgzkiSVi/5kXKLaaeoB4vs8f0fFT2y
	jABY8T4Oe1Ecsm2dg3RjECW0ibQyigwjYeT8SDDGeu8k3k+KBwSB53iEtWBL+0ztUom41155vdq
	D
X-Google-Smtp-Source: AGHT+IGpr4M6tPFJTIRklSzJoum9VgP6uUrsrUv4SQX78ySuBkpTAW8J4v1g4DGVFtzUXC4O5TsENg==
X-Received: by 2002:a05:6214:2681:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f8b2c9d22fmr78053266d6.26.1747447579646;
        Fri, 16 May 2025 19:06:19 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:4011:50ae:ea20:4b60:8f04])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0979851sm19250876d6.97.2025.05.16.19.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 19:06:19 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: heiko@sntech.de,
	briannorris@chromium.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/1] Fixing a minor typo in YAML document
Date: Sat, 17 May 2025 04:05:52 +0200
Message-Id: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small typo in the rockchip,rk3399 YAML document ;
"less then" should become: "less than"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 .../bindings/memory-controllers/rockchip,rk3399-dmc.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
index 1f58ee99b..1a96c743e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/rockchip,rk3399-dmc.yaml
@@ -128,7 +128,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is DDR3, this parameter defines the ODT disable
-      frequency in Hz. When the DDR frequency is less then ddr3_odt_dis_freq,
+      frequency in Hz. When the DDR frequency is less than ddr3_odt_dis_freq,
       the ODT on the DRAM side and controller side are both disabled.
 
   rockchip,ddr3_drv:
@@ -176,7 +176,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is LPDDR3, this parameter defines then ODT disable
-      frequency in Hz. When DDR frequency is less then ddr3_odt_dis_freq, the
+      frequency in Hz. When DDR frequency is less than ddr3_odt_dis_freq, the
       ODT on the DRAM side and controller side are both disabled.
 
   rockchip,lpddr3_drv:
@@ -223,7 +223,7 @@ properties:
     minimum: 1000000  # In case anyone thought this was MHz.
     description:
       When the DRAM type is LPDDR4, this parameter defines the ODT disable
-      frequency in Hz. When the DDR frequency is less then ddr3_odt_dis_freq,
+      frequency in Hz. When the DDR frequency is less than ddr3_odt_dis_freq,
       the ODT on the DRAM side and controller side are both disabled.
 
   rockchip,lpddr4_drv:
-- 
2.39.5

