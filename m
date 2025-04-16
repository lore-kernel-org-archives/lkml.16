Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055DC23F40D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803770; cv=none; b=YweA4RZuhVIFQVBywSgkGanZXKqebYTzlgeSErQAdRu3e89K0L5bubT3kHgLmLDFTvUYUe0rS/jdFo1fmZGrI5ITP0km6YJhm1Xryfx9Nyi0jvXq4kaUoc+Nri6s0xyIlZjH6GSSjWu4HIclotoyJOk9bYQW0revIaNCCIbzdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803770; c=relaxed/simple;
	bh=2LhwZRPX3le1pcDWgaebmjYcBMNO+zwSm1AT5T+GXjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZ0viv5Jhf50IY7jGe+tiFLuP23hCm+XwWCS1hUXHbAXsTiJNWQjIw/JIf6PjJ99VEhkx20H+RQxfhIEBRmsxymvK/CiBCSG9Raesl7eZ46YVR6/eZQ9yPLgRTudF/wpz+T9HsHpHaG48sbnWVoJHrKqBDTSw0B/mhmjsvZXxBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=M5ABpexV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="M5ABpexV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7399838db7fso631337b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1744803766; x=1745408566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ1kKIALmvRJch4ZVaRl0p94OzYXnQT7EpkhRUXULZI=;
        b=M5ABpexV0t3NWImzykatOHEKZylbdyBfhHScB01FzNgbOoyCWwBL9Xlz4D/DB8fSny
         EeupraSBJdxp4fCZyx6zBDYxwGjDyTXgfN0LXT1DyEEqRNJMCLIL3LqW5aanBDezUbiv
         IehoFfpmsE3k1j7RbEd/pv8hl5/EHs3N6N168=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803766; x=1745408566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ1kKIALmvRJch4ZVaRl0p94OzYXnQT7EpkhRUXULZI=;
        b=UJpx2y1Tmv2WIKrcbdTcP2DJpz9Y8GdgEkK3vbANjey6XyudgaYm/cwRX6+KBA5VBB
         zHInVFxp/RwMPCNnvwToS2G+kpLG4y8++da28NPnzFi1FADx3oqgzyeSMRXOaRvp/BoM
         OqoTUZYWdffx5vvtf0K/DE2XjRn7zi0XTJmf8RVCxzPt8J93sUa023fLqRxFRVrvo/+g
         S0hzpgz9TweILeAsey0sHPqgrZKBmp965HoQwO3BR7MziUHAHWwVPdqtsDO/rR2yMVjJ
         0rWLAblDk0pnI8C9tOQaZM6Fc49VBrHjthFYFcHoU2wrNSRyCG25iX9+H1PPopeX4kdz
         /vdg==
X-Gm-Message-State: AOJu0YyRrxMfqN3fr3RLde5g7PUTzudvKtr1VhwNtu3lLea5rTw7ksGf
	KV8rUWKdD8AhWnq5KwCSdoCgYjwuIHQe0DNBfNk/XDb2wcUXVwotiSwgUyX5eJo=
X-Gm-Gg: ASbGncutpwb/xO6sEtt+KKSllRURXy4Au0Lpf7G+KG+1jWeWzj86nGYv44hljGoYdAs
	GfipVKSbDkG0XHel9FmVDdqF2l44tK+GR2TBv6HN6u58SuWUX3X3rdGruIj+nQ4ReezR9gajXqu
	KJOzGtDGakU9j82A7MeXCpJJ8LJe80tOzpAyDKypmysy/Z133CxvNNSD6mXSspbpljRgoMMfimX
	kZQoIUm+Ze8l3QGEnGi7PZvNPEVCmneQkf+uWcUzHUd+iOXeAzPOo/Rl4sWPxvd4hxkTstCeYTr
	9tuXTZcngYvzvRoJeq65E0TuUksw3OvG5DKfftIYxQLXR0LCrNRMNEqZF4icX1EW
X-Google-Smtp-Source: AGHT+IESZmQwnLlyeDHw9qMDSKTCYjAyPNnhbiBsQon2uT22cUwcOGjEHw6IbbM4+RMjOBEJeKwL7A==
X-Received: by 2002:a05:6a00:3b8b:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73c26e42522mr1976219b3a.12.1744803765956;
        Wed, 16 Apr 2025 04:42:45 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:79a9:b58a:259c:e1fa])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd21e14e9sm10171722b3a.77.2025.04.16.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:42:45 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Enable dead code elimination
Date: Wed, 16 Apr 2025 20:42:40 +0900
Message-ID: <20250416114240.2929832-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the experimental dead code elimination config to be enabled.

For my 68000 nommu config this frees up a few hundred K of memory
so seems worth while.

Boot and build tested on nommu and mmu enabled configs.

Before:
Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)

After
Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index eb5bb6d36899..11835eb59d94 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -32,6 +32,7 @@ config M68K
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_UID16
 	select MMU_GATHER_NO_RANGE if MMU
-- 
2.47.2

