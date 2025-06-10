Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86434286D6E;
	Tue, 10 Jun 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547321; cv=none; b=iVKj25FJz2HstKpwnwZsPgufW9ebQrdr+dKhndQxq7Sc/tJoQ//sTxIRzVgOTG2QrTMidqE/r0LzeAJitmTYMI0U7sEDP3icTHY0T8yI8k64mWIf3FN/P78loYCE/D54KdB6CwwNd0uFUyl/qoJaPlOERW9Uta8eWHMbk34DDD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547321; c=relaxed/simple;
	bh=y1mzetlCTQRwwVQd0XCZePhA+fRudsnAmGM3LW4Q1OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZF9taqHiEQPLtybl5nu7vjmLtXC6iticnL3Kaf7qbnc8XQK3Am2C1Gf/JBMekwTosctZ1sFS2GCysAONvVGW5GykPS1bTbBQ+CW7rtAK3vAW8cZ18p41UBMXX4zBl58iLztWZrwjgXabMek9fzttvubyPnS71ET68dNiLj6bPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft+oExzz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft+oExzz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235f9e87f78so47384945ad.2;
        Tue, 10 Jun 2025 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749547319; x=1750152119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKdiPD8LPOSWcxJtXxV50FsYXO8RX5/fbpx4WTe18gg=;
        b=Ft+oExzzrK9Dlw2m7oy9Eikf0+BNBRdl0Gkh6ZyNtH2yuEK6WQR2HY9lTYQYhfbnq7
         jQq9tpi/kcDdHDXnnxRSkkeHYwAoDGyOWfi4+eoNrSYvmxDOiHBpmm68qtbm4cHUsz9g
         qqb/+M2Omzafc6ICUL2e4VlqIiIpsLO0OhRq9pfvDBEvRLGBWv8CTOO+9nmxj8pqDV6r
         bRduedbXJs/Mf5Z2FZKKy6Rbe1gBCww3KC81zwDhHYF33KYmrTiokzuCNqt8AcADtGjX
         4/muU+q8bQRAn/QJb6Vxdb2bayrtP9Zx0I/rP7LffmEXsROpxBH951L1Ib7yo6Rmd10h
         VFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547319; x=1750152119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKdiPD8LPOSWcxJtXxV50FsYXO8RX5/fbpx4WTe18gg=;
        b=pp6FHMqZgcA+wEgqRkvCHFJ5fmqnhcvEf0l46Xar4Aze+UJthXP/Yn3pXBjVp7nHVp
         3owotfYP6VhqEaw35dzAcya9M5/AjMIKHDdW0CReTDpDRvPVAu77UKltal4AG3bxx1Mg
         USh55FTWQwXcu/m2UiGdw2rvnYodjsLu0MrvMIApFqdd6CKm3iQPJuGDPkw7qJPbnGsM
         qHG1mX2EnEzO+cDc8xE5R/5mbSb6iKayZoTl2p/yJhqST/U27Y7sqI9k/qJjSpa1Yn28
         Dx17D5qf5hXodS17ND+g0pieuZuiT2iTE1TOjkr94zxZ99Gg8UjDwSvniXcU5Psh8TI6
         dNyA==
X-Forwarded-Encrypted: i=1; AJvYcCVlUerWVmq65zrJSFHJ+jJIVnr+CG3T5EjKEx9yvBOV2M+t7CjTazU62J1xUOIMaQY6jdtKvU1P6nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmKBdv2bQ3iccTpAaNnd6KhlCP428mMwymYYmEnvlNzSEm1sV
	7zNP3QXdbbBBtQfkwM8R/P9RZT9xFKDc64rMmB9By9erAJkygDAShpHy
X-Gm-Gg: ASbGnctmcXuwC8EynuLi5n83JbxHA9VjF19VPUyGjb5fBWihaiBDWKhFlyQndPFdvJs
	Mz7KtcXNp1beDFn7hSn2o8H7rUtIcMF4Vidu3URxf+JZ2U4YGkAsggDD1UIqPQL3Cxies4jGeI6
	+RzWFWxUUWmCmhGuCykT5pMahrkA9a1fv4eNpikJ38Wi5a3bval4y3jUe1kIqBAJuG+4jShKYS7
	/ZCrwxJJ4XBOHxtSxXKvKLskT7Tzr7ytddMW2DPWCCHhQ7Q3ctzqKlzSAALATrHGIqOYqXLWxiw
	zVMcj1gQHAt/eCoL4WxrJLoGNjdjL3Hr5asX1LL3+fLxEB91YRtTRYofb2uNWH9RjGN6hgri
X-Google-Smtp-Source: AGHT+IF8W/u2pc9dXw02ODQ85GE5l7TzGkPD+fTzj71XXSkR/6My/iTxaFj+tl0NDcLeascIkNg8Ww==
X-Received: by 2002:a17:902:ec87:b0:235:2403:77b6 with SMTP id d9443c01a7336-23601d702afmr223840085ad.37.1749547318680;
        Tue, 10 Jun 2025 02:21:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcd1fsm66749495ad.118.2025.06.10.02.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:21:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8A39F4209E8C; Tue, 10 Jun 2025 16:21:55 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Cc: Feng Tang <feng.tang@intel.com>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] mm: slub: Wrap krealloc() __GFP_ZERO semantics diagram in literal code block
Date: Tue, 10 Jun 2025 16:21:53 +0700
Message-ID: <20250610092153.55093-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=bagasdotme@gmail.com; h=from:subject; bh=y1mzetlCTQRwwVQd0XCZePhA+fRudsnAmGM3LW4Q1OI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnuP55sm3t/otz94PsBV6S4ysSEFrmy9s2QWvNjgtiW1 Du7OGT8O0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARu7+MDK8/KgqIufmUfUxU YdvTM6lXs5fvrcSXWf9+m7bend20fBPD//xJUzs/t7Dwej49vmj3v4P6NybJte8+4fVxyZRX8T2 vn7ABAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs warnings:

Documentation/core-api/mm-api:40: ./mm/slub.c:4936: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/mm-api:40: ./mm/slub.c:4936: ERROR: Undefined substitution referenced: "--------". [docutils]

Fix the warning by wrapping krealloc() semantics diagram for __GFP_ZERO
in literal code block.

Fixes: 489a744e5fb1 ("mm: krealloc: clarify valid usage of __GFP_ZERO")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 mm/slub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 31e11ef256f90a..45a963e363d32b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -4930,12 +4930,12 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  * When slub_debug_orig_size() is off, krealloc() only knows about the bucket
  * size of an allocation (but not the exact size it was allocated with) and
  * hence implements the following semantics for shrinking and growing buffers
- * with __GFP_ZERO.
+ * with __GFP_ZERO::
  *
- *         new             bucket
- * 0       size             size
- * |--------|----------------|
- * |  keep  |      zero      |
+ *           new             bucket
+ *   0       size             size
+ *   |--------|----------------|
+ *   |  keep  |      zero      |
  *
  * Otherwise, the original allocation size 'orig_size' could be used to
  * precisely clear the requested size, and the new size will also be stored
-- 
An old man doll... just what I always wanted! - Clara

