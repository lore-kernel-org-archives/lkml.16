Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5A51D0E2B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338997; cv=none; b=o+SGwVLzkAUzWDQceh+VjlwLTxD87yL+3lcS7IFYvSy1byi3BoX1wvqbl3mPylVtXGNZ+NlXYsl7iuP79/pzcHnjkq9yoHiOCEegiG5mLuTopJ2zinL0WxvIJRlSNQXW22FLvcqNYfzKE4MhRL0246YSxFAKG5Z/uSfYNX6O9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338997; c=relaxed/simple;
	bh=qhCrUkDqu+tuJIZICP6qRSOgEasfDCrNHQhsdKnSHzQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eU7X1TgnKqCvfRkuTZA62mAz2bT5e2hHgUGfs208S7ESkh5FjKGFZyzvyZwlQ4YUJNvr+8JlQ9HTMye+cOyqgS/lX2+dBjyCDNbj1GhXu9MVgOBu2mamGM9nH6fITbKXxGlN5UqGwP/IP+kTQNgIL/TGjLoxcUz0b6R80W7AZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a03197b2so15116715e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738338994; x=1738943794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx/xRUX7FtEOkTeqBTekDHvL5rbcYjwkX4K5fk2Dbwo=;
        b=bNhvBaTTMgvVU7ejGOMA8h+GhXYEFDa4+dNibSVukuNpOFVe1CBemY8YNT2ImT+jwq
         XQroXpvg+TNPQyqm7hXk57SK3UPs7cG80TVWOXpzEefxhuAhk81wOR66HzMR4Rg498a7
         9iyfmwkKRnW4EfvXAr+cCcXIRoPfFkO/JqPH78YlCecQ6nnWZTWSDhfdyfrfBGmT3Wrt
         n5Ve/vR9aWcY63AxJLWS0cJHNMxM2/7NVT70mdLxePwal1esQT0XyHzrl3UEYLqTYMBq
         GBJe9nM/yg/gTEGmmb25Y6Nq0mUIRPQILOkWesrFMdH6MYe6ux/Fi3RaadBKD6NOXl6X
         G6fw==
X-Forwarded-Encrypted: i=1; AJvYcCV+kycuk1DPP6nKbD4M+Z/ZNHBYcV5SjKQwIurT0AeVjHMrm+e3nFG0OiEJdqBIexxxXb97W1dlED3L50A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsE76DAJNKDvqUy8S122g7U9e/5lHZY71wyLvb1eKArfbVXPjJ
	TnHxU3kqmJdLIkPKqyEwaj+8QpoU9jaix5VS7WbeJMxIIGvrN/c3
X-Gm-Gg: ASbGncusbs2Uo4dlq9l5rDPSghdso/YtWlPv8YDjxzA/aDPQji7i0ihTet35/OLAvxl
	jXwxeTv9Bcm4r1r7aOcM6FANyW9VpZh+K1MhIVDVn7uKeOECoMSbr2iZ7rfLsoZxp+wkFLp8jpA
	KJLAO+m9v+AJXN/YF/FkB1zHbuPhHEX2X+iNOsK8uFPV/H9XMzvChG433wen+trflyzMXmUYsyZ
	85pP1r3DPH/LewWorYYfDPdssKqp3jsUHE/s/HTRP9pGnCiZrzBvvSHDADiugZbPV333py/oFeW
	C9Zrf1yPXI3Sd78fjTJxl6MrdYIYWg==
X-Google-Smtp-Source: AGHT+IHCGPC1E5MTxqsL+RTkF+xGS32bN7kIrNxD8Sjj4Bmt3XzYrjQ647+b2/mACplxUitOrrirdQ==
X-Received: by 2002:a05:600c:524a:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-438dc410c08mr96537465e9.21.1738338993571;
        Fri, 31 Jan 2025 07:56:33 -0800 (PST)
Received: from costa-tp.bos2.lab ([2a00:a041:e280:5300:9068:704e:a31a:c135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f73asm95153505e9.24.2025.01.31.07.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:56:33 -0800 (PST)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Costa Shulyupin <costa.shul@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] scripts/tags.sh: tag SYM_*START*() assembler symbols
Date: Fri, 31 Jan 2025 17:54:30 +0200
Message-ID: <20250131155439.2025038-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `startup_64` symbol and many other assembler symbols are not tagged.

Add a generic rule to tag assembler symbols defined with macros like
SYM_*START*(symbol).

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 scripts/tags.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 45eaf35f5bff8..98680e9cd7be3 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -146,6 +146,7 @@ dogtags()
 #   a ^[^#] is prepended by setup_regex unless an anchor is already present
 regex_asm=(
 	'/^\(ENTRY\|_GLOBAL\)([[:space:]]*\([[:alnum:]_\\]*\)).*/\2/'
+	'/^SYM_[[:alnum:]_]*START[[:alnum:]_]*([[:space:]]*\([[:alnum:]_\\]*\)).*/\1/'
 )
 regex_c=(
 	'/^SYSCALL_DEFINE[0-9]([[:space:]]*\([[:alnum:]_]*\).*/sys_\1/'
-- 
2.47.0

