Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2B204583
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 23:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931064; cv=none; b=BKqXFupkOLFPxNTBIR3SPEgUkgNWsO+L0UK7uC8JrE6ezM2SOfEkkHHvDX3rcugSS5F8dcI3UI0GRqjshlbzaFQvuOcFl1HzuIyhWbGgCgxPztZzB/lDsIIUouG6jrGsfmesvqqRdHKHTzaQWG2vFEshS5TRvSphetdU5+mXI84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931064; c=relaxed/simple;
	bh=uN+5WpDdbkQDQBwue05xSgy4ppNVh7/N3Q24oRcGl5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YtmA+kI1HxXyBFiUvPSjtmQJCdxDGhnBzy8bv0OWDCrO2T980ErSQwDchEq5Ki6l3/8W1FL+gPcoj4PHf7muLU9m86il8tXWrzNYF4ic9EzB9z/77pqRmLTm/L1H7ijBqO7wAnYzQNDMMmawVhMyaz3k7qu44vB2MTVuKCa12zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AkRFlblE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AkRFlblE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2254e0b4b79so20477155ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744931062; x=1745535862; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWYtfNnXs+JX3LJ+csjR90IU9qz0LhJ+UWyysJK6Yms=;
        b=AkRFlblEaZvB3wLA+M3YvTAOBnE027R9wLH4RCZv0EXAdEEks9JomHq8ff/CTkbGmO
         hHU2dKdqaRBpeiSF7yoKnCRRvd1mkMEBmDCF/j5lGC5yabfnua3z2+PahuBi2lnTydWf
         ojLJ62IlP1pvKmou0HfG1LxeLEgHQbITO6MOSoiHqW6BLamVjjBXZbF00KJeMc1VHkTg
         jb2EhqBfCKm9iWNqo8KMc/IKfM/9+kE2Aba5CYaArZS24XAMMg1xbtjw0llXc47edYCd
         81gzkDlSYlFRaXeKYCLVcfLxNw5DNrlv6QSqrftRYRKFDgdRXhuiJ8k+E68YTwiiC2jb
         2rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931062; x=1745535862;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWYtfNnXs+JX3LJ+csjR90IU9qz0LhJ+UWyysJK6Yms=;
        b=sxheRyHqA3P5p2qWAuKV5XT1YL2BfAEP4DfEn7LbZQ7pGvVyMFBuHFtyTYcOCjM+nJ
         mtpP089vgVcV4qigYNaRvBot7oZYpwvGQQYFQ9KwwcsCFtdIqqEaUiugq47qSMwgtwVx
         EMbw/q9tCavCGDGzS/Gi6gYRbhmh4+RpRohUr41fJO75UwM4hdLt/2KufAuU7GxP1bKA
         lMu0QooNFoYm0y8ztytlMhgoJbViIkWGdvZB9i9Hzt+9nGTPTXd53R6Sft32cuN4abIu
         bDXJU84WQvnkLZEetwOaX+UNJAR2g8WruIyV234qhGu80Z1oibloZY1i6CK4mjDKoFmu
         w2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXLA2h1qJGW6atorfLFlBOFiqbFLVC8K/7IIfzdJwY58XnemCkI0pPlwyqUrc0Ejl7oLxaNHbkjLpeTFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOZgnN3N8DSlhjMxOYuwFOD9Iz0vUNFQMwLdMnnfBFKw4N7s8
	bieIVGsbeS6Rb/oBx7iov6DNw1ovROeo/y5vD/sTqd34ofwYstsOusFY+7b68Vo=
X-Gm-Gg: ASbGncvH0iFGCXCYATyxWtUsme/O1JfyZx7PqiykBB82rfzkoDInAWBVfjrbuxXsyDt
	4j7VPMN9G32bbdt/7Z49espe7CL0ZMxtizLx3kN81aQaE+SMmLa+H8nZxJfju3UfaQFV+J2uhg1
	TVMdl/JyMtXP3BG9o7aH2aLOmSpS47kH7hYM3bYlp+Zp3C/w+1y3ORQkY5xsUjUWng5Mmz7Qiwq
	Bwc7WCPR2dJJY66fYTby7s9a5GCXhBROqXTwjGdZNO3y9Y34OEY7LPt1KueqPQGLl1+MWbkLhbW
	ZT8XPcij0q02Gc81QiTpBzSsmCYdRKqmGJusjeuoF1EHGVJUEGlbJJ/yvbeflR4Kqyo=
X-Google-Smtp-Source: AGHT+IGgjlV1nwuhUHZGGyPS/JCAjYmgdu+YsyfmbcSyyuu6FVkVOgvNv3loVYfehnCCQH5+mmaTLQ==
X-Received: by 2002:a17:902:d4ce:b0:21f:164d:93fe with SMTP id d9443c01a7336-22c53621ac3mr8430945ad.53.1744931062314;
        Thu, 17 Apr 2025 16:04:22 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed1301sm5486695ad.184.2025.04.17.16.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 16:04:21 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Apr 2025 16:04:07 -0700
Subject: [PATCH] tools/perf: Allow skipping documentation when installing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-allow_skipping_docs_perf-v1-1-e7fd719c4eda@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAOaIAWgC/x3MTQqAIBBA4avErBPK/qirRIjVWEOh4kAF0t2Tl
 t/ivQiMgZBhyCIEvIjJ2YQyz2DZtd1Q0JoMspBNUZed0OfpbsUHeU92U6tbWHkMRhgtq3mu26b
 XCCn3AQ09/3qc3vcDoilblmoAAAA=
X-Change-ID: 20250417-allow_skipping_docs_perf-fa23bb4659ae
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=uN+5WpDdbkQDQBwue05xSgy4ppNVh7/N3Q24oRcGl5I=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwZjx/PPRiz9Tzmlxa//TsvZwsz5O2x64c2SnvlLwrZx3
 70Q/up+RykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABPZNYPhn9oB21MJwvXpsarf
 XVe8l4psEmJN/qTGLv4oVF/ko/HaDEaGLZxB0acT4yUE8mwu1L2p3Hpu2lbfTWx7mpbl8WzLPNr
 JBQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

If an enviornment variable NO_DOCS is set to 1, documentation will be
skipped when installing perf.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/Documentation/Makefile b/tools/perf/Documentation/Makefile
index 4407b106d9772b32c5c4feed5a39442678679d62..d6ee0e06f0be19880d10e5a6faa8d0319d09c55f 100644
--- a/tools/perf/Documentation/Makefile
+++ b/tools/perf/Documentation/Makefile
@@ -203,6 +203,8 @@ install-man: check-man-tools man do-install-man
 
 ifdef missing_tools
   DO_INSTALL_MAN = $(warning Please install $(missing_tools) to have the man pages installed)
+else ifeq ($(NO_DOCS),1)
+  DO_INSTALL_MAN = $(warning man pages will not be installed because NO_DOCS is defined)
 else
   DO_INSTALL_MAN = do-install-man
 endif

---
base-commit: 1741189d843a1d5ef38538bc52a3760e2e46cb2e
change-id: 20250417-allow_skipping_docs_perf-fa23bb4659ae
-- 
- Charlie

