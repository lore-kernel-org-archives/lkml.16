Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6228279322
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226086; cv=none; b=oRKcjb/ss8txoxJ+9q+lrPTan4gYbPm1DHJnnbZ+L6rs6jAfFB6HgBAPMgLXwLM5i0l/ajpSep1APQArjroS/ml7J0YclXDpOHMj5AjQ/Qu1toT7Nq21kFj97pNcAv11B0mgaQctm1dWOQDgNYkwj0TS0hA8heAZtpDF4yzg6io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226086; c=relaxed/simple;
	bh=ObEbdYoZwh4e4oD/nKauzI9XH6EntmyOLUPtsuvDmio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2BFKUOyBTceiCLM8H0AEgGl3oW8jgoYX2ME4Yfr33cVzJjPeeKU7553a2TXU2me8nSFL2/Z8yz+BRpmPtxwOS9EPDswJAEFJ36r3ZXjHLCUVJTIRi9iNmdmpsJqetB3+zcf5T/9usns9uDlUIVtHy6Ao4cgnjpa5/ch4nbc70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwyquiVZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwyquiVZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22580c9ee0aso63645ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744226084; x=1744830884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsN4usZK0A7ueS0icyhQ0S0ROuOzv2PqXDsZm30Wf1w=;
        b=MwyquiVZqoMszR+nCRADI4UhuArixYsr8HnpOr3gctWsLgfYov8NvAy570zDUP5nEV
         6JHHenjEZtZm4u5uDCeBXk+oakU2yAz/RSRsXMvA9wmtt+pzmxdoAQisiQB7DcE8k9Vo
         mstD4IyBCBDjG2xG3M5f/ObHy4UCMh4/C9LM8Z8dT9cFnlEbWJmKaBjM6G/guBYqRn0k
         QJD51oIEnUYPq/WIVHpHrUpSUXnS31EmKksoLu0BH2nlJkiZ2dL8gV9uxl6IPC6HbeU3
         ajQF16f/2gUgb7ss6Hl9Pa6o7CI+np0+IN1yo/uhtdk1gKVprSVBGA1ionknN6DyJdOp
         tiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226084; x=1744830884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsN4usZK0A7ueS0icyhQ0S0ROuOzv2PqXDsZm30Wf1w=;
        b=ZYwdcuNBR0D4F2r/7LmxuR60v+uBNWSHkUUigxFEKWfp4/i44KEk/GIbAjwMh4Lg4t
         4Q9iieAixzq/zSFmFicR9Ud956FUL8mAxE6OeE1y4uPIU2/0FVKemXgj6KEaLWLlOfo2
         veSrPMo/dr3indbm8qek2sugnC55rM1oM3NmajV2pkAoSwMNvCzt4vX8d7XSn1/j/gYp
         uvJu+xo1Po35gTlvihx0Ty55EuV105OAsVF21P7+P5sabA92eVY4QPXRuPgdwQu57NDB
         rJHpoFa3FrKX6hWcLni7hP4L18JlxLDxwlhwZ5IZFDkgY9e+csO44P/rBCGD0ICmVxrD
         Xebg==
X-Gm-Message-State: AOJu0YzQCdWuiPul94h9E5WNG4TOPeQRA6C9imloBTj0zIMVApkz87+1
	mnRBQdxX05MgK6P5If0hhDmpg7tlT+NdkZGGLpYyZDQ6sSkSx9iB
X-Gm-Gg: ASbGncttjEFUpZSpbEGRO8+PBSvPUhuRzwPW1QMemXsj4BRabr2dHVZJM0C4a40tYCR
	O4GDquOJmeX3+BPvGLVDOnIZ2oY08dbbCXsQQkRvD0j+Ll4kTiM/slHygW0DZThLK6XRodBYlkM
	ijM3Ck6JzC1oCo3w+mC/M6qSJVJUGlG54zammcNg10UEMcmFD01QmGx6Isl5gVxHz5EteC+/7ww
	8k9Ium57u8T4FLHozeLyf9PR7CgqLMvp4G8kSRA8Uch0Tl7LU5jSwmMx7z5sEhZeAUOw1cwJeO0
	MQ9gYp0e7B0zUG32njHg9CdHxZAN1TqdRLMvs96Qt9+a5a7oBg==
X-Google-Smtp-Source: AGHT+IFns0pp73xtBvR0QaS5uQEgm848oqDPe033njIN1zmw5oHVs52wvkKz8a9wxIyS/J2CPP84wQ==
X-Received: by 2002:a17:902:e752:b0:226:30f6:1639 with SMTP id d9443c01a7336-22b42c2f2damr618145ad.51.1744226083964;
        Wed, 09 Apr 2025 12:14:43 -0700 (PDT)
Received: from jemmy.. ([223.167.142.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b0b9sm1733064b3a.36.2025.04.09.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:14:43 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Jemmy Wong <Jemmywong512@gmail.com>
Subject: [PATCH v2] tools/nolibc/types.h: fix mismatched parenthesis in minor()
Date: Thu, 10 Apr 2025 03:14:36 +0800
Message-ID: <20250409191436.75658-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an imbalance where opening parentheses exceed closing ones.

Signed-off-by: Jemmy Wong <Jemmywong512@gmail.com>
---
 tools/include/nolibc/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index b26a5d0c417c..32d0929c633b 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -201,7 +201,7 @@ struct stat {
 /* WARNING, it only deals with the 4096 first majors and 256 first minors */
 #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
 #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
-#define minor(dev) ((unsigned int)(((dev) & 0xff))
+#define minor(dev) ((unsigned int)((dev) & 0xff))
 
 #ifndef offsetof
 #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)
-- 
2.43.0

