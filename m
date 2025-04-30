Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDA482899;
	Wed, 30 Apr 2025 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023461; cv=none; b=sgLTHUVs3+7FJGDcrVAfzs1ZkWdMYRs6J6beap+EoqkvUo8AJrSM82EiYYb3wwsVyGhZw1H4/BVNgSnIgl3Mw6eKGhd/dMMjQAKJ0Bdd8ltVUtPgXG9buk2NLq/e+rrjClL+h3Jzv3ZRd7urN3lKZWJe+iZjlm7IW1iQ4JWcJ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023461; c=relaxed/simple;
	bh=5efKiyPEk+sdLj4zVkA91mL6EwpLaUOFiB1U2WZ/vuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ys9aB5m1mbclQdAVynWllWfpcZcRCfyTl+RNrgO9KU5oFuaQSPFf/5XAK7/+a8ykmDWEWMRM8WkVnfFHT5qk4CPc9f6dmbtQTt8UVTUUHg4kBWSoCl40qOyQAmwD/fBCrllySjMjSMSvEKORGbDMF0f7GPuNj+ZzV6zg4ryUTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdmiGM1w; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdmiGM1w"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso5745356f8f.2;
        Wed, 30 Apr 2025 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746023458; x=1746628258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0w8UscCO5MybUIE9ef0MnKYg2PNsk1FHLto9LqecTu4=;
        b=OdmiGM1wn5D1sH2wSyymt89dzyVY9hZbqe5aFEIjeLLKIUOgg/6Op+uQhLSGBPZNZM
         fn8IFpCqIG45QYZ+KHZmd/BmfkWt+tmuP3LdBwnRHwy2E2QnZJv3DMiBsR3AY01fqNaY
         e1KuDgNUKxsIYDO6XORSaOB17PPbmhaTietgtCLNBYe1w9mSOUuPOKFSzCuhZeOB8dmu
         qedmsWFA5oFjZst1O29Nv2JnP6dA4fAFTW1wYV1OH9/tCfn1uzivAhnaSvkkmkeRWaZO
         nv1PVzaoz9DS6xQLqogAZmtAkhHACDGcWu9c0v6LHeZX34uSIqQr/hDk83UOkykA6YWQ
         sbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746023458; x=1746628258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0w8UscCO5MybUIE9ef0MnKYg2PNsk1FHLto9LqecTu4=;
        b=d6wfFYpxhKY7weGBAgJdqldlqKXh26mCAF9qjixvu+Qk/Aie0m6JyEFUpJo4q3GuyX
         rQKi0kiUVuVBfaCYrAyHFJUmk4B8RGx0nhIXBRDMn8wVO9DMYdmUHpbF2eIXGgFzXG8e
         1d2nmQow9X7P0gv6C8vhL+t7hoFsOW8SC74Tgm1va2b7xOz3izv0AdhXGoeGqx6Vm2mf
         O3G5TPAppKvNK3pXHDn6LDwaN/Oxe4wFuGgbtQORnLV8ERElBlP9kGJ+AhOSxLh9vTfY
         BX6dafs3l+2yOnLaYYVG6bywq0mjcDcuHTd3c94HOf5xzdXbcf2RrIAzU5kXdrskvTzL
         9BOA==
X-Forwarded-Encrypted: i=1; AJvYcCXApFBQC9ZZjeHJhVPbwLhVmb7jScJCiNAp8KtR3FSm1f7rMqL5Pc4ZxbYZSrnrtk/A0wh1lIUY1KUzS4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQqTKZhjCj2FOxdDymp5Llgm7QqwTLlVxDb0zcL63b7Akahc4
	e4mrYsINbzy/2W85GzlXpfwLIT+wTUEflh9LXt7jsAB/pqMNbTOTvnT5xzW1QHg=
X-Gm-Gg: ASbGncuKvyZ/j7mm8PY7BfwU2v7v5pS1U+6z2PnHV9DZINZkbk6znSyrHB28BC87Rce
	4BuMN/2BetnP1RQt8VI9ZSWRrF45VLrUoCLY2pMCGzOov+IG1dbijhLj5bm7s1E1KXGMHzoiq5o
	RglaGhqLITHV2jvI4HDveUSB8Aebr/PQOnRbVjeR7VtK2mvGVcQt/97wu0l9cbNPADx4Kmp5DWy
	28LBYPkPx99u1cZld33I4OLsBZrT/ma07qL6AuTxznSnpc6szgUZbxF58Sky2LbR7efm0Lvm05S
	lm1O0tOuJnmgnlvWGtBSIYItc0wSuK24sW6AG4PT
X-Google-Smtp-Source: AGHT+IEWhirat0n5nsX8ATDTnk9qmPez0mg3j9XAEmMycu763yzHSI70X3OF2jBJI0Rz5rlmIiFXaA==
X-Received: by 2002:a05:6000:4014:b0:3a0:7a5d:96f8 with SMTP id ffacd0b85a97d-3a08f7a2755mr2747694f8f.31.1746023457400;
        Wed, 30 Apr 2025 07:30:57 -0700 (PDT)
Received: from sashok63.. ([46.19.86.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c9cdsm17064227f8f.87.2025.04.30.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:30:57 -0700 (PDT)
From: Alexander Shatalin <sashatalin03@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Shatalin <sashatalin03@gmail.com>
Subject: [PATCH] docs: fix typo in firmware-related section
Date: Wed, 30 Apr 2025 14:27:26 +0000
Message-Id: <20250430142726.3276-1-sashatalin03@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a minor grammar issue by changing 'firmwares' to 'firmware' in the
Documentation/index.rst file.

Signed-off-by: Alexander Shatalin <sashatalin03@gmail.com>
---
 Documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index f9f525f4c0dd..c0cf79a87c3a 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -84,7 +84,7 @@ which are kept separately from the kernel's own documentation.
 Firmware-related documentation
 ==============================
 The following holds information on the kernel's expectations regarding the
-platform firmwares.
+platform firmware.
 
 .. toctree::
    :maxdepth: 1
-- 
2.34.1

