Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960553234
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542069; cv=none; b=FljQ5z8wKuomyHjFVmG8gmzPCpIN37L5Ry4AVElB0UH9gjOhfX8mmQm+xrhjfxfuIsAvLTIxFtw6MnP45EqaVG0+R/7ZFKen5m3ed1X6B9RcJh0tO0ulD5yPQ9WQHJMZxY5mmKU530zJK4XjIFIz1rEesem22BBgQZEMlD7J5ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542069; c=relaxed/simple;
	bh=RnjIbCRu2nWlEIGKD9y2ijPFfV6PwyLLEqwp7hUGbBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjD3ALwvId1diGy3fDakuf51VePpwccKElcWi9+5PaEXGwvJLtXzogefAbo3vSMwZt3FSsgQ7aIYwK6+dxuSVls9y33YTd0GoJctKqP+zRA97/lBng2v39hqjn+YL0QpJ3hQS0CWi26Z+YRV1SiOxyEVB+kGN0zd6tenoLgm2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCD86VYZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCD86VYZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22622ddcc35so45401895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743542066; x=1744146866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYWBw1euqbarJH0vB7yPr/F6oDTaaCQpg3I3/+wp5B0=;
        b=eCD86VYZ1qxgb36BQAETAJ8A4P/6RjSzTTD3anNiyqrNr3BSzqdl1P8jI9AGdj+ABw
         vB65w5/3FBCs1ziiYE6VsSnz8LsRTDe8okfaSEIwwI7WUV0trwm0ZNowWQu2Hwi+/dks
         /u9ktgy02ISF1CWwcQ7rgN/IewjaVDRBLfDlY9/AsXyGCmpaeR6ojjlYv1OwHagmcH3s
         AJfrTEwbFj6DUzfaUadJ2H+8AWdH6qMIn102Du4AsGJ2vgeJcBtVSBoSAlBI9NgFitqJ
         aAXoDkUUWpO18qHAYoPGFaJ6CYgsFkqzy/A7Ynln6UYKJx9HJh8OPDFCuXF6GWwjXPWZ
         kSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743542066; x=1744146866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYWBw1euqbarJH0vB7yPr/F6oDTaaCQpg3I3/+wp5B0=;
        b=qIjLLNJesfZ4ST50Q7z7cTl8+0UIp2mhC1sztW4UrgqiFSGoiu1vm+kcX/4Wn9+0WT
         eR4yp27QlKnB/VUByTQ4X5dmxyUMKSQMkS2pTK+U6TlO9IOdpN2LbkhX30foh71NZA3Q
         DkC3k6qalEJlL/0eGn7a0rFZxASXUwzLwlCsiYMb+zjfaSXkcv+y+of40SjjJ1NxAF1P
         gq31Lnj9EszcFKOzMn6A7KzSpnKAQbOrSsXJd9pdxe4aiNUU/s7cmn0zQly40y9jD5cB
         C9pabY5X1TPx9erj72+u3cgo16FZtirfdtO1K5ld+yebKrJ3EtZmXKxVlfqNPcwTp+Kb
         EvMA==
X-Gm-Message-State: AOJu0Yz1+zpKxXmPZhX11R9Rbu/hU6h8GKSTBHnByBSCoI+wmIXyNEkS
	94V+TKWAKoo0GgyeY64Qwodiln+9y//WDPgHiNDLtHgY3X4xfBe2
X-Gm-Gg: ASbGnctBHdYTAJZ2lFIl0i8eUQyAXnC4EfhFVvN/Zf8F/kVewa5aWAfcaD7oSt/OM9E
	6YnlSzIhyFxd+IOdtDVTdCfCTUM61H9nZr/rbs7hAG3lohf5KKt3lIsroQVdRDTZW9/sTgZWRr5
	SfAczBJi1MkUss13wTbIjOq2tBAu9IiyIpBa89wtfuM6pM29+pdeMAtE+Zzb9ZSg1O5hTck93Vu
	Z7Xq66KXt9lqQifb8QvLtEGlZGmT1VWQmOT4bE+tN76UuurjYay9tG+06cSKvZXgcr9j4jZqhon
	lZRc0XCInfdeInSN4hLDqTnoMkZu5a5zdcpu5bdlwo6W5Ho6geyr29xpEqTt
X-Google-Smtp-Source: AGHT+IHSUqz9SuZ5LB0vVdia7ituhvCxFcjwJULEs0oo6kDwiqXkiKDrgBGIVF+0AizUAOUZMkJyEg==
X-Received: by 2002:a17:902:d54f:b0:224:24d3:6103 with SMTP id d9443c01a7336-2292f9e630bmr285814545ad.35.1743542066378;
        Tue, 01 Apr 2025 14:14:26 -0700 (PDT)
Received: from gnu-tgl-3.localdomain ([172.59.161.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf165sm93788635ad.158.2025.04.01.14.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:14:26 -0700 (PDT)
Received: from gnu-tgl-3.. (localhost [IPv6:::1])
	by gnu-tgl-3.localdomain (Postfix) with ESMTP id B2921C0275;
	Tue, 01 Apr 2025 14:14:24 -0700 (PDT)
From: "H.J. Lu" <hjl.tools@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: sergio.collado@gmail.com,
	mario.limonciello@amd.com
Subject: [PATCH] Remove "#define unlikely(cond) (cond)"
Date: Tue,  1 Apr 2025 14:14:24 -0700
Message-ID: <20250401211424.3244463-1-hjl.tools@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit c104c16073b7fdb3e4eae18f66f4009f6b073d6f
Author: Sergio González Collado <sergio.collado@gmail.com>
Date:   Sun Mar 2 23:15:18 2025 +0100

    Kunit to check the longest symbol length

included <linux/kallsyms.h> which triggered

arch/x86/tools/insn_decoder_test.c:15:9: warning: "unlikely" redefined
   15 | #define unlikely(cond) (cond)
      |         ^~~~~~~~
In file included from ./tools/include/linux/build_bug.h:5,
                 from ./tools/include/linux/kernel.h:8,
                 from ./tools/include/linux/kallsyms.h:5,
                 from arch/x86/tools/insn_decoder_test.c:13:
./tools/include/linux/compiler.h:128:10: note: this is the location of the previous definition
  128 | # define unlikely(x)            __builtin_expect(!!(x), 0)

Remove "#define unlikely(cond) (cond)" to silence the compiler warning.

Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 arch/x86/tools/insn_decoder_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
index 6c2986d2ad11..08cd913cbd4e 100644
--- a/arch/x86/tools/insn_decoder_test.c
+++ b/arch/x86/tools/insn_decoder_test.c
@@ -12,8 +12,6 @@
 #include <stdarg.h>
 #include <linux/kallsyms.h>
 
-#define unlikely(cond) (cond)
-
 #include <asm/insn.h>
 #include <inat.c>
 #include <insn.c>
-- 
2.49.0

