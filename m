Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7D21A45D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624653; cv=none; b=Be4VOU9fHrAM+Y81Haqboe/QM3y7ydNZctmLaowFLwTCaGwsj/db2te67kr68dzSnF7Z/2qzr+HnD6oeZQGopLWMf2S5LCh7/vWccrYSQH1Iqwhd9XjqxuKDrKVRaZJh/dNTOVtyFwFQ6+/9uz5fn2RO2rSZxqu6ANgVwsj2j0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624653; c=relaxed/simple;
	bh=GFJNcdBk5bf2L0Vt3Vbfq5iymsDl4I5onmf7LWk6zC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAJT5vfTgs3E2zx2q7iiMUW5Mmbk4JEpoGVjCLhgbSQU7TcY9mrFIzg2f0E5t98Pvi42r+xKpzqoC1p1W5ya/RzT460IpH9j2swW5sj0ucsPTOH6wWvf33a3mAvTw8u8fI8WCAqER2y+SqZSN759bbxwwh4kMGR17fvoFrbe7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1ETEKHI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1ETEKHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746624650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
	b=B1ETEKHI6OqEEbIDKg/EcDffPZFrIB3oK8Z1jAVo1Kbqej2gIg5MmK4STW1wF3aE5+PH+S
	EBnCQKCjoTL/7zBSBl2Rgu/xaiFuFF1/UIj8PJKjBdDwfElurkr4M7toPIP6UYGtsuZX2z
	9MvxsyNfDUmxS6qWmPb3BljV6biNU6g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-6ZI5wJwsOP6ISDFGwgDxiw-1; Wed, 07 May 2025 09:30:48 -0400
X-MC-Unique: 6ZI5wJwsOP6ISDFGwgDxiw-1
X-Mimecast-MFC-AGG-ID: 6ZI5wJwsOP6ISDFGwgDxiw_1746624647
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so37684995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624647; x=1747229447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
        b=HyF349/tGr+Gigg+Jd9ZCmqWJNKQqfkZaocRfim8L3eCFsQFzuQQvCNQwk/xCM8GIU
         XAcvIIKVd8DdDg7aCpGrlxr62eoh0KqW0JzRy4aQU4dIeTc9+GFCKQjOU9SLGa1y5SHz
         hK5IV3q5tYcIkT1wtbDef8UUvOvJSS0ze8KA8JkJJXgqz4STzSfVxWf0P7Bh73Lu4yPw
         fVsGnHtDrx8I5hNmk1f+YL1tFlPfqWEypd8KA4TrmrXH2nKV2EFcaTi8vyen2RNT6JPH
         dGrTC24uXkEeXh/sDeAWcZuSNzz1RepwUkzQ6en9MeENm/Otd9tHXtY23xhdnI9U+HsX
         Usrg==
X-Forwarded-Encrypted: i=1; AJvYcCWPGvvTAjWYCjaIVDglInt7neFRcf/5719UuOjpLH4aSA0tWJ04uW1nYgMJ3NcfcS2b0zx+eHnhhDarUso=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAPbA/q1mMprauyp7ckFd2XiRp4be3pVkdoRIyA2SgAT41fExA
	Yxxk61VpzNH8dsxanv3vhBrM/V7mfIrcsyHBG/yP4LDDJwnlQ+3RgnpY0oEyINOQNYWNdretQPX
	2/7N5k9y/BHC2a5F/84g+ZUmPVByMQb1inKUaYLlkYphtVc+I9j7Bd6qWyOcuNg==
X-Gm-Gg: ASbGncvyGw/Rq5VtiuLDAU/WxG7T9aOpQvrPDEx/+LHIZauFm7TgDKjra/0USXs2pbb
	8JsowR8zXRpYYN2TaCnxLOzsKZyoNPcLRyKDcR9EXqq5fP6CyypdBjjNMEneifvPvlX3I9lzNB3
	iTXMWcjSe9uUFfieWQO8yuCUusp6SGEwOnrpD4W13JKqLoTmEoSkE9MGCiokcLWC9dwZ6yWhTOF
	TIp7sxpN2Z+/ukUINOBq5o2FKFUZ85ozVAlAB3gZ/PYTh8kqvfuA4w6AEhwpqHViyD9V9xk1mHM
	ATTtllFxfJXHYeyHQbn/NR2GRv2wlnP/E5eeCKezCs6KO0FNTGdzVnZbbg==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433703f8f.21.1746624647373;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+xkN4CteQe3W7JG964awZX/kgvVxlMBDW+iUZi+kxW1uqeTmzxYgAsX7awL9bnRSjkrOf1A==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433678f8f.21.1746624647048;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm17111024f8f.38.2025.05.07.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:30:46 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Makefile.kcov: apply needed compiler option unconditionally in CFLAGS_KCOV
Date: Wed,  7 May 2025 15:30:43 +0200
Message-ID: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes the
config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
compiler option '-fsanitize-coverage=trace-pc' by now.

The commit however misses the important use of this config option in
Makefile.kcov to add '-fsanitize-coverage=trace-pc' to CFLAGS_KCOV.
Include the compiler option '-fsanitize-coverage=trace-pc' unconditionally
to CFLAGS_KCOV, as all compilers provide that option now.

Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 scripts/Makefile.kcov | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67de7942b3e7..01616472f43e 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
+kcov-flags-y					+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 
 export CFLAGS_KCOV := $(kcov-flags-y)
-- 
2.49.0

